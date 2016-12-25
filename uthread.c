#include "types.h"
#include "user.h"
#include "uthread.h"
#include "x86.h"

//***************************************************************************************//

// implementation of random generation function
unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
 

//***************************************************************************************//

// array of utherad structs
struct uthread uthread_pool[MAX_THREADS];
// next pid to run
int next_tid;
// current running thread index
int c_uthread_index;
// current number of tickets
int current_ticket_num;
// choosen lottery thread
int choosen;

static void 
execute_thread(void (*start_func)(void *), void* arg) {
  printf(1, "+++RUN THREAD+++ \n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
  uthread_exit();
}

int
 uthread_init()
{
  printf(1, "** INIT USER LEVEL THREAD **\n");
  // set all threads state to FREE - init pool
  int i;
  for(i = 0; i < MAX_THREADS; ++i) {
    uthread_pool[i].state = FREE;
    uthread_pool[i].ntickets = NTICKET;
  }

  next_tid = 1;

  // initialize main thread
  c_uthread_index = 0;
  // set tid and stack to null
  uthread_pool[c_uthread_index].tid = 0;
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
    // case signal error
    return -1;
  }

  // execute the alarm syscall with UTHREAD_QUANTA
  alarm(UTHREAD_QUANTA);

  return 0;
}

int 
uthread_create(void (*func)(void *), void* arg)
{
  printf(1, "start thread creation \n");

  // local thread pool index
  int i;

  // disable thread switching
  alarm(0);

  printf(1, "uthread_create after alarm(0) \n");

  // search for free thread to load
  for(i = 0; i < MAX_THREADS; ++i) {
    if (uthread_pool[i].state == FREE) {
      goto load_t;
    }
  }

  // case no free threads available
  // enable thread switching
  alarm(UTHREAD_QUANTA);
  return -1;

load_t:
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
  // update next tid
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - sizeof(int)) ) = (int)arg;

  // set thread state to RUNNABLE, ready to run
  uthread_pool[i].state = RUNNABLE;

  // set esp and ebp to null, while thread is not in RUNNING state yet
  uthread_pool[i].esp = 0;
  uthread_pool[i].ebp = 0;
  

  // enable thread switching
  printf(1, "creation method: returning.. \n");
  alarm(UTHREAD_QUANTA);

  return uthread_pool[i].tid;
}

void 
uthread_exit(void)
{

  int i;

  // disable thread switching
  alarm(0);

  // deallocate thread memory
  if (uthread_pool[c_uthread_index].stack != 0) {
    free(uthread_pool[c_uthread_index].stack);
  }

  // deallocate thread from thread pool
  uthread_pool[c_uthread_index].state = FREE;

  // if any thread is waiting for current thread, get them back to RUNNABLE state
  for(i = 0; i < MAX_THREADS; ++i) {
    if (uthread_pool[i].state == SLEEP) {
      uthread_pool[i].state = RUNNABLE;
    }
  }

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
    if (uthread_pool[i].state != FREE) {
      // found thread that is eligible to run, yield
      uthread_yield();
    }
  }
  // no ready to run threads, exit
  exit();
}

void 
uthread_yield(void)
{
  // switch alarm(0) to cancel thread switching while yielding 
  alarm(0);

  // if current thread is running (most cases), the thread didn't finisht its job so turn his state to RUNNABLE
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
  asm("movl %%ebp, %0;" : "=r" (uthread_pool[c_uthread_index].ebp));

  // load the new thread

  // pick the next thread index
  c_uthread_index++;


  // ************** lottery scheduler mechanism ******************* //

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
      current_ticket_num += uthread_pool[j].ntickets;
  }

  // generate a random number between 0 and current_ticket_num
  randomTicket = rand() % current_ticket_num;

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
  printf(1,"randomTicket=%d\n", randomTicket);

  // set the choosen order thread to run
  choosen = randomTicket / NTICKET;

  // pick the index of choosen thread
  int chooseCount = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
    if(uthread_pool[j].state == RUNNABLE) {
      chooseCount++;
      if (choosen == chooseCount)
        break;
    }
  }

  // set current thread to the lottery chosen one
  c_uthread_index = j;

  // ****************************************************************** //

  // current switched thread is move to RUNNING mode, next to be execute
  uthread_pool[c_uthread_index].state = RUNNING;


  // if esp is null, thread is running its first time, so we have to load a functio to it 
  if(uthread_pool[c_uthread_index].esp == 0) {
    asm("movl %0, %%esp;" : : "r" (uthread_pool[c_uthread_index].stack + STACK_SIZE - 3*sizeof(int)));
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].stack + STACK_SIZE - 3*sizeof(int)));
    // jump to execute function to run the thread own function
    asm("jmp *%0;" : : "r" (execute_thread));
  } 
  else  {
    // restore thread stack
    asm("movl %0, %%esp;" : : "r" (uthread_pool[c_uthread_index].esp));
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].ebp));

    // reset alarm
    alarm(UTHREAD_QUANTA);
  }
}

int 
uthred_self(void)
{
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
}

int  
uthred_join(int tid)
{
  int i;

  // if tid is not declared yet or is a negative number, error occured, return
  if(tid >= next_tid || tid < 0) {
    return -1;
  }

loop:

  // disable thread switching
  alarm(0);

  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
    // searching for a thread with the relevant tid
    if(uthread_pool[i].tid == tid) {
      // put current running thread to sleep
      uthread_pool[c_uthread_index].state = SLEEP;
      // let other thread to run 
      uthread_yield();

      // if thread still alive, loop over the join procedure again
      goto loop;

    }
  }

  // the joined thread is not alive anyway, reset clock
  alarm(UTHREAD_QUANTA);

  return 0;
}
