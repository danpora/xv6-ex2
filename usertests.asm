
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
//   return randstate;
// }

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 da 51 00 00       	push   $0x51da
      16:	6a 01                	push   $0x1
      18:	e8 d3 39 00 00       	call   39f0 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	5a                   	pop    %edx
      1e:	59                   	pop    %ecx
      1f:	6a 00                	push   $0x0
      21:	68 ee 51 00 00       	push   $0x51ee
      26:	e8 97 38 00 00       	call   38c2 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 14                	js     46 <main+0x46>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	83 ec 08             	sub    $0x8,%esp
      35:	68 58 59 00 00       	push   $0x5958
      3a:	6a 01                	push   $0x1
      3c:	e8 af 39 00 00       	call   39f0 <printf>
    exit();
      41:	e8 3c 38 00 00       	call   3882 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      46:	50                   	push   %eax
      47:	50                   	push   %eax
      48:	68 00 02 00 00       	push   $0x200
      4d:	68 ee 51 00 00       	push   $0x51ee
      52:	e8 6b 38 00 00       	call   38c2 <open>
      57:	89 04 24             	mov    %eax,(%esp)
      5a:	e8 4b 38 00 00       	call   38aa <close>

  argptest();
      5f:	e8 6c 35 00 00       	call   35d0 <argptest>
  createdelete();
      64:	e8 87 11 00 00       	call   11f0 <createdelete>
  linkunlink();
      69:	e8 42 1a 00 00       	call   1ab0 <linkunlink>
  concreate();
      6e:	e8 2d 17 00 00       	call   17a0 <concreate>
  fourfiles();
      73:	e8 88 0f 00 00       	call   1000 <fourfiles>
  sharedfd();
      78:	e8 c3 0d 00 00       	call   e40 <sharedfd>

  bigargtest();
      7d:	e8 ee 31 00 00       	call   3270 <bigargtest>
  bigwrite();
      82:	e8 49 23 00 00       	call   23d0 <bigwrite>
  bigargtest();
      87:	e8 e4 31 00 00       	call   3270 <bigargtest>
  bsstest();
      8c:	e8 6f 31 00 00       	call   3200 <bsstest>
  sbrktest();
      91:	e8 8a 2c 00 00       	call   2d20 <sbrktest>
  validatetest();
      96:	e8 b5 30 00 00       	call   3150 <validatetest>

  opentest();
      9b:	e8 50 03 00 00       	call   3f0 <opentest>
  writetest();
      a0:	e8 db 03 00 00       	call   480 <writetest>
  writetest1();
      a5:	e8 b6 05 00 00       	call   660 <writetest1>
  createtest();
      aa:	e8 81 07 00 00       	call   830 <createtest>

  openiputtest();
      af:	e8 3c 02 00 00       	call   2f0 <openiputtest>
  exitiputtest();
      b4:	e8 47 01 00 00       	call   200 <exitiputtest>
  iputtest();
      b9:	e8 62 00 00 00       	call   120 <iputtest>

  mem();
      be:	e8 ad 0c 00 00       	call   d70 <mem>
  pipe1();
      c3:	e8 48 09 00 00       	call   a10 <pipe1>
  preempt();
      c8:	e8 d3 0a 00 00       	call   ba0 <preempt>
  exitwait();
      cd:	e8 0e 0c 00 00       	call   ce0 <exitwait>

  rmdot();
      d2:	e8 e9 26 00 00       	call   27c0 <rmdot>
  fourteen();
      d7:	e8 a4 25 00 00       	call   2680 <fourteen>
  bigfile();
      dc:	e8 cf 23 00 00       	call   24b0 <bigfile>
  subdir();
      e1:	e8 0a 1c 00 00       	call   1cf0 <subdir>
  linktest();
      e6:	e8 a5 14 00 00       	call   1590 <linktest>
  unlinkread();
      eb:	e8 10 13 00 00       	call   1400 <unlinkread>
  dirfile();
      f0:	e8 4b 28 00 00       	call   2940 <dirfile>
  iref();
      f5:	e8 46 2a 00 00       	call   2b40 <iref>
  forktest();
      fa:	e8 61 2b 00 00       	call   2c60 <forktest>
  bigdir(); // slow
      ff:	e8 bc 1a 00 00       	call   1bc0 <bigdir>

  uio();
     104:	e8 57 34 00 00       	call   3560 <uio>

  exectest();
     109:	e8 b2 08 00 00       	call   9c0 <exectest>

  exit();
     10e:	e8 6f 37 00 00       	call   3882 <exit>
     113:	66 90                	xchg   %ax,%ax
     115:	66 90                	xchg   %ax,%ax
     117:	66 90                	xchg   %ax,%ax
     119:	66 90                	xchg   %ax,%ax
     11b:	66 90                	xchg   %ax,%ax
     11d:	66 90                	xchg   %ax,%ax
     11f:	90                   	nop

00000120 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     126:	68 80 42 00 00       	push   $0x4280
     12b:	ff 35 44 64 00 00    	pushl  0x6444
     131:	e8 ba 38 00 00       	call   39f0 <printf>

  if(mkdir("iputdir") < 0){
     136:	c7 04 24 13 42 00 00 	movl   $0x4213,(%esp)
     13d:	e8 a8 37 00 00       	call   38ea <mkdir>
     142:	83 c4 10             	add    $0x10,%esp
     145:	85 c0                	test   %eax,%eax
     147:	78 58                	js     1a1 <iputtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
     149:	83 ec 0c             	sub    $0xc,%esp
     14c:	68 13 42 00 00       	push   $0x4213
     151:	e8 9c 37 00 00       	call   38f2 <chdir>
     156:	83 c4 10             	add    $0x10,%esp
     159:	85 c0                	test   %eax,%eax
     15b:	0f 88 85 00 00 00    	js     1e6 <iputtest+0xc6>
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
     161:	83 ec 0c             	sub    $0xc,%esp
     164:	68 10 42 00 00       	push   $0x4210
     169:	e8 64 37 00 00       	call   38d2 <unlink>
     16e:	83 c4 10             	add    $0x10,%esp
     171:	85 c0                	test   %eax,%eax
     173:	78 5a                	js     1cf <iputtest+0xaf>
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
     175:	83 ec 0c             	sub    $0xc,%esp
     178:	68 35 42 00 00       	push   $0x4235
     17d:	e8 70 37 00 00       	call   38f2 <chdir>
     182:	83 c4 10             	add    $0x10,%esp
     185:	85 c0                	test   %eax,%eax
     187:	78 2f                	js     1b8 <iputtest+0x98>
    printf(stdout, "chdir / failed\n");
    exit();
  }
  printf(stdout, "iput test ok\n");
     189:	83 ec 08             	sub    $0x8,%esp
     18c:	68 b8 42 00 00       	push   $0x42b8
     191:	ff 35 44 64 00 00    	pushl  0x6444
     197:	e8 54 38 00 00       	call   39f0 <printf>
}
     19c:	83 c4 10             	add    $0x10,%esp
     19f:	c9                   	leave  
     1a0:	c3                   	ret    
iputtest(void)
{
  printf(stdout, "iput test\n");

  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
     1a1:	50                   	push   %eax
     1a2:	50                   	push   %eax
     1a3:	68 ec 41 00 00       	push   $0x41ec
     1a8:	ff 35 44 64 00 00    	pushl  0x6444
     1ae:	e8 3d 38 00 00       	call   39f0 <printf>
    exit();
     1b3:	e8 ca 36 00 00       	call   3882 <exit>
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
    printf(stdout, "chdir / failed\n");
     1b8:	50                   	push   %eax
     1b9:	50                   	push   %eax
     1ba:	68 37 42 00 00       	push   $0x4237
     1bf:	ff 35 44 64 00 00    	pushl  0x6444
     1c5:	e8 26 38 00 00       	call   39f0 <printf>
    exit();
     1ca:	e8 b3 36 00 00       	call   3882 <exit>
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
     1cf:	52                   	push   %edx
     1d0:	52                   	push   %edx
     1d1:	68 1b 42 00 00       	push   $0x421b
     1d6:	ff 35 44 64 00 00    	pushl  0x6444
     1dc:	e8 0f 38 00 00       	call   39f0 <printf>
    exit();
     1e1:	e8 9c 36 00 00       	call   3882 <exit>
  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
     1e6:	51                   	push   %ecx
     1e7:	51                   	push   %ecx
     1e8:	68 fa 41 00 00       	push   $0x41fa
     1ed:	ff 35 44 64 00 00    	pushl  0x6444
     1f3:	e8 f8 37 00 00       	call   39f0 <printf>
    exit();
     1f8:	e8 85 36 00 00       	call   3882 <exit>
     1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <exitiputtest>:
}

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
     206:	68 47 42 00 00       	push   $0x4247
     20b:	ff 35 44 64 00 00    	pushl  0x6444
     211:	e8 da 37 00 00       	call   39f0 <printf>

  pid = fork();
     216:	e8 5f 36 00 00       	call   387a <fork>
  if(pid < 0){
     21b:	83 c4 10             	add    $0x10,%esp
     21e:	85 c0                	test   %eax,%eax
     220:	0f 88 82 00 00 00    	js     2a8 <exitiputtest+0xa8>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     226:	75 48                	jne    270 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
     228:	83 ec 0c             	sub    $0xc,%esp
     22b:	68 13 42 00 00       	push   $0x4213
     230:	e8 b5 36 00 00       	call   38ea <mkdir>
     235:	83 c4 10             	add    $0x10,%esp
     238:	85 c0                	test   %eax,%eax
     23a:	0f 88 96 00 00 00    	js     2d6 <exitiputtest+0xd6>
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
     240:	83 ec 0c             	sub    $0xc,%esp
     243:	68 13 42 00 00       	push   $0x4213
     248:	e8 a5 36 00 00       	call   38f2 <chdir>
     24d:	83 c4 10             	add    $0x10,%esp
     250:	85 c0                	test   %eax,%eax
     252:	78 6b                	js     2bf <exitiputtest+0xbf>
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
     254:	83 ec 0c             	sub    $0xc,%esp
     257:	68 10 42 00 00       	push   $0x4210
     25c:	e8 71 36 00 00       	call   38d2 <unlink>
     261:	83 c4 10             	add    $0x10,%esp
     264:	85 c0                	test   %eax,%eax
     266:	78 28                	js     290 <exitiputtest+0x90>
      printf(stdout, "unlink ../iputdir failed\n");
      exit();
    }
    exit();
     268:	e8 15 36 00 00       	call   3882 <exit>
     26d:	8d 76 00             	lea    0x0(%esi),%esi
  }
  wait();
     270:	e8 15 36 00 00       	call   388a <wait>
  printf(stdout, "exitiput test ok\n");
     275:	83 ec 08             	sub    $0x8,%esp
     278:	68 6a 42 00 00       	push   $0x426a
     27d:	ff 35 44 64 00 00    	pushl  0x6444
     283:	e8 68 37 00 00       	call   39f0 <printf>
}
     288:	83 c4 10             	add    $0x10,%esp
     28b:	c9                   	leave  
     28c:	c3                   	ret    
     28d:	8d 76 00             	lea    0x0(%esi),%esi
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
      printf(stdout, "unlink ../iputdir failed\n");
     290:	83 ec 08             	sub    $0x8,%esp
     293:	68 1b 42 00 00       	push   $0x421b
     298:	ff 35 44 64 00 00    	pushl  0x6444
     29e:	e8 4d 37 00 00       	call   39f0 <printf>
      exit();
     2a3:	e8 da 35 00 00       	call   3882 <exit>

  printf(stdout, "exitiput test\n");

  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     2a8:	51                   	push   %ecx
     2a9:	51                   	push   %ecx
     2aa:	68 2d 51 00 00       	push   $0x512d
     2af:	ff 35 44 64 00 00    	pushl  0x6444
     2b5:	e8 36 37 00 00       	call   39f0 <printf>
    exit();
     2ba:	e8 c3 35 00 00       	call   3882 <exit>
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
     2bf:	50                   	push   %eax
     2c0:	50                   	push   %eax
     2c1:	68 56 42 00 00       	push   $0x4256
     2c6:	ff 35 44 64 00 00    	pushl  0x6444
     2cc:	e8 1f 37 00 00       	call   39f0 <printf>
      exit();
     2d1:	e8 ac 35 00 00       	call   3882 <exit>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
     2d6:	52                   	push   %edx
     2d7:	52                   	push   %edx
     2d8:	68 ec 41 00 00       	push   $0x41ec
     2dd:	ff 35 44 64 00 00    	pushl  0x6444
     2e3:	e8 08 37 00 00       	call   39f0 <printf>
      exit();
     2e8:	e8 95 35 00 00       	call   3882 <exit>
     2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
     2f6:	68 7c 42 00 00       	push   $0x427c
     2fb:	ff 35 44 64 00 00    	pushl  0x6444
     301:	e8 ea 36 00 00       	call   39f0 <printf>
  if(mkdir("oidir") < 0){
     306:	c7 04 24 8b 42 00 00 	movl   $0x428b,(%esp)
     30d:	e8 d8 35 00 00       	call   38ea <mkdir>
     312:	83 c4 10             	add    $0x10,%esp
     315:	85 c0                	test   %eax,%eax
     317:	0f 88 88 00 00 00    	js     3a5 <openiputtest+0xb5>
    printf(stdout, "mkdir oidir failed\n");
    exit();
  }
  pid = fork();
     31d:	e8 58 35 00 00       	call   387a <fork>
  if(pid < 0){
     322:	85 c0                	test   %eax,%eax
     324:	0f 88 92 00 00 00    	js     3bc <openiputtest+0xcc>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     32a:	75 34                	jne    360 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     32c:	83 ec 08             	sub    $0x8,%esp
     32f:	6a 02                	push   $0x2
     331:	68 8b 42 00 00       	push   $0x428b
     336:	e8 87 35 00 00       	call   38c2 <open>
    if(fd >= 0){
     33b:	83 c4 10             	add    $0x10,%esp
     33e:	85 c0                	test   %eax,%eax
     340:	78 5e                	js     3a0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     342:	83 ec 08             	sub    $0x8,%esp
     345:	68 10 52 00 00       	push   $0x5210
     34a:	ff 35 44 64 00 00    	pushl  0x6444
     350:	e8 9b 36 00 00       	call   39f0 <printf>
      exit();
     355:	e8 28 35 00 00       	call   3882 <exit>
     35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
    exit();
  }
  sleep(1);
     360:	83 ec 0c             	sub    $0xc,%esp
     363:	6a 01                	push   $0x1
     365:	e8 a8 35 00 00       	call   3912 <sleep>
  if(unlink("oidir") != 0){
     36a:	c7 04 24 8b 42 00 00 	movl   $0x428b,(%esp)
     371:	e8 5c 35 00 00       	call   38d2 <unlink>
     376:	83 c4 10             	add    $0x10,%esp
     379:	85 c0                	test   %eax,%eax
     37b:	75 56                	jne    3d3 <openiputtest+0xe3>
    printf(stdout, "unlink failed\n");
    exit();
  }
  wait();
     37d:	e8 08 35 00 00       	call   388a <wait>
  printf(stdout, "openiput test ok\n");
     382:	83 ec 08             	sub    $0x8,%esp
     385:	68 b4 42 00 00       	push   $0x42b4
     38a:	ff 35 44 64 00 00    	pushl  0x6444
     390:	e8 5b 36 00 00       	call   39f0 <printf>
     395:	83 c4 10             	add    $0x10,%esp
}
     398:	c9                   	leave  
     399:	c3                   	ret    
     39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int fd = open("oidir", O_RDWR);
    if(fd >= 0){
      printf(stdout, "open directory for write succeeded\n");
      exit();
    }
    exit();
     3a0:	e8 dd 34 00 00       	call   3882 <exit>
{
  int pid;

  printf(stdout, "openiput test\n");
  if(mkdir("oidir") < 0){
    printf(stdout, "mkdir oidir failed\n");
     3a5:	51                   	push   %ecx
     3a6:	51                   	push   %ecx
     3a7:	68 91 42 00 00       	push   $0x4291
     3ac:	ff 35 44 64 00 00    	pushl  0x6444
     3b2:	e8 39 36 00 00       	call   39f0 <printf>
    exit();
     3b7:	e8 c6 34 00 00       	call   3882 <exit>
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     3bc:	52                   	push   %edx
     3bd:	52                   	push   %edx
     3be:	68 2d 51 00 00       	push   $0x512d
     3c3:	ff 35 44 64 00 00    	pushl  0x6444
     3c9:	e8 22 36 00 00       	call   39f0 <printf>
    exit();
     3ce:	e8 af 34 00 00       	call   3882 <exit>
    }
    exit();
  }
  sleep(1);
  if(unlink("oidir") != 0){
    printf(stdout, "unlink failed\n");
     3d3:	50                   	push   %eax
     3d4:	50                   	push   %eax
     3d5:	68 a5 42 00 00       	push   $0x42a5
     3da:	ff 35 44 64 00 00    	pushl  0x6444
     3e0:	e8 0b 36 00 00       	call   39f0 <printf>
    exit();
     3e5:	e8 98 34 00 00       	call   3882 <exit>
     3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003f0 <opentest>:

// simple file system tests

void
opentest(void)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
     3f6:	68 c6 42 00 00       	push   $0x42c6
     3fb:	ff 35 44 64 00 00    	pushl  0x6444
     401:	e8 ea 35 00 00       	call   39f0 <printf>
  fd = open("echo", 0);
     406:	58                   	pop    %eax
     407:	5a                   	pop    %edx
     408:	6a 00                	push   $0x0
     40a:	68 d1 42 00 00       	push   $0x42d1
     40f:	e8 ae 34 00 00       	call   38c2 <open>
  if(fd < 0){
     414:	83 c4 10             	add    $0x10,%esp
     417:	85 c0                	test   %eax,%eax
     419:	78 36                	js     451 <opentest+0x61>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
     41b:	83 ec 0c             	sub    $0xc,%esp
     41e:	50                   	push   %eax
     41f:	e8 86 34 00 00       	call   38aa <close>
  fd = open("doesnotexist", 0);
     424:	5a                   	pop    %edx
     425:	59                   	pop    %ecx
     426:	6a 00                	push   $0x0
     428:	68 e9 42 00 00       	push   $0x42e9
     42d:	e8 90 34 00 00       	call   38c2 <open>
  if(fd >= 0){
     432:	83 c4 10             	add    $0x10,%esp
     435:	85 c0                	test   %eax,%eax
     437:	79 2f                	jns    468 <opentest+0x78>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     439:	83 ec 08             	sub    $0x8,%esp
     43c:	68 14 43 00 00       	push   $0x4314
     441:	ff 35 44 64 00 00    	pushl  0x6444
     447:	e8 a4 35 00 00       	call   39f0 <printf>
}
     44c:	83 c4 10             	add    $0x10,%esp
     44f:	c9                   	leave  
     450:	c3                   	ret    
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     451:	50                   	push   %eax
     452:	50                   	push   %eax
     453:	68 d6 42 00 00       	push   $0x42d6
     458:	ff 35 44 64 00 00    	pushl  0x6444
     45e:	e8 8d 35 00 00       	call   39f0 <printf>
    exit();
     463:	e8 1a 34 00 00       	call   3882 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     468:	50                   	push   %eax
     469:	50                   	push   %eax
     46a:	68 f6 42 00 00       	push   $0x42f6
     46f:	ff 35 44 64 00 00    	pushl  0x6444
     475:	e8 76 35 00 00       	call   39f0 <printf>
    exit();
     47a:	e8 03 34 00 00       	call   3882 <exit>
     47f:	90                   	nop

00000480 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	56                   	push   %esi
     484:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     485:	83 ec 08             	sub    $0x8,%esp
     488:	68 22 43 00 00       	push   $0x4322
     48d:	ff 35 44 64 00 00    	pushl  0x6444
     493:	e8 58 35 00 00       	call   39f0 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     498:	59                   	pop    %ecx
     499:	5b                   	pop    %ebx
     49a:	68 02 02 00 00       	push   $0x202
     49f:	68 33 43 00 00       	push   $0x4333
     4a4:	e8 19 34 00 00       	call   38c2 <open>
  if(fd >= 0){
     4a9:	83 c4 10             	add    $0x10,%esp
     4ac:	85 c0                	test   %eax,%eax
     4ae:	0f 88 8b 01 00 00    	js     63f <writetest+0x1bf>
    printf(stdout, "creat small succeeded; ok\n");
     4b4:	83 ec 08             	sub    $0x8,%esp
     4b7:	89 c6                	mov    %eax,%esi
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     4b9:	31 db                	xor    %ebx,%ebx
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
     4bb:	68 39 43 00 00       	push   $0x4339
     4c0:	ff 35 44 64 00 00    	pushl  0x6444
     4c6:	e8 25 35 00 00       	call   39f0 <printf>
     4cb:	83 c4 10             	add    $0x10,%esp
     4ce:	66 90                	xchg   %ax,%ax
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4d0:	83 ec 04             	sub    $0x4,%esp
     4d3:	6a 0a                	push   $0xa
     4d5:	68 70 43 00 00       	push   $0x4370
     4da:	56                   	push   %esi
     4db:	e8 c2 33 00 00       	call   38a2 <write>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	83 f8 0a             	cmp    $0xa,%eax
     4e6:	0f 85 d9 00 00 00    	jne    5c5 <writetest+0x145>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4ec:	83 ec 04             	sub    $0x4,%esp
     4ef:	6a 0a                	push   $0xa
     4f1:	68 7b 43 00 00       	push   $0x437b
     4f6:	56                   	push   %esi
     4f7:	e8 a6 33 00 00       	call   38a2 <write>
     4fc:	83 c4 10             	add    $0x10,%esp
     4ff:	83 f8 0a             	cmp    $0xa,%eax
     502:	0f 85 d6 00 00 00    	jne    5de <writetest+0x15e>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     508:	83 c3 01             	add    $0x1,%ebx
     50b:	83 fb 64             	cmp    $0x64,%ebx
     50e:	75 c0                	jne    4d0 <writetest+0x50>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     510:	83 ec 08             	sub    $0x8,%esp
     513:	68 86 43 00 00       	push   $0x4386
     518:	ff 35 44 64 00 00    	pushl  0x6444
     51e:	e8 cd 34 00 00       	call   39f0 <printf>
  close(fd);
     523:	89 34 24             	mov    %esi,(%esp)
     526:	e8 7f 33 00 00       	call   38aa <close>
  fd = open("small", O_RDONLY);
     52b:	58                   	pop    %eax
     52c:	5a                   	pop    %edx
     52d:	6a 00                	push   $0x0
     52f:	68 33 43 00 00       	push   $0x4333
     534:	e8 89 33 00 00       	call   38c2 <open>
  if(fd >= 0){
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
     53e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     540:	0f 88 b1 00 00 00    	js     5f7 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     546:	83 ec 08             	sub    $0x8,%esp
     549:	68 91 43 00 00       	push   $0x4391
     54e:	ff 35 44 64 00 00    	pushl  0x6444
     554:	e8 97 34 00 00       	call   39f0 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     559:	83 c4 0c             	add    $0xc,%esp
     55c:	68 d0 07 00 00       	push   $0x7d0
     561:	68 20 8c 00 00       	push   $0x8c20
     566:	53                   	push   %ebx
     567:	e8 2e 33 00 00       	call   389a <read>
  if(i == 2000){
     56c:	83 c4 10             	add    $0x10,%esp
     56f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     574:	0f 85 95 00 00 00    	jne    60f <writetest+0x18f>
    printf(stdout, "read succeeded ok\n");
     57a:	83 ec 08             	sub    $0x8,%esp
     57d:	68 c5 43 00 00       	push   $0x43c5
     582:	ff 35 44 64 00 00    	pushl  0x6444
     588:	e8 63 34 00 00       	call   39f0 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     58d:	89 1c 24             	mov    %ebx,(%esp)
     590:	e8 15 33 00 00       	call   38aa <close>

  if(unlink("small") < 0){
     595:	c7 04 24 33 43 00 00 	movl   $0x4333,(%esp)
     59c:	e8 31 33 00 00       	call   38d2 <unlink>
     5a1:	83 c4 10             	add    $0x10,%esp
     5a4:	85 c0                	test   %eax,%eax
     5a6:	78 7f                	js     627 <writetest+0x1a7>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     5a8:	83 ec 08             	sub    $0x8,%esp
     5ab:	68 ed 43 00 00       	push   $0x43ed
     5b0:	ff 35 44 64 00 00    	pushl  0x6444
     5b6:	e8 35 34 00 00       	call   39f0 <printf>
}
     5bb:	83 c4 10             	add    $0x10,%esp
     5be:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5c1:	5b                   	pop    %ebx
     5c2:	5e                   	pop    %esi
     5c3:	5d                   	pop    %ebp
     5c4:	c3                   	ret    
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     5c5:	83 ec 04             	sub    $0x4,%esp
     5c8:	53                   	push   %ebx
     5c9:	68 34 52 00 00       	push   $0x5234
     5ce:	ff 35 44 64 00 00    	pushl  0x6444
     5d4:	e8 17 34 00 00       	call   39f0 <printf>
      exit();
     5d9:	e8 a4 32 00 00       	call   3882 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     5de:	83 ec 04             	sub    $0x4,%esp
     5e1:	53                   	push   %ebx
     5e2:	68 58 52 00 00       	push   $0x5258
     5e7:	ff 35 44 64 00 00    	pushl  0x6444
     5ed:	e8 fe 33 00 00       	call   39f0 <printf>
      exit();
     5f2:	e8 8b 32 00 00       	call   3882 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     5f7:	83 ec 08             	sub    $0x8,%esp
     5fa:	68 aa 43 00 00       	push   $0x43aa
     5ff:	ff 35 44 64 00 00    	pushl  0x6444
     605:	e8 e6 33 00 00       	call   39f0 <printf>
    exit();
     60a:	e8 73 32 00 00       	call   3882 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     60f:	83 ec 08             	sub    $0x8,%esp
     612:	68 f1 46 00 00       	push   $0x46f1
     617:	ff 35 44 64 00 00    	pushl  0x6444
     61d:	e8 ce 33 00 00       	call   39f0 <printf>
    exit();
     622:	e8 5b 32 00 00       	call   3882 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     627:	83 ec 08             	sub    $0x8,%esp
     62a:	68 d8 43 00 00       	push   $0x43d8
     62f:	ff 35 44 64 00 00    	pushl  0x6444
     635:	e8 b6 33 00 00       	call   39f0 <printf>
    exit();
     63a:	e8 43 32 00 00       	call   3882 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     63f:	83 ec 08             	sub    $0x8,%esp
     642:	68 54 43 00 00       	push   $0x4354
     647:	ff 35 44 64 00 00    	pushl  0x6444
     64d:	e8 9e 33 00 00       	call   39f0 <printf>
    exit();
     652:	e8 2b 32 00 00       	call   3882 <exit>
     657:	89 f6                	mov    %esi,%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	56                   	push   %esi
     664:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     665:	83 ec 08             	sub    $0x8,%esp
     668:	68 01 44 00 00       	push   $0x4401
     66d:	ff 35 44 64 00 00    	pushl  0x6444
     673:	e8 78 33 00 00       	call   39f0 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     678:	59                   	pop    %ecx
     679:	5b                   	pop    %ebx
     67a:	68 02 02 00 00       	push   $0x202
     67f:	68 7b 44 00 00       	push   $0x447b
     684:	e8 39 32 00 00       	call   38c2 <open>
  if(fd < 0){
     689:	83 c4 10             	add    $0x10,%esp
     68c:	85 c0                	test   %eax,%eax
     68e:	0f 88 64 01 00 00    	js     7f8 <writetest1+0x198>
     694:	89 c6                	mov    %eax,%esi
     696:	31 db                	xor    %ebx,%ebx
     698:	90                   	nop
     699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
     6a0:	83 ec 04             	sub    $0x4,%esp
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     6a3:	89 1d 20 8c 00 00    	mov    %ebx,0x8c20
    if(write(fd, buf, 512) != 512){
     6a9:	68 00 02 00 00       	push   $0x200
     6ae:	68 20 8c 00 00       	push   $0x8c20
     6b3:	56                   	push   %esi
     6b4:	e8 e9 31 00 00       	call   38a2 <write>
     6b9:	83 c4 10             	add    $0x10,%esp
     6bc:	3d 00 02 00 00       	cmp    $0x200,%eax
     6c1:	0f 85 b3 00 00 00    	jne    77a <writetest1+0x11a>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     6c7:	83 c3 01             	add    $0x1,%ebx
     6ca:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     6d0:	75 ce                	jne    6a0 <writetest1+0x40>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     6d2:	83 ec 0c             	sub    $0xc,%esp
     6d5:	56                   	push   %esi
     6d6:	e8 cf 31 00 00       	call   38aa <close>

  fd = open("big", O_RDONLY);
     6db:	58                   	pop    %eax
     6dc:	5a                   	pop    %edx
     6dd:	6a 00                	push   $0x0
     6df:	68 7b 44 00 00       	push   $0x447b
     6e4:	e8 d9 31 00 00       	call   38c2 <open>
  if(fd < 0){
     6e9:	83 c4 10             	add    $0x10,%esp
     6ec:	85 c0                	test   %eax,%eax
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
     6ee:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6f0:	0f 88 ea 00 00 00    	js     7e0 <writetest1+0x180>
     6f6:	31 db                	xor    %ebx,%ebx
     6f8:	eb 1d                	jmp    717 <writetest1+0xb7>
     6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     700:	3d 00 02 00 00       	cmp    $0x200,%eax
     705:	0f 85 9f 00 00 00    	jne    7aa <writetest1+0x14a>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
     70b:	a1 20 8c 00 00       	mov    0x8c20,%eax
     710:	39 c3                	cmp    %eax,%ebx
     712:	75 7f                	jne    793 <writetest1+0x133>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     714:	83 c3 01             	add    $0x1,%ebx
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     717:	83 ec 04             	sub    $0x4,%esp
     71a:	68 00 02 00 00       	push   $0x200
     71f:	68 20 8c 00 00       	push   $0x8c20
     724:	56                   	push   %esi
     725:	e8 70 31 00 00       	call   389a <read>
    if(i == 0){
     72a:	83 c4 10             	add    $0x10,%esp
     72d:	85 c0                	test   %eax,%eax
     72f:	75 cf                	jne    700 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     731:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     737:	0f 84 86 00 00 00    	je     7c3 <writetest1+0x163>
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     73d:	83 ec 0c             	sub    $0xc,%esp
     740:	56                   	push   %esi
     741:	e8 64 31 00 00       	call   38aa <close>
  if(unlink("big") < 0){
     746:	c7 04 24 7b 44 00 00 	movl   $0x447b,(%esp)
     74d:	e8 80 31 00 00       	call   38d2 <unlink>
     752:	83 c4 10             	add    $0x10,%esp
     755:	85 c0                	test   %eax,%eax
     757:	0f 88 b3 00 00 00    	js     810 <writetest1+0x1b0>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     75d:	83 ec 08             	sub    $0x8,%esp
     760:	68 a2 44 00 00       	push   $0x44a2
     765:	ff 35 44 64 00 00    	pushl  0x6444
     76b:	e8 80 32 00 00       	call   39f0 <printf>
}
     770:	83 c4 10             	add    $0x10,%esp
     773:	8d 65 f8             	lea    -0x8(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5d                   	pop    %ebp
     779:	c3                   	ret    
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     77a:	83 ec 04             	sub    $0x4,%esp
     77d:	53                   	push   %ebx
     77e:	68 2b 44 00 00       	push   $0x442b
     783:	ff 35 44 64 00 00    	pushl  0x6444
     789:	e8 62 32 00 00       	call   39f0 <printf>
      exit();
     78e:	e8 ef 30 00 00       	call   3882 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     793:	50                   	push   %eax
     794:	53                   	push   %ebx
     795:	68 7c 52 00 00       	push   $0x527c
     79a:	ff 35 44 64 00 00    	pushl  0x6444
     7a0:	e8 4b 32 00 00       	call   39f0 <printf>
             n, ((int*)buf)[0]);
      exit();
     7a5:	e8 d8 30 00 00       	call   3882 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     7aa:	83 ec 04             	sub    $0x4,%esp
     7ad:	50                   	push   %eax
     7ae:	68 7f 44 00 00       	push   $0x447f
     7b3:	ff 35 44 64 00 00    	pushl  0x6444
     7b9:	e8 32 32 00 00       	call   39f0 <printf>
      exit();
     7be:	e8 bf 30 00 00       	call   3882 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     7c3:	83 ec 04             	sub    $0x4,%esp
     7c6:	68 8b 00 00 00       	push   $0x8b
     7cb:	68 62 44 00 00       	push   $0x4462
     7d0:	ff 35 44 64 00 00    	pushl  0x6444
     7d6:	e8 15 32 00 00       	call   39f0 <printf>
        exit();
     7db:	e8 a2 30 00 00       	call   3882 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     7e0:	83 ec 08             	sub    $0x8,%esp
     7e3:	68 49 44 00 00       	push   $0x4449
     7e8:	ff 35 44 64 00 00    	pushl  0x6444
     7ee:	e8 fd 31 00 00       	call   39f0 <printf>
    exit();
     7f3:	e8 8a 30 00 00       	call   3882 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	68 11 44 00 00       	push   $0x4411
     800:	ff 35 44 64 00 00    	pushl  0x6444
     806:	e8 e5 31 00 00       	call   39f0 <printf>
    exit();
     80b:	e8 72 30 00 00       	call   3882 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     810:	83 ec 08             	sub    $0x8,%esp
     813:	68 8f 44 00 00       	push   $0x448f
     818:	ff 35 44 64 00 00    	pushl  0x6444
     81e:	e8 cd 31 00 00       	call   39f0 <printf>
    exit();
     823:	e8 5a 30 00 00       	call   3882 <exit>
     828:	90                   	nop
     829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000830 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	53                   	push   %ebx
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
     834:	bb 30 00 00 00       	mov    $0x30,%ebx
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     839:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     83c:	68 9c 52 00 00       	push   $0x529c
     841:	ff 35 44 64 00 00    	pushl  0x6444
     847:	e8 a4 31 00 00       	call   39f0 <printf>

  name[0] = 'a';
     84c:	c6 05 20 ac 00 00 61 	movb   $0x61,0xac20
  name[2] = '\0';
     853:	c6 05 22 ac 00 00 00 	movb   $0x0,0xac22
     85a:	83 c4 10             	add    $0x10,%esp
     85d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
     860:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     863:	88 1d 21 ac 00 00    	mov    %bl,0xac21
     869:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     86c:	68 02 02 00 00       	push   $0x202
     871:	68 20 ac 00 00       	push   $0xac20
     876:	e8 47 30 00 00       	call   38c2 <open>
    close(fd);
     87b:	89 04 24             	mov    %eax,(%esp)
     87e:	e8 27 30 00 00       	call   38aa <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     883:	83 c4 10             	add    $0x10,%esp
     886:	80 fb 64             	cmp    $0x64,%bl
     889:	75 d5                	jne    860 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     88b:	c6 05 20 ac 00 00 61 	movb   $0x61,0xac20
  name[2] = '\0';
     892:	c6 05 22 ac 00 00 00 	movb   $0x0,0xac22
     899:	bb 30 00 00 00       	mov    $0x30,%ebx
     89e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
     8a0:	83 ec 0c             	sub    $0xc,%esp
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     8a3:	88 1d 21 ac 00 00    	mov    %bl,0xac21
     8a9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     8ac:	68 20 ac 00 00       	push   $0xac20
     8b1:	e8 1c 30 00 00       	call   38d2 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	80 fb 64             	cmp    $0x64,%bl
     8bc:	75 e2                	jne    8a0 <createtest+0x70>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     8be:	83 ec 08             	sub    $0x8,%esp
     8c1:	68 c4 52 00 00       	push   $0x52c4
     8c6:	ff 35 44 64 00 00    	pushl  0x6444
     8cc:	e8 1f 31 00 00       	call   39f0 <printf>
}
     8d1:	83 c4 10             	add    $0x10,%esp
     8d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8d7:	c9                   	leave  
     8d8:	c3                   	ret    
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <dirtest>:

void dirtest(void)
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8e6:	68 b0 44 00 00       	push   $0x44b0
     8eb:	ff 35 44 64 00 00    	pushl  0x6444
     8f1:	e8 fa 30 00 00       	call   39f0 <printf>

  if(mkdir("dir0") < 0){
     8f6:	c7 04 24 bc 44 00 00 	movl   $0x44bc,(%esp)
     8fd:	e8 e8 2f 00 00       	call   38ea <mkdir>
     902:	83 c4 10             	add    $0x10,%esp
     905:	85 c0                	test   %eax,%eax
     907:	78 58                	js     961 <dirtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     909:	83 ec 0c             	sub    $0xc,%esp
     90c:	68 bc 44 00 00       	push   $0x44bc
     911:	e8 dc 2f 00 00       	call   38f2 <chdir>
     916:	83 c4 10             	add    $0x10,%esp
     919:	85 c0                	test   %eax,%eax
     91b:	0f 88 85 00 00 00    	js     9a6 <dirtest+0xc6>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     921:	83 ec 0c             	sub    $0xc,%esp
     924:	68 61 4a 00 00       	push   $0x4a61
     929:	e8 c4 2f 00 00       	call   38f2 <chdir>
     92e:	83 c4 10             	add    $0x10,%esp
     931:	85 c0                	test   %eax,%eax
     933:	78 5a                	js     98f <dirtest+0xaf>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     935:	83 ec 0c             	sub    $0xc,%esp
     938:	68 bc 44 00 00       	push   $0x44bc
     93d:	e8 90 2f 00 00       	call   38d2 <unlink>
     942:	83 c4 10             	add    $0x10,%esp
     945:	85 c0                	test   %eax,%eax
     947:	78 2f                	js     978 <dirtest+0x98>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test ok\n");
     949:	83 ec 08             	sub    $0x8,%esp
     94c:	68 f9 44 00 00       	push   $0x44f9
     951:	ff 35 44 64 00 00    	pushl  0x6444
     957:	e8 94 30 00 00       	call   39f0 <printf>
}
     95c:	83 c4 10             	add    $0x10,%esp
     95f:	c9                   	leave  
     960:	c3                   	ret    
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     961:	50                   	push   %eax
     962:	50                   	push   %eax
     963:	68 ec 41 00 00       	push   $0x41ec
     968:	ff 35 44 64 00 00    	pushl  0x6444
     96e:	e8 7d 30 00 00       	call   39f0 <printf>
    exit();
     973:	e8 0a 2f 00 00       	call   3882 <exit>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     978:	50                   	push   %eax
     979:	50                   	push   %eax
     97a:	68 e5 44 00 00       	push   $0x44e5
     97f:	ff 35 44 64 00 00    	pushl  0x6444
     985:	e8 66 30 00 00       	call   39f0 <printf>
    exit();
     98a:	e8 f3 2e 00 00       	call   3882 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     98f:	52                   	push   %edx
     990:	52                   	push   %edx
     991:	68 d4 44 00 00       	push   $0x44d4
     996:	ff 35 44 64 00 00    	pushl  0x6444
     99c:	e8 4f 30 00 00       	call   39f0 <printf>
    exit();
     9a1:	e8 dc 2e 00 00       	call   3882 <exit>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     9a6:	51                   	push   %ecx
     9a7:	51                   	push   %ecx
     9a8:	68 c1 44 00 00       	push   $0x44c1
     9ad:	ff 35 44 64 00 00    	pushl  0x6444
     9b3:	e8 38 30 00 00       	call   39f0 <printf>
    exit();
     9b8:	e8 c5 2e 00 00       	call   3882 <exit>
     9bd:	8d 76 00             	lea    0x0(%esi),%esi

000009c0 <exectest>:
  printf(stdout, "mkdir test ok\n");
}

void
exectest(void)
{
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9c6:	68 08 45 00 00       	push   $0x4508
     9cb:	ff 35 44 64 00 00    	pushl  0x6444
     9d1:	e8 1a 30 00 00       	call   39f0 <printf>
  if(exec("echo", echoargv) < 0){
     9d6:	5a                   	pop    %edx
     9d7:	59                   	pop    %ecx
     9d8:	68 48 64 00 00       	push   $0x6448
     9dd:	68 d1 42 00 00       	push   $0x42d1
     9e2:	e8 d3 2e 00 00       	call   38ba <exec>
     9e7:	83 c4 10             	add    $0x10,%esp
     9ea:	85 c0                	test   %eax,%eax
     9ec:	78 02                	js     9f0 <exectest+0x30>
    printf(stdout, "exec echo failed\n");
    exit();
  }
}
     9ee:	c9                   	leave  
     9ef:	c3                   	ret    
void
exectest(void)
{
  printf(stdout, "exec test\n");
  if(exec("echo", echoargv) < 0){
    printf(stdout, "exec echo failed\n");
     9f0:	50                   	push   %eax
     9f1:	50                   	push   %eax
     9f2:	68 13 45 00 00       	push   $0x4513
     9f7:	ff 35 44 64 00 00    	pushl  0x6444
     9fd:	e8 ee 2f 00 00       	call   39f0 <printf>
    exit();
     a02:	e8 7b 2e 00 00       	call   3882 <exit>
     a07:	89 f6                	mov    %esi,%esi
     a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a10 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a16:	8d 45 e0             	lea    -0x20(%ebp),%eax

// simple fork and pipe read/write

void
pipe1(void)
{
     a19:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a1c:	50                   	push   %eax
     a1d:	e8 70 2e 00 00       	call   3892 <pipe>
     a22:	83 c4 10             	add    $0x10,%esp
     a25:	85 c0                	test   %eax,%eax
     a27:	0f 85 35 01 00 00    	jne    b62 <pipe1+0x152>
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
     a2d:	e8 48 2e 00 00       	call   387a <fork>
  seq = 0;
  if(pid == 0){
     a32:	83 f8 00             	cmp    $0x0,%eax
     a35:	0f 84 86 00 00 00    	je     ac1 <pipe1+0xb1>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     a3b:	0f 8e 35 01 00 00    	jle    b76 <pipe1+0x166>
    close(fds[1]);
     a41:	83 ec 0c             	sub    $0xc,%esp
     a44:	ff 75 e4             	pushl  -0x1c(%ebp)
    total = 0;
    cc = 1;
     a47:	bf 01 00 00 00       	mov    $0x1,%edi
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     a4c:	31 db                	xor    %ebx,%ebx
        exit();
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
     a4e:	e8 57 2e 00 00       	call   38aa <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a53:	83 c4 10             	add    $0x10,%esp
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
     a56:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a5d:	83 ec 04             	sub    $0x4,%esp
     a60:	57                   	push   %edi
     a61:	68 20 8c 00 00       	push   $0x8c20
     a66:	ff 75 e0             	pushl  -0x20(%ebp)
     a69:	e8 2c 2e 00 00       	call   389a <read>
     a6e:	83 c4 10             	add    $0x10,%esp
     a71:	85 c0                	test   %eax,%eax
     a73:	0f 8e a3 00 00 00    	jle    b1c <pipe1+0x10c>
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a79:	89 d9                	mov    %ebx,%ecx
     a7b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a7e:	f7 d9                	neg    %ecx
     a80:	38 9c 0b 20 8c 00 00 	cmp    %bl,0x8c20(%ebx,%ecx,1)
     a87:	8d 53 01             	lea    0x1(%ebx),%edx
     a8a:	75 1b                	jne    aa7 <pipe1+0x97>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     a8c:	39 f2                	cmp    %esi,%edx
     a8e:	89 d3                	mov    %edx,%ebx
     a90:	75 ee                	jne    a80 <pipe1+0x70>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
     a92:	01 ff                	add    %edi,%edi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     a94:	01 45 d4             	add    %eax,-0x2c(%ebp)
     a97:	b8 00 20 00 00       	mov    $0x2000,%eax
     a9c:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     aa2:	0f 4f f8             	cmovg  %eax,%edi
     aa5:	eb b6                	jmp    a5d <pipe1+0x4d>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     aa7:	83 ec 08             	sub    $0x8,%esp
     aaa:	68 42 45 00 00       	push   $0x4542
     aaf:	6a 01                	push   $0x1
     ab1:	e8 3a 2f 00 00       	call   39f0 <printf>
          return;
     ab6:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     ab9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     abc:	5b                   	pop    %ebx
     abd:	5e                   	pop    %esi
     abe:	5f                   	pop    %edi
     abf:	5d                   	pop    %ebp
     ac0:	c3                   	ret    
    exit();
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     ac1:	83 ec 0c             	sub    $0xc,%esp
     ac4:	ff 75 e0             	pushl  -0x20(%ebp)
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     ac7:	31 f6                	xor    %esi,%esi
  if(pid == 0){
    close(fds[0]);
     ac9:	e8 dc 2d 00 00       	call   38aa <close>
     ace:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     ad1:	89 f0                	mov    %esi,%eax
     ad3:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx

// simple fork and pipe read/write

void
pipe1(void)
{
     ad9:	89 f3                	mov    %esi,%ebx
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     adb:	f7 d8                	neg    %eax
     add:	8d 76 00             	lea    0x0(%esi),%esi
     ae0:	88 9c 18 20 8c 00 00 	mov    %bl,0x8c20(%eax,%ebx,1)
     ae7:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     aea:	39 d3                	cmp    %edx,%ebx
     aec:	75 f2                	jne    ae0 <pipe1+0xd0>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     aee:	83 ec 04             	sub    $0x4,%esp
     af1:	89 de                	mov    %ebx,%esi
     af3:	68 09 04 00 00       	push   $0x409
     af8:	68 20 8c 00 00       	push   $0x8c20
     afd:	ff 75 e4             	pushl  -0x1c(%ebp)
     b00:	e8 9d 2d 00 00       	call   38a2 <write>
     b05:	83 c4 10             	add    $0x10,%esp
     b08:	3d 09 04 00 00       	cmp    $0x409,%eax
     b0d:	75 7b                	jne    b8a <pipe1+0x17a>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     b0f:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b15:	75 ba                	jne    ad1 <pipe1+0xc1>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     b17:	e8 66 2d 00 00       	call   3882 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     b1c:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b23:	75 26                	jne    b4b <pipe1+0x13b>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
    }
    close(fds[0]);
     b25:	83 ec 0c             	sub    $0xc,%esp
     b28:	ff 75 e0             	pushl  -0x20(%ebp)
     b2b:	e8 7a 2d 00 00       	call   38aa <close>
    wait();
     b30:	e8 55 2d 00 00       	call   388a <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     b35:	58                   	pop    %eax
     b36:	5a                   	pop    %edx
     b37:	68 67 45 00 00       	push   $0x4567
     b3c:	6a 01                	push   $0x1
     b3e:	e8 ad 2e 00 00       	call   39f0 <printf>
     b43:	83 c4 10             	add    $0x10,%esp
     b46:	e9 6e ff ff ff       	jmp    ab9 <pipe1+0xa9>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     b4b:	83 ec 04             	sub    $0x4,%esp
     b4e:	ff 75 d4             	pushl  -0x2c(%ebp)
     b51:	68 50 45 00 00       	push   $0x4550
     b56:	6a 01                	push   $0x1
     b58:	e8 93 2e 00 00       	call   39f0 <printf>
      exit();
     b5d:	e8 20 2d 00 00       	call   3882 <exit>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     b62:	83 ec 08             	sub    $0x8,%esp
     b65:	68 25 45 00 00       	push   $0x4525
     b6a:	6a 01                	push   $0x1
     b6c:	e8 7f 2e 00 00       	call   39f0 <printf>
    exit();
     b71:	e8 0c 2d 00 00       	call   3882 <exit>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     b76:	83 ec 08             	sub    $0x8,%esp
     b79:	68 71 45 00 00       	push   $0x4571
     b7e:	6a 01                	push   $0x1
     b80:	e8 6b 2e 00 00       	call   39f0 <printf>
    exit();
     b85:	e8 f8 2c 00 00       	call   3882 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     b8a:	83 ec 08             	sub    $0x8,%esp
     b8d:	68 34 45 00 00       	push   $0x4534
     b92:	6a 01                	push   $0x1
     b94:	e8 57 2e 00 00       	call   39f0 <printf>
        exit();
     b99:	e8 e4 2c 00 00       	call   3882 <exit>
     b9e:	66 90                	xchg   %ax,%ax

00000ba0 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	57                   	push   %edi
     ba4:	56                   	push   %esi
     ba5:	53                   	push   %ebx
     ba6:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     ba9:	68 80 45 00 00       	push   $0x4580
     bae:	6a 01                	push   $0x1
     bb0:	e8 3b 2e 00 00       	call   39f0 <printf>
  pid1 = fork();
     bb5:	e8 c0 2c 00 00       	call   387a <fork>
  if(pid1 == 0)
     bba:	83 c4 10             	add    $0x10,%esp
     bbd:	85 c0                	test   %eax,%eax
     bbf:	75 02                	jne    bc3 <preempt+0x23>
     bc1:	eb fe                	jmp    bc1 <preempt+0x21>
     bc3:	89 c7                	mov    %eax,%edi
    for(;;)
      ;

  pid2 = fork();
     bc5:	e8 b0 2c 00 00       	call   387a <fork>
  if(pid2 == 0)
     bca:	85 c0                	test   %eax,%eax
  pid1 = fork();
  if(pid1 == 0)
    for(;;)
      ;

  pid2 = fork();
     bcc:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     bce:	75 02                	jne    bd2 <preempt+0x32>
     bd0:	eb fe                	jmp    bd0 <preempt+0x30>
    for(;;)
      ;

  pipe(pfds);
     bd2:	8d 45 e0             	lea    -0x20(%ebp),%eax
     bd5:	83 ec 0c             	sub    $0xc,%esp
     bd8:	50                   	push   %eax
     bd9:	e8 b4 2c 00 00       	call   3892 <pipe>
  pid3 = fork();
     bde:	e8 97 2c 00 00       	call   387a <fork>
  if(pid3 == 0){
     be3:	83 c4 10             	add    $0x10,%esp
     be6:	85 c0                	test   %eax,%eax
  if(pid2 == 0)
    for(;;)
      ;

  pipe(pfds);
  pid3 = fork();
     be8:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     bea:	75 47                	jne    c33 <preempt+0x93>
    close(pfds[0]);
     bec:	83 ec 0c             	sub    $0xc,%esp
     bef:	ff 75 e0             	pushl  -0x20(%ebp)
     bf2:	e8 b3 2c 00 00       	call   38aa <close>
    if(write(pfds[1], "x", 1) != 1)
     bf7:	83 c4 0c             	add    $0xc,%esp
     bfa:	6a 01                	push   $0x1
     bfc:	68 45 4b 00 00       	push   $0x4b45
     c01:	ff 75 e4             	pushl  -0x1c(%ebp)
     c04:	e8 99 2c 00 00       	call   38a2 <write>
     c09:	83 c4 10             	add    $0x10,%esp
     c0c:	83 f8 01             	cmp    $0x1,%eax
     c0f:	74 12                	je     c23 <preempt+0x83>
      printf(1, "preempt write error");
     c11:	83 ec 08             	sub    $0x8,%esp
     c14:	68 8a 45 00 00       	push   $0x458a
     c19:	6a 01                	push   $0x1
     c1b:	e8 d0 2d 00 00       	call   39f0 <printf>
     c20:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c23:	83 ec 0c             	sub    $0xc,%esp
     c26:	ff 75 e4             	pushl  -0x1c(%ebp)
     c29:	e8 7c 2c 00 00       	call   38aa <close>
     c2e:	83 c4 10             	add    $0x10,%esp
     c31:	eb fe                	jmp    c31 <preempt+0x91>
    for(;;)
      ;
  }

  close(pfds[1]);
     c33:	83 ec 0c             	sub    $0xc,%esp
     c36:	ff 75 e4             	pushl  -0x1c(%ebp)
     c39:	e8 6c 2c 00 00       	call   38aa <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c3e:	83 c4 0c             	add    $0xc,%esp
     c41:	68 00 20 00 00       	push   $0x2000
     c46:	68 20 8c 00 00       	push   $0x8c20
     c4b:	ff 75 e0             	pushl  -0x20(%ebp)
     c4e:	e8 47 2c 00 00       	call   389a <read>
     c53:	83 c4 10             	add    $0x10,%esp
     c56:	83 f8 01             	cmp    $0x1,%eax
     c59:	74 1a                	je     c75 <preempt+0xd5>
    printf(1, "preempt read error");
     c5b:	83 ec 08             	sub    $0x8,%esp
     c5e:	68 9e 45 00 00       	push   $0x459e
     c63:	6a 01                	push   $0x1
     c65:	e8 86 2d 00 00       	call   39f0 <printf>
    return;
     c6a:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     c6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c70:	5b                   	pop    %ebx
     c71:	5e                   	pop    %esi
     c72:	5f                   	pop    %edi
     c73:	5d                   	pop    %ebp
     c74:	c3                   	ret    
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     c75:	83 ec 0c             	sub    $0xc,%esp
     c78:	ff 75 e0             	pushl  -0x20(%ebp)
     c7b:	e8 2a 2c 00 00       	call   38aa <close>
  printf(1, "kill... ");
     c80:	58                   	pop    %eax
     c81:	5a                   	pop    %edx
     c82:	68 b1 45 00 00       	push   $0x45b1
     c87:	6a 01                	push   $0x1
     c89:	e8 62 2d 00 00       	call   39f0 <printf>
  kill(pid1);
     c8e:	89 3c 24             	mov    %edi,(%esp)
     c91:	e8 1c 2c 00 00       	call   38b2 <kill>
  kill(pid2);
     c96:	89 34 24             	mov    %esi,(%esp)
     c99:	e8 14 2c 00 00       	call   38b2 <kill>
  kill(pid3);
     c9e:	89 1c 24             	mov    %ebx,(%esp)
     ca1:	e8 0c 2c 00 00       	call   38b2 <kill>
  printf(1, "wait... ");
     ca6:	59                   	pop    %ecx
     ca7:	5b                   	pop    %ebx
     ca8:	68 ba 45 00 00       	push   $0x45ba
     cad:	6a 01                	push   $0x1
     caf:	e8 3c 2d 00 00       	call   39f0 <printf>
  wait();
     cb4:	e8 d1 2b 00 00       	call   388a <wait>
  wait();
     cb9:	e8 cc 2b 00 00       	call   388a <wait>
  wait();
     cbe:	e8 c7 2b 00 00       	call   388a <wait>
  printf(1, "preempt ok\n");
     cc3:	5e                   	pop    %esi
     cc4:	5f                   	pop    %edi
     cc5:	68 c3 45 00 00       	push   $0x45c3
     cca:	6a 01                	push   $0x1
     ccc:	e8 1f 2d 00 00       	call   39f0 <printf>
     cd1:	83 c4 10             	add    $0x10,%esp
     cd4:	eb 97                	jmp    c6d <preempt+0xcd>
     cd6:	8d 76 00             	lea    0x0(%esi),%esi
     cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ce0 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	56                   	push   %esi
     ce4:	be 64 00 00 00       	mov    $0x64,%esi
     ce9:	53                   	push   %ebx
     cea:	eb 14                	jmp    d00 <exitwait+0x20>
     cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     cf0:	74 6f                	je     d61 <exitwait+0x81>
      if(wait() != pid){
     cf2:	e8 93 2b 00 00       	call   388a <wait>
     cf7:	39 c3                	cmp    %eax,%ebx
     cf9:	75 2d                	jne    d28 <exitwait+0x48>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     cfb:	83 ee 01             	sub    $0x1,%esi
     cfe:	74 48                	je     d48 <exitwait+0x68>
    pid = fork();
     d00:	e8 75 2b 00 00       	call   387a <fork>
    if(pid < 0){
     d05:	85 c0                	test   %eax,%eax
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork();
     d07:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d09:	79 e5                	jns    cf0 <exitwait+0x10>
      printf(1, "fork failed\n");
     d0b:	83 ec 08             	sub    $0x8,%esp
     d0e:	68 2d 51 00 00       	push   $0x512d
     d13:	6a 01                	push   $0x1
     d15:	e8 d6 2c 00 00       	call   39f0 <printf>
      return;
     d1a:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d1d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d20:	5b                   	pop    %ebx
     d21:	5e                   	pop    %esi
     d22:	5d                   	pop    %ebp
     d23:	c3                   	ret    
     d24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
     d28:	83 ec 08             	sub    $0x8,%esp
     d2b:	68 cf 45 00 00       	push   $0x45cf
     d30:	6a 01                	push   $0x1
     d32:	e8 b9 2c 00 00       	call   39f0 <printf>
        return;
     d37:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d3d:	5b                   	pop    %ebx
     d3e:	5e                   	pop    %esi
     d3f:	5d                   	pop    %ebp
     d40:	c3                   	ret    
     d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     d48:	83 ec 08             	sub    $0x8,%esp
     d4b:	68 df 45 00 00       	push   $0x45df
     d50:	6a 01                	push   $0x1
     d52:	e8 99 2c 00 00       	call   39f0 <printf>
     d57:	83 c4 10             	add    $0x10,%esp
}
     d5a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d5d:	5b                   	pop    %ebx
     d5e:	5e                   	pop    %esi
     d5f:	5d                   	pop    %ebp
     d60:	c3                   	ret    
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit();
     d61:	e8 1c 2b 00 00       	call   3882 <exit>
     d66:	8d 76 00             	lea    0x0(%esi),%esi
     d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d70 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	57                   	push   %edi
     d74:	56                   	push   %esi
     d75:	53                   	push   %ebx
     d76:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     d79:	68 ec 45 00 00       	push   $0x45ec
     d7e:	6a 01                	push   $0x1
     d80:	e8 6b 2c 00 00       	call   39f0 <printf>
  ppid = getpid();
     d85:	e8 78 2b 00 00       	call   3902 <getpid>
     d8a:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     d8c:	e8 e9 2a 00 00       	call   387a <fork>
     d91:	83 c4 10             	add    $0x10,%esp
     d94:	85 c0                	test   %eax,%eax
     d96:	75 70                	jne    e08 <mem+0x98>
     d98:	31 db                	xor    %ebx,%ebx
     d9a:	eb 08                	jmp    da4 <mem+0x34>
     d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
     da0:	89 18                	mov    %ebx,(%eax)
     da2:	89 c3                	mov    %eax,%ebx

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     da4:	83 ec 0c             	sub    $0xc,%esp
     da7:	68 11 27 00 00       	push   $0x2711
     dac:	e8 6f 2e 00 00       	call   3c20 <malloc>
     db1:	83 c4 10             	add    $0x10,%esp
     db4:	85 c0                	test   %eax,%eax
     db6:	75 e8                	jne    da0 <mem+0x30>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     db8:	85 db                	test   %ebx,%ebx
     dba:	74 18                	je     dd4 <mem+0x64>
     dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     dc0:	8b 3b                	mov    (%ebx),%edi
      free(m1);
     dc2:	83 ec 0c             	sub    $0xc,%esp
     dc5:	53                   	push   %ebx
     dc6:	89 fb                	mov    %edi,%ebx
     dc8:	e8 c3 2d 00 00       	call   3b90 <free>
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     dcd:	83 c4 10             	add    $0x10,%esp
     dd0:	85 db                	test   %ebx,%ebx
     dd2:	75 ec                	jne    dc0 <mem+0x50>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     dd4:	83 ec 0c             	sub    $0xc,%esp
     dd7:	68 00 50 00 00       	push   $0x5000
     ddc:	e8 3f 2e 00 00       	call   3c20 <malloc>
    if(m1 == 0){
     de1:	83 c4 10             	add    $0x10,%esp
     de4:	85 c0                	test   %eax,%eax
     de6:	74 30                	je     e18 <mem+0xa8>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     de8:	83 ec 0c             	sub    $0xc,%esp
     deb:	50                   	push   %eax
     dec:	e8 9f 2d 00 00       	call   3b90 <free>
    printf(1, "mem ok\n");
     df1:	58                   	pop    %eax
     df2:	5a                   	pop    %edx
     df3:	68 10 46 00 00       	push   $0x4610
     df8:	6a 01                	push   $0x1
     dfa:	e8 f1 2b 00 00       	call   39f0 <printf>
    exit();
     dff:	e8 7e 2a 00 00       	call   3882 <exit>
     e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    wait();
  }
}
     e08:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e0b:	5b                   	pop    %ebx
     e0c:	5e                   	pop    %esi
     e0d:	5f                   	pop    %edi
     e0e:	5d                   	pop    %ebp
    }
    free(m1);
    printf(1, "mem ok\n");
    exit();
  } else {
    wait();
     e0f:	e9 76 2a 00 00       	jmp    388a <wait>
     e14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     e18:	83 ec 08             	sub    $0x8,%esp
     e1b:	68 f6 45 00 00       	push   $0x45f6
     e20:	6a 01                	push   $0x1
     e22:	e8 c9 2b 00 00       	call   39f0 <printf>
      kill(ppid);
     e27:	89 34 24             	mov    %esi,(%esp)
     e2a:	e8 83 2a 00 00       	call   38b2 <kill>
      exit();
     e2f:	e8 4e 2a 00 00       	call   3882 <exit>
     e34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000e40 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
     e45:	53                   	push   %ebx
     e46:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     e49:	68 18 46 00 00       	push   $0x4618
     e4e:	6a 01                	push   $0x1
     e50:	e8 9b 2b 00 00       	call   39f0 <printf>

  unlink("sharedfd");
     e55:	c7 04 24 27 46 00 00 	movl   $0x4627,(%esp)
     e5c:	e8 71 2a 00 00       	call   38d2 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e61:	5b                   	pop    %ebx
     e62:	5e                   	pop    %esi
     e63:	68 02 02 00 00       	push   $0x202
     e68:	68 27 46 00 00       	push   $0x4627
     e6d:	e8 50 2a 00 00       	call   38c2 <open>
  if(fd < 0){
     e72:	83 c4 10             	add    $0x10,%esp
     e75:	85 c0                	test   %eax,%eax
     e77:	0f 88 29 01 00 00    	js     fa6 <sharedfd+0x166>
     e7d:	89 c7                	mov    %eax,%edi
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e7f:	8d 75 de             	lea    -0x22(%ebp),%esi
     e82:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     e87:	e8 ee 29 00 00       	call   387a <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e8c:	83 f8 01             	cmp    $0x1,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     e8f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e92:	19 c0                	sbb    %eax,%eax
     e94:	83 ec 04             	sub    $0x4,%esp
     e97:	83 e0 f3             	and    $0xfffffff3,%eax
     e9a:	6a 0a                	push   $0xa
     e9c:	83 c0 70             	add    $0x70,%eax
     e9f:	50                   	push   %eax
     ea0:	56                   	push   %esi
     ea1:	e8 4a 28 00 00       	call   36f0 <memset>
     ea6:	83 c4 10             	add    $0x10,%esp
     ea9:	eb 0a                	jmp    eb5 <sharedfd+0x75>
     eab:	90                   	nop
     eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
     eb0:	83 eb 01             	sub    $0x1,%ebx
     eb3:	74 26                	je     edb <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     eb5:	83 ec 04             	sub    $0x4,%esp
     eb8:	6a 0a                	push   $0xa
     eba:	56                   	push   %esi
     ebb:	57                   	push   %edi
     ebc:	e8 e1 29 00 00       	call   38a2 <write>
     ec1:	83 c4 10             	add    $0x10,%esp
     ec4:	83 f8 0a             	cmp    $0xa,%eax
     ec7:	74 e7                	je     eb0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     ec9:	83 ec 08             	sub    $0x8,%esp
     ecc:	68 18 53 00 00       	push   $0x5318
     ed1:	6a 01                	push   $0x1
     ed3:	e8 18 2b 00 00       	call   39f0 <printf>
      break;
     ed8:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
     edb:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     ede:	85 c9                	test   %ecx,%ecx
     ee0:	0f 84 f4 00 00 00    	je     fda <sharedfd+0x19a>
    exit();
  else
    wait();
     ee6:	e8 9f 29 00 00       	call   388a <wait>
  close(fd);
     eeb:	83 ec 0c             	sub    $0xc,%esp
     eee:	31 db                	xor    %ebx,%ebx
     ef0:	57                   	push   %edi
     ef1:	8d 7d e8             	lea    -0x18(%ebp),%edi
     ef4:	e8 b1 29 00 00       	call   38aa <close>
  fd = open("sharedfd", 0);
     ef9:	58                   	pop    %eax
     efa:	5a                   	pop    %edx
     efb:	6a 00                	push   $0x0
     efd:	68 27 46 00 00       	push   $0x4627
     f02:	e8 bb 29 00 00       	call   38c2 <open>
  if(fd < 0){
     f07:	83 c4 10             	add    $0x10,%esp
     f0a:	31 d2                	xor    %edx,%edx
     f0c:	85 c0                	test   %eax,%eax
  if(pid == 0)
    exit();
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
     f0e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     f11:	0f 88 a9 00 00 00    	js     fc0 <sharedfd+0x180>
     f17:	89 f6                	mov    %esi,%esi
     f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f20:	83 ec 04             	sub    $0x4,%esp
     f23:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f26:	6a 0a                	push   $0xa
     f28:	56                   	push   %esi
     f29:	ff 75 d0             	pushl  -0x30(%ebp)
     f2c:	e8 69 29 00 00       	call   389a <read>
     f31:	83 c4 10             	add    $0x10,%esp
     f34:	85 c0                	test   %eax,%eax
     f36:	7e 27                	jle    f5f <sharedfd+0x11f>
     f38:	89 f0                	mov    %esi,%eax
     f3a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f3d:	eb 13                	jmp    f52 <sharedfd+0x112>
     f3f:	90                   	nop
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
        np++;
     f40:	80 f9 70             	cmp    $0x70,%cl
     f43:	0f 94 c1             	sete   %cl
     f46:	0f b6 c9             	movzbl %cl,%ecx
     f49:	01 cb                	add    %ecx,%ebx
     f4b:	83 c0 01             	add    $0x1,%eax
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     f4e:	39 c7                	cmp    %eax,%edi
     f50:	74 ce                	je     f20 <sharedfd+0xe0>
      if(buf[i] == 'c')
     f52:	0f b6 08             	movzbl (%eax),%ecx
     f55:	80 f9 63             	cmp    $0x63,%cl
     f58:	75 e6                	jne    f40 <sharedfd+0x100>
        nc++;
     f5a:	83 c2 01             	add    $0x1,%edx
     f5d:	eb ec                	jmp    f4b <sharedfd+0x10b>
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     f5f:	83 ec 0c             	sub    $0xc,%esp
     f62:	ff 75 d0             	pushl  -0x30(%ebp)
     f65:	e8 40 29 00 00       	call   38aa <close>
  unlink("sharedfd");
     f6a:	c7 04 24 27 46 00 00 	movl   $0x4627,(%esp)
     f71:	e8 5c 29 00 00       	call   38d2 <unlink>
  if(nc == 10000 && np == 10000){
     f76:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f79:	83 c4 10             	add    $0x10,%esp
     f7c:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     f82:	75 5b                	jne    fdf <sharedfd+0x19f>
     f84:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     f8a:	75 53                	jne    fdf <sharedfd+0x19f>
    printf(1, "sharedfd ok\n");
     f8c:	83 ec 08             	sub    $0x8,%esp
     f8f:	68 30 46 00 00       	push   $0x4630
     f94:	6a 01                	push   $0x1
     f96:	e8 55 2a 00 00       	call   39f0 <printf>
     f9b:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     f9e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fa1:	5b                   	pop    %ebx
     fa2:	5e                   	pop    %esi
     fa3:	5f                   	pop    %edi
     fa4:	5d                   	pop    %ebp
     fa5:	c3                   	ret    
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
     fa6:	83 ec 08             	sub    $0x8,%esp
     fa9:	68 ec 52 00 00       	push   $0x52ec
     fae:	6a 01                	push   $0x1
     fb0:	e8 3b 2a 00 00       	call   39f0 <printf>
    return;
     fb5:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fb8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fbb:	5b                   	pop    %ebx
     fbc:	5e                   	pop    %esi
     fbd:	5f                   	pop    %edi
     fbe:	5d                   	pop    %ebp
     fbf:	c3                   	ret    
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
     fc0:	83 ec 08             	sub    $0x8,%esp
     fc3:	68 38 53 00 00       	push   $0x5338
     fc8:	6a 01                	push   $0x1
     fca:	e8 21 2a 00 00       	call   39f0 <printf>
    return;
     fcf:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fd2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fd5:	5b                   	pop    %ebx
     fd6:	5e                   	pop    %esi
     fd7:	5f                   	pop    %edi
     fd8:	5d                   	pop    %ebp
     fd9:	c3                   	ret    
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
    exit();
     fda:	e8 a3 28 00 00       	call   3882 <exit>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     fdf:	53                   	push   %ebx
     fe0:	52                   	push   %edx
     fe1:	68 3d 46 00 00       	push   $0x463d
     fe6:	6a 01                	push   $0x1
     fe8:	e8 03 2a 00 00       	call   39f0 <printf>
    exit();
     fed:	e8 90 28 00 00       	call   3882 <exit>
     ff2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ff9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001000 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	57                   	push   %edi
    1004:	56                   	push   %esi
    1005:	53                   	push   %ebx
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
    1006:	be 52 46 00 00       	mov    $0x4652,%esi

  for(pi = 0; pi < 4; pi++){
    100b:	31 db                	xor    %ebx,%ebx

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    100d:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1010:	c7 45 d8 52 46 00 00 	movl   $0x4652,-0x28(%ebp)
    1017:	c7 45 dc 9b 47 00 00 	movl   $0x479b,-0x24(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    101e:	68 58 46 00 00       	push   $0x4658
    1023:	6a 01                	push   $0x1
// time, to test block allocation.
void
fourfiles(void)
{
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1025:	c7 45 e0 9f 47 00 00 	movl   $0x479f,-0x20(%ebp)
    102c:	c7 45 e4 55 46 00 00 	movl   $0x4655,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    1033:	e8 b8 29 00 00       	call   39f0 <printf>
    1038:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    fname = names[pi];
    unlink(fname);
    103b:	83 ec 0c             	sub    $0xc,%esp
    103e:	56                   	push   %esi
    103f:	e8 8e 28 00 00       	call   38d2 <unlink>

    pid = fork();
    1044:	e8 31 28 00 00       	call   387a <fork>
    if(pid < 0){
    1049:	83 c4 10             	add    $0x10,%esp
    104c:	85 c0                	test   %eax,%eax
    104e:	0f 88 83 01 00 00    	js     11d7 <fourfiles+0x1d7>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1054:	0f 84 e3 00 00 00    	je     113d <fourfiles+0x13d>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    105a:	83 c3 01             	add    $0x1,%ebx
    105d:	83 fb 04             	cmp    $0x4,%ebx
    1060:	74 06                	je     1068 <fourfiles+0x68>
    1062:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    1066:	eb d3                	jmp    103b <fourfiles+0x3b>
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    1068:	e8 1d 28 00 00       	call   388a <wait>
    106d:	bf 30 00 00 00       	mov    $0x30,%edi
    1072:	e8 13 28 00 00       	call   388a <wait>
    1077:	e8 0e 28 00 00       	call   388a <wait>
    107c:	e8 09 28 00 00       	call   388a <wait>
    1081:	c7 45 d4 52 46 00 00 	movl   $0x4652,-0x2c(%ebp)
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    1088:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    108b:	31 db                	xor    %ebx,%ebx
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    108d:	6a 00                	push   $0x0
    108f:	ff 75 d4             	pushl  -0x2c(%ebp)
    1092:	e8 2b 28 00 00       	call   38c2 <open>
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    1097:	83 c4 10             	add    $0x10,%esp
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    109a:	89 c6                	mov    %eax,%esi
    109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	68 00 20 00 00       	push   $0x2000
    10a8:	68 20 8c 00 00       	push   $0x8c20
    10ad:	56                   	push   %esi
    10ae:	e8 e7 27 00 00       	call   389a <read>
    10b3:	83 c4 10             	add    $0x10,%esp
    10b6:	85 c0                	test   %eax,%eax
    10b8:	7e 1c                	jle    10d6 <fourfiles+0xd6>
    10ba:	31 d2                	xor    %edx,%edx
    10bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
    10c0:	0f be 8a 20 8c 00 00 	movsbl 0x8c20(%edx),%ecx
    10c7:	39 cf                	cmp    %ecx,%edi
    10c9:	75 5e                	jne    1129 <fourfiles+0x129>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    10cb:	83 c2 01             	add    $0x1,%edx
    10ce:	39 d0                	cmp    %edx,%eax
    10d0:	75 ee                	jne    10c0 <fourfiles+0xc0>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    10d2:	01 c3                	add    %eax,%ebx
    10d4:	eb ca                	jmp    10a0 <fourfiles+0xa0>
    }
    close(fd);
    10d6:	83 ec 0c             	sub    $0xc,%esp
    10d9:	56                   	push   %esi
    10da:	e8 cb 27 00 00       	call   38aa <close>
    if(total != 12*500){
    10df:	83 c4 10             	add    $0x10,%esp
    10e2:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    10e8:	0f 85 d4 00 00 00    	jne    11c2 <fourfiles+0x1c2>
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
    10ee:	83 ec 0c             	sub    $0xc,%esp
    10f1:	ff 75 d4             	pushl  -0x2c(%ebp)
    10f4:	83 c7 01             	add    $0x1,%edi
    10f7:	e8 d6 27 00 00       	call   38d2 <unlink>

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    10fc:	83 c4 10             	add    $0x10,%esp
    10ff:	83 ff 32             	cmp    $0x32,%edi
    1102:	75 1a                	jne    111e <fourfiles+0x11e>
      exit();
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    1104:	83 ec 08             	sub    $0x8,%esp
    1107:	68 96 46 00 00       	push   $0x4696
    110c:	6a 01                	push   $0x1
    110e:	e8 dd 28 00 00       	call   39f0 <printf>
}
    1113:	83 c4 10             	add    $0x10,%esp
    1116:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1119:	5b                   	pop    %ebx
    111a:	5e                   	pop    %esi
    111b:	5f                   	pop    %edi
    111c:	5d                   	pop    %ebp
    111d:	c3                   	ret    
    111e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1121:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1124:	e9 5f ff ff ff       	jmp    1088 <fourfiles+0x88>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
    1129:	83 ec 08             	sub    $0x8,%esp
    112c:	68 79 46 00 00       	push   $0x4679
    1131:	6a 01                	push   $0x1
    1133:	e8 b8 28 00 00       	call   39f0 <printf>
          exit();
    1138:	e8 45 27 00 00       	call   3882 <exit>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    113d:	83 ec 08             	sub    $0x8,%esp
    1140:	68 02 02 00 00       	push   $0x202
    1145:	56                   	push   %esi
    1146:	e8 77 27 00 00       	call   38c2 <open>
      if(fd < 0){
    114b:	83 c4 10             	add    $0x10,%esp
    114e:	85 c0                	test   %eax,%eax
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    1150:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    1152:	78 5a                	js     11ae <fourfiles+0x1ae>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
    1154:	83 ec 04             	sub    $0x4,%esp
    1157:	83 c3 30             	add    $0x30,%ebx
    115a:	68 00 02 00 00       	push   $0x200
    115f:	53                   	push   %ebx
    1160:	bb 0c 00 00 00       	mov    $0xc,%ebx
    1165:	68 20 8c 00 00       	push   $0x8c20
    116a:	e8 81 25 00 00       	call   36f0 <memset>
    116f:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
    1172:	83 ec 04             	sub    $0x4,%esp
    1175:	68 f4 01 00 00       	push   $0x1f4
    117a:	68 20 8c 00 00       	push   $0x8c20
    117f:	56                   	push   %esi
    1180:	e8 1d 27 00 00       	call   38a2 <write>
    1185:	83 c4 10             	add    $0x10,%esp
    1188:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    118d:	75 0a                	jne    1199 <fourfiles+0x199>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    118f:	83 eb 01             	sub    $0x1,%ebx
    1192:	75 de                	jne    1172 <fourfiles+0x172>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit();
        }
      }
      exit();
    1194:	e8 e9 26 00 00       	call   3882 <exit>
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
    1199:	83 ec 04             	sub    $0x4,%esp
    119c:	50                   	push   %eax
    119d:	68 68 46 00 00       	push   $0x4668
    11a2:	6a 01                	push   $0x1
    11a4:	e8 47 28 00 00       	call   39f0 <printf>
          exit();
    11a9:	e8 d4 26 00 00       	call   3882 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
    11ae:	83 ec 08             	sub    $0x8,%esp
    11b1:	68 f3 48 00 00       	push   $0x48f3
    11b6:	6a 01                	push   $0x1
    11b8:	e8 33 28 00 00       	call   39f0 <printf>
        exit();
    11bd:	e8 c0 26 00 00       	call   3882 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
    11c2:	83 ec 04             	sub    $0x4,%esp
    11c5:	53                   	push   %ebx
    11c6:	68 85 46 00 00       	push   $0x4685
    11cb:	6a 01                	push   $0x1
    11cd:	e8 1e 28 00 00       	call   39f0 <printf>
      exit();
    11d2:	e8 ab 26 00 00       	call   3882 <exit>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    11d7:	83 ec 08             	sub    $0x8,%esp
    11da:	68 2d 51 00 00       	push   $0x512d
    11df:	6a 01                	push   $0x1
    11e1:	e8 0a 28 00 00       	call   39f0 <printf>
      exit();
    11e6:	e8 97 26 00 00       	call   3882 <exit>
    11eb:	90                   	nop
    11ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011f0 <createdelete>:
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	57                   	push   %edi
    11f4:	56                   	push   %esi
    11f5:	53                   	push   %ebx
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    11f6:	31 db                	xor    %ebx,%ebx
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    11f8:	83 ec 44             	sub    $0x44,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    11fb:	68 a4 46 00 00       	push   $0x46a4
    1200:	6a 01                	push   $0x1
    1202:	e8 e9 27 00 00       	call   39f0 <printf>
    1207:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    120a:	e8 6b 26 00 00       	call   387a <fork>
    if(pid < 0){
    120f:	85 c0                	test   %eax,%eax
    1211:	0f 88 b7 01 00 00    	js     13ce <createdelete+0x1de>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1217:	0f 84 f6 00 00 00    	je     1313 <createdelete+0x123>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    121d:	83 c3 01             	add    $0x1,%ebx
    1220:	83 fb 04             	cmp    $0x4,%ebx
    1223:	75 e5                	jne    120a <createdelete+0x1a>
    1225:	8d 7d c8             	lea    -0x38(%ebp),%edi
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    1228:	31 f6                	xor    %esi,%esi
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    122a:	e8 5b 26 00 00       	call   388a <wait>
    122f:	e8 56 26 00 00       	call   388a <wait>
    1234:	e8 51 26 00 00       	call   388a <wait>
    1239:	e8 4c 26 00 00       	call   388a <wait>
  }

  name[0] = name[1] = name[2] = 0;
    123e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1248:	8d 46 30             	lea    0x30(%esi),%eax
    124b:	83 fe 09             	cmp    $0x9,%esi
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
    124e:	bb 70 00 00 00       	mov    $0x70,%ebx
    1253:	0f 9f c2             	setg   %dl
    1256:	85 f6                	test   %esi,%esi
    1258:	88 45 c7             	mov    %al,-0x39(%ebp)
    125b:	0f 94 c0             	sete   %al
    125e:	09 c2                	or     %eax,%edx
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1260:	8d 46 ff             	lea    -0x1(%esi),%eax
    1263:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    1266:	89 45 c0             	mov    %eax,-0x40(%ebp)

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1269:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    126d:	83 ec 08             	sub    $0x8,%esp
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
    1270:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
      fd = open(name, 0);
    1273:	6a 00                	push   $0x0
    1275:	57                   	push   %edi

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1276:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1279:	e8 44 26 00 00       	call   38c2 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    127e:	89 c1                	mov    %eax,%ecx
    1280:	83 c4 10             	add    $0x10,%esp
    1283:	c1 e9 1f             	shr    $0x1f,%ecx
    1286:	84 c9                	test   %cl,%cl
    1288:	74 0a                	je     1294 <createdelete+0xa4>
    128a:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    128e:	0f 85 11 01 00 00    	jne    13a5 <createdelete+0x1b5>
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1294:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    1298:	0f 86 44 01 00 00    	jbe    13e2 <createdelete+0x1f2>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
    129e:	85 c0                	test   %eax,%eax
    12a0:	78 0c                	js     12ae <createdelete+0xbe>
        close(fd);
    12a2:	83 ec 0c             	sub    $0xc,%esp
    12a5:	50                   	push   %eax
    12a6:	e8 ff 25 00 00       	call   38aa <close>
    12ab:	83 c4 10             	add    $0x10,%esp
    12ae:	83 c3 01             	add    $0x1,%ebx
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    12b1:	80 fb 74             	cmp    $0x74,%bl
    12b4:	75 b3                	jne    1269 <createdelete+0x79>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    12b6:	83 c6 01             	add    $0x1,%esi
    12b9:	83 fe 14             	cmp    $0x14,%esi
    12bc:	75 8a                	jne    1248 <createdelete+0x58>
    12be:	be 70 00 00 00       	mov    $0x70,%esi
    12c3:	90                   	nop
    12c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12c8:	8d 46 c0             	lea    -0x40(%esi),%eax
    12cb:	bb 04 00 00 00       	mov    $0x4,%ebx
    12d0:	88 45 c7             	mov    %al,-0x39(%ebp)
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    12d3:	89 f0                	mov    %esi,%eax
      name[1] = '0' + i;
      unlink(name);
    12d5:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    12d8:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    12db:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    12df:	57                   	push   %edi
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
      name[1] = '0' + i;
    12e0:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    12e3:	e8 ea 25 00 00       	call   38d2 <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    12e8:	83 c4 10             	add    $0x10,%esp
    12eb:	83 eb 01             	sub    $0x1,%ebx
    12ee:	75 e3                	jne    12d3 <createdelete+0xe3>
    12f0:	83 c6 01             	add    $0x1,%esi
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    12f3:	89 f0                	mov    %esi,%eax
    12f5:	3c 84                	cmp    $0x84,%al
    12f7:	75 cf                	jne    12c8 <createdelete+0xd8>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    12f9:	83 ec 08             	sub    $0x8,%esp
    12fc:	68 b7 46 00 00       	push   $0x46b7
    1301:	6a 01                	push   $0x1
    1303:	e8 e8 26 00 00       	call   39f0 <printf>
}
    1308:	83 c4 10             	add    $0x10,%esp
    130b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    130e:	5b                   	pop    %ebx
    130f:	5e                   	pop    %esi
    1310:	5f                   	pop    %edi
    1311:	5d                   	pop    %ebp
    1312:	c3                   	ret    
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    1313:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    1316:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    131a:	be 01 00 00 00       	mov    $0x1,%esi
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    131f:	88 5d c8             	mov    %bl,-0x38(%ebp)
    1322:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    1325:	31 db                	xor    %ebx,%ebx
    1327:	eb 12                	jmp    133b <createdelete+0x14b>
    1329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1330:	83 fe 14             	cmp    $0x14,%esi
    1333:	74 6b                	je     13a0 <createdelete+0x1b0>
    1335:	83 c3 01             	add    $0x1,%ebx
    1338:	83 c6 01             	add    $0x1,%esi
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
    133b:	83 ec 08             	sub    $0x8,%esp

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    133e:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    1341:	68 02 02 00 00       	push   $0x202
    1346:	57                   	push   %edi

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    1347:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    134a:	e8 73 25 00 00       	call   38c2 <open>
        if(fd < 0){
    134f:	83 c4 10             	add    $0x10,%esp
    1352:	85 c0                	test   %eax,%eax
    1354:	78 64                	js     13ba <createdelete+0x1ca>
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
    1356:	83 ec 0c             	sub    $0xc,%esp
    1359:	50                   	push   %eax
    135a:	e8 4b 25 00 00       	call   38aa <close>
        if(i > 0 && (i % 2 ) == 0){
    135f:	83 c4 10             	add    $0x10,%esp
    1362:	85 db                	test   %ebx,%ebx
    1364:	74 cf                	je     1335 <createdelete+0x145>
    1366:	f6 c3 01             	test   $0x1,%bl
    1369:	75 c5                	jne    1330 <createdelete+0x140>
          name[1] = '0' + (i / 2);
          if(unlink(name) < 0){
    136b:	83 ec 0c             	sub    $0xc,%esp
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    136e:	89 d8                	mov    %ebx,%eax
    1370:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    1372:	57                   	push   %edi
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    1373:	83 c0 30             	add    $0x30,%eax
    1376:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1379:	e8 54 25 00 00       	call   38d2 <unlink>
    137e:	83 c4 10             	add    $0x10,%esp
    1381:	85 c0                	test   %eax,%eax
    1383:	79 ab                	jns    1330 <createdelete+0x140>
            printf(1, "unlink failed\n");
    1385:	83 ec 08             	sub    $0x8,%esp
    1388:	68 a5 42 00 00       	push   $0x42a5
    138d:	6a 01                	push   $0x1
    138f:	e8 5c 26 00 00       	call   39f0 <printf>
            exit();
    1394:	e8 e9 24 00 00       	call   3882 <exit>
    1399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          }
        }
      }
      exit();
    13a0:	e8 dd 24 00 00       	call   3882 <exit>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
    13a5:	83 ec 04             	sub    $0x4,%esp
    13a8:	57                   	push   %edi
    13a9:	68 64 53 00 00       	push   $0x5364
    13ae:	6a 01                	push   $0x1
    13b0:	e8 3b 26 00 00       	call   39f0 <printf>
        exit();
    13b5:	e8 c8 24 00 00       	call   3882 <exit>
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    13ba:	83 ec 08             	sub    $0x8,%esp
    13bd:	68 f3 48 00 00       	push   $0x48f3
    13c2:	6a 01                	push   $0x1
    13c4:	e8 27 26 00 00       	call   39f0 <printf>
          exit();
    13c9:	e8 b4 24 00 00       	call   3882 <exit>
  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    13ce:	83 ec 08             	sub    $0x8,%esp
    13d1:	68 2d 51 00 00       	push   $0x512d
    13d6:	6a 01                	push   $0x1
    13d8:	e8 13 26 00 00       	call   39f0 <printf>
      exit();
    13dd:	e8 a0 24 00 00       	call   3882 <exit>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    13e2:	85 c0                	test   %eax,%eax
    13e4:	0f 88 c4 fe ff ff    	js     12ae <createdelete+0xbe>
        printf(1, "oops createdelete %s did exist\n", name);
    13ea:	83 ec 04             	sub    $0x4,%esp
    13ed:	57                   	push   %edi
    13ee:	68 88 53 00 00       	push   $0x5388
    13f3:	6a 01                	push   $0x1
    13f5:	e8 f6 25 00 00       	call   39f0 <printf>
        exit();
    13fa:	e8 83 24 00 00       	call   3882 <exit>
    13ff:	90                   	nop

00001400 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1400:	55                   	push   %ebp
    1401:	89 e5                	mov    %esp,%ebp
    1403:	56                   	push   %esi
    1404:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1405:	83 ec 08             	sub    $0x8,%esp
    1408:	68 c8 46 00 00       	push   $0x46c8
    140d:	6a 01                	push   $0x1
    140f:	e8 dc 25 00 00       	call   39f0 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1414:	5b                   	pop    %ebx
    1415:	5e                   	pop    %esi
    1416:	68 02 02 00 00       	push   $0x202
    141b:	68 d9 46 00 00       	push   $0x46d9
    1420:	e8 9d 24 00 00       	call   38c2 <open>
  if(fd < 0){
    1425:	83 c4 10             	add    $0x10,%esp
    1428:	85 c0                	test   %eax,%eax
    142a:	0f 88 e6 00 00 00    	js     1516 <unlinkread+0x116>
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    1430:	83 ec 04             	sub    $0x4,%esp
    1433:	89 c3                	mov    %eax,%ebx
    1435:	6a 05                	push   $0x5
    1437:	68 fe 46 00 00       	push   $0x46fe
    143c:	50                   	push   %eax
    143d:	e8 60 24 00 00       	call   38a2 <write>
  close(fd);
    1442:	89 1c 24             	mov    %ebx,(%esp)
    1445:	e8 60 24 00 00       	call   38aa <close>

  fd = open("unlinkread", O_RDWR);
    144a:	58                   	pop    %eax
    144b:	5a                   	pop    %edx
    144c:	6a 02                	push   $0x2
    144e:	68 d9 46 00 00       	push   $0x46d9
    1453:	e8 6a 24 00 00       	call   38c2 <open>
  if(fd < 0){
    1458:	83 c4 10             	add    $0x10,%esp
    145b:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
    145d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    145f:	0f 88 10 01 00 00    	js     1575 <unlinkread+0x175>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    1465:	83 ec 0c             	sub    $0xc,%esp
    1468:	68 d9 46 00 00       	push   $0x46d9
    146d:	e8 60 24 00 00       	call   38d2 <unlink>
    1472:	83 c4 10             	add    $0x10,%esp
    1475:	85 c0                	test   %eax,%eax
    1477:	0f 85 e5 00 00 00    	jne    1562 <unlinkread+0x162>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    147d:	83 ec 08             	sub    $0x8,%esp
    1480:	68 02 02 00 00       	push   $0x202
    1485:	68 d9 46 00 00       	push   $0x46d9
    148a:	e8 33 24 00 00       	call   38c2 <open>
  write(fd1, "yyy", 3);
    148f:	83 c4 0c             	add    $0xc,%esp
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1492:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    1494:	6a 03                	push   $0x3
    1496:	68 36 47 00 00       	push   $0x4736
    149b:	50                   	push   %eax
    149c:	e8 01 24 00 00       	call   38a2 <write>
  close(fd1);
    14a1:	89 34 24             	mov    %esi,(%esp)
    14a4:	e8 01 24 00 00       	call   38aa <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    14a9:	83 c4 0c             	add    $0xc,%esp
    14ac:	68 00 20 00 00       	push   $0x2000
    14b1:	68 20 8c 00 00       	push   $0x8c20
    14b6:	53                   	push   %ebx
    14b7:	e8 de 23 00 00       	call   389a <read>
    14bc:	83 c4 10             	add    $0x10,%esp
    14bf:	83 f8 05             	cmp    $0x5,%eax
    14c2:	0f 85 87 00 00 00    	jne    154f <unlinkread+0x14f>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    14c8:	80 3d 20 8c 00 00 68 	cmpb   $0x68,0x8c20
    14cf:	75 6b                	jne    153c <unlinkread+0x13c>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    14d1:	83 ec 04             	sub    $0x4,%esp
    14d4:	6a 0a                	push   $0xa
    14d6:	68 20 8c 00 00       	push   $0x8c20
    14db:	53                   	push   %ebx
    14dc:	e8 c1 23 00 00       	call   38a2 <write>
    14e1:	83 c4 10             	add    $0x10,%esp
    14e4:	83 f8 0a             	cmp    $0xa,%eax
    14e7:	75 40                	jne    1529 <unlinkread+0x129>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    14e9:	83 ec 0c             	sub    $0xc,%esp
    14ec:	53                   	push   %ebx
    14ed:	e8 b8 23 00 00       	call   38aa <close>
  unlink("unlinkread");
    14f2:	c7 04 24 d9 46 00 00 	movl   $0x46d9,(%esp)
    14f9:	e8 d4 23 00 00       	call   38d2 <unlink>
  printf(1, "unlinkread ok\n");
    14fe:	58                   	pop    %eax
    14ff:	5a                   	pop    %edx
    1500:	68 81 47 00 00       	push   $0x4781
    1505:	6a 01                	push   $0x1
    1507:	e8 e4 24 00 00       	call   39f0 <printf>
}
    150c:	83 c4 10             	add    $0x10,%esp
    150f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1512:	5b                   	pop    %ebx
    1513:	5e                   	pop    %esi
    1514:	5d                   	pop    %ebp
    1515:	c3                   	ret    
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    1516:	51                   	push   %ecx
    1517:	51                   	push   %ecx
    1518:	68 e4 46 00 00       	push   $0x46e4
    151d:	6a 01                	push   $0x1
    151f:	e8 cc 24 00 00       	call   39f0 <printf>
    exit();
    1524:	e8 59 23 00 00       	call   3882 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    1529:	51                   	push   %ecx
    152a:	51                   	push   %ecx
    152b:	68 68 47 00 00       	push   $0x4768
    1530:	6a 01                	push   $0x1
    1532:	e8 b9 24 00 00       	call   39f0 <printf>
    exit();
    1537:	e8 46 23 00 00       	call   3882 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    153c:	53                   	push   %ebx
    153d:	53                   	push   %ebx
    153e:	68 51 47 00 00       	push   $0x4751
    1543:	6a 01                	push   $0x1
    1545:	e8 a6 24 00 00       	call   39f0 <printf>
    exit();
    154a:	e8 33 23 00 00       	call   3882 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    154f:	56                   	push   %esi
    1550:	56                   	push   %esi
    1551:	68 3a 47 00 00       	push   $0x473a
    1556:	6a 01                	push   $0x1
    1558:	e8 93 24 00 00       	call   39f0 <printf>
    exit();
    155d:	e8 20 23 00 00       	call   3882 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    1562:	50                   	push   %eax
    1563:	50                   	push   %eax
    1564:	68 1c 47 00 00       	push   $0x471c
    1569:	6a 01                	push   $0x1
    156b:	e8 80 24 00 00       	call   39f0 <printf>
    exit();
    1570:	e8 0d 23 00 00       	call   3882 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    1575:	50                   	push   %eax
    1576:	50                   	push   %eax
    1577:	68 04 47 00 00       	push   $0x4704
    157c:	6a 01                	push   $0x1
    157e:	e8 6d 24 00 00       	call   39f0 <printf>
    exit();
    1583:	e8 fa 22 00 00       	call   3882 <exit>
    1588:	90                   	nop
    1589:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00001590 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    1590:	55                   	push   %ebp
    1591:	89 e5                	mov    %esp,%ebp
    1593:	53                   	push   %ebx
    1594:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    1597:	68 90 47 00 00       	push   $0x4790
    159c:	6a 01                	push   $0x1
    159e:	e8 4d 24 00 00       	call   39f0 <printf>

  unlink("lf1");
    15a3:	c7 04 24 9a 47 00 00 	movl   $0x479a,(%esp)
    15aa:	e8 23 23 00 00       	call   38d2 <unlink>
  unlink("lf2");
    15af:	c7 04 24 9e 47 00 00 	movl   $0x479e,(%esp)
    15b6:	e8 17 23 00 00       	call   38d2 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    15bb:	58                   	pop    %eax
    15bc:	5a                   	pop    %edx
    15bd:	68 02 02 00 00       	push   $0x202
    15c2:	68 9a 47 00 00       	push   $0x479a
    15c7:	e8 f6 22 00 00       	call   38c2 <open>
  if(fd < 0){
    15cc:	83 c4 10             	add    $0x10,%esp
    15cf:	85 c0                	test   %eax,%eax
    15d1:	0f 88 1e 01 00 00    	js     16f5 <linktest+0x165>
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    15d7:	83 ec 04             	sub    $0x4,%esp
    15da:	89 c3                	mov    %eax,%ebx
    15dc:	6a 05                	push   $0x5
    15de:	68 fe 46 00 00       	push   $0x46fe
    15e3:	50                   	push   %eax
    15e4:	e8 b9 22 00 00       	call   38a2 <write>
    15e9:	83 c4 10             	add    $0x10,%esp
    15ec:	83 f8 05             	cmp    $0x5,%eax
    15ef:	0f 85 98 01 00 00    	jne    178d <linktest+0x1fd>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    15f5:	83 ec 0c             	sub    $0xc,%esp
    15f8:	53                   	push   %ebx
    15f9:	e8 ac 22 00 00       	call   38aa <close>

  if(link("lf1", "lf2") < 0){
    15fe:	5b                   	pop    %ebx
    15ff:	58                   	pop    %eax
    1600:	68 9e 47 00 00       	push   $0x479e
    1605:	68 9a 47 00 00       	push   $0x479a
    160a:	e8 d3 22 00 00       	call   38e2 <link>
    160f:	83 c4 10             	add    $0x10,%esp
    1612:	85 c0                	test   %eax,%eax
    1614:	0f 88 60 01 00 00    	js     177a <linktest+0x1ea>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    161a:	83 ec 0c             	sub    $0xc,%esp
    161d:	68 9a 47 00 00       	push   $0x479a
    1622:	e8 ab 22 00 00       	call   38d2 <unlink>

  if(open("lf1", 0) >= 0){
    1627:	58                   	pop    %eax
    1628:	5a                   	pop    %edx
    1629:	6a 00                	push   $0x0
    162b:	68 9a 47 00 00       	push   $0x479a
    1630:	e8 8d 22 00 00       	call   38c2 <open>
    1635:	83 c4 10             	add    $0x10,%esp
    1638:	85 c0                	test   %eax,%eax
    163a:	0f 89 27 01 00 00    	jns    1767 <linktest+0x1d7>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1640:	83 ec 08             	sub    $0x8,%esp
    1643:	6a 00                	push   $0x0
    1645:	68 9e 47 00 00       	push   $0x479e
    164a:	e8 73 22 00 00       	call   38c2 <open>
  if(fd < 0){
    164f:	83 c4 10             	add    $0x10,%esp
    1652:	85 c0                	test   %eax,%eax
  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1654:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1656:	0f 88 f8 00 00 00    	js     1754 <linktest+0x1c4>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    165c:	83 ec 04             	sub    $0x4,%esp
    165f:	68 00 20 00 00       	push   $0x2000
    1664:	68 20 8c 00 00       	push   $0x8c20
    1669:	50                   	push   %eax
    166a:	e8 2b 22 00 00       	call   389a <read>
    166f:	83 c4 10             	add    $0x10,%esp
    1672:	83 f8 05             	cmp    $0x5,%eax
    1675:	0f 85 c6 00 00 00    	jne    1741 <linktest+0x1b1>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    167b:	83 ec 0c             	sub    $0xc,%esp
    167e:	53                   	push   %ebx
    167f:	e8 26 22 00 00       	call   38aa <close>

  if(link("lf2", "lf2") >= 0){
    1684:	58                   	pop    %eax
    1685:	5a                   	pop    %edx
    1686:	68 9e 47 00 00       	push   $0x479e
    168b:	68 9e 47 00 00       	push   $0x479e
    1690:	e8 4d 22 00 00       	call   38e2 <link>
    1695:	83 c4 10             	add    $0x10,%esp
    1698:	85 c0                	test   %eax,%eax
    169a:	0f 89 8e 00 00 00    	jns    172e <linktest+0x19e>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    16a0:	83 ec 0c             	sub    $0xc,%esp
    16a3:	68 9e 47 00 00       	push   $0x479e
    16a8:	e8 25 22 00 00       	call   38d2 <unlink>
  if(link("lf2", "lf1") >= 0){
    16ad:	59                   	pop    %ecx
    16ae:	5b                   	pop    %ebx
    16af:	68 9a 47 00 00       	push   $0x479a
    16b4:	68 9e 47 00 00       	push   $0x479e
    16b9:	e8 24 22 00 00       	call   38e2 <link>
    16be:	83 c4 10             	add    $0x10,%esp
    16c1:	85 c0                	test   %eax,%eax
    16c3:	79 56                	jns    171b <linktest+0x18b>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    16c5:	83 ec 08             	sub    $0x8,%esp
    16c8:	68 9a 47 00 00       	push   $0x479a
    16cd:	68 62 4a 00 00       	push   $0x4a62
    16d2:	e8 0b 22 00 00       	call   38e2 <link>
    16d7:	83 c4 10             	add    $0x10,%esp
    16da:	85 c0                	test   %eax,%eax
    16dc:	79 2a                	jns    1708 <linktest+0x178>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    16de:	83 ec 08             	sub    $0x8,%esp
    16e1:	68 38 48 00 00       	push   $0x4838
    16e6:	6a 01                	push   $0x1
    16e8:	e8 03 23 00 00       	call   39f0 <printf>
}
    16ed:	83 c4 10             	add    $0x10,%esp
    16f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    16f3:	c9                   	leave  
    16f4:	c3                   	ret    
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    16f5:	50                   	push   %eax
    16f6:	50                   	push   %eax
    16f7:	68 a2 47 00 00       	push   $0x47a2
    16fc:	6a 01                	push   $0x1
    16fe:	e8 ed 22 00 00       	call   39f0 <printf>
    exit();
    1703:	e8 7a 21 00 00       	call   3882 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    1708:	50                   	push   %eax
    1709:	50                   	push   %eax
    170a:	68 1c 48 00 00       	push   $0x481c
    170f:	6a 01                	push   $0x1
    1711:	e8 da 22 00 00       	call   39f0 <printf>
    exit();
    1716:	e8 67 21 00 00       	call   3882 <exit>
    exit();
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    171b:	52                   	push   %edx
    171c:	52                   	push   %edx
    171d:	68 d0 53 00 00       	push   $0x53d0
    1722:	6a 01                	push   $0x1
    1724:	e8 c7 22 00 00       	call   39f0 <printf>
    exit();
    1729:	e8 54 21 00 00       	call   3882 <exit>
    exit();
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    172e:	50                   	push   %eax
    172f:	50                   	push   %eax
    1730:	68 fe 47 00 00       	push   $0x47fe
    1735:	6a 01                	push   $0x1
    1737:	e8 b4 22 00 00       	call   39f0 <printf>
    exit();
    173c:	e8 41 21 00 00       	call   3882 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    1741:	51                   	push   %ecx
    1742:	51                   	push   %ecx
    1743:	68 ed 47 00 00       	push   $0x47ed
    1748:	6a 01                	push   $0x1
    174a:	e8 a1 22 00 00       	call   39f0 <printf>
    exit();
    174f:	e8 2e 21 00 00       	call   3882 <exit>
    exit();
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    1754:	53                   	push   %ebx
    1755:	53                   	push   %ebx
    1756:	68 dc 47 00 00       	push   $0x47dc
    175b:	6a 01                	push   $0x1
    175d:	e8 8e 22 00 00       	call   39f0 <printf>
    exit();
    1762:	e8 1b 21 00 00       	call   3882 <exit>
    exit();
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    1767:	50                   	push   %eax
    1768:	50                   	push   %eax
    1769:	68 a8 53 00 00       	push   $0x53a8
    176e:	6a 01                	push   $0x1
    1770:	e8 7b 22 00 00       	call   39f0 <printf>
    exit();
    1775:	e8 08 21 00 00       	call   3882 <exit>
    exit();
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    177a:	51                   	push   %ecx
    177b:	51                   	push   %ecx
    177c:	68 c7 47 00 00       	push   $0x47c7
    1781:	6a 01                	push   $0x1
    1783:	e8 68 22 00 00       	call   39f0 <printf>
    exit();
    1788:	e8 f5 20 00 00       	call   3882 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    178d:	50                   	push   %eax
    178e:	50                   	push   %eax
    178f:	68 b5 47 00 00       	push   $0x47b5
    1794:	6a 01                	push   $0x1
    1796:	e8 55 22 00 00       	call   39f0 <printf>
    exit();
    179b:	e8 e2 20 00 00       	call   3882 <exit>

000017a0 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17a0:	55                   	push   %ebp
    17a1:	89 e5                	mov    %esp,%ebp
    17a3:	57                   	push   %edi
    17a4:	56                   	push   %esi
    17a5:	53                   	push   %ebx
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    17a6:	31 f6                	xor    %esi,%esi
    17a8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    17ab:	bf 56 55 55 55       	mov    $0x55555556,%edi
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17b0:	83 ec 64             	sub    $0x64,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    17b3:	68 45 48 00 00       	push   $0x4845
    17b8:	6a 01                	push   $0x1
    17ba:	e8 31 22 00 00       	call   39f0 <printf>
  file[0] = 'C';
    17bf:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    17c3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    17c7:	83 c4 10             	add    $0x10,%esp
    17ca:	eb 51                	jmp    181d <concreate+0x7d>
    17cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    17d0:	89 f0                	mov    %esi,%eax
    17d2:	89 f1                	mov    %esi,%ecx
    17d4:	f7 ef                	imul   %edi
    17d6:	89 f0                	mov    %esi,%eax
    17d8:	c1 f8 1f             	sar    $0x1f,%eax
    17db:	29 c2                	sub    %eax,%edx
    17dd:	8d 04 52             	lea    (%edx,%edx,2),%eax
    17e0:	29 c1                	sub    %eax,%ecx
    17e2:	83 f9 01             	cmp    $0x1,%ecx
    17e5:	0f 84 b5 00 00 00    	je     18a0 <concreate+0x100>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    17eb:	83 ec 08             	sub    $0x8,%esp
    17ee:	68 02 02 00 00       	push   $0x202
    17f3:	53                   	push   %ebx
    17f4:	e8 c9 20 00 00       	call   38c2 <open>
      if(fd < 0){
    17f9:	83 c4 10             	add    $0x10,%esp
    17fc:	85 c0                	test   %eax,%eax
    17fe:	78 6d                	js     186d <concreate+0xcd>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1800:	83 ec 0c             	sub    $0xc,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1803:	83 c6 01             	add    $0x1,%esi
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1806:	50                   	push   %eax
    1807:	e8 9e 20 00 00       	call   38aa <close>
    180c:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
      exit();
    else
      wait();
    180f:	e8 76 20 00 00       	call   388a <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1814:	83 fe 28             	cmp    $0x28,%esi
    1817:	0f 84 ab 00 00 00    	je     18c8 <concreate+0x128>
    file[1] = '0' + i;
    unlink(file);
    181d:	83 ec 0c             	sub    $0xc,%esp

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1820:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    1823:	53                   	push   %ebx

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1824:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1827:	e8 a6 20 00 00       	call   38d2 <unlink>
    pid = fork();
    182c:	e8 49 20 00 00       	call   387a <fork>
    if(pid && (i % 3) == 1){
    1831:	83 c4 10             	add    $0x10,%esp
    1834:	85 c0                	test   %eax,%eax
    1836:	75 98                	jne    17d0 <concreate+0x30>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    1838:	89 f0                	mov    %esi,%eax
    183a:	ba 67 66 66 66       	mov    $0x66666667,%edx
    183f:	f7 ea                	imul   %edx
    1841:	89 f0                	mov    %esi,%eax
    1843:	c1 f8 1f             	sar    $0x1f,%eax
    1846:	d1 fa                	sar    %edx
    1848:	29 c2                	sub    %eax,%edx
    184a:	8d 04 92             	lea    (%edx,%edx,4),%eax
    184d:	29 c6                	sub    %eax,%esi
    184f:	83 fe 01             	cmp    $0x1,%esi
    1852:	74 34                	je     1888 <concreate+0xe8>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1854:	83 ec 08             	sub    $0x8,%esp
    1857:	68 02 02 00 00       	push   $0x202
    185c:	53                   	push   %ebx
    185d:	e8 60 20 00 00       	call   38c2 <open>
      if(fd < 0){
    1862:	83 c4 10             	add    $0x10,%esp
    1865:	85 c0                	test   %eax,%eax
    1867:	0f 89 32 02 00 00    	jns    1a9f <concreate+0x2ff>
        printf(1, "concreate create %s failed\n", file);
    186d:	83 ec 04             	sub    $0x4,%esp
    1870:	53                   	push   %ebx
    1871:	68 58 48 00 00       	push   $0x4858
    1876:	6a 01                	push   $0x1
    1878:	e8 73 21 00 00       	call   39f0 <printf>
        exit();
    187d:	e8 00 20 00 00       	call   3882 <exit>
    1882:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    1888:	83 ec 08             	sub    $0x8,%esp
    188b:	53                   	push   %ebx
    188c:	68 55 48 00 00       	push   $0x4855
    1891:	e8 4c 20 00 00       	call   38e2 <link>
    1896:	83 c4 10             	add    $0x10,%esp
        exit();
      }
      close(fd);
    }
    if(pid == 0)
      exit();
    1899:	e8 e4 1f 00 00       	call   3882 <exit>
    189e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    18a0:	83 ec 08             	sub    $0x8,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    18a3:	83 c6 01             	add    $0x1,%esi
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    18a6:	53                   	push   %ebx
    18a7:	68 55 48 00 00       	push   $0x4855
    18ac:	e8 31 20 00 00       	call   38e2 <link>
    18b1:	83 c4 10             	add    $0x10,%esp
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    18b4:	e8 d1 1f 00 00       	call   388a <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    18b9:	83 fe 28             	cmp    $0x28,%esi
    18bc:	0f 85 5b ff ff ff    	jne    181d <concreate+0x7d>
    18c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    18c8:	8d 45 c0             	lea    -0x40(%ebp),%eax
    18cb:	83 ec 04             	sub    $0x4,%esp
    18ce:	8d 7d b0             	lea    -0x50(%ebp),%edi
    18d1:	6a 28                	push   $0x28
    18d3:	6a 00                	push   $0x0
    18d5:	50                   	push   %eax
    18d6:	e8 15 1e 00 00       	call   36f0 <memset>
  fd = open(".", 0);
    18db:	59                   	pop    %ecx
    18dc:	5e                   	pop    %esi
    18dd:	6a 00                	push   $0x0
    18df:	68 62 4a 00 00       	push   $0x4a62
    18e4:	e8 d9 1f 00 00       	call   38c2 <open>
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    18e9:	83 c4 10             	add    $0x10,%esp
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    18ec:	89 c6                	mov    %eax,%esi
  n = 0;
    18ee:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    18f5:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    18f8:	83 ec 04             	sub    $0x4,%esp
    18fb:	6a 10                	push   $0x10
    18fd:	57                   	push   %edi
    18fe:	56                   	push   %esi
    18ff:	e8 96 1f 00 00       	call   389a <read>
    1904:	83 c4 10             	add    $0x10,%esp
    1907:	85 c0                	test   %eax,%eax
    1909:	7e 3d                	jle    1948 <concreate+0x1a8>
    if(de.inum == 0)
    190b:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1910:	74 e6                	je     18f8 <concreate+0x158>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1912:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1916:	75 e0                	jne    18f8 <concreate+0x158>
    1918:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    191c:	75 da                	jne    18f8 <concreate+0x158>
      i = de.name[1] - '0';
    191e:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1922:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1925:	83 f8 27             	cmp    $0x27,%eax
    1928:	0f 87 59 01 00 00    	ja     1a87 <concreate+0x2e7>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    192e:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1933:	0f 85 36 01 00 00    	jne    1a6f <concreate+0x2cf>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    1939:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    193e:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1942:	eb b4                	jmp    18f8 <concreate+0x158>
    1944:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  close(fd);
    1948:	83 ec 0c             	sub    $0xc,%esp
    194b:	56                   	push   %esi
    194c:	e8 59 1f 00 00       	call   38aa <close>

  if(n != 40){
    1951:	83 c4 10             	add    $0x10,%esp
    1954:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1958:	0f 85 fd 00 00 00    	jne    1a5b <concreate+0x2bb>
    195e:	31 f6                	xor    %esi,%esi
    1960:	eb 70                	jmp    19d2 <concreate+0x232>
    1962:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
    1968:	83 fa 01             	cmp    $0x1,%edx
    196b:	0f 85 99 00 00 00    	jne    1a0a <concreate+0x26a>
      close(open(file, 0));
    1971:	83 ec 08             	sub    $0x8,%esp
    1974:	6a 00                	push   $0x0
    1976:	53                   	push   %ebx
    1977:	e8 46 1f 00 00       	call   38c2 <open>
    197c:	89 04 24             	mov    %eax,(%esp)
    197f:	e8 26 1f 00 00       	call   38aa <close>
      close(open(file, 0));
    1984:	58                   	pop    %eax
    1985:	5a                   	pop    %edx
    1986:	6a 00                	push   $0x0
    1988:	53                   	push   %ebx
    1989:	e8 34 1f 00 00       	call   38c2 <open>
    198e:	89 04 24             	mov    %eax,(%esp)
    1991:	e8 14 1f 00 00       	call   38aa <close>
      close(open(file, 0));
    1996:	59                   	pop    %ecx
    1997:	58                   	pop    %eax
    1998:	6a 00                	push   $0x0
    199a:	53                   	push   %ebx
    199b:	e8 22 1f 00 00       	call   38c2 <open>
    19a0:	89 04 24             	mov    %eax,(%esp)
    19a3:	e8 02 1f 00 00       	call   38aa <close>
      close(open(file, 0));
    19a8:	58                   	pop    %eax
    19a9:	5a                   	pop    %edx
    19aa:	6a 00                	push   $0x0
    19ac:	53                   	push   %ebx
    19ad:	e8 10 1f 00 00       	call   38c2 <open>
    19b2:	89 04 24             	mov    %eax,(%esp)
    19b5:	e8 f0 1e 00 00       	call   38aa <close>
    19ba:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    19bd:	85 ff                	test   %edi,%edi
    19bf:	0f 84 d4 fe ff ff    	je     1899 <concreate+0xf9>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19c5:	83 c6 01             	add    $0x1,%esi
      unlink(file);
    }
    if(pid == 0)
      exit();
    else
      wait();
    19c8:	e8 bd 1e 00 00       	call   388a <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19cd:	83 fe 28             	cmp    $0x28,%esi
    19d0:	74 5e                	je     1a30 <concreate+0x290>
    file[1] = '0' + i;
    19d2:	8d 46 30             	lea    0x30(%esi),%eax
    19d5:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    19d8:	e8 9d 1e 00 00       	call   387a <fork>
    if(pid < 0){
    19dd:	85 c0                	test   %eax,%eax
    exit();
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    19df:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    19e1:	78 64                	js     1a47 <concreate+0x2a7>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    19e3:	b8 56 55 55 55       	mov    $0x55555556,%eax
    19e8:	f7 ee                	imul   %esi
    19ea:	89 f0                	mov    %esi,%eax
    19ec:	c1 f8 1f             	sar    $0x1f,%eax
    19ef:	29 c2                	sub    %eax,%edx
    19f1:	8d 04 52             	lea    (%edx,%edx,2),%eax
    19f4:	89 f2                	mov    %esi,%edx
    19f6:	29 c2                	sub    %eax,%edx
    19f8:	89 f8                	mov    %edi,%eax
    19fa:	09 d0                	or     %edx,%eax
    19fc:	0f 84 6f ff ff ff    	je     1971 <concreate+0x1d1>
       ((i % 3) == 1 && pid != 0)){
    1a02:	85 ff                	test   %edi,%edi
    1a04:	0f 85 5e ff ff ff    	jne    1968 <concreate+0x1c8>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    1a0a:	83 ec 0c             	sub    $0xc,%esp
    1a0d:	53                   	push   %ebx
    1a0e:	e8 bf 1e 00 00       	call   38d2 <unlink>
      unlink(file);
    1a13:	89 1c 24             	mov    %ebx,(%esp)
    1a16:	e8 b7 1e 00 00       	call   38d2 <unlink>
      unlink(file);
    1a1b:	89 1c 24             	mov    %ebx,(%esp)
    1a1e:	e8 af 1e 00 00       	call   38d2 <unlink>
      unlink(file);
    1a23:	89 1c 24             	mov    %ebx,(%esp)
    1a26:	e8 a7 1e 00 00       	call   38d2 <unlink>
    1a2b:	83 c4 10             	add    $0x10,%esp
    1a2e:	eb 8d                	jmp    19bd <concreate+0x21d>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1a30:	83 ec 08             	sub    $0x8,%esp
    1a33:	68 aa 48 00 00       	push   $0x48aa
    1a38:	6a 01                	push   $0x1
    1a3a:	e8 b1 1f 00 00       	call   39f0 <printf>
}
    1a3f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a42:	5b                   	pop    %ebx
    1a43:	5e                   	pop    %esi
    1a44:	5f                   	pop    %edi
    1a45:	5d                   	pop    %ebp
    1a46:	c3                   	ret    

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1a47:	83 ec 08             	sub    $0x8,%esp
    1a4a:	68 2d 51 00 00       	push   $0x512d
    1a4f:	6a 01                	push   $0x1
    1a51:	e8 9a 1f 00 00       	call   39f0 <printf>
      exit();
    1a56:	e8 27 1e 00 00       	call   3882 <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    1a5b:	83 ec 08             	sub    $0x8,%esp
    1a5e:	68 f4 53 00 00       	push   $0x53f4
    1a63:	6a 01                	push   $0x1
    1a65:	e8 86 1f 00 00       	call   39f0 <printf>
    exit();
    1a6a:	e8 13 1e 00 00       	call   3882 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    1a6f:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a72:	83 ec 04             	sub    $0x4,%esp
    1a75:	50                   	push   %eax
    1a76:	68 8d 48 00 00       	push   $0x488d
    1a7b:	6a 01                	push   $0x1
    1a7d:	e8 6e 1f 00 00       	call   39f0 <printf>
        exit();
    1a82:	e8 fb 1d 00 00       	call   3882 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    1a87:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a8a:	83 ec 04             	sub    $0x4,%esp
    1a8d:	50                   	push   %eax
    1a8e:	68 74 48 00 00       	push   $0x4874
    1a93:	6a 01                	push   $0x1
    1a95:	e8 56 1f 00 00       	call   39f0 <printf>
        exit();
    1a9a:	e8 e3 1d 00 00       	call   3882 <exit>
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1a9f:	83 ec 0c             	sub    $0xc,%esp
    1aa2:	50                   	push   %eax
    1aa3:	e8 02 1e 00 00       	call   38aa <close>
    1aa8:	83 c4 10             	add    $0x10,%esp
    1aab:	e9 e9 fd ff ff       	jmp    1899 <concreate+0xf9>

00001ab0 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1ab0:	55                   	push   %ebp
    1ab1:	89 e5                	mov    %esp,%ebp
    1ab3:	57                   	push   %edi
    1ab4:	56                   	push   %esi
    1ab5:	53                   	push   %ebx
    1ab6:	83 ec 24             	sub    $0x24,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1ab9:	68 b8 48 00 00       	push   $0x48b8
    1abe:	6a 01                	push   $0x1
    1ac0:	e8 2b 1f 00 00       	call   39f0 <printf>

  unlink("x");
    1ac5:	c7 04 24 45 4b 00 00 	movl   $0x4b45,(%esp)
    1acc:	e8 01 1e 00 00       	call   38d2 <unlink>
  pid = fork();
    1ad1:	e8 a4 1d 00 00       	call   387a <fork>
  if(pid < 0){
    1ad6:	83 c4 10             	add    $0x10,%esp
    1ad9:	85 c0                	test   %eax,%eax
  int pid, i;

  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
    1adb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1ade:	0f 88 b6 00 00 00    	js     1b9a <linkunlink+0xea>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1ae4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1ae8:	bb 64 00 00 00       	mov    $0x64,%ebx
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
    1aed:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1af2:	19 ff                	sbb    %edi,%edi
    1af4:	83 e7 60             	and    $0x60,%edi
    1af7:	83 c7 01             	add    $0x1,%edi
    1afa:	eb 1e                	jmp    1b1a <linkunlink+0x6a>
    1afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    1b00:	83 fa 01             	cmp    $0x1,%edx
    1b03:	74 7b                	je     1b80 <linkunlink+0xd0>
      link("cat", "x");
    } else {
      unlink("x");
    1b05:	83 ec 0c             	sub    $0xc,%esp
    1b08:	68 45 4b 00 00       	push   $0x4b45
    1b0d:	e8 c0 1d 00 00       	call   38d2 <unlink>
    1b12:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b15:	83 eb 01             	sub    $0x1,%ebx
    1b18:	74 3d                	je     1b57 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1b1a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b20:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1b26:	89 f8                	mov    %edi,%eax
    1b28:	f7 e6                	mul    %esi
    1b2a:	d1 ea                	shr    %edx
    1b2c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b2f:	89 fa                	mov    %edi,%edx
    1b31:	29 c2                	sub    %eax,%edx
    1b33:	75 cb                	jne    1b00 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1b35:	83 ec 08             	sub    $0x8,%esp
    1b38:	68 02 02 00 00       	push   $0x202
    1b3d:	68 45 4b 00 00       	push   $0x4b45
    1b42:	e8 7b 1d 00 00       	call   38c2 <open>
    1b47:	89 04 24             	mov    %eax,(%esp)
    1b4a:	e8 5b 1d 00 00       	call   38aa <close>
    1b4f:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b52:	83 eb 01             	sub    $0x1,%ebx
    1b55:	75 c3                	jne    1b1a <linkunlink+0x6a>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1b57:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b5a:	85 c0                	test   %eax,%eax
    1b5c:	74 50                	je     1bae <linkunlink+0xfe>
    wait();
    1b5e:	e8 27 1d 00 00       	call   388a <wait>
  else
    exit();

  printf(1, "linkunlink ok\n");
    1b63:	83 ec 08             	sub    $0x8,%esp
    1b66:	68 cd 48 00 00       	push   $0x48cd
    1b6b:	6a 01                	push   $0x1
    1b6d:	e8 7e 1e 00 00       	call   39f0 <printf>
}
    1b72:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b75:	5b                   	pop    %ebx
    1b76:	5e                   	pop    %esi
    1b77:	5f                   	pop    %edi
    1b78:	5d                   	pop    %ebp
    1b79:	c3                   	ret    
    1b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    1b80:	83 ec 08             	sub    $0x8,%esp
    1b83:	68 45 4b 00 00       	push   $0x4b45
    1b88:	68 c9 48 00 00       	push   $0x48c9
    1b8d:	e8 50 1d 00 00       	call   38e2 <link>
    1b92:	83 c4 10             	add    $0x10,%esp
    1b95:	e9 7b ff ff ff       	jmp    1b15 <linkunlink+0x65>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    1b9a:	83 ec 08             	sub    $0x8,%esp
    1b9d:	68 2d 51 00 00       	push   $0x512d
    1ba2:	6a 01                	push   $0x1
    1ba4:	e8 47 1e 00 00       	call   39f0 <printf>
    exit();
    1ba9:	e8 d4 1c 00 00       	call   3882 <exit>
  }

  if(pid)
    wait();
  else
    exit();
    1bae:	e8 cf 1c 00 00       	call   3882 <exit>
    1bb3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bc0 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1bc0:	55                   	push   %ebp
    1bc1:	89 e5                	mov    %esp,%ebp
    1bc3:	56                   	push   %esi
    1bc4:	53                   	push   %ebx
    1bc5:	83 ec 18             	sub    $0x18,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1bc8:	68 dc 48 00 00       	push   $0x48dc
    1bcd:	6a 01                	push   $0x1
    1bcf:	e8 1c 1e 00 00       	call   39f0 <printf>
  unlink("bd");
    1bd4:	c7 04 24 e9 48 00 00 	movl   $0x48e9,(%esp)
    1bdb:	e8 f2 1c 00 00       	call   38d2 <unlink>

  fd = open("bd", O_CREATE);
    1be0:	58                   	pop    %eax
    1be1:	5a                   	pop    %edx
    1be2:	68 00 02 00 00       	push   $0x200
    1be7:	68 e9 48 00 00       	push   $0x48e9
    1bec:	e8 d1 1c 00 00       	call   38c2 <open>
  if(fd < 0){
    1bf1:	83 c4 10             	add    $0x10,%esp
    1bf4:	85 c0                	test   %eax,%eax
    1bf6:	0f 88 de 00 00 00    	js     1cda <bigdir+0x11a>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1bfc:	83 ec 0c             	sub    $0xc,%esp
    1bff:	8d 75 ee             	lea    -0x12(%ebp),%esi

  for(i = 0; i < 500; i++){
    1c02:	31 db                	xor    %ebx,%ebx
  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1c04:	50                   	push   %eax
    1c05:	e8 a0 1c 00 00       	call   38aa <close>
    1c0a:	83 c4 10             	add    $0x10,%esp
    1c0d:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c10:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c12:	83 ec 08             	sub    $0x8,%esp
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c15:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1c19:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c1c:	56                   	push   %esi
    1c1d:	68 e9 48 00 00       	push   $0x48e9
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c22:	83 c0 30             	add    $0x30,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1c25:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c29:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1c2c:	89 d8                	mov    %ebx,%eax
    1c2e:	83 e0 3f             	and    $0x3f,%eax
    1c31:	83 c0 30             	add    $0x30,%eax
    1c34:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c37:	e8 a6 1c 00 00       	call   38e2 <link>
    1c3c:	83 c4 10             	add    $0x10,%esp
    1c3f:	85 c0                	test   %eax,%eax
    1c41:	75 6f                	jne    1cb2 <bigdir+0xf2>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1c43:	83 c3 01             	add    $0x1,%ebx
    1c46:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1c4c:	75 c2                	jne    1c10 <bigdir+0x50>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c4e:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1c51:	31 db                	xor    %ebx,%ebx
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c53:	68 e9 48 00 00       	push   $0x48e9
    1c58:	e8 75 1c 00 00       	call   38d2 <unlink>
    1c5d:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c60:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1c62:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c65:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1c69:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1c6c:	56                   	push   %esi
  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1c6d:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c71:	83 c0 30             	add    $0x30,%eax
    1c74:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1c77:	89 d8                	mov    %ebx,%eax
    1c79:	83 e0 3f             	and    $0x3f,%eax
    1c7c:	83 c0 30             	add    $0x30,%eax
    1c7f:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(unlink(name) != 0){
    1c82:	e8 4b 1c 00 00       	call   38d2 <unlink>
    1c87:	83 c4 10             	add    $0x10,%esp
    1c8a:	85 c0                	test   %eax,%eax
    1c8c:	75 38                	jne    1cc6 <bigdir+0x106>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1c8e:	83 c3 01             	add    $0x1,%ebx
    1c91:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1c97:	75 c7                	jne    1c60 <bigdir+0xa0>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1c99:	83 ec 08             	sub    $0x8,%esp
    1c9c:	68 2b 49 00 00       	push   $0x492b
    1ca1:	6a 01                	push   $0x1
    1ca3:	e8 48 1d 00 00       	call   39f0 <printf>
}
    1ca8:	83 c4 10             	add    $0x10,%esp
    1cab:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1cae:	5b                   	pop    %ebx
    1caf:	5e                   	pop    %esi
    1cb0:	5d                   	pop    %ebp
    1cb1:	c3                   	ret    
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    1cb2:	83 ec 08             	sub    $0x8,%esp
    1cb5:	68 02 49 00 00       	push   $0x4902
    1cba:	6a 01                	push   $0x1
    1cbc:	e8 2f 1d 00 00       	call   39f0 <printf>
      exit();
    1cc1:	e8 bc 1b 00 00       	call   3882 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    1cc6:	83 ec 08             	sub    $0x8,%esp
    1cc9:	68 16 49 00 00       	push   $0x4916
    1cce:	6a 01                	push   $0x1
    1cd0:	e8 1b 1d 00 00       	call   39f0 <printf>
      exit();
    1cd5:	e8 a8 1b 00 00       	call   3882 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    1cda:	83 ec 08             	sub    $0x8,%esp
    1cdd:	68 ec 48 00 00       	push   $0x48ec
    1ce2:	6a 01                	push   $0x1
    1ce4:	e8 07 1d 00 00       	call   39f0 <printf>
    exit();
    1ce9:	e8 94 1b 00 00       	call   3882 <exit>
    1cee:	66 90                	xchg   %ax,%ax

00001cf0 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1cf0:	55                   	push   %ebp
    1cf1:	89 e5                	mov    %esp,%ebp
    1cf3:	53                   	push   %ebx
    1cf4:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1cf7:	68 36 49 00 00       	push   $0x4936
    1cfc:	6a 01                	push   $0x1
    1cfe:	e8 ed 1c 00 00       	call   39f0 <printf>

  unlink("ff");
    1d03:	c7 04 24 bf 49 00 00 	movl   $0x49bf,(%esp)
    1d0a:	e8 c3 1b 00 00       	call   38d2 <unlink>
  if(mkdir("dd") != 0){
    1d0f:	c7 04 24 5c 4a 00 00 	movl   $0x4a5c,(%esp)
    1d16:	e8 cf 1b 00 00       	call   38ea <mkdir>
    1d1b:	83 c4 10             	add    $0x10,%esp
    1d1e:	85 c0                	test   %eax,%eax
    1d20:	0f 85 b3 05 00 00    	jne    22d9 <subdir+0x5e9>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d26:	83 ec 08             	sub    $0x8,%esp
    1d29:	68 02 02 00 00       	push   $0x202
    1d2e:	68 95 49 00 00       	push   $0x4995
    1d33:	e8 8a 1b 00 00       	call   38c2 <open>
  if(fd < 0){
    1d38:	83 c4 10             	add    $0x10,%esp
    1d3b:	85 c0                	test   %eax,%eax
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d3d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d3f:	0f 88 81 05 00 00    	js     22c6 <subdir+0x5d6>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    1d45:	83 ec 04             	sub    $0x4,%esp
    1d48:	6a 02                	push   $0x2
    1d4a:	68 bf 49 00 00       	push   $0x49bf
    1d4f:	50                   	push   %eax
    1d50:	e8 4d 1b 00 00       	call   38a2 <write>
  close(fd);
    1d55:	89 1c 24             	mov    %ebx,(%esp)
    1d58:	e8 4d 1b 00 00       	call   38aa <close>

  if(unlink("dd") >= 0){
    1d5d:	c7 04 24 5c 4a 00 00 	movl   $0x4a5c,(%esp)
    1d64:	e8 69 1b 00 00       	call   38d2 <unlink>
    1d69:	83 c4 10             	add    $0x10,%esp
    1d6c:	85 c0                	test   %eax,%eax
    1d6e:	0f 89 3f 05 00 00    	jns    22b3 <subdir+0x5c3>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    1d74:	83 ec 0c             	sub    $0xc,%esp
    1d77:	68 70 49 00 00       	push   $0x4970
    1d7c:	e8 69 1b 00 00       	call   38ea <mkdir>
    1d81:	83 c4 10             	add    $0x10,%esp
    1d84:	85 c0                	test   %eax,%eax
    1d86:	0f 85 14 05 00 00    	jne    22a0 <subdir+0x5b0>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1d8c:	83 ec 08             	sub    $0x8,%esp
    1d8f:	68 02 02 00 00       	push   $0x202
    1d94:	68 92 49 00 00       	push   $0x4992
    1d99:	e8 24 1b 00 00       	call   38c2 <open>
  if(fd < 0){
    1d9e:	83 c4 10             	add    $0x10,%esp
    1da1:	85 c0                	test   %eax,%eax
  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1da3:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1da5:	0f 88 24 04 00 00    	js     21cf <subdir+0x4df>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    1dab:	83 ec 04             	sub    $0x4,%esp
    1dae:	6a 02                	push   $0x2
    1db0:	68 b3 49 00 00       	push   $0x49b3
    1db5:	50                   	push   %eax
    1db6:	e8 e7 1a 00 00       	call   38a2 <write>
  close(fd);
    1dbb:	89 1c 24             	mov    %ebx,(%esp)
    1dbe:	e8 e7 1a 00 00       	call   38aa <close>

  fd = open("dd/dd/../ff", 0);
    1dc3:	58                   	pop    %eax
    1dc4:	5a                   	pop    %edx
    1dc5:	6a 00                	push   $0x0
    1dc7:	68 b6 49 00 00       	push   $0x49b6
    1dcc:	e8 f1 1a 00 00       	call   38c2 <open>
  if(fd < 0){
    1dd1:	83 c4 10             	add    $0x10,%esp
    1dd4:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
    1dd6:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1dd8:	0f 88 de 03 00 00    	js     21bc <subdir+0x4cc>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    1dde:	83 ec 04             	sub    $0x4,%esp
    1de1:	68 00 20 00 00       	push   $0x2000
    1de6:	68 20 8c 00 00       	push   $0x8c20
    1deb:	50                   	push   %eax
    1dec:	e8 a9 1a 00 00       	call   389a <read>
  if(cc != 2 || buf[0] != 'f'){
    1df1:	83 c4 10             	add    $0x10,%esp
    1df4:	83 f8 02             	cmp    $0x2,%eax
    1df7:	0f 85 3a 03 00 00    	jne    2137 <subdir+0x447>
    1dfd:	80 3d 20 8c 00 00 66 	cmpb   $0x66,0x8c20
    1e04:	0f 85 2d 03 00 00    	jne    2137 <subdir+0x447>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1e0a:	83 ec 0c             	sub    $0xc,%esp
    1e0d:	53                   	push   %ebx
    1e0e:	e8 97 1a 00 00       	call   38aa <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e13:	5b                   	pop    %ebx
    1e14:	58                   	pop    %eax
    1e15:	68 f6 49 00 00       	push   $0x49f6
    1e1a:	68 92 49 00 00       	push   $0x4992
    1e1f:	e8 be 1a 00 00       	call   38e2 <link>
    1e24:	83 c4 10             	add    $0x10,%esp
    1e27:	85 c0                	test   %eax,%eax
    1e29:	0f 85 c6 03 00 00    	jne    21f5 <subdir+0x505>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    1e2f:	83 ec 0c             	sub    $0xc,%esp
    1e32:	68 92 49 00 00       	push   $0x4992
    1e37:	e8 96 1a 00 00       	call   38d2 <unlink>
    1e3c:	83 c4 10             	add    $0x10,%esp
    1e3f:	85 c0                	test   %eax,%eax
    1e41:	0f 85 16 03 00 00    	jne    215d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1e47:	83 ec 08             	sub    $0x8,%esp
    1e4a:	6a 00                	push   $0x0
    1e4c:	68 92 49 00 00       	push   $0x4992
    1e51:	e8 6c 1a 00 00       	call   38c2 <open>
    1e56:	83 c4 10             	add    $0x10,%esp
    1e59:	85 c0                	test   %eax,%eax
    1e5b:	0f 89 2c 04 00 00    	jns    228d <subdir+0x59d>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    1e61:	83 ec 0c             	sub    $0xc,%esp
    1e64:	68 5c 4a 00 00       	push   $0x4a5c
    1e69:	e8 84 1a 00 00       	call   38f2 <chdir>
    1e6e:	83 c4 10             	add    $0x10,%esp
    1e71:	85 c0                	test   %eax,%eax
    1e73:	0f 85 01 04 00 00    	jne    227a <subdir+0x58a>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    1e79:	83 ec 0c             	sub    $0xc,%esp
    1e7c:	68 2a 4a 00 00       	push   $0x4a2a
    1e81:	e8 6c 1a 00 00       	call   38f2 <chdir>
    1e86:	83 c4 10             	add    $0x10,%esp
    1e89:	85 c0                	test   %eax,%eax
    1e8b:	0f 85 b9 02 00 00    	jne    214a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    1e91:	83 ec 0c             	sub    $0xc,%esp
    1e94:	68 50 4a 00 00       	push   $0x4a50
    1e99:	e8 54 1a 00 00       	call   38f2 <chdir>
    1e9e:	83 c4 10             	add    $0x10,%esp
    1ea1:	85 c0                	test   %eax,%eax
    1ea3:	0f 85 a1 02 00 00    	jne    214a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    1ea9:	83 ec 0c             	sub    $0xc,%esp
    1eac:	68 5f 4a 00 00       	push   $0x4a5f
    1eb1:	e8 3c 1a 00 00       	call   38f2 <chdir>
    1eb6:	83 c4 10             	add    $0x10,%esp
    1eb9:	85 c0                	test   %eax,%eax
    1ebb:	0f 85 21 03 00 00    	jne    21e2 <subdir+0x4f2>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1ec1:	83 ec 08             	sub    $0x8,%esp
    1ec4:	6a 00                	push   $0x0
    1ec6:	68 f6 49 00 00       	push   $0x49f6
    1ecb:	e8 f2 19 00 00       	call   38c2 <open>
  if(fd < 0){
    1ed0:	83 c4 10             	add    $0x10,%esp
    1ed3:	85 c0                	test   %eax,%eax
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1ed5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1ed7:	0f 88 e0 04 00 00    	js     23bd <subdir+0x6cd>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1edd:	83 ec 04             	sub    $0x4,%esp
    1ee0:	68 00 20 00 00       	push   $0x2000
    1ee5:	68 20 8c 00 00       	push   $0x8c20
    1eea:	50                   	push   %eax
    1eeb:	e8 aa 19 00 00       	call   389a <read>
    1ef0:	83 c4 10             	add    $0x10,%esp
    1ef3:	83 f8 02             	cmp    $0x2,%eax
    1ef6:	0f 85 ae 04 00 00    	jne    23aa <subdir+0x6ba>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    1efc:	83 ec 0c             	sub    $0xc,%esp
    1eff:	53                   	push   %ebx
    1f00:	e8 a5 19 00 00       	call   38aa <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f05:	59                   	pop    %ecx
    1f06:	5b                   	pop    %ebx
    1f07:	6a 00                	push   $0x0
    1f09:	68 92 49 00 00       	push   $0x4992
    1f0e:	e8 af 19 00 00       	call   38c2 <open>
    1f13:	83 c4 10             	add    $0x10,%esp
    1f16:	85 c0                	test   %eax,%eax
    1f18:	0f 89 65 02 00 00    	jns    2183 <subdir+0x493>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f1e:	83 ec 08             	sub    $0x8,%esp
    1f21:	68 02 02 00 00       	push   $0x202
    1f26:	68 aa 4a 00 00       	push   $0x4aaa
    1f2b:	e8 92 19 00 00       	call   38c2 <open>
    1f30:	83 c4 10             	add    $0x10,%esp
    1f33:	85 c0                	test   %eax,%eax
    1f35:	0f 89 35 02 00 00    	jns    2170 <subdir+0x480>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1f3b:	83 ec 08             	sub    $0x8,%esp
    1f3e:	68 02 02 00 00       	push   $0x202
    1f43:	68 cf 4a 00 00       	push   $0x4acf
    1f48:	e8 75 19 00 00       	call   38c2 <open>
    1f4d:	83 c4 10             	add    $0x10,%esp
    1f50:	85 c0                	test   %eax,%eax
    1f52:	0f 89 0f 03 00 00    	jns    2267 <subdir+0x577>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    1f58:	83 ec 08             	sub    $0x8,%esp
    1f5b:	68 00 02 00 00       	push   $0x200
    1f60:	68 5c 4a 00 00       	push   $0x4a5c
    1f65:	e8 58 19 00 00       	call   38c2 <open>
    1f6a:	83 c4 10             	add    $0x10,%esp
    1f6d:	85 c0                	test   %eax,%eax
    1f6f:	0f 89 df 02 00 00    	jns    2254 <subdir+0x564>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    1f75:	83 ec 08             	sub    $0x8,%esp
    1f78:	6a 02                	push   $0x2
    1f7a:	68 5c 4a 00 00       	push   $0x4a5c
    1f7f:	e8 3e 19 00 00       	call   38c2 <open>
    1f84:	83 c4 10             	add    $0x10,%esp
    1f87:	85 c0                	test   %eax,%eax
    1f89:	0f 89 b2 02 00 00    	jns    2241 <subdir+0x551>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    1f8f:	83 ec 08             	sub    $0x8,%esp
    1f92:	6a 01                	push   $0x1
    1f94:	68 5c 4a 00 00       	push   $0x4a5c
    1f99:	e8 24 19 00 00       	call   38c2 <open>
    1f9e:	83 c4 10             	add    $0x10,%esp
    1fa1:	85 c0                	test   %eax,%eax
    1fa3:	0f 89 85 02 00 00    	jns    222e <subdir+0x53e>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1fa9:	83 ec 08             	sub    $0x8,%esp
    1fac:	68 3e 4b 00 00       	push   $0x4b3e
    1fb1:	68 aa 4a 00 00       	push   $0x4aaa
    1fb6:	e8 27 19 00 00       	call   38e2 <link>
    1fbb:	83 c4 10             	add    $0x10,%esp
    1fbe:	85 c0                	test   %eax,%eax
    1fc0:	0f 84 55 02 00 00    	je     221b <subdir+0x52b>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1fc6:	83 ec 08             	sub    $0x8,%esp
    1fc9:	68 3e 4b 00 00       	push   $0x4b3e
    1fce:	68 cf 4a 00 00       	push   $0x4acf
    1fd3:	e8 0a 19 00 00       	call   38e2 <link>
    1fd8:	83 c4 10             	add    $0x10,%esp
    1fdb:	85 c0                	test   %eax,%eax
    1fdd:	0f 84 25 02 00 00    	je     2208 <subdir+0x518>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    1fe3:	83 ec 08             	sub    $0x8,%esp
    1fe6:	68 f6 49 00 00       	push   $0x49f6
    1feb:	68 95 49 00 00       	push   $0x4995
    1ff0:	e8 ed 18 00 00       	call   38e2 <link>
    1ff5:	83 c4 10             	add    $0x10,%esp
    1ff8:	85 c0                	test   %eax,%eax
    1ffa:	0f 84 a9 01 00 00    	je     21a9 <subdir+0x4b9>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    2000:	83 ec 0c             	sub    $0xc,%esp
    2003:	68 aa 4a 00 00       	push   $0x4aaa
    2008:	e8 dd 18 00 00       	call   38ea <mkdir>
    200d:	83 c4 10             	add    $0x10,%esp
    2010:	85 c0                	test   %eax,%eax
    2012:	0f 84 7e 01 00 00    	je     2196 <subdir+0x4a6>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    2018:	83 ec 0c             	sub    $0xc,%esp
    201b:	68 cf 4a 00 00       	push   $0x4acf
    2020:	e8 c5 18 00 00       	call   38ea <mkdir>
    2025:	83 c4 10             	add    $0x10,%esp
    2028:	85 c0                	test   %eax,%eax
    202a:	0f 84 67 03 00 00    	je     2397 <subdir+0x6a7>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    2030:	83 ec 0c             	sub    $0xc,%esp
    2033:	68 f6 49 00 00       	push   $0x49f6
    2038:	e8 ad 18 00 00       	call   38ea <mkdir>
    203d:	83 c4 10             	add    $0x10,%esp
    2040:	85 c0                	test   %eax,%eax
    2042:	0f 84 3c 03 00 00    	je     2384 <subdir+0x694>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    2048:	83 ec 0c             	sub    $0xc,%esp
    204b:	68 cf 4a 00 00       	push   $0x4acf
    2050:	e8 7d 18 00 00       	call   38d2 <unlink>
    2055:	83 c4 10             	add    $0x10,%esp
    2058:	85 c0                	test   %eax,%eax
    205a:	0f 84 11 03 00 00    	je     2371 <subdir+0x681>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    2060:	83 ec 0c             	sub    $0xc,%esp
    2063:	68 aa 4a 00 00       	push   $0x4aaa
    2068:	e8 65 18 00 00       	call   38d2 <unlink>
    206d:	83 c4 10             	add    $0x10,%esp
    2070:	85 c0                	test   %eax,%eax
    2072:	0f 84 e6 02 00 00    	je     235e <subdir+0x66e>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    2078:	83 ec 0c             	sub    $0xc,%esp
    207b:	68 95 49 00 00       	push   $0x4995
    2080:	e8 6d 18 00 00       	call   38f2 <chdir>
    2085:	83 c4 10             	add    $0x10,%esp
    2088:	85 c0                	test   %eax,%eax
    208a:	0f 84 bb 02 00 00    	je     234b <subdir+0x65b>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    2090:	83 ec 0c             	sub    $0xc,%esp
    2093:	68 41 4b 00 00       	push   $0x4b41
    2098:	e8 55 18 00 00       	call   38f2 <chdir>
    209d:	83 c4 10             	add    $0x10,%esp
    20a0:	85 c0                	test   %eax,%eax
    20a2:	0f 84 90 02 00 00    	je     2338 <subdir+0x648>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    20a8:	83 ec 0c             	sub    $0xc,%esp
    20ab:	68 f6 49 00 00       	push   $0x49f6
    20b0:	e8 1d 18 00 00       	call   38d2 <unlink>
    20b5:	83 c4 10             	add    $0x10,%esp
    20b8:	85 c0                	test   %eax,%eax
    20ba:	0f 85 9d 00 00 00    	jne    215d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    20c0:	83 ec 0c             	sub    $0xc,%esp
    20c3:	68 95 49 00 00       	push   $0x4995
    20c8:	e8 05 18 00 00       	call   38d2 <unlink>
    20cd:	83 c4 10             	add    $0x10,%esp
    20d0:	85 c0                	test   %eax,%eax
    20d2:	0f 85 4d 02 00 00    	jne    2325 <subdir+0x635>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    20d8:	83 ec 0c             	sub    $0xc,%esp
    20db:	68 5c 4a 00 00       	push   $0x4a5c
    20e0:	e8 ed 17 00 00       	call   38d2 <unlink>
    20e5:	83 c4 10             	add    $0x10,%esp
    20e8:	85 c0                	test   %eax,%eax
    20ea:	0f 84 22 02 00 00    	je     2312 <subdir+0x622>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    20f0:	83 ec 0c             	sub    $0xc,%esp
    20f3:	68 71 49 00 00       	push   $0x4971
    20f8:	e8 d5 17 00 00       	call   38d2 <unlink>
    20fd:	83 c4 10             	add    $0x10,%esp
    2100:	85 c0                	test   %eax,%eax
    2102:	0f 88 f7 01 00 00    	js     22ff <subdir+0x60f>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    2108:	83 ec 0c             	sub    $0xc,%esp
    210b:	68 5c 4a 00 00       	push   $0x4a5c
    2110:	e8 bd 17 00 00       	call   38d2 <unlink>
    2115:	83 c4 10             	add    $0x10,%esp
    2118:	85 c0                	test   %eax,%eax
    211a:	0f 88 cc 01 00 00    	js     22ec <subdir+0x5fc>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    2120:	83 ec 08             	sub    $0x8,%esp
    2123:	68 3e 4c 00 00       	push   $0x4c3e
    2128:	6a 01                	push   $0x1
    212a:	e8 c1 18 00 00       	call   39f0 <printf>
}
    212f:	83 c4 10             	add    $0x10,%esp
    2132:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2135:	c9                   	leave  
    2136:	c3                   	ret    
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    2137:	50                   	push   %eax
    2138:	50                   	push   %eax
    2139:	68 db 49 00 00       	push   $0x49db
    213e:	6a 01                	push   $0x1
    2140:	e8 ab 18 00 00       	call   39f0 <printf>
    exit();
    2145:	e8 38 17 00 00       	call   3882 <exit>
  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    214a:	50                   	push   %eax
    214b:	50                   	push   %eax
    214c:	68 36 4a 00 00       	push   $0x4a36
    2151:	6a 01                	push   $0x1
    2153:	e8 98 18 00 00       	call   39f0 <printf>
    exit();
    2158:	e8 25 17 00 00       	call   3882 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    215d:	52                   	push   %edx
    215e:	52                   	push   %edx
    215f:	68 01 4a 00 00       	push   $0x4a01
    2164:	6a 01                	push   $0x1
    2166:	e8 85 18 00 00       	call   39f0 <printf>
    exit();
    216b:	e8 12 17 00 00       	call   3882 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    2170:	50                   	push   %eax
    2171:	50                   	push   %eax
    2172:	68 b3 4a 00 00       	push   $0x4ab3
    2177:	6a 01                	push   $0x1
    2179:	e8 72 18 00 00       	call   39f0 <printf>
    exit();
    217e:	e8 ff 16 00 00       	call   3882 <exit>
    exit();
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2183:	52                   	push   %edx
    2184:	52                   	push   %edx
    2185:	68 98 54 00 00       	push   $0x5498
    218a:	6a 01                	push   $0x1
    218c:	e8 5f 18 00 00       	call   39f0 <printf>
    exit();
    2191:	e8 ec 16 00 00       	call   3882 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2196:	52                   	push   %edx
    2197:	52                   	push   %edx
    2198:	68 47 4b 00 00       	push   $0x4b47
    219d:	6a 01                	push   $0x1
    219f:	e8 4c 18 00 00       	call   39f0 <printf>
    exit();
    21a4:	e8 d9 16 00 00       	call   3882 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    21a9:	51                   	push   %ecx
    21aa:	51                   	push   %ecx
    21ab:	68 08 55 00 00       	push   $0x5508
    21b0:	6a 01                	push   $0x1
    21b2:	e8 39 18 00 00       	call   39f0 <printf>
    exit();
    21b7:	e8 c6 16 00 00       	call   3882 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    21bc:	50                   	push   %eax
    21bd:	50                   	push   %eax
    21be:	68 c2 49 00 00       	push   $0x49c2
    21c3:	6a 01                	push   $0x1
    21c5:	e8 26 18 00 00       	call   39f0 <printf>
    exit();
    21ca:	e8 b3 16 00 00       	call   3882 <exit>
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    21cf:	51                   	push   %ecx
    21d0:	51                   	push   %ecx
    21d1:	68 9b 49 00 00       	push   $0x499b
    21d6:	6a 01                	push   $0x1
    21d8:	e8 13 18 00 00       	call   39f0 <printf>
    exit();
    21dd:	e8 a0 16 00 00       	call   3882 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    21e2:	50                   	push   %eax
    21e3:	50                   	push   %eax
    21e4:	68 64 4a 00 00       	push   $0x4a64
    21e9:	6a 01                	push   $0x1
    21eb:	e8 00 18 00 00       	call   39f0 <printf>
    exit();
    21f0:	e8 8d 16 00 00       	call   3882 <exit>
    exit();
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    21f5:	51                   	push   %ecx
    21f6:	51                   	push   %ecx
    21f7:	68 50 54 00 00       	push   $0x5450
    21fc:	6a 01                	push   $0x1
    21fe:	e8 ed 17 00 00       	call   39f0 <printf>
    exit();
    2203:	e8 7a 16 00 00       	call   3882 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2208:	53                   	push   %ebx
    2209:	53                   	push   %ebx
    220a:	68 e4 54 00 00       	push   $0x54e4
    220f:	6a 01                	push   $0x1
    2211:	e8 da 17 00 00       	call   39f0 <printf>
    exit();
    2216:	e8 67 16 00 00       	call   3882 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    221b:	50                   	push   %eax
    221c:	50                   	push   %eax
    221d:	68 c0 54 00 00       	push   $0x54c0
    2222:	6a 01                	push   $0x1
    2224:	e8 c7 17 00 00       	call   39f0 <printf>
    exit();
    2229:	e8 54 16 00 00       	call   3882 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    222e:	50                   	push   %eax
    222f:	50                   	push   %eax
    2230:	68 23 4b 00 00       	push   $0x4b23
    2235:	6a 01                	push   $0x1
    2237:	e8 b4 17 00 00       	call   39f0 <printf>
    exit();
    223c:	e8 41 16 00 00       	call   3882 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    2241:	50                   	push   %eax
    2242:	50                   	push   %eax
    2243:	68 0a 4b 00 00       	push   $0x4b0a
    2248:	6a 01                	push   $0x1
    224a:	e8 a1 17 00 00       	call   39f0 <printf>
    exit();
    224f:	e8 2e 16 00 00       	call   3882 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    2254:	50                   	push   %eax
    2255:	50                   	push   %eax
    2256:	68 f4 4a 00 00       	push   $0x4af4
    225b:	6a 01                	push   $0x1
    225d:	e8 8e 17 00 00       	call   39f0 <printf>
    exit();
    2262:	e8 1b 16 00 00       	call   3882 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    2267:	50                   	push   %eax
    2268:	50                   	push   %eax
    2269:	68 d8 4a 00 00       	push   $0x4ad8
    226e:	6a 01                	push   $0x1
    2270:	e8 7b 17 00 00       	call   39f0 <printf>
    exit();
    2275:	e8 08 16 00 00       	call   3882 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    227a:	50                   	push   %eax
    227b:	50                   	push   %eax
    227c:	68 19 4a 00 00       	push   $0x4a19
    2281:	6a 01                	push   $0x1
    2283:	e8 68 17 00 00       	call   39f0 <printf>
    exit();
    2288:	e8 f5 15 00 00       	call   3882 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    228d:	50                   	push   %eax
    228e:	50                   	push   %eax
    228f:	68 74 54 00 00       	push   $0x5474
    2294:	6a 01                	push   $0x1
    2296:	e8 55 17 00 00       	call   39f0 <printf>
    exit();
    229b:	e8 e2 15 00 00       	call   3882 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    22a0:	53                   	push   %ebx
    22a1:	53                   	push   %ebx
    22a2:	68 77 49 00 00       	push   $0x4977
    22a7:	6a 01                	push   $0x1
    22a9:	e8 42 17 00 00       	call   39f0 <printf>
    exit();
    22ae:	e8 cf 15 00 00       	call   3882 <exit>
  }
  write(fd, "ff", 2);
  close(fd);

  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    22b3:	50                   	push   %eax
    22b4:	50                   	push   %eax
    22b5:	68 28 54 00 00       	push   $0x5428
    22ba:	6a 01                	push   $0x1
    22bc:	e8 2f 17 00 00       	call   39f0 <printf>
    exit();
    22c1:	e8 bc 15 00 00       	call   3882 <exit>
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    22c6:	50                   	push   %eax
    22c7:	50                   	push   %eax
    22c8:	68 5b 49 00 00       	push   $0x495b
    22cd:	6a 01                	push   $0x1
    22cf:	e8 1c 17 00 00       	call   39f0 <printf>
    exit();
    22d4:	e8 a9 15 00 00       	call   3882 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    22d9:	50                   	push   %eax
    22da:	50                   	push   %eax
    22db:	68 43 49 00 00       	push   $0x4943
    22e0:	6a 01                	push   $0x1
    22e2:	e8 09 17 00 00       	call   39f0 <printf>
    exit();
    22e7:	e8 96 15 00 00       	call   3882 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    22ec:	50                   	push   %eax
    22ed:	50                   	push   %eax
    22ee:	68 2c 4c 00 00       	push   $0x4c2c
    22f3:	6a 01                	push   $0x1
    22f5:	e8 f6 16 00 00       	call   39f0 <printf>
    exit();
    22fa:	e8 83 15 00 00       	call   3882 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    22ff:	52                   	push   %edx
    2300:	52                   	push   %edx
    2301:	68 17 4c 00 00       	push   $0x4c17
    2306:	6a 01                	push   $0x1
    2308:	e8 e3 16 00 00       	call   39f0 <printf>
    exit();
    230d:	e8 70 15 00 00       	call   3882 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    2312:	51                   	push   %ecx
    2313:	51                   	push   %ecx
    2314:	68 2c 55 00 00       	push   $0x552c
    2319:	6a 01                	push   $0x1
    231b:	e8 d0 16 00 00       	call   39f0 <printf>
    exit();
    2320:	e8 5d 15 00 00       	call   3882 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    2325:	53                   	push   %ebx
    2326:	53                   	push   %ebx
    2327:	68 02 4c 00 00       	push   $0x4c02
    232c:	6a 01                	push   $0x1
    232e:	e8 bd 16 00 00       	call   39f0 <printf>
    exit();
    2333:	e8 4a 15 00 00       	call   3882 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    2338:	50                   	push   %eax
    2339:	50                   	push   %eax
    233a:	68 ea 4b 00 00       	push   $0x4bea
    233f:	6a 01                	push   $0x1
    2341:	e8 aa 16 00 00       	call   39f0 <printf>
    exit();
    2346:	e8 37 15 00 00       	call   3882 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    234b:	50                   	push   %eax
    234c:	50                   	push   %eax
    234d:	68 d2 4b 00 00       	push   $0x4bd2
    2352:	6a 01                	push   $0x1
    2354:	e8 97 16 00 00       	call   39f0 <printf>
    exit();
    2359:	e8 24 15 00 00       	call   3882 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    235e:	50                   	push   %eax
    235f:	50                   	push   %eax
    2360:	68 b6 4b 00 00       	push   $0x4bb6
    2365:	6a 01                	push   $0x1
    2367:	e8 84 16 00 00       	call   39f0 <printf>
    exit();
    236c:	e8 11 15 00 00       	call   3882 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2371:	50                   	push   %eax
    2372:	50                   	push   %eax
    2373:	68 9a 4b 00 00       	push   $0x4b9a
    2378:	6a 01                	push   $0x1
    237a:	e8 71 16 00 00       	call   39f0 <printf>
    exit();
    237f:	e8 fe 14 00 00       	call   3882 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2384:	50                   	push   %eax
    2385:	50                   	push   %eax
    2386:	68 7d 4b 00 00       	push   $0x4b7d
    238b:	6a 01                	push   $0x1
    238d:	e8 5e 16 00 00       	call   39f0 <printf>
    exit();
    2392:	e8 eb 14 00 00       	call   3882 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2397:	50                   	push   %eax
    2398:	50                   	push   %eax
    2399:	68 62 4b 00 00       	push   $0x4b62
    239e:	6a 01                	push   $0x1
    23a0:	e8 4b 16 00 00       	call   39f0 <printf>
    exit();
    23a5:	e8 d8 14 00 00       	call   3882 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    23aa:	50                   	push   %eax
    23ab:	50                   	push   %eax
    23ac:	68 8f 4a 00 00       	push   $0x4a8f
    23b1:	6a 01                	push   $0x1
    23b3:	e8 38 16 00 00       	call   39f0 <printf>
    exit();
    23b8:	e8 c5 14 00 00       	call   3882 <exit>
    exit();
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    23bd:	50                   	push   %eax
    23be:	50                   	push   %eax
    23bf:	68 77 4a 00 00       	push   $0x4a77
    23c4:	6a 01                	push   $0x1
    23c6:	e8 25 16 00 00       	call   39f0 <printf>
    exit();
    23cb:	e8 b2 14 00 00       	call   3882 <exit>

000023d0 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    23d0:	55                   	push   %ebp
    23d1:	89 e5                	mov    %esp,%ebp
    23d3:	56                   	push   %esi
    23d4:	53                   	push   %ebx
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    23d5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    23da:	83 ec 08             	sub    $0x8,%esp
    23dd:	68 49 4c 00 00       	push   $0x4c49
    23e2:	6a 01                	push   $0x1
    23e4:	e8 07 16 00 00       	call   39f0 <printf>

  unlink("bigwrite");
    23e9:	c7 04 24 58 4c 00 00 	movl   $0x4c58,(%esp)
    23f0:	e8 dd 14 00 00       	call   38d2 <unlink>
    23f5:	83 c4 10             	add    $0x10,%esp
    23f8:	90                   	nop
    23f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2400:	83 ec 08             	sub    $0x8,%esp
    2403:	68 02 02 00 00       	push   $0x202
    2408:	68 58 4c 00 00       	push   $0x4c58
    240d:	e8 b0 14 00 00       	call   38c2 <open>
    if(fd < 0){
    2412:	83 c4 10             	add    $0x10,%esp
    2415:	85 c0                	test   %eax,%eax

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2417:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2419:	78 7e                	js     2499 <bigwrite+0xc9>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    241b:	83 ec 04             	sub    $0x4,%esp
    241e:	53                   	push   %ebx
    241f:	68 20 8c 00 00       	push   $0x8c20
    2424:	50                   	push   %eax
    2425:	e8 78 14 00 00       	call   38a2 <write>
      if(cc != sz){
    242a:	83 c4 10             	add    $0x10,%esp
    242d:	39 c3                	cmp    %eax,%ebx
    242f:	75 55                	jne    2486 <bigwrite+0xb6>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    2431:	83 ec 04             	sub    $0x4,%esp
    2434:	53                   	push   %ebx
    2435:	68 20 8c 00 00       	push   $0x8c20
    243a:	56                   	push   %esi
    243b:	e8 62 14 00 00       	call   38a2 <write>
      if(cc != sz){
    2440:	83 c4 10             	add    $0x10,%esp
    2443:	39 c3                	cmp    %eax,%ebx
    2445:	75 3f                	jne    2486 <bigwrite+0xb6>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2447:	83 ec 0c             	sub    $0xc,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    244a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2450:	56                   	push   %esi
    2451:	e8 54 14 00 00       	call   38aa <close>
    unlink("bigwrite");
    2456:	c7 04 24 58 4c 00 00 	movl   $0x4c58,(%esp)
    245d:	e8 70 14 00 00       	call   38d2 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2462:	83 c4 10             	add    $0x10,%esp
    2465:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    246b:	75 93                	jne    2400 <bigwrite+0x30>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    246d:	83 ec 08             	sub    $0x8,%esp
    2470:	68 8b 4c 00 00       	push   $0x4c8b
    2475:	6a 01                	push   $0x1
    2477:	e8 74 15 00 00       	call   39f0 <printf>
}
    247c:	83 c4 10             	add    $0x10,%esp
    247f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    2482:	5b                   	pop    %ebx
    2483:	5e                   	pop    %esi
    2484:	5d                   	pop    %ebp
    2485:	c3                   	ret    
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    2486:	50                   	push   %eax
    2487:	53                   	push   %ebx
    2488:	68 79 4c 00 00       	push   $0x4c79
    248d:	6a 01                	push   $0x1
    248f:	e8 5c 15 00 00       	call   39f0 <printf>
        exit();
    2494:	e8 e9 13 00 00       	call   3882 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    2499:	83 ec 08             	sub    $0x8,%esp
    249c:	68 61 4c 00 00       	push   $0x4c61
    24a1:	6a 01                	push   $0x1
    24a3:	e8 48 15 00 00       	call   39f0 <printf>
      exit();
    24a8:	e8 d5 13 00 00       	call   3882 <exit>
    24ad:	8d 76 00             	lea    0x0(%esi),%esi

000024b0 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    24b0:	55                   	push   %ebp
    24b1:	89 e5                	mov    %esp,%ebp
    24b3:	57                   	push   %edi
    24b4:	56                   	push   %esi
    24b5:	53                   	push   %ebx
    24b6:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    24b9:	68 98 4c 00 00       	push   $0x4c98
    24be:	6a 01                	push   $0x1
    24c0:	e8 2b 15 00 00       	call   39f0 <printf>

  unlink("bigfile");
    24c5:	c7 04 24 b4 4c 00 00 	movl   $0x4cb4,(%esp)
    24cc:	e8 01 14 00 00       	call   38d2 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    24d1:	5e                   	pop    %esi
    24d2:	5f                   	pop    %edi
    24d3:	68 02 02 00 00       	push   $0x202
    24d8:	68 b4 4c 00 00       	push   $0x4cb4
    24dd:	e8 e0 13 00 00       	call   38c2 <open>
  if(fd < 0){
    24e2:	83 c4 10             	add    $0x10,%esp
    24e5:	85 c0                	test   %eax,%eax
    24e7:	0f 88 5f 01 00 00    	js     264c <bigfile+0x19c>
    24ed:	89 c6                	mov    %eax,%esi
    24ef:	31 db                	xor    %ebx,%ebx
    24f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    24f8:	83 ec 04             	sub    $0x4,%esp
    24fb:	68 58 02 00 00       	push   $0x258
    2500:	53                   	push   %ebx
    2501:	68 20 8c 00 00       	push   $0x8c20
    2506:	e8 e5 11 00 00       	call   36f0 <memset>
    if(write(fd, buf, 600) != 600){
    250b:	83 c4 0c             	add    $0xc,%esp
    250e:	68 58 02 00 00       	push   $0x258
    2513:	68 20 8c 00 00       	push   $0x8c20
    2518:	56                   	push   %esi
    2519:	e8 84 13 00 00       	call   38a2 <write>
    251e:	83 c4 10             	add    $0x10,%esp
    2521:	3d 58 02 00 00       	cmp    $0x258,%eax
    2526:	0f 85 f8 00 00 00    	jne    2624 <bigfile+0x174>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    252c:	83 c3 01             	add    $0x1,%ebx
    252f:	83 fb 14             	cmp    $0x14,%ebx
    2532:	75 c4                	jne    24f8 <bigfile+0x48>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    2534:	83 ec 0c             	sub    $0xc,%esp
    2537:	56                   	push   %esi
    2538:	e8 6d 13 00 00       	call   38aa <close>

  fd = open("bigfile", 0);
    253d:	59                   	pop    %ecx
    253e:	5b                   	pop    %ebx
    253f:	6a 00                	push   $0x0
    2541:	68 b4 4c 00 00       	push   $0x4cb4
    2546:	e8 77 13 00 00       	call   38c2 <open>
  if(fd < 0){
    254b:	83 c4 10             	add    $0x10,%esp
    254e:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  close(fd);

  fd = open("bigfile", 0);
    2550:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2552:	0f 88 e0 00 00 00    	js     2638 <bigfile+0x188>
    2558:	31 db                	xor    %ebx,%ebx
    255a:	31 ff                	xor    %edi,%edi
    255c:	eb 30                	jmp    258e <bigfile+0xde>
    255e:	66 90                	xchg   %ax,%ax
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    2560:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2565:	0f 85 91 00 00 00    	jne    25fc <bigfile+0x14c>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    256b:	0f be 05 20 8c 00 00 	movsbl 0x8c20,%eax
    2572:	89 fa                	mov    %edi,%edx
    2574:	d1 fa                	sar    %edx
    2576:	39 d0                	cmp    %edx,%eax
    2578:	75 6e                	jne    25e8 <bigfile+0x138>
    257a:	0f be 15 4b 8d 00 00 	movsbl 0x8d4b,%edx
    2581:	39 d0                	cmp    %edx,%eax
    2583:	75 63                	jne    25e8 <bigfile+0x138>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    2585:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    258b:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    258e:	83 ec 04             	sub    $0x4,%esp
    2591:	68 2c 01 00 00       	push   $0x12c
    2596:	68 20 8c 00 00       	push   $0x8c20
    259b:	56                   	push   %esi
    259c:	e8 f9 12 00 00       	call   389a <read>
    if(cc < 0){
    25a1:	83 c4 10             	add    $0x10,%esp
    25a4:	85 c0                	test   %eax,%eax
    25a6:	78 68                	js     2610 <bigfile+0x160>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    25a8:	75 b6                	jne    2560 <bigfile+0xb0>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    25aa:	83 ec 0c             	sub    $0xc,%esp
    25ad:	56                   	push   %esi
    25ae:	e8 f7 12 00 00       	call   38aa <close>
  if(total != 20*600){
    25b3:	83 c4 10             	add    $0x10,%esp
    25b6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    25bc:	0f 85 9e 00 00 00    	jne    2660 <bigfile+0x1b0>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    25c2:	83 ec 0c             	sub    $0xc,%esp
    25c5:	68 b4 4c 00 00       	push   $0x4cb4
    25ca:	e8 03 13 00 00       	call   38d2 <unlink>

  printf(1, "bigfile test ok\n");
    25cf:	58                   	pop    %eax
    25d0:	5a                   	pop    %edx
    25d1:	68 43 4d 00 00       	push   $0x4d43
    25d6:	6a 01                	push   $0x1
    25d8:	e8 13 14 00 00       	call   39f0 <printf>
}
    25dd:	83 c4 10             	add    $0x10,%esp
    25e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    25e3:	5b                   	pop    %ebx
    25e4:	5e                   	pop    %esi
    25e5:	5f                   	pop    %edi
    25e6:	5d                   	pop    %ebp
    25e7:	c3                   	ret    
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    25e8:	83 ec 08             	sub    $0x8,%esp
    25eb:	68 10 4d 00 00       	push   $0x4d10
    25f0:	6a 01                	push   $0x1
    25f2:	e8 f9 13 00 00       	call   39f0 <printf>
      exit();
    25f7:	e8 86 12 00 00       	call   3882 <exit>
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    25fc:	83 ec 08             	sub    $0x8,%esp
    25ff:	68 fc 4c 00 00       	push   $0x4cfc
    2604:	6a 01                	push   $0x1
    2606:	e8 e5 13 00 00       	call   39f0 <printf>
      exit();
    260b:	e8 72 12 00 00       	call   3882 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    2610:	83 ec 08             	sub    $0x8,%esp
    2613:	68 e7 4c 00 00       	push   $0x4ce7
    2618:	6a 01                	push   $0x1
    261a:	e8 d1 13 00 00       	call   39f0 <printf>
      exit();
    261f:	e8 5e 12 00 00       	call   3882 <exit>
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    2624:	83 ec 08             	sub    $0x8,%esp
    2627:	68 bc 4c 00 00       	push   $0x4cbc
    262c:	6a 01                	push   $0x1
    262e:	e8 bd 13 00 00       	call   39f0 <printf>
      exit();
    2633:	e8 4a 12 00 00       	call   3882 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    2638:	83 ec 08             	sub    $0x8,%esp
    263b:	68 d2 4c 00 00       	push   $0x4cd2
    2640:	6a 01                	push   $0x1
    2642:	e8 a9 13 00 00       	call   39f0 <printf>
    exit();
    2647:	e8 36 12 00 00       	call   3882 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    264c:	83 ec 08             	sub    $0x8,%esp
    264f:	68 a6 4c 00 00       	push   $0x4ca6
    2654:	6a 01                	push   $0x1
    2656:	e8 95 13 00 00       	call   39f0 <printf>
    exit();
    265b:	e8 22 12 00 00       	call   3882 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    2660:	83 ec 08             	sub    $0x8,%esp
    2663:	68 29 4d 00 00       	push   $0x4d29
    2668:	6a 01                	push   $0x1
    266a:	e8 81 13 00 00       	call   39f0 <printf>
    exit();
    266f:	e8 0e 12 00 00       	call   3882 <exit>
    2674:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    267a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00002680 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    2680:	55                   	push   %ebp
    2681:	89 e5                	mov    %esp,%ebp
    2683:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2686:	68 54 4d 00 00       	push   $0x4d54
    268b:	6a 01                	push   $0x1
    268d:	e8 5e 13 00 00       	call   39f0 <printf>

  if(mkdir("12345678901234") != 0){
    2692:	c7 04 24 8f 4d 00 00 	movl   $0x4d8f,(%esp)
    2699:	e8 4c 12 00 00       	call   38ea <mkdir>
    269e:	83 c4 10             	add    $0x10,%esp
    26a1:	85 c0                	test   %eax,%eax
    26a3:	0f 85 97 00 00 00    	jne    2740 <fourteen+0xc0>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    26a9:	83 ec 0c             	sub    $0xc,%esp
    26ac:	68 4c 55 00 00       	push   $0x554c
    26b1:	e8 34 12 00 00       	call   38ea <mkdir>
    26b6:	83 c4 10             	add    $0x10,%esp
    26b9:	85 c0                	test   %eax,%eax
    26bb:	0f 85 de 00 00 00    	jne    279f <fourteen+0x11f>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    26c1:	83 ec 08             	sub    $0x8,%esp
    26c4:	68 00 02 00 00       	push   $0x200
    26c9:	68 9c 55 00 00       	push   $0x559c
    26ce:	e8 ef 11 00 00       	call   38c2 <open>
  if(fd < 0){
    26d3:	83 c4 10             	add    $0x10,%esp
    26d6:	85 c0                	test   %eax,%eax
    26d8:	0f 88 ae 00 00 00    	js     278c <fourteen+0x10c>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    26de:	83 ec 0c             	sub    $0xc,%esp
    26e1:	50                   	push   %eax
    26e2:	e8 c3 11 00 00       	call   38aa <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    26e7:	58                   	pop    %eax
    26e8:	5a                   	pop    %edx
    26e9:	6a 00                	push   $0x0
    26eb:	68 0c 56 00 00       	push   $0x560c
    26f0:	e8 cd 11 00 00       	call   38c2 <open>
  if(fd < 0){
    26f5:	83 c4 10             	add    $0x10,%esp
    26f8:	85 c0                	test   %eax,%eax
    26fa:	78 7d                	js     2779 <fourteen+0xf9>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    26fc:	83 ec 0c             	sub    $0xc,%esp
    26ff:	50                   	push   %eax
    2700:	e8 a5 11 00 00       	call   38aa <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2705:	c7 04 24 80 4d 00 00 	movl   $0x4d80,(%esp)
    270c:	e8 d9 11 00 00       	call   38ea <mkdir>
    2711:	83 c4 10             	add    $0x10,%esp
    2714:	85 c0                	test   %eax,%eax
    2716:	74 4e                	je     2766 <fourteen+0xe6>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2718:	83 ec 0c             	sub    $0xc,%esp
    271b:	68 a8 56 00 00       	push   $0x56a8
    2720:	e8 c5 11 00 00       	call   38ea <mkdir>
    2725:	83 c4 10             	add    $0x10,%esp
    2728:	85 c0                	test   %eax,%eax
    272a:	74 27                	je     2753 <fourteen+0xd3>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    272c:	83 ec 08             	sub    $0x8,%esp
    272f:	68 9e 4d 00 00       	push   $0x4d9e
    2734:	6a 01                	push   $0x1
    2736:	e8 b5 12 00 00       	call   39f0 <printf>
}
    273b:	83 c4 10             	add    $0x10,%esp
    273e:	c9                   	leave  
    273f:	c3                   	ret    

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    2740:	50                   	push   %eax
    2741:	50                   	push   %eax
    2742:	68 63 4d 00 00       	push   $0x4d63
    2747:	6a 01                	push   $0x1
    2749:	e8 a2 12 00 00       	call   39f0 <printf>
    exit();
    274e:	e8 2f 11 00 00       	call   3882 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2753:	50                   	push   %eax
    2754:	50                   	push   %eax
    2755:	68 c8 56 00 00       	push   $0x56c8
    275a:	6a 01                	push   $0x1
    275c:	e8 8f 12 00 00       	call   39f0 <printf>
    exit();
    2761:	e8 1c 11 00 00       	call   3882 <exit>
    exit();
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2766:	52                   	push   %edx
    2767:	52                   	push   %edx
    2768:	68 78 56 00 00       	push   $0x5678
    276d:	6a 01                	push   $0x1
    276f:	e8 7c 12 00 00       	call   39f0 <printf>
    exit();
    2774:	e8 09 11 00 00       	call   3882 <exit>
    exit();
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2779:	51                   	push   %ecx
    277a:	51                   	push   %ecx
    277b:	68 3c 56 00 00       	push   $0x563c
    2780:	6a 01                	push   $0x1
    2782:	e8 69 12 00 00       	call   39f0 <printf>
    exit();
    2787:	e8 f6 10 00 00       	call   3882 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    278c:	51                   	push   %ecx
    278d:	51                   	push   %ecx
    278e:	68 cc 55 00 00       	push   $0x55cc
    2793:	6a 01                	push   $0x1
    2795:	e8 56 12 00 00       	call   39f0 <printf>
    exit();
    279a:	e8 e3 10 00 00       	call   3882 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    279f:	50                   	push   %eax
    27a0:	50                   	push   %eax
    27a1:	68 6c 55 00 00       	push   $0x556c
    27a6:	6a 01                	push   $0x1
    27a8:	e8 43 12 00 00       	call   39f0 <printf>
    exit();
    27ad:	e8 d0 10 00 00       	call   3882 <exit>
    27b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    27b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000027c0 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    27c0:	55                   	push   %ebp
    27c1:	89 e5                	mov    %esp,%ebp
    27c3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    27c6:	68 ab 4d 00 00       	push   $0x4dab
    27cb:	6a 01                	push   $0x1
    27cd:	e8 1e 12 00 00       	call   39f0 <printf>
  if(mkdir("dots") != 0){
    27d2:	c7 04 24 b7 4d 00 00 	movl   $0x4db7,(%esp)
    27d9:	e8 0c 11 00 00       	call   38ea <mkdir>
    27de:	83 c4 10             	add    $0x10,%esp
    27e1:	85 c0                	test   %eax,%eax
    27e3:	0f 85 b0 00 00 00    	jne    2899 <rmdot+0xd9>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    27e9:	83 ec 0c             	sub    $0xc,%esp
    27ec:	68 b7 4d 00 00       	push   $0x4db7
    27f1:	e8 fc 10 00 00       	call   38f2 <chdir>
    27f6:	83 c4 10             	add    $0x10,%esp
    27f9:	85 c0                	test   %eax,%eax
    27fb:	0f 85 1d 01 00 00    	jne    291e <rmdot+0x15e>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    2801:	83 ec 0c             	sub    $0xc,%esp
    2804:	68 62 4a 00 00       	push   $0x4a62
    2809:	e8 c4 10 00 00       	call   38d2 <unlink>
    280e:	83 c4 10             	add    $0x10,%esp
    2811:	85 c0                	test   %eax,%eax
    2813:	0f 84 f2 00 00 00    	je     290b <rmdot+0x14b>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    2819:	83 ec 0c             	sub    $0xc,%esp
    281c:	68 61 4a 00 00       	push   $0x4a61
    2821:	e8 ac 10 00 00       	call   38d2 <unlink>
    2826:	83 c4 10             	add    $0x10,%esp
    2829:	85 c0                	test   %eax,%eax
    282b:	0f 84 c7 00 00 00    	je     28f8 <rmdot+0x138>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    2831:	83 ec 0c             	sub    $0xc,%esp
    2834:	68 35 42 00 00       	push   $0x4235
    2839:	e8 b4 10 00 00       	call   38f2 <chdir>
    283e:	83 c4 10             	add    $0x10,%esp
    2841:	85 c0                	test   %eax,%eax
    2843:	0f 85 9c 00 00 00    	jne    28e5 <rmdot+0x125>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    2849:	83 ec 0c             	sub    $0xc,%esp
    284c:	68 ff 4d 00 00       	push   $0x4dff
    2851:	e8 7c 10 00 00       	call   38d2 <unlink>
    2856:	83 c4 10             	add    $0x10,%esp
    2859:	85 c0                	test   %eax,%eax
    285b:	74 75                	je     28d2 <rmdot+0x112>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    285d:	83 ec 0c             	sub    $0xc,%esp
    2860:	68 1d 4e 00 00       	push   $0x4e1d
    2865:	e8 68 10 00 00       	call   38d2 <unlink>
    286a:	83 c4 10             	add    $0x10,%esp
    286d:	85 c0                	test   %eax,%eax
    286f:	74 4e                	je     28bf <rmdot+0xff>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    2871:	83 ec 0c             	sub    $0xc,%esp
    2874:	68 b7 4d 00 00       	push   $0x4db7
    2879:	e8 54 10 00 00       	call   38d2 <unlink>
    287e:	83 c4 10             	add    $0x10,%esp
    2881:	85 c0                	test   %eax,%eax
    2883:	75 27                	jne    28ac <rmdot+0xec>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    2885:	83 ec 08             	sub    $0x8,%esp
    2888:	68 52 4e 00 00       	push   $0x4e52
    288d:	6a 01                	push   $0x1
    288f:	e8 5c 11 00 00       	call   39f0 <printf>
}
    2894:	83 c4 10             	add    $0x10,%esp
    2897:	c9                   	leave  
    2898:	c3                   	ret    
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    2899:	50                   	push   %eax
    289a:	50                   	push   %eax
    289b:	68 bc 4d 00 00       	push   $0x4dbc
    28a0:	6a 01                	push   $0x1
    28a2:	e8 49 11 00 00       	call   39f0 <printf>
    exit();
    28a7:	e8 d6 0f 00 00       	call   3882 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    28ac:	50                   	push   %eax
    28ad:	50                   	push   %eax
    28ae:	68 3d 4e 00 00       	push   $0x4e3d
    28b3:	6a 01                	push   $0x1
    28b5:	e8 36 11 00 00       	call   39f0 <printf>
    exit();
    28ba:	e8 c3 0f 00 00       	call   3882 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    28bf:	52                   	push   %edx
    28c0:	52                   	push   %edx
    28c1:	68 25 4e 00 00       	push   $0x4e25
    28c6:	6a 01                	push   $0x1
    28c8:	e8 23 11 00 00       	call   39f0 <printf>
    exit();
    28cd:	e8 b0 0f 00 00       	call   3882 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    28d2:	51                   	push   %ecx
    28d3:	51                   	push   %ecx
    28d4:	68 06 4e 00 00       	push   $0x4e06
    28d9:	6a 01                	push   $0x1
    28db:	e8 10 11 00 00       	call   39f0 <printf>
    exit();
    28e0:	e8 9d 0f 00 00       	call   3882 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    28e5:	50                   	push   %eax
    28e6:	50                   	push   %eax
    28e7:	68 37 42 00 00       	push   $0x4237
    28ec:	6a 01                	push   $0x1
    28ee:	e8 fd 10 00 00       	call   39f0 <printf>
    exit();
    28f3:	e8 8a 0f 00 00       	call   3882 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    28f8:	50                   	push   %eax
    28f9:	50                   	push   %eax
    28fa:	68 f0 4d 00 00       	push   $0x4df0
    28ff:	6a 01                	push   $0x1
    2901:	e8 ea 10 00 00       	call   39f0 <printf>
    exit();
    2906:	e8 77 0f 00 00       	call   3882 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    290b:	50                   	push   %eax
    290c:	50                   	push   %eax
    290d:	68 e2 4d 00 00       	push   $0x4de2
    2912:	6a 01                	push   $0x1
    2914:	e8 d7 10 00 00       	call   39f0 <printf>
    exit();
    2919:	e8 64 0f 00 00       	call   3882 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    291e:	50                   	push   %eax
    291f:	50                   	push   %eax
    2920:	68 cf 4d 00 00       	push   $0x4dcf
    2925:	6a 01                	push   $0x1
    2927:	e8 c4 10 00 00       	call   39f0 <printf>
    exit();
    292c:	e8 51 0f 00 00       	call   3882 <exit>
    2931:	eb 0d                	jmp    2940 <dirfile>
    2933:	90                   	nop
    2934:	90                   	nop
    2935:	90                   	nop
    2936:	90                   	nop
    2937:	90                   	nop
    2938:	90                   	nop
    2939:	90                   	nop
    293a:	90                   	nop
    293b:	90                   	nop
    293c:	90                   	nop
    293d:	90                   	nop
    293e:	90                   	nop
    293f:	90                   	nop

00002940 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    2940:	55                   	push   %ebp
    2941:	89 e5                	mov    %esp,%ebp
    2943:	53                   	push   %ebx
    2944:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    2947:	68 5c 4e 00 00       	push   $0x4e5c
    294c:	6a 01                	push   $0x1
    294e:	e8 9d 10 00 00       	call   39f0 <printf>

  fd = open("dirfile", O_CREATE);
    2953:	59                   	pop    %ecx
    2954:	5b                   	pop    %ebx
    2955:	68 00 02 00 00       	push   $0x200
    295a:	68 69 4e 00 00       	push   $0x4e69
    295f:	e8 5e 0f 00 00       	call   38c2 <open>
  if(fd < 0){
    2964:	83 c4 10             	add    $0x10,%esp
    2967:	85 c0                	test   %eax,%eax
    2969:	0f 88 43 01 00 00    	js     2ab2 <dirfile+0x172>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    296f:	83 ec 0c             	sub    $0xc,%esp
    2972:	50                   	push   %eax
    2973:	e8 32 0f 00 00       	call   38aa <close>
  if(chdir("dirfile") == 0){
    2978:	c7 04 24 69 4e 00 00 	movl   $0x4e69,(%esp)
    297f:	e8 6e 0f 00 00       	call   38f2 <chdir>
    2984:	83 c4 10             	add    $0x10,%esp
    2987:	85 c0                	test   %eax,%eax
    2989:	0f 84 10 01 00 00    	je     2a9f <dirfile+0x15f>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    298f:	83 ec 08             	sub    $0x8,%esp
    2992:	6a 00                	push   $0x0
    2994:	68 a2 4e 00 00       	push   $0x4ea2
    2999:	e8 24 0f 00 00       	call   38c2 <open>
  if(fd >= 0){
    299e:	83 c4 10             	add    $0x10,%esp
    29a1:	85 c0                	test   %eax,%eax
    29a3:	0f 89 e3 00 00 00    	jns    2a8c <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    29a9:	83 ec 08             	sub    $0x8,%esp
    29ac:	68 00 02 00 00       	push   $0x200
    29b1:	68 a2 4e 00 00       	push   $0x4ea2
    29b6:	e8 07 0f 00 00       	call   38c2 <open>
  if(fd >= 0){
    29bb:	83 c4 10             	add    $0x10,%esp
    29be:	85 c0                	test   %eax,%eax
    29c0:	0f 89 c6 00 00 00    	jns    2a8c <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    29c6:	83 ec 0c             	sub    $0xc,%esp
    29c9:	68 a2 4e 00 00       	push   $0x4ea2
    29ce:	e8 17 0f 00 00       	call   38ea <mkdir>
    29d3:	83 c4 10             	add    $0x10,%esp
    29d6:	85 c0                	test   %eax,%eax
    29d8:	0f 84 46 01 00 00    	je     2b24 <dirfile+0x1e4>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    29de:	83 ec 0c             	sub    $0xc,%esp
    29e1:	68 a2 4e 00 00       	push   $0x4ea2
    29e6:	e8 e7 0e 00 00       	call   38d2 <unlink>
    29eb:	83 c4 10             	add    $0x10,%esp
    29ee:	85 c0                	test   %eax,%eax
    29f0:	0f 84 1b 01 00 00    	je     2b11 <dirfile+0x1d1>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    29f6:	83 ec 08             	sub    $0x8,%esp
    29f9:	68 a2 4e 00 00       	push   $0x4ea2
    29fe:	68 06 4f 00 00       	push   $0x4f06
    2a03:	e8 da 0e 00 00       	call   38e2 <link>
    2a08:	83 c4 10             	add    $0x10,%esp
    2a0b:	85 c0                	test   %eax,%eax
    2a0d:	0f 84 eb 00 00 00    	je     2afe <dirfile+0x1be>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    2a13:	83 ec 0c             	sub    $0xc,%esp
    2a16:	68 69 4e 00 00       	push   $0x4e69
    2a1b:	e8 b2 0e 00 00       	call   38d2 <unlink>
    2a20:	83 c4 10             	add    $0x10,%esp
    2a23:	85 c0                	test   %eax,%eax
    2a25:	0f 85 c0 00 00 00    	jne    2aeb <dirfile+0x1ab>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    2a2b:	83 ec 08             	sub    $0x8,%esp
    2a2e:	6a 02                	push   $0x2
    2a30:	68 62 4a 00 00       	push   $0x4a62
    2a35:	e8 88 0e 00 00       	call   38c2 <open>
  if(fd >= 0){
    2a3a:	83 c4 10             	add    $0x10,%esp
    2a3d:	85 c0                	test   %eax,%eax
    2a3f:	0f 89 93 00 00 00    	jns    2ad8 <dirfile+0x198>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2a45:	83 ec 08             	sub    $0x8,%esp
    2a48:	6a 00                	push   $0x0
    2a4a:	68 62 4a 00 00       	push   $0x4a62
    2a4f:	e8 6e 0e 00 00       	call   38c2 <open>
  if(write(fd, "x", 1) > 0){
    2a54:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2a57:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2a59:	6a 01                	push   $0x1
    2a5b:	68 45 4b 00 00       	push   $0x4b45
    2a60:	50                   	push   %eax
    2a61:	e8 3c 0e 00 00       	call   38a2 <write>
    2a66:	83 c4 10             	add    $0x10,%esp
    2a69:	85 c0                	test   %eax,%eax
    2a6b:	7f 58                	jg     2ac5 <dirfile+0x185>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    2a6d:	83 ec 0c             	sub    $0xc,%esp
    2a70:	53                   	push   %ebx
    2a71:	e8 34 0e 00 00       	call   38aa <close>

  printf(1, "dir vs file OK\n");
    2a76:	58                   	pop    %eax
    2a77:	5a                   	pop    %edx
    2a78:	68 39 4f 00 00       	push   $0x4f39
    2a7d:	6a 01                	push   $0x1
    2a7f:	e8 6c 0f 00 00       	call   39f0 <printf>
}
    2a84:	83 c4 10             	add    $0x10,%esp
    2a87:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2a8a:	c9                   	leave  
    2a8b:	c3                   	ret    
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2a8c:	50                   	push   %eax
    2a8d:	50                   	push   %eax
    2a8e:	68 ad 4e 00 00       	push   $0x4ead
    2a93:	6a 01                	push   $0x1
    2a95:	e8 56 0f 00 00       	call   39f0 <printf>
    exit();
    2a9a:	e8 e3 0d 00 00       	call   3882 <exit>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    2a9f:	50                   	push   %eax
    2aa0:	50                   	push   %eax
    2aa1:	68 88 4e 00 00       	push   $0x4e88
    2aa6:	6a 01                	push   $0x1
    2aa8:	e8 43 0f 00 00       	call   39f0 <printf>
    exit();
    2aad:	e8 d0 0d 00 00       	call   3882 <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    2ab2:	52                   	push   %edx
    2ab3:	52                   	push   %edx
    2ab4:	68 71 4e 00 00       	push   $0x4e71
    2ab9:	6a 01                	push   $0x1
    2abb:	e8 30 0f 00 00       	call   39f0 <printf>
    exit();
    2ac0:	e8 bd 0d 00 00       	call   3882 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    2ac5:	51                   	push   %ecx
    2ac6:	51                   	push   %ecx
    2ac7:	68 25 4f 00 00       	push   $0x4f25
    2acc:	6a 01                	push   $0x1
    2ace:	e8 1d 0f 00 00       	call   39f0 <printf>
    exit();
    2ad3:	e8 aa 0d 00 00       	call   3882 <exit>
    exit();
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2ad8:	53                   	push   %ebx
    2ad9:	53                   	push   %ebx
    2ada:	68 1c 57 00 00       	push   $0x571c
    2adf:	6a 01                	push   $0x1
    2ae1:	e8 0a 0f 00 00       	call   39f0 <printf>
    exit();
    2ae6:	e8 97 0d 00 00       	call   3882 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2aeb:	50                   	push   %eax
    2aec:	50                   	push   %eax
    2aed:	68 0d 4f 00 00       	push   $0x4f0d
    2af2:	6a 01                	push   $0x1
    2af4:	e8 f7 0e 00 00       	call   39f0 <printf>
    exit();
    2af9:	e8 84 0d 00 00       	call   3882 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    2afe:	50                   	push   %eax
    2aff:	50                   	push   %eax
    2b00:	68 fc 56 00 00       	push   $0x56fc
    2b05:	6a 01                	push   $0x1
    2b07:	e8 e4 0e 00 00       	call   39f0 <printf>
    exit();
    2b0c:	e8 71 0d 00 00       	call   3882 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b11:	50                   	push   %eax
    2b12:	50                   	push   %eax
    2b13:	68 e8 4e 00 00       	push   $0x4ee8
    2b18:	6a 01                	push   $0x1
    2b1a:	e8 d1 0e 00 00       	call   39f0 <printf>
    exit();
    2b1f:	e8 5e 0d 00 00       	call   3882 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b24:	50                   	push   %eax
    2b25:	50                   	push   %eax
    2b26:	68 cb 4e 00 00       	push   $0x4ecb
    2b2b:	6a 01                	push   $0x1
    2b2d:	e8 be 0e 00 00       	call   39f0 <printf>
    exit();
    2b32:	e8 4b 0d 00 00       	call   3882 <exit>
    2b37:	89 f6                	mov    %esi,%esi
    2b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002b40 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2b40:	55                   	push   %ebp
    2b41:	89 e5                	mov    %esp,%ebp
    2b43:	53                   	push   %ebx
  int i, fd;

  printf(1, "empty file name\n");
    2b44:	bb 33 00 00 00       	mov    $0x33,%ebx
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2b49:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2b4c:	68 49 4f 00 00       	push   $0x4f49
    2b51:	6a 01                	push   $0x1
    2b53:	e8 98 0e 00 00       	call   39f0 <printf>
    2b58:	83 c4 10             	add    $0x10,%esp
    2b5b:	90                   	nop
    2b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    2b60:	83 ec 0c             	sub    $0xc,%esp
    2b63:	68 5a 4f 00 00       	push   $0x4f5a
    2b68:	e8 7d 0d 00 00       	call   38ea <mkdir>
    2b6d:	83 c4 10             	add    $0x10,%esp
    2b70:	85 c0                	test   %eax,%eax
    2b72:	0f 85 bb 00 00 00    	jne    2c33 <iref+0xf3>
      printf(1, "mkdir irefd failed\n");
      exit();
    }
    if(chdir("irefd") != 0){
    2b78:	83 ec 0c             	sub    $0xc,%esp
    2b7b:	68 5a 4f 00 00       	push   $0x4f5a
    2b80:	e8 6d 0d 00 00       	call   38f2 <chdir>
    2b85:	83 c4 10             	add    $0x10,%esp
    2b88:	85 c0                	test   %eax,%eax
    2b8a:	0f 85 b7 00 00 00    	jne    2c47 <iref+0x107>
      printf(1, "chdir irefd failed\n");
      exit();
    }

    mkdir("");
    2b90:	83 ec 0c             	sub    $0xc,%esp
    2b93:	68 0d 5a 00 00       	push   $0x5a0d
    2b98:	e8 4d 0d 00 00       	call   38ea <mkdir>
    link("README", "");
    2b9d:	59                   	pop    %ecx
    2b9e:	58                   	pop    %eax
    2b9f:	68 0d 5a 00 00       	push   $0x5a0d
    2ba4:	68 06 4f 00 00       	push   $0x4f06
    2ba9:	e8 34 0d 00 00       	call   38e2 <link>
    fd = open("", O_CREATE);
    2bae:	58                   	pop    %eax
    2baf:	5a                   	pop    %edx
    2bb0:	68 00 02 00 00       	push   $0x200
    2bb5:	68 0d 5a 00 00       	push   $0x5a0d
    2bba:	e8 03 0d 00 00       	call   38c2 <open>
    if(fd >= 0)
    2bbf:	83 c4 10             	add    $0x10,%esp
    2bc2:	85 c0                	test   %eax,%eax
    2bc4:	78 0c                	js     2bd2 <iref+0x92>
      close(fd);
    2bc6:	83 ec 0c             	sub    $0xc,%esp
    2bc9:	50                   	push   %eax
    2bca:	e8 db 0c 00 00       	call   38aa <close>
    2bcf:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2bd2:	83 ec 08             	sub    $0x8,%esp
    2bd5:	68 00 02 00 00       	push   $0x200
    2bda:	68 44 4b 00 00       	push   $0x4b44
    2bdf:	e8 de 0c 00 00       	call   38c2 <open>
    if(fd >= 0)
    2be4:	83 c4 10             	add    $0x10,%esp
    2be7:	85 c0                	test   %eax,%eax
    2be9:	78 0c                	js     2bf7 <iref+0xb7>
      close(fd);
    2beb:	83 ec 0c             	sub    $0xc,%esp
    2bee:	50                   	push   %eax
    2bef:	e8 b6 0c 00 00       	call   38aa <close>
    2bf4:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2bf7:	83 ec 0c             	sub    $0xc,%esp
    2bfa:	68 44 4b 00 00       	push   $0x4b44
    2bff:	e8 ce 0c 00 00       	call   38d2 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2c04:	83 c4 10             	add    $0x10,%esp
    2c07:	83 eb 01             	sub    $0x1,%ebx
    2c0a:	0f 85 50 ff ff ff    	jne    2b60 <iref+0x20>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2c10:	83 ec 0c             	sub    $0xc,%esp
    2c13:	68 35 42 00 00       	push   $0x4235
    2c18:	e8 d5 0c 00 00       	call   38f2 <chdir>
  printf(1, "empty file name OK\n");
    2c1d:	58                   	pop    %eax
    2c1e:	5a                   	pop    %edx
    2c1f:	68 88 4f 00 00       	push   $0x4f88
    2c24:	6a 01                	push   $0x1
    2c26:	e8 c5 0d 00 00       	call   39f0 <printf>
}
    2c2b:	83 c4 10             	add    $0x10,%esp
    2c2e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c31:	c9                   	leave  
    2c32:	c3                   	ret    
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    2c33:	83 ec 08             	sub    $0x8,%esp
    2c36:	68 60 4f 00 00       	push   $0x4f60
    2c3b:	6a 01                	push   $0x1
    2c3d:	e8 ae 0d 00 00       	call   39f0 <printf>
      exit();
    2c42:	e8 3b 0c 00 00       	call   3882 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    2c47:	83 ec 08             	sub    $0x8,%esp
    2c4a:	68 74 4f 00 00       	push   $0x4f74
    2c4f:	6a 01                	push   $0x1
    2c51:	e8 9a 0d 00 00       	call   39f0 <printf>
      exit();
    2c56:	e8 27 0c 00 00       	call   3882 <exit>
    2c5b:	90                   	nop
    2c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002c60 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2c60:	55                   	push   %ebp
    2c61:	89 e5                	mov    %esp,%ebp
    2c63:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2c64:	31 db                	xor    %ebx,%ebx
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2c66:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    2c69:	68 9c 4f 00 00       	push   $0x4f9c
    2c6e:	6a 01                	push   $0x1
    2c70:	e8 7b 0d 00 00       	call   39f0 <printf>
    2c75:	83 c4 10             	add    $0x10,%esp
    2c78:	eb 13                	jmp    2c8d <forktest+0x2d>
    2c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    2c80:	74 62                	je     2ce4 <forktest+0x84>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2c82:	83 c3 01             	add    $0x1,%ebx
    2c85:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2c8b:	74 43                	je     2cd0 <forktest+0x70>
    pid = fork();
    2c8d:	e8 e8 0b 00 00       	call   387a <fork>
    if(pid < 0)
    2c92:	85 c0                	test   %eax,%eax
    2c94:	79 ea                	jns    2c80 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2c96:	85 db                	test   %ebx,%ebx
    2c98:	74 14                	je     2cae <forktest+0x4e>
    2c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2ca0:	e8 e5 0b 00 00       	call   388a <wait>
    2ca5:	85 c0                	test   %eax,%eax
    2ca7:	78 40                	js     2ce9 <forktest+0x89>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2ca9:	83 eb 01             	sub    $0x1,%ebx
    2cac:	75 f2                	jne    2ca0 <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
    2cae:	e8 d7 0b 00 00       	call   388a <wait>
    2cb3:	83 f8 ff             	cmp    $0xffffffff,%eax
    2cb6:	75 45                	jne    2cfd <forktest+0x9d>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
    2cb8:	83 ec 08             	sub    $0x8,%esp
    2cbb:	68 ce 4f 00 00       	push   $0x4fce
    2cc0:	6a 01                	push   $0x1
    2cc2:	e8 29 0d 00 00       	call   39f0 <printf>
}
    2cc7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cca:	c9                   	leave  
    2ccb:	c3                   	ret    
    2ccc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit();
  }

  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    2cd0:	83 ec 08             	sub    $0x8,%esp
    2cd3:	68 3c 57 00 00       	push   $0x573c
    2cd8:	6a 01                	push   $0x1
    2cda:	e8 11 0d 00 00       	call   39f0 <printf>
    exit();
    2cdf:	e8 9e 0b 00 00       	call   3882 <exit>
  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit();
    2ce4:	e8 99 0b 00 00       	call   3882 <exit>
    exit();
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
    2ce9:	83 ec 08             	sub    $0x8,%esp
    2cec:	68 a7 4f 00 00       	push   $0x4fa7
    2cf1:	6a 01                	push   $0x1
    2cf3:	e8 f8 0c 00 00       	call   39f0 <printf>
      exit();
    2cf8:	e8 85 0b 00 00       	call   3882 <exit>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
    2cfd:	83 ec 08             	sub    $0x8,%esp
    2d00:	68 bb 4f 00 00       	push   $0x4fbb
    2d05:	6a 01                	push   $0x1
    2d07:	e8 e4 0c 00 00       	call   39f0 <printf>
    exit();
    2d0c:	e8 71 0b 00 00       	call   3882 <exit>
    2d11:	eb 0d                	jmp    2d20 <sbrktest>
    2d13:	90                   	nop
    2d14:	90                   	nop
    2d15:	90                   	nop
    2d16:	90                   	nop
    2d17:	90                   	nop
    2d18:	90                   	nop
    2d19:	90                   	nop
    2d1a:	90                   	nop
    2d1b:	90                   	nop
    2d1c:	90                   	nop
    2d1d:	90                   	nop
    2d1e:	90                   	nop
    2d1f:	90                   	nop

00002d20 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d20:	55                   	push   %ebp
    2d21:	89 e5                	mov    %esp,%ebp
    2d23:	57                   	push   %edi
    2d24:	56                   	push   %esi
    2d25:	53                   	push   %ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d26:	31 ff                	xor    %edi,%edi
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d28:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2d2b:	68 dc 4f 00 00       	push   $0x4fdc
    2d30:	ff 35 44 64 00 00    	pushl  0x6444
    2d36:	e8 b5 0c 00 00       	call   39f0 <printf>
  oldbrk = sbrk(0);
    2d3b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d42:	e8 c3 0b 00 00       	call   390a <sbrk>

  // can one sbrk() less than a page?
  a = sbrk(0);
    2d47:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    2d4e:	89 45 a4             	mov    %eax,-0x5c(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    2d51:	e8 b4 0b 00 00       	call   390a <sbrk>
    2d56:	83 c4 10             	add    $0x10,%esp
    2d59:	89 c3                	mov    %eax,%ebx
    2d5b:	90                   	nop
    2d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    2d60:	83 ec 0c             	sub    $0xc,%esp
    2d63:	6a 01                	push   $0x1
    2d65:	e8 a0 0b 00 00       	call   390a <sbrk>
    if(b != a){
    2d6a:	83 c4 10             	add    $0x10,%esp
    2d6d:	39 d8                	cmp    %ebx,%eax
    2d6f:	0f 85 85 02 00 00    	jne    2ffa <sbrktest+0x2da>
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d75:	83 c7 01             	add    $0x1,%edi
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    2d78:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    2d7b:	83 c3 01             	add    $0x1,%ebx
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    2d7e:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2d84:	75 da                	jne    2d60 <sbrktest+0x40>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2d86:	e8 ef 0a 00 00       	call   387a <fork>
  if(pid < 0){
    2d8b:	85 c0                	test   %eax,%eax
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2d8d:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    2d8f:	0f 88 93 03 00 00    	js     3128 <sbrktest+0x408>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2d95:	83 ec 0c             	sub    $0xc,%esp
  c = sbrk(1);
  if(c != a + 1){
    2d98:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2d9b:	6a 01                	push   $0x1
    2d9d:	e8 68 0b 00 00       	call   390a <sbrk>
  c = sbrk(1);
    2da2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2da9:	e8 5c 0b 00 00       	call   390a <sbrk>
  if(c != a + 1){
    2dae:	83 c4 10             	add    $0x10,%esp
    2db1:	39 d8                	cmp    %ebx,%eax
    2db3:	0f 85 57 03 00 00    	jne    3110 <sbrktest+0x3f0>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    2db9:	85 ff                	test   %edi,%edi
    2dbb:	0f 84 4a 03 00 00    	je     310b <sbrktest+0x3eb>
    exit();
  wait();
    2dc1:	e8 c4 0a 00 00       	call   388a <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2dc6:	83 ec 0c             	sub    $0xc,%esp
    2dc9:	6a 00                	push   $0x0
    2dcb:	e8 3a 0b 00 00       	call   390a <sbrk>
    2dd0:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
    2dd2:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2dd7:	29 d8                	sub    %ebx,%eax
    2dd9:	89 04 24             	mov    %eax,(%esp)
    2ddc:	e8 29 0b 00 00       	call   390a <sbrk>
  if (p != a) {
    2de1:	83 c4 10             	add    $0x10,%esp
    2de4:	39 c3                	cmp    %eax,%ebx
    2de6:	0f 85 07 03 00 00    	jne    30f3 <sbrktest+0x3d3>
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2dec:	83 ec 0c             	sub    $0xc,%esp
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    2def:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff

  // can one de-allocate?
  a = sbrk(0);
    2df6:	6a 00                	push   $0x0
    2df8:	e8 0d 0b 00 00       	call   390a <sbrk>
  c = sbrk(-4096);
    2dfd:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2e04:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2e06:	e8 ff 0a 00 00       	call   390a <sbrk>
  if(c == (char*)0xffffffff){
    2e0b:	83 c4 10             	add    $0x10,%esp
    2e0e:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e11:	0f 84 c4 02 00 00    	je     30db <sbrktest+0x3bb>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2e17:	83 ec 0c             	sub    $0xc,%esp
    2e1a:	6a 00                	push   $0x0
    2e1c:	e8 e9 0a 00 00       	call   390a <sbrk>
  if(c != a - 4096){
    2e21:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2e27:	83 c4 10             	add    $0x10,%esp
    2e2a:	39 d0                	cmp    %edx,%eax
    2e2c:	0f 85 92 02 00 00    	jne    30c4 <sbrktest+0x3a4>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    2e32:	83 ec 0c             	sub    $0xc,%esp
    2e35:	6a 00                	push   $0x0
    2e37:	e8 ce 0a 00 00       	call   390a <sbrk>
    2e3c:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2e3e:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2e45:	e8 c0 0a 00 00       	call   390a <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2e4a:	83 c4 10             	add    $0x10,%esp
    2e4d:	39 c3                	cmp    %eax,%ebx
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    2e4f:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    2e51:	0f 85 56 02 00 00    	jne    30ad <sbrktest+0x38d>
    2e57:	83 ec 0c             	sub    $0xc,%esp
    2e5a:	6a 00                	push   $0x0
    2e5c:	e8 a9 0a 00 00       	call   390a <sbrk>
    2e61:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2e67:	83 c4 10             	add    $0x10,%esp
    2e6a:	39 d0                	cmp    %edx,%eax
    2e6c:	0f 85 3b 02 00 00    	jne    30ad <sbrktest+0x38d>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    2e72:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2e79:	0f 84 16 02 00 00    	je     3095 <sbrktest+0x375>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2e7f:	83 ec 0c             	sub    $0xc,%esp
    2e82:	6a 00                	push   $0x0
    2e84:	e8 81 0a 00 00       	call   390a <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2e89:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2e90:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2e92:	e8 73 0a 00 00       	call   390a <sbrk>
    2e97:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    2e9a:	29 c1                	sub    %eax,%ecx
    2e9c:	89 0c 24             	mov    %ecx,(%esp)
    2e9f:	e8 66 0a 00 00       	call   390a <sbrk>
  if(c != a){
    2ea4:	83 c4 10             	add    $0x10,%esp
    2ea7:	39 c3                	cmp    %eax,%ebx
    2ea9:	0f 85 cf 01 00 00    	jne    307e <sbrktest+0x35e>
    2eaf:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    2eb8:	e8 45 0a 00 00       	call   3902 <getpid>
    2ebd:	89 c7                	mov    %eax,%edi
    pid = fork();
    2ebf:	e8 b6 09 00 00       	call   387a <fork>
    if(pid < 0){
    2ec4:	85 c0                	test   %eax,%eax
    2ec6:	0f 88 9a 01 00 00    	js     3066 <sbrktest+0x346>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    2ecc:	0f 84 72 01 00 00    	je     3044 <sbrktest+0x324>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ed2:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    2ed8:	e8 ad 09 00 00       	call   388a <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2edd:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2ee3:	75 d3                	jne    2eb8 <sbrktest+0x198>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    2ee5:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2ee8:	83 ec 0c             	sub    $0xc,%esp
    2eeb:	50                   	push   %eax
    2eec:	e8 a1 09 00 00       	call   3892 <pipe>
    2ef1:	83 c4 10             	add    $0x10,%esp
    2ef4:	85 c0                	test   %eax,%eax
    2ef6:	0f 85 34 01 00 00    	jne    3030 <sbrktest+0x310>
    2efc:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    2eff:	8d 7d e8             	lea    -0x18(%ebp),%edi
    2f02:	89 de                	mov    %ebx,%esi
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    2f04:	e8 71 09 00 00       	call   387a <fork>
    2f09:	85 c0                	test   %eax,%eax
    2f0b:	89 06                	mov    %eax,(%esi)
    2f0d:	0f 84 a1 00 00 00    	je     2fb4 <sbrktest+0x294>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    2f13:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f16:	74 14                	je     2f2c <sbrktest+0x20c>
      read(fds[0], &scratch, 1);
    2f18:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f1b:	83 ec 04             	sub    $0x4,%esp
    2f1e:	6a 01                	push   $0x1
    2f20:	50                   	push   %eax
    2f21:	ff 75 b8             	pushl  -0x48(%ebp)
    2f24:	e8 71 09 00 00       	call   389a <read>
    2f29:	83 c4 10             	add    $0x10,%esp
    2f2c:	83 c6 04             	add    $0x4,%esi
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f2f:	39 f7                	cmp    %esi,%edi
    2f31:	75 d1                	jne    2f04 <sbrktest+0x1e4>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    2f33:	83 ec 0c             	sub    $0xc,%esp
    2f36:	68 00 10 00 00       	push   $0x1000
    2f3b:	e8 ca 09 00 00       	call   390a <sbrk>
    2f40:	83 c4 10             	add    $0x10,%esp
    2f43:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    2f45:	8b 03                	mov    (%ebx),%eax
    2f47:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f4a:	74 11                	je     2f5d <sbrktest+0x23d>
      continue;
    kill(pids[i]);
    2f4c:	83 ec 0c             	sub    $0xc,%esp
    2f4f:	50                   	push   %eax
    2f50:	e8 5d 09 00 00       	call   38b2 <kill>
    wait();
    2f55:	e8 30 09 00 00       	call   388a <wait>
    2f5a:	83 c4 10             	add    $0x10,%esp
    2f5d:	83 c3 04             	add    $0x4,%ebx
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f60:	39 fb                	cmp    %edi,%ebx
    2f62:	75 e1                	jne    2f45 <sbrktest+0x225>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    2f64:	83 fe ff             	cmp    $0xffffffff,%esi
    2f67:	0f 84 ab 00 00 00    	je     3018 <sbrktest+0x2f8>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    2f6d:	83 ec 0c             	sub    $0xc,%esp
    2f70:	6a 00                	push   $0x0
    2f72:	e8 93 09 00 00       	call   390a <sbrk>
    2f77:	83 c4 10             	add    $0x10,%esp
    2f7a:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    2f7d:	73 1a                	jae    2f99 <sbrktest+0x279>
    sbrk(-(sbrk(0) - oldbrk));
    2f7f:	83 ec 0c             	sub    $0xc,%esp
    2f82:	6a 00                	push   $0x0
    2f84:	e8 81 09 00 00       	call   390a <sbrk>
    2f89:	8b 75 a4             	mov    -0x5c(%ebp),%esi
    2f8c:	29 c6                	sub    %eax,%esi
    2f8e:	89 34 24             	mov    %esi,(%esp)
    2f91:	e8 74 09 00 00       	call   390a <sbrk>
    2f96:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    2f99:	83 ec 08             	sub    $0x8,%esp
    2f9c:	68 84 50 00 00       	push   $0x5084
    2fa1:	ff 35 44 64 00 00    	pushl  0x6444
    2fa7:	e8 44 0a 00 00       	call   39f0 <printf>
}
    2fac:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2faf:	5b                   	pop    %ebx
    2fb0:	5e                   	pop    %esi
    2fb1:	5f                   	pop    %edi
    2fb2:	5d                   	pop    %ebp
    2fb3:	c3                   	ret    
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    2fb4:	83 ec 0c             	sub    $0xc,%esp
    2fb7:	6a 00                	push   $0x0
    2fb9:	e8 4c 09 00 00       	call   390a <sbrk>
    2fbe:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2fc3:	29 c2                	sub    %eax,%edx
    2fc5:	89 14 24             	mov    %edx,(%esp)
    2fc8:	e8 3d 09 00 00       	call   390a <sbrk>
      write(fds[1], "x", 1);
    2fcd:	83 c4 0c             	add    $0xc,%esp
    2fd0:	6a 01                	push   $0x1
    2fd2:	68 45 4b 00 00       	push   $0x4b45
    2fd7:	ff 75 bc             	pushl  -0x44(%ebp)
    2fda:	e8 c3 08 00 00       	call   38a2 <write>
    2fdf:	83 c4 10             	add    $0x10,%esp
    2fe2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      // sit around until killed
      for(;;) sleep(1000);
    2fe8:	83 ec 0c             	sub    $0xc,%esp
    2feb:	68 e8 03 00 00       	push   $0x3e8
    2ff0:	e8 1d 09 00 00       	call   3912 <sleep>
    2ff5:	83 c4 10             	add    $0x10,%esp
    2ff8:	eb ee                	jmp    2fe8 <sbrktest+0x2c8>
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2ffa:	83 ec 0c             	sub    $0xc,%esp
    2ffd:	50                   	push   %eax
    2ffe:	53                   	push   %ebx
    2fff:	57                   	push   %edi
    3000:	68 e7 4f 00 00       	push   $0x4fe7
    3005:	ff 35 44 64 00 00    	pushl  0x6444
    300b:	e8 e0 09 00 00       	call   39f0 <printf>
      exit();
    3010:	83 c4 20             	add    $0x20,%esp
    3013:	e8 6a 08 00 00       	call   3882 <exit>
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    3018:	83 ec 08             	sub    $0x8,%esp
    301b:	68 69 50 00 00       	push   $0x5069
    3020:	ff 35 44 64 00 00    	pushl  0x6444
    3026:	e8 c5 09 00 00       	call   39f0 <printf>
    exit();
    302b:	e8 52 08 00 00       	call   3882 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    3030:	83 ec 08             	sub    $0x8,%esp
    3033:	68 25 45 00 00       	push   $0x4525
    3038:	6a 01                	push   $0x1
    303a:	e8 b1 09 00 00       	call   39f0 <printf>
    exit();
    303f:	e8 3e 08 00 00       	call   3882 <exit>
    if(pid < 0){
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3044:	0f be 03             	movsbl (%ebx),%eax
    3047:	50                   	push   %eax
    3048:	53                   	push   %ebx
    3049:	68 50 50 00 00       	push   $0x5050
    304e:	ff 35 44 64 00 00    	pushl  0x6444
    3054:	e8 97 09 00 00       	call   39f0 <printf>
      kill(ppid);
    3059:	89 3c 24             	mov    %edi,(%esp)
    305c:	e8 51 08 00 00       	call   38b2 <kill>
      exit();
    3061:	e8 1c 08 00 00       	call   3882 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
    if(pid < 0){
      printf(stdout, "fork failed\n");
    3066:	83 ec 08             	sub    $0x8,%esp
    3069:	68 2d 51 00 00       	push   $0x512d
    306e:	ff 35 44 64 00 00    	pushl  0x6444
    3074:	e8 77 09 00 00       	call   39f0 <printf>
      exit();
    3079:	e8 04 08 00 00       	call   3882 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    307e:	50                   	push   %eax
    307f:	53                   	push   %ebx
    3080:	68 30 58 00 00       	push   $0x5830
    3085:	ff 35 44 64 00 00    	pushl  0x6444
    308b:	e8 60 09 00 00       	call   39f0 <printf>
    exit();
    3090:	e8 ed 07 00 00       	call   3882 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    3095:	83 ec 08             	sub    $0x8,%esp
    3098:	68 00 58 00 00       	push   $0x5800
    309d:	ff 35 44 64 00 00    	pushl  0x6444
    30a3:	e8 48 09 00 00       	call   39f0 <printf>
    exit();
    30a8:	e8 d5 07 00 00       	call   3882 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    30ad:	57                   	push   %edi
    30ae:	53                   	push   %ebx
    30af:	68 d8 57 00 00       	push   $0x57d8
    30b4:	ff 35 44 64 00 00    	pushl  0x6444
    30ba:	e8 31 09 00 00       	call   39f0 <printf>
    exit();
    30bf:	e8 be 07 00 00       	call   3882 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    30c4:	50                   	push   %eax
    30c5:	53                   	push   %ebx
    30c6:	68 a0 57 00 00       	push   $0x57a0
    30cb:	ff 35 44 64 00 00    	pushl  0x6444
    30d1:	e8 1a 09 00 00       	call   39f0 <printf>
    exit();
    30d6:	e8 a7 07 00 00       	call   3882 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    30db:	83 ec 08             	sub    $0x8,%esp
    30de:	68 35 50 00 00       	push   $0x5035
    30e3:	ff 35 44 64 00 00    	pushl  0x6444
    30e9:	e8 02 09 00 00       	call   39f0 <printf>
    exit();
    30ee:	e8 8f 07 00 00       	call   3882 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    30f3:	83 ec 08             	sub    $0x8,%esp
    30f6:	68 60 57 00 00       	push   $0x5760
    30fb:	ff 35 44 64 00 00    	pushl  0x6444
    3101:	e8 ea 08 00 00       	call   39f0 <printf>
    exit();
    3106:	e8 77 07 00 00       	call   3882 <exit>
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    exit();
    310b:	e8 72 07 00 00       	call   3882 <exit>
    exit();
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    3110:	83 ec 08             	sub    $0x8,%esp
    3113:	68 19 50 00 00       	push   $0x5019
    3118:	ff 35 44 64 00 00    	pushl  0x6444
    311e:	e8 cd 08 00 00       	call   39f0 <printf>
    exit();
    3123:	e8 5a 07 00 00       	call   3882 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    3128:	83 ec 08             	sub    $0x8,%esp
    312b:	68 02 50 00 00       	push   $0x5002
    3130:	ff 35 44 64 00 00    	pushl  0x6444
    3136:	e8 b5 08 00 00       	call   39f0 <printf>
    exit();
    313b:	e8 42 07 00 00       	call   3882 <exit>

00003140 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    3140:	55                   	push   %ebp
    3141:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3143:	5d                   	pop    %ebp
    3144:	c3                   	ret    
    3145:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003150 <validatetest>:

void
validatetest(void)
{
    3150:	55                   	push   %ebp
    3151:	89 e5                	mov    %esp,%ebp
    3153:	56                   	push   %esi
    3154:	53                   	push   %ebx
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3155:	31 db                	xor    %ebx,%ebx
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3157:	83 ec 08             	sub    $0x8,%esp
    315a:	68 92 50 00 00       	push   $0x5092
    315f:	ff 35 44 64 00 00    	pushl  0x6444
    3165:	e8 86 08 00 00       	call   39f0 <printf>
    316a:	83 c4 10             	add    $0x10,%esp
    316d:	8d 76 00             	lea    0x0(%esi),%esi
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    3170:	e8 05 07 00 00       	call   387a <fork>
    3175:	85 c0                	test   %eax,%eax
    3177:	89 c6                	mov    %eax,%esi
    3179:	74 63                	je     31de <validatetest+0x8e>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
    sleep(0);
    317b:	83 ec 0c             	sub    $0xc,%esp
    317e:	6a 00                	push   $0x0
    3180:	e8 8d 07 00 00       	call   3912 <sleep>
    sleep(0);
    3185:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    318c:	e8 81 07 00 00       	call   3912 <sleep>
    kill(pid);
    3191:	89 34 24             	mov    %esi,(%esp)
    3194:	e8 19 07 00 00       	call   38b2 <kill>
    wait();
    3199:	e8 ec 06 00 00       	call   388a <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    319e:	58                   	pop    %eax
    319f:	5a                   	pop    %edx
    31a0:	53                   	push   %ebx
    31a1:	68 a1 50 00 00       	push   $0x50a1
    31a6:	e8 37 07 00 00       	call   38e2 <link>
    31ab:	83 c4 10             	add    $0x10,%esp
    31ae:	83 f8 ff             	cmp    $0xffffffff,%eax
    31b1:	75 30                	jne    31e3 <validatetest+0x93>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    31b3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    31b9:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    31bf:	75 af                	jne    3170 <validatetest+0x20>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    31c1:	83 ec 08             	sub    $0x8,%esp
    31c4:	68 c5 50 00 00       	push   $0x50c5
    31c9:	ff 35 44 64 00 00    	pushl  0x6444
    31cf:	e8 1c 08 00 00       	call   39f0 <printf>
}
    31d4:	83 c4 10             	add    $0x10,%esp
    31d7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    31da:	5b                   	pop    %ebx
    31db:	5e                   	pop    %esi
    31dc:	5d                   	pop    %ebp
    31dd:	c3                   	ret    

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    31de:	e8 9f 06 00 00       	call   3882 <exit>
    kill(pid);
    wait();

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    31e3:	83 ec 08             	sub    $0x8,%esp
    31e6:	68 ac 50 00 00       	push   $0x50ac
    31eb:	ff 35 44 64 00 00    	pushl  0x6444
    31f1:	e8 fa 07 00 00       	call   39f0 <printf>
      exit();
    31f6:	e8 87 06 00 00       	call   3882 <exit>
    31fb:	90                   	nop
    31fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003200 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3200:	55                   	push   %ebp
    3201:	89 e5                	mov    %esp,%ebp
    3203:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    3206:	68 d2 50 00 00       	push   $0x50d2
    320b:	ff 35 44 64 00 00    	pushl  0x6444
    3211:	e8 da 07 00 00       	call   39f0 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    3216:	83 c4 10             	add    $0x10,%esp
    3219:	80 3d 00 65 00 00 00 	cmpb   $0x0,0x6500
    3220:	75 35                	jne    3257 <bsstest+0x57>
    3222:	b8 01 65 00 00       	mov    $0x6501,%eax
    3227:	89 f6                	mov    %esi,%esi
    3229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3230:	80 38 00             	cmpb   $0x0,(%eax)
    3233:	75 22                	jne    3257 <bsstest+0x57>
    3235:	83 c0 01             	add    $0x1,%eax
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    3238:	3d 10 8c 00 00       	cmp    $0x8c10,%eax
    323d:	75 f1                	jne    3230 <bsstest+0x30>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    323f:	83 ec 08             	sub    $0x8,%esp
    3242:	68 ed 50 00 00       	push   $0x50ed
    3247:	ff 35 44 64 00 00    	pushl  0x6444
    324d:	e8 9e 07 00 00       	call   39f0 <printf>
}
    3252:	83 c4 10             	add    $0x10,%esp
    3255:	c9                   	leave  
    3256:	c3                   	ret    
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    3257:	83 ec 08             	sub    $0x8,%esp
    325a:	68 dc 50 00 00       	push   $0x50dc
    325f:	ff 35 44 64 00 00    	pushl  0x6444
    3265:	e8 86 07 00 00       	call   39f0 <printf>
      exit();
    326a:	e8 13 06 00 00       	call   3882 <exit>
    326f:	90                   	nop

00003270 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3270:	55                   	push   %ebp
    3271:	89 e5                	mov    %esp,%ebp
    3273:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    3276:	68 fa 50 00 00       	push   $0x50fa
    327b:	e8 52 06 00 00       	call   38d2 <unlink>
  pid = fork();
    3280:	e8 f5 05 00 00       	call   387a <fork>
  if(pid == 0){
    3285:	83 c4 10             	add    $0x10,%esp
    3288:	85 c0                	test   %eax,%eax
    328a:	74 3f                	je     32cb <bigargtest+0x5b>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    328c:	0f 88 c2 00 00 00    	js     3354 <bigargtest+0xe4>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    3292:	e8 f3 05 00 00       	call   388a <wait>
  fd = open("bigarg-ok", 0);
    3297:	83 ec 08             	sub    $0x8,%esp
    329a:	6a 00                	push   $0x0
    329c:	68 fa 50 00 00       	push   $0x50fa
    32a1:	e8 1c 06 00 00       	call   38c2 <open>
  if(fd < 0){
    32a6:	83 c4 10             	add    $0x10,%esp
    32a9:	85 c0                	test   %eax,%eax
    32ab:	0f 88 8c 00 00 00    	js     333d <bigargtest+0xcd>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    32b1:	83 ec 0c             	sub    $0xc,%esp
    32b4:	50                   	push   %eax
    32b5:	e8 f0 05 00 00       	call   38aa <close>
  unlink("bigarg-ok");
    32ba:	c7 04 24 fa 50 00 00 	movl   $0x50fa,(%esp)
    32c1:	e8 0c 06 00 00       	call   38d2 <unlink>
}
    32c6:	83 c4 10             	add    $0x10,%esp
    32c9:	c9                   	leave  
    32ca:	c3                   	ret    
    32cb:	b8 60 64 00 00       	mov    $0x6460,%eax
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    32d0:	c7 00 54 58 00 00    	movl   $0x5854,(%eax)
    32d6:	83 c0 04             	add    $0x4,%eax
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    32d9:	3d dc 64 00 00       	cmp    $0x64dc,%eax
    32de:	75 f0                	jne    32d0 <bigargtest+0x60>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    32e0:	51                   	push   %ecx
    32e1:	51                   	push   %ecx
    32e2:	68 04 51 00 00       	push   $0x5104
    32e7:	ff 35 44 64 00 00    	pushl  0x6444
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    32ed:	c7 05 dc 64 00 00 00 	movl   $0x0,0x64dc
    32f4:	00 00 00 
    printf(stdout, "bigarg test\n");
    32f7:	e8 f4 06 00 00       	call   39f0 <printf>
    exec("echo", args);
    32fc:	58                   	pop    %eax
    32fd:	5a                   	pop    %edx
    32fe:	68 60 64 00 00       	push   $0x6460
    3303:	68 d1 42 00 00       	push   $0x42d1
    3308:	e8 ad 05 00 00       	call   38ba <exec>
    printf(stdout, "bigarg test ok\n");
    330d:	59                   	pop    %ecx
    330e:	58                   	pop    %eax
    330f:	68 11 51 00 00       	push   $0x5111
    3314:	ff 35 44 64 00 00    	pushl  0x6444
    331a:	e8 d1 06 00 00       	call   39f0 <printf>
    fd = open("bigarg-ok", O_CREATE);
    331f:	58                   	pop    %eax
    3320:	5a                   	pop    %edx
    3321:	68 00 02 00 00       	push   $0x200
    3326:	68 fa 50 00 00       	push   $0x50fa
    332b:	e8 92 05 00 00       	call   38c2 <open>
    close(fd);
    3330:	89 04 24             	mov    %eax,(%esp)
    3333:	e8 72 05 00 00       	call   38aa <close>
    exit();
    3338:	e8 45 05 00 00       	call   3882 <exit>
    exit();
  }
  wait();
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    333d:	50                   	push   %eax
    333e:	50                   	push   %eax
    333f:	68 3a 51 00 00       	push   $0x513a
    3344:	ff 35 44 64 00 00    	pushl  0x6444
    334a:	e8 a1 06 00 00       	call   39f0 <printf>
    exit();
    334f:	e8 2e 05 00 00       	call   3882 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    3354:	52                   	push   %edx
    3355:	52                   	push   %edx
    3356:	68 21 51 00 00       	push   $0x5121
    335b:	ff 35 44 64 00 00    	pushl  0x6444
    3361:	e8 8a 06 00 00       	call   39f0 <printf>
    exit();
    3366:	e8 17 05 00 00       	call   3882 <exit>
    336b:	90                   	nop
    336c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003370 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3370:	55                   	push   %ebp
    3371:	89 e5                	mov    %esp,%ebp
    3373:	57                   	push   %edi
    3374:	56                   	push   %esi
    3375:	53                   	push   %ebx
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3376:	31 db                	xor    %ebx,%ebx

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3378:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    337b:	68 4f 51 00 00       	push   $0x514f
    3380:	6a 01                	push   $0x1
    3382:	e8 69 06 00 00       	call   39f0 <printf>
    3387:	83 c4 10             	add    $0x10,%esp
    338a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3390:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    3395:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    3397:	89 d9                	mov    %ebx,%ecx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    3399:	f7 eb                	imul   %ebx
    339b:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    339e:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    33a0:	83 ec 04             	sub    $0x4,%esp

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    33a3:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    33a7:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33ab:	c1 fa 06             	sar    $0x6,%edx
    33ae:	29 f2                	sub    %esi,%edx
    33b0:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    33b3:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33b9:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    33bc:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    33c1:	29 d1                	sub    %edx,%ecx
    33c3:	f7 e9                	imul   %ecx
    33c5:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    33c8:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    33cd:	c1 fa 05             	sar    $0x5,%edx
    33d0:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    33d2:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    33d7:	83 c2 30             	add    $0x30,%edx
    33da:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    33dd:	f7 eb                	imul   %ebx
    33df:	c1 fa 05             	sar    $0x5,%edx
    33e2:	29 f2                	sub    %esi,%edx
    33e4:	6b d2 64             	imul   $0x64,%edx,%edx
    33e7:	29 d7                	sub    %edx,%edi
    33e9:	89 f8                	mov    %edi,%eax
    33eb:	c1 ff 1f             	sar    $0x1f,%edi
    33ee:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    33f0:	89 d8                	mov    %ebx,%eax
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    33f2:	c1 fa 02             	sar    $0x2,%edx
    33f5:	29 fa                	sub    %edi,%edx
    33f7:	83 c2 30             	add    $0x30,%edx
    33fa:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    33fd:	f7 e9                	imul   %ecx
    33ff:	89 d9                	mov    %ebx,%ecx
    3401:	c1 fa 02             	sar    $0x2,%edx
    3404:	29 f2                	sub    %esi,%edx
    3406:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3409:	01 c0                	add    %eax,%eax
    340b:	29 c1                	sub    %eax,%ecx
    340d:	89 c8                	mov    %ecx,%eax
    340f:	83 c0 30             	add    $0x30,%eax
    3412:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3415:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3418:	50                   	push   %eax
    3419:	68 5c 51 00 00       	push   $0x515c
    341e:	6a 01                	push   $0x1
    3420:	e8 cb 05 00 00       	call   39f0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3425:	58                   	pop    %eax
    3426:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3429:	5a                   	pop    %edx
    342a:	68 02 02 00 00       	push   $0x202
    342f:	50                   	push   %eax
    3430:	e8 8d 04 00 00       	call   38c2 <open>
    if(fd < 0){
    3435:	83 c4 10             	add    $0x10,%esp
    3438:	85 c0                	test   %eax,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    343a:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    343c:	78 50                	js     348e <fsfull+0x11e>
    343e:	31 f6                	xor    %esi,%esi
    3440:	eb 08                	jmp    344a <fsfull+0xda>
    3442:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3448:	01 c6                	add    %eax,%esi
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    344a:	83 ec 04             	sub    $0x4,%esp
    344d:	68 00 02 00 00       	push   $0x200
    3452:	68 20 8c 00 00       	push   $0x8c20
    3457:	57                   	push   %edi
    3458:	e8 45 04 00 00       	call   38a2 <write>
      if(cc < 512)
    345d:	83 c4 10             	add    $0x10,%esp
    3460:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3465:	7f e1                	jg     3448 <fsfull+0xd8>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3467:	83 ec 04             	sub    $0x4,%esp
    346a:	56                   	push   %esi
    346b:	68 78 51 00 00       	push   $0x5178
    3470:	6a 01                	push   $0x1
    3472:	e8 79 05 00 00       	call   39f0 <printf>
    close(fd);
    3477:	89 3c 24             	mov    %edi,(%esp)
    347a:	e8 2b 04 00 00       	call   38aa <close>
    if(total == 0)
    347f:	83 c4 10             	add    $0x10,%esp
    3482:	85 f6                	test   %esi,%esi
    3484:	74 22                	je     34a8 <fsfull+0x138>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3486:	83 c3 01             	add    $0x1,%ebx
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3489:	e9 02 ff ff ff       	jmp    3390 <fsfull+0x20>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    348e:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3491:	83 ec 04             	sub    $0x4,%esp
    3494:	50                   	push   %eax
    3495:	68 68 51 00 00       	push   $0x5168
    349a:	6a 01                	push   $0x1
    349c:	e8 4f 05 00 00       	call   39f0 <printf>
      break;
    34a1:	83 c4 10             	add    $0x10,%esp
    34a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34a8:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    34ad:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    34af:	89 d9                	mov    %ebx,%ecx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34b1:	f7 eb                	imul   %ebx
    34b3:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    34b6:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    34b8:	83 ec 0c             	sub    $0xc,%esp
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    34bb:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    34bf:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34c3:	c1 fa 06             	sar    $0x6,%edx
    34c6:	29 f2                	sub    %esi,%edx
    34c8:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    34cb:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34d1:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    34d4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    34d9:	29 d1                	sub    %edx,%ecx
    34db:	f7 e9                	imul   %ecx
    34dd:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    34e0:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    34e5:	c1 fa 05             	sar    $0x5,%edx
    34e8:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    34ea:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    34ef:	83 c2 30             	add    $0x30,%edx
    34f2:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    34f5:	f7 eb                	imul   %ebx
    34f7:	c1 fa 05             	sar    $0x5,%edx
    34fa:	29 f2                	sub    %esi,%edx
    34fc:	6b d2 64             	imul   $0x64,%edx,%edx
    34ff:	29 d7                	sub    %edx,%edi
    3501:	89 f8                	mov    %edi,%eax
    3503:	c1 ff 1f             	sar    $0x1f,%edi
    3506:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3508:	89 d8                	mov    %ebx,%eax
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    350a:	c1 fa 02             	sar    $0x2,%edx
    350d:	29 fa                	sub    %edi,%edx
    350f:	83 c2 30             	add    $0x30,%edx
    3512:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3515:	f7 e9                	imul   %ecx
    3517:	89 d9                	mov    %ebx,%ecx
    name[5] = '\0';
    unlink(name);
    nfiles--;
    3519:	83 eb 01             	sub    $0x1,%ebx
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    351c:	c1 fa 02             	sar    $0x2,%edx
    351f:	29 f2                	sub    %esi,%edx
    3521:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3524:	01 c0                	add    %eax,%eax
    3526:	29 c1                	sub    %eax,%ecx
    3528:	89 c8                	mov    %ecx,%eax
    352a:	83 c0 30             	add    $0x30,%eax
    352d:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    unlink(name);
    3530:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3533:	50                   	push   %eax
    3534:	e8 99 03 00 00       	call   38d2 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3539:	83 c4 10             	add    $0x10,%esp
    353c:	83 fb ff             	cmp    $0xffffffff,%ebx
    353f:	0f 85 63 ff ff ff    	jne    34a8 <fsfull+0x138>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3545:	83 ec 08             	sub    $0x8,%esp
    3548:	68 88 51 00 00       	push   $0x5188
    354d:	6a 01                	push   $0x1
    354f:	e8 9c 04 00 00       	call   39f0 <printf>
}
    3554:	83 c4 10             	add    $0x10,%esp
    3557:	8d 65 f4             	lea    -0xc(%ebp),%esp
    355a:	5b                   	pop    %ebx
    355b:	5e                   	pop    %esi
    355c:	5f                   	pop    %edi
    355d:	5d                   	pop    %ebp
    355e:	c3                   	ret    
    355f:	90                   	nop

00003560 <uio>:

void
uio()
{
    3560:	55                   	push   %ebp
    3561:	89 e5                	mov    %esp,%ebp
    3563:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    3566:	68 9e 51 00 00       	push   $0x519e
    356b:	6a 01                	push   $0x1
    356d:	e8 7e 04 00 00       	call   39f0 <printf>
  pid = fork();
    3572:	e8 03 03 00 00       	call   387a <fork>
  if(pid == 0){
    3577:	83 c4 10             	add    $0x10,%esp
    357a:	85 c0                	test   %eax,%eax
    357c:	74 1b                	je     3599 <uio+0x39>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit();
  } else if(pid < 0){
    357e:	78 3d                	js     35bd <uio+0x5d>
    printf (1, "fork failed\n");
    exit();
  }
  wait();
    3580:	e8 05 03 00 00       	call   388a <wait>
  printf(1, "uio test done\n");
    3585:	83 ec 08             	sub    $0x8,%esp
    3588:	68 a8 51 00 00       	push   $0x51a8
    358d:	6a 01                	push   $0x1
    358f:	e8 5c 04 00 00       	call   39f0 <printf>
}
    3594:	83 c4 10             	add    $0x10,%esp
    3597:	c9                   	leave  
    3598:	c3                   	ret    
  pid = fork();
  if(pid == 0){
    port = RTC_ADDR;
    val = 0x09;  /* year */
    /* http://wiki.osdev.org/Inline_Assembly/Examples */
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    3599:	ba 70 00 00 00       	mov    $0x70,%edx
    359e:	b8 09 00 00 00       	mov    $0x9,%eax
    35a3:	ee                   	out    %al,(%dx)
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    35a4:	ba 71 00 00 00       	mov    $0x71,%edx
    35a9:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    35aa:	52                   	push   %edx
    35ab:	52                   	push   %edx
    35ac:	68 34 59 00 00       	push   $0x5934
    35b1:	6a 01                	push   $0x1
    35b3:	e8 38 04 00 00       	call   39f0 <printf>
    exit();
    35b8:	e8 c5 02 00 00       	call   3882 <exit>
  } else if(pid < 0){
    printf (1, "fork failed\n");
    35bd:	50                   	push   %eax
    35be:	50                   	push   %eax
    35bf:	68 2d 51 00 00       	push   $0x512d
    35c4:	6a 01                	push   $0x1
    35c6:	e8 25 04 00 00       	call   39f0 <printf>
    exit();
    35cb:	e8 b2 02 00 00       	call   3882 <exit>

000035d0 <argptest>:
  wait();
  printf(1, "uio test done\n");
}

void argptest()
{
    35d0:	55                   	push   %ebp
    35d1:	89 e5                	mov    %esp,%ebp
    35d3:	53                   	push   %ebx
    35d4:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  fd = open("init", O_RDONLY);
    35d7:	6a 00                	push   $0x0
    35d9:	68 b7 51 00 00       	push   $0x51b7
    35de:	e8 df 02 00 00       	call   38c2 <open>
  if (fd < 0) {
    35e3:	83 c4 10             	add    $0x10,%esp
    35e6:	85 c0                	test   %eax,%eax
    35e8:	78 39                	js     3623 <argptest+0x53>
    printf(2, "open failed\n");
    exit();
  }
  read(fd, sbrk(0) - 1, -1);
    35ea:	83 ec 0c             	sub    $0xc,%esp
    35ed:	89 c3                	mov    %eax,%ebx
    35ef:	6a 00                	push   $0x0
    35f1:	e8 14 03 00 00       	call   390a <sbrk>
    35f6:	83 c4 0c             	add    $0xc,%esp
    35f9:	83 e8 01             	sub    $0x1,%eax
    35fc:	6a ff                	push   $0xffffffff
    35fe:	50                   	push   %eax
    35ff:	53                   	push   %ebx
    3600:	e8 95 02 00 00       	call   389a <read>
  close(fd);
    3605:	89 1c 24             	mov    %ebx,(%esp)
    3608:	e8 9d 02 00 00       	call   38aa <close>
  printf(1, "arg test passed\n");
    360d:	58                   	pop    %eax
    360e:	5a                   	pop    %edx
    360f:	68 c9 51 00 00       	push   $0x51c9
    3614:	6a 01                	push   $0x1
    3616:	e8 d5 03 00 00       	call   39f0 <printf>
}
    361b:	83 c4 10             	add    $0x10,%esp
    361e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3621:	c9                   	leave  
    3622:	c3                   	ret    
void argptest()
{
  int fd;
  fd = open("init", O_RDONLY);
  if (fd < 0) {
    printf(2, "open failed\n");
    3623:	51                   	push   %ecx
    3624:	51                   	push   %ecx
    3625:	68 bc 51 00 00       	push   $0x51bc
    362a:	6a 02                	push   $0x2
    362c:	e8 bf 03 00 00       	call   39f0 <printf>
    exit();
    3631:	e8 4c 02 00 00       	call   3882 <exit>
    3636:	66 90                	xchg   %ax,%ax
    3638:	66 90                	xchg   %ax,%ax
    363a:	66 90                	xchg   %ax,%ax
    363c:	66 90                	xchg   %ax,%ax
    363e:	66 90                	xchg   %ax,%ax

00003640 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3640:	55                   	push   %ebp
    3641:	89 e5                	mov    %esp,%ebp
    3643:	53                   	push   %ebx
    3644:	8b 45 08             	mov    0x8(%ebp),%eax
    3647:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    364a:	89 c2                	mov    %eax,%edx
    364c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3650:	83 c1 01             	add    $0x1,%ecx
    3653:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    3657:	83 c2 01             	add    $0x1,%edx
    365a:	84 db                	test   %bl,%bl
    365c:	88 5a ff             	mov    %bl,-0x1(%edx)
    365f:	75 ef                	jne    3650 <strcpy+0x10>
    ;
  return os;
}
    3661:	5b                   	pop    %ebx
    3662:	5d                   	pop    %ebp
    3663:	c3                   	ret    
    3664:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    366a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003670 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3670:	55                   	push   %ebp
    3671:	89 e5                	mov    %esp,%ebp
    3673:	56                   	push   %esi
    3674:	53                   	push   %ebx
    3675:	8b 55 08             	mov    0x8(%ebp),%edx
    3678:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    367b:	0f b6 02             	movzbl (%edx),%eax
    367e:	0f b6 19             	movzbl (%ecx),%ebx
    3681:	84 c0                	test   %al,%al
    3683:	75 1e                	jne    36a3 <strcmp+0x33>
    3685:	eb 29                	jmp    36b0 <strcmp+0x40>
    3687:	89 f6                	mov    %esi,%esi
    3689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    3690:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3693:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    3696:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3699:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    369d:	84 c0                	test   %al,%al
    369f:	74 0f                	je     36b0 <strcmp+0x40>
    36a1:	89 f1                	mov    %esi,%ecx
    36a3:	38 d8                	cmp    %bl,%al
    36a5:	74 e9                	je     3690 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    36a7:	29 d8                	sub    %ebx,%eax
}
    36a9:	5b                   	pop    %ebx
    36aa:	5e                   	pop    %esi
    36ab:	5d                   	pop    %ebp
    36ac:	c3                   	ret    
    36ad:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    36b0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    36b2:	29 d8                	sub    %ebx,%eax
}
    36b4:	5b                   	pop    %ebx
    36b5:	5e                   	pop    %esi
    36b6:	5d                   	pop    %ebp
    36b7:	c3                   	ret    
    36b8:	90                   	nop
    36b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000036c0 <strlen>:

uint
strlen(char *s)
{
    36c0:	55                   	push   %ebp
    36c1:	89 e5                	mov    %esp,%ebp
    36c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    36c6:	80 39 00             	cmpb   $0x0,(%ecx)
    36c9:	74 12                	je     36dd <strlen+0x1d>
    36cb:	31 d2                	xor    %edx,%edx
    36cd:	8d 76 00             	lea    0x0(%esi),%esi
    36d0:	83 c2 01             	add    $0x1,%edx
    36d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    36d7:	89 d0                	mov    %edx,%eax
    36d9:	75 f5                	jne    36d0 <strlen+0x10>
    ;
  return n;
}
    36db:	5d                   	pop    %ebp
    36dc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    36dd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    36df:	5d                   	pop    %ebp
    36e0:	c3                   	ret    
    36e1:	eb 0d                	jmp    36f0 <memset>
    36e3:	90                   	nop
    36e4:	90                   	nop
    36e5:	90                   	nop
    36e6:	90                   	nop
    36e7:	90                   	nop
    36e8:	90                   	nop
    36e9:	90                   	nop
    36ea:	90                   	nop
    36eb:	90                   	nop
    36ec:	90                   	nop
    36ed:	90                   	nop
    36ee:	90                   	nop
    36ef:	90                   	nop

000036f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
    36f0:	55                   	push   %ebp
    36f1:	89 e5                	mov    %esp,%ebp
    36f3:	57                   	push   %edi
    36f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    36f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
    36fa:	8b 45 0c             	mov    0xc(%ebp),%eax
    36fd:	89 d7                	mov    %edx,%edi
    36ff:	fc                   	cld    
    3700:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3702:	89 d0                	mov    %edx,%eax
    3704:	5f                   	pop    %edi
    3705:	5d                   	pop    %ebp
    3706:	c3                   	ret    
    3707:	89 f6                	mov    %esi,%esi
    3709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003710 <strchr>:

char*
strchr(const char *s, char c)
{
    3710:	55                   	push   %ebp
    3711:	89 e5                	mov    %esp,%ebp
    3713:	53                   	push   %ebx
    3714:	8b 45 08             	mov    0x8(%ebp),%eax
    3717:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    371a:	0f b6 10             	movzbl (%eax),%edx
    371d:	84 d2                	test   %dl,%dl
    371f:	74 1d                	je     373e <strchr+0x2e>
    if(*s == c)
    3721:	38 d3                	cmp    %dl,%bl
    3723:	89 d9                	mov    %ebx,%ecx
    3725:	75 0d                	jne    3734 <strchr+0x24>
    3727:	eb 17                	jmp    3740 <strchr+0x30>
    3729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3730:	38 ca                	cmp    %cl,%dl
    3732:	74 0c                	je     3740 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3734:	83 c0 01             	add    $0x1,%eax
    3737:	0f b6 10             	movzbl (%eax),%edx
    373a:	84 d2                	test   %dl,%dl
    373c:	75 f2                	jne    3730 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    373e:	31 c0                	xor    %eax,%eax
}
    3740:	5b                   	pop    %ebx
    3741:	5d                   	pop    %ebp
    3742:	c3                   	ret    
    3743:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003750 <gets>:

char*
gets(char *buf, int max)
{
    3750:	55                   	push   %ebp
    3751:	89 e5                	mov    %esp,%ebp
    3753:	57                   	push   %edi
    3754:	56                   	push   %esi
    3755:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3756:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    3758:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    375b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    375e:	eb 29                	jmp    3789 <gets+0x39>
    cc = read(0, &c, 1);
    3760:	83 ec 04             	sub    $0x4,%esp
    3763:	6a 01                	push   $0x1
    3765:	57                   	push   %edi
    3766:	6a 00                	push   $0x0
    3768:	e8 2d 01 00 00       	call   389a <read>
    if(cc < 1)
    376d:	83 c4 10             	add    $0x10,%esp
    3770:	85 c0                	test   %eax,%eax
    3772:	7e 1d                	jle    3791 <gets+0x41>
      break;
    buf[i++] = c;
    3774:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    3778:	8b 55 08             	mov    0x8(%ebp),%edx
    377b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    377d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    377f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    3783:	74 1b                	je     37a0 <gets+0x50>
    3785:	3c 0d                	cmp    $0xd,%al
    3787:	74 17                	je     37a0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3789:	8d 5e 01             	lea    0x1(%esi),%ebx
    378c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    378f:	7c cf                	jl     3760 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3791:	8b 45 08             	mov    0x8(%ebp),%eax
    3794:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    3798:	8d 65 f4             	lea    -0xc(%ebp),%esp
    379b:	5b                   	pop    %ebx
    379c:	5e                   	pop    %esi
    379d:	5f                   	pop    %edi
    379e:	5d                   	pop    %ebp
    379f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    37a0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    37a3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    37a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    37a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    37ac:	5b                   	pop    %ebx
    37ad:	5e                   	pop    %esi
    37ae:	5f                   	pop    %edi
    37af:	5d                   	pop    %ebp
    37b0:	c3                   	ret    
    37b1:	eb 0d                	jmp    37c0 <stat>
    37b3:	90                   	nop
    37b4:	90                   	nop
    37b5:	90                   	nop
    37b6:	90                   	nop
    37b7:	90                   	nop
    37b8:	90                   	nop
    37b9:	90                   	nop
    37ba:	90                   	nop
    37bb:	90                   	nop
    37bc:	90                   	nop
    37bd:	90                   	nop
    37be:	90                   	nop
    37bf:	90                   	nop

000037c0 <stat>:

int
stat(char *n, struct stat *st)
{
    37c0:	55                   	push   %ebp
    37c1:	89 e5                	mov    %esp,%ebp
    37c3:	56                   	push   %esi
    37c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    37c5:	83 ec 08             	sub    $0x8,%esp
    37c8:	6a 00                	push   $0x0
    37ca:	ff 75 08             	pushl  0x8(%ebp)
    37cd:	e8 f0 00 00 00       	call   38c2 <open>
  if(fd < 0)
    37d2:	83 c4 10             	add    $0x10,%esp
    37d5:	85 c0                	test   %eax,%eax
    37d7:	78 27                	js     3800 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    37d9:	83 ec 08             	sub    $0x8,%esp
    37dc:	ff 75 0c             	pushl  0xc(%ebp)
    37df:	89 c3                	mov    %eax,%ebx
    37e1:	50                   	push   %eax
    37e2:	e8 f3 00 00 00       	call   38da <fstat>
    37e7:	89 c6                	mov    %eax,%esi
  close(fd);
    37e9:	89 1c 24             	mov    %ebx,(%esp)
    37ec:	e8 b9 00 00 00       	call   38aa <close>
  return r;
    37f1:	83 c4 10             	add    $0x10,%esp
    37f4:	89 f0                	mov    %esi,%eax
}
    37f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
    37f9:	5b                   	pop    %ebx
    37fa:	5e                   	pop    %esi
    37fb:	5d                   	pop    %ebp
    37fc:	c3                   	ret    
    37fd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    3800:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3805:	eb ef                	jmp    37f6 <stat+0x36>
    3807:	89 f6                	mov    %esi,%esi
    3809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003810 <atoi>:
  return r;
}

int
atoi(const char *s)
{
    3810:	55                   	push   %ebp
    3811:	89 e5                	mov    %esp,%ebp
    3813:	53                   	push   %ebx
    3814:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3817:	0f be 11             	movsbl (%ecx),%edx
    381a:	8d 42 d0             	lea    -0x30(%edx),%eax
    381d:	3c 09                	cmp    $0x9,%al
    381f:	b8 00 00 00 00       	mov    $0x0,%eax
    3824:	77 1f                	ja     3845 <atoi+0x35>
    3826:	8d 76 00             	lea    0x0(%esi),%esi
    3829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    3830:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3833:	83 c1 01             	add    $0x1,%ecx
    3836:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    383a:	0f be 11             	movsbl (%ecx),%edx
    383d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3840:	80 fb 09             	cmp    $0x9,%bl
    3843:	76 eb                	jbe    3830 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
    3845:	5b                   	pop    %ebx
    3846:	5d                   	pop    %ebp
    3847:	c3                   	ret    
    3848:	90                   	nop
    3849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003850 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3850:	55                   	push   %ebp
    3851:	89 e5                	mov    %esp,%ebp
    3853:	56                   	push   %esi
    3854:	53                   	push   %ebx
    3855:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3858:	8b 45 08             	mov    0x8(%ebp),%eax
    385b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    385e:	85 db                	test   %ebx,%ebx
    3860:	7e 14                	jle    3876 <memmove+0x26>
    3862:	31 d2                	xor    %edx,%edx
    3864:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    3868:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    386c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    386f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3872:	39 da                	cmp    %ebx,%edx
    3874:	75 f2                	jne    3868 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
    3876:	5b                   	pop    %ebx
    3877:	5e                   	pop    %esi
    3878:	5d                   	pop    %ebp
    3879:	c3                   	ret    

0000387a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    387a:	b8 01 00 00 00       	mov    $0x1,%eax
    387f:	cd 40                	int    $0x40
    3881:	c3                   	ret    

00003882 <exit>:
SYSCALL(exit)
    3882:	b8 02 00 00 00       	mov    $0x2,%eax
    3887:	cd 40                	int    $0x40
    3889:	c3                   	ret    

0000388a <wait>:
SYSCALL(wait)
    388a:	b8 03 00 00 00       	mov    $0x3,%eax
    388f:	cd 40                	int    $0x40
    3891:	c3                   	ret    

00003892 <pipe>:
SYSCALL(pipe)
    3892:	b8 04 00 00 00       	mov    $0x4,%eax
    3897:	cd 40                	int    $0x40
    3899:	c3                   	ret    

0000389a <read>:
SYSCALL(read)
    389a:	b8 05 00 00 00       	mov    $0x5,%eax
    389f:	cd 40                	int    $0x40
    38a1:	c3                   	ret    

000038a2 <write>:
SYSCALL(write)
    38a2:	b8 10 00 00 00       	mov    $0x10,%eax
    38a7:	cd 40                	int    $0x40
    38a9:	c3                   	ret    

000038aa <close>:
SYSCALL(close)
    38aa:	b8 15 00 00 00       	mov    $0x15,%eax
    38af:	cd 40                	int    $0x40
    38b1:	c3                   	ret    

000038b2 <kill>:
SYSCALL(kill)
    38b2:	b8 06 00 00 00       	mov    $0x6,%eax
    38b7:	cd 40                	int    $0x40
    38b9:	c3                   	ret    

000038ba <exec>:
SYSCALL(exec)
    38ba:	b8 07 00 00 00       	mov    $0x7,%eax
    38bf:	cd 40                	int    $0x40
    38c1:	c3                   	ret    

000038c2 <open>:
SYSCALL(open)
    38c2:	b8 0f 00 00 00       	mov    $0xf,%eax
    38c7:	cd 40                	int    $0x40
    38c9:	c3                   	ret    

000038ca <mknod>:
SYSCALL(mknod)
    38ca:	b8 11 00 00 00       	mov    $0x11,%eax
    38cf:	cd 40                	int    $0x40
    38d1:	c3                   	ret    

000038d2 <unlink>:
SYSCALL(unlink)
    38d2:	b8 12 00 00 00       	mov    $0x12,%eax
    38d7:	cd 40                	int    $0x40
    38d9:	c3                   	ret    

000038da <fstat>:
SYSCALL(fstat)
    38da:	b8 08 00 00 00       	mov    $0x8,%eax
    38df:	cd 40                	int    $0x40
    38e1:	c3                   	ret    

000038e2 <link>:
SYSCALL(link)
    38e2:	b8 13 00 00 00       	mov    $0x13,%eax
    38e7:	cd 40                	int    $0x40
    38e9:	c3                   	ret    

000038ea <mkdir>:
SYSCALL(mkdir)
    38ea:	b8 14 00 00 00       	mov    $0x14,%eax
    38ef:	cd 40                	int    $0x40
    38f1:	c3                   	ret    

000038f2 <chdir>:
SYSCALL(chdir)
    38f2:	b8 09 00 00 00       	mov    $0x9,%eax
    38f7:	cd 40                	int    $0x40
    38f9:	c3                   	ret    

000038fa <dup>:
SYSCALL(dup)
    38fa:	b8 0a 00 00 00       	mov    $0xa,%eax
    38ff:	cd 40                	int    $0x40
    3901:	c3                   	ret    

00003902 <getpid>:
SYSCALL(getpid)
    3902:	b8 0b 00 00 00       	mov    $0xb,%eax
    3907:	cd 40                	int    $0x40
    3909:	c3                   	ret    

0000390a <sbrk>:
SYSCALL(sbrk)
    390a:	b8 0c 00 00 00       	mov    $0xc,%eax
    390f:	cd 40                	int    $0x40
    3911:	c3                   	ret    

00003912 <sleep>:
SYSCALL(sleep)
    3912:	b8 0d 00 00 00       	mov    $0xd,%eax
    3917:	cd 40                	int    $0x40
    3919:	c3                   	ret    

0000391a <uptime>:
SYSCALL(uptime)
    391a:	b8 0e 00 00 00       	mov    $0xe,%eax
    391f:	cd 40                	int    $0x40
    3921:	c3                   	ret    

00003922 <signal>:
/*pazit---------------------------------------------------*/
SYSCALL(signal)  
    3922:	b8 16 00 00 00       	mov    $0x16,%eax
    3927:	cd 40                	int    $0x40
    3929:	c3                   	ret    

0000392a <sigsend>:
SYSCALL(sigsend)  
    392a:	b8 17 00 00 00       	mov    $0x17,%eax
    392f:	cd 40                	int    $0x40
    3931:	c3                   	ret    

00003932 <sigreturn>:
SYSCALL(sigreturn) 
    3932:	b8 18 00 00 00       	mov    $0x18,%eax
    3937:	cd 40                	int    $0x40
    3939:	c3                   	ret    

0000393a <alarm>:
SYSCALL(alarm)
    393a:	b8 19 00 00 00       	mov    $0x19,%eax
    393f:	cd 40                	int    $0x40
    3941:	c3                   	ret    
    3942:	66 90                	xchg   %ax,%ax
    3944:	66 90                	xchg   %ax,%ax
    3946:	66 90                	xchg   %ax,%ax
    3948:	66 90                	xchg   %ax,%ax
    394a:	66 90                	xchg   %ax,%ax
    394c:	66 90                	xchg   %ax,%ax
    394e:	66 90                	xchg   %ax,%ax

00003950 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3950:	55                   	push   %ebp
    3951:	89 e5                	mov    %esp,%ebp
    3953:	57                   	push   %edi
    3954:	56                   	push   %esi
    3955:	53                   	push   %ebx
    3956:	89 c6                	mov    %eax,%esi
    3958:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    395b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    395e:	85 db                	test   %ebx,%ebx
    3960:	74 7e                	je     39e0 <printint+0x90>
    3962:	89 d0                	mov    %edx,%eax
    3964:	c1 e8 1f             	shr    $0x1f,%eax
    3967:	84 c0                	test   %al,%al
    3969:	74 75                	je     39e0 <printint+0x90>
    neg = 1;
    x = -xx;
    396b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    396d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    3974:	f7 d8                	neg    %eax
    3976:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3979:	31 ff                	xor    %edi,%edi
    397b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    397e:	89 ce                	mov    %ecx,%esi
    3980:	eb 08                	jmp    398a <printint+0x3a>
    3982:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    3988:	89 cf                	mov    %ecx,%edi
    398a:	31 d2                	xor    %edx,%edx
    398c:	8d 4f 01             	lea    0x1(%edi),%ecx
    398f:	f7 f6                	div    %esi
    3991:	0f b6 92 8c 59 00 00 	movzbl 0x598c(%edx),%edx
  }while((x /= base) != 0);
    3998:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    399a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    399d:	75 e9                	jne    3988 <printint+0x38>
  if(neg)
    399f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    39a2:	8b 75 c0             	mov    -0x40(%ebp),%esi
    39a5:	85 c0                	test   %eax,%eax
    39a7:	74 08                	je     39b1 <printint+0x61>
    buf[i++] = '-';
    39a9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    39ae:	8d 4f 02             	lea    0x2(%edi),%ecx
    39b1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    39b5:	8d 76 00             	lea    0x0(%esi),%esi
    39b8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    39bb:	83 ec 04             	sub    $0x4,%esp
    39be:	83 ef 01             	sub    $0x1,%edi
    39c1:	6a 01                	push   $0x1
    39c3:	53                   	push   %ebx
    39c4:	56                   	push   %esi
    39c5:	88 45 d7             	mov    %al,-0x29(%ebp)
    39c8:	e8 d5 fe ff ff       	call   38a2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    39cd:	83 c4 10             	add    $0x10,%esp
    39d0:	39 df                	cmp    %ebx,%edi
    39d2:	75 e4                	jne    39b8 <printint+0x68>
    putc(fd, buf[i]);
}
    39d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    39d7:	5b                   	pop    %ebx
    39d8:	5e                   	pop    %esi
    39d9:	5f                   	pop    %edi
    39da:	5d                   	pop    %ebp
    39db:	c3                   	ret    
    39dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    39e0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    39e2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    39e9:	eb 8b                	jmp    3976 <printint+0x26>
    39eb:	90                   	nop
    39ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000039f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    39f0:	55                   	push   %ebp
    39f1:	89 e5                	mov    %esp,%ebp
    39f3:	57                   	push   %edi
    39f4:	56                   	push   %esi
    39f5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    39f6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    39f9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    39fc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    39ff:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a02:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3a05:	0f b6 1e             	movzbl (%esi),%ebx
    3a08:	83 c6 01             	add    $0x1,%esi
    3a0b:	84 db                	test   %bl,%bl
    3a0d:	0f 84 b0 00 00 00    	je     3ac3 <printf+0xd3>
    3a13:	31 d2                	xor    %edx,%edx
    3a15:	eb 39                	jmp    3a50 <printf+0x60>
    3a17:	89 f6                	mov    %esi,%esi
    3a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3a20:	83 f8 25             	cmp    $0x25,%eax
    3a23:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    3a26:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3a2b:	74 18                	je     3a45 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3a2d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3a30:	83 ec 04             	sub    $0x4,%esp
    3a33:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    3a36:	6a 01                	push   $0x1
    3a38:	50                   	push   %eax
    3a39:	57                   	push   %edi
    3a3a:	e8 63 fe ff ff       	call   38a2 <write>
    3a3f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3a42:	83 c4 10             	add    $0x10,%esp
    3a45:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a48:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    3a4c:	84 db                	test   %bl,%bl
    3a4e:	74 73                	je     3ac3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    3a50:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    3a52:	0f be cb             	movsbl %bl,%ecx
    3a55:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    3a58:	74 c6                	je     3a20 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3a5a:	83 fa 25             	cmp    $0x25,%edx
    3a5d:	75 e6                	jne    3a45 <printf+0x55>
      if(c == 'd'){
    3a5f:	83 f8 64             	cmp    $0x64,%eax
    3a62:	0f 84 f8 00 00 00    	je     3b60 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3a68:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    3a6e:	83 f9 70             	cmp    $0x70,%ecx
    3a71:	74 5d                	je     3ad0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3a73:	83 f8 73             	cmp    $0x73,%eax
    3a76:	0f 84 84 00 00 00    	je     3b00 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3a7c:	83 f8 63             	cmp    $0x63,%eax
    3a7f:	0f 84 ea 00 00 00    	je     3b6f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3a85:	83 f8 25             	cmp    $0x25,%eax
    3a88:	0f 84 c2 00 00 00    	je     3b50 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3a8e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3a91:	83 ec 04             	sub    $0x4,%esp
    3a94:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3a98:	6a 01                	push   $0x1
    3a9a:	50                   	push   %eax
    3a9b:	57                   	push   %edi
    3a9c:	e8 01 fe ff ff       	call   38a2 <write>
    3aa1:	83 c4 0c             	add    $0xc,%esp
    3aa4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3aa7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3aaa:	6a 01                	push   $0x1
    3aac:	50                   	push   %eax
    3aad:	57                   	push   %edi
    3aae:	83 c6 01             	add    $0x1,%esi
    3ab1:	e8 ec fd ff ff       	call   38a2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ab6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3aba:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3abd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3abf:	84 db                	test   %bl,%bl
    3ac1:	75 8d                	jne    3a50 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3ac3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3ac6:	5b                   	pop    %ebx
    3ac7:	5e                   	pop    %esi
    3ac8:	5f                   	pop    %edi
    3ac9:	5d                   	pop    %ebp
    3aca:	c3                   	ret    
    3acb:	90                   	nop
    3acc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3ad0:	83 ec 0c             	sub    $0xc,%esp
    3ad3:	b9 10 00 00 00       	mov    $0x10,%ecx
    3ad8:	6a 00                	push   $0x0
    3ada:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    3add:	89 f8                	mov    %edi,%eax
    3adf:	8b 13                	mov    (%ebx),%edx
    3ae1:	e8 6a fe ff ff       	call   3950 <printint>
        ap++;
    3ae6:	89 d8                	mov    %ebx,%eax
    3ae8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3aeb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    3aed:	83 c0 04             	add    $0x4,%eax
    3af0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3af3:	e9 4d ff ff ff       	jmp    3a45 <printf+0x55>
    3af8:	90                   	nop
    3af9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    3b00:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3b03:	8b 18                	mov    (%eax),%ebx
        ap++;
    3b05:	83 c0 04             	add    $0x4,%eax
    3b08:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    3b0b:	b8 82 59 00 00       	mov    $0x5982,%eax
    3b10:	85 db                	test   %ebx,%ebx
    3b12:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    3b15:	0f b6 03             	movzbl (%ebx),%eax
    3b18:	84 c0                	test   %al,%al
    3b1a:	74 23                	je     3b3f <printf+0x14f>
    3b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3b20:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b23:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    3b26:	83 ec 04             	sub    $0x4,%esp
    3b29:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    3b2b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b2e:	50                   	push   %eax
    3b2f:	57                   	push   %edi
    3b30:	e8 6d fd ff ff       	call   38a2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3b35:	0f b6 03             	movzbl (%ebx),%eax
    3b38:	83 c4 10             	add    $0x10,%esp
    3b3b:	84 c0                	test   %al,%al
    3b3d:	75 e1                	jne    3b20 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b3f:	31 d2                	xor    %edx,%edx
    3b41:	e9 ff fe ff ff       	jmp    3a45 <printf+0x55>
    3b46:	8d 76 00             	lea    0x0(%esi),%esi
    3b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b50:	83 ec 04             	sub    $0x4,%esp
    3b53:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    3b56:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3b59:	6a 01                	push   $0x1
    3b5b:	e9 4c ff ff ff       	jmp    3aac <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    3b60:	83 ec 0c             	sub    $0xc,%esp
    3b63:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3b68:	6a 01                	push   $0x1
    3b6a:	e9 6b ff ff ff       	jmp    3ada <printf+0xea>
    3b6f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b72:	83 ec 04             	sub    $0x4,%esp
    3b75:	8b 03                	mov    (%ebx),%eax
    3b77:	6a 01                	push   $0x1
    3b79:	88 45 e4             	mov    %al,-0x1c(%ebp)
    3b7c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3b7f:	50                   	push   %eax
    3b80:	57                   	push   %edi
    3b81:	e8 1c fd ff ff       	call   38a2 <write>
    3b86:	e9 5b ff ff ff       	jmp    3ae6 <printf+0xf6>
    3b8b:	66 90                	xchg   %ax,%ax
    3b8d:	66 90                	xchg   %ax,%ax
    3b8f:	90                   	nop

00003b90 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3b90:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3b91:	a1 e0 64 00 00       	mov    0x64e0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    3b96:	89 e5                	mov    %esp,%ebp
    3b98:	57                   	push   %edi
    3b99:	56                   	push   %esi
    3b9a:	53                   	push   %ebx
    3b9b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3b9e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3ba0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3ba3:	39 c8                	cmp    %ecx,%eax
    3ba5:	73 19                	jae    3bc0 <free+0x30>
    3ba7:	89 f6                	mov    %esi,%esi
    3ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3bb0:	39 d1                	cmp    %edx,%ecx
    3bb2:	72 1c                	jb     3bd0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3bb4:	39 d0                	cmp    %edx,%eax
    3bb6:	73 18                	jae    3bd0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    3bb8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3bba:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3bbc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3bbe:	72 f0                	jb     3bb0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3bc0:	39 d0                	cmp    %edx,%eax
    3bc2:	72 f4                	jb     3bb8 <free+0x28>
    3bc4:	39 d1                	cmp    %edx,%ecx
    3bc6:	73 f0                	jae    3bb8 <free+0x28>
    3bc8:	90                   	nop
    3bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    3bd0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3bd3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3bd6:	39 d7                	cmp    %edx,%edi
    3bd8:	74 19                	je     3bf3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3bda:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3bdd:	8b 50 04             	mov    0x4(%eax),%edx
    3be0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3be3:	39 f1                	cmp    %esi,%ecx
    3be5:	74 23                	je     3c0a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3be7:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3be9:	a3 e0 64 00 00       	mov    %eax,0x64e0
}
    3bee:	5b                   	pop    %ebx
    3bef:	5e                   	pop    %esi
    3bf0:	5f                   	pop    %edi
    3bf1:	5d                   	pop    %ebp
    3bf2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    3bf3:	03 72 04             	add    0x4(%edx),%esi
    3bf6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3bf9:	8b 10                	mov    (%eax),%edx
    3bfb:	8b 12                	mov    (%edx),%edx
    3bfd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    3c00:	8b 50 04             	mov    0x4(%eax),%edx
    3c03:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c06:	39 f1                	cmp    %esi,%ecx
    3c08:	75 dd                	jne    3be7 <free+0x57>
    p->s.size += bp->s.size;
    3c0a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    3c0d:	a3 e0 64 00 00       	mov    %eax,0x64e0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    3c12:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3c15:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3c18:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    3c1a:	5b                   	pop    %ebx
    3c1b:	5e                   	pop    %esi
    3c1c:	5f                   	pop    %edi
    3c1d:	5d                   	pop    %ebp
    3c1e:	c3                   	ret    
    3c1f:	90                   	nop

00003c20 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3c20:	55                   	push   %ebp
    3c21:	89 e5                	mov    %esp,%ebp
    3c23:	57                   	push   %edi
    3c24:	56                   	push   %esi
    3c25:	53                   	push   %ebx
    3c26:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3c29:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3c2c:	8b 15 e0 64 00 00    	mov    0x64e0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3c32:	8d 78 07             	lea    0x7(%eax),%edi
    3c35:	c1 ef 03             	shr    $0x3,%edi
    3c38:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3c3b:	85 d2                	test   %edx,%edx
    3c3d:	0f 84 a3 00 00 00    	je     3ce6 <malloc+0xc6>
    3c43:	8b 02                	mov    (%edx),%eax
    3c45:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3c48:	39 cf                	cmp    %ecx,%edi
    3c4a:	76 74                	jbe    3cc0 <malloc+0xa0>
    3c4c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    3c52:	be 00 10 00 00       	mov    $0x1000,%esi
    3c57:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    3c5e:	0f 43 f7             	cmovae %edi,%esi
    3c61:	ba 00 80 00 00       	mov    $0x8000,%edx
    3c66:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    3c6c:	0f 46 da             	cmovbe %edx,%ebx
    3c6f:	eb 10                	jmp    3c81 <malloc+0x61>
    3c71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3c78:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3c7a:	8b 48 04             	mov    0x4(%eax),%ecx
    3c7d:	39 cf                	cmp    %ecx,%edi
    3c7f:	76 3f                	jbe    3cc0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3c81:	39 05 e0 64 00 00    	cmp    %eax,0x64e0
    3c87:	89 c2                	mov    %eax,%edx
    3c89:	75 ed                	jne    3c78 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    3c8b:	83 ec 0c             	sub    $0xc,%esp
    3c8e:	53                   	push   %ebx
    3c8f:	e8 76 fc ff ff       	call   390a <sbrk>
  if(p == (char*)-1)
    3c94:	83 c4 10             	add    $0x10,%esp
    3c97:	83 f8 ff             	cmp    $0xffffffff,%eax
    3c9a:	74 1c                	je     3cb8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    3c9c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    3c9f:	83 ec 0c             	sub    $0xc,%esp
    3ca2:	83 c0 08             	add    $0x8,%eax
    3ca5:	50                   	push   %eax
    3ca6:	e8 e5 fe ff ff       	call   3b90 <free>
  return freep;
    3cab:	8b 15 e0 64 00 00    	mov    0x64e0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    3cb1:	83 c4 10             	add    $0x10,%esp
    3cb4:	85 d2                	test   %edx,%edx
    3cb6:	75 c0                	jne    3c78 <malloc+0x58>
        return 0;
    3cb8:	31 c0                	xor    %eax,%eax
    3cba:	eb 1c                	jmp    3cd8 <malloc+0xb8>
    3cbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    3cc0:	39 cf                	cmp    %ecx,%edi
    3cc2:	74 1c                	je     3ce0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    3cc4:	29 f9                	sub    %edi,%ecx
    3cc6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3cc9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3ccc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    3ccf:	89 15 e0 64 00 00    	mov    %edx,0x64e0
      return (void*)(p + 1);
    3cd5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    3cd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3cdb:	5b                   	pop    %ebx
    3cdc:	5e                   	pop    %esi
    3cdd:	5f                   	pop    %edi
    3cde:	5d                   	pop    %ebp
    3cdf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    3ce0:	8b 08                	mov    (%eax),%ecx
    3ce2:	89 0a                	mov    %ecx,(%edx)
    3ce4:	eb e9                	jmp    3ccf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    3ce6:	c7 05 e0 64 00 00 e4 	movl   $0x64e4,0x64e0
    3ced:	64 00 00 
    3cf0:	c7 05 e4 64 00 00 e4 	movl   $0x64e4,0x64e4
    3cf7:	64 00 00 
    base.s.size = 0;
    3cfa:	b8 e4 64 00 00       	mov    $0x64e4,%eax
    3cff:	c7 05 e8 64 00 00 00 	movl   $0x0,0x64e8
    3d06:	00 00 00 
    3d09:	e9 3e ff ff ff       	jmp    3c4c <malloc+0x2c>
    3d0e:	66 90                	xchg   %ax,%ax

00003d10 <uthread_yield>:
  exit();
}

void 
uthread_yield(void)
{
    3d10:	55                   	push   %ebp
    3d11:	89 e5                	mov    %esp,%ebp
    3d13:	57                   	push   %edi
    3d14:	56                   	push   %esi
    3d15:	53                   	push   %ebx
    3d16:	83 ec 28             	sub    $0x28,%esp
  // switch alarm(0) to cancel thread switching while yielding 
  alarm(0);
    3d19:	6a 00                	push   $0x0
    3d1b:	e8 1a fc ff ff       	call   393a <alarm>

  // if current thread is running (most cases), the thread didn't finisht its job so turn his state to RUNNABLE
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    3d20:	a1 40 ac 00 00       	mov    0xac40,%eax
    3d25:	83 c4 10             	add    $0x10,%esp
    3d28:	8d 14 40             	lea    (%eax,%eax,2),%edx
    3d2b:	8d 14 d5 60 ac 00 00 	lea    0xac60(,%edx,8),%edx
    3d32:	83 7a 10 01          	cmpl   $0x1,0x10(%edx)
    3d36:	0f 84 54 01 00 00    	je     3e90 <uthread_yield+0x180>
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
    3d3c:	8d 04 40             	lea    (%eax,%eax,2),%eax
  asm("movl %%ebp, %0;" : "=r" (uthread_pool[c_uthread_index].ebp));

  // load the new thread

  // pick the next thread index
  c_uthread_index++;
    3d3f:	83 05 40 ac 00 00 01 	addl   $0x1,0xac40
    3d46:	bb 70 ac 00 00       	mov    $0xac70,%ebx
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
    3d4b:	89 e2                	mov    %esp,%edx
    3d4d:	8d 04 c5 60 ac 00 00 	lea    0xac60(,%eax,8),%eax

  // ************** lottery scheduler mechanism ******************* //

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
    3d54:	c7 05 10 ad 00 00 ff 	movl   $0xffffffff,0xad10
    3d5b:	ff ff ff 
    3d5e:	89 de                	mov    %ebx,%esi
    3d60:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
    3d64:	bf ff ff ff ff       	mov    $0xffffffff,%edi
    3d69:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
    3d6e:	89 50 04             	mov    %edx,0x4(%eax)
  asm("movl %%ebp, %0;" : "=r" (uthread_pool[c_uthread_index].ebp));
    3d71:	89 ea                	mov    %ebp,%edx
    3d73:	89 50 08             	mov    %edx,0x8(%eax)
    3d76:	8d 76 00             	lea    0x0(%esi),%esi
    3d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
    3d80:	8b 06                	mov    (%esi),%eax
    3d82:	85 c0                	test   %eax,%eax
    3d84:	0f 95 c2             	setne  %dl
    3d87:	83 f8 03             	cmp    $0x3,%eax
    3d8a:	0f 95 c0             	setne  %al
    3d8d:	20 d0                	and    %dl,%al
    3d8f:	74 0a                	je     3d9b <uthread_yield+0x8b>
      current_ticket_num += uthread_pool[j].ntickets;
    3d91:	8b 7e 04             	mov    0x4(%esi),%edi
    3d94:	88 45 e7             	mov    %al,-0x19(%ebp)
    3d97:	01 cf                	add    %ecx,%edi
    3d99:	89 f9                	mov    %edi,%ecx
    3d9b:	83 c6 18             	add    $0x18,%esi
  // ************** lottery scheduler mechanism ******************* //

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
    3d9e:	81 fe 18 ad 00 00    	cmp    $0xad18,%esi
    3da4:	75 da                	jne    3d80 <uthread_yield+0x70>
    3da6:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
    3daa:	0f 85 ec 00 00 00    	jne    3e9c <uthread_yield+0x18c>

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3db0:	69 05 5c 64 00 00 0d 	imul   $0x19660d,0x645c,%eax
    3db7:	66 19 00 
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
      current_ticket_num += uthread_pool[j].ntickets;
  }

  // generate a random number between 0 and current_ticket_num
  randomTicket = rand() % current_ticket_num;
    3dba:	31 d2                	xor    %edx,%edx

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
    3dbc:	83 ec 04             	sub    $0x4,%esp
    3dbf:	51                   	push   %ecx
    3dc0:	68 9d 59 00 00       	push   $0x599d
    3dc5:	6a 01                	push   $0x1

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3dc7:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3dcc:	a3 5c 64 00 00       	mov    %eax,0x645c
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
      current_ticket_num += uthread_pool[j].ntickets;
  }

  // generate a random number between 0 and current_ticket_num
  randomTicket = rand() % current_ticket_num;
    3dd1:	f7 f1                	div    %ecx
    3dd3:	89 d6                	mov    %edx,%esi

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
    3dd5:	e8 16 fc ff ff       	call   39f0 <printf>
  printf(1,"randomTicket=%d\n", randomTicket);
    3dda:	83 c4 0c             	add    $0xc,%esp
    3ddd:	56                   	push   %esi
    3dde:	68 b4 59 00 00       	push   $0x59b4
    3de3:	6a 01                	push   $0x1
    3de5:	e8 06 fc ff ff       	call   39f0 <printf>

  // set the choosen order thread to run
  choosen = randomTicket / NTICKET;
    3dea:	89 f0                	mov    %esi,%eax
    3dec:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3df1:	c1 fe 1f             	sar    $0x1f,%esi
    3df4:	f7 ea                	imul   %edx
    3df6:	83 c4 10             	add    $0x10,%esp

  // pick the index of choosen thread
  int chooseCount = -1;
    3df9:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  for(j = 0; j < MAX_THREADS; ++j) {
    3dfe:	31 c0                	xor    %eax,%eax

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
  printf(1,"randomTicket=%d\n", randomTicket);

  // set the choosen order thread to run
  choosen = randomTicket / NTICKET;
    3e00:	d1 fa                	sar    %edx
    3e02:	29 f2                	sub    %esi,%edx
    3e04:	89 15 0c ad 00 00    	mov    %edx,0xad0c
    3e0a:	eb 0f                	jmp    3e1b <uthread_yield+0x10b>
    3e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // pick the index of choosen thread
  int chooseCount = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
    3e10:	83 c0 01             	add    $0x1,%eax
    3e13:	83 c3 18             	add    $0x18,%ebx
    3e16:	83 f8 07             	cmp    $0x7,%eax
    3e19:	74 15                	je     3e30 <uthread_yield+0x120>
    if(uthread_pool[j].state == RUNNABLE) {
    3e1b:	83 3b 02             	cmpl   $0x2,(%ebx)
    3e1e:	75 f0                	jne    3e10 <uthread_yield+0x100>
      chooseCount++;
    3e20:	83 c1 01             	add    $0x1,%ecx
      if (choosen == chooseCount)
    3e23:	39 ca                	cmp    %ecx,%edx
    3e25:	75 e9                	jne    3e10 <uthread_yield+0x100>
    3e27:	89 f6                	mov    %esi,%esi
    3e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        break;
    }
  }

  // set current thread to the lottery chosen one
  c_uthread_index = j;
    3e30:	a3 40 ac 00 00       	mov    %eax,0xac40

  // ****************************************************************** //

  // current switched thread is move to RUNNING mode, next to be execute
  uthread_pool[c_uthread_index].state = RUNNING;
    3e35:	8d 04 40             	lea    (%eax,%eax,2),%eax
    3e38:	8d 04 c5 60 ac 00 00 	lea    0xac60(,%eax,8),%eax


  // if esp is null, thread is running its first time, so we have to load a functio to it 
  if(uthread_pool[c_uthread_index].esp == 0) {
    3e3f:	8b 50 04             	mov    0x4(%eax),%edx
  c_uthread_index = j;

  // ****************************************************************** //

  // current switched thread is move to RUNNING mode, next to be execute
  uthread_pool[c_uthread_index].state = RUNNING;
    3e42:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)


  // if esp is null, thread is running its first time, so we have to load a functio to it 
  if(uthread_pool[c_uthread_index].esp == 0) {
    3e49:	85 d2                	test   %edx,%edx
    3e4b:	75 23                	jne    3e70 <uthread_yield+0x160>
    asm("movl %0, %%esp;" : : "r" (uthread_pool[c_uthread_index].stack + STACK_SIZE - 3*sizeof(int)));
    3e4d:	8b 40 0c             	mov    0xc(%eax),%eax
    3e50:	05 f4 0f 00 00       	add    $0xff4,%eax
    3e55:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].stack + STACK_SIZE - 3*sizeof(int)));
    3e57:	89 c5                	mov    %eax,%ebp
    // jump to execute function to run the thread own function
    asm("jmp *%0;" : : "r" (execute_thread));
    3e59:	b8 20 41 00 00       	mov    $0x4120,%eax
    3e5e:	ff e0                	jmp    *%eax
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].ebp));

    // reset alarm
    alarm(UTHREAD_QUANTA);
  }
}
    3e60:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3e63:	5b                   	pop    %ebx
    3e64:	5e                   	pop    %esi
    3e65:	5f                   	pop    %edi
    3e66:	5d                   	pop    %ebp
    3e67:	c3                   	ret    
    3e68:	90                   	nop
    3e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // jump to execute function to run the thread own function
    asm("jmp *%0;" : : "r" (execute_thread));
  } 
  else  {
    // restore thread stack
    asm("movl %0, %%esp;" : : "r" (uthread_pool[c_uthread_index].esp));
    3e70:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].ebp));
    3e72:	8b 40 08             	mov    0x8(%eax),%eax
    3e75:	89 c5                	mov    %eax,%ebp

    // reset alarm
    alarm(UTHREAD_QUANTA);
    3e77:	83 ec 0c             	sub    $0xc,%esp
    3e7a:	6a 05                	push   $0x5
    3e7c:	e8 b9 fa ff ff       	call   393a <alarm>
    3e81:	83 c4 10             	add    $0x10,%esp
  }
}
    3e84:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3e87:	5b                   	pop    %ebx
    3e88:	5e                   	pop    %esi
    3e89:	5f                   	pop    %edi
    3e8a:	5d                   	pop    %ebp
    3e8b:	c3                   	ret    
    3e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  // switch alarm(0) to cancel thread switching while yielding 
  alarm(0);

  // if current thread is running (most cases), the thread didn't finisht its job so turn his state to RUNNABLE
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
    3e90:	c7 42 10 02 00 00 00 	movl   $0x2,0x10(%edx)
    3e97:	e9 a0 fe ff ff       	jmp    3d3c <uthread_yield+0x2c>
    3e9c:	89 3d 10 ad 00 00    	mov    %edi,0xad10
    3ea2:	e9 09 ff ff ff       	jmp    3db0 <uthread_yield+0xa0>
    3ea7:	89 f6                	mov    %esi,%esi
    3ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003eb0 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3eb0:	69 05 5c 64 00 00 0d 	imul   $0x19660d,0x645c,%eax
    3eb7:	66 19 00 
//***************************************************************************************//

unsigned long randstate = 1;
unsigned int
rand()
{
    3eba:	55                   	push   %ebp
    3ebb:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
    3ebd:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3ebe:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3ec3:	a3 5c 64 00 00       	mov    %eax,0x645c
  return randstate;
}
    3ec8:	c3                   	ret    
    3ec9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003ed0 <uthread_init>:
  uthread_exit();
}

int
 uthread_init()
{
    3ed0:	55                   	push   %ebp
    3ed1:	89 e5                	mov    %esp,%ebp
    3ed3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "** INIT USER LEVEL THREAD **\n");
    3ed6:	68 c5 59 00 00       	push   $0x59c5
    3edb:	6a 01                	push   $0x1
    3edd:	e8 0e fb ff ff       	call   39f0 <printf>
    3ee2:	b8 70 ac 00 00       	mov    $0xac70,%eax
    3ee7:	83 c4 10             	add    $0x10,%esp
    3eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  // set all threads state to FREE - init pool
  int i;
  for(i = 0; i < MAX_THREADS; ++i) {
    uthread_pool[i].state = FREE;
    3ef0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    uthread_pool[i].ntickets = NTICKET;
    3ef6:	c7 40 04 05 00 00 00 	movl   $0x5,0x4(%eax)
    3efd:	83 c0 18             	add    $0x18,%eax
 uthread_init()
{
  printf(1, "** INIT USER LEVEL THREAD **\n");
  // set all threads state to FREE - init pool
  int i;
  for(i = 0; i < MAX_THREADS; ++i) {
    3f00:	3d 18 ad 00 00       	cmp    $0xad18,%eax
    3f05:	75 e9                	jne    3ef0 <uthread_init+0x20>
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
    3f07:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < MAX_THREADS; ++i) {
    uthread_pool[i].state = FREE;
    uthread_pool[i].ntickets = NTICKET;
  }

  next_tid = 1;
    3f0a:	c7 05 08 ad 00 00 01 	movl   $0x1,0xad08
    3f11:	00 00 00 

  // initialize main thread
  c_uthread_index = 0;
    3f14:	c7 05 40 ac 00 00 00 	movl   $0x0,0xac40
    3f1b:	00 00 00 
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
    3f1e:	68 10 3d 00 00       	push   $0x3d10
    3f23:	6a 0e                	push   $0xe
  next_tid = 1;

  // initialize main thread
  c_uthread_index = 0;
  // set tid and stack to null
  uthread_pool[c_uthread_index].tid = 0;
    3f25:	c7 05 60 ac 00 00 00 	movl   $0x0,0xac60
    3f2c:	00 00 00 
  uthread_pool[c_uthread_index].stack = 0; 
    3f2f:	c7 05 6c ac 00 00 00 	movl   $0x0,0xac6c
    3f36:	00 00 00 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;
    3f39:	c7 05 70 ac 00 00 01 	movl   $0x1,0xac70
    3f40:	00 00 00 

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
    3f43:	e8 da f9 ff ff       	call   3922 <signal>
    3f48:	83 c4 10             	add    $0x10,%esp
    3f4b:	85 c0                	test   %eax,%eax
    // case signal error
    return -1;
    3f4d:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
    3f52:	75 0f                	jne    3f63 <uthread_init+0x93>
    // case signal error
    return -1;
  }

  // execute the alarm syscall with UTHREAD_QUANTA
  alarm(UTHREAD_QUANTA);
    3f54:	83 ec 0c             	sub    $0xc,%esp
    3f57:	6a 05                	push   $0x5
    3f59:	e8 dc f9 ff ff       	call   393a <alarm>

  return 0;
    3f5e:	83 c4 10             	add    $0x10,%esp
    3f61:	31 d2                	xor    %edx,%edx
}
    3f63:	89 d0                	mov    %edx,%eax
    3f65:	c9                   	leave  
    3f66:	c3                   	ret    
    3f67:	89 f6                	mov    %esi,%esi
    3f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003f70 <uthread_create>:

int 
uthread_create(void (*func)(void *), void* arg)
{
    3f70:	55                   	push   %ebp
    3f71:	89 e5                	mov    %esp,%ebp
    3f73:	56                   	push   %esi
    3f74:	53                   	push   %ebx
  printf(1, "start thread creation \n");
    3f75:	83 ec 08             	sub    $0x8,%esp
    3f78:	68 e3 59 00 00       	push   $0x59e3
    3f7d:	6a 01                	push   $0x1
    3f7f:	e8 6c fa ff ff       	call   39f0 <printf>

  // local thread pool index
  int i;

  // disable thread switching
  alarm(0);
    3f84:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3f8b:	e8 aa f9 ff ff       	call   393a <alarm>

  printf(1, "uthread_create after alarm(0) \n");
    3f90:	5b                   	pop    %ebx
    3f91:	5e                   	pop    %esi
    3f92:	68 10 5a 00 00       	push   $0x5a10
    3f97:	6a 01                	push   $0x1
    3f99:	e8 52 fa ff ff       	call   39f0 <printf>
    3f9e:	ba 70 ac 00 00       	mov    $0xac70,%edx
    3fa3:	83 c4 10             	add    $0x10,%esp

  // search for free thread to load
  for(i = 0; i < MAX_THREADS; ++i) {
    3fa6:	31 c0                	xor    %eax,%eax
    3fa8:	90                   	nop
    3fa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if (uthread_pool[i].state == FREE) {
    3fb0:	8b 0a                	mov    (%edx),%ecx
    3fb2:	85 c9                	test   %ecx,%ecx
    3fb4:	74 2a                	je     3fe0 <uthread_create+0x70>
  alarm(0);

  printf(1, "uthread_create after alarm(0) \n");

  // search for free thread to load
  for(i = 0; i < MAX_THREADS; ++i) {
    3fb6:	83 c0 01             	add    $0x1,%eax
    3fb9:	83 c2 18             	add    $0x18,%edx
    3fbc:	83 f8 07             	cmp    $0x7,%eax
    3fbf:	75 ef                	jne    3fb0 <uthread_create+0x40>
    }
  }

  // case no free threads available
  // enable thread switching
  alarm(UTHREAD_QUANTA);
    3fc1:	83 ec 0c             	sub    $0xc,%esp
    3fc4:	6a 05                	push   $0x5
    3fc6:	e8 6f f9 ff ff       	call   393a <alarm>
  return -1;
    3fcb:	83 c4 10             	add    $0x10,%esp
  // enable thread switching
  printf(1, "creation method: returning.. \n");
  alarm(UTHREAD_QUANTA);

  return uthread_pool[i].tid;
}
    3fce:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }

  // case no free threads available
  // enable thread switching
  alarm(UTHREAD_QUANTA);
  return -1;
    3fd1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  // enable thread switching
  printf(1, "creation method: returning.. \n");
  alarm(UTHREAD_QUANTA);

  return uthread_pool[i].tid;
}
    3fd6:	5b                   	pop    %ebx
    3fd7:	5e                   	pop    %esi
    3fd8:	5d                   	pop    %ebp
    3fd9:	c3                   	ret    
    3fda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  alarm(UTHREAD_QUANTA);
  return -1;

load_t:
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
    3fe0:	8b 15 08 ad 00 00    	mov    0xad08,%edx
    3fe6:	8d 1c 40             	lea    (%eax,%eax,2),%ebx
  // update next tid
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
    3fe9:	83 ec 0c             	sub    $0xc,%esp
    3fec:	68 00 10 00 00       	push   $0x1000
  alarm(UTHREAD_QUANTA);
  return -1;

load_t:
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
    3ff1:	c1 e3 03             	shl    $0x3,%ebx
    3ff4:	89 93 60 ac 00 00    	mov    %edx,0xac60(%ebx)
  // update next tid
  next_tid++;
    3ffa:	83 c2 01             	add    $0x1,%edx
    3ffd:	89 15 08 ad 00 00    	mov    %edx,0xad08
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
    4003:	e8 18 fc ff ff       	call   3c20 <malloc>

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
    4008:	8b 55 08             	mov    0x8(%ebp),%edx
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
    400b:	c7 80 f4 0f 00 00 00 	movl   $0x0,0xff4(%eax)
    4012:	00 00 00 
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
  // update next tid
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
    4015:	89 83 6c ac 00 00    	mov    %eax,0xac6c(%ebx)
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - sizeof(int)) ) = (int)arg;

  // set thread state to RUNNABLE, ready to run
  uthread_pool[i].state = RUNNABLE;
    401b:	c7 83 70 ac 00 00 02 	movl   $0x2,0xac70(%ebx)
    4022:	00 00 00 

  // set esp and ebp to null, while thread is not in RUNNING state yet
  uthread_pool[i].esp = 0;
    4025:	c7 83 64 ac 00 00 00 	movl   $0x0,0xac64(%ebx)
    402c:	00 00 00 
  uthread_pool[i].ebp = 0;
    402f:	c7 83 68 ac 00 00 00 	movl   $0x0,0xac68(%ebx)
    4036:	00 00 00 
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
    4039:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - sizeof(int)) ) = (int)arg;
    403f:	8b 55 0c             	mov    0xc(%ebp),%edx
    4042:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)
  uthread_pool[i].esp = 0;
  uthread_pool[i].ebp = 0;
  

  // enable thread switching
  printf(1, "creation method: returning.. \n");
    4048:	58                   	pop    %eax
    4049:	5a                   	pop    %edx
    404a:	68 30 5a 00 00       	push   $0x5a30
    404f:	6a 01                	push   $0x1
    4051:	e8 9a f9 ff ff       	call   39f0 <printf>
  alarm(UTHREAD_QUANTA);
    4056:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    405d:	e8 d8 f8 ff ff       	call   393a <alarm>

  return uthread_pool[i].tid;
    4062:	8b 83 60 ac 00 00    	mov    0xac60(%ebx),%eax
    4068:	83 c4 10             	add    $0x10,%esp
}
    406b:	8d 65 f8             	lea    -0x8(%ebp),%esp
    406e:	5b                   	pop    %ebx
    406f:	5e                   	pop    %esi
    4070:	5d                   	pop    %ebp
    4071:	c3                   	ret    
    4072:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    4079:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004080 <uthread_exit>:

void 
uthread_exit(void)
{
    4080:	55                   	push   %ebp
    4081:	89 e5                	mov    %esp,%ebp
    4083:	53                   	push   %ebx
    4084:	83 ec 10             	sub    $0x10,%esp

  int i;

  // disable thread switching
  alarm(0);
    4087:	6a 00                	push   $0x0
    4089:	e8 ac f8 ff ff       	call   393a <alarm>

  // deallocate thread memory
  if (uthread_pool[c_uthread_index].stack != 0) {
    408e:	a1 40 ac 00 00       	mov    0xac40,%eax
    4093:	83 c4 10             	add    $0x10,%esp
    4096:	8d 14 40             	lea    (%eax,%eax,2),%edx
    4099:	8b 14 d5 6c ac 00 00 	mov    0xac6c(,%edx,8),%edx
    40a0:	85 d2                	test   %edx,%edx
    40a2:	74 11                	je     40b5 <uthread_exit+0x35>
    free(uthread_pool[c_uthread_index].stack);
    40a4:	83 ec 0c             	sub    $0xc,%esp
    40a7:	52                   	push   %edx
    40a8:	e8 e3 fa ff ff       	call   3b90 <free>
    40ad:	a1 40 ac 00 00       	mov    0xac40,%eax
    40b2:	83 c4 10             	add    $0x10,%esp
  }

  // deallocate thread from thread pool
  uthread_pool[c_uthread_index].state = FREE;
    40b5:	8d 04 40             	lea    (%eax,%eax,2),%eax
    40b8:	bb 70 ac 00 00       	mov    $0xac70,%ebx
    40bd:	c7 04 c5 70 ac 00 00 	movl   $0x0,0xac70(,%eax,8)
    40c4:	00 00 00 00 
    40c8:	89 d8                	mov    %ebx,%eax
    40ca:	eb 0e                	jmp    40da <uthread_exit+0x5a>
    40cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    40d0:	83 c0 18             	add    $0x18,%eax

  // if any thread is waiting for current thread, get them back to RUNNABLE state
  for(i = 0; i < MAX_THREADS; ++i) {
    40d3:	3d 18 ad 00 00       	cmp    $0xad18,%eax
    40d8:	74 26                	je     4100 <uthread_exit+0x80>
    if (uthread_pool[i].state == SLEEP) {
    40da:	83 38 03             	cmpl   $0x3,(%eax)
    40dd:	75 f1                	jne    40d0 <uthread_exit+0x50>
      uthread_pool[i].state = RUNNABLE;
    40df:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
    40e5:	eb e9                	jmp    40d0 <uthread_exit+0x50>
    40e7:	89 f6                	mov    %esi,%esi
    40e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    40f0:	83 c3 18             	add    $0x18,%ebx

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
    if (uthread_pool[i].state != FREE) {
      // found thread that is eligible to run, yield
      uthread_yield();
    40f3:	e8 18 fc ff ff       	call   3d10 <uthread_yield>
      uthread_pool[i].state = RUNNABLE;
    }
  }

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
    40f8:	81 fb 18 ad 00 00    	cmp    $0xad18,%ebx
    40fe:	74 11                	je     4111 <uthread_exit+0x91>
    if (uthread_pool[i].state != FREE) {
    4100:	8b 03                	mov    (%ebx),%eax
    4102:	85 c0                	test   %eax,%eax
    4104:	75 ea                	jne    40f0 <uthread_exit+0x70>
    4106:	83 c3 18             	add    $0x18,%ebx
      uthread_pool[i].state = RUNNABLE;
    }
  }

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
    4109:	81 fb 18 ad 00 00    	cmp    $0xad18,%ebx
    410f:	75 ef                	jne    4100 <uthread_exit+0x80>
      // found thread that is eligible to run, yield
      uthread_yield();
    }
  }
  // no ready to run threads, exit
  exit();
    4111:	e8 6c f7 ff ff       	call   3882 <exit>
    4116:	8d 76 00             	lea    0x0(%esi),%esi
    4119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00004120 <execute_thread>:
int current_ticket_num;
// choosen lottery thread
int choosen;

static void 
execute_thread(void (*start_func)(void *), void* arg) {
    4120:	55                   	push   %ebp
    4121:	89 e5                	mov    %esp,%ebp
    4123:	83 ec 10             	sub    $0x10,%esp
  printf(1, "+++RUN THREAD+++ \n");
    4126:	68 fb 59 00 00       	push   $0x59fb
    412b:	6a 01                	push   $0x1
    412d:	e8 be f8 ff ff       	call   39f0 <printf>
  alarm(UTHREAD_QUANTA);
    4132:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    4139:	e8 fc f7 ff ff       	call   393a <alarm>
  start_func(arg);
    413e:	58                   	pop    %eax
    413f:	ff 75 0c             	pushl  0xc(%ebp)
    4142:	ff 55 08             	call   *0x8(%ebp)
  uthread_exit();
    4145:	e8 36 ff ff ff       	call   4080 <uthread_exit>
    414a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00004150 <uthred_self>:

int 
uthred_self(void)
{
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
    4150:	a1 40 ac 00 00       	mov    0xac40,%eax
  }
}

int 
uthred_self(void)
{
    4155:	55                   	push   %ebp
    4156:	89 e5                	mov    %esp,%ebp
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
    4158:	8d 04 40             	lea    (%eax,%eax,2),%eax
}
    415b:	5d                   	pop    %ebp

int 
uthred_self(void)
{
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
    415c:	8b 04 c5 60 ac 00 00 	mov    0xac60(,%eax,8),%eax
}
    4163:	c3                   	ret    
    4164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    416a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00004170 <uthred_join>:

int  
uthred_join(int tid)
{
    4170:	55                   	push   %ebp
    4171:	89 e5                	mov    %esp,%ebp
    4173:	53                   	push   %ebx
    4174:	83 ec 04             	sub    $0x4,%esp
    4177:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  // if tid is not declared yet or is a negative number, error occured, return
  if(tid >= next_tid || tid < 0) {
    417a:	39 1d 08 ad 00 00    	cmp    %ebx,0xad08
    4180:	7e 60                	jle    41e2 <uthred_join+0x72>
    4182:	89 d8                	mov    %ebx,%eax
    4184:	c1 e8 1f             	shr    $0x1f,%eax
    4187:	84 c0                	test   %al,%al
    4189:	75 57                	jne    41e2 <uthred_join+0x72>
  }

loop:

  // disable thread switching
  alarm(0);
    418b:	83 ec 0c             	sub    $0xc,%esp
    418e:	6a 00                	push   $0x0
    4190:	e8 a5 f7 ff ff       	call   393a <alarm>
    4195:	b8 60 ac 00 00       	mov    $0xac60,%eax
    419a:	83 c4 10             	add    $0x10,%esp
    419d:	8d 76 00             	lea    0x0(%esi),%esi

  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
    // searching for a thread with the relevant tid
    if(uthread_pool[i].tid == tid) {
    41a0:	3b 18                	cmp    (%eax),%ebx
    41a2:	74 24                	je     41c8 <uthred_join+0x58>
    41a4:	83 c0 18             	add    $0x18,%eax

  // disable thread switching
  alarm(0);

  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
    41a7:	3d 08 ad 00 00       	cmp    $0xad08,%eax
    41ac:	75 f2                	jne    41a0 <uthred_join+0x30>

    }
  }

  // the joined thread is not alive anyway, reset clock
  alarm(UTHREAD_QUANTA);
    41ae:	83 ec 0c             	sub    $0xc,%esp
    41b1:	6a 05                	push   $0x5
    41b3:	e8 82 f7 ff ff       	call   393a <alarm>

  return 0;
    41b8:	83 c4 10             	add    $0x10,%esp
    41bb:	31 c0                	xor    %eax,%eax
}
    41bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    41c0:	c9                   	leave  
    41c1:	c3                   	ret    
    41c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
    // searching for a thread with the relevant tid
    if(uthread_pool[i].tid == tid) {
      // put current running thread to sleep
      uthread_pool[c_uthread_index].state = SLEEP;
    41c8:	a1 40 ac 00 00       	mov    0xac40,%eax
    41cd:	8d 04 40             	lea    (%eax,%eax,2),%eax
    41d0:	c7 04 c5 70 ac 00 00 	movl   $0x3,0xac70(,%eax,8)
    41d7:	03 00 00 00 
      // let other thread to run 
      uthread_yield();
    41db:	e8 30 fb ff ff       	call   3d10 <uthread_yield>

      // if thread still alive, loop over the join procedure again
      goto loop;
    41e0:	eb a9                	jmp    418b <uthred_join+0x1b>
{
  int i;

  // if tid is not declared yet or is a negative number, error occured, return
  if(tid >= next_tid || tid < 0) {
    return -1;
    41e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    41e7:	eb d4                	jmp    41bd <uthred_join+0x4d>
