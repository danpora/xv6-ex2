
_testEx1:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
 printf(1,"test_handle:process %d sent signal number %d to this running process\n", getpid(),sigNum);
}


int
main(int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	53                   	push   %ebx
   e:	51                   	push   %ecx
printf(1,"test \n");
sighandler_t sigHandlFunc=(sighandler_t)testSignals;
for(int i=0;i<32;i++){
   f:	31 db                	xor    %ebx,%ebx
}


int
main(int argc, char *argv[]){
printf(1,"test \n");
  11:	83 ec 08             	sub    $0x8,%esp
  14:	68 92 0c 00 00       	push   $0xc92
  19:	6a 01                	push   $0x1
  1b:	e8 30 04 00 00       	call   450 <printf>
  20:	83 c4 10             	add    $0x10,%esp
  23:	90                   	nop
  24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
sighandler_t sigHandlFunc=(sighandler_t)testSignals;
for(int i=0;i<32;i++){
 printf(1,"test  for1: i=%d\n",i);
  28:	83 ec 04             	sub    $0x4,%esp
  2b:	53                   	push   %ebx
  2c:	68 99 0c 00 00       	push   $0xc99
  31:	6a 01                	push   $0x1
  33:	e8 18 04 00 00       	call   450 <printf>
 signal(i,sigHandlFunc);
  38:	58                   	pop    %eax
  39:	5a                   	pop    %edx
  3a:	68 80 00 00 00       	push   $0x80
  3f:	53                   	push   %ebx

int
main(int argc, char *argv[]){
printf(1,"test \n");
sighandler_t sigHandlFunc=(sighandler_t)testSignals;
for(int i=0;i<32;i++){
  40:	83 c3 01             	add    $0x1,%ebx
 printf(1,"test  for1: i=%d\n",i);
 signal(i,sigHandlFunc);
  43:	e8 3a 03 00 00       	call   382 <signal>

int
main(int argc, char *argv[]){
printf(1,"test \n");
sighandler_t sigHandlFunc=(sighandler_t)testSignals;
for(int i=0;i<32;i++){
  48:	83 c4 10             	add    $0x10,%esp
  4b:	83 fb 20             	cmp    $0x20,%ebx
  4e:	75 d8                	jne    28 <main+0x28>
  50:	31 db                	xor    %ebx,%ebx
  52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 printf(1,"test  for1: i=%d\n",i);
 signal(i,sigHandlFunc);
}

for(int j=0;j<32;j++){
 sigsend(getpid(),j);
  58:	e8 05 03 00 00       	call   362 <getpid>
  5d:	83 ec 08             	sub    $0x8,%esp
  60:	53                   	push   %ebx
  61:	50                   	push   %eax
for(int i=0;i<32;i++){
 printf(1,"test  for1: i=%d\n",i);
 signal(i,sigHandlFunc);
}

for(int j=0;j<32;j++){
  62:	83 c3 01             	add    $0x1,%ebx
 sigsend(getpid(),j);
  65:	e8 20 03 00 00       	call   38a <sigsend>
for(int i=0;i<32;i++){
 printf(1,"test  for1: i=%d\n",i);
 signal(i,sigHandlFunc);
}

for(int j=0;j<32;j++){
  6a:	83 c4 10             	add    $0x10,%esp
  6d:	83 fb 20             	cmp    $0x20,%ebx
  70:	75 e6                	jne    58 <main+0x58>
 sigsend(getpid(),j);
}

exit();
  72:	e8 6b 02 00 00       	call   2e2 <exit>
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <testSignals>:
#include "user.h"
#include "stat.h"
typedef void (*sighandler_t)(int);

void
testSignals(int sigNum){
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	83 ec 08             	sub    $0x8,%esp
 printf(1,"test_handle:process %d sent signal number %d to this running process\n", getpid(),sigNum);
  86:	e8 d7 02 00 00       	call   362 <getpid>
  8b:	ff 75 08             	pushl  0x8(%ebp)
  8e:	50                   	push   %eax
  8f:	68 4c 0c 00 00       	push   $0xc4c
  94:	6a 01                	push   $0x1
  96:	e8 b5 03 00 00       	call   450 <printf>
}
  9b:	83 c4 10             	add    $0x10,%esp
  9e:	c9                   	leave  
  9f:	c3                   	ret    

000000a0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	53                   	push   %ebx
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  aa:	89 c2                	mov    %eax,%edx
  ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b0:	83 c1 01             	add    $0x1,%ecx
  b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  b7:	83 c2 01             	add    $0x1,%edx
  ba:	84 db                	test   %bl,%bl
  bc:	88 5a ff             	mov    %bl,-0x1(%edx)
  bf:	75 ef                	jne    b0 <strcpy+0x10>
    ;
  return os;
}
  c1:	5b                   	pop    %ebx
  c2:	5d                   	pop    %ebp
  c3:	c3                   	ret    
  c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	56                   	push   %esi
  d4:	53                   	push   %ebx
  d5:	8b 55 08             	mov    0x8(%ebp),%edx
  d8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  db:	0f b6 02             	movzbl (%edx),%eax
  de:	0f b6 19             	movzbl (%ecx),%ebx
  e1:	84 c0                	test   %al,%al
  e3:	75 1e                	jne    103 <strcmp+0x33>
  e5:	eb 29                	jmp    110 <strcmp+0x40>
  e7:	89 f6                	mov    %esi,%esi
  e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  f0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  f6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  fd:	84 c0                	test   %al,%al
  ff:	74 0f                	je     110 <strcmp+0x40>
 101:	89 f1                	mov    %esi,%ecx
 103:	38 d8                	cmp    %bl,%al
 105:	74 e9                	je     f0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 107:	29 d8                	sub    %ebx,%eax
}
 109:	5b                   	pop    %ebx
 10a:	5e                   	pop    %esi
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
 10d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 110:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 112:	29 d8                	sub    %ebx,%eax
}
 114:	5b                   	pop    %ebx
 115:	5e                   	pop    %esi
 116:	5d                   	pop    %ebp
 117:	c3                   	ret    
 118:	90                   	nop
 119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000120 <strlen>:

uint
strlen(char *s)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 126:	80 39 00             	cmpb   $0x0,(%ecx)
 129:	74 12                	je     13d <strlen+0x1d>
 12b:	31 d2                	xor    %edx,%edx
 12d:	8d 76 00             	lea    0x0(%esi),%esi
 130:	83 c2 01             	add    $0x1,%edx
 133:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 137:	89 d0                	mov    %edx,%eax
 139:	75 f5                	jne    130 <strlen+0x10>
    ;
  return n;
}
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 13d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 13f:	5d                   	pop    %ebp
 140:	c3                   	ret    
 141:	eb 0d                	jmp    150 <memset>
 143:	90                   	nop
 144:	90                   	nop
 145:	90                   	nop
 146:	90                   	nop
 147:	90                   	nop
 148:	90                   	nop
 149:	90                   	nop
 14a:	90                   	nop
 14b:	90                   	nop
 14c:	90                   	nop
 14d:	90                   	nop
 14e:	90                   	nop
 14f:	90                   	nop

00000150 <memset>:

void*
memset(void *dst, int c, uint n)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	57                   	push   %edi
 154:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 157:	8b 4d 10             	mov    0x10(%ebp),%ecx
 15a:	8b 45 0c             	mov    0xc(%ebp),%eax
 15d:	89 d7                	mov    %edx,%edi
 15f:	fc                   	cld    
 160:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 162:	89 d0                	mov    %edx,%eax
 164:	5f                   	pop    %edi
 165:	5d                   	pop    %ebp
 166:	c3                   	ret    
 167:	89 f6                	mov    %esi,%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <strchr>:

char*
strchr(const char *s, char c)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 17a:	0f b6 10             	movzbl (%eax),%edx
 17d:	84 d2                	test   %dl,%dl
 17f:	74 1d                	je     19e <strchr+0x2e>
    if(*s == c)
 181:	38 d3                	cmp    %dl,%bl
 183:	89 d9                	mov    %ebx,%ecx
 185:	75 0d                	jne    194 <strchr+0x24>
 187:	eb 17                	jmp    1a0 <strchr+0x30>
 189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 190:	38 ca                	cmp    %cl,%dl
 192:	74 0c                	je     1a0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 194:	83 c0 01             	add    $0x1,%eax
 197:	0f b6 10             	movzbl (%eax),%edx
 19a:	84 d2                	test   %dl,%dl
 19c:	75 f2                	jne    190 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 19e:	31 c0                	xor    %eax,%eax
}
 1a0:	5b                   	pop    %ebx
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    
 1a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001b0 <gets>:

char*
gets(char *buf, int max)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	57                   	push   %edi
 1b4:	56                   	push   %esi
 1b5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 1b8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 1bb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1be:	eb 29                	jmp    1e9 <gets+0x39>
    cc = read(0, &c, 1);
 1c0:	83 ec 04             	sub    $0x4,%esp
 1c3:	6a 01                	push   $0x1
 1c5:	57                   	push   %edi
 1c6:	6a 00                	push   $0x0
 1c8:	e8 2d 01 00 00       	call   2fa <read>
    if(cc < 1)
 1cd:	83 c4 10             	add    $0x10,%esp
 1d0:	85 c0                	test   %eax,%eax
 1d2:	7e 1d                	jle    1f1 <gets+0x41>
      break;
    buf[i++] = c;
 1d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1d8:	8b 55 08             	mov    0x8(%ebp),%edx
 1db:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 1dd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1df:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1e3:	74 1b                	je     200 <gets+0x50>
 1e5:	3c 0d                	cmp    $0xd,%al
 1e7:	74 17                	je     200 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e9:	8d 5e 01             	lea    0x1(%esi),%ebx
 1ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1ef:	7c cf                	jl     1c0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1f1:	8b 45 08             	mov    0x8(%ebp),%eax
 1f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1fb:	5b                   	pop    %ebx
 1fc:	5e                   	pop    %esi
 1fd:	5f                   	pop    %edi
 1fe:	5d                   	pop    %ebp
 1ff:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 200:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 203:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 205:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 209:	8d 65 f4             	lea    -0xc(%ebp),%esp
 20c:	5b                   	pop    %ebx
 20d:	5e                   	pop    %esi
 20e:	5f                   	pop    %edi
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    
 211:	eb 0d                	jmp    220 <stat>
 213:	90                   	nop
 214:	90                   	nop
 215:	90                   	nop
 216:	90                   	nop
 217:	90                   	nop
 218:	90                   	nop
 219:	90                   	nop
 21a:	90                   	nop
 21b:	90                   	nop
 21c:	90                   	nop
 21d:	90                   	nop
 21e:	90                   	nop
 21f:	90                   	nop

00000220 <stat>:

int
stat(char *n, struct stat *st)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 225:	83 ec 08             	sub    $0x8,%esp
 228:	6a 00                	push   $0x0
 22a:	ff 75 08             	pushl  0x8(%ebp)
 22d:	e8 f0 00 00 00       	call   322 <open>
  if(fd < 0)
 232:	83 c4 10             	add    $0x10,%esp
 235:	85 c0                	test   %eax,%eax
 237:	78 27                	js     260 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 239:	83 ec 08             	sub    $0x8,%esp
 23c:	ff 75 0c             	pushl  0xc(%ebp)
 23f:	89 c3                	mov    %eax,%ebx
 241:	50                   	push   %eax
 242:	e8 f3 00 00 00       	call   33a <fstat>
 247:	89 c6                	mov    %eax,%esi
  close(fd);
 249:	89 1c 24             	mov    %ebx,(%esp)
 24c:	e8 b9 00 00 00       	call   30a <close>
  return r;
 251:	83 c4 10             	add    $0x10,%esp
 254:	89 f0                	mov    %esi,%eax
}
 256:	8d 65 f8             	lea    -0x8(%ebp),%esp
 259:	5b                   	pop    %ebx
 25a:	5e                   	pop    %esi
 25b:	5d                   	pop    %ebp
 25c:	c3                   	ret    
 25d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 260:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 265:	eb ef                	jmp    256 <stat+0x36>
 267:	89 f6                	mov    %esi,%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 277:	0f be 11             	movsbl (%ecx),%edx
 27a:	8d 42 d0             	lea    -0x30(%edx),%eax
 27d:	3c 09                	cmp    $0x9,%al
 27f:	b8 00 00 00 00       	mov    $0x0,%eax
 284:	77 1f                	ja     2a5 <atoi+0x35>
 286:	8d 76 00             	lea    0x0(%esi),%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 290:	8d 04 80             	lea    (%eax,%eax,4),%eax
 293:	83 c1 01             	add    $0x1,%ecx
 296:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 29a:	0f be 11             	movsbl (%ecx),%edx
 29d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 2a0:	80 fb 09             	cmp    $0x9,%bl
 2a3:	76 eb                	jbe    290 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 2a5:	5b                   	pop    %ebx
 2a6:	5d                   	pop    %ebp
 2a7:	c3                   	ret    
 2a8:	90                   	nop
 2a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000002b0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	56                   	push   %esi
 2b4:	53                   	push   %ebx
 2b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2be:	85 db                	test   %ebx,%ebx
 2c0:	7e 14                	jle    2d6 <memmove+0x26>
 2c2:	31 d2                	xor    %edx,%edx
 2c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2c8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2cc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2cf:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2d2:	39 da                	cmp    %ebx,%edx
 2d4:	75 f2                	jne    2c8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2d6:	5b                   	pop    %ebx
 2d7:	5e                   	pop    %esi
 2d8:	5d                   	pop    %ebp
 2d9:	c3                   	ret    

000002da <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2da:	b8 01 00 00 00       	mov    $0x1,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <exit>:
SYSCALL(exit)
 2e2:	b8 02 00 00 00       	mov    $0x2,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <wait>:
SYSCALL(wait)
 2ea:	b8 03 00 00 00       	mov    $0x3,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <pipe>:
SYSCALL(pipe)
 2f2:	b8 04 00 00 00       	mov    $0x4,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <read>:
SYSCALL(read)
 2fa:	b8 05 00 00 00       	mov    $0x5,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <write>:
SYSCALL(write)
 302:	b8 10 00 00 00       	mov    $0x10,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <close>:
SYSCALL(close)
 30a:	b8 15 00 00 00       	mov    $0x15,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <kill>:
SYSCALL(kill)
 312:	b8 06 00 00 00       	mov    $0x6,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <exec>:
SYSCALL(exec)
 31a:	b8 07 00 00 00       	mov    $0x7,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <open>:
SYSCALL(open)
 322:	b8 0f 00 00 00       	mov    $0xf,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <mknod>:
SYSCALL(mknod)
 32a:	b8 11 00 00 00       	mov    $0x11,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <unlink>:
SYSCALL(unlink)
 332:	b8 12 00 00 00       	mov    $0x12,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <fstat>:
SYSCALL(fstat)
 33a:	b8 08 00 00 00       	mov    $0x8,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <link>:
SYSCALL(link)
 342:	b8 13 00 00 00       	mov    $0x13,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <mkdir>:
SYSCALL(mkdir)
 34a:	b8 14 00 00 00       	mov    $0x14,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <chdir>:
SYSCALL(chdir)
 352:	b8 09 00 00 00       	mov    $0x9,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <dup>:
SYSCALL(dup)
 35a:	b8 0a 00 00 00       	mov    $0xa,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <getpid>:
SYSCALL(getpid)
 362:	b8 0b 00 00 00       	mov    $0xb,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <sbrk>:
SYSCALL(sbrk)
 36a:	b8 0c 00 00 00       	mov    $0xc,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <sleep>:
SYSCALL(sleep)
 372:	b8 0d 00 00 00       	mov    $0xd,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <uptime>:
SYSCALL(uptime)
 37a:	b8 0e 00 00 00       	mov    $0xe,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <signal>:
/*pazit---------------------------------------------------*/
SYSCALL(signal)  
 382:	b8 16 00 00 00       	mov    $0x16,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <sigsend>:
SYSCALL(sigsend)  
 38a:	b8 17 00 00 00       	mov    $0x17,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <sigreturn>:
SYSCALL(sigreturn) 
 392:	b8 18 00 00 00       	mov    $0x18,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <alarm>:
SYSCALL(alarm)
 39a:	b8 19 00 00 00       	mov    $0x19,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    
 3a2:	66 90                	xchg   %ax,%ax
 3a4:	66 90                	xchg   %ax,%ax
 3a6:	66 90                	xchg   %ax,%ax
 3a8:	66 90                	xchg   %ax,%ax
 3aa:	66 90                	xchg   %ax,%ax
 3ac:	66 90                	xchg   %ax,%ax
 3ae:	66 90                	xchg   %ax,%ax

000003b0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	57                   	push   %edi
 3b4:	56                   	push   %esi
 3b5:	53                   	push   %ebx
 3b6:	89 c6                	mov    %eax,%esi
 3b8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 3be:	85 db                	test   %ebx,%ebx
 3c0:	74 7e                	je     440 <printint+0x90>
 3c2:	89 d0                	mov    %edx,%eax
 3c4:	c1 e8 1f             	shr    $0x1f,%eax
 3c7:	84 c0                	test   %al,%al
 3c9:	74 75                	je     440 <printint+0x90>
    neg = 1;
    x = -xx;
 3cb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 3cd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 3d4:	f7 d8                	neg    %eax
 3d6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3d9:	31 ff                	xor    %edi,%edi
 3db:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3de:	89 ce                	mov    %ecx,%esi
 3e0:	eb 08                	jmp    3ea <printint+0x3a>
 3e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3e8:	89 cf                	mov    %ecx,%edi
 3ea:	31 d2                	xor    %edx,%edx
 3ec:	8d 4f 01             	lea    0x1(%edi),%ecx
 3ef:	f7 f6                	div    %esi
 3f1:	0f b6 92 b4 0c 00 00 	movzbl 0xcb4(%edx),%edx
  }while((x /= base) != 0);
 3f8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3fa:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 3fd:	75 e9                	jne    3e8 <printint+0x38>
  if(neg)
 3ff:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 402:	8b 75 c0             	mov    -0x40(%ebp),%esi
 405:	85 c0                	test   %eax,%eax
 407:	74 08                	je     411 <printint+0x61>
    buf[i++] = '-';
 409:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 40e:	8d 4f 02             	lea    0x2(%edi),%ecx
 411:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 415:	8d 76 00             	lea    0x0(%esi),%esi
 418:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 41b:	83 ec 04             	sub    $0x4,%esp
 41e:	83 ef 01             	sub    $0x1,%edi
 421:	6a 01                	push   $0x1
 423:	53                   	push   %ebx
 424:	56                   	push   %esi
 425:	88 45 d7             	mov    %al,-0x29(%ebp)
 428:	e8 d5 fe ff ff       	call   302 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 42d:	83 c4 10             	add    $0x10,%esp
 430:	39 df                	cmp    %ebx,%edi
 432:	75 e4                	jne    418 <printint+0x68>
    putc(fd, buf[i]);
}
 434:	8d 65 f4             	lea    -0xc(%ebp),%esp
 437:	5b                   	pop    %ebx
 438:	5e                   	pop    %esi
 439:	5f                   	pop    %edi
 43a:	5d                   	pop    %ebp
 43b:	c3                   	ret    
 43c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 440:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 442:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 449:	eb 8b                	jmp    3d6 <printint+0x26>
 44b:	90                   	nop
 44c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000450 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 456:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 459:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 45c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 45f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 462:	89 45 d0             	mov    %eax,-0x30(%ebp)
 465:	0f b6 1e             	movzbl (%esi),%ebx
 468:	83 c6 01             	add    $0x1,%esi
 46b:	84 db                	test   %bl,%bl
 46d:	0f 84 b0 00 00 00    	je     523 <printf+0xd3>
 473:	31 d2                	xor    %edx,%edx
 475:	eb 39                	jmp    4b0 <printf+0x60>
 477:	89 f6                	mov    %esi,%esi
 479:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 480:	83 f8 25             	cmp    $0x25,%eax
 483:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 486:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 48b:	74 18                	je     4a5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 48d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 490:	83 ec 04             	sub    $0x4,%esp
 493:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 496:	6a 01                	push   $0x1
 498:	50                   	push   %eax
 499:	57                   	push   %edi
 49a:	e8 63 fe ff ff       	call   302 <write>
 49f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 4a2:	83 c4 10             	add    $0x10,%esp
 4a5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4a8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 4ac:	84 db                	test   %bl,%bl
 4ae:	74 73                	je     523 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 4b0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 4b2:	0f be cb             	movsbl %bl,%ecx
 4b5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 4b8:	74 c6                	je     480 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 4ba:	83 fa 25             	cmp    $0x25,%edx
 4bd:	75 e6                	jne    4a5 <printf+0x55>
      if(c == 'd'){
 4bf:	83 f8 64             	cmp    $0x64,%eax
 4c2:	0f 84 f8 00 00 00    	je     5c0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4c8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4ce:	83 f9 70             	cmp    $0x70,%ecx
 4d1:	74 5d                	je     530 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4d3:	83 f8 73             	cmp    $0x73,%eax
 4d6:	0f 84 84 00 00 00    	je     560 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4dc:	83 f8 63             	cmp    $0x63,%eax
 4df:	0f 84 ea 00 00 00    	je     5cf <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4e5:	83 f8 25             	cmp    $0x25,%eax
 4e8:	0f 84 c2 00 00 00    	je     5b0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4f1:	83 ec 04             	sub    $0x4,%esp
 4f4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4f8:	6a 01                	push   $0x1
 4fa:	50                   	push   %eax
 4fb:	57                   	push   %edi
 4fc:	e8 01 fe ff ff       	call   302 <write>
 501:	83 c4 0c             	add    $0xc,%esp
 504:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 507:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 50a:	6a 01                	push   $0x1
 50c:	50                   	push   %eax
 50d:	57                   	push   %edi
 50e:	83 c6 01             	add    $0x1,%esi
 511:	e8 ec fd ff ff       	call   302 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 516:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 51a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 51d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 51f:	84 db                	test   %bl,%bl
 521:	75 8d                	jne    4b0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 523:	8d 65 f4             	lea    -0xc(%ebp),%esp
 526:	5b                   	pop    %ebx
 527:	5e                   	pop    %esi
 528:	5f                   	pop    %edi
 529:	5d                   	pop    %ebp
 52a:	c3                   	ret    
 52b:	90                   	nop
 52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 530:	83 ec 0c             	sub    $0xc,%esp
 533:	b9 10 00 00 00       	mov    $0x10,%ecx
 538:	6a 00                	push   $0x0
 53a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 53d:	89 f8                	mov    %edi,%eax
 53f:	8b 13                	mov    (%ebx),%edx
 541:	e8 6a fe ff ff       	call   3b0 <printint>
        ap++;
 546:	89 d8                	mov    %ebx,%eax
 548:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 54b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 54d:	83 c0 04             	add    $0x4,%eax
 550:	89 45 d0             	mov    %eax,-0x30(%ebp)
 553:	e9 4d ff ff ff       	jmp    4a5 <printf+0x55>
 558:	90                   	nop
 559:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 560:	8b 45 d0             	mov    -0x30(%ebp),%eax
 563:	8b 18                	mov    (%eax),%ebx
        ap++;
 565:	83 c0 04             	add    $0x4,%eax
 568:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 56b:	b8 ab 0c 00 00       	mov    $0xcab,%eax
 570:	85 db                	test   %ebx,%ebx
 572:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 575:	0f b6 03             	movzbl (%ebx),%eax
 578:	84 c0                	test   %al,%al
 57a:	74 23                	je     59f <printf+0x14f>
 57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 580:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 583:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 586:	83 ec 04             	sub    $0x4,%esp
 589:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 58b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 58e:	50                   	push   %eax
 58f:	57                   	push   %edi
 590:	e8 6d fd ff ff       	call   302 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 595:	0f b6 03             	movzbl (%ebx),%eax
 598:	83 c4 10             	add    $0x10,%esp
 59b:	84 c0                	test   %al,%al
 59d:	75 e1                	jne    580 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 59f:	31 d2                	xor    %edx,%edx
 5a1:	e9 ff fe ff ff       	jmp    4a5 <printf+0x55>
 5a6:	8d 76 00             	lea    0x0(%esi),%esi
 5a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5b0:	83 ec 04             	sub    $0x4,%esp
 5b3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 5b6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 5b9:	6a 01                	push   $0x1
 5bb:	e9 4c ff ff ff       	jmp    50c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5c0:	83 ec 0c             	sub    $0xc,%esp
 5c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5c8:	6a 01                	push   $0x1
 5ca:	e9 6b ff ff ff       	jmp    53a <printf+0xea>
 5cf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5d2:	83 ec 04             	sub    $0x4,%esp
 5d5:	8b 03                	mov    (%ebx),%eax
 5d7:	6a 01                	push   $0x1
 5d9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 5dc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5df:	50                   	push   %eax
 5e0:	57                   	push   %edi
 5e1:	e8 1c fd ff ff       	call   302 <write>
 5e6:	e9 5b ff ff ff       	jmp    546 <printf+0xf6>
 5eb:	66 90                	xchg   %ax,%ax
 5ed:	66 90                	xchg   %ax,%ax
 5ef:	90                   	nop

000005f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f1:	a1 60 11 00 00       	mov    0x1160,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f6:	89 e5                	mov    %esp,%ebp
 5f8:	57                   	push   %edi
 5f9:	56                   	push   %esi
 5fa:	53                   	push   %ebx
 5fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5fe:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 600:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 603:	39 c8                	cmp    %ecx,%eax
 605:	73 19                	jae    620 <free+0x30>
 607:	89 f6                	mov    %esi,%esi
 609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 610:	39 d1                	cmp    %edx,%ecx
 612:	72 1c                	jb     630 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 614:	39 d0                	cmp    %edx,%eax
 616:	73 18                	jae    630 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 618:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 61a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 61c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 61e:	72 f0                	jb     610 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 620:	39 d0                	cmp    %edx,%eax
 622:	72 f4                	jb     618 <free+0x28>
 624:	39 d1                	cmp    %edx,%ecx
 626:	73 f0                	jae    618 <free+0x28>
 628:	90                   	nop
 629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 630:	8b 73 fc             	mov    -0x4(%ebx),%esi
 633:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 636:	39 d7                	cmp    %edx,%edi
 638:	74 19                	je     653 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 63a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 63d:	8b 50 04             	mov    0x4(%eax),%edx
 640:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 643:	39 f1                	cmp    %esi,%ecx
 645:	74 23                	je     66a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 647:	89 08                	mov    %ecx,(%eax)
  freep = p;
 649:	a3 60 11 00 00       	mov    %eax,0x1160
}
 64e:	5b                   	pop    %ebx
 64f:	5e                   	pop    %esi
 650:	5f                   	pop    %edi
 651:	5d                   	pop    %ebp
 652:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 653:	03 72 04             	add    0x4(%edx),%esi
 656:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 659:	8b 10                	mov    (%eax),%edx
 65b:	8b 12                	mov    (%edx),%edx
 65d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 660:	8b 50 04             	mov    0x4(%eax),%edx
 663:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 666:	39 f1                	cmp    %esi,%ecx
 668:	75 dd                	jne    647 <free+0x57>
    p->s.size += bp->s.size;
 66a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 66d:	a3 60 11 00 00       	mov    %eax,0x1160
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 672:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 675:	8b 53 f8             	mov    -0x8(%ebx),%edx
 678:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 67a:	5b                   	pop    %ebx
 67b:	5e                   	pop    %esi
 67c:	5f                   	pop    %edi
 67d:	5d                   	pop    %ebp
 67e:	c3                   	ret    
 67f:	90                   	nop

00000680 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	57                   	push   %edi
 684:	56                   	push   %esi
 685:	53                   	push   %ebx
 686:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 689:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 68c:	8b 15 60 11 00 00    	mov    0x1160,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 692:	8d 78 07             	lea    0x7(%eax),%edi
 695:	c1 ef 03             	shr    $0x3,%edi
 698:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 69b:	85 d2                	test   %edx,%edx
 69d:	0f 84 a3 00 00 00    	je     746 <malloc+0xc6>
 6a3:	8b 02                	mov    (%edx),%eax
 6a5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6a8:	39 cf                	cmp    %ecx,%edi
 6aa:	76 74                	jbe    720 <malloc+0xa0>
 6ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 6b2:	be 00 10 00 00       	mov    $0x1000,%esi
 6b7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 6be:	0f 43 f7             	cmovae %edi,%esi
 6c1:	ba 00 80 00 00       	mov    $0x8000,%edx
 6c6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 6cc:	0f 46 da             	cmovbe %edx,%ebx
 6cf:	eb 10                	jmp    6e1 <malloc+0x61>
 6d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6d8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6da:	8b 48 04             	mov    0x4(%eax),%ecx
 6dd:	39 cf                	cmp    %ecx,%edi
 6df:	76 3f                	jbe    720 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6e1:	39 05 60 11 00 00    	cmp    %eax,0x1160
 6e7:	89 c2                	mov    %eax,%edx
 6e9:	75 ed                	jne    6d8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6eb:	83 ec 0c             	sub    $0xc,%esp
 6ee:	53                   	push   %ebx
 6ef:	e8 76 fc ff ff       	call   36a <sbrk>
  if(p == (char*)-1)
 6f4:	83 c4 10             	add    $0x10,%esp
 6f7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6fa:	74 1c                	je     718 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6fc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 6ff:	83 ec 0c             	sub    $0xc,%esp
 702:	83 c0 08             	add    $0x8,%eax
 705:	50                   	push   %eax
 706:	e8 e5 fe ff ff       	call   5f0 <free>
  return freep;
 70b:	8b 15 60 11 00 00    	mov    0x1160,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 711:	83 c4 10             	add    $0x10,%esp
 714:	85 d2                	test   %edx,%edx
 716:	75 c0                	jne    6d8 <malloc+0x58>
        return 0;
 718:	31 c0                	xor    %eax,%eax
 71a:	eb 1c                	jmp    738 <malloc+0xb8>
 71c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 720:	39 cf                	cmp    %ecx,%edi
 722:	74 1c                	je     740 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 724:	29 f9                	sub    %edi,%ecx
 726:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 729:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 72c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 72f:	89 15 60 11 00 00    	mov    %edx,0x1160
      return (void*)(p + 1);
 735:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 738:	8d 65 f4             	lea    -0xc(%ebp),%esp
 73b:	5b                   	pop    %ebx
 73c:	5e                   	pop    %esi
 73d:	5f                   	pop    %edi
 73e:	5d                   	pop    %ebp
 73f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 740:	8b 08                	mov    (%eax),%ecx
 742:	89 0a                	mov    %ecx,(%edx)
 744:	eb e9                	jmp    72f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 746:	c7 05 60 11 00 00 64 	movl   $0x1164,0x1160
 74d:	11 00 00 
 750:	c7 05 64 11 00 00 64 	movl   $0x1164,0x1164
 757:	11 00 00 
    base.s.size = 0;
 75a:	b8 64 11 00 00       	mov    $0x1164,%eax
 75f:	c7 05 68 11 00 00 00 	movl   $0x0,0x1168
 766:	00 00 00 
 769:	e9 3e ff ff ff       	jmp    6ac <malloc+0x2c>
 76e:	66 90                	xchg   %ax,%ax

00000770 <uthread_yield>:
  exit();
}

void 
uthread_yield(void)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	57                   	push   %edi
 774:	56                   	push   %esi
 775:	53                   	push   %ebx
 776:	83 ec 28             	sub    $0x28,%esp
  // switch alarm(0) to cancel thread switching while yielding 
  alarm(0);
 779:	6a 00                	push   $0x0
 77b:	e8 1a fc ff ff       	call   39a <alarm>

  // if current thread is running (most cases), the thread didn't finisht its job so turn his state to RUNNABLE
  if (uthread_pool[c_uthread_index].state == RUNNING) {
 780:	a1 80 11 00 00       	mov    0x1180,%eax
 785:	83 c4 10             	add    $0x10,%esp
 788:	8d 14 40             	lea    (%eax,%eax,2),%edx
 78b:	8d 14 d5 a0 11 00 00 	lea    0x11a0(,%edx,8),%edx
 792:	83 7a 10 01          	cmpl   $0x1,0x10(%edx)
 796:	0f 84 54 01 00 00    	je     8f0 <uthread_yield+0x180>
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
 79c:	8d 04 40             	lea    (%eax,%eax,2),%eax
  asm("movl %%ebp, %0;" : "=r" (uthread_pool[c_uthread_index].ebp));

  // load the new thread

  // pick the next thread index
  c_uthread_index++;
 79f:	83 05 80 11 00 00 01 	addl   $0x1,0x1180
 7a6:	bb b0 11 00 00       	mov    $0x11b0,%ebx
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
 7ab:	89 e2                	mov    %esp,%edx
 7ad:	8d 04 c5 a0 11 00 00 	lea    0x11a0(,%eax,8),%eax

  // ************** lottery scheduler mechanism ******************* //

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
 7b4:	c7 05 50 12 00 00 ff 	movl   $0xffffffff,0x1250
 7bb:	ff ff ff 
 7be:	89 de                	mov    %ebx,%esi
 7c0:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
 7c4:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 7c9:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
 7ce:	89 50 04             	mov    %edx,0x4(%eax)
  asm("movl %%ebp, %0;" : "=r" (uthread_pool[c_uthread_index].ebp));
 7d1:	89 ea                	mov    %ebp,%edx
 7d3:	89 50 08             	mov    %edx,0x8(%eax)
 7d6:	8d 76 00             	lea    0x0(%esi),%esi
 7d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
 7e0:	8b 06                	mov    (%esi),%eax
 7e2:	85 c0                	test   %eax,%eax
 7e4:	0f 95 c2             	setne  %dl
 7e7:	83 f8 03             	cmp    $0x3,%eax
 7ea:	0f 95 c0             	setne  %al
 7ed:	20 d0                	and    %dl,%al
 7ef:	74 0a                	je     7fb <uthread_yield+0x8b>
      current_ticket_num += uthread_pool[j].ntickets;
 7f1:	8b 7e 04             	mov    0x4(%esi),%edi
 7f4:	88 45 e7             	mov    %al,-0x19(%ebp)
 7f7:	01 cf                	add    %ecx,%edi
 7f9:	89 f9                	mov    %edi,%ecx
 7fb:	83 c6 18             	add    $0x18,%esi
  // ************** lottery scheduler mechanism ******************* //

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
 7fe:	81 fe 58 12 00 00    	cmp    $0x1258,%esi
 804:	75 da                	jne    7e0 <uthread_yield+0x70>
 806:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
 80a:	0f 85 ec 00 00 00    	jne    8fc <uthread_yield+0x18c>

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 810:	69 05 58 11 00 00 0d 	imul   $0x19660d,0x1158,%eax
 817:	66 19 00 
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
      current_ticket_num += uthread_pool[j].ntickets;
  }

  // generate a random number between 0 and current_ticket_num
  randomTicket = rand() % current_ticket_num;
 81a:	31 d2                	xor    %edx,%edx

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
 81c:	83 ec 04             	sub    $0x4,%esp
 81f:	51                   	push   %ecx
 820:	68 c5 0c 00 00       	push   $0xcc5
 825:	6a 01                	push   $0x1

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 827:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
 82c:	a3 58 11 00 00       	mov    %eax,0x1158
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
      current_ticket_num += uthread_pool[j].ntickets;
  }

  // generate a random number between 0 and current_ticket_num
  randomTicket = rand() % current_ticket_num;
 831:	f7 f1                	div    %ecx
 833:	89 d6                	mov    %edx,%esi

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
 835:	e8 16 fc ff ff       	call   450 <printf>
  printf(1,"randomTicket=%d\n", randomTicket);
 83a:	83 c4 0c             	add    $0xc,%esp
 83d:	56                   	push   %esi
 83e:	68 dc 0c 00 00       	push   $0xcdc
 843:	6a 01                	push   $0x1
 845:	e8 06 fc ff ff       	call   450 <printf>

  // set the choosen order thread to run
  choosen = randomTicket / NTICKET;
 84a:	89 f0                	mov    %esi,%eax
 84c:	ba 67 66 66 66       	mov    $0x66666667,%edx
 851:	c1 fe 1f             	sar    $0x1f,%esi
 854:	f7 ea                	imul   %edx
 856:	83 c4 10             	add    $0x10,%esp

  // pick the index of choosen thread
  int chooseCount = -1;
 859:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  for(j = 0; j < MAX_THREADS; ++j) {
 85e:	31 c0                	xor    %eax,%eax

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
  printf(1,"randomTicket=%d\n", randomTicket);

  // set the choosen order thread to run
  choosen = randomTicket / NTICKET;
 860:	d1 fa                	sar    %edx
 862:	29 f2                	sub    %esi,%edx
 864:	89 15 4c 12 00 00    	mov    %edx,0x124c
 86a:	eb 0f                	jmp    87b <uthread_yield+0x10b>
 86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // pick the index of choosen thread
  int chooseCount = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
 870:	83 c0 01             	add    $0x1,%eax
 873:	83 c3 18             	add    $0x18,%ebx
 876:	83 f8 07             	cmp    $0x7,%eax
 879:	74 15                	je     890 <uthread_yield+0x120>
    if(uthread_pool[j].state == RUNNABLE) {
 87b:	83 3b 02             	cmpl   $0x2,(%ebx)
 87e:	75 f0                	jne    870 <uthread_yield+0x100>
      chooseCount++;
 880:	83 c1 01             	add    $0x1,%ecx
      if (choosen == chooseCount)
 883:	39 ca                	cmp    %ecx,%edx
 885:	75 e9                	jne    870 <uthread_yield+0x100>
 887:	89 f6                	mov    %esi,%esi
 889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        break;
    }
  }

  // set current thread to the lottery chosen one
  c_uthread_index = j;
 890:	a3 80 11 00 00       	mov    %eax,0x1180

  // ****************************************************************** //

  // current switched thread is move to RUNNING mode, next to be execute
  uthread_pool[c_uthread_index].state = RUNNING;
 895:	8d 04 40             	lea    (%eax,%eax,2),%eax
 898:	8d 04 c5 a0 11 00 00 	lea    0x11a0(,%eax,8),%eax


  // if esp is null, thread is running its first time, so we have to load a functio to it 
  if(uthread_pool[c_uthread_index].esp == 0) {
 89f:	8b 50 04             	mov    0x4(%eax),%edx
  c_uthread_index = j;

  // ****************************************************************** //

  // current switched thread is move to RUNNING mode, next to be execute
  uthread_pool[c_uthread_index].state = RUNNING;
 8a2:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)


  // if esp is null, thread is running its first time, so we have to load a functio to it 
  if(uthread_pool[c_uthread_index].esp == 0) {
 8a9:	85 d2                	test   %edx,%edx
 8ab:	75 23                	jne    8d0 <uthread_yield+0x160>
    asm("movl %0, %%esp;" : : "r" (uthread_pool[c_uthread_index].stack + STACK_SIZE - 3*sizeof(int)));
 8ad:	8b 40 0c             	mov    0xc(%eax),%eax
 8b0:	05 f4 0f 00 00       	add    $0xff4,%eax
 8b5:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].stack + STACK_SIZE - 3*sizeof(int)));
 8b7:	89 c5                	mov    %eax,%ebp
    // jump to execute function to run the thread own function
    asm("jmp *%0;" : : "r" (execute_thread));
 8b9:	b8 80 0b 00 00       	mov    $0xb80,%eax
 8be:	ff e0                	jmp    *%eax
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].ebp));

    // reset alarm
    alarm(UTHREAD_QUANTA);
  }
}
 8c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8c3:	5b                   	pop    %ebx
 8c4:	5e                   	pop    %esi
 8c5:	5f                   	pop    %edi
 8c6:	5d                   	pop    %ebp
 8c7:	c3                   	ret    
 8c8:	90                   	nop
 8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // jump to execute function to run the thread own function
    asm("jmp *%0;" : : "r" (execute_thread));
  } 
  else  {
    // restore thread stack
    asm("movl %0, %%esp;" : : "r" (uthread_pool[c_uthread_index].esp));
 8d0:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].ebp));
 8d2:	8b 40 08             	mov    0x8(%eax),%eax
 8d5:	89 c5                	mov    %eax,%ebp

    // reset alarm
    alarm(UTHREAD_QUANTA);
 8d7:	83 ec 0c             	sub    $0xc,%esp
 8da:	6a 05                	push   $0x5
 8dc:	e8 b9 fa ff ff       	call   39a <alarm>
 8e1:	83 c4 10             	add    $0x10,%esp
  }
}
 8e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8e7:	5b                   	pop    %ebx
 8e8:	5e                   	pop    %esi
 8e9:	5f                   	pop    %edi
 8ea:	5d                   	pop    %ebp
 8eb:	c3                   	ret    
 8ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  // switch alarm(0) to cancel thread switching while yielding 
  alarm(0);

  // if current thread is running (most cases), the thread didn't finisht its job so turn his state to RUNNABLE
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
 8f0:	c7 42 10 02 00 00 00 	movl   $0x2,0x10(%edx)
 8f7:	e9 a0 fe ff ff       	jmp    79c <uthread_yield+0x2c>
 8fc:	89 3d 50 12 00 00    	mov    %edi,0x1250
 902:	e9 09 ff ff ff       	jmp    810 <uthread_yield+0xa0>
 907:	89 f6                	mov    %esi,%esi
 909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000910 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 910:	69 05 58 11 00 00 0d 	imul   $0x19660d,0x1158,%eax
 917:	66 19 00 
//***************************************************************************************//

unsigned long randstate = 1;
unsigned int
rand()
{
 91a:	55                   	push   %ebp
 91b:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
 91d:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 91e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
 923:	a3 58 11 00 00       	mov    %eax,0x1158
  return randstate;
}
 928:	c3                   	ret    
 929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000930 <uthread_init>:
  uthread_exit();
}

int
 uthread_init()
{
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	83 ec 10             	sub    $0x10,%esp
  printf(1, "** INIT USER LEVEL THREAD **\n");
 936:	68 ed 0c 00 00       	push   $0xced
 93b:	6a 01                	push   $0x1
 93d:	e8 0e fb ff ff       	call   450 <printf>
 942:	b8 b0 11 00 00       	mov    $0x11b0,%eax
 947:	83 c4 10             	add    $0x10,%esp
 94a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  // set all threads state to FREE - init pool
  int i;
  for(i = 0; i < MAX_THREADS; ++i) {
    uthread_pool[i].state = FREE;
 950:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    uthread_pool[i].ntickets = NTICKET;
 956:	c7 40 04 05 00 00 00 	movl   $0x5,0x4(%eax)
 95d:	83 c0 18             	add    $0x18,%eax
 uthread_init()
{
  printf(1, "** INIT USER LEVEL THREAD **\n");
  // set all threads state to FREE - init pool
  int i;
  for(i = 0; i < MAX_THREADS; ++i) {
 960:	3d 58 12 00 00       	cmp    $0x1258,%eax
 965:	75 e9                	jne    950 <uthread_init+0x20>
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 967:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < MAX_THREADS; ++i) {
    uthread_pool[i].state = FREE;
    uthread_pool[i].ntickets = NTICKET;
  }

  next_tid = 1;
 96a:	c7 05 48 12 00 00 01 	movl   $0x1,0x1248
 971:	00 00 00 

  // initialize main thread
  c_uthread_index = 0;
 974:	c7 05 80 11 00 00 00 	movl   $0x0,0x1180
 97b:	00 00 00 
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 97e:	68 70 07 00 00       	push   $0x770
 983:	6a 0e                	push   $0xe
  next_tid = 1;

  // initialize main thread
  c_uthread_index = 0;
  // set tid and stack to null
  uthread_pool[c_uthread_index].tid = 0;
 985:	c7 05 a0 11 00 00 00 	movl   $0x0,0x11a0
 98c:	00 00 00 
  uthread_pool[c_uthread_index].stack = 0; 
 98f:	c7 05 ac 11 00 00 00 	movl   $0x0,0x11ac
 996:	00 00 00 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;
 999:	c7 05 b0 11 00 00 01 	movl   $0x1,0x11b0
 9a0:	00 00 00 

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 9a3:	e8 da f9 ff ff       	call   382 <signal>
 9a8:	83 c4 10             	add    $0x10,%esp
 9ab:	85 c0                	test   %eax,%eax
    // case signal error
    return -1;
 9ad:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 9b2:	75 0f                	jne    9c3 <uthread_init+0x93>
    // case signal error
    return -1;
  }

  // execute the alarm syscall with UTHREAD_QUANTA
  alarm(UTHREAD_QUANTA);
 9b4:	83 ec 0c             	sub    $0xc,%esp
 9b7:	6a 05                	push   $0x5
 9b9:	e8 dc f9 ff ff       	call   39a <alarm>

  return 0;
 9be:	83 c4 10             	add    $0x10,%esp
 9c1:	31 d2                	xor    %edx,%edx
}
 9c3:	89 d0                	mov    %edx,%eax
 9c5:	c9                   	leave  
 9c6:	c3                   	ret    
 9c7:	89 f6                	mov    %esi,%esi
 9c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009d0 <uthread_create>:

int 
uthread_create(void (*func)(void *), void* arg)
{
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
 9d3:	56                   	push   %esi
 9d4:	53                   	push   %ebx
  printf(1, "start thread creation \n");
 9d5:	83 ec 08             	sub    $0x8,%esp
 9d8:	68 0b 0d 00 00       	push   $0xd0b
 9dd:	6a 01                	push   $0x1
 9df:	e8 6c fa ff ff       	call   450 <printf>

  // local thread pool index
  int i;

  // disable thread switching
  alarm(0);
 9e4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 9eb:	e8 aa f9 ff ff       	call   39a <alarm>

  printf(1, "uthread_create after alarm(0) \n");
 9f0:	5b                   	pop    %ebx
 9f1:	5e                   	pop    %esi
 9f2:	68 38 0d 00 00       	push   $0xd38
 9f7:	6a 01                	push   $0x1
 9f9:	e8 52 fa ff ff       	call   450 <printf>
 9fe:	ba b0 11 00 00       	mov    $0x11b0,%edx
 a03:	83 c4 10             	add    $0x10,%esp

  // search for free thread to load
  for(i = 0; i < MAX_THREADS; ++i) {
 a06:	31 c0                	xor    %eax,%eax
 a08:	90                   	nop
 a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if (uthread_pool[i].state == FREE) {
 a10:	8b 0a                	mov    (%edx),%ecx
 a12:	85 c9                	test   %ecx,%ecx
 a14:	74 2a                	je     a40 <uthread_create+0x70>
  alarm(0);

  printf(1, "uthread_create after alarm(0) \n");

  // search for free thread to load
  for(i = 0; i < MAX_THREADS; ++i) {
 a16:	83 c0 01             	add    $0x1,%eax
 a19:	83 c2 18             	add    $0x18,%edx
 a1c:	83 f8 07             	cmp    $0x7,%eax
 a1f:	75 ef                	jne    a10 <uthread_create+0x40>
    }
  }

  // case no free threads available
  // enable thread switching
  alarm(UTHREAD_QUANTA);
 a21:	83 ec 0c             	sub    $0xc,%esp
 a24:	6a 05                	push   $0x5
 a26:	e8 6f f9 ff ff       	call   39a <alarm>
  return -1;
 a2b:	83 c4 10             	add    $0x10,%esp
  // enable thread switching
  printf(1, "creation method: returning.. \n");
  alarm(UTHREAD_QUANTA);

  return uthread_pool[i].tid;
}
 a2e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }

  // case no free threads available
  // enable thread switching
  alarm(UTHREAD_QUANTA);
  return -1;
 a31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  // enable thread switching
  printf(1, "creation method: returning.. \n");
  alarm(UTHREAD_QUANTA);

  return uthread_pool[i].tid;
}
 a36:	5b                   	pop    %ebx
 a37:	5e                   	pop    %esi
 a38:	5d                   	pop    %ebp
 a39:	c3                   	ret    
 a3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  alarm(UTHREAD_QUANTA);
  return -1;

load_t:
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
 a40:	8b 15 48 12 00 00    	mov    0x1248,%edx
 a46:	8d 1c 40             	lea    (%eax,%eax,2),%ebx
  // update next tid
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
 a49:	83 ec 0c             	sub    $0xc,%esp
 a4c:	68 00 10 00 00       	push   $0x1000
  alarm(UTHREAD_QUANTA);
  return -1;

load_t:
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
 a51:	c1 e3 03             	shl    $0x3,%ebx
 a54:	89 93 a0 11 00 00    	mov    %edx,0x11a0(%ebx)
  // update next tid
  next_tid++;
 a5a:	83 c2 01             	add    $0x1,%edx
 a5d:	89 15 48 12 00 00    	mov    %edx,0x1248
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
 a63:	e8 18 fc ff ff       	call   680 <malloc>

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
 a68:	8b 55 08             	mov    0x8(%ebp),%edx
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
 a6b:	c7 80 f4 0f 00 00 00 	movl   $0x0,0xff4(%eax)
 a72:	00 00 00 
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
  // update next tid
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
 a75:	89 83 ac 11 00 00    	mov    %eax,0x11ac(%ebx)
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - sizeof(int)) ) = (int)arg;

  // set thread state to RUNNABLE, ready to run
  uthread_pool[i].state = RUNNABLE;
 a7b:	c7 83 b0 11 00 00 02 	movl   $0x2,0x11b0(%ebx)
 a82:	00 00 00 

  // set esp and ebp to null, while thread is not in RUNNING state yet
  uthread_pool[i].esp = 0;
 a85:	c7 83 a4 11 00 00 00 	movl   $0x0,0x11a4(%ebx)
 a8c:	00 00 00 
  uthread_pool[i].ebp = 0;
 a8f:	c7 83 a8 11 00 00 00 	movl   $0x0,0x11a8(%ebx)
 a96:	00 00 00 
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
 a99:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - sizeof(int)) ) = (int)arg;
 a9f:	8b 55 0c             	mov    0xc(%ebp),%edx
 aa2:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)
  uthread_pool[i].esp = 0;
  uthread_pool[i].ebp = 0;
  

  // enable thread switching
  printf(1, "creation method: returning.. \n");
 aa8:	58                   	pop    %eax
 aa9:	5a                   	pop    %edx
 aaa:	68 58 0d 00 00       	push   $0xd58
 aaf:	6a 01                	push   $0x1
 ab1:	e8 9a f9 ff ff       	call   450 <printf>
  alarm(UTHREAD_QUANTA);
 ab6:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 abd:	e8 d8 f8 ff ff       	call   39a <alarm>

  return uthread_pool[i].tid;
 ac2:	8b 83 a0 11 00 00    	mov    0x11a0(%ebx),%eax
 ac8:	83 c4 10             	add    $0x10,%esp
}
 acb:	8d 65 f8             	lea    -0x8(%ebp),%esp
 ace:	5b                   	pop    %ebx
 acf:	5e                   	pop    %esi
 ad0:	5d                   	pop    %ebp
 ad1:	c3                   	ret    
 ad2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ae0 <uthread_exit>:

void 
uthread_exit(void)
{
 ae0:	55                   	push   %ebp
 ae1:	89 e5                	mov    %esp,%ebp
 ae3:	53                   	push   %ebx
 ae4:	83 ec 10             	sub    $0x10,%esp

  int i;

  // disable thread switching
  alarm(0);
 ae7:	6a 00                	push   $0x0
 ae9:	e8 ac f8 ff ff       	call   39a <alarm>

  // deallocate thread memory
  if (uthread_pool[c_uthread_index].stack != 0) {
 aee:	a1 80 11 00 00       	mov    0x1180,%eax
 af3:	83 c4 10             	add    $0x10,%esp
 af6:	8d 14 40             	lea    (%eax,%eax,2),%edx
 af9:	8b 14 d5 ac 11 00 00 	mov    0x11ac(,%edx,8),%edx
 b00:	85 d2                	test   %edx,%edx
 b02:	74 11                	je     b15 <uthread_exit+0x35>
    free(uthread_pool[c_uthread_index].stack);
 b04:	83 ec 0c             	sub    $0xc,%esp
 b07:	52                   	push   %edx
 b08:	e8 e3 fa ff ff       	call   5f0 <free>
 b0d:	a1 80 11 00 00       	mov    0x1180,%eax
 b12:	83 c4 10             	add    $0x10,%esp
  }

  // deallocate thread from thread pool
  uthread_pool[c_uthread_index].state = FREE;
 b15:	8d 04 40             	lea    (%eax,%eax,2),%eax
 b18:	bb b0 11 00 00       	mov    $0x11b0,%ebx
 b1d:	c7 04 c5 b0 11 00 00 	movl   $0x0,0x11b0(,%eax,8)
 b24:	00 00 00 00 
 b28:	89 d8                	mov    %ebx,%eax
 b2a:	eb 0e                	jmp    b3a <uthread_exit+0x5a>
 b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b30:	83 c0 18             	add    $0x18,%eax

  // if any thread is waiting for current thread, get them back to RUNNABLE state
  for(i = 0; i < MAX_THREADS; ++i) {
 b33:	3d 58 12 00 00       	cmp    $0x1258,%eax
 b38:	74 26                	je     b60 <uthread_exit+0x80>
    if (uthread_pool[i].state == SLEEP) {
 b3a:	83 38 03             	cmpl   $0x3,(%eax)
 b3d:	75 f1                	jne    b30 <uthread_exit+0x50>
      uthread_pool[i].state = RUNNABLE;
 b3f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
 b45:	eb e9                	jmp    b30 <uthread_exit+0x50>
 b47:	89 f6                	mov    %esi,%esi
 b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 b50:	83 c3 18             	add    $0x18,%ebx

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
    if (uthread_pool[i].state != FREE) {
      // found thread that is eligible to run, yield
      uthread_yield();
 b53:	e8 18 fc ff ff       	call   770 <uthread_yield>
      uthread_pool[i].state = RUNNABLE;
    }
  }

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
 b58:	81 fb 58 12 00 00    	cmp    $0x1258,%ebx
 b5e:	74 11                	je     b71 <uthread_exit+0x91>
    if (uthread_pool[i].state != FREE) {
 b60:	8b 03                	mov    (%ebx),%eax
 b62:	85 c0                	test   %eax,%eax
 b64:	75 ea                	jne    b50 <uthread_exit+0x70>
 b66:	83 c3 18             	add    $0x18,%ebx
      uthread_pool[i].state = RUNNABLE;
    }
  }

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
 b69:	81 fb 58 12 00 00    	cmp    $0x1258,%ebx
 b6f:	75 ef                	jne    b60 <uthread_exit+0x80>
      // found thread that is eligible to run, yield
      uthread_yield();
    }
  }
  // no ready to run threads, exit
  exit();
 b71:	e8 6c f7 ff ff       	call   2e2 <exit>
 b76:	8d 76 00             	lea    0x0(%esi),%esi
 b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b80 <execute_thread>:
int current_ticket_num;
// choosen lottery thread
int choosen;

static void 
execute_thread(void (*start_func)(void *), void* arg) {
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
 b83:	83 ec 10             	sub    $0x10,%esp
  printf(1, "+++RUN THREAD+++ \n");
 b86:	68 23 0d 00 00       	push   $0xd23
 b8b:	6a 01                	push   $0x1
 b8d:	e8 be f8 ff ff       	call   450 <printf>
  alarm(UTHREAD_QUANTA);
 b92:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 b99:	e8 fc f7 ff ff       	call   39a <alarm>
  start_func(arg);
 b9e:	58                   	pop    %eax
 b9f:	ff 75 0c             	pushl  0xc(%ebp)
 ba2:	ff 55 08             	call   *0x8(%ebp)
  uthread_exit();
 ba5:	e8 36 ff ff ff       	call   ae0 <uthread_exit>
 baa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000bb0 <uthred_self>:

int 
uthred_self(void)
{
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
 bb0:	a1 80 11 00 00       	mov    0x1180,%eax
  }
}

int 
uthred_self(void)
{
 bb5:	55                   	push   %ebp
 bb6:	89 e5                	mov    %esp,%ebp
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
 bb8:	8d 04 40             	lea    (%eax,%eax,2),%eax
}
 bbb:	5d                   	pop    %ebp

int 
uthred_self(void)
{
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
 bbc:	8b 04 c5 a0 11 00 00 	mov    0x11a0(,%eax,8),%eax
}
 bc3:	c3                   	ret    
 bc4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 bca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000bd0 <uthred_join>:

int  
uthred_join(int tid)
{
 bd0:	55                   	push   %ebp
 bd1:	89 e5                	mov    %esp,%ebp
 bd3:	53                   	push   %ebx
 bd4:	83 ec 04             	sub    $0x4,%esp
 bd7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  // if tid is not declared yet or is a negative number, error occured, return
  if(tid >= next_tid || tid < 0) {
 bda:	39 1d 48 12 00 00    	cmp    %ebx,0x1248
 be0:	7e 60                	jle    c42 <uthred_join+0x72>
 be2:	89 d8                	mov    %ebx,%eax
 be4:	c1 e8 1f             	shr    $0x1f,%eax
 be7:	84 c0                	test   %al,%al
 be9:	75 57                	jne    c42 <uthred_join+0x72>
  }

loop:

  // disable thread switching
  alarm(0);
 beb:	83 ec 0c             	sub    $0xc,%esp
 bee:	6a 00                	push   $0x0
 bf0:	e8 a5 f7 ff ff       	call   39a <alarm>
 bf5:	b8 a0 11 00 00       	mov    $0x11a0,%eax
 bfa:	83 c4 10             	add    $0x10,%esp
 bfd:	8d 76 00             	lea    0x0(%esi),%esi

  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
    // searching for a thread with the relevant tid
    if(uthread_pool[i].tid == tid) {
 c00:	3b 18                	cmp    (%eax),%ebx
 c02:	74 24                	je     c28 <uthred_join+0x58>
 c04:	83 c0 18             	add    $0x18,%eax

  // disable thread switching
  alarm(0);

  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
 c07:	3d 48 12 00 00       	cmp    $0x1248,%eax
 c0c:	75 f2                	jne    c00 <uthred_join+0x30>

    }
  }

  // the joined thread is not alive anyway, reset clock
  alarm(UTHREAD_QUANTA);
 c0e:	83 ec 0c             	sub    $0xc,%esp
 c11:	6a 05                	push   $0x5
 c13:	e8 82 f7 ff ff       	call   39a <alarm>

  return 0;
 c18:	83 c4 10             	add    $0x10,%esp
 c1b:	31 c0                	xor    %eax,%eax
}
 c1d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 c20:	c9                   	leave  
 c21:	c3                   	ret    
 c22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
    // searching for a thread with the relevant tid
    if(uthread_pool[i].tid == tid) {
      // put current running thread to sleep
      uthread_pool[c_uthread_index].state = SLEEP;
 c28:	a1 80 11 00 00       	mov    0x1180,%eax
 c2d:	8d 04 40             	lea    (%eax,%eax,2),%eax
 c30:	c7 04 c5 b0 11 00 00 	movl   $0x3,0x11b0(,%eax,8)
 c37:	03 00 00 00 
      // let other thread to run 
      uthread_yield();
 c3b:	e8 30 fb ff ff       	call   770 <uthread_yield>

      // if thread still alive, loop over the join procedure again
      goto loop;
 c40:	eb a9                	jmp    beb <uthred_join+0x1b>
{
  int i;

  // if tid is not declared yet or is a negative number, error occured, return
  if(tid >= next_tid || tid < 0) {
    return -1;
 c42:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c47:	eb d4                	jmp    c1d <uthred_join+0x4d>
