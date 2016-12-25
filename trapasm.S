#include "mmu.h"

/*pazit--------------------------------------------*/
.globl sigretimplicit  //for ret add calculate
sigretimplicit:
 addl $4,%esp
 ret 
/*-------------------------------------------------*/

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
  pushl %es
  pushl %fs
  pushl %gs
  pushal
  
  # Set up data and per-cpu segments.
  movw $(SEG_KDATA<<3), %ax
  movw %ax, %ds
  movw %ax, %es
  movw $(SEG_KCPU<<3), %ax
  movw %ax, %fs
  movw %ax, %gs



  # Call trap(tf), where tf=%esp
  pushl %esp
  call trap
  addl $4, %esp


/*pazit--------------------------------------------*/
/*
# Call trap(tf), where tf=%esp
  pushl %esp
  call trap
  call handling_signal
  addl $4, %esp
*/
/*------------------------------------------------*/


  # Return falls through to trapret...
.globl trapret
trapret:

/*pazit--------------------------------------------*/
  pushl %esp
  call handling_signal  //calling the function to handle signal from ks
  addl $4, %esp
/*------------------------------------------------*/
  popal
  popl %gs
  popl %fs
  popl %es
  popl %ds
  addl $0x8, %esp  # trapno and errcode
  iret
