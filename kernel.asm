
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:

# Entering xv6 on boot processor, with paging off.
.globl entry
entry:
  # Turn on page size extension for 4Mbyte pages
  movl    %cr4, %eax
8010000c:	0f 20 e0             	mov    %cr4,%eax
  orl     $(CR4_PSE), %eax
8010000f:	83 c8 10             	or     $0x10,%eax
  movl    %eax, %cr4
80100012:	0f 22 e0             	mov    %eax,%cr4
  # Set page directory
  movl    $(V2P_WO(entrypgdir)), %eax
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
  movl    %eax, %cr3
8010001a:	0f 22 d8             	mov    %eax,%cr3
  # Turn on paging.
  movl    %cr0, %eax
8010001d:	0f 20 c0             	mov    %cr0,%eax
  orl     $(CR0_PG|CR0_WP), %eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
  movl    %eax, %cr0
80100025:	0f 22 c0             	mov    %eax,%cr0

  # Set up the stack pointer.
  movl $(stack + KSTACKSIZE), %esp
80100028:	bc d0 b5 10 80       	mov    $0x8010b5d0,%esp

  # Jump to main(), and switch to executing at
  # high addresses. The indirect call is needed because
  # the assembler produces a PC-relative instruction
  # for a direct jump.
  mov $main, %eax
8010002d:	b8 10 2f 10 80       	mov    $0x80102f10,%eax
  jmp *%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
  struct buf head;
} bcache;

void
binit(void)
{
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
80100044:	bb 14 b6 10 80       	mov    $0x8010b614,%ebx
  struct buf head;
} bcache;

void
binit(void)
{
80100049:	83 ec 0c             	sub    $0xc,%esp
  struct buf *b;

  initlock(&bcache.lock, "bcache");
8010004c:	68 20 74 10 80       	push   $0x80107420
80100051:	68 e0 b5 10 80       	push   $0x8010b5e0
80100056:	e8 15 44 00 00       	call   80104470 <initlock>

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
8010005b:	c7 05 2c fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd2c
80100062:	fc 10 80 
  bcache.head.next = &bcache.head;
80100065:	c7 05 30 fd 10 80 dc 	movl   $0x8010fcdc,0x8010fd30
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba dc fc 10 80       	mov    $0x8010fcdc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
    b->next = bcache.head.next;
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
    b->prev = &bcache.head;
8010008b:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
    initsleeplock(&b->lock, "buffer");
80100092:	68 27 74 10 80       	push   $0x80107427
80100097:	50                   	push   %eax
80100098:	e8 c3 42 00 00       	call   80104360 <initsleeplock>
    bcache.head.next->prev = b;
8010009d:	a1 30 fd 10 80       	mov    0x8010fd30,%eax

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
    b->next = bcache.head.next;
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
801000b0:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30

//PAGEBREAK!
  // Create linked list of buffers
  bcache.head.prev = &bcache.head;
  bcache.head.next = &bcache.head;
  for(b = bcache.buf; b < bcache.buf+NBUF; b++){
801000b6:	3d dc fc 10 80       	cmp    $0x8010fcdc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
    b->prev = &bcache.head;
    initsleeplock(&b->lock, "buffer");
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
}
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
}

// Return a locked buf with the contents of the indicated block.
struct buf*
bread(uint dev, uint blockno)
{
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
static struct buf*
bget(uint dev, uint blockno)
{
  struct buf *b;

  acquire(&bcache.lock);
801000df:	68 e0 b5 10 80       	push   $0x8010b5e0
801000e4:	e8 a7 43 00 00       	call   80104490 <acquire>

  // Is the block already cached?
  for(b = bcache.head.next; b != &bcache.head; b = b->next){
801000e9:	8b 1d 30 fd 10 80    	mov    0x8010fd30,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
    if(b->dev == dev && b->blockno == blockno){
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
      b->refcnt++;
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  // Not cached; recycle some unused buffer and clean buffer
  // "clean" because B_DIRTY and not locked means log.c
  // hasn't yet committed the changes to the buffer.
  for(b = bcache.head.prev; b != &bcache.head; b = b->prev){
80100120:	8b 1d 2c fd 10 80    	mov    0x8010fd2c,%ebx
80100126:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb dc fc 10 80    	cmp    $0x8010fcdc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
    if(b->refcnt == 0 && (b->flags & B_DIRTY) == 0) {
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
      b->dev = dev;
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
      b->blockno = blockno;
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
      b->flags = 0;
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
      b->refcnt = 1;
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
      release(&bcache.lock);
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 e0 b5 10 80       	push   $0x8010b5e0
80100162:	e8 09 45 00 00       	call   80104670 <release>
      acquiresleep(&b->lock);
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 2e 42 00 00       	call   801043a0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
bread(uint dev, uint blockno)
{
  struct buf *b;

  b = bget(dev, blockno);
  if(!(b->flags & B_VALID)) {
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
    iderw(b);
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 8d 1f 00 00       	call   80102110 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
  }
  return b;
}
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
      release(&bcache.lock);
      acquiresleep(&b->lock);
      return b;
    }
  }
  panic("bget: no buffers");
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 2e 74 10 80       	push   $0x8010742e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
}

// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 8d 42 00 00       	call   80104440 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
    panic("bwrite");
  b->flags |= B_DIRTY;
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
  iderw(b);
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
  b->flags |= B_DIRTY;
  iderw(b);
801001c4:	e9 47 1f 00 00       	jmp    80102110 <iderw>
// Write b's contents to disk.  Must be locked.
void
bwrite(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("bwrite");
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 3f 74 10 80       	push   $0x8010743f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:

// Release a locked buffer.
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(!holdingsleep(&b->lock))
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 4c 42 00 00       	call   80104440 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
    panic("brelse");

  releasesleep(&b->lock);
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 fc 41 00 00       	call   80104400 <releasesleep>

  acquire(&bcache.lock);
80100204:	c7 04 24 e0 b5 10 80 	movl   $0x8010b5e0,(%esp)
8010020b:	e8 80 42 00 00       	call   80104490 <acquire>
  b->refcnt--;
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
  if (b->refcnt == 0) {
80100213:	83 c4 10             	add    $0x10,%esp
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
80100216:	83 e8 01             	sub    $0x1,%eax
  if (b->refcnt == 0) {
80100219:	85 c0                	test   %eax,%eax
    panic("brelse");

  releasesleep(&b->lock);

  acquire(&bcache.lock);
  b->refcnt--;
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
  if (b->refcnt == 0) {
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
    // no one is waiting for it.
    b->next->prev = b->prev;
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
    b->prev->next = b->next;
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
    b->next = bcache.head.next;
80100232:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
    b->prev = &bcache.head;
80100237:	c7 43 50 dc fc 10 80 	movl   $0x8010fcdc,0x50(%ebx)
  b->refcnt--;
  if (b->refcnt == 0) {
    // no one is waiting for it.
    b->next->prev = b->prev;
    b->prev->next = b->next;
    b->next = bcache.head.next;
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
80100241:	a1 30 fd 10 80       	mov    0x8010fd30,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
    bcache.head.next = b;
80100249:	89 1d 30 fd 10 80    	mov    %ebx,0x8010fd30
  }
  
  release(&bcache.lock);
8010024f:	c7 45 08 e0 b5 10 80 	movl   $0x8010b5e0,0x8(%ebp)
}
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
    b->prev = &bcache.head;
    bcache.head.next->prev = b;
    bcache.head.next = b;
  }
  
  release(&bcache.lock);
8010025c:	e9 0f 44 00 00       	jmp    80104670 <release>
// Move to the head of the MRU list.
void
brelse(struct buf *b)
{
  if(!holdingsleep(&b->lock))
    panic("brelse");
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 46 74 10 80       	push   $0x80107446
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
  }
}

int
consoleread(struct inode *ip, char *dst, int n)
{
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
  uint target;
  int c;

  iunlock(ip);
8010027f:	57                   	push   %edi
80100280:	e8 fb 14 00 00       	call   80101780 <iunlock>
  target = n;
  acquire(&cons.lock);
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 ff 41 00 00       	call   80104490 <acquire>
  while(n > 0){
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
    while(input.r == input.w){
801002a1:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002a6:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
      if(proc->killed){
        release(&cons.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 a5 10 80       	push   $0x8010a520
801002b8:	68 c0 ff 10 80       	push   $0x8010ffc0
801002bd:	e8 ce 3b 00 00       	call   80103e90 <sleep>

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
    while(input.r == input.w){
801002c2:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
      if(proc->killed){
801002d2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801002d8:	8b 40 24             	mov    0x24(%eax),%eax
801002db:	85 c0                	test   %eax,%eax
801002dd:	74 d1                	je     801002b0 <consoleread+0x40>
        release(&cons.lock);
801002df:	83 ec 0c             	sub    $0xc,%esp
801002e2:	68 20 a5 10 80       	push   $0x8010a520
801002e7:	e8 84 43 00 00       	call   80104670 <release>
        ilock(ip);
801002ec:	89 3c 24             	mov    %edi,(%esp)
801002ef:	e8 ac 13 00 00       	call   801016a0 <ilock>
        return -1;
801002f4:	83 c4 10             	add    $0x10,%esp
801002f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  release(&cons.lock);
  ilock(ip);

  return target - n;
}
801002fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002ff:	5b                   	pop    %ebx
80100300:	5e                   	pop    %esi
80100301:	5f                   	pop    %edi
80100302:	5d                   	pop    %ebp
80100303:	c3                   	ret    
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 c0 ff 10 80    	mov    %edx,0x8010ffc0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 40 ff 10 80 	movsbl -0x7fef00c0(%edx),%edx
    if(c == C('D')){  // EOF
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
80100322:	83 c6 01             	add    $0x1,%esi
    --n;
80100325:	83 eb 01             	sub    $0x1,%ebx
    if(c == '\n')
80100328:	83 fa 0a             	cmp    $0xa,%edx
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
    --n;
    if(c == '\n')
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
  int c;

  iunlock(ip);
  target = n;
  acquire(&cons.lock);
  while(n > 0){
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&cons.lock);
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 a5 10 80       	push   $0x8010a520
80100346:	e8 25 43 00 00       	call   80104670 <release>
  ilock(ip);
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 4d 13 00 00       	call   801016a0 <ilock>

  return target - n;
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a1                	jmp    801002fc <consoleread+0x8c>
      }
      sleep(&input.r, &cons.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
80100360:	a3 c0 ff 10 80       	mov    %eax,0x8010ffc0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
    release(&cons.lock);
}

void
panic(char *s)
{
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 38             	sub    $0x38,%esp
}

static inline void
cli(void)
{
  asm volatile("cli");
80100378:	fa                   	cli    
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
80100379:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
{
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
8010037f:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
80100386:	00 00 00 
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
80100389:	8d 5d d0             	lea    -0x30(%ebp),%ebx
8010038c:	8d 75 f8             	lea    -0x8(%ebp),%esi
  int i;
  uint pcs[10];

  cli();
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
8010038f:	0f b6 00             	movzbl (%eax),%eax
80100392:	50                   	push   %eax
80100393:	68 4d 74 10 80       	push   $0x8010744d
80100398:	e8 c3 02 00 00       	call   80100660 <cprintf>
  cprintf(s);
8010039d:	58                   	pop    %eax
8010039e:	ff 75 08             	pushl  0x8(%ebp)
801003a1:	e8 ba 02 00 00       	call   80100660 <cprintf>
  cprintf("\n");
801003a6:	c7 04 24 46 79 10 80 	movl   $0x80107946,(%esp)
801003ad:	e8 ae 02 00 00       	call   80100660 <cprintf>
  getcallerpcs(&s, pcs);
801003b2:	5a                   	pop    %edx
801003b3:	8d 45 08             	lea    0x8(%ebp),%eax
801003b6:	59                   	pop    %ecx
801003b7:	53                   	push   %ebx
801003b8:	50                   	push   %eax
801003b9:	e8 a2 41 00 00       	call   80104560 <getcallerpcs>
801003be:	83 c4 10             	add    $0x10,%esp
801003c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
801003c8:	83 ec 08             	sub    $0x8,%esp
801003cb:	ff 33                	pushl  (%ebx)
801003cd:	83 c3 04             	add    $0x4,%ebx
801003d0:	68 69 74 10 80       	push   $0x80107469
801003d5:	e8 86 02 00 00       	call   80100660 <cprintf>
  cons.locking = 0;
  cprintf("cpu with apicid %d: panic: ", cpu->apicid);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
801003da:	83 c4 10             	add    $0x10,%esp
801003dd:	39 f3                	cmp    %esi,%ebx
801003df:	75 e7                	jne    801003c8 <panic+0x58>
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
801003e1:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
801003e8:	00 00 00 
801003eb:	eb fe                	jmp    801003eb <panic+0x7b>
801003ed:	8d 76 00             	lea    0x0(%esi),%esi

801003f0 <consputc>:
}

void
consputc(int c)
{
  if(panicked){
801003f0:	8b 15 58 a5 10 80    	mov    0x8010a558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
    cli();
    for(;;)
      ;
  }

  if(c == BACKSPACE){
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 f1 5b 00 00       	call   80106010 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
{
  int pos;

  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
80100437:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax

  if(c == '\n')
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 

  if(pos < 0 || pos > 25*80)
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)

  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
    for(;;)
      ;
  }

  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 38 5b 00 00       	call   80106010 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 2c 5b 00 00       	call   80106010 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 20 5b 00 00       	call   80106010 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004f8:	83 ec 04             	sub    $0x4,%esp
    pos -= 80;
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");

  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
80100514:	e8 57 42 00 00       	call   80104770 <memmove>
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 92 41 00 00       	call   801046c0 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white

  if(pos < 0 || pos > 25*80)
    panic("pos under/overflow");
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 6d 74 10 80       	push   $0x8010746d
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
8010058b:	85 c9                	test   %ecx,%ecx
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
    x = -xx;
  else
    x = xx;

  i = 0;
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 98 74 10 80 	movzbl -0x7fef8b68(%edx),%edx
  }while((x /= base) != 0);
801005b8:	85 c0                	test   %eax,%eax
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
801005bd:	75 e9                	jne    801005a8 <printint+0x28>

  if(sign)
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
    buf[i++] = '-';
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  while(--i >= 0)
    consputc(buf[i]);
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
    consputc(buf[i]);
}
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
  int i;

  iunlock(ip);
80100609:	ff 75 08             	pushl  0x8(%ebp)
  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
  int i;

  iunlock(ip);
8010060f:	e8 6c 11 00 00       	call   80101780 <iunlock>
  acquire(&cons.lock);
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 70 3e 00 00       	call   80104490 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
  for(i = 0; i < n; i++)
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
    consputc(buf[i] & 0xff);
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
    consputc(buf[i] & 0xff);
  release(&cons.lock);
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 24 40 00 00       	call   80104670 <release>
  ilock(ip);
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 4b 10 00 00       	call   801016a0 <ilock>

  return n;
}
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
  if(locking)
8010066e:	85 c0                	test   %eax,%eax
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(locking)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
    acquire(&cons.lock);

  if (fmt == 0)
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
    if(c == 0)
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
      break;
    switch(c){
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
    if(c != '%'){
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
      consputc(c);
      break;
    }
  }

  if(locking)
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
    release(&cons.lock);
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 a5 10 80       	push   $0x8010a520
8010070d:	e8 5e 3f 00 00       	call   80104670 <release>
80100712:	83 c4 10             	add    $0x10,%esp
}
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
      break;
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
      consputc(c);
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
      break;
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        s = "(null)";
80100788:	b8 80 74 10 80       	mov    $0x80107480,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
      for(; *s; s++)
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
        consputc(*s);
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 a5 10 80       	push   $0x8010a520
801007c8:	e8 c3 3c 00 00       	call   80104490 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>

  if (fmt == 0)
    panic("null fmt");
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 87 74 10 80       	push   $0x80107487
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
  int c, doprocdump = 0;
801007f6:	31 f6                	xor    %esi,%esi

#define C(x)  ((x)-'@')  // Control-x

void
consoleintr(int (*getc)(void))
{
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int c, doprocdump = 0;

  acquire(&cons.lock);
801007fe:	68 20 a5 10 80       	push   $0x8010a520
80100803:	e8 88 3c 00 00       	call   80104490 <acquire>
  while((c = getc()) >= 0){
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
    switch(c){
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
80100831:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100836:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
        input.e--;
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
consoleintr(int (*getc)(void))
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        }
      }
      break;
    }
  }
  release(&cons.lock);
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 a5 10 80       	push   $0x8010a520
80100868:	e8 03 3e 00 00       	call   80104670 <release>
  if(doprocdump) {
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
{
  int c, doprocdump = 0;

  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
        input.e--;
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 c0 ff 10 80    	sub    0x8010ffc0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008a5:	83 ff 0d             	cmp    $0xd,%edi
        input.buf[input.e++ % INPUT_BUF] = c;
801008a8:	89 15 c8 ff 10 80    	mov    %edx,0x8010ffc8
        consputc(BACKSPACE);
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
        input.buf[input.e++ % INPUT_BUF] = c;
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 40 ff 10 80    	mov    %cl,-0x7fef00c0(%eax)
        consputc(c);
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 c0 ff 10 80       	mov    0x8010ffc0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 c8 ff 10 80    	cmp    %eax,0x8010ffc8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
          input.w = input.e;
          wakeup(&input.r);
801008e9:	83 ec 0c             	sub    $0xc,%esp
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
        consputc(c);
        if(c == '\n' || c == C('D') || input.e == input.r+INPUT_BUF){
          input.w = input.e;
801008ec:	a3 c4 ff 10 80       	mov    %eax,0x8010ffc4
          wakeup(&input.r);
801008f1:	68 c0 ff 10 80       	push   $0x8010ffc0
801008f6:	e8 45 37 00 00       	call   80104040 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100908:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
8010090d:	39 05 c4 ff 10 80    	cmp    %eax,0x8010ffc4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        input.e--;
80100920:	a3 c8 ff 10 80       	mov    %eax,0x8010ffc8
        consputc(BACKSPACE);
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
8010092f:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100934:	3b 05 c4 ff 10 80    	cmp    0x8010ffc4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
80100948:	80 ba 40 ff 10 80 0a 	cmpb   $0xa,-0x7fef00c0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  acquire(&cons.lock);
  while((c = getc()) >= 0){
    switch(c){
    case C('P'):  // Process listing.
      // procdump() locks cons.lock indirectly; invoke later
      doprocdump = 1;
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
  }
}
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
      break;
    }
  }
  release(&cons.lock);
  if(doprocdump) {
    procdump();  // now call procdump() wo. cons.lock held
80100977:	e9 b4 37 00 00       	jmp    80104130 <procdump>
      }
      break;
    default:
      if(c != 0 && input.e-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        input.buf[input.e++ % INPUT_BUF] = c;
8010097c:	c6 80 40 ff 10 80 0a 	movb   $0xa,-0x7fef00c0(%eax)
        consputc(c);
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 c8 ff 10 80       	mov    0x8010ffc8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
  return n;
}

void
consoleinit(void)
{
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
  initlock(&cons.lock, "console");
801009a6:	68 90 74 10 80       	push   $0x80107490
801009ab:	68 20 a5 10 80       	push   $0x8010a520
801009b0:	e8 bb 3a 00 00       	call   80104470 <initlock>

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  picenable(IRQ_KBD);
801009b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
void
consoleinit(void)
{
  initlock(&cons.lock, "console");

  devsw[CONSOLE].write = consolewrite;
801009bc:	c7 05 8c 09 11 80 00 	movl   $0x80100600,0x8011098c
801009c3:	06 10 80 
  devsw[CONSOLE].read = consoleread;
801009c6:	c7 05 88 09 11 80 70 	movl   $0x80100270,0x80110988
801009cd:	02 10 80 
  cons.locking = 1;
801009d0:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009d7:	00 00 00 

  picenable(IRQ_KBD);
801009da:	e8 f1 28 00 00       	call   801032d0 <picenable>
  ioapicenable(IRQ_KBD, 0);
801009df:	58                   	pop    %eax
801009e0:	5a                   	pop    %edx
801009e1:	6a 00                	push   $0x0
801009e3:	6a 01                	push   $0x1
801009e5:	e8 e6 18 00 00       	call   801022d0 <ioapicenable>
}
801009ea:	83 c4 10             	add    $0x10,%esp
801009ed:	c9                   	leave  
801009ee:	c3                   	ret    
801009ef:	90                   	nop

801009f0 <exec>:
/*------------------------------------------------*/


int
exec(char *path, char **argv)
{
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
  struct elfhdr elf;
  struct inode *ip;
  struct proghdr ph;
  pde_t *pgdir, *oldpgdir;

  begin_op();
801009fc:	e8 ff 21 00 00       	call   80102c00 <begin_op>

  if((ip = namei(path)) == 0){
80100a01:	83 ec 0c             	sub    $0xc,%esp
80100a04:	ff 75 08             	pushl  0x8(%ebp)
80100a07:	e8 c4 14 00 00       	call   80101ed0 <namei>
80100a0c:	83 c4 10             	add    $0x10,%esp
80100a0f:	85 c0                	test   %eax,%eax
80100a11:	0f 84 a3 01 00 00    	je     80100bba <exec+0x1ca>
    end_op();
    return -1;
  }
  ilock(ip);
80100a17:	83 ec 0c             	sub    $0xc,%esp
80100a1a:	89 c3                	mov    %eax,%ebx
80100a1c:	50                   	push   %eax
80100a1d:	e8 7e 0c 00 00       	call   801016a0 <ilock>
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
80100a22:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a28:	6a 34                	push   $0x34
80100a2a:	6a 00                	push   $0x0
80100a2c:	50                   	push   %eax
80100a2d:	53                   	push   %ebx
80100a2e:	e8 2d 0f 00 00       	call   80101960 <readi>
80100a33:	83 c4 20             	add    $0x20,%esp
80100a36:	83 f8 33             	cmp    $0x33,%eax
80100a39:	77 25                	ja     80100a60 <exec+0x70>

 bad:
  if(pgdir)
    freevm(pgdir);
  if(ip){
    iunlockput(ip);
80100a3b:	83 ec 0c             	sub    $0xc,%esp
80100a3e:	53                   	push   %ebx
80100a3f:	e8 cc 0e 00 00       	call   80101910 <iunlockput>
    end_op();
80100a44:	e8 27 22 00 00       	call   80102c70 <end_op>
80100a49:	83 c4 10             	add    $0x10,%esp
  }
  return -1;
80100a4c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100a51:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a54:	5b                   	pop    %ebx
80100a55:	5e                   	pop    %esi
80100a56:	5f                   	pop    %edi
80100a57:	5d                   	pop    %ebp
80100a58:	c3                   	ret    
80100a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  pgdir = 0;

  // Check ELF header
  if(readi(ip, (char*)&elf, 0, sizeof(elf)) < sizeof(elf))
    goto bad;
  if(elf.magic != ELF_MAGIC)
80100a60:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a67:	45 4c 46 
80100a6a:	75 cf                	jne    80100a3b <exec+0x4b>
    goto bad;

  if((pgdir = setupkvm()) == 0)
80100a6c:	e8 5f 63 00 00       	call   80106dd0 <setupkvm>
80100a71:	85 c0                	test   %eax,%eax
80100a73:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a79:	74 c0                	je     80100a3b <exec+0x4b>
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100a7b:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a82:	00 
80100a83:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a89:	0f 84 d9 02 00 00    	je     80100d68 <exec+0x378>
80100a8f:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
80100a96:	00 00 00 
80100a99:	31 ff                	xor    %edi,%edi
80100a9b:	eb 18                	jmp    80100ab5 <exec+0xc5>
80100a9d:	8d 76 00             	lea    0x0(%esi),%esi
80100aa0:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aa7:	83 c7 01             	add    $0x1,%edi
80100aaa:	83 c6 20             	add    $0x20,%esi
80100aad:	39 f8                	cmp    %edi,%eax
80100aaf:	0f 8e ab 00 00 00    	jle    80100b60 <exec+0x170>
    if(readi(ip, (char*)&ph, off, sizeof(ph)) != sizeof(ph))
80100ab5:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100abb:	6a 20                	push   $0x20
80100abd:	56                   	push   %esi
80100abe:	50                   	push   %eax
80100abf:	53                   	push   %ebx
80100ac0:	e8 9b 0e 00 00       	call   80101960 <readi>
80100ac5:	83 c4 10             	add    $0x10,%esp
80100ac8:	83 f8 20             	cmp    $0x20,%eax
80100acb:	75 7b                	jne    80100b48 <exec+0x158>
      goto bad;
    if(ph.type != ELF_PROG_LOAD)
80100acd:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100ad4:	75 ca                	jne    80100aa0 <exec+0xb0>
      continue;
    if(ph.memsz < ph.filesz)
80100ad6:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100adc:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100ae2:	72 64                	jb     80100b48 <exec+0x158>
      goto bad;
    if(ph.vaddr + ph.memsz < ph.vaddr)
80100ae4:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100aea:	72 5c                	jb     80100b48 <exec+0x158>
      goto bad;
    if((sz = allocuvm(pgdir, sz, ph.vaddr + ph.memsz)) == 0)
80100aec:	83 ec 04             	sub    $0x4,%esp
80100aef:	50                   	push   %eax
80100af0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af6:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100afc:	e8 5f 65 00 00       	call   80107060 <allocuvm>
80100b01:	83 c4 10             	add    $0x10,%esp
80100b04:	85 c0                	test   %eax,%eax
80100b06:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100b0c:	74 3a                	je     80100b48 <exec+0x158>
      goto bad;
    if(ph.vaddr % PGSIZE != 0)
80100b0e:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b14:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b19:	75 2d                	jne    80100b48 <exec+0x158>
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
80100b1b:	83 ec 0c             	sub    $0xc,%esp
80100b1e:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b24:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b2a:	53                   	push   %ebx
80100b2b:	50                   	push   %eax
80100b2c:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b32:	e8 69 64 00 00       	call   80106fa0 <loaduvm>
80100b37:	83 c4 20             	add    $0x20,%esp
80100b3a:	85 c0                	test   %eax,%eax
80100b3c:	0f 89 5e ff ff ff    	jns    80100aa0 <exec+0xb0>
80100b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b48:	83 ec 0c             	sub    $0xc,%esp
80100b4b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b51:	e8 3a 66 00 00       	call   80107190 <freevm>
80100b56:	83 c4 10             	add    $0x10,%esp
80100b59:	e9 dd fe ff ff       	jmp    80100a3b <exec+0x4b>
80100b5e:	66 90                	xchg   %ax,%ax
80100b60:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100b66:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
80100b6c:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80100b72:	8d be 00 20 00 00    	lea    0x2000(%esi),%edi
    if(ph.vaddr % PGSIZE != 0)
      goto bad;
    if(loaduvm(pgdir, (char*)ph.vaddr, ip, ph.off, ph.filesz) < 0)
      goto bad;
  }
  iunlockput(ip);
80100b78:	83 ec 0c             	sub    $0xc,%esp
80100b7b:	53                   	push   %ebx
80100b7c:	e8 8f 0d 00 00       	call   80101910 <iunlockput>
  end_op();
80100b81:	e8 ea 20 00 00       	call   80102c70 <end_op>
  ip = 0;

  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
80100b86:	83 c4 0c             	add    $0xc,%esp
80100b89:	57                   	push   %edi
80100b8a:	56                   	push   %esi
80100b8b:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100b91:	e8 ca 64 00 00       	call   80107060 <allocuvm>
80100b96:	83 c4 10             	add    $0x10,%esp
80100b99:	85 c0                	test   %eax,%eax
80100b9b:	89 c6                	mov    %eax,%esi
80100b9d:	75 2a                	jne    80100bc9 <exec+0x1d9>
  freevm(oldpgdir);
  return 0;

 bad:
  if(pgdir)
    freevm(pgdir);
80100b9f:	83 ec 0c             	sub    $0xc,%esp
80100ba2:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
80100ba8:	e8 e3 65 00 00       	call   80107190 <freevm>
80100bad:	83 c4 10             	add    $0x10,%esp
  if(ip){
    iunlockput(ip);
    end_op();
  }
  return -1;
80100bb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bb5:	e9 97 fe ff ff       	jmp    80100a51 <exec+0x61>
  pde_t *pgdir, *oldpgdir;

  begin_op();

  if((ip = namei(path)) == 0){
    end_op();
80100bba:	e8 b1 20 00 00       	call   80102c70 <end_op>
    return -1;
80100bbf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bc4:	e9 88 fe ff ff       	jmp    80100a51 <exec+0x61>
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bc9:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100bcf:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bd5:	83 ec 08             	sub    $0x8,%esp

/*insert the imlicit call to sigreturn to the userSpace memory*/
/* get the end and start add of the call to sig ret*/

int retFuncSize =((int)alltraps - (int)sigretimplicit);  
sp -= retFuncSize;
80100bd8:	89 f3                	mov    %esi,%ebx
  // Allocate two pages at the next page boundary.
  // Make the first inaccessible.  Use the second as the user stack.
  sz = PGROUNDUP(sz);
  if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0)
    goto bad;
  clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
80100bda:	50                   	push   %eax
80100bdb:	57                   	push   %edi
80100bdc:	e8 2f 66 00 00       	call   80107210 <clearpteu>

/*insert the imlicit call to sigreturn to the userSpace memory*/
/* get the end and start add of the call to sig ret*/

int retFuncSize =((int)alltraps - (int)sigretimplicit);  
sp -= retFuncSize;
80100be1:	b8 f2 59 10 80       	mov    $0x801059f2,%eax
80100be6:	2d ee 59 10 80       	sub    $0x801059ee,%eax
80100beb:	29 c3                	sub    %eax,%ebx
/*The copyout and copyout_nofault functions copy len bytes of data from the kernel-space address kaddr to the user-space address uaddr*/
copyout(pgdir, sp, sigretimplicit, retFuncSize);
80100bed:	50                   	push   %eax
80100bee:	68 ee 59 10 80       	push   $0x801059ee
80100bf3:	53                   	push   %ebx
80100bf4:	57                   	push   %edi
proc->procHandlingSigNow = 0;  //process no longer handling signal

/*----------------------------------------------------------*/

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100bf5:	31 ff                	xor    %edi,%edi
/* get the end and start add of the call to sig ret*/

int retFuncSize =((int)alltraps - (int)sigretimplicit);  
sp -= retFuncSize;
/*The copyout and copyout_nofault functions copy len bytes of data from the kernel-space address kaddr to the user-space address uaddr*/
copyout(pgdir, sp, sigretimplicit, retFuncSize);
80100bf7:	e8 74 67 00 00       	call   80107370 <copyout>

proc->sigretAdd = sp;  //return to this address after sig handling
80100bfc:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
proc->procHandlingSigNow = 0;  //process no longer handling signal

/*----------------------------------------------------------*/

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c02:	83 c4 20             	add    $0x20,%esp
80100c05:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
int retFuncSize =((int)alltraps - (int)sigretimplicit);  
sp -= retFuncSize;
/*The copyout and copyout_nofault functions copy len bytes of data from the kernel-space address kaddr to the user-space address uaddr*/
copyout(pgdir, sp, sigretimplicit, retFuncSize);

proc->sigretAdd = sp;  //return to this address after sig handling
80100c0b:	89 98 84 01 00 00    	mov    %ebx,0x184(%eax)
proc->procHandlingSigNow = 0;  //process no longer handling signal
80100c11:	c7 80 7c 01 00 00 00 	movl   $0x0,0x17c(%eax)
80100c18:	00 00 00 

/*----------------------------------------------------------*/

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c1b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c1e:	8b 00                	mov    (%eax),%eax
80100c20:	85 c0                	test   %eax,%eax
80100c22:	74 75                	je     80100c99 <exec+0x2a9>
80100c24:	89 b5 f0 fe ff ff    	mov    %esi,-0x110(%ebp)
80100c2a:	8b b5 f4 fe ff ff    	mov    -0x10c(%ebp),%esi
80100c30:	eb 0f                	jmp    80100c41 <exec+0x251>
80100c32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(argc >= MAXARG)
80100c38:	83 ff 20             	cmp    $0x20,%edi
80100c3b:	0f 84 5e ff ff ff    	je     80100b9f <exec+0x1af>
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c41:	83 ec 0c             	sub    $0xc,%esp
80100c44:	50                   	push   %eax
80100c45:	e8 b6 3c 00 00       	call   80104900 <strlen>
80100c4a:	f7 d0                	not    %eax
80100c4c:	01 c3                	add    %eax,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c4e:	58                   	pop    %eax
80100c4f:	8b 45 0c             	mov    0xc(%ebp),%eax

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
80100c52:	83 e3 fc             	and    $0xfffffffc,%ebx
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
80100c55:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c58:	e8 a3 3c 00 00       	call   80104900 <strlen>
80100c5d:	83 c0 01             	add    $0x1,%eax
80100c60:	50                   	push   %eax
80100c61:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c64:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c67:	53                   	push   %ebx
80100c68:	56                   	push   %esi
80100c69:	e8 02 67 00 00       	call   80107370 <copyout>
80100c6e:	83 c4 20             	add    $0x20,%esp
80100c71:	85 c0                	test   %eax,%eax
80100c73:	0f 88 26 ff ff ff    	js     80100b9f <exec+0x1af>
proc->procHandlingSigNow = 0;  //process no longer handling signal

/*----------------------------------------------------------*/

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c79:	8b 45 0c             	mov    0xc(%ebp),%eax
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c7c:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
proc->procHandlingSigNow = 0;  //process no longer handling signal

/*----------------------------------------------------------*/

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c83:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARG)
      goto bad;
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
80100c86:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
proc->procHandlingSigNow = 0;  //process no longer handling signal

/*----------------------------------------------------------*/

  // Push argument strings, prepare rest of stack in ustack.
  for(argc = 0; argv[argc]; argc++) {
80100c8c:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c8f:	85 c0                	test   %eax,%eax
80100c91:	75 a5                	jne    80100c38 <exec+0x248>
80100c93:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100c99:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100ca0:	89 d9                	mov    %ebx,%ecx
    sp = (sp - (strlen(argv[argc]) + 1)) & ~3;
    if(copyout(pgdir, sp, argv[argc], strlen(argv[argc]) + 1) < 0)
      goto bad;
    ustack[3+argc] = sp;
  }
  ustack[3+argc] = 0;
80100ca2:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100ca9:	00 00 00 00 

  ustack[0] = 0xffffffff;  // fake return PC
80100cad:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100cb4:	ff ff ff 
  ustack[1] = argc;
80100cb7:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100cbd:	29 c1                	sub    %eax,%ecx

  sp -= (3+argc+1) * 4;
80100cbf:	83 c0 0c             	add    $0xc,%eax
80100cc2:	29 c3                	sub    %eax,%ebx
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cc4:	50                   	push   %eax
80100cc5:	52                   	push   %edx
80100cc6:	53                   	push   %ebx
80100cc7:	ff b5 f4 fe ff ff    	pushl  -0x10c(%ebp)
  }
  ustack[3+argc] = 0;

  ustack[0] = 0xffffffff;  // fake return PC
  ustack[1] = argc;
  ustack[2] = sp - (argc+1)*4;  // argv pointer
80100ccd:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)

  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
80100cd3:	e8 98 66 00 00       	call   80107370 <copyout>
80100cd8:	83 c4 10             	add    $0x10,%esp
80100cdb:	85 c0                	test   %eax,%eax
80100cdd:	0f 88 bc fe ff ff    	js     80100b9f <exec+0x1af>
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100ce3:	8b 45 08             	mov    0x8(%ebp),%eax
80100ce6:	0f b6 10             	movzbl (%eax),%edx
80100ce9:	84 d2                	test   %dl,%dl
80100ceb:	74 1e                	je     80100d0b <exec+0x31b>
80100ced:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cf0:	83 c0 01             	add    $0x1,%eax
80100cf3:	90                   	nop
80100cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(*s == '/')
      last = s+1;
80100cf8:	80 fa 2f             	cmp    $0x2f,%dl
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100cfb:	0f b6 10             	movzbl (%eax),%edx
    if(*s == '/')
      last = s+1;
80100cfe:	0f 44 c8             	cmove  %eax,%ecx
80100d01:	83 c0 01             	add    $0x1,%eax
  sp -= (3+argc+1) * 4;
  if(copyout(pgdir, sp, ustack, (3+argc+1)*4) < 0)
    goto bad;

  // Save program name for debugging.
  for(last=s=path; *s; s++)
80100d04:	84 d2                	test   %dl,%dl
80100d06:	75 f0                	jne    80100cf8 <exec+0x308>
80100d08:	89 4d 08             	mov    %ecx,0x8(%ebp)
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));
80100d0b:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100d11:	83 ec 04             	sub    $0x4,%esp
80100d14:	6a 10                	push   $0x10
80100d16:	ff 75 08             	pushl  0x8(%ebp)
80100d19:	83 c0 6c             	add    $0x6c,%eax
80100d1c:	50                   	push   %eax
80100d1d:	e8 9e 3b 00 00       	call   801048c0 <safestrcpy>

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100d22:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  proc->pgdir = pgdir;
80100d28:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
    if(*s == '/')
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
80100d2e:	8b 78 04             	mov    0x4(%eax),%edi
  proc->pgdir = pgdir;
  proc->sz = sz;
80100d31:	89 30                	mov    %esi,(%eax)
      last = s+1;
  safestrcpy(proc->name, last, sizeof(proc->name));

  // Commit to the user image.
  oldpgdir = proc->pgdir;
  proc->pgdir = pgdir;
80100d33:	89 48 04             	mov    %ecx,0x4(%eax)
  proc->sz = sz;
  proc->tf->eip = elf.entry;  // main
80100d36:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80100d3c:	8b 8d 3c ff ff ff    	mov    -0xc4(%ebp),%ecx
80100d42:	8b 50 18             	mov    0x18(%eax),%edx
80100d45:	89 4a 38             	mov    %ecx,0x38(%edx)
  proc->tf->esp = sp;
80100d48:	8b 50 18             	mov    0x18(%eax),%edx
80100d4b:	89 5a 44             	mov    %ebx,0x44(%edx)
  switchuvm(proc);
80100d4e:	89 04 24             	mov    %eax,(%esp)
80100d51:	e8 2a 61 00 00       	call   80106e80 <switchuvm>
  freevm(oldpgdir);
80100d56:	89 3c 24             	mov    %edi,(%esp)
80100d59:	e8 32 64 00 00       	call   80107190 <freevm>
  return 0;
80100d5e:	83 c4 10             	add    $0x10,%esp
80100d61:	31 c0                	xor    %eax,%eax
80100d63:	e9 e9 fc ff ff       	jmp    80100a51 <exec+0x61>
  if((pgdir = setupkvm()) == 0)
    goto bad;

  // Load program into memory.
  sz = 0;
  for(i=0, off=elf.phoff; i<elf.phnum; i++, off+=sizeof(ph)){
80100d68:	bf 00 20 00 00       	mov    $0x2000,%edi
80100d6d:	31 f6                	xor    %esi,%esi
80100d6f:	e9 04 fe ff ff       	jmp    80100b78 <exec+0x188>
80100d74:	66 90                	xchg   %ax,%ax
80100d76:	66 90                	xchg   %ax,%ax
80100d78:	66 90                	xchg   %ax,%ax
80100d7a:	66 90                	xchg   %ax,%ax
80100d7c:	66 90                	xchg   %ax,%ax
80100d7e:	66 90                	xchg   %ax,%ax

80100d80 <fileinit>:
  struct file file[NFILE];
} ftable;

void
fileinit(void)
{
80100d80:	55                   	push   %ebp
80100d81:	89 e5                	mov    %esp,%ebp
80100d83:	83 ec 10             	sub    $0x10,%esp
  initlock(&ftable.lock, "ftable");
80100d86:	68 a9 74 10 80       	push   $0x801074a9
80100d8b:	68 e0 ff 10 80       	push   $0x8010ffe0
80100d90:	e8 db 36 00 00       	call   80104470 <initlock>
}
80100d95:	83 c4 10             	add    $0x10,%esp
80100d98:	c9                   	leave  
80100d99:	c3                   	ret    
80100d9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100da0 <filealloc>:

// Allocate a file structure.
struct file*
filealloc(void)
{
80100da0:	55                   	push   %ebp
80100da1:	89 e5                	mov    %esp,%ebp
80100da3:	53                   	push   %ebx
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100da4:	bb 14 00 11 80       	mov    $0x80110014,%ebx
}

// Allocate a file structure.
struct file*
filealloc(void)
{
80100da9:	83 ec 10             	sub    $0x10,%esp
  struct file *f;

  acquire(&ftable.lock);
80100dac:	68 e0 ff 10 80       	push   $0x8010ffe0
80100db1:	e8 da 36 00 00       	call   80104490 <acquire>
80100db6:	83 c4 10             	add    $0x10,%esp
80100db9:	eb 10                	jmp    80100dcb <filealloc+0x2b>
80100dbb:	90                   	nop
80100dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(f = ftable.file; f < ftable.file + NFILE; f++){
80100dc0:	83 c3 18             	add    $0x18,%ebx
80100dc3:	81 fb 74 09 11 80    	cmp    $0x80110974,%ebx
80100dc9:	74 25                	je     80100df0 <filealloc+0x50>
    if(f->ref == 0){
80100dcb:	8b 43 04             	mov    0x4(%ebx),%eax
80100dce:	85 c0                	test   %eax,%eax
80100dd0:	75 ee                	jne    80100dc0 <filealloc+0x20>
      f->ref = 1;
      release(&ftable.lock);
80100dd2:	83 ec 0c             	sub    $0xc,%esp
  struct file *f;

  acquire(&ftable.lock);
  for(f = ftable.file; f < ftable.file + NFILE; f++){
    if(f->ref == 0){
      f->ref = 1;
80100dd5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
      release(&ftable.lock);
80100ddc:	68 e0 ff 10 80       	push   $0x8010ffe0
80100de1:	e8 8a 38 00 00       	call   80104670 <release>
      return f;
80100de6:	89 d8                	mov    %ebx,%eax
80100de8:	83 c4 10             	add    $0x10,%esp
    }
  }
  release(&ftable.lock);
  return 0;
}
80100deb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dee:	c9                   	leave  
80100def:	c3                   	ret    
      f->ref = 1;
      release(&ftable.lock);
      return f;
    }
  }
  release(&ftable.lock);
80100df0:	83 ec 0c             	sub    $0xc,%esp
80100df3:	68 e0 ff 10 80       	push   $0x8010ffe0
80100df8:	e8 73 38 00 00       	call   80104670 <release>
  return 0;
80100dfd:	83 c4 10             	add    $0x10,%esp
80100e00:	31 c0                	xor    %eax,%eax
}
80100e02:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e05:	c9                   	leave  
80100e06:	c3                   	ret    
80100e07:	89 f6                	mov    %esi,%esi
80100e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e10 <filedup>:

// Increment ref count for file f.
struct file*
filedup(struct file *f)
{
80100e10:	55                   	push   %ebp
80100e11:	89 e5                	mov    %esp,%ebp
80100e13:	53                   	push   %ebx
80100e14:	83 ec 10             	sub    $0x10,%esp
80100e17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ftable.lock);
80100e1a:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e1f:	e8 6c 36 00 00       	call   80104490 <acquire>
  if(f->ref < 1)
80100e24:	8b 43 04             	mov    0x4(%ebx),%eax
80100e27:	83 c4 10             	add    $0x10,%esp
80100e2a:	85 c0                	test   %eax,%eax
80100e2c:	7e 1a                	jle    80100e48 <filedup+0x38>
    panic("filedup");
  f->ref++;
80100e2e:	83 c0 01             	add    $0x1,%eax
  release(&ftable.lock);
80100e31:	83 ec 0c             	sub    $0xc,%esp
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
  f->ref++;
80100e34:	89 43 04             	mov    %eax,0x4(%ebx)
  release(&ftable.lock);
80100e37:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e3c:	e8 2f 38 00 00       	call   80104670 <release>
  return f;
}
80100e41:	89 d8                	mov    %ebx,%eax
80100e43:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e46:	c9                   	leave  
80100e47:	c3                   	ret    
struct file*
filedup(struct file *f)
{
  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("filedup");
80100e48:	83 ec 0c             	sub    $0xc,%esp
80100e4b:	68 b0 74 10 80       	push   $0x801074b0
80100e50:	e8 1b f5 ff ff       	call   80100370 <panic>
80100e55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e60 <fileclose>:
}

// Close file f.  (Decrement ref count, close when reaches 0.)
void
fileclose(struct file *f)
{
80100e60:	55                   	push   %ebp
80100e61:	89 e5                	mov    %esp,%ebp
80100e63:	57                   	push   %edi
80100e64:	56                   	push   %esi
80100e65:	53                   	push   %ebx
80100e66:	83 ec 28             	sub    $0x28,%esp
80100e69:	8b 7d 08             	mov    0x8(%ebp),%edi
  struct file ff;

  acquire(&ftable.lock);
80100e6c:	68 e0 ff 10 80       	push   $0x8010ffe0
80100e71:	e8 1a 36 00 00       	call   80104490 <acquire>
  if(f->ref < 1)
80100e76:	8b 47 04             	mov    0x4(%edi),%eax
80100e79:	83 c4 10             	add    $0x10,%esp
80100e7c:	85 c0                	test   %eax,%eax
80100e7e:	0f 8e 9b 00 00 00    	jle    80100f1f <fileclose+0xbf>
    panic("fileclose");
  if(--f->ref > 0){
80100e84:	83 e8 01             	sub    $0x1,%eax
80100e87:	85 c0                	test   %eax,%eax
80100e89:	89 47 04             	mov    %eax,0x4(%edi)
80100e8c:	74 1a                	je     80100ea8 <fileclose+0x48>
    release(&ftable.lock);
80100e8e:	c7 45 08 e0 ff 10 80 	movl   $0x8010ffe0,0x8(%ebp)
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100e95:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e98:	5b                   	pop    %ebx
80100e99:	5e                   	pop    %esi
80100e9a:	5f                   	pop    %edi
80100e9b:	5d                   	pop    %ebp

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
80100e9c:	e9 cf 37 00 00       	jmp    80104670 <release>
80100ea1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return;
  }
  ff = *f;
80100ea8:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100eac:	8b 1f                	mov    (%edi),%ebx
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100eae:	83 ec 0c             	sub    $0xc,%esp
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100eb1:	8b 77 0c             	mov    0xc(%edi),%esi
  f->ref = 0;
  f->type = FD_NONE;
80100eb4:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100eba:	88 45 e7             	mov    %al,-0x19(%ebp)
80100ebd:	8b 47 10             	mov    0x10(%edi),%eax
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100ec0:	68 e0 ff 10 80       	push   $0x8010ffe0
    panic("fileclose");
  if(--f->ref > 0){
    release(&ftable.lock);
    return;
  }
  ff = *f;
80100ec5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);
80100ec8:	e8 a3 37 00 00       	call   80104670 <release>

  if(ff.type == FD_PIPE)
80100ecd:	83 c4 10             	add    $0x10,%esp
80100ed0:	83 fb 01             	cmp    $0x1,%ebx
80100ed3:	74 13                	je     80100ee8 <fileclose+0x88>
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
80100ed5:	83 fb 02             	cmp    $0x2,%ebx
80100ed8:	74 26                	je     80100f00 <fileclose+0xa0>
    begin_op();
    iput(ff.ip);
    end_op();
  }
}
80100eda:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100edd:	5b                   	pop    %ebx
80100ede:	5e                   	pop    %esi
80100edf:	5f                   	pop    %edi
80100ee0:	5d                   	pop    %ebp
80100ee1:	c3                   	ret    
80100ee2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  f->ref = 0;
  f->type = FD_NONE;
  release(&ftable.lock);

  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
80100ee8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100eec:	83 ec 08             	sub    $0x8,%esp
80100eef:	53                   	push   %ebx
80100ef0:	56                   	push   %esi
80100ef1:	e8 aa 25 00 00       	call   801034a0 <pipeclose>
80100ef6:	83 c4 10             	add    $0x10,%esp
80100ef9:	eb df                	jmp    80100eda <fileclose+0x7a>
80100efb:	90                   	nop
80100efc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  else if(ff.type == FD_INODE){
    begin_op();
80100f00:	e8 fb 1c 00 00       	call   80102c00 <begin_op>
    iput(ff.ip);
80100f05:	83 ec 0c             	sub    $0xc,%esp
80100f08:	ff 75 e0             	pushl  -0x20(%ebp)
80100f0b:	e8 c0 08 00 00       	call   801017d0 <iput>
    end_op();
80100f10:	83 c4 10             	add    $0x10,%esp
  }
}
80100f13:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f16:	5b                   	pop    %ebx
80100f17:	5e                   	pop    %esi
80100f18:	5f                   	pop    %edi
80100f19:	5d                   	pop    %ebp
  if(ff.type == FD_PIPE)
    pipeclose(ff.pipe, ff.writable);
  else if(ff.type == FD_INODE){
    begin_op();
    iput(ff.ip);
    end_op();
80100f1a:	e9 51 1d 00 00       	jmp    80102c70 <end_op>
{
  struct file ff;

  acquire(&ftable.lock);
  if(f->ref < 1)
    panic("fileclose");
80100f1f:	83 ec 0c             	sub    $0xc,%esp
80100f22:	68 b8 74 10 80       	push   $0x801074b8
80100f27:	e8 44 f4 ff ff       	call   80100370 <panic>
80100f2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f30 <filestat>:
}

// Get metadata about file f.
int
filestat(struct file *f, struct stat *st)
{
80100f30:	55                   	push   %ebp
80100f31:	89 e5                	mov    %esp,%ebp
80100f33:	53                   	push   %ebx
80100f34:	83 ec 04             	sub    $0x4,%esp
80100f37:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(f->type == FD_INODE){
80100f3a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f3d:	75 31                	jne    80100f70 <filestat+0x40>
    ilock(f->ip);
80100f3f:	83 ec 0c             	sub    $0xc,%esp
80100f42:	ff 73 10             	pushl  0x10(%ebx)
80100f45:	e8 56 07 00 00       	call   801016a0 <ilock>
    stati(f->ip, st);
80100f4a:	58                   	pop    %eax
80100f4b:	5a                   	pop    %edx
80100f4c:	ff 75 0c             	pushl  0xc(%ebp)
80100f4f:	ff 73 10             	pushl  0x10(%ebx)
80100f52:	e8 d9 09 00 00       	call   80101930 <stati>
    iunlock(f->ip);
80100f57:	59                   	pop    %ecx
80100f58:	ff 73 10             	pushl  0x10(%ebx)
80100f5b:	e8 20 08 00 00       	call   80101780 <iunlock>
    return 0;
80100f60:	83 c4 10             	add    $0x10,%esp
80100f63:	31 c0                	xor    %eax,%eax
  }
  return -1;
}
80100f65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f68:	c9                   	leave  
80100f69:	c3                   	ret    
80100f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    ilock(f->ip);
    stati(f->ip, st);
    iunlock(f->ip);
    return 0;
  }
  return -1;
80100f70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80100f75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f78:	c9                   	leave  
80100f79:	c3                   	ret    
80100f7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f80 <fileread>:

// Read from file f.
int
fileread(struct file *f, char *addr, int n)
{
80100f80:	55                   	push   %ebp
80100f81:	89 e5                	mov    %esp,%ebp
80100f83:	57                   	push   %edi
80100f84:	56                   	push   %esi
80100f85:	53                   	push   %ebx
80100f86:	83 ec 0c             	sub    $0xc,%esp
80100f89:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f8c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f8f:	8b 7d 10             	mov    0x10(%ebp),%edi
  int r;

  if(f->readable == 0)
80100f92:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f96:	74 60                	je     80100ff8 <fileread+0x78>
    return -1;
  if(f->type == FD_PIPE)
80100f98:	8b 03                	mov    (%ebx),%eax
80100f9a:	83 f8 01             	cmp    $0x1,%eax
80100f9d:	74 41                	je     80100fe0 <fileread+0x60>
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
80100f9f:	83 f8 02             	cmp    $0x2,%eax
80100fa2:	75 5b                	jne    80100fff <fileread+0x7f>
    ilock(f->ip);
80100fa4:	83 ec 0c             	sub    $0xc,%esp
80100fa7:	ff 73 10             	pushl  0x10(%ebx)
80100faa:	e8 f1 06 00 00       	call   801016a0 <ilock>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100faf:	57                   	push   %edi
80100fb0:	ff 73 14             	pushl  0x14(%ebx)
80100fb3:	56                   	push   %esi
80100fb4:	ff 73 10             	pushl  0x10(%ebx)
80100fb7:	e8 a4 09 00 00       	call   80101960 <readi>
80100fbc:	83 c4 20             	add    $0x20,%esp
80100fbf:	85 c0                	test   %eax,%eax
80100fc1:	89 c6                	mov    %eax,%esi
80100fc3:	7e 03                	jle    80100fc8 <fileread+0x48>
      f->off += r;
80100fc5:	01 43 14             	add    %eax,0x14(%ebx)
    iunlock(f->ip);
80100fc8:	83 ec 0c             	sub    $0xc,%esp
80100fcb:	ff 73 10             	pushl  0x10(%ebx)
80100fce:	e8 ad 07 00 00       	call   80101780 <iunlock>
    return r;
80100fd3:	83 c4 10             	add    $0x10,%esp
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
  if(f->type == FD_INODE){
    ilock(f->ip);
    if((r = readi(f->ip, addr, f->off, n)) > 0)
80100fd6:	89 f0                	mov    %esi,%eax
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fdb:	5b                   	pop    %ebx
80100fdc:	5e                   	pop    %esi
80100fdd:	5f                   	pop    %edi
80100fde:	5d                   	pop    %ebp
80100fdf:	c3                   	ret    
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fe0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fe3:	89 45 08             	mov    %eax,0x8(%ebp)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
}
80100fe6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fe9:	5b                   	pop    %ebx
80100fea:	5e                   	pop    %esi
80100feb:	5f                   	pop    %edi
80100fec:	5d                   	pop    %ebp
  int r;

  if(f->readable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return piperead(f->pipe, addr, n);
80100fed:	e9 7e 26 00 00       	jmp    80103670 <piperead>
80100ff2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fileread(struct file *f, char *addr, int n)
{
  int r;

  if(f->readable == 0)
    return -1;
80100ff8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100ffd:	eb d9                	jmp    80100fd8 <fileread+0x58>
    if((r = readi(f->ip, addr, f->off, n)) > 0)
      f->off += r;
    iunlock(f->ip);
    return r;
  }
  panic("fileread");
80100fff:	83 ec 0c             	sub    $0xc,%esp
80101002:	68 c2 74 10 80       	push   $0x801074c2
80101007:	e8 64 f3 ff ff       	call   80100370 <panic>
8010100c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101010 <filewrite>:

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80101010:	55                   	push   %ebp
80101011:	89 e5                	mov    %esp,%ebp
80101013:	57                   	push   %edi
80101014:	56                   	push   %esi
80101015:	53                   	push   %ebx
80101016:	83 ec 1c             	sub    $0x1c,%esp
80101019:	8b 75 08             	mov    0x8(%ebp),%esi
8010101c:	8b 45 0c             	mov    0xc(%ebp),%eax
  int r;

  if(f->writable == 0)
8010101f:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)

//PAGEBREAK!
// Write to file f.
int
filewrite(struct file *f, char *addr, int n)
{
80101023:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101026:	8b 45 10             	mov    0x10(%ebp),%eax
80101029:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int r;

  if(f->writable == 0)
8010102c:	0f 84 aa 00 00 00    	je     801010dc <filewrite+0xcc>
    return -1;
  if(f->type == FD_PIPE)
80101032:	8b 06                	mov    (%esi),%eax
80101034:	83 f8 01             	cmp    $0x1,%eax
80101037:	0f 84 c2 00 00 00    	je     801010ff <filewrite+0xef>
    return pipewrite(f->pipe, addr, n);
  if(f->type == FD_INODE){
8010103d:	83 f8 02             	cmp    $0x2,%eax
80101040:	0f 85 d8 00 00 00    	jne    8010111e <filewrite+0x10e>
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
80101046:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101049:	31 ff                	xor    %edi,%edi
8010104b:	85 c0                	test   %eax,%eax
8010104d:	7f 34                	jg     80101083 <filewrite+0x73>
8010104f:	e9 9c 00 00 00       	jmp    801010f0 <filewrite+0xe0>
80101054:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101058:	01 46 14             	add    %eax,0x14(%esi)
      iunlock(f->ip);
8010105b:	83 ec 0c             	sub    $0xc,%esp
8010105e:	ff 76 10             	pushl  0x10(%esi)
        n1 = max;

      begin_op();
      ilock(f->ip);
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
        f->off += r;
80101061:	89 45 e0             	mov    %eax,-0x20(%ebp)
      iunlock(f->ip);
80101064:	e8 17 07 00 00       	call   80101780 <iunlock>
      end_op();
80101069:	e8 02 1c 00 00       	call   80102c70 <end_op>
8010106e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101071:	83 c4 10             	add    $0x10,%esp

      if(r < 0)
        break;
      if(r != n1)
80101074:	39 d8                	cmp    %ebx,%eax
80101076:	0f 85 95 00 00 00    	jne    80101111 <filewrite+0x101>
        panic("short filewrite");
      i += r;
8010107c:	01 c7                	add    %eax,%edi
    // and 2 blocks of slop for non-aligned writes.
    // this really belongs lower down, since writei()
    // might be writing a device like the console.
    int max = ((LOGSIZE-1-1-2) / 2) * 512;
    int i = 0;
    while(i < n){
8010107e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101081:	7e 6d                	jle    801010f0 <filewrite+0xe0>
      int n1 = n - i;
80101083:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101086:	b8 00 1a 00 00       	mov    $0x1a00,%eax
8010108b:	29 fb                	sub    %edi,%ebx
8010108d:	81 fb 00 1a 00 00    	cmp    $0x1a00,%ebx
80101093:	0f 4f d8             	cmovg  %eax,%ebx
      if(n1 > max)
        n1 = max;

      begin_op();
80101096:	e8 65 1b 00 00       	call   80102c00 <begin_op>
      ilock(f->ip);
8010109b:	83 ec 0c             	sub    $0xc,%esp
8010109e:	ff 76 10             	pushl  0x10(%esi)
801010a1:	e8 fa 05 00 00       	call   801016a0 <ilock>
      if ((r = writei(f->ip, addr + i, f->off, n1)) > 0)
801010a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801010a9:	53                   	push   %ebx
801010aa:	ff 76 14             	pushl  0x14(%esi)
801010ad:	01 f8                	add    %edi,%eax
801010af:	50                   	push   %eax
801010b0:	ff 76 10             	pushl  0x10(%esi)
801010b3:	e8 a8 09 00 00       	call   80101a60 <writei>
801010b8:	83 c4 20             	add    $0x20,%esp
801010bb:	85 c0                	test   %eax,%eax
801010bd:	7f 99                	jg     80101058 <filewrite+0x48>
        f->off += r;
      iunlock(f->ip);
801010bf:	83 ec 0c             	sub    $0xc,%esp
801010c2:	ff 76 10             	pushl  0x10(%esi)
801010c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010c8:	e8 b3 06 00 00       	call   80101780 <iunlock>
      end_op();
801010cd:	e8 9e 1b 00 00       	call   80102c70 <end_op>

      if(r < 0)
801010d2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010d5:	83 c4 10             	add    $0x10,%esp
801010d8:	85 c0                	test   %eax,%eax
801010da:	74 98                	je     80101074 <filewrite+0x64>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
801010dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  panic("filewrite");
}
801010e4:	5b                   	pop    %ebx
801010e5:	5e                   	pop    %esi
801010e6:	5f                   	pop    %edi
801010e7:	5d                   	pop    %ebp
801010e8:	c3                   	ret    
801010e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        break;
      if(r != n1)
        panic("short filewrite");
      i += r;
    }
    return i == n ? n : -1;
801010f0:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
801010f3:	75 e7                	jne    801010dc <filewrite+0xcc>
  }
  panic("filewrite");
}
801010f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010f8:	89 f8                	mov    %edi,%eax
801010fa:	5b                   	pop    %ebx
801010fb:	5e                   	pop    %esi
801010fc:	5f                   	pop    %edi
801010fd:	5d                   	pop    %ebp
801010fe:	c3                   	ret    
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
801010ff:	8b 46 0c             	mov    0xc(%esi),%eax
80101102:	89 45 08             	mov    %eax,0x8(%ebp)
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
}
80101105:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101108:	5b                   	pop    %ebx
80101109:	5e                   	pop    %esi
8010110a:	5f                   	pop    %edi
8010110b:	5d                   	pop    %ebp
  int r;

  if(f->writable == 0)
    return -1;
  if(f->type == FD_PIPE)
    return pipewrite(f->pipe, addr, n);
8010110c:	e9 2f 24 00 00       	jmp    80103540 <pipewrite>
      end_op();

      if(r < 0)
        break;
      if(r != n1)
        panic("short filewrite");
80101111:	83 ec 0c             	sub    $0xc,%esp
80101114:	68 cb 74 10 80       	push   $0x801074cb
80101119:	e8 52 f2 ff ff       	call   80100370 <panic>
      i += r;
    }
    return i == n ? n : -1;
  }
  panic("filewrite");
8010111e:	83 ec 0c             	sub    $0xc,%esp
80101121:	68 d1 74 10 80       	push   $0x801074d1
80101126:	e8 45 f2 ff ff       	call   80100370 <panic>
8010112b:	66 90                	xchg   %ax,%ax
8010112d:	66 90                	xchg   %ax,%ax
8010112f:	90                   	nop

80101130 <balloc>:
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
80101130:	55                   	push   %ebp
80101131:	89 e5                	mov    %esp,%ebp
80101133:	57                   	push   %edi
80101134:	56                   	push   %esi
80101135:	53                   	push   %ebx
80101136:	83 ec 1c             	sub    $0x1c,%esp
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101139:	8b 0d e0 09 11 80    	mov    0x801109e0,%ecx
// Blocks.

// Allocate a zeroed disk block.
static uint
balloc(uint dev)
{
8010113f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
80101142:	85 c9                	test   %ecx,%ecx
80101144:	0f 84 85 00 00 00    	je     801011cf <balloc+0x9f>
8010114a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
    bp = bread(dev, BBLOCK(b, sb));
80101151:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101154:	83 ec 08             	sub    $0x8,%esp
80101157:	89 f0                	mov    %esi,%eax
80101159:	c1 f8 0c             	sar    $0xc,%eax
8010115c:	03 05 f8 09 11 80    	add    0x801109f8,%eax
80101162:	50                   	push   %eax
80101163:	ff 75 d8             	pushl  -0x28(%ebp)
80101166:	e8 65 ef ff ff       	call   801000d0 <bread>
8010116b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010116e:	a1 e0 09 11 80       	mov    0x801109e0,%eax
80101173:	83 c4 10             	add    $0x10,%esp
80101176:	89 45 e0             	mov    %eax,-0x20(%ebp)
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
80101179:	31 c0                	xor    %eax,%eax
8010117b:	eb 2d                	jmp    801011aa <balloc+0x7a>
8010117d:	8d 76 00             	lea    0x0(%esi),%esi
      m = 1 << (bi % 8);
80101180:	89 c1                	mov    %eax,%ecx
80101182:	ba 01 00 00 00       	mov    $0x1,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
80101187:	8b 5d e4             	mov    -0x1c(%ebp),%ebx

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
8010118a:	83 e1 07             	and    $0x7,%ecx
8010118d:	d3 e2                	shl    %cl,%edx
      if((bp->data[bi/8] & m) == 0){  // Is block free?
8010118f:	89 c1                	mov    %eax,%ecx
80101191:	c1 f9 03             	sar    $0x3,%ecx
80101194:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
80101199:	85 d7                	test   %edx,%edi
8010119b:	74 43                	je     801011e0 <balloc+0xb0>
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
8010119d:	83 c0 01             	add    $0x1,%eax
801011a0:	83 c6 01             	add    $0x1,%esi
801011a3:	3d 00 10 00 00       	cmp    $0x1000,%eax
801011a8:	74 05                	je     801011af <balloc+0x7f>
801011aa:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801011ad:	72 d1                	jb     80101180 <balloc+0x50>
        brelse(bp);
        bzero(dev, b + bi);
        return b + bi;
      }
    }
    brelse(bp);
801011af:	83 ec 0c             	sub    $0xc,%esp
801011b2:	ff 75 e4             	pushl  -0x1c(%ebp)
801011b5:	e8 26 f0 ff ff       	call   801001e0 <brelse>
{
  int b, bi, m;
  struct buf *bp;

  bp = 0;
  for(b = 0; b < sb.size; b += BPB){
801011ba:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801011c1:	83 c4 10             	add    $0x10,%esp
801011c4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801011c7:	39 05 e0 09 11 80    	cmp    %eax,0x801109e0
801011cd:	77 82                	ja     80101151 <balloc+0x21>
        return b + bi;
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
801011cf:	83 ec 0c             	sub    $0xc,%esp
801011d2:	68 db 74 10 80       	push   $0x801074db
801011d7:	e8 94 f1 ff ff       	call   80100370 <panic>
801011dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011e0:	09 fa                	or     %edi,%edx
801011e2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
        log_write(bp);
801011e5:	83 ec 0c             	sub    $0xc,%esp
  for(b = 0; b < sb.size; b += BPB){
    bp = bread(dev, BBLOCK(b, sb));
    for(bi = 0; bi < BPB && b + bi < sb.size; bi++){
      m = 1 << (bi % 8);
      if((bp->data[bi/8] & m) == 0){  // Is block free?
        bp->data[bi/8] |= m;  // Mark block in use.
801011e8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
        log_write(bp);
801011ec:	57                   	push   %edi
801011ed:	e8 ee 1b 00 00       	call   80102de0 <log_write>
        brelse(bp);
801011f2:	89 3c 24             	mov    %edi,(%esp)
801011f5:	e8 e6 ef ff ff       	call   801001e0 <brelse>
static void
bzero(int dev, int bno)
{
  struct buf *bp;

  bp = bread(dev, bno);
801011fa:	58                   	pop    %eax
801011fb:	5a                   	pop    %edx
801011fc:	56                   	push   %esi
801011fd:	ff 75 d8             	pushl  -0x28(%ebp)
80101200:	e8 cb ee ff ff       	call   801000d0 <bread>
80101205:	89 c3                	mov    %eax,%ebx
  memset(bp->data, 0, BSIZE);
80101207:	8d 40 5c             	lea    0x5c(%eax),%eax
8010120a:	83 c4 0c             	add    $0xc,%esp
8010120d:	68 00 02 00 00       	push   $0x200
80101212:	6a 00                	push   $0x0
80101214:	50                   	push   %eax
80101215:	e8 a6 34 00 00       	call   801046c0 <memset>
  log_write(bp);
8010121a:	89 1c 24             	mov    %ebx,(%esp)
8010121d:	e8 be 1b 00 00       	call   80102de0 <log_write>
  brelse(bp);
80101222:	89 1c 24             	mov    %ebx,(%esp)
80101225:	e8 b6 ef ff ff       	call   801001e0 <brelse>
      }
    }
    brelse(bp);
  }
  panic("balloc: out of blocks");
}
8010122a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010122d:	89 f0                	mov    %esi,%eax
8010122f:	5b                   	pop    %ebx
80101230:	5e                   	pop    %esi
80101231:	5f                   	pop    %edi
80101232:	5d                   	pop    %ebp
80101233:	c3                   	ret    
80101234:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010123a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101240 <iget>:
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
80101240:	55                   	push   %ebp
80101241:	89 e5                	mov    %esp,%ebp
80101243:	57                   	push   %edi
80101244:	56                   	push   %esi
80101245:	53                   	push   %ebx
80101246:	89 c7                	mov    %eax,%edi
  struct inode *ip, *empty;

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
80101248:	31 f6                	xor    %esi,%esi
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
8010124a:	bb 34 0a 11 80       	mov    $0x80110a34,%ebx
// Find the inode with number inum on device dev
// and return the in-memory copy. Does not lock
// the inode and does not read it from disk.
static struct inode*
iget(uint dev, uint inum)
{
8010124f:	83 ec 28             	sub    $0x28,%esp
80101252:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  struct inode *ip, *empty;

  acquire(&icache.lock);
80101255:	68 00 0a 11 80       	push   $0x80110a00
8010125a:	e8 31 32 00 00       	call   80104490 <acquire>
8010125f:	83 c4 10             	add    $0x10,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101262:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101265:	eb 1b                	jmp    80101282 <iget+0x42>
80101267:	89 f6                	mov    %esi,%esi
80101269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
80101270:	85 f6                	test   %esi,%esi
80101272:	74 44                	je     801012b8 <iget+0x78>

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
80101274:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010127a:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
80101280:	74 4e                	je     801012d0 <iget+0x90>
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
80101282:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101285:	85 c9                	test   %ecx,%ecx
80101287:	7e e7                	jle    80101270 <iget+0x30>
80101289:	39 3b                	cmp    %edi,(%ebx)
8010128b:	75 e3                	jne    80101270 <iget+0x30>
8010128d:	39 53 04             	cmp    %edx,0x4(%ebx)
80101290:	75 de                	jne    80101270 <iget+0x30>
      ip->ref++;
      release(&icache.lock);
80101292:	83 ec 0c             	sub    $0xc,%esp

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
80101295:	83 c1 01             	add    $0x1,%ecx
      release(&icache.lock);
      return ip;
80101298:	89 de                	mov    %ebx,%esi
  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
8010129a:	68 00 0a 11 80       	push   $0x80110a00

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
8010129f:	89 4b 08             	mov    %ecx,0x8(%ebx)
      release(&icache.lock);
801012a2:	e8 c9 33 00 00       	call   80104670 <release>
      return ip;
801012a7:	83 c4 10             	add    $0x10,%esp
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);

  return ip;
}
801012aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012ad:	89 f0                	mov    %esi,%eax
801012af:	5b                   	pop    %ebx
801012b0:	5e                   	pop    %esi
801012b1:	5f                   	pop    %edi
801012b2:	5d                   	pop    %ebp
801012b3:	c3                   	ret    
801012b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(ip->ref > 0 && ip->dev == dev && ip->inum == inum){
      ip->ref++;
      release(&icache.lock);
      return ip;
    }
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
801012b8:	85 c9                	test   %ecx,%ecx
801012ba:	0f 44 f3             	cmove  %ebx,%esi

  acquire(&icache.lock);

  // Is the inode already cached?
  empty = 0;
  for(ip = &icache.inode[0]; ip < &icache.inode[NINODE]; ip++){
801012bd:	81 c3 90 00 00 00    	add    $0x90,%ebx
801012c3:	81 fb 54 26 11 80    	cmp    $0x80112654,%ebx
801012c9:	75 b7                	jne    80101282 <iget+0x42>
801012cb:	90                   	nop
801012cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(empty == 0 && ip->ref == 0)    // Remember empty slot.
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
801012d0:	85 f6                	test   %esi,%esi
801012d2:	74 2d                	je     80101301 <iget+0xc1>
  ip = empty;
  ip->dev = dev;
  ip->inum = inum;
  ip->ref = 1;
  ip->flags = 0;
  release(&icache.lock);
801012d4:	83 ec 0c             	sub    $0xc,%esp
  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");

  ip = empty;
  ip->dev = dev;
801012d7:	89 3e                	mov    %edi,(%esi)
  ip->inum = inum;
801012d9:	89 56 04             	mov    %edx,0x4(%esi)
  ip->ref = 1;
801012dc:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
  ip->flags = 0;
801012e3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
  release(&icache.lock);
801012ea:	68 00 0a 11 80       	push   $0x80110a00
801012ef:	e8 7c 33 00 00       	call   80104670 <release>

  return ip;
801012f4:	83 c4 10             	add    $0x10,%esp
}
801012f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012fa:	89 f0                	mov    %esi,%eax
801012fc:	5b                   	pop    %ebx
801012fd:	5e                   	pop    %esi
801012fe:	5f                   	pop    %edi
801012ff:	5d                   	pop    %ebp
80101300:	c3                   	ret    
      empty = ip;
  }

  // Recycle an inode cache entry.
  if(empty == 0)
    panic("iget: no inodes");
80101301:	83 ec 0c             	sub    $0xc,%esp
80101304:	68 f1 74 10 80       	push   $0x801074f1
80101309:	e8 62 f0 ff ff       	call   80100370 <panic>
8010130e:	66 90                	xchg   %ax,%ax

80101310 <bmap>:

// Return the disk block address of the nth block in inode ip.
// If there is no such block, bmap allocates one.
static uint
bmap(struct inode *ip, uint bn)
{
80101310:	55                   	push   %ebp
80101311:	89 e5                	mov    %esp,%ebp
80101313:	57                   	push   %edi
80101314:	56                   	push   %esi
80101315:	53                   	push   %ebx
80101316:	89 c6                	mov    %eax,%esi
80101318:	83 ec 1c             	sub    $0x1c,%esp
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
8010131b:	83 fa 0b             	cmp    $0xb,%edx
8010131e:	77 18                	ja     80101338 <bmap+0x28>
80101320:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
    if((addr = ip->addrs[bn]) == 0)
80101323:	8b 43 5c             	mov    0x5c(%ebx),%eax
80101326:	85 c0                	test   %eax,%eax
80101328:	74 76                	je     801013a0 <bmap+0x90>
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
8010132a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010132d:	5b                   	pop    %ebx
8010132e:	5e                   	pop    %esi
8010132f:	5f                   	pop    %edi
80101330:	5d                   	pop    %ebp
80101331:	c3                   	ret    
80101332:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
    return addr;
  }
  bn -= NDIRECT;
80101338:	8d 5a f4             	lea    -0xc(%edx),%ebx

  if(bn < NINDIRECT){
8010133b:	83 fb 7f             	cmp    $0x7f,%ebx
8010133e:	0f 87 83 00 00 00    	ja     801013c7 <bmap+0xb7>
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
80101344:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010134a:	85 c0                	test   %eax,%eax
8010134c:	74 6a                	je     801013b8 <bmap+0xa8>
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
8010134e:	83 ec 08             	sub    $0x8,%esp
80101351:	50                   	push   %eax
80101352:	ff 36                	pushl  (%esi)
80101354:	e8 77 ed ff ff       	call   801000d0 <bread>
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101359:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010135d:	83 c4 10             	add    $0x10,%esp

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
80101360:	89 c7                	mov    %eax,%edi
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
80101362:	8b 1a                	mov    (%edx),%ebx
80101364:	85 db                	test   %ebx,%ebx
80101366:	75 1d                	jne    80101385 <bmap+0x75>
      a[bn] = addr = balloc(ip->dev);
80101368:	8b 06                	mov    (%esi),%eax
8010136a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010136d:	e8 be fd ff ff       	call   80101130 <balloc>
80101372:	8b 55 e4             	mov    -0x1c(%ebp),%edx
      log_write(bp);
80101375:	83 ec 0c             	sub    $0xc,%esp
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
    bp = bread(ip->dev, addr);
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
80101378:	89 c3                	mov    %eax,%ebx
8010137a:	89 02                	mov    %eax,(%edx)
      log_write(bp);
8010137c:	57                   	push   %edi
8010137d:	e8 5e 1a 00 00       	call   80102de0 <log_write>
80101382:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
80101385:	83 ec 0c             	sub    $0xc,%esp
80101388:	57                   	push   %edi
80101389:	e8 52 ee ff ff       	call   801001e0 <brelse>
8010138e:	83 c4 10             	add    $0x10,%esp
    return addr;
  }

  panic("bmap: out of range");
}
80101391:	8d 65 f4             	lea    -0xc(%ebp),%esp
    a = (uint*)bp->data;
    if((addr = a[bn]) == 0){
      a[bn] = addr = balloc(ip->dev);
      log_write(bp);
    }
    brelse(bp);
80101394:	89 d8                	mov    %ebx,%eax
    return addr;
  }

  panic("bmap: out of range");
}
80101396:	5b                   	pop    %ebx
80101397:	5e                   	pop    %esi
80101398:	5f                   	pop    %edi
80101399:	5d                   	pop    %ebp
8010139a:	c3                   	ret    
8010139b:	90                   	nop
8010139c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint addr, *a;
  struct buf *bp;

  if(bn < NDIRECT){
    if((addr = ip->addrs[bn]) == 0)
      ip->addrs[bn] = addr = balloc(ip->dev);
801013a0:	8b 06                	mov    (%esi),%eax
801013a2:	e8 89 fd ff ff       	call   80101130 <balloc>
801013a7:	89 43 5c             	mov    %eax,0x5c(%ebx)
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
}
801013aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013ad:	5b                   	pop    %ebx
801013ae:	5e                   	pop    %esi
801013af:	5f                   	pop    %edi
801013b0:	5d                   	pop    %ebp
801013b1:	c3                   	ret    
801013b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  bn -= NDIRECT;

  if(bn < NINDIRECT){
    // Load indirect block, allocating if necessary.
    if((addr = ip->addrs[NDIRECT]) == 0)
      ip->addrs[NDIRECT] = addr = balloc(ip->dev);
801013b8:	8b 06                	mov    (%esi),%eax
801013ba:	e8 71 fd ff ff       	call   80101130 <balloc>
801013bf:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801013c5:	eb 87                	jmp    8010134e <bmap+0x3e>
    }
    brelse(bp);
    return addr;
  }

  panic("bmap: out of range");
801013c7:	83 ec 0c             	sub    $0xc,%esp
801013ca:	68 01 75 10 80       	push   $0x80107501
801013cf:	e8 9c ef ff ff       	call   80100370 <panic>
801013d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801013da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801013e0 <readsb>:
struct superblock sb; 

// Read the super block.
void
readsb(int dev, struct superblock *sb)
{
801013e0:	55                   	push   %ebp
801013e1:	89 e5                	mov    %esp,%ebp
801013e3:	56                   	push   %esi
801013e4:	53                   	push   %ebx
801013e5:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct buf *bp;

  bp = bread(dev, 1);
801013e8:	83 ec 08             	sub    $0x8,%esp
801013eb:	6a 01                	push   $0x1
801013ed:	ff 75 08             	pushl  0x8(%ebp)
801013f0:	e8 db ec ff ff       	call   801000d0 <bread>
801013f5:	89 c3                	mov    %eax,%ebx
  memmove(sb, bp->data, sizeof(*sb));
801013f7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013fa:	83 c4 0c             	add    $0xc,%esp
801013fd:	6a 1c                	push   $0x1c
801013ff:	50                   	push   %eax
80101400:	56                   	push   %esi
80101401:	e8 6a 33 00 00       	call   80104770 <memmove>
  brelse(bp);
80101406:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101409:	83 c4 10             	add    $0x10,%esp
}
8010140c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010140f:	5b                   	pop    %ebx
80101410:	5e                   	pop    %esi
80101411:	5d                   	pop    %ebp
{
  struct buf *bp;

  bp = bread(dev, 1);
  memmove(sb, bp->data, sizeof(*sb));
  brelse(bp);
80101412:	e9 c9 ed ff ff       	jmp    801001e0 <brelse>
80101417:	89 f6                	mov    %esi,%esi
80101419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101420 <bfree>:
}

// Free a disk block.
static void
bfree(int dev, uint b)
{
80101420:	55                   	push   %ebp
80101421:	89 e5                	mov    %esp,%ebp
80101423:	56                   	push   %esi
80101424:	53                   	push   %ebx
80101425:	89 d3                	mov    %edx,%ebx
80101427:	89 c6                	mov    %eax,%esi
  struct buf *bp;
  int bi, m;

  readsb(dev, &sb);
80101429:	83 ec 08             	sub    $0x8,%esp
8010142c:	68 e0 09 11 80       	push   $0x801109e0
80101431:	50                   	push   %eax
80101432:	e8 a9 ff ff ff       	call   801013e0 <readsb>
  bp = bread(dev, BBLOCK(b, sb));
80101437:	58                   	pop    %eax
80101438:	5a                   	pop    %edx
80101439:	89 da                	mov    %ebx,%edx
8010143b:	c1 ea 0c             	shr    $0xc,%edx
8010143e:	03 15 f8 09 11 80    	add    0x801109f8,%edx
80101444:	52                   	push   %edx
80101445:	56                   	push   %esi
80101446:	e8 85 ec ff ff       	call   801000d0 <bread>
  bi = b % BPB;
  m = 1 << (bi % 8);
8010144b:	89 d9                	mov    %ebx,%ecx
  if((bp->data[bi/8] & m) == 0)
8010144d:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101453:	ba 01 00 00 00       	mov    $0x1,%edx
80101458:	83 e1 07             	and    $0x7,%ecx
  if((bp->data[bi/8] & m) == 0)
8010145b:	c1 fb 03             	sar    $0x3,%ebx
8010145e:	83 c4 10             	add    $0x10,%esp
  int bi, m;

  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
80101461:	d3 e2                	shl    %cl,%edx
  if((bp->data[bi/8] & m) == 0)
80101463:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101468:	85 d1                	test   %edx,%ecx
8010146a:	74 27                	je     80101493 <bfree+0x73>
8010146c:	89 c6                	mov    %eax,%esi
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
8010146e:	f7 d2                	not    %edx
80101470:	89 c8                	mov    %ecx,%eax
  log_write(bp);
80101472:	83 ec 0c             	sub    $0xc,%esp
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
  bp->data[bi/8] &= ~m;
80101475:	21 d0                	and    %edx,%eax
80101477:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
  log_write(bp);
8010147b:	56                   	push   %esi
8010147c:	e8 5f 19 00 00       	call   80102de0 <log_write>
  brelse(bp);
80101481:	89 34 24             	mov    %esi,(%esp)
80101484:	e8 57 ed ff ff       	call   801001e0 <brelse>
}
80101489:	83 c4 10             	add    $0x10,%esp
8010148c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010148f:	5b                   	pop    %ebx
80101490:	5e                   	pop    %esi
80101491:	5d                   	pop    %ebp
80101492:	c3                   	ret    
  readsb(dev, &sb);
  bp = bread(dev, BBLOCK(b, sb));
  bi = b % BPB;
  m = 1 << (bi % 8);
  if((bp->data[bi/8] & m) == 0)
    panic("freeing free block");
80101493:	83 ec 0c             	sub    $0xc,%esp
80101496:	68 14 75 10 80       	push   $0x80107514
8010149b:	e8 d0 ee ff ff       	call   80100370 <panic>

801014a0 <iinit>:
  struct inode inode[NINODE];
} icache;

void
iinit(int dev)
{
801014a0:	55                   	push   %ebp
801014a1:	89 e5                	mov    %esp,%ebp
801014a3:	53                   	push   %ebx
801014a4:	bb 40 0a 11 80       	mov    $0x80110a40,%ebx
801014a9:	83 ec 0c             	sub    $0xc,%esp
  int i = 0;
  
  initlock(&icache.lock, "icache");
801014ac:	68 27 75 10 80       	push   $0x80107527
801014b1:	68 00 0a 11 80       	push   $0x80110a00
801014b6:	e8 b5 2f 00 00       	call   80104470 <initlock>
801014bb:	83 c4 10             	add    $0x10,%esp
801014be:	66 90                	xchg   %ax,%ax
  for(i = 0; i < NINODE; i++) {
    initsleeplock(&icache.inode[i].lock, "inode");
801014c0:	83 ec 08             	sub    $0x8,%esp
801014c3:	68 2e 75 10 80       	push   $0x8010752e
801014c8:	53                   	push   %ebx
801014c9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014cf:	e8 8c 2e 00 00       	call   80104360 <initsleeplock>
iinit(int dev)
{
  int i = 0;
  
  initlock(&icache.lock, "icache");
  for(i = 0; i < NINODE; i++) {
801014d4:	83 c4 10             	add    $0x10,%esp
801014d7:	81 fb 60 26 11 80    	cmp    $0x80112660,%ebx
801014dd:	75 e1                	jne    801014c0 <iinit+0x20>
    initsleeplock(&icache.inode[i].lock, "inode");
  }
  
  readsb(dev, &sb);
801014df:	83 ec 08             	sub    $0x8,%esp
801014e2:	68 e0 09 11 80       	push   $0x801109e0
801014e7:	ff 75 08             	pushl  0x8(%ebp)
801014ea:	e8 f1 fe ff ff       	call   801013e0 <readsb>
  cprintf("sb: size %d nblocks %d ninodes %d nlog %d logstart %d\
801014ef:	ff 35 f8 09 11 80    	pushl  0x801109f8
801014f5:	ff 35 f4 09 11 80    	pushl  0x801109f4
801014fb:	ff 35 f0 09 11 80    	pushl  0x801109f0
80101501:	ff 35 ec 09 11 80    	pushl  0x801109ec
80101507:	ff 35 e8 09 11 80    	pushl  0x801109e8
8010150d:	ff 35 e4 09 11 80    	pushl  0x801109e4
80101513:	ff 35 e0 09 11 80    	pushl  0x801109e0
80101519:	68 84 75 10 80       	push   $0x80107584
8010151e:	e8 3d f1 ff ff       	call   80100660 <cprintf>
 inodestart %d bmap start %d\n", sb.size, sb.nblocks,
          sb.ninodes, sb.nlog, sb.logstart, sb.inodestart,
          sb.bmapstart);
}
80101523:	83 c4 30             	add    $0x30,%esp
80101526:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101529:	c9                   	leave  
8010152a:	c3                   	ret    
8010152b:	90                   	nop
8010152c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101530 <ialloc>:
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
80101530:	55                   	push   %ebp
80101531:	89 e5                	mov    %esp,%ebp
80101533:	57                   	push   %edi
80101534:	56                   	push   %esi
80101535:	53                   	push   %ebx
80101536:	83 ec 1c             	sub    $0x1c,%esp
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101539:	83 3d e8 09 11 80 01 	cmpl   $0x1,0x801109e8
//PAGEBREAK!
// Allocate a new inode with the given type on device dev.
// A free inode has a type of zero.
struct inode*
ialloc(uint dev, short type)
{
80101540:	8b 45 0c             	mov    0xc(%ebp),%eax
80101543:	8b 75 08             	mov    0x8(%ebp),%esi
80101546:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101549:	0f 86 91 00 00 00    	jbe    801015e0 <ialloc+0xb0>
8010154f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101554:	eb 21                	jmp    80101577 <ialloc+0x47>
80101556:	8d 76 00             	lea    0x0(%esi),%esi
80101559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101560:	83 ec 0c             	sub    $0xc,%esp
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
80101563:	83 c3 01             	add    $0x1,%ebx
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
    }
    brelse(bp);
80101566:	57                   	push   %edi
80101567:	e8 74 ec ff ff       	call   801001e0 <brelse>
{
  int inum;
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
8010156c:	83 c4 10             	add    $0x10,%esp
8010156f:	39 1d e8 09 11 80    	cmp    %ebx,0x801109e8
80101575:	76 69                	jbe    801015e0 <ialloc+0xb0>
    bp = bread(dev, IBLOCK(inum, sb));
80101577:	89 d8                	mov    %ebx,%eax
80101579:	83 ec 08             	sub    $0x8,%esp
8010157c:	c1 e8 03             	shr    $0x3,%eax
8010157f:	03 05 f4 09 11 80    	add    0x801109f4,%eax
80101585:	50                   	push   %eax
80101586:	56                   	push   %esi
80101587:	e8 44 eb ff ff       	call   801000d0 <bread>
8010158c:	89 c7                	mov    %eax,%edi
    dip = (struct dinode*)bp->data + inum%IPB;
8010158e:	89 d8                	mov    %ebx,%eax
    if(dip->type == 0){  // a free inode
80101590:	83 c4 10             	add    $0x10,%esp
  struct buf *bp;
  struct dinode *dip;

  for(inum = 1; inum < sb.ninodes; inum++){
    bp = bread(dev, IBLOCK(inum, sb));
    dip = (struct dinode*)bp->data + inum%IPB;
80101593:	83 e0 07             	and    $0x7,%eax
80101596:	c1 e0 06             	shl    $0x6,%eax
80101599:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
    if(dip->type == 0){  // a free inode
8010159d:	66 83 39 00          	cmpw   $0x0,(%ecx)
801015a1:	75 bd                	jne    80101560 <ialloc+0x30>
      memset(dip, 0, sizeof(*dip));
801015a3:	83 ec 04             	sub    $0x4,%esp
801015a6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801015a9:	6a 40                	push   $0x40
801015ab:	6a 00                	push   $0x0
801015ad:	51                   	push   %ecx
801015ae:	e8 0d 31 00 00       	call   801046c0 <memset>
      dip->type = type;
801015b3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801015b7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801015ba:	66 89 01             	mov    %ax,(%ecx)
      log_write(bp);   // mark it allocated on the disk
801015bd:	89 3c 24             	mov    %edi,(%esp)
801015c0:	e8 1b 18 00 00       	call   80102de0 <log_write>
      brelse(bp);
801015c5:	89 3c 24             	mov    %edi,(%esp)
801015c8:	e8 13 ec ff ff       	call   801001e0 <brelse>
      return iget(dev, inum);
801015cd:	83 c4 10             	add    $0x10,%esp
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015d3:	89 da                	mov    %ebx,%edx
801015d5:	89 f0                	mov    %esi,%eax
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
}
801015d7:	5b                   	pop    %ebx
801015d8:	5e                   	pop    %esi
801015d9:	5f                   	pop    %edi
801015da:	5d                   	pop    %ebp
    if(dip->type == 0){  // a free inode
      memset(dip, 0, sizeof(*dip));
      dip->type = type;
      log_write(bp);   // mark it allocated on the disk
      brelse(bp);
      return iget(dev, inum);
801015db:	e9 60 fc ff ff       	jmp    80101240 <iget>
    }
    brelse(bp);
  }
  panic("ialloc: no inodes");
801015e0:	83 ec 0c             	sub    $0xc,%esp
801015e3:	68 34 75 10 80       	push   $0x80107534
801015e8:	e8 83 ed ff ff       	call   80100370 <panic>
801015ed:	8d 76 00             	lea    0x0(%esi),%esi

801015f0 <iupdate>:
}

// Copy a modified in-memory inode to disk.
void
iupdate(struct inode *ip)
{
801015f0:	55                   	push   %ebp
801015f1:	89 e5                	mov    %esp,%ebp
801015f3:	56                   	push   %esi
801015f4:	53                   	push   %ebx
801015f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801015f8:	83 ec 08             	sub    $0x8,%esp
801015fb:	8b 43 04             	mov    0x4(%ebx),%eax
  dip->type = ip->type;
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
801015fe:	83 c3 5c             	add    $0x5c,%ebx
iupdate(struct inode *ip)
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
80101601:	c1 e8 03             	shr    $0x3,%eax
80101604:	03 05 f4 09 11 80    	add    0x801109f4,%eax
8010160a:	50                   	push   %eax
8010160b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010160e:	e8 bd ea ff ff       	call   801000d0 <bread>
80101613:	89 c6                	mov    %eax,%esi
  dip = (struct dinode*)bp->data + ip->inum%IPB;
80101615:	8b 43 a8             	mov    -0x58(%ebx),%eax
  dip->type = ip->type;
80101618:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
  dip->major = ip->major;
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010161c:	83 c4 0c             	add    $0xc,%esp
{
  struct buf *bp;
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
8010161f:	83 e0 07             	and    $0x7,%eax
80101622:	c1 e0 06             	shl    $0x6,%eax
80101625:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
  dip->type = ip->type;
80101629:	66 89 10             	mov    %dx,(%eax)
  dip->major = ip->major;
8010162c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
80101630:	83 c0 0c             	add    $0xc,%eax
  struct dinode *dip;

  bp = bread(ip->dev, IBLOCK(ip->inum, sb));
  dip = (struct dinode*)bp->data + ip->inum%IPB;
  dip->type = ip->type;
  dip->major = ip->major;
80101633:	66 89 50 f6          	mov    %dx,-0xa(%eax)
  dip->minor = ip->minor;
80101637:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010163b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
  dip->nlink = ip->nlink;
8010163f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101643:	66 89 50 fa          	mov    %dx,-0x6(%eax)
  dip->size = ip->size;
80101647:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010164a:	89 50 fc             	mov    %edx,-0x4(%eax)
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
8010164d:	6a 34                	push   $0x34
8010164f:	53                   	push   %ebx
80101650:	50                   	push   %eax
80101651:	e8 1a 31 00 00       	call   80104770 <memmove>
  log_write(bp);
80101656:	89 34 24             	mov    %esi,(%esp)
80101659:	e8 82 17 00 00       	call   80102de0 <log_write>
  brelse(bp);
8010165e:	89 75 08             	mov    %esi,0x8(%ebp)
80101661:	83 c4 10             	add    $0x10,%esp
}
80101664:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101667:	5b                   	pop    %ebx
80101668:	5e                   	pop    %esi
80101669:	5d                   	pop    %ebp
  dip->minor = ip->minor;
  dip->nlink = ip->nlink;
  dip->size = ip->size;
  memmove(dip->addrs, ip->addrs, sizeof(ip->addrs));
  log_write(bp);
  brelse(bp);
8010166a:	e9 71 eb ff ff       	jmp    801001e0 <brelse>
8010166f:	90                   	nop

80101670 <idup>:

// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
80101670:	55                   	push   %ebp
80101671:	89 e5                	mov    %esp,%ebp
80101673:	53                   	push   %ebx
80101674:	83 ec 10             	sub    $0x10,%esp
80101677:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&icache.lock);
8010167a:	68 00 0a 11 80       	push   $0x80110a00
8010167f:	e8 0c 2e 00 00       	call   80104490 <acquire>
  ip->ref++;
80101684:	83 43 08 01          	addl   $0x1,0x8(%ebx)
  release(&icache.lock);
80101688:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010168f:	e8 dc 2f 00 00       	call   80104670 <release>
  return ip;
}
80101694:	89 d8                	mov    %ebx,%eax
80101696:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101699:	c9                   	leave  
8010169a:	c3                   	ret    
8010169b:	90                   	nop
8010169c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801016a0 <ilock>:

// Lock the given inode.
// Reads the inode from disk if necessary.
void
ilock(struct inode *ip)
{
801016a0:	55                   	push   %ebp
801016a1:	89 e5                	mov    %esp,%ebp
801016a3:	56                   	push   %esi
801016a4:	53                   	push   %ebx
801016a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
801016a8:	85 db                	test   %ebx,%ebx
801016aa:	0f 84 b4 00 00 00    	je     80101764 <ilock+0xc4>
801016b0:	8b 43 08             	mov    0x8(%ebx),%eax
801016b3:	85 c0                	test   %eax,%eax
801016b5:	0f 8e a9 00 00 00    	jle    80101764 <ilock+0xc4>
    panic("ilock");

  acquiresleep(&ip->lock);
801016bb:	8d 43 0c             	lea    0xc(%ebx),%eax
801016be:	83 ec 0c             	sub    $0xc,%esp
801016c1:	50                   	push   %eax
801016c2:	e8 d9 2c 00 00       	call   801043a0 <acquiresleep>

  if(!(ip->flags & I_VALID)){
801016c7:	83 c4 10             	add    $0x10,%esp
801016ca:	f6 43 4c 02          	testb  $0x2,0x4c(%ebx)
801016ce:	74 10                	je     801016e0 <ilock+0x40>
    brelse(bp);
    ip->flags |= I_VALID;
    if(ip->type == 0)
      panic("ilock: no type");
  }
}
801016d0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016d3:	5b                   	pop    %ebx
801016d4:	5e                   	pop    %esi
801016d5:	5d                   	pop    %ebp
801016d6:	c3                   	ret    
801016d7:	89 f6                	mov    %esi,%esi
801016d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    panic("ilock");

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
801016e0:	8b 43 04             	mov    0x4(%ebx),%eax
801016e3:	83 ec 08             	sub    $0x8,%esp
801016e6:	c1 e8 03             	shr    $0x3,%eax
801016e9:	03 05 f4 09 11 80    	add    0x801109f4,%eax
801016ef:	50                   	push   %eax
801016f0:	ff 33                	pushl  (%ebx)
801016f2:	e8 d9 e9 ff ff       	call   801000d0 <bread>
801016f7:	89 c6                	mov    %eax,%esi
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016f9:	8b 43 04             	mov    0x4(%ebx),%eax
    ip->type = dip->type;
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
801016fc:	83 c4 0c             	add    $0xc,%esp

  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
801016ff:	83 e0 07             	and    $0x7,%eax
80101702:	c1 e0 06             	shl    $0x6,%eax
80101705:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
    ip->type = dip->type;
80101709:	0f b7 10             	movzwl (%eax),%edx
    ip->major = dip->major;
    ip->minor = dip->minor;
    ip->nlink = dip->nlink;
    ip->size = dip->size;
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
8010170c:	83 c0 0c             	add    $0xc,%eax
  acquiresleep(&ip->lock);

  if(!(ip->flags & I_VALID)){
    bp = bread(ip->dev, IBLOCK(ip->inum, sb));
    dip = (struct dinode*)bp->data + ip->inum%IPB;
    ip->type = dip->type;
8010170f:	66 89 53 50          	mov    %dx,0x50(%ebx)
    ip->major = dip->major;
80101713:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101717:	66 89 53 52          	mov    %dx,0x52(%ebx)
    ip->minor = dip->minor;
8010171b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010171f:	66 89 53 54          	mov    %dx,0x54(%ebx)
    ip->nlink = dip->nlink;
80101723:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101727:	66 89 53 56          	mov    %dx,0x56(%ebx)
    ip->size = dip->size;
8010172b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010172e:	89 53 58             	mov    %edx,0x58(%ebx)
    memmove(ip->addrs, dip->addrs, sizeof(ip->addrs));
80101731:	6a 34                	push   $0x34
80101733:	50                   	push   %eax
80101734:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101737:	50                   	push   %eax
80101738:	e8 33 30 00 00       	call   80104770 <memmove>
    brelse(bp);
8010173d:	89 34 24             	mov    %esi,(%esp)
80101740:	e8 9b ea ff ff       	call   801001e0 <brelse>
    ip->flags |= I_VALID;
80101745:	83 4b 4c 02          	orl    $0x2,0x4c(%ebx)
    if(ip->type == 0)
80101749:	83 c4 10             	add    $0x10,%esp
8010174c:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
80101751:	0f 85 79 ff ff ff    	jne    801016d0 <ilock+0x30>
      panic("ilock: no type");
80101757:	83 ec 0c             	sub    $0xc,%esp
8010175a:	68 4c 75 10 80       	push   $0x8010754c
8010175f:	e8 0c ec ff ff       	call   80100370 <panic>
{
  struct buf *bp;
  struct dinode *dip;

  if(ip == 0 || ip->ref < 1)
    panic("ilock");
80101764:	83 ec 0c             	sub    $0xc,%esp
80101767:	68 46 75 10 80       	push   $0x80107546
8010176c:	e8 ff eb ff ff       	call   80100370 <panic>
80101771:	eb 0d                	jmp    80101780 <iunlock>
80101773:	90                   	nop
80101774:	90                   	nop
80101775:	90                   	nop
80101776:	90                   	nop
80101777:	90                   	nop
80101778:	90                   	nop
80101779:	90                   	nop
8010177a:	90                   	nop
8010177b:	90                   	nop
8010177c:	90                   	nop
8010177d:	90                   	nop
8010177e:	90                   	nop
8010177f:	90                   	nop

80101780 <iunlock>:
}

// Unlock the given inode.
void
iunlock(struct inode *ip)
{
80101780:	55                   	push   %ebp
80101781:	89 e5                	mov    %esp,%ebp
80101783:	56                   	push   %esi
80101784:	53                   	push   %ebx
80101785:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
80101788:	85 db                	test   %ebx,%ebx
8010178a:	74 28                	je     801017b4 <iunlock+0x34>
8010178c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010178f:	83 ec 0c             	sub    $0xc,%esp
80101792:	56                   	push   %esi
80101793:	e8 a8 2c 00 00       	call   80104440 <holdingsleep>
80101798:	83 c4 10             	add    $0x10,%esp
8010179b:	85 c0                	test   %eax,%eax
8010179d:	74 15                	je     801017b4 <iunlock+0x34>
8010179f:	8b 43 08             	mov    0x8(%ebx),%eax
801017a2:	85 c0                	test   %eax,%eax
801017a4:	7e 0e                	jle    801017b4 <iunlock+0x34>
    panic("iunlock");

  releasesleep(&ip->lock);
801017a6:	89 75 08             	mov    %esi,0x8(%ebp)
}
801017a9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801017ac:	5b                   	pop    %ebx
801017ad:	5e                   	pop    %esi
801017ae:	5d                   	pop    %ebp
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");

  releasesleep(&ip->lock);
801017af:	e9 4c 2c 00 00       	jmp    80104400 <releasesleep>
// Unlock the given inode.
void
iunlock(struct inode *ip)
{
  if(ip == 0 || !holdingsleep(&ip->lock) || ip->ref < 1)
    panic("iunlock");
801017b4:	83 ec 0c             	sub    $0xc,%esp
801017b7:	68 5b 75 10 80       	push   $0x8010755b
801017bc:	e8 af eb ff ff       	call   80100370 <panic>
801017c1:	eb 0d                	jmp    801017d0 <iput>
801017c3:	90                   	nop
801017c4:	90                   	nop
801017c5:	90                   	nop
801017c6:	90                   	nop
801017c7:	90                   	nop
801017c8:	90                   	nop
801017c9:	90                   	nop
801017ca:	90                   	nop
801017cb:	90                   	nop
801017cc:	90                   	nop
801017cd:	90                   	nop
801017ce:	90                   	nop
801017cf:	90                   	nop

801017d0 <iput>:
// to it, free the inode (and its content) on disk.
// All calls to iput() must be inside a transaction in
// case it has to free the inode.
void
iput(struct inode *ip)
{
801017d0:	55                   	push   %ebp
801017d1:	89 e5                	mov    %esp,%ebp
801017d3:	57                   	push   %edi
801017d4:	56                   	push   %esi
801017d5:	53                   	push   %ebx
801017d6:	83 ec 28             	sub    $0x28,%esp
801017d9:	8b 75 08             	mov    0x8(%ebp),%esi
  acquire(&icache.lock);
801017dc:	68 00 0a 11 80       	push   $0x80110a00
801017e1:	e8 aa 2c 00 00       	call   80104490 <acquire>
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
801017e6:	8b 46 08             	mov    0x8(%esi),%eax
801017e9:	83 c4 10             	add    $0x10,%esp
801017ec:	83 f8 01             	cmp    $0x1,%eax
801017ef:	74 1f                	je     80101810 <iput+0x40>
    ip->type = 0;
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
801017f1:	83 e8 01             	sub    $0x1,%eax
801017f4:	89 46 08             	mov    %eax,0x8(%esi)
  release(&icache.lock);
801017f7:	c7 45 08 00 0a 11 80 	movl   $0x80110a00,0x8(%ebp)
}
801017fe:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101801:	5b                   	pop    %ebx
80101802:	5e                   	pop    %esi
80101803:	5f                   	pop    %edi
80101804:	5d                   	pop    %ebp
    iupdate(ip);
    acquire(&icache.lock);
    ip->flags = 0;
  }
  ip->ref--;
  release(&icache.lock);
80101805:	e9 66 2e 00 00       	jmp    80104670 <release>
8010180a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// case it has to free the inode.
void
iput(struct inode *ip)
{
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
80101810:	f6 46 4c 02          	testb  $0x2,0x4c(%esi)
80101814:	74 db                	je     801017f1 <iput+0x21>
80101816:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
8010181b:	75 d4                	jne    801017f1 <iput+0x21>
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
8010181d:	83 ec 0c             	sub    $0xc,%esp
80101820:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101823:	8d be 8c 00 00 00    	lea    0x8c(%esi),%edi
80101829:	68 00 0a 11 80       	push   $0x80110a00
8010182e:	e8 3d 2e 00 00       	call   80104670 <release>
80101833:	83 c4 10             	add    $0x10,%esp
80101836:	eb 0f                	jmp    80101847 <iput+0x77>
80101838:	90                   	nop
80101839:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101840:	83 c3 04             	add    $0x4,%ebx
{
  int i, j;
  struct buf *bp;
  uint *a;

  for(i = 0; i < NDIRECT; i++){
80101843:	39 fb                	cmp    %edi,%ebx
80101845:	74 19                	je     80101860 <iput+0x90>
    if(ip->addrs[i]){
80101847:	8b 13                	mov    (%ebx),%edx
80101849:	85 d2                	test   %edx,%edx
8010184b:	74 f3                	je     80101840 <iput+0x70>
      bfree(ip->dev, ip->addrs[i]);
8010184d:	8b 06                	mov    (%esi),%eax
8010184f:	e8 cc fb ff ff       	call   80101420 <bfree>
      ip->addrs[i] = 0;
80101854:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010185a:	eb e4                	jmp    80101840 <iput+0x70>
8010185c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  if(ip->addrs[NDIRECT]){
80101860:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101866:	85 c0                	test   %eax,%eax
80101868:	75 46                	jne    801018b0 <iput+0xe0>
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
  iupdate(ip);
8010186a:	83 ec 0c             	sub    $0xc,%esp
    brelse(bp);
    bfree(ip->dev, ip->addrs[NDIRECT]);
    ip->addrs[NDIRECT] = 0;
  }

  ip->size = 0;
8010186d:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
  iupdate(ip);
80101874:	56                   	push   %esi
80101875:	e8 76 fd ff ff       	call   801015f0 <iupdate>
  acquire(&icache.lock);
  if(ip->ref == 1 && (ip->flags & I_VALID) && ip->nlink == 0){
    // inode has no links and no other references: truncate and free.
    release(&icache.lock);
    itrunc(ip);
    ip->type = 0;
8010187a:	31 c0                	xor    %eax,%eax
8010187c:	66 89 46 50          	mov    %ax,0x50(%esi)
    iupdate(ip);
80101880:	89 34 24             	mov    %esi,(%esp)
80101883:	e8 68 fd ff ff       	call   801015f0 <iupdate>
    acquire(&icache.lock);
80101888:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
8010188f:	e8 fc 2b 00 00       	call   80104490 <acquire>
    ip->flags = 0;
80101894:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010189b:	8b 46 08             	mov    0x8(%esi),%eax
8010189e:	83 c4 10             	add    $0x10,%esp
801018a1:	e9 4b ff ff ff       	jmp    801017f1 <iput+0x21>
801018a6:	8d 76 00             	lea    0x0(%esi),%esi
801018a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      ip->addrs[i] = 0;
    }
  }

  if(ip->addrs[NDIRECT]){
    bp = bread(ip->dev, ip->addrs[NDIRECT]);
801018b0:	83 ec 08             	sub    $0x8,%esp
801018b3:	50                   	push   %eax
801018b4:	ff 36                	pushl  (%esi)
801018b6:	e8 15 e8 ff ff       	call   801000d0 <bread>
801018bb:	83 c4 10             	add    $0x10,%esp
801018be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    a = (uint*)bp->data;
801018c1:	8d 58 5c             	lea    0x5c(%eax),%ebx
801018c4:	8d b8 5c 02 00 00    	lea    0x25c(%eax),%edi
801018ca:	eb 0b                	jmp    801018d7 <iput+0x107>
801018cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801018d0:	83 c3 04             	add    $0x4,%ebx
    for(j = 0; j < NINDIRECT; j++){
801018d3:	39 df                	cmp    %ebx,%edi
801018d5:	74 0f                	je     801018e6 <iput+0x116>
      if(a[j])
801018d7:	8b 13                	mov    (%ebx),%edx
801018d9:	85 d2                	test   %edx,%edx
801018db:	74 f3                	je     801018d0 <iput+0x100>
        bfree(ip->dev, a[j]);
801018dd:	8b 06                	mov    (%esi),%eax
801018df:	e8 3c fb ff ff       	call   80101420 <bfree>
801018e4:	eb ea                	jmp    801018d0 <iput+0x100>
    }
    brelse(bp);
801018e6:	83 ec 0c             	sub    $0xc,%esp
801018e9:	ff 75 e4             	pushl  -0x1c(%ebp)
801018ec:	e8 ef e8 ff ff       	call   801001e0 <brelse>
    bfree(ip->dev, ip->addrs[NDIRECT]);
801018f1:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
801018f7:	8b 06                	mov    (%esi),%eax
801018f9:	e8 22 fb ff ff       	call   80101420 <bfree>
    ip->addrs[NDIRECT] = 0;
801018fe:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101905:	00 00 00 
80101908:	83 c4 10             	add    $0x10,%esp
8010190b:	e9 5a ff ff ff       	jmp    8010186a <iput+0x9a>

80101910 <iunlockput>:
}

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
80101910:	55                   	push   %ebp
80101911:	89 e5                	mov    %esp,%ebp
80101913:	53                   	push   %ebx
80101914:	83 ec 10             	sub    $0x10,%esp
80101917:	8b 5d 08             	mov    0x8(%ebp),%ebx
  iunlock(ip);
8010191a:	53                   	push   %ebx
8010191b:	e8 60 fe ff ff       	call   80101780 <iunlock>
  iput(ip);
80101920:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101923:	83 c4 10             	add    $0x10,%esp
}
80101926:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101929:	c9                   	leave  
// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
  iput(ip);
8010192a:	e9 a1 fe ff ff       	jmp    801017d0 <iput>
8010192f:	90                   	nop

80101930 <stati>:
}

// Copy stat information from inode.
void
stati(struct inode *ip, struct stat *st)
{
80101930:	55                   	push   %ebp
80101931:	89 e5                	mov    %esp,%ebp
80101933:	8b 55 08             	mov    0x8(%ebp),%edx
80101936:	8b 45 0c             	mov    0xc(%ebp),%eax
  st->dev = ip->dev;
80101939:	8b 0a                	mov    (%edx),%ecx
8010193b:	89 48 04             	mov    %ecx,0x4(%eax)
  st->ino = ip->inum;
8010193e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101941:	89 48 08             	mov    %ecx,0x8(%eax)
  st->type = ip->type;
80101944:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101948:	66 89 08             	mov    %cx,(%eax)
  st->nlink = ip->nlink;
8010194b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010194f:	66 89 48 0c          	mov    %cx,0xc(%eax)
  st->size = ip->size;
80101953:	8b 52 58             	mov    0x58(%edx),%edx
80101956:	89 50 10             	mov    %edx,0x10(%eax)
}
80101959:	5d                   	pop    %ebp
8010195a:	c3                   	ret    
8010195b:	90                   	nop
8010195c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101960 <readi>:

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101960:	55                   	push   %ebp
80101961:	89 e5                	mov    %esp,%ebp
80101963:	57                   	push   %edi
80101964:	56                   	push   %esi
80101965:	53                   	push   %ebx
80101966:	83 ec 1c             	sub    $0x1c,%esp
80101969:	8b 45 08             	mov    0x8(%ebp),%eax
8010196c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010196f:	8b 75 10             	mov    0x10(%ebp),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101972:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

//PAGEBREAK!
// Read data from inode.
int
readi(struct inode *ip, char *dst, uint off, uint n)
{
80101977:	89 7d e0             	mov    %edi,-0x20(%ebp)
8010197a:	8b 7d 14             	mov    0x14(%ebp),%edi
8010197d:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101980:	89 7d e4             	mov    %edi,-0x1c(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101983:	0f 84 a7 00 00 00    	je     80101a30 <readi+0xd0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
  }

  if(off > ip->size || off + n < off)
80101989:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010198c:	8b 40 58             	mov    0x58(%eax),%eax
8010198f:	39 f0                	cmp    %esi,%eax
80101991:	0f 82 c1 00 00 00    	jb     80101a58 <readi+0xf8>
80101997:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010199a:	89 fa                	mov    %edi,%edx
8010199c:	01 f2                	add    %esi,%edx
8010199e:	0f 82 b4 00 00 00    	jb     80101a58 <readi+0xf8>
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019a4:	89 c1                	mov    %eax,%ecx
801019a6:	29 f1                	sub    %esi,%ecx
801019a8:	39 d0                	cmp    %edx,%eax
801019aa:	0f 43 cf             	cmovae %edi,%ecx

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019ad:	31 ff                	xor    %edi,%edi
801019af:	85 c9                	test   %ecx,%ecx
  }

  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;
801019b1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
801019b4:	74 6d                	je     80101a23 <readi+0xc3>
801019b6:	8d 76 00             	lea    0x0(%esi),%esi
801019b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019c0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019c3:	89 f2                	mov    %esi,%edx
801019c5:	c1 ea 09             	shr    $0x9,%edx
801019c8:	89 d8                	mov    %ebx,%eax
801019ca:	e8 41 f9 ff ff       	call   80101310 <bmap>
801019cf:	83 ec 08             	sub    $0x8,%esp
801019d2:	50                   	push   %eax
801019d3:	ff 33                	pushl  (%ebx)
    m = min(n - tot, BSIZE - off%BSIZE);
801019d5:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
801019da:	e8 f1 e6 ff ff       	call   801000d0 <bread>
801019df:	89 c2                	mov    %eax,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
801019e1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801019e4:	89 f1                	mov    %esi,%ecx
801019e6:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801019ec:	83 c4 0c             	add    $0xc,%esp
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019ef:	89 55 dc             	mov    %edx,-0x24(%ebp)
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
801019f2:	29 cb                	sub    %ecx,%ebx
801019f4:	29 f8                	sub    %edi,%eax
801019f6:	39 c3                	cmp    %eax,%ebx
801019f8:	0f 47 d8             	cmova  %eax,%ebx
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
801019fb:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
801019ff:	53                   	push   %ebx
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a00:	01 df                	add    %ebx,%edi
80101a02:	01 de                	add    %ebx,%esi
    for (int j = 0; j < min(m, 10); j++) {
      cprintf("%x ", bp->data[off%BSIZE+j]);
    }
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
80101a04:	50                   	push   %eax
80101a05:	ff 75 e0             	pushl  -0x20(%ebp)
80101a08:	e8 63 2d 00 00       	call   80104770 <memmove>
    brelse(bp);
80101a0d:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a10:	89 14 24             	mov    %edx,(%esp)
80101a13:	e8 c8 e7 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > ip->size)
    n = ip->size - off;

  for(tot=0; tot<n; tot+=m, off+=m, dst+=m){
80101a18:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a1b:	83 c4 10             	add    $0x10,%esp
80101a1e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a21:	77 9d                	ja     801019c0 <readi+0x60>
    cprintf("\n");
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
80101a23:	8b 45 e4             	mov    -0x1c(%ebp),%eax
}
80101a26:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a29:	5b                   	pop    %ebx
80101a2a:	5e                   	pop    %esi
80101a2b:	5f                   	pop    %edi
80101a2c:	5d                   	pop    %ebp
80101a2d:	c3                   	ret    
80101a2e:	66 90                	xchg   %ax,%ax
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
80101a30:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a34:	66 83 f8 09          	cmp    $0x9,%ax
80101a38:	77 1e                	ja     80101a58 <readi+0xf8>
80101a3a:	8b 04 c5 80 09 11 80 	mov    -0x7feef680(,%eax,8),%eax
80101a41:	85 c0                	test   %eax,%eax
80101a43:	74 13                	je     80101a58 <readi+0xf8>
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a45:	89 7d 10             	mov    %edi,0x10(%ebp)
    */
    memmove(dst, bp->data + off%BSIZE, m);
    brelse(bp);
  }
  return n;
}
80101a48:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a4b:	5b                   	pop    %ebx
80101a4c:	5e                   	pop    %esi
80101a4d:	5f                   	pop    %edi
80101a4e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
    return devsw[ip->major].read(ip, dst, n);
80101a4f:	ff e0                	jmp    *%eax
80101a51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].read)
      return -1;
80101a58:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a5d:	eb c7                	jmp    80101a26 <readi+0xc6>
80101a5f:	90                   	nop

80101a60 <writei>:

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a60:	55                   	push   %ebp
80101a61:	89 e5                	mov    %esp,%ebp
80101a63:	57                   	push   %edi
80101a64:	56                   	push   %esi
80101a65:	53                   	push   %ebx
80101a66:	83 ec 1c             	sub    $0x1c,%esp
80101a69:	8b 45 08             	mov    0x8(%ebp),%eax
80101a6c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a6f:	8b 7d 14             	mov    0x14(%ebp),%edi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a72:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)

// PAGEBREAK!
// Write data to inode.
int
writei(struct inode *ip, char *src, uint off, uint n)
{
80101a77:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a7a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a7d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a80:	89 7d e0             	mov    %edi,-0x20(%ebp)
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
80101a83:	0f 84 b7 00 00 00    	je     80101b40 <writei+0xe0>
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
  }

  if(off > ip->size || off + n < off)
80101a89:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a8c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a8f:	0f 82 eb 00 00 00    	jb     80101b80 <writei+0x120>
80101a95:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101a98:	89 f8                	mov    %edi,%eax
80101a9a:	01 f0                	add    %esi,%eax
    return -1;
  if(off + n > MAXFILE*BSIZE)
80101a9c:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101aa1:	0f 87 d9 00 00 00    	ja     80101b80 <writei+0x120>
80101aa7:	39 c6                	cmp    %eax,%esi
80101aa9:	0f 87 d1 00 00 00    	ja     80101b80 <writei+0x120>
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101aaf:	85 ff                	test   %edi,%edi
80101ab1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101ab8:	74 78                	je     80101b32 <writei+0xd2>
80101aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101ac0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ac3:	89 f2                	mov    %esi,%edx
    m = min(n - tot, BSIZE - off%BSIZE);
80101ac5:	bb 00 02 00 00       	mov    $0x200,%ebx
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
80101aca:	c1 ea 09             	shr    $0x9,%edx
80101acd:	89 f8                	mov    %edi,%eax
80101acf:	e8 3c f8 ff ff       	call   80101310 <bmap>
80101ad4:	83 ec 08             	sub    $0x8,%esp
80101ad7:	50                   	push   %eax
80101ad8:	ff 37                	pushl  (%edi)
80101ada:	e8 f1 e5 ff ff       	call   801000d0 <bread>
80101adf:	89 c7                	mov    %eax,%edi
    m = min(n - tot, BSIZE - off%BSIZE);
80101ae1:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101ae4:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101ae7:	89 f1                	mov    %esi,%ecx
80101ae9:	83 c4 0c             	add    $0xc,%esp
80101aec:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101af2:	29 cb                	sub    %ecx,%ebx
80101af4:	39 c3                	cmp    %eax,%ebx
80101af6:	0f 47 d8             	cmova  %eax,%ebx
    memmove(bp->data + off%BSIZE, src, m);
80101af9:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101afd:	53                   	push   %ebx
80101afe:	ff 75 dc             	pushl  -0x24(%ebp)
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b01:	01 de                	add    %ebx,%esi
    bp = bread(ip->dev, bmap(ip, off/BSIZE));
    m = min(n - tot, BSIZE - off%BSIZE);
    memmove(bp->data + off%BSIZE, src, m);
80101b03:	50                   	push   %eax
80101b04:	e8 67 2c 00 00       	call   80104770 <memmove>
    log_write(bp);
80101b09:	89 3c 24             	mov    %edi,(%esp)
80101b0c:	e8 cf 12 00 00       	call   80102de0 <log_write>
    brelse(bp);
80101b11:	89 3c 24             	mov    %edi,(%esp)
80101b14:	e8 c7 e6 ff ff       	call   801001e0 <brelse>
  if(off > ip->size || off + n < off)
    return -1;
  if(off + n > MAXFILE*BSIZE)
    return -1;

  for(tot=0; tot<n; tot+=m, off+=m, src+=m){
80101b19:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b1c:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b1f:	83 c4 10             	add    $0x10,%esp
80101b22:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b25:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b28:	77 96                	ja     80101ac0 <writei+0x60>
    memmove(bp->data + off%BSIZE, src, m);
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
80101b2a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b2d:	3b 70 58             	cmp    0x58(%eax),%esi
80101b30:	77 36                	ja     80101b68 <writei+0x108>
    ip->size = off;
    iupdate(ip);
  }
  return n;
80101b32:	8b 45 e0             	mov    -0x20(%ebp),%eax
}
80101b35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b38:	5b                   	pop    %ebx
80101b39:	5e                   	pop    %esi
80101b3a:	5f                   	pop    %edi
80101b3b:	5d                   	pop    %ebp
80101b3c:	c3                   	ret    
80101b3d:	8d 76 00             	lea    0x0(%esi),%esi
{
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
80101b40:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b44:	66 83 f8 09          	cmp    $0x9,%ax
80101b48:	77 36                	ja     80101b80 <writei+0x120>
80101b4a:	8b 04 c5 84 09 11 80 	mov    -0x7feef67c(,%eax,8),%eax
80101b51:	85 c0                	test   %eax,%eax
80101b53:	74 2b                	je     80101b80 <writei+0x120>
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b55:	89 7d 10             	mov    %edi,0x10(%ebp)
  if(n > 0 && off > ip->size){
    ip->size = off;
    iupdate(ip);
  }
  return n;
}
80101b58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b5b:	5b                   	pop    %ebx
80101b5c:	5e                   	pop    %esi
80101b5d:	5f                   	pop    %edi
80101b5e:	5d                   	pop    %ebp
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
    return devsw[ip->major].write(ip, src, n);
80101b5f:	ff e0                	jmp    *%eax
80101b61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b68:	8b 45 d8             	mov    -0x28(%ebp),%eax
    iupdate(ip);
80101b6b:	83 ec 0c             	sub    $0xc,%esp
    log_write(bp);
    brelse(bp);
  }

  if(n > 0 && off > ip->size){
    ip->size = off;
80101b6e:	89 70 58             	mov    %esi,0x58(%eax)
    iupdate(ip);
80101b71:	50                   	push   %eax
80101b72:	e8 79 fa ff ff       	call   801015f0 <iupdate>
80101b77:	83 c4 10             	add    $0x10,%esp
80101b7a:	eb b6                	jmp    80101b32 <writei+0xd2>
80101b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint tot, m;
  struct buf *bp;

  if(ip->type == T_DEV){
    if(ip->major < 0 || ip->major >= NDEV || !devsw[ip->major].write)
      return -1;
80101b80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b85:	eb ae                	jmp    80101b35 <writei+0xd5>
80101b87:	89 f6                	mov    %esi,%esi
80101b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101b90 <namecmp>:
//PAGEBREAK!
// Directories

int
namecmp(const char *s, const char *t)
{
80101b90:	55                   	push   %ebp
80101b91:	89 e5                	mov    %esp,%ebp
80101b93:	83 ec 0c             	sub    $0xc,%esp
  return strncmp(s, t, DIRSIZ);
80101b96:	6a 0e                	push   $0xe
80101b98:	ff 75 0c             	pushl  0xc(%ebp)
80101b9b:	ff 75 08             	pushl  0x8(%ebp)
80101b9e:	e8 4d 2c 00 00       	call   801047f0 <strncmp>
}
80101ba3:	c9                   	leave  
80101ba4:	c3                   	ret    
80101ba5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bb0 <dirlookup>:

// Look for a directory entry in a directory.
// If found, set *poff to byte offset of entry.
struct inode*
dirlookup(struct inode *dp, char *name, uint *poff)
{
80101bb0:	55                   	push   %ebp
80101bb1:	89 e5                	mov    %esp,%ebp
80101bb3:	57                   	push   %edi
80101bb4:	56                   	push   %esi
80101bb5:	53                   	push   %ebx
80101bb6:	83 ec 1c             	sub    $0x1c,%esp
80101bb9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
80101bbc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bc1:	0f 85 80 00 00 00    	jne    80101c47 <dirlookup+0x97>
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
80101bc7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bca:	31 ff                	xor    %edi,%edi
80101bcc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bcf:	85 d2                	test   %edx,%edx
80101bd1:	75 0d                	jne    80101be0 <dirlookup+0x30>
80101bd3:	eb 5b                	jmp    80101c30 <dirlookup+0x80>
80101bd5:	8d 76 00             	lea    0x0(%esi),%esi
80101bd8:	83 c7 10             	add    $0x10,%edi
80101bdb:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101bde:	76 50                	jbe    80101c30 <dirlookup+0x80>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101be0:	6a 10                	push   $0x10
80101be2:	57                   	push   %edi
80101be3:	56                   	push   %esi
80101be4:	53                   	push   %ebx
80101be5:	e8 76 fd ff ff       	call   80101960 <readi>
80101bea:	83 c4 10             	add    $0x10,%esp
80101bed:	83 f8 10             	cmp    $0x10,%eax
80101bf0:	75 48                	jne    80101c3a <dirlookup+0x8a>
      panic("dirlink read");
    if(de.inum == 0)
80101bf2:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bf7:	74 df                	je     80101bd8 <dirlookup+0x28>
// Directories

int
namecmp(const char *s, const char *t)
{
  return strncmp(s, t, DIRSIZ);
80101bf9:	8d 45 da             	lea    -0x26(%ebp),%eax
80101bfc:	83 ec 04             	sub    $0x4,%esp
80101bff:	6a 0e                	push   $0xe
80101c01:	50                   	push   %eax
80101c02:	ff 75 0c             	pushl  0xc(%ebp)
80101c05:	e8 e6 2b 00 00       	call   801047f0 <strncmp>
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
    if(de.inum == 0)
      continue;
    if(namecmp(name, de.name) == 0){
80101c0a:	83 c4 10             	add    $0x10,%esp
80101c0d:	85 c0                	test   %eax,%eax
80101c0f:	75 c7                	jne    80101bd8 <dirlookup+0x28>
      // entry matches path element
      if(poff)
80101c11:	8b 45 10             	mov    0x10(%ebp),%eax
80101c14:	85 c0                	test   %eax,%eax
80101c16:	74 05                	je     80101c1d <dirlookup+0x6d>
        *poff = off;
80101c18:	8b 45 10             	mov    0x10(%ebp),%eax
80101c1b:	89 38                	mov    %edi,(%eax)
      inum = de.inum;
      return iget(dp->dev, inum);
80101c1d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c21:	8b 03                	mov    (%ebx),%eax
80101c23:	e8 18 f6 ff ff       	call   80101240 <iget>
    }
  }

  return 0;
}
80101c28:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c2b:	5b                   	pop    %ebx
80101c2c:	5e                   	pop    %esi
80101c2d:	5f                   	pop    %edi
80101c2e:	5d                   	pop    %ebp
80101c2f:	c3                   	ret    
80101c30:	8d 65 f4             	lea    -0xc(%ebp),%esp
      inum = de.inum;
      return iget(dp->dev, inum);
    }
  }

  return 0;
80101c33:	31 c0                	xor    %eax,%eax
}
80101c35:	5b                   	pop    %ebx
80101c36:	5e                   	pop    %esi
80101c37:	5f                   	pop    %edi
80101c38:	5d                   	pop    %ebp
80101c39:	c3                   	ret    
  if(dp->type != T_DIR)
    panic("dirlookup not DIR");

  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101c3a:	83 ec 0c             	sub    $0xc,%esp
80101c3d:	68 75 75 10 80       	push   $0x80107575
80101c42:	e8 29 e7 ff ff       	call   80100370 <panic>
{
  uint off, inum;
  struct dirent de;

  if(dp->type != T_DIR)
    panic("dirlookup not DIR");
80101c47:	83 ec 0c             	sub    $0xc,%esp
80101c4a:	68 63 75 10 80       	push   $0x80107563
80101c4f:	e8 1c e7 ff ff       	call   80100370 <panic>
80101c54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c60 <namex>:
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c60:	55                   	push   %ebp
80101c61:	89 e5                	mov    %esp,%ebp
80101c63:	57                   	push   %edi
80101c64:	56                   	push   %esi
80101c65:	53                   	push   %ebx
80101c66:	89 cf                	mov    %ecx,%edi
80101c68:	89 c3                	mov    %eax,%ebx
80101c6a:	83 ec 1c             	sub    $0x1c,%esp
  struct inode *ip, *next;

  if(*path == '/')
80101c6d:	80 38 2f             	cmpb   $0x2f,(%eax)
// If parent != 0, return the inode for the parent and copy the final
// path element into name, which must have room for DIRSIZ bytes.
// Must be called inside a transaction since it calls iput().
static struct inode*
namex(char *path, int nameiparent, char *name)
{
80101c70:	89 55 e0             	mov    %edx,-0x20(%ebp)
  struct inode *ip, *next;

  if(*path == '/')
80101c73:	0f 84 53 01 00 00    	je     80101dcc <namex+0x16c>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101c79:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c7f:	83 ec 0c             	sub    $0xc,%esp
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);
80101c82:	8b 70 68             	mov    0x68(%eax),%esi
// Increment reference count for ip.
// Returns ip to enable ip = idup(ip1) idiom.
struct inode*
idup(struct inode *ip)
{
  acquire(&icache.lock);
80101c85:	68 00 0a 11 80       	push   $0x80110a00
80101c8a:	e8 01 28 00 00       	call   80104490 <acquire>
  ip->ref++;
80101c8f:	83 46 08 01          	addl   $0x1,0x8(%esi)
  release(&icache.lock);
80101c93:	c7 04 24 00 0a 11 80 	movl   $0x80110a00,(%esp)
80101c9a:	e8 d1 29 00 00       	call   80104670 <release>
80101c9f:	83 c4 10             	add    $0x10,%esp
80101ca2:	eb 07                	jmp    80101cab <namex+0x4b>
80101ca4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  char *s;
  int len;

  while(*path == '/')
    path++;
80101ca8:	83 c3 01             	add    $0x1,%ebx
skipelem(char *path, char *name)
{
  char *s;
  int len;

  while(*path == '/')
80101cab:	0f b6 03             	movzbl (%ebx),%eax
80101cae:	3c 2f                	cmp    $0x2f,%al
80101cb0:	74 f6                	je     80101ca8 <namex+0x48>
    path++;
  if(*path == 0)
80101cb2:	84 c0                	test   %al,%al
80101cb4:	0f 84 e3 00 00 00    	je     80101d9d <namex+0x13d>
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101cba:	0f b6 03             	movzbl (%ebx),%eax
80101cbd:	89 da                	mov    %ebx,%edx
80101cbf:	84 c0                	test   %al,%al
80101cc1:	0f 84 ac 00 00 00    	je     80101d73 <namex+0x113>
80101cc7:	3c 2f                	cmp    $0x2f,%al
80101cc9:	75 09                	jne    80101cd4 <namex+0x74>
80101ccb:	e9 a3 00 00 00       	jmp    80101d73 <namex+0x113>
80101cd0:	84 c0                	test   %al,%al
80101cd2:	74 0a                	je     80101cde <namex+0x7e>
    path++;
80101cd4:	83 c2 01             	add    $0x1,%edx
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101cd7:	0f b6 02             	movzbl (%edx),%eax
80101cda:	3c 2f                	cmp    $0x2f,%al
80101cdc:	75 f2                	jne    80101cd0 <namex+0x70>
80101cde:	89 d1                	mov    %edx,%ecx
80101ce0:	29 d9                	sub    %ebx,%ecx
    path++;
  len = path - s;
  if(len >= DIRSIZ)
80101ce2:	83 f9 0d             	cmp    $0xd,%ecx
80101ce5:	0f 8e 8d 00 00 00    	jle    80101d78 <namex+0x118>
    memmove(name, s, DIRSIZ);
80101ceb:	83 ec 04             	sub    $0x4,%esp
80101cee:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101cf1:	6a 0e                	push   $0xe
80101cf3:	53                   	push   %ebx
80101cf4:	57                   	push   %edi
80101cf5:	e8 76 2a 00 00       	call   80104770 <memmove>
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101cfa:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
80101cfd:	83 c4 10             	add    $0x10,%esp
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
    path++;
80101d00:	89 d3                	mov    %edx,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d02:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d05:	75 11                	jne    80101d18 <namex+0xb8>
80101d07:	89 f6                	mov    %esi,%esi
80101d09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    path++;
80101d10:	83 c3 01             	add    $0x1,%ebx
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
    name[len] = 0;
  }
  while(*path == '/')
80101d13:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d16:	74 f8                	je     80101d10 <namex+0xb0>
    ip = iget(ROOTDEV, ROOTINO);
  else
    ip = idup(proc->cwd);

  while((path = skipelem(path, name)) != 0){
    ilock(ip);
80101d18:	83 ec 0c             	sub    $0xc,%esp
80101d1b:	56                   	push   %esi
80101d1c:	e8 7f f9 ff ff       	call   801016a0 <ilock>
    if(ip->type != T_DIR){
80101d21:	83 c4 10             	add    $0x10,%esp
80101d24:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d29:	0f 85 7f 00 00 00    	jne    80101dae <namex+0x14e>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
80101d2f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d32:	85 d2                	test   %edx,%edx
80101d34:	74 09                	je     80101d3f <namex+0xdf>
80101d36:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d39:	0f 84 a3 00 00 00    	je     80101de2 <namex+0x182>
      // Stop one level early.
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
80101d3f:	83 ec 04             	sub    $0x4,%esp
80101d42:	6a 00                	push   $0x0
80101d44:	57                   	push   %edi
80101d45:	56                   	push   %esi
80101d46:	e8 65 fe ff ff       	call   80101bb0 <dirlookup>
80101d4b:	83 c4 10             	add    $0x10,%esp
80101d4e:	85 c0                	test   %eax,%eax
80101d50:	74 5c                	je     80101dae <namex+0x14e>

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101d52:	83 ec 0c             	sub    $0xc,%esp
80101d55:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d58:	56                   	push   %esi
80101d59:	e8 22 fa ff ff       	call   80101780 <iunlock>
  iput(ip);
80101d5e:	89 34 24             	mov    %esi,(%esp)
80101d61:	e8 6a fa ff ff       	call   801017d0 <iput>
80101d66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d69:	83 c4 10             	add    $0x10,%esp
80101d6c:	89 c6                	mov    %eax,%esi
80101d6e:	e9 38 ff ff ff       	jmp    80101cab <namex+0x4b>
  while(*path == '/')
    path++;
  if(*path == 0)
    return 0;
  s = path;
  while(*path != '/' && *path != 0)
80101d73:	31 c9                	xor    %ecx,%ecx
80101d75:	8d 76 00             	lea    0x0(%esi),%esi
    path++;
  len = path - s;
  if(len >= DIRSIZ)
    memmove(name, s, DIRSIZ);
  else {
    memmove(name, s, len);
80101d78:	83 ec 04             	sub    $0x4,%esp
80101d7b:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d7e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d81:	51                   	push   %ecx
80101d82:	53                   	push   %ebx
80101d83:	57                   	push   %edi
80101d84:	e8 e7 29 00 00       	call   80104770 <memmove>
    name[len] = 0;
80101d89:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101d8c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101d8f:	83 c4 10             	add    $0x10,%esp
80101d92:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101d96:	89 d3                	mov    %edx,%ebx
80101d98:	e9 65 ff ff ff       	jmp    80101d02 <namex+0xa2>
      return 0;
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
80101d9d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101da0:	85 c0                	test   %eax,%eax
80101da2:	75 54                	jne    80101df8 <namex+0x198>
80101da4:	89 f0                	mov    %esi,%eax
    iput(ip);
    return 0;
  }
  return ip;
}
80101da6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101da9:	5b                   	pop    %ebx
80101daa:	5e                   	pop    %esi
80101dab:	5f                   	pop    %edi
80101dac:	5d                   	pop    %ebp
80101dad:	c3                   	ret    

// Common idiom: unlock, then put.
void
iunlockput(struct inode *ip)
{
  iunlock(ip);
80101dae:	83 ec 0c             	sub    $0xc,%esp
80101db1:	56                   	push   %esi
80101db2:	e8 c9 f9 ff ff       	call   80101780 <iunlock>
  iput(ip);
80101db7:	89 34 24             	mov    %esi,(%esp)
80101dba:	e8 11 fa ff ff       	call   801017d0 <iput>
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101dbf:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dc2:	8d 65 f4             	lea    -0xc(%ebp),%esp
      iunlock(ip);
      return ip;
    }
    if((next = dirlookup(ip, name, 0)) == 0){
      iunlockput(ip);
      return 0;
80101dc5:	31 c0                	xor    %eax,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dc7:	5b                   	pop    %ebx
80101dc8:	5e                   	pop    %esi
80101dc9:	5f                   	pop    %edi
80101dca:	5d                   	pop    %ebp
80101dcb:	c3                   	ret    
namex(char *path, int nameiparent, char *name)
{
  struct inode *ip, *next;

  if(*path == '/')
    ip = iget(ROOTDEV, ROOTINO);
80101dcc:	ba 01 00 00 00       	mov    $0x1,%edx
80101dd1:	b8 01 00 00 00       	mov    $0x1,%eax
80101dd6:	e8 65 f4 ff ff       	call   80101240 <iget>
80101ddb:	89 c6                	mov    %eax,%esi
80101ddd:	e9 c9 fe ff ff       	jmp    80101cab <namex+0x4b>
      iunlockput(ip);
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
80101de2:	83 ec 0c             	sub    $0xc,%esp
80101de5:	56                   	push   %esi
80101de6:	e8 95 f9 ff ff       	call   80101780 <iunlock>
      return ip;
80101deb:	83 c4 10             	add    $0x10,%esp
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101dee:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return 0;
    }
    if(nameiparent && *path == '\0'){
      // Stop one level early.
      iunlock(ip);
      return ip;
80101df1:	89 f0                	mov    %esi,%eax
  if(nameiparent){
    iput(ip);
    return 0;
  }
  return ip;
}
80101df3:	5b                   	pop    %ebx
80101df4:	5e                   	pop    %esi
80101df5:	5f                   	pop    %edi
80101df6:	5d                   	pop    %ebp
80101df7:	c3                   	ret    
    }
    iunlockput(ip);
    ip = next;
  }
  if(nameiparent){
    iput(ip);
80101df8:	83 ec 0c             	sub    $0xc,%esp
80101dfb:	56                   	push   %esi
80101dfc:	e8 cf f9 ff ff       	call   801017d0 <iput>
    return 0;
80101e01:	83 c4 10             	add    $0x10,%esp
80101e04:	31 c0                	xor    %eax,%eax
80101e06:	eb 9e                	jmp    80101da6 <namex+0x146>
80101e08:	90                   	nop
80101e09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101e10 <dirlink>:
}

// Write a new directory entry (name, inum) into the directory dp.
int
dirlink(struct inode *dp, char *name, uint inum)
{
80101e10:	55                   	push   %ebp
80101e11:	89 e5                	mov    %esp,%ebp
80101e13:	57                   	push   %edi
80101e14:	56                   	push   %esi
80101e15:	53                   	push   %ebx
80101e16:	83 ec 20             	sub    $0x20,%esp
80101e19:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int off;
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
80101e1c:	6a 00                	push   $0x0
80101e1e:	ff 75 0c             	pushl  0xc(%ebp)
80101e21:	53                   	push   %ebx
80101e22:	e8 89 fd ff ff       	call   80101bb0 <dirlookup>
80101e27:	83 c4 10             	add    $0x10,%esp
80101e2a:	85 c0                	test   %eax,%eax
80101e2c:	75 67                	jne    80101e95 <dirlink+0x85>
    iput(ip);
    return -1;
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
80101e2e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e31:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e34:	85 ff                	test   %edi,%edi
80101e36:	74 29                	je     80101e61 <dirlink+0x51>
80101e38:	31 ff                	xor    %edi,%edi
80101e3a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e3d:	eb 09                	jmp    80101e48 <dirlink+0x38>
80101e3f:	90                   	nop
80101e40:	83 c7 10             	add    $0x10,%edi
80101e43:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e46:	76 19                	jbe    80101e61 <dirlink+0x51>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e48:	6a 10                	push   $0x10
80101e4a:	57                   	push   %edi
80101e4b:	56                   	push   %esi
80101e4c:	53                   	push   %ebx
80101e4d:	e8 0e fb ff ff       	call   80101960 <readi>
80101e52:	83 c4 10             	add    $0x10,%esp
80101e55:	83 f8 10             	cmp    $0x10,%eax
80101e58:	75 4e                	jne    80101ea8 <dirlink+0x98>
      panic("dirlink read");
    if(de.inum == 0)
80101e5a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e5f:	75 df                	jne    80101e40 <dirlink+0x30>
      break;
  }

  strncpy(de.name, name, DIRSIZ);
80101e61:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e64:	83 ec 04             	sub    $0x4,%esp
80101e67:	6a 0e                	push   $0xe
80101e69:	ff 75 0c             	pushl  0xc(%ebp)
80101e6c:	50                   	push   %eax
80101e6d:	e8 ee 29 00 00       	call   80104860 <strncpy>
  de.inum = inum;
80101e72:	8b 45 10             	mov    0x10(%ebp),%eax
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e75:	6a 10                	push   $0x10
80101e77:	57                   	push   %edi
80101e78:	56                   	push   %esi
80101e79:	53                   	push   %ebx
    if(de.inum == 0)
      break;
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
80101e7a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80101e7e:	e8 dd fb ff ff       	call   80101a60 <writei>
80101e83:	83 c4 20             	add    $0x20,%esp
80101e86:	83 f8 10             	cmp    $0x10,%eax
80101e89:	75 2a                	jne    80101eb5 <dirlink+0xa5>
    panic("dirlink");

  return 0;
80101e8b:	31 c0                	xor    %eax,%eax
}
80101e8d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e90:	5b                   	pop    %ebx
80101e91:	5e                   	pop    %esi
80101e92:	5f                   	pop    %edi
80101e93:	5d                   	pop    %ebp
80101e94:	c3                   	ret    
  struct dirent de;
  struct inode *ip;

  // Check that name is not present.
  if((ip = dirlookup(dp, name, 0)) != 0){
    iput(ip);
80101e95:	83 ec 0c             	sub    $0xc,%esp
80101e98:	50                   	push   %eax
80101e99:	e8 32 f9 ff ff       	call   801017d0 <iput>
    return -1;
80101e9e:	83 c4 10             	add    $0x10,%esp
80101ea1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ea6:	eb e5                	jmp    80101e8d <dirlink+0x7d>
  }

  // Look for an empty dirent.
  for(off = 0; off < dp->size; off += sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("dirlink read");
80101ea8:	83 ec 0c             	sub    $0xc,%esp
80101eab:	68 75 75 10 80       	push   $0x80107575
80101eb0:	e8 bb e4 ff ff       	call   80100370 <panic>
  }

  strncpy(de.name, name, DIRSIZ);
  de.inum = inum;
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("dirlink");
80101eb5:	83 ec 0c             	sub    $0xc,%esp
80101eb8:	68 6e 7b 10 80       	push   $0x80107b6e
80101ebd:	e8 ae e4 ff ff       	call   80100370 <panic>
80101ec2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ed0 <namei>:
  return ip;
}

struct inode*
namei(char *path)
{
80101ed0:	55                   	push   %ebp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ed1:	31 d2                	xor    %edx,%edx
  return ip;
}

struct inode*
namei(char *path)
{
80101ed3:	89 e5                	mov    %esp,%ebp
80101ed5:	83 ec 18             	sub    $0x18,%esp
  char name[DIRSIZ];
  return namex(path, 0, name);
80101ed8:	8b 45 08             	mov    0x8(%ebp),%eax
80101edb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101ede:	e8 7d fd ff ff       	call   80101c60 <namex>
}
80101ee3:	c9                   	leave  
80101ee4:	c3                   	ret    
80101ee5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ef0 <nameiparent>:

struct inode*
nameiparent(char *path, char *name)
{
80101ef0:	55                   	push   %ebp
  return namex(path, 1, name);
80101ef1:	ba 01 00 00 00       	mov    $0x1,%edx
  return namex(path, 0, name);
}

struct inode*
nameiparent(char *path, char *name)
{
80101ef6:	89 e5                	mov    %esp,%ebp
  return namex(path, 1, name);
80101ef8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101efb:	8b 45 08             	mov    0x8(%ebp),%eax
}
80101efe:	5d                   	pop    %ebp
}

struct inode*
nameiparent(char *path, char *name)
{
  return namex(path, 1, name);
80101eff:	e9 5c fd ff ff       	jmp    80101c60 <namex>
80101f04:	66 90                	xchg   %ax,%ax
80101f06:	66 90                	xchg   %ax,%ax
80101f08:	66 90                	xchg   %ax,%ax
80101f0a:	66 90                	xchg   %ax,%ax
80101f0c:	66 90                	xchg   %ax,%ax
80101f0e:	66 90                	xchg   %ax,%ax

80101f10 <idestart>:
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f10:	55                   	push   %ebp
  if(b == 0)
80101f11:	85 c0                	test   %eax,%eax
}

// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
80101f13:	89 e5                	mov    %esp,%ebp
80101f15:	56                   	push   %esi
80101f16:	53                   	push   %ebx
  if(b == 0)
80101f17:	0f 84 ad 00 00 00    	je     80101fca <idestart+0xba>
    panic("idestart");
  if(b->blockno >= FSSIZE)
80101f1d:	8b 58 08             	mov    0x8(%eax),%ebx
80101f20:	89 c1                	mov    %eax,%ecx
80101f22:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f28:	0f 87 8f 00 00 00    	ja     80101fbd <idestart+0xad>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80101f2e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f33:	90                   	nop
80101f34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f38:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80101f39:	83 e0 c0             	and    $0xffffffc0,%eax
80101f3c:	3c 40                	cmp    $0x40,%al
80101f3e:	75 f8                	jne    80101f38 <idestart+0x28>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80101f40:	31 f6                	xor    %esi,%esi
80101f42:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f47:	89 f0                	mov    %esi,%eax
80101f49:	ee                   	out    %al,(%dx)
80101f4a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f4f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f54:	ee                   	out    %al,(%dx)
80101f55:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f5a:	89 d8                	mov    %ebx,%eax
80101f5c:	ee                   	out    %al,(%dx)
80101f5d:	89 d8                	mov    %ebx,%eax
80101f5f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f64:	c1 f8 08             	sar    $0x8,%eax
80101f67:	ee                   	out    %al,(%dx)
80101f68:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f6d:	89 f0                	mov    %esi,%eax
80101f6f:	ee                   	out    %al,(%dx)
80101f70:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101f74:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101f79:	83 e0 01             	and    $0x1,%eax
80101f7c:	c1 e0 04             	shl    $0x4,%eax
80101f7f:	83 c8 e0             	or     $0xffffffe0,%eax
80101f82:	ee                   	out    %al,(%dx)
  outb(0x1f2, sector_per_block);  // number of sectors
  outb(0x1f3, sector & 0xff);
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
80101f83:	f6 01 04             	testb  $0x4,(%ecx)
80101f86:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f8b:	75 13                	jne    80101fa0 <idestart+0x90>
80101f8d:	b8 20 00 00 00       	mov    $0x20,%eax
80101f92:	ee                   	out    %al,(%dx)
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101f93:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101f96:	5b                   	pop    %ebx
80101f97:	5e                   	pop    %esi
80101f98:	5d                   	pop    %ebp
80101f99:	c3                   	ret    
80101f9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101fa0:	b8 30 00 00 00       	mov    $0x30,%eax
80101fa5:	ee                   	out    %al,(%dx)
}

static inline void
outsl(int port, const void *addr, int cnt)
{
  asm volatile("cld; rep outsl" :
80101fa6:	ba f0 01 00 00       	mov    $0x1f0,%edx
  outb(0x1f4, (sector >> 8) & 0xff);
  outb(0x1f5, (sector >> 16) & 0xff);
  outb(0x1f6, 0xe0 | ((b->dev&1)<<4) | ((sector>>24)&0x0f));
  if(b->flags & B_DIRTY){
    outb(0x1f7, write_cmd);
    outsl(0x1f0, b->data, BSIZE/4);
80101fab:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101fae:	b9 80 00 00 00       	mov    $0x80,%ecx
80101fb3:	fc                   	cld    
80101fb4:	f3 6f                	rep outsl %ds:(%esi),(%dx)
  } else {
    outb(0x1f7, read_cmd);
  }
}
80101fb6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fb9:	5b                   	pop    %ebx
80101fba:	5e                   	pop    %esi
80101fbb:	5d                   	pop    %ebp
80101fbc:	c3                   	ret    
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
  if(b->blockno >= FSSIZE)
    panic("incorrect blockno");
80101fbd:	83 ec 0c             	sub    $0xc,%esp
80101fc0:	68 e0 75 10 80       	push   $0x801075e0
80101fc5:	e8 a6 e3 ff ff       	call   80100370 <panic>
// Start the request for b.  Caller must hold idelock.
static void
idestart(struct buf *b)
{
  if(b == 0)
    panic("idestart");
80101fca:	83 ec 0c             	sub    $0xc,%esp
80101fcd:	68 d7 75 10 80       	push   $0x801075d7
80101fd2:	e8 99 e3 ff ff       	call   80100370 <panic>
80101fd7:	89 f6                	mov    %esi,%esi
80101fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101fe0 <ideinit>:
  return 0;
}

void
ideinit(void)
{
80101fe0:	55                   	push   %ebp
80101fe1:	89 e5                	mov    %esp,%ebp
80101fe3:	83 ec 10             	sub    $0x10,%esp
  int i;

  initlock(&idelock, "ide");
80101fe6:	68 f2 75 10 80       	push   $0x801075f2
80101feb:	68 80 a5 10 80       	push   $0x8010a580
80101ff0:	e8 7b 24 00 00       	call   80104470 <initlock>
  picenable(IRQ_IDE);
80101ff5:	c7 04 24 0e 00 00 00 	movl   $0xe,(%esp)
80101ffc:	e8 cf 12 00 00       	call   801032d0 <picenable>
  ioapicenable(IRQ_IDE, ncpu - 1);
80102001:	58                   	pop    %eax
80102002:	a1 80 2d 11 80       	mov    0x80112d80,%eax
80102007:	5a                   	pop    %edx
80102008:	83 e8 01             	sub    $0x1,%eax
8010200b:	50                   	push   %eax
8010200c:	6a 0e                	push   $0xe
8010200e:	e8 bd 02 00 00       	call   801022d0 <ioapicenable>
80102013:	83 c4 10             	add    $0x10,%esp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102016:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010201b:	90                   	nop
8010201c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102020:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
80102021:	83 e0 c0             	and    $0xffffffc0,%eax
80102024:	3c 40                	cmp    $0x40,%al
80102026:	75 f8                	jne    80102020 <ideinit+0x40>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102028:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010202d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102032:	ee                   	out    %al,(%dx)
80102033:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102038:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010203d:	eb 06                	jmp    80102045 <ideinit+0x65>
8010203f:	90                   	nop
  ioapicenable(IRQ_IDE, ncpu - 1);
  idewait(0);

  // Check if disk 1 is present
  outb(0x1f6, 0xe0 | (1<<4));
  for(i=0; i<1000; i++){
80102040:	83 e9 01             	sub    $0x1,%ecx
80102043:	74 0f                	je     80102054 <ideinit+0x74>
80102045:	ec                   	in     (%dx),%al
    if(inb(0x1f7) != 0){
80102046:	84 c0                	test   %al,%al
80102048:	74 f6                	je     80102040 <ideinit+0x60>
      havedisk1 = 1;
8010204a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102051:	00 00 00 
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102054:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102059:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010205e:	ee                   	out    %al,(%dx)
    }
  }

  // Switch back to disk 0.
  outb(0x1f6, 0xe0 | (0<<4));
}
8010205f:	c9                   	leave  
80102060:	c3                   	ret    
80102061:	eb 0d                	jmp    80102070 <ideintr>
80102063:	90                   	nop
80102064:	90                   	nop
80102065:	90                   	nop
80102066:	90                   	nop
80102067:	90                   	nop
80102068:	90                   	nop
80102069:	90                   	nop
8010206a:	90                   	nop
8010206b:	90                   	nop
8010206c:	90                   	nop
8010206d:	90                   	nop
8010206e:	90                   	nop
8010206f:	90                   	nop

80102070 <ideintr>:
}

// Interrupt handler.
void
ideintr(void)
{
80102070:	55                   	push   %ebp
80102071:	89 e5                	mov    %esp,%ebp
80102073:	57                   	push   %edi
80102074:	56                   	push   %esi
80102075:	53                   	push   %ebx
80102076:	83 ec 18             	sub    $0x18,%esp
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
80102079:	68 80 a5 10 80       	push   $0x8010a580
8010207e:	e8 0d 24 00 00       	call   80104490 <acquire>
  if((b = idequeue) == 0){
80102083:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
80102089:	83 c4 10             	add    $0x10,%esp
8010208c:	85 db                	test   %ebx,%ebx
8010208e:	74 34                	je     801020c4 <ideintr+0x54>
    release(&idelock);
    // cprintf("spurious IDE interrupt\n");
    return;
  }
  idequeue = b->qnext;
80102090:	8b 43 58             	mov    0x58(%ebx),%eax
80102093:	a3 64 a5 10 80       	mov    %eax,0x8010a564

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
80102098:	8b 33                	mov    (%ebx),%esi
8010209a:	f7 c6 04 00 00 00    	test   $0x4,%esi
801020a0:	74 3e                	je     801020e0 <ideintr+0x70>
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801020a2:	83 e6 fb             	and    $0xfffffffb,%esi
  wakeup(b);
801020a5:	83 ec 0c             	sub    $0xc,%esp
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);

  // Wake process waiting for this buf.
  b->flags |= B_VALID;
  b->flags &= ~B_DIRTY;
801020a8:	83 ce 02             	or     $0x2,%esi
801020ab:	89 33                	mov    %esi,(%ebx)
  wakeup(b);
801020ad:	53                   	push   %ebx
801020ae:	e8 8d 1f 00 00       	call   80104040 <wakeup>

  // Start disk on next buf in queue.
  if(idequeue != 0)
801020b3:	a1 64 a5 10 80       	mov    0x8010a564,%eax
801020b8:	83 c4 10             	add    $0x10,%esp
801020bb:	85 c0                	test   %eax,%eax
801020bd:	74 05                	je     801020c4 <ideintr+0x54>
    idestart(idequeue);
801020bf:	e8 4c fe ff ff       	call   80101f10 <idestart>
  struct buf *b;

  // First queued buffer is the active request.
  acquire(&idelock);
  if((b = idequeue) == 0){
    release(&idelock);
801020c4:	83 ec 0c             	sub    $0xc,%esp
801020c7:	68 80 a5 10 80       	push   $0x8010a580
801020cc:	e8 9f 25 00 00       	call   80104670 <release>
  // Start disk on next buf in queue.
  if(idequeue != 0)
    idestart(idequeue);

  release(&idelock);
}
801020d1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020d4:	5b                   	pop    %ebx
801020d5:	5e                   	pop    %esi
801020d6:	5f                   	pop    %edi
801020d7:	5d                   	pop    %ebp
801020d8:	c3                   	ret    
801020d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801020e0:	ba f7 01 00 00       	mov    $0x1f7,%edx
801020e5:	8d 76 00             	lea    0x0(%esi),%esi
801020e8:	ec                   	in     (%dx),%al
static int
idewait(int checkerr)
{
  int r;

  while(((r = inb(0x1f7)) & (IDE_BSY|IDE_DRDY)) != IDE_DRDY)
801020e9:	89 c1                	mov    %eax,%ecx
801020eb:	83 e1 c0             	and    $0xffffffc0,%ecx
801020ee:	80 f9 40             	cmp    $0x40,%cl
801020f1:	75 f5                	jne    801020e8 <ideintr+0x78>
    ;
  if(checkerr && (r & (IDE_DF|IDE_ERR)) != 0)
801020f3:	a8 21                	test   $0x21,%al
801020f5:	75 ab                	jne    801020a2 <ideintr+0x32>
  }
  idequeue = b->qnext;

  // Read data if needed.
  if(!(b->flags & B_DIRTY) && idewait(1) >= 0)
    insl(0x1f0, b->data, BSIZE/4);
801020f7:	8d 7b 5c             	lea    0x5c(%ebx),%edi
}

static inline void
insl(int port, void *addr, int cnt)
{
  asm volatile("cld; rep insl" :
801020fa:	b9 80 00 00 00       	mov    $0x80,%ecx
801020ff:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102104:	fc                   	cld    
80102105:	f3 6d                	rep insl (%dx),%es:(%edi)
80102107:	8b 33                	mov    (%ebx),%esi
80102109:	eb 97                	jmp    801020a2 <ideintr+0x32>
8010210b:	90                   	nop
8010210c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102110 <iderw>:
// Sync buf with disk.
// If B_DIRTY is set, write buf to disk, clear B_DIRTY, set B_VALID.
// Else if B_VALID is not set, read buf from disk, set B_VALID.
void
iderw(struct buf *b)
{
80102110:	55                   	push   %ebp
80102111:	89 e5                	mov    %esp,%ebp
80102113:	53                   	push   %ebx
80102114:	83 ec 10             	sub    $0x10,%esp
80102117:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct buf **pp;

  if(!holdingsleep(&b->lock))
8010211a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010211d:	50                   	push   %eax
8010211e:	e8 1d 23 00 00       	call   80104440 <holdingsleep>
80102123:	83 c4 10             	add    $0x10,%esp
80102126:	85 c0                	test   %eax,%eax
80102128:	0f 84 ad 00 00 00    	je     801021db <iderw+0xcb>
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
8010212e:	8b 03                	mov    (%ebx),%eax
80102130:	83 e0 06             	and    $0x6,%eax
80102133:	83 f8 02             	cmp    $0x2,%eax
80102136:	0f 84 b9 00 00 00    	je     801021f5 <iderw+0xe5>
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
8010213c:	8b 53 04             	mov    0x4(%ebx),%edx
8010213f:	85 d2                	test   %edx,%edx
80102141:	74 0d                	je     80102150 <iderw+0x40>
80102143:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102148:	85 c0                	test   %eax,%eax
8010214a:	0f 84 98 00 00 00    	je     801021e8 <iderw+0xd8>
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock
80102150:	83 ec 0c             	sub    $0xc,%esp
80102153:	68 80 a5 10 80       	push   $0x8010a580
80102158:	e8 33 23 00 00       	call   80104490 <acquire>

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010215d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102163:	83 c4 10             	add    $0x10,%esp
    panic("iderw: ide disk 1 not present");

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
80102166:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
8010216d:	85 d2                	test   %edx,%edx
8010216f:	75 09                	jne    8010217a <iderw+0x6a>
80102171:	eb 58                	jmp    801021cb <iderw+0xbb>
80102173:	90                   	nop
80102174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102178:	89 c2                	mov    %eax,%edx
8010217a:	8b 42 58             	mov    0x58(%edx),%eax
8010217d:	85 c0                	test   %eax,%eax
8010217f:	75 f7                	jne    80102178 <iderw+0x68>
80102181:	83 c2 58             	add    $0x58,%edx
    ;
  *pp = b;
80102184:	89 1a                	mov    %ebx,(%edx)

  // Start disk if necessary.
  if(idequeue == b)
80102186:	3b 1d 64 a5 10 80    	cmp    0x8010a564,%ebx
8010218c:	74 44                	je     801021d2 <iderw+0xc2>
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
8010218e:	8b 03                	mov    (%ebx),%eax
80102190:	83 e0 06             	and    $0x6,%eax
80102193:	83 f8 02             	cmp    $0x2,%eax
80102196:	74 23                	je     801021bb <iderw+0xab>
80102198:	90                   	nop
80102199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    sleep(b, &idelock);
801021a0:	83 ec 08             	sub    $0x8,%esp
801021a3:	68 80 a5 10 80       	push   $0x8010a580
801021a8:	53                   	push   %ebx
801021a9:	e8 e2 1c 00 00       	call   80103e90 <sleep>
  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);

  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
801021ae:	8b 03                	mov    (%ebx),%eax
801021b0:	83 c4 10             	add    $0x10,%esp
801021b3:	83 e0 06             	and    $0x6,%eax
801021b6:	83 f8 02             	cmp    $0x2,%eax
801021b9:	75 e5                	jne    801021a0 <iderw+0x90>
    sleep(b, &idelock);
  }

  release(&idelock);
801021bb:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
}
801021c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021c5:	c9                   	leave  
  // Wait for request to finish.
  while((b->flags & (B_VALID|B_DIRTY)) != B_VALID){
    sleep(b, &idelock);
  }

  release(&idelock);
801021c6:	e9 a5 24 00 00       	jmp    80104670 <release>

  acquire(&idelock);  //DOC:acquire-lock

  // Append b to idequeue.
  b->qnext = 0;
  for(pp=&idequeue; *pp; pp=&(*pp)->qnext)  //DOC:insert-queue
801021cb:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
801021d0:	eb b2                	jmp    80102184 <iderw+0x74>
    ;
  *pp = b;

  // Start disk if necessary.
  if(idequeue == b)
    idestart(b);
801021d2:	89 d8                	mov    %ebx,%eax
801021d4:	e8 37 fd ff ff       	call   80101f10 <idestart>
801021d9:	eb b3                	jmp    8010218e <iderw+0x7e>
iderw(struct buf *b)
{
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
801021db:	83 ec 0c             	sub    $0xc,%esp
801021de:	68 f6 75 10 80       	push   $0x801075f6
801021e3:	e8 88 e1 ff ff       	call   80100370 <panic>
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
  if(b->dev != 0 && !havedisk1)
    panic("iderw: ide disk 1 not present");
801021e8:	83 ec 0c             	sub    $0xc,%esp
801021eb:	68 21 76 10 80       	push   $0x80107621
801021f0:	e8 7b e1 ff ff       	call   80100370 <panic>
  struct buf **pp;

  if(!holdingsleep(&b->lock))
    panic("iderw: buf not locked");
  if((b->flags & (B_VALID|B_DIRTY)) == B_VALID)
    panic("iderw: nothing to do");
801021f5:	83 ec 0c             	sub    $0xc,%esp
801021f8:	68 0c 76 10 80       	push   $0x8010760c
801021fd:	e8 6e e1 ff ff       	call   80100370 <panic>
80102202:	66 90                	xchg   %ax,%ax
80102204:	66 90                	xchg   %ax,%ax
80102206:	66 90                	xchg   %ax,%ax
80102208:	66 90                	xchg   %ax,%ax
8010220a:	66 90                	xchg   %ax,%ax
8010220c:	66 90                	xchg   %ax,%ax
8010220e:	66 90                	xchg   %ax,%ax

80102210 <ioapicinit>:
void
ioapicinit(void)
{
  int i, id, maxintr;

  if(!ismp)
80102210:	a1 84 27 11 80       	mov    0x80112784,%eax
80102215:	85 c0                	test   %eax,%eax
80102217:	0f 84 a8 00 00 00    	je     801022c5 <ioapicinit+0xb5>
  ioapic->data = data;
}

void
ioapicinit(void)
{
8010221d:	55                   	push   %ebp
  int i, id, maxintr;

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
8010221e:	c7 05 54 26 11 80 00 	movl   $0xfec00000,0x80112654
80102225:	00 c0 fe 
  ioapic->data = data;
}

void
ioapicinit(void)
{
80102228:	89 e5                	mov    %esp,%ebp
8010222a:	56                   	push   %esi
8010222b:	53                   	push   %ebx
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
8010222c:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102233:	00 00 00 
  return ioapic->data;
80102236:	8b 15 54 26 11 80    	mov    0x80112654,%edx
8010223c:	8b 72 10             	mov    0x10(%edx),%esi
};

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
8010223f:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
  return ioapic->data;
80102245:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010224b:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx

  if(!ismp)
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
80102252:	89 f0                	mov    %esi,%eax
80102254:	c1 e8 10             	shr    $0x10,%eax
80102257:	0f b6 f0             	movzbl %al,%esi

static uint
ioapicread(int reg)
{
  ioapic->reg = reg;
  return ioapic->data;
8010225a:	8b 41 10             	mov    0x10(%ecx),%eax
    return;

  ioapic = (volatile struct ioapic*)IOAPIC;
  maxintr = (ioapicread(REG_VER) >> 16) & 0xFF;
  id = ioapicread(REG_ID) >> 24;
  if(id != ioapicid)
8010225d:	c1 e8 18             	shr    $0x18,%eax
80102260:	39 d0                	cmp    %edx,%eax
80102262:	74 16                	je     8010227a <ioapicinit+0x6a>
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");
80102264:	83 ec 0c             	sub    $0xc,%esp
80102267:	68 40 76 10 80       	push   $0x80107640
8010226c:	e8 ef e3 ff ff       	call   80100660 <cprintf>
80102271:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
80102277:	83 c4 10             	add    $0x10,%esp
8010227a:	83 c6 21             	add    $0x21,%esi
  ioapic->data = data;
}

void
ioapicinit(void)
{
8010227d:	ba 10 00 00 00       	mov    $0x10,%edx
80102282:	b8 20 00 00 00       	mov    $0x20,%eax
80102287:	89 f6                	mov    %esi,%esi
80102289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
80102290:	89 11                	mov    %edx,(%ecx)
  ioapic->data = data;
80102292:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
80102298:	89 c3                	mov    %eax,%ebx
8010229a:	81 cb 00 00 01 00    	or     $0x10000,%ebx
801022a0:	83 c0 01             	add    $0x1,%eax

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
801022a3:	89 59 10             	mov    %ebx,0x10(%ecx)
801022a6:	8d 5a 01             	lea    0x1(%edx),%ebx
801022a9:	83 c2 02             	add    $0x2,%edx
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
801022ac:	39 f0                	cmp    %esi,%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022ae:	89 19                	mov    %ebx,(%ecx)
  ioapic->data = data;
801022b0:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
801022b6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
  if(id != ioapicid)
    cprintf("ioapicinit: id isn't equal to ioapicid; not a MP\n");

  // Mark all interrupts edge-triggered, active high, disabled,
  // and not routed to any CPUs.
  for(i = 0; i <= maxintr; i++){
801022bd:	75 d1                	jne    80102290 <ioapicinit+0x80>
    ioapicwrite(REG_TABLE+2*i, INT_DISABLED | (T_IRQ0 + i));
    ioapicwrite(REG_TABLE+2*i+1, 0);
  }
}
801022bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801022c2:	5b                   	pop    %ebx
801022c3:	5e                   	pop    %esi
801022c4:	5d                   	pop    %ebp
801022c5:	f3 c3                	repz ret 
801022c7:	89 f6                	mov    %esi,%esi
801022c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022d0 <ioapicenable>:

void
ioapicenable(int irq, int cpunum)
{
  if(!ismp)
801022d0:	8b 15 84 27 11 80    	mov    0x80112784,%edx
  }
}

void
ioapicenable(int irq, int cpunum)
{
801022d6:	55                   	push   %ebp
801022d7:	89 e5                	mov    %esp,%ebp
  if(!ismp)
801022d9:	85 d2                	test   %edx,%edx
  }
}

void
ioapicenable(int irq, int cpunum)
{
801022db:	8b 45 08             	mov    0x8(%ebp),%eax
  if(!ismp)
801022de:	74 2b                	je     8010230b <ioapicenable+0x3b>
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022e0:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
    return;

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
801022e6:	8d 50 20             	lea    0x20(%eax),%edx
801022e9:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022ed:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
801022ef:	8b 0d 54 26 11 80    	mov    0x80112654,%ecx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022f5:	83 c0 01             	add    $0x1,%eax
  ioapic->data = data;
801022f8:	89 51 10             	mov    %edx,0x10(%ecx)

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
801022fb:	8b 55 0c             	mov    0xc(%ebp),%edx
}

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
801022fe:	89 01                	mov    %eax,(%ecx)
  ioapic->data = data;
80102300:	a1 54 26 11 80       	mov    0x80112654,%eax

  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
80102305:	c1 e2 18             	shl    $0x18,%edx

static void
ioapicwrite(int reg, uint data)
{
  ioapic->reg = reg;
  ioapic->data = data;
80102308:	89 50 10             	mov    %edx,0x10(%eax)
  // Mark interrupt edge-triggered, active high,
  // enabled, and routed to the given cpunum,
  // which happens to be that cpu's APIC ID.
  ioapicwrite(REG_TABLE+2*irq, T_IRQ0 + irq);
  ioapicwrite(REG_TABLE+2*irq+1, cpunum << 24);
}
8010230b:	5d                   	pop    %ebp
8010230c:	c3                   	ret    
8010230d:	66 90                	xchg   %ax,%ax
8010230f:	90                   	nop

80102310 <kfree>:
// which normally should have been returned by a
// call to kalloc().  (The exception is when
// initializing the allocator; see kinit above.)
void
kfree(char *v)
{
80102310:	55                   	push   %ebp
80102311:	89 e5                	mov    %esp,%ebp
80102313:	53                   	push   %ebx
80102314:	83 ec 04             	sub    $0x4,%esp
80102317:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
8010231a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102320:	75 70                	jne    80102392 <kfree+0x82>
80102322:	81 fb 28 99 11 80    	cmp    $0x80119928,%ebx
80102328:	72 68                	jb     80102392 <kfree+0x82>
8010232a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102330:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102335:	77 5b                	ja     80102392 <kfree+0x82>
    panic("kfree");

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);
80102337:	83 ec 04             	sub    $0x4,%esp
8010233a:	68 00 10 00 00       	push   $0x1000
8010233f:	6a 01                	push   $0x1
80102341:	53                   	push   %ebx
80102342:	e8 79 23 00 00       	call   801046c0 <memset>

  if(kmem.use_lock)
80102347:	8b 15 94 26 11 80    	mov    0x80112694,%edx
8010234d:	83 c4 10             	add    $0x10,%esp
80102350:	85 d2                	test   %edx,%edx
80102352:	75 2c                	jne    80102380 <kfree+0x70>
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
80102354:	a1 98 26 11 80       	mov    0x80112698,%eax
80102359:	89 03                	mov    %eax,(%ebx)
  kmem.freelist = r;
  if(kmem.use_lock)
8010235b:	a1 94 26 11 80       	mov    0x80112694,%eax

  if(kmem.use_lock)
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
80102360:	89 1d 98 26 11 80    	mov    %ebx,0x80112698
  if(kmem.use_lock)
80102366:	85 c0                	test   %eax,%eax
80102368:	75 06                	jne    80102370 <kfree+0x60>
    release(&kmem.lock);
}
8010236a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010236d:	c9                   	leave  
8010236e:	c3                   	ret    
8010236f:	90                   	nop
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
80102370:	c7 45 08 60 26 11 80 	movl   $0x80112660,0x8(%ebp)
}
80102377:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010237a:	c9                   	leave  
    acquire(&kmem.lock);
  r = (struct run*)v;
  r->next = kmem.freelist;
  kmem.freelist = r;
  if(kmem.use_lock)
    release(&kmem.lock);
8010237b:	e9 f0 22 00 00       	jmp    80104670 <release>

  // Fill with junk to catch dangling refs.
  memset(v, 1, PGSIZE);

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102380:	83 ec 0c             	sub    $0xc,%esp
80102383:	68 60 26 11 80       	push   $0x80112660
80102388:	e8 03 21 00 00       	call   80104490 <acquire>
8010238d:	83 c4 10             	add    $0x10,%esp
80102390:	eb c2                	jmp    80102354 <kfree+0x44>
kfree(char *v)
{
  struct run *r;

  if((uint)v % PGSIZE || v < end || V2P(v) >= PHYSTOP)
    panic("kfree");
80102392:	83 ec 0c             	sub    $0xc,%esp
80102395:	68 72 76 10 80       	push   $0x80107672
8010239a:	e8 d1 df ff ff       	call   80100370 <panic>
8010239f:	90                   	nop

801023a0 <freerange>:
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
801023a0:	55                   	push   %ebp
801023a1:	89 e5                	mov    %esp,%ebp
801023a3:	56                   	push   %esi
801023a4:	53                   	push   %ebx
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023a5:	8b 45 08             	mov    0x8(%ebp),%eax
  kmem.use_lock = 1;
}

void
freerange(void *vstart, void *vend)
{
801023a8:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
801023ab:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023b1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023b7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023bd:	39 de                	cmp    %ebx,%esi
801023bf:	72 23                	jb     801023e4 <freerange+0x44>
801023c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
801023c8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023ce:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023d1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
801023d7:	50                   	push   %eax
801023d8:	e8 33 ff ff ff       	call   80102310 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
801023dd:	83 c4 10             	add    $0x10,%esp
801023e0:	39 f3                	cmp    %esi,%ebx
801023e2:	76 e4                	jbe    801023c8 <freerange+0x28>
    kfree(p);
}
801023e4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023e7:	5b                   	pop    %ebx
801023e8:	5e                   	pop    %esi
801023e9:	5d                   	pop    %ebp
801023ea:	c3                   	ret    
801023eb:	90                   	nop
801023ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801023f0 <kinit1>:
// the pages mapped by entrypgdir on free list.
// 2. main() calls kinit2() with the rest of the physical pages
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
801023f0:	55                   	push   %ebp
801023f1:	89 e5                	mov    %esp,%ebp
801023f3:	56                   	push   %esi
801023f4:	53                   	push   %ebx
801023f5:	8b 75 0c             	mov    0xc(%ebp),%esi
  initlock(&kmem.lock, "kmem");
801023f8:	83 ec 08             	sub    $0x8,%esp
801023fb:	68 78 76 10 80       	push   $0x80107678
80102400:	68 60 26 11 80       	push   $0x80112660
80102405:	e8 66 20 00 00       	call   80104470 <initlock>

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010240a:	8b 45 08             	mov    0x8(%ebp),%eax
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010240d:	83 c4 10             	add    $0x10,%esp
// after installing a full page table that maps them on all cores.
void
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
80102410:	c7 05 94 26 11 80 00 	movl   $0x0,0x80112694
80102417:	00 00 00 

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010241a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102420:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102426:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010242c:	39 de                	cmp    %ebx,%esi
8010242e:	72 1c                	jb     8010244c <kinit1+0x5c>
    kfree(p);
80102430:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102436:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102439:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
8010243f:	50                   	push   %eax
80102440:	e8 cb fe ff ff       	call   80102310 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102445:	83 c4 10             	add    $0x10,%esp
80102448:	39 de                	cmp    %ebx,%esi
8010244a:	73 e4                	jae    80102430 <kinit1+0x40>
kinit1(void *vstart, void *vend)
{
  initlock(&kmem.lock, "kmem");
  kmem.use_lock = 0;
  freerange(vstart, vend);
}
8010244c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010244f:	5b                   	pop    %ebx
80102450:	5e                   	pop    %esi
80102451:	5d                   	pop    %ebp
80102452:	c3                   	ret    
80102453:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102460 <kinit2>:

void
kinit2(void *vstart, void *vend)
{
80102460:	55                   	push   %ebp
80102461:	89 e5                	mov    %esp,%ebp
80102463:	56                   	push   %esi
80102464:	53                   	push   %ebx

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
80102465:	8b 45 08             	mov    0x8(%ebp),%eax
  freerange(vstart, vend);
}

void
kinit2(void *vstart, void *vend)
{
80102468:	8b 75 0c             	mov    0xc(%ebp),%esi

void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
8010246b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102471:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102477:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010247d:	39 de                	cmp    %ebx,%esi
8010247f:	72 23                	jb     801024a4 <kinit2+0x44>
80102481:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    kfree(p);
80102488:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010248e:	83 ec 0c             	sub    $0xc,%esp
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
80102491:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    kfree(p);
80102497:	50                   	push   %eax
80102498:	e8 73 fe ff ff       	call   80102310 <kfree>
void
freerange(void *vstart, void *vend)
{
  char *p;
  p = (char*)PGROUNDUP((uint)vstart);
  for(; p + PGSIZE <= (char*)vend; p += PGSIZE)
8010249d:	83 c4 10             	add    $0x10,%esp
801024a0:	39 de                	cmp    %ebx,%esi
801024a2:	73 e4                	jae    80102488 <kinit2+0x28>

void
kinit2(void *vstart, void *vend)
{
  freerange(vstart, vend);
  kmem.use_lock = 1;
801024a4:	c7 05 94 26 11 80 01 	movl   $0x1,0x80112694
801024ab:	00 00 00 
}
801024ae:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024b1:	5b                   	pop    %ebx
801024b2:	5e                   	pop    %esi
801024b3:	5d                   	pop    %ebp
801024b4:	c3                   	ret    
801024b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024c0 <kalloc>:
// Allocate one 4096-byte page of physical memory.
// Returns a pointer that the kernel can use.
// Returns 0 if the memory cannot be allocated.
char*
kalloc(void)
{
801024c0:	55                   	push   %ebp
801024c1:	89 e5                	mov    %esp,%ebp
801024c3:	53                   	push   %ebx
801024c4:	83 ec 04             	sub    $0x4,%esp
  struct run *r;

  if(kmem.use_lock)
801024c7:	a1 94 26 11 80       	mov    0x80112694,%eax
801024cc:	85 c0                	test   %eax,%eax
801024ce:	75 30                	jne    80102500 <kalloc+0x40>
    acquire(&kmem.lock);
  r = kmem.freelist;
801024d0:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
  if(r)
801024d6:	85 db                	test   %ebx,%ebx
801024d8:	74 1c                	je     801024f6 <kalloc+0x36>
    kmem.freelist = r->next;
801024da:	8b 13                	mov    (%ebx),%edx
801024dc:	89 15 98 26 11 80    	mov    %edx,0x80112698
  if(kmem.use_lock)
801024e2:	85 c0                	test   %eax,%eax
801024e4:	74 10                	je     801024f6 <kalloc+0x36>
    release(&kmem.lock);
801024e6:	83 ec 0c             	sub    $0xc,%esp
801024e9:	68 60 26 11 80       	push   $0x80112660
801024ee:	e8 7d 21 00 00       	call   80104670 <release>
801024f3:	83 c4 10             	add    $0x10,%esp
  return (char*)r;
}
801024f6:	89 d8                	mov    %ebx,%eax
801024f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801024fb:	c9                   	leave  
801024fc:	c3                   	ret    
801024fd:	8d 76 00             	lea    0x0(%esi),%esi
kalloc(void)
{
  struct run *r;

  if(kmem.use_lock)
    acquire(&kmem.lock);
80102500:	83 ec 0c             	sub    $0xc,%esp
80102503:	68 60 26 11 80       	push   $0x80112660
80102508:	e8 83 1f 00 00       	call   80104490 <acquire>
  r = kmem.freelist;
8010250d:	8b 1d 98 26 11 80    	mov    0x80112698,%ebx
  if(r)
80102513:	83 c4 10             	add    $0x10,%esp
80102516:	a1 94 26 11 80       	mov    0x80112694,%eax
8010251b:	85 db                	test   %ebx,%ebx
8010251d:	75 bb                	jne    801024da <kalloc+0x1a>
8010251f:	eb c1                	jmp    801024e2 <kalloc+0x22>
80102521:	66 90                	xchg   %ax,%ax
80102523:	66 90                	xchg   %ax,%ax
80102525:	66 90                	xchg   %ax,%ax
80102527:	66 90                	xchg   %ax,%ax
80102529:	66 90                	xchg   %ax,%ax
8010252b:	66 90                	xchg   %ax,%ax
8010252d:	66 90                	xchg   %ax,%ax
8010252f:	90                   	nop

80102530 <kbdgetc>:
#include "defs.h"
#include "kbd.h"

int
kbdgetc(void)
{
80102530:	55                   	push   %ebp
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102531:	ba 64 00 00 00       	mov    $0x64,%edx
80102536:	89 e5                	mov    %esp,%ebp
80102538:	ec                   	in     (%dx),%al
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
80102539:	a8 01                	test   $0x1,%al
8010253b:	0f 84 af 00 00 00    	je     801025f0 <kbdgetc+0xc0>
80102541:	ba 60 00 00 00       	mov    $0x60,%edx
80102546:	ec                   	in     (%dx),%al
    return -1;
  data = inb(KBDATAP);
80102547:	0f b6 d0             	movzbl %al,%edx

  if(data == 0xE0){
8010254a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102550:	74 7e                	je     801025d0 <kbdgetc+0xa0>
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
80102552:	84 c0                	test   %al,%al
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
80102554:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
8010255a:	79 24                	jns    80102580 <kbdgetc+0x50>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
8010255c:	f6 c1 40             	test   $0x40,%cl
8010255f:	75 05                	jne    80102566 <kbdgetc+0x36>
80102561:	89 c2                	mov    %eax,%edx
80102563:	83 e2 7f             	and    $0x7f,%edx
    shift &= ~(shiftcode[data] | E0ESC);
80102566:	0f b6 82 a0 77 10 80 	movzbl -0x7fef8860(%edx),%eax
8010256d:	83 c8 40             	or     $0x40,%eax
80102570:	0f b6 c0             	movzbl %al,%eax
80102573:	f7 d0                	not    %eax
80102575:	21 c8                	and    %ecx,%eax
80102577:	a3 b4 a5 10 80       	mov    %eax,0x8010a5b4
    return 0;
8010257c:	31 c0                	xor    %eax,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
8010257e:	5d                   	pop    %ebp
8010257f:	c3                   	ret    
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
80102580:	f6 c1 40             	test   $0x40,%cl
80102583:	74 09                	je     8010258e <kbdgetc+0x5e>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
80102585:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
80102588:	83 e1 bf             	and    $0xffffffbf,%ecx
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
8010258b:	0f b6 d0             	movzbl %al,%edx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
8010258e:	0f b6 82 a0 77 10 80 	movzbl -0x7fef8860(%edx),%eax
80102595:	09 c1                	or     %eax,%ecx
80102597:	0f b6 82 a0 76 10 80 	movzbl -0x7fef8960(%edx),%eax
8010259e:	31 c1                	xor    %eax,%ecx
  c = charcode[shift & (CTL | SHIFT)][data];
801025a0:	89 c8                	mov    %ecx,%eax
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
801025a2:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
  c = charcode[shift & (CTL | SHIFT)][data];
801025a8:	83 e0 03             	and    $0x3,%eax
  if(shift & CAPSLOCK){
801025ab:	83 e1 08             	and    $0x8,%ecx
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
801025ae:	8b 04 85 80 76 10 80 	mov    -0x7fef8980(,%eax,4),%eax
801025b5:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
  if(shift & CAPSLOCK){
801025b9:	74 c3                	je     8010257e <kbdgetc+0x4e>
    if('a' <= c && c <= 'z')
801025bb:	8d 50 9f             	lea    -0x61(%eax),%edx
801025be:	83 fa 19             	cmp    $0x19,%edx
801025c1:	77 1d                	ja     801025e0 <kbdgetc+0xb0>
      c += 'A' - 'a';
801025c3:	83 e8 20             	sub    $0x20,%eax
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025c6:	5d                   	pop    %ebp
801025c7:	c3                   	ret    
801025c8:	90                   	nop
801025c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
801025d0:	31 c0                	xor    %eax,%eax
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
801025d2:	83 0d b4 a5 10 80 40 	orl    $0x40,0x8010a5b4
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025d9:	5d                   	pop    %ebp
801025da:	c3                   	ret    
801025db:	90                   	nop
801025dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
801025e0:	8d 48 bf             	lea    -0x41(%eax),%ecx
      c += 'a' - 'A';
801025e3:	8d 50 20             	lea    0x20(%eax),%edx
  }
  return c;
}
801025e6:	5d                   	pop    %ebp
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
801025e7:	83 f9 19             	cmp    $0x19,%ecx
801025ea:	0f 46 c2             	cmovbe %edx,%eax
  }
  return c;
}
801025ed:	c3                   	ret    
801025ee:	66 90                	xchg   %ax,%ax
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
801025f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
  return c;
}
801025f5:	5d                   	pop    %ebp
801025f6:	c3                   	ret    
801025f7:	89 f6                	mov    %esi,%esi
801025f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102600 <kbdintr>:

void
kbdintr(void)
{
80102600:	55                   	push   %ebp
80102601:	89 e5                	mov    %esp,%ebp
80102603:	83 ec 14             	sub    $0x14,%esp
  consoleintr(kbdgetc);
80102606:	68 30 25 10 80       	push   $0x80102530
8010260b:	e8 e0 e1 ff ff       	call   801007f0 <consoleintr>
}
80102610:	83 c4 10             	add    $0x10,%esp
80102613:	c9                   	leave  
80102614:	c3                   	ret    
80102615:	66 90                	xchg   %ax,%ax
80102617:	66 90                	xchg   %ax,%ax
80102619:	66 90                	xchg   %ax,%ax
8010261b:	66 90                	xchg   %ax,%ax
8010261d:	66 90                	xchg   %ax,%ax
8010261f:	90                   	nop

80102620 <lapicinit>:
//PAGEBREAK!

void
lapicinit(void)
{
  if(!lapic)
80102620:	a1 9c 26 11 80       	mov    0x8011269c,%eax
}
//PAGEBREAK!

void
lapicinit(void)
{
80102625:	55                   	push   %ebp
80102626:	89 e5                	mov    %esp,%ebp
  if(!lapic)
80102628:	85 c0                	test   %eax,%eax
8010262a:	0f 84 c8 00 00 00    	je     801026f8 <lapicinit+0xd8>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102630:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102637:	01 00 00 
  lapic[ID];  // wait for write to finish, by reading
8010263a:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010263d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102644:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102647:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010264a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102651:	00 02 00 
  lapic[ID];  // wait for write to finish, by reading
80102654:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102657:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010265e:	96 98 00 
  lapic[ID];  // wait for write to finish, by reading
80102661:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102664:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010266b:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010266e:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102671:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102678:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010267b:	8b 50 20             	mov    0x20(%eax),%edx
  lapicw(LINT0, MASKED);
  lapicw(LINT1, MASKED);

  // Disable performance counter overflow interrupts
  // on machines that provide that interrupt entry.
  if(((lapic[VER]>>16) & 0xFF) >= 4)
8010267e:	8b 50 30             	mov    0x30(%eax),%edx
80102681:	c1 ea 10             	shr    $0x10,%edx
80102684:	80 fa 03             	cmp    $0x3,%dl
80102687:	77 77                	ja     80102700 <lapicinit+0xe0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102689:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
80102690:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102693:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102696:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
8010269d:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026a0:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026a3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026aa:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026ad:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026b0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026b7:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026ba:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026bd:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026c4:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026c7:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026ca:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026d1:	85 08 00 
  lapic[ID];  // wait for write to finish, by reading
801026d4:	8b 50 20             	mov    0x20(%eax),%edx
801026d7:	89 f6                	mov    %esi,%esi
801026d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  lapicw(EOI, 0);

  // Send an Init Level De-Assert to synchronise arbitration ID's.
  lapicw(ICRHI, 0);
  lapicw(ICRLO, BCAST | INIT | LEVEL);
  while(lapic[ICRLO] & DELIVS)
801026e0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026e6:	80 e6 10             	and    $0x10,%dh
801026e9:	75 f5                	jne    801026e0 <lapicinit+0xc0>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801026eb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
801026f2:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801026f5:	8b 40 20             	mov    0x20(%eax),%eax
  while(lapic[ICRLO] & DELIVS)
    ;

  // Enable interrupts on the APIC (but not on the processor).
  lapicw(TPR, 0);
}
801026f8:	5d                   	pop    %ebp
801026f9:	c3                   	ret    
801026fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102700:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102707:	00 01 00 
  lapic[ID];  // wait for write to finish, by reading
8010270a:	8b 50 20             	mov    0x20(%eax),%edx
8010270d:	e9 77 ff ff ff       	jmp    80102689 <lapicinit+0x69>
80102712:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102720 <cpunum>:
  lapicw(TPR, 0);
}

int
cpunum(void)
{
80102720:	55                   	push   %ebp
80102721:	89 e5                	mov    %esp,%ebp
80102723:	56                   	push   %esi
80102724:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80102725:	9c                   	pushf  
80102726:	58                   	pop    %eax
  // Cannot call cpu when interrupts are enabled:
  // result not guaranteed to last long enough to be used!
  // Would prefer to panic but even printing is chancy here:
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
80102727:	f6 c4 02             	test   $0x2,%ah
8010272a:	74 12                	je     8010273e <cpunum+0x1e>
    static int n;
    if(n++ == 0)
8010272c:	a1 b8 a5 10 80       	mov    0x8010a5b8,%eax
80102731:	8d 50 01             	lea    0x1(%eax),%edx
80102734:	85 c0                	test   %eax,%eax
80102736:	89 15 b8 a5 10 80    	mov    %edx,0x8010a5b8
8010273c:	74 4d                	je     8010278b <cpunum+0x6b>
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
8010273e:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102743:	85 c0                	test   %eax,%eax
80102745:	74 60                	je     801027a7 <cpunum+0x87>
    return 0;

  apicid = lapic[ID] >> 24;
80102747:	8b 58 20             	mov    0x20(%eax),%ebx
  for (i = 0; i < ncpu; ++i) {
8010274a:	8b 35 80 2d 11 80    	mov    0x80112d80,%esi
  }

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
80102750:	c1 eb 18             	shr    $0x18,%ebx
  for (i = 0; i < ncpu; ++i) {
80102753:	85 f6                	test   %esi,%esi
80102755:	7e 59                	jle    801027b0 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
80102757:	0f b6 05 a0 27 11 80 	movzbl 0x801127a0,%eax
8010275e:	39 c3                	cmp    %eax,%ebx
80102760:	74 45                	je     801027a7 <cpunum+0x87>
80102762:	ba 5c 28 11 80       	mov    $0x8011285c,%edx
80102767:	31 c0                	xor    %eax,%eax
80102769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  if (!lapic)
    return 0;

  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
80102770:	83 c0 01             	add    $0x1,%eax
80102773:	39 f0                	cmp    %esi,%eax
80102775:	74 39                	je     801027b0 <cpunum+0x90>
    if (cpus[i].apicid == apicid)
80102777:	0f b6 0a             	movzbl (%edx),%ecx
8010277a:	81 c2 bc 00 00 00    	add    $0xbc,%edx
80102780:	39 cb                	cmp    %ecx,%ebx
80102782:	75 ec                	jne    80102770 <cpunum+0x50>
      return i;
  }
  panic("unknown apicid\n");
}
80102784:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102787:	5b                   	pop    %ebx
80102788:	5e                   	pop    %esi
80102789:	5d                   	pop    %ebp
8010278a:	c3                   	ret    
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
8010278b:	83 ec 08             	sub    $0x8,%esp
8010278e:	ff 75 04             	pushl  0x4(%ebp)
80102791:	68 a0 78 10 80       	push   $0x801078a0
80102796:	e8 c5 de ff ff       	call   80100660 <cprintf>
        __builtin_return_address(0));
  }

  if (!lapic)
8010279b:	a1 9c 26 11 80       	mov    0x8011269c,%eax
  // almost everything, including cprintf and panic, calls cpu,
  // often indirectly through acquire and release.
  if(readeflags()&FL_IF){
    static int n;
    if(n++ == 0)
      cprintf("cpu called from %x with interrupts enabled\n",
801027a0:	83 c4 10             	add    $0x10,%esp
        __builtin_return_address(0));
  }

  if (!lapic)
801027a3:	85 c0                	test   %eax,%eax
801027a5:	75 a0                	jne    80102747 <cpunum+0x27>
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
801027a7:	8d 65 f8             	lea    -0x8(%ebp),%esp
      cprintf("cpu called from %x with interrupts enabled\n",
        __builtin_return_address(0));
  }

  if (!lapic)
    return 0;
801027aa:	31 c0                	xor    %eax,%eax
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
}
801027ac:	5b                   	pop    %ebx
801027ad:	5e                   	pop    %esi
801027ae:	5d                   	pop    %ebp
801027af:	c3                   	ret    
  apicid = lapic[ID] >> 24;
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return i;
  }
  panic("unknown apicid\n");
801027b0:	83 ec 0c             	sub    $0xc,%esp
801027b3:	68 cc 78 10 80       	push   $0x801078cc
801027b8:	e8 b3 db ff ff       	call   80100370 <panic>
801027bd:	8d 76 00             	lea    0x0(%esi),%esi

801027c0 <lapiceoi>:

// Acknowledge interrupt.
void
lapiceoi(void)
{
  if(lapic)
801027c0:	a1 9c 26 11 80       	mov    0x8011269c,%eax
}

// Acknowledge interrupt.
void
lapiceoi(void)
{
801027c5:	55                   	push   %ebp
801027c6:	89 e5                	mov    %esp,%ebp
  if(lapic)
801027c8:	85 c0                	test   %eax,%eax
801027ca:	74 0d                	je     801027d9 <lapiceoi+0x19>
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
801027cc:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027d3:	00 00 00 
  lapic[ID];  // wait for write to finish, by reading
801027d6:	8b 40 20             	mov    0x20(%eax),%eax
void
lapiceoi(void)
{
  if(lapic)
    lapicw(EOI, 0);
}
801027d9:	5d                   	pop    %ebp
801027da:	c3                   	ret    
801027db:	90                   	nop
801027dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801027e0 <microdelay>:

// Spin for a given number of microseconds.
// On real hardware would want to tune this dynamically.
void
microdelay(int us)
{
801027e0:	55                   	push   %ebp
801027e1:	89 e5                	mov    %esp,%ebp
}
801027e3:	5d                   	pop    %ebp
801027e4:	c3                   	ret    
801027e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801027e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801027f0 <lapicstartap>:

// Start additional processor running entry code at addr.
// See Appendix B of MultiProcessor Specification.
void
lapicstartap(uchar apicid, uint addr)
{
801027f0:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801027f1:	ba 70 00 00 00       	mov    $0x70,%edx
801027f6:	b8 0f 00 00 00       	mov    $0xf,%eax
801027fb:	89 e5                	mov    %esp,%ebp
801027fd:	53                   	push   %ebx
801027fe:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102801:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102804:	ee                   	out    %al,(%dx)
80102805:	ba 71 00 00 00       	mov    $0x71,%edx
8010280a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010280f:	ee                   	out    %al,(%dx)
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102810:	31 c0                	xor    %eax,%eax
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102812:	c1 e3 18             	shl    $0x18,%ebx
  // and the warm reset vector (DWORD based at 40:67) to point at
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
80102815:	66 a3 67 04 00 80    	mov    %ax,0x80000467
  wrv[1] = addr >> 4;
8010281b:	89 c8                	mov    %ecx,%eax
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
8010281d:	c1 e9 0c             	shr    $0xc,%ecx
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102820:	c1 e8 04             	shr    $0x4,%eax
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102823:	89 da                	mov    %ebx,%edx
  // when it is in the halted state due to an INIT.  So the second
  // should be ignored, but it is part of the official Intel algorithm.
  // Bochs complains about the second one.  Too bad for Bochs.
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
80102825:	80 cd 06             	or     $0x6,%ch
  // the AP startup code prior to the [universal startup algorithm]."
  outb(CMOS_PORT, 0xF);  // offset 0xF is shutdown code
  outb(CMOS_PORT+1, 0x0A);
  wrv = (ushort*)P2V((0x40<<4 | 0x67));  // Warm reset vector
  wrv[0] = 0;
  wrv[1] = addr >> 4;
80102828:	66 a3 69 04 00 80    	mov    %ax,0x80000469
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010282e:	a1 9c 26 11 80       	mov    0x8011269c,%eax
80102833:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102839:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010283c:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
80102843:	c5 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102846:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102849:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102850:	85 00 00 
  lapic[ID];  // wait for write to finish, by reading
80102853:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102856:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010285c:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
8010285f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102865:	8b 58 20             	mov    0x20(%eax),%ebx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102868:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
  lapic[ID];  // wait for write to finish, by reading
8010286e:	8b 50 20             	mov    0x20(%eax),%edx
volatile uint *lapic;  // Initialized in mp.c

static void
lapicw(int index, int value)
{
  lapic[index] = value;
80102871:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
  lapic[ID];  // wait for write to finish, by reading
80102877:	8b 40 20             	mov    0x20(%eax),%eax
  for(i = 0; i < 2; i++){
    lapicw(ICRHI, apicid<<24);
    lapicw(ICRLO, STARTUP | (addr>>12));
    microdelay(200);
  }
}
8010287a:	5b                   	pop    %ebx
8010287b:	5d                   	pop    %ebp
8010287c:	c3                   	ret    
8010287d:	8d 76 00             	lea    0x0(%esi),%esi

80102880 <cmostime>:
  r->year   = cmos_read(YEAR);
}

// qemu seems to use 24-hour GWT and the values are BCD encoded
void cmostime(struct rtcdate *r)
{
80102880:	55                   	push   %ebp
80102881:	ba 70 00 00 00       	mov    $0x70,%edx
80102886:	b8 0b 00 00 00       	mov    $0xb,%eax
8010288b:	89 e5                	mov    %esp,%ebp
8010288d:	57                   	push   %edi
8010288e:	56                   	push   %esi
8010288f:	53                   	push   %ebx
80102890:	83 ec 4c             	sub    $0x4c,%esp
80102893:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102894:	ba 71 00 00 00       	mov    $0x71,%edx
80102899:	ec                   	in     (%dx),%al
8010289a:	83 e0 04             	and    $0x4,%eax
8010289d:	8d 75 d0             	lea    -0x30(%ebp),%esi
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028a0:	31 db                	xor    %ebx,%ebx
801028a2:	88 45 b7             	mov    %al,-0x49(%ebp)
801028a5:	bf 70 00 00 00       	mov    $0x70,%edi
801028aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801028b0:	89 d8                	mov    %ebx,%eax
801028b2:	89 fa                	mov    %edi,%edx
801028b4:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028b5:	b9 71 00 00 00       	mov    $0x71,%ecx
801028ba:	89 ca                	mov    %ecx,%edx
801028bc:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
801028bd:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028c0:	89 fa                	mov    %edi,%edx
801028c2:	89 45 b8             	mov    %eax,-0x48(%ebp)
801028c5:	b8 02 00 00 00       	mov    $0x2,%eax
801028ca:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028cb:	89 ca                	mov    %ecx,%edx
801028cd:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
801028ce:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028d1:	89 fa                	mov    %edi,%edx
801028d3:	89 45 bc             	mov    %eax,-0x44(%ebp)
801028d6:	b8 04 00 00 00       	mov    $0x4,%eax
801028db:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028dc:	89 ca                	mov    %ecx,%edx
801028de:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
801028df:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028e2:	89 fa                	mov    %edi,%edx
801028e4:	89 45 c0             	mov    %eax,-0x40(%ebp)
801028e7:	b8 07 00 00 00       	mov    $0x7,%eax
801028ec:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028ed:	89 ca                	mov    %ecx,%edx
801028ef:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
801028f0:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801028f3:	89 fa                	mov    %edi,%edx
801028f5:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801028f8:	b8 08 00 00 00       	mov    $0x8,%eax
801028fd:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
801028fe:	89 ca                	mov    %ecx,%edx
80102900:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102901:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102904:	89 fa                	mov    %edi,%edx
80102906:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102909:	b8 09 00 00 00       	mov    $0x9,%eax
8010290e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010290f:	89 ca                	mov    %ecx,%edx
80102911:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
80102912:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102915:	89 fa                	mov    %edi,%edx
80102917:	89 45 cc             	mov    %eax,-0x34(%ebp)
8010291a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010291f:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102920:	89 ca                	mov    %ecx,%edx
80102922:	ec                   	in     (%dx),%al
  bcd = (sb & (1 << 2)) == 0;

  // make sure CMOS doesn't modify time while we read it
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
80102923:	84 c0                	test   %al,%al
80102925:	78 89                	js     801028b0 <cmostime+0x30>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102927:	89 d8                	mov    %ebx,%eax
80102929:	89 fa                	mov    %edi,%edx
8010292b:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010292c:	89 ca                	mov    %ecx,%edx
8010292e:	ec                   	in     (%dx),%al
  return inb(CMOS_RETURN);
}

static void fill_rtcdate(struct rtcdate *r)
{
  r->second = cmos_read(SECS);
8010292f:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102932:	89 fa                	mov    %edi,%edx
80102934:	89 45 d0             	mov    %eax,-0x30(%ebp)
80102937:	b8 02 00 00 00       	mov    $0x2,%eax
8010293c:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010293d:	89 ca                	mov    %ecx,%edx
8010293f:	ec                   	in     (%dx),%al
  r->minute = cmos_read(MINS);
80102940:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102943:	89 fa                	mov    %edi,%edx
80102945:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102948:	b8 04 00 00 00       	mov    $0x4,%eax
8010294d:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010294e:	89 ca                	mov    %ecx,%edx
80102950:	ec                   	in     (%dx),%al
  r->hour   = cmos_read(HOURS);
80102951:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102954:	89 fa                	mov    %edi,%edx
80102956:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102959:	b8 07 00 00 00       	mov    $0x7,%eax
8010295e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
8010295f:	89 ca                	mov    %ecx,%edx
80102961:	ec                   	in     (%dx),%al
  r->day    = cmos_read(DAY);
80102962:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102965:	89 fa                	mov    %edi,%edx
80102967:	89 45 dc             	mov    %eax,-0x24(%ebp)
8010296a:	b8 08 00 00 00       	mov    $0x8,%eax
8010296f:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102970:	89 ca                	mov    %ecx,%edx
80102972:	ec                   	in     (%dx),%al
  r->month  = cmos_read(MONTH);
80102973:	0f b6 c0             	movzbl %al,%eax
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80102976:	89 fa                	mov    %edi,%edx
80102978:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010297b:	b8 09 00 00 00       	mov    $0x9,%eax
80102980:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80102981:	89 ca                	mov    %ecx,%edx
80102983:	ec                   	in     (%dx),%al
  r->year   = cmos_read(YEAR);
80102984:	0f b6 c0             	movzbl %al,%eax
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
80102987:	83 ec 04             	sub    $0x4,%esp
  r->second = cmos_read(SECS);
  r->minute = cmos_read(MINS);
  r->hour   = cmos_read(HOURS);
  r->day    = cmos_read(DAY);
  r->month  = cmos_read(MONTH);
  r->year   = cmos_read(YEAR);
8010298a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  for(;;) {
    fill_rtcdate(&t1);
    if(cmos_read(CMOS_STATA) & CMOS_UIP)
        continue;
    fill_rtcdate(&t2);
    if(memcmp(&t1, &t2, sizeof(t1)) == 0)
8010298d:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102990:	6a 18                	push   $0x18
80102992:	56                   	push   %esi
80102993:	50                   	push   %eax
80102994:	e8 77 1d 00 00       	call   80104710 <memcmp>
80102999:	83 c4 10             	add    $0x10,%esp
8010299c:	85 c0                	test   %eax,%eax
8010299e:	0f 85 0c ff ff ff    	jne    801028b0 <cmostime+0x30>
      break;
  }

  // convert
  if(bcd) {
801029a4:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
801029a8:	75 78                	jne    80102a22 <cmostime+0x1a2>
#define    CONV(x)     (t1.x = ((t1.x >> 4) * 10) + (t1.x & 0xf))
    CONV(second);
801029aa:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029ad:	89 c2                	mov    %eax,%edx
801029af:	83 e0 0f             	and    $0xf,%eax
801029b2:	c1 ea 04             	shr    $0x4,%edx
801029b5:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029b8:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029bb:	89 45 b8             	mov    %eax,-0x48(%ebp)
    CONV(minute);
801029be:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029c1:	89 c2                	mov    %eax,%edx
801029c3:	83 e0 0f             	and    $0xf,%eax
801029c6:	c1 ea 04             	shr    $0x4,%edx
801029c9:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029cc:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029cf:	89 45 bc             	mov    %eax,-0x44(%ebp)
    CONV(hour  );
801029d2:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029d5:	89 c2                	mov    %eax,%edx
801029d7:	83 e0 0f             	and    $0xf,%eax
801029da:	c1 ea 04             	shr    $0x4,%edx
801029dd:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029e0:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029e3:	89 45 c0             	mov    %eax,-0x40(%ebp)
    CONV(day   );
801029e6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029e9:	89 c2                	mov    %eax,%edx
801029eb:	83 e0 0f             	and    $0xf,%eax
801029ee:	c1 ea 04             	shr    $0x4,%edx
801029f1:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029f4:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029f7:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    CONV(month );
801029fa:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029fd:	89 c2                	mov    %eax,%edx
801029ff:	83 e0 0f             	and    $0xf,%eax
80102a02:	c1 ea 04             	shr    $0x4,%edx
80102a05:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a08:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a0b:	89 45 c8             	mov    %eax,-0x38(%ebp)
    CONV(year  );
80102a0e:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a11:	89 c2                	mov    %eax,%edx
80102a13:	83 e0 0f             	and    $0xf,%eax
80102a16:	c1 ea 04             	shr    $0x4,%edx
80102a19:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a1c:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a1f:	89 45 cc             	mov    %eax,-0x34(%ebp)
#undef     CONV
  }

  *r = t1;
80102a22:	8b 75 08             	mov    0x8(%ebp),%esi
80102a25:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102a28:	89 06                	mov    %eax,(%esi)
80102a2a:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102a2d:	89 46 04             	mov    %eax,0x4(%esi)
80102a30:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102a33:	89 46 08             	mov    %eax,0x8(%esi)
80102a36:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102a39:	89 46 0c             	mov    %eax,0xc(%esi)
80102a3c:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102a3f:	89 46 10             	mov    %eax,0x10(%esi)
80102a42:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102a45:	89 46 14             	mov    %eax,0x14(%esi)
  r->year += 2000;
80102a48:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
}
80102a4f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a52:	5b                   	pop    %ebx
80102a53:	5e                   	pop    %esi
80102a54:	5f                   	pop    %edi
80102a55:	5d                   	pop    %ebp
80102a56:	c3                   	ret    
80102a57:	66 90                	xchg   %ax,%ax
80102a59:	66 90                	xchg   %ax,%ax
80102a5b:	66 90                	xchg   %ax,%ax
80102a5d:	66 90                	xchg   %ax,%ax
80102a5f:	90                   	nop

80102a60 <install_trans>:
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102a60:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102a66:	85 c9                	test   %ecx,%ecx
80102a68:	0f 8e 85 00 00 00    	jle    80102af3 <install_trans+0x93>
}

// Copy committed blocks from log to their home location
static void
install_trans(void)
{
80102a6e:	55                   	push   %ebp
80102a6f:	89 e5                	mov    %esp,%ebp
80102a71:	57                   	push   %edi
80102a72:	56                   	push   %esi
80102a73:	53                   	push   %ebx
80102a74:	31 db                	xor    %ebx,%ebx
80102a76:	83 ec 0c             	sub    $0xc,%esp
80102a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
80102a80:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102a85:	83 ec 08             	sub    $0x8,%esp
80102a88:	01 d8                	add    %ebx,%eax
80102a8a:	83 c0 01             	add    $0x1,%eax
80102a8d:	50                   	push   %eax
80102a8e:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102a94:	e8 37 d6 ff ff       	call   801000d0 <bread>
80102a99:	89 c7                	mov    %eax,%edi
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102a9b:	58                   	pop    %eax
80102a9c:	5a                   	pop    %edx
80102a9d:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102aa4:	ff 35 e4 26 11 80    	pushl  0x801126e4
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102aaa:	83 c3 01             	add    $0x1,%ebx
    struct buf *lbuf = bread(log.dev, log.start+tail+1); // read log block
    struct buf *dbuf = bread(log.dev, log.lh.block[tail]); // read dst
80102aad:	e8 1e d6 ff ff       	call   801000d0 <bread>
80102ab2:	89 c6                	mov    %eax,%esi
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
80102ab4:	8d 47 5c             	lea    0x5c(%edi),%eax
80102ab7:	83 c4 0c             	add    $0xc,%esp
80102aba:	68 00 02 00 00       	push   $0x200
80102abf:	50                   	push   %eax
80102ac0:	8d 46 5c             	lea    0x5c(%esi),%eax
80102ac3:	50                   	push   %eax
80102ac4:	e8 a7 1c 00 00       	call   80104770 <memmove>
    bwrite(dbuf);  // write dst to disk
80102ac9:	89 34 24             	mov    %esi,(%esp)
80102acc:	e8 cf d6 ff ff       	call   801001a0 <bwrite>
    brelse(lbuf);
80102ad1:	89 3c 24             	mov    %edi,(%esp)
80102ad4:	e8 07 d7 ff ff       	call   801001e0 <brelse>
    brelse(dbuf);
80102ad9:	89 34 24             	mov    %esi,(%esp)
80102adc:	e8 ff d6 ff ff       	call   801001e0 <brelse>
static void
install_trans(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102ae1:	83 c4 10             	add    $0x10,%esp
80102ae4:	39 1d e8 26 11 80    	cmp    %ebx,0x801126e8
80102aea:	7f 94                	jg     80102a80 <install_trans+0x20>
    memmove(dbuf->data, lbuf->data, BSIZE);  // copy block to dst
    bwrite(dbuf);  // write dst to disk
    brelse(lbuf);
    brelse(dbuf);
  }
}
80102aec:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102aef:	5b                   	pop    %ebx
80102af0:	5e                   	pop    %esi
80102af1:	5f                   	pop    %edi
80102af2:	5d                   	pop    %ebp
80102af3:	f3 c3                	repz ret 
80102af5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b00 <write_head>:
// Write in-memory log header to disk.
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
80102b00:	55                   	push   %ebp
80102b01:	89 e5                	mov    %esp,%ebp
80102b03:	53                   	push   %ebx
80102b04:	83 ec 0c             	sub    $0xc,%esp
  struct buf *buf = bread(log.dev, log.start);
80102b07:	ff 35 d4 26 11 80    	pushl  0x801126d4
80102b0d:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102b13:	e8 b8 d5 ff ff       	call   801000d0 <bread>
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102b18:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
  for (i = 0; i < log.lh.n; i++) {
80102b1e:	83 c4 10             	add    $0x10,%esp
// This is the true point at which the
// current transaction commits.
static void
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b21:	89 c3                	mov    %eax,%ebx
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102b23:	85 c9                	test   %ecx,%ecx
write_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
80102b25:	89 48 5c             	mov    %ecx,0x5c(%eax)
  for (i = 0; i < log.lh.n; i++) {
80102b28:	7e 1f                	jle    80102b49 <write_head+0x49>
80102b2a:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102b31:	31 d2                	xor    %edx,%edx
80102b33:	90                   	nop
80102b34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    hb->block[i] = log.lh.block[i];
80102b38:	8b 8a ec 26 11 80    	mov    -0x7feed914(%edx),%ecx
80102b3e:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102b42:	83 c2 04             	add    $0x4,%edx
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *hb = (struct logheader *) (buf->data);
  int i;
  hb->n = log.lh.n;
  for (i = 0; i < log.lh.n; i++) {
80102b45:	39 c2                	cmp    %eax,%edx
80102b47:	75 ef                	jne    80102b38 <write_head+0x38>
    hb->block[i] = log.lh.block[i];
  }
  bwrite(buf);
80102b49:	83 ec 0c             	sub    $0xc,%esp
80102b4c:	53                   	push   %ebx
80102b4d:	e8 4e d6 ff ff       	call   801001a0 <bwrite>
  brelse(buf);
80102b52:	89 1c 24             	mov    %ebx,(%esp)
80102b55:	e8 86 d6 ff ff       	call   801001e0 <brelse>
}
80102b5a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b5d:	c9                   	leave  
80102b5e:	c3                   	ret    
80102b5f:	90                   	nop

80102b60 <initlog>:
static void recover_from_log(void);
static void commit();

void
initlog(int dev)
{
80102b60:	55                   	push   %ebp
80102b61:	89 e5                	mov    %esp,%ebp
80102b63:	53                   	push   %ebx
80102b64:	83 ec 2c             	sub    $0x2c,%esp
80102b67:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if (sizeof(struct logheader) >= BSIZE)
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
80102b6a:	68 dc 78 10 80       	push   $0x801078dc
80102b6f:	68 a0 26 11 80       	push   $0x801126a0
80102b74:	e8 f7 18 00 00       	call   80104470 <initlock>
  readsb(dev, &sb);
80102b79:	58                   	pop    %eax
80102b7a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b7d:	5a                   	pop    %edx
80102b7e:	50                   	push   %eax
80102b7f:	53                   	push   %ebx
80102b80:	e8 5b e8 ff ff       	call   801013e0 <readsb>
  log.start = sb.logstart;
  log.size = sb.nlog;
80102b85:	8b 55 e8             	mov    -0x18(%ebp),%edx
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102b88:	8b 45 ec             	mov    -0x14(%ebp),%eax

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b8b:	59                   	pop    %ecx
  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
80102b8c:	89 1d e4 26 11 80    	mov    %ebx,0x801126e4

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
80102b92:	89 15 d8 26 11 80    	mov    %edx,0x801126d8
    panic("initlog: too big logheader");

  struct superblock sb;
  initlock(&log.lock, "log");
  readsb(dev, &sb);
  log.start = sb.logstart;
80102b98:	a3 d4 26 11 80       	mov    %eax,0x801126d4

// Read the log header from disk into the in-memory log header
static void
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
80102b9d:	5a                   	pop    %edx
80102b9e:	50                   	push   %eax
80102b9f:	53                   	push   %ebx
80102ba0:	e8 2b d5 ff ff       	call   801000d0 <bread>
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102ba5:	8b 48 5c             	mov    0x5c(%eax),%ecx
  for (i = 0; i < log.lh.n; i++) {
80102ba8:	83 c4 10             	add    $0x10,%esp
80102bab:	85 c9                	test   %ecx,%ecx
read_head(void)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
80102bad:	89 0d e8 26 11 80    	mov    %ecx,0x801126e8
  for (i = 0; i < log.lh.n; i++) {
80102bb3:	7e 1c                	jle    80102bd1 <initlog+0x71>
80102bb5:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102bbc:	31 d2                	xor    %edx,%edx
80102bbe:	66 90                	xchg   %ax,%ax
    log.lh.block[i] = lh->block[i];
80102bc0:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102bc4:	83 c2 04             	add    $0x4,%edx
80102bc7:	89 8a e8 26 11 80    	mov    %ecx,-0x7feed918(%edx)
{
  struct buf *buf = bread(log.dev, log.start);
  struct logheader *lh = (struct logheader *) (buf->data);
  int i;
  log.lh.n = lh->n;
  for (i = 0; i < log.lh.n; i++) {
80102bcd:	39 da                	cmp    %ebx,%edx
80102bcf:	75 ef                	jne    80102bc0 <initlog+0x60>
    log.lh.block[i] = lh->block[i];
  }
  brelse(buf);
80102bd1:	83 ec 0c             	sub    $0xc,%esp
80102bd4:	50                   	push   %eax
80102bd5:	e8 06 d6 ff ff       	call   801001e0 <brelse>

static void
recover_from_log(void)
{
  read_head();
  install_trans(); // if committed, copy from log to disk
80102bda:	e8 81 fe ff ff       	call   80102a60 <install_trans>
  log.lh.n = 0;
80102bdf:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102be6:	00 00 00 
  write_head(); // clear the log
80102be9:	e8 12 ff ff ff       	call   80102b00 <write_head>
  readsb(dev, &sb);
  log.start = sb.logstart;
  log.size = sb.nlog;
  log.dev = dev;
  recover_from_log();
}
80102bee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102bf1:	c9                   	leave  
80102bf2:	c3                   	ret    
80102bf3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c00 <begin_op>:
}

// called at the start of each FS system call.
void
begin_op(void)
{
80102c00:	55                   	push   %ebp
80102c01:	89 e5                	mov    %esp,%ebp
80102c03:	83 ec 14             	sub    $0x14,%esp
  acquire(&log.lock);
80102c06:	68 a0 26 11 80       	push   $0x801126a0
80102c0b:	e8 80 18 00 00       	call   80104490 <acquire>
80102c10:	83 c4 10             	add    $0x10,%esp
80102c13:	eb 18                	jmp    80102c2d <begin_op+0x2d>
80102c15:	8d 76 00             	lea    0x0(%esi),%esi
  while(1){
    if(log.committing){
      sleep(&log, &log.lock);
80102c18:	83 ec 08             	sub    $0x8,%esp
80102c1b:	68 a0 26 11 80       	push   $0x801126a0
80102c20:	68 a0 26 11 80       	push   $0x801126a0
80102c25:	e8 66 12 00 00       	call   80103e90 <sleep>
80102c2a:	83 c4 10             	add    $0x10,%esp
void
begin_op(void)
{
  acquire(&log.lock);
  while(1){
    if(log.committing){
80102c2d:	a1 e0 26 11 80       	mov    0x801126e0,%eax
80102c32:	85 c0                	test   %eax,%eax
80102c34:	75 e2                	jne    80102c18 <begin_op+0x18>
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
80102c36:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102c3b:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102c41:	83 c0 01             	add    $0x1,%eax
80102c44:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102c47:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102c4a:	83 fa 1e             	cmp    $0x1e,%edx
80102c4d:	7f c9                	jg     80102c18 <begin_op+0x18>
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
      release(&log.lock);
80102c4f:	83 ec 0c             	sub    $0xc,%esp
      sleep(&log, &log.lock);
    } else if(log.lh.n + (log.outstanding+1)*MAXOPBLOCKS > LOGSIZE){
      // this op might exhaust log space; wait for commit.
      sleep(&log, &log.lock);
    } else {
      log.outstanding += 1;
80102c52:	a3 dc 26 11 80       	mov    %eax,0x801126dc
      release(&log.lock);
80102c57:	68 a0 26 11 80       	push   $0x801126a0
80102c5c:	e8 0f 1a 00 00       	call   80104670 <release>
      break;
    }
  }
}
80102c61:	83 c4 10             	add    $0x10,%esp
80102c64:	c9                   	leave  
80102c65:	c3                   	ret    
80102c66:	8d 76 00             	lea    0x0(%esi),%esi
80102c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c70 <end_op>:

// called at the end of each FS system call.
// commits if this was the last outstanding operation.
void
end_op(void)
{
80102c70:	55                   	push   %ebp
80102c71:	89 e5                	mov    %esp,%ebp
80102c73:	57                   	push   %edi
80102c74:	56                   	push   %esi
80102c75:	53                   	push   %ebx
80102c76:	83 ec 18             	sub    $0x18,%esp
  int do_commit = 0;

  acquire(&log.lock);
80102c79:	68 a0 26 11 80       	push   $0x801126a0
80102c7e:	e8 0d 18 00 00       	call   80104490 <acquire>
  log.outstanding -= 1;
80102c83:	a1 dc 26 11 80       	mov    0x801126dc,%eax
  if(log.committing)
80102c88:	8b 1d e0 26 11 80    	mov    0x801126e0,%ebx
80102c8e:	83 c4 10             	add    $0x10,%esp
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c91:	83 e8 01             	sub    $0x1,%eax
  if(log.committing)
80102c94:	85 db                	test   %ebx,%ebx
end_op(void)
{
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
80102c96:	a3 dc 26 11 80       	mov    %eax,0x801126dc
  if(log.committing)
80102c9b:	0f 85 23 01 00 00    	jne    80102dc4 <end_op+0x154>
    panic("log.committing");
  if(log.outstanding == 0){
80102ca1:	85 c0                	test   %eax,%eax
80102ca3:	0f 85 f7 00 00 00    	jne    80102da0 <end_op+0x130>
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102ca9:	83 ec 0c             	sub    $0xc,%esp
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
80102cac:	c7 05 e0 26 11 80 01 	movl   $0x1,0x801126e0
80102cb3:	00 00 00 
}

static void
commit()
{
  if (log.lh.n > 0) {
80102cb6:	31 db                	xor    %ebx,%ebx
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
  }
  release(&log.lock);
80102cb8:	68 a0 26 11 80       	push   $0x801126a0
80102cbd:	e8 ae 19 00 00       	call   80104670 <release>
}

static void
commit()
{
  if (log.lh.n > 0) {
80102cc2:	8b 0d e8 26 11 80    	mov    0x801126e8,%ecx
80102cc8:	83 c4 10             	add    $0x10,%esp
80102ccb:	85 c9                	test   %ecx,%ecx
80102ccd:	0f 8e 8a 00 00 00    	jle    80102d5d <end_op+0xed>
80102cd3:	90                   	nop
80102cd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
80102cd8:	a1 d4 26 11 80       	mov    0x801126d4,%eax
80102cdd:	83 ec 08             	sub    $0x8,%esp
80102ce0:	01 d8                	add    %ebx,%eax
80102ce2:	83 c0 01             	add    $0x1,%eax
80102ce5:	50                   	push   %eax
80102ce6:	ff 35 e4 26 11 80    	pushl  0x801126e4
80102cec:	e8 df d3 ff ff       	call   801000d0 <bread>
80102cf1:	89 c6                	mov    %eax,%esi
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102cf3:	58                   	pop    %eax
80102cf4:	5a                   	pop    %edx
80102cf5:	ff 34 9d ec 26 11 80 	pushl  -0x7feed914(,%ebx,4)
80102cfc:	ff 35 e4 26 11 80    	pushl  0x801126e4
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102d02:	83 c3 01             	add    $0x1,%ebx
    struct buf *to = bread(log.dev, log.start+tail+1); // log block
    struct buf *from = bread(log.dev, log.lh.block[tail]); // cache block
80102d05:	e8 c6 d3 ff ff       	call   801000d0 <bread>
80102d0a:	89 c7                	mov    %eax,%edi
    memmove(to->data, from->data, BSIZE);
80102d0c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102d0f:	83 c4 0c             	add    $0xc,%esp
80102d12:	68 00 02 00 00       	push   $0x200
80102d17:	50                   	push   %eax
80102d18:	8d 46 5c             	lea    0x5c(%esi),%eax
80102d1b:	50                   	push   %eax
80102d1c:	e8 4f 1a 00 00       	call   80104770 <memmove>
    bwrite(to);  // write the log
80102d21:	89 34 24             	mov    %esi,(%esp)
80102d24:	e8 77 d4 ff ff       	call   801001a0 <bwrite>
    brelse(from);
80102d29:	89 3c 24             	mov    %edi,(%esp)
80102d2c:	e8 af d4 ff ff       	call   801001e0 <brelse>
    brelse(to);
80102d31:	89 34 24             	mov    %esi,(%esp)
80102d34:	e8 a7 d4 ff ff       	call   801001e0 <brelse>
static void
write_log(void)
{
  int tail;

  for (tail = 0; tail < log.lh.n; tail++) {
80102d39:	83 c4 10             	add    $0x10,%esp
80102d3c:	3b 1d e8 26 11 80    	cmp    0x801126e8,%ebx
80102d42:	7c 94                	jl     80102cd8 <end_op+0x68>
static void
commit()
{
  if (log.lh.n > 0) {
    write_log();     // Write modified blocks from cache to log
    write_head();    // Write header to disk -- the real commit
80102d44:	e8 b7 fd ff ff       	call   80102b00 <write_head>
    install_trans(); // Now install writes to home locations
80102d49:	e8 12 fd ff ff       	call   80102a60 <install_trans>
    log.lh.n = 0;
80102d4e:	c7 05 e8 26 11 80 00 	movl   $0x0,0x801126e8
80102d55:	00 00 00 
    write_head();    // Erase the transaction from the log
80102d58:	e8 a3 fd ff ff       	call   80102b00 <write_head>

  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
80102d5d:	83 ec 0c             	sub    $0xc,%esp
80102d60:	68 a0 26 11 80       	push   $0x801126a0
80102d65:	e8 26 17 00 00       	call   80104490 <acquire>
    log.committing = 0;
    wakeup(&log);
80102d6a:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
  if(do_commit){
    // call commit w/o holding locks, since not allowed
    // to sleep with locks.
    commit();
    acquire(&log.lock);
    log.committing = 0;
80102d71:	c7 05 e0 26 11 80 00 	movl   $0x0,0x801126e0
80102d78:	00 00 00 
    wakeup(&log);
80102d7b:	e8 c0 12 00 00       	call   80104040 <wakeup>
    release(&log.lock);
80102d80:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102d87:	e8 e4 18 00 00       	call   80104670 <release>
80102d8c:	83 c4 10             	add    $0x10,%esp
  }
}
80102d8f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d92:	5b                   	pop    %ebx
80102d93:	5e                   	pop    %esi
80102d94:	5f                   	pop    %edi
80102d95:	5d                   	pop    %ebp
80102d96:	c3                   	ret    
80102d97:	89 f6                	mov    %esi,%esi
80102d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(log.outstanding == 0){
    do_commit = 1;
    log.committing = 1;
  } else {
    // begin_op() may be waiting for log space.
    wakeup(&log);
80102da0:	83 ec 0c             	sub    $0xc,%esp
80102da3:	68 a0 26 11 80       	push   $0x801126a0
80102da8:	e8 93 12 00 00       	call   80104040 <wakeup>
  }
  release(&log.lock);
80102dad:	c7 04 24 a0 26 11 80 	movl   $0x801126a0,(%esp)
80102db4:	e8 b7 18 00 00       	call   80104670 <release>
80102db9:	83 c4 10             	add    $0x10,%esp
    acquire(&log.lock);
    log.committing = 0;
    wakeup(&log);
    release(&log.lock);
  }
}
80102dbc:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102dbf:	5b                   	pop    %ebx
80102dc0:	5e                   	pop    %esi
80102dc1:	5f                   	pop    %edi
80102dc2:	5d                   	pop    %ebp
80102dc3:	c3                   	ret    
  int do_commit = 0;

  acquire(&log.lock);
  log.outstanding -= 1;
  if(log.committing)
    panic("log.committing");
80102dc4:	83 ec 0c             	sub    $0xc,%esp
80102dc7:	68 e0 78 10 80       	push   $0x801078e0
80102dcc:	e8 9f d5 ff ff       	call   80100370 <panic>
80102dd1:	eb 0d                	jmp    80102de0 <log_write>
80102dd3:	90                   	nop
80102dd4:	90                   	nop
80102dd5:	90                   	nop
80102dd6:	90                   	nop
80102dd7:	90                   	nop
80102dd8:	90                   	nop
80102dd9:	90                   	nop
80102dda:	90                   	nop
80102ddb:	90                   	nop
80102ddc:	90                   	nop
80102ddd:	90                   	nop
80102dde:	90                   	nop
80102ddf:	90                   	nop

80102de0 <log_write>:
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102de0:	55                   	push   %ebp
80102de1:	89 e5                	mov    %esp,%ebp
80102de3:	53                   	push   %ebx
80102de4:	83 ec 04             	sub    $0x4,%esp
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102de7:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
//   modify bp->data[]
//   log_write(bp)
//   brelse(bp)
void
log_write(struct buf *b)
{
80102ded:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
80102df0:	83 fa 1d             	cmp    $0x1d,%edx
80102df3:	0f 8f 97 00 00 00    	jg     80102e90 <log_write+0xb0>
80102df9:	a1 d8 26 11 80       	mov    0x801126d8,%eax
80102dfe:	83 e8 01             	sub    $0x1,%eax
80102e01:	39 c2                	cmp    %eax,%edx
80102e03:	0f 8d 87 00 00 00    	jge    80102e90 <log_write+0xb0>
    panic("too big a transaction");
  if (log.outstanding < 1)
80102e09:	a1 dc 26 11 80       	mov    0x801126dc,%eax
80102e0e:	85 c0                	test   %eax,%eax
80102e10:	0f 8e 87 00 00 00    	jle    80102e9d <log_write+0xbd>
    panic("log_write outside of trans");

  acquire(&log.lock);
80102e16:	83 ec 0c             	sub    $0xc,%esp
80102e19:	68 a0 26 11 80       	push   $0x801126a0
80102e1e:	e8 6d 16 00 00       	call   80104490 <acquire>
  for (i = 0; i < log.lh.n; i++) {
80102e23:	8b 15 e8 26 11 80    	mov    0x801126e8,%edx
80102e29:	83 c4 10             	add    $0x10,%esp
80102e2c:	83 fa 00             	cmp    $0x0,%edx
80102e2f:	7e 50                	jle    80102e81 <log_write+0xa1>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102e31:	8b 4b 08             	mov    0x8(%ebx),%ecx
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102e34:	31 c0                	xor    %eax,%eax
    if (log.lh.block[i] == b->blockno)   // log absorbtion
80102e36:	3b 0d ec 26 11 80    	cmp    0x801126ec,%ecx
80102e3c:	75 0b                	jne    80102e49 <log_write+0x69>
80102e3e:	eb 38                	jmp    80102e78 <log_write+0x98>
80102e40:	39 0c 85 ec 26 11 80 	cmp    %ecx,-0x7feed914(,%eax,4)
80102e47:	74 2f                	je     80102e78 <log_write+0x98>
    panic("too big a transaction");
  if (log.outstanding < 1)
    panic("log_write outside of trans");

  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
80102e49:	83 c0 01             	add    $0x1,%eax
80102e4c:	39 d0                	cmp    %edx,%eax
80102e4e:	75 f0                	jne    80102e40 <log_write+0x60>
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102e50:	89 0c 95 ec 26 11 80 	mov    %ecx,-0x7feed914(,%edx,4)
  if (i == log.lh.n)
    log.lh.n++;
80102e57:	83 c2 01             	add    $0x1,%edx
80102e5a:	89 15 e8 26 11 80    	mov    %edx,0x801126e8
  b->flags |= B_DIRTY; // prevent eviction
80102e60:	83 0b 04             	orl    $0x4,(%ebx)
  release(&log.lock);
80102e63:	c7 45 08 a0 26 11 80 	movl   $0x801126a0,0x8(%ebp)
}
80102e6a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102e6d:	c9                   	leave  
  }
  log.lh.block[i] = b->blockno;
  if (i == log.lh.n)
    log.lh.n++;
  b->flags |= B_DIRTY; // prevent eviction
  release(&log.lock);
80102e6e:	e9 fd 17 00 00       	jmp    80104670 <release>
80102e73:	90                   	nop
80102e74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  acquire(&log.lock);
  for (i = 0; i < log.lh.n; i++) {
    if (log.lh.block[i] == b->blockno)   // log absorbtion
      break;
  }
  log.lh.block[i] = b->blockno;
80102e78:	89 0c 85 ec 26 11 80 	mov    %ecx,-0x7feed914(,%eax,4)
80102e7f:	eb df                	jmp    80102e60 <log_write+0x80>
80102e81:	8b 43 08             	mov    0x8(%ebx),%eax
80102e84:	a3 ec 26 11 80       	mov    %eax,0x801126ec
  if (i == log.lh.n)
80102e89:	75 d5                	jne    80102e60 <log_write+0x80>
80102e8b:	eb ca                	jmp    80102e57 <log_write+0x77>
80102e8d:	8d 76 00             	lea    0x0(%esi),%esi
log_write(struct buf *b)
{
  int i;

  if (log.lh.n >= LOGSIZE || log.lh.n >= log.size - 1)
    panic("too big a transaction");
80102e90:	83 ec 0c             	sub    $0xc,%esp
80102e93:	68 ef 78 10 80       	push   $0x801078ef
80102e98:	e8 d3 d4 ff ff       	call   80100370 <panic>
  if (log.outstanding < 1)
    panic("log_write outside of trans");
80102e9d:	83 ec 0c             	sub    $0xc,%esp
80102ea0:	68 05 79 10 80       	push   $0x80107905
80102ea5:	e8 c6 d4 ff ff       	call   80100370 <panic>
80102eaa:	66 90                	xchg   %ax,%ax
80102eac:	66 90                	xchg   %ax,%ax
80102eae:	66 90                	xchg   %ax,%ax

80102eb0 <mpmain>:
}

// Common CPU setup code.
static void
mpmain(void)
{
80102eb0:	55                   	push   %ebp
80102eb1:	89 e5                	mov    %esp,%ebp
80102eb3:	83 ec 08             	sub    $0x8,%esp
  cprintf("cpu%d: starting\n", cpunum());
80102eb6:	e8 65 f8 ff ff       	call   80102720 <cpunum>
80102ebb:	83 ec 08             	sub    $0x8,%esp
80102ebe:	50                   	push   %eax
80102ebf:	68 20 79 10 80       	push   $0x80107920
80102ec4:	e8 97 d7 ff ff       	call   80100660 <cprintf>
  idtinit();       // load idt register
80102ec9:	e8 32 2d 00 00       	call   80105c00 <idtinit>
  xchg(&cpu->started, 1); // tell startothers() we're up
80102ece:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
80102ed5:	b8 01 00 00 00       	mov    $0x1,%eax
80102eda:	f0 87 82 a8 00 00 00 	lock xchg %eax,0xa8(%edx)
  scheduler();     // start running processes
80102ee1:	e8 ba 0c 00 00       	call   80103ba0 <scheduler>
80102ee6:	8d 76 00             	lea    0x0(%esi),%esi
80102ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102ef0 <mpenter>:
}

// Other CPUs jump here from entryother.S.
static void
mpenter(void)
{
80102ef0:	55                   	push   %ebp
80102ef1:	89 e5                	mov    %esp,%ebp
80102ef3:	83 ec 08             	sub    $0x8,%esp
  switchkvm();
80102ef6:	e8 65 3f 00 00       	call   80106e60 <switchkvm>
  seginit();
80102efb:	e8 80 3d 00 00       	call   80106c80 <seginit>
  lapicinit();
80102f00:	e8 1b f7 ff ff       	call   80102620 <lapicinit>
  mpmain();
80102f05:	e8 a6 ff ff ff       	call   80102eb0 <mpmain>
80102f0a:	66 90                	xchg   %ax,%ax
80102f0c:	66 90                	xchg   %ax,%ax
80102f0e:	66 90                	xchg   %ax,%ax

80102f10 <main>:
// Bootstrap processor starts running C code here.
// Allocate a real stack and switch to it, first
// doing some setup required for memory allocator to work.
int
main(void)
{
80102f10:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102f14:	83 e4 f0             	and    $0xfffffff0,%esp
80102f17:	ff 71 fc             	pushl  -0x4(%ecx)
80102f1a:	55                   	push   %ebp
80102f1b:	89 e5                	mov    %esp,%ebp
80102f1d:	53                   	push   %ebx
80102f1e:	51                   	push   %ecx
  kinit1(end, P2V(4*1024*1024)); // phys page allocator
80102f1f:	83 ec 08             	sub    $0x8,%esp
80102f22:	68 00 00 40 80       	push   $0x80400000
80102f27:	68 28 99 11 80       	push   $0x80119928
80102f2c:	e8 bf f4 ff ff       	call   801023f0 <kinit1>
  kvmalloc();      // kernel page table
80102f31:	e8 0a 3f 00 00       	call   80106e40 <kvmalloc>
  mpinit();        // detect other processors
80102f36:	e8 b5 01 00 00       	call   801030f0 <mpinit>
  lapicinit();     // interrupt controller
80102f3b:	e8 e0 f6 ff ff       	call   80102620 <lapicinit>
  seginit();       // segment descriptors
80102f40:	e8 3b 3d 00 00       	call   80106c80 <seginit>
  cprintf("\ncpu%d: starting xv6\n\n", cpunum());
80102f45:	e8 d6 f7 ff ff       	call   80102720 <cpunum>
80102f4a:	5a                   	pop    %edx
80102f4b:	59                   	pop    %ecx
80102f4c:	50                   	push   %eax
80102f4d:	68 31 79 10 80       	push   $0x80107931
80102f52:	e8 09 d7 ff ff       	call   80100660 <cprintf>
  picinit();       // another interrupt controller
80102f57:	e8 a4 03 00 00       	call   80103300 <picinit>
  ioapicinit();    // another interrupt controller
80102f5c:	e8 af f2 ff ff       	call   80102210 <ioapicinit>
  consoleinit();   // console hardware
80102f61:	e8 3a da ff ff       	call   801009a0 <consoleinit>
  uartinit();      // serial port
80102f66:	e8 e5 2f 00 00       	call   80105f50 <uartinit>
  pinit();         // process table
80102f6b:	e8 80 09 00 00       	call   801038f0 <pinit>
  tvinit();        // trap vectors
80102f70:	e8 eb 2b 00 00       	call   80105b60 <tvinit>
  binit();         // buffer cache
80102f75:	e8 c6 d0 ff ff       	call   80100040 <binit>
  fileinit();      // file table
80102f7a:	e8 01 de ff ff       	call   80100d80 <fileinit>
  ideinit();       // disk
80102f7f:	e8 5c f0 ff ff       	call   80101fe0 <ideinit>
  if(!ismp)
80102f84:	8b 1d 84 27 11 80    	mov    0x80112784,%ebx
80102f8a:	83 c4 10             	add    $0x10,%esp
80102f8d:	85 db                	test   %ebx,%ebx
80102f8f:	0f 84 ca 00 00 00    	je     8010305f <main+0x14f>

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102f95:	83 ec 04             	sub    $0x4,%esp

  for(c = cpus; c < cpus+ncpu; c++){
80102f98:	bb a0 27 11 80       	mov    $0x801127a0,%ebx

  // Write entry code to unused memory at 0x7000.
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);
80102f9d:	68 8a 00 00 00       	push   $0x8a
80102fa2:	68 8c a4 10 80       	push   $0x8010a48c
80102fa7:	68 00 70 00 80       	push   $0x80007000
80102fac:	e8 bf 17 00 00       	call   80104770 <memmove>

  for(c = cpus; c < cpus+ncpu; c++){
80102fb1:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80102fb8:	00 00 00 
80102fbb:	83 c4 10             	add    $0x10,%esp
80102fbe:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102fc3:	39 d8                	cmp    %ebx,%eax
80102fc5:	76 7c                	jbe    80103043 <main+0x133>
80102fc7:	89 f6                	mov    %esi,%esi
80102fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(c == cpus+cpunum())  // We've started already.
80102fd0:	e8 4b f7 ff ff       	call   80102720 <cpunum>
80102fd5:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80102fdb:	05 a0 27 11 80       	add    $0x801127a0,%eax
80102fe0:	39 c3                	cmp    %eax,%ebx
80102fe2:	74 46                	je     8010302a <main+0x11a>
      continue;

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
80102fe4:	e8 d7 f4 ff ff       	call   801024c0 <kalloc>
    *(void**)(code-4) = stack + KSTACKSIZE;
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);

    lapicstartap(c->apicid, V2P(code));
80102fe9:	83 ec 08             	sub    $0x8,%esp

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102fec:	05 00 10 00 00       	add    $0x1000,%eax
    *(void**)(code-8) = mpenter;
80102ff1:	c7 05 f8 6f 00 80 f0 	movl   $0x80102ef0,0x80006ff8
80102ff8:	2e 10 80 

    // Tell entryother.S what stack to use, where to enter, and what
    // pgdir to use. We cannot use kpgdir yet, because the AP processor
    // is running in low  memory, so we use entrypgdir for the APs too.
    stack = kalloc();
    *(void**)(code-4) = stack + KSTACKSIZE;
80102ffb:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
    *(void**)(code-8) = mpenter;
    *(int**)(code-12) = (void *) V2P(entrypgdir);
80103000:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80103007:	90 10 00 

    lapicstartap(c->apicid, V2P(code));
8010300a:	68 00 70 00 00       	push   $0x7000
8010300f:	0f b6 03             	movzbl (%ebx),%eax
80103012:	50                   	push   %eax
80103013:	e8 d8 f7 ff ff       	call   801027f0 <lapicstartap>
80103018:	83 c4 10             	add    $0x10,%esp
8010301b:	90                   	nop
8010301c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

    // wait for cpu to finish mpmain()
    while(c->started == 0)
80103020:	8b 83 a8 00 00 00    	mov    0xa8(%ebx),%eax
80103026:	85 c0                	test   %eax,%eax
80103028:	74 f6                	je     80103020 <main+0x110>
  // The linker has placed the image of entryother.S in
  // _binary_entryother_start.
  code = P2V(0x7000);
  memmove(code, _binary_entryother_start, (uint)_binary_entryother_size);

  for(c = cpus; c < cpus+ncpu; c++){
8010302a:	69 05 80 2d 11 80 bc 	imul   $0xbc,0x80112d80,%eax
80103031:	00 00 00 
80103034:	81 c3 bc 00 00 00    	add    $0xbc,%ebx
8010303a:	05 a0 27 11 80       	add    $0x801127a0,%eax
8010303f:	39 c3                	cmp    %eax,%ebx
80103041:	72 8d                	jb     80102fd0 <main+0xc0>
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
  startothers();   // start other processors
  kinit2(P2V(4*1024*1024), P2V(PHYSTOP)); // must come after startothers()
80103043:	83 ec 08             	sub    $0x8,%esp
80103046:	68 00 00 00 8e       	push   $0x8e000000
8010304b:	68 00 00 40 80       	push   $0x80400000
80103050:	e8 0b f4 ff ff       	call   80102460 <kinit2>
  userinit();      // first user process
80103055:	e8 b6 08 00 00       	call   80103910 <userinit>
  mpmain();        // finish this processor's setup
8010305a:	e8 51 fe ff ff       	call   80102eb0 <mpmain>
  tvinit();        // trap vectors
  binit();         // buffer cache
  fileinit();      // file table
  ideinit();       // disk
  if(!ismp)
    timerinit();   // uniprocessor timer
8010305f:	e8 5c 29 00 00       	call   801059c0 <timerinit>
80103064:	e9 2c ff ff ff       	jmp    80102f95 <main+0x85>
80103069:	66 90                	xchg   %ax,%ax
8010306b:	66 90                	xchg   %ax,%ax
8010306d:	66 90                	xchg   %ax,%ax
8010306f:	90                   	nop

80103070 <mpsearch1>:
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
80103070:	55                   	push   %ebp
80103071:	89 e5                	mov    %esp,%ebp
80103073:	57                   	push   %edi
80103074:	56                   	push   %esi
  uchar *e, *p, *addr;

  addr = P2V(a);
80103075:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
8010307b:	53                   	push   %ebx
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
8010307c:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
}

// Look for an MP structure in the len bytes at addr.
static struct mp*
mpsearch1(uint a, int len)
{
8010307f:	83 ec 0c             	sub    $0xc,%esp
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
80103082:	39 de                	cmp    %ebx,%esi
80103084:	73 48                	jae    801030ce <mpsearch1+0x5e>
80103086:	8d 76 00             	lea    0x0(%esi),%esi
80103089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
80103090:	83 ec 04             	sub    $0x4,%esp
80103093:	8d 7e 10             	lea    0x10(%esi),%edi
80103096:	6a 04                	push   $0x4
80103098:	68 48 79 10 80       	push   $0x80107948
8010309d:	56                   	push   %esi
8010309e:	e8 6d 16 00 00       	call   80104710 <memcmp>
801030a3:	83 c4 10             	add    $0x10,%esp
801030a6:	85 c0                	test   %eax,%eax
801030a8:	75 1e                	jne    801030c8 <mpsearch1+0x58>
801030aa:	8d 7e 10             	lea    0x10(%esi),%edi
801030ad:	89 f2                	mov    %esi,%edx
801030af:	31 c9                	xor    %ecx,%ecx
801030b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
    sum += addr[i];
801030b8:	0f b6 02             	movzbl (%edx),%eax
801030bb:	83 c2 01             	add    $0x1,%edx
801030be:	01 c1                	add    %eax,%ecx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801030c0:	39 fa                	cmp    %edi,%edx
801030c2:	75 f4                	jne    801030b8 <mpsearch1+0x48>
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
801030c4:	84 c9                	test   %cl,%cl
801030c6:	74 10                	je     801030d8 <mpsearch1+0x68>
{
  uchar *e, *p, *addr;

  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
801030c8:	39 fb                	cmp    %edi,%ebx
801030ca:	89 fe                	mov    %edi,%esi
801030cc:	77 c2                	ja     80103090 <mpsearch1+0x20>
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
}
801030ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
  addr = P2V(a);
  e = addr+len;
  for(p = addr; p < e; p += sizeof(struct mp))
    if(memcmp(p, "_MP_", 4) == 0 && sum(p, sizeof(struct mp)) == 0)
      return (struct mp*)p;
  return 0;
801030d1:	31 c0                	xor    %eax,%eax
}
801030d3:	5b                   	pop    %ebx
801030d4:	5e                   	pop    %esi
801030d5:	5f                   	pop    %edi
801030d6:	5d                   	pop    %ebp
801030d7:	c3                   	ret    
801030d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801030db:	89 f0                	mov    %esi,%eax
801030dd:	5b                   	pop    %ebx
801030de:	5e                   	pop    %esi
801030df:	5f                   	pop    %edi
801030e0:	5d                   	pop    %ebp
801030e1:	c3                   	ret    
801030e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801030e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801030f0 <mpinit>:
  return conf;
}

void
mpinit(void)
{
801030f0:	55                   	push   %ebp
801030f1:	89 e5                	mov    %esp,%ebp
801030f3:	57                   	push   %edi
801030f4:	56                   	push   %esi
801030f5:	53                   	push   %ebx
801030f6:	83 ec 1c             	sub    $0x1c,%esp
  uchar *bda;
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
801030f9:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103100:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103107:	c1 e0 08             	shl    $0x8,%eax
8010310a:	09 d0                	or     %edx,%eax
8010310c:	c1 e0 04             	shl    $0x4,%eax
8010310f:	85 c0                	test   %eax,%eax
80103111:	75 1b                	jne    8010312e <mpinit+0x3e>
    if((mp = mpsearch1(p, 1024)))
      return mp;
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
80103113:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010311a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103121:	c1 e0 08             	shl    $0x8,%eax
80103124:	09 d0                	or     %edx,%eax
80103126:	c1 e0 0a             	shl    $0xa,%eax
80103129:	2d 00 04 00 00       	sub    $0x400,%eax
  uint p;
  struct mp *mp;

  bda = (uchar *) P2V(0x400);
  if((p = ((bda[0x0F]<<8)| bda[0x0E]) << 4)){
    if((mp = mpsearch1(p, 1024)))
8010312e:	ba 00 04 00 00       	mov    $0x400,%edx
80103133:	e8 38 ff ff ff       	call   80103070 <mpsearch1>
80103138:	85 c0                	test   %eax,%eax
8010313a:	89 c6                	mov    %eax,%esi
8010313c:	0f 84 66 01 00 00    	je     801032a8 <mpinit+0x1b8>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
80103142:	8b 5e 04             	mov    0x4(%esi),%ebx
80103145:	85 db                	test   %ebx,%ebx
80103147:	0f 84 d6 00 00 00    	je     80103223 <mpinit+0x133>
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010314d:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
  if(memcmp(conf, "PCMP", 4) != 0)
80103153:	83 ec 04             	sub    $0x4,%esp
80103156:	6a 04                	push   $0x4
80103158:	68 4d 79 10 80       	push   $0x8010794d
8010315d:	50                   	push   %eax
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
    return 0;
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
8010315e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(memcmp(conf, "PCMP", 4) != 0)
80103161:	e8 aa 15 00 00       	call   80104710 <memcmp>
80103166:	83 c4 10             	add    $0x10,%esp
80103169:	85 c0                	test   %eax,%eax
8010316b:	0f 85 b2 00 00 00    	jne    80103223 <mpinit+0x133>
    return 0;
  if(conf->version != 1 && conf->version != 4)
80103171:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
80103178:	3c 01                	cmp    $0x1,%al
8010317a:	74 08                	je     80103184 <mpinit+0x94>
8010317c:	3c 04                	cmp    $0x4,%al
8010317e:	0f 85 9f 00 00 00    	jne    80103223 <mpinit+0x133>
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
80103184:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
8010318b:	85 ff                	test   %edi,%edi
8010318d:	74 1e                	je     801031ad <mpinit+0xbd>
8010318f:	31 d2                	xor    %edx,%edx
80103191:	31 c0                	xor    %eax,%eax
80103193:	90                   	nop
80103194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    sum += addr[i];
80103198:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
8010319f:	80 
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801031a0:	83 c0 01             	add    $0x1,%eax
    sum += addr[i];
801031a3:	01 ca                	add    %ecx,%edx
sum(uchar *addr, int len)
{
  int i, sum;

  sum = 0;
  for(i=0; i<len; i++)
801031a5:	39 c7                	cmp    %eax,%edi
801031a7:	75 ef                	jne    80103198 <mpinit+0xa8>
  conf = (struct mpconf*) P2V((uint) mp->physaddr);
  if(memcmp(conf, "PCMP", 4) != 0)
    return 0;
  if(conf->version != 1 && conf->version != 4)
    return 0;
  if(sum((uchar*)conf, conf->length) != 0)
801031a9:	84 d2                	test   %dl,%dl
801031ab:	75 76                	jne    80103223 <mpinit+0x133>
  struct mp *mp;
  struct mpconf *conf;
  struct mpproc *proc;
  struct mpioapic *ioapic;

  if((conf = mpconfig(&mp)) == 0)
801031ad:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801031b0:	85 ff                	test   %edi,%edi
801031b2:	74 6f                	je     80103223 <mpinit+0x133>
    return;
  ismp = 1;
801031b4:	c7 05 84 27 11 80 01 	movl   $0x1,0x80112784
801031bb:	00 00 00 
  lapic = (uint*)conf->lapicaddr;
801031be:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
801031c4:	a3 9c 26 11 80       	mov    %eax,0x8011269c
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801031c9:	0f b7 8b 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%ecx
801031d0:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
801031d6:	01 f9                	add    %edi,%ecx
801031d8:	39 c8                	cmp    %ecx,%eax
801031da:	0f 83 a0 00 00 00    	jae    80103280 <mpinit+0x190>
    switch(*p){
801031e0:	80 38 04             	cmpb   $0x4,(%eax)
801031e3:	0f 87 87 00 00 00    	ja     80103270 <mpinit+0x180>
801031e9:	0f b6 10             	movzbl (%eax),%edx
801031ec:	ff 24 95 54 79 10 80 	jmp    *-0x7fef86ac(,%edx,4)
801031f3:	90                   	nop
801031f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      p += sizeof(struct mpioapic);
      continue;
    case MPBUS:
    case MPIOINTR:
    case MPLINTR:
      p += 8;
801031f8:	83 c0 08             	add    $0x8,%eax

  if((conf = mpconfig(&mp)) == 0)
    return;
  ismp = 1;
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
801031fb:	39 c1                	cmp    %eax,%ecx
801031fd:	77 e1                	ja     801031e0 <mpinit+0xf0>
    default:
      ismp = 0;
      break;
    }
  }
  if(!ismp){
801031ff:	a1 84 27 11 80       	mov    0x80112784,%eax
80103204:	85 c0                	test   %eax,%eax
80103206:	75 78                	jne    80103280 <mpinit+0x190>
    // Didn't like what we found; fall back to no MP.
    ncpu = 1;
80103208:	c7 05 80 2d 11 80 01 	movl   $0x1,0x80112d80
8010320f:	00 00 00 
    lapic = 0;
80103212:	c7 05 9c 26 11 80 00 	movl   $0x0,0x8011269c
80103219:	00 00 00 
    ioapicid = 0;
8010321c:	c6 05 80 27 11 80 00 	movb   $0x0,0x80112780
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
80103223:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103226:	5b                   	pop    %ebx
80103227:	5e                   	pop    %esi
80103228:	5f                   	pop    %edi
80103229:	5d                   	pop    %ebp
8010322a:	c3                   	ret    
8010322b:	90                   	nop
8010322c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  lapic = (uint*)conf->lapicaddr;
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
80103230:	8b 15 80 2d 11 80    	mov    0x80112d80,%edx
80103236:	83 fa 07             	cmp    $0x7,%edx
80103239:	7f 19                	jg     80103254 <mpinit+0x164>
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
8010323b:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
8010323f:	69 fa bc 00 00 00    	imul   $0xbc,%edx,%edi
        ncpu++;
80103245:	83 c2 01             	add    $0x1,%edx
80103248:	89 15 80 2d 11 80    	mov    %edx,0x80112d80
  for(p=(uchar*)(conf+1), e=(uchar*)conf+conf->length; p<e; ){
    switch(*p){
    case MPPROC:
      proc = (struct mpproc*)p;
      if(ncpu < NCPU) {
        cpus[ncpu].apicid = proc->apicid;  // apicid may differ from ncpu
8010324e:	88 9f a0 27 11 80    	mov    %bl,-0x7feed860(%edi)
        ncpu++;
      }
      p += sizeof(struct mpproc);
80103254:	83 c0 14             	add    $0x14,%eax
      continue;
80103257:	eb a2                	jmp    801031fb <mpinit+0x10b>
80103259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103260:	0f b6 50 01          	movzbl 0x1(%eax),%edx
      p += sizeof(struct mpioapic);
80103264:	83 c0 08             	add    $0x8,%eax
      }
      p += sizeof(struct mpproc);
      continue;
    case MPIOAPIC:
      ioapic = (struct mpioapic*)p;
      ioapicid = ioapic->apicno;
80103267:	88 15 80 27 11 80    	mov    %dl,0x80112780
      p += sizeof(struct mpioapic);
      continue;
8010326d:	eb 8c                	jmp    801031fb <mpinit+0x10b>
8010326f:	90                   	nop
    case MPIOINTR:
    case MPLINTR:
      p += 8;
      continue;
    default:
      ismp = 0;
80103270:	c7 05 84 27 11 80 00 	movl   $0x0,0x80112784
80103277:	00 00 00 
      break;
8010327a:	e9 7c ff ff ff       	jmp    801031fb <mpinit+0x10b>
8010327f:	90                   	nop
    lapic = 0;
    ioapicid = 0;
    return;
  }

  if(mp->imcrp){
80103280:	80 7e 0c 00          	cmpb   $0x0,0xc(%esi)
80103284:	74 9d                	je     80103223 <mpinit+0x133>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103286:	ba 22 00 00 00       	mov    $0x22,%edx
8010328b:	b8 70 00 00 00       	mov    $0x70,%eax
80103290:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80103291:	ba 23 00 00 00       	mov    $0x23,%edx
80103296:	ec                   	in     (%dx),%al
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80103297:	83 c8 01             	or     $0x1,%eax
8010329a:	ee                   	out    %al,(%dx)
    // Bochs doesn't support IMCR, so this doesn't run on Bochs.
    // But it would on real hardware.
    outb(0x22, 0x70);   // Select IMCR
    outb(0x23, inb(0x23) | 1);  // Mask external interrupts.
  }
}
8010329b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010329e:	5b                   	pop    %ebx
8010329f:	5e                   	pop    %esi
801032a0:	5f                   	pop    %edi
801032a1:	5d                   	pop    %ebp
801032a2:	c3                   	ret    
801032a3:	90                   	nop
801032a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801032a8:	ba 00 00 01 00       	mov    $0x10000,%edx
801032ad:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801032b2:	e8 b9 fd ff ff       	call   80103070 <mpsearch1>
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801032b7:	85 c0                	test   %eax,%eax
  } else {
    p = ((bda[0x14]<<8)|bda[0x13])*1024;
    if((mp = mpsearch1(p-1024, 1024)))
      return mp;
  }
  return mpsearch1(0xF0000, 0x10000);
801032b9:	89 c6                	mov    %eax,%esi
mpconfig(struct mp **pmp)
{
  struct mpconf *conf;
  struct mp *mp;

  if((mp = mpsearch()) == 0 || mp->physaddr == 0)
801032bb:	0f 85 81 fe ff ff    	jne    80103142 <mpinit+0x52>
801032c1:	e9 5d ff ff ff       	jmp    80103223 <mpinit+0x133>
801032c6:	66 90                	xchg   %ax,%ax
801032c8:	66 90                	xchg   %ax,%ax
801032ca:	66 90                	xchg   %ax,%ax
801032cc:	66 90                	xchg   %ax,%ax
801032ce:	66 90                	xchg   %ax,%ax

801032d0 <picenable>:
  outb(IO_PIC2+1, mask >> 8);
}

void
picenable(int irq)
{
801032d0:	55                   	push   %ebp
  picsetmask(irqmask & ~(1<<irq));
801032d1:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
801032d6:	ba 21 00 00 00       	mov    $0x21,%edx
  outb(IO_PIC2+1, mask >> 8);
}

void
picenable(int irq)
{
801032db:	89 e5                	mov    %esp,%ebp
  picsetmask(irqmask & ~(1<<irq));
801032dd:	8b 4d 08             	mov    0x8(%ebp),%ecx
801032e0:	d3 c0                	rol    %cl,%eax
801032e2:	66 23 05 00 a0 10 80 	and    0x8010a000,%ax
static ushort irqmask = 0xFFFF & ~(1<<IRQ_SLAVE);

static void
picsetmask(ushort mask)
{
  irqmask = mask;
801032e9:	66 a3 00 a0 10 80    	mov    %ax,0x8010a000
801032ef:	ee                   	out    %al,(%dx)
801032f0:	ba a1 00 00 00       	mov    $0xa1,%edx
801032f5:	66 c1 e8 08          	shr    $0x8,%ax
801032f9:	ee                   	out    %al,(%dx)

void
picenable(int irq)
{
  picsetmask(irqmask & ~(1<<irq));
}
801032fa:	5d                   	pop    %ebp
801032fb:	c3                   	ret    
801032fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103300 <picinit>:

// Initialize the 8259A interrupt controllers.
void
picinit(void)
{
80103300:	55                   	push   %ebp
80103301:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103306:	89 e5                	mov    %esp,%ebp
80103308:	57                   	push   %edi
80103309:	56                   	push   %esi
8010330a:	53                   	push   %ebx
8010330b:	bb 21 00 00 00       	mov    $0x21,%ebx
80103310:	89 da                	mov    %ebx,%edx
80103312:	ee                   	out    %al,(%dx)
80103313:	b9 a1 00 00 00       	mov    $0xa1,%ecx
80103318:	89 ca                	mov    %ecx,%edx
8010331a:	ee                   	out    %al,(%dx)
8010331b:	bf 11 00 00 00       	mov    $0x11,%edi
80103320:	be 20 00 00 00       	mov    $0x20,%esi
80103325:	89 f8                	mov    %edi,%eax
80103327:	89 f2                	mov    %esi,%edx
80103329:	ee                   	out    %al,(%dx)
8010332a:	b8 20 00 00 00       	mov    $0x20,%eax
8010332f:	89 da                	mov    %ebx,%edx
80103331:	ee                   	out    %al,(%dx)
80103332:	b8 04 00 00 00       	mov    $0x4,%eax
80103337:	ee                   	out    %al,(%dx)
80103338:	b8 03 00 00 00       	mov    $0x3,%eax
8010333d:	ee                   	out    %al,(%dx)
8010333e:	bb a0 00 00 00       	mov    $0xa0,%ebx
80103343:	89 f8                	mov    %edi,%eax
80103345:	89 da                	mov    %ebx,%edx
80103347:	ee                   	out    %al,(%dx)
80103348:	b8 28 00 00 00       	mov    $0x28,%eax
8010334d:	89 ca                	mov    %ecx,%edx
8010334f:	ee                   	out    %al,(%dx)
80103350:	b8 02 00 00 00       	mov    $0x2,%eax
80103355:	ee                   	out    %al,(%dx)
80103356:	b8 03 00 00 00       	mov    $0x3,%eax
8010335b:	ee                   	out    %al,(%dx)
8010335c:	bf 68 00 00 00       	mov    $0x68,%edi
80103361:	89 f2                	mov    %esi,%edx
80103363:	89 f8                	mov    %edi,%eax
80103365:	ee                   	out    %al,(%dx)
80103366:	b9 0a 00 00 00       	mov    $0xa,%ecx
8010336b:	89 c8                	mov    %ecx,%eax
8010336d:	ee                   	out    %al,(%dx)
8010336e:	89 f8                	mov    %edi,%eax
80103370:	89 da                	mov    %ebx,%edx
80103372:	ee                   	out    %al,(%dx)
80103373:	89 c8                	mov    %ecx,%eax
80103375:	ee                   	out    %al,(%dx)
  outb(IO_PIC1, 0x0a);             // read IRR by default

  outb(IO_PIC2, 0x68);             // OCW3
  outb(IO_PIC2, 0x0a);             // OCW3

  if(irqmask != 0xFFFF)
80103376:	0f b7 05 00 a0 10 80 	movzwl 0x8010a000,%eax
8010337d:	66 83 f8 ff          	cmp    $0xffff,%ax
80103381:	74 10                	je     80103393 <picinit+0x93>
80103383:	ba 21 00 00 00       	mov    $0x21,%edx
80103388:	ee                   	out    %al,(%dx)
80103389:	ba a1 00 00 00       	mov    $0xa1,%edx
8010338e:	66 c1 e8 08          	shr    $0x8,%ax
80103392:	ee                   	out    %al,(%dx)
    picsetmask(irqmask);
}
80103393:	5b                   	pop    %ebx
80103394:	5e                   	pop    %esi
80103395:	5f                   	pop    %edi
80103396:	5d                   	pop    %ebp
80103397:	c3                   	ret    
80103398:	66 90                	xchg   %ax,%ax
8010339a:	66 90                	xchg   %ax,%ax
8010339c:	66 90                	xchg   %ax,%ax
8010339e:	66 90                	xchg   %ax,%ax

801033a0 <pipealloc>:
  int writeopen;  // write fd is still open
};

int
pipealloc(struct file **f0, struct file **f1)
{
801033a0:	55                   	push   %ebp
801033a1:	89 e5                	mov    %esp,%ebp
801033a3:	57                   	push   %edi
801033a4:	56                   	push   %esi
801033a5:	53                   	push   %ebx
801033a6:	83 ec 0c             	sub    $0xc,%esp
801033a9:	8b 75 08             	mov    0x8(%ebp),%esi
801033ac:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  struct pipe *p;

  p = 0;
  *f0 = *f1 = 0;
801033af:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801033b5:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
801033bb:	e8 e0 d9 ff ff       	call   80100da0 <filealloc>
801033c0:	85 c0                	test   %eax,%eax
801033c2:	89 06                	mov    %eax,(%esi)
801033c4:	0f 84 a8 00 00 00    	je     80103472 <pipealloc+0xd2>
801033ca:	e8 d1 d9 ff ff       	call   80100da0 <filealloc>
801033cf:	85 c0                	test   %eax,%eax
801033d1:	89 03                	mov    %eax,(%ebx)
801033d3:	0f 84 87 00 00 00    	je     80103460 <pipealloc+0xc0>
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
801033d9:	e8 e2 f0 ff ff       	call   801024c0 <kalloc>
801033de:	85 c0                	test   %eax,%eax
801033e0:	89 c7                	mov    %eax,%edi
801033e2:	0f 84 b0 00 00 00    	je     80103498 <pipealloc+0xf8>
    goto bad;
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
801033e8:	83 ec 08             	sub    $0x8,%esp
  *f0 = *f1 = 0;
  if((*f0 = filealloc()) == 0 || (*f1 = filealloc()) == 0)
    goto bad;
  if((p = (struct pipe*)kalloc()) == 0)
    goto bad;
  p->readopen = 1;
801033eb:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801033f2:	00 00 00 
  p->writeopen = 1;
801033f5:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
801033fc:	00 00 00 
  p->nwrite = 0;
801033ff:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103406:	00 00 00 
  p->nread = 0;
80103409:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103410:	00 00 00 
  initlock(&p->lock, "pipe");
80103413:	68 68 79 10 80       	push   $0x80107968
80103418:	50                   	push   %eax
80103419:	e8 52 10 00 00       	call   80104470 <initlock>
  (*f0)->type = FD_PIPE;
8010341e:	8b 06                	mov    (%esi),%eax
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103420:	83 c4 10             	add    $0x10,%esp
  p->readopen = 1;
  p->writeopen = 1;
  p->nwrite = 0;
  p->nread = 0;
  initlock(&p->lock, "pipe");
  (*f0)->type = FD_PIPE;
80103423:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f0)->readable = 1;
80103429:	8b 06                	mov    (%esi),%eax
8010342b:	c6 40 08 01          	movb   $0x1,0x8(%eax)
  (*f0)->writable = 0;
8010342f:	8b 06                	mov    (%esi),%eax
80103431:	c6 40 09 00          	movb   $0x0,0x9(%eax)
  (*f0)->pipe = p;
80103435:	8b 06                	mov    (%esi),%eax
80103437:	89 78 0c             	mov    %edi,0xc(%eax)
  (*f1)->type = FD_PIPE;
8010343a:	8b 03                	mov    (%ebx),%eax
8010343c:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  (*f1)->readable = 0;
80103442:	8b 03                	mov    (%ebx),%eax
80103444:	c6 40 08 00          	movb   $0x0,0x8(%eax)
  (*f1)->writable = 1;
80103448:	8b 03                	mov    (%ebx),%eax
8010344a:	c6 40 09 01          	movb   $0x1,0x9(%eax)
  (*f1)->pipe = p;
8010344e:	8b 03                	mov    (%ebx),%eax
80103450:	89 78 0c             	mov    %edi,0xc(%eax)
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103453:	8d 65 f4             	lea    -0xc(%ebp),%esp
  (*f0)->pipe = p;
  (*f1)->type = FD_PIPE;
  (*f1)->readable = 0;
  (*f1)->writable = 1;
  (*f1)->pipe = p;
  return 0;
80103456:	31 c0                	xor    %eax,%eax
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
}
80103458:	5b                   	pop    %ebx
80103459:	5e                   	pop    %esi
8010345a:	5f                   	pop    %edi
8010345b:	5d                   	pop    %ebp
8010345c:	c3                   	ret    
8010345d:	8d 76 00             	lea    0x0(%esi),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80103460:	8b 06                	mov    (%esi),%eax
80103462:	85 c0                	test   %eax,%eax
80103464:	74 1e                	je     80103484 <pipealloc+0xe4>
    fileclose(*f0);
80103466:	83 ec 0c             	sub    $0xc,%esp
80103469:	50                   	push   %eax
8010346a:	e8 f1 d9 ff ff       	call   80100e60 <fileclose>
8010346f:	83 c4 10             	add    $0x10,%esp
  if(*f1)
80103472:	8b 03                	mov    (%ebx),%eax
80103474:	85 c0                	test   %eax,%eax
80103476:	74 0c                	je     80103484 <pipealloc+0xe4>
    fileclose(*f1);
80103478:	83 ec 0c             	sub    $0xc,%esp
8010347b:	50                   	push   %eax
8010347c:	e8 df d9 ff ff       	call   80100e60 <fileclose>
80103481:	83 c4 10             	add    $0x10,%esp
  return -1;
}
80103484:	8d 65 f4             	lea    -0xc(%ebp),%esp
    kfree((char*)p);
  if(*f0)
    fileclose(*f0);
  if(*f1)
    fileclose(*f1);
  return -1;
80103487:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010348c:	5b                   	pop    %ebx
8010348d:	5e                   	pop    %esi
8010348e:	5f                   	pop    %edi
8010348f:	5d                   	pop    %ebp
80103490:	c3                   	ret    
80103491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

//PAGEBREAK: 20
 bad:
  if(p)
    kfree((char*)p);
  if(*f0)
80103498:	8b 06                	mov    (%esi),%eax
8010349a:	85 c0                	test   %eax,%eax
8010349c:	75 c8                	jne    80103466 <pipealloc+0xc6>
8010349e:	eb d2                	jmp    80103472 <pipealloc+0xd2>

801034a0 <pipeclose>:
  return -1;
}

void
pipeclose(struct pipe *p, int writable)
{
801034a0:	55                   	push   %ebp
801034a1:	89 e5                	mov    %esp,%ebp
801034a3:	56                   	push   %esi
801034a4:	53                   	push   %ebx
801034a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801034a8:	8b 75 0c             	mov    0xc(%ebp),%esi
  acquire(&p->lock);
801034ab:	83 ec 0c             	sub    $0xc,%esp
801034ae:	53                   	push   %ebx
801034af:	e8 dc 0f 00 00       	call   80104490 <acquire>
  if(writable){
801034b4:	83 c4 10             	add    $0x10,%esp
801034b7:	85 f6                	test   %esi,%esi
801034b9:	74 45                	je     80103500 <pipeclose+0x60>
    p->writeopen = 0;
    wakeup(&p->nread);
801034bb:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801034c1:	83 ec 0c             	sub    $0xc,%esp
void
pipeclose(struct pipe *p, int writable)
{
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
801034c4:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
801034cb:	00 00 00 
    wakeup(&p->nread);
801034ce:	50                   	push   %eax
801034cf:	e8 6c 0b 00 00       	call   80104040 <wakeup>
801034d4:	83 c4 10             	add    $0x10,%esp
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
801034d7:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801034dd:	85 d2                	test   %edx,%edx
801034df:	75 0a                	jne    801034eb <pipeclose+0x4b>
801034e1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801034e7:	85 c0                	test   %eax,%eax
801034e9:	74 35                	je     80103520 <pipeclose+0x80>
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801034eb:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
801034ee:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034f1:	5b                   	pop    %ebx
801034f2:	5e                   	pop    %esi
801034f3:	5d                   	pop    %ebp
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
  } else
    release(&p->lock);
801034f4:	e9 77 11 00 00       	jmp    80104670 <release>
801034f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
    wakeup(&p->nwrite);
80103500:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103506:	83 ec 0c             	sub    $0xc,%esp
  acquire(&p->lock);
  if(writable){
    p->writeopen = 0;
    wakeup(&p->nread);
  } else {
    p->readopen = 0;
80103509:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
80103510:	00 00 00 
    wakeup(&p->nwrite);
80103513:	50                   	push   %eax
80103514:	e8 27 0b 00 00       	call   80104040 <wakeup>
80103519:	83 c4 10             	add    $0x10,%esp
8010351c:	eb b9                	jmp    801034d7 <pipeclose+0x37>
8010351e:	66 90                	xchg   %ax,%ax
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
80103520:	83 ec 0c             	sub    $0xc,%esp
80103523:	53                   	push   %ebx
80103524:	e8 47 11 00 00       	call   80104670 <release>
    kfree((char*)p);
80103529:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010352c:	83 c4 10             	add    $0x10,%esp
  } else
    release(&p->lock);
}
8010352f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103532:	5b                   	pop    %ebx
80103533:	5e                   	pop    %esi
80103534:	5d                   	pop    %ebp
    p->readopen = 0;
    wakeup(&p->nwrite);
  }
  if(p->readopen == 0 && p->writeopen == 0){
    release(&p->lock);
    kfree((char*)p);
80103535:	e9 d6 ed ff ff       	jmp    80102310 <kfree>
8010353a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103540 <pipewrite>:
}

//PAGEBREAK: 40
int
pipewrite(struct pipe *p, char *addr, int n)
{
80103540:	55                   	push   %ebp
80103541:	89 e5                	mov    %esp,%ebp
80103543:	57                   	push   %edi
80103544:	56                   	push   %esi
80103545:	53                   	push   %ebx
80103546:	83 ec 28             	sub    $0x28,%esp
80103549:	8b 7d 08             	mov    0x8(%ebp),%edi
  int i;

  acquire(&p->lock);
8010354c:	57                   	push   %edi
8010354d:	e8 3e 0f 00 00       	call   80104490 <acquire>
  for(i = 0; i < n; i++){
80103552:	8b 45 10             	mov    0x10(%ebp),%eax
80103555:	83 c4 10             	add    $0x10,%esp
80103558:	85 c0                	test   %eax,%eax
8010355a:	0f 8e c6 00 00 00    	jle    80103626 <pipewrite+0xe6>
80103560:	8b 45 0c             	mov    0xc(%ebp),%eax
80103563:	8b 8f 38 02 00 00    	mov    0x238(%edi),%ecx
80103569:	8d b7 34 02 00 00    	lea    0x234(%edi),%esi
8010356f:	8d 9f 38 02 00 00    	lea    0x238(%edi),%ebx
80103575:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103578:	03 45 10             	add    0x10(%ebp),%eax
8010357b:	89 45 e0             	mov    %eax,-0x20(%ebp)
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
8010357e:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
80103584:	8d 90 00 02 00 00    	lea    0x200(%eax),%edx
8010358a:	39 d1                	cmp    %edx,%ecx
8010358c:	0f 85 cf 00 00 00    	jne    80103661 <pipewrite+0x121>
      if(p->readopen == 0 || proc->killed){
80103592:	8b 97 3c 02 00 00    	mov    0x23c(%edi),%edx
80103598:	85 d2                	test   %edx,%edx
8010359a:	0f 84 a8 00 00 00    	je     80103648 <pipewrite+0x108>
801035a0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801035a7:	8b 42 24             	mov    0x24(%edx),%eax
801035aa:	85 c0                	test   %eax,%eax
801035ac:	74 25                	je     801035d3 <pipewrite+0x93>
801035ae:	e9 95 00 00 00       	jmp    80103648 <pipewrite+0x108>
801035b3:	90                   	nop
801035b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035b8:	8b 87 3c 02 00 00    	mov    0x23c(%edi),%eax
801035be:	85 c0                	test   %eax,%eax
801035c0:	0f 84 82 00 00 00    	je     80103648 <pipewrite+0x108>
801035c6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801035cc:	8b 40 24             	mov    0x24(%eax),%eax
801035cf:	85 c0                	test   %eax,%eax
801035d1:	75 75                	jne    80103648 <pipewrite+0x108>
        release(&p->lock);
        return -1;
      }
      wakeup(&p->nread);
801035d3:	83 ec 0c             	sub    $0xc,%esp
801035d6:	56                   	push   %esi
801035d7:	e8 64 0a 00 00       	call   80104040 <wakeup>
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
801035dc:	59                   	pop    %ecx
801035dd:	58                   	pop    %eax
801035de:	57                   	push   %edi
801035df:	53                   	push   %ebx
801035e0:	e8 ab 08 00 00       	call   80103e90 <sleep>
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
801035e5:	8b 87 34 02 00 00    	mov    0x234(%edi),%eax
801035eb:	8b 97 38 02 00 00    	mov    0x238(%edi),%edx
801035f1:	83 c4 10             	add    $0x10,%esp
801035f4:	05 00 02 00 00       	add    $0x200,%eax
801035f9:	39 c2                	cmp    %eax,%edx
801035fb:	74 bb                	je     801035b8 <pipewrite+0x78>
        return -1;
      }
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
801035fd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103600:	8d 4a 01             	lea    0x1(%edx),%ecx
80103603:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
80103607:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010360d:	89 8f 38 02 00 00    	mov    %ecx,0x238(%edi)
80103613:	0f b6 00             	movzbl (%eax),%eax
80103616:	88 44 17 34          	mov    %al,0x34(%edi,%edx,1)
8010361a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
pipewrite(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
8010361d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
80103620:	0f 85 58 ff ff ff    	jne    8010357e <pipewrite+0x3e>
      wakeup(&p->nread);
      sleep(&p->nwrite, &p->lock);  //DOC: pipewrite-sleep
    }
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
80103626:	8d 97 34 02 00 00    	lea    0x234(%edi),%edx
8010362c:	83 ec 0c             	sub    $0xc,%esp
8010362f:	52                   	push   %edx
80103630:	e8 0b 0a 00 00       	call   80104040 <wakeup>
  release(&p->lock);
80103635:	89 3c 24             	mov    %edi,(%esp)
80103638:	e8 33 10 00 00       	call   80104670 <release>
  return n;
8010363d:	83 c4 10             	add    $0x10,%esp
80103640:	8b 45 10             	mov    0x10(%ebp),%eax
80103643:	eb 14                	jmp    80103659 <pipewrite+0x119>
80103645:	8d 76 00             	lea    0x0(%esi),%esi

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
      if(p->readopen == 0 || proc->killed){
        release(&p->lock);
80103648:	83 ec 0c             	sub    $0xc,%esp
8010364b:	57                   	push   %edi
8010364c:	e8 1f 10 00 00       	call   80104670 <release>
        return -1;
80103651:	83 c4 10             	add    $0x10,%esp
80103654:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    p->data[p->nwrite++ % PIPESIZE] = addr[i];
  }
  wakeup(&p->nread);  //DOC: pipewrite-wakeup1
  release(&p->lock);
  return n;
}
80103659:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010365c:	5b                   	pop    %ebx
8010365d:	5e                   	pop    %esi
8010365e:	5f                   	pop    %edi
8010365f:	5d                   	pop    %ebp
80103660:	c3                   	ret    
{
  int i;

  acquire(&p->lock);
  for(i = 0; i < n; i++){
    while(p->nwrite == p->nread + PIPESIZE){  //DOC: pipewrite-full
80103661:	89 ca                	mov    %ecx,%edx
80103663:	eb 98                	jmp    801035fd <pipewrite+0xbd>
80103665:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103670 <piperead>:
  return n;
}

int
piperead(struct pipe *p, char *addr, int n)
{
80103670:	55                   	push   %ebp
80103671:	89 e5                	mov    %esp,%ebp
80103673:	57                   	push   %edi
80103674:	56                   	push   %esi
80103675:	53                   	push   %ebx
80103676:	83 ec 18             	sub    $0x18,%esp
80103679:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010367c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;

  acquire(&p->lock);
8010367f:	53                   	push   %ebx
80103680:	e8 0b 0e 00 00       	call   80104490 <acquire>
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
80103685:	83 c4 10             	add    $0x10,%esp
80103688:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010368e:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
80103694:	75 6a                	jne    80103700 <piperead+0x90>
80103696:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
8010369c:	85 f6                	test   %esi,%esi
8010369e:	0f 84 cc 00 00 00    	je     80103770 <piperead+0x100>
801036a4:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
801036aa:	eb 2d                	jmp    801036d9 <piperead+0x69>
801036ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
801036b0:	83 ec 08             	sub    $0x8,%esp
801036b3:	53                   	push   %ebx
801036b4:	56                   	push   %esi
801036b5:	e8 d6 07 00 00       	call   80103e90 <sleep>
piperead(struct pipe *p, char *addr, int n)
{
  int i;

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
801036ba:	83 c4 10             	add    $0x10,%esp
801036bd:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801036c3:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
801036c9:	75 35                	jne    80103700 <piperead+0x90>
801036cb:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
801036d1:	85 d2                	test   %edx,%edx
801036d3:	0f 84 97 00 00 00    	je     80103770 <piperead+0x100>
    if(proc->killed){
801036d9:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801036e0:	8b 4a 24             	mov    0x24(%edx),%ecx
801036e3:	85 c9                	test   %ecx,%ecx
801036e5:	74 c9                	je     801036b0 <piperead+0x40>
      release(&p->lock);
801036e7:	83 ec 0c             	sub    $0xc,%esp
801036ea:	53                   	push   %ebx
801036eb:	e8 80 0f 00 00       	call   80104670 <release>
      return -1;
801036f0:	83 c4 10             	add    $0x10,%esp
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801036f3:	8d 65 f4             	lea    -0xc(%ebp),%esp

  acquire(&p->lock);
  while(p->nread == p->nwrite && p->writeopen){  //DOC: pipe-empty
    if(proc->killed){
      release(&p->lock);
      return -1;
801036f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
  release(&p->lock);
  return i;
}
801036fb:	5b                   	pop    %ebx
801036fc:	5e                   	pop    %esi
801036fd:	5f                   	pop    %edi
801036fe:	5d                   	pop    %ebp
801036ff:	c3                   	ret    
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103700:	8b 45 10             	mov    0x10(%ebp),%eax
80103703:	85 c0                	test   %eax,%eax
80103705:	7e 69                	jle    80103770 <piperead+0x100>
    if(p->nread == p->nwrite)
80103707:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010370d:	31 c9                	xor    %ecx,%ecx
8010370f:	eb 15                	jmp    80103726 <piperead+0xb6>
80103711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103718:	8b 93 34 02 00 00    	mov    0x234(%ebx),%edx
8010371e:	3b 93 38 02 00 00    	cmp    0x238(%ebx),%edx
80103724:	74 5a                	je     80103780 <piperead+0x110>
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
80103726:	8d 72 01             	lea    0x1(%edx),%esi
80103729:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
8010372f:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103735:	0f b6 54 13 34       	movzbl 0x34(%ebx,%edx,1),%edx
8010373a:	88 14 0f             	mov    %dl,(%edi,%ecx,1)
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
8010373d:	83 c1 01             	add    $0x1,%ecx
80103740:	39 4d 10             	cmp    %ecx,0x10(%ebp)
80103743:	75 d3                	jne    80103718 <piperead+0xa8>
    if(p->nread == p->nwrite)
      break;
    addr[i] = p->data[p->nread++ % PIPESIZE];
  }
  wakeup(&p->nwrite);  //DOC: piperead-wakeup
80103745:	8d 93 38 02 00 00    	lea    0x238(%ebx),%edx
8010374b:	83 ec 0c             	sub    $0xc,%esp
8010374e:	52                   	push   %edx
8010374f:	e8 ec 08 00 00       	call   80104040 <wakeup>
  release(&p->lock);
80103754:	89 1c 24             	mov    %ebx,(%esp)
80103757:	e8 14 0f 00 00       	call   80104670 <release>
  return i;
8010375c:	8b 45 10             	mov    0x10(%ebp),%eax
8010375f:	83 c4 10             	add    $0x10,%esp
}
80103762:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103765:	5b                   	pop    %ebx
80103766:	5e                   	pop    %esi
80103767:	5f                   	pop    %edi
80103768:	5d                   	pop    %ebp
80103769:	c3                   	ret    
8010376a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      release(&p->lock);
      return -1;
    }
    sleep(&p->nread, &p->lock); //DOC: piperead-sleep
  }
  for(i = 0; i < n; i++){  //DOC: piperead-copy
80103770:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
80103777:	eb cc                	jmp    80103745 <piperead+0xd5>
80103779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103780:	89 4d 10             	mov    %ecx,0x10(%ebp)
80103783:	eb c0                	jmp    80103745 <piperead+0xd5>
80103785:	66 90                	xchg   %ax,%ax
80103787:	66 90                	xchg   %ax,%ax
80103789:	66 90                	xchg   %ax,%ax
8010378b:	66 90                	xchg   %ax,%ax
8010378d:	66 90                	xchg   %ax,%ax
8010378f:	90                   	nop

80103790 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103790:	55                   	push   %ebp
80103791:	89 e5                	mov    %esp,%ebp
80103793:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103794:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103799:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
8010379c:	68 a0 2d 11 80       	push   $0x80112da0
801037a1:	e8 ea 0c 00 00       	call   80104490 <acquire>
801037a6:	83 c4 10             	add    $0x10,%esp
801037a9:	eb 17                	jmp    801037c2 <allocproc+0x32>
801037ab:	90                   	nop
801037ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801037b0:	81 c3 8c 01 00 00    	add    $0x18c,%ebx
801037b6:	81 fb d4 90 11 80    	cmp    $0x801190d4,%ebx
801037bc:	0f 84 b6 00 00 00    	je     80103878 <allocproc+0xe8>
    if(p->state == UNUSED)
801037c2:	8b 43 0c             	mov    0xc(%ebx),%eax
801037c5:	85 c0                	test   %eax,%eax
801037c7:	75 e7                	jne    801037b0 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
801037c9:	a1 08 a0 10 80       	mov    0x8010a008,%eax
801037ce:	8d 4b 7c             	lea    0x7c(%ebx),%ecx

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
801037d1:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->pid = nextpid++;
801037d8:	8d 50 01             	lea    0x1(%eax),%edx
801037db:	89 43 10             	mov    %eax,0x10(%ebx)
801037de:	89 15 08 a0 10 80    	mov    %edx,0x8010a008
801037e4:	8d 93 fc 00 00 00    	lea    0xfc(%ebx),%edx
801037ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

/*pazit-------------------------------------------------------*/
//initial the pending array to 0 and the handlers array to def add

for(int i=0;i<NUMSIG;i++){
 p -> pending[i] = 0;
801037f0:	c7 01 00 00 00 00    	movl   $0x0,(%ecx)
801037f6:	83 c1 04             	add    $0x4,%ecx
  p->pid = nextpid++;

/*pazit-------------------------------------------------------*/
//initial the pending array to 0 and the handlers array to def add

for(int i=0;i<NUMSIG;i++){
801037f9:	39 d1                	cmp    %edx,%ecx
801037fb:	75 f3                	jne    801037f0 <allocproc+0x60>
801037fd:	8d 83 7c 01 00 00    	lea    0x17c(%ebx),%eax
80103803:	90                   	nop
80103804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 p -> pending[i] = 0;
}
for(int i=0;i<NUMSIG;i++){
 //p -> pending[i] = 0;
 p ->sighandlers[i] = (sighandler_t)defualtHandlerAdd;
80103808:	c7 02 ff ff 00 00    	movl   $0xffff,(%edx)
8010380e:	83 c2 04             	add    $0x4,%edx
//initial the pending array to 0 and the handlers array to def add

for(int i=0;i<NUMSIG;i++){
 p -> pending[i] = 0;
}
for(int i=0;i<NUMSIG;i++){
80103811:	39 c2                	cmp    %eax,%edx
80103813:	75 f3                	jne    80103808 <allocproc+0x78>
  p->alarm_ticks_num = 0;


/*-----------------------------------------------------------*/

  release(&ptable.lock);
80103815:	83 ec 0c             	sub    $0xc,%esp
for(int i=0;i<NUMSIG;i++){
 //p -> pending[i] = 0;
 p ->sighandlers[i] = (sighandler_t)defualtHandlerAdd;
}
//initial tick num
  p->alarm_ticks_num = 0;
80103818:	c7 83 88 01 00 00 00 	movl   $0x0,0x188(%ebx)
8010381f:	00 00 00 


/*-----------------------------------------------------------*/

  release(&ptable.lock);
80103822:	68 a0 2d 11 80       	push   $0x80112da0
80103827:	e8 44 0e 00 00       	call   80104670 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
8010382c:	e8 8f ec ff ff       	call   801024c0 <kalloc>
80103831:	83 c4 10             	add    $0x10,%esp
80103834:	85 c0                	test   %eax,%eax
80103836:	89 43 08             	mov    %eax,0x8(%ebx)
80103839:	74 54                	je     8010388f <allocproc+0xff>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
8010383b:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103841:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
80103844:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103849:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
8010384c:	c7 40 14 12 5a 10 80 	movl   $0x80105a12,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103853:	6a 14                	push   $0x14
80103855:	6a 00                	push   $0x0
80103857:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
80103858:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010385b:	e8 60 0e 00 00       	call   801046c0 <memset>
  p->context->eip = (uint)forkret;
80103860:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
80103863:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
80103866:	c7 40 10 a0 38 10 80 	movl   $0x801038a0,0x10(%eax)

  return p;
8010386d:	89 d8                	mov    %ebx,%eax
}
8010386f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103872:	c9                   	leave  
80103873:	c3                   	ret    
80103874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
80103878:	83 ec 0c             	sub    $0xc,%esp
8010387b:	68 a0 2d 11 80       	push   $0x80112da0
80103880:	e8 eb 0d 00 00       	call   80104670 <release>
  return 0;
80103885:	83 c4 10             	add    $0x10,%esp
80103888:	31 c0                	xor    %eax,%eax
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;

  return p;
}
8010388a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010388d:	c9                   	leave  
8010388e:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
8010388f:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
80103896:	eb d7                	jmp    8010386f <allocproc+0xdf>
80103898:	90                   	nop
80103899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801038a0 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
801038a0:	55                   	push   %ebp
801038a1:	89 e5                	mov    %esp,%ebp
801038a3:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
801038a6:	68 a0 2d 11 80       	push   $0x80112da0
801038ab:	e8 c0 0d 00 00       	call   80104670 <release>

  if (first) {
801038b0:	a1 04 a0 10 80       	mov    0x8010a004,%eax
801038b5:	83 c4 10             	add    $0x10,%esp
801038b8:	85 c0                	test   %eax,%eax
801038ba:	75 04                	jne    801038c0 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801038bc:	c9                   	leave  
801038bd:	c3                   	ret    
801038be:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
801038c0:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
801038c3:	c7 05 04 a0 10 80 00 	movl   $0x0,0x8010a004
801038ca:	00 00 00 
    iinit(ROOTDEV);
801038cd:	6a 01                	push   $0x1
801038cf:	e8 cc db ff ff       	call   801014a0 <iinit>
    initlog(ROOTDEV);
801038d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
801038db:	e8 80 f2 ff ff       	call   80102b60 <initlog>
801038e0:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
801038e3:	c9                   	leave  
801038e4:	c3                   	ret    
801038e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801038e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801038f0 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
801038f0:	55                   	push   %ebp
801038f1:	89 e5                	mov    %esp,%ebp
801038f3:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
801038f6:	68 6d 79 10 80       	push   $0x8010796d
801038fb:	68 a0 2d 11 80       	push   $0x80112da0
80103900:	e8 6b 0b 00 00       	call   80104470 <initlock>
}
80103905:	83 c4 10             	add    $0x10,%esp
80103908:	c9                   	leave  
80103909:	c3                   	ret    
8010390a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103910 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
80103910:	55                   	push   %ebp
80103911:	89 e5                	mov    %esp,%ebp
80103913:	53                   	push   %ebx
80103914:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
80103917:	e8 74 fe ff ff       	call   80103790 <allocproc>
8010391c:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
8010391e:	a3 bc a5 10 80       	mov    %eax,0x8010a5bc
  if((p->pgdir = setupkvm()) == 0)
80103923:	e8 a8 34 00 00       	call   80106dd0 <setupkvm>
80103928:	85 c0                	test   %eax,%eax
8010392a:	89 43 04             	mov    %eax,0x4(%ebx)
8010392d:	0f 84 bd 00 00 00    	je     801039f0 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103933:	83 ec 04             	sub    $0x4,%esp
80103936:	68 2c 00 00 00       	push   $0x2c
8010393b:	68 60 a4 10 80       	push   $0x8010a460
80103940:	50                   	push   %eax
80103941:	e8 da 35 00 00       	call   80106f20 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103946:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103949:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010394f:	6a 4c                	push   $0x4c
80103951:	6a 00                	push   $0x0
80103953:	ff 73 18             	pushl  0x18(%ebx)
80103956:	e8 65 0d 00 00       	call   801046c0 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010395b:	8b 43 18             	mov    0x18(%ebx),%eax
8010395e:	ba 23 00 00 00       	mov    $0x23,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103963:	b9 2b 00 00 00       	mov    $0x2b,%ecx
  p->tf->ss = p->tf->ds;
  p->tf->eflags = FL_IF;
  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103968:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010396b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010396f:	8b 43 18             	mov    0x18(%ebx),%eax
80103972:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103976:	8b 43 18             	mov    0x18(%ebx),%eax
80103979:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010397d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103981:	8b 43 18             	mov    0x18(%ebx),%eax
80103984:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103988:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010398c:	8b 43 18             	mov    0x18(%ebx),%eax
8010398f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
80103996:	8b 43 18             	mov    0x18(%ebx),%eax
80103999:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
801039a0:	8b 43 18             	mov    0x18(%ebx),%eax
801039a3:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
801039aa:	8d 43 6c             	lea    0x6c(%ebx),%eax
801039ad:	6a 10                	push   $0x10
801039af:	68 8d 79 10 80       	push   $0x8010798d
801039b4:	50                   	push   %eax
801039b5:	e8 06 0f 00 00       	call   801048c0 <safestrcpy>
  p->cwd = namei("/");
801039ba:	c7 04 24 96 79 10 80 	movl   $0x80107996,(%esp)
801039c1:	e8 0a e5 ff ff       	call   80101ed0 <namei>
801039c6:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
801039c9:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
801039d0:	e8 bb 0a 00 00       	call   80104490 <acquire>

  p->state = RUNNABLE;
801039d5:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
801039dc:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
801039e3:	e8 88 0c 00 00       	call   80104670 <release>
}
801039e8:	83 c4 10             	add    $0x10,%esp
801039eb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801039ee:	c9                   	leave  
801039ef:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
801039f0:	83 ec 0c             	sub    $0xc,%esp
801039f3:	68 74 79 10 80       	push   $0x80107974
801039f8:	e8 73 c9 ff ff       	call   80100370 <panic>
801039fd:	8d 76 00             	lea    0x0(%esi),%esi

80103a00 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103a00:	55                   	push   %ebp
80103a01:	89 e5                	mov    %esp,%ebp
80103a03:	83 ec 08             	sub    $0x8,%esp
  uint sz;

  sz = proc->sz;
80103a06:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103a0d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint sz;

  sz = proc->sz;
80103a10:	8b 02                	mov    (%edx),%eax
  if(n > 0){
80103a12:	83 f9 00             	cmp    $0x0,%ecx
80103a15:	7e 39                	jle    80103a50 <growproc+0x50>
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
80103a17:	83 ec 04             	sub    $0x4,%esp
80103a1a:	01 c1                	add    %eax,%ecx
80103a1c:	51                   	push   %ecx
80103a1d:	50                   	push   %eax
80103a1e:	ff 72 04             	pushl  0x4(%edx)
80103a21:	e8 3a 36 00 00       	call   80107060 <allocuvm>
80103a26:	83 c4 10             	add    $0x10,%esp
80103a29:	85 c0                	test   %eax,%eax
80103a2b:	74 3b                	je     80103a68 <growproc+0x68>
80103a2d:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      return -1;
  } else if(n < 0){
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  }
  proc->sz = sz;
80103a34:	89 02                	mov    %eax,(%edx)
  switchuvm(proc);
80103a36:	83 ec 0c             	sub    $0xc,%esp
80103a39:	65 ff 35 04 00 00 00 	pushl  %gs:0x4
80103a40:	e8 3b 34 00 00       	call   80106e80 <switchuvm>
  return 0;
80103a45:	83 c4 10             	add    $0x10,%esp
80103a48:	31 c0                	xor    %eax,%eax
}
80103a4a:	c9                   	leave  
80103a4b:	c3                   	ret    
80103a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
80103a50:	74 e2                	je     80103a34 <growproc+0x34>
    if((sz = deallocuvm(proc->pgdir, sz, sz + n)) == 0)
80103a52:	83 ec 04             	sub    $0x4,%esp
80103a55:	01 c1                	add    %eax,%ecx
80103a57:	51                   	push   %ecx
80103a58:	50                   	push   %eax
80103a59:	ff 72 04             	pushl  0x4(%edx)
80103a5c:	e8 ff 36 00 00       	call   80107160 <deallocuvm>
80103a61:	83 c4 10             	add    $0x10,%esp
80103a64:	85 c0                	test   %eax,%eax
80103a66:	75 c5                	jne    80103a2d <growproc+0x2d>
  uint sz;

  sz = proc->sz;
  if(n > 0){
    if((sz = allocuvm(proc->pgdir, sz, sz + n)) == 0)
      return -1;
80103a68:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
  }
  proc->sz = sz;
  switchuvm(proc);
  return 0;
}
80103a6d:	c9                   	leave  
80103a6e:	c3                   	ret    
80103a6f:	90                   	nop

80103a70 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
80103a70:	55                   	push   %ebp
80103a71:	89 e5                	mov    %esp,%ebp
80103a73:	57                   	push   %edi
80103a74:	56                   	push   %esi
80103a75:	53                   	push   %ebx
80103a76:	83 ec 0c             	sub    $0xc,%esp
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
80103a79:	e8 12 fd ff ff       	call   80103790 <allocproc>
80103a7e:	85 c0                	test   %eax,%eax
80103a80:	0f 84 e6 00 00 00    	je     80103b6c <fork+0xfc>
80103a86:	89 c3                	mov    %eax,%ebx
    return -1;
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
80103a88:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103a8e:	83 ec 08             	sub    $0x8,%esp
80103a91:	ff 30                	pushl  (%eax)
80103a93:	ff 70 04             	pushl  0x4(%eax)
80103a96:	e8 a5 37 00 00       	call   80107240 <copyuvm>
80103a9b:	83 c4 10             	add    $0x10,%esp
80103a9e:	85 c0                	test   %eax,%eax
80103aa0:	89 43 04             	mov    %eax,0x4(%ebx)
80103aa3:	0f 84 ca 00 00 00    	je     80103b73 <fork+0x103>
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
80103aa9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  np->parent = proc;
  *np->tf = *proc->tf;
80103aaf:	8b 7b 18             	mov    0x18(%ebx),%edi
80103ab2:	b9 13 00 00 00       	mov    $0x13,%ecx
    kfree(np->kstack);
    np->kstack = 0;
    np->state = UNUSED;
    return -1;
  }
  np->sz = proc->sz;
80103ab7:	8b 00                	mov    (%eax),%eax
80103ab9:	89 03                	mov    %eax,(%ebx)
  np->parent = proc;
80103abb:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ac1:	89 43 14             	mov    %eax,0x14(%ebx)
  *np->tf = *proc->tf;
80103ac4:	8b 70 18             	mov    0x18(%eax),%esi
80103ac7:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)


  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103ac9:	31 f6                	xor    %esi,%esi
  }
  np->sz = proc->sz;
  np->parent = proc;
  *np->tf = *proc->tf;

  np->alarm_ticks_num = proc->alarm_ticks_num;  //pazit
80103acb:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103ad2:	8b 82 88 01 00 00    	mov    0x188(%edx),%eax
80103ad8:	89 83 88 01 00 00    	mov    %eax,0x188(%ebx)


  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103ade:	8b 43 18             	mov    0x18(%ebx),%eax
80103ae1:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103ae8:	90                   	nop
80103ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  for(i = 0; i < NOFILE; i++)
    if(proc->ofile[i])
80103af0:	8b 44 b2 28          	mov    0x28(%edx,%esi,4),%eax
80103af4:	85 c0                	test   %eax,%eax
80103af6:	74 17                	je     80103b0f <fork+0x9f>
      np->ofile[i] = filedup(proc->ofile[i]);
80103af8:	83 ec 0c             	sub    $0xc,%esp
80103afb:	50                   	push   %eax
80103afc:	e8 0f d3 ff ff       	call   80100e10 <filedup>
80103b01:	89 44 b3 28          	mov    %eax,0x28(%ebx,%esi,4)
80103b05:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103b0c:	83 c4 10             	add    $0x10,%esp


  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103b0f:	83 c6 01             	add    $0x1,%esi
80103b12:	83 fe 10             	cmp    $0x10,%esi
80103b15:	75 d9                	jne    80103af0 <fork+0x80>
    if(proc->ofile[i])
      np->ofile[i] = filedup(proc->ofile[i]);
  np->cwd = idup(proc->cwd);
80103b17:	83 ec 0c             	sub    $0xc,%esp
80103b1a:	ff 72 68             	pushl  0x68(%edx)
80103b1d:	e8 4e db ff ff       	call   80101670 <idup>
80103b22:	89 43 68             	mov    %eax,0x68(%ebx)

  safestrcpy(np->name, proc->name, sizeof(proc->name));
80103b25:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103b2b:	83 c4 0c             	add    $0xc,%esp
80103b2e:	6a 10                	push   $0x10
80103b30:	83 c0 6c             	add    $0x6c,%eax
80103b33:	50                   	push   %eax
80103b34:	8d 43 6c             	lea    0x6c(%ebx),%eax
80103b37:	50                   	push   %eax
80103b38:	e8 83 0d 00 00       	call   801048c0 <safestrcpy>

  pid = np->pid;
80103b3d:	8b 73 10             	mov    0x10(%ebx),%esi

  acquire(&ptable.lock);
80103b40:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103b47:	e8 44 09 00 00       	call   80104490 <acquire>

  np->state = RUNNABLE;
80103b4c:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
80103b53:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103b5a:	e8 11 0b 00 00       	call   80104670 <release>

  return pid;
80103b5f:	83 c4 10             	add    $0x10,%esp
80103b62:	89 f0                	mov    %esi,%eax
}
80103b64:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b67:	5b                   	pop    %ebx
80103b68:	5e                   	pop    %esi
80103b69:	5f                   	pop    %edi
80103b6a:	5d                   	pop    %ebp
80103b6b:	c3                   	ret    
  int i, pid;
  struct proc *np;

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103b6c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103b71:	eb f1                	jmp    80103b64 <fork+0xf4>
  }

  // Copy process state from p.
  if((np->pgdir = copyuvm(proc->pgdir, proc->sz)) == 0){
    kfree(np->kstack);
80103b73:	83 ec 0c             	sub    $0xc,%esp
80103b76:	ff 73 08             	pushl  0x8(%ebx)
80103b79:	e8 92 e7 ff ff       	call   80102310 <kfree>
    np->kstack = 0;
80103b7e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103b85:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103b8c:	83 c4 10             	add    $0x10,%esp
80103b8f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103b94:	eb ce                	jmp    80103b64 <fork+0xf4>
80103b96:	8d 76 00             	lea    0x0(%esi),%esi
80103b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ba0 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103ba0:	55                   	push   %ebp
80103ba1:	89 e5                	mov    %esp,%ebp
80103ba3:	53                   	push   %ebx
80103ba4:	83 ec 04             	sub    $0x4,%esp
80103ba7:	89 f6                	mov    %esi,%esi
80103ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103bb0:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103bb1:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bb4:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103bb9:	68 a0 2d 11 80       	push   $0x80112da0
80103bbe:	e8 cd 08 00 00       	call   80104490 <acquire>
80103bc3:	83 c4 10             	add    $0x10,%esp
80103bc6:	eb 16                	jmp    80103bde <scheduler+0x3e>
80103bc8:	90                   	nop
80103bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bd0:	81 c3 8c 01 00 00    	add    $0x18c,%ebx
80103bd6:	81 fb d4 90 11 80    	cmp    $0x801190d4,%ebx
80103bdc:	74 62                	je     80103c40 <scheduler+0xa0>
      if(p->state != RUNNABLE)
80103bde:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103be2:	75 ec                	jne    80103bd0 <scheduler+0x30>

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
80103be4:	83 ec 0c             	sub    $0xc,%esp
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
80103be7:	65 89 1d 04 00 00 00 	mov    %ebx,%gs:0x4
      switchuvm(p);
80103bee:	53                   	push   %ebx
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bef:	81 c3 8c 01 00 00    	add    $0x18c,%ebx

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
80103bf5:	e8 86 32 00 00       	call   80106e80 <switchuvm>
      p->state = RUNNING;
      swtch(&cpu->scheduler, p->context);
80103bfa:	58                   	pop    %eax
80103bfb:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      proc = p;
      switchuvm(p);
      p->state = RUNNING;
80103c01:	c7 83 80 fe ff ff 04 	movl   $0x4,-0x180(%ebx)
80103c08:	00 00 00 
      swtch(&cpu->scheduler, p->context);
80103c0b:	5a                   	pop    %edx
80103c0c:	ff b3 90 fe ff ff    	pushl  -0x170(%ebx)
80103c12:	83 c0 04             	add    $0x4,%eax
80103c15:	50                   	push   %eax
80103c16:	e8 00 0d 00 00       	call   8010491b <swtch>
      switchkvm();
80103c1b:	e8 40 32 00 00       	call   80106e60 <switchkvm>

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
80103c20:	83 c4 10             	add    $0x10,%esp
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c23:	81 fb d4 90 11 80    	cmp    $0x801190d4,%ebx
      swtch(&cpu->scheduler, p->context);
      switchkvm();

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
80103c29:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80103c30:	00 00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c34:	75 a8                	jne    80103bde <scheduler+0x3e>
80103c36:	8d 76 00             	lea    0x0(%esi),%esi
80103c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

      // Process is done running for now.
      // It should have changed its p->state before coming back.
      proc = 0;
    }
    release(&ptable.lock);
80103c40:	83 ec 0c             	sub    $0xc,%esp
80103c43:	68 a0 2d 11 80       	push   $0x80112da0
80103c48:	e8 23 0a 00 00       	call   80104670 <release>

  }
80103c4d:	83 c4 10             	add    $0x10,%esp
80103c50:	e9 5b ff ff ff       	jmp    80103bb0 <scheduler+0x10>
80103c55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c60 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103c60:	55                   	push   %ebp
80103c61:	89 e5                	mov    %esp,%ebp
80103c63:	53                   	push   %ebx
80103c64:	83 ec 10             	sub    $0x10,%esp
  int intena;

  if(!holding(&ptable.lock))
80103c67:	68 a0 2d 11 80       	push   $0x80112da0
80103c6c:	e8 4f 09 00 00       	call   801045c0 <holding>
80103c71:	83 c4 10             	add    $0x10,%esp
80103c74:	85 c0                	test   %eax,%eax
80103c76:	74 4c                	je     80103cc4 <sched+0x64>
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
80103c78:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80103c7f:	83 ba ac 00 00 00 01 	cmpl   $0x1,0xac(%edx)
80103c86:	75 63                	jne    80103ceb <sched+0x8b>
    panic("sched locks");
  if(proc->state == RUNNING)
80103c88:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103c8e:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80103c92:	74 4a                	je     80103cde <sched+0x7e>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103c94:	9c                   	pushf  
80103c95:	59                   	pop    %ecx
    panic("sched running");
  if(readeflags()&FL_IF)
80103c96:	80 e5 02             	and    $0x2,%ch
80103c99:	75 36                	jne    80103cd1 <sched+0x71>
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
80103c9b:	83 ec 08             	sub    $0x8,%esp
80103c9e:	83 c0 1c             	add    $0x1c,%eax
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
80103ca1:	8b 9a b0 00 00 00    	mov    0xb0(%edx),%ebx
  swtch(&proc->context, cpu->scheduler);
80103ca7:	ff 72 04             	pushl  0x4(%edx)
80103caa:	50                   	push   %eax
80103cab:	e8 6b 0c 00 00       	call   8010491b <swtch>
  cpu->intena = intena;
80103cb0:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
}
80103cb6:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = cpu->intena;
  swtch(&proc->context, cpu->scheduler);
  cpu->intena = intena;
80103cb9:	89 98 b0 00 00 00    	mov    %ebx,0xb0(%eax)
}
80103cbf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103cc2:	c9                   	leave  
80103cc3:	c3                   	ret    
sched(void)
{
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103cc4:	83 ec 0c             	sub    $0xc,%esp
80103cc7:	68 98 79 10 80       	push   $0x80107998
80103ccc:	e8 9f c6 ff ff       	call   80100370 <panic>
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103cd1:	83 ec 0c             	sub    $0xc,%esp
80103cd4:	68 c4 79 10 80       	push   $0x801079c4
80103cd9:	e8 92 c6 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
  if(proc->state == RUNNING)
    panic("sched running");
80103cde:	83 ec 0c             	sub    $0xc,%esp
80103ce1:	68 b6 79 10 80       	push   $0x801079b6
80103ce6:	e8 85 c6 ff ff       	call   80100370 <panic>
  int intena;

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(cpu->ncli != 1)
    panic("sched locks");
80103ceb:	83 ec 0c             	sub    $0xc,%esp
80103cee:	68 aa 79 10 80       	push   $0x801079aa
80103cf3:	e8 78 c6 ff ff       	call   80100370 <panic>
80103cf8:	90                   	nop
80103cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103d00 <exit>:
exit(void)
{
  struct proc *p;
  int fd;

  if(proc == initproc)
80103d00:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103d07:	3b 15 bc a5 10 80    	cmp    0x8010a5bc,%edx
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103d0d:	55                   	push   %ebp
80103d0e:	89 e5                	mov    %esp,%ebp
80103d10:	56                   	push   %esi
80103d11:	53                   	push   %ebx
  struct proc *p;
  int fd;

  if(proc == initproc)
80103d12:	0f 84 29 01 00 00    	je     80103e41 <exit+0x141>
80103d18:	31 db                	xor    %ebx,%ebx
80103d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd]){
80103d20:	8d 73 08             	lea    0x8(%ebx),%esi
80103d23:	8b 44 b2 08          	mov    0x8(%edx,%esi,4),%eax
80103d27:	85 c0                	test   %eax,%eax
80103d29:	74 1b                	je     80103d46 <exit+0x46>
      fileclose(proc->ofile[fd]);
80103d2b:	83 ec 0c             	sub    $0xc,%esp
80103d2e:	50                   	push   %eax
80103d2f:	e8 2c d1 ff ff       	call   80100e60 <fileclose>
      proc->ofile[fd] = 0;
80103d34:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80103d3b:	83 c4 10             	add    $0x10,%esp
80103d3e:	c7 44 b2 08 00 00 00 	movl   $0x0,0x8(%edx,%esi,4)
80103d45:	00 

  if(proc == initproc)
    panic("init exiting");

  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103d46:	83 c3 01             	add    $0x1,%ebx
80103d49:	83 fb 10             	cmp    $0x10,%ebx
80103d4c:	75 d2                	jne    80103d20 <exit+0x20>
      fileclose(proc->ofile[fd]);
      proc->ofile[fd] = 0;
    }
  }

  begin_op();
80103d4e:	e8 ad ee ff ff       	call   80102c00 <begin_op>
  iput(proc->cwd);
80103d53:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d59:	83 ec 0c             	sub    $0xc,%esp
80103d5c:	ff 70 68             	pushl  0x68(%eax)
80103d5f:	e8 6c da ff ff       	call   801017d0 <iput>
  end_op();
80103d64:	e8 07 ef ff ff       	call   80102c70 <end_op>
  proc->cwd = 0;
80103d69:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103d6f:	c7 40 68 00 00 00 00 	movl   $0x0,0x68(%eax)

  acquire(&ptable.lock);
80103d76:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103d7d:	e8 0e 07 00 00       	call   80104490 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103d82:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80103d89:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103d8c:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
  proc->cwd = 0;

  acquire(&ptable.lock);

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);
80103d91:	8b 51 14             	mov    0x14(%ecx),%edx
80103d94:	eb 16                	jmp    80103dac <exit+0xac>
80103d96:	8d 76 00             	lea    0x0(%esi),%esi
80103d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103da0:	05 8c 01 00 00       	add    $0x18c,%eax
80103da5:	3d d4 90 11 80       	cmp    $0x801190d4,%eax
80103daa:	74 1e                	je     80103dca <exit+0xca>
    if(p->state == SLEEPING && p->chan == chan)
80103dac:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103db0:	75 ee                	jne    80103da0 <exit+0xa0>
80103db2:	3b 50 20             	cmp    0x20(%eax),%edx
80103db5:	75 e9                	jne    80103da0 <exit+0xa0>
      p->state = RUNNABLE;
80103db7:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103dbe:	05 8c 01 00 00       	add    $0x18c,%eax
80103dc3:	3d d4 90 11 80       	cmp    $0x801190d4,%eax
80103dc8:	75 e2                	jne    80103dac <exit+0xac>
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103dca:	8b 1d bc a5 10 80    	mov    0x8010a5bc,%ebx
80103dd0:	ba d4 2d 11 80       	mov    $0x80112dd4,%edx
80103dd5:	eb 17                	jmp    80103dee <exit+0xee>
80103dd7:	89 f6                	mov    %esi,%esi
80103dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  // Parent might be sleeping in wait().
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103de0:	81 c2 8c 01 00 00    	add    $0x18c,%edx
80103de6:	81 fa d4 90 11 80    	cmp    $0x801190d4,%edx
80103dec:	74 3a                	je     80103e28 <exit+0x128>
    if(p->parent == proc){
80103dee:	3b 4a 14             	cmp    0x14(%edx),%ecx
80103df1:	75 ed                	jne    80103de0 <exit+0xe0>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103df3:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(proc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == proc){
      p->parent = initproc;
80103df7:	89 5a 14             	mov    %ebx,0x14(%edx)
      if(p->state == ZOMBIE)
80103dfa:	75 e4                	jne    80103de0 <exit+0xe0>
80103dfc:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80103e01:	eb 11                	jmp    80103e14 <exit+0x114>
80103e03:	90                   	nop
80103e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e08:	05 8c 01 00 00       	add    $0x18c,%eax
80103e0d:	3d d4 90 11 80       	cmp    $0x801190d4,%eax
80103e12:	74 cc                	je     80103de0 <exit+0xe0>
    if(p->state == SLEEPING && p->chan == chan)
80103e14:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e18:	75 ee                	jne    80103e08 <exit+0x108>
80103e1a:	3b 58 20             	cmp    0x20(%eax),%ebx
80103e1d:	75 e9                	jne    80103e08 <exit+0x108>
      p->state = RUNNABLE;
80103e1f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e26:	eb e0                	jmp    80103e08 <exit+0x108>
        wakeup1(initproc);
    }
  }

  // Jump into the scheduler, never to return.
  proc->state = ZOMBIE;
80103e28:	c7 41 0c 05 00 00 00 	movl   $0x5,0xc(%ecx)
  sched();
80103e2f:	e8 2c fe ff ff       	call   80103c60 <sched>
  panic("zombie exit");
80103e34:	83 ec 0c             	sub    $0xc,%esp
80103e37:	68 e5 79 10 80       	push   $0x801079e5
80103e3c:	e8 2f c5 ff ff       	call   80100370 <panic>
{
  struct proc *p;
  int fd;

  if(proc == initproc)
    panic("init exiting");
80103e41:	83 ec 0c             	sub    $0xc,%esp
80103e44:	68 d8 79 10 80       	push   $0x801079d8
80103e49:	e8 22 c5 ff ff       	call   80100370 <panic>
80103e4e:	66 90                	xchg   %ax,%ax

80103e50 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103e50:	55                   	push   %ebp
80103e51:	89 e5                	mov    %esp,%ebp
80103e53:	83 ec 14             	sub    $0x14,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103e56:	68 a0 2d 11 80       	push   $0x80112da0
80103e5b:	e8 30 06 00 00       	call   80104490 <acquire>
  proc->state = RUNNABLE;
80103e60:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103e66:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  sched();
80103e6d:	e8 ee fd ff ff       	call   80103c60 <sched>
  release(&ptable.lock);
80103e72:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103e79:	e8 f2 07 00 00       	call   80104670 <release>
}
80103e7e:	83 c4 10             	add    $0x10,%esp
80103e81:	c9                   	leave  
80103e82:	c3                   	ret    
80103e83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103e90 <sleep>:
// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
80103e90:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103e96:	55                   	push   %ebp
80103e97:	89 e5                	mov    %esp,%ebp
80103e99:	56                   	push   %esi
80103e9a:	53                   	push   %ebx
  if(proc == 0)
80103e9b:	85 c0                	test   %eax,%eax

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103e9d:	8b 75 08             	mov    0x8(%ebp),%esi
80103ea0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(proc == 0)
80103ea3:	0f 84 97 00 00 00    	je     80103f40 <sleep+0xb0>
    panic("sleep");

  if(lk == 0)
80103ea9:	85 db                	test   %ebx,%ebx
80103eab:	0f 84 82 00 00 00    	je     80103f33 <sleep+0xa3>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103eb1:	81 fb a0 2d 11 80    	cmp    $0x80112da0,%ebx
80103eb7:	74 57                	je     80103f10 <sleep+0x80>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103eb9:	83 ec 0c             	sub    $0xc,%esp
80103ebc:	68 a0 2d 11 80       	push   $0x80112da0
80103ec1:	e8 ca 05 00 00       	call   80104490 <acquire>
    release(lk);
80103ec6:	89 1c 24             	mov    %ebx,(%esp)
80103ec9:	e8 a2 07 00 00       	call   80104670 <release>
  }

  // Go to sleep.
  proc->chan = chan;
80103ece:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ed4:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103ed7:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103ede:	e8 7d fd ff ff       	call   80103c60 <sched>

  // Tidy up.
  proc->chan = 0;
80103ee3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103ee9:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103ef0:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
80103ef7:	e8 74 07 00 00       	call   80104670 <release>
    acquire(lk);
80103efc:	89 5d 08             	mov    %ebx,0x8(%ebp)
80103eff:	83 c4 10             	add    $0x10,%esp
  }
}
80103f02:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f05:	5b                   	pop    %ebx
80103f06:	5e                   	pop    %esi
80103f07:	5d                   	pop    %ebp
  proc->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103f08:	e9 83 05 00 00       	jmp    80104490 <acquire>
80103f0d:	8d 76 00             	lea    0x0(%esi),%esi
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }

  // Go to sleep.
  proc->chan = chan;
80103f10:	89 70 20             	mov    %esi,0x20(%eax)
  proc->state = SLEEPING;
80103f13:	c7 40 0c 02 00 00 00 	movl   $0x2,0xc(%eax)
  sched();
80103f1a:	e8 41 fd ff ff       	call   80103c60 <sched>

  // Tidy up.
  proc->chan = 0;
80103f1f:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80103f25:	c7 40 20 00 00 00 00 	movl   $0x0,0x20(%eax)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103f2c:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103f2f:	5b                   	pop    %ebx
80103f30:	5e                   	pop    %esi
80103f31:	5d                   	pop    %ebp
80103f32:	c3                   	ret    
{
  if(proc == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103f33:	83 ec 0c             	sub    $0xc,%esp
80103f36:	68 f7 79 10 80       	push   $0x801079f7
80103f3b:	e8 30 c4 ff ff       	call   80100370 <panic>
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
  if(proc == 0)
    panic("sleep");
80103f40:	83 ec 0c             	sub    $0xc,%esp
80103f43:	68 f1 79 10 80       	push   $0x801079f1
80103f48:	e8 23 c4 ff ff       	call   80100370 <panic>
80103f4d:	8d 76 00             	lea    0x0(%esi),%esi

80103f50 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80103f50:	55                   	push   %ebp
80103f51:	89 e5                	mov    %esp,%ebp
80103f53:	56                   	push   %esi
80103f54:	53                   	push   %ebx
  struct proc *p;
  int havekids, pid;

  acquire(&ptable.lock);
80103f55:	83 ec 0c             	sub    $0xc,%esp
80103f58:	68 a0 2d 11 80       	push   $0x80112da0
80103f5d:	e8 2e 05 00 00       	call   80104490 <acquire>
80103f62:	83 c4 10             	add    $0x10,%esp
80103f65:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
80103f6b:	31 d2                	xor    %edx,%edx
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f6d:	bb d4 2d 11 80       	mov    $0x80112dd4,%ebx
80103f72:	eb 12                	jmp    80103f86 <wait+0x36>
80103f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103f78:	81 c3 8c 01 00 00    	add    $0x18c,%ebx
80103f7e:	81 fb d4 90 11 80    	cmp    $0x801190d4,%ebx
80103f84:	74 22                	je     80103fa8 <wait+0x58>
      if(p->parent != proc)
80103f86:	3b 43 14             	cmp    0x14(%ebx),%eax
80103f89:	75 ed                	jne    80103f78 <wait+0x28>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
80103f8b:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103f8f:	74 35                	je     80103fc6 <wait+0x76>

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f91:	81 c3 8c 01 00 00    	add    $0x18c,%ebx
      if(p->parent != proc)
        continue;
      havekids = 1;
80103f97:	ba 01 00 00 00       	mov    $0x1,%edx

  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103f9c:	81 fb d4 90 11 80    	cmp    $0x801190d4,%ebx
80103fa2:	75 e2                	jne    80103f86 <wait+0x36>
80103fa4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
80103fa8:	85 d2                	test   %edx,%edx
80103faa:	74 70                	je     8010401c <wait+0xcc>
80103fac:	8b 50 24             	mov    0x24(%eax),%edx
80103faf:	85 d2                	test   %edx,%edx
80103fb1:	75 69                	jne    8010401c <wait+0xcc>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
80103fb3:	83 ec 08             	sub    $0x8,%esp
80103fb6:	68 a0 2d 11 80       	push   $0x80112da0
80103fbb:	50                   	push   %eax
80103fbc:	e8 cf fe ff ff       	call   80103e90 <sleep>
  }
80103fc1:	83 c4 10             	add    $0x10,%esp
80103fc4:	eb 9f                	jmp    80103f65 <wait+0x15>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80103fc6:	83 ec 0c             	sub    $0xc,%esp
80103fc9:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != proc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
80103fcc:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80103fcf:	e8 3c e3 ff ff       	call   80102310 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
80103fd4:	59                   	pop    %ecx
80103fd5:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
80103fd8:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80103fdf:	e8 ac 31 00 00       	call   80107190 <freevm>
        p->pid = 0;
80103fe4:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
80103feb:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80103ff2:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80103ff6:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
80103ffd:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80104004:	c7 04 24 a0 2d 11 80 	movl   $0x80112da0,(%esp)
8010400b:	e8 60 06 00 00       	call   80104670 <release>
        return pid;
80104010:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104013:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
80104016:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104018:	5b                   	pop    %ebx
80104019:	5e                   	pop    %esi
8010401a:	5d                   	pop    %ebp
8010401b:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
8010401c:	83 ec 0c             	sub    $0xc,%esp
8010401f:	68 a0 2d 11 80       	push   $0x80112da0
80104024:	e8 47 06 00 00       	call   80104670 <release>
      return -1;
80104029:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
8010402c:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || proc->killed){
      release(&ptable.lock);
      return -1;
8010402f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(proc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104034:	5b                   	pop    %ebx
80104035:	5e                   	pop    %esi
80104036:	5d                   	pop    %ebp
80104037:	c3                   	ret    
80104038:	90                   	nop
80104039:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104040 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104040:	55                   	push   %ebp
80104041:	89 e5                	mov    %esp,%ebp
80104043:	53                   	push   %ebx
80104044:	83 ec 10             	sub    $0x10,%esp
80104047:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010404a:	68 a0 2d 11 80       	push   $0x80112da0
8010404f:	e8 3c 04 00 00       	call   80104490 <acquire>
80104054:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104057:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
8010405c:	eb 0e                	jmp    8010406c <wakeup+0x2c>
8010405e:	66 90                	xchg   %ax,%ax
80104060:	05 8c 01 00 00       	add    $0x18c,%eax
80104065:	3d d4 90 11 80       	cmp    $0x801190d4,%eax
8010406a:	74 1e                	je     8010408a <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
8010406c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104070:	75 ee                	jne    80104060 <wakeup+0x20>
80104072:	3b 58 20             	cmp    0x20(%eax),%ebx
80104075:	75 e9                	jne    80104060 <wakeup+0x20>
      p->state = RUNNABLE;
80104077:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010407e:	05 8c 01 00 00       	add    $0x18c,%eax
80104083:	3d d4 90 11 80       	cmp    $0x801190d4,%eax
80104088:	75 e2                	jne    8010406c <wakeup+0x2c>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
8010408a:	c7 45 08 a0 2d 11 80 	movl   $0x80112da0,0x8(%ebp)
}
80104091:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104094:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80104095:	e9 d6 05 00 00       	jmp    80104670 <release>
8010409a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801040a0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
801040a0:	55                   	push   %ebp
801040a1:	89 e5                	mov    %esp,%ebp
801040a3:	53                   	push   %ebx
801040a4:	83 ec 10             	sub    $0x10,%esp
801040a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
801040aa:	68 a0 2d 11 80       	push   $0x80112da0
801040af:	e8 dc 03 00 00       	call   80104490 <acquire>
801040b4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040b7:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
801040bc:	eb 0e                	jmp    801040cc <kill+0x2c>
801040be:	66 90                	xchg   %ax,%ax
801040c0:	05 8c 01 00 00       	add    $0x18c,%eax
801040c5:	3d d4 90 11 80       	cmp    $0x801190d4,%eax
801040ca:	74 3c                	je     80104108 <kill+0x68>
    if(p->pid == pid){
801040cc:	39 58 10             	cmp    %ebx,0x10(%eax)
801040cf:	75 ef                	jne    801040c0 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
801040d1:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
801040d5:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
801040dc:	74 1a                	je     801040f8 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
801040de:	83 ec 0c             	sub    $0xc,%esp
801040e1:	68 a0 2d 11 80       	push   $0x80112da0
801040e6:	e8 85 05 00 00       	call   80104670 <release>
      return 0;
801040eb:	83 c4 10             	add    $0x10,%esp
801040ee:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
801040f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040f3:	c9                   	leave  
801040f4:	c3                   	ret    
801040f5:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
801040f8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801040ff:	eb dd                	jmp    801040de <kill+0x3e>
80104101:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
80104108:	83 ec 0c             	sub    $0xc,%esp
8010410b:	68 a0 2d 11 80       	push   $0x80112da0
80104110:	e8 5b 05 00 00       	call   80104670 <release>
  return -1;
80104115:	83 c4 10             	add    $0x10,%esp
80104118:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
8010411d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104120:	c9                   	leave  
80104121:	c3                   	ret    
80104122:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104130 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104130:	55                   	push   %ebp
80104131:	89 e5                	mov    %esp,%ebp
80104133:	57                   	push   %edi
80104134:	56                   	push   %esi
80104135:	53                   	push   %ebx
80104136:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104139:	bb 40 2e 11 80       	mov    $0x80112e40,%ebx
8010413e:	83 ec 3c             	sub    $0x3c,%esp
80104141:	eb 27                	jmp    8010416a <procdump+0x3a>
80104143:	90                   	nop
80104144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104148:	83 ec 0c             	sub    $0xc,%esp
8010414b:	68 46 79 10 80       	push   $0x80107946
80104150:	e8 0b c5 ff ff       	call   80100660 <cprintf>
80104155:	83 c4 10             	add    $0x10,%esp
80104158:	81 c3 8c 01 00 00    	add    $0x18c,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010415e:	81 fb 40 91 11 80    	cmp    $0x80119140,%ebx
80104164:	0f 84 7e 00 00 00    	je     801041e8 <procdump+0xb8>
    if(p->state == UNUSED)
8010416a:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010416d:	85 c0                	test   %eax,%eax
8010416f:	74 e7                	je     80104158 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104171:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104174:	ba 08 7a 10 80       	mov    $0x80107a08,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104179:	77 11                	ja     8010418c <procdump+0x5c>
8010417b:	8b 14 85 64 7a 10 80 	mov    -0x7fef859c(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
80104182:	b8 08 7a 10 80       	mov    $0x80107a08,%eax
80104187:	85 d2                	test   %edx,%edx
80104189:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
8010418c:	53                   	push   %ebx
8010418d:	52                   	push   %edx
8010418e:	ff 73 a4             	pushl  -0x5c(%ebx)
80104191:	68 0c 7a 10 80       	push   $0x80107a0c
80104196:	e8 c5 c4 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
8010419b:	83 c4 10             	add    $0x10,%esp
8010419e:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
801041a2:	75 a4                	jne    80104148 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801041a4:	8d 45 c0             	lea    -0x40(%ebp),%eax
801041a7:	83 ec 08             	sub    $0x8,%esp
801041aa:	8d 7d c0             	lea    -0x40(%ebp),%edi
801041ad:	50                   	push   %eax
801041ae:	8b 43 b0             	mov    -0x50(%ebx),%eax
801041b1:	8b 40 0c             	mov    0xc(%eax),%eax
801041b4:	83 c0 08             	add    $0x8,%eax
801041b7:	50                   	push   %eax
801041b8:	e8 a3 03 00 00       	call   80104560 <getcallerpcs>
801041bd:	83 c4 10             	add    $0x10,%esp
      for(i=0; i<10 && pc[i] != 0; i++)
801041c0:	8b 17                	mov    (%edi),%edx
801041c2:	85 d2                	test   %edx,%edx
801041c4:	74 82                	je     80104148 <procdump+0x18>
        cprintf(" %p", pc[i]);
801041c6:	83 ec 08             	sub    $0x8,%esp
801041c9:	83 c7 04             	add    $0x4,%edi
801041cc:	52                   	push   %edx
801041cd:	68 69 74 10 80       	push   $0x80107469
801041d2:	e8 89 c4 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
801041d7:	83 c4 10             	add    $0x10,%esp
801041da:	39 f7                	cmp    %esi,%edi
801041dc:	75 e2                	jne    801041c0 <procdump+0x90>
801041de:	e9 65 ff ff ff       	jmp    80104148 <procdump+0x18>
801041e3:	90                   	nop
801041e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
801041e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801041eb:	5b                   	pop    %ebx
801041ec:	5e                   	pop    %esi
801041ed:	5f                   	pop    %edi
801041ee:	5d                   	pop    %ebp
801041ef:	c3                   	ret    

801041f0 <signal>:
/*pazit---------------------------------------------------*/

/*---------------signal---------------*/

sighandler_t 
signal(int sigNum, sighandler_t newHandler){
801041f0:	55                   	push   %ebp
801041f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801041f6:	89 e5                	mov    %esp,%ebp
801041f8:	8b 55 08             	mov    0x8(%ebp),%edx
 
 if(sigNum <0 || sigNum > (NUMSIG-1)){  //this signal doesn't exist in the system 
801041fb:	83 fa 1f             	cmp    $0x1f,%edx
801041fe:	77 18                	ja     80104218 <signal+0x28>
80104200:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return (sighandler_t) (-1);
 }
//saving to be able to return the handler that's currently linked to signal with the number sigNum
 sighandler_t handlerToReturn = proc -> sighandlers[sigNum]; 

 proc -> sighandlers[sigNum]=newHandler;  //link the new handler to this signal
80104206:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104209:	8d 14 90             	lea    (%eax,%edx,4),%edx
 
 if(sigNum <0 || sigNum > (NUMSIG-1)){  //this signal doesn't exist in the system 
  return (sighandler_t) (-1);
 }
//saving to be able to return the handler that's currently linked to signal with the number sigNum
 sighandler_t handlerToReturn = proc -> sighandlers[sigNum]; 
8010420c:	8b 82 fc 00 00 00    	mov    0xfc(%edx),%eax

 proc -> sighandlers[sigNum]=newHandler;  //link the new handler to this signal
80104212:	89 8a fc 00 00 00    	mov    %ecx,0xfc(%edx)

return handlerToReturn;  //return the previous to newHandler handler

}
80104218:	5d                   	pop    %ebp
80104219:	c3                   	ret    
8010421a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104220 <sigsend>:

/*---------------sigsend---------------*/

int 
sigsend(int Pid, int sigNum){
80104220:	55                   	push   %ebp
80104221:	89 e5                	mov    %esp,%ebp
80104223:	56                   	push   %esi
80104224:	53                   	push   %ebx
 
 if( (Pid < 0) || (sigNum < 0) || (sigNum > (NUMSIG-1)) ){
80104225:	8b 5d 08             	mov    0x8(%ebp),%ebx
}

/*---------------sigsend---------------*/

int 
sigsend(int Pid, int sigNum){
80104228:	8b 75 0c             	mov    0xc(%ebp),%esi
 
 if( (Pid < 0) || (sigNum < 0) || (sigNum > (NUMSIG-1)) ){
8010422b:	85 db                	test   %ebx,%ebx
8010422d:	78 75                	js     801042a4 <sigsend+0x84>
8010422f:	83 fe 1f             	cmp    $0x1f,%esi
80104232:	77 70                	ja     801042a4 <sigsend+0x84>
   return (-1);
 }
/*changing the killSig code to ajust to sendSig call:*/
  struct proc *p;
  acquire(&ptable.lock);
80104234:	83 ec 0c             	sub    $0xc,%esp
80104237:	68 a0 2d 11 80       	push   $0x80112da0
8010423c:	e8 4f 02 00 00       	call   80104490 <acquire>
80104241:	83 c4 10             	add    $0x10,%esp
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104244:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80104249:	eb 11                	jmp    8010425c <sigsend+0x3c>
8010424b:	90                   	nop
8010424c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104250:	05 8c 01 00 00       	add    $0x18c,%eax
80104255:	3d d4 90 11 80       	cmp    $0x801190d4,%eax
8010425a:	74 2c                	je     80104288 <sigsend+0x68>
    if(p->pid == Pid){
8010425c:	3b 58 10             	cmp    0x10(%eax),%ebx
8010425f:	75 ef                	jne    80104250 <sigsend+0x30>
      /*if this is the pid of the running process, update  to 1 the bit in index of this signal number in its var pending*/
       p -> pending[sigNum] = 1; 
      // Wake process from sleep if necessary:
     // if(p->state == SLEEPING)
       // p->state = RUNNABLE;
      release(&ptable.lock);
80104261:	83 ec 0c             	sub    $0xc,%esp
  acquire(&ptable.lock);
  
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == Pid){
      /*if this is the pid of the running process, update  to 1 the bit in index of this signal number in its var pending*/
       p -> pending[sigNum] = 1; 
80104264:	c7 44 b0 7c 01 00 00 	movl   $0x1,0x7c(%eax,%esi,4)
8010426b:	00 
      // Wake process from sleep if necessary:
     // if(p->state == SLEEPING)
       // p->state = RUNNABLE;
      release(&ptable.lock);
8010426c:	68 a0 2d 11 80       	push   $0x80112da0
80104271:	e8 fa 03 00 00       	call   80104670 <release>
      return 0;  //signal sent successfully
80104276:	83 c4 10             	add    $0x10,%esp
80104279:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1; /*signal couldnt be sent successfully for this pid is not a known one in this sys*/
}
8010427b:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010427e:	5b                   	pop    %ebx
8010427f:	5e                   	pop    %esi
80104280:	5d                   	pop    %ebp
80104281:	c3                   	ret    
80104282:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       // p->state = RUNNABLE;
      release(&ptable.lock);
      return 0;  //signal sent successfully
    }
  }
  release(&ptable.lock);
80104288:	83 ec 0c             	sub    $0xc,%esp
8010428b:	68 a0 2d 11 80       	push   $0x80112da0
80104290:	e8 db 03 00 00       	call   80104670 <release>
  return -1; /*signal couldnt be sent successfully for this pid is not a known one in this sys*/
80104295:	83 c4 10             	add    $0x10,%esp
}
80104298:	8d 65 f8             	lea    -0x8(%ebp),%esp
      release(&ptable.lock);
      return 0;  //signal sent successfully
    }
  }
  release(&ptable.lock);
  return -1; /*signal couldnt be sent successfully for this pid is not a known one in this sys*/
8010429b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801042a0:	5b                   	pop    %ebx
801042a1:	5e                   	pop    %esi
801042a2:	5d                   	pop    %ebp
801042a3:	c3                   	ret    

int 
sigsend(int Pid, int sigNum){
 
 if( (Pid < 0) || (sigNum < 0) || (sigNum > (NUMSIG-1)) ){
   return (-1);
801042a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801042a9:	eb d0                	jmp    8010427b <sigsend+0x5b>
801042ab:	90                   	nop
801042ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801042b0 <sigreturn>:
}

/*---------------sigreturn---------------*/

int 
sigreturn(void){
801042b0:	55                   	push   %ebp
801042b1:	89 e5                	mov    %esp,%ebp
801042b3:	83 ec 10             	sub    $0x10,%esp
 cprintf("proc.c : sigreturn for process %d \n",proc->pid);
801042b6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801042bc:	ff 70 10             	pushl  0x10(%eax)
801042bf:	68 40 7a 10 80       	push   $0x80107a40
801042c4:	e8 97 c3 ff ff       	call   80100660 <cprintf>
 /*memcpy(dst, src, sizeof dst); , dst and src dont overlap*/
 // put back in tf what was backed up
 memmove( proc -> tf, &(proc -> tfToRestore), sizeof(*(proc -> tf)) );
801042c9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801042cf:	83 c4 0c             	add    $0xc,%esp
801042d2:	6a 4c                	push   $0x4c
801042d4:	8d 90 80 01 00 00    	lea    0x180(%eax),%edx
801042da:	52                   	push   %edx
801042db:	ff 70 18             	pushl  0x18(%eax)
801042de:	e8 8d 04 00 00       	call   80104770 <memmove>
 proc -> procHandlingSigNow = 0;  //finished handle the sig
801042e3:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801042e9:	c7 80 7c 01 00 00 00 	movl   $0x0,0x17c(%eax)
801042f0:	00 00 00 
 return 0;
}
801042f3:	31 c0                	xor    %eax,%eax
801042f5:	c9                   	leave  
801042f6:	c3                   	ret    
801042f7:	89 f6                	mov    %esi,%esi
801042f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104300 <Alarm>:

//-----------sigAlarm---------------------

void
Alarm()
{
80104300:	55                   	push   %ebp
80104301:	89 e5                	mov    %esp,%ebp
80104303:	83 ec 14             	sub    $0x14,%esp
  struct proc *p;

  acquire(&ptable.lock);
80104306:	68 a0 2d 11 80       	push   $0x80112da0
8010430b:	e8 80 01 00 00       	call   80104490 <acquire>
80104310:	83 c4 10             	add    $0x10,%esp
  
//decrease the number of ticks by 1 for every process
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104313:	b8 d4 2d 11 80       	mov    $0x80112dd4,%eax
80104318:	90                   	nop
80104319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

    if(p->alarm_ticks_num > 0) {  //if there are more ticks to wait
80104320:	8b 90 88 01 00 00    	mov    0x188(%eax),%edx
80104326:	85 d2                	test   %edx,%edx
80104328:	7e 17                	jle    80104341 <Alarm+0x41>
      p->alarm_ticks_num--;
8010432a:	83 ea 01             	sub    $0x1,%edx
      if(p->alarm_ticks_num == 0) { /*we waited the required num of ticks - set the 14 signal pending to 1*/
8010432d:	85 d2                	test   %edx,%edx
  
//decrease the number of ticks by 1 for every process
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {

    if(p->alarm_ticks_num > 0) {  //if there are more ticks to wait
      p->alarm_ticks_num--;
8010432f:	89 90 88 01 00 00    	mov    %edx,0x188(%eax)
      if(p->alarm_ticks_num == 0) { /*we waited the required num of ticks - set the 14 signal pending to 1*/
80104335:	75 0a                	jne    80104341 <Alarm+0x41>
        p->pending[SIGALRM] = 1;
80104337:	c7 80 b4 00 00 00 01 	movl   $0x1,0xb4(%eax)
8010433e:	00 00 00 
  struct proc *p;

  acquire(&ptable.lock);
  
//decrease the number of ticks by 1 for every process
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104341:	05 8c 01 00 00       	add    $0x18c,%eax
80104346:	3d d4 90 11 80       	cmp    $0x801190d4,%eax
8010434b:	75 d3                	jne    80104320 <Alarm+0x20>
      if(p->alarm_ticks_num == 0) { /*we waited the required num of ticks - set the 14 signal pending to 1*/
        p->pending[SIGALRM] = 1;
      }
    }
  }
  release(&ptable.lock);
8010434d:	83 ec 0c             	sub    $0xc,%esp
80104350:	68 a0 2d 11 80       	push   $0x80112da0
80104355:	e8 16 03 00 00       	call   80104670 <release>
}
8010435a:	83 c4 10             	add    $0x10,%esp
8010435d:	c9                   	leave  
8010435e:	c3                   	ret    
8010435f:	90                   	nop

80104360 <initsleeplock>:
#include "spinlock.h"
#include "sleeplock.h"

void
initsleeplock(struct sleeplock *lk, char *name)
{
80104360:	55                   	push   %ebp
80104361:	89 e5                	mov    %esp,%ebp
80104363:	53                   	push   %ebx
80104364:	83 ec 0c             	sub    $0xc,%esp
80104367:	8b 5d 08             	mov    0x8(%ebp),%ebx
  initlock(&lk->lk, "sleep lock");
8010436a:	68 7c 7a 10 80       	push   $0x80107a7c
8010436f:	8d 43 04             	lea    0x4(%ebx),%eax
80104372:	50                   	push   %eax
80104373:	e8 f8 00 00 00       	call   80104470 <initlock>
  lk->name = name;
80104378:	8b 45 0c             	mov    0xc(%ebp),%eax
  lk->locked = 0;
8010437b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
}
80104381:	83 c4 10             	add    $0x10,%esp
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
  lk->locked = 0;
  lk->pid = 0;
80104384:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)

void
initsleeplock(struct sleeplock *lk, char *name)
{
  initlock(&lk->lk, "sleep lock");
  lk->name = name;
8010438b:	89 43 38             	mov    %eax,0x38(%ebx)
  lk->locked = 0;
  lk->pid = 0;
}
8010438e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104391:	c9                   	leave  
80104392:	c3                   	ret    
80104393:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801043a0 <acquiresleep>:

void
acquiresleep(struct sleeplock *lk)
{
801043a0:	55                   	push   %ebp
801043a1:	89 e5                	mov    %esp,%ebp
801043a3:	56                   	push   %esi
801043a4:	53                   	push   %ebx
801043a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
801043a8:	83 ec 0c             	sub    $0xc,%esp
801043ab:	8d 73 04             	lea    0x4(%ebx),%esi
801043ae:	56                   	push   %esi
801043af:	e8 dc 00 00 00       	call   80104490 <acquire>
  while (lk->locked) {
801043b4:	8b 13                	mov    (%ebx),%edx
801043b6:	83 c4 10             	add    $0x10,%esp
801043b9:	85 d2                	test   %edx,%edx
801043bb:	74 16                	je     801043d3 <acquiresleep+0x33>
801043bd:	8d 76 00             	lea    0x0(%esi),%esi
    sleep(lk, &lk->lk);
801043c0:	83 ec 08             	sub    $0x8,%esp
801043c3:	56                   	push   %esi
801043c4:	53                   	push   %ebx
801043c5:	e8 c6 fa ff ff       	call   80103e90 <sleep>

void
acquiresleep(struct sleeplock *lk)
{
  acquire(&lk->lk);
  while (lk->locked) {
801043ca:	8b 03                	mov    (%ebx),%eax
801043cc:	83 c4 10             	add    $0x10,%esp
801043cf:	85 c0                	test   %eax,%eax
801043d1:	75 ed                	jne    801043c0 <acquiresleep+0x20>
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
801043d3:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  lk->pid = proc->pid;
801043d9:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801043df:	8b 40 10             	mov    0x10(%eax),%eax
801043e2:	89 43 3c             	mov    %eax,0x3c(%ebx)
  release(&lk->lk);
801043e5:	89 75 08             	mov    %esi,0x8(%ebp)
}
801043e8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043eb:	5b                   	pop    %ebx
801043ec:	5e                   	pop    %esi
801043ed:	5d                   	pop    %ebp
  while (lk->locked) {
    sleep(lk, &lk->lk);
  }
  lk->locked = 1;
  lk->pid = proc->pid;
  release(&lk->lk);
801043ee:	e9 7d 02 00 00       	jmp    80104670 <release>
801043f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801043f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104400 <releasesleep>:
}

void
releasesleep(struct sleeplock *lk)
{
80104400:	55                   	push   %ebp
80104401:	89 e5                	mov    %esp,%ebp
80104403:	56                   	push   %esi
80104404:	53                   	push   %ebx
80104405:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&lk->lk);
80104408:	83 ec 0c             	sub    $0xc,%esp
8010440b:	8d 73 04             	lea    0x4(%ebx),%esi
8010440e:	56                   	push   %esi
8010440f:	e8 7c 00 00 00       	call   80104490 <acquire>
  lk->locked = 0;
80104414:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  lk->pid = 0;
8010441a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
  wakeup(lk);
80104421:	89 1c 24             	mov    %ebx,(%esp)
80104424:	e8 17 fc ff ff       	call   80104040 <wakeup>
  release(&lk->lk);
80104429:	89 75 08             	mov    %esi,0x8(%ebp)
8010442c:	83 c4 10             	add    $0x10,%esp
}
8010442f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104432:	5b                   	pop    %ebx
80104433:	5e                   	pop    %esi
80104434:	5d                   	pop    %ebp
{
  acquire(&lk->lk);
  lk->locked = 0;
  lk->pid = 0;
  wakeup(lk);
  release(&lk->lk);
80104435:	e9 36 02 00 00       	jmp    80104670 <release>
8010443a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104440 <holdingsleep>:
}

int
holdingsleep(struct sleeplock *lk)
{
80104440:	55                   	push   %ebp
80104441:	89 e5                	mov    %esp,%ebp
80104443:	56                   	push   %esi
80104444:	53                   	push   %ebx
80104445:	8b 75 08             	mov    0x8(%ebp),%esi
  int r;
  
  acquire(&lk->lk);
80104448:	83 ec 0c             	sub    $0xc,%esp
8010444b:	8d 5e 04             	lea    0x4(%esi),%ebx
8010444e:	53                   	push   %ebx
8010444f:	e8 3c 00 00 00       	call   80104490 <acquire>
  r = lk->locked;
80104454:	8b 36                	mov    (%esi),%esi
  release(&lk->lk);
80104456:	89 1c 24             	mov    %ebx,(%esp)
80104459:	e8 12 02 00 00       	call   80104670 <release>
  return r;
}
8010445e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104461:	89 f0                	mov    %esi,%eax
80104463:	5b                   	pop    %ebx
80104464:	5e                   	pop    %esi
80104465:	5d                   	pop    %ebp
80104466:	c3                   	ret    
80104467:	66 90                	xchg   %ax,%ax
80104469:	66 90                	xchg   %ax,%ax
8010446b:	66 90                	xchg   %ax,%ax
8010446d:	66 90                	xchg   %ax,%ax
8010446f:	90                   	nop

80104470 <initlock>:
#include "proc.h"
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
80104470:	55                   	push   %ebp
80104471:	89 e5                	mov    %esp,%ebp
80104473:	8b 45 08             	mov    0x8(%ebp),%eax
  lk->name = name;
80104476:	8b 55 0c             	mov    0xc(%ebp),%edx
  lk->locked = 0;
80104479:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
#include "spinlock.h"

void
initlock(struct spinlock *lk, char *name)
{
  lk->name = name;
8010447f:	89 50 04             	mov    %edx,0x4(%eax)
  lk->locked = 0;
  lk->cpu = 0;
80104482:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
80104489:	5d                   	pop    %ebp
8010448a:	c3                   	ret    
8010448b:	90                   	nop
8010448c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104490 <acquire>:
// Loops (spins) until the lock is acquired.
// Holding a lock for a long time may cause
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
80104490:	55                   	push   %ebp
80104491:	89 e5                	mov    %esp,%ebp
80104493:	53                   	push   %ebx
80104494:	83 ec 04             	sub    $0x4,%esp
80104497:	9c                   	pushf  
80104498:	5a                   	pop    %edx
}

static inline void
cli(void)
{
  asm volatile("cli");
80104499:	fa                   	cli    
{
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
8010449a:	65 8b 0d 00 00 00 00 	mov    %gs:0x0,%ecx
801044a1:	8b 81 ac 00 00 00    	mov    0xac(%ecx),%eax
801044a7:	85 c0                	test   %eax,%eax
801044a9:	75 0c                	jne    801044b7 <acquire+0x27>
    cpu->intena = eflags & FL_IF;
801044ab:	81 e2 00 02 00 00    	and    $0x200,%edx
801044b1:	89 91 b0 00 00 00    	mov    %edx,0xb0(%ecx)
// other CPUs to waste time spinning to acquire it.
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
801044b7:	8b 55 08             	mov    0x8(%ebp),%edx

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
    cpu->intena = eflags & FL_IF;
  cpu->ncli += 1;
801044ba:	83 c0 01             	add    $0x1,%eax
801044bd:	89 81 ac 00 00 00    	mov    %eax,0xac(%ecx)

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
801044c3:	8b 02                	mov    (%edx),%eax
801044c5:	85 c0                	test   %eax,%eax
801044c7:	74 05                	je     801044ce <acquire+0x3e>
801044c9:	39 4a 08             	cmp    %ecx,0x8(%edx)
801044cc:	74 7a                	je     80104548 <acquire+0xb8>
xchg(volatile uint *addr, uint newval)
{
  uint result;

  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
801044ce:	b9 01 00 00 00       	mov    $0x1,%ecx
801044d3:	90                   	nop
801044d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801044d8:	89 c8                	mov    %ecx,%eax
801044da:	f0 87 02             	lock xchg %eax,(%edx)
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");

  // The xchg is atomic.
  while(xchg(&lk->locked, 1) != 0)
801044dd:	85 c0                	test   %eax,%eax
801044df:	75 f7                	jne    801044d8 <acquire+0x48>
    ;

  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();
801044e1:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
801044e6:	8b 4d 08             	mov    0x8(%ebp),%ecx
801044e9:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
getcallerpcs(void *v, uint pcs[])
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
801044ef:	89 ea                	mov    %ebp,%edx
  // past this point, to ensure that the critical section's memory
  // references happen after the lock is acquired.
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
801044f1:	89 41 08             	mov    %eax,0x8(%ecx)
  getcallerpcs(&lk, lk->pcs);
801044f4:	83 c1 0c             	add    $0xc,%ecx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
801044f7:	31 c0                	xor    %eax,%eax
801044f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104500:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104506:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010450c:	77 1a                	ja     80104528 <acquire+0x98>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010450e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104511:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104514:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104517:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104519:	83 f8 0a             	cmp    $0xa,%eax
8010451c:	75 e2                	jne    80104500 <acquire+0x70>
  __sync_synchronize();

  // Record info about lock acquisition for debugging.
  lk->cpu = cpu;
  getcallerpcs(&lk, lk->pcs);
}
8010451e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104521:	c9                   	leave  
80104522:	c3                   	ret    
80104523:	90                   	nop
80104524:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104528:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010452f:	83 c0 01             	add    $0x1,%eax
80104532:	83 f8 0a             	cmp    $0xa,%eax
80104535:	74 e7                	je     8010451e <acquire+0x8e>
    pcs[i] = 0;
80104537:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010453e:	83 c0 01             	add    $0x1,%eax
80104541:	83 f8 0a             	cmp    $0xa,%eax
80104544:	75 e2                	jne    80104528 <acquire+0x98>
80104546:	eb d6                	jmp    8010451e <acquire+0x8e>
void
acquire(struct spinlock *lk)
{
  pushcli(); // disable interrupts to avoid deadlock.
  if(holding(lk))
    panic("acquire");
80104548:	83 ec 0c             	sub    $0xc,%esp
8010454b:	68 87 7a 10 80       	push   $0x80107a87
80104550:	e8 1b be ff ff       	call   80100370 <panic>
80104555:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104560 <getcallerpcs>:
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104560:	55                   	push   %ebp
80104561:	89 e5                	mov    %esp,%ebp
80104563:	53                   	push   %ebx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
80104564:	8b 45 08             	mov    0x8(%ebp),%eax
}

// Record the current call stack in pcs[] by following the %ebp chain.
void
getcallerpcs(void *v, uint pcs[])
{
80104567:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
8010456a:	8d 50 f8             	lea    -0x8(%eax),%edx
  for(i = 0; i < 10; i++){
8010456d:	31 c0                	xor    %eax,%eax
8010456f:	90                   	nop
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
80104570:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104576:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010457c:	77 1a                	ja     80104598 <getcallerpcs+0x38>
      break;
    pcs[i] = ebp[1];     // saved %eip
8010457e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104581:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104584:	83 c0 01             	add    $0x1,%eax
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
80104587:	8b 12                	mov    (%edx),%edx
{
  uint *ebp;
  int i;

  ebp = (uint*)v - 2;
  for(i = 0; i < 10; i++){
80104589:	83 f8 0a             	cmp    $0xa,%eax
8010458c:	75 e2                	jne    80104570 <getcallerpcs+0x10>
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
}
8010458e:	5b                   	pop    %ebx
8010458f:	5d                   	pop    %ebp
80104590:	c3                   	ret    
80104591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
    pcs[i] = 0;
80104598:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
8010459f:	83 c0 01             	add    $0x1,%eax
801045a2:	83 f8 0a             	cmp    $0xa,%eax
801045a5:	74 e7                	je     8010458e <getcallerpcs+0x2e>
    pcs[i] = 0;
801045a7:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
    if(ebp == 0 || ebp < (uint*)KERNBASE || ebp == (uint*)0xffffffff)
      break;
    pcs[i] = ebp[1];     // saved %eip
    ebp = (uint*)ebp[0]; // saved %ebp
  }
  for(; i < 10; i++)
801045ae:	83 c0 01             	add    $0x1,%eax
801045b1:	83 f8 0a             	cmp    $0xa,%eax
801045b4:	75 e2                	jne    80104598 <getcallerpcs+0x38>
801045b6:	eb d6                	jmp    8010458e <getcallerpcs+0x2e>
801045b8:	90                   	nop
801045b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801045c0 <holding>:
}

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
801045c0:	55                   	push   %ebp
801045c1:	89 e5                	mov    %esp,%ebp
801045c3:	8b 55 08             	mov    0x8(%ebp),%edx
  return lock->locked && lock->cpu == cpu;
801045c6:	8b 02                	mov    (%edx),%eax
801045c8:	85 c0                	test   %eax,%eax
801045ca:	74 14                	je     801045e0 <holding+0x20>
801045cc:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
801045d2:	39 42 08             	cmp    %eax,0x8(%edx)
}
801045d5:	5d                   	pop    %ebp

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
801045d6:	0f 94 c0             	sete   %al
801045d9:	0f b6 c0             	movzbl %al,%eax
}
801045dc:	c3                   	ret    
801045dd:	8d 76 00             	lea    0x0(%esi),%esi
801045e0:	31 c0                	xor    %eax,%eax
801045e2:	5d                   	pop    %ebp
801045e3:	c3                   	ret    
801045e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801045ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801045f0 <pushcli>:
// it takes two popcli to undo two pushcli.  Also, if interrupts
// are off, then pushcli, popcli leaves them off.

void
pushcli(void)
{
801045f0:	55                   	push   %ebp
801045f1:	89 e5                	mov    %esp,%ebp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
801045f3:	9c                   	pushf  
801045f4:	59                   	pop    %ecx
}

static inline void
cli(void)
{
  asm volatile("cli");
801045f5:	fa                   	cli    
  int eflags;

  eflags = readeflags();
  cli();
  if(cpu->ncli == 0)
801045f6:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
801045fd:	8b 82 ac 00 00 00    	mov    0xac(%edx),%eax
80104603:	85 c0                	test   %eax,%eax
80104605:	75 0c                	jne    80104613 <pushcli+0x23>
    cpu->intena = eflags & FL_IF;
80104607:	81 e1 00 02 00 00    	and    $0x200,%ecx
8010460d:	89 8a b0 00 00 00    	mov    %ecx,0xb0(%edx)
  cpu->ncli += 1;
80104613:	83 c0 01             	add    $0x1,%eax
80104616:	89 82 ac 00 00 00    	mov    %eax,0xac(%edx)
}
8010461c:	5d                   	pop    %ebp
8010461d:	c3                   	ret    
8010461e:	66 90                	xchg   %ax,%ax

80104620 <popcli>:

void
popcli(void)
{
80104620:	55                   	push   %ebp
80104621:	89 e5                	mov    %esp,%ebp
80104623:	83 ec 08             	sub    $0x8,%esp

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80104626:	9c                   	pushf  
80104627:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80104628:	f6 c4 02             	test   $0x2,%ah
8010462b:	75 2c                	jne    80104659 <popcli+0x39>
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
8010462d:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104634:	83 aa ac 00 00 00 01 	subl   $0x1,0xac(%edx)
8010463b:	78 0f                	js     8010464c <popcli+0x2c>
    panic("popcli");
  if(cpu->ncli == 0 && cpu->intena)
8010463d:	75 0b                	jne    8010464a <popcli+0x2a>
8010463f:	8b 82 b0 00 00 00    	mov    0xb0(%edx),%eax
80104645:	85 c0                	test   %eax,%eax
80104647:	74 01                	je     8010464a <popcli+0x2a>
}

static inline void
sti(void)
{
  asm volatile("sti");
80104649:	fb                   	sti    
    sti();
}
8010464a:	c9                   	leave  
8010464b:	c3                   	ret    
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
  if(--cpu->ncli < 0)
    panic("popcli");
8010464c:	83 ec 0c             	sub    $0xc,%esp
8010464f:	68 a6 7a 10 80       	push   $0x80107aa6
80104654:	e8 17 bd ff ff       	call   80100370 <panic>

void
popcli(void)
{
  if(readeflags()&FL_IF)
    panic("popcli - interruptible");
80104659:	83 ec 0c             	sub    $0xc,%esp
8010465c:	68 8f 7a 10 80       	push   $0x80107a8f
80104661:	e8 0a bd ff ff       	call   80100370 <panic>
80104666:	8d 76 00             	lea    0x0(%esi),%esi
80104669:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104670 <release>:
}

// Release the lock.
void
release(struct spinlock *lk)
{
80104670:	55                   	push   %ebp
80104671:	89 e5                	mov    %esp,%ebp
80104673:	83 ec 08             	sub    $0x8,%esp
80104676:	8b 45 08             	mov    0x8(%ebp),%eax

// Check whether this cpu is holding the lock.
int
holding(struct spinlock *lock)
{
  return lock->locked && lock->cpu == cpu;
80104679:	8b 10                	mov    (%eax),%edx
8010467b:	85 d2                	test   %edx,%edx
8010467d:	74 0c                	je     8010468b <release+0x1b>
8010467f:	65 8b 15 00 00 00 00 	mov    %gs:0x0,%edx
80104686:	39 50 08             	cmp    %edx,0x8(%eax)
80104689:	74 15                	je     801046a0 <release+0x30>
// Release the lock.
void
release(struct spinlock *lk)
{
  if(!holding(lk))
    panic("release");
8010468b:	83 ec 0c             	sub    $0xc,%esp
8010468e:	68 ad 7a 10 80       	push   $0x80107aad
80104693:	e8 d8 bc ff ff       	call   80100370 <panic>
80104698:	90                   	nop
80104699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  lk->pcs[0] = 0;
801046a0:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
  lk->cpu = 0;
801046a7:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  // Tell the C compiler and the processor to not move loads or stores
  // past this point, to ensure that all the stores in the critical
  // section are visible to other cores before the lock is released.
  // Both the C compiler and the hardware may re-order loads and
  // stores; __sync_synchronize() tells them both not to.
  __sync_synchronize();
801046ae:	f0 83 0c 24 00       	lock orl $0x0,(%esp)

  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );
801046b3:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  popcli();
}
801046b9:	c9                   	leave  
  // Release the lock, equivalent to lk->locked = 0.
  // This code can't use a C assignment, since it might
  // not be atomic. A real OS would use C atomics here.
  asm volatile("movl $0, %0" : "+m" (lk->locked) : );

  popcli();
801046ba:	e9 61 ff ff ff       	jmp    80104620 <popcli>
801046bf:	90                   	nop

801046c0 <memset>:
#include "types.h"
#include "x86.h"

void*
memset(void *dst, int c, uint n)
{
801046c0:	55                   	push   %ebp
801046c1:	89 e5                	mov    %esp,%ebp
801046c3:	57                   	push   %edi
801046c4:	53                   	push   %ebx
801046c5:	8b 55 08             	mov    0x8(%ebp),%edx
801046c8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  if ((int)dst%4 == 0 && n%4 == 0){
801046cb:	f6 c2 03             	test   $0x3,%dl
801046ce:	75 05                	jne    801046d5 <memset+0x15>
801046d0:	f6 c1 03             	test   $0x3,%cl
801046d3:	74 13                	je     801046e8 <memset+0x28>
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
801046d5:	89 d7                	mov    %edx,%edi
801046d7:	8b 45 0c             	mov    0xc(%ebp),%eax
801046da:	fc                   	cld    
801046db:	f3 aa                	rep stos %al,%es:(%edi)
    c &= 0xFF;
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
801046dd:	5b                   	pop    %ebx
801046de:	89 d0                	mov    %edx,%eax
801046e0:	5f                   	pop    %edi
801046e1:	5d                   	pop    %ebp
801046e2:	c3                   	ret    
801046e3:	90                   	nop
801046e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

void*
memset(void *dst, int c, uint n)
{
  if ((int)dst%4 == 0 && n%4 == 0){
    c &= 0xFF;
801046e8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
}

static inline void
stosl(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosl" :
801046ec:	c1 e9 02             	shr    $0x2,%ecx
801046ef:	89 fb                	mov    %edi,%ebx
801046f1:	89 f8                	mov    %edi,%eax
801046f3:	c1 e3 18             	shl    $0x18,%ebx
801046f6:	c1 e0 10             	shl    $0x10,%eax
801046f9:	09 d8                	or     %ebx,%eax
801046fb:	09 f8                	or     %edi,%eax
801046fd:	c1 e7 08             	shl    $0x8,%edi
80104700:	09 f8                	or     %edi,%eax
80104702:	89 d7                	mov    %edx,%edi
80104704:	fc                   	cld    
80104705:	f3 ab                	rep stos %eax,%es:(%edi)
    stosl(dst, (c<<24)|(c<<16)|(c<<8)|c, n/4);
  } else
    stosb(dst, c, n);
  return dst;
}
80104707:	5b                   	pop    %ebx
80104708:	89 d0                	mov    %edx,%eax
8010470a:	5f                   	pop    %edi
8010470b:	5d                   	pop    %ebp
8010470c:	c3                   	ret    
8010470d:	8d 76 00             	lea    0x0(%esi),%esi

80104710 <memcmp>:

int
memcmp(const void *v1, const void *v2, uint n)
{
80104710:	55                   	push   %ebp
80104711:	89 e5                	mov    %esp,%ebp
80104713:	57                   	push   %edi
80104714:	56                   	push   %esi
80104715:	8b 45 10             	mov    0x10(%ebp),%eax
80104718:	53                   	push   %ebx
80104719:	8b 75 0c             	mov    0xc(%ebp),%esi
8010471c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
8010471f:	85 c0                	test   %eax,%eax
80104721:	74 29                	je     8010474c <memcmp+0x3c>
    if(*s1 != *s2)
80104723:	0f b6 13             	movzbl (%ebx),%edx
80104726:	0f b6 0e             	movzbl (%esi),%ecx
80104729:	38 d1                	cmp    %dl,%cl
8010472b:	75 2b                	jne    80104758 <memcmp+0x48>
8010472d:	8d 78 ff             	lea    -0x1(%eax),%edi
80104730:	31 c0                	xor    %eax,%eax
80104732:	eb 14                	jmp    80104748 <memcmp+0x38>
80104734:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104738:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
8010473d:	83 c0 01             	add    $0x1,%eax
80104740:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104744:	38 ca                	cmp    %cl,%dl
80104746:	75 10                	jne    80104758 <memcmp+0x48>
{
  const uchar *s1, *s2;

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
80104748:	39 f8                	cmp    %edi,%eax
8010474a:	75 ec                	jne    80104738 <memcmp+0x28>
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
}
8010474c:	5b                   	pop    %ebx
    if(*s1 != *s2)
      return *s1 - *s2;
    s1++, s2++;
  }

  return 0;
8010474d:	31 c0                	xor    %eax,%eax
}
8010474f:	5e                   	pop    %esi
80104750:	5f                   	pop    %edi
80104751:	5d                   	pop    %ebp
80104752:	c3                   	ret    
80104753:	90                   	nop
80104754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
80104758:	0f b6 c2             	movzbl %dl,%eax
    s1++, s2++;
  }

  return 0;
}
8010475b:	5b                   	pop    %ebx

  s1 = v1;
  s2 = v2;
  while(n-- > 0){
    if(*s1 != *s2)
      return *s1 - *s2;
8010475c:	29 c8                	sub    %ecx,%eax
    s1++, s2++;
  }

  return 0;
}
8010475e:	5e                   	pop    %esi
8010475f:	5f                   	pop    %edi
80104760:	5d                   	pop    %ebp
80104761:	c3                   	ret    
80104762:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104770 <memmove>:

void*
memmove(void *dst, const void *src, uint n)
{
80104770:	55                   	push   %ebp
80104771:	89 e5                	mov    %esp,%ebp
80104773:	56                   	push   %esi
80104774:	53                   	push   %ebx
80104775:	8b 45 08             	mov    0x8(%ebp),%eax
80104778:	8b 75 0c             	mov    0xc(%ebp),%esi
8010477b:	8b 5d 10             	mov    0x10(%ebp),%ebx
  const char *s;
  char *d;

  s = src;
  d = dst;
  if(s < d && s + n > d){
8010477e:	39 c6                	cmp    %eax,%esi
80104780:	73 2e                	jae    801047b0 <memmove+0x40>
80104782:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104785:	39 c8                	cmp    %ecx,%eax
80104787:	73 27                	jae    801047b0 <memmove+0x40>
    s += n;
    d += n;
    while(n-- > 0)
80104789:	85 db                	test   %ebx,%ebx
8010478b:	8d 53 ff             	lea    -0x1(%ebx),%edx
8010478e:	74 17                	je     801047a7 <memmove+0x37>
      *--d = *--s;
80104790:	29 d9                	sub    %ebx,%ecx
80104792:	89 cb                	mov    %ecx,%ebx
80104794:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104798:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
8010479c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  s = src;
  d = dst;
  if(s < d && s + n > d){
    s += n;
    d += n;
    while(n-- > 0)
8010479f:	83 ea 01             	sub    $0x1,%edx
801047a2:	83 fa ff             	cmp    $0xffffffff,%edx
801047a5:	75 f1                	jne    80104798 <memmove+0x28>
  } else
    while(n-- > 0)
      *d++ = *s++;

  return dst;
}
801047a7:	5b                   	pop    %ebx
801047a8:	5e                   	pop    %esi
801047a9:	5d                   	pop    %ebp
801047aa:	c3                   	ret    
801047ab:	90                   	nop
801047ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
801047b0:	31 d2                	xor    %edx,%edx
801047b2:	85 db                	test   %ebx,%ebx
801047b4:	74 f1                	je     801047a7 <memmove+0x37>
801047b6:	8d 76 00             	lea    0x0(%esi),%esi
801047b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      *d++ = *s++;
801047c0:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
801047c4:	88 0c 10             	mov    %cl,(%eax,%edx,1)
801047c7:	83 c2 01             	add    $0x1,%edx
    s += n;
    d += n;
    while(n-- > 0)
      *--d = *--s;
  } else
    while(n-- > 0)
801047ca:	39 d3                	cmp    %edx,%ebx
801047cc:	75 f2                	jne    801047c0 <memmove+0x50>
      *d++ = *s++;

  return dst;
}
801047ce:	5b                   	pop    %ebx
801047cf:	5e                   	pop    %esi
801047d0:	5d                   	pop    %ebp
801047d1:	c3                   	ret    
801047d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801047d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047e0 <memcpy>:

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
801047e0:	55                   	push   %ebp
801047e1:	89 e5                	mov    %esp,%ebp
  return memmove(dst, src, n);
}
801047e3:	5d                   	pop    %ebp

// memcpy exists to placate GCC.  Use memmove.
void*
memcpy(void *dst, const void *src, uint n)
{
  return memmove(dst, src, n);
801047e4:	eb 8a                	jmp    80104770 <memmove>
801047e6:	8d 76 00             	lea    0x0(%esi),%esi
801047e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801047f0 <strncmp>:
}

int
strncmp(const char *p, const char *q, uint n)
{
801047f0:	55                   	push   %ebp
801047f1:	89 e5                	mov    %esp,%ebp
801047f3:	57                   	push   %edi
801047f4:	56                   	push   %esi
801047f5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801047f8:	53                   	push   %ebx
801047f9:	8b 7d 08             	mov    0x8(%ebp),%edi
801047fc:	8b 75 0c             	mov    0xc(%ebp),%esi
  while(n > 0 && *p && *p == *q)
801047ff:	85 c9                	test   %ecx,%ecx
80104801:	74 37                	je     8010483a <strncmp+0x4a>
80104803:	0f b6 17             	movzbl (%edi),%edx
80104806:	0f b6 1e             	movzbl (%esi),%ebx
80104809:	84 d2                	test   %dl,%dl
8010480b:	74 3f                	je     8010484c <strncmp+0x5c>
8010480d:	38 d3                	cmp    %dl,%bl
8010480f:	75 3b                	jne    8010484c <strncmp+0x5c>
80104811:	8d 47 01             	lea    0x1(%edi),%eax
80104814:	01 cf                	add    %ecx,%edi
80104816:	eb 1b                	jmp    80104833 <strncmp+0x43>
80104818:	90                   	nop
80104819:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104820:	0f b6 10             	movzbl (%eax),%edx
80104823:	84 d2                	test   %dl,%dl
80104825:	74 21                	je     80104848 <strncmp+0x58>
80104827:	0f b6 19             	movzbl (%ecx),%ebx
8010482a:	83 c0 01             	add    $0x1,%eax
8010482d:	89 ce                	mov    %ecx,%esi
8010482f:	38 da                	cmp    %bl,%dl
80104831:	75 19                	jne    8010484c <strncmp+0x5c>
80104833:	39 c7                	cmp    %eax,%edi
    n--, p++, q++;
80104835:	8d 4e 01             	lea    0x1(%esi),%ecx
}

int
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
80104838:	75 e6                	jne    80104820 <strncmp+0x30>
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
}
8010483a:	5b                   	pop    %ebx
strncmp(const char *p, const char *q, uint n)
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
8010483b:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
}
8010483d:	5e                   	pop    %esi
8010483e:	5f                   	pop    %edi
8010483f:	5d                   	pop    %ebp
80104840:	c3                   	ret    
80104841:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104848:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
{
  while(n > 0 && *p && *p == *q)
    n--, p++, q++;
  if(n == 0)
    return 0;
  return (uchar)*p - (uchar)*q;
8010484c:	0f b6 c2             	movzbl %dl,%eax
8010484f:	29 d8                	sub    %ebx,%eax
}
80104851:	5b                   	pop    %ebx
80104852:	5e                   	pop    %esi
80104853:	5f                   	pop    %edi
80104854:	5d                   	pop    %ebp
80104855:	c3                   	ret    
80104856:	8d 76 00             	lea    0x0(%esi),%esi
80104859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104860 <strncpy>:

char*
strncpy(char *s, const char *t, int n)
{
80104860:	55                   	push   %ebp
80104861:	89 e5                	mov    %esp,%ebp
80104863:	56                   	push   %esi
80104864:	53                   	push   %ebx
80104865:	8b 45 08             	mov    0x8(%ebp),%eax
80104868:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010486b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
8010486e:	89 c2                	mov    %eax,%edx
80104870:	eb 19                	jmp    8010488b <strncpy+0x2b>
80104872:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104878:	83 c3 01             	add    $0x1,%ebx
8010487b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010487f:	83 c2 01             	add    $0x1,%edx
80104882:	84 c9                	test   %cl,%cl
80104884:	88 4a ff             	mov    %cl,-0x1(%edx)
80104887:	74 09                	je     80104892 <strncpy+0x32>
80104889:	89 f1                	mov    %esi,%ecx
8010488b:	85 c9                	test   %ecx,%ecx
8010488d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104890:	7f e6                	jg     80104878 <strncpy+0x18>
    ;
  while(n-- > 0)
80104892:	31 c9                	xor    %ecx,%ecx
80104894:	85 f6                	test   %esi,%esi
80104896:	7e 17                	jle    801048af <strncpy+0x4f>
80104898:	90                   	nop
80104899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    *s++ = 0;
801048a0:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
801048a4:	89 f3                	mov    %esi,%ebx
801048a6:	83 c1 01             	add    $0x1,%ecx
801048a9:	29 cb                	sub    %ecx,%ebx
  char *os;

  os = s;
  while(n-- > 0 && (*s++ = *t++) != 0)
    ;
  while(n-- > 0)
801048ab:	85 db                	test   %ebx,%ebx
801048ad:	7f f1                	jg     801048a0 <strncpy+0x40>
    *s++ = 0;
  return os;
}
801048af:	5b                   	pop    %ebx
801048b0:	5e                   	pop    %esi
801048b1:	5d                   	pop    %ebp
801048b2:	c3                   	ret    
801048b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048c0 <safestrcpy>:

// Like strncpy but guaranteed to NUL-terminate.
char*
safestrcpy(char *s, const char *t, int n)
{
801048c0:	55                   	push   %ebp
801048c1:	89 e5                	mov    %esp,%ebp
801048c3:	56                   	push   %esi
801048c4:	53                   	push   %ebx
801048c5:	8b 4d 10             	mov    0x10(%ebp),%ecx
801048c8:	8b 45 08             	mov    0x8(%ebp),%eax
801048cb:	8b 55 0c             	mov    0xc(%ebp),%edx
  char *os;

  os = s;
  if(n <= 0)
801048ce:	85 c9                	test   %ecx,%ecx
801048d0:	7e 26                	jle    801048f8 <safestrcpy+0x38>
801048d2:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
801048d6:	89 c1                	mov    %eax,%ecx
801048d8:	eb 17                	jmp    801048f1 <safestrcpy+0x31>
801048da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return os;
  while(--n > 0 && (*s++ = *t++) != 0)
801048e0:	83 c2 01             	add    $0x1,%edx
801048e3:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
801048e7:	83 c1 01             	add    $0x1,%ecx
801048ea:	84 db                	test   %bl,%bl
801048ec:	88 59 ff             	mov    %bl,-0x1(%ecx)
801048ef:	74 04                	je     801048f5 <safestrcpy+0x35>
801048f1:	39 f2                	cmp    %esi,%edx
801048f3:	75 eb                	jne    801048e0 <safestrcpy+0x20>
    ;
  *s = 0;
801048f5:	c6 01 00             	movb   $0x0,(%ecx)
  return os;
}
801048f8:	5b                   	pop    %ebx
801048f9:	5e                   	pop    %esi
801048fa:	5d                   	pop    %ebp
801048fb:	c3                   	ret    
801048fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104900 <strlen>:

int
strlen(const char *s)
{
80104900:	55                   	push   %ebp
  int n;

  for(n = 0; s[n]; n++)
80104901:	31 c0                	xor    %eax,%eax
  return os;
}

int
strlen(const char *s)
{
80104903:	89 e5                	mov    %esp,%ebp
80104905:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
80104908:	80 3a 00             	cmpb   $0x0,(%edx)
8010490b:	74 0c                	je     80104919 <strlen+0x19>
8010490d:	8d 76 00             	lea    0x0(%esi),%esi
80104910:	83 c0 01             	add    $0x1,%eax
80104913:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104917:	75 f7                	jne    80104910 <strlen+0x10>
    ;
  return n;
}
80104919:	5d                   	pop    %ebp
8010491a:	c3                   	ret    

8010491b <swtch>:
# Save current register context in old
# and then load register context from new.

.globl swtch
swtch:
  movl 4(%esp), %eax
8010491b:	8b 44 24 04          	mov    0x4(%esp),%eax
  movl 8(%esp), %edx
8010491f:	8b 54 24 08          	mov    0x8(%esp),%edx

  # Save old callee-save registers
  pushl %ebp
80104923:	55                   	push   %ebp
  pushl %ebx
80104924:	53                   	push   %ebx
  pushl %esi
80104925:	56                   	push   %esi
  pushl %edi
80104926:	57                   	push   %edi

  # Switch stacks
  movl %esp, (%eax)
80104927:	89 20                	mov    %esp,(%eax)
  movl %edx, %esp
80104929:	89 d4                	mov    %edx,%esp

  # Load new callee-save registers
  popl %edi
8010492b:	5f                   	pop    %edi
  popl %esi
8010492c:	5e                   	pop    %esi
  popl %ebx
8010492d:	5b                   	pop    %ebx
  popl %ebp
8010492e:	5d                   	pop    %ebp
  ret
8010492f:	c3                   	ret    

80104930 <fetchint>:
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104930:	55                   	push   %ebp
  if(addr >= proc->sz || addr+4 > proc->sz)
80104931:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// to a saved program counter, and then the first argument.

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
80104938:	89 e5                	mov    %esp,%ebp
8010493a:	8b 45 08             	mov    0x8(%ebp),%eax
  if(addr >= proc->sz || addr+4 > proc->sz)
8010493d:	8b 12                	mov    (%edx),%edx
8010493f:	39 c2                	cmp    %eax,%edx
80104941:	76 15                	jbe    80104958 <fetchint+0x28>
80104943:	8d 48 04             	lea    0x4(%eax),%ecx
80104946:	39 ca                	cmp    %ecx,%edx
80104948:	72 0e                	jb     80104958 <fetchint+0x28>
    return -1;
  *ip = *(int*)(addr);
8010494a:	8b 10                	mov    (%eax),%edx
8010494c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010494f:	89 10                	mov    %edx,(%eax)
  return 0;
80104951:	31 c0                	xor    %eax,%eax
}
80104953:	5d                   	pop    %ebp
80104954:	c3                   	ret    
80104955:	8d 76 00             	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
80104958:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  *ip = *(int*)(addr);
  return 0;
}
8010495d:	5d                   	pop    %ebp
8010495e:	c3                   	ret    
8010495f:	90                   	nop

80104960 <fetchstr>:
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104960:	55                   	push   %ebp
  char *s, *ep;

  if(addr >= proc->sz)
80104961:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nul-terminated string at addr from the current process.
// Doesn't actually copy the string - just sets *pp to point at it.
// Returns length of string, not including nul.
int
fetchstr(uint addr, char **pp)
{
80104967:	89 e5                	mov    %esp,%ebp
80104969:	8b 4d 08             	mov    0x8(%ebp),%ecx
  char *s, *ep;

  if(addr >= proc->sz)
8010496c:	39 08                	cmp    %ecx,(%eax)
8010496e:	76 2c                	jbe    8010499c <fetchstr+0x3c>
    return -1;
  *pp = (char*)addr;
80104970:	8b 55 0c             	mov    0xc(%ebp),%edx
80104973:	89 c8                	mov    %ecx,%eax
80104975:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
80104977:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
8010497e:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104980:	39 d1                	cmp    %edx,%ecx
80104982:	73 18                	jae    8010499c <fetchstr+0x3c>
    if(*s == 0)
80104984:	80 39 00             	cmpb   $0x0,(%ecx)
80104987:	75 0c                	jne    80104995 <fetchstr+0x35>
80104989:	eb 1d                	jmp    801049a8 <fetchstr+0x48>
8010498b:	90                   	nop
8010498c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104990:	80 38 00             	cmpb   $0x0,(%eax)
80104993:	74 13                	je     801049a8 <fetchstr+0x48>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104995:	83 c0 01             	add    $0x1,%eax
80104998:	39 c2                	cmp    %eax,%edx
8010499a:	77 f4                	ja     80104990 <fetchstr+0x30>
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
    return -1;
8010499c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
  return -1;
}
801049a1:	5d                   	pop    %ebp
801049a2:	c3                   	ret    
801049a3:	90                   	nop
801049a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
    if(*s == 0)
      return s - *pp;
801049a8:	29 c8                	sub    %ecx,%eax
  return -1;
}
801049aa:	5d                   	pop    %ebp
801049ab:	c3                   	ret    
801049ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801049b0 <argint>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801049b0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
}

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
801049b7:	55                   	push   %ebp
801049b8:	89 e5                	mov    %esp,%ebp
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801049ba:	8b 42 18             	mov    0x18(%edx),%eax
801049bd:	8b 4d 08             	mov    0x8(%ebp),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801049c0:	8b 12                	mov    (%edx),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801049c2:	8b 40 44             	mov    0x44(%eax),%eax
801049c5:	8d 04 88             	lea    (%eax,%ecx,4),%eax
801049c8:	8d 48 04             	lea    0x4(%eax),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
801049cb:	39 d1                	cmp    %edx,%ecx
801049cd:	73 19                	jae    801049e8 <argint+0x38>
801049cf:	8d 48 08             	lea    0x8(%eax),%ecx
801049d2:	39 ca                	cmp    %ecx,%edx
801049d4:	72 12                	jb     801049e8 <argint+0x38>
    return -1;
  *ip = *(int*)(addr);
801049d6:	8b 50 04             	mov    0x4(%eax),%edx
801049d9:	8b 45 0c             	mov    0xc(%ebp),%eax
801049dc:	89 10                	mov    %edx,(%eax)
  return 0;
801049de:	31 c0                	xor    %eax,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
801049e0:	5d                   	pop    %ebp
801049e1:	c3                   	ret    
801049e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
801049e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
}
801049ed:	5d                   	pop    %ebp
801049ee:	c3                   	ret    
801049ef:	90                   	nop

801049f0 <argptr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801049f0:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
801049f6:	55                   	push   %ebp
801049f7:	89 e5                	mov    %esp,%ebp
801049f9:	56                   	push   %esi
801049fa:	53                   	push   %ebx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
801049fb:	8b 48 18             	mov    0x18(%eax),%ecx
801049fe:	8b 5d 08             	mov    0x8(%ebp),%ebx
// Fetch the nth word-sized system call argument as a pointer
// to a block of memory of size bytes.  Check that the pointer
// lies within the process address space.
int
argptr(int n, char **pp, int size)
{
80104a01:	8b 55 10             	mov    0x10(%ebp),%edx

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a04:	8b 49 44             	mov    0x44(%ecx),%ecx
80104a07:	8d 1c 99             	lea    (%ecx,%ebx,4),%ebx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a0a:	8b 08                	mov    (%eax),%ecx
argptr(int n, char **pp, int size)
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
80104a0c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a11:	8d 73 04             	lea    0x4(%ebx),%esi

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a14:	39 ce                	cmp    %ecx,%esi
80104a16:	73 1f                	jae    80104a37 <argptr+0x47>
80104a18:	8d 73 08             	lea    0x8(%ebx),%esi
80104a1b:	39 f1                	cmp    %esi,%ecx
80104a1d:	72 18                	jb     80104a37 <argptr+0x47>
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
80104a1f:	85 d2                	test   %edx,%edx
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
80104a21:	8b 5b 04             	mov    0x4(%ebx),%ebx
{
  int i;

  if(argint(n, &i) < 0)
    return -1;
  if(size < 0 || (uint)i >= proc->sz || (uint)i+size > proc->sz)
80104a24:	78 11                	js     80104a37 <argptr+0x47>
80104a26:	39 cb                	cmp    %ecx,%ebx
80104a28:	73 0d                	jae    80104a37 <argptr+0x47>
80104a2a:	01 da                	add    %ebx,%edx
80104a2c:	39 ca                	cmp    %ecx,%edx
80104a2e:	77 07                	ja     80104a37 <argptr+0x47>
    return -1;
  *pp = (char*)i;
80104a30:	8b 45 0c             	mov    0xc(%ebp),%eax
80104a33:	89 18                	mov    %ebx,(%eax)
  return 0;
80104a35:	31 c0                	xor    %eax,%eax
}
80104a37:	5b                   	pop    %ebx
80104a38:	5e                   	pop    %esi
80104a39:	5d                   	pop    %ebp
80104a3a:	c3                   	ret    
80104a3b:	90                   	nop
80104a3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104a40 <argstr>:

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a40:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
// Check that the pointer is valid and the string is nul-terminated.
// (There is no shared writable memory, so the string can't change
// between this check and being used by the kernel.)
int
argstr(int n, char **pp)
{
80104a46:	55                   	push   %ebp
80104a47:	89 e5                	mov    %esp,%ebp

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a49:	8b 50 18             	mov    0x18(%eax),%edx
80104a4c:	8b 4d 08             	mov    0x8(%ebp),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a4f:	8b 00                	mov    (%eax),%eax

// Fetch the nth 32-bit system call argument.
int
argint(int n, int *ip)
{
  return fetchint(proc->tf->esp + 4 + 4*n, ip);
80104a51:	8b 52 44             	mov    0x44(%edx),%edx
80104a54:	8d 14 8a             	lea    (%edx,%ecx,4),%edx
80104a57:	8d 4a 04             	lea    0x4(%edx),%ecx

// Fetch the int at addr from the current process.
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
80104a5a:	39 c1                	cmp    %eax,%ecx
80104a5c:	73 07                	jae    80104a65 <argstr+0x25>
80104a5e:	8d 4a 08             	lea    0x8(%edx),%ecx
80104a61:	39 c8                	cmp    %ecx,%eax
80104a63:	73 0b                	jae    80104a70 <argstr+0x30>
int
argstr(int n, char **pp)
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
80104a65:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fetchstr(addr, pp);
}
80104a6a:	5d                   	pop    %ebp
80104a6b:	c3                   	ret    
80104a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
int
fetchint(uint addr, int *ip)
{
  if(addr >= proc->sz || addr+4 > proc->sz)
    return -1;
  *ip = *(int*)(addr);
80104a70:	8b 4a 04             	mov    0x4(%edx),%ecx
int
fetchstr(uint addr, char **pp)
{
  char *s, *ep;

  if(addr >= proc->sz)
80104a73:	39 c1                	cmp    %eax,%ecx
80104a75:	73 ee                	jae    80104a65 <argstr+0x25>
    return -1;
  *pp = (char*)addr;
80104a77:	8b 55 0c             	mov    0xc(%ebp),%edx
80104a7a:	89 c8                	mov    %ecx,%eax
80104a7c:	89 0a                	mov    %ecx,(%edx)
  ep = (char*)proc->sz;
80104a7e:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104a85:	8b 12                	mov    (%edx),%edx
  for(s = *pp; s < ep; s++)
80104a87:	39 d1                	cmp    %edx,%ecx
80104a89:	73 da                	jae    80104a65 <argstr+0x25>
    if(*s == 0)
80104a8b:	80 39 00             	cmpb   $0x0,(%ecx)
80104a8e:	75 0d                	jne    80104a9d <argstr+0x5d>
80104a90:	eb 1e                	jmp    80104ab0 <argstr+0x70>
80104a92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a98:	80 38 00             	cmpb   $0x0,(%eax)
80104a9b:	74 13                	je     80104ab0 <argstr+0x70>

  if(addr >= proc->sz)
    return -1;
  *pp = (char*)addr;
  ep = (char*)proc->sz;
  for(s = *pp; s < ep; s++)
80104a9d:	83 c0 01             	add    $0x1,%eax
80104aa0:	39 c2                	cmp    %eax,%edx
80104aa2:	77 f4                	ja     80104a98 <argstr+0x58>
80104aa4:	eb bf                	jmp    80104a65 <argstr+0x25>
80104aa6:	8d 76 00             	lea    0x0(%esi),%esi
80104aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(*s == 0)
      return s - *pp;
80104ab0:	29 c8                	sub    %ecx,%eax
{
  int addr;
  if(argint(n, &addr) < 0)
    return -1;
  return fetchstr(addr, pp);
}
80104ab2:	5d                   	pop    %ebp
80104ab3:	c3                   	ret    
80104ab4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104aba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104ac0 <syscall>:
/*--------------------------------------------------------*/
};

void
syscall(void)
{
80104ac0:	55                   	push   %ebp
80104ac1:	89 e5                	mov    %esp,%ebp
80104ac3:	53                   	push   %ebx
80104ac4:	83 ec 04             	sub    $0x4,%esp
  int num;

  num = proc->tf->eax;
80104ac7:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104ace:	8b 5a 18             	mov    0x18(%edx),%ebx
80104ad1:	8b 43 1c             	mov    0x1c(%ebx),%eax
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
80104ad4:	8d 48 ff             	lea    -0x1(%eax),%ecx
80104ad7:	83 f9 18             	cmp    $0x18,%ecx
80104ada:	77 1c                	ja     80104af8 <syscall+0x38>
80104adc:	8b 0c 85 e0 7a 10 80 	mov    -0x7fef8520(,%eax,4),%ecx
80104ae3:	85 c9                	test   %ecx,%ecx
80104ae5:	74 11                	je     80104af8 <syscall+0x38>
    proc->tf->eax = syscalls[num]();
80104ae7:	ff d1                	call   *%ecx
80104ae9:	89 43 1c             	mov    %eax,0x1c(%ebx)
  } else {
    cprintf("%d %s: unknown sys call %d\n",
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
  }
}
80104aec:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104aef:	c9                   	leave  
80104af0:	c3                   	ret    
80104af1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104af8:	50                   	push   %eax
            proc->pid, proc->name, num);
80104af9:	8d 42 6c             	lea    0x6c(%edx),%eax

  num = proc->tf->eax;
  if(num > 0 && num < NELEM(syscalls) && syscalls[num]) {
    proc->tf->eax = syscalls[num]();
  } else {
    cprintf("%d %s: unknown sys call %d\n",
80104afc:	50                   	push   %eax
80104afd:	ff 72 10             	pushl  0x10(%edx)
80104b00:	68 b5 7a 10 80       	push   $0x80107ab5
80104b05:	e8 56 bb ff ff       	call   80100660 <cprintf>
            proc->pid, proc->name, num);
    proc->tf->eax = -1;
80104b0a:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80104b10:	83 c4 10             	add    $0x10,%esp
80104b13:	8b 40 18             	mov    0x18(%eax),%eax
80104b16:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
  }
}
80104b1d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104b20:	c9                   	leave  
80104b21:	c3                   	ret    
80104b22:	66 90                	xchg   %ax,%ax
80104b24:	66 90                	xchg   %ax,%ax
80104b26:	66 90                	xchg   %ax,%ax
80104b28:	66 90                	xchg   %ax,%ax
80104b2a:	66 90                	xchg   %ax,%ax
80104b2c:	66 90                	xchg   %ax,%ax
80104b2e:	66 90                	xchg   %ax,%ax

80104b30 <create>:
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104b30:	55                   	push   %ebp
80104b31:	89 e5                	mov    %esp,%ebp
80104b33:	57                   	push   %edi
80104b34:	56                   	push   %esi
80104b35:	53                   	push   %ebx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104b36:	8d 75 da             	lea    -0x26(%ebp),%esi
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104b39:	83 ec 44             	sub    $0x44,%esp
80104b3c:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104b3f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104b42:	56                   	push   %esi
80104b43:	50                   	push   %eax
  return -1;
}

static struct inode*
create(char *path, short type, short major, short minor)
{
80104b44:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104b47:	89 4d bc             	mov    %ecx,-0x44(%ebp)
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
80104b4a:	e8 a1 d3 ff ff       	call   80101ef0 <nameiparent>
80104b4f:	83 c4 10             	add    $0x10,%esp
80104b52:	85 c0                	test   %eax,%eax
80104b54:	0f 84 f6 00 00 00    	je     80104c50 <create+0x120>
    return 0;
  ilock(dp);
80104b5a:	83 ec 0c             	sub    $0xc,%esp
80104b5d:	89 c7                	mov    %eax,%edi
80104b5f:	50                   	push   %eax
80104b60:	e8 3b cb ff ff       	call   801016a0 <ilock>

  if((ip = dirlookup(dp, name, &off)) != 0){
80104b65:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104b68:	83 c4 0c             	add    $0xc,%esp
80104b6b:	50                   	push   %eax
80104b6c:	56                   	push   %esi
80104b6d:	57                   	push   %edi
80104b6e:	e8 3d d0 ff ff       	call   80101bb0 <dirlookup>
80104b73:	83 c4 10             	add    $0x10,%esp
80104b76:	85 c0                	test   %eax,%eax
80104b78:	89 c3                	mov    %eax,%ebx
80104b7a:	74 54                	je     80104bd0 <create+0xa0>
    iunlockput(dp);
80104b7c:	83 ec 0c             	sub    $0xc,%esp
80104b7f:	57                   	push   %edi
80104b80:	e8 8b cd ff ff       	call   80101910 <iunlockput>
    ilock(ip);
80104b85:	89 1c 24             	mov    %ebx,(%esp)
80104b88:	e8 13 cb ff ff       	call   801016a0 <ilock>
    if(type == T_FILE && ip->type == T_FILE)
80104b8d:	83 c4 10             	add    $0x10,%esp
80104b90:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104b95:	75 19                	jne    80104bb0 <create+0x80>
80104b97:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
80104b9c:	89 d8                	mov    %ebx,%eax
80104b9e:	75 10                	jne    80104bb0 <create+0x80>
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104ba0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104ba3:	5b                   	pop    %ebx
80104ba4:	5e                   	pop    %esi
80104ba5:	5f                   	pop    %edi
80104ba6:	5d                   	pop    %ebp
80104ba7:	c3                   	ret    
80104ba8:	90                   	nop
80104ba9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if((ip = dirlookup(dp, name, &off)) != 0){
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
80104bb0:	83 ec 0c             	sub    $0xc,%esp
80104bb3:	53                   	push   %ebx
80104bb4:	e8 57 cd ff ff       	call   80101910 <iunlockput>
    return 0;
80104bb9:	83 c4 10             	add    $0x10,%esp
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104bbc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    iunlockput(dp);
    ilock(ip);
    if(type == T_FILE && ip->type == T_FILE)
      return ip;
    iunlockput(ip);
    return 0;
80104bbf:	31 c0                	xor    %eax,%eax
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
}
80104bc1:	5b                   	pop    %ebx
80104bc2:	5e                   	pop    %esi
80104bc3:	5f                   	pop    %edi
80104bc4:	5d                   	pop    %ebp
80104bc5:	c3                   	ret    
80104bc6:	8d 76 00             	lea    0x0(%esi),%esi
80104bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      return ip;
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
80104bd0:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104bd4:	83 ec 08             	sub    $0x8,%esp
80104bd7:	50                   	push   %eax
80104bd8:	ff 37                	pushl  (%edi)
80104bda:	e8 51 c9 ff ff       	call   80101530 <ialloc>
80104bdf:	83 c4 10             	add    $0x10,%esp
80104be2:	85 c0                	test   %eax,%eax
80104be4:	89 c3                	mov    %eax,%ebx
80104be6:	0f 84 cc 00 00 00    	je     80104cb8 <create+0x188>
    panic("create: ialloc");

  ilock(ip);
80104bec:	83 ec 0c             	sub    $0xc,%esp
80104bef:	50                   	push   %eax
80104bf0:	e8 ab ca ff ff       	call   801016a0 <ilock>
  ip->major = major;
80104bf5:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104bf9:	66 89 43 52          	mov    %ax,0x52(%ebx)
  ip->minor = minor;
80104bfd:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104c01:	66 89 43 54          	mov    %ax,0x54(%ebx)
  ip->nlink = 1;
80104c05:	b8 01 00 00 00       	mov    $0x1,%eax
80104c0a:	66 89 43 56          	mov    %ax,0x56(%ebx)
  iupdate(ip);
80104c0e:	89 1c 24             	mov    %ebx,(%esp)
80104c11:	e8 da c9 ff ff       	call   801015f0 <iupdate>

  if(type == T_DIR){  // Create . and .. entries.
80104c16:	83 c4 10             	add    $0x10,%esp
80104c19:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104c1e:	74 40                	je     80104c60 <create+0x130>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
      panic("create dots");
  }

  if(dirlink(dp, name, ip->inum) < 0)
80104c20:	83 ec 04             	sub    $0x4,%esp
80104c23:	ff 73 04             	pushl  0x4(%ebx)
80104c26:	56                   	push   %esi
80104c27:	57                   	push   %edi
80104c28:	e8 e3 d1 ff ff       	call   80101e10 <dirlink>
80104c2d:	83 c4 10             	add    $0x10,%esp
80104c30:	85 c0                	test   %eax,%eax
80104c32:	78 77                	js     80104cab <create+0x17b>
    panic("create: dirlink");

  iunlockput(dp);
80104c34:	83 ec 0c             	sub    $0xc,%esp
80104c37:	57                   	push   %edi
80104c38:	e8 d3 cc ff ff       	call   80101910 <iunlockput>

  return ip;
80104c3d:	83 c4 10             	add    $0x10,%esp
}
80104c40:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");

  iunlockput(dp);

  return ip;
80104c43:	89 d8                	mov    %ebx,%eax
}
80104c45:	5b                   	pop    %ebx
80104c46:	5e                   	pop    %esi
80104c47:	5f                   	pop    %edi
80104c48:	5d                   	pop    %ebp
80104c49:	c3                   	ret    
80104c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  uint off;
  struct inode *ip, *dp;
  char name[DIRSIZ];

  if((dp = nameiparent(path, name)) == 0)
    return 0;
80104c50:	31 c0                	xor    %eax,%eax
80104c52:	e9 49 ff ff ff       	jmp    80104ba0 <create+0x70>
80104c57:	89 f6                	mov    %esi,%esi
80104c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  ip->minor = minor;
  ip->nlink = 1;
  iupdate(ip);

  if(type == T_DIR){  // Create . and .. entries.
    dp->nlink++;  // for ".."
80104c60:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
    iupdate(dp);
80104c65:	83 ec 0c             	sub    $0xc,%esp
80104c68:	57                   	push   %edi
80104c69:	e8 82 c9 ff ff       	call   801015f0 <iupdate>
    // No ip->nlink++ for ".": avoid cyclic ref count.
    if(dirlink(ip, ".", ip->inum) < 0 || dirlink(ip, "..", dp->inum) < 0)
80104c6e:	83 c4 0c             	add    $0xc,%esp
80104c71:	ff 73 04             	pushl  0x4(%ebx)
80104c74:	68 64 7b 10 80       	push   $0x80107b64
80104c79:	53                   	push   %ebx
80104c7a:	e8 91 d1 ff ff       	call   80101e10 <dirlink>
80104c7f:	83 c4 10             	add    $0x10,%esp
80104c82:	85 c0                	test   %eax,%eax
80104c84:	78 18                	js     80104c9e <create+0x16e>
80104c86:	83 ec 04             	sub    $0x4,%esp
80104c89:	ff 77 04             	pushl  0x4(%edi)
80104c8c:	68 63 7b 10 80       	push   $0x80107b63
80104c91:	53                   	push   %ebx
80104c92:	e8 79 d1 ff ff       	call   80101e10 <dirlink>
80104c97:	83 c4 10             	add    $0x10,%esp
80104c9a:	85 c0                	test   %eax,%eax
80104c9c:	79 82                	jns    80104c20 <create+0xf0>
      panic("create dots");
80104c9e:	83 ec 0c             	sub    $0xc,%esp
80104ca1:	68 57 7b 10 80       	push   $0x80107b57
80104ca6:	e8 c5 b6 ff ff       	call   80100370 <panic>
  }

  if(dirlink(dp, name, ip->inum) < 0)
    panic("create: dirlink");
80104cab:	83 ec 0c             	sub    $0xc,%esp
80104cae:	68 66 7b 10 80       	push   $0x80107b66
80104cb3:	e8 b8 b6 ff ff       	call   80100370 <panic>
    iunlockput(ip);
    return 0;
  }

  if((ip = ialloc(dp->dev, type)) == 0)
    panic("create: ialloc");
80104cb8:	83 ec 0c             	sub    $0xc,%esp
80104cbb:	68 48 7b 10 80       	push   $0x80107b48
80104cc0:	e8 ab b6 ff ff       	call   80100370 <panic>
80104cc5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cd0 <argfd.constprop.0>:
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104cd0:	55                   	push   %ebp
80104cd1:	89 e5                	mov    %esp,%ebp
80104cd3:	56                   	push   %esi
80104cd4:	53                   	push   %ebx
80104cd5:	89 c6                	mov    %eax,%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104cd7:	8d 45 f4             	lea    -0xc(%ebp),%eax
#include "fcntl.h"

// Fetch the nth word-sized system call argument as a file descriptor
// and return both the descriptor and the corresponding struct file.
static int
argfd(int n, int *pfd, struct file **pf)
80104cda:	89 d3                	mov    %edx,%ebx
80104cdc:	83 ec 18             	sub    $0x18,%esp
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
80104cdf:	50                   	push   %eax
80104ce0:	6a 00                	push   $0x0
80104ce2:	e8 c9 fc ff ff       	call   801049b0 <argint>
80104ce7:	83 c4 10             	add    $0x10,%esp
80104cea:	85 c0                	test   %eax,%eax
80104cec:	78 3a                	js     80104d28 <argfd.constprop.0+0x58>
    return -1;
  if(fd < 0 || fd >= NOFILE || (f=proc->ofile[fd]) == 0)
80104cee:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104cf1:	83 f8 0f             	cmp    $0xf,%eax
80104cf4:	77 32                	ja     80104d28 <argfd.constprop.0+0x58>
80104cf6:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80104cfd:	8b 54 82 28          	mov    0x28(%edx,%eax,4),%edx
80104d01:	85 d2                	test   %edx,%edx
80104d03:	74 23                	je     80104d28 <argfd.constprop.0+0x58>
    return -1;
  if(pfd)
80104d05:	85 f6                	test   %esi,%esi
80104d07:	74 02                	je     80104d0b <argfd.constprop.0+0x3b>
    *pfd = fd;
80104d09:	89 06                	mov    %eax,(%esi)
  if(pf)
80104d0b:	85 db                	test   %ebx,%ebx
80104d0d:	74 11                	je     80104d20 <argfd.constprop.0+0x50>
    *pf = f;
80104d0f:	89 13                	mov    %edx,(%ebx)
  return 0;
80104d11:	31 c0                	xor    %eax,%eax
}
80104d13:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104d16:	5b                   	pop    %ebx
80104d17:	5e                   	pop    %esi
80104d18:	5d                   	pop    %ebp
80104d19:	c3                   	ret    
80104d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;
  if(pfd)
    *pfd = fd;
  if(pf)
    *pf = f;
  return 0;
80104d20:	31 c0                	xor    %eax,%eax
80104d22:	eb ef                	jmp    80104d13 <argfd.constprop.0+0x43>
80104d24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argint(n, &fd) < 0)
    return -1;
80104d28:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104d2d:	eb e4                	jmp    80104d13 <argfd.constprop.0+0x43>
80104d2f:	90                   	nop

80104d30 <sys_dup>:
  return -1;
}

int
sys_dup(void)
{
80104d30:	55                   	push   %ebp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104d31:	31 c0                	xor    %eax,%eax
  return -1;
}

int
sys_dup(void)
{
80104d33:	89 e5                	mov    %esp,%ebp
80104d35:	53                   	push   %ebx
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104d36:	8d 55 f4             	lea    -0xc(%ebp),%edx
  return -1;
}

int
sys_dup(void)
{
80104d39:	83 ec 14             	sub    $0x14,%esp
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
80104d3c:	e8 8f ff ff ff       	call   80104cd0 <argfd.constprop.0>
80104d41:	85 c0                	test   %eax,%eax
80104d43:	78 1b                	js     80104d60 <sys_dup+0x30>
    return -1;
  if((fd=fdalloc(f)) < 0)
80104d45:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104d48:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104d4e:	31 db                	xor    %ebx,%ebx
    if(proc->ofile[fd] == 0){
80104d50:	8b 4c 98 28          	mov    0x28(%eax,%ebx,4),%ecx
80104d54:	85 c9                	test   %ecx,%ecx
80104d56:	74 18                	je     80104d70 <sys_dup+0x40>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80104d58:	83 c3 01             	add    $0x1,%ebx
80104d5b:	83 fb 10             	cmp    $0x10,%ebx
80104d5e:	75 f0                	jne    80104d50 <sys_dup+0x20>
{
  struct file *f;
  int fd;

  if(argfd(0, 0, &f) < 0)
    return -1;
80104d60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
  return fd;
}
80104d65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d68:	c9                   	leave  
80104d69:	c3                   	ret    
80104d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104d70:	83 ec 0c             	sub    $0xc,%esp
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80104d73:	89 54 98 28          	mov    %edx,0x28(%eax,%ebx,4)

  if(argfd(0, 0, &f) < 0)
    return -1;
  if((fd=fdalloc(f)) < 0)
    return -1;
  filedup(f);
80104d77:	52                   	push   %edx
80104d78:	e8 93 c0 ff ff       	call   80100e10 <filedup>
  return fd;
80104d7d:	89 d8                	mov    %ebx,%eax
80104d7f:	83 c4 10             	add    $0x10,%esp
}
80104d82:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104d85:	c9                   	leave  
80104d86:	c3                   	ret    
80104d87:	89 f6                	mov    %esi,%esi
80104d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d90 <sys_read>:

int
sys_read(void)
{
80104d90:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d91:	31 c0                	xor    %eax,%eax
  return fd;
}

int
sys_read(void)
{
80104d93:	89 e5                	mov    %esp,%ebp
80104d95:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104d98:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104d9b:	e8 30 ff ff ff       	call   80104cd0 <argfd.constprop.0>
80104da0:	85 c0                	test   %eax,%eax
80104da2:	78 4c                	js     80104df0 <sys_read+0x60>
80104da4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104da7:	83 ec 08             	sub    $0x8,%esp
80104daa:	50                   	push   %eax
80104dab:	6a 02                	push   $0x2
80104dad:	e8 fe fb ff ff       	call   801049b0 <argint>
80104db2:	83 c4 10             	add    $0x10,%esp
80104db5:	85 c0                	test   %eax,%eax
80104db7:	78 37                	js     80104df0 <sys_read+0x60>
80104db9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104dbc:	83 ec 04             	sub    $0x4,%esp
80104dbf:	ff 75 f0             	pushl  -0x10(%ebp)
80104dc2:	50                   	push   %eax
80104dc3:	6a 01                	push   $0x1
80104dc5:	e8 26 fc ff ff       	call   801049f0 <argptr>
80104dca:	83 c4 10             	add    $0x10,%esp
80104dcd:	85 c0                	test   %eax,%eax
80104dcf:	78 1f                	js     80104df0 <sys_read+0x60>
    return -1;
  return fileread(f, p, n);
80104dd1:	83 ec 04             	sub    $0x4,%esp
80104dd4:	ff 75 f0             	pushl  -0x10(%ebp)
80104dd7:	ff 75 f4             	pushl  -0xc(%ebp)
80104dda:	ff 75 ec             	pushl  -0x14(%ebp)
80104ddd:	e8 9e c1 ff ff       	call   80100f80 <fileread>
80104de2:	83 c4 10             	add    $0x10,%esp
}
80104de5:	c9                   	leave  
80104de6:	c3                   	ret    
80104de7:	89 f6                	mov    %esi,%esi
80104de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104df0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return fileread(f, p, n);
}
80104df5:	c9                   	leave  
80104df6:	c3                   	ret    
80104df7:	89 f6                	mov    %esi,%esi
80104df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e00 <sys_write>:

int
sys_write(void)
{
80104e00:	55                   	push   %ebp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104e01:	31 c0                	xor    %eax,%eax
  return fileread(f, p, n);
}

int
sys_write(void)
{
80104e03:	89 e5                	mov    %esp,%ebp
80104e05:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
80104e08:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104e0b:	e8 c0 fe ff ff       	call   80104cd0 <argfd.constprop.0>
80104e10:	85 c0                	test   %eax,%eax
80104e12:	78 4c                	js     80104e60 <sys_write+0x60>
80104e14:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e17:	83 ec 08             	sub    $0x8,%esp
80104e1a:	50                   	push   %eax
80104e1b:	6a 02                	push   $0x2
80104e1d:	e8 8e fb ff ff       	call   801049b0 <argint>
80104e22:	83 c4 10             	add    $0x10,%esp
80104e25:	85 c0                	test   %eax,%eax
80104e27:	78 37                	js     80104e60 <sys_write+0x60>
80104e29:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e2c:	83 ec 04             	sub    $0x4,%esp
80104e2f:	ff 75 f0             	pushl  -0x10(%ebp)
80104e32:	50                   	push   %eax
80104e33:	6a 01                	push   $0x1
80104e35:	e8 b6 fb ff ff       	call   801049f0 <argptr>
80104e3a:	83 c4 10             	add    $0x10,%esp
80104e3d:	85 c0                	test   %eax,%eax
80104e3f:	78 1f                	js     80104e60 <sys_write+0x60>
    return -1;
  return filewrite(f, p, n);
80104e41:	83 ec 04             	sub    $0x4,%esp
80104e44:	ff 75 f0             	pushl  -0x10(%ebp)
80104e47:	ff 75 f4             	pushl  -0xc(%ebp)
80104e4a:	ff 75 ec             	pushl  -0x14(%ebp)
80104e4d:	e8 be c1 ff ff       	call   80101010 <filewrite>
80104e52:	83 c4 10             	add    $0x10,%esp
}
80104e55:	c9                   	leave  
80104e56:	c3                   	ret    
80104e57:	89 f6                	mov    %esi,%esi
80104e59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  struct file *f;
  int n;
  char *p;

  if(argfd(0, 0, &f) < 0 || argint(2, &n) < 0 || argptr(1, &p, n) < 0)
    return -1;
80104e60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filewrite(f, p, n);
}
80104e65:	c9                   	leave  
80104e66:	c3                   	ret    
80104e67:	89 f6                	mov    %esi,%esi
80104e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e70 <sys_close>:

int
sys_close(void)
{
80104e70:	55                   	push   %ebp
80104e71:	89 e5                	mov    %esp,%ebp
80104e73:	83 ec 18             	sub    $0x18,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
80104e76:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104e79:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e7c:	e8 4f fe ff ff       	call   80104cd0 <argfd.constprop.0>
80104e81:	85 c0                	test   %eax,%eax
80104e83:	78 2b                	js     80104eb0 <sys_close+0x40>
    return -1;
  proc->ofile[fd] = 0;
80104e85:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104e88:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  fileclose(f);
80104e8e:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
  proc->ofile[fd] = 0;
80104e91:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104e98:	00 
  fileclose(f);
80104e99:	ff 75 f4             	pushl  -0xc(%ebp)
80104e9c:	e8 bf bf ff ff       	call   80100e60 <fileclose>
  return 0;
80104ea1:	83 c4 10             	add    $0x10,%esp
80104ea4:	31 c0                	xor    %eax,%eax
}
80104ea6:	c9                   	leave  
80104ea7:	c3                   	ret    
80104ea8:	90                   	nop
80104ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;
  struct file *f;

  if(argfd(0, &fd, &f) < 0)
    return -1;
80104eb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  proc->ofile[fd] = 0;
  fileclose(f);
  return 0;
}
80104eb5:	c9                   	leave  
80104eb6:	c3                   	ret    
80104eb7:	89 f6                	mov    %esi,%esi
80104eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ec0 <sys_fstat>:

int
sys_fstat(void)
{
80104ec0:	55                   	push   %ebp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104ec1:	31 c0                	xor    %eax,%eax
  return 0;
}

int
sys_fstat(void)
{
80104ec3:	89 e5                	mov    %esp,%ebp
80104ec5:	83 ec 18             	sub    $0x18,%esp
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
80104ec8:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104ecb:	e8 00 fe ff ff       	call   80104cd0 <argfd.constprop.0>
80104ed0:	85 c0                	test   %eax,%eax
80104ed2:	78 2c                	js     80104f00 <sys_fstat+0x40>
80104ed4:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104ed7:	83 ec 04             	sub    $0x4,%esp
80104eda:	6a 14                	push   $0x14
80104edc:	50                   	push   %eax
80104edd:	6a 01                	push   $0x1
80104edf:	e8 0c fb ff ff       	call   801049f0 <argptr>
80104ee4:	83 c4 10             	add    $0x10,%esp
80104ee7:	85 c0                	test   %eax,%eax
80104ee9:	78 15                	js     80104f00 <sys_fstat+0x40>
    return -1;
  return filestat(f, st);
80104eeb:	83 ec 08             	sub    $0x8,%esp
80104eee:	ff 75 f4             	pushl  -0xc(%ebp)
80104ef1:	ff 75 f0             	pushl  -0x10(%ebp)
80104ef4:	e8 37 c0 ff ff       	call   80100f30 <filestat>
80104ef9:	83 c4 10             	add    $0x10,%esp
}
80104efc:	c9                   	leave  
80104efd:	c3                   	ret    
80104efe:	66 90                	xchg   %ax,%ax
{
  struct file *f;
  struct stat *st;

  if(argfd(0, 0, &f) < 0 || argptr(1, (void*)&st, sizeof(*st)) < 0)
    return -1;
80104f00:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return filestat(f, st);
}
80104f05:	c9                   	leave  
80104f06:	c3                   	ret    
80104f07:	89 f6                	mov    %esi,%esi
80104f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104f10 <sys_link>:

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104f10:	55                   	push   %ebp
80104f11:	89 e5                	mov    %esp,%ebp
80104f13:	57                   	push   %edi
80104f14:	56                   	push   %esi
80104f15:	53                   	push   %ebx
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104f16:	8d 45 d4             	lea    -0x2c(%ebp),%eax
}

// Create the path new as a link to the same inode as old.
int
sys_link(void)
{
80104f19:	83 ec 34             	sub    $0x34,%esp
  char name[DIRSIZ], *new, *old;
  struct inode *dp, *ip;

  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
80104f1c:	50                   	push   %eax
80104f1d:	6a 00                	push   $0x0
80104f1f:	e8 1c fb ff ff       	call   80104a40 <argstr>
80104f24:	83 c4 10             	add    $0x10,%esp
80104f27:	85 c0                	test   %eax,%eax
80104f29:	0f 88 fb 00 00 00    	js     8010502a <sys_link+0x11a>
80104f2f:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104f32:	83 ec 08             	sub    $0x8,%esp
80104f35:	50                   	push   %eax
80104f36:	6a 01                	push   $0x1
80104f38:	e8 03 fb ff ff       	call   80104a40 <argstr>
80104f3d:	83 c4 10             	add    $0x10,%esp
80104f40:	85 c0                	test   %eax,%eax
80104f42:	0f 88 e2 00 00 00    	js     8010502a <sys_link+0x11a>
    return -1;

  begin_op();
80104f48:	e8 b3 dc ff ff       	call   80102c00 <begin_op>
  if((ip = namei(old)) == 0){
80104f4d:	83 ec 0c             	sub    $0xc,%esp
80104f50:	ff 75 d4             	pushl  -0x2c(%ebp)
80104f53:	e8 78 cf ff ff       	call   80101ed0 <namei>
80104f58:	83 c4 10             	add    $0x10,%esp
80104f5b:	85 c0                	test   %eax,%eax
80104f5d:	89 c3                	mov    %eax,%ebx
80104f5f:	0f 84 f3 00 00 00    	je     80105058 <sys_link+0x148>
    end_op();
    return -1;
  }

  ilock(ip);
80104f65:	83 ec 0c             	sub    $0xc,%esp
80104f68:	50                   	push   %eax
80104f69:	e8 32 c7 ff ff       	call   801016a0 <ilock>
  if(ip->type == T_DIR){
80104f6e:	83 c4 10             	add    $0x10,%esp
80104f71:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80104f76:	0f 84 c4 00 00 00    	je     80105040 <sys_link+0x130>
    iunlockput(ip);
    end_op();
    return -1;
  }

  ip->nlink++;
80104f7c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
  iupdate(ip);
80104f81:	83 ec 0c             	sub    $0xc,%esp
  iunlock(ip);

  if((dp = nameiparent(new, name)) == 0)
80104f84:	8d 7d da             	lea    -0x26(%ebp),%edi
    end_op();
    return -1;
  }

  ip->nlink++;
  iupdate(ip);
80104f87:	53                   	push   %ebx
80104f88:	e8 63 c6 ff ff       	call   801015f0 <iupdate>
  iunlock(ip);
80104f8d:	89 1c 24             	mov    %ebx,(%esp)
80104f90:	e8 eb c7 ff ff       	call   80101780 <iunlock>

  if((dp = nameiparent(new, name)) == 0)
80104f95:	58                   	pop    %eax
80104f96:	5a                   	pop    %edx
80104f97:	57                   	push   %edi
80104f98:	ff 75 d0             	pushl  -0x30(%ebp)
80104f9b:	e8 50 cf ff ff       	call   80101ef0 <nameiparent>
80104fa0:	83 c4 10             	add    $0x10,%esp
80104fa3:	85 c0                	test   %eax,%eax
80104fa5:	89 c6                	mov    %eax,%esi
80104fa7:	74 5b                	je     80105004 <sys_link+0xf4>
    goto bad;
  ilock(dp);
80104fa9:	83 ec 0c             	sub    $0xc,%esp
80104fac:	50                   	push   %eax
80104fad:	e8 ee c6 ff ff       	call   801016a0 <ilock>
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
80104fb2:	83 c4 10             	add    $0x10,%esp
80104fb5:	8b 03                	mov    (%ebx),%eax
80104fb7:	39 06                	cmp    %eax,(%esi)
80104fb9:	75 3d                	jne    80104ff8 <sys_link+0xe8>
80104fbb:	83 ec 04             	sub    $0x4,%esp
80104fbe:	ff 73 04             	pushl  0x4(%ebx)
80104fc1:	57                   	push   %edi
80104fc2:	56                   	push   %esi
80104fc3:	e8 48 ce ff ff       	call   80101e10 <dirlink>
80104fc8:	83 c4 10             	add    $0x10,%esp
80104fcb:	85 c0                	test   %eax,%eax
80104fcd:	78 29                	js     80104ff8 <sys_link+0xe8>
    iunlockput(dp);
    goto bad;
  }
  iunlockput(dp);
80104fcf:	83 ec 0c             	sub    $0xc,%esp
80104fd2:	56                   	push   %esi
80104fd3:	e8 38 c9 ff ff       	call   80101910 <iunlockput>
  iput(ip);
80104fd8:	89 1c 24             	mov    %ebx,(%esp)
80104fdb:	e8 f0 c7 ff ff       	call   801017d0 <iput>

  end_op();
80104fe0:	e8 8b dc ff ff       	call   80102c70 <end_op>

  return 0;
80104fe5:	83 c4 10             	add    $0x10,%esp
80104fe8:	31 c0                	xor    %eax,%eax
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
}
80104fea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104fed:	5b                   	pop    %ebx
80104fee:	5e                   	pop    %esi
80104fef:	5f                   	pop    %edi
80104ff0:	5d                   	pop    %ebp
80104ff1:	c3                   	ret    
80104ff2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  if((dp = nameiparent(new, name)) == 0)
    goto bad;
  ilock(dp);
  if(dp->dev != ip->dev || dirlink(dp, name, ip->inum) < 0){
    iunlockput(dp);
80104ff8:	83 ec 0c             	sub    $0xc,%esp
80104ffb:	56                   	push   %esi
80104ffc:	e8 0f c9 ff ff       	call   80101910 <iunlockput>
    goto bad;
80105001:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  ilock(ip);
80105004:	83 ec 0c             	sub    $0xc,%esp
80105007:	53                   	push   %ebx
80105008:	e8 93 c6 ff ff       	call   801016a0 <ilock>
  ip->nlink--;
8010500d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
80105012:	89 1c 24             	mov    %ebx,(%esp)
80105015:	e8 d6 c5 ff ff       	call   801015f0 <iupdate>
  iunlockput(ip);
8010501a:	89 1c 24             	mov    %ebx,(%esp)
8010501d:	e8 ee c8 ff ff       	call   80101910 <iunlockput>
  end_op();
80105022:	e8 49 dc ff ff       	call   80102c70 <end_op>
  return -1;
80105027:	83 c4 10             	add    $0x10,%esp
}
8010502a:	8d 65 f4             	lea    -0xc(%ebp),%esp
  ilock(ip);
  ip->nlink--;
  iupdate(ip);
  iunlockput(ip);
  end_op();
  return -1;
8010502d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80105032:	5b                   	pop    %ebx
80105033:	5e                   	pop    %esi
80105034:	5f                   	pop    %edi
80105035:	5d                   	pop    %ebp
80105036:	c3                   	ret    
80105037:	89 f6                	mov    %esi,%esi
80105039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    return -1;
  }

  ilock(ip);
  if(ip->type == T_DIR){
    iunlockput(ip);
80105040:	83 ec 0c             	sub    $0xc,%esp
80105043:	53                   	push   %ebx
80105044:	e8 c7 c8 ff ff       	call   80101910 <iunlockput>
    end_op();
80105049:	e8 22 dc ff ff       	call   80102c70 <end_op>
    return -1;
8010504e:	83 c4 10             	add    $0x10,%esp
80105051:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105056:	eb 92                	jmp    80104fea <sys_link+0xda>
  if(argstr(0, &old) < 0 || argstr(1, &new) < 0)
    return -1;

  begin_op();
  if((ip = namei(old)) == 0){
    end_op();
80105058:	e8 13 dc ff ff       	call   80102c70 <end_op>
    return -1;
8010505d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105062:	eb 86                	jmp    80104fea <sys_link+0xda>
80105064:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010506a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105070 <sys_unlink>:
}

//PAGEBREAK!
int
sys_unlink(void)
{
80105070:	55                   	push   %ebp
80105071:	89 e5                	mov    %esp,%ebp
80105073:	57                   	push   %edi
80105074:	56                   	push   %esi
80105075:	53                   	push   %ebx
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
80105076:	8d 45 c0             	lea    -0x40(%ebp),%eax
}

//PAGEBREAK!
int
sys_unlink(void)
{
80105079:	83 ec 54             	sub    $0x54,%esp
  struct inode *ip, *dp;
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
8010507c:	50                   	push   %eax
8010507d:	6a 00                	push   $0x0
8010507f:	e8 bc f9 ff ff       	call   80104a40 <argstr>
80105084:	83 c4 10             	add    $0x10,%esp
80105087:	85 c0                	test   %eax,%eax
80105089:	0f 88 82 01 00 00    	js     80105211 <sys_unlink+0x1a1>
    return -1;

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
8010508f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
  uint off;

  if(argstr(0, &path) < 0)
    return -1;

  begin_op();
80105092:	e8 69 db ff ff       	call   80102c00 <begin_op>
  if((dp = nameiparent(path, name)) == 0){
80105097:	83 ec 08             	sub    $0x8,%esp
8010509a:	53                   	push   %ebx
8010509b:	ff 75 c0             	pushl  -0x40(%ebp)
8010509e:	e8 4d ce ff ff       	call   80101ef0 <nameiparent>
801050a3:	83 c4 10             	add    $0x10,%esp
801050a6:	85 c0                	test   %eax,%eax
801050a8:	89 45 b4             	mov    %eax,-0x4c(%ebp)
801050ab:	0f 84 6a 01 00 00    	je     8010521b <sys_unlink+0x1ab>
    end_op();
    return -1;
  }

  ilock(dp);
801050b1:	8b 75 b4             	mov    -0x4c(%ebp),%esi
801050b4:	83 ec 0c             	sub    $0xc,%esp
801050b7:	56                   	push   %esi
801050b8:	e8 e3 c5 ff ff       	call   801016a0 <ilock>

  // Cannot unlink "." or "..".
  if(namecmp(name, ".") == 0 || namecmp(name, "..") == 0)
801050bd:	58                   	pop    %eax
801050be:	5a                   	pop    %edx
801050bf:	68 64 7b 10 80       	push   $0x80107b64
801050c4:	53                   	push   %ebx
801050c5:	e8 c6 ca ff ff       	call   80101b90 <namecmp>
801050ca:	83 c4 10             	add    $0x10,%esp
801050cd:	85 c0                	test   %eax,%eax
801050cf:	0f 84 fc 00 00 00    	je     801051d1 <sys_unlink+0x161>
801050d5:	83 ec 08             	sub    $0x8,%esp
801050d8:	68 63 7b 10 80       	push   $0x80107b63
801050dd:	53                   	push   %ebx
801050de:	e8 ad ca ff ff       	call   80101b90 <namecmp>
801050e3:	83 c4 10             	add    $0x10,%esp
801050e6:	85 c0                	test   %eax,%eax
801050e8:	0f 84 e3 00 00 00    	je     801051d1 <sys_unlink+0x161>
    goto bad;

  if((ip = dirlookup(dp, name, &off)) == 0)
801050ee:	8d 45 c4             	lea    -0x3c(%ebp),%eax
801050f1:	83 ec 04             	sub    $0x4,%esp
801050f4:	50                   	push   %eax
801050f5:	53                   	push   %ebx
801050f6:	56                   	push   %esi
801050f7:	e8 b4 ca ff ff       	call   80101bb0 <dirlookup>
801050fc:	83 c4 10             	add    $0x10,%esp
801050ff:	85 c0                	test   %eax,%eax
80105101:	89 c3                	mov    %eax,%ebx
80105103:	0f 84 c8 00 00 00    	je     801051d1 <sys_unlink+0x161>
    goto bad;
  ilock(ip);
80105109:	83 ec 0c             	sub    $0xc,%esp
8010510c:	50                   	push   %eax
8010510d:	e8 8e c5 ff ff       	call   801016a0 <ilock>

  if(ip->nlink < 1)
80105112:	83 c4 10             	add    $0x10,%esp
80105115:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010511a:	0f 8e 24 01 00 00    	jle    80105244 <sys_unlink+0x1d4>
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
80105120:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105125:	8d 75 d8             	lea    -0x28(%ebp),%esi
80105128:	74 66                	je     80105190 <sys_unlink+0x120>
    iunlockput(ip);
    goto bad;
  }

  memset(&de, 0, sizeof(de));
8010512a:	83 ec 04             	sub    $0x4,%esp
8010512d:	6a 10                	push   $0x10
8010512f:	6a 00                	push   $0x0
80105131:	56                   	push   %esi
80105132:	e8 89 f5 ff ff       	call   801046c0 <memset>
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
80105137:	6a 10                	push   $0x10
80105139:	ff 75 c4             	pushl  -0x3c(%ebp)
8010513c:	56                   	push   %esi
8010513d:	ff 75 b4             	pushl  -0x4c(%ebp)
80105140:	e8 1b c9 ff ff       	call   80101a60 <writei>
80105145:	83 c4 20             	add    $0x20,%esp
80105148:	83 f8 10             	cmp    $0x10,%eax
8010514b:	0f 85 e6 00 00 00    	jne    80105237 <sys_unlink+0x1c7>
    panic("unlink: writei");
  if(ip->type == T_DIR){
80105151:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105156:	0f 84 9c 00 00 00    	je     801051f8 <sys_unlink+0x188>
    dp->nlink--;
    iupdate(dp);
  }
  iunlockput(dp);
8010515c:	83 ec 0c             	sub    $0xc,%esp
8010515f:	ff 75 b4             	pushl  -0x4c(%ebp)
80105162:	e8 a9 c7 ff ff       	call   80101910 <iunlockput>

  ip->nlink--;
80105167:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
  iupdate(ip);
8010516c:	89 1c 24             	mov    %ebx,(%esp)
8010516f:	e8 7c c4 ff ff       	call   801015f0 <iupdate>
  iunlockput(ip);
80105174:	89 1c 24             	mov    %ebx,(%esp)
80105177:	e8 94 c7 ff ff       	call   80101910 <iunlockput>

  end_op();
8010517c:	e8 ef da ff ff       	call   80102c70 <end_op>

  return 0;
80105181:	83 c4 10             	add    $0x10,%esp
80105184:	31 c0                	xor    %eax,%eax

bad:
  iunlockput(dp);
  end_op();
  return -1;
}
80105186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105189:	5b                   	pop    %ebx
8010518a:	5e                   	pop    %esi
8010518b:	5f                   	pop    %edi
8010518c:	5d                   	pop    %ebp
8010518d:	c3                   	ret    
8010518e:	66 90                	xchg   %ax,%ax
isdirempty(struct inode *dp)
{
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
80105190:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105194:	76 94                	jbe    8010512a <sys_unlink+0xba>
80105196:	bf 20 00 00 00       	mov    $0x20,%edi
8010519b:	eb 0f                	jmp    801051ac <sys_unlink+0x13c>
8010519d:	8d 76 00             	lea    0x0(%esi),%esi
801051a0:	83 c7 10             	add    $0x10,%edi
801051a3:	3b 7b 58             	cmp    0x58(%ebx),%edi
801051a6:	0f 83 7e ff ff ff    	jae    8010512a <sys_unlink+0xba>
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
801051ac:	6a 10                	push   $0x10
801051ae:	57                   	push   %edi
801051af:	56                   	push   %esi
801051b0:	53                   	push   %ebx
801051b1:	e8 aa c7 ff ff       	call   80101960 <readi>
801051b6:	83 c4 10             	add    $0x10,%esp
801051b9:	83 f8 10             	cmp    $0x10,%eax
801051bc:	75 6c                	jne    8010522a <sys_unlink+0x1ba>
      panic("isdirempty: readi");
    if(de.inum != 0)
801051be:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
801051c3:	74 db                	je     801051a0 <sys_unlink+0x130>
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
  if(ip->type == T_DIR && !isdirempty(ip)){
    iunlockput(ip);
801051c5:	83 ec 0c             	sub    $0xc,%esp
801051c8:	53                   	push   %ebx
801051c9:	e8 42 c7 ff ff       	call   80101910 <iunlockput>
    goto bad;
801051ce:	83 c4 10             	add    $0x10,%esp
  end_op();

  return 0;

bad:
  iunlockput(dp);
801051d1:	83 ec 0c             	sub    $0xc,%esp
801051d4:	ff 75 b4             	pushl  -0x4c(%ebp)
801051d7:	e8 34 c7 ff ff       	call   80101910 <iunlockput>
  end_op();
801051dc:	e8 8f da ff ff       	call   80102c70 <end_op>
  return -1;
801051e1:	83 c4 10             	add    $0x10,%esp
}
801051e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  return 0;

bad:
  iunlockput(dp);
  end_op();
  return -1;
801051e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801051ec:	5b                   	pop    %ebx
801051ed:	5e                   	pop    %esi
801051ee:	5f                   	pop    %edi
801051ef:	5d                   	pop    %ebp
801051f0:	c3                   	ret    
801051f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
801051f8:	8b 45 b4             	mov    -0x4c(%ebp),%eax
    iupdate(dp);
801051fb:	83 ec 0c             	sub    $0xc,%esp

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
  if(ip->type == T_DIR){
    dp->nlink--;
801051fe:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
    iupdate(dp);
80105203:	50                   	push   %eax
80105204:	e8 e7 c3 ff ff       	call   801015f0 <iupdate>
80105209:	83 c4 10             	add    $0x10,%esp
8010520c:	e9 4b ff ff ff       	jmp    8010515c <sys_unlink+0xec>
  struct dirent de;
  char name[DIRSIZ], *path;
  uint off;

  if(argstr(0, &path) < 0)
    return -1;
80105211:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105216:	e9 6b ff ff ff       	jmp    80105186 <sys_unlink+0x116>

  begin_op();
  if((dp = nameiparent(path, name)) == 0){
    end_op();
8010521b:	e8 50 da ff ff       	call   80102c70 <end_op>
    return -1;
80105220:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105225:	e9 5c ff ff ff       	jmp    80105186 <sys_unlink+0x116>
  int off;
  struct dirent de;

  for(off=2*sizeof(de); off<dp->size; off+=sizeof(de)){
    if(readi(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
      panic("isdirempty: readi");
8010522a:	83 ec 0c             	sub    $0xc,%esp
8010522d:	68 88 7b 10 80       	push   $0x80107b88
80105232:	e8 39 b1 ff ff       	call   80100370 <panic>
    goto bad;
  }

  memset(&de, 0, sizeof(de));
  if(writei(dp, (char*)&de, off, sizeof(de)) != sizeof(de))
    panic("unlink: writei");
80105237:	83 ec 0c             	sub    $0xc,%esp
8010523a:	68 9a 7b 10 80       	push   $0x80107b9a
8010523f:	e8 2c b1 ff ff       	call   80100370 <panic>
  if((ip = dirlookup(dp, name, &off)) == 0)
    goto bad;
  ilock(ip);

  if(ip->nlink < 1)
    panic("unlink: nlink < 1");
80105244:	83 ec 0c             	sub    $0xc,%esp
80105247:	68 76 7b 10 80       	push   $0x80107b76
8010524c:	e8 1f b1 ff ff       	call   80100370 <panic>
80105251:	eb 0d                	jmp    80105260 <sys_open>
80105253:	90                   	nop
80105254:	90                   	nop
80105255:	90                   	nop
80105256:	90                   	nop
80105257:	90                   	nop
80105258:	90                   	nop
80105259:	90                   	nop
8010525a:	90                   	nop
8010525b:	90                   	nop
8010525c:	90                   	nop
8010525d:	90                   	nop
8010525e:	90                   	nop
8010525f:	90                   	nop

80105260 <sys_open>:
  return ip;
}

int
sys_open(void)
{
80105260:	55                   	push   %ebp
80105261:	89 e5                	mov    %esp,%ebp
80105263:	57                   	push   %edi
80105264:	56                   	push   %esi
80105265:	53                   	push   %ebx
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
80105266:	8d 45 e0             	lea    -0x20(%ebp),%eax
  return ip;
}

int
sys_open(void)
{
80105269:	83 ec 24             	sub    $0x24,%esp
  char *path;
  int fd, omode;
  struct file *f;
  struct inode *ip;

  if(argstr(0, &path) < 0 || argint(1, &omode) < 0)
8010526c:	50                   	push   %eax
8010526d:	6a 00                	push   $0x0
8010526f:	e8 cc f7 ff ff       	call   80104a40 <argstr>
80105274:	83 c4 10             	add    $0x10,%esp
80105277:	85 c0                	test   %eax,%eax
80105279:	0f 88 9e 00 00 00    	js     8010531d <sys_open+0xbd>
8010527f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105282:	83 ec 08             	sub    $0x8,%esp
80105285:	50                   	push   %eax
80105286:	6a 01                	push   $0x1
80105288:	e8 23 f7 ff ff       	call   801049b0 <argint>
8010528d:	83 c4 10             	add    $0x10,%esp
80105290:	85 c0                	test   %eax,%eax
80105292:	0f 88 85 00 00 00    	js     8010531d <sys_open+0xbd>
    return -1;

  begin_op();
80105298:	e8 63 d9 ff ff       	call   80102c00 <begin_op>

  if(omode & O_CREATE){
8010529d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
801052a1:	0f 85 89 00 00 00    	jne    80105330 <sys_open+0xd0>
    if(ip == 0){
      end_op();
      return -1;
    }
  } else {
    if((ip = namei(path)) == 0){
801052a7:	83 ec 0c             	sub    $0xc,%esp
801052aa:	ff 75 e0             	pushl  -0x20(%ebp)
801052ad:	e8 1e cc ff ff       	call   80101ed0 <namei>
801052b2:	83 c4 10             	add    $0x10,%esp
801052b5:	85 c0                	test   %eax,%eax
801052b7:	89 c7                	mov    %eax,%edi
801052b9:	0f 84 8e 00 00 00    	je     8010534d <sys_open+0xed>
      end_op();
      return -1;
    }
    ilock(ip);
801052bf:	83 ec 0c             	sub    $0xc,%esp
801052c2:	50                   	push   %eax
801052c3:	e8 d8 c3 ff ff       	call   801016a0 <ilock>
    if(ip->type == T_DIR && omode != O_RDONLY){
801052c8:	83 c4 10             	add    $0x10,%esp
801052cb:	66 83 7f 50 01       	cmpw   $0x1,0x50(%edi)
801052d0:	0f 84 d2 00 00 00    	je     801053a8 <sys_open+0x148>
      end_op();
      return -1;
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
801052d6:	e8 c5 ba ff ff       	call   80100da0 <filealloc>
801052db:	85 c0                	test   %eax,%eax
801052dd:	89 c6                	mov    %eax,%esi
801052df:	74 2b                	je     8010530c <sys_open+0xac>
801052e1:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
801052e8:	31 db                	xor    %ebx,%ebx
801052ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
801052f0:	8b 44 9a 28          	mov    0x28(%edx,%ebx,4),%eax
801052f4:	85 c0                	test   %eax,%eax
801052f6:	74 68                	je     80105360 <sys_open+0x100>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801052f8:	83 c3 01             	add    $0x1,%ebx
801052fb:	83 fb 10             	cmp    $0x10,%ebx
801052fe:	75 f0                	jne    801052f0 <sys_open+0x90>
    }
  }

  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
80105300:	83 ec 0c             	sub    $0xc,%esp
80105303:	56                   	push   %esi
80105304:	e8 57 bb ff ff       	call   80100e60 <fileclose>
80105309:	83 c4 10             	add    $0x10,%esp
    iunlockput(ip);
8010530c:	83 ec 0c             	sub    $0xc,%esp
8010530f:	57                   	push   %edi
80105310:	e8 fb c5 ff ff       	call   80101910 <iunlockput>
    end_op();
80105315:	e8 56 d9 ff ff       	call   80102c70 <end_op>
    return -1;
8010531a:	83 c4 10             	add    $0x10,%esp
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
8010531d:	8d 65 f4             	lea    -0xc(%ebp),%esp
  if((f = filealloc()) == 0 || (fd = fdalloc(f)) < 0){
    if(f)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
80105320:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
  return fd;
}
80105325:	5b                   	pop    %ebx
80105326:	5e                   	pop    %esi
80105327:	5f                   	pop    %edi
80105328:	5d                   	pop    %ebp
80105329:	c3                   	ret    
8010532a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105330:	83 ec 0c             	sub    $0xc,%esp
80105333:	8b 45 e0             	mov    -0x20(%ebp),%eax
80105336:	31 c9                	xor    %ecx,%ecx
80105338:	6a 00                	push   $0x0
8010533a:	ba 02 00 00 00       	mov    $0x2,%edx
8010533f:	e8 ec f7 ff ff       	call   80104b30 <create>
    if(ip == 0){
80105344:	83 c4 10             	add    $0x10,%esp
80105347:	85 c0                	test   %eax,%eax
    return -1;

  begin_op();

  if(omode & O_CREATE){
    ip = create(path, T_FILE, 0, 0);
80105349:	89 c7                	mov    %eax,%edi
    if(ip == 0){
8010534b:	75 89                	jne    801052d6 <sys_open+0x76>
      end_op();
8010534d:	e8 1e d9 ff ff       	call   80102c70 <end_op>
      return -1;
80105352:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105357:	eb 43                	jmp    8010539c <sys_open+0x13c>
80105359:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105360:	83 ec 0c             	sub    $0xc,%esp
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
80105363:	89 74 9a 28          	mov    %esi,0x28(%edx,%ebx,4)
      fileclose(f);
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
80105367:	57                   	push   %edi
80105368:	e8 13 c4 ff ff       	call   80101780 <iunlock>
  end_op();
8010536d:	e8 fe d8 ff ff       	call   80102c70 <end_op>

  f->type = FD_INODE;
80105372:	c7 06 02 00 00 00    	movl   $0x2,(%esi)
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105378:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
8010537b:	83 c4 10             	add    $0x10,%esp
  }
  iunlock(ip);
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
8010537e:	89 7e 10             	mov    %edi,0x10(%esi)
  f->off = 0;
80105381:	c7 46 14 00 00 00 00 	movl   $0x0,0x14(%esi)
  f->readable = !(omode & O_WRONLY);
80105388:	89 d0                	mov    %edx,%eax
8010538a:	83 e0 01             	and    $0x1,%eax
8010538d:	83 f0 01             	xor    $0x1,%eax
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105390:	83 e2 03             	and    $0x3,%edx
  end_op();

  f->type = FD_INODE;
  f->ip = ip;
  f->off = 0;
  f->readable = !(omode & O_WRONLY);
80105393:	88 46 08             	mov    %al,0x8(%esi)
  f->writable = (omode & O_WRONLY) || (omode & O_RDWR);
80105396:	0f 95 46 09          	setne  0x9(%esi)
  return fd;
8010539a:	89 d8                	mov    %ebx,%eax
}
8010539c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010539f:	5b                   	pop    %ebx
801053a0:	5e                   	pop    %esi
801053a1:	5f                   	pop    %edi
801053a2:	5d                   	pop    %ebp
801053a3:	c3                   	ret    
801053a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if((ip = namei(path)) == 0){
      end_op();
      return -1;
    }
    ilock(ip);
    if(ip->type == T_DIR && omode != O_RDONLY){
801053a8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801053ab:	85 d2                	test   %edx,%edx
801053ad:	0f 84 23 ff ff ff    	je     801052d6 <sys_open+0x76>
801053b3:	e9 54 ff ff ff       	jmp    8010530c <sys_open+0xac>
801053b8:	90                   	nop
801053b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801053c0 <sys_mkdir>:
  return fd;
}

int
sys_mkdir(void)
{
801053c0:	55                   	push   %ebp
801053c1:	89 e5                	mov    %esp,%ebp
801053c3:	83 ec 18             	sub    $0x18,%esp
  char *path;
  struct inode *ip;

  begin_op();
801053c6:	e8 35 d8 ff ff       	call   80102c00 <begin_op>
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
801053cb:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053ce:	83 ec 08             	sub    $0x8,%esp
801053d1:	50                   	push   %eax
801053d2:	6a 00                	push   $0x0
801053d4:	e8 67 f6 ff ff       	call   80104a40 <argstr>
801053d9:	83 c4 10             	add    $0x10,%esp
801053dc:	85 c0                	test   %eax,%eax
801053de:	78 30                	js     80105410 <sys_mkdir+0x50>
801053e0:	83 ec 0c             	sub    $0xc,%esp
801053e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
801053e6:	31 c9                	xor    %ecx,%ecx
801053e8:	6a 00                	push   $0x0
801053ea:	ba 01 00 00 00       	mov    $0x1,%edx
801053ef:	e8 3c f7 ff ff       	call   80104b30 <create>
801053f4:	83 c4 10             	add    $0x10,%esp
801053f7:	85 c0                	test   %eax,%eax
801053f9:	74 15                	je     80105410 <sys_mkdir+0x50>
    end_op();
    return -1;
  }
  iunlockput(ip);
801053fb:	83 ec 0c             	sub    $0xc,%esp
801053fe:	50                   	push   %eax
801053ff:	e8 0c c5 ff ff       	call   80101910 <iunlockput>
  end_op();
80105404:	e8 67 d8 ff ff       	call   80102c70 <end_op>
  return 0;
80105409:	83 c4 10             	add    $0x10,%esp
8010540c:	31 c0                	xor    %eax,%eax
}
8010540e:	c9                   	leave  
8010540f:	c3                   	ret    
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = create(path, T_DIR, 0, 0)) == 0){
    end_op();
80105410:	e8 5b d8 ff ff       	call   80102c70 <end_op>
    return -1;
80105415:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
8010541a:	c9                   	leave  
8010541b:	c3                   	ret    
8010541c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105420 <sys_mknod>:

int
sys_mknod(void)
{
80105420:	55                   	push   %ebp
80105421:	89 e5                	mov    %esp,%ebp
80105423:	83 ec 18             	sub    $0x18,%esp
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
80105426:	e8 d5 d7 ff ff       	call   80102c00 <begin_op>
  if((argstr(0, &path)) < 0 ||
8010542b:	8d 45 ec             	lea    -0x14(%ebp),%eax
8010542e:	83 ec 08             	sub    $0x8,%esp
80105431:	50                   	push   %eax
80105432:	6a 00                	push   $0x0
80105434:	e8 07 f6 ff ff       	call   80104a40 <argstr>
80105439:	83 c4 10             	add    $0x10,%esp
8010543c:	85 c0                	test   %eax,%eax
8010543e:	78 60                	js     801054a0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
80105440:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105443:	83 ec 08             	sub    $0x8,%esp
80105446:	50                   	push   %eax
80105447:	6a 01                	push   $0x1
80105449:	e8 62 f5 ff ff       	call   801049b0 <argint>
  struct inode *ip;
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
8010544e:	83 c4 10             	add    $0x10,%esp
80105451:	85 c0                	test   %eax,%eax
80105453:	78 4b                	js     801054a0 <sys_mknod+0x80>
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
80105455:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105458:	83 ec 08             	sub    $0x8,%esp
8010545b:	50                   	push   %eax
8010545c:	6a 02                	push   $0x2
8010545e:	e8 4d f5 ff ff       	call   801049b0 <argint>
  char *path;
  int major, minor;

  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
80105463:	83 c4 10             	add    $0x10,%esp
80105466:	85 c0                	test   %eax,%eax
80105468:	78 36                	js     801054a0 <sys_mknod+0x80>
     argint(2, &minor) < 0 ||
8010546a:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
8010546e:	83 ec 0c             	sub    $0xc,%esp
80105471:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105475:	ba 03 00 00 00       	mov    $0x3,%edx
8010547a:	50                   	push   %eax
8010547b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010547e:	e8 ad f6 ff ff       	call   80104b30 <create>
80105483:	83 c4 10             	add    $0x10,%esp
80105486:	85 c0                	test   %eax,%eax
80105488:	74 16                	je     801054a0 <sys_mknod+0x80>
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
    return -1;
  }
  iunlockput(ip);
8010548a:	83 ec 0c             	sub    $0xc,%esp
8010548d:	50                   	push   %eax
8010548e:	e8 7d c4 ff ff       	call   80101910 <iunlockput>
  end_op();
80105493:	e8 d8 d7 ff ff       	call   80102c70 <end_op>
  return 0;
80105498:	83 c4 10             	add    $0x10,%esp
8010549b:	31 c0                	xor    %eax,%eax
}
8010549d:	c9                   	leave  
8010549e:	c3                   	ret    
8010549f:	90                   	nop
  begin_op();
  if((argstr(0, &path)) < 0 ||
     argint(1, &major) < 0 ||
     argint(2, &minor) < 0 ||
     (ip = create(path, T_DEV, major, minor)) == 0){
    end_op();
801054a0:	e8 cb d7 ff ff       	call   80102c70 <end_op>
    return -1;
801054a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  iunlockput(ip);
  end_op();
  return 0;
}
801054aa:	c9                   	leave  
801054ab:	c3                   	ret    
801054ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054b0 <sys_chdir>:

int
sys_chdir(void)
{
801054b0:	55                   	push   %ebp
801054b1:	89 e5                	mov    %esp,%ebp
801054b3:	53                   	push   %ebx
801054b4:	83 ec 14             	sub    $0x14,%esp
  char *path;
  struct inode *ip;

  begin_op();
801054b7:	e8 44 d7 ff ff       	call   80102c00 <begin_op>
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
801054bc:	8d 45 f4             	lea    -0xc(%ebp),%eax
801054bf:	83 ec 08             	sub    $0x8,%esp
801054c2:	50                   	push   %eax
801054c3:	6a 00                	push   $0x0
801054c5:	e8 76 f5 ff ff       	call   80104a40 <argstr>
801054ca:	83 c4 10             	add    $0x10,%esp
801054cd:	85 c0                	test   %eax,%eax
801054cf:	78 7f                	js     80105550 <sys_chdir+0xa0>
801054d1:	83 ec 0c             	sub    $0xc,%esp
801054d4:	ff 75 f4             	pushl  -0xc(%ebp)
801054d7:	e8 f4 c9 ff ff       	call   80101ed0 <namei>
801054dc:	83 c4 10             	add    $0x10,%esp
801054df:	85 c0                	test   %eax,%eax
801054e1:	89 c3                	mov    %eax,%ebx
801054e3:	74 6b                	je     80105550 <sys_chdir+0xa0>
    end_op();
    return -1;
  }
  ilock(ip);
801054e5:	83 ec 0c             	sub    $0xc,%esp
801054e8:	50                   	push   %eax
801054e9:	e8 b2 c1 ff ff       	call   801016a0 <ilock>
  if(ip->type != T_DIR){
801054ee:	83 c4 10             	add    $0x10,%esp
801054f1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801054f6:	75 38                	jne    80105530 <sys_chdir+0x80>
    iunlockput(ip);
    end_op();
    return -1;
  }
  iunlock(ip);
801054f8:	83 ec 0c             	sub    $0xc,%esp
801054fb:	53                   	push   %ebx
801054fc:	e8 7f c2 ff ff       	call   80101780 <iunlock>
  iput(proc->cwd);
80105501:	58                   	pop    %eax
80105502:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105508:	ff 70 68             	pushl  0x68(%eax)
8010550b:	e8 c0 c2 ff ff       	call   801017d0 <iput>
  end_op();
80105510:	e8 5b d7 ff ff       	call   80102c70 <end_op>
  proc->cwd = ip;
80105515:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return 0;
8010551b:	83 c4 10             	add    $0x10,%esp
    return -1;
  }
  iunlock(ip);
  iput(proc->cwd);
  end_op();
  proc->cwd = ip;
8010551e:	89 58 68             	mov    %ebx,0x68(%eax)
  return 0;
80105521:	31 c0                	xor    %eax,%eax
}
80105523:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105526:	c9                   	leave  
80105527:	c3                   	ret    
80105528:	90                   	nop
80105529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    end_op();
    return -1;
  }
  ilock(ip);
  if(ip->type != T_DIR){
    iunlockput(ip);
80105530:	83 ec 0c             	sub    $0xc,%esp
80105533:	53                   	push   %ebx
80105534:	e8 d7 c3 ff ff       	call   80101910 <iunlockput>
    end_op();
80105539:	e8 32 d7 ff ff       	call   80102c70 <end_op>
    return -1;
8010553e:	83 c4 10             	add    $0x10,%esp
80105541:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105546:	eb db                	jmp    80105523 <sys_chdir+0x73>
80105548:	90                   	nop
80105549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  char *path;
  struct inode *ip;

  begin_op();
  if(argstr(0, &path) < 0 || (ip = namei(path)) == 0){
    end_op();
80105550:	e8 1b d7 ff ff       	call   80102c70 <end_op>
    return -1;
80105555:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010555a:	eb c7                	jmp    80105523 <sys_chdir+0x73>
8010555c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105560 <sys_exec>:
  return 0;
}

int
sys_exec(void)
{
80105560:	55                   	push   %ebp
80105561:	89 e5                	mov    %esp,%ebp
80105563:	57                   	push   %edi
80105564:	56                   	push   %esi
80105565:	53                   	push   %ebx
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105566:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
  return 0;
}

int
sys_exec(void)
{
8010556c:	81 ec a4 00 00 00    	sub    $0xa4,%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
80105572:	50                   	push   %eax
80105573:	6a 00                	push   $0x0
80105575:	e8 c6 f4 ff ff       	call   80104a40 <argstr>
8010557a:	83 c4 10             	add    $0x10,%esp
8010557d:	85 c0                	test   %eax,%eax
8010557f:	78 7f                	js     80105600 <sys_exec+0xa0>
80105581:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105587:	83 ec 08             	sub    $0x8,%esp
8010558a:	50                   	push   %eax
8010558b:	6a 01                	push   $0x1
8010558d:	e8 1e f4 ff ff       	call   801049b0 <argint>
80105592:	83 c4 10             	add    $0x10,%esp
80105595:	85 c0                	test   %eax,%eax
80105597:	78 67                	js     80105600 <sys_exec+0xa0>
    return -1;
  }
  memset(argv, 0, sizeof(argv));
80105599:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
8010559f:	83 ec 04             	sub    $0x4,%esp
801055a2:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
801055a8:	68 80 00 00 00       	push   $0x80
801055ad:	6a 00                	push   $0x0
801055af:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
801055b5:	50                   	push   %eax
801055b6:	31 db                	xor    %ebx,%ebx
801055b8:	e8 03 f1 ff ff       	call   801046c0 <memset>
801055bd:	83 c4 10             	add    $0x10,%esp
  for(i=0;; i++){
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
801055c0:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
801055c6:	83 ec 08             	sub    $0x8,%esp
801055c9:	57                   	push   %edi
801055ca:	8d 04 98             	lea    (%eax,%ebx,4),%eax
801055cd:	50                   	push   %eax
801055ce:	e8 5d f3 ff ff       	call   80104930 <fetchint>
801055d3:	83 c4 10             	add    $0x10,%esp
801055d6:	85 c0                	test   %eax,%eax
801055d8:	78 26                	js     80105600 <sys_exec+0xa0>
      return -1;
    if(uarg == 0){
801055da:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
801055e0:	85 c0                	test   %eax,%eax
801055e2:	74 2c                	je     80105610 <sys_exec+0xb0>
      argv[i] = 0;
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
801055e4:	83 ec 08             	sub    $0x8,%esp
801055e7:	56                   	push   %esi
801055e8:	50                   	push   %eax
801055e9:	e8 72 f3 ff ff       	call   80104960 <fetchstr>
801055ee:	83 c4 10             	add    $0x10,%esp
801055f1:	85 c0                	test   %eax,%eax
801055f3:	78 0b                	js     80105600 <sys_exec+0xa0>

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
  }
  memset(argv, 0, sizeof(argv));
  for(i=0;; i++){
801055f5:	83 c3 01             	add    $0x1,%ebx
801055f8:	83 c6 04             	add    $0x4,%esi
    if(i >= NELEM(argv))
801055fb:	83 fb 20             	cmp    $0x20,%ebx
801055fe:	75 c0                	jne    801055c0 <sys_exec+0x60>
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105600:	8d 65 f4             	lea    -0xc(%ebp),%esp
  char *path, *argv[MAXARG];
  int i;
  uint uargv, uarg;

  if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0){
    return -1;
80105603:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
}
80105608:	5b                   	pop    %ebx
80105609:	5e                   	pop    %esi
8010560a:	5f                   	pop    %edi
8010560b:	5d                   	pop    %ebp
8010560c:	c3                   	ret    
8010560d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105610:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105616:	83 ec 08             	sub    $0x8,%esp
    if(i >= NELEM(argv))
      return -1;
    if(fetchint(uargv+4*i, (int*)&uarg) < 0)
      return -1;
    if(uarg == 0){
      argv[i] = 0;
80105619:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105620:	00 00 00 00 
      break;
    }
    if(fetchstr(uarg, &argv[i]) < 0)
      return -1;
  }
  return exec(path, argv);
80105624:	50                   	push   %eax
80105625:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
8010562b:	e8 c0 b3 ff ff       	call   801009f0 <exec>
80105630:	83 c4 10             	add    $0x10,%esp
}
80105633:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105636:	5b                   	pop    %ebx
80105637:	5e                   	pop    %esi
80105638:	5f                   	pop    %edi
80105639:	5d                   	pop    %ebp
8010563a:	c3                   	ret    
8010563b:	90                   	nop
8010563c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105640 <sys_pipe>:

int
sys_pipe(void)
{
80105640:	55                   	push   %ebp
80105641:	89 e5                	mov    %esp,%ebp
80105643:	57                   	push   %edi
80105644:	56                   	push   %esi
80105645:	53                   	push   %ebx
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
80105646:	8d 45 dc             	lea    -0x24(%ebp),%eax
  return exec(path, argv);
}

int
sys_pipe(void)
{
80105649:	83 ec 20             	sub    $0x20,%esp
  int *fd;
  struct file *rf, *wf;
  int fd0, fd1;

  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
8010564c:	6a 08                	push   $0x8
8010564e:	50                   	push   %eax
8010564f:	6a 00                	push   $0x0
80105651:	e8 9a f3 ff ff       	call   801049f0 <argptr>
80105656:	83 c4 10             	add    $0x10,%esp
80105659:	85 c0                	test   %eax,%eax
8010565b:	78 48                	js     801056a5 <sys_pipe+0x65>
    return -1;
  if(pipealloc(&rf, &wf) < 0)
8010565d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105660:	83 ec 08             	sub    $0x8,%esp
80105663:	50                   	push   %eax
80105664:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105667:	50                   	push   %eax
80105668:	e8 33 dd ff ff       	call   801033a0 <pipealloc>
8010566d:	83 c4 10             	add    $0x10,%esp
80105670:	85 c0                	test   %eax,%eax
80105672:	78 31                	js     801056a5 <sys_pipe+0x65>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
80105674:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80105677:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
8010567e:	31 c0                	xor    %eax,%eax
    if(proc->ofile[fd] == 0){
80105680:	8b 54 81 28          	mov    0x28(%ecx,%eax,4),%edx
80105684:	85 d2                	test   %edx,%edx
80105686:	74 28                	je     801056b0 <sys_pipe+0x70>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
80105688:	83 c0 01             	add    $0x1,%eax
8010568b:	83 f8 10             	cmp    $0x10,%eax
8010568e:	75 f0                	jne    80105680 <sys_pipe+0x40>
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
    fileclose(rf);
80105690:	83 ec 0c             	sub    $0xc,%esp
80105693:	53                   	push   %ebx
80105694:	e8 c7 b7 ff ff       	call   80100e60 <fileclose>
    fileclose(wf);
80105699:	58                   	pop    %eax
8010569a:	ff 75 e4             	pushl  -0x1c(%ebp)
8010569d:	e8 be b7 ff ff       	call   80100e60 <fileclose>
    return -1;
801056a2:	83 c4 10             	add    $0x10,%esp
801056a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056aa:	eb 45                	jmp    801056f1 <sys_pipe+0xb1>
801056ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801056b0:	8d 34 81             	lea    (%ecx,%eax,4),%esi
  if(argptr(0, (void*)&fd, 2*sizeof(fd[0])) < 0)
    return -1;
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
801056b3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801056b6:	31 d2                	xor    %edx,%edx
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
801056b8:	89 5e 28             	mov    %ebx,0x28(%esi)
801056bb:	90                   	nop
801056bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
801056c0:	83 7c 91 28 00       	cmpl   $0x0,0x28(%ecx,%edx,4)
801056c5:	74 19                	je     801056e0 <sys_pipe+0xa0>
static int
fdalloc(struct file *f)
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
801056c7:	83 c2 01             	add    $0x1,%edx
801056ca:	83 fa 10             	cmp    $0x10,%edx
801056cd:	75 f1                	jne    801056c0 <sys_pipe+0x80>
  if(pipealloc(&rf, &wf) < 0)
    return -1;
  fd0 = -1;
  if((fd0 = fdalloc(rf)) < 0 || (fd1 = fdalloc(wf)) < 0){
    if(fd0 >= 0)
      proc->ofile[fd0] = 0;
801056cf:	c7 46 28 00 00 00 00 	movl   $0x0,0x28(%esi)
801056d6:	eb b8                	jmp    80105690 <sys_pipe+0x50>
801056d8:	90                   	nop
801056d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  int fd;

  for(fd = 0; fd < NOFILE; fd++){
    if(proc->ofile[fd] == 0){
      proc->ofile[fd] = f;
801056e0:	89 7c 91 28          	mov    %edi,0x28(%ecx,%edx,4)
      proc->ofile[fd0] = 0;
    fileclose(rf);
    fileclose(wf);
    return -1;
  }
  fd[0] = fd0;
801056e4:	8b 4d dc             	mov    -0x24(%ebp),%ecx
801056e7:	89 01                	mov    %eax,(%ecx)
  fd[1] = fd1;
801056e9:	8b 45 dc             	mov    -0x24(%ebp),%eax
801056ec:	89 50 04             	mov    %edx,0x4(%eax)
  return 0;
801056ef:	31 c0                	xor    %eax,%eax
}
801056f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801056f4:	5b                   	pop    %ebx
801056f5:	5e                   	pop    %esi
801056f6:	5f                   	pop    %edi
801056f7:	5d                   	pop    %ebp
801056f8:	c3                   	ret    
801056f9:	66 90                	xchg   %ax,%ax
801056fb:	66 90                	xchg   %ax,%ax
801056fd:	66 90                	xchg   %ax,%ax
801056ff:	90                   	nop

80105700 <sys_fork>:
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
80105700:	55                   	push   %ebp
80105701:	89 e5                	mov    %esp,%ebp
  return fork();
}
80105703:	5d                   	pop    %ebp
#include "proc.h"

int
sys_fork(void)
{
  return fork();
80105704:	e9 67 e3 ff ff       	jmp    80103a70 <fork>
80105709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105710 <sys_exit>:
}

int
sys_exit(void)
{
80105710:	55                   	push   %ebp
80105711:	89 e5                	mov    %esp,%ebp
80105713:	83 ec 08             	sub    $0x8,%esp
  exit();
80105716:	e8 e5 e5 ff ff       	call   80103d00 <exit>
  return 0;  // not reached
}
8010571b:	31 c0                	xor    %eax,%eax
8010571d:	c9                   	leave  
8010571e:	c3                   	ret    
8010571f:	90                   	nop

80105720 <sys_wait>:

int
sys_wait(void)
{
80105720:	55                   	push   %ebp
80105721:	89 e5                	mov    %esp,%ebp
  return wait();
}
80105723:	5d                   	pop    %ebp
}

int
sys_wait(void)
{
  return wait();
80105724:	e9 27 e8 ff ff       	jmp    80103f50 <wait>
80105729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105730 <sys_kill>:
}

int
sys_kill(void)
{
80105730:	55                   	push   %ebp
80105731:	89 e5                	mov    %esp,%ebp
80105733:	83 ec 20             	sub    $0x20,%esp
  int pid;

  if(argint(0, &pid) < 0)
80105736:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105739:	50                   	push   %eax
8010573a:	6a 00                	push   $0x0
8010573c:	e8 6f f2 ff ff       	call   801049b0 <argint>
80105741:	83 c4 10             	add    $0x10,%esp
80105744:	85 c0                	test   %eax,%eax
80105746:	78 18                	js     80105760 <sys_kill+0x30>
    return -1;
  return kill(pid);
80105748:	83 ec 0c             	sub    $0xc,%esp
8010574b:	ff 75 f4             	pushl  -0xc(%ebp)
8010574e:	e8 4d e9 ff ff       	call   801040a0 <kill>
80105753:	83 c4 10             	add    $0x10,%esp
}
80105756:	c9                   	leave  
80105757:	c3                   	ret    
80105758:	90                   	nop
80105759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
80105760:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  return kill(pid);
}
80105765:	c9                   	leave  
80105766:	c3                   	ret    
80105767:	89 f6                	mov    %esi,%esi
80105769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105770 <sys_getpid>:

int
sys_getpid(void)
{
  return proc->pid;
80105770:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  return kill(pid);
}

int
sys_getpid(void)
{
80105776:	55                   	push   %ebp
80105777:	89 e5                	mov    %esp,%ebp
  return proc->pid;
80105779:	8b 40 10             	mov    0x10(%eax),%eax
}
8010577c:	5d                   	pop    %ebp
8010577d:	c3                   	ret    
8010577e:	66 90                	xchg   %ax,%ax

80105780 <sys_sbrk>:

int
sys_sbrk(void)
{
80105780:	55                   	push   %ebp
80105781:	89 e5                	mov    %esp,%ebp
80105783:	53                   	push   %ebx
  int addr;
  int n;

  if(argint(0, &n) < 0)
80105784:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return proc->pid;
}

int
sys_sbrk(void)
{
80105787:	83 ec 1c             	sub    $0x1c,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
8010578a:	50                   	push   %eax
8010578b:	6a 00                	push   $0x0
8010578d:	e8 1e f2 ff ff       	call   801049b0 <argint>
80105792:	83 c4 10             	add    $0x10,%esp
80105795:	85 c0                	test   %eax,%eax
80105797:	78 27                	js     801057c0 <sys_sbrk+0x40>
    return -1;
  addr = proc->sz;
80105799:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
  if(growproc(n) < 0)
8010579f:	83 ec 0c             	sub    $0xc,%esp
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
801057a2:	8b 18                	mov    (%eax),%ebx
  if(growproc(n) < 0)
801057a4:	ff 75 f4             	pushl  -0xc(%ebp)
801057a7:	e8 54 e2 ff ff       	call   80103a00 <growproc>
801057ac:	83 c4 10             	add    $0x10,%esp
801057af:	85 c0                	test   %eax,%eax
801057b1:	78 0d                	js     801057c0 <sys_sbrk+0x40>
    return -1;
  return addr;
801057b3:	89 d8                	mov    %ebx,%eax
}
801057b5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801057b8:	c9                   	leave  
801057b9:	c3                   	ret    
801057ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
801057c0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057c5:	eb ee                	jmp    801057b5 <sys_sbrk+0x35>
801057c7:	89 f6                	mov    %esi,%esi
801057c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057d0 <sys_sleep>:
  return addr;
}

int
sys_sleep(void)
{
801057d0:	55                   	push   %ebp
801057d1:	89 e5                	mov    %esp,%ebp
801057d3:	53                   	push   %ebx
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801057d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
  return addr;
}

int
sys_sleep(void)
{
801057d7:	83 ec 1c             	sub    $0x1c,%esp
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
801057da:	50                   	push   %eax
801057db:	6a 00                	push   $0x0
801057dd:	e8 ce f1 ff ff       	call   801049b0 <argint>
801057e2:	83 c4 10             	add    $0x10,%esp
801057e5:	85 c0                	test   %eax,%eax
801057e7:	0f 88 8a 00 00 00    	js     80105877 <sys_sleep+0xa7>
    return -1;
  acquire(&tickslock);
801057ed:	83 ec 0c             	sub    $0xc,%esp
801057f0:	68 e0 90 11 80       	push   $0x801190e0
801057f5:	e8 96 ec ff ff       	call   80104490 <acquire>
  ticks0 = ticks;
  while(ticks - ticks0 < n){
801057fa:	8b 55 f4             	mov    -0xc(%ebp),%edx
801057fd:	83 c4 10             	add    $0x10,%esp
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
80105800:	8b 1d 20 99 11 80    	mov    0x80119920,%ebx
  while(ticks - ticks0 < n){
80105806:	85 d2                	test   %edx,%edx
80105808:	75 27                	jne    80105831 <sys_sleep+0x61>
8010580a:	eb 54                	jmp    80105860 <sys_sleep+0x90>
8010580c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
80105810:	83 ec 08             	sub    $0x8,%esp
80105813:	68 e0 90 11 80       	push   $0x801190e0
80105818:	68 20 99 11 80       	push   $0x80119920
8010581d:	e8 6e e6 ff ff       	call   80103e90 <sleep>

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
80105822:	a1 20 99 11 80       	mov    0x80119920,%eax
80105827:	83 c4 10             	add    $0x10,%esp
8010582a:	29 d8                	sub    %ebx,%eax
8010582c:	3b 45 f4             	cmp    -0xc(%ebp),%eax
8010582f:	73 2f                	jae    80105860 <sys_sleep+0x90>
    if(proc->killed){
80105831:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105837:	8b 40 24             	mov    0x24(%eax),%eax
8010583a:	85 c0                	test   %eax,%eax
8010583c:	74 d2                	je     80105810 <sys_sleep+0x40>
      release(&tickslock);
8010583e:	83 ec 0c             	sub    $0xc,%esp
80105841:	68 e0 90 11 80       	push   $0x801190e0
80105846:	e8 25 ee ff ff       	call   80104670 <release>
      return -1;
8010584b:	83 c4 10             	add    $0x10,%esp
8010584e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}
80105853:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105856:	c9                   	leave  
80105857:	c3                   	ret    
80105858:	90                   	nop
80105859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
80105860:	83 ec 0c             	sub    $0xc,%esp
80105863:	68 e0 90 11 80       	push   $0x801190e0
80105868:	e8 03 ee ff ff       	call   80104670 <release>
  return 0;
8010586d:	83 c4 10             	add    $0x10,%esp
80105870:	31 c0                	xor    %eax,%eax
}
80105872:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105875:	c9                   	leave  
80105876:	c3                   	ret    
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
80105877:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010587c:	eb d5                	jmp    80105853 <sys_sleep+0x83>
8010587e:	66 90                	xchg   %ax,%ax

80105880 <sys_uptime>:

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
80105880:	55                   	push   %ebp
80105881:	89 e5                	mov    %esp,%ebp
80105883:	53                   	push   %ebx
80105884:	83 ec 10             	sub    $0x10,%esp
  uint xticks;

  acquire(&tickslock);
80105887:	68 e0 90 11 80       	push   $0x801190e0
8010588c:	e8 ff eb ff ff       	call   80104490 <acquire>
  xticks = ticks;
80105891:	8b 1d 20 99 11 80    	mov    0x80119920,%ebx
  release(&tickslock);
80105897:	c7 04 24 e0 90 11 80 	movl   $0x801190e0,(%esp)
8010589e:	e8 cd ed ff ff       	call   80104670 <release>
  return xticks;
}
801058a3:	89 d8                	mov    %ebx,%eax
801058a5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801058a8:	c9                   	leave  
801058a9:	c3                   	ret    
801058aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801058b0 <sys_signal>:


/*pazit---------------------------------------------------*/
/*---------------signal---------------*/
int
sys_signal(void){
801058b0:	55                   	push   %ebp
801058b1:	89 e5                	mov    %esp,%ebp
801058b3:	83 ec 20             	sub    $0x20,%esp
 int sig_Num;
 //int handler;
 sighandler_t handler;

 cprintf("sysproc.c : sys_signal nom  for process %d \n",proc->pid);
801058b6:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
801058bc:	ff 70 10             	pushl  0x10(%eax)
801058bf:	68 ac 7b 10 80       	push   $0x80107bac
801058c4:	e8 97 ad ff ff       	call   80100660 <cprintf>
//no signal has negative num 
 if(argint(0,&sig_Num) < 0){   
801058c9:	58                   	pop    %eax
801058ca:	8d 45 f0             	lea    -0x10(%ebp),%eax
801058cd:	5a                   	pop    %edx
801058ce:	50                   	push   %eax
801058cf:	6a 00                	push   $0x0
801058d1:	e8 da f0 ff ff       	call   801049b0 <argint>
801058d6:	83 c4 10             	add    $0x10,%esp
801058d9:	85 c0                	test   %eax,%eax
801058db:	78 2b                	js     80105908 <sys_signal+0x58>
   return (-1);
 }
  //no handler for this signal - print what defult handler should print
 if(argint(1,(int*)&handler) < 0){
801058dd:	8d 45 f4             	lea    -0xc(%ebp),%eax
801058e0:	83 ec 08             	sub    $0x8,%esp
801058e3:	50                   	push   %eax
801058e4:	6a 01                	push   $0x1
801058e6:	e8 c5 f0 ff ff       	call   801049b0 <argint>
801058eb:	83 c4 10             	add    $0x10,%esp
801058ee:	85 c0                	test   %eax,%eax
801058f0:	78 16                	js     80105908 <sys_signal+0x58>
   return (-1);
 }


 return (int)(signal(sig_Num, (sighandler_t)handler));
801058f2:	83 ec 08             	sub    $0x8,%esp
801058f5:	ff 75 f4             	pushl  -0xc(%ebp)
801058f8:	ff 75 f0             	pushl  -0x10(%ebp)
801058fb:	e8 f0 e8 ff ff       	call   801041f0 <signal>
80105900:	83 c4 10             	add    $0x10,%esp

}
80105903:	c9                   	leave  
80105904:	c3                   	ret    
80105905:	8d 76 00             	lea    0x0(%esi),%esi
 sighandler_t handler;

 cprintf("sysproc.c : sys_signal nom  for process %d \n",proc->pid);
//no signal has negative num 
 if(argint(0,&sig_Num) < 0){   
   return (-1);
80105908:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 }


 return (int)(signal(sig_Num, (sighandler_t)handler));

}
8010590d:	c9                   	leave  
8010590e:	c3                   	ret    
8010590f:	90                   	nop

80105910 <sys_sigsend>:
/*---------------sigsend---------------*/
int
sys_sigsend(void){
80105910:	55                   	push   %ebp
80105911:	89 e5                	mov    %esp,%ebp
80105913:	53                   	push   %ebx
80105914:	83 ec 1c             	sub    $0x1c,%esp

 int pid;
 int sig_Num;
 cprintf("sysproc.c : sys_sigsend nom.  for process %d \n",proc->pid);
80105917:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010591d:	ff 70 10             	pushl  0x10(%eax)
80105920:	68 dc 7b 10 80       	push   $0x80107bdc
80105925:	e8 36 ad ff ff       	call   80100660 <cprintf>

 if((argint(0,&pid) < 0) || (argint(1,&sig_Num) < 0) || (argint(1,&sig_Num) > NUMSIG)){
8010592a:	58                   	pop    %eax
8010592b:	8d 45 f0             	lea    -0x10(%ebp),%eax
8010592e:	5a                   	pop    %edx
8010592f:	50                   	push   %eax
80105930:	6a 00                	push   $0x0
80105932:	e8 79 f0 ff ff       	call   801049b0 <argint>
80105937:	83 c4 10             	add    $0x10,%esp
8010593a:	85 c0                	test   %eax,%eax
8010593c:	78 42                	js     80105980 <sys_sigsend+0x70>
8010593e:	8d 5d f4             	lea    -0xc(%ebp),%ebx
80105941:	83 ec 08             	sub    $0x8,%esp
80105944:	53                   	push   %ebx
80105945:	6a 01                	push   $0x1
80105947:	e8 64 f0 ff ff       	call   801049b0 <argint>
8010594c:	83 c4 10             	add    $0x10,%esp
8010594f:	85 c0                	test   %eax,%eax
80105951:	78 2d                	js     80105980 <sys_sigsend+0x70>
80105953:	83 ec 08             	sub    $0x8,%esp
80105956:	53                   	push   %ebx
80105957:	6a 01                	push   $0x1
80105959:	e8 52 f0 ff ff       	call   801049b0 <argint>
8010595e:	83 c4 10             	add    $0x10,%esp
80105961:	83 f8 20             	cmp    $0x20,%eax
80105964:	7f 1a                	jg     80105980 <sys_sigsend+0x70>
   return (-1);
 }

 return sigsend(pid,sig_Num);
80105966:	83 ec 08             	sub    $0x8,%esp
80105969:	ff 75 f4             	pushl  -0xc(%ebp)
8010596c:	ff 75 f0             	pushl  -0x10(%ebp)
8010596f:	e8 ac e8 ff ff       	call   80104220 <sigsend>
80105974:	83 c4 10             	add    $0x10,%esp

}
80105977:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010597a:	c9                   	leave  
8010597b:	c3                   	ret    
8010597c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 int pid;
 int sig_Num;
 cprintf("sysproc.c : sys_sigsend nom.  for process %d \n",proc->pid);

 if((argint(0,&pid) < 0) || (argint(1,&sig_Num) < 0) || (argint(1,&sig_Num) > NUMSIG)){
   return (-1);
80105980:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 }

 return sigsend(pid,sig_Num);

}
80105985:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105988:	c9                   	leave  
80105989:	c3                   	ret    
8010598a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105990 <sys_sigreturn>:
/*---------------sigreturn---------------*/
int 
sys_sigreturn(void){
80105990:	55                   	push   %ebp
80105991:	89 e5                	mov    %esp,%ebp
80105993:	83 ec 10             	sub    $0x10,%esp
 cprintf("sysproc.c : sys_sigreturn for process %d \n",proc->pid);
80105996:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
8010599c:	ff 70 10             	pushl  0x10(%eax)
8010599f:	68 0c 7c 10 80       	push   $0x80107c0c
801059a4:	e8 b7 ac ff ff       	call   80100660 <cprintf>
 return (sigreturn());
801059a9:	83 c4 10             	add    $0x10,%esp
}
801059ac:	c9                   	leave  
}
/*---------------sigreturn---------------*/
int 
sys_sigreturn(void){
 cprintf("sysproc.c : sys_sigreturn for process %d \n",proc->pid);
 return (sigreturn());
801059ad:	e9 fe e8 ff ff       	jmp    801042b0 <sigreturn>
801059b2:	66 90                	xchg   %ax,%ax
801059b4:	66 90                	xchg   %ax,%ax
801059b6:	66 90                	xchg   %ax,%ax
801059b8:	66 90                	xchg   %ax,%ax
801059ba:	66 90                	xchg   %ax,%ax
801059bc:	66 90                	xchg   %ax,%ax
801059be:	66 90                	xchg   %ax,%ax

801059c0 <timerinit>:
#define TIMER_RATEGEN   0x04    // mode 2, rate generator
#define TIMER_16BIT     0x30    // r/w counter 16 bits, LSB first

void
timerinit(void)
{
801059c0:	55                   	push   %ebp
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
801059c1:	ba 43 00 00 00       	mov    $0x43,%edx
801059c6:	b8 34 00 00 00       	mov    $0x34,%eax
801059cb:	89 e5                	mov    %esp,%ebp
801059cd:	83 ec 14             	sub    $0x14,%esp
801059d0:	ee                   	out    %al,(%dx)
801059d1:	ba 40 00 00 00       	mov    $0x40,%edx
801059d6:	b8 9c ff ff ff       	mov    $0xffffff9c,%eax
801059db:	ee                   	out    %al,(%dx)
801059dc:	b8 2e 00 00 00       	mov    $0x2e,%eax
801059e1:	ee                   	out    %al,(%dx)
  // Interrupt 100 times/sec.
  outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  outb(IO_TIMER1, TIMER_DIV(100) % 256);
  outb(IO_TIMER1, TIMER_DIV(100) / 256);
  picenable(IRQ_TIMER);
801059e2:	6a 00                	push   $0x0
801059e4:	e8 e7 d8 ff ff       	call   801032d0 <picenable>
}
801059e9:	83 c4 10             	add    $0x10,%esp
801059ec:	c9                   	leave  
801059ed:	c3                   	ret    

801059ee <sigretimplicit>:
#include "mmu.h"

/*pazit--------------------------------------------*/
.globl sigretimplicit  //for ret add calculate
sigretimplicit:
 addl $4,%esp
801059ee:	83 c4 04             	add    $0x4,%esp
 ret 
801059f1:	c3                   	ret    

801059f2 <alltraps>:

  # vectors.S sends all traps here.
.globl alltraps
alltraps:
  # Build trap frame.
  pushl %ds
801059f2:	1e                   	push   %ds
  pushl %es
801059f3:	06                   	push   %es
  pushl %fs
801059f4:	0f a0                	push   %fs
  pushl %gs
801059f6:	0f a8                	push   %gs
  pushal
801059f8:	60                   	pusha  
  
  # Set up data and per-cpu segments.
  movw $(SEG_KDATA<<3), %ax
801059f9:	66 b8 10 00          	mov    $0x10,%ax
  movw %ax, %ds
801059fd:	8e d8                	mov    %eax,%ds
  movw %ax, %es
801059ff:	8e c0                	mov    %eax,%es
  movw $(SEG_KCPU<<3), %ax
80105a01:	66 b8 18 00          	mov    $0x18,%ax
  movw %ax, %fs
80105a05:	8e e0                	mov    %eax,%fs
  movw %ax, %gs
80105a07:	8e e8                	mov    %eax,%gs



  # Call trap(tf), where tf=%esp
  pushl %esp
80105a09:	54                   	push   %esp
  call trap
80105a0a:	e8 61 02 00 00       	call   80105c70 <trap>
  addl $4, %esp
80105a0f:	83 c4 04             	add    $0x4,%esp

80105a12 <trapret>:
  # Return falls through to trapret...
.globl trapret
trapret:

/*pazit--------------------------------------------*/
  pushl %esp
80105a12:	54                   	push   %esp
  call handling_signal  //calling the function to handle signal from ks
80105a13:	e8 b8 00 00 00       	call   80105ad0 <handling_signal>
  addl $4, %esp
80105a18:	83 c4 04             	add    $0x4,%esp
/*------------------------------------------------*/
  popal
80105a1b:	61                   	popa   
  popl %gs
80105a1c:	0f a9                	pop    %gs
  popl %fs
80105a1e:	0f a1                	pop    %fs
  popl %es
80105a20:	07                   	pop    %es
  popl %ds
80105a21:	1f                   	pop    %ds
  addl $0x8, %esp  # trapno and errcode
80105a22:	83 c4 08             	add    $0x8,%esp
  iret
80105a25:	cf                   	iret   
80105a26:	66 90                	xchg   %ax,%ax
80105a28:	66 90                	xchg   %ax,%ax
80105a2a:	66 90                	xchg   %ax,%ax
80105a2c:	66 90                	xchg   %ax,%ax
80105a2e:	66 90                	xchg   %ax,%ax

80105a30 <defaultSigHandler>:



/*pazit---------------------------------------------------*/

void defaultSigHandler(int sigNum){
80105a30:	55                   	push   %ebp
80105a31:	89 e5                	mov    %esp,%ebp
80105a33:	83 ec 0c             	sub    $0xc,%esp
cprintf("A signal number %d was accepted by process %d",sigNum,proc->pid);
80105a36:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105a3c:	ff 70 10             	pushl  0x10(%eax)
80105a3f:	ff 75 08             	pushl  0x8(%ebp)
80105a42:	68 38 7c 10 80       	push   $0x80107c38
80105a47:	e8 14 ac ff ff       	call   80100660 <cprintf>
}
80105a4c:	83 c4 10             	add    $0x10,%esp
80105a4f:	c9                   	leave  
80105a50:	c3                   	ret    
80105a51:	eb 0d                	jmp    80105a60 <pushHandlingSig>
80105a53:	90                   	nop
80105a54:	90                   	nop
80105a55:	90                   	nop
80105a56:	90                   	nop
80105a57:	90                   	nop
80105a58:	90                   	nop
80105a59:	90                   	nop
80105a5a:	90                   	nop
80105a5b:	90                   	nop
80105a5c:	90                   	nop
80105a5d:	90                   	nop
80105a5e:	90                   	nop
80105a5f:	90                   	nop

80105a60 <pushHandlingSig>:
  proc->tf->eip = (uint)proc->sighandlers[sigIdx];
}
*/


void pushHandlingSig(int sigIdx){
80105a60:	55                   	push   %ebp

  proc->pending[sigIdx] = 0;
80105a61:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
  proc->tf->eip = (uint)proc->sighandlers[sigIdx];
}
*/


void pushHandlingSig(int sigIdx){
80105a68:	89 e5                	mov    %esp,%ebp
80105a6a:	8b 45 08             	mov    0x8(%ebp),%eax

  proc->pending[sigIdx] = 0;
80105a6d:	c7 44 82 7c 00 00 00 	movl   $0x0,0x7c(%edx,%eax,4)
80105a74:	00 
  proc->tf->esp -=4;
80105a75:	8b 4a 18             	mov    0x18(%edx),%ecx
80105a78:	83 69 44 04          	subl   $0x4,0x44(%ecx)
  *((uint*) proc->tf->esp ) = proc->tf->eip;
80105a7c:	8b 52 18             	mov    0x18(%edx),%edx
80105a7f:	8b 4a 38             	mov    0x38(%edx),%ecx
80105a82:	8b 52 44             	mov    0x44(%edx),%edx
80105a85:	89 0a                	mov    %ecx,(%edx)
  /*push into user stack the sig number 4 bytes under stack pointer */
  proc->tf->esp -=4;
80105a87:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105a8e:	8b 4a 18             	mov    0x18(%edx),%ecx
80105a91:	83 69 44 04          	subl   $0x4,0x44(%ecx)
  *((uint*) proc->tf->esp ) = sigIdx;
80105a95:	8b 52 18             	mov    0x18(%edx),%edx
80105a98:	8b 52 44             	mov    0x44(%edx),%edx
80105a9b:	89 02                	mov    %eax,(%edx)
   /*push the sireturn systemcall_function after the signal num into stack, 8 bytes under stack pointer*/
  proc->tf->esp -=4;
80105a9d:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105aa4:	8b 4a 18             	mov    0x18(%edx),%ecx
80105aa7:	83 69 44 04          	subl   $0x4,0x44(%ecx)
  *((uint*) proc->tf->esp ) = proc->sigretAdd;  /*implicit call to sigreturn system call*/
80105aab:	8b 8a 84 01 00 00    	mov    0x184(%edx),%ecx
80105ab1:	8b 52 18             	mov    0x18(%edx),%edx
80105ab4:	8b 52 44             	mov    0x44(%edx),%edx
80105ab7:	89 0a                	mov    %ecx,(%edx)
  /*execute the handler of this sig num*/
  proc->tf->eip = (uint)proc->sighandlers[sigIdx];
80105ab9:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105ac0:	8b 4a 18             	mov    0x18(%edx),%ecx
80105ac3:	8b 84 82 fc 00 00 00 	mov    0xfc(%edx,%eax,4),%eax
80105aca:	89 41 38             	mov    %eax,0x38(%ecx)
}
80105acd:	5d                   	pop    %ebp
80105ace:	c3                   	ret    
80105acf:	90                   	nop

80105ad0 <handling_signal>:

/*check the pending var to see if theres a signal waiting to be executed, if there are, set to 0 the sig_bit in the handkers array, store the current trap in tfToRestore var, put the suitable handler to exacute,set to 1 the procHandlingSigNow var */

void handling_signal(void){ 

 if(proc ==0){return;}  //no user proc running
80105ad0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105ad7:	85 d2                	test   %edx,%edx
80105ad9:	74 58                	je     80105b33 <handling_signal+0x63>



/*check the pending var to see if theres a signal waiting to be executed, if there are, set to 0 the sig_bit in the handkers array, store the current trap in tfToRestore var, put the suitable handler to exacute,set to 1 the procHandlingSigNow var */

void handling_signal(void){ 
80105adb:	55                   	push   %ebp
80105adc:	89 e5                	mov    %esp,%ebp
80105ade:	53                   	push   %ebx
80105adf:	31 db                	xor    %ebx,%ebx
80105ae1:	83 ec 04             	sub    $0x4,%esp
80105ae4:	eb 19                	jmp    80105aff <handling_signal+0x2f>
80105ae6:	8d 76 00             	lea    0x0(%esi),%esi
80105ae9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

 if(proc ==0){return;}  //no user proc running
 //if(xchg(&(proc->procHandlingSigNow),1) ==1){return;} /*already //handling signal*/
 int sigIdx=0;
 for(sigIdx=0;sigIdx<NUMSIG; sigIdx++){
80105af0:	83 c3 01             	add    $0x1,%ebx
80105af3:	83 fb 20             	cmp    $0x20,%ebx
80105af6:	74 37                	je     80105b2f <handling_signal+0x5f>
80105af8:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
80105aff:	8d 04 9a             	lea    (%edx,%ebx,4),%eax
    if(proc->pending[sigIdx] == 1){  //faund  next pending sig
80105b02:	83 78 7c 01          	cmpl   $0x1,0x7c(%eax)
80105b06:	75 e8                	jne    80105af0 <handling_signal+0x20>
        proc->pending[sigIdx] = 0;
      if(proc->sighandlers[sigIdx] == (sighandler_t)defualtHandlerAdd){
80105b08:	81 b8 fc 00 00 00 ff 	cmpl   $0xffff,0xfc(%eax)
80105b0f:	ff 00 00 
 if(proc ==0){return;}  //no user proc running
 //if(xchg(&(proc->procHandlingSigNow),1) ==1){return;} /*already //handling signal*/
 int sigIdx=0;
 for(sigIdx=0;sigIdx<NUMSIG; sigIdx++){
    if(proc->pending[sigIdx] == 1){  //faund  next pending sig
        proc->pending[sigIdx] = 0;
80105b12:	c7 40 7c 00 00 00 00 	movl   $0x0,0x7c(%eax)
      if(proc->sighandlers[sigIdx] == (sighandler_t)defualtHandlerAdd){
80105b19:	74 1d                	je     80105b38 <handling_signal+0x68>
         defaultSigHandler(sigIdx);/*no extern handler - go to def handler*/
         proc->pending[sigIdx] = 0;
      }
      else{
	pushHandlingSig(sigIdx);
80105b1b:	83 ec 0c             	sub    $0xc,%esp
80105b1e:	53                   	push   %ebx
void handling_signal(void){ 

 if(proc ==0){return;}  //no user proc running
 //if(xchg(&(proc->procHandlingSigNow),1) ==1){return;} /*already //handling signal*/
 int sigIdx=0;
 for(sigIdx=0;sigIdx<NUMSIG; sigIdx++){
80105b1f:	83 c3 01             	add    $0x1,%ebx
      if(proc->sighandlers[sigIdx] == (sighandler_t)defualtHandlerAdd){
         defaultSigHandler(sigIdx);/*no extern handler - go to def handler*/
         proc->pending[sigIdx] = 0;
      }
      else{
	pushHandlingSig(sigIdx);
80105b22:	e8 39 ff ff ff       	call   80105a60 <pushHandlingSig>
80105b27:	83 c4 10             	add    $0x10,%esp
void handling_signal(void){ 

 if(proc ==0){return;}  //no user proc running
 //if(xchg(&(proc->procHandlingSigNow),1) ==1){return;} /*already //handling signal*/
 int sigIdx=0;
 for(sigIdx=0;sigIdx<NUMSIG; sigIdx++){
80105b2a:	83 fb 20             	cmp    $0x20,%ebx
80105b2d:	75 c9                	jne    80105af8 <handling_signal+0x28>

   }

 }

}
80105b2f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105b32:	c9                   	leave  
80105b33:	f3 c3                	repz ret 
80105b35:	8d 76 00             	lea    0x0(%esi),%esi


/*pazit---------------------------------------------------*/

void defaultSigHandler(int sigNum){
cprintf("A signal number %d was accepted by process %d",sigNum,proc->pid);
80105b38:	83 ec 04             	sub    $0x4,%esp
80105b3b:	ff 72 10             	pushl  0x10(%edx)
80105b3e:	53                   	push   %ebx
80105b3f:	68 38 7c 10 80       	push   $0x80107c38
80105b44:	e8 17 ab ff ff       	call   80100660 <cprintf>
 for(sigIdx=0;sigIdx<NUMSIG; sigIdx++){
    if(proc->pending[sigIdx] == 1){  //faund  next pending sig
        proc->pending[sigIdx] = 0;
      if(proc->sighandlers[sigIdx] == (sighandler_t)defualtHandlerAdd){
         defaultSigHandler(sigIdx);/*no extern handler - go to def handler*/
         proc->pending[sigIdx] = 0;
80105b49:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105b4f:	83 c4 10             	add    $0x10,%esp
80105b52:	c7 44 98 7c 00 00 00 	movl   $0x0,0x7c(%eax,%ebx,4)
80105b59:	00 
80105b5a:	eb 94                	jmp    80105af0 <handling_signal+0x20>
80105b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105b60 <tvinit>:
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105b60:	31 c0                	xor    %eax,%eax
80105b62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
80105b68:	8b 14 85 0c a0 10 80 	mov    -0x7fef5ff4(,%eax,4),%edx
80105b6f:	b9 08 00 00 00       	mov    $0x8,%ecx
80105b74:	c6 04 c5 24 91 11 80 	movb   $0x0,-0x7fee6edc(,%eax,8)
80105b7b:	00 
80105b7c:	66 89 0c c5 22 91 11 	mov    %cx,-0x7fee6ede(,%eax,8)
80105b83:	80 
80105b84:	c6 04 c5 25 91 11 80 	movb   $0x8e,-0x7fee6edb(,%eax,8)
80105b8b:	8e 
80105b8c:	66 89 14 c5 20 91 11 	mov    %dx,-0x7fee6ee0(,%eax,8)
80105b93:	80 
80105b94:	c1 ea 10             	shr    $0x10,%edx
80105b97:	66 89 14 c5 26 91 11 	mov    %dx,-0x7fee6eda(,%eax,8)
80105b9e:	80 
void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
80105b9f:	83 c0 01             	add    $0x1,%eax
80105ba2:	3d 00 01 00 00       	cmp    $0x100,%eax
80105ba7:	75 bf                	jne    80105b68 <tvinit+0x8>
/*--------------------------------------------------------*/


void
tvinit(void)
{
80105ba9:	55                   	push   %ebp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105baa:	ba 08 00 00 00       	mov    $0x8,%edx
/*--------------------------------------------------------*/


void
tvinit(void)
{
80105baf:	89 e5                	mov    %esp,%ebp
80105bb1:	83 ec 10             	sub    $0x10,%esp
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105bb4:	a1 0c a1 10 80       	mov    0x8010a10c,%eax

  initlock(&tickslock, "time");
80105bb9:	68 03 7d 10 80       	push   $0x80107d03
80105bbe:	68 e0 90 11 80       	push   $0x801190e0
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);
80105bc3:	66 89 15 22 93 11 80 	mov    %dx,0x80119322
80105bca:	c6 05 24 93 11 80 00 	movb   $0x0,0x80119324
80105bd1:	66 a3 20 93 11 80    	mov    %ax,0x80119320
80105bd7:	c1 e8 10             	shr    $0x10,%eax
80105bda:	c6 05 25 93 11 80 ef 	movb   $0xef,0x80119325
80105be1:	66 a3 26 93 11 80    	mov    %ax,0x80119326

  initlock(&tickslock, "time");
80105be7:	e8 84 e8 ff ff       	call   80104470 <initlock>
}
80105bec:	83 c4 10             	add    $0x10,%esp
80105bef:	c9                   	leave  
80105bf0:	c3                   	ret    
80105bf1:	eb 0d                	jmp    80105c00 <idtinit>
80105bf3:	90                   	nop
80105bf4:	90                   	nop
80105bf5:	90                   	nop
80105bf6:	90                   	nop
80105bf7:	90                   	nop
80105bf8:	90                   	nop
80105bf9:	90                   	nop
80105bfa:	90                   	nop
80105bfb:	90                   	nop
80105bfc:	90                   	nop
80105bfd:	90                   	nop
80105bfe:	90                   	nop
80105bff:	90                   	nop

80105c00 <idtinit>:

void
idtinit(void)
{
80105c00:	55                   	push   %ebp
static inline void
lidt(struct gatedesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80105c01:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105c06:	89 e5                	mov    %esp,%ebp
80105c08:	83 ec 10             	sub    $0x10,%esp
80105c0b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
  pd[1] = (uint)p;
80105c0f:	b8 20 91 11 80       	mov    $0x80119120,%eax
80105c14:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  pd[2] = (uint)p >> 16;
80105c18:	c1 e8 10             	shr    $0x10,%eax
80105c1b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)

  asm volatile("lidt (%0)" : : "r" (pd));
80105c1f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105c22:	0f 01 18             	lidtl  (%eax)
  lidt(idt, sizeof(idt));
}
80105c25:	c9                   	leave  
80105c26:	c3                   	ret    
80105c27:	89 f6                	mov    %esi,%esi
80105c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c30 <sys_alarm>:
/*pazit--------------------------------------------------*/
void sys_alarm(void)
{
80105c30:	55                   	push   %ebp
80105c31:	89 e5                	mov    %esp,%ebp
80105c33:	53                   	push   %ebx
  int ticksNum;
  argint(0, &ticksNum);
80105c34:	8d 5d f4             	lea    -0xc(%ebp),%ebx
{
  lidt(idt, sizeof(idt));
}
/*pazit--------------------------------------------------*/
void sys_alarm(void)
{
80105c37:	83 ec 1c             	sub    $0x1c,%esp
  int ticksNum;
  argint(0, &ticksNum);
80105c3a:	53                   	push   %ebx
80105c3b:	6a 00                	push   $0x0
80105c3d:	e8 6e ed ff ff       	call   801049b0 <argint>
 
  if(argint(0, &ticksNum) < 0)
80105c42:	58                   	pop    %eax
80105c43:	5a                   	pop    %edx
80105c44:	53                   	push   %ebx
80105c45:	6a 00                	push   $0x0
80105c47:	e8 64 ed ff ff       	call   801049b0 <argint>
80105c4c:	83 c4 10             	add    $0x10,%esp
80105c4f:	85 c0                	test   %eax,%eax
80105c51:	78 0f                	js     80105c62 <sys_alarm+0x32>
    return;

 //cprintf("\ntrap: sys_alarm: ticksNum= %d \n",ticksNum);

  proc->alarm_ticks_num = ticksNum;  //get the num of ticks to wait from syscall
80105c53:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105c56:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105c5c:	89 90 88 01 00 00    	mov    %edx,0x188(%eax)
}
80105c62:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105c65:	c9                   	leave  
80105c66:	c3                   	ret    
80105c67:	89 f6                	mov    %esi,%esi
80105c69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105c70 <trap>:
/*--------------------------------------------------------*/

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
80105c70:	55                   	push   %ebp
80105c71:	89 e5                	mov    %esp,%ebp
80105c73:	57                   	push   %edi
80105c74:	56                   	push   %esi
80105c75:	53                   	push   %ebx
80105c76:	83 ec 0c             	sub    $0xc,%esp
80105c79:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(tf->trapno == T_SYSCALL){
80105c7c:	8b 43 30             	mov    0x30(%ebx),%eax
80105c7f:	83 f8 40             	cmp    $0x40,%eax
80105c82:	0f 84 f8 00 00 00    	je     80105d80 <trap+0x110>
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
80105c88:	83 e8 20             	sub    $0x20,%eax
80105c8b:	83 f8 1f             	cmp    $0x1f,%eax
80105c8e:	77 68                	ja     80105cf8 <trap+0x88>
80105c90:	ff 24 85 10 7d 10 80 	jmp    *-0x7fef82f0(,%eax,4)
80105c97:	89 f6                	mov    %esi,%esi
80105c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
80105ca0:	e8 7b ca ff ff       	call   80102720 <cpunum>
80105ca5:	85 c0                	test   %eax,%eax
80105ca7:	0f 84 b3 01 00 00    	je     80105e60 <trap+0x1f0>
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
80105cad:	e8 0e cb ff ff       	call   801027c0 <lapiceoi>
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105cb2:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105cb8:	85 c0                	test   %eax,%eax
80105cba:	74 2d                	je     80105ce9 <trap+0x79>
80105cbc:	8b 50 24             	mov    0x24(%eax),%edx
80105cbf:	85 d2                	test   %edx,%edx
80105cc1:	0f 85 86 00 00 00    	jne    80105d4d <trap+0xdd>
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105cc7:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105ccb:	0f 84 ef 00 00 00    	je     80105dc0 <trap+0x150>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105cd1:	8b 40 24             	mov    0x24(%eax),%eax
80105cd4:	85 c0                	test   %eax,%eax
80105cd6:	74 11                	je     80105ce9 <trap+0x79>
80105cd8:	0f b7 43 3c          	movzwl 0x3c(%ebx),%eax
80105cdc:	83 e0 03             	and    $0x3,%eax
80105cdf:	66 83 f8 03          	cmp    $0x3,%ax
80105ce3:	0f 84 c1 00 00 00    	je     80105daa <trap+0x13a>
    exit();
}
80105ce9:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105cec:	5b                   	pop    %ebx
80105ced:	5e                   	pop    %esi
80105cee:	5f                   	pop    %edi
80105cef:	5d                   	pop    %ebp
80105cf0:	c3                   	ret    
80105cf1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
80105cf8:	65 8b 0d 04 00 00 00 	mov    %gs:0x4,%ecx
80105cff:	85 c9                	test   %ecx,%ecx
80105d01:	0f 84 92 01 00 00    	je     80105e99 <trap+0x229>
80105d07:	f6 43 3c 03          	testb  $0x3,0x3c(%ebx)
80105d0b:	0f 84 88 01 00 00    	je     80105e99 <trap+0x229>

static inline uint
rcr2(void)
{
  uint val;
  asm volatile("movl %%cr2,%0" : "=r" (val));
80105d11:	0f 20 d7             	mov    %cr2,%edi
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105d14:	8b 73 38             	mov    0x38(%ebx),%esi
80105d17:	e8 04 ca ff ff       	call   80102720 <cpunum>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105d1c:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105d23:	57                   	push   %edi
80105d24:	56                   	push   %esi
80105d25:	50                   	push   %eax
80105d26:	ff 73 34             	pushl  0x34(%ebx)
80105d29:	ff 73 30             	pushl  0x30(%ebx)
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
80105d2c:	8d 42 6c             	lea    0x6c(%edx),%eax
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
80105d2f:	50                   	push   %eax
80105d30:	ff 72 10             	pushl  0x10(%edx)
80105d33:	68 c0 7c 10 80       	push   $0x80107cc0
80105d38:	e8 23 a9 ff ff       	call   80100660 <cprintf>
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
            rcr2());
    proc->killed = 1;
80105d3d:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105d43:	83 c4 20             	add    $0x20,%esp
80105d46:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105d4d:	0f b7 53 3c          	movzwl 0x3c(%ebx),%edx
80105d51:	83 e2 03             	and    $0x3,%edx
80105d54:	66 83 fa 03          	cmp    $0x3,%dx
80105d58:	0f 85 69 ff ff ff    	jne    80105cc7 <trap+0x57>
    exit();
80105d5e:	e8 9d df ff ff       	call   80103d00 <exit>
80105d63:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105d69:	85 c0                	test   %eax,%eax
80105d6b:	0f 85 56 ff ff ff    	jne    80105cc7 <trap+0x57>
80105d71:	e9 73 ff ff ff       	jmp    80105ce9 <trap+0x79>
80105d76:	8d 76 00             	lea    0x0(%esi),%esi
80105d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
80105d80:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105d86:	8b 70 24             	mov    0x24(%eax),%esi
80105d89:	85 f6                	test   %esi,%esi
80105d8b:	0f 85 bf 00 00 00    	jne    80105e50 <trap+0x1e0>
      exit();
    proc->tf = tf;
80105d91:	89 58 18             	mov    %ebx,0x18(%eax)
    syscall();
80105d94:	e8 27 ed ff ff       	call   80104ac0 <syscall>
    if(proc->killed)
80105d99:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105d9f:	8b 58 24             	mov    0x24(%eax),%ebx
80105da2:	85 db                	test   %ebx,%ebx
80105da4:	0f 84 3f ff ff ff    	je     80105ce9 <trap+0x79>
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
80105daa:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105dad:	5b                   	pop    %ebx
80105dae:	5e                   	pop    %esi
80105daf:	5f                   	pop    %edi
80105db0:	5d                   	pop    %ebp
    if(proc->killed)
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
80105db1:	e9 4a df ff ff       	jmp    80103d00 <exit>
80105db6:	8d 76 00             	lea    0x0(%esi),%esi
80105db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
80105dc0:	83 7b 30 20          	cmpl   $0x20,0x30(%ebx)
80105dc4:	0f 85 07 ff ff ff    	jne    80105cd1 <trap+0x61>
    yield();
80105dca:	e8 81 e0 ff ff       	call   80103e50 <yield>
80105dcf:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
80105dd5:	85 c0                	test   %eax,%eax
80105dd7:	0f 85 f4 fe ff ff    	jne    80105cd1 <trap+0x61>
80105ddd:	e9 07 ff ff ff       	jmp    80105ce9 <trap+0x79>
80105de2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
80105de8:	e8 13 c8 ff ff       	call   80102600 <kbdintr>
    lapiceoi();
80105ded:	e8 ce c9 ff ff       	call   801027c0 <lapiceoi>
    break;
80105df2:	e9 bb fe ff ff       	jmp    80105cb2 <trap+0x42>
80105df7:	89 f6                	mov    %esi,%esi
80105df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  case T_IRQ0 + IRQ_COM1:
    uartintr();
80105e00:	e8 3b 02 00 00       	call   80106040 <uartintr>
80105e05:	e9 a3 fe ff ff       	jmp    80105cad <trap+0x3d>
80105e0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
80105e10:	0f b7 73 3c          	movzwl 0x3c(%ebx),%esi
80105e14:	8b 7b 38             	mov    0x38(%ebx),%edi
80105e17:	e8 04 c9 ff ff       	call   80102720 <cpunum>
80105e1c:	57                   	push   %edi
80105e1d:	56                   	push   %esi
80105e1e:	50                   	push   %eax
80105e1f:	68 68 7c 10 80       	push   $0x80107c68
80105e24:	e8 37 a8 ff ff       	call   80100660 <cprintf>
            cpunum(), tf->cs, tf->eip);
    lapiceoi();
80105e29:	e8 92 c9 ff ff       	call   801027c0 <lapiceoi>
    break;
80105e2e:	83 c4 10             	add    $0x10,%esp
80105e31:	e9 7c fe ff ff       	jmp    80105cb2 <trap+0x42>
80105e36:	8d 76 00             	lea    0x0(%esi),%esi
80105e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    }
    lapiceoi();

    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
80105e40:	e8 2b c2 ff ff       	call   80102070 <ideintr>
    lapiceoi();
80105e45:	e8 76 c9 ff ff       	call   801027c0 <lapiceoi>
    break;
80105e4a:	e9 63 fe ff ff       	jmp    80105cb2 <trap+0x42>
80105e4f:	90                   	nop
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit();
80105e50:	e8 ab de ff ff       	call   80103d00 <exit>
80105e55:	65 a1 04 00 00 00    	mov    %gs:0x4,%eax
80105e5b:	e9 31 ff ff ff       	jmp    80105d91 <trap+0x121>
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
80105e60:	83 ec 0c             	sub    $0xc,%esp
80105e63:	68 e0 90 11 80       	push   $0x801190e0
80105e68:	e8 23 e6 ff ff       	call   80104490 <acquire>
      ticks++;
      wakeup(&ticks);
80105e6d:	c7 04 24 20 99 11 80 	movl   $0x80119920,(%esp)

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
      ticks++;
80105e74:	83 05 20 99 11 80 01 	addl   $0x1,0x80119920
      wakeup(&ticks);
80105e7b:	e8 c0 e1 ff ff       	call   80104040 <wakeup>
      release(&tickslock);
80105e80:	c7 04 24 e0 90 11 80 	movl   $0x801190e0,(%esp)
80105e87:	e8 e4 e7 ff ff       	call   80104670 <release>
      Alarm();
80105e8c:	e8 6f e4 ff ff       	call   80104300 <Alarm>
80105e91:	83 c4 10             	add    $0x10,%esp
80105e94:	e9 14 fe ff ff       	jmp    80105cad <trap+0x3d>
80105e99:	0f 20 d7             	mov    %cr2,%edi

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
80105e9c:	8b 73 38             	mov    0x38(%ebx),%esi
80105e9f:	e8 7c c8 ff ff       	call   80102720 <cpunum>
80105ea4:	83 ec 0c             	sub    $0xc,%esp
80105ea7:	57                   	push   %edi
80105ea8:	56                   	push   %esi
80105ea9:	50                   	push   %eax
80105eaa:	ff 73 30             	pushl  0x30(%ebx)
80105ead:	68 8c 7c 10 80       	push   $0x80107c8c
80105eb2:	e8 a9 a7 ff ff       	call   80100660 <cprintf>
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
80105eb7:	83 c4 14             	add    $0x14,%esp
80105eba:	68 08 7d 10 80       	push   $0x80107d08
80105ebf:	e8 ac a4 ff ff       	call   80100370 <panic>
80105ec4:	66 90                	xchg   %ax,%ax
80105ec6:	66 90                	xchg   %ax,%ax
80105ec8:	66 90                	xchg   %ax,%ax
80105eca:	66 90                	xchg   %ax,%ax
80105ecc:	66 90                	xchg   %ax,%ax
80105ece:	66 90                	xchg   %ax,%ax

80105ed0 <uartgetc>:
}

static int
uartgetc(void)
{
  if(!uart)
80105ed0:	a1 c0 a5 10 80       	mov    0x8010a5c0,%eax
  outb(COM1+0, c);
}

static int
uartgetc(void)
{
80105ed5:	55                   	push   %ebp
80105ed6:	89 e5                	mov    %esp,%ebp
  if(!uart)
80105ed8:	85 c0                	test   %eax,%eax
80105eda:	74 1c                	je     80105ef8 <uartgetc+0x28>
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105edc:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105ee1:	ec                   	in     (%dx),%al
    return -1;
  if(!(inb(COM1+5) & 0x01))
80105ee2:	a8 01                	test   $0x1,%al
80105ee4:	74 12                	je     80105ef8 <uartgetc+0x28>
80105ee6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105eeb:	ec                   	in     (%dx),%al
    return -1;
  return inb(COM1+0);
80105eec:	0f b6 c0             	movzbl %al,%eax
}
80105eef:	5d                   	pop    %ebp
80105ef0:	c3                   	ret    
80105ef1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

static int
uartgetc(void)
{
  if(!uart)
    return -1;
80105ef8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  if(!(inb(COM1+5) & 0x01))
    return -1;
  return inb(COM1+0);
}
80105efd:	5d                   	pop    %ebp
80105efe:	c3                   	ret    
80105eff:	90                   	nop

80105f00 <uartputc.part.0>:
  for(p="xv6...\n"; *p; p++)
    uartputc(*p);
}

void
uartputc(int c)
80105f00:	55                   	push   %ebp
80105f01:	89 e5                	mov    %esp,%ebp
80105f03:	57                   	push   %edi
80105f04:	56                   	push   %esi
80105f05:	53                   	push   %ebx
80105f06:	89 c7                	mov    %eax,%edi
80105f08:	bb 80 00 00 00       	mov    $0x80,%ebx
80105f0d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105f12:	83 ec 0c             	sub    $0xc,%esp
80105f15:	eb 1b                	jmp    80105f32 <uartputc.part.0+0x32>
80105f17:	89 f6                	mov    %esi,%esi
80105f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
80105f20:	83 ec 0c             	sub    $0xc,%esp
80105f23:	6a 0a                	push   $0xa
80105f25:	e8 b6 c8 ff ff       	call   801027e0 <microdelay>
{
  int i;

  if(!uart)
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
80105f2a:	83 c4 10             	add    $0x10,%esp
80105f2d:	83 eb 01             	sub    $0x1,%ebx
80105f30:	74 07                	je     80105f39 <uartputc.part.0+0x39>
80105f32:	89 f2                	mov    %esi,%edx
80105f34:	ec                   	in     (%dx),%al
80105f35:	a8 20                	test   $0x20,%al
80105f37:	74 e7                	je     80105f20 <uartputc.part.0+0x20>
}

static inline void
outb(ushort port, uchar data)
{
  asm volatile("out %0,%1" : : "a" (data), "d" (port));
80105f39:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105f3e:	89 f8                	mov    %edi,%eax
80105f40:	ee                   	out    %al,(%dx)
    microdelay(10);
  outb(COM1+0, c);
}
80105f41:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105f44:	5b                   	pop    %ebx
80105f45:	5e                   	pop    %esi
80105f46:	5f                   	pop    %edi
80105f47:	5d                   	pop    %ebp
80105f48:	c3                   	ret    
80105f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105f50 <uartinit>:

static int uart;    // is there a uart?

void
uartinit(void)
{
80105f50:	55                   	push   %ebp
80105f51:	31 c9                	xor    %ecx,%ecx
80105f53:	89 c8                	mov    %ecx,%eax
80105f55:	89 e5                	mov    %esp,%ebp
80105f57:	57                   	push   %edi
80105f58:	56                   	push   %esi
80105f59:	53                   	push   %ebx
80105f5a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105f5f:	89 da                	mov    %ebx,%edx
80105f61:	83 ec 0c             	sub    $0xc,%esp
80105f64:	ee                   	out    %al,(%dx)
80105f65:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105f6a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105f6f:	89 fa                	mov    %edi,%edx
80105f71:	ee                   	out    %al,(%dx)
80105f72:	b8 0c 00 00 00       	mov    $0xc,%eax
80105f77:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105f7c:	ee                   	out    %al,(%dx)
80105f7d:	be f9 03 00 00       	mov    $0x3f9,%esi
80105f82:	89 c8                	mov    %ecx,%eax
80105f84:	89 f2                	mov    %esi,%edx
80105f86:	ee                   	out    %al,(%dx)
80105f87:	b8 03 00 00 00       	mov    $0x3,%eax
80105f8c:	89 fa                	mov    %edi,%edx
80105f8e:	ee                   	out    %al,(%dx)
80105f8f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105f94:	89 c8                	mov    %ecx,%eax
80105f96:	ee                   	out    %al,(%dx)
80105f97:	b8 01 00 00 00       	mov    $0x1,%eax
80105f9c:	89 f2                	mov    %esi,%edx
80105f9e:	ee                   	out    %al,(%dx)
static inline uchar
inb(ushort port)
{
  uchar data;

  asm volatile("in %1,%0" : "=a" (data) : "d" (port));
80105f9f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105fa4:	ec                   	in     (%dx),%al
  outb(COM1+3, 0x03);    // Lock divisor, 8 data bits.
  outb(COM1+4, 0);
  outb(COM1+1, 0x01);    // Enable receive interrupts.

  // If status is 0xFF, no serial port.
  if(inb(COM1+5) == 0xFF)
80105fa5:	3c ff                	cmp    $0xff,%al
80105fa7:	74 5a                	je     80106003 <uartinit+0xb3>
    return;
  uart = 1;
80105fa9:	c7 05 c0 a5 10 80 01 	movl   $0x1,0x8010a5c0
80105fb0:	00 00 00 
80105fb3:	89 da                	mov    %ebx,%edx
80105fb5:	ec                   	in     (%dx),%al
80105fb6:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105fbb:	ec                   	in     (%dx),%al

  // Acknowledge pre-existing interrupt conditions;
  // enable interrupts.
  inb(COM1+2);
  inb(COM1+0);
  picenable(IRQ_COM1);
80105fbc:	83 ec 0c             	sub    $0xc,%esp
80105fbf:	6a 04                	push   $0x4
80105fc1:	e8 0a d3 ff ff       	call   801032d0 <picenable>
  ioapicenable(IRQ_COM1, 0);
80105fc6:	59                   	pop    %ecx
80105fc7:	5b                   	pop    %ebx
80105fc8:	6a 00                	push   $0x0
80105fca:	6a 04                	push   $0x4
80105fcc:	bb 90 7d 10 80       	mov    $0x80107d90,%ebx
80105fd1:	e8 fa c2 ff ff       	call   801022d0 <ioapicenable>
80105fd6:	83 c4 10             	add    $0x10,%esp
80105fd9:	b8 78 00 00 00       	mov    $0x78,%eax
80105fde:	eb 0a                	jmp    80105fea <uartinit+0x9a>

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105fe0:	83 c3 01             	add    $0x1,%ebx
80105fe3:	0f be 03             	movsbl (%ebx),%eax
80105fe6:	84 c0                	test   %al,%al
80105fe8:	74 19                	je     80106003 <uartinit+0xb3>
void
uartputc(int c)
{
  int i;

  if(!uart)
80105fea:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
80105ff0:	85 d2                	test   %edx,%edx
80105ff2:	74 ec                	je     80105fe0 <uartinit+0x90>
  inb(COM1+0);
  picenable(IRQ_COM1);
  ioapicenable(IRQ_COM1, 0);

  // Announce that we're here.
  for(p="xv6...\n"; *p; p++)
80105ff4:	83 c3 01             	add    $0x1,%ebx
80105ff7:	e8 04 ff ff ff       	call   80105f00 <uartputc.part.0>
80105ffc:	0f be 03             	movsbl (%ebx),%eax
80105fff:	84 c0                	test   %al,%al
80106001:	75 e7                	jne    80105fea <uartinit+0x9a>
    uartputc(*p);
}
80106003:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106006:	5b                   	pop    %ebx
80106007:	5e                   	pop    %esi
80106008:	5f                   	pop    %edi
80106009:	5d                   	pop    %ebp
8010600a:	c3                   	ret    
8010600b:	90                   	nop
8010600c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106010 <uartputc>:
void
uartputc(int c)
{
  int i;

  if(!uart)
80106010:	8b 15 c0 a5 10 80    	mov    0x8010a5c0,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
80106016:	55                   	push   %ebp
80106017:	89 e5                	mov    %esp,%ebp
  int i;

  if(!uart)
80106019:	85 d2                	test   %edx,%edx
    uartputc(*p);
}

void
uartputc(int c)
{
8010601b:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;

  if(!uart)
8010601e:	74 10                	je     80106030 <uartputc+0x20>
    return;
  for(i = 0; i < 128 && !(inb(COM1+5) & 0x20); i++)
    microdelay(10);
  outb(COM1+0, c);
}
80106020:	5d                   	pop    %ebp
80106021:	e9 da fe ff ff       	jmp    80105f00 <uartputc.part.0>
80106026:	8d 76 00             	lea    0x0(%esi),%esi
80106029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106030:	5d                   	pop    %ebp
80106031:	c3                   	ret    
80106032:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106040 <uartintr>:
  return inb(COM1+0);
}

void
uartintr(void)
{
80106040:	55                   	push   %ebp
80106041:	89 e5                	mov    %esp,%ebp
80106043:	83 ec 14             	sub    $0x14,%esp
  consoleintr(uartgetc);
80106046:	68 d0 5e 10 80       	push   $0x80105ed0
8010604b:	e8 a0 a7 ff ff       	call   801007f0 <consoleintr>
}
80106050:	83 c4 10             	add    $0x10,%esp
80106053:	c9                   	leave  
80106054:	c3                   	ret    

80106055 <vector0>:
# generated by vectors.pl - do not edit
# handlers
.globl alltraps
.globl vector0
vector0:
  pushl $0
80106055:	6a 00                	push   $0x0
  pushl $0
80106057:	6a 00                	push   $0x0
  jmp alltraps
80106059:	e9 94 f9 ff ff       	jmp    801059f2 <alltraps>

8010605e <vector1>:
.globl vector1
vector1:
  pushl $0
8010605e:	6a 00                	push   $0x0
  pushl $1
80106060:	6a 01                	push   $0x1
  jmp alltraps
80106062:	e9 8b f9 ff ff       	jmp    801059f2 <alltraps>

80106067 <vector2>:
.globl vector2
vector2:
  pushl $0
80106067:	6a 00                	push   $0x0
  pushl $2
80106069:	6a 02                	push   $0x2
  jmp alltraps
8010606b:	e9 82 f9 ff ff       	jmp    801059f2 <alltraps>

80106070 <vector3>:
.globl vector3
vector3:
  pushl $0
80106070:	6a 00                	push   $0x0
  pushl $3
80106072:	6a 03                	push   $0x3
  jmp alltraps
80106074:	e9 79 f9 ff ff       	jmp    801059f2 <alltraps>

80106079 <vector4>:
.globl vector4
vector4:
  pushl $0
80106079:	6a 00                	push   $0x0
  pushl $4
8010607b:	6a 04                	push   $0x4
  jmp alltraps
8010607d:	e9 70 f9 ff ff       	jmp    801059f2 <alltraps>

80106082 <vector5>:
.globl vector5
vector5:
  pushl $0
80106082:	6a 00                	push   $0x0
  pushl $5
80106084:	6a 05                	push   $0x5
  jmp alltraps
80106086:	e9 67 f9 ff ff       	jmp    801059f2 <alltraps>

8010608b <vector6>:
.globl vector6
vector6:
  pushl $0
8010608b:	6a 00                	push   $0x0
  pushl $6
8010608d:	6a 06                	push   $0x6
  jmp alltraps
8010608f:	e9 5e f9 ff ff       	jmp    801059f2 <alltraps>

80106094 <vector7>:
.globl vector7
vector7:
  pushl $0
80106094:	6a 00                	push   $0x0
  pushl $7
80106096:	6a 07                	push   $0x7
  jmp alltraps
80106098:	e9 55 f9 ff ff       	jmp    801059f2 <alltraps>

8010609d <vector8>:
.globl vector8
vector8:
  pushl $8
8010609d:	6a 08                	push   $0x8
  jmp alltraps
8010609f:	e9 4e f9 ff ff       	jmp    801059f2 <alltraps>

801060a4 <vector9>:
.globl vector9
vector9:
  pushl $0
801060a4:	6a 00                	push   $0x0
  pushl $9
801060a6:	6a 09                	push   $0x9
  jmp alltraps
801060a8:	e9 45 f9 ff ff       	jmp    801059f2 <alltraps>

801060ad <vector10>:
.globl vector10
vector10:
  pushl $10
801060ad:	6a 0a                	push   $0xa
  jmp alltraps
801060af:	e9 3e f9 ff ff       	jmp    801059f2 <alltraps>

801060b4 <vector11>:
.globl vector11
vector11:
  pushl $11
801060b4:	6a 0b                	push   $0xb
  jmp alltraps
801060b6:	e9 37 f9 ff ff       	jmp    801059f2 <alltraps>

801060bb <vector12>:
.globl vector12
vector12:
  pushl $12
801060bb:	6a 0c                	push   $0xc
  jmp alltraps
801060bd:	e9 30 f9 ff ff       	jmp    801059f2 <alltraps>

801060c2 <vector13>:
.globl vector13
vector13:
  pushl $13
801060c2:	6a 0d                	push   $0xd
  jmp alltraps
801060c4:	e9 29 f9 ff ff       	jmp    801059f2 <alltraps>

801060c9 <vector14>:
.globl vector14
vector14:
  pushl $14
801060c9:	6a 0e                	push   $0xe
  jmp alltraps
801060cb:	e9 22 f9 ff ff       	jmp    801059f2 <alltraps>

801060d0 <vector15>:
.globl vector15
vector15:
  pushl $0
801060d0:	6a 00                	push   $0x0
  pushl $15
801060d2:	6a 0f                	push   $0xf
  jmp alltraps
801060d4:	e9 19 f9 ff ff       	jmp    801059f2 <alltraps>

801060d9 <vector16>:
.globl vector16
vector16:
  pushl $0
801060d9:	6a 00                	push   $0x0
  pushl $16
801060db:	6a 10                	push   $0x10
  jmp alltraps
801060dd:	e9 10 f9 ff ff       	jmp    801059f2 <alltraps>

801060e2 <vector17>:
.globl vector17
vector17:
  pushl $17
801060e2:	6a 11                	push   $0x11
  jmp alltraps
801060e4:	e9 09 f9 ff ff       	jmp    801059f2 <alltraps>

801060e9 <vector18>:
.globl vector18
vector18:
  pushl $0
801060e9:	6a 00                	push   $0x0
  pushl $18
801060eb:	6a 12                	push   $0x12
  jmp alltraps
801060ed:	e9 00 f9 ff ff       	jmp    801059f2 <alltraps>

801060f2 <vector19>:
.globl vector19
vector19:
  pushl $0
801060f2:	6a 00                	push   $0x0
  pushl $19
801060f4:	6a 13                	push   $0x13
  jmp alltraps
801060f6:	e9 f7 f8 ff ff       	jmp    801059f2 <alltraps>

801060fb <vector20>:
.globl vector20
vector20:
  pushl $0
801060fb:	6a 00                	push   $0x0
  pushl $20
801060fd:	6a 14                	push   $0x14
  jmp alltraps
801060ff:	e9 ee f8 ff ff       	jmp    801059f2 <alltraps>

80106104 <vector21>:
.globl vector21
vector21:
  pushl $0
80106104:	6a 00                	push   $0x0
  pushl $21
80106106:	6a 15                	push   $0x15
  jmp alltraps
80106108:	e9 e5 f8 ff ff       	jmp    801059f2 <alltraps>

8010610d <vector22>:
.globl vector22
vector22:
  pushl $0
8010610d:	6a 00                	push   $0x0
  pushl $22
8010610f:	6a 16                	push   $0x16
  jmp alltraps
80106111:	e9 dc f8 ff ff       	jmp    801059f2 <alltraps>

80106116 <vector23>:
.globl vector23
vector23:
  pushl $0
80106116:	6a 00                	push   $0x0
  pushl $23
80106118:	6a 17                	push   $0x17
  jmp alltraps
8010611a:	e9 d3 f8 ff ff       	jmp    801059f2 <alltraps>

8010611f <vector24>:
.globl vector24
vector24:
  pushl $0
8010611f:	6a 00                	push   $0x0
  pushl $24
80106121:	6a 18                	push   $0x18
  jmp alltraps
80106123:	e9 ca f8 ff ff       	jmp    801059f2 <alltraps>

80106128 <vector25>:
.globl vector25
vector25:
  pushl $0
80106128:	6a 00                	push   $0x0
  pushl $25
8010612a:	6a 19                	push   $0x19
  jmp alltraps
8010612c:	e9 c1 f8 ff ff       	jmp    801059f2 <alltraps>

80106131 <vector26>:
.globl vector26
vector26:
  pushl $0
80106131:	6a 00                	push   $0x0
  pushl $26
80106133:	6a 1a                	push   $0x1a
  jmp alltraps
80106135:	e9 b8 f8 ff ff       	jmp    801059f2 <alltraps>

8010613a <vector27>:
.globl vector27
vector27:
  pushl $0
8010613a:	6a 00                	push   $0x0
  pushl $27
8010613c:	6a 1b                	push   $0x1b
  jmp alltraps
8010613e:	e9 af f8 ff ff       	jmp    801059f2 <alltraps>

80106143 <vector28>:
.globl vector28
vector28:
  pushl $0
80106143:	6a 00                	push   $0x0
  pushl $28
80106145:	6a 1c                	push   $0x1c
  jmp alltraps
80106147:	e9 a6 f8 ff ff       	jmp    801059f2 <alltraps>

8010614c <vector29>:
.globl vector29
vector29:
  pushl $0
8010614c:	6a 00                	push   $0x0
  pushl $29
8010614e:	6a 1d                	push   $0x1d
  jmp alltraps
80106150:	e9 9d f8 ff ff       	jmp    801059f2 <alltraps>

80106155 <vector30>:
.globl vector30
vector30:
  pushl $0
80106155:	6a 00                	push   $0x0
  pushl $30
80106157:	6a 1e                	push   $0x1e
  jmp alltraps
80106159:	e9 94 f8 ff ff       	jmp    801059f2 <alltraps>

8010615e <vector31>:
.globl vector31
vector31:
  pushl $0
8010615e:	6a 00                	push   $0x0
  pushl $31
80106160:	6a 1f                	push   $0x1f
  jmp alltraps
80106162:	e9 8b f8 ff ff       	jmp    801059f2 <alltraps>

80106167 <vector32>:
.globl vector32
vector32:
  pushl $0
80106167:	6a 00                	push   $0x0
  pushl $32
80106169:	6a 20                	push   $0x20
  jmp alltraps
8010616b:	e9 82 f8 ff ff       	jmp    801059f2 <alltraps>

80106170 <vector33>:
.globl vector33
vector33:
  pushl $0
80106170:	6a 00                	push   $0x0
  pushl $33
80106172:	6a 21                	push   $0x21
  jmp alltraps
80106174:	e9 79 f8 ff ff       	jmp    801059f2 <alltraps>

80106179 <vector34>:
.globl vector34
vector34:
  pushl $0
80106179:	6a 00                	push   $0x0
  pushl $34
8010617b:	6a 22                	push   $0x22
  jmp alltraps
8010617d:	e9 70 f8 ff ff       	jmp    801059f2 <alltraps>

80106182 <vector35>:
.globl vector35
vector35:
  pushl $0
80106182:	6a 00                	push   $0x0
  pushl $35
80106184:	6a 23                	push   $0x23
  jmp alltraps
80106186:	e9 67 f8 ff ff       	jmp    801059f2 <alltraps>

8010618b <vector36>:
.globl vector36
vector36:
  pushl $0
8010618b:	6a 00                	push   $0x0
  pushl $36
8010618d:	6a 24                	push   $0x24
  jmp alltraps
8010618f:	e9 5e f8 ff ff       	jmp    801059f2 <alltraps>

80106194 <vector37>:
.globl vector37
vector37:
  pushl $0
80106194:	6a 00                	push   $0x0
  pushl $37
80106196:	6a 25                	push   $0x25
  jmp alltraps
80106198:	e9 55 f8 ff ff       	jmp    801059f2 <alltraps>

8010619d <vector38>:
.globl vector38
vector38:
  pushl $0
8010619d:	6a 00                	push   $0x0
  pushl $38
8010619f:	6a 26                	push   $0x26
  jmp alltraps
801061a1:	e9 4c f8 ff ff       	jmp    801059f2 <alltraps>

801061a6 <vector39>:
.globl vector39
vector39:
  pushl $0
801061a6:	6a 00                	push   $0x0
  pushl $39
801061a8:	6a 27                	push   $0x27
  jmp alltraps
801061aa:	e9 43 f8 ff ff       	jmp    801059f2 <alltraps>

801061af <vector40>:
.globl vector40
vector40:
  pushl $0
801061af:	6a 00                	push   $0x0
  pushl $40
801061b1:	6a 28                	push   $0x28
  jmp alltraps
801061b3:	e9 3a f8 ff ff       	jmp    801059f2 <alltraps>

801061b8 <vector41>:
.globl vector41
vector41:
  pushl $0
801061b8:	6a 00                	push   $0x0
  pushl $41
801061ba:	6a 29                	push   $0x29
  jmp alltraps
801061bc:	e9 31 f8 ff ff       	jmp    801059f2 <alltraps>

801061c1 <vector42>:
.globl vector42
vector42:
  pushl $0
801061c1:	6a 00                	push   $0x0
  pushl $42
801061c3:	6a 2a                	push   $0x2a
  jmp alltraps
801061c5:	e9 28 f8 ff ff       	jmp    801059f2 <alltraps>

801061ca <vector43>:
.globl vector43
vector43:
  pushl $0
801061ca:	6a 00                	push   $0x0
  pushl $43
801061cc:	6a 2b                	push   $0x2b
  jmp alltraps
801061ce:	e9 1f f8 ff ff       	jmp    801059f2 <alltraps>

801061d3 <vector44>:
.globl vector44
vector44:
  pushl $0
801061d3:	6a 00                	push   $0x0
  pushl $44
801061d5:	6a 2c                	push   $0x2c
  jmp alltraps
801061d7:	e9 16 f8 ff ff       	jmp    801059f2 <alltraps>

801061dc <vector45>:
.globl vector45
vector45:
  pushl $0
801061dc:	6a 00                	push   $0x0
  pushl $45
801061de:	6a 2d                	push   $0x2d
  jmp alltraps
801061e0:	e9 0d f8 ff ff       	jmp    801059f2 <alltraps>

801061e5 <vector46>:
.globl vector46
vector46:
  pushl $0
801061e5:	6a 00                	push   $0x0
  pushl $46
801061e7:	6a 2e                	push   $0x2e
  jmp alltraps
801061e9:	e9 04 f8 ff ff       	jmp    801059f2 <alltraps>

801061ee <vector47>:
.globl vector47
vector47:
  pushl $0
801061ee:	6a 00                	push   $0x0
  pushl $47
801061f0:	6a 2f                	push   $0x2f
  jmp alltraps
801061f2:	e9 fb f7 ff ff       	jmp    801059f2 <alltraps>

801061f7 <vector48>:
.globl vector48
vector48:
  pushl $0
801061f7:	6a 00                	push   $0x0
  pushl $48
801061f9:	6a 30                	push   $0x30
  jmp alltraps
801061fb:	e9 f2 f7 ff ff       	jmp    801059f2 <alltraps>

80106200 <vector49>:
.globl vector49
vector49:
  pushl $0
80106200:	6a 00                	push   $0x0
  pushl $49
80106202:	6a 31                	push   $0x31
  jmp alltraps
80106204:	e9 e9 f7 ff ff       	jmp    801059f2 <alltraps>

80106209 <vector50>:
.globl vector50
vector50:
  pushl $0
80106209:	6a 00                	push   $0x0
  pushl $50
8010620b:	6a 32                	push   $0x32
  jmp alltraps
8010620d:	e9 e0 f7 ff ff       	jmp    801059f2 <alltraps>

80106212 <vector51>:
.globl vector51
vector51:
  pushl $0
80106212:	6a 00                	push   $0x0
  pushl $51
80106214:	6a 33                	push   $0x33
  jmp alltraps
80106216:	e9 d7 f7 ff ff       	jmp    801059f2 <alltraps>

8010621b <vector52>:
.globl vector52
vector52:
  pushl $0
8010621b:	6a 00                	push   $0x0
  pushl $52
8010621d:	6a 34                	push   $0x34
  jmp alltraps
8010621f:	e9 ce f7 ff ff       	jmp    801059f2 <alltraps>

80106224 <vector53>:
.globl vector53
vector53:
  pushl $0
80106224:	6a 00                	push   $0x0
  pushl $53
80106226:	6a 35                	push   $0x35
  jmp alltraps
80106228:	e9 c5 f7 ff ff       	jmp    801059f2 <alltraps>

8010622d <vector54>:
.globl vector54
vector54:
  pushl $0
8010622d:	6a 00                	push   $0x0
  pushl $54
8010622f:	6a 36                	push   $0x36
  jmp alltraps
80106231:	e9 bc f7 ff ff       	jmp    801059f2 <alltraps>

80106236 <vector55>:
.globl vector55
vector55:
  pushl $0
80106236:	6a 00                	push   $0x0
  pushl $55
80106238:	6a 37                	push   $0x37
  jmp alltraps
8010623a:	e9 b3 f7 ff ff       	jmp    801059f2 <alltraps>

8010623f <vector56>:
.globl vector56
vector56:
  pushl $0
8010623f:	6a 00                	push   $0x0
  pushl $56
80106241:	6a 38                	push   $0x38
  jmp alltraps
80106243:	e9 aa f7 ff ff       	jmp    801059f2 <alltraps>

80106248 <vector57>:
.globl vector57
vector57:
  pushl $0
80106248:	6a 00                	push   $0x0
  pushl $57
8010624a:	6a 39                	push   $0x39
  jmp alltraps
8010624c:	e9 a1 f7 ff ff       	jmp    801059f2 <alltraps>

80106251 <vector58>:
.globl vector58
vector58:
  pushl $0
80106251:	6a 00                	push   $0x0
  pushl $58
80106253:	6a 3a                	push   $0x3a
  jmp alltraps
80106255:	e9 98 f7 ff ff       	jmp    801059f2 <alltraps>

8010625a <vector59>:
.globl vector59
vector59:
  pushl $0
8010625a:	6a 00                	push   $0x0
  pushl $59
8010625c:	6a 3b                	push   $0x3b
  jmp alltraps
8010625e:	e9 8f f7 ff ff       	jmp    801059f2 <alltraps>

80106263 <vector60>:
.globl vector60
vector60:
  pushl $0
80106263:	6a 00                	push   $0x0
  pushl $60
80106265:	6a 3c                	push   $0x3c
  jmp alltraps
80106267:	e9 86 f7 ff ff       	jmp    801059f2 <alltraps>

8010626c <vector61>:
.globl vector61
vector61:
  pushl $0
8010626c:	6a 00                	push   $0x0
  pushl $61
8010626e:	6a 3d                	push   $0x3d
  jmp alltraps
80106270:	e9 7d f7 ff ff       	jmp    801059f2 <alltraps>

80106275 <vector62>:
.globl vector62
vector62:
  pushl $0
80106275:	6a 00                	push   $0x0
  pushl $62
80106277:	6a 3e                	push   $0x3e
  jmp alltraps
80106279:	e9 74 f7 ff ff       	jmp    801059f2 <alltraps>

8010627e <vector63>:
.globl vector63
vector63:
  pushl $0
8010627e:	6a 00                	push   $0x0
  pushl $63
80106280:	6a 3f                	push   $0x3f
  jmp alltraps
80106282:	e9 6b f7 ff ff       	jmp    801059f2 <alltraps>

80106287 <vector64>:
.globl vector64
vector64:
  pushl $0
80106287:	6a 00                	push   $0x0
  pushl $64
80106289:	6a 40                	push   $0x40
  jmp alltraps
8010628b:	e9 62 f7 ff ff       	jmp    801059f2 <alltraps>

80106290 <vector65>:
.globl vector65
vector65:
  pushl $0
80106290:	6a 00                	push   $0x0
  pushl $65
80106292:	6a 41                	push   $0x41
  jmp alltraps
80106294:	e9 59 f7 ff ff       	jmp    801059f2 <alltraps>

80106299 <vector66>:
.globl vector66
vector66:
  pushl $0
80106299:	6a 00                	push   $0x0
  pushl $66
8010629b:	6a 42                	push   $0x42
  jmp alltraps
8010629d:	e9 50 f7 ff ff       	jmp    801059f2 <alltraps>

801062a2 <vector67>:
.globl vector67
vector67:
  pushl $0
801062a2:	6a 00                	push   $0x0
  pushl $67
801062a4:	6a 43                	push   $0x43
  jmp alltraps
801062a6:	e9 47 f7 ff ff       	jmp    801059f2 <alltraps>

801062ab <vector68>:
.globl vector68
vector68:
  pushl $0
801062ab:	6a 00                	push   $0x0
  pushl $68
801062ad:	6a 44                	push   $0x44
  jmp alltraps
801062af:	e9 3e f7 ff ff       	jmp    801059f2 <alltraps>

801062b4 <vector69>:
.globl vector69
vector69:
  pushl $0
801062b4:	6a 00                	push   $0x0
  pushl $69
801062b6:	6a 45                	push   $0x45
  jmp alltraps
801062b8:	e9 35 f7 ff ff       	jmp    801059f2 <alltraps>

801062bd <vector70>:
.globl vector70
vector70:
  pushl $0
801062bd:	6a 00                	push   $0x0
  pushl $70
801062bf:	6a 46                	push   $0x46
  jmp alltraps
801062c1:	e9 2c f7 ff ff       	jmp    801059f2 <alltraps>

801062c6 <vector71>:
.globl vector71
vector71:
  pushl $0
801062c6:	6a 00                	push   $0x0
  pushl $71
801062c8:	6a 47                	push   $0x47
  jmp alltraps
801062ca:	e9 23 f7 ff ff       	jmp    801059f2 <alltraps>

801062cf <vector72>:
.globl vector72
vector72:
  pushl $0
801062cf:	6a 00                	push   $0x0
  pushl $72
801062d1:	6a 48                	push   $0x48
  jmp alltraps
801062d3:	e9 1a f7 ff ff       	jmp    801059f2 <alltraps>

801062d8 <vector73>:
.globl vector73
vector73:
  pushl $0
801062d8:	6a 00                	push   $0x0
  pushl $73
801062da:	6a 49                	push   $0x49
  jmp alltraps
801062dc:	e9 11 f7 ff ff       	jmp    801059f2 <alltraps>

801062e1 <vector74>:
.globl vector74
vector74:
  pushl $0
801062e1:	6a 00                	push   $0x0
  pushl $74
801062e3:	6a 4a                	push   $0x4a
  jmp alltraps
801062e5:	e9 08 f7 ff ff       	jmp    801059f2 <alltraps>

801062ea <vector75>:
.globl vector75
vector75:
  pushl $0
801062ea:	6a 00                	push   $0x0
  pushl $75
801062ec:	6a 4b                	push   $0x4b
  jmp alltraps
801062ee:	e9 ff f6 ff ff       	jmp    801059f2 <alltraps>

801062f3 <vector76>:
.globl vector76
vector76:
  pushl $0
801062f3:	6a 00                	push   $0x0
  pushl $76
801062f5:	6a 4c                	push   $0x4c
  jmp alltraps
801062f7:	e9 f6 f6 ff ff       	jmp    801059f2 <alltraps>

801062fc <vector77>:
.globl vector77
vector77:
  pushl $0
801062fc:	6a 00                	push   $0x0
  pushl $77
801062fe:	6a 4d                	push   $0x4d
  jmp alltraps
80106300:	e9 ed f6 ff ff       	jmp    801059f2 <alltraps>

80106305 <vector78>:
.globl vector78
vector78:
  pushl $0
80106305:	6a 00                	push   $0x0
  pushl $78
80106307:	6a 4e                	push   $0x4e
  jmp alltraps
80106309:	e9 e4 f6 ff ff       	jmp    801059f2 <alltraps>

8010630e <vector79>:
.globl vector79
vector79:
  pushl $0
8010630e:	6a 00                	push   $0x0
  pushl $79
80106310:	6a 4f                	push   $0x4f
  jmp alltraps
80106312:	e9 db f6 ff ff       	jmp    801059f2 <alltraps>

80106317 <vector80>:
.globl vector80
vector80:
  pushl $0
80106317:	6a 00                	push   $0x0
  pushl $80
80106319:	6a 50                	push   $0x50
  jmp alltraps
8010631b:	e9 d2 f6 ff ff       	jmp    801059f2 <alltraps>

80106320 <vector81>:
.globl vector81
vector81:
  pushl $0
80106320:	6a 00                	push   $0x0
  pushl $81
80106322:	6a 51                	push   $0x51
  jmp alltraps
80106324:	e9 c9 f6 ff ff       	jmp    801059f2 <alltraps>

80106329 <vector82>:
.globl vector82
vector82:
  pushl $0
80106329:	6a 00                	push   $0x0
  pushl $82
8010632b:	6a 52                	push   $0x52
  jmp alltraps
8010632d:	e9 c0 f6 ff ff       	jmp    801059f2 <alltraps>

80106332 <vector83>:
.globl vector83
vector83:
  pushl $0
80106332:	6a 00                	push   $0x0
  pushl $83
80106334:	6a 53                	push   $0x53
  jmp alltraps
80106336:	e9 b7 f6 ff ff       	jmp    801059f2 <alltraps>

8010633b <vector84>:
.globl vector84
vector84:
  pushl $0
8010633b:	6a 00                	push   $0x0
  pushl $84
8010633d:	6a 54                	push   $0x54
  jmp alltraps
8010633f:	e9 ae f6 ff ff       	jmp    801059f2 <alltraps>

80106344 <vector85>:
.globl vector85
vector85:
  pushl $0
80106344:	6a 00                	push   $0x0
  pushl $85
80106346:	6a 55                	push   $0x55
  jmp alltraps
80106348:	e9 a5 f6 ff ff       	jmp    801059f2 <alltraps>

8010634d <vector86>:
.globl vector86
vector86:
  pushl $0
8010634d:	6a 00                	push   $0x0
  pushl $86
8010634f:	6a 56                	push   $0x56
  jmp alltraps
80106351:	e9 9c f6 ff ff       	jmp    801059f2 <alltraps>

80106356 <vector87>:
.globl vector87
vector87:
  pushl $0
80106356:	6a 00                	push   $0x0
  pushl $87
80106358:	6a 57                	push   $0x57
  jmp alltraps
8010635a:	e9 93 f6 ff ff       	jmp    801059f2 <alltraps>

8010635f <vector88>:
.globl vector88
vector88:
  pushl $0
8010635f:	6a 00                	push   $0x0
  pushl $88
80106361:	6a 58                	push   $0x58
  jmp alltraps
80106363:	e9 8a f6 ff ff       	jmp    801059f2 <alltraps>

80106368 <vector89>:
.globl vector89
vector89:
  pushl $0
80106368:	6a 00                	push   $0x0
  pushl $89
8010636a:	6a 59                	push   $0x59
  jmp alltraps
8010636c:	e9 81 f6 ff ff       	jmp    801059f2 <alltraps>

80106371 <vector90>:
.globl vector90
vector90:
  pushl $0
80106371:	6a 00                	push   $0x0
  pushl $90
80106373:	6a 5a                	push   $0x5a
  jmp alltraps
80106375:	e9 78 f6 ff ff       	jmp    801059f2 <alltraps>

8010637a <vector91>:
.globl vector91
vector91:
  pushl $0
8010637a:	6a 00                	push   $0x0
  pushl $91
8010637c:	6a 5b                	push   $0x5b
  jmp alltraps
8010637e:	e9 6f f6 ff ff       	jmp    801059f2 <alltraps>

80106383 <vector92>:
.globl vector92
vector92:
  pushl $0
80106383:	6a 00                	push   $0x0
  pushl $92
80106385:	6a 5c                	push   $0x5c
  jmp alltraps
80106387:	e9 66 f6 ff ff       	jmp    801059f2 <alltraps>

8010638c <vector93>:
.globl vector93
vector93:
  pushl $0
8010638c:	6a 00                	push   $0x0
  pushl $93
8010638e:	6a 5d                	push   $0x5d
  jmp alltraps
80106390:	e9 5d f6 ff ff       	jmp    801059f2 <alltraps>

80106395 <vector94>:
.globl vector94
vector94:
  pushl $0
80106395:	6a 00                	push   $0x0
  pushl $94
80106397:	6a 5e                	push   $0x5e
  jmp alltraps
80106399:	e9 54 f6 ff ff       	jmp    801059f2 <alltraps>

8010639e <vector95>:
.globl vector95
vector95:
  pushl $0
8010639e:	6a 00                	push   $0x0
  pushl $95
801063a0:	6a 5f                	push   $0x5f
  jmp alltraps
801063a2:	e9 4b f6 ff ff       	jmp    801059f2 <alltraps>

801063a7 <vector96>:
.globl vector96
vector96:
  pushl $0
801063a7:	6a 00                	push   $0x0
  pushl $96
801063a9:	6a 60                	push   $0x60
  jmp alltraps
801063ab:	e9 42 f6 ff ff       	jmp    801059f2 <alltraps>

801063b0 <vector97>:
.globl vector97
vector97:
  pushl $0
801063b0:	6a 00                	push   $0x0
  pushl $97
801063b2:	6a 61                	push   $0x61
  jmp alltraps
801063b4:	e9 39 f6 ff ff       	jmp    801059f2 <alltraps>

801063b9 <vector98>:
.globl vector98
vector98:
  pushl $0
801063b9:	6a 00                	push   $0x0
  pushl $98
801063bb:	6a 62                	push   $0x62
  jmp alltraps
801063bd:	e9 30 f6 ff ff       	jmp    801059f2 <alltraps>

801063c2 <vector99>:
.globl vector99
vector99:
  pushl $0
801063c2:	6a 00                	push   $0x0
  pushl $99
801063c4:	6a 63                	push   $0x63
  jmp alltraps
801063c6:	e9 27 f6 ff ff       	jmp    801059f2 <alltraps>

801063cb <vector100>:
.globl vector100
vector100:
  pushl $0
801063cb:	6a 00                	push   $0x0
  pushl $100
801063cd:	6a 64                	push   $0x64
  jmp alltraps
801063cf:	e9 1e f6 ff ff       	jmp    801059f2 <alltraps>

801063d4 <vector101>:
.globl vector101
vector101:
  pushl $0
801063d4:	6a 00                	push   $0x0
  pushl $101
801063d6:	6a 65                	push   $0x65
  jmp alltraps
801063d8:	e9 15 f6 ff ff       	jmp    801059f2 <alltraps>

801063dd <vector102>:
.globl vector102
vector102:
  pushl $0
801063dd:	6a 00                	push   $0x0
  pushl $102
801063df:	6a 66                	push   $0x66
  jmp alltraps
801063e1:	e9 0c f6 ff ff       	jmp    801059f2 <alltraps>

801063e6 <vector103>:
.globl vector103
vector103:
  pushl $0
801063e6:	6a 00                	push   $0x0
  pushl $103
801063e8:	6a 67                	push   $0x67
  jmp alltraps
801063ea:	e9 03 f6 ff ff       	jmp    801059f2 <alltraps>

801063ef <vector104>:
.globl vector104
vector104:
  pushl $0
801063ef:	6a 00                	push   $0x0
  pushl $104
801063f1:	6a 68                	push   $0x68
  jmp alltraps
801063f3:	e9 fa f5 ff ff       	jmp    801059f2 <alltraps>

801063f8 <vector105>:
.globl vector105
vector105:
  pushl $0
801063f8:	6a 00                	push   $0x0
  pushl $105
801063fa:	6a 69                	push   $0x69
  jmp alltraps
801063fc:	e9 f1 f5 ff ff       	jmp    801059f2 <alltraps>

80106401 <vector106>:
.globl vector106
vector106:
  pushl $0
80106401:	6a 00                	push   $0x0
  pushl $106
80106403:	6a 6a                	push   $0x6a
  jmp alltraps
80106405:	e9 e8 f5 ff ff       	jmp    801059f2 <alltraps>

8010640a <vector107>:
.globl vector107
vector107:
  pushl $0
8010640a:	6a 00                	push   $0x0
  pushl $107
8010640c:	6a 6b                	push   $0x6b
  jmp alltraps
8010640e:	e9 df f5 ff ff       	jmp    801059f2 <alltraps>

80106413 <vector108>:
.globl vector108
vector108:
  pushl $0
80106413:	6a 00                	push   $0x0
  pushl $108
80106415:	6a 6c                	push   $0x6c
  jmp alltraps
80106417:	e9 d6 f5 ff ff       	jmp    801059f2 <alltraps>

8010641c <vector109>:
.globl vector109
vector109:
  pushl $0
8010641c:	6a 00                	push   $0x0
  pushl $109
8010641e:	6a 6d                	push   $0x6d
  jmp alltraps
80106420:	e9 cd f5 ff ff       	jmp    801059f2 <alltraps>

80106425 <vector110>:
.globl vector110
vector110:
  pushl $0
80106425:	6a 00                	push   $0x0
  pushl $110
80106427:	6a 6e                	push   $0x6e
  jmp alltraps
80106429:	e9 c4 f5 ff ff       	jmp    801059f2 <alltraps>

8010642e <vector111>:
.globl vector111
vector111:
  pushl $0
8010642e:	6a 00                	push   $0x0
  pushl $111
80106430:	6a 6f                	push   $0x6f
  jmp alltraps
80106432:	e9 bb f5 ff ff       	jmp    801059f2 <alltraps>

80106437 <vector112>:
.globl vector112
vector112:
  pushl $0
80106437:	6a 00                	push   $0x0
  pushl $112
80106439:	6a 70                	push   $0x70
  jmp alltraps
8010643b:	e9 b2 f5 ff ff       	jmp    801059f2 <alltraps>

80106440 <vector113>:
.globl vector113
vector113:
  pushl $0
80106440:	6a 00                	push   $0x0
  pushl $113
80106442:	6a 71                	push   $0x71
  jmp alltraps
80106444:	e9 a9 f5 ff ff       	jmp    801059f2 <alltraps>

80106449 <vector114>:
.globl vector114
vector114:
  pushl $0
80106449:	6a 00                	push   $0x0
  pushl $114
8010644b:	6a 72                	push   $0x72
  jmp alltraps
8010644d:	e9 a0 f5 ff ff       	jmp    801059f2 <alltraps>

80106452 <vector115>:
.globl vector115
vector115:
  pushl $0
80106452:	6a 00                	push   $0x0
  pushl $115
80106454:	6a 73                	push   $0x73
  jmp alltraps
80106456:	e9 97 f5 ff ff       	jmp    801059f2 <alltraps>

8010645b <vector116>:
.globl vector116
vector116:
  pushl $0
8010645b:	6a 00                	push   $0x0
  pushl $116
8010645d:	6a 74                	push   $0x74
  jmp alltraps
8010645f:	e9 8e f5 ff ff       	jmp    801059f2 <alltraps>

80106464 <vector117>:
.globl vector117
vector117:
  pushl $0
80106464:	6a 00                	push   $0x0
  pushl $117
80106466:	6a 75                	push   $0x75
  jmp alltraps
80106468:	e9 85 f5 ff ff       	jmp    801059f2 <alltraps>

8010646d <vector118>:
.globl vector118
vector118:
  pushl $0
8010646d:	6a 00                	push   $0x0
  pushl $118
8010646f:	6a 76                	push   $0x76
  jmp alltraps
80106471:	e9 7c f5 ff ff       	jmp    801059f2 <alltraps>

80106476 <vector119>:
.globl vector119
vector119:
  pushl $0
80106476:	6a 00                	push   $0x0
  pushl $119
80106478:	6a 77                	push   $0x77
  jmp alltraps
8010647a:	e9 73 f5 ff ff       	jmp    801059f2 <alltraps>

8010647f <vector120>:
.globl vector120
vector120:
  pushl $0
8010647f:	6a 00                	push   $0x0
  pushl $120
80106481:	6a 78                	push   $0x78
  jmp alltraps
80106483:	e9 6a f5 ff ff       	jmp    801059f2 <alltraps>

80106488 <vector121>:
.globl vector121
vector121:
  pushl $0
80106488:	6a 00                	push   $0x0
  pushl $121
8010648a:	6a 79                	push   $0x79
  jmp alltraps
8010648c:	e9 61 f5 ff ff       	jmp    801059f2 <alltraps>

80106491 <vector122>:
.globl vector122
vector122:
  pushl $0
80106491:	6a 00                	push   $0x0
  pushl $122
80106493:	6a 7a                	push   $0x7a
  jmp alltraps
80106495:	e9 58 f5 ff ff       	jmp    801059f2 <alltraps>

8010649a <vector123>:
.globl vector123
vector123:
  pushl $0
8010649a:	6a 00                	push   $0x0
  pushl $123
8010649c:	6a 7b                	push   $0x7b
  jmp alltraps
8010649e:	e9 4f f5 ff ff       	jmp    801059f2 <alltraps>

801064a3 <vector124>:
.globl vector124
vector124:
  pushl $0
801064a3:	6a 00                	push   $0x0
  pushl $124
801064a5:	6a 7c                	push   $0x7c
  jmp alltraps
801064a7:	e9 46 f5 ff ff       	jmp    801059f2 <alltraps>

801064ac <vector125>:
.globl vector125
vector125:
  pushl $0
801064ac:	6a 00                	push   $0x0
  pushl $125
801064ae:	6a 7d                	push   $0x7d
  jmp alltraps
801064b0:	e9 3d f5 ff ff       	jmp    801059f2 <alltraps>

801064b5 <vector126>:
.globl vector126
vector126:
  pushl $0
801064b5:	6a 00                	push   $0x0
  pushl $126
801064b7:	6a 7e                	push   $0x7e
  jmp alltraps
801064b9:	e9 34 f5 ff ff       	jmp    801059f2 <alltraps>

801064be <vector127>:
.globl vector127
vector127:
  pushl $0
801064be:	6a 00                	push   $0x0
  pushl $127
801064c0:	6a 7f                	push   $0x7f
  jmp alltraps
801064c2:	e9 2b f5 ff ff       	jmp    801059f2 <alltraps>

801064c7 <vector128>:
.globl vector128
vector128:
  pushl $0
801064c7:	6a 00                	push   $0x0
  pushl $128
801064c9:	68 80 00 00 00       	push   $0x80
  jmp alltraps
801064ce:	e9 1f f5 ff ff       	jmp    801059f2 <alltraps>

801064d3 <vector129>:
.globl vector129
vector129:
  pushl $0
801064d3:	6a 00                	push   $0x0
  pushl $129
801064d5:	68 81 00 00 00       	push   $0x81
  jmp alltraps
801064da:	e9 13 f5 ff ff       	jmp    801059f2 <alltraps>

801064df <vector130>:
.globl vector130
vector130:
  pushl $0
801064df:	6a 00                	push   $0x0
  pushl $130
801064e1:	68 82 00 00 00       	push   $0x82
  jmp alltraps
801064e6:	e9 07 f5 ff ff       	jmp    801059f2 <alltraps>

801064eb <vector131>:
.globl vector131
vector131:
  pushl $0
801064eb:	6a 00                	push   $0x0
  pushl $131
801064ed:	68 83 00 00 00       	push   $0x83
  jmp alltraps
801064f2:	e9 fb f4 ff ff       	jmp    801059f2 <alltraps>

801064f7 <vector132>:
.globl vector132
vector132:
  pushl $0
801064f7:	6a 00                	push   $0x0
  pushl $132
801064f9:	68 84 00 00 00       	push   $0x84
  jmp alltraps
801064fe:	e9 ef f4 ff ff       	jmp    801059f2 <alltraps>

80106503 <vector133>:
.globl vector133
vector133:
  pushl $0
80106503:	6a 00                	push   $0x0
  pushl $133
80106505:	68 85 00 00 00       	push   $0x85
  jmp alltraps
8010650a:	e9 e3 f4 ff ff       	jmp    801059f2 <alltraps>

8010650f <vector134>:
.globl vector134
vector134:
  pushl $0
8010650f:	6a 00                	push   $0x0
  pushl $134
80106511:	68 86 00 00 00       	push   $0x86
  jmp alltraps
80106516:	e9 d7 f4 ff ff       	jmp    801059f2 <alltraps>

8010651b <vector135>:
.globl vector135
vector135:
  pushl $0
8010651b:	6a 00                	push   $0x0
  pushl $135
8010651d:	68 87 00 00 00       	push   $0x87
  jmp alltraps
80106522:	e9 cb f4 ff ff       	jmp    801059f2 <alltraps>

80106527 <vector136>:
.globl vector136
vector136:
  pushl $0
80106527:	6a 00                	push   $0x0
  pushl $136
80106529:	68 88 00 00 00       	push   $0x88
  jmp alltraps
8010652e:	e9 bf f4 ff ff       	jmp    801059f2 <alltraps>

80106533 <vector137>:
.globl vector137
vector137:
  pushl $0
80106533:	6a 00                	push   $0x0
  pushl $137
80106535:	68 89 00 00 00       	push   $0x89
  jmp alltraps
8010653a:	e9 b3 f4 ff ff       	jmp    801059f2 <alltraps>

8010653f <vector138>:
.globl vector138
vector138:
  pushl $0
8010653f:	6a 00                	push   $0x0
  pushl $138
80106541:	68 8a 00 00 00       	push   $0x8a
  jmp alltraps
80106546:	e9 a7 f4 ff ff       	jmp    801059f2 <alltraps>

8010654b <vector139>:
.globl vector139
vector139:
  pushl $0
8010654b:	6a 00                	push   $0x0
  pushl $139
8010654d:	68 8b 00 00 00       	push   $0x8b
  jmp alltraps
80106552:	e9 9b f4 ff ff       	jmp    801059f2 <alltraps>

80106557 <vector140>:
.globl vector140
vector140:
  pushl $0
80106557:	6a 00                	push   $0x0
  pushl $140
80106559:	68 8c 00 00 00       	push   $0x8c
  jmp alltraps
8010655e:	e9 8f f4 ff ff       	jmp    801059f2 <alltraps>

80106563 <vector141>:
.globl vector141
vector141:
  pushl $0
80106563:	6a 00                	push   $0x0
  pushl $141
80106565:	68 8d 00 00 00       	push   $0x8d
  jmp alltraps
8010656a:	e9 83 f4 ff ff       	jmp    801059f2 <alltraps>

8010656f <vector142>:
.globl vector142
vector142:
  pushl $0
8010656f:	6a 00                	push   $0x0
  pushl $142
80106571:	68 8e 00 00 00       	push   $0x8e
  jmp alltraps
80106576:	e9 77 f4 ff ff       	jmp    801059f2 <alltraps>

8010657b <vector143>:
.globl vector143
vector143:
  pushl $0
8010657b:	6a 00                	push   $0x0
  pushl $143
8010657d:	68 8f 00 00 00       	push   $0x8f
  jmp alltraps
80106582:	e9 6b f4 ff ff       	jmp    801059f2 <alltraps>

80106587 <vector144>:
.globl vector144
vector144:
  pushl $0
80106587:	6a 00                	push   $0x0
  pushl $144
80106589:	68 90 00 00 00       	push   $0x90
  jmp alltraps
8010658e:	e9 5f f4 ff ff       	jmp    801059f2 <alltraps>

80106593 <vector145>:
.globl vector145
vector145:
  pushl $0
80106593:	6a 00                	push   $0x0
  pushl $145
80106595:	68 91 00 00 00       	push   $0x91
  jmp alltraps
8010659a:	e9 53 f4 ff ff       	jmp    801059f2 <alltraps>

8010659f <vector146>:
.globl vector146
vector146:
  pushl $0
8010659f:	6a 00                	push   $0x0
  pushl $146
801065a1:	68 92 00 00 00       	push   $0x92
  jmp alltraps
801065a6:	e9 47 f4 ff ff       	jmp    801059f2 <alltraps>

801065ab <vector147>:
.globl vector147
vector147:
  pushl $0
801065ab:	6a 00                	push   $0x0
  pushl $147
801065ad:	68 93 00 00 00       	push   $0x93
  jmp alltraps
801065b2:	e9 3b f4 ff ff       	jmp    801059f2 <alltraps>

801065b7 <vector148>:
.globl vector148
vector148:
  pushl $0
801065b7:	6a 00                	push   $0x0
  pushl $148
801065b9:	68 94 00 00 00       	push   $0x94
  jmp alltraps
801065be:	e9 2f f4 ff ff       	jmp    801059f2 <alltraps>

801065c3 <vector149>:
.globl vector149
vector149:
  pushl $0
801065c3:	6a 00                	push   $0x0
  pushl $149
801065c5:	68 95 00 00 00       	push   $0x95
  jmp alltraps
801065ca:	e9 23 f4 ff ff       	jmp    801059f2 <alltraps>

801065cf <vector150>:
.globl vector150
vector150:
  pushl $0
801065cf:	6a 00                	push   $0x0
  pushl $150
801065d1:	68 96 00 00 00       	push   $0x96
  jmp alltraps
801065d6:	e9 17 f4 ff ff       	jmp    801059f2 <alltraps>

801065db <vector151>:
.globl vector151
vector151:
  pushl $0
801065db:	6a 00                	push   $0x0
  pushl $151
801065dd:	68 97 00 00 00       	push   $0x97
  jmp alltraps
801065e2:	e9 0b f4 ff ff       	jmp    801059f2 <alltraps>

801065e7 <vector152>:
.globl vector152
vector152:
  pushl $0
801065e7:	6a 00                	push   $0x0
  pushl $152
801065e9:	68 98 00 00 00       	push   $0x98
  jmp alltraps
801065ee:	e9 ff f3 ff ff       	jmp    801059f2 <alltraps>

801065f3 <vector153>:
.globl vector153
vector153:
  pushl $0
801065f3:	6a 00                	push   $0x0
  pushl $153
801065f5:	68 99 00 00 00       	push   $0x99
  jmp alltraps
801065fa:	e9 f3 f3 ff ff       	jmp    801059f2 <alltraps>

801065ff <vector154>:
.globl vector154
vector154:
  pushl $0
801065ff:	6a 00                	push   $0x0
  pushl $154
80106601:	68 9a 00 00 00       	push   $0x9a
  jmp alltraps
80106606:	e9 e7 f3 ff ff       	jmp    801059f2 <alltraps>

8010660b <vector155>:
.globl vector155
vector155:
  pushl $0
8010660b:	6a 00                	push   $0x0
  pushl $155
8010660d:	68 9b 00 00 00       	push   $0x9b
  jmp alltraps
80106612:	e9 db f3 ff ff       	jmp    801059f2 <alltraps>

80106617 <vector156>:
.globl vector156
vector156:
  pushl $0
80106617:	6a 00                	push   $0x0
  pushl $156
80106619:	68 9c 00 00 00       	push   $0x9c
  jmp alltraps
8010661e:	e9 cf f3 ff ff       	jmp    801059f2 <alltraps>

80106623 <vector157>:
.globl vector157
vector157:
  pushl $0
80106623:	6a 00                	push   $0x0
  pushl $157
80106625:	68 9d 00 00 00       	push   $0x9d
  jmp alltraps
8010662a:	e9 c3 f3 ff ff       	jmp    801059f2 <alltraps>

8010662f <vector158>:
.globl vector158
vector158:
  pushl $0
8010662f:	6a 00                	push   $0x0
  pushl $158
80106631:	68 9e 00 00 00       	push   $0x9e
  jmp alltraps
80106636:	e9 b7 f3 ff ff       	jmp    801059f2 <alltraps>

8010663b <vector159>:
.globl vector159
vector159:
  pushl $0
8010663b:	6a 00                	push   $0x0
  pushl $159
8010663d:	68 9f 00 00 00       	push   $0x9f
  jmp alltraps
80106642:	e9 ab f3 ff ff       	jmp    801059f2 <alltraps>

80106647 <vector160>:
.globl vector160
vector160:
  pushl $0
80106647:	6a 00                	push   $0x0
  pushl $160
80106649:	68 a0 00 00 00       	push   $0xa0
  jmp alltraps
8010664e:	e9 9f f3 ff ff       	jmp    801059f2 <alltraps>

80106653 <vector161>:
.globl vector161
vector161:
  pushl $0
80106653:	6a 00                	push   $0x0
  pushl $161
80106655:	68 a1 00 00 00       	push   $0xa1
  jmp alltraps
8010665a:	e9 93 f3 ff ff       	jmp    801059f2 <alltraps>

8010665f <vector162>:
.globl vector162
vector162:
  pushl $0
8010665f:	6a 00                	push   $0x0
  pushl $162
80106661:	68 a2 00 00 00       	push   $0xa2
  jmp alltraps
80106666:	e9 87 f3 ff ff       	jmp    801059f2 <alltraps>

8010666b <vector163>:
.globl vector163
vector163:
  pushl $0
8010666b:	6a 00                	push   $0x0
  pushl $163
8010666d:	68 a3 00 00 00       	push   $0xa3
  jmp alltraps
80106672:	e9 7b f3 ff ff       	jmp    801059f2 <alltraps>

80106677 <vector164>:
.globl vector164
vector164:
  pushl $0
80106677:	6a 00                	push   $0x0
  pushl $164
80106679:	68 a4 00 00 00       	push   $0xa4
  jmp alltraps
8010667e:	e9 6f f3 ff ff       	jmp    801059f2 <alltraps>

80106683 <vector165>:
.globl vector165
vector165:
  pushl $0
80106683:	6a 00                	push   $0x0
  pushl $165
80106685:	68 a5 00 00 00       	push   $0xa5
  jmp alltraps
8010668a:	e9 63 f3 ff ff       	jmp    801059f2 <alltraps>

8010668f <vector166>:
.globl vector166
vector166:
  pushl $0
8010668f:	6a 00                	push   $0x0
  pushl $166
80106691:	68 a6 00 00 00       	push   $0xa6
  jmp alltraps
80106696:	e9 57 f3 ff ff       	jmp    801059f2 <alltraps>

8010669b <vector167>:
.globl vector167
vector167:
  pushl $0
8010669b:	6a 00                	push   $0x0
  pushl $167
8010669d:	68 a7 00 00 00       	push   $0xa7
  jmp alltraps
801066a2:	e9 4b f3 ff ff       	jmp    801059f2 <alltraps>

801066a7 <vector168>:
.globl vector168
vector168:
  pushl $0
801066a7:	6a 00                	push   $0x0
  pushl $168
801066a9:	68 a8 00 00 00       	push   $0xa8
  jmp alltraps
801066ae:	e9 3f f3 ff ff       	jmp    801059f2 <alltraps>

801066b3 <vector169>:
.globl vector169
vector169:
  pushl $0
801066b3:	6a 00                	push   $0x0
  pushl $169
801066b5:	68 a9 00 00 00       	push   $0xa9
  jmp alltraps
801066ba:	e9 33 f3 ff ff       	jmp    801059f2 <alltraps>

801066bf <vector170>:
.globl vector170
vector170:
  pushl $0
801066bf:	6a 00                	push   $0x0
  pushl $170
801066c1:	68 aa 00 00 00       	push   $0xaa
  jmp alltraps
801066c6:	e9 27 f3 ff ff       	jmp    801059f2 <alltraps>

801066cb <vector171>:
.globl vector171
vector171:
  pushl $0
801066cb:	6a 00                	push   $0x0
  pushl $171
801066cd:	68 ab 00 00 00       	push   $0xab
  jmp alltraps
801066d2:	e9 1b f3 ff ff       	jmp    801059f2 <alltraps>

801066d7 <vector172>:
.globl vector172
vector172:
  pushl $0
801066d7:	6a 00                	push   $0x0
  pushl $172
801066d9:	68 ac 00 00 00       	push   $0xac
  jmp alltraps
801066de:	e9 0f f3 ff ff       	jmp    801059f2 <alltraps>

801066e3 <vector173>:
.globl vector173
vector173:
  pushl $0
801066e3:	6a 00                	push   $0x0
  pushl $173
801066e5:	68 ad 00 00 00       	push   $0xad
  jmp alltraps
801066ea:	e9 03 f3 ff ff       	jmp    801059f2 <alltraps>

801066ef <vector174>:
.globl vector174
vector174:
  pushl $0
801066ef:	6a 00                	push   $0x0
  pushl $174
801066f1:	68 ae 00 00 00       	push   $0xae
  jmp alltraps
801066f6:	e9 f7 f2 ff ff       	jmp    801059f2 <alltraps>

801066fb <vector175>:
.globl vector175
vector175:
  pushl $0
801066fb:	6a 00                	push   $0x0
  pushl $175
801066fd:	68 af 00 00 00       	push   $0xaf
  jmp alltraps
80106702:	e9 eb f2 ff ff       	jmp    801059f2 <alltraps>

80106707 <vector176>:
.globl vector176
vector176:
  pushl $0
80106707:	6a 00                	push   $0x0
  pushl $176
80106709:	68 b0 00 00 00       	push   $0xb0
  jmp alltraps
8010670e:	e9 df f2 ff ff       	jmp    801059f2 <alltraps>

80106713 <vector177>:
.globl vector177
vector177:
  pushl $0
80106713:	6a 00                	push   $0x0
  pushl $177
80106715:	68 b1 00 00 00       	push   $0xb1
  jmp alltraps
8010671a:	e9 d3 f2 ff ff       	jmp    801059f2 <alltraps>

8010671f <vector178>:
.globl vector178
vector178:
  pushl $0
8010671f:	6a 00                	push   $0x0
  pushl $178
80106721:	68 b2 00 00 00       	push   $0xb2
  jmp alltraps
80106726:	e9 c7 f2 ff ff       	jmp    801059f2 <alltraps>

8010672b <vector179>:
.globl vector179
vector179:
  pushl $0
8010672b:	6a 00                	push   $0x0
  pushl $179
8010672d:	68 b3 00 00 00       	push   $0xb3
  jmp alltraps
80106732:	e9 bb f2 ff ff       	jmp    801059f2 <alltraps>

80106737 <vector180>:
.globl vector180
vector180:
  pushl $0
80106737:	6a 00                	push   $0x0
  pushl $180
80106739:	68 b4 00 00 00       	push   $0xb4
  jmp alltraps
8010673e:	e9 af f2 ff ff       	jmp    801059f2 <alltraps>

80106743 <vector181>:
.globl vector181
vector181:
  pushl $0
80106743:	6a 00                	push   $0x0
  pushl $181
80106745:	68 b5 00 00 00       	push   $0xb5
  jmp alltraps
8010674a:	e9 a3 f2 ff ff       	jmp    801059f2 <alltraps>

8010674f <vector182>:
.globl vector182
vector182:
  pushl $0
8010674f:	6a 00                	push   $0x0
  pushl $182
80106751:	68 b6 00 00 00       	push   $0xb6
  jmp alltraps
80106756:	e9 97 f2 ff ff       	jmp    801059f2 <alltraps>

8010675b <vector183>:
.globl vector183
vector183:
  pushl $0
8010675b:	6a 00                	push   $0x0
  pushl $183
8010675d:	68 b7 00 00 00       	push   $0xb7
  jmp alltraps
80106762:	e9 8b f2 ff ff       	jmp    801059f2 <alltraps>

80106767 <vector184>:
.globl vector184
vector184:
  pushl $0
80106767:	6a 00                	push   $0x0
  pushl $184
80106769:	68 b8 00 00 00       	push   $0xb8
  jmp alltraps
8010676e:	e9 7f f2 ff ff       	jmp    801059f2 <alltraps>

80106773 <vector185>:
.globl vector185
vector185:
  pushl $0
80106773:	6a 00                	push   $0x0
  pushl $185
80106775:	68 b9 00 00 00       	push   $0xb9
  jmp alltraps
8010677a:	e9 73 f2 ff ff       	jmp    801059f2 <alltraps>

8010677f <vector186>:
.globl vector186
vector186:
  pushl $0
8010677f:	6a 00                	push   $0x0
  pushl $186
80106781:	68 ba 00 00 00       	push   $0xba
  jmp alltraps
80106786:	e9 67 f2 ff ff       	jmp    801059f2 <alltraps>

8010678b <vector187>:
.globl vector187
vector187:
  pushl $0
8010678b:	6a 00                	push   $0x0
  pushl $187
8010678d:	68 bb 00 00 00       	push   $0xbb
  jmp alltraps
80106792:	e9 5b f2 ff ff       	jmp    801059f2 <alltraps>

80106797 <vector188>:
.globl vector188
vector188:
  pushl $0
80106797:	6a 00                	push   $0x0
  pushl $188
80106799:	68 bc 00 00 00       	push   $0xbc
  jmp alltraps
8010679e:	e9 4f f2 ff ff       	jmp    801059f2 <alltraps>

801067a3 <vector189>:
.globl vector189
vector189:
  pushl $0
801067a3:	6a 00                	push   $0x0
  pushl $189
801067a5:	68 bd 00 00 00       	push   $0xbd
  jmp alltraps
801067aa:	e9 43 f2 ff ff       	jmp    801059f2 <alltraps>

801067af <vector190>:
.globl vector190
vector190:
  pushl $0
801067af:	6a 00                	push   $0x0
  pushl $190
801067b1:	68 be 00 00 00       	push   $0xbe
  jmp alltraps
801067b6:	e9 37 f2 ff ff       	jmp    801059f2 <alltraps>

801067bb <vector191>:
.globl vector191
vector191:
  pushl $0
801067bb:	6a 00                	push   $0x0
  pushl $191
801067bd:	68 bf 00 00 00       	push   $0xbf
  jmp alltraps
801067c2:	e9 2b f2 ff ff       	jmp    801059f2 <alltraps>

801067c7 <vector192>:
.globl vector192
vector192:
  pushl $0
801067c7:	6a 00                	push   $0x0
  pushl $192
801067c9:	68 c0 00 00 00       	push   $0xc0
  jmp alltraps
801067ce:	e9 1f f2 ff ff       	jmp    801059f2 <alltraps>

801067d3 <vector193>:
.globl vector193
vector193:
  pushl $0
801067d3:	6a 00                	push   $0x0
  pushl $193
801067d5:	68 c1 00 00 00       	push   $0xc1
  jmp alltraps
801067da:	e9 13 f2 ff ff       	jmp    801059f2 <alltraps>

801067df <vector194>:
.globl vector194
vector194:
  pushl $0
801067df:	6a 00                	push   $0x0
  pushl $194
801067e1:	68 c2 00 00 00       	push   $0xc2
  jmp alltraps
801067e6:	e9 07 f2 ff ff       	jmp    801059f2 <alltraps>

801067eb <vector195>:
.globl vector195
vector195:
  pushl $0
801067eb:	6a 00                	push   $0x0
  pushl $195
801067ed:	68 c3 00 00 00       	push   $0xc3
  jmp alltraps
801067f2:	e9 fb f1 ff ff       	jmp    801059f2 <alltraps>

801067f7 <vector196>:
.globl vector196
vector196:
  pushl $0
801067f7:	6a 00                	push   $0x0
  pushl $196
801067f9:	68 c4 00 00 00       	push   $0xc4
  jmp alltraps
801067fe:	e9 ef f1 ff ff       	jmp    801059f2 <alltraps>

80106803 <vector197>:
.globl vector197
vector197:
  pushl $0
80106803:	6a 00                	push   $0x0
  pushl $197
80106805:	68 c5 00 00 00       	push   $0xc5
  jmp alltraps
8010680a:	e9 e3 f1 ff ff       	jmp    801059f2 <alltraps>

8010680f <vector198>:
.globl vector198
vector198:
  pushl $0
8010680f:	6a 00                	push   $0x0
  pushl $198
80106811:	68 c6 00 00 00       	push   $0xc6
  jmp alltraps
80106816:	e9 d7 f1 ff ff       	jmp    801059f2 <alltraps>

8010681b <vector199>:
.globl vector199
vector199:
  pushl $0
8010681b:	6a 00                	push   $0x0
  pushl $199
8010681d:	68 c7 00 00 00       	push   $0xc7
  jmp alltraps
80106822:	e9 cb f1 ff ff       	jmp    801059f2 <alltraps>

80106827 <vector200>:
.globl vector200
vector200:
  pushl $0
80106827:	6a 00                	push   $0x0
  pushl $200
80106829:	68 c8 00 00 00       	push   $0xc8
  jmp alltraps
8010682e:	e9 bf f1 ff ff       	jmp    801059f2 <alltraps>

80106833 <vector201>:
.globl vector201
vector201:
  pushl $0
80106833:	6a 00                	push   $0x0
  pushl $201
80106835:	68 c9 00 00 00       	push   $0xc9
  jmp alltraps
8010683a:	e9 b3 f1 ff ff       	jmp    801059f2 <alltraps>

8010683f <vector202>:
.globl vector202
vector202:
  pushl $0
8010683f:	6a 00                	push   $0x0
  pushl $202
80106841:	68 ca 00 00 00       	push   $0xca
  jmp alltraps
80106846:	e9 a7 f1 ff ff       	jmp    801059f2 <alltraps>

8010684b <vector203>:
.globl vector203
vector203:
  pushl $0
8010684b:	6a 00                	push   $0x0
  pushl $203
8010684d:	68 cb 00 00 00       	push   $0xcb
  jmp alltraps
80106852:	e9 9b f1 ff ff       	jmp    801059f2 <alltraps>

80106857 <vector204>:
.globl vector204
vector204:
  pushl $0
80106857:	6a 00                	push   $0x0
  pushl $204
80106859:	68 cc 00 00 00       	push   $0xcc
  jmp alltraps
8010685e:	e9 8f f1 ff ff       	jmp    801059f2 <alltraps>

80106863 <vector205>:
.globl vector205
vector205:
  pushl $0
80106863:	6a 00                	push   $0x0
  pushl $205
80106865:	68 cd 00 00 00       	push   $0xcd
  jmp alltraps
8010686a:	e9 83 f1 ff ff       	jmp    801059f2 <alltraps>

8010686f <vector206>:
.globl vector206
vector206:
  pushl $0
8010686f:	6a 00                	push   $0x0
  pushl $206
80106871:	68 ce 00 00 00       	push   $0xce
  jmp alltraps
80106876:	e9 77 f1 ff ff       	jmp    801059f2 <alltraps>

8010687b <vector207>:
.globl vector207
vector207:
  pushl $0
8010687b:	6a 00                	push   $0x0
  pushl $207
8010687d:	68 cf 00 00 00       	push   $0xcf
  jmp alltraps
80106882:	e9 6b f1 ff ff       	jmp    801059f2 <alltraps>

80106887 <vector208>:
.globl vector208
vector208:
  pushl $0
80106887:	6a 00                	push   $0x0
  pushl $208
80106889:	68 d0 00 00 00       	push   $0xd0
  jmp alltraps
8010688e:	e9 5f f1 ff ff       	jmp    801059f2 <alltraps>

80106893 <vector209>:
.globl vector209
vector209:
  pushl $0
80106893:	6a 00                	push   $0x0
  pushl $209
80106895:	68 d1 00 00 00       	push   $0xd1
  jmp alltraps
8010689a:	e9 53 f1 ff ff       	jmp    801059f2 <alltraps>

8010689f <vector210>:
.globl vector210
vector210:
  pushl $0
8010689f:	6a 00                	push   $0x0
  pushl $210
801068a1:	68 d2 00 00 00       	push   $0xd2
  jmp alltraps
801068a6:	e9 47 f1 ff ff       	jmp    801059f2 <alltraps>

801068ab <vector211>:
.globl vector211
vector211:
  pushl $0
801068ab:	6a 00                	push   $0x0
  pushl $211
801068ad:	68 d3 00 00 00       	push   $0xd3
  jmp alltraps
801068b2:	e9 3b f1 ff ff       	jmp    801059f2 <alltraps>

801068b7 <vector212>:
.globl vector212
vector212:
  pushl $0
801068b7:	6a 00                	push   $0x0
  pushl $212
801068b9:	68 d4 00 00 00       	push   $0xd4
  jmp alltraps
801068be:	e9 2f f1 ff ff       	jmp    801059f2 <alltraps>

801068c3 <vector213>:
.globl vector213
vector213:
  pushl $0
801068c3:	6a 00                	push   $0x0
  pushl $213
801068c5:	68 d5 00 00 00       	push   $0xd5
  jmp alltraps
801068ca:	e9 23 f1 ff ff       	jmp    801059f2 <alltraps>

801068cf <vector214>:
.globl vector214
vector214:
  pushl $0
801068cf:	6a 00                	push   $0x0
  pushl $214
801068d1:	68 d6 00 00 00       	push   $0xd6
  jmp alltraps
801068d6:	e9 17 f1 ff ff       	jmp    801059f2 <alltraps>

801068db <vector215>:
.globl vector215
vector215:
  pushl $0
801068db:	6a 00                	push   $0x0
  pushl $215
801068dd:	68 d7 00 00 00       	push   $0xd7
  jmp alltraps
801068e2:	e9 0b f1 ff ff       	jmp    801059f2 <alltraps>

801068e7 <vector216>:
.globl vector216
vector216:
  pushl $0
801068e7:	6a 00                	push   $0x0
  pushl $216
801068e9:	68 d8 00 00 00       	push   $0xd8
  jmp alltraps
801068ee:	e9 ff f0 ff ff       	jmp    801059f2 <alltraps>

801068f3 <vector217>:
.globl vector217
vector217:
  pushl $0
801068f3:	6a 00                	push   $0x0
  pushl $217
801068f5:	68 d9 00 00 00       	push   $0xd9
  jmp alltraps
801068fa:	e9 f3 f0 ff ff       	jmp    801059f2 <alltraps>

801068ff <vector218>:
.globl vector218
vector218:
  pushl $0
801068ff:	6a 00                	push   $0x0
  pushl $218
80106901:	68 da 00 00 00       	push   $0xda
  jmp alltraps
80106906:	e9 e7 f0 ff ff       	jmp    801059f2 <alltraps>

8010690b <vector219>:
.globl vector219
vector219:
  pushl $0
8010690b:	6a 00                	push   $0x0
  pushl $219
8010690d:	68 db 00 00 00       	push   $0xdb
  jmp alltraps
80106912:	e9 db f0 ff ff       	jmp    801059f2 <alltraps>

80106917 <vector220>:
.globl vector220
vector220:
  pushl $0
80106917:	6a 00                	push   $0x0
  pushl $220
80106919:	68 dc 00 00 00       	push   $0xdc
  jmp alltraps
8010691e:	e9 cf f0 ff ff       	jmp    801059f2 <alltraps>

80106923 <vector221>:
.globl vector221
vector221:
  pushl $0
80106923:	6a 00                	push   $0x0
  pushl $221
80106925:	68 dd 00 00 00       	push   $0xdd
  jmp alltraps
8010692a:	e9 c3 f0 ff ff       	jmp    801059f2 <alltraps>

8010692f <vector222>:
.globl vector222
vector222:
  pushl $0
8010692f:	6a 00                	push   $0x0
  pushl $222
80106931:	68 de 00 00 00       	push   $0xde
  jmp alltraps
80106936:	e9 b7 f0 ff ff       	jmp    801059f2 <alltraps>

8010693b <vector223>:
.globl vector223
vector223:
  pushl $0
8010693b:	6a 00                	push   $0x0
  pushl $223
8010693d:	68 df 00 00 00       	push   $0xdf
  jmp alltraps
80106942:	e9 ab f0 ff ff       	jmp    801059f2 <alltraps>

80106947 <vector224>:
.globl vector224
vector224:
  pushl $0
80106947:	6a 00                	push   $0x0
  pushl $224
80106949:	68 e0 00 00 00       	push   $0xe0
  jmp alltraps
8010694e:	e9 9f f0 ff ff       	jmp    801059f2 <alltraps>

80106953 <vector225>:
.globl vector225
vector225:
  pushl $0
80106953:	6a 00                	push   $0x0
  pushl $225
80106955:	68 e1 00 00 00       	push   $0xe1
  jmp alltraps
8010695a:	e9 93 f0 ff ff       	jmp    801059f2 <alltraps>

8010695f <vector226>:
.globl vector226
vector226:
  pushl $0
8010695f:	6a 00                	push   $0x0
  pushl $226
80106961:	68 e2 00 00 00       	push   $0xe2
  jmp alltraps
80106966:	e9 87 f0 ff ff       	jmp    801059f2 <alltraps>

8010696b <vector227>:
.globl vector227
vector227:
  pushl $0
8010696b:	6a 00                	push   $0x0
  pushl $227
8010696d:	68 e3 00 00 00       	push   $0xe3
  jmp alltraps
80106972:	e9 7b f0 ff ff       	jmp    801059f2 <alltraps>

80106977 <vector228>:
.globl vector228
vector228:
  pushl $0
80106977:	6a 00                	push   $0x0
  pushl $228
80106979:	68 e4 00 00 00       	push   $0xe4
  jmp alltraps
8010697e:	e9 6f f0 ff ff       	jmp    801059f2 <alltraps>

80106983 <vector229>:
.globl vector229
vector229:
  pushl $0
80106983:	6a 00                	push   $0x0
  pushl $229
80106985:	68 e5 00 00 00       	push   $0xe5
  jmp alltraps
8010698a:	e9 63 f0 ff ff       	jmp    801059f2 <alltraps>

8010698f <vector230>:
.globl vector230
vector230:
  pushl $0
8010698f:	6a 00                	push   $0x0
  pushl $230
80106991:	68 e6 00 00 00       	push   $0xe6
  jmp alltraps
80106996:	e9 57 f0 ff ff       	jmp    801059f2 <alltraps>

8010699b <vector231>:
.globl vector231
vector231:
  pushl $0
8010699b:	6a 00                	push   $0x0
  pushl $231
8010699d:	68 e7 00 00 00       	push   $0xe7
  jmp alltraps
801069a2:	e9 4b f0 ff ff       	jmp    801059f2 <alltraps>

801069a7 <vector232>:
.globl vector232
vector232:
  pushl $0
801069a7:	6a 00                	push   $0x0
  pushl $232
801069a9:	68 e8 00 00 00       	push   $0xe8
  jmp alltraps
801069ae:	e9 3f f0 ff ff       	jmp    801059f2 <alltraps>

801069b3 <vector233>:
.globl vector233
vector233:
  pushl $0
801069b3:	6a 00                	push   $0x0
  pushl $233
801069b5:	68 e9 00 00 00       	push   $0xe9
  jmp alltraps
801069ba:	e9 33 f0 ff ff       	jmp    801059f2 <alltraps>

801069bf <vector234>:
.globl vector234
vector234:
  pushl $0
801069bf:	6a 00                	push   $0x0
  pushl $234
801069c1:	68 ea 00 00 00       	push   $0xea
  jmp alltraps
801069c6:	e9 27 f0 ff ff       	jmp    801059f2 <alltraps>

801069cb <vector235>:
.globl vector235
vector235:
  pushl $0
801069cb:	6a 00                	push   $0x0
  pushl $235
801069cd:	68 eb 00 00 00       	push   $0xeb
  jmp alltraps
801069d2:	e9 1b f0 ff ff       	jmp    801059f2 <alltraps>

801069d7 <vector236>:
.globl vector236
vector236:
  pushl $0
801069d7:	6a 00                	push   $0x0
  pushl $236
801069d9:	68 ec 00 00 00       	push   $0xec
  jmp alltraps
801069de:	e9 0f f0 ff ff       	jmp    801059f2 <alltraps>

801069e3 <vector237>:
.globl vector237
vector237:
  pushl $0
801069e3:	6a 00                	push   $0x0
  pushl $237
801069e5:	68 ed 00 00 00       	push   $0xed
  jmp alltraps
801069ea:	e9 03 f0 ff ff       	jmp    801059f2 <alltraps>

801069ef <vector238>:
.globl vector238
vector238:
  pushl $0
801069ef:	6a 00                	push   $0x0
  pushl $238
801069f1:	68 ee 00 00 00       	push   $0xee
  jmp alltraps
801069f6:	e9 f7 ef ff ff       	jmp    801059f2 <alltraps>

801069fb <vector239>:
.globl vector239
vector239:
  pushl $0
801069fb:	6a 00                	push   $0x0
  pushl $239
801069fd:	68 ef 00 00 00       	push   $0xef
  jmp alltraps
80106a02:	e9 eb ef ff ff       	jmp    801059f2 <alltraps>

80106a07 <vector240>:
.globl vector240
vector240:
  pushl $0
80106a07:	6a 00                	push   $0x0
  pushl $240
80106a09:	68 f0 00 00 00       	push   $0xf0
  jmp alltraps
80106a0e:	e9 df ef ff ff       	jmp    801059f2 <alltraps>

80106a13 <vector241>:
.globl vector241
vector241:
  pushl $0
80106a13:	6a 00                	push   $0x0
  pushl $241
80106a15:	68 f1 00 00 00       	push   $0xf1
  jmp alltraps
80106a1a:	e9 d3 ef ff ff       	jmp    801059f2 <alltraps>

80106a1f <vector242>:
.globl vector242
vector242:
  pushl $0
80106a1f:	6a 00                	push   $0x0
  pushl $242
80106a21:	68 f2 00 00 00       	push   $0xf2
  jmp alltraps
80106a26:	e9 c7 ef ff ff       	jmp    801059f2 <alltraps>

80106a2b <vector243>:
.globl vector243
vector243:
  pushl $0
80106a2b:	6a 00                	push   $0x0
  pushl $243
80106a2d:	68 f3 00 00 00       	push   $0xf3
  jmp alltraps
80106a32:	e9 bb ef ff ff       	jmp    801059f2 <alltraps>

80106a37 <vector244>:
.globl vector244
vector244:
  pushl $0
80106a37:	6a 00                	push   $0x0
  pushl $244
80106a39:	68 f4 00 00 00       	push   $0xf4
  jmp alltraps
80106a3e:	e9 af ef ff ff       	jmp    801059f2 <alltraps>

80106a43 <vector245>:
.globl vector245
vector245:
  pushl $0
80106a43:	6a 00                	push   $0x0
  pushl $245
80106a45:	68 f5 00 00 00       	push   $0xf5
  jmp alltraps
80106a4a:	e9 a3 ef ff ff       	jmp    801059f2 <alltraps>

80106a4f <vector246>:
.globl vector246
vector246:
  pushl $0
80106a4f:	6a 00                	push   $0x0
  pushl $246
80106a51:	68 f6 00 00 00       	push   $0xf6
  jmp alltraps
80106a56:	e9 97 ef ff ff       	jmp    801059f2 <alltraps>

80106a5b <vector247>:
.globl vector247
vector247:
  pushl $0
80106a5b:	6a 00                	push   $0x0
  pushl $247
80106a5d:	68 f7 00 00 00       	push   $0xf7
  jmp alltraps
80106a62:	e9 8b ef ff ff       	jmp    801059f2 <alltraps>

80106a67 <vector248>:
.globl vector248
vector248:
  pushl $0
80106a67:	6a 00                	push   $0x0
  pushl $248
80106a69:	68 f8 00 00 00       	push   $0xf8
  jmp alltraps
80106a6e:	e9 7f ef ff ff       	jmp    801059f2 <alltraps>

80106a73 <vector249>:
.globl vector249
vector249:
  pushl $0
80106a73:	6a 00                	push   $0x0
  pushl $249
80106a75:	68 f9 00 00 00       	push   $0xf9
  jmp alltraps
80106a7a:	e9 73 ef ff ff       	jmp    801059f2 <alltraps>

80106a7f <vector250>:
.globl vector250
vector250:
  pushl $0
80106a7f:	6a 00                	push   $0x0
  pushl $250
80106a81:	68 fa 00 00 00       	push   $0xfa
  jmp alltraps
80106a86:	e9 67 ef ff ff       	jmp    801059f2 <alltraps>

80106a8b <vector251>:
.globl vector251
vector251:
  pushl $0
80106a8b:	6a 00                	push   $0x0
  pushl $251
80106a8d:	68 fb 00 00 00       	push   $0xfb
  jmp alltraps
80106a92:	e9 5b ef ff ff       	jmp    801059f2 <alltraps>

80106a97 <vector252>:
.globl vector252
vector252:
  pushl $0
80106a97:	6a 00                	push   $0x0
  pushl $252
80106a99:	68 fc 00 00 00       	push   $0xfc
  jmp alltraps
80106a9e:	e9 4f ef ff ff       	jmp    801059f2 <alltraps>

80106aa3 <vector253>:
.globl vector253
vector253:
  pushl $0
80106aa3:	6a 00                	push   $0x0
  pushl $253
80106aa5:	68 fd 00 00 00       	push   $0xfd
  jmp alltraps
80106aaa:	e9 43 ef ff ff       	jmp    801059f2 <alltraps>

80106aaf <vector254>:
.globl vector254
vector254:
  pushl $0
80106aaf:	6a 00                	push   $0x0
  pushl $254
80106ab1:	68 fe 00 00 00       	push   $0xfe
  jmp alltraps
80106ab6:	e9 37 ef ff ff       	jmp    801059f2 <alltraps>

80106abb <vector255>:
.globl vector255
vector255:
  pushl $0
80106abb:	6a 00                	push   $0x0
  pushl $255
80106abd:	68 ff 00 00 00       	push   $0xff
  jmp alltraps
80106ac2:	e9 2b ef ff ff       	jmp    801059f2 <alltraps>
80106ac7:	66 90                	xchg   %ax,%ax
80106ac9:	66 90                	xchg   %ax,%ax
80106acb:	66 90                	xchg   %ax,%ax
80106acd:	66 90                	xchg   %ax,%ax
80106acf:	90                   	nop

80106ad0 <walkpgdir>:
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106ad0:	55                   	push   %ebp
80106ad1:	89 e5                	mov    %esp,%ebp
80106ad3:	57                   	push   %edi
80106ad4:	56                   	push   %esi
80106ad5:	53                   	push   %ebx
80106ad6:	89 d3                	mov    %edx,%ebx
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
80106ad8:	c1 ea 16             	shr    $0x16,%edx
80106adb:	8d 3c 90             	lea    (%eax,%edx,4),%edi
// Return the address of the PTE in page table pgdir
// that corresponds to virtual address va.  If alloc!=0,
// create any required page table pages.
static pte_t *
walkpgdir(pde_t *pgdir, const void *va, int alloc)
{
80106ade:	83 ec 0c             	sub    $0xc,%esp
  pde_t *pde;
  pte_t *pgtab;

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
80106ae1:	8b 07                	mov    (%edi),%eax
80106ae3:	a8 01                	test   $0x1,%al
80106ae5:	74 29                	je     80106b10 <walkpgdir+0x40>
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
80106ae7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106aec:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106af2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
80106af5:	c1 eb 0a             	shr    $0xa,%ebx
80106af8:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
80106afe:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
}
80106b01:	5b                   	pop    %ebx
80106b02:	5e                   	pop    %esi
80106b03:	5f                   	pop    %edi
80106b04:	5d                   	pop    %ebp
80106b05:	c3                   	ret    
80106b06:	8d 76 00             	lea    0x0(%esi),%esi
80106b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
80106b10:	85 c9                	test   %ecx,%ecx
80106b12:	74 2c                	je     80106b40 <walkpgdir+0x70>
80106b14:	e8 a7 b9 ff ff       	call   801024c0 <kalloc>
80106b19:	85 c0                	test   %eax,%eax
80106b1b:	89 c6                	mov    %eax,%esi
80106b1d:	74 21                	je     80106b40 <walkpgdir+0x70>
      return 0;
    // Make sure all those PTE_P bits are zero.
    memset(pgtab, 0, PGSIZE);
80106b1f:	83 ec 04             	sub    $0x4,%esp
80106b22:	68 00 10 00 00       	push   $0x1000
80106b27:	6a 00                	push   $0x0
80106b29:	50                   	push   %eax
80106b2a:	e8 91 db ff ff       	call   801046c0 <memset>
    // The permissions here are overly generous, but they can
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
80106b2f:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106b35:	83 c4 10             	add    $0x10,%esp
80106b38:	83 c8 07             	or     $0x7,%eax
80106b3b:	89 07                	mov    %eax,(%edi)
80106b3d:	eb b3                	jmp    80106af2 <walkpgdir+0x22>
80106b3f:	90                   	nop
  }
  return &pgtab[PTX(va)];
}
80106b40:	8d 65 f4             	lea    -0xc(%ebp),%esp
  pde = &pgdir[PDX(va)];
  if(*pde & PTE_P){
    pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
  } else {
    if(!alloc || (pgtab = (pte_t*)kalloc()) == 0)
      return 0;
80106b43:	31 c0                	xor    %eax,%eax
    // be further restricted by the permissions in the page table
    // entries, if necessary.
    *pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
  }
  return &pgtab[PTX(va)];
}
80106b45:	5b                   	pop    %ebx
80106b46:	5e                   	pop    %esi
80106b47:	5f                   	pop    %edi
80106b48:	5d                   	pop    %ebp
80106b49:	c3                   	ret    
80106b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106b50 <mappages>:
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106b50:	55                   	push   %ebp
80106b51:	89 e5                	mov    %esp,%ebp
80106b53:	57                   	push   %edi
80106b54:	56                   	push   %esi
80106b55:	53                   	push   %ebx
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
80106b56:	89 d3                	mov    %edx,%ebx
80106b58:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Create PTEs for virtual addresses starting at va that refer to
// physical addresses starting at pa. va and size might not
// be page-aligned.
static int
mappages(pde_t *pgdir, void *va, uint size, uint pa, int perm)
{
80106b5e:	83 ec 1c             	sub    $0x1c,%esp
80106b61:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *a, *last;
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
80106b64:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106b68:	8b 7d 08             	mov    0x8(%ebp),%edi
80106b6b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106b70:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106b73:	8b 45 0c             	mov    0xc(%ebp),%eax
80106b76:	29 df                	sub    %ebx,%edi
80106b78:	83 c8 01             	or     $0x1,%eax
80106b7b:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106b7e:	eb 15                	jmp    80106b95 <mappages+0x45>
  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
80106b80:	f6 00 01             	testb  $0x1,(%eax)
80106b83:	75 45                	jne    80106bca <mappages+0x7a>
      panic("remap");
    *pte = pa | perm | PTE_P;
80106b85:	0b 75 dc             	or     -0x24(%ebp),%esi
    if(a == last)
80106b88:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
    *pte = pa | perm | PTE_P;
80106b8b:	89 30                	mov    %esi,(%eax)
    if(a == last)
80106b8d:	74 31                	je     80106bc0 <mappages+0x70>
      break;
    a += PGSIZE;
80106b8f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
  pte_t *pte;

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
80106b95:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106b98:	b9 01 00 00 00       	mov    $0x1,%ecx
80106b9d:	89 da                	mov    %ebx,%edx
80106b9f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106ba2:	e8 29 ff ff ff       	call   80106ad0 <walkpgdir>
80106ba7:	85 c0                	test   %eax,%eax
80106ba9:	75 d5                	jne    80106b80 <mappages+0x30>
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106bab:	8d 65 f4             	lea    -0xc(%ebp),%esp

  a = (char*)PGROUNDDOWN((uint)va);
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
80106bae:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
}
80106bb3:	5b                   	pop    %ebx
80106bb4:	5e                   	pop    %esi
80106bb5:	5f                   	pop    %edi
80106bb6:	5d                   	pop    %ebp
80106bb7:	c3                   	ret    
80106bb8:	90                   	nop
80106bb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106bc0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(a == last)
      break;
    a += PGSIZE;
    pa += PGSIZE;
  }
  return 0;
80106bc3:	31 c0                	xor    %eax,%eax
}
80106bc5:	5b                   	pop    %ebx
80106bc6:	5e                   	pop    %esi
80106bc7:	5f                   	pop    %edi
80106bc8:	5d                   	pop    %ebp
80106bc9:	c3                   	ret    
  last = (char*)PGROUNDDOWN(((uint)va) + size - 1);
  for(;;){
    if((pte = walkpgdir(pgdir, a, 1)) == 0)
      return -1;
    if(*pte & PTE_P)
      panic("remap");
80106bca:	83 ec 0c             	sub    $0xc,%esp
80106bcd:	68 98 7d 10 80       	push   $0x80107d98
80106bd2:	e8 99 97 ff ff       	call   80100370 <panic>
80106bd7:	89 f6                	mov    %esi,%esi
80106bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106be0 <deallocuvm.part.0>:
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106be0:	55                   	push   %ebp
80106be1:	89 e5                	mov    %esp,%ebp
80106be3:	57                   	push   %edi
80106be4:	56                   	push   %esi
80106be5:	53                   	push   %ebx
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106be6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106bec:	89 c7                	mov    %eax,%edi
  uint a, pa;

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
80106bee:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
// Deallocate user pages to bring the process size from oldsz to
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
80106bf4:	83 ec 1c             	sub    $0x1c,%esp
80106bf7:	89 4d e0             	mov    %ecx,-0x20(%ebp)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106bfa:	39 d3                	cmp    %edx,%ebx
80106bfc:	73 60                	jae    80106c5e <deallocuvm.part.0+0x7e>
80106bfe:	89 d6                	mov    %edx,%esi
80106c00:	eb 3d                	jmp    80106c3f <deallocuvm.part.0+0x5f>
80106c02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pte = walkpgdir(pgdir, (char*)a, 0);
    if(!pte)
      a += (NPTENTRIES - 1) * PGSIZE;
    else if((*pte & PTE_P) != 0){
80106c08:	8b 10                	mov    (%eax),%edx
80106c0a:	f6 c2 01             	test   $0x1,%dl
80106c0d:	74 26                	je     80106c35 <deallocuvm.part.0+0x55>
      pa = PTE_ADDR(*pte);
      if(pa == 0)
80106c0f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106c15:	74 52                	je     80106c69 <deallocuvm.part.0+0x89>
        panic("kfree");
      char *v = P2V(pa);
      kfree(v);
80106c17:	83 ec 0c             	sub    $0xc,%esp
80106c1a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106c20:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106c23:	52                   	push   %edx
80106c24:	e8 e7 b6 ff ff       	call   80102310 <kfree>
      *pte = 0;
80106c29:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106c2c:	83 c4 10             	add    $0x10,%esp
80106c2f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106c35:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c3b:	39 f3                	cmp    %esi,%ebx
80106c3d:	73 1f                	jae    80106c5e <deallocuvm.part.0+0x7e>
    pte = walkpgdir(pgdir, (char*)a, 0);
80106c3f:	31 c9                	xor    %ecx,%ecx
80106c41:	89 da                	mov    %ebx,%edx
80106c43:	89 f8                	mov    %edi,%eax
80106c45:	e8 86 fe ff ff       	call   80106ad0 <walkpgdir>
    if(!pte)
80106c4a:	85 c0                	test   %eax,%eax
80106c4c:	75 ba                	jne    80106c08 <deallocuvm.part.0+0x28>
      a += (NPTENTRIES - 1) * PGSIZE;
80106c4e:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx

  if(newsz >= oldsz)
    return oldsz;

  a = PGROUNDUP(newsz);
  for(; a  < oldsz; a += PGSIZE){
80106c54:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106c5a:	39 f3                	cmp    %esi,%ebx
80106c5c:	72 e1                	jb     80106c3f <deallocuvm.part.0+0x5f>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80106c5e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106c61:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106c64:	5b                   	pop    %ebx
80106c65:	5e                   	pop    %esi
80106c66:	5f                   	pop    %edi
80106c67:	5d                   	pop    %ebp
80106c68:	c3                   	ret    
    if(!pte)
      a += (NPTENTRIES - 1) * PGSIZE;
    else if((*pte & PTE_P) != 0){
      pa = PTE_ADDR(*pte);
      if(pa == 0)
        panic("kfree");
80106c69:	83 ec 0c             	sub    $0xc,%esp
80106c6c:	68 72 76 10 80       	push   $0x80107672
80106c71:	e8 fa 96 ff ff       	call   80100370 <panic>
80106c76:	8d 76 00             	lea    0x0(%esi),%esi
80106c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c80 <seginit>:

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106c80:	55                   	push   %ebp
80106c81:	89 e5                	mov    %esp,%ebp
80106c83:	53                   	push   %ebx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106c84:	31 db                	xor    %ebx,%ebx

// Set up CPU's kernel segment descriptors.
// Run once on entry on each CPU.
void
seginit(void)
{
80106c86:	83 ec 14             	sub    $0x14,%esp

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106c89:	e8 92 ba ff ff       	call   80102720 <cpunum>
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106c8e:	69 c0 bc 00 00 00    	imul   $0xbc,%eax,%eax
80106c94:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80106c99:	8d 90 a0 27 11 80    	lea    -0x7feed860(%eax),%edx
80106c9f:	c6 80 1d 28 11 80 9a 	movb   $0x9a,-0x7feed7e3(%eax)
80106ca6:	c6 80 1e 28 11 80 cf 	movb   $0xcf,-0x7feed7e2(%eax)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106cad:	c6 80 25 28 11 80 92 	movb   $0x92,-0x7feed7db(%eax)
80106cb4:	c6 80 26 28 11 80 cf 	movb   $0xcf,-0x7feed7da(%eax)
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106cbb:	66 89 4a 78          	mov    %cx,0x78(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106cbf:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106cc4:	66 89 5a 7a          	mov    %bx,0x7a(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106cc8:	66 89 8a 80 00 00 00 	mov    %cx,0x80(%edx)
80106ccf:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106cd1:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106cd6:	66 89 9a 82 00 00 00 	mov    %bx,0x82(%edx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106cdd:	66 89 8a 90 00 00 00 	mov    %cx,0x90(%edx)
80106ce4:	31 db                	xor    %ebx,%ebx
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106ce6:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106ceb:	66 89 9a 92 00 00 00 	mov    %bx,0x92(%edx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106cf2:	31 db                	xor    %ebx,%ebx
80106cf4:	66 89 8a 98 00 00 00 	mov    %cx,0x98(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106cfb:	8d 88 54 28 11 80    	lea    -0x7feed7ac(%eax),%ecx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106d01:	66 89 9a 9a 00 00 00 	mov    %bx,0x9a(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106d08:	31 db                	xor    %ebx,%ebx
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106d0a:	c6 80 35 28 11 80 fa 	movb   $0xfa,-0x7feed7cb(%eax)
80106d11:	c6 80 36 28 11 80 cf 	movb   $0xcf,-0x7feed7ca(%eax)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106d18:	66 89 9a 88 00 00 00 	mov    %bx,0x88(%edx)
80106d1f:	66 89 8a 8a 00 00 00 	mov    %cx,0x8a(%edx)
80106d26:	89 cb                	mov    %ecx,%ebx
80106d28:	c1 e9 18             	shr    $0x18,%ecx
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106d2b:	c6 80 3d 28 11 80 f2 	movb   $0xf2,-0x7feed7c3(%eax)
80106d32:	c6 80 3e 28 11 80 cf 	movb   $0xcf,-0x7feed7c2(%eax)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106d39:	88 8a 8f 00 00 00    	mov    %cl,0x8f(%edx)
80106d3f:	c6 80 2d 28 11 80 92 	movb   $0x92,-0x7feed7d3(%eax)
static inline void
lgdt(struct segdesc *p, int size)
{
  volatile ushort pd[3];

  pd[0] = size-1;
80106d46:	b9 37 00 00 00       	mov    $0x37,%ecx
80106d4b:	c6 80 2e 28 11 80 c0 	movb   $0xc0,-0x7feed7d2(%eax)

  lgdt(c->gdt, sizeof(c->gdt));
80106d52:	05 10 28 11 80       	add    $0x80112810,%eax
80106d57:	66 89 4d f2          	mov    %cx,-0xe(%ebp)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106d5b:	c1 eb 10             	shr    $0x10,%ebx
  pd[1] = (uint)p;
80106d5e:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
  pd[2] = (uint)p >> 16;
80106d62:	c1 e8 10             	shr    $0x10,%eax
  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
  c->gdt[SEG_KCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, 0);
80106d65:	c6 42 7c 00          	movb   $0x0,0x7c(%edx)
80106d69:	c6 42 7f 00          	movb   $0x0,0x7f(%edx)
  c->gdt[SEG_KDATA] = SEG(STA_W, 0, 0xffffffff, 0);
80106d6d:	c6 82 84 00 00 00 00 	movb   $0x0,0x84(%edx)
80106d74:	c6 82 87 00 00 00 00 	movb   $0x0,0x87(%edx)
  c->gdt[SEG_UCODE] = SEG(STA_X|STA_R, 0, 0xffffffff, DPL_USER);
80106d7b:	c6 82 94 00 00 00 00 	movb   $0x0,0x94(%edx)
80106d82:	c6 82 97 00 00 00 00 	movb   $0x0,0x97(%edx)
  c->gdt[SEG_UDATA] = SEG(STA_W, 0, 0xffffffff, DPL_USER);
80106d89:	c6 82 9c 00 00 00 00 	movb   $0x0,0x9c(%edx)
80106d90:	c6 82 9f 00 00 00 00 	movb   $0x0,0x9f(%edx)

  // Map cpu and proc -- these are private per cpu.
  c->gdt[SEG_KCPU] = SEG(STA_W, &c->cpu, 8, 0);
80106d97:	88 9a 8c 00 00 00    	mov    %bl,0x8c(%edx)
80106d9d:	66 89 45 f6          	mov    %ax,-0xa(%ebp)

  asm volatile("lgdt (%0)" : : "r" (pd));
80106da1:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106da4:	0f 01 10             	lgdtl  (%eax)
}

static inline void
loadgs(ushort v)
{
  asm volatile("movw %0, %%gs" : : "r" (v));
80106da7:	b8 18 00 00 00       	mov    $0x18,%eax
80106dac:	8e e8                	mov    %eax,%gs
  lgdt(c->gdt, sizeof(c->gdt));
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
80106dae:	65 c7 05 04 00 00 00 	movl   $0x0,%gs:0x4
80106db5:	00 00 00 00 

  // Map "logical" addresses to virtual addresses using identity map.
  // Cannot share a CODE descriptor for both kernel and user
  // because it would have to have DPL_USR, but the CPU forbids
  // an interrupt from CPL=0 to DPL=3.
  c = &cpus[cpunum()];
80106db9:	65 89 15 00 00 00 00 	mov    %edx,%gs:0x0
  loadgs(SEG_KCPU << 3);

  // Initialize cpu-local storage.
  cpu = c;
  proc = 0;
}
80106dc0:	83 c4 14             	add    $0x14,%esp
80106dc3:	5b                   	pop    %ebx
80106dc4:	5d                   	pop    %ebp
80106dc5:	c3                   	ret    
80106dc6:	8d 76 00             	lea    0x0(%esi),%esi
80106dc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106dd0 <setupkvm>:
};

// Set up kernel part of a page table.
pde_t*
setupkvm(void)
{
80106dd0:	55                   	push   %ebp
80106dd1:	89 e5                	mov    %esp,%ebp
80106dd3:	56                   	push   %esi
80106dd4:	53                   	push   %ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
80106dd5:	e8 e6 b6 ff ff       	call   801024c0 <kalloc>
80106dda:	85 c0                	test   %eax,%eax
80106ddc:	74 52                	je     80106e30 <setupkvm+0x60>
    return 0;
  memset(pgdir, 0, PGSIZE);
80106dde:	83 ec 04             	sub    $0x4,%esp
80106de1:	89 c6                	mov    %eax,%esi
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106de3:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
80106de8:	68 00 10 00 00       	push   $0x1000
80106ded:	6a 00                	push   $0x0
80106def:	50                   	push   %eax
80106df0:	e8 cb d8 ff ff       	call   801046c0 <memset>
80106df5:	83 c4 10             	add    $0x10,%esp
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
80106df8:	8b 43 04             	mov    0x4(%ebx),%eax
80106dfb:	8b 4b 08             	mov    0x8(%ebx),%ecx
80106dfe:	83 ec 08             	sub    $0x8,%esp
80106e01:	8b 13                	mov    (%ebx),%edx
80106e03:	ff 73 0c             	pushl  0xc(%ebx)
80106e06:	50                   	push   %eax
80106e07:	29 c1                	sub    %eax,%ecx
80106e09:	89 f0                	mov    %esi,%eax
80106e0b:	e8 40 fd ff ff       	call   80106b50 <mappages>
80106e10:	83 c4 10             	add    $0x10,%esp
80106e13:	85 c0                	test   %eax,%eax
80106e15:	78 19                	js     80106e30 <setupkvm+0x60>
  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
  memset(pgdir, 0, PGSIZE);
  if (P2V(PHYSTOP) > (void*)DEVSPACE)
    panic("PHYSTOP too high");
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
80106e17:	83 c3 10             	add    $0x10,%ebx
80106e1a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80106e20:	75 d6                	jne    80106df8 <setupkvm+0x28>
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
80106e22:	8d 65 f8             	lea    -0x8(%ebp),%esp
80106e25:	89 f0                	mov    %esi,%eax
80106e27:	5b                   	pop    %ebx
80106e28:	5e                   	pop    %esi
80106e29:	5d                   	pop    %ebp
80106e2a:	c3                   	ret    
80106e2b:	90                   	nop
80106e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106e30:	8d 65 f8             	lea    -0x8(%ebp),%esp
{
  pde_t *pgdir;
  struct kmap *k;

  if((pgdir = (pde_t*)kalloc()) == 0)
    return 0;
80106e33:	31 c0                	xor    %eax,%eax
  for(k = kmap; k < &kmap[NELEM(kmap)]; k++)
    if(mappages(pgdir, k->virt, k->phys_end - k->phys_start,
                (uint)k->phys_start, k->perm) < 0)
      return 0;
  return pgdir;
}
80106e35:	5b                   	pop    %ebx
80106e36:	5e                   	pop    %esi
80106e37:	5d                   	pop    %ebp
80106e38:	c3                   	ret    
80106e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106e40 <kvmalloc>:

// Allocate one page table for the machine for the kernel address
// space for scheduler processes.
void
kvmalloc(void)
{
80106e40:	55                   	push   %ebp
80106e41:	89 e5                	mov    %esp,%ebp
80106e43:	83 ec 08             	sub    $0x8,%esp
  kpgdir = setupkvm();
80106e46:	e8 85 ff ff ff       	call   80106dd0 <setupkvm>
80106e4b:	a3 24 99 11 80       	mov    %eax,0x80119924
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106e50:	05 00 00 00 80       	add    $0x80000000,%eax
80106e55:	0f 22 d8             	mov    %eax,%cr3
  switchkvm();
}
80106e58:	c9                   	leave  
80106e59:	c3                   	ret    
80106e5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106e60 <switchkvm>:
80106e60:	a1 24 99 11 80       	mov    0x80119924,%eax

// Switch h/w page table register to the kernel-only page table,
// for when no process is running.
void
switchkvm(void)
{
80106e65:	55                   	push   %ebp
80106e66:	89 e5                	mov    %esp,%ebp
80106e68:	05 00 00 00 80       	add    $0x80000000,%eax
80106e6d:	0f 22 d8             	mov    %eax,%cr3
  lcr3(V2P(kpgdir));   // switch to the kernel page table
}
80106e70:	5d                   	pop    %ebp
80106e71:	c3                   	ret    
80106e72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e80 <switchuvm>:

// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
80106e80:	55                   	push   %ebp
80106e81:	89 e5                	mov    %esp,%ebp
80106e83:	53                   	push   %ebx
80106e84:	83 ec 04             	sub    $0x4,%esp
80106e87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  pushcli();
80106e8a:	e8 61 d7 ff ff       	call   801045f0 <pushcli>
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106e8f:	65 a1 00 00 00 00    	mov    %gs:0x0,%eax
80106e95:	b9 67 00 00 00       	mov    $0x67,%ecx
80106e9a:	8d 50 08             	lea    0x8(%eax),%edx
80106e9d:	66 89 88 a0 00 00 00 	mov    %cx,0xa0(%eax)
80106ea4:	c6 80 a6 00 00 00 40 	movb   $0x40,0xa6(%eax)
  cpu->gdt[SEG_TSS].s = 0;
80106eab:	c6 80 a5 00 00 00 89 	movb   $0x89,0xa5(%eax)
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106eb2:	66 89 90 a2 00 00 00 	mov    %dx,0xa2(%eax)
80106eb9:	89 d1                	mov    %edx,%ecx
80106ebb:	c1 ea 18             	shr    $0x18,%edx
80106ebe:	88 90 a7 00 00 00    	mov    %dl,0xa7(%eax)
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
80106ec4:	ba 10 00 00 00       	mov    $0x10,%edx
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106ec9:	c1 e9 10             	shr    $0x10,%ecx
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
80106ecc:	66 89 50 10          	mov    %dx,0x10(%eax)
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80106ed0:	65 8b 15 04 00 00 00 	mov    %gs:0x4,%edx
// Switch TSS and h/w page table to correspond to process p.
void
switchuvm(struct proc *p)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
80106ed7:	88 88 a4 00 00 00    	mov    %cl,0xa4(%eax)
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
80106edd:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80106ee2:	8b 52 08             	mov    0x8(%edx),%edx
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
80106ee5:	66 89 48 6e          	mov    %cx,0x6e(%eax)
{
  pushcli();
  cpu->gdt[SEG_TSS] = SEG16(STS_T32A, &cpu->ts, sizeof(cpu->ts)-1, 0);
  cpu->gdt[SEG_TSS].s = 0;
  cpu->ts.ss0 = SEG_KDATA << 3;
  cpu->ts.esp0 = (uint)proc->kstack + KSTACKSIZE;
80106ee9:	81 c2 00 10 00 00    	add    $0x1000,%edx
80106eef:	89 50 0c             	mov    %edx,0xc(%eax)
}

static inline void
ltr(ushort sel)
{
  asm volatile("ltr %0" : : "r" (sel));
80106ef2:	b8 30 00 00 00       	mov    $0x30,%eax
80106ef7:	0f 00 d8             	ltr    %ax
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  if(p->pgdir == 0)
80106efa:	8b 43 04             	mov    0x4(%ebx),%eax
80106efd:	85 c0                	test   %eax,%eax
80106eff:	74 11                	je     80106f12 <switchuvm+0x92>
}

static inline void
lcr3(uint val)
{
  asm volatile("movl %0,%%cr3" : : "r" (val));
80106f01:	05 00 00 00 80       	add    $0x80000000,%eax
80106f06:	0f 22 d8             	mov    %eax,%cr3
    panic("switchuvm: no pgdir");
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
}
80106f09:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80106f0c:	c9                   	leave  
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
  lcr3(V2P(p->pgdir));  // switch to process's address space
  popcli();
80106f0d:	e9 0e d7 ff ff       	jmp    80104620 <popcli>
  // setting IOPL=0 in eflags *and* iomb beyond the tss segment limit
  // forbids I/O instructions (e.g., inb and outb) from user space
  cpu->ts.iomb = (ushort) 0xFFFF;
  ltr(SEG_TSS << 3);
  if(p->pgdir == 0)
    panic("switchuvm: no pgdir");
80106f12:	83 ec 0c             	sub    $0xc,%esp
80106f15:	68 9e 7d 10 80       	push   $0x80107d9e
80106f1a:	e8 51 94 ff ff       	call   80100370 <panic>
80106f1f:	90                   	nop

80106f20 <inituvm>:

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106f20:	55                   	push   %ebp
80106f21:	89 e5                	mov    %esp,%ebp
80106f23:	57                   	push   %edi
80106f24:	56                   	push   %esi
80106f25:	53                   	push   %ebx
80106f26:	83 ec 1c             	sub    $0x1c,%esp
80106f29:	8b 75 10             	mov    0x10(%ebp),%esi
80106f2c:	8b 45 08             	mov    0x8(%ebp),%eax
80106f2f:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *mem;

  if(sz >= PGSIZE)
80106f32:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi

// Load the initcode into address 0 of pgdir.
// sz must be less than a page.
void
inituvm(pde_t *pgdir, char *init, uint sz)
{
80106f38:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  char *mem;

  if(sz >= PGSIZE)
80106f3b:	77 49                	ja     80106f86 <inituvm+0x66>
    panic("inituvm: more than a page");
  mem = kalloc();
80106f3d:	e8 7e b5 ff ff       	call   801024c0 <kalloc>
  memset(mem, 0, PGSIZE);
80106f42:	83 ec 04             	sub    $0x4,%esp
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
80106f45:	89 c3                	mov    %eax,%ebx
  memset(mem, 0, PGSIZE);
80106f47:	68 00 10 00 00       	push   $0x1000
80106f4c:	6a 00                	push   $0x0
80106f4e:	50                   	push   %eax
80106f4f:	e8 6c d7 ff ff       	call   801046c0 <memset>
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
80106f54:	58                   	pop    %eax
80106f55:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106f5b:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106f60:	5a                   	pop    %edx
80106f61:	6a 06                	push   $0x6
80106f63:	50                   	push   %eax
80106f64:	31 d2                	xor    %edx,%edx
80106f66:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106f69:	e8 e2 fb ff ff       	call   80106b50 <mappages>
  memmove(mem, init, sz);
80106f6e:	89 75 10             	mov    %esi,0x10(%ebp)
80106f71:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106f74:	83 c4 10             	add    $0x10,%esp
80106f77:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
80106f7a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f7d:	5b                   	pop    %ebx
80106f7e:	5e                   	pop    %esi
80106f7f:	5f                   	pop    %edi
80106f80:	5d                   	pop    %ebp
  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
  mem = kalloc();
  memset(mem, 0, PGSIZE);
  mappages(pgdir, 0, PGSIZE, V2P(mem), PTE_W|PTE_U);
  memmove(mem, init, sz);
80106f81:	e9 ea d7 ff ff       	jmp    80104770 <memmove>
inituvm(pde_t *pgdir, char *init, uint sz)
{
  char *mem;

  if(sz >= PGSIZE)
    panic("inituvm: more than a page");
80106f86:	83 ec 0c             	sub    $0xc,%esp
80106f89:	68 b2 7d 10 80       	push   $0x80107db2
80106f8e:	e8 dd 93 ff ff       	call   80100370 <panic>
80106f93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106fa0 <loaduvm>:

// Load a program segment into pgdir.  addr must be page-aligned
// and the pages from addr to addr+sz must already be mapped.
int
loaduvm(pde_t *pgdir, char *addr, struct inode *ip, uint offset, uint sz)
{
80106fa0:	55                   	push   %ebp
80106fa1:	89 e5                	mov    %esp,%ebp
80106fa3:	57                   	push   %edi
80106fa4:	56                   	push   %esi
80106fa5:	53                   	push   %ebx
80106fa6:	83 ec 0c             	sub    $0xc,%esp
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
80106fa9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106fb0:	0f 85 91 00 00 00    	jne    80107047 <loaduvm+0xa7>
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
80106fb6:	8b 75 18             	mov    0x18(%ebp),%esi
80106fb9:	31 db                	xor    %ebx,%ebx
80106fbb:	85 f6                	test   %esi,%esi
80106fbd:	75 1a                	jne    80106fd9 <loaduvm+0x39>
80106fbf:	eb 6f                	jmp    80107030 <loaduvm+0x90>
80106fc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106fc8:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106fce:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106fd4:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106fd7:	76 57                	jbe    80107030 <loaduvm+0x90>
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
80106fd9:	8b 55 0c             	mov    0xc(%ebp),%edx
80106fdc:	8b 45 08             	mov    0x8(%ebp),%eax
80106fdf:	31 c9                	xor    %ecx,%ecx
80106fe1:	01 da                	add    %ebx,%edx
80106fe3:	e8 e8 fa ff ff       	call   80106ad0 <walkpgdir>
80106fe8:	85 c0                	test   %eax,%eax
80106fea:	74 4e                	je     8010703a <loaduvm+0x9a>
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106fec:	8b 00                	mov    (%eax),%eax
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80106fee:	8b 4d 14             	mov    0x14(%ebp),%ecx
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
    if(sz - i < PGSIZE)
80106ff1:	bf 00 10 00 00       	mov    $0x1000,%edi
  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
    pa = PTE_ADDR(*pte);
80106ff6:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    if(sz - i < PGSIZE)
80106ffb:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80107001:	0f 46 fe             	cmovbe %esi,%edi
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
80107004:	01 d9                	add    %ebx,%ecx
80107006:	05 00 00 00 80       	add    $0x80000000,%eax
8010700b:	57                   	push   %edi
8010700c:	51                   	push   %ecx
8010700d:	50                   	push   %eax
8010700e:	ff 75 10             	pushl  0x10(%ebp)
80107011:	e8 4a a9 ff ff       	call   80101960 <readi>
80107016:	83 c4 10             	add    $0x10,%esp
80107019:	39 c7                	cmp    %eax,%edi
8010701b:	74 ab                	je     80106fc8 <loaduvm+0x28>
      return -1;
  }
  return 0;
}
8010701d:	8d 65 f4             	lea    -0xc(%ebp),%esp
    if(sz - i < PGSIZE)
      n = sz - i;
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
80107020:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  return 0;
}
80107025:	5b                   	pop    %ebx
80107026:	5e                   	pop    %esi
80107027:	5f                   	pop    %edi
80107028:	5d                   	pop    %ebp
80107029:	c3                   	ret    
8010702a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107030:	8d 65 f4             	lea    -0xc(%ebp),%esp
    else
      n = PGSIZE;
    if(readi(ip, P2V(pa), offset+i, n) != n)
      return -1;
  }
  return 0;
80107033:	31 c0                	xor    %eax,%eax
}
80107035:	5b                   	pop    %ebx
80107036:	5e                   	pop    %esi
80107037:	5f                   	pop    %edi
80107038:	5d                   	pop    %ebp
80107039:	c3                   	ret    

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, addr+i, 0)) == 0)
      panic("loaduvm: address should exist");
8010703a:	83 ec 0c             	sub    $0xc,%esp
8010703d:	68 cc 7d 10 80       	push   $0x80107dcc
80107042:	e8 29 93 ff ff       	call   80100370 <panic>
{
  uint i, pa, n;
  pte_t *pte;

  if((uint) addr % PGSIZE != 0)
    panic("loaduvm: addr must be page aligned");
80107047:	83 ec 0c             	sub    $0xc,%esp
8010704a:	68 70 7e 10 80       	push   $0x80107e70
8010704f:	e8 1c 93 ff ff       	call   80100370 <panic>
80107054:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010705a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107060 <allocuvm>:

// Allocate page tables and physical memory to grow process from oldsz to
// newsz, which need not be page aligned.  Returns new size or 0 on error.
int
allocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80107060:	55                   	push   %ebp
80107061:	89 e5                	mov    %esp,%ebp
80107063:	57                   	push   %edi
80107064:	56                   	push   %esi
80107065:	53                   	push   %ebx
80107066:	83 ec 0c             	sub    $0xc,%esp
80107069:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
8010706c:	85 ff                	test   %edi,%edi
8010706e:	0f 88 ca 00 00 00    	js     8010713e <allocuvm+0xde>
    return 0;
  if(newsz < oldsz)
80107074:	3b 7d 0c             	cmp    0xc(%ebp),%edi
    return oldsz;
80107077:	8b 45 0c             	mov    0xc(%ebp),%eax
  char *mem;
  uint a;

  if(newsz >= KERNBASE)
    return 0;
  if(newsz < oldsz)
8010707a:	0f 82 82 00 00 00    	jb     80107102 <allocuvm+0xa2>
    return oldsz;

  a = PGROUNDUP(oldsz);
80107080:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80107086:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  for(; a < newsz; a += PGSIZE){
8010708c:	39 df                	cmp    %ebx,%edi
8010708e:	77 43                	ja     801070d3 <allocuvm+0x73>
80107090:	e9 bb 00 00 00       	jmp    80107150 <allocuvm+0xf0>
80107095:	8d 76 00             	lea    0x0(%esi),%esi
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
80107098:	83 ec 04             	sub    $0x4,%esp
8010709b:	68 00 10 00 00       	push   $0x1000
801070a0:	6a 00                	push   $0x0
801070a2:	50                   	push   %eax
801070a3:	e8 18 d6 ff ff       	call   801046c0 <memset>
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
801070a8:	58                   	pop    %eax
801070a9:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801070af:	b9 00 10 00 00       	mov    $0x1000,%ecx
801070b4:	5a                   	pop    %edx
801070b5:	6a 06                	push   $0x6
801070b7:	50                   	push   %eax
801070b8:	89 da                	mov    %ebx,%edx
801070ba:	8b 45 08             	mov    0x8(%ebp),%eax
801070bd:	e8 8e fa ff ff       	call   80106b50 <mappages>
801070c2:	83 c4 10             	add    $0x10,%esp
801070c5:	85 c0                	test   %eax,%eax
801070c7:	78 47                	js     80107110 <allocuvm+0xb0>
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
801070c9:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801070cf:	39 df                	cmp    %ebx,%edi
801070d1:	76 7d                	jbe    80107150 <allocuvm+0xf0>
    mem = kalloc();
801070d3:	e8 e8 b3 ff ff       	call   801024c0 <kalloc>
    if(mem == 0){
801070d8:	85 c0                	test   %eax,%eax
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
801070da:	89 c6                	mov    %eax,%esi
    if(mem == 0){
801070dc:	75 ba                	jne    80107098 <allocuvm+0x38>
      cprintf("allocuvm out of memory\n");
801070de:	83 ec 0c             	sub    $0xc,%esp
801070e1:	68 ea 7d 10 80       	push   $0x80107dea
801070e6:	e8 75 95 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
801070eb:	83 c4 10             	add    $0x10,%esp
801070ee:	3b 7d 0c             	cmp    0xc(%ebp),%edi
801070f1:	76 4b                	jbe    8010713e <allocuvm+0xde>
801070f3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801070f6:	8b 45 08             	mov    0x8(%ebp),%eax
801070f9:	89 fa                	mov    %edi,%edx
801070fb:	e8 e0 fa ff ff       	call   80106be0 <deallocuvm.part.0>
  for(; a < newsz; a += PGSIZE){
    mem = kalloc();
    if(mem == 0){
      cprintf("allocuvm out of memory\n");
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
80107100:	31 c0                	xor    %eax,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80107102:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107105:	5b                   	pop    %ebx
80107106:	5e                   	pop    %esi
80107107:	5f                   	pop    %edi
80107108:	5d                   	pop    %ebp
80107109:	c3                   	ret    
8010710a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      deallocuvm(pgdir, newsz, oldsz);
      return 0;
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
80107110:	83 ec 0c             	sub    $0xc,%esp
80107113:	68 02 7e 10 80       	push   $0x80107e02
80107118:	e8 43 95 ff ff       	call   80100660 <cprintf>
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
8010711d:	83 c4 10             	add    $0x10,%esp
80107120:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80107123:	76 0d                	jbe    80107132 <allocuvm+0xd2>
80107125:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80107128:	8b 45 08             	mov    0x8(%ebp),%eax
8010712b:	89 fa                	mov    %edi,%edx
8010712d:	e8 ae fa ff ff       	call   80106be0 <deallocuvm.part.0>
    }
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
80107132:	83 ec 0c             	sub    $0xc,%esp
80107135:	56                   	push   %esi
80107136:	e8 d5 b1 ff ff       	call   80102310 <kfree>
      return 0;
8010713b:	83 c4 10             	add    $0x10,%esp
    }
  }
  return newsz;
}
8010713e:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memset(mem, 0, PGSIZE);
    if(mappages(pgdir, (char*)a, PGSIZE, V2P(mem), PTE_W|PTE_U) < 0){
      cprintf("allocuvm out of memory (2)\n");
      deallocuvm(pgdir, newsz, oldsz);
      kfree(mem);
      return 0;
80107141:	31 c0                	xor    %eax,%eax
    }
  }
  return newsz;
}
80107143:	5b                   	pop    %ebx
80107144:	5e                   	pop    %esi
80107145:	5f                   	pop    %edi
80107146:	5d                   	pop    %ebp
80107147:	c3                   	ret    
80107148:	90                   	nop
80107149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107150:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return 0;
  if(newsz < oldsz)
    return oldsz;

  a = PGROUNDUP(oldsz);
  for(; a < newsz; a += PGSIZE){
80107153:	89 f8                	mov    %edi,%eax
      kfree(mem);
      return 0;
    }
  }
  return newsz;
}
80107155:	5b                   	pop    %ebx
80107156:	5e                   	pop    %esi
80107157:	5f                   	pop    %edi
80107158:	5d                   	pop    %ebp
80107159:	c3                   	ret    
8010715a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107160 <deallocuvm>:
// newsz.  oldsz and newsz need not be page-aligned, nor does newsz
// need to be less than oldsz.  oldsz can be larger than the actual
// process size.  Returns the new process size.
int
deallocuvm(pde_t *pgdir, uint oldsz, uint newsz)
{
80107160:	55                   	push   %ebp
80107161:	89 e5                	mov    %esp,%ebp
80107163:	8b 55 0c             	mov    0xc(%ebp),%edx
80107166:	8b 4d 10             	mov    0x10(%ebp),%ecx
80107169:	8b 45 08             	mov    0x8(%ebp),%eax
  pte_t *pte;
  uint a, pa;

  if(newsz >= oldsz)
8010716c:	39 d1                	cmp    %edx,%ecx
8010716e:	73 10                	jae    80107180 <deallocuvm+0x20>
      kfree(v);
      *pte = 0;
    }
  }
  return newsz;
}
80107170:	5d                   	pop    %ebp
80107171:	e9 6a fa ff ff       	jmp    80106be0 <deallocuvm.part.0>
80107176:	8d 76 00             	lea    0x0(%esi),%esi
80107179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107180:	89 d0                	mov    %edx,%eax
80107182:	5d                   	pop    %ebp
80107183:	c3                   	ret    
80107184:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010718a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107190 <freevm>:

// Free a page table and all the physical memory pages
// in the user part.
void
freevm(pde_t *pgdir)
{
80107190:	55                   	push   %ebp
80107191:	89 e5                	mov    %esp,%ebp
80107193:	57                   	push   %edi
80107194:	56                   	push   %esi
80107195:	53                   	push   %ebx
80107196:	83 ec 0c             	sub    $0xc,%esp
80107199:	8b 75 08             	mov    0x8(%ebp),%esi
  uint i;

  if(pgdir == 0)
8010719c:	85 f6                	test   %esi,%esi
8010719e:	74 59                	je     801071f9 <freevm+0x69>
801071a0:	31 c9                	xor    %ecx,%ecx
801071a2:	ba 00 00 00 80       	mov    $0x80000000,%edx
801071a7:	89 f0                	mov    %esi,%eax
801071a9:	e8 32 fa ff ff       	call   80106be0 <deallocuvm.part.0>
801071ae:	89 f3                	mov    %esi,%ebx
801071b0:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
801071b6:	eb 0f                	jmp    801071c7 <freevm+0x37>
801071b8:	90                   	nop
801071b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801071c0:	83 c3 04             	add    $0x4,%ebx
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
801071c3:	39 fb                	cmp    %edi,%ebx
801071c5:	74 23                	je     801071ea <freevm+0x5a>
    if(pgdir[i] & PTE_P){
801071c7:	8b 03                	mov    (%ebx),%eax
801071c9:	a8 01                	test   $0x1,%al
801071cb:	74 f3                	je     801071c0 <freevm+0x30>
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
801071cd:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801071d2:	83 ec 0c             	sub    $0xc,%esp
801071d5:	83 c3 04             	add    $0x4,%ebx
801071d8:	05 00 00 00 80       	add    $0x80000000,%eax
801071dd:	50                   	push   %eax
801071de:	e8 2d b1 ff ff       	call   80102310 <kfree>
801071e3:	83 c4 10             	add    $0x10,%esp
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
  deallocuvm(pgdir, KERNBASE, 0);
  for(i = 0; i < NPDENTRIES; i++){
801071e6:	39 fb                	cmp    %edi,%ebx
801071e8:	75 dd                	jne    801071c7 <freevm+0x37>
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
801071ea:	89 75 08             	mov    %esi,0x8(%ebp)
}
801071ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
801071f0:	5b                   	pop    %ebx
801071f1:	5e                   	pop    %esi
801071f2:	5f                   	pop    %edi
801071f3:	5d                   	pop    %ebp
    if(pgdir[i] & PTE_P){
      char * v = P2V(PTE_ADDR(pgdir[i]));
      kfree(v);
    }
  }
  kfree((char*)pgdir);
801071f4:	e9 17 b1 ff ff       	jmp    80102310 <kfree>
freevm(pde_t *pgdir)
{
  uint i;

  if(pgdir == 0)
    panic("freevm: no pgdir");
801071f9:	83 ec 0c             	sub    $0xc,%esp
801071fc:	68 1e 7e 10 80       	push   $0x80107e1e
80107201:	e8 6a 91 ff ff       	call   80100370 <panic>
80107206:	8d 76 00             	lea    0x0(%esi),%esi
80107209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107210 <clearpteu>:

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80107210:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107211:	31 c9                	xor    %ecx,%ecx

// Clear PTE_U on a page. Used to create an inaccessible
// page beneath the user stack.
void
clearpteu(pde_t *pgdir, char *uva)
{
80107213:	89 e5                	mov    %esp,%ebp
80107215:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107218:	8b 55 0c             	mov    0xc(%ebp),%edx
8010721b:	8b 45 08             	mov    0x8(%ebp),%eax
8010721e:	e8 ad f8 ff ff       	call   80106ad0 <walkpgdir>
  if(pte == 0)
80107223:	85 c0                	test   %eax,%eax
80107225:	74 05                	je     8010722c <clearpteu+0x1c>
    panic("clearpteu");
  *pte &= ~PTE_U;
80107227:	83 20 fb             	andl   $0xfffffffb,(%eax)
}
8010722a:	c9                   	leave  
8010722b:	c3                   	ret    
{
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
  if(pte == 0)
    panic("clearpteu");
8010722c:	83 ec 0c             	sub    $0xc,%esp
8010722f:	68 2f 7e 10 80       	push   $0x80107e2f
80107234:	e8 37 91 ff ff       	call   80100370 <panic>
80107239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107240 <copyuvm>:

// Given a parent process's page table, create a copy
// of it for a child.
pde_t*
copyuvm(pde_t *pgdir, uint sz)
{
80107240:	55                   	push   %ebp
80107241:	89 e5                	mov    %esp,%ebp
80107243:	57                   	push   %edi
80107244:	56                   	push   %esi
80107245:	53                   	push   %ebx
80107246:	83 ec 1c             	sub    $0x1c,%esp
  pde_t *d;
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
80107249:	e8 82 fb ff ff       	call   80106dd0 <setupkvm>
8010724e:	85 c0                	test   %eax,%eax
80107250:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107253:	0f 84 b2 00 00 00    	je     8010730b <copyuvm+0xcb>
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107259:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010725c:	85 c9                	test   %ecx,%ecx
8010725e:	0f 84 9c 00 00 00    	je     80107300 <copyuvm+0xc0>
80107264:	31 f6                	xor    %esi,%esi
80107266:	eb 4a                	jmp    801072b2 <copyuvm+0x72>
80107268:	90                   	nop
80107269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
      goto bad;
    memmove(mem, (char*)P2V(pa), PGSIZE);
80107270:	83 ec 04             	sub    $0x4,%esp
80107273:	81 c7 00 00 00 80    	add    $0x80000000,%edi
80107279:	68 00 10 00 00       	push   $0x1000
8010727e:	57                   	push   %edi
8010727f:	50                   	push   %eax
80107280:	e8 eb d4 ff ff       	call   80104770 <memmove>
    if(mappages(d, (void*)i, PGSIZE, V2P(mem), flags) < 0)
80107285:	58                   	pop    %eax
80107286:	5a                   	pop    %edx
80107287:	8d 93 00 00 00 80    	lea    -0x80000000(%ebx),%edx
8010728d:	8b 45 e0             	mov    -0x20(%ebp),%eax
80107290:	ff 75 e4             	pushl  -0x1c(%ebp)
80107293:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107298:	52                   	push   %edx
80107299:	89 f2                	mov    %esi,%edx
8010729b:	e8 b0 f8 ff ff       	call   80106b50 <mappages>
801072a0:	83 c4 10             	add    $0x10,%esp
801072a3:	85 c0                	test   %eax,%eax
801072a5:	78 3e                	js     801072e5 <copyuvm+0xa5>
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
801072a7:	81 c6 00 10 00 00    	add    $0x1000,%esi
801072ad:	39 75 0c             	cmp    %esi,0xc(%ebp)
801072b0:	76 4e                	jbe    80107300 <copyuvm+0xc0>
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
801072b2:	8b 45 08             	mov    0x8(%ebp),%eax
801072b5:	31 c9                	xor    %ecx,%ecx
801072b7:	89 f2                	mov    %esi,%edx
801072b9:	e8 12 f8 ff ff       	call   80106ad0 <walkpgdir>
801072be:	85 c0                	test   %eax,%eax
801072c0:	74 5a                	je     8010731c <copyuvm+0xdc>
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
801072c2:	8b 18                	mov    (%eax),%ebx
801072c4:	f6 c3 01             	test   $0x1,%bl
801072c7:	74 46                	je     8010730f <copyuvm+0xcf>
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
801072c9:	89 df                	mov    %ebx,%edi
    flags = PTE_FLAGS(*pte);
801072cb:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
801072d1:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
    pa = PTE_ADDR(*pte);
801072d4:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
    flags = PTE_FLAGS(*pte);
    if((mem = kalloc()) == 0)
801072da:	e8 e1 b1 ff ff       	call   801024c0 <kalloc>
801072df:	85 c0                	test   %eax,%eax
801072e1:	89 c3                	mov    %eax,%ebx
801072e3:	75 8b                	jne    80107270 <copyuvm+0x30>
      goto bad;
  }
  return d;

bad:
  freevm(d);
801072e5:	83 ec 0c             	sub    $0xc,%esp
801072e8:	ff 75 e0             	pushl  -0x20(%ebp)
801072eb:	e8 a0 fe ff ff       	call   80107190 <freevm>
  return 0;
801072f0:	83 c4 10             	add    $0x10,%esp
801072f3:	31 c0                	xor    %eax,%eax
}
801072f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801072f8:	5b                   	pop    %ebx
801072f9:	5e                   	pop    %esi
801072fa:	5f                   	pop    %edi
801072fb:	5d                   	pop    %ebp
801072fc:	c3                   	ret    
801072fd:	8d 76 00             	lea    0x0(%esi),%esi
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
80107300:	8b 45 e0             	mov    -0x20(%ebp),%eax
  return d;

bad:
  freevm(d);
  return 0;
}
80107303:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107306:	5b                   	pop    %ebx
80107307:	5e                   	pop    %esi
80107308:	5f                   	pop    %edi
80107309:	5d                   	pop    %ebp
8010730a:	c3                   	ret    
  pte_t *pte;
  uint pa, i, flags;
  char *mem;

  if((d = setupkvm()) == 0)
    return 0;
8010730b:	31 c0                	xor    %eax,%eax
8010730d:	eb e6                	jmp    801072f5 <copyuvm+0xb5>
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
    if(!(*pte & PTE_P))
      panic("copyuvm: page not present");
8010730f:	83 ec 0c             	sub    $0xc,%esp
80107312:	68 53 7e 10 80       	push   $0x80107e53
80107317:	e8 54 90 ff ff       	call   80100370 <panic>

  if((d = setupkvm()) == 0)
    return 0;
  for(i = 0; i < sz; i += PGSIZE){
    if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
      panic("copyuvm: pte should exist");
8010731c:	83 ec 0c             	sub    $0xc,%esp
8010731f:	68 39 7e 10 80       	push   $0x80107e39
80107324:	e8 47 90 ff ff       	call   80100370 <panic>
80107329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107330 <uva2ka>:

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107330:	55                   	push   %ebp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107331:	31 c9                	xor    %ecx,%ecx

//PAGEBREAK!
// Map user virtual address to kernel address.
char*
uva2ka(pde_t *pgdir, char *uva)
{
80107333:	89 e5                	mov    %esp,%ebp
80107335:	83 ec 08             	sub    $0x8,%esp
  pte_t *pte;

  pte = walkpgdir(pgdir, uva, 0);
80107338:	8b 55 0c             	mov    0xc(%ebp),%edx
8010733b:	8b 45 08             	mov    0x8(%ebp),%eax
8010733e:	e8 8d f7 ff ff       	call   80106ad0 <walkpgdir>
  if((*pte & PTE_P) == 0)
80107343:	8b 00                	mov    (%eax),%eax
    return 0;
  if((*pte & PTE_U) == 0)
80107345:	89 c2                	mov    %eax,%edx
80107347:	83 e2 05             	and    $0x5,%edx
8010734a:	83 fa 05             	cmp    $0x5,%edx
8010734d:	75 11                	jne    80107360 <uva2ka+0x30>
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
8010734f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
}
80107354:	c9                   	leave  
  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
  return (char*)P2V(PTE_ADDR(*pte));
80107355:	05 00 00 00 80       	add    $0x80000000,%eax
}
8010735a:	c3                   	ret    
8010735b:	90                   	nop
8010735c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  pte = walkpgdir(pgdir, uva, 0);
  if((*pte & PTE_P) == 0)
    return 0;
  if((*pte & PTE_U) == 0)
    return 0;
80107360:	31 c0                	xor    %eax,%eax
  return (char*)P2V(PTE_ADDR(*pte));
}
80107362:	c9                   	leave  
80107363:	c3                   	ret    
80107364:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010736a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107370 <copyout>:
// Copy len bytes from p to user address va in page table pgdir.
// Most useful when pgdir is not the current page table.
// uva2ka ensures this only works for PTE_U pages.
int
copyout(pde_t *pgdir, uint va, void *p, uint len)
{
80107370:	55                   	push   %ebp
80107371:	89 e5                	mov    %esp,%ebp
80107373:	57                   	push   %edi
80107374:	56                   	push   %esi
80107375:	53                   	push   %ebx
80107376:	83 ec 1c             	sub    $0x1c,%esp
80107379:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010737c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010737f:	8b 7d 10             	mov    0x10(%ebp),%edi
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
80107382:	85 db                	test   %ebx,%ebx
80107384:	75 40                	jne    801073c6 <copyout+0x56>
80107386:	eb 70                	jmp    801073f8 <copyout+0x88>
80107388:	90                   	nop
80107389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
    n = PGSIZE - (va - va0);
80107390:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107393:	89 f1                	mov    %esi,%ecx
80107395:	29 d1                	sub    %edx,%ecx
80107397:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010739d:	39 d9                	cmp    %ebx,%ecx
8010739f:	0f 47 cb             	cmova  %ebx,%ecx
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
801073a2:	29 f2                	sub    %esi,%edx
801073a4:	83 ec 04             	sub    $0x4,%esp
801073a7:	01 d0                	add    %edx,%eax
801073a9:	51                   	push   %ecx
801073aa:	57                   	push   %edi
801073ab:	50                   	push   %eax
801073ac:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801073af:	e8 bc d3 ff ff       	call   80104770 <memmove>
    len -= n;
    buf += n;
801073b4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801073b7:	83 c4 10             	add    $0x10,%esp
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
801073ba:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    n = PGSIZE - (va - va0);
    if(n > len)
      n = len;
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
801073c0:	01 cf                	add    %ecx,%edi
{
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
801073c2:	29 cb                	sub    %ecx,%ebx
801073c4:	74 32                	je     801073f8 <copyout+0x88>
    va0 = (uint)PGROUNDDOWN(va);
801073c6:	89 d6                	mov    %edx,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801073c8:	83 ec 08             	sub    $0x8,%esp
  char *buf, *pa0;
  uint n, va0;

  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
801073cb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801073ce:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
    pa0 = uva2ka(pgdir, (char*)va0);
801073d4:	56                   	push   %esi
801073d5:	ff 75 08             	pushl  0x8(%ebp)
801073d8:	e8 53 ff ff ff       	call   80107330 <uva2ka>
    if(pa0 == 0)
801073dd:	83 c4 10             	add    $0x10,%esp
801073e0:	85 c0                	test   %eax,%eax
801073e2:	75 ac                	jne    80107390 <copyout+0x20>
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
801073e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  buf = (char*)p;
  while(len > 0){
    va0 = (uint)PGROUNDDOWN(va);
    pa0 = uva2ka(pgdir, (char*)va0);
    if(pa0 == 0)
      return -1;
801073e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
}
801073ec:	5b                   	pop    %ebx
801073ed:	5e                   	pop    %esi
801073ee:	5f                   	pop    %edi
801073ef:	5d                   	pop    %ebp
801073f0:	c3                   	ret    
801073f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801073f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    memmove(pa0 + (va - va0), buf, n);
    len -= n;
    buf += n;
    va = va0 + PGSIZE;
  }
  return 0;
801073fb:	31 c0                	xor    %eax,%eax
}
801073fd:	5b                   	pop    %ebx
801073fe:	5e                   	pop    %esi
801073ff:	5f                   	pop    %edi
80107400:	5d                   	pop    %ebp
80107401:	c3                   	ret    
