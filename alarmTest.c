
#include "types.h"
#include "stat.h"
#include "user.h"

void alarmHendler();

int
main(int argc, char *argv[])
{
  int p;
  printf(1, " start  alarmtest \n");
  alarm(100);
  printf(1, "\n alarm_Hendler \n");
  for(p = 0; p < 50*500000; p++){
    if((p++ % 500000) == 0)
      write(2, ".", 1);
  }
  exit();
}

void
alarmHendler()
{
  printf(1, "in alarm_hendler\n");
  return ;
}
