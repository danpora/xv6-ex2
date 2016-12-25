
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
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
  11:	83 ec 08             	sub    $0x8,%esp
  14:	8b 31                	mov    (%ecx),%esi
  16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
  19:	83 fe 01             	cmp    $0x1,%esi
  1c:	7e 41                	jle    5f <main+0x5f>
  1e:	bb 01 00 00 00       	mov    $0x1,%ebx
  23:	eb 1b                	jmp    40 <main+0x40>
  25:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  28:	68 1c 0c 00 00       	push   $0xc1c
  2d:	ff 74 9f fc          	pushl  -0x4(%edi,%ebx,4)
  31:	68 1e 0c 00 00       	push   $0xc1e
  36:	6a 01                	push   $0x1
  38:	e8 e3 03 00 00       	call   420 <printf>
  3d:	83 c4 10             	add    $0x10,%esp
  40:	83 c3 01             	add    $0x1,%ebx
  43:	39 de                	cmp    %ebx,%esi
  45:	75 e1                	jne    28 <main+0x28>
  47:	68 ac 0c 00 00       	push   $0xcac
  4c:	ff 74 b7 fc          	pushl  -0x4(%edi,%esi,4)
  50:	68 1e 0c 00 00       	push   $0xc1e
  55:	6a 01                	push   $0x1
  57:	e8 c4 03 00 00       	call   420 <printf>
  5c:	83 c4 10             	add    $0x10,%esp
  exit();
  5f:	e8 4e 02 00 00       	call   2b2 <exit>
  64:	66 90                	xchg   %ax,%ax
  66:	66 90                	xchg   %ax,%ax
  68:	66 90                	xchg   %ax,%ax
  6a:	66 90                	xchg   %ax,%ax
  6c:	66 90                	xchg   %ax,%ax
  6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	53                   	push   %ebx
  74:	8b 45 08             	mov    0x8(%ebp),%eax
  77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  7a:	89 c2                	mov    %eax,%edx
  7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  80:	83 c1 01             	add    $0x1,%ecx
  83:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  87:	83 c2 01             	add    $0x1,%edx
  8a:	84 db                	test   %bl,%bl
  8c:	88 5a ff             	mov    %bl,-0x1(%edx)
  8f:	75 ef                	jne    80 <strcpy+0x10>
    ;
  return os;
}
  91:	5b                   	pop    %ebx
  92:	5d                   	pop    %ebp
  93:	c3                   	ret    
  94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	56                   	push   %esi
  a4:	53                   	push   %ebx
  a5:	8b 55 08             	mov    0x8(%ebp),%edx
  a8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ab:	0f b6 02             	movzbl (%edx),%eax
  ae:	0f b6 19             	movzbl (%ecx),%ebx
  b1:	84 c0                	test   %al,%al
  b3:	75 1e                	jne    d3 <strcmp+0x33>
  b5:	eb 29                	jmp    e0 <strcmp+0x40>
  b7:	89 f6                	mov    %esi,%esi
  b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  c0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  c6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  cd:	84 c0                	test   %al,%al
  cf:	74 0f                	je     e0 <strcmp+0x40>
  d1:	89 f1                	mov    %esi,%ecx
  d3:	38 d8                	cmp    %bl,%al
  d5:	74 e9                	je     c0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  d7:	29 d8                	sub    %ebx,%eax
}
  d9:	5b                   	pop    %ebx
  da:	5e                   	pop    %esi
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    
  dd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e2:	29 d8                	sub    %ebx,%eax
}
  e4:	5b                   	pop    %ebx
  e5:	5e                   	pop    %esi
  e6:	5d                   	pop    %ebp
  e7:	c3                   	ret    
  e8:	90                   	nop
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000f0 <strlen>:

uint
strlen(char *s)
{
  f0:	55                   	push   %ebp
  f1:	89 e5                	mov    %esp,%ebp
  f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  f6:	80 39 00             	cmpb   $0x0,(%ecx)
  f9:	74 12                	je     10d <strlen+0x1d>
  fb:	31 d2                	xor    %edx,%edx
  fd:	8d 76 00             	lea    0x0(%esi),%esi
 100:	83 c2 01             	add    $0x1,%edx
 103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 107:	89 d0                	mov    %edx,%eax
 109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 10d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 10f:	5d                   	pop    %ebp
 110:	c3                   	ret    
 111:	eb 0d                	jmp    120 <memset>
 113:	90                   	nop
 114:	90                   	nop
 115:	90                   	nop
 116:	90                   	nop
 117:	90                   	nop
 118:	90                   	nop
 119:	90                   	nop
 11a:	90                   	nop
 11b:	90                   	nop
 11c:	90                   	nop
 11d:	90                   	nop
 11e:	90                   	nop
 11f:	90                   	nop

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
 120:	55                   	push   %ebp
 121:	89 e5                	mov    %esp,%ebp
 123:	57                   	push   %edi
 124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 127:	8b 4d 10             	mov    0x10(%ebp),%ecx
 12a:	8b 45 0c             	mov    0xc(%ebp),%eax
 12d:	89 d7                	mov    %edx,%edi
 12f:	fc                   	cld    
 130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 132:	89 d0                	mov    %edx,%eax
 134:	5f                   	pop    %edi
 135:	5d                   	pop    %ebp
 136:	c3                   	ret    
 137:	89 f6                	mov    %esi,%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	8b 45 08             	mov    0x8(%ebp),%eax
 147:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 14a:	0f b6 10             	movzbl (%eax),%edx
 14d:	84 d2                	test   %dl,%dl
 14f:	74 1d                	je     16e <strchr+0x2e>
    if(*s == c)
 151:	38 d3                	cmp    %dl,%bl
 153:	89 d9                	mov    %ebx,%ecx
 155:	75 0d                	jne    164 <strchr+0x24>
 157:	eb 17                	jmp    170 <strchr+0x30>
 159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 160:	38 ca                	cmp    %cl,%dl
 162:	74 0c                	je     170 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 164:	83 c0 01             	add    $0x1,%eax
 167:	0f b6 10             	movzbl (%eax),%edx
 16a:	84 d2                	test   %dl,%dl
 16c:	75 f2                	jne    160 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 16e:	31 c0                	xor    %eax,%eax
}
 170:	5b                   	pop    %ebx
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    
 173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000180 <gets>:

char*
gets(char *buf, int max)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	56                   	push   %esi
 185:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 186:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 188:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 18b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18e:	eb 29                	jmp    1b9 <gets+0x39>
    cc = read(0, &c, 1);
 190:	83 ec 04             	sub    $0x4,%esp
 193:	6a 01                	push   $0x1
 195:	57                   	push   %edi
 196:	6a 00                	push   $0x0
 198:	e8 2d 01 00 00       	call   2ca <read>
    if(cc < 1)
 19d:	83 c4 10             	add    $0x10,%esp
 1a0:	85 c0                	test   %eax,%eax
 1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
 1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1a8:	8b 55 08             	mov    0x8(%ebp),%edx
 1ab:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 1ad:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1af:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1b3:	74 1b                	je     1d0 <gets+0x50>
 1b5:	3c 0d                	cmp    $0xd,%al
 1b7:	74 17                	je     1d0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1b9:	8d 5e 01             	lea    0x1(%esi),%ebx
 1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1bf:	7c cf                	jl     190 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1c1:	8b 45 08             	mov    0x8(%ebp),%eax
 1c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1cb:	5b                   	pop    %ebx
 1cc:	5e                   	pop    %esi
 1cd:	5f                   	pop    %edi
 1ce:	5d                   	pop    %ebp
 1cf:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1dc:	5b                   	pop    %ebx
 1dd:	5e                   	pop    %esi
 1de:	5f                   	pop    %edi
 1df:	5d                   	pop    %ebp
 1e0:	c3                   	ret    
 1e1:	eb 0d                	jmp    1f0 <stat>
 1e3:	90                   	nop
 1e4:	90                   	nop
 1e5:	90                   	nop
 1e6:	90                   	nop
 1e7:	90                   	nop
 1e8:	90                   	nop
 1e9:	90                   	nop
 1ea:	90                   	nop
 1eb:	90                   	nop
 1ec:	90                   	nop
 1ed:	90                   	nop
 1ee:	90                   	nop
 1ef:	90                   	nop

000001f0 <stat>:

int
stat(char *n, struct stat *st)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	56                   	push   %esi
 1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	83 ec 08             	sub    $0x8,%esp
 1f8:	6a 00                	push   $0x0
 1fa:	ff 75 08             	pushl  0x8(%ebp)
 1fd:	e8 f0 00 00 00       	call   2f2 <open>
  if(fd < 0)
 202:	83 c4 10             	add    $0x10,%esp
 205:	85 c0                	test   %eax,%eax
 207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 209:	83 ec 08             	sub    $0x8,%esp
 20c:	ff 75 0c             	pushl  0xc(%ebp)
 20f:	89 c3                	mov    %eax,%ebx
 211:	50                   	push   %eax
 212:	e8 f3 00 00 00       	call   30a <fstat>
 217:	89 c6                	mov    %eax,%esi
  close(fd);
 219:	89 1c 24             	mov    %ebx,(%esp)
 21c:	e8 b9 00 00 00       	call   2da <close>
  return r;
 221:	83 c4 10             	add    $0x10,%esp
 224:	89 f0                	mov    %esi,%eax
}
 226:	8d 65 f8             	lea    -0x8(%ebp),%esp
 229:	5b                   	pop    %ebx
 22a:	5e                   	pop    %esi
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
 22d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 230:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 235:	eb ef                	jmp    226 <stat+0x36>
 237:	89 f6                	mov    %esi,%esi
 239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 247:	0f be 11             	movsbl (%ecx),%edx
 24a:	8d 42 d0             	lea    -0x30(%edx),%eax
 24d:	3c 09                	cmp    $0x9,%al
 24f:	b8 00 00 00 00       	mov    $0x0,%eax
 254:	77 1f                	ja     275 <atoi+0x35>
 256:	8d 76 00             	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 260:	8d 04 80             	lea    (%eax,%eax,4),%eax
 263:	83 c1 01             	add    $0x1,%ecx
 266:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26a:	0f be 11             	movsbl (%ecx),%edx
 26d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 270:	80 fb 09             	cmp    $0x9,%bl
 273:	76 eb                	jbe    260 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 275:	5b                   	pop    %ebx
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    
 278:	90                   	nop
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 280:	55                   	push   %ebp
 281:	89 e5                	mov    %esp,%ebp
 283:	56                   	push   %esi
 284:	53                   	push   %ebx
 285:	8b 5d 10             	mov    0x10(%ebp),%ebx
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 28e:	85 db                	test   %ebx,%ebx
 290:	7e 14                	jle    2a6 <memmove+0x26>
 292:	31 d2                	xor    %edx,%edx
 294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 298:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 29c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 29f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a2:	39 da                	cmp    %ebx,%edx
 2a4:	75 f2                	jne    298 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2a6:	5b                   	pop    %ebx
 2a7:	5e                   	pop    %esi
 2a8:	5d                   	pop    %ebp
 2a9:	c3                   	ret    

000002aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2aa:	b8 01 00 00 00       	mov    $0x1,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <exit>:
SYSCALL(exit)
 2b2:	b8 02 00 00 00       	mov    $0x2,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <wait>:
SYSCALL(wait)
 2ba:	b8 03 00 00 00       	mov    $0x3,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <pipe>:
SYSCALL(pipe)
 2c2:	b8 04 00 00 00       	mov    $0x4,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <read>:
SYSCALL(read)
 2ca:	b8 05 00 00 00       	mov    $0x5,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <write>:
SYSCALL(write)
 2d2:	b8 10 00 00 00       	mov    $0x10,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <close>:
SYSCALL(close)
 2da:	b8 15 00 00 00       	mov    $0x15,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <kill>:
SYSCALL(kill)
 2e2:	b8 06 00 00 00       	mov    $0x6,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <exec>:
SYSCALL(exec)
 2ea:	b8 07 00 00 00       	mov    $0x7,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <open>:
SYSCALL(open)
 2f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <mknod>:
SYSCALL(mknod)
 2fa:	b8 11 00 00 00       	mov    $0x11,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <unlink>:
SYSCALL(unlink)
 302:	b8 12 00 00 00       	mov    $0x12,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <fstat>:
SYSCALL(fstat)
 30a:	b8 08 00 00 00       	mov    $0x8,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <link>:
SYSCALL(link)
 312:	b8 13 00 00 00       	mov    $0x13,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <mkdir>:
SYSCALL(mkdir)
 31a:	b8 14 00 00 00       	mov    $0x14,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <chdir>:
SYSCALL(chdir)
 322:	b8 09 00 00 00       	mov    $0x9,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <dup>:
SYSCALL(dup)
 32a:	b8 0a 00 00 00       	mov    $0xa,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <getpid>:
SYSCALL(getpid)
 332:	b8 0b 00 00 00       	mov    $0xb,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <sbrk>:
SYSCALL(sbrk)
 33a:	b8 0c 00 00 00       	mov    $0xc,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <sleep>:
SYSCALL(sleep)
 342:	b8 0d 00 00 00       	mov    $0xd,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <uptime>:
SYSCALL(uptime)
 34a:	b8 0e 00 00 00       	mov    $0xe,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <signal>:
/*pazit---------------------------------------------------*/
SYSCALL(signal)  
 352:	b8 16 00 00 00       	mov    $0x16,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <sigsend>:
SYSCALL(sigsend)  
 35a:	b8 17 00 00 00       	mov    $0x17,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <sigreturn>:
SYSCALL(sigreturn) 
 362:	b8 18 00 00 00       	mov    $0x18,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <alarm>:
SYSCALL(alarm)
 36a:	b8 19 00 00 00       	mov    $0x19,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    
 372:	66 90                	xchg   %ax,%ax
 374:	66 90                	xchg   %ax,%ax
 376:	66 90                	xchg   %ax,%ax
 378:	66 90                	xchg   %ax,%ax
 37a:	66 90                	xchg   %ax,%ax
 37c:	66 90                	xchg   %ax,%ax
 37e:	66 90                	xchg   %ax,%ax

00000380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	57                   	push   %edi
 384:	56                   	push   %esi
 385:	53                   	push   %ebx
 386:	89 c6                	mov    %eax,%esi
 388:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 38b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 38e:	85 db                	test   %ebx,%ebx
 390:	74 7e                	je     410 <printint+0x90>
 392:	89 d0                	mov    %edx,%eax
 394:	c1 e8 1f             	shr    $0x1f,%eax
 397:	84 c0                	test   %al,%al
 399:	74 75                	je     410 <printint+0x90>
    neg = 1;
    x = -xx;
 39b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 39d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 3a4:	f7 d8                	neg    %eax
 3a6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3a9:	31 ff                	xor    %edi,%edi
 3ab:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3ae:	89 ce                	mov    %ecx,%esi
 3b0:	eb 08                	jmp    3ba <printint+0x3a>
 3b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3b8:	89 cf                	mov    %ecx,%edi
 3ba:	31 d2                	xor    %edx,%edx
 3bc:	8d 4f 01             	lea    0x1(%edi),%ecx
 3bf:	f7 f6                	div    %esi
 3c1:	0f b6 92 2c 0c 00 00 	movzbl 0xc2c(%edx),%edx
  }while((x /= base) != 0);
 3c8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3ca:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 3cd:	75 e9                	jne    3b8 <printint+0x38>
  if(neg)
 3cf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3d2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 3d5:	85 c0                	test   %eax,%eax
 3d7:	74 08                	je     3e1 <printint+0x61>
    buf[i++] = '-';
 3d9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 3de:	8d 4f 02             	lea    0x2(%edi),%ecx
 3e1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 3e5:	8d 76 00             	lea    0x0(%esi),%esi
 3e8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3eb:	83 ec 04             	sub    $0x4,%esp
 3ee:	83 ef 01             	sub    $0x1,%edi
 3f1:	6a 01                	push   $0x1
 3f3:	53                   	push   %ebx
 3f4:	56                   	push   %esi
 3f5:	88 45 d7             	mov    %al,-0x29(%ebp)
 3f8:	e8 d5 fe ff ff       	call   2d2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 3fd:	83 c4 10             	add    $0x10,%esp
 400:	39 df                	cmp    %ebx,%edi
 402:	75 e4                	jne    3e8 <printint+0x68>
    putc(fd, buf[i]);
}
 404:	8d 65 f4             	lea    -0xc(%ebp),%esp
 407:	5b                   	pop    %ebx
 408:	5e                   	pop    %esi
 409:	5f                   	pop    %edi
 40a:	5d                   	pop    %ebp
 40b:	c3                   	ret    
 40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 410:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 412:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 419:	eb 8b                	jmp    3a6 <printint+0x26>
 41b:	90                   	nop
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000420 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	57                   	push   %edi
 424:	56                   	push   %esi
 425:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 426:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 429:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 42c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 42f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 432:	89 45 d0             	mov    %eax,-0x30(%ebp)
 435:	0f b6 1e             	movzbl (%esi),%ebx
 438:	83 c6 01             	add    $0x1,%esi
 43b:	84 db                	test   %bl,%bl
 43d:	0f 84 b0 00 00 00    	je     4f3 <printf+0xd3>
 443:	31 d2                	xor    %edx,%edx
 445:	eb 39                	jmp    480 <printf+0x60>
 447:	89 f6                	mov    %esi,%esi
 449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 450:	83 f8 25             	cmp    $0x25,%eax
 453:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 456:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 45b:	74 18                	je     475 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 45d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 460:	83 ec 04             	sub    $0x4,%esp
 463:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 466:	6a 01                	push   $0x1
 468:	50                   	push   %eax
 469:	57                   	push   %edi
 46a:	e8 63 fe ff ff       	call   2d2 <write>
 46f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 472:	83 c4 10             	add    $0x10,%esp
 475:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 478:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 47c:	84 db                	test   %bl,%bl
 47e:	74 73                	je     4f3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 480:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 482:	0f be cb             	movsbl %bl,%ecx
 485:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 488:	74 c6                	je     450 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 48a:	83 fa 25             	cmp    $0x25,%edx
 48d:	75 e6                	jne    475 <printf+0x55>
      if(c == 'd'){
 48f:	83 f8 64             	cmp    $0x64,%eax
 492:	0f 84 f8 00 00 00    	je     590 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 498:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 49e:	83 f9 70             	cmp    $0x70,%ecx
 4a1:	74 5d                	je     500 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4a3:	83 f8 73             	cmp    $0x73,%eax
 4a6:	0f 84 84 00 00 00    	je     530 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4ac:	83 f8 63             	cmp    $0x63,%eax
 4af:	0f 84 ea 00 00 00    	je     59f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4b5:	83 f8 25             	cmp    $0x25,%eax
 4b8:	0f 84 c2 00 00 00    	je     580 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4be:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4c1:	83 ec 04             	sub    $0x4,%esp
 4c4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4c8:	6a 01                	push   $0x1
 4ca:	50                   	push   %eax
 4cb:	57                   	push   %edi
 4cc:	e8 01 fe ff ff       	call   2d2 <write>
 4d1:	83 c4 0c             	add    $0xc,%esp
 4d4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4d7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 4da:	6a 01                	push   $0x1
 4dc:	50                   	push   %eax
 4dd:	57                   	push   %edi
 4de:	83 c6 01             	add    $0x1,%esi
 4e1:	e8 ec fd ff ff       	call   2d2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4e6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4ea:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4ed:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4ef:	84 db                	test   %bl,%bl
 4f1:	75 8d                	jne    480 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 4f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4f6:	5b                   	pop    %ebx
 4f7:	5e                   	pop    %esi
 4f8:	5f                   	pop    %edi
 4f9:	5d                   	pop    %ebp
 4fa:	c3                   	ret    
 4fb:	90                   	nop
 4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 500:	83 ec 0c             	sub    $0xc,%esp
 503:	b9 10 00 00 00       	mov    $0x10,%ecx
 508:	6a 00                	push   $0x0
 50a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 50d:	89 f8                	mov    %edi,%eax
 50f:	8b 13                	mov    (%ebx),%edx
 511:	e8 6a fe ff ff       	call   380 <printint>
        ap++;
 516:	89 d8                	mov    %ebx,%eax
 518:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 51b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 51d:	83 c0 04             	add    $0x4,%eax
 520:	89 45 d0             	mov    %eax,-0x30(%ebp)
 523:	e9 4d ff ff ff       	jmp    475 <printf+0x55>
 528:	90                   	nop
 529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 530:	8b 45 d0             	mov    -0x30(%ebp),%eax
 533:	8b 18                	mov    (%eax),%ebx
        ap++;
 535:	83 c0 04             	add    $0x4,%eax
 538:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 53b:	b8 23 0c 00 00       	mov    $0xc23,%eax
 540:	85 db                	test   %ebx,%ebx
 542:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 545:	0f b6 03             	movzbl (%ebx),%eax
 548:	84 c0                	test   %al,%al
 54a:	74 23                	je     56f <printf+0x14f>
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 550:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 553:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 556:	83 ec 04             	sub    $0x4,%esp
 559:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 55b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 55e:	50                   	push   %eax
 55f:	57                   	push   %edi
 560:	e8 6d fd ff ff       	call   2d2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 565:	0f b6 03             	movzbl (%ebx),%eax
 568:	83 c4 10             	add    $0x10,%esp
 56b:	84 c0                	test   %al,%al
 56d:	75 e1                	jne    550 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 56f:	31 d2                	xor    %edx,%edx
 571:	e9 ff fe ff ff       	jmp    475 <printf+0x55>
 576:	8d 76 00             	lea    0x0(%esi),%esi
 579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 580:	83 ec 04             	sub    $0x4,%esp
 583:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 586:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 589:	6a 01                	push   $0x1
 58b:	e9 4c ff ff ff       	jmp    4dc <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 590:	83 ec 0c             	sub    $0xc,%esp
 593:	b9 0a 00 00 00       	mov    $0xa,%ecx
 598:	6a 01                	push   $0x1
 59a:	e9 6b ff ff ff       	jmp    50a <printf+0xea>
 59f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5a2:	83 ec 04             	sub    $0x4,%esp
 5a5:	8b 03                	mov    (%ebx),%eax
 5a7:	6a 01                	push   $0x1
 5a9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 5ac:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5af:	50                   	push   %eax
 5b0:	57                   	push   %edi
 5b1:	e8 1c fd ff ff       	call   2d2 <write>
 5b6:	e9 5b ff ff ff       	jmp    516 <printf+0xf6>
 5bb:	66 90                	xchg   %ax,%ax
 5bd:	66 90                	xchg   %ax,%ax
 5bf:	90                   	nop

000005c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5c1:	a1 c0 10 00 00       	mov    0x10c0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c6:	89 e5                	mov    %esp,%ebp
 5c8:	57                   	push   %edi
 5c9:	56                   	push   %esi
 5ca:	53                   	push   %ebx
 5cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ce:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5d0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d3:	39 c8                	cmp    %ecx,%eax
 5d5:	73 19                	jae    5f0 <free+0x30>
 5d7:	89 f6                	mov    %esi,%esi
 5d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 5e0:	39 d1                	cmp    %edx,%ecx
 5e2:	72 1c                	jb     600 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e4:	39 d0                	cmp    %edx,%eax
 5e6:	73 18                	jae    600 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ea:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ec:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ee:	72 f0                	jb     5e0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f0:	39 d0                	cmp    %edx,%eax
 5f2:	72 f4                	jb     5e8 <free+0x28>
 5f4:	39 d1                	cmp    %edx,%ecx
 5f6:	73 f0                	jae    5e8 <free+0x28>
 5f8:	90                   	nop
 5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 600:	8b 73 fc             	mov    -0x4(%ebx),%esi
 603:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 606:	39 d7                	cmp    %edx,%edi
 608:	74 19                	je     623 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 60a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 60d:	8b 50 04             	mov    0x4(%eax),%edx
 610:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 613:	39 f1                	cmp    %esi,%ecx
 615:	74 23                	je     63a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 617:	89 08                	mov    %ecx,(%eax)
  freep = p;
 619:	a3 c0 10 00 00       	mov    %eax,0x10c0
}
 61e:	5b                   	pop    %ebx
 61f:	5e                   	pop    %esi
 620:	5f                   	pop    %edi
 621:	5d                   	pop    %ebp
 622:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 623:	03 72 04             	add    0x4(%edx),%esi
 626:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 629:	8b 10                	mov    (%eax),%edx
 62b:	8b 12                	mov    (%edx),%edx
 62d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 630:	8b 50 04             	mov    0x4(%eax),%edx
 633:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 636:	39 f1                	cmp    %esi,%ecx
 638:	75 dd                	jne    617 <free+0x57>
    p->s.size += bp->s.size;
 63a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 63d:	a3 c0 10 00 00       	mov    %eax,0x10c0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 642:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 645:	8b 53 f8             	mov    -0x8(%ebx),%edx
 648:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 64a:	5b                   	pop    %ebx
 64b:	5e                   	pop    %esi
 64c:	5f                   	pop    %edi
 64d:	5d                   	pop    %ebp
 64e:	c3                   	ret    
 64f:	90                   	nop

00000650 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	57                   	push   %edi
 654:	56                   	push   %esi
 655:	53                   	push   %ebx
 656:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 659:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 65c:	8b 15 c0 10 00 00    	mov    0x10c0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 662:	8d 78 07             	lea    0x7(%eax),%edi
 665:	c1 ef 03             	shr    $0x3,%edi
 668:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 66b:	85 d2                	test   %edx,%edx
 66d:	0f 84 a3 00 00 00    	je     716 <malloc+0xc6>
 673:	8b 02                	mov    (%edx),%eax
 675:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 678:	39 cf                	cmp    %ecx,%edi
 67a:	76 74                	jbe    6f0 <malloc+0xa0>
 67c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 682:	be 00 10 00 00       	mov    $0x1000,%esi
 687:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 68e:	0f 43 f7             	cmovae %edi,%esi
 691:	ba 00 80 00 00       	mov    $0x8000,%edx
 696:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 69c:	0f 46 da             	cmovbe %edx,%ebx
 69f:	eb 10                	jmp    6b1 <malloc+0x61>
 6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6aa:	8b 48 04             	mov    0x4(%eax),%ecx
 6ad:	39 cf                	cmp    %ecx,%edi
 6af:	76 3f                	jbe    6f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6b1:	39 05 c0 10 00 00    	cmp    %eax,0x10c0
 6b7:	89 c2                	mov    %eax,%edx
 6b9:	75 ed                	jne    6a8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6bb:	83 ec 0c             	sub    $0xc,%esp
 6be:	53                   	push   %ebx
 6bf:	e8 76 fc ff ff       	call   33a <sbrk>
  if(p == (char*)-1)
 6c4:	83 c4 10             	add    $0x10,%esp
 6c7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6ca:	74 1c                	je     6e8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6cc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 6cf:	83 ec 0c             	sub    $0xc,%esp
 6d2:	83 c0 08             	add    $0x8,%eax
 6d5:	50                   	push   %eax
 6d6:	e8 e5 fe ff ff       	call   5c0 <free>
  return freep;
 6db:	8b 15 c0 10 00 00    	mov    0x10c0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 6e1:	83 c4 10             	add    $0x10,%esp
 6e4:	85 d2                	test   %edx,%edx
 6e6:	75 c0                	jne    6a8 <malloc+0x58>
        return 0;
 6e8:	31 c0                	xor    %eax,%eax
 6ea:	eb 1c                	jmp    708 <malloc+0xb8>
 6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 6f0:	39 cf                	cmp    %ecx,%edi
 6f2:	74 1c                	je     710 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 6f4:	29 f9                	sub    %edi,%ecx
 6f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6fc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 6ff:	89 15 c0 10 00 00    	mov    %edx,0x10c0
      return (void*)(p + 1);
 705:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 708:	8d 65 f4             	lea    -0xc(%ebp),%esp
 70b:	5b                   	pop    %ebx
 70c:	5e                   	pop    %esi
 70d:	5f                   	pop    %edi
 70e:	5d                   	pop    %ebp
 70f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 710:	8b 08                	mov    (%eax),%ecx
 712:	89 0a                	mov    %ecx,(%edx)
 714:	eb e9                	jmp    6ff <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 716:	c7 05 c0 10 00 00 c4 	movl   $0x10c4,0x10c0
 71d:	10 00 00 
 720:	c7 05 c4 10 00 00 c4 	movl   $0x10c4,0x10c4
 727:	10 00 00 
    base.s.size = 0;
 72a:	b8 c4 10 00 00       	mov    $0x10c4,%eax
 72f:	c7 05 c8 10 00 00 00 	movl   $0x0,0x10c8
 736:	00 00 00 
 739:	e9 3e ff ff ff       	jmp    67c <malloc+0x2c>
 73e:	66 90                	xchg   %ax,%ax

00000740 <uthread_yield>:
  exit();
}

void 
uthread_yield(void)
{
 740:	55                   	push   %ebp
 741:	89 e5                	mov    %esp,%ebp
 743:	57                   	push   %edi
 744:	56                   	push   %esi
 745:	53                   	push   %ebx
 746:	83 ec 28             	sub    $0x28,%esp
  // switch alarm(0) to cancel thread switching while yielding 
  alarm(0);
 749:	6a 00                	push   $0x0
 74b:	e8 1a fc ff ff       	call   36a <alarm>

  // if current thread is running (most cases), the thread didn't finisht its job so turn his state to RUNNABLE
  if (uthread_pool[c_uthread_index].state == RUNNING) {
 750:	a1 e0 10 00 00       	mov    0x10e0,%eax
 755:	83 c4 10             	add    $0x10,%esp
 758:	8d 14 40             	lea    (%eax,%eax,2),%edx
 75b:	8d 14 d5 00 11 00 00 	lea    0x1100(,%edx,8),%edx
 762:	83 7a 10 01          	cmpl   $0x1,0x10(%edx)
 766:	0f 84 54 01 00 00    	je     8c0 <uthread_yield+0x180>
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
 76c:	8d 04 40             	lea    (%eax,%eax,2),%eax
  asm("movl %%ebp, %0;" : "=r" (uthread_pool[c_uthread_index].ebp));

  // load the new thread

  // pick the next thread index
  c_uthread_index++;
 76f:	83 05 e0 10 00 00 01 	addl   $0x1,0x10e0
 776:	bb 10 11 00 00       	mov    $0x1110,%ebx
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
 77b:	89 e2                	mov    %esp,%edx
 77d:	8d 04 c5 00 11 00 00 	lea    0x1100(,%eax,8),%eax

  // ************** lottery scheduler mechanism ******************* //

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
 784:	c7 05 b0 11 00 00 ff 	movl   $0xffffffff,0x11b0
 78b:	ff ff ff 
 78e:	89 de                	mov    %ebx,%esi
 790:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
 794:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 799:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
 79e:	89 50 04             	mov    %edx,0x4(%eax)
  asm("movl %%ebp, %0;" : "=r" (uthread_pool[c_uthread_index].ebp));
 7a1:	89 ea                	mov    %ebp,%edx
 7a3:	89 50 08             	mov    %edx,0x8(%eax)
 7a6:	8d 76 00             	lea    0x0(%esi),%esi
 7a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
 7b0:	8b 06                	mov    (%esi),%eax
 7b2:	85 c0                	test   %eax,%eax
 7b4:	0f 95 c2             	setne  %dl
 7b7:	83 f8 03             	cmp    $0x3,%eax
 7ba:	0f 95 c0             	setne  %al
 7bd:	20 d0                	and    %dl,%al
 7bf:	74 0a                	je     7cb <uthread_yield+0x8b>
      current_ticket_num += uthread_pool[j].ntickets;
 7c1:	8b 7e 04             	mov    0x4(%esi),%edi
 7c4:	88 45 e7             	mov    %al,-0x19(%ebp)
 7c7:	01 cf                	add    %ecx,%edi
 7c9:	89 f9                	mov    %edi,%ecx
 7cb:	83 c6 18             	add    $0x18,%esi
  // ************** lottery scheduler mechanism ******************* //

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
 7ce:	81 fe b8 11 00 00    	cmp    $0x11b8,%esi
 7d4:	75 da                	jne    7b0 <uthread_yield+0x70>
 7d6:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
 7da:	0f 85 ec 00 00 00    	jne    8cc <uthread_yield+0x18c>

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 7e0:	69 05 b8 10 00 00 0d 	imul   $0x19660d,0x10b8,%eax
 7e7:	66 19 00 
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
      current_ticket_num += uthread_pool[j].ntickets;
  }

  // generate a random number between 0 and current_ticket_num
  randomTicket = rand() % current_ticket_num;
 7ea:	31 d2                	xor    %edx,%edx

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
 7ec:	83 ec 04             	sub    $0x4,%esp
 7ef:	51                   	push   %ecx
 7f0:	68 3d 0c 00 00       	push   $0xc3d
 7f5:	6a 01                	push   $0x1

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 7f7:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
 7fc:	a3 b8 10 00 00       	mov    %eax,0x10b8
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
      current_ticket_num += uthread_pool[j].ntickets;
  }

  // generate a random number between 0 and current_ticket_num
  randomTicket = rand() % current_ticket_num;
 801:	f7 f1                	div    %ecx
 803:	89 d6                	mov    %edx,%esi

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
 805:	e8 16 fc ff ff       	call   420 <printf>
  printf(1,"randomTicket=%d\n", randomTicket);
 80a:	83 c4 0c             	add    $0xc,%esp
 80d:	56                   	push   %esi
 80e:	68 54 0c 00 00       	push   $0xc54
 813:	6a 01                	push   $0x1
 815:	e8 06 fc ff ff       	call   420 <printf>

  // set the choosen order thread to run
  choosen = randomTicket / NTICKET;
 81a:	89 f0                	mov    %esi,%eax
 81c:	ba 67 66 66 66       	mov    $0x66666667,%edx
 821:	c1 fe 1f             	sar    $0x1f,%esi
 824:	f7 ea                	imul   %edx
 826:	83 c4 10             	add    $0x10,%esp

  // pick the index of choosen thread
  int chooseCount = -1;
 829:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  for(j = 0; j < MAX_THREADS; ++j) {
 82e:	31 c0                	xor    %eax,%eax

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
  printf(1,"randomTicket=%d\n", randomTicket);

  // set the choosen order thread to run
  choosen = randomTicket / NTICKET;
 830:	d1 fa                	sar    %edx
 832:	29 f2                	sub    %esi,%edx
 834:	89 15 ac 11 00 00    	mov    %edx,0x11ac
 83a:	eb 0f                	jmp    84b <uthread_yield+0x10b>
 83c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // pick the index of choosen thread
  int chooseCount = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
 840:	83 c0 01             	add    $0x1,%eax
 843:	83 c3 18             	add    $0x18,%ebx
 846:	83 f8 07             	cmp    $0x7,%eax
 849:	74 15                	je     860 <uthread_yield+0x120>
    if(uthread_pool[j].state == RUNNABLE) {
 84b:	83 3b 02             	cmpl   $0x2,(%ebx)
 84e:	75 f0                	jne    840 <uthread_yield+0x100>
      chooseCount++;
 850:	83 c1 01             	add    $0x1,%ecx
      if (choosen == chooseCount)
 853:	39 ca                	cmp    %ecx,%edx
 855:	75 e9                	jne    840 <uthread_yield+0x100>
 857:	89 f6                	mov    %esi,%esi
 859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        break;
    }
  }

  // set current thread to the lottery chosen one
  c_uthread_index = j;
 860:	a3 e0 10 00 00       	mov    %eax,0x10e0

  // ****************************************************************** //

  // current switched thread is move to RUNNING mode, next to be execute
  uthread_pool[c_uthread_index].state = RUNNING;
 865:	8d 04 40             	lea    (%eax,%eax,2),%eax
 868:	8d 04 c5 00 11 00 00 	lea    0x1100(,%eax,8),%eax


  // if esp is null, thread is running its first time, so we have to load a functio to it 
  if(uthread_pool[c_uthread_index].esp == 0) {
 86f:	8b 50 04             	mov    0x4(%eax),%edx
  c_uthread_index = j;

  // ****************************************************************** //

  // current switched thread is move to RUNNING mode, next to be execute
  uthread_pool[c_uthread_index].state = RUNNING;
 872:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)


  // if esp is null, thread is running its first time, so we have to load a functio to it 
  if(uthread_pool[c_uthread_index].esp == 0) {
 879:	85 d2                	test   %edx,%edx
 87b:	75 23                	jne    8a0 <uthread_yield+0x160>
    asm("movl %0, %%esp;" : : "r" (uthread_pool[c_uthread_index].stack + STACK_SIZE - 3*sizeof(int)));
 87d:	8b 40 0c             	mov    0xc(%eax),%eax
 880:	05 f4 0f 00 00       	add    $0xff4,%eax
 885:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].stack + STACK_SIZE - 3*sizeof(int)));
 887:	89 c5                	mov    %eax,%ebp
    // jump to execute function to run the thread own function
    asm("jmp *%0;" : : "r" (execute_thread));
 889:	b8 50 0b 00 00       	mov    $0xb50,%eax
 88e:	ff e0                	jmp    *%eax
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].ebp));

    // reset alarm
    alarm(UTHREAD_QUANTA);
  }
}
 890:	8d 65 f4             	lea    -0xc(%ebp),%esp
 893:	5b                   	pop    %ebx
 894:	5e                   	pop    %esi
 895:	5f                   	pop    %edi
 896:	5d                   	pop    %ebp
 897:	c3                   	ret    
 898:	90                   	nop
 899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // jump to execute function to run the thread own function
    asm("jmp *%0;" : : "r" (execute_thread));
  } 
  else  {
    // restore thread stack
    asm("movl %0, %%esp;" : : "r" (uthread_pool[c_uthread_index].esp));
 8a0:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].ebp));
 8a2:	8b 40 08             	mov    0x8(%eax),%eax
 8a5:	89 c5                	mov    %eax,%ebp

    // reset alarm
    alarm(UTHREAD_QUANTA);
 8a7:	83 ec 0c             	sub    $0xc,%esp
 8aa:	6a 05                	push   $0x5
 8ac:	e8 b9 fa ff ff       	call   36a <alarm>
 8b1:	83 c4 10             	add    $0x10,%esp
  }
}
 8b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8b7:	5b                   	pop    %ebx
 8b8:	5e                   	pop    %esi
 8b9:	5f                   	pop    %edi
 8ba:	5d                   	pop    %ebp
 8bb:	c3                   	ret    
 8bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  // switch alarm(0) to cancel thread switching while yielding 
  alarm(0);

  // if current thread is running (most cases), the thread didn't finisht its job so turn his state to RUNNABLE
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
 8c0:	c7 42 10 02 00 00 00 	movl   $0x2,0x10(%edx)
 8c7:	e9 a0 fe ff ff       	jmp    76c <uthread_yield+0x2c>
 8cc:	89 3d b0 11 00 00    	mov    %edi,0x11b0
 8d2:	e9 09 ff ff ff       	jmp    7e0 <uthread_yield+0xa0>
 8d7:	89 f6                	mov    %esi,%esi
 8d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008e0 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 8e0:	69 05 b8 10 00 00 0d 	imul   $0x19660d,0x10b8,%eax
 8e7:	66 19 00 
//***************************************************************************************//

unsigned long randstate = 1;
unsigned int
rand()
{
 8ea:	55                   	push   %ebp
 8eb:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
 8ed:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 8ee:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
 8f3:	a3 b8 10 00 00       	mov    %eax,0x10b8
  return randstate;
}
 8f8:	c3                   	ret    
 8f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000900 <uthread_init>:
  uthread_exit();
}

int
 uthread_init()
{
 900:	55                   	push   %ebp
 901:	89 e5                	mov    %esp,%ebp
 903:	83 ec 10             	sub    $0x10,%esp
  printf(1, "** INIT USER LEVEL THREAD **\n");
 906:	68 65 0c 00 00       	push   $0xc65
 90b:	6a 01                	push   $0x1
 90d:	e8 0e fb ff ff       	call   420 <printf>
 912:	b8 10 11 00 00       	mov    $0x1110,%eax
 917:	83 c4 10             	add    $0x10,%esp
 91a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  // set all threads state to FREE - init pool
  int i;
  for(i = 0; i < MAX_THREADS; ++i) {
    uthread_pool[i].state = FREE;
 920:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    uthread_pool[i].ntickets = NTICKET;
 926:	c7 40 04 05 00 00 00 	movl   $0x5,0x4(%eax)
 92d:	83 c0 18             	add    $0x18,%eax
 uthread_init()
{
  printf(1, "** INIT USER LEVEL THREAD **\n");
  // set all threads state to FREE - init pool
  int i;
  for(i = 0; i < MAX_THREADS; ++i) {
 930:	3d b8 11 00 00       	cmp    $0x11b8,%eax
 935:	75 e9                	jne    920 <uthread_init+0x20>
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 937:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < MAX_THREADS; ++i) {
    uthread_pool[i].state = FREE;
    uthread_pool[i].ntickets = NTICKET;
  }

  next_tid = 1;
 93a:	c7 05 a8 11 00 00 01 	movl   $0x1,0x11a8
 941:	00 00 00 

  // initialize main thread
  c_uthread_index = 0;
 944:	c7 05 e0 10 00 00 00 	movl   $0x0,0x10e0
 94b:	00 00 00 
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 94e:	68 40 07 00 00       	push   $0x740
 953:	6a 0e                	push   $0xe
  next_tid = 1;

  // initialize main thread
  c_uthread_index = 0;
  // set tid and stack to null
  uthread_pool[c_uthread_index].tid = 0;
 955:	c7 05 00 11 00 00 00 	movl   $0x0,0x1100
 95c:	00 00 00 
  uthread_pool[c_uthread_index].stack = 0; 
 95f:	c7 05 0c 11 00 00 00 	movl   $0x0,0x110c
 966:	00 00 00 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;
 969:	c7 05 10 11 00 00 01 	movl   $0x1,0x1110
 970:	00 00 00 

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 973:	e8 da f9 ff ff       	call   352 <signal>
 978:	83 c4 10             	add    $0x10,%esp
 97b:	85 c0                	test   %eax,%eax
    // case signal error
    return -1;
 97d:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 982:	75 0f                	jne    993 <uthread_init+0x93>
    // case signal error
    return -1;
  }

  // execute the alarm syscall with UTHREAD_QUANTA
  alarm(UTHREAD_QUANTA);
 984:	83 ec 0c             	sub    $0xc,%esp
 987:	6a 05                	push   $0x5
 989:	e8 dc f9 ff ff       	call   36a <alarm>

  return 0;
 98e:	83 c4 10             	add    $0x10,%esp
 991:	31 d2                	xor    %edx,%edx
}
 993:	89 d0                	mov    %edx,%eax
 995:	c9                   	leave  
 996:	c3                   	ret    
 997:	89 f6                	mov    %esi,%esi
 999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009a0 <uthread_create>:

int 
uthread_create(void (*func)(void *), void* arg)
{
 9a0:	55                   	push   %ebp
 9a1:	89 e5                	mov    %esp,%ebp
 9a3:	56                   	push   %esi
 9a4:	53                   	push   %ebx
  printf(1, "start thread creation \n");
 9a5:	83 ec 08             	sub    $0x8,%esp
 9a8:	68 83 0c 00 00       	push   $0xc83
 9ad:	6a 01                	push   $0x1
 9af:	e8 6c fa ff ff       	call   420 <printf>

  // local thread pool index
  int i;

  // disable thread switching
  alarm(0);
 9b4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 9bb:	e8 aa f9 ff ff       	call   36a <alarm>

  printf(1, "uthread_create after alarm(0) \n");
 9c0:	5b                   	pop    %ebx
 9c1:	5e                   	pop    %esi
 9c2:	68 b0 0c 00 00       	push   $0xcb0
 9c7:	6a 01                	push   $0x1
 9c9:	e8 52 fa ff ff       	call   420 <printf>
 9ce:	ba 10 11 00 00       	mov    $0x1110,%edx
 9d3:	83 c4 10             	add    $0x10,%esp

  // search for free thread to load
  for(i = 0; i < MAX_THREADS; ++i) {
 9d6:	31 c0                	xor    %eax,%eax
 9d8:	90                   	nop
 9d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if (uthread_pool[i].state == FREE) {
 9e0:	8b 0a                	mov    (%edx),%ecx
 9e2:	85 c9                	test   %ecx,%ecx
 9e4:	74 2a                	je     a10 <uthread_create+0x70>
  alarm(0);

  printf(1, "uthread_create after alarm(0) \n");

  // search for free thread to load
  for(i = 0; i < MAX_THREADS; ++i) {
 9e6:	83 c0 01             	add    $0x1,%eax
 9e9:	83 c2 18             	add    $0x18,%edx
 9ec:	83 f8 07             	cmp    $0x7,%eax
 9ef:	75 ef                	jne    9e0 <uthread_create+0x40>
    }
  }

  // case no free threads available
  // enable thread switching
  alarm(UTHREAD_QUANTA);
 9f1:	83 ec 0c             	sub    $0xc,%esp
 9f4:	6a 05                	push   $0x5
 9f6:	e8 6f f9 ff ff       	call   36a <alarm>
  return -1;
 9fb:	83 c4 10             	add    $0x10,%esp
  // enable thread switching
  printf(1, "creation method: returning.. \n");
  alarm(UTHREAD_QUANTA);

  return uthread_pool[i].tid;
}
 9fe:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }

  // case no free threads available
  // enable thread switching
  alarm(UTHREAD_QUANTA);
  return -1;
 a01:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  // enable thread switching
  printf(1, "creation method: returning.. \n");
  alarm(UTHREAD_QUANTA);

  return uthread_pool[i].tid;
}
 a06:	5b                   	pop    %ebx
 a07:	5e                   	pop    %esi
 a08:	5d                   	pop    %ebp
 a09:	c3                   	ret    
 a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  alarm(UTHREAD_QUANTA);
  return -1;

load_t:
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
 a10:	8b 15 a8 11 00 00    	mov    0x11a8,%edx
 a16:	8d 1c 40             	lea    (%eax,%eax,2),%ebx
  // update next tid
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
 a19:	83 ec 0c             	sub    $0xc,%esp
 a1c:	68 00 10 00 00       	push   $0x1000
  alarm(UTHREAD_QUANTA);
  return -1;

load_t:
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
 a21:	c1 e3 03             	shl    $0x3,%ebx
 a24:	89 93 00 11 00 00    	mov    %edx,0x1100(%ebx)
  // update next tid
  next_tid++;
 a2a:	83 c2 01             	add    $0x1,%edx
 a2d:	89 15 a8 11 00 00    	mov    %edx,0x11a8
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
 a33:	e8 18 fc ff ff       	call   650 <malloc>

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
 a38:	8b 55 08             	mov    0x8(%ebp),%edx
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
 a3b:	c7 80 f4 0f 00 00 00 	movl   $0x0,0xff4(%eax)
 a42:	00 00 00 
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
  // update next tid
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
 a45:	89 83 0c 11 00 00    	mov    %eax,0x110c(%ebx)
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - sizeof(int)) ) = (int)arg;

  // set thread state to RUNNABLE, ready to run
  uthread_pool[i].state = RUNNABLE;
 a4b:	c7 83 10 11 00 00 02 	movl   $0x2,0x1110(%ebx)
 a52:	00 00 00 

  // set esp and ebp to null, while thread is not in RUNNING state yet
  uthread_pool[i].esp = 0;
 a55:	c7 83 04 11 00 00 00 	movl   $0x0,0x1104(%ebx)
 a5c:	00 00 00 
  uthread_pool[i].ebp = 0;
 a5f:	c7 83 08 11 00 00 00 	movl   $0x0,0x1108(%ebx)
 a66:	00 00 00 
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
 a69:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - sizeof(int)) ) = (int)arg;
 a6f:	8b 55 0c             	mov    0xc(%ebp),%edx
 a72:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)
  uthread_pool[i].esp = 0;
  uthread_pool[i].ebp = 0;
  

  // enable thread switching
  printf(1, "creation method: returning.. \n");
 a78:	58                   	pop    %eax
 a79:	5a                   	pop    %edx
 a7a:	68 d0 0c 00 00       	push   $0xcd0
 a7f:	6a 01                	push   $0x1
 a81:	e8 9a f9 ff ff       	call   420 <printf>
  alarm(UTHREAD_QUANTA);
 a86:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 a8d:	e8 d8 f8 ff ff       	call   36a <alarm>

  return uthread_pool[i].tid;
 a92:	8b 83 00 11 00 00    	mov    0x1100(%ebx),%eax
 a98:	83 c4 10             	add    $0x10,%esp
}
 a9b:	8d 65 f8             	lea    -0x8(%ebp),%esp
 a9e:	5b                   	pop    %ebx
 a9f:	5e                   	pop    %esi
 aa0:	5d                   	pop    %ebp
 aa1:	c3                   	ret    
 aa2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ab0 <uthread_exit>:

void 
uthread_exit(void)
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	53                   	push   %ebx
 ab4:	83 ec 10             	sub    $0x10,%esp

  int i;

  // disable thread switching
  alarm(0);
 ab7:	6a 00                	push   $0x0
 ab9:	e8 ac f8 ff ff       	call   36a <alarm>

  // deallocate thread memory
  if (uthread_pool[c_uthread_index].stack != 0) {
 abe:	a1 e0 10 00 00       	mov    0x10e0,%eax
 ac3:	83 c4 10             	add    $0x10,%esp
 ac6:	8d 14 40             	lea    (%eax,%eax,2),%edx
 ac9:	8b 14 d5 0c 11 00 00 	mov    0x110c(,%edx,8),%edx
 ad0:	85 d2                	test   %edx,%edx
 ad2:	74 11                	je     ae5 <uthread_exit+0x35>
    free(uthread_pool[c_uthread_index].stack);
 ad4:	83 ec 0c             	sub    $0xc,%esp
 ad7:	52                   	push   %edx
 ad8:	e8 e3 fa ff ff       	call   5c0 <free>
 add:	a1 e0 10 00 00       	mov    0x10e0,%eax
 ae2:	83 c4 10             	add    $0x10,%esp
  }

  // deallocate thread from thread pool
  uthread_pool[c_uthread_index].state = FREE;
 ae5:	8d 04 40             	lea    (%eax,%eax,2),%eax
 ae8:	bb 10 11 00 00       	mov    $0x1110,%ebx
 aed:	c7 04 c5 10 11 00 00 	movl   $0x0,0x1110(,%eax,8)
 af4:	00 00 00 00 
 af8:	89 d8                	mov    %ebx,%eax
 afa:	eb 0e                	jmp    b0a <uthread_exit+0x5a>
 afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b00:	83 c0 18             	add    $0x18,%eax

  // if any thread is waiting for current thread, get them back to RUNNABLE state
  for(i = 0; i < MAX_THREADS; ++i) {
 b03:	3d b8 11 00 00       	cmp    $0x11b8,%eax
 b08:	74 26                	je     b30 <uthread_exit+0x80>
    if (uthread_pool[i].state == SLEEP) {
 b0a:	83 38 03             	cmpl   $0x3,(%eax)
 b0d:	75 f1                	jne    b00 <uthread_exit+0x50>
      uthread_pool[i].state = RUNNABLE;
 b0f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
 b15:	eb e9                	jmp    b00 <uthread_exit+0x50>
 b17:	89 f6                	mov    %esi,%esi
 b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 b20:	83 c3 18             	add    $0x18,%ebx

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
    if (uthread_pool[i].state != FREE) {
      // found thread that is eligible to run, yield
      uthread_yield();
 b23:	e8 18 fc ff ff       	call   740 <uthread_yield>
      uthread_pool[i].state = RUNNABLE;
    }
  }

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
 b28:	81 fb b8 11 00 00    	cmp    $0x11b8,%ebx
 b2e:	74 11                	je     b41 <uthread_exit+0x91>
    if (uthread_pool[i].state != FREE) {
 b30:	8b 03                	mov    (%ebx),%eax
 b32:	85 c0                	test   %eax,%eax
 b34:	75 ea                	jne    b20 <uthread_exit+0x70>
 b36:	83 c3 18             	add    $0x18,%ebx
      uthread_pool[i].state = RUNNABLE;
    }
  }

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
 b39:	81 fb b8 11 00 00    	cmp    $0x11b8,%ebx
 b3f:	75 ef                	jne    b30 <uthread_exit+0x80>
      // found thread that is eligible to run, yield
      uthread_yield();
    }
  }
  // no ready to run threads, exit
  exit();
 b41:	e8 6c f7 ff ff       	call   2b2 <exit>
 b46:	8d 76 00             	lea    0x0(%esi),%esi
 b49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b50 <execute_thread>:
int current_ticket_num;
// choosen lottery thread
int choosen;

static void 
execute_thread(void (*start_func)(void *), void* arg) {
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	83 ec 10             	sub    $0x10,%esp
  printf(1, "+++RUN THREAD+++ \n");
 b56:	68 9b 0c 00 00       	push   $0xc9b
 b5b:	6a 01                	push   $0x1
 b5d:	e8 be f8 ff ff       	call   420 <printf>
  alarm(UTHREAD_QUANTA);
 b62:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 b69:	e8 fc f7 ff ff       	call   36a <alarm>
  start_func(arg);
 b6e:	58                   	pop    %eax
 b6f:	ff 75 0c             	pushl  0xc(%ebp)
 b72:	ff 55 08             	call   *0x8(%ebp)
  uthread_exit();
 b75:	e8 36 ff ff ff       	call   ab0 <uthread_exit>
 b7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b80 <uthred_self>:

int 
uthred_self(void)
{
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
 b80:	a1 e0 10 00 00       	mov    0x10e0,%eax
  }
}

int 
uthred_self(void)
{
 b85:	55                   	push   %ebp
 b86:	89 e5                	mov    %esp,%ebp
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
 b88:	8d 04 40             	lea    (%eax,%eax,2),%eax
}
 b8b:	5d                   	pop    %ebp

int 
uthred_self(void)
{
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
 b8c:	8b 04 c5 00 11 00 00 	mov    0x1100(,%eax,8),%eax
}
 b93:	c3                   	ret    
 b94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 b9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ba0 <uthred_join>:

int  
uthred_join(int tid)
{
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
 ba3:	53                   	push   %ebx
 ba4:	83 ec 04             	sub    $0x4,%esp
 ba7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  // if tid is not declared yet or is a negative number, error occured, return
  if(tid >= next_tid || tid < 0) {
 baa:	39 1d a8 11 00 00    	cmp    %ebx,0x11a8
 bb0:	7e 60                	jle    c12 <uthred_join+0x72>
 bb2:	89 d8                	mov    %ebx,%eax
 bb4:	c1 e8 1f             	shr    $0x1f,%eax
 bb7:	84 c0                	test   %al,%al
 bb9:	75 57                	jne    c12 <uthred_join+0x72>
  }

loop:

  // disable thread switching
  alarm(0);
 bbb:	83 ec 0c             	sub    $0xc,%esp
 bbe:	6a 00                	push   $0x0
 bc0:	e8 a5 f7 ff ff       	call   36a <alarm>
 bc5:	b8 00 11 00 00       	mov    $0x1100,%eax
 bca:	83 c4 10             	add    $0x10,%esp
 bcd:	8d 76 00             	lea    0x0(%esi),%esi

  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
    // searching for a thread with the relevant tid
    if(uthread_pool[i].tid == tid) {
 bd0:	3b 18                	cmp    (%eax),%ebx
 bd2:	74 24                	je     bf8 <uthred_join+0x58>
 bd4:	83 c0 18             	add    $0x18,%eax

  // disable thread switching
  alarm(0);

  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
 bd7:	3d a8 11 00 00       	cmp    $0x11a8,%eax
 bdc:	75 f2                	jne    bd0 <uthred_join+0x30>

    }
  }

  // the joined thread is not alive anyway, reset clock
  alarm(UTHREAD_QUANTA);
 bde:	83 ec 0c             	sub    $0xc,%esp
 be1:	6a 05                	push   $0x5
 be3:	e8 82 f7 ff ff       	call   36a <alarm>

  return 0;
 be8:	83 c4 10             	add    $0x10,%esp
 beb:	31 c0                	xor    %eax,%eax
}
 bed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 bf0:	c9                   	leave  
 bf1:	c3                   	ret    
 bf2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
    // searching for a thread with the relevant tid
    if(uthread_pool[i].tid == tid) {
      // put current running thread to sleep
      uthread_pool[c_uthread_index].state = SLEEP;
 bf8:	a1 e0 10 00 00       	mov    0x10e0,%eax
 bfd:	8d 04 40             	lea    (%eax,%eax,2),%eax
 c00:	c7 04 c5 10 11 00 00 	movl   $0x3,0x1110(,%eax,8)
 c07:	03 00 00 00 
      // let other thread to run 
      uthread_yield();
 c0b:	e8 30 fb ff ff       	call   740 <uthread_yield>

      // if thread still alive, loop over the join procedure again
      goto loop;
 c10:	eb a9                	jmp    bbb <uthred_join+0x1b>
{
  int i;

  // if tid is not declared yet or is a negative number, error occured, return
  if(tid >= next_tid || tid < 0) {
    return -1;
 c12:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c17:	eb d4                	jmp    bed <uthred_join+0x4d>
