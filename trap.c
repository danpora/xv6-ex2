#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "traps.h"
#include "spinlock.h"

// Interrupt descriptor table (shared by all CPUs).
struct gatedesc idt[256];
extern uint vectors[];  // in vectors.S: array of 256 entry pointers
struct spinlock tickslock;
uint ticks;




/*pazit---------------------------------------------------*/

void defaultSigHandler(int sigNum){
cprintf("A signal number %d was accepted by process %d",sigNum,proc->pid);
}

/*
void pushHandlingSig(int sigIdx){
  proc->pending[sigIdx] = 0;
  int* SP =(int*)proc->tf->esp;  
  SP--1;
  *((uint*) SP ) = proc->tf->eip;
  SP--1;
  *((uint*) SP ) = sigIdx;
  SP--1;
  *((uint*) SP ) = proc->sigretAdd;   
  proc->tf->eip = (uint)proc->sighandlers[sigIdx];
}
*/


void pushHandlingSig(int sigIdx){

  proc->pending[sigIdx] = 0;
  proc->tf->esp -=4;
  *((uint*) proc->tf->esp ) = proc->tf->eip;
  /*push into user stack the sig number 4 bytes under stack pointer */
  proc->tf->esp -=4;
  *((uint*) proc->tf->esp ) = sigIdx;
   /*push the sireturn systemcall_function after the signal num into stack, 8 bytes under stack pointer*/
  proc->tf->esp -=4;
  *((uint*) proc->tf->esp ) = proc->sigretAdd;  /*implicit call to sigreturn system call*/
  /*execute the handler of this sig num*/
  proc->tf->eip = (uint)proc->sighandlers[sigIdx];
}





/*check the pending var to see if theres a signal waiting to be executed, if there are, set to 0 the sig_bit in the handkers array, store the current trap in tfToRestore var, put the suitable handler to exacute,set to 1 the procHandlingSigNow var */

void handling_signal(void){ 

 if(proc ==0){return;}  //no user proc running
 //if(xchg(&(proc->procHandlingSigNow),1) ==1){return;} /*already //handling signal*/
 int sigIdx=0;
 for(sigIdx=0;sigIdx<NUMSIG; sigIdx++){
    if(proc->pending[sigIdx] == 1){  //faund  next pending sig
        proc->pending[sigIdx] = 0;
      if(proc->sighandlers[sigIdx] == (sighandler_t)defualtHandlerAdd){
         defaultSigHandler(sigIdx);/*no extern handler - go to def handler*/
         proc->pending[sigIdx] = 0;
      }
      else{
	pushHandlingSig(sigIdx);

     }

   }

 }

}

/*--------------------------------------------------------*/


void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);

  initlock(&tickslock, "time");
}

void
idtinit(void)
{
  lidt(idt, sizeof(idt));
}
/*pazit--------------------------------------------------*/
void sys_alarm(void)
{
  int ticksNum;
  argint(0, &ticksNum);
 
  if(argint(0, &ticksNum) < 0)
    return;

 //cprintf("\ntrap: sys_alarm: ticksNum= %d \n",ticksNum);

  proc->alarm_ticks_num = ticksNum;  //get the num of ticks to wait from syscall
}
/*--------------------------------------------------------*/

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
      ticks++;
      wakeup(&ticks);
      release(&tickslock);
      Alarm();

    }
    lapiceoi();

    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
            cpunum(), tf->cs, tf->eip);
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
            rcr2());
    proc->killed = 1;
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
