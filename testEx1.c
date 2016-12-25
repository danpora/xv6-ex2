#include "types.h"
#include "user.h"
#include "stat.h"
typedef void (*sighandler_t)(int);

void
testSignals(int sigNum){
 printf(1,"test_handle:process %d sent signal number %d to this running process\n", getpid(),sigNum);
}


int
main(int argc, char *argv[]){
printf(1,"test \n");
sighandler_t sigHandlFunc=(sighandler_t)testSignals;
for(int i=0;i<32;i++){
 printf(1,"test  for1: i=%d\n",i);
 signal(i,sigHandlFunc);
}

for(int j=0;j<32;j++){
 sigsend(getpid(),j);
}

exit();
}
