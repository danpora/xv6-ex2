#define UTHREAD_QUANTA 5
#define SIGALRM 14
#define NTICKET 5

// thread states
typedef enum  {FREE, RUNNING, RUNNABLE, SLEEP} uthread_state;

// stack size
#define STACK_SIZE  4096
// max number of thread allowed
#define MAX_THREADS  7

// uthread required functions
int uthread_init();

int uthread_create(void (*start_func)(void *), void* arg);

void uthread_yield();

void uthread_exit();

int uthread_self();

int uthread_join(int tid);


struct uthread {
	// thread id
	int	tid;
	// stack pointer
	int esp;      
	// base pointer
	int ebp;      
	// thread stack
	char *stack;	   
	// thread state
	uthread_state state;  
	// ntickets
	int ntickets;
};
 

