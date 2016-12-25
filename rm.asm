
_rm:     file format elf32-i386


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
  11:	bf 01 00 00 00       	mov    $0x1,%edi
  16:	83 ec 08             	sub    $0x8,%esp
  19:	8b 31                	mov    (%ecx),%esi
  1b:	8b 59 04             	mov    0x4(%ecx),%ebx
  1e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
  21:	83 fe 01             	cmp    $0x1,%esi
  24:	7e 3e                	jle    64 <main+0x64>
  26:	8d 76 00             	lea    0x0(%esi),%esi
  29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
  30:	83 ec 0c             	sub    $0xc,%esp
  33:	ff 33                	pushl  (%ebx)
  35:	e8 d8 02 00 00       	call   312 <unlink>
  3a:	83 c4 10             	add    $0x10,%esp
  3d:	85 c0                	test   %eax,%eax
  3f:	78 0f                	js     50 <main+0x50>
  if(argc < 2){
    printf(2, "Usage: rm files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  41:	83 c7 01             	add    $0x1,%edi
  44:	83 c3 04             	add    $0x4,%ebx
  47:	39 fe                	cmp    %edi,%esi
  49:	75 e5                	jne    30 <main+0x30>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit();
  4b:	e8 72 02 00 00       	call   2c2 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if(unlink(argv[i]) < 0){
      printf(2, "rm: %s failed to delete\n", argv[i]);
  50:	50                   	push   %eax
  51:	ff 33                	pushl  (%ebx)
  53:	68 40 0c 00 00       	push   $0xc40
  58:	6a 02                	push   $0x2
  5a:	e8 d1 03 00 00       	call   430 <printf>
      break;
  5f:	83 c4 10             	add    $0x10,%esp
  62:	eb e7                	jmp    4b <main+0x4b>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    printf(2, "Usage: rm files...\n");
  64:	52                   	push   %edx
  65:	52                   	push   %edx
  66:	68 2c 0c 00 00       	push   $0xc2c
  6b:	6a 02                	push   $0x2
  6d:	e8 be 03 00 00       	call   430 <printf>
    exit();
  72:	e8 4b 02 00 00       	call   2c2 <exit>
  77:	66 90                	xchg   %ax,%ax
  79:	66 90                	xchg   %ax,%ax
  7b:	66 90                	xchg   %ax,%ax
  7d:	66 90                	xchg   %ax,%ax
  7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	53                   	push   %ebx
  84:	8b 45 08             	mov    0x8(%ebp),%eax
  87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  8a:	89 c2                	mov    %eax,%edx
  8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  90:	83 c1 01             	add    $0x1,%ecx
  93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  97:	83 c2 01             	add    $0x1,%edx
  9a:	84 db                	test   %bl,%bl
  9c:	88 5a ff             	mov    %bl,-0x1(%edx)
  9f:	75 ef                	jne    90 <strcpy+0x10>
    ;
  return os;
}
  a1:	5b                   	pop    %ebx
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    
  a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	56                   	push   %esi
  b4:	53                   	push   %ebx
  b5:	8b 55 08             	mov    0x8(%ebp),%edx
  b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  bb:	0f b6 02             	movzbl (%edx),%eax
  be:	0f b6 19             	movzbl (%ecx),%ebx
  c1:	84 c0                	test   %al,%al
  c3:	75 1e                	jne    e3 <strcmp+0x33>
  c5:	eb 29                	jmp    f0 <strcmp+0x40>
  c7:	89 f6                	mov    %esi,%esi
  c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  d0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  d6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
  dd:	84 c0                	test   %al,%al
  df:	74 0f                	je     f0 <strcmp+0x40>
  e1:	89 f1                	mov    %esi,%ecx
  e3:	38 d8                	cmp    %bl,%al
  e5:	74 e9                	je     d0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e7:	29 d8                	sub    %ebx,%eax
}
  e9:	5b                   	pop    %ebx
  ea:	5e                   	pop    %esi
  eb:	5d                   	pop    %ebp
  ec:	c3                   	ret    
  ed:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f2:	29 d8                	sub    %ebx,%eax
}
  f4:	5b                   	pop    %ebx
  f5:	5e                   	pop    %esi
  f6:	5d                   	pop    %ebp
  f7:	c3                   	ret    
  f8:	90                   	nop
  f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000100 <strlen>:

uint
strlen(char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 106:	80 39 00             	cmpb   $0x0,(%ecx)
 109:	74 12                	je     11d <strlen+0x1d>
 10b:	31 d2                	xor    %edx,%edx
 10d:	8d 76 00             	lea    0x0(%esi),%esi
 110:	83 c2 01             	add    $0x1,%edx
 113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 117:	89 d0                	mov    %edx,%eax
 119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 11d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 11f:	5d                   	pop    %ebp
 120:	c3                   	ret    
 121:	eb 0d                	jmp    130 <memset>
 123:	90                   	nop
 124:	90                   	nop
 125:	90                   	nop
 126:	90                   	nop
 127:	90                   	nop
 128:	90                   	nop
 129:	90                   	nop
 12a:	90                   	nop
 12b:	90                   	nop
 12c:	90                   	nop
 12d:	90                   	nop
 12e:	90                   	nop
 12f:	90                   	nop

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
 130:	55                   	push   %ebp
 131:	89 e5                	mov    %esp,%ebp
 133:	57                   	push   %edi
 134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 137:	8b 4d 10             	mov    0x10(%ebp),%ecx
 13a:	8b 45 0c             	mov    0xc(%ebp),%eax
 13d:	89 d7                	mov    %edx,%edi
 13f:	fc                   	cld    
 140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 142:	89 d0                	mov    %edx,%eax
 144:	5f                   	pop    %edi
 145:	5d                   	pop    %ebp
 146:	c3                   	ret    
 147:	89 f6                	mov    %esi,%esi
 149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
 150:	55                   	push   %ebp
 151:	89 e5                	mov    %esp,%ebp
 153:	53                   	push   %ebx
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 15a:	0f b6 10             	movzbl (%eax),%edx
 15d:	84 d2                	test   %dl,%dl
 15f:	74 1d                	je     17e <strchr+0x2e>
    if(*s == c)
 161:	38 d3                	cmp    %dl,%bl
 163:	89 d9                	mov    %ebx,%ecx
 165:	75 0d                	jne    174 <strchr+0x24>
 167:	eb 17                	jmp    180 <strchr+0x30>
 169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 170:	38 ca                	cmp    %cl,%dl
 172:	74 0c                	je     180 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 174:	83 c0 01             	add    $0x1,%eax
 177:	0f b6 10             	movzbl (%eax),%edx
 17a:	84 d2                	test   %dl,%dl
 17c:	75 f2                	jne    170 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 17e:	31 c0                	xor    %eax,%eax
}
 180:	5b                   	pop    %ebx
 181:	5d                   	pop    %ebp
 182:	c3                   	ret    
 183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <gets>:

char*
gets(char *buf, int max)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	57                   	push   %edi
 194:	56                   	push   %esi
 195:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 196:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 198:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 19b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19e:	eb 29                	jmp    1c9 <gets+0x39>
    cc = read(0, &c, 1);
 1a0:	83 ec 04             	sub    $0x4,%esp
 1a3:	6a 01                	push   $0x1
 1a5:	57                   	push   %edi
 1a6:	6a 00                	push   $0x0
 1a8:	e8 2d 01 00 00       	call   2da <read>
    if(cc < 1)
 1ad:	83 c4 10             	add    $0x10,%esp
 1b0:	85 c0                	test   %eax,%eax
 1b2:	7e 1d                	jle    1d1 <gets+0x41>
      break;
    buf[i++] = c;
 1b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 1b8:	8b 55 08             	mov    0x8(%ebp),%edx
 1bb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 1bd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1bf:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1c3:	74 1b                	je     1e0 <gets+0x50>
 1c5:	3c 0d                	cmp    $0xd,%al
 1c7:	74 17                	je     1e0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1c9:	8d 5e 01             	lea    0x1(%esi),%ebx
 1cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1cf:	7c cf                	jl     1a0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1d1:	8b 45 08             	mov    0x8(%ebp),%eax
 1d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1db:	5b                   	pop    %ebx
 1dc:	5e                   	pop    %esi
 1dd:	5f                   	pop    %edi
 1de:	5d                   	pop    %ebp
 1df:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
 1ec:	5b                   	pop    %ebx
 1ed:	5e                   	pop    %esi
 1ee:	5f                   	pop    %edi
 1ef:	5d                   	pop    %ebp
 1f0:	c3                   	ret    
 1f1:	eb 0d                	jmp    200 <stat>
 1f3:	90                   	nop
 1f4:	90                   	nop
 1f5:	90                   	nop
 1f6:	90                   	nop
 1f7:	90                   	nop
 1f8:	90                   	nop
 1f9:	90                   	nop
 1fa:	90                   	nop
 1fb:	90                   	nop
 1fc:	90                   	nop
 1fd:	90                   	nop
 1fe:	90                   	nop
 1ff:	90                   	nop

00000200 <stat>:

int
stat(char *n, struct stat *st)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 205:	83 ec 08             	sub    $0x8,%esp
 208:	6a 00                	push   $0x0
 20a:	ff 75 08             	pushl  0x8(%ebp)
 20d:	e8 f0 00 00 00       	call   302 <open>
  if(fd < 0)
 212:	83 c4 10             	add    $0x10,%esp
 215:	85 c0                	test   %eax,%eax
 217:	78 27                	js     240 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 219:	83 ec 08             	sub    $0x8,%esp
 21c:	ff 75 0c             	pushl  0xc(%ebp)
 21f:	89 c3                	mov    %eax,%ebx
 221:	50                   	push   %eax
 222:	e8 f3 00 00 00       	call   31a <fstat>
 227:	89 c6                	mov    %eax,%esi
  close(fd);
 229:	89 1c 24             	mov    %ebx,(%esp)
 22c:	e8 b9 00 00 00       	call   2ea <close>
  return r;
 231:	83 c4 10             	add    $0x10,%esp
 234:	89 f0                	mov    %esi,%eax
}
 236:	8d 65 f8             	lea    -0x8(%ebp),%esp
 239:	5b                   	pop    %ebx
 23a:	5e                   	pop    %esi
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 240:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 245:	eb ef                	jmp    236 <stat+0x36>
 247:	89 f6                	mov    %esi,%esi
 249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	53                   	push   %ebx
 254:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 257:	0f be 11             	movsbl (%ecx),%edx
 25a:	8d 42 d0             	lea    -0x30(%edx),%eax
 25d:	3c 09                	cmp    $0x9,%al
 25f:	b8 00 00 00 00       	mov    $0x0,%eax
 264:	77 1f                	ja     285 <atoi+0x35>
 266:	8d 76 00             	lea    0x0(%esi),%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 270:	8d 04 80             	lea    (%eax,%eax,4),%eax
 273:	83 c1 01             	add    $0x1,%ecx
 276:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 27a:	0f be 11             	movsbl (%ecx),%edx
 27d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 280:	80 fb 09             	cmp    $0x9,%bl
 283:	76 eb                	jbe    270 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 285:	5b                   	pop    %ebx
 286:	5d                   	pop    %ebp
 287:	c3                   	ret    
 288:	90                   	nop
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	56                   	push   %esi
 294:	53                   	push   %ebx
 295:	8b 5d 10             	mov    0x10(%ebp),%ebx
 298:	8b 45 08             	mov    0x8(%ebp),%eax
 29b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 29e:	85 db                	test   %ebx,%ebx
 2a0:	7e 14                	jle    2b6 <memmove+0x26>
 2a2:	31 d2                	xor    %edx,%edx
 2a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 2a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 2ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 2af:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b2:	39 da                	cmp    %ebx,%edx
 2b4:	75 f2                	jne    2a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2b6:	5b                   	pop    %ebx
 2b7:	5e                   	pop    %esi
 2b8:	5d                   	pop    %ebp
 2b9:	c3                   	ret    

000002ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ba:	b8 01 00 00 00       	mov    $0x1,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <exit>:
SYSCALL(exit)
 2c2:	b8 02 00 00 00       	mov    $0x2,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <wait>:
SYSCALL(wait)
 2ca:	b8 03 00 00 00       	mov    $0x3,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <pipe>:
SYSCALL(pipe)
 2d2:	b8 04 00 00 00       	mov    $0x4,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <read>:
SYSCALL(read)
 2da:	b8 05 00 00 00       	mov    $0x5,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <write>:
SYSCALL(write)
 2e2:	b8 10 00 00 00       	mov    $0x10,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <close>:
SYSCALL(close)
 2ea:	b8 15 00 00 00       	mov    $0x15,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <kill>:
SYSCALL(kill)
 2f2:	b8 06 00 00 00       	mov    $0x6,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <exec>:
SYSCALL(exec)
 2fa:	b8 07 00 00 00       	mov    $0x7,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <open>:
SYSCALL(open)
 302:	b8 0f 00 00 00       	mov    $0xf,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <mknod>:
SYSCALL(mknod)
 30a:	b8 11 00 00 00       	mov    $0x11,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <unlink>:
SYSCALL(unlink)
 312:	b8 12 00 00 00       	mov    $0x12,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <fstat>:
SYSCALL(fstat)
 31a:	b8 08 00 00 00       	mov    $0x8,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <link>:
SYSCALL(link)
 322:	b8 13 00 00 00       	mov    $0x13,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <mkdir>:
SYSCALL(mkdir)
 32a:	b8 14 00 00 00       	mov    $0x14,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <chdir>:
SYSCALL(chdir)
 332:	b8 09 00 00 00       	mov    $0x9,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <dup>:
SYSCALL(dup)
 33a:	b8 0a 00 00 00       	mov    $0xa,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <getpid>:
SYSCALL(getpid)
 342:	b8 0b 00 00 00       	mov    $0xb,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <sbrk>:
SYSCALL(sbrk)
 34a:	b8 0c 00 00 00       	mov    $0xc,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <sleep>:
SYSCALL(sleep)
 352:	b8 0d 00 00 00       	mov    $0xd,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <uptime>:
SYSCALL(uptime)
 35a:	b8 0e 00 00 00       	mov    $0xe,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <signal>:
/*pazit---------------------------------------------------*/
SYSCALL(signal)  
 362:	b8 16 00 00 00       	mov    $0x16,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <sigsend>:
SYSCALL(sigsend)  
 36a:	b8 17 00 00 00       	mov    $0x17,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <sigreturn>:
SYSCALL(sigreturn) 
 372:	b8 18 00 00 00       	mov    $0x18,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <alarm>:
SYSCALL(alarm)
 37a:	b8 19 00 00 00       	mov    $0x19,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    
 382:	66 90                	xchg   %ax,%ax
 384:	66 90                	xchg   %ax,%ax
 386:	66 90                	xchg   %ax,%ax
 388:	66 90                	xchg   %ax,%ax
 38a:	66 90                	xchg   %ax,%ax
 38c:	66 90                	xchg   %ax,%ax
 38e:	66 90                	xchg   %ax,%ax

00000390 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	56                   	push   %esi
 395:	53                   	push   %ebx
 396:	89 c6                	mov    %eax,%esi
 398:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 39b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 39e:	85 db                	test   %ebx,%ebx
 3a0:	74 7e                	je     420 <printint+0x90>
 3a2:	89 d0                	mov    %edx,%eax
 3a4:	c1 e8 1f             	shr    $0x1f,%eax
 3a7:	84 c0                	test   %al,%al
 3a9:	74 75                	je     420 <printint+0x90>
    neg = 1;
    x = -xx;
 3ab:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 3ad:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 3b4:	f7 d8                	neg    %eax
 3b6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 3b9:	31 ff                	xor    %edi,%edi
 3bb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3be:	89 ce                	mov    %ecx,%esi
 3c0:	eb 08                	jmp    3ca <printint+0x3a>
 3c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 3c8:	89 cf                	mov    %ecx,%edi
 3ca:	31 d2                	xor    %edx,%edx
 3cc:	8d 4f 01             	lea    0x1(%edi),%ecx
 3cf:	f7 f6                	div    %esi
 3d1:	0f b6 92 60 0c 00 00 	movzbl 0xc60(%edx),%edx
  }while((x /= base) != 0);
 3d8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3da:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 3dd:	75 e9                	jne    3c8 <printint+0x38>
  if(neg)
 3df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 3e2:	8b 75 c0             	mov    -0x40(%ebp),%esi
 3e5:	85 c0                	test   %eax,%eax
 3e7:	74 08                	je     3f1 <printint+0x61>
    buf[i++] = '-';
 3e9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 3ee:	8d 4f 02             	lea    0x2(%edi),%ecx
 3f1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 3f5:	8d 76 00             	lea    0x0(%esi),%esi
 3f8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3fb:	83 ec 04             	sub    $0x4,%esp
 3fe:	83 ef 01             	sub    $0x1,%edi
 401:	6a 01                	push   $0x1
 403:	53                   	push   %ebx
 404:	56                   	push   %esi
 405:	88 45 d7             	mov    %al,-0x29(%ebp)
 408:	e8 d5 fe ff ff       	call   2e2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 40d:	83 c4 10             	add    $0x10,%esp
 410:	39 df                	cmp    %ebx,%edi
 412:	75 e4                	jne    3f8 <printint+0x68>
    putc(fd, buf[i]);
}
 414:	8d 65 f4             	lea    -0xc(%ebp),%esp
 417:	5b                   	pop    %ebx
 418:	5e                   	pop    %esi
 419:	5f                   	pop    %edi
 41a:	5d                   	pop    %ebp
 41b:	c3                   	ret    
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 420:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 422:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 429:	eb 8b                	jmp    3b6 <printint+0x26>
 42b:	90                   	nop
 42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000430 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
 434:	56                   	push   %esi
 435:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 436:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 439:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 43c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 43f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 442:	89 45 d0             	mov    %eax,-0x30(%ebp)
 445:	0f b6 1e             	movzbl (%esi),%ebx
 448:	83 c6 01             	add    $0x1,%esi
 44b:	84 db                	test   %bl,%bl
 44d:	0f 84 b0 00 00 00    	je     503 <printf+0xd3>
 453:	31 d2                	xor    %edx,%edx
 455:	eb 39                	jmp    490 <printf+0x60>
 457:	89 f6                	mov    %esi,%esi
 459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 460:	83 f8 25             	cmp    $0x25,%eax
 463:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 466:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 46b:	74 18                	je     485 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 46d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 470:	83 ec 04             	sub    $0x4,%esp
 473:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 476:	6a 01                	push   $0x1
 478:	50                   	push   %eax
 479:	57                   	push   %edi
 47a:	e8 63 fe ff ff       	call   2e2 <write>
 47f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 482:	83 c4 10             	add    $0x10,%esp
 485:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 488:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 48c:	84 db                	test   %bl,%bl
 48e:	74 73                	je     503 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 490:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 492:	0f be cb             	movsbl %bl,%ecx
 495:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 498:	74 c6                	je     460 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 49a:	83 fa 25             	cmp    $0x25,%edx
 49d:	75 e6                	jne    485 <printf+0x55>
      if(c == 'd'){
 49f:	83 f8 64             	cmp    $0x64,%eax
 4a2:	0f 84 f8 00 00 00    	je     5a0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4a8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 4ae:	83 f9 70             	cmp    $0x70,%ecx
 4b1:	74 5d                	je     510 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4b3:	83 f8 73             	cmp    $0x73,%eax
 4b6:	0f 84 84 00 00 00    	je     540 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4bc:	83 f8 63             	cmp    $0x63,%eax
 4bf:	0f 84 ea 00 00 00    	je     5af <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4c5:	83 f8 25             	cmp    $0x25,%eax
 4c8:	0f 84 c2 00 00 00    	je     590 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4ce:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4d1:	83 ec 04             	sub    $0x4,%esp
 4d4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 4d8:	6a 01                	push   $0x1
 4da:	50                   	push   %eax
 4db:	57                   	push   %edi
 4dc:	e8 01 fe ff ff       	call   2e2 <write>
 4e1:	83 c4 0c             	add    $0xc,%esp
 4e4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4e7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 4ea:	6a 01                	push   $0x1
 4ec:	50                   	push   %eax
 4ed:	57                   	push   %edi
 4ee:	83 c6 01             	add    $0x1,%esi
 4f1:	e8 ec fd ff ff       	call   2e2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4f6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4fa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4fd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 4ff:	84 db                	test   %bl,%bl
 501:	75 8d                	jne    490 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 503:	8d 65 f4             	lea    -0xc(%ebp),%esp
 506:	5b                   	pop    %ebx
 507:	5e                   	pop    %esi
 508:	5f                   	pop    %edi
 509:	5d                   	pop    %ebp
 50a:	c3                   	ret    
 50b:	90                   	nop
 50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 510:	83 ec 0c             	sub    $0xc,%esp
 513:	b9 10 00 00 00       	mov    $0x10,%ecx
 518:	6a 00                	push   $0x0
 51a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 51d:	89 f8                	mov    %edi,%eax
 51f:	8b 13                	mov    (%ebx),%edx
 521:	e8 6a fe ff ff       	call   390 <printint>
        ap++;
 526:	89 d8                	mov    %ebx,%eax
 528:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 52b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 52d:	83 c0 04             	add    $0x4,%eax
 530:	89 45 d0             	mov    %eax,-0x30(%ebp)
 533:	e9 4d ff ff ff       	jmp    485 <printf+0x55>
 538:	90                   	nop
 539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 540:	8b 45 d0             	mov    -0x30(%ebp),%eax
 543:	8b 18                	mov    (%eax),%ebx
        ap++;
 545:	83 c0 04             	add    $0x4,%eax
 548:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 54b:	b8 59 0c 00 00       	mov    $0xc59,%eax
 550:	85 db                	test   %ebx,%ebx
 552:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 555:	0f b6 03             	movzbl (%ebx),%eax
 558:	84 c0                	test   %al,%al
 55a:	74 23                	je     57f <printf+0x14f>
 55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 560:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 563:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 566:	83 ec 04             	sub    $0x4,%esp
 569:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 56b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 56e:	50                   	push   %eax
 56f:	57                   	push   %edi
 570:	e8 6d fd ff ff       	call   2e2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 575:	0f b6 03             	movzbl (%ebx),%eax
 578:	83 c4 10             	add    $0x10,%esp
 57b:	84 c0                	test   %al,%al
 57d:	75 e1                	jne    560 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 57f:	31 d2                	xor    %edx,%edx
 581:	e9 ff fe ff ff       	jmp    485 <printf+0x55>
 586:	8d 76 00             	lea    0x0(%esi),%esi
 589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 590:	83 ec 04             	sub    $0x4,%esp
 593:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 596:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 599:	6a 01                	push   $0x1
 59b:	e9 4c ff ff ff       	jmp    4ec <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5a0:	83 ec 0c             	sub    $0xc,%esp
 5a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 5a8:	6a 01                	push   $0x1
 5aa:	e9 6b ff ff ff       	jmp    51a <printf+0xea>
 5af:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5b2:	83 ec 04             	sub    $0x4,%esp
 5b5:	8b 03                	mov    (%ebx),%eax
 5b7:	6a 01                	push   $0x1
 5b9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 5bc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 5bf:	50                   	push   %eax
 5c0:	57                   	push   %edi
 5c1:	e8 1c fd ff ff       	call   2e2 <write>
 5c6:	e9 5b ff ff ff       	jmp    526 <printf+0xf6>
 5cb:	66 90                	xchg   %ax,%ax
 5cd:	66 90                	xchg   %ax,%ax
 5cf:	90                   	nop

000005d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d1:	a1 00 11 00 00       	mov    0x1100,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d6:	89 e5                	mov    %esp,%ebp
 5d8:	57                   	push   %edi
 5d9:	56                   	push   %esi
 5da:	53                   	push   %ebx
 5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5de:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5e0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e3:	39 c8                	cmp    %ecx,%eax
 5e5:	73 19                	jae    600 <free+0x30>
 5e7:	89 f6                	mov    %esi,%esi
 5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 5f0:	39 d1                	cmp    %edx,%ecx
 5f2:	72 1c                	jb     610 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f4:	39 d0                	cmp    %edx,%eax
 5f6:	73 18                	jae    610 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5fa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5fc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5fe:	72 f0                	jb     5f0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 600:	39 d0                	cmp    %edx,%eax
 602:	72 f4                	jb     5f8 <free+0x28>
 604:	39 d1                	cmp    %edx,%ecx
 606:	73 f0                	jae    5f8 <free+0x28>
 608:	90                   	nop
 609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 610:	8b 73 fc             	mov    -0x4(%ebx),%esi
 613:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 616:	39 d7                	cmp    %edx,%edi
 618:	74 19                	je     633 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 61a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 61d:	8b 50 04             	mov    0x4(%eax),%edx
 620:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 623:	39 f1                	cmp    %esi,%ecx
 625:	74 23                	je     64a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 627:	89 08                	mov    %ecx,(%eax)
  freep = p;
 629:	a3 00 11 00 00       	mov    %eax,0x1100
}
 62e:	5b                   	pop    %ebx
 62f:	5e                   	pop    %esi
 630:	5f                   	pop    %edi
 631:	5d                   	pop    %ebp
 632:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 633:	03 72 04             	add    0x4(%edx),%esi
 636:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 639:	8b 10                	mov    (%eax),%edx
 63b:	8b 12                	mov    (%edx),%edx
 63d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 640:	8b 50 04             	mov    0x4(%eax),%edx
 643:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 646:	39 f1                	cmp    %esi,%ecx
 648:	75 dd                	jne    627 <free+0x57>
    p->s.size += bp->s.size;
 64a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 64d:	a3 00 11 00 00       	mov    %eax,0x1100
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 652:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 655:	8b 53 f8             	mov    -0x8(%ebx),%edx
 658:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 65a:	5b                   	pop    %ebx
 65b:	5e                   	pop    %esi
 65c:	5f                   	pop    %edi
 65d:	5d                   	pop    %ebp
 65e:	c3                   	ret    
 65f:	90                   	nop

00000660 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 669:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 66c:	8b 15 00 11 00 00    	mov    0x1100,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 672:	8d 78 07             	lea    0x7(%eax),%edi
 675:	c1 ef 03             	shr    $0x3,%edi
 678:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 67b:	85 d2                	test   %edx,%edx
 67d:	0f 84 a3 00 00 00    	je     726 <malloc+0xc6>
 683:	8b 02                	mov    (%edx),%eax
 685:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 688:	39 cf                	cmp    %ecx,%edi
 68a:	76 74                	jbe    700 <malloc+0xa0>
 68c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 692:	be 00 10 00 00       	mov    $0x1000,%esi
 697:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 69e:	0f 43 f7             	cmovae %edi,%esi
 6a1:	ba 00 80 00 00       	mov    $0x8000,%edx
 6a6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 6ac:	0f 46 da             	cmovbe %edx,%ebx
 6af:	eb 10                	jmp    6c1 <malloc+0x61>
 6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6ba:	8b 48 04             	mov    0x4(%eax),%ecx
 6bd:	39 cf                	cmp    %ecx,%edi
 6bf:	76 3f                	jbe    700 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6c1:	39 05 00 11 00 00    	cmp    %eax,0x1100
 6c7:	89 c2                	mov    %eax,%edx
 6c9:	75 ed                	jne    6b8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 6cb:	83 ec 0c             	sub    $0xc,%esp
 6ce:	53                   	push   %ebx
 6cf:	e8 76 fc ff ff       	call   34a <sbrk>
  if(p == (char*)-1)
 6d4:	83 c4 10             	add    $0x10,%esp
 6d7:	83 f8 ff             	cmp    $0xffffffff,%eax
 6da:	74 1c                	je     6f8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 6dc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 6df:	83 ec 0c             	sub    $0xc,%esp
 6e2:	83 c0 08             	add    $0x8,%eax
 6e5:	50                   	push   %eax
 6e6:	e8 e5 fe ff ff       	call   5d0 <free>
  return freep;
 6eb:	8b 15 00 11 00 00    	mov    0x1100,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 6f1:	83 c4 10             	add    $0x10,%esp
 6f4:	85 d2                	test   %edx,%edx
 6f6:	75 c0                	jne    6b8 <malloc+0x58>
        return 0;
 6f8:	31 c0                	xor    %eax,%eax
 6fa:	eb 1c                	jmp    718 <malloc+0xb8>
 6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 700:	39 cf                	cmp    %ecx,%edi
 702:	74 1c                	je     720 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 704:	29 f9                	sub    %edi,%ecx
 706:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 709:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 70c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 70f:	89 15 00 11 00 00    	mov    %edx,0x1100
      return (void*)(p + 1);
 715:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 718:	8d 65 f4             	lea    -0xc(%ebp),%esp
 71b:	5b                   	pop    %ebx
 71c:	5e                   	pop    %esi
 71d:	5f                   	pop    %edi
 71e:	5d                   	pop    %ebp
 71f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 720:	8b 08                	mov    (%eax),%ecx
 722:	89 0a                	mov    %ecx,(%edx)
 724:	eb e9                	jmp    70f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 726:	c7 05 00 11 00 00 04 	movl   $0x1104,0x1100
 72d:	11 00 00 
 730:	c7 05 04 11 00 00 04 	movl   $0x1104,0x1104
 737:	11 00 00 
    base.s.size = 0;
 73a:	b8 04 11 00 00       	mov    $0x1104,%eax
 73f:	c7 05 08 11 00 00 00 	movl   $0x0,0x1108
 746:	00 00 00 
 749:	e9 3e ff ff ff       	jmp    68c <malloc+0x2c>
 74e:	66 90                	xchg   %ax,%ax

00000750 <uthread_yield>:
  exit();
}

void 
uthread_yield(void)
{
 750:	55                   	push   %ebp
 751:	89 e5                	mov    %esp,%ebp
 753:	57                   	push   %edi
 754:	56                   	push   %esi
 755:	53                   	push   %ebx
 756:	83 ec 28             	sub    $0x28,%esp
  // switch alarm(0) to cancel thread switching while yielding 
  alarm(0);
 759:	6a 00                	push   $0x0
 75b:	e8 1a fc ff ff       	call   37a <alarm>

  // if current thread is running (most cases), the thread didn't finisht its job so turn his state to RUNNABLE
  if (uthread_pool[c_uthread_index].state == RUNNING) {
 760:	a1 20 11 00 00       	mov    0x1120,%eax
 765:	83 c4 10             	add    $0x10,%esp
 768:	8d 14 40             	lea    (%eax,%eax,2),%edx
 76b:	8d 14 d5 40 11 00 00 	lea    0x1140(,%edx,8),%edx
 772:	83 7a 10 01          	cmpl   $0x1,0x10(%edx)
 776:	0f 84 54 01 00 00    	je     8d0 <uthread_yield+0x180>
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
 77c:	8d 04 40             	lea    (%eax,%eax,2),%eax
  asm("movl %%ebp, %0;" : "=r" (uthread_pool[c_uthread_index].ebp));

  // load the new thread

  // pick the next thread index
  c_uthread_index++;
 77f:	83 05 20 11 00 00 01 	addl   $0x1,0x1120
 786:	bb 50 11 00 00       	mov    $0x1150,%ebx
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
 78b:	89 e2                	mov    %esp,%edx
 78d:	8d 04 c5 40 11 00 00 	lea    0x1140(,%eax,8),%eax

  // ************** lottery scheduler mechanism ******************* //

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
 794:	c7 05 f0 11 00 00 ff 	movl   $0xffffffff,0x11f0
 79b:	ff ff ff 
 79e:	89 de                	mov    %ebx,%esi
 7a0:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
 7a4:	bf ff ff ff ff       	mov    $0xffffffff,%edi
 7a9:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
  }

  // save current thread esp and ebp
  asm("movl %%esp, %0;" : "=r" (uthread_pool[c_uthread_index].esp));
 7ae:	89 50 04             	mov    %edx,0x4(%eax)
  asm("movl %%ebp, %0;" : "=r" (uthread_pool[c_uthread_index].ebp));
 7b1:	89 ea                	mov    %ebp,%edx
 7b3:	89 50 08             	mov    %edx,0x8(%eax)
 7b6:	8d 76 00             	lea    0x0(%esi),%esi
 7b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
 7c0:	8b 06                	mov    (%esi),%eax
 7c2:	85 c0                	test   %eax,%eax
 7c4:	0f 95 c2             	setne  %dl
 7c7:	83 f8 03             	cmp    $0x3,%eax
 7ca:	0f 95 c0             	setne  %al
 7cd:	20 d0                	and    %dl,%al
 7cf:	74 0a                	je     7db <uthread_yield+0x8b>
      current_ticket_num += uthread_pool[j].ntickets;
 7d1:	8b 7e 04             	mov    0x4(%esi),%edi
 7d4:	88 45 e7             	mov    %al,-0x19(%ebp)
 7d7:	01 cf                	add    %ecx,%edi
 7d9:	89 f9                	mov    %edi,%ecx
 7db:	83 c6 18             	add    $0x18,%esi
  // ************** lottery scheduler mechanism ******************* //

  int j, randomTicket;
  // update number of total tickets
  current_ticket_num = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
 7de:	81 fe f8 11 00 00    	cmp    $0x11f8,%esi
 7e4:	75 da                	jne    7c0 <uthread_yield+0x70>
 7e6:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
 7ea:	0f 85 ec 00 00 00    	jne    8dc <uthread_yield+0x18c>

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 7f0:	69 05 ec 10 00 00 0d 	imul   $0x19660d,0x10ec,%eax
 7f7:	66 19 00 
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
      current_ticket_num += uthread_pool[j].ntickets;
  }

  // generate a random number between 0 and current_ticket_num
  randomTicket = rand() % current_ticket_num;
 7fa:	31 d2                	xor    %edx,%edx

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
 7fc:	83 ec 04             	sub    $0x4,%esp
 7ff:	51                   	push   %ecx
 800:	68 71 0c 00 00       	push   $0xc71
 805:	6a 01                	push   $0x1

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 807:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
 80c:	a3 ec 10 00 00       	mov    %eax,0x10ec
    if(uthread_pool[j].state != FREE && uthread_pool[j].state != SLEEP)
      current_ticket_num += uthread_pool[j].ntickets;
  }

  // generate a random number between 0 and current_ticket_num
  randomTicket = rand() % current_ticket_num;
 811:	f7 f1                	div    %ecx
 813:	89 d6                	mov    %edx,%esi

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
 815:	e8 16 fc ff ff       	call   430 <printf>
  printf(1,"randomTicket=%d\n", randomTicket);
 81a:	83 c4 0c             	add    $0xc,%esp
 81d:	56                   	push   %esi
 81e:	68 88 0c 00 00       	push   $0xc88
 823:	6a 01                	push   $0x1
 825:	e8 06 fc ff ff       	call   430 <printf>

  // set the choosen order thread to run
  choosen = randomTicket / NTICKET;
 82a:	89 f0                	mov    %esi,%eax
 82c:	ba 67 66 66 66       	mov    $0x66666667,%edx
 831:	c1 fe 1f             	sar    $0x1f,%esi
 834:	f7 ea                	imul   %edx
 836:	83 c4 10             	add    $0x10,%esp

  // pick the index of choosen thread
  int chooseCount = -1;
 839:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  for(j = 0; j < MAX_THREADS; ++j) {
 83e:	31 c0                	xor    %eax,%eax

  printf(1,"current_ticket_num=%d\n", current_ticket_num);
  printf(1,"randomTicket=%d\n", randomTicket);

  // set the choosen order thread to run
  choosen = randomTicket / NTICKET;
 840:	d1 fa                	sar    %edx
 842:	29 f2                	sub    %esi,%edx
 844:	89 15 ec 11 00 00    	mov    %edx,0x11ec
 84a:	eb 0f                	jmp    85b <uthread_yield+0x10b>
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // pick the index of choosen thread
  int chooseCount = -1;
  for(j = 0; j < MAX_THREADS; ++j) {
 850:	83 c0 01             	add    $0x1,%eax
 853:	83 c3 18             	add    $0x18,%ebx
 856:	83 f8 07             	cmp    $0x7,%eax
 859:	74 15                	je     870 <uthread_yield+0x120>
    if(uthread_pool[j].state == RUNNABLE) {
 85b:	83 3b 02             	cmpl   $0x2,(%ebx)
 85e:	75 f0                	jne    850 <uthread_yield+0x100>
      chooseCount++;
 860:	83 c1 01             	add    $0x1,%ecx
      if (choosen == chooseCount)
 863:	39 ca                	cmp    %ecx,%edx
 865:	75 e9                	jne    850 <uthread_yield+0x100>
 867:	89 f6                	mov    %esi,%esi
 869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        break;
    }
  }

  // set current thread to the lottery chosen one
  c_uthread_index = j;
 870:	a3 20 11 00 00       	mov    %eax,0x1120

  // ****************************************************************** //

  // current switched thread is move to RUNNING mode, next to be execute
  uthread_pool[c_uthread_index].state = RUNNING;
 875:	8d 04 40             	lea    (%eax,%eax,2),%eax
 878:	8d 04 c5 40 11 00 00 	lea    0x1140(,%eax,8),%eax


  // if esp is null, thread is running its first time, so we have to load a functio to it 
  if(uthread_pool[c_uthread_index].esp == 0) {
 87f:	8b 50 04             	mov    0x4(%eax),%edx
  c_uthread_index = j;

  // ****************************************************************** //

  // current switched thread is move to RUNNING mode, next to be execute
  uthread_pool[c_uthread_index].state = RUNNING;
 882:	c7 40 10 01 00 00 00 	movl   $0x1,0x10(%eax)


  // if esp is null, thread is running its first time, so we have to load a functio to it 
  if(uthread_pool[c_uthread_index].esp == 0) {
 889:	85 d2                	test   %edx,%edx
 88b:	75 23                	jne    8b0 <uthread_yield+0x160>
    asm("movl %0, %%esp;" : : "r" (uthread_pool[c_uthread_index].stack + STACK_SIZE - 3*sizeof(int)));
 88d:	8b 40 0c             	mov    0xc(%eax),%eax
 890:	05 f4 0f 00 00       	add    $0xff4,%eax
 895:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].stack + STACK_SIZE - 3*sizeof(int)));
 897:	89 c5                	mov    %eax,%ebp
    // jump to execute function to run the thread own function
    asm("jmp *%0;" : : "r" (execute_thread));
 899:	b8 60 0b 00 00       	mov    $0xb60,%eax
 89e:	ff e0                	jmp    *%eax
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].ebp));

    // reset alarm
    alarm(UTHREAD_QUANTA);
  }
}
 8a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8a3:	5b                   	pop    %ebx
 8a4:	5e                   	pop    %esi
 8a5:	5f                   	pop    %edi
 8a6:	5d                   	pop    %ebp
 8a7:	c3                   	ret    
 8a8:	90                   	nop
 8a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    // jump to execute function to run the thread own function
    asm("jmp *%0;" : : "r" (execute_thread));
  } 
  else  {
    // restore thread stack
    asm("movl %0, %%esp;" : : "r" (uthread_pool[c_uthread_index].esp));
 8b0:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (uthread_pool[c_uthread_index].ebp));
 8b2:	8b 40 08             	mov    0x8(%eax),%eax
 8b5:	89 c5                	mov    %eax,%ebp

    // reset alarm
    alarm(UTHREAD_QUANTA);
 8b7:	83 ec 0c             	sub    $0xc,%esp
 8ba:	6a 05                	push   $0x5
 8bc:	e8 b9 fa ff ff       	call   37a <alarm>
 8c1:	83 c4 10             	add    $0x10,%esp
  }
}
 8c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8c7:	5b                   	pop    %ebx
 8c8:	5e                   	pop    %esi
 8c9:	5f                   	pop    %edi
 8ca:	5d                   	pop    %ebp
 8cb:	c3                   	ret    
 8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  // switch alarm(0) to cancel thread switching while yielding 
  alarm(0);

  // if current thread is running (most cases), the thread didn't finisht its job so turn his state to RUNNABLE
  if (uthread_pool[c_uthread_index].state == RUNNING) {
    uthread_pool[c_uthread_index].state = RUNNABLE;
 8d0:	c7 42 10 02 00 00 00 	movl   $0x2,0x10(%edx)
 8d7:	e9 a0 fe ff ff       	jmp    77c <uthread_yield+0x2c>
 8dc:	89 3d f0 11 00 00    	mov    %edi,0x11f0
 8e2:	e9 09 ff ff ff       	jmp    7f0 <uthread_yield+0xa0>
 8e7:	89 f6                	mov    %esi,%esi
 8e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008f0 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 8f0:	69 05 ec 10 00 00 0d 	imul   $0x19660d,0x10ec,%eax
 8f7:	66 19 00 
//***************************************************************************************//

unsigned long randstate = 1;
unsigned int
rand()
{
 8fa:	55                   	push   %ebp
 8fb:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
 8fd:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
 8fe:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
 903:	a3 ec 10 00 00       	mov    %eax,0x10ec
  return randstate;
}
 908:	c3                   	ret    
 909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000910 <uthread_init>:
  uthread_exit();
}

int
 uthread_init()
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	83 ec 10             	sub    $0x10,%esp
  printf(1, "** INIT USER LEVEL THREAD **\n");
 916:	68 99 0c 00 00       	push   $0xc99
 91b:	6a 01                	push   $0x1
 91d:	e8 0e fb ff ff       	call   430 <printf>
 922:	b8 50 11 00 00       	mov    $0x1150,%eax
 927:	83 c4 10             	add    $0x10,%esp
 92a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  // set all threads state to FREE - init pool
  int i;
  for(i = 0; i < MAX_THREADS; ++i) {
    uthread_pool[i].state = FREE;
 930:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    uthread_pool[i].ntickets = NTICKET;
 936:	c7 40 04 05 00 00 00 	movl   $0x5,0x4(%eax)
 93d:	83 c0 18             	add    $0x18,%eax
 uthread_init()
{
  printf(1, "** INIT USER LEVEL THREAD **\n");
  // set all threads state to FREE - init pool
  int i;
  for(i = 0; i < MAX_THREADS; ++i) {
 940:	3d f8 11 00 00       	cmp    $0x11f8,%eax
 945:	75 e9                	jne    930 <uthread_init+0x20>
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 947:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < MAX_THREADS; ++i) {
    uthread_pool[i].state = FREE;
    uthread_pool[i].ntickets = NTICKET;
  }

  next_tid = 1;
 94a:	c7 05 e8 11 00 00 01 	movl   $0x1,0x11e8
 951:	00 00 00 

  // initialize main thread
  c_uthread_index = 0;
 954:	c7 05 20 11 00 00 00 	movl   $0x0,0x1120
 95b:	00 00 00 
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 95e:	68 50 07 00 00       	push   $0x750
 963:	6a 0e                	push   $0xe
  next_tid = 1;

  // initialize main thread
  c_uthread_index = 0;
  // set tid and stack to null
  uthread_pool[c_uthread_index].tid = 0;
 965:	c7 05 40 11 00 00 00 	movl   $0x0,0x1140
 96c:	00 00 00 
  uthread_pool[c_uthread_index].stack = 0; 
 96f:	c7 05 4c 11 00 00 00 	movl   $0x0,0x114c
 976:	00 00 00 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;
 979:	c7 05 50 11 00 00 01 	movl   $0x1,0x1150
 980:	00 00 00 

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 983:	e8 da f9 ff ff       	call   362 <signal>
 988:	83 c4 10             	add    $0x10,%esp
 98b:	85 c0                	test   %eax,%eax
    // case signal error
    return -1;
 98d:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  uthread_pool[c_uthread_index].stack = 0; 
  // main thread is ready to run
  uthread_pool[c_uthread_index].state = RUNNING;

  // register the SIGALRM to uthread_yield func
  if(signal(SIGALRM, uthread_yield) != 0) {
 992:	75 0f                	jne    9a3 <uthread_init+0x93>
    // case signal error
    return -1;
  }

  // execute the alarm syscall with UTHREAD_QUANTA
  alarm(UTHREAD_QUANTA);
 994:	83 ec 0c             	sub    $0xc,%esp
 997:	6a 05                	push   $0x5
 999:	e8 dc f9 ff ff       	call   37a <alarm>

  return 0;
 99e:	83 c4 10             	add    $0x10,%esp
 9a1:	31 d2                	xor    %edx,%edx
}
 9a3:	89 d0                	mov    %edx,%eax
 9a5:	c9                   	leave  
 9a6:	c3                   	ret    
 9a7:	89 f6                	mov    %esi,%esi
 9a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009b0 <uthread_create>:

int 
uthread_create(void (*func)(void *), void* arg)
{
 9b0:	55                   	push   %ebp
 9b1:	89 e5                	mov    %esp,%ebp
 9b3:	56                   	push   %esi
 9b4:	53                   	push   %ebx
  printf(1, "start thread creation \n");
 9b5:	83 ec 08             	sub    $0x8,%esp
 9b8:	68 b7 0c 00 00       	push   $0xcb7
 9bd:	6a 01                	push   $0x1
 9bf:	e8 6c fa ff ff       	call   430 <printf>

  // local thread pool index
  int i;

  // disable thread switching
  alarm(0);
 9c4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 9cb:	e8 aa f9 ff ff       	call   37a <alarm>

  printf(1, "uthread_create after alarm(0) \n");
 9d0:	5b                   	pop    %ebx
 9d1:	5e                   	pop    %esi
 9d2:	68 e4 0c 00 00       	push   $0xce4
 9d7:	6a 01                	push   $0x1
 9d9:	e8 52 fa ff ff       	call   430 <printf>
 9de:	ba 50 11 00 00       	mov    $0x1150,%edx
 9e3:	83 c4 10             	add    $0x10,%esp

  // search for free thread to load
  for(i = 0; i < MAX_THREADS; ++i) {
 9e6:	31 c0                	xor    %eax,%eax
 9e8:	90                   	nop
 9e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if (uthread_pool[i].state == FREE) {
 9f0:	8b 0a                	mov    (%edx),%ecx
 9f2:	85 c9                	test   %ecx,%ecx
 9f4:	74 2a                	je     a20 <uthread_create+0x70>
  alarm(0);

  printf(1, "uthread_create after alarm(0) \n");

  // search for free thread to load
  for(i = 0; i < MAX_THREADS; ++i) {
 9f6:	83 c0 01             	add    $0x1,%eax
 9f9:	83 c2 18             	add    $0x18,%edx
 9fc:	83 f8 07             	cmp    $0x7,%eax
 9ff:	75 ef                	jne    9f0 <uthread_create+0x40>
    }
  }

  // case no free threads available
  // enable thread switching
  alarm(UTHREAD_QUANTA);
 a01:	83 ec 0c             	sub    $0xc,%esp
 a04:	6a 05                	push   $0x5
 a06:	e8 6f f9 ff ff       	call   37a <alarm>
  return -1;
 a0b:	83 c4 10             	add    $0x10,%esp
  // enable thread switching
  printf(1, "creation method: returning.. \n");
  alarm(UTHREAD_QUANTA);

  return uthread_pool[i].tid;
}
 a0e:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }

  // case no free threads available
  // enable thread switching
  alarm(UTHREAD_QUANTA);
  return -1;
 a11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  // enable thread switching
  printf(1, "creation method: returning.. \n");
  alarm(UTHREAD_QUANTA);

  return uthread_pool[i].tid;
}
 a16:	5b                   	pop    %ebx
 a17:	5e                   	pop    %esi
 a18:	5d                   	pop    %ebp
 a19:	c3                   	ret    
 a1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  alarm(UTHREAD_QUANTA);
  return -1;

load_t:
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
 a20:	8b 15 e8 11 00 00    	mov    0x11e8,%edx
 a26:	8d 1c 40             	lea    (%eax,%eax,2),%ebx
  // update next tid
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
 a29:	83 ec 0c             	sub    $0xc,%esp
 a2c:	68 00 10 00 00       	push   $0x1000
  alarm(UTHREAD_QUANTA);
  return -1;

load_t:
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
 a31:	c1 e3 03             	shl    $0x3,%ebx
 a34:	89 93 40 11 00 00    	mov    %edx,0x1140(%ebx)
  // update next tid
  next_tid++;
 a3a:	83 c2 01             	add    $0x1,%edx
 a3d:	89 15 e8 11 00 00    	mov    %edx,0x11e8
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
 a43:	e8 18 fc ff ff       	call   660 <malloc>

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
 a48:	8b 55 08             	mov    0x8(%ebp),%edx
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
 a4b:	c7 80 f4 0f 00 00 00 	movl   $0x0,0xff4(%eax)
 a52:	00 00 00 
  // next free tid to assign
  uthread_pool[i].tid = next_tid;
  // update next tid
  next_tid++;
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);
 a55:	89 83 4c 11 00 00    	mov    %eax,0x114c(%ebx)
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - sizeof(int)) ) = (int)arg;

  // set thread state to RUNNABLE, ready to run
  uthread_pool[i].state = RUNNABLE;
 a5b:	c7 83 50 11 00 00 02 	movl   $0x2,0x1150(%ebx)
 a62:	00 00 00 

  // set esp and ebp to null, while thread is not in RUNNING state yet
  uthread_pool[i].esp = 0;
 a65:	c7 83 44 11 00 00 00 	movl   $0x0,0x1144(%ebx)
 a6c:	00 00 00 
  uthread_pool[i].ebp = 0;
 a6f:	c7 83 48 11 00 00 00 	movl   $0x0,0x1148(%ebx)
 a76:	00 00 00 
  // allocate stack for thread and returns the stack top to .stack field
  uthread_pool[i].stack = malloc(STACK_SIZE);

  // load thread execute function to stack with arguments and return value
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 3*sizeof(int)) ) = 0; 
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - 2*sizeof(int)) ) = (int)func;
 a79:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *( (int*)(uthread_pool[i].stack + STACK_SIZE - sizeof(int)) ) = (int)arg;
 a7f:	8b 55 0c             	mov    0xc(%ebp),%edx
 a82:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)
  uthread_pool[i].esp = 0;
  uthread_pool[i].ebp = 0;
  

  // enable thread switching
  printf(1, "creation method: returning.. \n");
 a88:	58                   	pop    %eax
 a89:	5a                   	pop    %edx
 a8a:	68 04 0d 00 00       	push   $0xd04
 a8f:	6a 01                	push   $0x1
 a91:	e8 9a f9 ff ff       	call   430 <printf>
  alarm(UTHREAD_QUANTA);
 a96:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 a9d:	e8 d8 f8 ff ff       	call   37a <alarm>

  return uthread_pool[i].tid;
 aa2:	8b 83 40 11 00 00    	mov    0x1140(%ebx),%eax
 aa8:	83 c4 10             	add    $0x10,%esp
}
 aab:	8d 65 f8             	lea    -0x8(%ebp),%esp
 aae:	5b                   	pop    %ebx
 aaf:	5e                   	pop    %esi
 ab0:	5d                   	pop    %ebp
 ab1:	c3                   	ret    
 ab2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ac0 <uthread_exit>:

void 
uthread_exit(void)
{
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
 ac3:	53                   	push   %ebx
 ac4:	83 ec 10             	sub    $0x10,%esp

  int i;

  // disable thread switching
  alarm(0);
 ac7:	6a 00                	push   $0x0
 ac9:	e8 ac f8 ff ff       	call   37a <alarm>

  // deallocate thread memory
  if (uthread_pool[c_uthread_index].stack != 0) {
 ace:	a1 20 11 00 00       	mov    0x1120,%eax
 ad3:	83 c4 10             	add    $0x10,%esp
 ad6:	8d 14 40             	lea    (%eax,%eax,2),%edx
 ad9:	8b 14 d5 4c 11 00 00 	mov    0x114c(,%edx,8),%edx
 ae0:	85 d2                	test   %edx,%edx
 ae2:	74 11                	je     af5 <uthread_exit+0x35>
    free(uthread_pool[c_uthread_index].stack);
 ae4:	83 ec 0c             	sub    $0xc,%esp
 ae7:	52                   	push   %edx
 ae8:	e8 e3 fa ff ff       	call   5d0 <free>
 aed:	a1 20 11 00 00       	mov    0x1120,%eax
 af2:	83 c4 10             	add    $0x10,%esp
  }

  // deallocate thread from thread pool
  uthread_pool[c_uthread_index].state = FREE;
 af5:	8d 04 40             	lea    (%eax,%eax,2),%eax
 af8:	bb 50 11 00 00       	mov    $0x1150,%ebx
 afd:	c7 04 c5 50 11 00 00 	movl   $0x0,0x1150(,%eax,8)
 b04:	00 00 00 00 
 b08:	89 d8                	mov    %ebx,%eax
 b0a:	eb 0e                	jmp    b1a <uthread_exit+0x5a>
 b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 b10:	83 c0 18             	add    $0x18,%eax

  // if any thread is waiting for current thread, get them back to RUNNABLE state
  for(i = 0; i < MAX_THREADS; ++i) {
 b13:	3d f8 11 00 00       	cmp    $0x11f8,%eax
 b18:	74 26                	je     b40 <uthread_exit+0x80>
    if (uthread_pool[i].state == SLEEP) {
 b1a:	83 38 03             	cmpl   $0x3,(%eax)
 b1d:	75 f1                	jne    b10 <uthread_exit+0x50>
      uthread_pool[i].state = RUNNABLE;
 b1f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
 b25:	eb e9                	jmp    b10 <uthread_exit+0x50>
 b27:	89 f6                	mov    %esi,%esi
 b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 b30:	83 c3 18             	add    $0x18,%ebx

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
    if (uthread_pool[i].state != FREE) {
      // found thread that is eligible to run, yield
      uthread_yield();
 b33:	e8 18 fc ff ff       	call   750 <uthread_yield>
      uthread_pool[i].state = RUNNABLE;
    }
  }

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
 b38:	81 fb f8 11 00 00    	cmp    $0x11f8,%ebx
 b3e:	74 11                	je     b51 <uthread_exit+0x91>
    if (uthread_pool[i].state != FREE) {
 b40:	8b 03                	mov    (%ebx),%eax
 b42:	85 c0                	test   %eax,%eax
 b44:	75 ea                	jne    b30 <uthread_exit+0x70>
 b46:	83 c3 18             	add    $0x18,%ebx
      uthread_pool[i].state = RUNNABLE;
    }
  }

  // Check if there are any other uthread_pool that can be switched to
  for(i = 0; i < MAX_THREADS; ++i) {
 b49:	81 fb f8 11 00 00    	cmp    $0x11f8,%ebx
 b4f:	75 ef                	jne    b40 <uthread_exit+0x80>
      // found thread that is eligible to run, yield
      uthread_yield();
    }
  }
  // no ready to run threads, exit
  exit();
 b51:	e8 6c f7 ff ff       	call   2c2 <exit>
 b56:	8d 76 00             	lea    0x0(%esi),%esi
 b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b60 <execute_thread>:
int current_ticket_num;
// choosen lottery thread
int choosen;

static void 
execute_thread(void (*start_func)(void *), void* arg) {
 b60:	55                   	push   %ebp
 b61:	89 e5                	mov    %esp,%ebp
 b63:	83 ec 10             	sub    $0x10,%esp
  printf(1, "+++RUN THREAD+++ \n");
 b66:	68 cf 0c 00 00       	push   $0xccf
 b6b:	6a 01                	push   $0x1
 b6d:	e8 be f8 ff ff       	call   430 <printf>
  alarm(UTHREAD_QUANTA);
 b72:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 b79:	e8 fc f7 ff ff       	call   37a <alarm>
  start_func(arg);
 b7e:	58                   	pop    %eax
 b7f:	ff 75 0c             	pushl  0xc(%ebp)
 b82:	ff 55 08             	call   *0x8(%ebp)
  uthread_exit();
 b85:	e8 36 ff ff ff       	call   ac0 <uthread_exit>
 b8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b90 <uthred_self>:

int 
uthred_self(void)
{
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
 b90:	a1 20 11 00 00       	mov    0x1120,%eax
  }
}

int 
uthred_self(void)
{
 b95:	55                   	push   %ebp
 b96:	89 e5                	mov    %esp,%ebp
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
 b98:	8d 04 40             	lea    (%eax,%eax,2),%eax
}
 b9b:	5d                   	pop    %ebp

int 
uthred_self(void)
{
  // return current running thread tid
  return uthread_pool[c_uthread_index].tid;
 b9c:	8b 04 c5 40 11 00 00 	mov    0x1140(,%eax,8),%eax
}
 ba3:	c3                   	ret    
 ba4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 baa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000bb0 <uthred_join>:

int  
uthred_join(int tid)
{
 bb0:	55                   	push   %ebp
 bb1:	89 e5                	mov    %esp,%ebp
 bb3:	53                   	push   %ebx
 bb4:	83 ec 04             	sub    $0x4,%esp
 bb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  // if tid is not declared yet or is a negative number, error occured, return
  if(tid >= next_tid || tid < 0) {
 bba:	39 1d e8 11 00 00    	cmp    %ebx,0x11e8
 bc0:	7e 60                	jle    c22 <uthred_join+0x72>
 bc2:	89 d8                	mov    %ebx,%eax
 bc4:	c1 e8 1f             	shr    $0x1f,%eax
 bc7:	84 c0                	test   %al,%al
 bc9:	75 57                	jne    c22 <uthred_join+0x72>
  }

loop:

  // disable thread switching
  alarm(0);
 bcb:	83 ec 0c             	sub    $0xc,%esp
 bce:	6a 00                	push   $0x0
 bd0:	e8 a5 f7 ff ff       	call   37a <alarm>
 bd5:	b8 40 11 00 00       	mov    $0x1140,%eax
 bda:	83 c4 10             	add    $0x10,%esp
 bdd:	8d 76 00             	lea    0x0(%esi),%esi

  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
    // searching for a thread with the relevant tid
    if(uthread_pool[i].tid == tid) {
 be0:	3b 18                	cmp    (%eax),%ebx
 be2:	74 24                	je     c08 <uthred_join+0x58>
 be4:	83 c0 18             	add    $0x18,%eax

  // disable thread switching
  alarm(0);

  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
 be7:	3d e8 11 00 00       	cmp    $0x11e8,%eax
 bec:	75 f2                	jne    be0 <uthred_join+0x30>

    }
  }

  // the joined thread is not alive anyway, reset clock
  alarm(UTHREAD_QUANTA);
 bee:	83 ec 0c             	sub    $0xc,%esp
 bf1:	6a 05                	push   $0x5
 bf3:	e8 82 f7 ff ff       	call   37a <alarm>

  return 0;
 bf8:	83 c4 10             	add    $0x10,%esp
 bfb:	31 c0                	xor    %eax,%eax
}
 bfd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 c00:	c9                   	leave  
 c01:	c3                   	ret    
 c02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  // run over all threads
  for(i = 0; i < MAX_THREADS; ++i) {
    // searching for a thread with the relevant tid
    if(uthread_pool[i].tid == tid) {
      // put current running thread to sleep
      uthread_pool[c_uthread_index].state = SLEEP;
 c08:	a1 20 11 00 00       	mov    0x1120,%eax
 c0d:	8d 04 40             	lea    (%eax,%eax,2),%eax
 c10:	c7 04 c5 50 11 00 00 	movl   $0x3,0x1150(,%eax,8)
 c17:	03 00 00 00 
      // let other thread to run 
      uthread_yield();
 c1b:	e8 30 fb ff ff       	call   750 <uthread_yield>

      // if thread still alive, loop over the join procedure again
      goto loop;
 c20:	eb a9                	jmp    bcb <uthred_join+0x1b>
{
  int i;

  // if tid is not declared yet or is a negative number, error occured, return
  if(tid >= next_tid || tid < 0) {
    return -1;
 c22:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 c27:	eb d4                	jmp    bfd <uthred_join+0x4d>
