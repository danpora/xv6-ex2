
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	bb 01 00 00 00       	mov    $0x1,%ebx
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
  1e:	83 fe 01             	cmp    $0x1,%esi
  21:	7e 27                	jle    4a <main+0x4a>
  23:	90                   	nop
  24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
    kill(atoi(argv[i]));
  28:	83 ec 0c             	sub    $0xc,%esp
  2b:	ff 34 9f             	pushl  (%edi,%ebx,4)

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  2e:	83 c3 01             	add    $0x1,%ebx
    kill(atoi(argv[i]));
  31:	e8 fa 01 00 00       	call   230 <atoi>
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 94 02 00 00       	call   2d2 <kill>

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  3e:	83 c4 10             	add    $0x10,%esp
  41:	39 de                	cmp    %ebx,%esi
  43:	75 e3                	jne    28 <main+0x28>
    kill(atoi(argv[i]));
  exit();
  45:	e8 58 02 00 00       	call   2a2 <exit>
main(int argc, char **argv)
{
  int i;

  if(argc < 2){
    printf(2, "usage: kill pid...\n");
  4a:	50                   	push   %eax
  4b:	50                   	push   %eax
  4c:	68 0c 0c 00 00       	push   $0xc0c
  51:	6a 02                	push   $0x2
  53:	e8 b8 03 00 00       	call   410 <printf>
    exit();
  58:	e8 45 02 00 00       	call   2a2 <exit>
  5d:	66 90                	xchg   %ax,%ax
  5f:	90                   	nop

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  60:	55                   	push   %ebp
  61:	89 e5                	mov    %esp,%ebp
  63:	53                   	push   %ebx
  64:	8b 45 08             	mov    0x8(%ebp),%eax
  67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  6a:	89 c2                	mov    %eax,%edx
  6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  70:	83 c1 01             	add    $0x1,%ecx
  73:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  77:	83 c2 01             	add    $0x1,%edx
  7a:	84 db                	test   %bl,%bl
  7c:	88 5a ff             	mov    %bl,-0x1(%edx)
  7f:	75 ef                	jne    70 <strcpy+0x10>
    ;
  return os;
}
  81:	5b                   	pop    %ebx
  82:	5d                   	pop    %ebp
  83:	c3                   	ret    
  84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	56                   	push   %esi
  94:	53                   	push   %ebx
  95:	8b 55 08             	mov    0x8(%ebp),%edx
  98:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  9b:	0f b6 02             	movzbl (%edx),%eax
  9e:	0f b6 19             	movzbl (%ecx),%ebx
  a1:	84 c0                	test   %al,%al
  a3:	75 1e                	jne    c3 <strcmp+0x33>
  a5:	eb 29                	jmp    d0 <strcmp+0x40>
  a7:	89 f6                	mov    %esi,%esi
  a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  b0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  b6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  b9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  bd:	84 c0                	test   %al,%al
  bf:	74 0f                	je     d0 <strcmp+0x40>
  c1:	89 f1                	mov    %esi,%ecx
  c3:	38 d8                	cmp    %bl,%al
  c5:	74 e9                	je     b0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  c7:	29 d8                	sub    %ebx,%eax
}
  c9:	5b                   	pop    %ebx
  ca:	5e                   	pop    %esi
  cb:	5d                   	pop    %ebp
  cc:	c3                   	ret    
  cd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  d2:	29 d8                	sub    %ebx,%eax
}
  d4:	5b                   	pop    %ebx
  d5:	5e                   	pop    %esi
  d6:	5d                   	pop    %ebp
  d7:	c3                   	ret    
  d8:	90                   	nop
  d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000e0 <strlen>:

uint
strlen(char *s)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  e6:	80 39 00             	cmpb   $0x0,(%ecx)
  e9:	74 12                	je     fd <strlen+0x1d>
  eb:	31 d2                	xor    %edx,%edx
  ed:	8d 76 00             	lea    0x0(%esi),%esi
  f0:	83 c2 01             	add    $0x1,%edx
  f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  f7:	89 d0                	mov    %edx,%eax
  f9:	75 f5                	jne    f0 <strlen+0x10>
    ;
  return n;
}
  fb:	5d                   	pop    %ebp
  fc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
  fd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
  ff:	5d                   	pop    %ebp
 100:	c3                   	ret    
 101:	eb 0d                	jmp    110 <memset>
 103:	90                   	nop
 104:	90                   	nop
 105:	90                   	nop
 106:	90                   	nop
 107:	90                   	nop
 108:	90                   	nop
 109:	90                   	nop
 10a:	90                   	nop
 10b:	90                   	nop
 10c:	90                   	nop
 10d:	90                   	nop
 10e:	90                   	nop
 10f:	90                   	nop

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 117:	8b 4d 10             	mov    0x10(%ebp),%ecx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 d7                	mov    %edx,%edi
 11f:	fc                   	cld    
 120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 122:	89 d0                	mov    %edx,%eax
 124:	5f                   	pop    %edi
 125:	5d                   	pop    %ebp
 126:	c3                   	ret    
 127:	89 f6                	mov    %esi,%esi
 129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	53                   	push   %ebx
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 13a:	0f b6 10             	movzbl (%eax),%edx
 13d:	84 d2                	test   %dl,%dl
 13f:	74 1d                	je     15e <strchr+0x2e>
    if(*s == c)
 141:	38 d3                	cmp    %dl,%bl
 143:	89 d9                	mov    %ebx,%ecx
 145:	75 0d                	jne    154 <strchr+0x24>
 147:	eb 17                	jmp    160 <strchr+0x30>
 149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 150:	38 ca                	cmp    %cl,%dl
 152:	74 0c                	je     160 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 154:	83 c0 01             	add    $0x1,%eax
 157:	0f b6 10             	movzbl (%eax),%edx
 15a:	84 d2                	test   %dl,%dl
 15c:	75 f2                	jne    150 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 15e:	31 c0                	xor    %eax,%eax
}
 160:	5b                   	pop    %ebx
 161:	5d                   	pop    %ebp
 162:	c3                   	ret    
 163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <gets>:

char*
gets(char *buf, int max)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	56                   	push   %esi
 175:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 176:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 178:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 17b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17e:	eb 29                	jmp    1a9 <gets+0x39>
    cc = read(0, &c, 1);
 180:	83 ec 04             	sub    $0x4,%esp
 183:	6a 01                	push   $0x1
 185:	57                   	push   %edi
 186:	6a 00                	push   $0x0
 188:	e8 2d 01 00 00       	call   2ba <read>
    if(cc < 1)
 18d:	83 c4 10             	add    $0x10,%esp
 190:	85 c0                	test   %eax,%eax
 192:	7e 1d                	jle    1b1 <gets+0x41>
      break;
    buf[i++] = c;
 194:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 198:	8b 55 08             	mov    0x8(%ebp),%edx
 19b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 19d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 19f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1a3:	74 1b                	je     1c0 <gets+0x50>
 1a5:	3c 0d                	cmp    $0xd,%al
 1a7:	74 17                	je     1c0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a9:	8d 5e 01             	lea    0x1(%esi),%ebx
 1ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1af:	7c cf                	jl     180 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1b1:	8b 45 08             	mov    0x8(%ebp),%eax
 1b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1bb:	5b                   	pop    %ebx
 1bc:	5e                   	pop    %esi
 1bd:	5f                   	pop    %edi
 1be:	5d                   	pop    %ebp
 1bf:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1c0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cc:	5b                   	pop    %ebx
 1cd:	5e                   	pop    %esi
 1ce:	5f                   	pop    %edi
 1cf:	5d                   	pop    %ebp
 1d0:	c3                   	ret    
 1d1:	eb 0d                	jmp    1e0 <stat>
 1d3:	90                   	nop
 1d4:	90                   	nop
 1d5:	90                   	nop
 1d6:	90                   	nop
 1d7:	90                   	nop
 1d8:	90                   	nop
 1d9:	90                   	nop
 1da:	90                   	nop
 1db:	90                   	nop
 1dc:	90                   	nop
 1dd:	90                   	nop
 1de:	90                   	nop
 1df:	90                   	nop

000001e0 <stat>:

int
stat(char *n, struct stat *st)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	56                   	push   %esi
 1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1e5:	83 ec 08             	sub    $0x8,%esp
 1e8:	6a 00                	push   $0x0
 1ea:	ff 75 08             	pushl  0x8(%ebp)
 1ed:	e8 f0 00 00 00       	call   2e2 <open>
  if(fd < 0)
 1f2:	83 c4 10             	add    $0x10,%esp
 1f5:	85 c0                	test   %eax,%eax
 1f7:	78 27                	js     220 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1f9:	83 ec 08             	sub    $0x8,%esp
 1fc:	ff 75 0c             	pushl  0xc(%ebp)
 1ff:	89 c3                	mov    %eax,%ebx
 201:	50                   	push   %eax
 202:	e8 f3 00 00 00       	call   2fa <fstat>
 207:	89 c6                	mov    %eax,%esi
  close(fd);
 209:	89 1c 24             	mov    %ebx,(%esp)
 20c:	e8 b9 00 00 00       	call   2ca <close>
  return r;
 211:	83 c4 10             	add    $0x10,%esp
 214:	89 f0                	mov    %esi,%eax
}
 216:	8d 65 f8             	lea    -0x8(%ebp),%esp
 219:	5b                   	pop    %ebx
 21a:	5e                   	pop    %esi
 21b:	5d                   	pop    %ebp
 21c:	c3                   	ret    
 21d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 220:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 225:	eb ef                	jmp    216 <stat+0x36>
 227:	89 f6                	mov    %esi,%esi
 229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 230:	55                   	push   %ebp
 231:	89 e5                	mov    %esp,%ebp
 233:	53                   	push   %ebx
 234:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 237:	0f be 11             	movsbl (%ecx),%edx
 23a:	8d 42 d0             	lea    -0x30(%edx),%eax
 23d:	3c 09                	cmp    $0x9,%al
 23f:	b8 00 00 00 00       	mov    $0x0,%eax
 244:	77 1f                	ja     265 <atoi+0x35>
 246:	8d 76 00             	lea    0x0(%esi),%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 250:	8d 04 80             	lea    (%eax,%eax,4),%eax
 253:	83 c1 01             	add    $0x1,%ecx
 256:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 25a:	0f be 11             	movsbl (%ecx),%edx
 25d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 260:	80 fb 09             	cmp    $0x9,%bl
 263:	76 eb                	jbe    250 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 265:	5b                   	pop    %ebx
 266:	5d                   	pop    %ebp
 267:	c3                   	ret    
 268:	90                   	nop
 269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	56                   	push   %esi
 274:	53                   	push   %ebx
 275:	8b 5d 10             	mov    0x10(%ebp),%ebx
 278:	8b 45 08             	mov    0x8(%ebp),%eax
 27b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 27e:	85 db                	test   %ebx,%ebx
 280:	7e 14                	jle    296 <memmove+0x26>
 282:	31 d2                	xor    %edx,%edx
 284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 288:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 28c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 28f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 292:	39 da                	cmp    %ebx,%edx
 294:	75 f2                	jne    288 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 296:	5b                   	pop    %ebx
 297:	5e                   	pop    %esi
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    

0000029a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 29a:	b8 01 00 00 00       	mov    $0x1,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <exit>:
SYSCALL(exit)
 2a2:	b8 02 00 00 00       	mov    $0x2,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <wait>:
SYSCALL(wait)
 2aa:	b8 03 00 00 00       	mov    $0x3,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <pipe>:
SYSCALL(pipe)
 2b2:	b8 04 00 00 00       	mov    $0x4,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <read>:
SYSCALL(read)
 2ba:	b8 05 00 00 00       	mov    $0x5,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <write>:
SYSCALL(write)
 2c2:	b8 10 00 00 00       	mov    $0x10,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <close>:
SYSCALL(close)
 2ca:	b8 15 00 00 00       	mov    $0x15,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <kill>:
SYSCALL(kill)
 2d2:	b8 06 00 00 00       	mov    $0x6,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <exec>:
SYSCALL(exec)
 2da:	b8 07 00 00 00       	mov    $0x7,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <open>:
SYSCALL(open)
 2e2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <mknod>:
SYSCALL(mknod)
 2ea:	b8 11 00 00 00       	mov    $0x11,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <unlink>:
SYSCALL(unlink)
 2f2:	b8 12 00 00 00       	mov    $0x12,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <fstat>:
SYSCALL(fstat)
 2fa:	b8 08 00 00 00       	mov    $0x8,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <link>:
SYSCALL(link)
 302:	b8 13 00 00 00       	mov    $0x13,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <mkdir>:
SYSCALL(mkdir)
 30a:	b8 14 00 00 00       	mov    $0x14,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <chdir>:
SYSCALL(chdir)
 312:	b8 09 00 00 00       	mov    $0x9,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <dup>:
SYSCALL(dup)
 31a:	b8 0a 00 00 00       	mov    $0xa,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <getpid>:
SYSCALL(getpid)
 322:	b8 0b 00 00 00       	mov    $0xb,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <sbrk>:
SYSCALL(sbrk)
 32a:	b8 0c 00 00 00       	mov    $0xc,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <sleep>:
SYSCALL(sleep)
 332:	b8 0d 00 00 00       	mov    $0xd,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <uptime>:
SYSCALL(uptime)
 33a:	b8 0e 00 00 00       	mov    $0xe,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <signal>:
/*pazit---------------------------------------------------*/
SYSCALL(signal)  
 342:	b8 16 00 00 00       	mov    $0x16,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <sigsend>:
SYSCALL(sigsend)  
 34a:	b8 17 00 00 00       	mov    $0x17,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <sigreturn>:
SYSCALL(sigreturn) 
 352:	b8 18 00 00 00       	mov    $0x18,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <alarm>:
SYSCALL(alarm)
 35a:	b8 19 00 00 00       	mov    $0x19,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    
 362:	66 90                	xchg   %ax,%ax
 364:	66 90                	xchg   %ax,%ax
 366:	66 90                	xchg   %ax,%ax
 368:	66 90                	xchg   %ax,%ax
 36a:	66 90                	xchg   %ax,%ax
 36c:	66 90                	xchg   %ax,%ax
 36e:	66 90                	xchg   %ax,%ax

00000370 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	56                   	push   %esi
 375:	53                   	push   %ebx
 376:	89 c6                	mov    %eax,%esi
 378:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 37b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 37e:	85 db                	test   %ebx,%ebx
 380:	74 7e                	je     400 <printint+0x90>
 382:	89 d0                	mov    %edx,%eax
 384:	c1 e8 1f             	shr    $0x1f,%eax
 387:	84 c0                	test   %al,%al
 389:	74 75                	je     400 <printint+0x90>
    neg = 1;
    x = -xx;
 38b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 38d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 394:	f7 d8                	neg    %eax
 396:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 399:	31 ff                	xor    %edi,%edi
 39b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 39e:	89 ce                	mov    %ecx,%esi
 3a0:	eb 08                	jmp    3aa <printint+0x3a>
 3a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3a8:	89 cf                	mov    %ecx,%edi
 3aa:	31 d2                	xor    %edx,%edx
 3ac:	8d 4f 01             	lea    0x1(%edi),%ecx
 3af:	f7 f6                	div    %esi
 3b1:	0f b6 92 28 0c 00 00 	movzbl 0xc28(%edx),%edx
  }while((x /= base) != 0);
 3b8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 3bd:	75 e9                	jne    3a8 <printint+0x38>
  if(neg)
 3bf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3c2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 3c5:	85 c0                	test   %eax,%eax
 3c7:	74 08                	je     3d1 <printint+0x61>
    buf[i++] = '-';
 3c9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 3ce:	8d 4f 02             	lea    0x2(%edi),%ecx
 3d1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 3d5:	8d 76 00             	lea    0x0(%esi),%esi
 3d8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3db:	83 ec 04             	sub    $0x4,%esp
 3de:	83 ef 01             	sub    $0x1,%edi
 3e1:	6a 01                	push   $0x1
 3e3:	53                   	push   %ebx
 3e4:	56                   	push   %esi
 3e5:	88 45 d7             	mov    %al,-0x29(%ebp)
 3e8:	e8 d5 fe ff ff       	call   2c2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3ed:	83 c4 10             	add    $0x10,%esp
 3f0:	39 df                	cmp    %ebx,%edi
 3f2:	75 e4                	jne    3d8 <printint+0x68>
    putc(fd, buf[i]);
}
 3f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 3f7:	5b                   	pop    %ebx
 3f8:	5e                   	pop    %esi
 3f9:	5f                   	pop    %edi
 3fa:	5d                   	pop    %ebp
 3fb:	c3                   	ret    
 3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 400:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 402:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 409:	eb 8b                	jmp    396 <printint+0x26>
 40b:	90                   	nop
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 410:	55                   	push   %ebp
 411:	89 e5                	mov    %esp,%ebp
 413:	57                   	push   %edi
 414:	56                   	push   %esi
 415:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 416:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 419:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 41c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 41f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 422:	89 45 d0             	mov    %eax,-0x30(%ebp)
 425:	0f b6 1e             	movzbl (%esi),%ebx
 428:	83 c6 01             	add    $0x1,%esi
 42b:	84 db                	test   %bl,%bl
 42d:	0f 84 b0 00 00 00    	je     4e3 <printf+0xd3>
 433:	31 d2                	xor    %edx,%edx
 435:	eb 39                	jmp    470 <printf+0x60>
 437:	89 f6                	mov    %esi,%esi
 439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 440:	83 f8 25             	cmp    $0x25,%eax
 443:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 446:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 44b:	74 18                	je     465 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 44d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 450:	83 ec 04             	sub    $0x4,%esp
 453:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 456:	6a 01                	push   $0x1
 458:	50                   	push   %eax
 459:	57                   	push   %edi
 45a:	e8 63 fe ff ff       	call   2c2 <write>
 45f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 462:	83 c4 10             	add    $0x10,%esp
 465:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 468:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 46c:	84 db                	test   %bl,%bl
 46e:	74 73                	je     4e3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 470:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 472:	0f be cb             	movsbl %bl,%ecx
 475:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 478:	74 c6                	je     440 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 47a:	83 fa 25             	cmp    $0x25,%edx
 47d:	75 e6                	jne    465 <printf+0x55>
      if(c == 'd'){
 47f:	83 f8 64             	cmp    $0x64,%eax
 482:	0f 84 f8 00 00 00    	je     580 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 488:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 48e:	83 f9 70             	cmp    $0x70,%ecx
 491:	74 5d                	je     4f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 493:	83 f8 73             	cmp    $0x73,%eax
 496:	0f 84 84 00 00 00    	je     520 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 49c:	83 f8 63             	cmp    $0x63,%eax
 49f:	0f 84 ea 00 00 00    	je     58f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4a5:	83 f8 25             	cmp    $0x25,%eax
 4a8:	0f 84 c2 00 00 00    	je     570 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4ae:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4b1:	83 ec 04             	sub    $0x4,%esp
 4b4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4b8:	6a 01                	push   $0x1
 4ba:	50                   	push   %eax
 4bb:	57                   	push   %edi
 4bc:	e8 01 fe ff ff       	call   2c2 <write>
 4c1:	83 c4 0c             	add    $0xc,%esp
 4c4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4c7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 4ca:	6a 01                	push   $0x1
 4cc:	50                   	push   %eax
 4cd:	57                   	push   %edi
 4ce:	83 c6 01             	add    $0x1,%esi
 4d1:	e8 ec fd ff ff       	call   2c2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4d6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4da:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4dd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4df:	84 db                	test   %bl,%bl
 4e1:	75 8d                	jne    470 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4e6:	5b                   	pop    %ebx
 4e7:	5e                   	pop    %esi
 4e8:	5f                   	pop    %edi
 4e9:	5d                   	pop    %ebp
 4ea:	c3                   	ret    
 4eb:	90                   	nop
 4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 4f0:	83 ec 0c             	sub    $0xc,%esp
 4f3:	b9 10 00 00 00       	mov    $0x10,%ecx
 4f8:	6a 00                	push   $0x0
 4fa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 4fd:	89 f8                	mov    %edi,%eax
 4ff:	8b 13                	mov    (%ebx),%edx
 501:	e8 6a fe ff ff       	call   370 <printint>
        ap++;
 506:	89 d8                	mov    %ebx,%eax
 508:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 50b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 50d:	83 c0 04             	add    $0x4,%eax
 510:	89 45 d0             	mov    %eax,-0x30(%ebp)
 513:	e9 4d ff ff ff       	jmp    465 <printf+0x55>
 518:	90                   	nop
 519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 520:	8b 45 d0             	mov    -0x30(%ebp),%eax
 523:	8b 18                	mov    (%eax),%ebx
        ap++;
 525:	83 c0 04             	add    $0x4,%eax
 528:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 52b:	b8 20 0c 00 00       	mov    $0xc20,%eax
 530:	85 db                	test   %ebx,%ebx
 532:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 535:	0f b6 03             	movzbl (%ebx),%eax
 538:	84 c0                	test   %al,%al
 53a:	74 23                	je     55f <printf+0x14f>
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 540:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 543:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 546:	83 ec 04             	sub    $0x4,%esp
 549:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 54b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 54e:	50                   	push   %eax
 54f:	57                   	push   %edi
 550:	e8 6d fd ff ff       	call   2c2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 555:	0f b6 03             	movzbl (%ebx),%eax
 558:	83 c4 10             	add    $0x10,%esp
 55b:	84 c0                	test   %al,%al
 55d:	75 e1                	jne    540 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 55f:	31 d2                	xor    %edx,%edx
 561:	e9 ff fe ff ff       	jmp    465 <printf+0x55>
 566:	8d 76 00             	lea    0x0(%esi),%esi
 569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 570:	83 ec 04             	sub    $0x4,%esp
 573:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 576:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 579:	6a 01                	push   $0x1
 57b:	e9 4c ff ff ff       	jmp    4cc <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 580:	83 ec 0c             	sub    $0xc,%esp
 583:	b9 0a 00 00 00       	mov    $0xa,%ecx
 588:	6a 01                	push   $0x1
 58a:	e9 6b ff ff ff       	jmp    4fa <printf+0xea>
 58f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 592:	83 ec 04             	sub    $0x4,%esp
 595:	8b 03                	mov    (%ebx),%eax
 597:	6a 01                	push   $0x1
 599:	88 45 e4             	mov    %al,-0x1c(%ebp)
 59c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 59f:	50                   	push   %eax
 5a0:	57                   	push   %edi
 5a1:	e8 1c fd ff ff       	call   2c2 <write>
 5a6:	e9 5b ff ff ff       	jmp    506 <printf+0xf6>
 5ab:	66 90                	xchg   %ax,%ax
 5ad:	66 90                	xchg   %ax,%ax
 5af:	90                   	nop

000005b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5b1:	a1 c0 10 00 00       	mov    0x10c0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 5b6:	89 e5                	mov    %esp,%ebp
 5b8:	57                   	push   %edi
 5b9:	56                   	push   %esi
 5ba:	53                   	push   %ebx
 5bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5be:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5c0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c3:	39 c8                	cmp    %ecx,%eax
 5c5:	73 19                	jae    5e0 <free+0x30>
 5c7:	89 f6                	mov    %esi,%esi
 5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 5d0:	39 d1                	cmp    %edx,%ecx
 5d2:	72 1c                	jb     5f0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5d4:	39 d0                	cmp    %edx,%eax
 5d6:	73 18                	jae    5f0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5da:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5dc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5de:	72 f0                	jb     5d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e0:	39 d0                	cmp    %edx,%eax
 5e2:	72 f4                	jb     5d8 <free+0x28>
 5e4:	39 d1                	cmp    %edx,%ecx
 5e6:	73 f0                	jae    5d8 <free+0x28>
 5e8:	90                   	nop
 5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 5f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5f3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5f6:	39 d7                	cmp    %edx,%edi
 5f8:	74 19                	je     613 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5fd:	8b 50 04             	mov    0x4(%eax),%edx
 600:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 603:	39 f1                	cmp    %esi,%ecx
 605:	74 23                	je     62a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 607:	89 08                	mov    %ecx,(%eax)
  freep = p;
 609:	a3 c0 10 00 00       	mov    %eax,0x10c0
}
 60e:	5b                   	pop    %ebx
 60f:	5e                   	pop    %esi
 610:	5f                   	pop    %edi
 611:	5d                   	pop    %ebp
 612:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 613:	03 72 04             	add    0x4(%edx),%esi
 616:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 619:	8b 10                	mov    (%eax),%edx
 61b:	8b 12                	mov    (%edx),%edx
 61d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 620:	8b 50 04             	mov    0x4(%eax),%edx
 623:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 626:	39 f1                	cmp    %esi,%ecx
 628:	75 dd                	jne    607 <free+0x57>
    p->s.size += bp->s.size;
 62a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 62d:	a3 c0 10 00 00       	mov    %eax,0x10c0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 632:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 635:	8b 53 f8             	mov    -0x8(%ebx),%edx
 638:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 63a:	5b                   	pop    %ebx
 63b:	5e                   	pop    %esi
 63c:	5f                   	pop    %edi
 63d:	5d                   	pop    %ebp
 63e:	c3                   	ret    
 63f:	90                   	nop

00000640 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	57                   	push   %edi
 644:	56                   	push   %esi
 645:	53                   	push   %ebx
 646:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 649:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 64c:	8b 15 c0 10 00 00    	mov    0x10c0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 652:	8d 78 07             	lea    0x7(%eax),%edi
 655:	c1 ef 03             	shr    $0x3,%edi
 658:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 65b:	85 d2                	test   %edx,%edx
 65d:	0f 84 a3 00 00 00    	je     706 <malloc+0xc6>
 663:	8b 02                	mov    (%edx),%eax
 665:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 668:	39 cf                	cmp    %ecx,%edi
 66a:	76 74                	jbe    6e0 <malloc+0xa0>
 66c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 672:	be 00 10 00 00       	mov    $0x1000,%esi
 677:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 67e:	0f 43 f7             	cmovae %edi,%esi
 681:	ba 00 80 00 00       	mov    $0x8000,%edx
 686:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 68c:	0f 46 da             	cmovbe %edx,%ebx
 68f:	eb 10                	jmp    6a1 <malloc+0x61>
 691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 698:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 69a:	8b 48 04             	mov    0x4(%eax),%ecx
 69d:	39 cf                	cmp    %ecx,%edi
 69f:	76 3f                	jbe    6e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6a1:	39 05 c0 10 00 00    	cmp    %eax,0x10c0
 6a7:	89 c2                	mov    %eax,%edx
 6a9:	75 ed                	jne    698 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6ab:	83 ec 0c             	sub    $0xc,%esp
 6ae:	53                   	push   %ebx
 6af:	e8 76 fc ff ff       	call   32a <sbrk>
  if(p == (char*)-1)
 6b4:	83 c4 10             	add    $0x10,%esp
 6b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6ba:	74 1c                	je     6d8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6bc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 6bf:	83 ec 0c             	sub    $0xc,%esp
 6c2:	83 c0 08             	add    $0x8,%eax
 6c5:	50                   	push   %eax
 6c6:	e8 e5 fe ff ff       	call   5b0 <free>
  return freep;
 6cb:	8b 15 c0 10 00 00    	mov    0x10c0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 6d1:	83 c4 10             	add    $0x10,%esp
 6d4:	85 d2                	test   %edx,%edx
 6d6:	75 c0                	jne    698 <malloc+0x58>
        return 0;
 6d8:	31 c0                	xor    %eax,%eax
 6da:	eb 1c                	jmp    6f8 <malloc+0xb8>
 6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6e0:	39 cf                	cmp    %ecx,%edi
 6e2:	74 1c                	je     700 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6e4:	29 f9                	sub    %edi,%ecx
 6e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6ec:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 6ef:	89 15 c0 10 00 00    	mov    %edx,0x10c0
      return (void*)(p + 1);
 6f5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 6f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6fb:	5b                   	pop    %ebx
 6fc:	5e                   	pop    %esi
 6fd:	5f                   	pop    %edi
 6fe:	5d                   	pop    %ebp
 6ff:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 700:	8b 08                	mov    (%eax),%ecx
 702:	89 0a                	mov    %ecx,(%edx)
 704:	eb e9                	jmp    6ef <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 706:	c7 05 c0 10 00 00 c4 	movl   $0x10c4,0x10c0
 70d:	10 00 00 
 710:	c7 05 c4 10 00 00 c4 	movl   $0x10c4,0x10c4
 717:	10 00 00 
    base.s.size = 0;
 71a:	b8 c4 10 00 00       	mov    $0x10c4,%eax
 71f:	c7 05 c8 10 00 00 00 	movl   $0x0,0x10c8
 726:	00 00 00 
 729:	e9 3e ff ff ff       	jmp    66c <malloc+0x2c>
 72e:	66 90                	xchg   %ax,%ax

00000730 <uthread_yield>:
  exit();
}

void 
uthread_yield(void)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	57                   	push   %edi
 734:	56                   	push   %esi
 735:	53                   	push   %ebx
 736:	83 ec 28             	sub    $0x28,%esp
  // switch alarm(0) to cancel thread switching while yielding 
  alarm(0);
 739:	6a 00                	push   $0x0
 73b:	e8 1a fc ff ff       	call   35a <alarm>

  // if current thread is running (most cases), the thread didn't finisht its job so turn his state to RUNNABLE
  if (uthread_pool[c_uthread_index].state == RUNNING) {
 740:	a1 e0 10 00 00       	mov    0x10e0,%eax
 745:	83 c4 10             	add    $0x10,%esp
 748:	8d 14 40             	lea    (%eax,%eax,2),%edx
 74b:	8d 14 d5 00 11 00 00 	lea    0x1100(,%edx,8),%edx
 752:	83 7a 10 01          	cmpl   $0x1,0x10(%edx)
 756:	0f 84 54 01 00 00    	je     8b0 <uthread_yield+0x180>
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
 75c:	8d 04 40             	lea    (%eax,%eax,2),%eax
  asm("movl %%ebp, %0;" : "=r" (uthread_pool[c_uthread_index].ebp));

  // load the new thread

  // pick the next thread index
  c_uthread_index++;
 75f:	83 05 e0 10 00 00 01 	addl   $0x1,0x10e0
 766:	bb 10 11 00 00       	mov    $0x1110,%ebx
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
 76b:	89 e2                	mov    %esp,%edx
 76d:	8d 04 c5 00 11 00 00 	lea    0x1100(,%eax,8),%eax

  // ************** lottery scheduler mechanism ******************* //

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
 774:	c7 05 b0 11 00 00 ff 	movl   $0xffffffff,0x11b0
 77b:	ff ff ff 
 77e:	89 de                	mov    %ebx,%esi
 780:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
 784:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 789:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
 78e:	89 50 04             	mov    %edx,0x4(%eax)
  asm("movl %%ebp, %0;" : "=r" (uthread_pool[c_uthread_index].ebp));
 791:	89 ea                	mov    %ebp,%edx
 793:	89 50 08             	mov    %edx,0x8(%eax)
 796:	8d 76 00             	lea    0x0(%esi),%esi
 799:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
 7a0:	8b 06                	mov    (%esi),%eax
 7a2:	85 c0                	test   %eax,%eax
 7a4:	0f 95 c2             	setne  %dl
 7a7:	83 f8 03             	cmp    $0x3,%eax
 7aa:	0f 95 c0             	setne  %al
 7ad:	20 d0                	and    %dl,%al
 7af:	74 0a                	je     7bb <uthread_yield+0x8b>
      current_ticket_num += uthread_pool[j].ntickets;
 7b1:	8b 7e 04             	mov    0x4(%esi),%edi
 7b4:	88 45 e7             	mov    %al,-0x19(%ebp)
 7b7:	01 cf                	add    %ecx,%edi
 7b9:	89 f9                	mov    %edi,%ecx
 7bb:	83 c6 18             	add    $0x18,%esi
  // ************** lottery scheduler mechanism ******************* //

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
 7be:	81 fe b8 11 00 00    	cmp    $0x11b8,%esi
 7c4:	75 da                	jne    7a0 <uthread_yield+0x70>
 7c6:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
 7ca:	0f 85 ec 00 00 00    	jne    8bc <uthread_yield+0x18c>

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 7d0:	69 05 b4 10 00 00 0d 	imul   $0x19660d,0x10b4,%eax
 7d7:	66 19 00 
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
      current_ticket_num += uthread_pool[j].ntickets;
  }

  // generate a random number between 0 and current_ticket_num
  randomTicket = rand() % current_ticket_num;
 7da:	31 d2                	xor    %edx,%edx

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
 7dc:	83 ec 04             	sub    $0x4,%esp
 7df:	51                   	push   %ecx
 7e0:	68 39 0c 00 00       	push   $0xc39
 7e5:	6a 01                	push   $0x1

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 7e7:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
 7ec:	a3 b4 10 00 00       	mov    %eax,0x10b4
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
      current_ticket_num += uthread_pool[j].ntickets;
  }

  // generate a random number between 0 and current_ticket_num
  randomTicket = rand() % current_ticket_num;
 7f1:	f7 f1                	div    %ecx
 7f3:	89 d6                	mov    %edx,%esi

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
 7f5:	e8 16 fc ff ff       	call   410 <printf>
  printf(1,"randomTicket=%d\n", randomTicket);
 7fa:	83 c4 0c             	add    $0xc,%esp
 7fd:	56                   	push   %esi
 7fe:	68 50 0c 00 00       	push   $0xc50
 803:	6a 01                	push   $0x1
 805:	e8 06 fc ff ff       	call   410 <printf>

  // set the choosen order thread to run
  choosen = randomTicket / NTICKET;
 80a:	89 f0                	mov    %esi,%eax
 80c:	ba 67 66 66 66       	mov    $0x66666667,%edx
 811:	c1 fe 1f             	sar    $0x1f,%esi
 814:	f7 ea                	imul   %edx
 816:	83 c4 10             	add    $0x10,%esp

  // pick the index of choosen thread
  int chooseCount = -1;
 819:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  for(j = 0; j < MAX_THREADS; ++j) {
 81e:	31 c0                	xor    %eax,%eax

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
  printf(1,"randomTicket=%d\n", randomTicket);

  // set the choosen order thread to run
  choosen = randomTicket / NTICKET;
 820:	d1 fa                	sar    %edx
 822:	29 f2                	sub    %esi,%edx
 824:	89 15 ac 11 00 00    	mov    %edx,0x11ac
 82a:	eb 0f                	jmp    83b <uthread_yield+0x10b>
 82c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // pick the index of choosen thread
  int chooseCount = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
 830:	83 c0 01             	add    $0x1,%eax
 833:	83 c3 18             	add    $0x18,%ebx
 836:	83 f8 07             	cmp    $0x7,%eax
 839:	74 15                	je     850 <uthread_yield+0x120>
    if(uthread_pool[j].state == RUNNABLE) {
 83b:	83 3b 02             	cmpl   $0x2,(%ebx)
 83e:	75 f0                	jne    830 <uthread_yield+0x100>
      chooseCount++;
 840:	83 c1 01             	add    $0x1,%ecx
      if (choosen == chooseCount)
 843:	39 ca                	cmp    %ecx,%edx
 845:	75 e9                	jne    830 <uthread_yield+0x100>
 847:	89 f6                	mov    %esi,%esi
 849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        break;
    }
  }

  // set current thread to the lottery chosen one
  c_uthread_index = j;
 850:	a3 e0 10 00 00       	mov    %eax,0x10e0

  // ****************************************************************** //

  // current switched thread is move to RUNNING mode, next to be execute
  uthread_pool[c_uthread_index].state = RUNNING;
 855:	8d 04 40             	lea    (%eax,%eax,2),%eax
 858:	8d 04 c5 00 11 00 00 	lea    0x1100(,%eax,8),%eax


  // if esp is null, thread is running its first time, so we have to load a functio to it 
  if(uthread_pool[c_uthread_index].esp == 0) {
 85f:	8b 50 04             	mov    0x4(%eax),%edx
  c_uthread_index = j;

  // ****************************************************************** //

  // current switched thread is move to RUNNING mode, next to be execute
  uthread_pool[c_uthread_index].state = RUNNING;
 862:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)


  // if esp is null, thread is running its first time, so we have to load a functio to it 
  if(uthread_pool[c_uthread_index].esp == 0) {
 869:	85 d2                	test   %edx,%edx
 86b:	75 23                	jne    890 <uthread_yield+0x160>
    asm("movl %0, %%esp;" : : "r" (uthread_pool[c_uthread_index].stack + STACK_SIZE - 3*sizeof(int)));
 86d:	8b 40 0c             	mov    0xc(%eax),%eax
 870:	05 f4 0f 00 00       	add    $0xff4,%eax
 875:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].stack + STACK_SIZE - 3*sizeof(int)));
 877:	89 c5                	mov    %eax,%ebp
    // jump to execute function to run the thread own function
    asm("jmp *%0;" : : "r" (execute_thread));
 879:	b8 40 0b 00 00       	mov    $0xb40,%eax
 87e:	ff e0                	jmp    *%eax
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].ebp));

    // reset alarm
    alarm(UTHREAD_QUANTA);
  }
}
 880:	8d 65 f4             	lea    -0xc(%ebp),%esp
 883:	5b                   	pop    %ebx
 884:	5e                   	pop    %esi
 885:	5f                   	pop    %edi
 886:	5d                   	pop    %ebp
 887:	c3                   	ret    
 888:	90                   	nop
 889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // jump to execute function to run the thread own function
    asm("jmp *%0;" : : "r" (execute_thread));
  } 
  else  {
    // restore thread stack
    asm("movl %0, %%esp;" : : "r" (uthread_pool[c_uthread_index].esp));
 890:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].ebp));
 892:	8b 40 08             	mov    0x8(%eax),%eax
 895:	89 c5                	mov    %eax,%ebp

    // reset alarm
    alarm(UTHREAD_QUANTA);
 897:	83 ec 0c             	sub    $0xc,%esp
 89a:	6a 05                	push   $0x5
 89c:	e8 b9 fa ff ff       	call   35a <alarm>
 8a1:	83 c4 10             	add    $0x10,%esp
  }
}
 8a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8a7:	5b                   	pop    %ebx
 8a8:	5e                   	pop    %esi
 8a9:	5f                   	pop    %edi
 8aa:	5d                   	pop    %ebp
 8ab:	c3                   	ret    
 8ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  // switch alarm(0) to cancel thread switching while yielding 
  alarm(0);

  // if current thread is running (most cases), the thread didn't finisht its job so turn his state to RUNNABLE
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
 8b0:	c7 42 10 02 00 00 00 	movl   $0x2,0x10(%edx)
 8b7:	e9 a0 fe ff ff       	jmp    75c <uthread_yield+0x2c>
 8bc:	89 3d b0 11 00 00    	mov    %edi,0x11b0
 8c2:	e9 09 ff ff ff       	jmp    7d0 <uthread_yield+0xa0>
 8c7:	89 f6                	mov    %esi,%esi
 8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008d0 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 8d0:	69 05 b4 10 00 00 0d 	imul   $0x19660d,0x10b4,%eax
 8d7:	66 19 00 
//***************************************************************************************//

unsigned long randstate = 1;
unsigned int
rand()
{
 8da:	55                   	push   %ebp
 8db:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
 8dd:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 8de:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
 8e3:	a3 b4 10 00 00       	mov    %eax,0x10b4
  return randstate;
}
 8e8:	c3                   	ret    
 8e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008f0 <uthread_init>:
  uthread_exit();
}

int
 uthread_init()
{
 8f0:	55                   	push   %ebp
 8f1:	89 e5                	mov    %esp,%ebp
 8f3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "** INIT USER LEVEL THREAD **\n");
 8f6:	68 61 0c 00 00       	push   $0xc61
 8fb:	6a 01                	push   $0x1
 8fd:	e8 0e fb ff ff       	call   410 <printf>
 902:	b8 10 11 00 00       	mov    $0x1110,%eax
 907:	83 c4 10             	add    $0x10,%esp
 90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  // set all threads state to FREE - init pool
  int i;
  for(i = 0; i < MAX_THREADS; ++i) {
    uthread_pool[i].state = FREE;
 910:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    uthread_pool[i].ntickets = NTICKET;
 916:	c7 40 04 05 00 00 00 	movl   $0x5,0x4(%eax)
 91d:	83 c0 18             	add    $0x18,%eax
 uthread_init()
{
  printf(1, "** INIT USER LEVEL THREAD **\n");
  // set all threads state to FREE - init pool
  int i;
  for(i = 0; i < MAX_THREADS; ++i) {
 920:	3d b8 11 00 00       	cmp    $0x11b8,%eax
 925:	75 e9                	jne    910 <uthread_init+0x20>
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 927:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < MAX_THREADS; ++i) {
    uthread_pool[i].state = FREE;
    uthread_pool[i].ntickets = NTICKET;
  }

  next_tid = 1;
 92a:	c7 05 a8 11 00 00 01 	movl   $0x1,0x11a8
 931:	00 00 00 

  // initialize main thread
  c_uthread_index = 0;
 934:	c7 05 e0 10 00 00 00 	movl   $0x0,0x10e0
 93b:	00 00 00 
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 93e:	68 30 07 00 00       	push   $0x730
 943:	6a 0e                	push   $0xe
  next_tid = 1;

  // initialize main thread
  c_uthread_index = 0;
  // set tid and stack to null
  uthread_pool[c_uthread_index].tid = 0;
 945:	c7 05 00 11 00 00 00 	movl   $0x0,0x1100
 94c:	00 00 00 
  uthread_pool[c_uthread_index].stack = 0; 
 94f:	c7 05 0c 11 00 00 00 	movl   $0x0,0x110c
 956:	00 00 00 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;
 959:	c7 05 10 11 00 00 01 	movl   $0x1,0x1110
 960:	00 00 00 

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 963:	e8 da f9 ff ff       	call   342 <signal>
 968:	83 c4 10             	add    $0x10,%esp
 96b:	85 c0                	test   %eax,%eax
    // case signal error
    return -1;
 96d:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 972:	75 0f                	jne    983 <uthread_init+0x93>
    // case signal error
    return -1;
  }

  // execute the alarm syscall with UTHREAD_QUANTA
  alarm(UTHREAD_QUANTA);
 974:	83 ec 0c             	sub    $0xc,%esp
 977:	6a 05                	push   $0x5
 979:	e8 dc f9 ff ff       	call   35a <alarm>

  return 0;
 97e:	83 c4 10             	add    $0x10,%esp
 981:	31 d2                	xor    %edx,%edx
}
 983:	89 d0                	mov    %edx,%eax
 985:	c9                   	leave  
 986:	c3                   	ret    
 987:	89 f6                	mov    %esi,%esi
 989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000990 <uthread_create>:

int 
uthread_create(void (*func)(void *), void* arg)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	56                   	push   %esi
 994:	53                   	push   %ebx
  printf(1, "start thread creation \n");
 995:	83 ec 08             	sub    $0x8,%esp
 998:	68 7f 0c 00 00       	push   $0xc7f
 99d:	6a 01                	push   $0x1
 99f:	e8 6c fa ff ff       	call   410 <printf>

  // local thread pool index
  int i;

  // disable thread switching
  alarm(0);
 9a4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 9ab:	e8 aa f9 ff ff       	call   35a <alarm>

  printf(1, "uthread_create after alarm(0) \n");
 9b0:	5b                   	pop    %ebx
 9b1:	5e                   	pop    %esi
 9b2:	68 ac 0c 00 00       	push   $0xcac
 9b7:	6a 01                	push   $0x1
 9b9:	e8 52 fa ff ff       	call   410 <printf>
 9be:	ba 10 11 00 00       	mov    $0x1110,%edx
 9c3:	83 c4 10             	add    $0x10,%esp

  // search for free thread to load
  for(i = 0; i < MAX_THREADS; ++i) {
 9c6:	31 c0                	xor    %eax,%eax
 9c8:	90                   	nop
 9c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if (uthread_pool[i].state == FREE) {
 9d0:	8b 0a                	mov    (%edx),%ecx
 9d2:	85 c9                	test   %ecx,%ecx
 9d4:	74 2a                	je     a00 <uthread_create+0x70>
  alarm(0);

  printf(1, "uthread_create after alarm(0) \n");

  // search for free thread to load
  for(i = 0; i < MAX_THREADS; ++i) {
 9d6:	83 c0 01             	add    $0x1,%eax
 9d9:	83 c2 18             	add    $0x18,%edx
 9dc:	83 f8 07             	cmp    $0x7,%eax
 9df:	75 ef                	jne    9d0 <uthread_create+0x40>
    }
  }

  // case no free threads available
  // enable thread switching
  alarm(UTHREAD_QUANTA);
 9e1:	83 ec 0c             	sub    $0xc,%esp
 9e4:	6a 05                	push   $0x5
 9e6:	e8 6f f9 ff ff       	call   35a <alarm>
  return -1;
 9eb:	83 c4 10             	add    $0x10,%esp
  // enable thread switching
  printf(1, "creation method: returning.. \n");
  alarm(UTHREAD_QUANTA);

  return uthread_pool[i].tid;
}
 9ee:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }

  // case no free threads available
  // enable thread switching
  alarm(UTHREAD_QUANTA);
  return -1;
 9f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  // enable thread switching
  printf(1, "creation method: returning.. \n");
  alarm(UTHREAD_QUANTA);

  return uthread_pool[i].tid;
}
 9f6:	5b                   	pop    %ebx
 9f7:	5e                   	pop    %esi
 9f8:	5d                   	pop    %ebp
 9f9:	c3                   	ret    
 9fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  alarm(UTHREAD_QUANTA);
  return -1;

load_t:
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
 a00:	8b 15 a8 11 00 00    	mov    0x11a8,%edx
 a06:	8d 1c 40             	lea    (%eax,%eax,2),%ebx
  // update next tid
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
 a09:	83 ec 0c             	sub    $0xc,%esp
 a0c:	68 00 10 00 00       	push   $0x1000
  alarm(UTHREAD_QUANTA);
  return -1;

load_t:
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
 a11:	c1 e3 03             	shl    $0x3,%ebx
 a14:	89 93 00 11 00 00    	mov    %edx,0x1100(%ebx)
  // update next tid
  next_tid++;
 a1a:	83 c2 01             	add    $0x1,%edx
 a1d:	89 15 a8 11 00 00    	mov    %edx,0x11a8
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
 a23:	e8 18 fc ff ff       	call   640 <malloc>

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
 a28:	8b 55 08             	mov    0x8(%ebp),%edx
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
 a2b:	c7 80 f4 0f 00 00 00 	movl   $0x0,0xff4(%eax)
 a32:	00 00 00 
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
  // update next tid
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
 a35:	89 83 0c 11 00 00    	mov    %eax,0x110c(%ebx)
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - sizeof(int)) ) = (int)arg;

  // set thread state to RUNNABLE, ready to run
  uthread_pool[i].state = RUNNABLE;
 a3b:	c7 83 10 11 00 00 02 	movl   $0x2,0x1110(%ebx)
 a42:	00 00 00 

  // set esp and ebp to null, while thread is not in RUNNING state yet
  uthread_pool[i].esp = 0;
 a45:	c7 83 04 11 00 00 00 	movl   $0x0,0x1104(%ebx)
 a4c:	00 00 00 
  uthread_pool[i].ebp = 0;
 a4f:	c7 83 08 11 00 00 00 	movl   $0x0,0x1108(%ebx)
 a56:	00 00 00 
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
 a59:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - sizeof(int)) ) = (int)arg;
 a5f:	8b 55 0c             	mov    0xc(%ebp),%edx
 a62:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)
  uthread_pool[i].esp = 0;
  uthread_pool[i].ebp = 0;
  

  // enable thread switching
  printf(1, "creation method: returning.. \n");
 a68:	58                   	pop    %eax
 a69:	5a                   	pop    %edx
 a6a:	68 cc 0c 00 00       	push   $0xccc
 a6f:	6a 01                	push   $0x1
 a71:	e8 9a f9 ff ff       	call   410 <printf>
  alarm(UTHREAD_QUANTA);
 a76:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 a7d:	e8 d8 f8 ff ff       	call   35a <alarm>

  return uthread_pool[i].tid;
 a82:	8b 83 00 11 00 00    	mov    0x1100(%ebx),%eax
 a88:	83 c4 10             	add    $0x10,%esp
}
 a8b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 a8e:	5b                   	pop    %ebx
 a8f:	5e                   	pop    %esi
 a90:	5d                   	pop    %ebp
 a91:	c3                   	ret    
 a92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000aa0 <uthread_exit>:

void 
uthread_exit(void)
{
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	53                   	push   %ebx
 aa4:	83 ec 10             	sub    $0x10,%esp

  int i;

  // disable thread switching
  alarm(0);
 aa7:	6a 00                	push   $0x0
 aa9:	e8 ac f8 ff ff       	call   35a <alarm>

  // deallocate thread memory
  if (uthread_pool[c_uthread_index].stack != 0) {
 aae:	a1 e0 10 00 00       	mov    0x10e0,%eax
 ab3:	83 c4 10             	add    $0x10,%esp
 ab6:	8d 14 40             	lea    (%eax,%eax,2),%edx
 ab9:	8b 14 d5 0c 11 00 00 	mov    0x110c(,%edx,8),%edx
 ac0:	85 d2                	test   %edx,%edx
 ac2:	74 11                	je     ad5 <uthread_exit+0x35>
    free(uthread_pool[c_uthread_index].stack);
 ac4:	83 ec 0c             	sub    $0xc,%esp
 ac7:	52                   	push   %edx
 ac8:	e8 e3 fa ff ff       	call   5b0 <free>
 acd:	a1 e0 10 00 00       	mov    0x10e0,%eax
 ad2:	83 c4 10             	add    $0x10,%esp
  }

  // deallocate thread from thread pool
  uthread_pool[c_uthread_index].state = FREE;
 ad5:	8d 04 40             	lea    (%eax,%eax,2),%eax
 ad8:	bb 10 11 00 00       	mov    $0x1110,%ebx
 add:	c7 04 c5 10 11 00 00 	movl   $0x0,0x1110(,%eax,8)
 ae4:	00 00 00 00 
 ae8:	89 d8                	mov    %ebx,%eax
 aea:	eb 0e                	jmp    afa <uthread_exit+0x5a>
 aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 af0:	83 c0 18             	add    $0x18,%eax

  // if any thread is waiting for current thread, get them back to RUNNABLE state
  for(i = 0; i < MAX_THREADS; ++i) {
 af3:	3d b8 11 00 00       	cmp    $0x11b8,%eax
 af8:	74 26                	je     b20 <uthread_exit+0x80>
    if (uthread_pool[i].state == SLEEP) {
 afa:	83 38 03             	cmpl   $0x3,(%eax)
 afd:	75 f1                	jne    af0 <uthread_exit+0x50>
      uthread_pool[i].state = RUNNABLE;
 aff:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
 b05:	eb e9                	jmp    af0 <uthread_exit+0x50>
 b07:	89 f6                	mov    %esi,%esi
 b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 b10:	83 c3 18             	add    $0x18,%ebx

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
    if (uthread_pool[i].state != FREE) {
      // found thread that is eligible to run, yield
      uthread_yield();
 b13:	e8 18 fc ff ff       	call   730 <uthread_yield>
      uthread_pool[i].state = RUNNABLE;
    }
  }

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
 b18:	81 fb b8 11 00 00    	cmp    $0x11b8,%ebx
 b1e:	74 11                	je     b31 <uthread_exit+0x91>
    if (uthread_pool[i].state != FREE) {
 b20:	8b 03                	mov    (%ebx),%eax
 b22:	85 c0                	test   %eax,%eax
 b24:	75 ea                	jne    b10 <uthread_exit+0x70>
 b26:	83 c3 18             	add    $0x18,%ebx
      uthread_pool[i].state = RUNNABLE;
    }
  }

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
 b29:	81 fb b8 11 00 00    	cmp    $0x11b8,%ebx
 b2f:	75 ef                	jne    b20 <uthread_exit+0x80>
      // found thread that is eligible to run, yield
      uthread_yield();
    }
  }
  // no ready to run threads, exit
  exit();
 b31:	e8 6c f7 ff ff       	call   2a2 <exit>
 b36:	8d 76 00             	lea    0x0(%esi),%esi
 b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b40 <execute_thread>:
int current_ticket_num;
// choosen lottery thread
int choosen;

static void 
execute_thread(void (*start_func)(void *), void* arg) {
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
 b43:	83 ec 10             	sub    $0x10,%esp
  printf(1, "+++RUN THREAD+++ \n");
 b46:	68 97 0c 00 00       	push   $0xc97
 b4b:	6a 01                	push   $0x1
 b4d:	e8 be f8 ff ff       	call   410 <printf>
  alarm(UTHREAD_QUANTA);
 b52:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 b59:	e8 fc f7 ff ff       	call   35a <alarm>
  start_func(arg);
 b5e:	58                   	pop    %eax
 b5f:	ff 75 0c             	pushl  0xc(%ebp)
 b62:	ff 55 08             	call   *0x8(%ebp)
  uthread_exit();
 b65:	e8 36 ff ff ff       	call   aa0 <uthread_exit>
 b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b70 <uthred_self>:

int 
uthred_self(void)
{
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
 b70:	a1 e0 10 00 00       	mov    0x10e0,%eax
  }
}

int 
uthred_self(void)
{
 b75:	55                   	push   %ebp
 b76:	89 e5                	mov    %esp,%ebp
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
 b78:	8d 04 40             	lea    (%eax,%eax,2),%eax
}
 b7b:	5d                   	pop    %ebp

int 
uthred_self(void)
{
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
 b7c:	8b 04 c5 00 11 00 00 	mov    0x1100(,%eax,8),%eax
}
 b83:	c3                   	ret    
 b84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 b8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b90 <uthred_join>:

int  
uthred_join(int tid)
{
 b90:	55                   	push   %ebp
 b91:	89 e5                	mov    %esp,%ebp
 b93:	53                   	push   %ebx
 b94:	83 ec 04             	sub    $0x4,%esp
 b97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  // if tid is not declared yet or is a negative number, error occured, return
  if(tid >= next_tid || tid < 0) {
 b9a:	39 1d a8 11 00 00    	cmp    %ebx,0x11a8
 ba0:	7e 60                	jle    c02 <uthred_join+0x72>
 ba2:	89 d8                	mov    %ebx,%eax
 ba4:	c1 e8 1f             	shr    $0x1f,%eax
 ba7:	84 c0                	test   %al,%al
 ba9:	75 57                	jne    c02 <uthred_join+0x72>
  }

loop:

  // disable thread switching
  alarm(0);
 bab:	83 ec 0c             	sub    $0xc,%esp
 bae:	6a 00                	push   $0x0
 bb0:	e8 a5 f7 ff ff       	call   35a <alarm>
 bb5:	b8 00 11 00 00       	mov    $0x1100,%eax
 bba:	83 c4 10             	add    $0x10,%esp
 bbd:	8d 76 00             	lea    0x0(%esi),%esi

  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
    // searching for a thread with the relevant tid
    if(uthread_pool[i].tid == tid) {
 bc0:	3b 18                	cmp    (%eax),%ebx
 bc2:	74 24                	je     be8 <uthred_join+0x58>
 bc4:	83 c0 18             	add    $0x18,%eax

  // disable thread switching
  alarm(0);

  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
 bc7:	3d a8 11 00 00       	cmp    $0x11a8,%eax
 bcc:	75 f2                	jne    bc0 <uthred_join+0x30>

    }
  }

  // the joined thread is not alive anyway, reset clock
  alarm(UTHREAD_QUANTA);
 bce:	83 ec 0c             	sub    $0xc,%esp
 bd1:	6a 05                	push   $0x5
 bd3:	e8 82 f7 ff ff       	call   35a <alarm>

  return 0;
 bd8:	83 c4 10             	add    $0x10,%esp
 bdb:	31 c0                	xor    %eax,%eax
}
 bdd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 be0:	c9                   	leave  
 be1:	c3                   	ret    
 be2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
    // searching for a thread with the relevant tid
    if(uthread_pool[i].tid == tid) {
      // put current running thread to sleep
      uthread_pool[c_uthread_index].state = SLEEP;
 be8:	a1 e0 10 00 00       	mov    0x10e0,%eax
 bed:	8d 04 40             	lea    (%eax,%eax,2),%eax
 bf0:	c7 04 c5 10 11 00 00 	movl   $0x3,0x1110(,%eax,8)
 bf7:	03 00 00 00 
      // let other thread to run 
      uthread_yield();
 bfb:	e8 30 fb ff ff       	call   730 <uthread_yield>

      // if thread still alive, loop over the join procedure again
      goto loop;
 c00:	eb a9                	jmp    bab <uthred_join+0x1b>
{
  int i;

  // if tid is not declared yet or is a negative number, error occured, return
  if(tid >= next_tid || tid < 0) {
    return -1;
 c02:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c07:	eb d4                	jmp    bdd <uthred_join+0x4d>
