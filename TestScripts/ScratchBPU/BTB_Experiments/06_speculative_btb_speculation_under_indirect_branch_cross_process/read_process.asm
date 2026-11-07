
./x_test_p1:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    $0x8,%rsp
  401008:	48 8b 05 e9 8f 00 00 	mov    0x8fe9(%rip),%rax        # 409ff8 <__gmon_start__@Base>
  40100f:	48 85 c0             	test   %rax,%rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	call   *%rax
  401016:	48 83 c4 08          	add    $0x8,%rsp
  40101a:	c3                   	ret    

Disassembly of section .plt:

0000000000401020 <__printf_chk@plt-0x10>:
  401020:	ff 35 e2 8f 00 00    	push   0x8fe2(%rip)        # 40a008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	ff 25 e4 8f 00 00    	jmp    *0x8fe4(%rip)        # 40a010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401030 <__printf_chk@plt>:
  401030:	ff 25 e2 8f 00 00    	jmp    *0x8fe2(%rip)        # 40a018 <__printf_chk@GLIBC_2.3.4>
  401036:	68 00 00 00 00       	push   $0x0
  40103b:	e9 e0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401040 <strstr@plt>:
  401040:	ff 25 da 8f 00 00    	jmp    *0x8fda(%rip)        # 40a020 <strstr@GLIBC_2.2.5>
  401046:	68 01 00 00 00       	push   $0x1
  40104b:	e9 d0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401050 <setpriority@plt>:
  401050:	ff 25 d2 8f 00 00    	jmp    *0x8fd2(%rip)        # 40a028 <setpriority@GLIBC_2.2.5>
  401056:	68 02 00 00 00       	push   $0x2
  40105b:	e9 c0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401060 <memset@plt>:
  401060:	ff 25 ca 8f 00 00    	jmp    *0x8fca(%rip)        # 40a030 <memset@GLIBC_2.2.5>
  401066:	68 03 00 00 00       	push   $0x3
  40106b:	e9 b0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401070 <open@plt>:
  401070:	ff 25 c2 8f 00 00    	jmp    *0x8fc2(%rip)        # 40a038 <open@GLIBC_2.2.5>
  401076:	68 04 00 00 00       	push   $0x4
  40107b:	e9 a0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401080 <sched_setaffinity@plt>:
  401080:	ff 25 ba 8f 00 00    	jmp    *0x8fba(%rip)        # 40a040 <sched_setaffinity@GLIBC_2.3.4>
  401086:	68 05 00 00 00       	push   $0x5
  40108b:	e9 90 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401090 <perror@plt>:
  401090:	ff 25 b2 8f 00 00    	jmp    *0x8fb2(%rip)        # 40a048 <perror@GLIBC_2.2.5>
  401096:	68 06 00 00 00       	push   $0x6
  40109b:	e9 80 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010a0 <__cxa_atexit@plt>:
  4010a0:	ff 25 aa 8f 00 00    	jmp    *0x8faa(%rip)        # 40a050 <__cxa_atexit@GLIBC_2.2.5>
  4010a6:	68 07 00 00 00       	push   $0x7
  4010ab:	e9 70 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010b0 <pthread_join@plt>:
  4010b0:	ff 25 a2 8f 00 00    	jmp    *0x8fa2(%rip)        # 40a058 <pthread_join@GLIBC_2.34>
  4010b6:	68 08 00 00 00       	push   $0x8
  4010bb:	e9 60 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010c0 <gettid@plt>:
  4010c0:	ff 25 9a 8f 00 00    	jmp    *0x8f9a(%rip)        # 40a060 <gettid@GLIBC_2.30>
  4010c6:	68 09 00 00 00       	push   $0x9
  4010cb:	e9 50 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010d0 <__stack_chk_fail@plt>:
  4010d0:	ff 25 92 8f 00 00    	jmp    *0x8f92(%rip)        # 40a068 <__stack_chk_fail@GLIBC_2.4>
  4010d6:	68 0a 00 00 00       	push   $0xa
  4010db:	e9 40 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010e0 <exit@plt>:
  4010e0:	ff 25 8a 8f 00 00    	jmp    *0x8f8a(%rip)        # 40a070 <exit@GLIBC_2.2.5>
  4010e6:	68 0b 00 00 00       	push   $0xb
  4010eb:	e9 30 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010f0 <ftruncate@plt>:
  4010f0:	ff 25 82 8f 00 00    	jmp    *0x8f82(%rip)        # 40a078 <ftruncate@GLIBC_2.2.5>
  4010f6:	68 0c 00 00 00       	push   $0xc
  4010fb:	e9 20 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401100 <putchar@plt>:
  401100:	ff 25 7a 8f 00 00    	jmp    *0x8f7a(%rip)        # 40a080 <putchar@GLIBC_2.2.5>
  401106:	68 0d 00 00 00       	push   $0xd
  40110b:	e9 10 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401110 <strtol@plt>:
  401110:	ff 25 72 8f 00 00    	jmp    *0x8f72(%rip)        # 40a088 <strtol@GLIBC_2.2.5>
  401116:	68 0e 00 00 00       	push   $0xe
  40111b:	e9 00 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401120 <ioctl@plt>:
  401120:	ff 25 6a 8f 00 00    	jmp    *0x8f6a(%rip)        # 40a090 <ioctl@GLIBC_2.2.5>
  401126:	68 0f 00 00 00       	push   $0xf
  40112b:	e9 f0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401130 <sched_yield@plt>:
  401130:	ff 25 62 8f 00 00    	jmp    *0x8f62(%rip)        # 40a098 <sched_yield@GLIBC_2.2.5>
  401136:	68 10 00 00 00       	push   $0x10
  40113b:	e9 e0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401140 <sched_getaffinity@plt>:
  401140:	ff 25 5a 8f 00 00    	jmp    *0x8f5a(%rip)        # 40a0a0 <sched_getaffinity@GLIBC_2.3.4>
  401146:	68 11 00 00 00       	push   $0x11
  40114b:	e9 d0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401150 <shm_open@plt>:
  401150:	ff 25 52 8f 00 00    	jmp    *0x8f52(%rip)        # 40a0a8 <shm_open@GLIBC_2.34>
  401156:	68 12 00 00 00       	push   $0x12
  40115b:	e9 c0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401160 <_Unwind_Resume@plt>:
  401160:	ff 25 4a 8f 00 00    	jmp    *0x8f4a(%rip)        # 40a0b0 <_Unwind_Resume@GCC_3.0>
  401166:	68 13 00 00 00       	push   $0x13
  40116b:	e9 b0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401170 <mmap@plt>:
  401170:	ff 25 42 8f 00 00    	jmp    *0x8f42(%rip)        # 40a0b8 <mmap@GLIBC_2.2.5>
  401176:	68 14 00 00 00       	push   $0x14
  40117b:	e9 a0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401180 <pthread_create@plt>:
  401180:	ff 25 3a 8f 00 00    	jmp    *0x8f3a(%rip)        # 40a0c0 <pthread_create@GLIBC_2.34>
  401186:	68 15 00 00 00       	push   $0x15
  40118b:	e9 90 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401190 <close@plt>:
  401190:	ff 25 32 8f 00 00    	jmp    *0x8f32(%rip)        # 40a0c8 <close@GLIBC_2.2.5>
  401196:	68 16 00 00 00       	push   $0x16
  40119b:	e9 80 fe ff ff       	jmp    401020 <_init+0x20>

Disassembly of section .text:

00000000004011a0 <main.cold>:
  4011a0:	83 bc 24 a0 00 00 00 	cmpl   $0x0,0xa0(%rsp)
  4011a7:	00 
  4011a8:	75 08                	jne    4011b2 <main.cold+0x12>
  4011aa:	48 89 ef             	mov    %rbp,%rdi
  4011ad:	e8 ae ff ff ff       	call   401160 <_Unwind_Resume@plt>
  4011b2:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  4011b9:	00 
  4011ba:	e8 a1 0c 00 00       	call   401e60 <_ZN13ThreadHandler4StopEv.part.0>
  4011bf:	eb e9                	jmp    4011aa <main.cold+0xa>
  4011c1:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  4011c8:	00 00 00 
  4011cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000004011d0 <main>:
  4011d0:	f3 0f 1e fa          	endbr64 
  4011d4:	41 57                	push   %r15
  4011d6:	41 56                	push   %r14
  4011d8:	41 55                	push   %r13
  4011da:	41 54                	push   %r12
  4011dc:	55                   	push   %rbp
  4011dd:	53                   	push   %rbx
  4011de:	4c 8d 9c 24 00 b0 ff 	lea    -0x5000(%rsp),%r11
  4011e5:	ff 
  4011e6:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
  4011ed:	48 83 0c 24 00       	orq    $0x0,(%rsp)
  4011f2:	4c 39 dc             	cmp    %r11,%rsp
  4011f5:	75 ef                	jne    4011e6 <main+0x16>
  4011f7:	48 81 ec 78 0e 00 00 	sub    $0xe78,%rsp
  4011fe:	ba ff 01 00 00       	mov    $0x1ff,%edx
  401203:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40120a:	00 00 
  40120c:	48 89 84 24 68 5e 00 	mov    %rax,0x5e68(%rsp)
  401213:	00 
  401214:	31 c0                	xor    %eax,%eax
  401216:	89 fd                	mov    %edi,%ebp
  401218:	49 89 f4             	mov    %rsi,%r12
  40121b:	48 8d 3d 8f 73 00 00 	lea    0x738f(%rip),%rdi        # 4085b1 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x171>
  401222:	be 42 00 00 00       	mov    $0x42,%esi
  401227:	e8 24 ff ff ff       	call   401150 <shm_open@plt>
  40122c:	ba ff 01 00 00       	mov    $0x1ff,%edx
  401231:	be 42 00 00 00       	mov    $0x42,%esi
  401236:	48 8d 3d 81 73 00 00 	lea    0x7381(%rip),%rdi        # 4085be <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x17e>
  40123d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401241:	89 c3                	mov    %eax,%ebx
  401243:	e8 08 ff ff ff       	call   401150 <shm_open@plt>
  401248:	89 44 24 10          	mov    %eax,0x10(%rsp)
  40124c:	83 fb ff             	cmp    $0xffffffff,%ebx
  40124f:	0f 84 7e 0a 00 00    	je     401cd3 <main+0xb03>
  401255:	83 f8 ff             	cmp    $0xffffffff,%eax
  401258:	0f 84 75 0a 00 00    	je     401cd3 <main+0xb03>
  40125e:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  401262:	be 04 00 00 00       	mov    $0x4,%esi
  401267:	e8 84 fe ff ff       	call   4010f0 <ftruncate@plt>
  40126c:	83 f8 ff             	cmp    $0xffffffff,%eax
  40126f:	0f 84 8a 0a 00 00    	je     401cff <main+0xb2f>
  401275:	8b 5c 24 10          	mov    0x10(%rsp),%ebx
  401279:	be 04 00 00 00       	mov    $0x4,%esi
  40127e:	89 df                	mov    %ebx,%edi
  401280:	e8 6b fe ff ff       	call   4010f0 <ftruncate@plt>
  401285:	83 f8 ff             	cmp    $0xffffffff,%eax
  401288:	0f 84 71 0a 00 00    	je     401cff <main+0xb2f>
  40128e:	44 8b 44 24 0c       	mov    0xc(%rsp),%r8d
  401293:	45 31 c9             	xor    %r9d,%r9d
  401296:	b9 01 00 00 00       	mov    $0x1,%ecx
  40129b:	31 ff                	xor    %edi,%edi
  40129d:	ba 03 00 00 00       	mov    $0x3,%edx
  4012a2:	be 04 00 00 00       	mov    $0x4,%esi
  4012a7:	e8 c4 fe ff ff       	call   401170 <mmap@plt>
  4012ac:	b9 01 00 00 00       	mov    $0x1,%ecx
  4012b1:	45 31 c9             	xor    %r9d,%r9d
  4012b4:	41 89 d8             	mov    %ebx,%r8d
  4012b7:	ba 03 00 00 00       	mov    $0x3,%edx
  4012bc:	be 04 00 00 00       	mov    $0x4,%esi
  4012c1:	31 ff                	xor    %edi,%edi
  4012c3:	48 89 05 b2 eb 00 00 	mov    %rax,0xebb2(%rip)        # 40fe7c <PSharedMemory>
  4012ca:	e8 a1 fe ff ff       	call   401170 <mmap@plt>
  4012cf:	48 8b 15 a6 eb 00 00 	mov    0xeba6(%rip),%rdx        # 40fe7c <PSharedMemory>
  4012d6:	48 89 05 a7 eb 00 00 	mov    %rax,0xeba7(%rip)        # 40fe84 <PSharedMemory2>
  4012dd:	48 89 c1             	mov    %rax,%rcx
  4012e0:	48 83 fa ff          	cmp    $0xffffffffffffffff,%rdx
  4012e4:	0f 84 ff 09 00 00    	je     401ce9 <main+0xb19>
  4012ea:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  4012ee:	0f 84 f5 09 00 00    	je     401ce9 <main+0xb19>
  4012f4:	48 8d 35 e5 6e 00 00 	lea    0x6ee5(%rip),%rsi        # 4081e0 <_IO_stdin_used+0x1e0>
  4012fb:	bf 01 00 00 00       	mov    $0x1,%edi
  401300:	31 c0                	xor    %eax,%eax
  401302:	e8 29 fd ff ff       	call   401030 <__printf_chk@plt>
  401307:	48 8b 05 76 eb 00 00 	mov    0xeb76(%rip),%rax        # 40fe84 <PSharedMemory2>
  40130e:	bf 01 00 00 00       	mov    $0x1,%edi
  401313:	48 8d 35 f6 6e 00 00 	lea    0x6ef6(%rip),%rsi        # 408210 <_IO_stdin_used+0x210>
  40131a:	8b 08                	mov    (%rax),%ecx
  40131c:	48 8b 05 59 eb 00 00 	mov    0xeb59(%rip),%rax        # 40fe7c <PSharedMemory>
  401323:	8b 10                	mov    (%rax),%edx
  401325:	31 c0                	xor    %eax,%eax
  401327:	e8 04 fd ff ff       	call   401030 <__printf_chk@plt>
  40132c:	83 fd 01             	cmp    $0x1,%ebp
  40132f:	7e 27                	jle    401358 <main+0x188>
  401331:	4d 8b 6c 24 08       	mov    0x8(%r12),%r13
  401336:	48 8d 35 a7 72 00 00 	lea    0x72a7(%rip),%rsi        # 4085e4 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1a4>
  40133d:	4c 89 ef             	mov    %r13,%rdi
  401340:	e8 fb fc ff ff       	call   401040 <strstr@plt>
  401345:	48 85 c0             	test   %rax,%rax
  401348:	0f 84 c4 07 00 00    	je     401b12 <main+0x942>
  40134e:	c7 05 98 b6 01 01 01 	movl   $0x1,0x101b698(%rip)        # 141c9f0 <diagnostics>
  401355:	00 00 00 
  401358:	81 3d be ea 00 00 d0 	cmpl   $0x7d0,0xeabe(%rip)        # 40fe20 <NumThreads>
  40135f:	07 00 00 
  401362:	0f 8f 58 07 00 00    	jg     401ac0 <main+0x8f0>
  401368:	8b 35 b2 ea 00 00    	mov    0xeab2(%rip),%esi        # 40fe20 <NumThreads>
  40136e:	85 f6                	test   %esi,%esi
  401370:	0f 8e 7b 02 00 00    	jle    4015f1 <main+0x421>
  401376:	48 8d 54 24 20       	lea    0x20(%rsp),%rdx
  40137b:	31 c0                	xor    %eax,%eax
  40137d:	b9 10 00 00 00       	mov    $0x10,%ecx
  401382:	be 80 00 00 00       	mov    $0x80,%esi
  401387:	48 89 d7             	mov    %rdx,%rdi
  40138a:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  40138d:	31 ff                	xor    %edi,%edi
  40138f:	e8 ac fd ff ff       	call   401140 <sched_getaffinity@plt>
  401394:	85 c0                	test   %eax,%eax
  401396:	0f 85 0c 07 00 00    	jne    401aa8 <main+0x8d8>
  40139c:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
  4013a1:	31 db                	xor    %ebx,%ebx
  4013a3:	31 c9                	xor    %ecx,%ecx
  4013a5:	0f 1f 00             	nopl   (%rax)
  4013a8:	48 89 d0             	mov    %rdx,%rax
  4013ab:	48 d3 e8             	shr    %cl,%rax
  4013ae:	83 c1 01             	add    $0x1,%ecx
  4013b1:	83 e0 01             	and    $0x1,%eax
  4013b4:	01 c3                	add    %eax,%ebx
  4013b6:	83 f9 40             	cmp    $0x40,%ecx
  4013b9:	75 ed                	jne    4013a8 <main+0x1d8>
  4013bb:	31 c0                	xor    %eax,%eax
  4013bd:	0f 1f 00             	nopl   (%rax)
  4013c0:	89 c5                	mov    %eax,%ebp
  4013c2:	41 89 c4             	mov    %eax,%r12d
  4013c5:	48 3d ff 03 00 00    	cmp    $0x3ff,%rax
  4013cb:	0f 87 d7 01 00 00    	ja     4015a8 <main+0x3d8>
  4013d1:	48 89 c2             	mov    %rax,%rdx
  4013d4:	48 c1 ea 06          	shr    $0x6,%rdx
  4013d8:	48 8b 54 d4 20       	mov    0x20(%rsp,%rdx,8),%rdx
  4013dd:	48 0f a3 c2          	bt     %rax,%rdx
  4013e1:	0f 83 c1 01 00 00    	jae    4015a8 <main+0x3d8>
  4013e7:	4c 8d 2d f2 ee 80 00 	lea    0x80eef2(%rip),%r13        # c102e0 <MSRCounters>
  4013ee:	4c 89 ef             	mov    %r13,%rdi
  4013f1:	e8 4a 18 00 00       	call   402c40 <_ZN9CCounters18GetProcessorVendorEv>
  4013f6:	4c 89 ef             	mov    %r13,%rdi
  4013f9:	e8 b2 18 00 00       	call   402cb0 <_ZN9CCounters18GetProcessorFamilyEv>
  4013fe:	8b 15 1c ea 00 00    	mov    0xea1c(%rip),%edx        # 40fe20 <NumThreads>
  401404:	8d 42 ff             	lea    -0x1(%rdx),%eax
  401407:	85 d2                	test   %edx,%edx
  401409:	0f 8e b1 00 00 00    	jle    4014c0 <main+0x2f0>
  40140f:	41 89 d8             	mov    %ebx,%r8d
  401412:	8b 3d 1c ef 80 00    	mov    0x80ef1c(%rip),%edi        # c10334 <MSRCounters+0x54>
  401418:	31 c9                	xor    %ecx,%ecx
  40141a:	48 8d 35 bf 8d 01 01 	lea    0x1018dbf(%rip),%rsi        # 141a1e0 <ProcNum>
  401421:	41 d1 f8             	sar    %r8d
  401424:	89 ca                	mov    %ecx,%edx
  401426:	83 fb 03             	cmp    $0x3,%ebx
  401429:	0f 8f 89 01 00 00    	jg     4015b8 <main+0x3e8>
  40142f:	8d 14 28             	lea    (%rax,%rbp,1),%edx
  401432:	4c 63 ca             	movslq %edx,%r9
  401435:	89 14 8e             	mov    %edx,(%rsi,%rcx,4)
  401438:	49 81 f9 ff 03 00 00 	cmp    $0x3ff,%r9
  40143f:	77 0f                	ja     401450 <main+0x280>
  401441:	49 c1 e9 06          	shr    $0x6,%r9
  401445:	4e 8b 4c cc 20       	mov    0x20(%rsp,%r9,8),%r9
  40144a:	49 0f a3 d1          	bt     %rdx,%r9
  40144e:	72 60                	jb     4014b0 <main+0x2e0>
  401450:	48 8d 35 f9 6d 00 00 	lea    0x6df9(%rip),%rsi        # 408250 <_IO_stdin_used+0x250>
  401457:	bf 01 00 00 00       	mov    $0x1,%edi
  40145c:	31 c0                	xor    %eax,%eax
  40145e:	31 db                	xor    %ebx,%ebx
  401460:	e8 cb fb ff ff       	call   401030 <__printf_chk@plt>
  401465:	48 8d 2d 96 71 00 00 	lea    0x7196(%rip),%rbp        # 408602 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1c2>
  40146c:	eb 13                	jmp    401481 <main+0x2b1>
  40146e:	66 90                	xchg   %ax,%ax
  401470:	48 81 fb cf 07 00 00 	cmp    $0x7cf,%rbx
  401477:	0f 84 83 01 00 00    	je     401600 <main+0x430>
  40147d:	48 83 c3 01          	add    $0x1,%rbx
  401481:	89 da                	mov    %ebx,%edx
  401483:	48 81 fb ff 03 00 00 	cmp    $0x3ff,%rbx
  40148a:	77 e4                	ja     401470 <main+0x2a0>
  40148c:	48 89 d8             	mov    %rbx,%rax
  40148f:	48 c1 e8 06          	shr    $0x6,%rax
  401493:	48 8b 44 c4 20       	mov    0x20(%rsp,%rax,8),%rax
  401498:	48 0f a3 d8          	bt     %rbx,%rax
  40149c:	73 df                	jae    40147d <main+0x2ad>
  40149e:	48 89 ee             	mov    %rbp,%rsi
  4014a1:	bf 01 00 00 00       	mov    $0x1,%edi
  4014a6:	31 c0                	xor    %eax,%eax
  4014a8:	e8 83 fb ff ff       	call   401030 <__printf_chk@plt>
  4014ad:	eb ce                	jmp    40147d <main+0x2ad>
  4014af:	90                   	nop
  4014b0:	83 e8 01             	sub    $0x1,%eax
  4014b3:	48 83 c1 01          	add    $0x1,%rcx
  4014b7:	83 f8 ff             	cmp    $0xffffffff,%eax
  4014ba:	0f 85 64 ff ff ff    	jne    401424 <main+0x254>
  4014c0:	4c 89 ef             	mov    %r13,%rdi
  4014c3:	e8 a8 10 00 00       	call   402570 <_ZN9CCounters13LockProcessorEv>
  4014c8:	4c 89 ef             	mov    %r13,%rdi
  4014cb:	e8 d0 29 00 00       	call   403ea0 <_ZN9CCounters13QueueCountersEv>
  4014d0:	8b 05 1a b5 01 01    	mov    0x101b51a(%rip),%eax        # 141c9f0 <diagnostics>
  4014d6:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4014da:	85 c0                	test   %eax,%eax
  4014dc:	0f 85 99 07 00 00    	jne    401c7b <main+0xaab>
  4014e2:	83 3d 2f e9 00 00 00 	cmpl   $0x0,0xe92f(%rip)        # 40fe18 <UsePMC>
  4014e9:	0f 85 46 07 00 00    	jne    401c35 <main+0xa65>
  4014ef:	31 ff                	xor    %edi,%edi
  4014f1:	ba ec ff ff ff       	mov    $0xffffffec,%edx
  4014f6:	31 f6                	xor    %esi,%esi
  4014f8:	e8 53 fb ff ff       	call   401050 <setpriority@plt>
  4014fd:	8b 15 1d e9 00 00    	mov    0xe91d(%rip),%edx        # 40fe20 <NumThreads>
  401503:	31 c0                	xor    %eax,%eax
  401505:	48 8d bc 24 28 3f 00 	lea    0x3f28(%rsp),%rdi
  40150c:	00 
  40150d:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  401512:	48 89 3c 24          	mov    %rdi,(%rsp)
  401516:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401519:	b8 d0 07 00 00       	mov    $0x7d0,%eax
  40151e:	39 c2                	cmp    %eax,%edx
  401520:	0f 4e c2             	cmovle %edx,%eax
  401523:	83 ea 01             	sub    $0x1,%edx
  401526:	89 84 24 a0 00 00 00 	mov    %eax,0xa0(%rsp)
  40152d:	0f 8e 0c 01 00 00    	jle    40163f <main+0x46f>
  401533:	48 8d ac 24 2c 3f 00 	lea    0x3f2c(%rsp),%rbp
  40153a:	00 
  40153b:	4c 8d a4 24 b0 00 00 	lea    0xb0(%rsp),%r12
  401542:	00 
  401543:	bb 01 00 00 00       	mov    $0x1,%ebx
  401548:	4c 8d 35 c1 0c 00 00 	lea    0xcc1(%rip),%r14        # 402210 <_Z11ThreadProc1Pv>
  40154f:	4c 8d 3d b1 70 00 00 	lea    0x70b1(%rip),%r15        # 408607 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1c7>
  401556:	eb 20                	jmp    401578 <main+0x3a8>
  401558:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40155f:	00 
  401560:	83 c3 01             	add    $0x1,%ebx
  401563:	48 83 c5 04          	add    $0x4,%rbp
  401567:	49 83 c4 08          	add    $0x8,%r12
  40156b:	3b 9c 24 a0 00 00 00 	cmp    0xa0(%rsp),%ebx
  401572:	0f 8d c7 00 00 00    	jge    40163f <main+0x46f>
  401578:	89 5d 00             	mov    %ebx,0x0(%rbp)
  40157b:	31 f6                	xor    %esi,%esi
  40157d:	48 89 e9             	mov    %rbp,%rcx
  401580:	4c 89 f2             	mov    %r14,%rdx
  401583:	4c 89 e7             	mov    %r12,%rdi
  401586:	e8 f5 fb ff ff       	call   401180 <pthread_create@plt>
  40158b:	85 c0                	test   %eax,%eax
  40158d:	74 d1                	je     401560 <main+0x390>
  40158f:	89 da                	mov    %ebx,%edx
  401591:	4c 89 fe             	mov    %r15,%rsi
  401594:	bf 01 00 00 00       	mov    $0x1,%edi
  401599:	31 c0                	xor    %eax,%eax
  40159b:	e8 90 fa ff ff       	call   401030 <__printf_chk@plt>
  4015a0:	eb be                	jmp    401560 <main+0x390>
  4015a2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4015a8:	48 83 c0 01          	add    $0x1,%rax
  4015ac:	e9 0f fe ff ff       	jmp    4013c0 <main+0x1f0>
  4015b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4015b8:	81 ff 00 08 00 00    	cmp    $0x800,%edi
  4015be:	0f 84 6e fe ff ff    	je     401432 <main+0x262>
  4015c4:	41 89 c1             	mov    %eax,%r9d
  4015c7:	41 c1 e9 1f          	shr    $0x1f,%r9d
  4015cb:	42 8d 14 08          	lea    (%rax,%r9,1),%edx
  4015cf:	83 e2 01             	and    $0x1,%edx
  4015d2:	44 29 ca             	sub    %r9d,%edx
  4015d5:	41 89 c1             	mov    %eax,%r9d
  4015d8:	41 0f af d0          	imul   %r8d,%edx
  4015dc:	41 c1 e9 1f          	shr    $0x1f,%r9d
  4015e0:	41 01 c1             	add    %eax,%r9d
  4015e3:	41 d1 f9             	sar    %r9d
  4015e6:	44 01 ca             	add    %r9d,%edx
  4015e9:	44 01 e2             	add    %r12d,%edx
  4015ec:	e9 41 fe ff ff       	jmp    401432 <main+0x262>
  4015f1:	c7 05 25 e8 00 00 01 	movl   $0x1,0xe825(%rip)        # 40fe20 <NumThreads>
  4015f8:	00 00 00 
  4015fb:	e9 76 fd ff ff       	jmp    401376 <main+0x1a6>
  401600:	bf 0a 00 00 00       	mov    $0xa,%edi
  401605:	e8 f6 fa ff ff       	call   401100 <putchar@plt>
  40160a:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%rsp)
  401611:	00 
  401612:	48 8b 84 24 68 5e 00 	mov    0x5e68(%rsp),%rax
  401619:	00 
  40161a:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  401621:	00 00 
  401623:	0f 85 a5 06 00 00    	jne    401cce <main+0xafe>
  401629:	8b 44 24 14          	mov    0x14(%rsp),%eax
  40162d:	48 81 c4 78 5e 00 00 	add    $0x5e78,%rsp
  401634:	5b                   	pop    %rbx
  401635:	5d                   	pop    %rbp
  401636:	41 5c                	pop    %r12
  401638:	41 5d                	pop    %r13
  40163a:	41 5e                	pop    %r14
  40163c:	41 5f                	pop    %r15
  40163e:	c3                   	ret    
  40163f:	c7 84 24 28 3f 00 00 	movl   $0x0,0x3f28(%rsp)
  401646:	00 00 00 00 
  40164a:	48 8b 3c 24          	mov    (%rsp),%rdi
  40164e:	e8 bd 0b 00 00       	call   402210 <_Z11ThreadProc1Pv>
  401653:	83 bc 24 a0 00 00 00 	cmpl   $0x0,0xa0(%rsp)
  40165a:	00 
  40165b:	74 0d                	je     40166a <main+0x49a>
  40165d:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  401664:	00 
  401665:	e8 f6 07 00 00       	call   401e60 <_ZN13ThreadHandler4StopEv.part.0>
  40166a:	31 d2                	xor    %edx,%edx
  40166c:	31 f6                	xor    %esi,%esi
  40166e:	31 ff                	xor    %edi,%edi
  401670:	e8 db f9 ff ff       	call   401050 <setpriority@plt>
  401675:	4c 89 ef             	mov    %r13,%rdi
  401678:	e8 f3 10 00 00       	call   402770 <_ZN9CCounters7CleanUpEv>
  40167d:	8b 3d b5 e7 00 00    	mov    0xe7b5(%rip),%edi        # 40fe38 <CustomPMCResultsOS>
  401683:	48 63 05 9e e7 00 00 	movslq 0xe79e(%rip),%rax        # 40fe28 <ClockResultsOS>
  40168a:	4c 63 25 a3 e7 00 00 	movslq 0xe7a3(%rip),%r12        # 40fe34 <PMCResultsOS>
  401691:	89 7c 24 18          	mov    %edi,0x18(%rsp)
  401695:	8b 3d 91 e7 00 00    	mov    0xe791(%rip),%edi        # 40fe2c <CustomClockResultsOS>
  40169b:	48 c1 e8 02          	shr    $0x2,%rax
  40169f:	49 c1 ec 02          	shr    $0x2,%r12
  4016a3:	83 3d ae 4c 01 01 00 	cmpl   $0x0,0x1014cae(%rip)        # 1416358 <repetitions>
  4016aa:	89 7c 24 1c          	mov    %edi,0x1c(%rsp)
  4016ae:	0f 8e 09 02 00 00    	jle    4018bd <main+0x6ed>
  4016b4:	48 98                	cltq   
  4016b6:	45 31 ed             	xor    %r13d,%r13d
  4016b9:	4c 8d 35 64 6f 00 00 	lea    0x6f64(%rip),%r14        # 408624 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1e4>
  4016c0:	4c 8d 3c 85 00 00 00 	lea    0x0(,%rax,4),%r15
  4016c7:	00 
  4016c8:	48 8d 05 54 6f 00 00 	lea    0x6f54(%rip),%rax        # 408623 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1e3>
  4016cf:	48 89 04 24          	mov    %rax,(%rsp)
  4016d3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4016d8:	48 8b 05 21 e7 00 00 	mov    0xe721(%rip),%rax        # 40fe00 <PThreadData>
  4016df:	48 8b 34 24          	mov    (%rsp),%rsi
  4016e3:	bf 01 00 00 00       	mov    $0x1,%edi
  4016e8:	44 89 ed             	mov    %r13d,%ebp
  4016eb:	42 8b 1c 38          	mov    (%rax,%r15,1),%ebx
  4016ef:	31 c0                	xor    %eax,%eax
  4016f1:	89 da                	mov    %ebx,%edx
  4016f3:	e8 38 f9 ff ff       	call   401030 <__printf_chk@plt>
  4016f8:	8b 0d 1a e7 00 00    	mov    0xe71a(%rip),%ecx        # 40fe18 <UsePMC>
  4016fe:	85 c9                	test   %ecx,%ecx
  401700:	74 52                	je     401754 <main+0x584>
  401702:	81 3d 2c ec 80 00 00 	cmpl   $0x2000,0x80ec2c(%rip)        # c10338 <MSRCounters+0x58>
  401709:	20 00 00 
  40170c:	0f 84 d0 03 00 00    	je     401ae2 <main+0x912>
  401712:	8b 15 f0 e6 00 00    	mov    0xe6f0(%rip),%edx        # 40fe08 <NumCounters>
  401718:	85 d2                	test   %edx,%edx
  40171a:	7e 38                	jle    401754 <main+0x584>
  40171c:	31 db                	xor    %ebx,%ebx
  40171e:	66 90                	xchg   %ax,%ax
  401720:	8b 05 32 4c 01 01    	mov    0x1014c32(%rip),%eax        # 1416358 <repetitions>
  401726:	48 8b 15 d3 e6 00 00 	mov    0xe6d3(%rip),%rdx        # 40fe00 <PThreadData>
  40172d:	4c 89 f6             	mov    %r14,%rsi
  401730:	bf 01 00 00 00       	mov    $0x1,%edi
  401735:	0f af c3             	imul   %ebx,%eax
  401738:	01 e8                	add    %ebp,%eax
  40173a:	44 01 e0             	add    %r12d,%eax
  40173d:	48 98                	cltq   
  40173f:	8b 14 82             	mov    (%rdx,%rax,4),%edx
  401742:	31 c0                	xor    %eax,%eax
  401744:	e8 e7 f8 ff ff       	call   401030 <__printf_chk@plt>
  401749:	83 c3 01             	add    $0x1,%ebx
  40174c:	39 1d b6 e6 00 00    	cmp    %ebx,0xe6b6(%rip)        # 40fe08 <NumCounters>
  401752:	7f cc                	jg     401720 <main+0x550>
  401754:	8b 35 3a e7 00 00    	mov    0xe73a(%rip),%esi        # 40fe94 <RatioOut>
  40175a:	85 f6                	test   %esi,%esi
  40175c:	0f 84 8c 00 00 00    	je     4017ee <main+0x61e>
  401762:	8b 15 30 e7 00 00    	mov    0xe730(%rip),%edx        # 40fe98 <RatioOut+0x4>
  401768:	8b 05 32 e7 00 00    	mov    0xe732(%rip),%eax        # 40fea0 <RatioOut+0xc>
  40176e:	8b 0d 28 e7 00 00    	mov    0xe728(%rip),%ecx        # 40fe9c <RatioOut+0x8>
  401774:	85 d2                	test   %edx,%edx
  401776:	0f 85 70 02 00 00    	jne    4019ec <main+0x81c>
  40177c:	48 8b 15 7d e6 00 00 	mov    0xe67d(%rip),%rdx        # 40fe00 <PThreadData>
  401783:	81 3d ab eb 80 00 00 	cmpl   $0x2000,0x80ebab(%rip)        # c10338 <MSRCounters+0x58>
  40178a:	20 00 00 
  40178d:	42 8b 3c 3a          	mov    (%rdx,%r15,1),%edi
  401791:	0f 84 99 00 00 00    	je     401830 <main+0x660>
  401797:	41 89 f8             	mov    %edi,%r8d
  40179a:	85 c9                	test   %ecx,%ecx
  40179c:	0f 85 c2 00 00 00    	jne    401864 <main+0x694>
  4017a2:	85 ff                	test   %edi,%edi
  4017a4:	0f 84 df 02 00 00    	je     401a89 <main+0x8b9>
  4017aa:	83 fe 01             	cmp    $0x1,%esi
  4017ad:	0f 84 af 02 00 00    	je     401a62 <main+0x892>
  4017b3:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4017b7:	66 0f 6e d8          	movd   %eax,%xmm3
  4017bb:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4017bf:	b8 01 00 00 00       	mov    $0x1,%eax
  4017c4:	f2 41 0f 2a c0       	cvtsi2sd %r8d,%xmm0
  4017c9:	f3 0f 5a cb          	cvtss2sd %xmm3,%xmm1
  4017cd:	48 8d 35 5f 6e 00 00 	lea    0x6e5f(%rip),%rsi        # 408633 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1f3>
  4017d4:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  4017d8:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4017dc:	f2 0f 2a cf          	cvtsi2sd %edi,%xmm1
  4017e0:	bf 01 00 00 00       	mov    $0x1,%edi
  4017e5:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
  4017e9:	e8 42 f8 ff ff       	call   401030 <__printf_chk@plt>
  4017ee:	8b 15 b0 e6 00 00    	mov    0xe6b0(%rip),%edx        # 40fea4 <TempOut>
  4017f4:	85 d2                	test   %edx,%edx
  4017f6:	0f 84 ac 00 00 00    	je     4018a8 <main+0x6d8>
  4017fc:	48 8b 0d fd e5 00 00 	mov    0xe5fd(%rip),%rcx        # 40fe00 <PThreadData>
  401803:	4a 8d 04 ad 00 00 00 	lea    0x0(,%r13,4),%rax
  40180a:	00 
  40180b:	48 01 c1             	add    %rax,%rcx
  40180e:	48 01 c8             	add    %rcx,%rax
  401811:	f6 c2 01             	test   $0x1,%dl
  401814:	48 0f 45 c8          	cmovne %rax,%rcx
  401818:	83 fa 08             	cmp    $0x8,%edx
  40181b:	77 74                	ja     401891 <main+0x6c1>
  40181d:	48 8d 35 e4 6b 00 00 	lea    0x6be4(%rip),%rsi        # 408408 <_IO_stdin_used+0x408>
  401824:	89 d0                	mov    %edx,%eax
  401826:	48 63 04 86          	movslq (%rsi,%rax,4),%rax
  40182a:	48 01 f0             	add    %rsi,%rax
  40182d:	3e ff e0             	notrack jmp *%rax
  401830:	66 0f ef c0          	pxor   %xmm0,%xmm0
  401834:	f2 0f 10 0d 24 4b 01 	movsd  0x1014b24(%rip),%xmm1        # 1416360 <clockFactor>
  40183b:	01 
  40183c:	f2 0f 10 15 6c 6e 00 	movsd  0x6e6c(%rip),%xmm2        # 4086b0 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x270>
  401843:	00 
  401844:	48 8d 15 15 4b 01 01 	lea    0x1014b15(%rip),%rdx        # 1416360 <clockFactor>
  40184b:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
  40184f:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
  401853:	f2 0f 58 ca          	addsd  %xmm2,%xmm1
  401857:	f2 44 0f 2c c1       	cvttsd2si %xmm1,%r8d
  40185c:	85 c9                	test   %ecx,%ecx
  40185e:	0f 84 ed 01 00 00    	je     401a51 <main+0x881>
  401864:	3b 0d 9e e5 00 00    	cmp    0xe59e(%rip),%ecx        # 40fe08 <NumCounters>
  40186a:	0f 87 0f 02 00 00    	ja     401a7f <main+0x8af>
  401870:	8d 51 ff             	lea    -0x1(%rcx),%edx
  401873:	48 8b 0d 86 e5 00 00 	mov    0xe586(%rip),%rcx        # 40fe00 <PThreadData>
  40187a:	0f af 15 d7 4a 01 01 	imul   0x1014ad7(%rip),%edx        # 1416358 <repetitions>
  401881:	01 ea                	add    %ebp,%edx
  401883:	44 01 e2             	add    %r12d,%edx
  401886:	48 63 d2             	movslq %edx,%rdx
  401889:	8b 3c 91             	mov    (%rcx,%rdx,4),%edi
  40188c:	e9 11 ff ff ff       	jmp    4017a2 <main+0x5d2>
  401891:	48 8d 35 c8 6d 00 00 	lea    0x6dc8(%rip),%rsi        # 408660 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x220>
  401898:	bf 01 00 00 00       	mov    $0x1,%edi
  40189d:	31 c0                	xor    %eax,%eax
  40189f:	e8 8c f7 ff ff       	call   401030 <__printf_chk@plt>
  4018a4:	0f 1f 40 00          	nopl   0x0(%rax)
  4018a8:	49 83 c5 01          	add    $0x1,%r13
  4018ac:	49 83 c7 04          	add    $0x4,%r15
  4018b0:	44 39 2d a1 4a 01 01 	cmp    %r13d,0x1014aa1(%rip)        # 1416358 <repetitions>
  4018b7:	0f 8f 1b fe ff ff    	jg     4016d8 <main+0x508>
  4018bd:	81 3d 71 ea 80 00 00 	cmpl   $0x2000,0x80ea71(%rip)        # c10338 <MSRCounters+0x58>
  4018c4:	20 00 00 
  4018c7:	0f 84 bb 03 00 00    	je     401c88 <main+0xab8>
  4018cd:	83 3d 48 e5 00 00 00 	cmpl   $0x0,0xe548(%rip)        # 40fe1c <PrintCustomPMC>
  4018d4:	0f 84 cc 00 00 00    	je     4019a6 <main+0x7d6>
  4018da:	48 8d 35 a5 6d 00 00 	lea    0x6da5(%rip),%rsi        # 408686 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x246>
  4018e1:	bf 01 00 00 00       	mov    $0x1,%edi
  4018e6:	31 c0                	xor    %eax,%eax
  4018e8:	e8 43 f7 ff ff       	call   401030 <__printf_chk@plt>
  4018ed:	83 3d 64 4a 01 01 00 	cmpl   $0x0,0x1014a64(%rip)        # 1416358 <repetitions>
  4018f4:	0f 8e ac 00 00 00    	jle    4019a6 <main+0x7d6>
  4018fa:	4c 63 6c 24 18       	movslq 0x18(%rsp),%r13
  4018ff:	4c 63 64 24 1c       	movslq 0x1c(%rsp),%r12
  401904:	48 8d 05 18 6d 00 00 	lea    0x6d18(%rip),%rax        # 408623 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1e3>
  40190b:	31 ed                	xor    %ebp,%ebp
  40190d:	48 89 04 24          	mov    %rax,(%rsp)
  401911:	4c 8d 35 0c 6d 00 00 	lea    0x6d0c(%rip),%r14        # 408624 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1e4>
  401918:	49 c1 ed 02          	shr    $0x2,%r13
  40191c:	49 83 e4 fc          	and    $0xfffffffffffffffc,%r12
  401920:	eb 15                	jmp    401937 <main+0x767>
  401922:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401928:	83 c5 01             	add    $0x1,%ebp
  40192b:	49 83 c4 04          	add    $0x4,%r12
  40192f:	39 2d 23 4a 01 01    	cmp    %ebp,0x1014a23(%rip)        # 1416358 <repetitions>
  401935:	7e 6f                	jle    4019a6 <main+0x7d6>
  401937:	48 8b 05 c2 e4 00 00 	mov    0xe4c2(%rip),%rax        # 40fe00 <PThreadData>
  40193e:	48 8b 34 24          	mov    (%rsp),%rsi
  401942:	bf 01 00 00 00       	mov    $0x1,%edi
  401947:	42 8b 14 20          	mov    (%rax,%r12,1),%edx
  40194b:	31 c0                	xor    %eax,%eax
  40194d:	e8 de f6 ff ff       	call   401030 <__printf_chk@plt>
  401952:	8b 05 c0 e4 00 00    	mov    0xe4c0(%rip),%eax        # 40fe18 <UsePMC>
  401958:	85 c0                	test   %eax,%eax
  40195a:	74 cc                	je     401928 <main+0x758>
  40195c:	83 3d a5 e4 00 00 00 	cmpl   $0x0,0xe4a5(%rip)        # 40fe08 <NumCounters>
  401963:	7e c3                	jle    401928 <main+0x758>
  401965:	31 db                	xor    %ebx,%ebx
  401967:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40196e:	00 00 
  401970:	8b 05 e2 49 01 01    	mov    0x10149e2(%rip),%eax        # 1416358 <repetitions>
  401976:	48 8b 15 83 e4 00 00 	mov    0xe483(%rip),%rdx        # 40fe00 <PThreadData>
  40197d:	4c 89 f6             	mov    %r14,%rsi
  401980:	bf 01 00 00 00       	mov    $0x1,%edi
  401985:	0f af c3             	imul   %ebx,%eax
  401988:	01 e8                	add    %ebp,%eax
  40198a:	44 01 e8             	add    %r13d,%eax
  40198d:	48 98                	cltq   
  40198f:	8b 14 82             	mov    (%rdx,%rax,4),%edx
  401992:	31 c0                	xor    %eax,%eax
  401994:	e8 97 f6 ff ff       	call   401030 <__printf_chk@plt>
  401999:	83 c3 01             	add    $0x1,%ebx
  40199c:	39 1d 66 e4 00 00    	cmp    %ebx,0xe466(%rip)        # 40fe08 <NumCounters>
  4019a2:	7f cc                	jg     401970 <main+0x7a0>
  4019a4:	eb 82                	jmp    401928 <main+0x758>
  4019a6:	bf 0a 00 00 00       	mov    $0xa,%edi
  4019ab:	e8 50 f7 ff ff       	call   401100 <putchar@plt>
  4019b0:	bf 0a 00 00 00       	mov    $0xa,%edi
  4019b5:	e8 46 f7 ff ff       	call   401100 <putchar@plt>
  4019ba:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
  4019be:	e8 cd f7 ff ff       	call   401190 <close@plt>
  4019c3:	8b 7c 24 10          	mov    0x10(%rsp),%edi
  4019c7:	e8 c4 f7 ff ff       	call   401190 <close@plt>
  4019cc:	83 bc 24 a0 00 00 00 	cmpl   $0x0,0xa0(%rsp)
  4019d3:	00 
  4019d4:	0f 84 38 fc ff ff    	je     401612 <main+0x442>
  4019da:	48 8d bc 24 a0 00 00 	lea    0xa0(%rsp),%rdi
  4019e1:	00 
  4019e2:	e8 79 04 00 00       	call   401e60 <_ZN13ThreadHandler4StopEv.part.0>
  4019e7:	e9 26 fc ff ff       	jmp    401612 <main+0x442>
  4019ec:	3b 15 16 e4 00 00    	cmp    0xe416(%rip),%edx        # 40fe08 <NumCounters>
  4019f2:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  4019f8:	77 1d                	ja     401a17 <main+0x847>
  4019fa:	83 ea 01             	sub    $0x1,%edx
  4019fd:	0f af 15 54 49 01 01 	imul   0x1014954(%rip),%edx        # 1416358 <repetitions>
  401a04:	48 8b 3d f5 e3 00 00 	mov    0xe3f5(%rip),%rdi        # 40fe00 <PThreadData>
  401a0b:	01 ea                	add    %ebp,%edx
  401a0d:	44 01 e2             	add    %r12d,%edx
  401a10:	48 63 d2             	movslq %edx,%rdx
  401a13:	44 8b 04 97          	mov    (%rdi,%rdx,4),%r8d
  401a17:	85 c9                	test   %ecx,%ecx
  401a19:	0f 85 45 fe ff ff    	jne    401864 <main+0x694>
  401a1f:	48 8b 15 da e3 00 00 	mov    0xe3da(%rip),%rdx        # 40fe00 <PThreadData>
  401a26:	81 3d 08 e9 80 00 00 	cmpl   $0x2000,0x80e908(%rip)        # c10338 <MSRCounters+0x58>
  401a2d:	20 00 00 
  401a30:	42 8b 3c 3a          	mov    (%rdx,%r15,1),%edi
  401a34:	0f 85 68 fd ff ff    	jne    4017a2 <main+0x5d2>
  401a3a:	66 0f ef c0          	pxor   %xmm0,%xmm0
  401a3e:	f2 0f 10 15 6a 6c 00 	movsd  0x6c6a(%rip),%xmm2        # 4086b0 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x270>
  401a45:	00 
  401a46:	48 8d 15 13 49 01 01 	lea    0x1014913(%rip),%rdx        # 1416360 <clockFactor>
  401a4d:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
  401a51:	f2 0f 59 02          	mulsd  (%rdx),%xmm0
  401a55:	f2 0f 58 c2          	addsd  %xmm2,%xmm0
  401a59:	f2 0f 2c f8          	cvttsd2si %xmm0,%edi
  401a5d:	e9 40 fd ff ff       	jmp    4017a2 <main+0x5d2>
  401a62:	41 0f af c0          	imul   %r8d,%eax
  401a66:	4c 89 f6             	mov    %r14,%rsi
  401a69:	99                   	cltd   
  401a6a:	f7 ff                	idiv   %edi
  401a6c:	bf 01 00 00 00       	mov    $0x1,%edi
  401a71:	89 c2                	mov    %eax,%edx
  401a73:	31 c0                	xor    %eax,%eax
  401a75:	e8 b6 f5 ff ff       	call   401030 <__printf_chk@plt>
  401a7a:	e9 6f fd ff ff       	jmp    4017ee <main+0x61e>
  401a7f:	bf 01 00 00 00       	mov    $0x1,%edi
  401a84:	e9 21 fd ff ff       	jmp    4017aa <main+0x5da>
  401a89:	48 8d 15 9a 6b 00 00 	lea    0x6b9a(%rip),%rdx        # 40862a <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1ea>
  401a90:	48 8d 35 97 6b 00 00 	lea    0x6b97(%rip),%rsi        # 40862e <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1ee>
  401a97:	bf 01 00 00 00       	mov    $0x1,%edi
  401a9c:	31 c0                	xor    %eax,%eax
  401a9e:	e8 8d f5 ff ff       	call   401030 <__printf_chk@plt>
  401aa3:	e9 46 fd ff ff       	jmp    4017ee <main+0x61e>
  401aa8:	48 8d 35 b8 6a 00 00 	lea    0x6ab8(%rip),%rsi        # 408567 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x127>
  401aaf:	bf 01 00 00 00       	mov    $0x1,%edi
  401ab4:	31 c0                	xor    %eax,%eax
  401ab6:	e8 75 f5 ff ff       	call   401030 <__printf_chk@plt>
  401abb:	e9 dc f8 ff ff       	jmp    40139c <main+0x1cc>
  401ac0:	48 8d 35 29 6b 00 00 	lea    0x6b29(%rip),%rsi        # 4085f0 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1b0>
  401ac7:	bf 01 00 00 00       	mov    $0x1,%edi
  401acc:	31 c0                	xor    %eax,%eax
  401ace:	c7 05 48 e3 00 00 d0 	movl   $0x7d0,0xe348(%rip)        # 40fe20 <NumThreads>
  401ad5:	07 00 00 
  401ad8:	e8 53 f5 ff ff       	call   401030 <__printf_chk@plt>
  401add:	e9 86 f8 ff ff       	jmp    401368 <main+0x198>
  401ae2:	66 0f ef c0          	pxor   %xmm0,%xmm0
  401ae6:	4c 89 f6             	mov    %r14,%rsi
  401ae9:	bf 01 00 00 00       	mov    $0x1,%edi
  401aee:	31 c0                	xor    %eax,%eax
  401af0:	f2 0f 2a c3          	cvtsi2sd %ebx,%xmm0
  401af4:	f2 0f 59 05 64 48 01 	mulsd  0x1014864(%rip),%xmm0        # 1416360 <clockFactor>
  401afb:	01 
  401afc:	f2 0f 58 05 ac 6b 00 	addsd  0x6bac(%rip),%xmm0        # 4086b0 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x270>
  401b03:	00 
  401b04:	f2 0f 2c d0          	cvttsd2si %xmm0,%edx
  401b08:	e8 23 f5 ff ff       	call   401030 <__printf_chk@plt>
  401b0d:	e9 00 fc ff ff       	jmp    401712 <main+0x542>
  401b12:	48 8d 35 0d 6a 00 00 	lea    0x6a0d(%rip),%rsi        # 408526 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0xe6>
  401b19:	4c 89 ef             	mov    %r13,%rdi
  401b1c:	e8 1f f5 ff ff       	call   401040 <strstr@plt>
  401b21:	48 85 c0             	test   %rax,%rax
  401b24:	0f 84 81 01 00 00    	je     401cab <main+0xadb>
  401b2a:	48 8b 84 24 68 5e 00 	mov    0x5e68(%rsp),%rax
  401b31:	00 
  401b32:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  401b39:	00 00 
  401b3b:	0f 85 8d 01 00 00    	jne    401cce <main+0xafe>
  401b41:	48 81 c4 78 5e 00 00 	add    $0x5e78,%rsp
  401b48:	4c 89 e6             	mov    %r12,%rsi
  401b4b:	89 ef                	mov    %ebp,%edi
  401b4d:	5b                   	pop    %rbx
  401b4e:	5d                   	pop    %rbp
  401b4f:	41 5c                	pop    %r12
  401b51:	41 5d                	pop    %r13
  401b53:	41 5e                	pop    %r14
  401b55:	41 5f                	pop    %r15
  401b57:	e9 64 25 00 00       	jmp    4040c0 <_Z11setcountersiPPc>
  401b5c:	8b 11                	mov    (%rcx),%edx
  401b5e:	48 8d 35 e2 6a 00 00 	lea    0x6ae2(%rip),%rsi        # 408647 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x207>
  401b65:	bf 01 00 00 00       	mov    $0x1,%edi
  401b6a:	31 c0                	xor    %eax,%eax
  401b6c:	e8 bf f4 ff ff       	call   401030 <__printf_chk@plt>
  401b71:	e9 32 fd ff ff       	jmp    4018a8 <main+0x6d8>
  401b76:	48 8b 11             	mov    (%rcx),%rdx
  401b79:	48 8d 35 c0 6a 00 00 	lea    0x6ac0(%rip),%rsi        # 408640 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x200>
  401b80:	bf 01 00 00 00       	mov    $0x1,%edi
  401b85:	31 c0                	xor    %eax,%eax
  401b87:	e8 a4 f4 ff ff       	call   401030 <__printf_chk@plt>
  401b8c:	e9 17 fd ff ff       	jmp    4018a8 <main+0x6d8>
  401b91:	8b 11                	mov    (%rcx),%edx
  401b93:	48 8d 35 a1 6a 00 00 	lea    0x6aa1(%rip),%rsi        # 40863b <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1fb>
  401b9a:	bf 01 00 00 00       	mov    $0x1,%edi
  401b9f:	31 c0                	xor    %eax,%eax
  401ba1:	e8 8a f4 ff ff       	call   401030 <__printf_chk@plt>
  401ba6:	e9 fd fc ff ff       	jmp    4018a8 <main+0x6d8>
  401bab:	66 0f ef c0          	pxor   %xmm0,%xmm0
  401baf:	bf 01 00 00 00       	mov    $0x1,%edi
  401bb4:	b8 01 00 00 00       	mov    $0x1,%eax
  401bb9:	48 8d 35 99 6a 00 00 	lea    0x6a99(%rip),%rsi        # 408659 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x219>
  401bc0:	f3 0f 5a 01          	cvtss2sd (%rcx),%xmm0
  401bc4:	f2 0f 5e 05 94 47 01 	divsd  0x1014794(%rip),%xmm0        # 1416360 <clockFactor>
  401bcb:	01 
  401bcc:	e8 5f f4 ff ff       	call   401030 <__printf_chk@plt>
  401bd1:	e9 d2 fc ff ff       	jmp    4018a8 <main+0x6d8>
  401bd6:	f2 0f 10 01          	movsd  (%rcx),%xmm0
  401bda:	bf 01 00 00 00       	mov    $0x1,%edi
  401bdf:	b8 01 00 00 00       	mov    $0x1,%eax
  401be4:	48 8d 35 6e 6a 00 00 	lea    0x6a6e(%rip),%rsi        # 408659 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x219>
  401beb:	e8 40 f4 ff ff       	call   401030 <__printf_chk@plt>
  401bf0:	e9 b3 fc ff ff       	jmp    4018a8 <main+0x6d8>
  401bf5:	66 0f ef c0          	pxor   %xmm0,%xmm0
  401bf9:	bf 01 00 00 00       	mov    $0x1,%edi
  401bfe:	b8 01 00 00 00       	mov    $0x1,%eax
  401c03:	48 8d 35 4f 6a 00 00 	lea    0x6a4f(%rip),%rsi        # 408659 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x219>
  401c0a:	f3 0f 5a 01          	cvtss2sd (%rcx),%xmm0
  401c0e:	e8 1d f4 ff ff       	call   401030 <__printf_chk@plt>
  401c13:	e9 90 fc ff ff       	jmp    4018a8 <main+0x6d8>
  401c18:	8b 51 04             	mov    0x4(%rcx),%edx
  401c1b:	8b 09                	mov    (%rcx),%ecx
  401c1d:	48 8d 35 2a 6a 00 00 	lea    0x6a2a(%rip),%rsi        # 40864e <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x20e>
  401c24:	bf 01 00 00 00       	mov    $0x1,%edi
  401c29:	31 c0                	xor    %eax,%eax
  401c2b:	e8 00 f4 ff ff       	call   401030 <__printf_chk@plt>
  401c30:	e9 73 fc ff ff       	jmp    4018a8 <main+0x6d8>
  401c35:	48 8b 3d a4 e6 80 00 	mov    0x80e6a4(%rip),%rdi        # c102e0 <MSRCounters>
  401c3c:	31 f6                	xor    %esi,%esi
  401c3e:	e8 2d f4 ff ff       	call   401070 <open@plt>
  401c43:	89 05 9f e6 80 00    	mov    %eax,0x80e69f(%rip)        # c102e8 <MSRCounters+0x8>
  401c49:	83 c0 01             	add    $0x1,%eax
  401c4c:	0f 85 9d f8 ff ff    	jne    4014ef <main+0x31f>
  401c52:	48 8b 15 87 e6 80 00 	mov    0x80e687(%rip),%rdx        # c102e0 <MSRCounters>
  401c59:	48 8d 35 6c 68 00 00 	lea    0x686c(%rip),%rsi        # 4084cc <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x8c>
  401c60:	bf 01 00 00 00       	mov    $0x1,%edi
  401c65:	31 c0                	xor    %eax,%eax
  401c67:	e8 c4 f3 ff ff       	call   401030 <__printf_chk@plt>
  401c6c:	c7 05 72 e6 80 00 00 	movl   $0x0,0x80e672(%rip)        # c102e8 <MSRCounters+0x8>
  401c73:	00 00 00 
  401c76:	e9 74 f8 ff ff       	jmp    4014ef <main+0x31f>
  401c7b:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%rsp)
  401c82:	00 
  401c83:	e9 8a f9 ff ff       	jmp    401612 <main+0x442>
  401c88:	f2 0f 10 05 d0 46 01 	movsd  0x10146d0(%rip),%xmm0        # 1416360 <clockFactor>
  401c8f:	01 
  401c90:	bf 01 00 00 00       	mov    $0x1,%edi
  401c95:	b8 01 00 00 00       	mov    $0x1,%eax
  401c9a:	48 8d 35 d2 69 00 00 	lea    0x69d2(%rip),%rsi        # 408673 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x233>
  401ca1:	e8 8a f3 ff ff       	call   401030 <__printf_chk@plt>
  401ca6:	e9 22 fc ff ff       	jmp    4018cd <main+0x6fd>
  401cab:	4c 89 ea             	mov    %r13,%rdx
  401cae:	48 8d 35 a3 64 00 00 	lea    0x64a3(%rip),%rsi        # 408158 <_IO_stdin_used+0x158>
  401cb5:	bf 01 00 00 00       	mov    $0x1,%edi
  401cba:	31 c0                	xor    %eax,%eax
  401cbc:	e8 6f f3 ff ff       	call   401030 <__printf_chk@plt>
  401cc1:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%rsp)
  401cc8:	00 
  401cc9:	e9 44 f9 ff ff       	jmp    401612 <main+0x442>
  401cce:	e8 fd f3 ff ff       	call   4010d0 <__stack_chk_fail@plt>
  401cd3:	48 8d 3d f2 68 00 00 	lea    0x68f2(%rip),%rdi        # 4085cc <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x18c>
  401cda:	e8 b1 f3 ff ff       	call   401090 <perror@plt>
  401cdf:	bf 01 00 00 00       	mov    $0x1,%edi
  401ce4:	e8 f7 f3 ff ff       	call   4010e0 <exit@plt>
  401ce9:	48 8d 3d ef 68 00 00 	lea    0x68ef(%rip),%rdi        # 4085df <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x19f>
  401cf0:	e8 9b f3 ff ff       	call   401090 <perror@plt>
  401cf5:	bf 01 00 00 00       	mov    $0x1,%edi
  401cfa:	e8 e1 f3 ff ff       	call   4010e0 <exit@plt>
  401cff:	48 8d 3d cf 68 00 00 	lea    0x68cf(%rip),%rdi        # 4085d5 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x195>
  401d06:	e8 85 f3 ff ff       	call   401090 <perror@plt>
  401d0b:	bf 01 00 00 00       	mov    $0x1,%edi
  401d10:	e8 cb f3 ff ff       	call   4010e0 <exit@plt>
  401d15:	f3 0f 1e fa          	endbr64 
  401d19:	48 89 c5             	mov    %rax,%rbp
  401d1c:	e9 7f f4 ff ff       	jmp    4011a0 <main.cold>
  401d21:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401d28:	00 00 00 00 
  401d2c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401d30 <_GLOBAL__sub_I_diagnostics>:
  401d30:	f3 0f 1e fa          	endbr64 
  401d34:	4c 8d 05 a5 e5 80 00 	lea    0x80e5a5(%rip),%r8        # c102e0 <MSRCounters>
  401d3b:	48 83 ec 08          	sub    $0x8,%rsp
  401d3f:	4c 89 c7             	mov    %r8,%rdi
  401d42:	e8 49 07 00 00       	call   402490 <_ZN9CCountersC1Ev>
  401d47:	48 8d 15 ba 83 00 00 	lea    0x83ba(%rip),%rdx        # 40a108 <__dso_handle>
  401d4e:	4c 89 c6             	mov    %r8,%rsi
  401d51:	48 83 c4 08          	add    $0x8,%rsp
  401d55:	48 8d 3d b4 27 00 00 	lea    0x27b4(%rip),%rdi        # 404510 <_ZN9CCountersD1Ev>
  401d5c:	e9 3f f3 ff ff       	jmp    4010a0 <__cxa_atexit@plt>
  401d61:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  401d68:	00 00 00 
  401d6b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401d70 <_start>:
  401d70:	f3 0f 1e fa          	endbr64 
  401d74:	31 ed                	xor    %ebp,%ebp
  401d76:	49 89 d1             	mov    %rdx,%r9
  401d79:	5e                   	pop    %rsi
  401d7a:	48 89 e2             	mov    %rsp,%rdx
  401d7d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  401d81:	50                   	push   %rax
  401d82:	54                   	push   %rsp
  401d83:	45 31 c0             	xor    %r8d,%r8d
  401d86:	31 c9                	xor    %ecx,%ecx
  401d88:	48 c7 c7 d0 11 40 00 	mov    $0x4011d0,%rdi
  401d8f:	ff 15 5b 82 00 00    	call   *0x825b(%rip)        # 409ff0 <__libc_start_main@GLIBC_2.34>
  401d95:	f4                   	hlt    
  401d96:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  401d9d:	00 00 00 

0000000000401da0 <_dl_relocate_static_pie>:
  401da0:	f3 0f 1e fa          	endbr64 
  401da4:	c3                   	ret    
  401da5:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  401dac:	00 00 00 
  401daf:	90                   	nop

0000000000401db0 <deregister_tm_clones>:
  401db0:	b8 b8 02 c1 00       	mov    $0xc102b8,%eax
  401db5:	48 3d b8 02 c1 00    	cmp    $0xc102b8,%rax
  401dbb:	74 13                	je     401dd0 <deregister_tm_clones+0x20>
  401dbd:	b8 00 00 00 00       	mov    $0x0,%eax
  401dc2:	48 85 c0             	test   %rax,%rax
  401dc5:	74 09                	je     401dd0 <deregister_tm_clones+0x20>
  401dc7:	bf b8 02 c1 00       	mov    $0xc102b8,%edi
  401dcc:	ff e0                	jmp    *%rax
  401dce:	66 90                	xchg   %ax,%ax
  401dd0:	c3                   	ret    
  401dd1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401dd8:	00 00 00 00 
  401ddc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401de0 <register_tm_clones>:
  401de0:	be b8 02 c1 00       	mov    $0xc102b8,%esi
  401de5:	48 81 ee b8 02 c1 00 	sub    $0xc102b8,%rsi
  401dec:	48 89 f0             	mov    %rsi,%rax
  401def:	48 c1 ee 3f          	shr    $0x3f,%rsi
  401df3:	48 c1 f8 03          	sar    $0x3,%rax
  401df7:	48 01 c6             	add    %rax,%rsi
  401dfa:	48 d1 fe             	sar    %rsi
  401dfd:	74 11                	je     401e10 <register_tm_clones+0x30>
  401dff:	b8 00 00 00 00       	mov    $0x0,%eax
  401e04:	48 85 c0             	test   %rax,%rax
  401e07:	74 07                	je     401e10 <register_tm_clones+0x30>
  401e09:	bf b8 02 c1 00       	mov    $0xc102b8,%edi
  401e0e:	ff e0                	jmp    *%rax
  401e10:	c3                   	ret    
  401e11:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401e18:	00 00 00 00 
  401e1c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401e20 <__do_global_dtors_aux>:
  401e20:	f3 0f 1e fa          	endbr64 
  401e24:	80 3d 95 e4 80 00 00 	cmpb   $0x0,0x80e495(%rip)        # c102c0 <completed.0>
  401e2b:	75 13                	jne    401e40 <__do_global_dtors_aux+0x20>
  401e2d:	55                   	push   %rbp
  401e2e:	48 89 e5             	mov    %rsp,%rbp
  401e31:	e8 7a ff ff ff       	call   401db0 <deregister_tm_clones>
  401e36:	c6 05 83 e4 80 00 01 	movb   $0x1,0x80e483(%rip)        # c102c0 <completed.0>
  401e3d:	5d                   	pop    %rbp
  401e3e:	c3                   	ret    
  401e3f:	90                   	nop
  401e40:	c3                   	ret    
  401e41:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401e48:	00 00 00 00 
  401e4c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401e50 <frame_dummy>:
  401e50:	f3 0f 1e fa          	endbr64 
  401e54:	eb 8a                	jmp    401de0 <register_tm_clones>
  401e56:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  401e5d:	00 00 00 

0000000000401e60 <_ZN13ThreadHandler4StopEv.part.0>:
  401e60:	41 55                	push   %r13
  401e62:	41 54                	push   %r12
  401e64:	55                   	push   %rbp
  401e65:	48 89 fd             	mov    %rdi,%rbp
  401e68:	53                   	push   %rbx
  401e69:	48 83 ec 08          	sub    $0x8,%rsp
  401e6d:	83 3f 01             	cmpl   $0x1,(%rdi)
  401e70:	7e 41                	jle    401eb3 <_ZN13ThreadHandler4StopEv.part.0+0x53>
  401e72:	bb 01 00 00 00       	mov    $0x1,%ebx
  401e77:	4c 8d 2d 8a 61 00 00 	lea    0x618a(%rip),%r13        # 408008 <_IO_stdin_used+0x8>
  401e7e:	eb 09                	jmp    401e89 <_ZN13ThreadHandler4StopEv.part.0+0x29>
  401e80:	48 83 c3 01          	add    $0x1,%rbx
  401e84:	39 5d 00             	cmp    %ebx,0x0(%rbp)
  401e87:	7e 2a                	jle    401eb3 <_ZN13ThreadHandler4StopEv.part.0+0x53>
  401e89:	48 8b 7c dd 08       	mov    0x8(%rbp,%rbx,8),%rdi
  401e8e:	31 f6                	xor    %esi,%esi
  401e90:	e8 1b f2 ff ff       	call   4010b0 <pthread_join@plt>
  401e95:	85 c0                	test   %eax,%eax
  401e97:	74 e7                	je     401e80 <_ZN13ThreadHandler4StopEv.part.0+0x20>
  401e99:	89 da                	mov    %ebx,%edx
  401e9b:	4c 89 ee             	mov    %r13,%rsi
  401e9e:	bf 01 00 00 00       	mov    $0x1,%edi
  401ea3:	31 c0                	xor    %eax,%eax
  401ea5:	e8 86 f1 ff ff       	call   401030 <__printf_chk@plt>
  401eaa:	48 83 c3 01          	add    $0x1,%rbx
  401eae:	39 5d 00             	cmp    %ebx,0x0(%rbp)
  401eb1:	7f d6                	jg     401e89 <_ZN13ThreadHandler4StopEv.part.0+0x29>
  401eb3:	c7 45 00 00 00 00 00 	movl   $0x0,0x0(%rbp)
  401eba:	48 83 c4 08          	add    $0x8,%rsp
  401ebe:	5b                   	pop    %rbx
  401ebf:	5d                   	pop    %rbp
  401ec0:	41 5c                	pop    %r12
  401ec2:	41 5d                	pop    %r13
  401ec4:	c3                   	ret    
  401ec5:	90                   	nop
  401ec6:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  401ecd:	00 00 00 

0000000000401ed0 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0>:
  401ed0:	53                   	push   %rbx
  401ed1:	b8 01 00 00 00       	mov    $0x1,%eax
  401ed6:	31 c9                	xor    %ecx,%ecx
  401ed8:	48 89 fe             	mov    %rdi,%rsi
  401edb:	0f a2                	cpuid  
  401edd:	41 89 c1             	mov    %eax,%r9d
  401ee0:	89 c2                	mov    %eax,%edx
  401ee2:	89 c1                	mov    %eax,%ecx
  401ee4:	c1 f8 0c             	sar    $0xc,%eax
  401ee7:	41 c1 f9 04          	sar    $0x4,%r9d
  401eeb:	25 f0 00 00 00       	and    $0xf0,%eax
  401ef0:	c1 fa 08             	sar    $0x8,%edx
  401ef3:	41 83 e1 0f          	and    $0xf,%r9d
  401ef7:	c1 f9 14             	sar    $0x14,%ecx
  401efa:	83 e2 0f             	and    $0xf,%edx
  401efd:	41 09 c1             	or     %eax,%r9d
  401f00:	8b 47 50             	mov    0x50(%rdi),%eax
  401f03:	0f b6 c9             	movzbl %cl,%ecx
  401f06:	01 ca                	add    %ecx,%edx
  401f08:	83 f8 01             	cmp    $0x1,%eax
  401f0b:	0f 84 87 00 00 00    	je     401f98 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0xc8>
  401f11:	83 f8 02             	cmp    $0x2,%eax
  401f14:	75 42                	jne    401f58 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x88>
  401f16:	83 fa 06             	cmp    $0x6,%edx
  401f19:	0f 84 c5 02 00 00    	je     4021e4 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x314>
  401f1f:	8d 42 f1             	lea    -0xf(%rdx),%eax
  401f22:	83 f8 05             	cmp    $0x5,%eax
  401f25:	0f 86 85 00 00 00    	jbe    401fb0 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0xe0>
  401f2b:	83 fa 14             	cmp    $0x14,%edx
  401f2e:	0f 8e c8 02 00 00    	jle    4021fc <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x32c>
  401f34:	83 fa 16             	cmp    $0x16,%edx
  401f37:	0f 8e b3 02 00 00    	jle    4021f0 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x320>
  401f3d:	c7 47 54 00 00 08 00 	movl   $0x80000,0x54(%rdi)
  401f44:	0f 1f 40 00          	nopl   0x0(%rax)
  401f48:	8b 05 a2 aa 01 01    	mov    0x101aaa2(%rip),%eax        # 141c9f0 <diagnostics>
  401f4e:	85 c0                	test   %eax,%eax
  401f50:	75 27                	jne    401f79 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0xa9>
  401f52:	5b                   	pop    %rbx
  401f53:	c3                   	ret    
  401f54:	0f 1f 40 00          	nopl   0x0(%rax)
  401f58:	83 f8 03             	cmp    $0x3,%eax
  401f5b:	75 eb                	jne    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  401f5d:	83 fa 06             	cmp    $0x6,%edx
  401f60:	75 e6                	jne    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  401f62:	41 83 f9 0e          	cmp    $0xe,%r9d
  401f66:	7e e0                	jle    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  401f68:	8b 05 82 aa 01 01    	mov    0x101aa82(%rip),%eax        # 141c9f0 <diagnostics>
  401f6e:	c7 47 54 00 00 10 00 	movl   $0x100000,0x54(%rdi)
  401f75:	85 c0                	test   %eax,%eax
  401f77:	74 d9                	je     401f52 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x82>
  401f79:	44 8b 46 54          	mov    0x54(%rsi),%r8d
  401f7d:	44 89 c9             	mov    %r9d,%ecx
  401f80:	48 8d 35 a1 60 00 00 	lea    0x60a1(%rip),%rsi        # 408028 <_IO_stdin_used+0x28>
  401f87:	31 c0                	xor    %eax,%eax
  401f89:	bf 01 00 00 00       	mov    $0x1,%edi
  401f8e:	5b                   	pop    %rbx
  401f8f:	e9 9c f0 ff ff       	jmp    401030 <__printf_chk@plt>
  401f94:	0f 1f 40 00          	nopl   0x0(%rax)
  401f98:	83 fa 05             	cmp    $0x5,%edx
  401f9b:	74 63                	je     402000 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x130>
  401f9d:	83 fa 0f             	cmp    $0xf,%edx
  401fa0:	75 1e                	jne    401fc0 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0xf0>
  401fa2:	c7 47 54 08 00 00 00 	movl   $0x8,0x54(%rdi)
  401fa9:	eb 9d                	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  401fab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401fb0:	c7 47 54 00 00 02 00 	movl   $0x20000,0x54(%rdi)
  401fb7:	eb 8f                	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  401fb9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  401fc0:	83 fa 06             	cmp    $0x6,%edx
  401fc3:	75 83                	jne    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  401fc5:	41 83 f9 3a          	cmp    $0x3a,%r9d
  401fc9:	0f 84 03 01 00 00    	je     4020d2 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x202>
  401fcf:	0f 8f 9b 00 00 00    	jg     402070 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x1a0>
  401fd5:	41 83 f9 1d          	cmp    $0x1d,%r9d
  401fd9:	7f 35                	jg     402010 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x140>
  401fdb:	41 83 f9 08          	cmp    $0x8,%r9d
  401fdf:	7e 79                	jle    40205a <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x18a>
  401fe1:	41 8d 41 f7          	lea    -0x9(%r9),%eax
  401fe5:	83 f8 14             	cmp    $0x14,%eax
  401fe8:	0f 87 56 01 00 00    	ja     402144 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x274>
  401fee:	48 8d 0d ab 62 00 00 	lea    0x62ab(%rip),%rcx        # 4082a0 <_IO_stdin_used+0x2a0>
  401ff5:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  401ff9:	48 01 c8             	add    %rcx,%rax
  401ffc:	3e ff e0             	notrack jmp *%rax
  401fff:	90                   	nop
  402000:	c7 47 54 01 00 00 00 	movl   $0x1,0x54(%rdi)
  402007:	e9 3c ff ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  40200c:	0f 1f 40 00          	nopl   0x0(%rax)
  402010:	41 83 f9 36          	cmp    $0x36,%r9d
  402014:	0f 8f 9e 00 00 00    	jg     4020b8 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x1e8>
  40201a:	44 89 c9             	mov    %r9d,%ecx
  40201d:	b8 01 00 00 00       	mov    $0x1,%eax
  402022:	48 d3 e0             	shl    %cl,%rax
  402025:	48 b9 00 00 00 c0 20 	movabs $0xd020c0000000,%rcx
  40202c:	d0 00 00 
  40202f:	48 85 c8             	test   %rcx,%rax
  402032:	0f 85 68 01 00 00    	jne    4021a0 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x2d0>
  402038:	48 b9 00 00 00 00 c0 	movabs $0x6000c000000000,%rcx
  40203f:	00 60 00 
  402042:	48 85 c8             	test   %rcx,%rax
  402045:	0f 85 75 01 00 00    	jne    4021c0 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x2f0>
  40204b:	48 b9 00 00 00 00 00 	movabs $0x240000000000,%rcx
  402052:	24 00 00 
  402055:	48 85 c8             	test   %rcx,%rax
  402058:	75 78                	jne    4020d2 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x202>
  40205a:	c7 46 54 02 00 00 00 	movl   $0x2,0x54(%rsi)
  402061:	e9 e2 fe ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  402066:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40206d:	00 00 00 
  402070:	41 83 f9 7a          	cmp    $0x7a,%r9d
  402074:	0f 8f 86 00 00 00    	jg     402100 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x230>
  40207a:	41 83 f9 56          	cmp    $0x56,%r9d
  40207e:	7f 60                	jg     4020e0 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x210>
  402080:	41 83 f9 3e          	cmp    $0x3e,%r9d
  402084:	7e 4a                	jle    4020d0 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x200>
  402086:	41 8d 49 c1          	lea    -0x3f(%r9),%ecx
  40208a:	b8 01 00 00 00       	mov    $0x1,%eax
  40208f:	48 d3 e0             	shl    %cl,%rax
  402092:	a9 c1 01 81 00       	test   $0x8101c1,%eax
  402097:	75 0f                	jne    4020a8 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x1d8>
  402099:	f6 c4 48             	test   $0x48,%ah
  40209c:	75 20                	jne    4020be <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x1ee>
  40209e:	41 83 f9 55          	cmp    $0x55,%r9d
  4020a2:	0f 84 30 01 00 00    	je     4021d8 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x308>
  4020a8:	c7 46 54 00 01 00 00 	movl   $0x100,0x54(%rsi)
  4020af:	e9 94 fe ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  4020b4:	0f 1f 40 00          	nopl   0x0(%rax)
  4020b8:	41 83 f9 37          	cmp    $0x37,%r9d
  4020bc:	75 9c                	jne    40205a <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x18a>
  4020be:	c7 46 54 00 20 00 00 	movl   $0x2000,0x54(%rsi)
  4020c5:	e9 7e fe ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  4020ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4020d0:	75 4e                	jne    402120 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x250>
  4020d2:	c7 46 54 80 00 00 00 	movl   $0x80,0x54(%rsi)
  4020d9:	e9 6a fe ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  4020de:	66 90                	xchg   %ax,%ax
  4020e0:	41 8d 41 a9          	lea    -0x57(%r9),%eax
  4020e4:	83 f8 23             	cmp    $0x23,%eax
  4020e7:	77 5b                	ja     402144 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x274>
  4020e9:	48 8d 0d 04 62 00 00 	lea    0x6204(%rip),%rcx        # 4082f4 <_IO_stdin_used+0x2f4>
  4020f0:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  4020f4:	48 01 c8             	add    %rcx,%rax
  4020f7:	3e ff e0             	notrack jmp *%rax
  4020fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402100:	41 81 f9 97 00 00 00 	cmp    $0x97,%r9d
  402107:	74 09                	je     402112 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x242>
  402109:	41 81 f9 9a 00 00 00 	cmp    $0x9a,%r9d
  402110:	75 1d                	jne    40212f <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x25f>
  402112:	c7 46 54 00 08 00 00 	movl   $0x800,0x54(%rsi)
  402119:	e9 2a fe ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  40211e:	66 90                	xchg   %ax,%ax
  402120:	41 83 f9 3b          	cmp    $0x3b,%r9d
  402124:	0f 84 30 ff ff ff    	je     40205a <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x18a>
  40212a:	e9 79 ff ff ff       	jmp    4020a8 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x1d8>
  40212f:	41 81 f9 8c 00 00 00 	cmp    $0x8c,%r9d
  402136:	75 20                	jne    402158 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x288>
  402138:	c7 46 54 00 04 00 00 	movl   $0x400,0x54(%rsi)
  40213f:	e9 04 fe ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  402144:	41 83 f9 3b          	cmp    $0x3b,%r9d
  402148:	0f 8e 0c ff ff ff    	jle    40205a <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x18a>
  40214e:	41 83 f9 5d          	cmp    $0x5d,%r9d
  402152:	0f 8e 50 ff ff ff    	jle    4020a8 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x1d8>
  402158:	41 83 f9 7d          	cmp    $0x7d,%r9d
  40215c:	7e 7a                	jle    4021d8 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x308>
  40215e:	41 81 f9 96 00 00 00 	cmp    $0x96,%r9d
  402165:	7f ab                	jg     402112 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x242>
  402167:	eb cf                	jmp    402138 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x268>
  402169:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402170:	c7 47 54 20 00 00 00 	movl   $0x20,0x54(%rdi)
  402177:	e9 cc fd ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  40217c:	0f 1f 40 00          	nopl   0x0(%rax)
  402180:	c7 47 54 04 00 00 00 	movl   $0x4,0x54(%rdi)
  402187:	e9 bc fd ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  40218c:	c7 46 54 00 40 00 00 	movl   $0x4000,0x54(%rsi)
  402193:	e9 b0 fd ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  402198:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40219f:	00 
  4021a0:	c7 46 54 40 00 00 00 	movl   $0x40,0x54(%rsi)
  4021a7:	e9 9c fd ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  4021ac:	c7 47 54 10 00 00 00 	movl   $0x10,0x54(%rdi)
  4021b3:	e9 90 fd ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  4021b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4021bf:	00 
  4021c0:	c7 46 54 00 10 00 00 	movl   $0x1000,0x54(%rsi)
  4021c7:	e9 7c fd ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  4021cc:	c7 46 54 00 80 00 00 	movl   $0x8000,0x54(%rsi)
  4021d3:	e9 70 fd ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  4021d8:	c7 46 54 00 02 00 00 	movl   $0x200,0x54(%rsi)
  4021df:	e9 64 fd ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  4021e4:	c7 47 54 00 00 01 00 	movl   $0x10000,0x54(%rdi)
  4021eb:	e9 58 fd ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  4021f0:	c7 47 54 00 00 04 00 	movl   $0x40000,0x54(%rdi)
  4021f7:	e9 4c fd ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  4021fc:	c7 47 54 00 00 00 00 	movl   $0x0,0x54(%rdi)
  402203:	e9 40 fd ff ff       	jmp    401f48 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x78>
  402208:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40220f:	00 

0000000000402210 <_Z11ThreadProc1Pv>:
  402210:	f3 0f 1e fa          	endbr64 
  402214:	41 55                	push   %r13
  402216:	41 54                	push   %r12
  402218:	55                   	push   %rbp
  402219:	53                   	push   %rbx
  40221a:	48 81 ec e8 07 00 00 	sub    $0x7e8,%rsp
  402221:	44 8b 27             	mov    (%rdi),%r12d
  402224:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40222b:	00 00 
  40222d:	48 89 84 24 d8 07 00 	mov    %rax,0x7d8(%rsp)
  402234:	00 
  402235:	31 c0                	xor    %eax,%eax
  402237:	44 39 25 e2 db 00 00 	cmp    %r12d,0xdbe2(%rip)        # 40fe20 <NumThreads>
  40223e:	0f 86 9c 01 00 00    	jbe    4023e0 <_Z11ThreadProc1Pv+0x1d0>
  402244:	48 8d 05 95 7f 01 01 	lea    0x1017f95(%rip),%rax        # 141a1e0 <ProcNum>
  40224b:	44 89 e3             	mov    %r12d,%ebx
  40224e:	48 89 e5             	mov    %rsp,%rbp
  402251:	b9 10 00 00 00       	mov    $0x10,%ecx
  402256:	44 8b 2c 98          	mov    (%rax,%rbx,4),%r13d
  40225a:	48 89 ef             	mov    %rbp,%rdi
  40225d:	31 c0                	xor    %eax,%eax
  40225f:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402262:	49 63 c5             	movslq %r13d,%rax
  402265:	48 3d ff 03 00 00    	cmp    $0x3ff,%rax
  40226b:	77 14                	ja     402281 <_Z11ThreadProc1Pv+0x71>
  40226d:	48 c1 e8 06          	shr    $0x6,%rax
  402271:	ba 01 00 00 00       	mov    $0x1,%edx
  402276:	44 89 e9             	mov    %r13d,%ecx
  402279:	48 d3 e2             	shl    %cl,%rdx
  40227c:	48 09 54 c5 00       	or     %rdx,0x0(%rbp,%rax,8)
  402281:	e8 3a ee ff ff       	call   4010c0 <gettid@plt>
  402286:	48 89 ea             	mov    %rbp,%rdx
  402289:	be 80 00 00 00       	mov    $0x80,%esi
  40228e:	89 c7                	mov    %eax,%edi
  402290:	e8 eb ed ff ff       	call   401080 <sched_setaffinity@plt>
  402295:	85 c0                	test   %eax,%eax
  402297:	0f 85 1b 01 00 00    	jne    4023b8 <_Z11ThreadProc1Pv+0x1a8>
  40229d:	45 85 e4             	test   %r12d,%r12d
  4022a0:	0f 84 ca 00 00 00    	je     402370 <_Z11ThreadProc1Pv+0x160>
  4022a6:	e8 85 ee ff ff       	call   401130 <sched_yield@plt>
  4022ab:	48 63 15 6e db 00 00 	movslq 0xdb6e(%rip),%rdx        # 40fe20 <NumThreads>
  4022b2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  4022b9:	00 
  4022ba:	85 d2                	test   %edx,%edx
  4022bc:	0f 8e 3e 01 00 00    	jle    402400 <_Z11ThreadProc1Pv+0x1f0>
  4022c2:	be 01 00 00 00       	mov    $0x1,%esi
  4022c7:	48 89 ef             	mov    %rbp,%rdi
  4022ca:	e8 91 ed ff ff       	call   401060 <memset@plt>
  4022cf:	48 8b 0c 24          	mov    (%rsp),%rcx
  4022d3:	48 8d 15 46 9f 01 01 	lea    0x1019f46(%rip),%rdx        # 141c220 <TSync>
  4022da:	c6 04 1a 01          	movb   $0x1,(%rdx,%rbx,1)
  4022de:	66 90                	xchg   %ax,%ax
  4022e0:	48 8b 02             	mov    (%rdx),%rax
  4022e3:	48 39 c8             	cmp    %rcx,%rax
  4022e6:	75 f8                	jne    4022e0 <_Z11ThreadProc1Pv+0xd0>
  4022e8:	44 89 e7             	mov    %r12d,%edi
  4022eb:	e8 50 22 00 00       	call   404540 <TestLoop>
  4022f0:	89 05 62 40 01 01    	mov    %eax,0x1014062(%rip)        # 1416358 <repetitions>
  4022f6:	e8 35 ee ff ff       	call   401130 <sched_yield@plt>
  4022fb:	45 85 e4             	test   %r12d,%r12d
  4022fe:	74 30                	je     402330 <_Z11ThreadProc1Pv+0x120>
  402300:	48 8b 84 24 d8 07 00 	mov    0x7d8(%rsp),%rax
  402307:	00 
  402308:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  40230f:	00 00 
  402311:	0f 85 f0 00 00 00    	jne    402407 <_Z11ThreadProc1Pv+0x1f7>
  402317:	48 81 c4 e8 07 00 00 	add    $0x7e8,%rsp
  40231e:	31 c0                	xor    %eax,%eax
  402320:	5b                   	pop    %rbx
  402321:	5d                   	pop    %rbp
  402322:	41 5c                	pop    %r12
  402324:	41 5d                	pop    %r13
  402326:	c3                   	ret    
  402327:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40232e:	00 00 
  402330:	8b 05 e2 da 00 00    	mov    0xdae2(%rip),%eax        # 40fe18 <UsePMC>
  402336:	85 c0                	test   %eax,%eax
  402338:	74 c6                	je     402300 <_Z11ThreadProc1Pv+0xf0>
  40233a:	8b 05 10 30 c1 00    	mov    0xc13010(%rip),%eax        # 1015350 <MSRCounters+0x405070>
  402340:	c1 e0 04             	shl    $0x4,%eax
  402343:	85 c0                	test   %eax,%eax
  402345:	7e b9                	jle    402300 <_Z11ThreadProc1Pv+0xf0>
  402347:	8b 3d 9b df 80 00    	mov    0x80df9b(%rip),%edi        # c102e8 <MSRCounters+0x8>
  40234d:	85 ff                	test   %edi,%edi
  40234f:	74 af                	je     402300 <_Z11ThreadProc1Pv+0xf0>
  402351:	48 8d 15 e8 0f c1 00 	lea    0xc10fe8(%rip),%rdx        # 1013340 <MSRCounters+0x403060>
  402358:	be 01 f9 00 00       	mov    $0xf901,%esi
  40235d:	31 c0                	xor    %eax,%eax
  40235f:	e8 bc ed ff ff       	call   401120 <ioctl@plt>
  402364:	eb 9a                	jmp    402300 <_Z11ThreadProc1Pv+0xf0>
  402366:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40236d:	00 00 00 
  402370:	8b 15 a2 da 00 00    	mov    0xdaa2(%rip),%edx        # 40fe18 <UsePMC>
  402376:	85 d2                	test   %edx,%edx
  402378:	0f 84 28 ff ff ff    	je     4022a6 <_Z11ThreadProc1Pv+0x96>
  40237e:	8b 05 cc ff 80 00    	mov    0x80ffcc(%rip),%eax        # c12350 <MSRCounters+0x2070>
  402384:	c1 e0 04             	shl    $0x4,%eax
  402387:	85 c0                	test   %eax,%eax
  402389:	0f 8e 17 ff ff ff    	jle    4022a6 <_Z11ThreadProc1Pv+0x96>
  40238f:	8b 3d 53 df 80 00    	mov    0x80df53(%rip),%edi        # c102e8 <MSRCounters+0x8>
  402395:	85 ff                	test   %edi,%edi
  402397:	0f 84 09 ff ff ff    	je     4022a6 <_Z11ThreadProc1Pv+0x96>
  40239d:	48 8d 15 9c df 80 00 	lea    0x80df9c(%rip),%rdx        # c10340 <MSRCounters+0x60>
  4023a4:	be 01 f9 00 00       	mov    $0xf901,%esi
  4023a9:	31 c0                	xor    %eax,%eax
  4023ab:	e8 70 ed ff ff       	call   401120 <ioctl@plt>
  4023b0:	e9 f1 fe ff ff       	jmp    4022a6 <_Z11ThreadProc1Pv+0x96>
  4023b5:	0f 1f 00             	nopl   (%rax)
  4023b8:	31 c0                	xor    %eax,%eax
  4023ba:	44 89 ea             	mov    %r13d,%edx
  4023bd:	bf 01 00 00 00       	mov    $0x1,%edi
  4023c2:	48 8d 35 a7 5c 00 00 	lea    0x5ca7(%rip),%rsi        # 408070 <_IO_stdin_used+0x70>
  4023c9:	e8 62 ec ff ff       	call   401030 <__printf_chk@plt>
  4023ce:	45 85 e4             	test   %r12d,%r12d
  4023d1:	0f 85 cf fe ff ff    	jne    4022a6 <_Z11ThreadProc1Pv+0x96>
  4023d7:	eb 97                	jmp    402370 <_Z11ThreadProc1Pv+0x160>
  4023d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4023e0:	44 89 e2             	mov    %r12d,%edx
  4023e3:	48 8d 35 66 5c 00 00 	lea    0x5c66(%rip),%rsi        # 408050 <_IO_stdin_used+0x50>
  4023ea:	bf 01 00 00 00       	mov    $0x1,%edi
  4023ef:	e8 3c ec ff ff       	call   401030 <__printf_chk@plt>
  4023f4:	e9 07 ff ff ff       	jmp    402300 <_Z11ThreadProc1Pv+0xf0>
  4023f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402400:	31 c9                	xor    %ecx,%ecx
  402402:	e9 cc fe ff ff       	jmp    4022d3 <_Z11ThreadProc1Pv+0xc3>
  402407:	e8 c4 ec ff ff       	call   4010d0 <__stack_chk_fail@plt>
  40240c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402410 <_ZN12CMSRInOutQueC1Ev>:
  402410:	f3 0f 1e fa          	endbr64 
  402414:	c7 87 10 20 00 00 00 	movl   $0x0,0x2010(%rdi)
  40241b:	00 00 00 
  40241e:	48 8d 87 10 20 00 00 	lea    0x2010(%rdi),%rax
  402425:	0f 1f 00             	nopl   (%rax)
  402428:	c7 07 01 00 00 00    	movl   $0x1,(%rdi)
  40242e:	48 83 c7 10          	add    $0x10,%rdi
  402432:	48 39 c7             	cmp    %rax,%rdi
  402435:	75 f1                	jne    402428 <_ZN12CMSRInOutQueC1Ev+0x18>
  402437:	c3                   	ret    
  402438:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40243f:	00 

0000000000402440 <_ZN12CMSRInOutQue3putE12EMSR_COMMANDjjj>:
  402440:	f3 0f 1e fa          	endbr64 
  402444:	44 8b 8f 10 20 00 00 	mov    0x2010(%rdi),%r9d
  40244b:	41 81 f9 ff 01 00 00 	cmp    $0x1ff,%r9d
  402452:	7f 2c                	jg     402480 <_ZN12CMSRInOutQue3putE12EMSR_COMMANDjjj+0x40>
  402454:	49 63 c1             	movslq %r9d,%rax
  402457:	41 83 c1 01          	add    $0x1,%r9d
  40245b:	48 c1 e0 04          	shl    $0x4,%rax
  40245f:	48 01 f8             	add    %rdi,%rax
  402462:	89 30                	mov    %esi,(%rax)
  402464:	89 50 04             	mov    %edx,0x4(%rax)
  402467:	89 48 08             	mov    %ecx,0x8(%rax)
  40246a:	44 89 40 0c          	mov    %r8d,0xc(%rax)
  40246e:	31 c0                	xor    %eax,%eax
  402470:	44 89 8f 10 20 00 00 	mov    %r9d,0x2010(%rdi)
  402477:	c3                   	ret    
  402478:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40247f:	00 
  402480:	b8 f6 ff ff ff       	mov    $0xfffffff6,%eax
  402485:	c3                   	ret    
  402486:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40248d:	00 00 00 

0000000000402490 <_ZN9CCountersC1Ev>:
  402490:	f3 0f 1e fa          	endbr64 
  402494:	48 8d 05 25 60 00 00 	lea    0x6025(%rip),%rax        # 4084c0 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x80>
  40249b:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%rdi)
  4024a2:	48 89 fe             	mov    %rdi,%rsi
  4024a5:	48 8d 4f 60          	lea    0x60(%rdi),%rcx
  4024a9:	48 89 07             	mov    %rax,(%rdi)
  4024ac:	48 8d 97 70 20 00 00 	lea    0x2070(%rdi),%rdx
  4024b3:	48 8d bf 60 30 40 00 	lea    0x403060(%rdi),%rdi
  4024ba:	c7 02 00 00 00 00    	movl   $0x0,(%rdx)
  4024c0:	48 89 c8             	mov    %rcx,%rax
  4024c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4024c8:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
  4024ce:	48 83 c0 10          	add    $0x10,%rax
  4024d2:	48 39 d0             	cmp    %rdx,%rax
  4024d5:	75 f1                	jne    4024c8 <_ZN9CCountersC1Ev+0x38>
  4024d7:	48 81 c1 18 20 00 00 	add    $0x2018,%rcx
  4024de:	48 8d 90 18 20 00 00 	lea    0x2018(%rax),%rdx
  4024e5:	48 39 f9             	cmp    %rdi,%rcx
  4024e8:	75 d0                	jne    4024ba <_ZN9CCountersC1Ev+0x2a>
  4024ea:	48 8d 96 70 50 40 00 	lea    0x405070(%rsi),%rdx
  4024f1:	48 8d be 60 60 80 00 	lea    0x806060(%rsi),%rdi
  4024f8:	c7 02 00 00 00 00    	movl   $0x0,(%rdx)
  4024fe:	48 89 c8             	mov    %rcx,%rax
  402501:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402508:	c7 00 01 00 00 00    	movl   $0x1,(%rax)
  40250e:	48 83 c0 10          	add    $0x10,%rax
  402512:	48 39 c2             	cmp    %rax,%rdx
  402515:	75 f1                	jne    402508 <_ZN9CCountersC1Ev+0x78>
  402517:	48 81 c1 18 20 00 00 	add    $0x2018,%rcx
  40251e:	48 81 c2 18 20 00 00 	add    $0x2018,%rdx
  402525:	48 39 f9             	cmp    %rdi,%rcx
  402528:	75 ce                	jne    4024f8 <_ZN9CCountersC1Ev+0x68>
  40252a:	66 0f ef c0          	pxor   %xmm0,%xmm0
  40252e:	48 c7 46 50 00 00 00 	movq   $0x0,0x50(%rsi)
  402535:	00 
  402536:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%rsi)
  40253d:	c7 86 64 60 80 00 00 	movl   $0x0,0x806064(%rsi)
  402544:	00 00 00 
  402547:	48 c7 86 68 60 80 00 	movq   $0x0,0x806068(%rsi)
  40254e:	00 00 00 00 
  402552:	0f 11 46 10          	movups %xmm0,0x10(%rsi)
  402556:	0f 11 46 20          	movups %xmm0,0x20(%rsi)
  40255a:	0f 11 46 30          	movups %xmm0,0x30(%rsi)
  40255e:	0f 11 46 40          	movups %xmm0,0x40(%rsi)
  402562:	c3                   	ret    
  402563:	90                   	nop
  402564:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  40256b:	00 00 00 00 
  40256f:	90                   	nop

0000000000402570 <_ZN9CCounters13LockProcessorEv>:
  402570:	f3 0f 1e fa          	endbr64 
  402574:	4c 63 0d a5 d8 00 00 	movslq 0xd8a5(%rip),%r9        # 40fe20 <NumThreads>
  40257b:	45 85 c9             	test   %r9d,%r9d
  40257e:	0f 8e 60 01 00 00    	jle    4026e4 <_ZN9CCounters13LockProcessorEv+0x174>
  402584:	49 89 f8             	mov    %rdi,%r8
  402587:	48 8d b7 70 20 00 00 	lea    0x2070(%rdi),%rsi
  40258e:	31 ff                	xor    %edi,%edi
  402590:	4c 8d 15 49 7c 01 01 	lea    0x1017c49(%rip),%r10        # 141a1e0 <ProcNum>
  402597:	45 8b 1c ba          	mov    (%r10,%rdi,4),%r11d
  40259b:	48 63 c7             	movslq %edi,%rax
  40259e:	45 85 db             	test   %r11d,%r11d
  4025a1:	0f 88 29 01 00 00    	js     4026d0 <_ZN9CCounters13LockProcessorEv+0x160>
  4025a7:	53                   	push   %rbx
  4025a8:	8b 16                	mov    (%rsi),%edx
  4025aa:	81 fa ff 01 00 00    	cmp    $0x1ff,%edx
  4025b0:	0f 8f 2f 01 00 00    	jg     4026e5 <_ZN9CCounters13LockProcessorEv+0x175>
  4025b6:	48 69 d8 18 20 00 00 	imul   $0x2018,%rax,%rbx
  4025bd:	48 63 ca             	movslq %edx,%rcx
  4025c0:	83 c2 01             	add    $0x1,%edx
  4025c3:	48 c1 e1 04          	shl    $0x4,%rcx
  4025c7:	48 01 d9             	add    %rbx,%rcx
  4025ca:	4c 01 c1             	add    %r8,%rcx
  4025cd:	48 c7 41 60 09 00 00 	movq   $0x9,0x60(%rcx)
  4025d4:	00 
  4025d5:	44 89 59 68          	mov    %r11d,0x68(%rcx)
  4025d9:	c7 41 6c 00 00 00 00 	movl   $0x0,0x6c(%rcx)
  4025e0:	8b 8e 00 30 40 00    	mov    0x403000(%rsi),%ecx
  4025e6:	89 16                	mov    %edx,(%rsi)
  4025e8:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
  4025ee:	0f 8f 0c 01 00 00    	jg     402700 <_ZN9CCounters13LockProcessorEv+0x190>
  4025f4:	48 69 d0 18 20 00 00 	imul   $0x2018,%rax,%rdx
  4025fb:	48 63 d9             	movslq %ecx,%rbx
  4025fe:	83 c1 01             	add    $0x1,%ecx
  402601:	48 c1 e3 04          	shl    $0x4,%rbx
  402605:	48 01 da             	add    %rbx,%rdx
  402608:	4c 01 c2             	add    %r8,%rdx
  40260b:	48 c7 82 60 30 40 00 	movq   $0x9,0x403060(%rdx)
  402612:	09 00 00 00 
  402616:	44 89 9a 68 30 40 00 	mov    %r11d,0x403068(%rdx)
  40261d:	c7 82 6c 30 40 00 00 	movl   $0x0,0x40306c(%rdx)
  402624:	00 00 00 
  402627:	8b 16                	mov    (%rsi),%edx
  402629:	89 8e 00 30 40 00    	mov    %ecx,0x403000(%rsi)
  40262f:	81 fa ff 01 00 00    	cmp    $0x1ff,%edx
  402635:	7f 29                	jg     402660 <_ZN9CCounters13LockProcessorEv+0xf0>
  402637:	48 69 d8 18 20 00 00 	imul   $0x2018,%rax,%rbx
  40263e:	4c 63 da             	movslq %edx,%r11
  402641:	83 c2 01             	add    $0x1,%edx
  402644:	49 c1 e3 04          	shl    $0x4,%r11
  402648:	49 01 db             	add    %rbx,%r11
  40264b:	4d 01 c3             	add    %r8,%r11
  40264e:	49 c7 43 60 06 00 00 	movq   $0x6,0x60(%r11)
  402655:	00 
  402656:	49 c7 43 68 00 00 00 	movq   $0x0,0x68(%r11)
  40265d:	00 
  40265e:	89 16                	mov    %edx,(%rsi)
  402660:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
  402666:	7f 33                	jg     40269b <_ZN9CCounters13LockProcessorEv+0x12b>
  402668:	48 69 c0 18 20 00 00 	imul   $0x2018,%rax,%rax
  40266f:	48 63 d1             	movslq %ecx,%rdx
  402672:	83 c1 01             	add    $0x1,%ecx
  402675:	48 c1 e2 04          	shl    $0x4,%rdx
  402679:	48 01 d0             	add    %rdx,%rax
  40267c:	4c 01 c0             	add    %r8,%rax
  40267f:	48 c7 80 60 30 40 00 	movq   $0x7,0x403060(%rax)
  402686:	07 00 00 00 
  40268a:	48 c7 80 68 30 40 00 	movq   $0x0,0x403068(%rax)
  402691:	00 00 00 00 
  402695:	89 8e 00 30 40 00    	mov    %ecx,0x403000(%rsi)
  40269b:	48 83 c7 01          	add    $0x1,%rdi
  40269f:	48 81 c6 18 20 00 00 	add    $0x2018,%rsi
  4026a6:	4c 39 cf             	cmp    %r9,%rdi
  4026a9:	74 20                	je     4026cb <_ZN9CCounters13LockProcessorEv+0x15b>
  4026ab:	45 8b 1c ba          	mov    (%r10,%rdi,4),%r11d
  4026af:	48 63 c7             	movslq %edi,%rax
  4026b2:	45 85 db             	test   %r11d,%r11d
  4026b5:	0f 89 ed fe ff ff    	jns    4025a8 <_ZN9CCounters13LockProcessorEv+0x38>
  4026bb:	48 83 c7 01          	add    $0x1,%rdi
  4026bf:	48 81 c6 18 20 00 00 	add    $0x2018,%rsi
  4026c6:	4c 39 cf             	cmp    %r9,%rdi
  4026c9:	75 e0                	jne    4026ab <_ZN9CCounters13LockProcessorEv+0x13b>
  4026cb:	5b                   	pop    %rbx
  4026cc:	c3                   	ret    
  4026cd:	0f 1f 00             	nopl   (%rax)
  4026d0:	48 83 c7 01          	add    $0x1,%rdi
  4026d4:	48 81 c6 18 20 00 00 	add    $0x2018,%rsi
  4026db:	4c 39 cf             	cmp    %r9,%rdi
  4026de:	0f 85 b3 fe ff ff    	jne    402597 <_ZN9CCounters13LockProcessorEv+0x27>
  4026e4:	c3                   	ret    
  4026e5:	8b 8e 00 30 40 00    	mov    0x403000(%rsi),%ecx
  4026eb:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
  4026f1:	0f 8e fd fe ff ff    	jle    4025f4 <_ZN9CCounters13LockProcessorEv+0x84>
  4026f7:	eb a2                	jmp    40269b <_ZN9CCounters13LockProcessorEv+0x12b>
  4026f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402700:	81 fa ff 01 00 00    	cmp    $0x1ff,%edx
  402706:	0f 8e 2b ff ff ff    	jle    402637 <_ZN9CCounters13LockProcessorEv+0xc7>
  40270c:	eb 8d                	jmp    40269b <_ZN9CCounters13LockProcessorEv+0x12b>
  40270e:	66 90                	xchg   %ax,%ax

0000000000402710 <_ZN9CCounters11StartDriverEv>:
  402710:	f3 0f 1e fa          	endbr64 
  402714:	8b 05 fe d6 00 00    	mov    0xd6fe(%rip),%eax        # 40fe18 <UsePMC>
  40271a:	85 c0                	test   %eax,%eax
  40271c:	75 0a                	jne    402728 <_ZN9CCounters11StartDriverEv+0x18>
  40271e:	31 c0                	xor    %eax,%eax
  402720:	c3                   	ret    
  402721:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402728:	53                   	push   %rbx
  402729:	48 89 fb             	mov    %rdi,%rbx
  40272c:	48 8b 3f             	mov    (%rdi),%rdi
  40272f:	31 f6                	xor    %esi,%esi
  402731:	31 c0                	xor    %eax,%eax
  402733:	e8 38 e9 ff ff       	call   401070 <open@plt>
  402738:	89 43 08             	mov    %eax,0x8(%rbx)
  40273b:	83 f8 ff             	cmp    $0xffffffff,%eax
  40273e:	74 08                	je     402748 <_ZN9CCounters11StartDriverEv+0x38>
  402740:	31 c0                	xor    %eax,%eax
  402742:	5b                   	pop    %rbx
  402743:	c3                   	ret    
  402744:	0f 1f 40 00          	nopl   0x0(%rax)
  402748:	48 8b 13             	mov    (%rbx),%rdx
  40274b:	48 8d 35 7a 5d 00 00 	lea    0x5d7a(%rip),%rsi        # 4084cc <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x8c>
  402752:	bf 01 00 00 00       	mov    $0x1,%edi
  402757:	31 c0                	xor    %eax,%eax
  402759:	e8 d2 e8 ff ff       	call   401030 <__printf_chk@plt>
  40275e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%rbx)
  402765:	b8 01 00 00 00       	mov    $0x1,%eax
  40276a:	5b                   	pop    %rbx
  40276b:	c3                   	ret    
  40276c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402770 <_ZN9CCounters7CleanUpEv>:
  402770:	f3 0f 1e fa          	endbr64 
  402774:	41 57                	push   %r15
  402776:	41 56                	push   %r14
  402778:	41 55                	push   %r13
  40277a:	41 54                	push   %r12
  40277c:	55                   	push   %rbp
  40277d:	48 63 2d 9c d6 00 00 	movslq 0xd69c(%rip),%rbp        # 40fe20 <NumThreads>
  402784:	53                   	push   %rbx
  402785:	85 ed                	test   %ebp,%ebp
  402787:	0f 8e 13 02 00 00    	jle    4029a0 <_ZN9CCounters7CleanUpEv+0x230>
  40278d:	4c 8d 05 b0 db 80 00 	lea    0x80dbb0(%rip),%r8        # c10344 <MSRCounters+0x64>
  402794:	44 8b 77 58          	mov    0x58(%rdi),%r14d
  402798:	49 89 fc             	mov    %rdi,%r12
  40279b:	f2 0f 10 0d 05 5f 00 	movsd  0x5f05(%rip),%xmm1        # 4086a8 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x268>
  4027a2:	00 
  4027a3:	4d 8d 58 fc          	lea    -0x4(%r8),%r11
  4027a7:	31 ff                	xor    %edi,%edi
  4027a9:	4c 8d 2d b0 3b 01 01 	lea    0x1013bb0(%rip),%r13        # 1416360 <clockFactor>
  4027b0:	eb 28                	jmp    4027da <_ZN9CCounters7CleanUpEv+0x6a>
  4027b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4027b8:	f2 41 0f 11 44 fd 00 	movsd  %xmm0,0x0(%r13,%rdi,8)
  4027bf:	48 83 c7 01          	add    $0x1,%rdi
  4027c3:	49 81 c0 18 20 00 00 	add    $0x2018,%r8
  4027ca:	49 81 c3 18 20 00 00 	add    $0x2018,%r11
  4027d1:	48 39 ef             	cmp    %rbp,%rdi
  4027d4:	0f 84 c6 01 00 00    	je     4029a0 <_ZN9CCounters7CleanUpEv+0x230>
  4027da:	48 63 f7             	movslq %edi,%rsi
  4027dd:	66 0f 28 c1          	movapd %xmm1,%xmm0
  4027e1:	41 81 fe 00 20 00 00 	cmp    $0x2000,%r14d
  4027e8:	75 ce                	jne    4027b8 <_ZN9CCounters7CleanUpEv+0x48>
  4027ea:	41 8b 90 0c 50 40 00 	mov    0x40500c(%r8),%edx
  4027f1:	41 8b 9c 24 70 60 80 	mov    0x806070(%r12),%ebx
  4027f8:	00 
  4027f9:	85 d2                	test   %edx,%edx
  4027fb:	0f 8e aa 01 00 00    	jle    4029ab <_ZN9CCounters7CleanUpEv+0x23b>
  402801:	4c 89 c0             	mov    %r8,%rax
  402804:	31 c9                	xor    %ecx,%ecx
  402806:	eb 17                	jmp    40281f <_ZN9CCounters7CleanUpEv+0xaf>
  402808:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40280f:	00 
  402810:	83 c1 01             	add    $0x1,%ecx
  402813:	48 83 c0 10          	add    $0x10,%rax
  402817:	39 d1                	cmp    %edx,%ecx
  402819:	0f 84 51 01 00 00    	je     402970 <_ZN9CCounters7CleanUpEv+0x200>
  40281f:	83 b8 fc 2f 40 00 02 	cmpl   $0x2,0x402ffc(%rax)
  402826:	75 e8                	jne    402810 <_ZN9CCounters7CleanUpEv+0xa0>
  402828:	3b 18                	cmp    (%rax),%ebx
  40282a:	75 e4                	jne    402810 <_ZN9CCounters7CleanUpEv+0xa0>
  40282c:	48 63 c6             	movslq %esi,%rax
  40282f:	48 63 c9             	movslq %ecx,%rcx
  402832:	48 69 c0 18 20 00 00 	imul   $0x2018,%rax,%rax
  402839:	48 c1 e1 04          	shl    $0x4,%rcx
  40283d:	48 01 c8             	add    %rcx,%rax
  402840:	48 8d 0d 99 da 80 00 	lea    0x80da99(%rip),%rcx        # c102e0 <MSRCounters>
  402847:	4c 8b 8c 01 68 30 40 	mov    0x403068(%rcx,%rax,1),%r9
  40284e:	00 
  40284f:	41 8b 88 0c 20 00 00 	mov    0x200c(%r8),%ecx
  402856:	45 8b 94 24 74 60 80 	mov    0x806074(%r12),%r10d
  40285d:	00 
  40285e:	85 c9                	test   %ecx,%ecx
  402860:	7e 51                	jle    4028b3 <_ZN9CCounters7CleanUpEv+0x143>
  402862:	4c 89 d8             	mov    %r11,%rax
  402865:	45 31 ff             	xor    %r15d,%r15d
  402868:	eb 17                	jmp    402881 <_ZN9CCounters7CleanUpEv+0x111>
  40286a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402870:	41 83 c7 01          	add    $0x1,%r15d
  402874:	48 83 c0 10          	add    $0x10,%rax
  402878:	41 39 cf             	cmp    %ecx,%r15d
  40287b:	0f 84 ff 00 00 00    	je     402980 <_ZN9CCounters7CleanUpEv+0x210>
  402881:	83 38 02             	cmpl   $0x2,(%rax)
  402884:	75 ea                	jne    402870 <_ZN9CCounters7CleanUpEv+0x100>
  402886:	3b 58 04             	cmp    0x4(%rax),%ebx
  402889:	75 e5                	jne    402870 <_ZN9CCounters7CleanUpEv+0x100>
  40288b:	48 63 c6             	movslq %esi,%rax
  40288e:	4d 63 ff             	movslq %r15d,%r15
  402891:	48 69 c0 18 20 00 00 	imul   $0x2018,%rax,%rax
  402898:	49 c1 e7 04          	shl    $0x4,%r15
  40289c:	49 01 c7             	add    %rax,%r15
  40289f:	48 8d 05 3a da 80 00 	lea    0x80da3a(%rip),%rax        # c102e0 <MSRCounters>
  4028a6:	4e 2b 4c 38 68       	sub    0x68(%rax,%r15,1),%r9
  4028ab:	85 d2                	test   %edx,%edx
  4028ad:	0f 8e d5 00 00 00    	jle    402988 <_ZN9CCounters7CleanUpEv+0x218>
  4028b3:	4c 89 c0             	mov    %r8,%rax
  4028b6:	31 db                	xor    %ebx,%ebx
  4028b8:	eb 15                	jmp    4028cf <_ZN9CCounters7CleanUpEv+0x15f>
  4028ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4028c0:	83 c3 01             	add    $0x1,%ebx
  4028c3:	48 83 c0 10          	add    $0x10,%rax
  4028c7:	39 d3                	cmp    %edx,%ebx
  4028c9:	0f 8d c1 00 00 00    	jge    402990 <_ZN9CCounters7CleanUpEv+0x220>
  4028cf:	83 b8 fc 2f 40 00 02 	cmpl   $0x2,0x402ffc(%rax)
  4028d6:	75 e8                	jne    4028c0 <_ZN9CCounters7CleanUpEv+0x150>
  4028d8:	44 3b 10             	cmp    (%rax),%r10d
  4028db:	75 e3                	jne    4028c0 <_ZN9CCounters7CleanUpEv+0x150>
  4028dd:	48 63 c6             	movslq %esi,%rax
  4028e0:	48 63 db             	movslq %ebx,%rbx
  4028e3:	48 69 c0 18 20 00 00 	imul   $0x2018,%rax,%rax
  4028ea:	48 c1 e3 04          	shl    $0x4,%rbx
  4028ee:	48 01 d8             	add    %rbx,%rax
  4028f1:	48 8d 1d e8 d9 80 00 	lea    0x80d9e8(%rip),%rbx        # c102e0 <MSRCounters>
  4028f8:	48 8b 9c 03 68 30 40 	mov    0x403068(%rbx,%rax,1),%rbx
  4028ff:	00 
  402900:	85 c9                	test   %ecx,%ecx
  402902:	7e 5c                	jle    402960 <_ZN9CCounters7CleanUpEv+0x1f0>
  402904:	4c 89 d8             	mov    %r11,%rax
  402907:	31 d2                	xor    %edx,%edx
  402909:	eb 10                	jmp    40291b <_ZN9CCounters7CleanUpEv+0x1ab>
  40290b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402910:	83 c2 01             	add    $0x1,%edx
  402913:	48 83 c0 10          	add    $0x10,%rax
  402917:	39 ca                	cmp    %ecx,%edx
  402919:	7d 45                	jge    402960 <_ZN9CCounters7CleanUpEv+0x1f0>
  40291b:	83 38 02             	cmpl   $0x2,(%rax)
  40291e:	75 f0                	jne    402910 <_ZN9CCounters7CleanUpEv+0x1a0>
  402920:	44 39 50 04          	cmp    %r10d,0x4(%rax)
  402924:	75 ea                	jne    402910 <_ZN9CCounters7CleanUpEv+0x1a0>
  402926:	48 69 f6 18 20 00 00 	imul   $0x2018,%rsi,%rsi
  40292d:	48 63 d2             	movslq %edx,%rdx
  402930:	66 0f ef c0          	pxor   %xmm0,%xmm0
  402934:	48 c1 e2 04          	shl    $0x4,%rdx
  402938:	48 8d 04 32          	lea    (%rdx,%rsi,1),%rax
  40293c:	48 8d 35 9d d9 80 00 	lea    0x80d99d(%rip),%rsi        # c102e0 <MSRCounters>
  402943:	48 2b 5c 06 68       	sub    0x68(%rsi,%rax,1),%rbx
  402948:	f2 48 0f 2a c3       	cvtsi2sd %rbx,%xmm0
  40294d:	66 0f ef d2          	pxor   %xmm2,%xmm2
  402951:	f2 49 0f 2a d1       	cvtsi2sd %r9,%xmm2
  402956:	f2 0f 5e c2          	divsd  %xmm2,%xmm0
  40295a:	e9 59 fe ff ff       	jmp    4027b8 <_ZN9CCounters7CleanUpEv+0x48>
  40295f:	90                   	nop
  402960:	66 0f ef c0          	pxor   %xmm0,%xmm0
  402964:	f2 48 0f 2a c3       	cvtsi2sd %rbx,%xmm0
  402969:	eb e2                	jmp    40294d <_ZN9CCounters7CleanUpEv+0x1dd>
  40296b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402970:	45 31 c9             	xor    %r9d,%r9d
  402973:	e9 d7 fe ff ff       	jmp    40284f <_ZN9CCounters7CleanUpEv+0xdf>
  402978:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40297f:	00 
  402980:	85 d2                	test   %edx,%edx
  402982:	0f 8f 2b ff ff ff    	jg     4028b3 <_ZN9CCounters7CleanUpEv+0x143>
  402988:	31 db                	xor    %ebx,%ebx
  40298a:	e9 75 ff ff ff       	jmp    402904 <_ZN9CCounters7CleanUpEv+0x194>
  40298f:	90                   	nop
  402990:	31 db                	xor    %ebx,%ebx
  402992:	e9 69 ff ff ff       	jmp    402900 <_ZN9CCounters7CleanUpEv+0x190>
  402997:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40299e:	00 00 
  4029a0:	5b                   	pop    %rbx
  4029a1:	5d                   	pop    %rbp
  4029a2:	41 5c                	pop    %r12
  4029a4:	41 5d                	pop    %r13
  4029a6:	41 5e                	pop    %r14
  4029a8:	41 5f                	pop    %r15
  4029aa:	c3                   	ret    
  4029ab:	41 8b 88 0c 20 00 00 	mov    0x200c(%r8),%ecx
  4029b2:	45 8b 94 24 74 60 80 	mov    0x806074(%r12),%r10d
  4029b9:	00 
  4029ba:	45 31 c9             	xor    %r9d,%r9d
  4029bd:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4029c1:	85 c9                	test   %ecx,%ecx
  4029c3:	0f 8f 99 fe ff ff    	jg     402862 <_ZN9CCounters7CleanUpEv+0xf2>
  4029c9:	eb 82                	jmp    40294d <_ZN9CCounters7CleanUpEv+0x1dd>
  4029cb:	90                   	nop
  4029cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004029d0 <_ZN9CCounters4Put1Ei12EMSR_COMMANDjjj>:
  4029d0:	f3 0f 1e fa          	endbr64 
  4029d4:	85 f6                	test   %esi,%esi
  4029d6:	7e 68                	jle    402a40 <_ZN9CCounters4Put1Ei12EMSR_COMMANDjjj+0x70>
  4029d8:	55                   	push   %rbp
  4029d9:	49 89 fa             	mov    %rdi,%r10
  4029dc:	41 89 f3             	mov    %esi,%r11d
  4029df:	89 cd                	mov    %ecx,%ebp
  4029e1:	53                   	push   %rbx
  4029e2:	48 8d bf 70 20 00 00 	lea    0x2070(%rdi),%rdi
  4029e9:	89 d3                	mov    %edx,%ebx
  4029eb:	31 f6                	xor    %esi,%esi
  4029ed:	0f 1f 00             	nopl   (%rax)
  4029f0:	8b 17                	mov    (%rdi),%edx
  4029f2:	81 fa ff 01 00 00    	cmp    $0x1ff,%edx
  4029f8:	7f 2a                	jg     402a24 <_ZN9CCounters4Put1Ei12EMSR_COMMANDjjj+0x54>
  4029fa:	48 63 ce             	movslq %esi,%rcx
  4029fd:	48 63 c2             	movslq %edx,%rax
  402a00:	83 c2 01             	add    $0x1,%edx
  402a03:	48 69 c9 18 20 00 00 	imul   $0x2018,%rcx,%rcx
  402a0a:	48 c1 e0 04          	shl    $0x4,%rax
  402a0e:	48 01 c8             	add    %rcx,%rax
  402a11:	4c 01 d0             	add    %r10,%rax
  402a14:	89 58 60             	mov    %ebx,0x60(%rax)
  402a17:	89 68 64             	mov    %ebp,0x64(%rax)
  402a1a:	44 89 40 68          	mov    %r8d,0x68(%rax)
  402a1e:	44 89 48 6c          	mov    %r9d,0x6c(%rax)
  402a22:	89 17                	mov    %edx,(%rdi)
  402a24:	83 c6 01             	add    $0x1,%esi
  402a27:	48 81 c7 18 20 00 00 	add    $0x2018,%rdi
  402a2e:	41 39 f3             	cmp    %esi,%r11d
  402a31:	75 bd                	jne    4029f0 <_ZN9CCounters4Put1Ei12EMSR_COMMANDjjj+0x20>
  402a33:	5b                   	pop    %rbx
  402a34:	5d                   	pop    %rbp
  402a35:	c3                   	ret    
  402a36:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  402a3d:	00 00 00 
  402a40:	c3                   	ret    
  402a41:	90                   	nop
  402a42:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  402a49:	00 00 00 00 
  402a4d:	0f 1f 00             	nopl   (%rax)

0000000000402a50 <_ZN9CCounters4Put2Ei12EMSR_COMMANDjjj>:
  402a50:	f3 0f 1e fa          	endbr64 
  402a54:	85 f6                	test   %esi,%esi
  402a56:	7e 70                	jle    402ac8 <_ZN9CCounters4Put2Ei12EMSR_COMMANDjjj+0x78>
  402a58:	55                   	push   %rbp
  402a59:	49 89 fa             	mov    %rdi,%r10
  402a5c:	41 89 f3             	mov    %esi,%r11d
  402a5f:	89 cd                	mov    %ecx,%ebp
  402a61:	53                   	push   %rbx
  402a62:	48 8d bf 70 50 40 00 	lea    0x405070(%rdi),%rdi
  402a69:	89 d3                	mov    %edx,%ebx
  402a6b:	31 f6                	xor    %esi,%esi
  402a6d:	0f 1f 00             	nopl   (%rax)
  402a70:	8b 17                	mov    (%rdi),%edx
  402a72:	81 fa ff 01 00 00    	cmp    $0x1ff,%edx
  402a78:	7f 36                	jg     402ab0 <_ZN9CCounters4Put2Ei12EMSR_COMMANDjjj+0x60>
  402a7a:	48 63 ce             	movslq %esi,%rcx
  402a7d:	48 63 c2             	movslq %edx,%rax
  402a80:	83 c2 01             	add    $0x1,%edx
  402a83:	48 69 c9 18 20 00 00 	imul   $0x2018,%rcx,%rcx
  402a8a:	48 c1 e0 04          	shl    $0x4,%rax
  402a8e:	48 01 c8             	add    %rcx,%rax
  402a91:	4c 01 d0             	add    %r10,%rax
  402a94:	89 98 60 30 40 00    	mov    %ebx,0x403060(%rax)
  402a9a:	89 a8 64 30 40 00    	mov    %ebp,0x403064(%rax)
  402aa0:	44 89 80 68 30 40 00 	mov    %r8d,0x403068(%rax)
  402aa7:	44 89 88 6c 30 40 00 	mov    %r9d,0x40306c(%rax)
  402aae:	89 17                	mov    %edx,(%rdi)
  402ab0:	83 c6 01             	add    $0x1,%esi
  402ab3:	48 81 c7 18 20 00 00 	add    $0x2018,%rdi
  402aba:	41 39 f3             	cmp    %esi,%r11d
  402abd:	75 b1                	jne    402a70 <_ZN9CCounters4Put2Ei12EMSR_COMMANDjjj+0x20>
  402abf:	5b                   	pop    %rbx
  402ac0:	5d                   	pop    %rbp
  402ac1:	c3                   	ret    
  402ac2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402ac8:	c3                   	ret    
  402ac9:	90                   	nop
  402aca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000402ad0 <_ZN9CCounters5read1Eji>:
  402ad0:	f3 0f 1e fa          	endbr64 
  402ad4:	48 63 d2             	movslq %edx,%rdx
  402ad7:	48 69 c2 18 20 00 00 	imul   $0x2018,%rdx,%rax
  402ade:	44 8b 84 07 70 20 00 	mov    0x2070(%rdi,%rax,1),%r8d
  402ae5:	00 
  402ae6:	45 85 c0             	test   %r8d,%r8d
  402ae9:	7e 45                	jle    402b30 <_ZN9CCounters5read1Eji+0x60>
  402aeb:	48 8d 44 07 60       	lea    0x60(%rdi,%rax,1),%rax
  402af0:	31 c9                	xor    %ecx,%ecx
  402af2:	eb 10                	jmp    402b04 <_ZN9CCounters5read1Eji+0x34>
  402af4:	0f 1f 40 00          	nopl   0x0(%rax)
  402af8:	83 c1 01             	add    $0x1,%ecx
  402afb:	48 83 c0 10          	add    $0x10,%rax
  402aff:	44 39 c1             	cmp    %r8d,%ecx
  402b02:	74 2c                	je     402b30 <_ZN9CCounters5read1Eji+0x60>
  402b04:	83 38 02             	cmpl   $0x2,(%rax)
  402b07:	75 ef                	jne    402af8 <_ZN9CCounters5read1Eji+0x28>
  402b09:	39 70 04             	cmp    %esi,0x4(%rax)
  402b0c:	75 ea                	jne    402af8 <_ZN9CCounters5read1Eji+0x28>
  402b0e:	48 69 d2 18 20 00 00 	imul   $0x2018,%rdx,%rdx
  402b15:	48 63 c9             	movslq %ecx,%rcx
  402b18:	48 c1 e1 04          	shl    $0x4,%rcx
  402b1c:	48 8d 04 11          	lea    (%rcx,%rdx,1),%rax
  402b20:	48 8b 44 07 68       	mov    0x68(%rdi,%rax,1),%rax
  402b25:	c3                   	ret    
  402b26:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  402b2d:	00 00 00 
  402b30:	31 c0                	xor    %eax,%eax
  402b32:	c3                   	ret    
  402b33:	90                   	nop
  402b34:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  402b3b:	00 00 00 00 
  402b3f:	90                   	nop

0000000000402b40 <_ZN9CCounters5read2Eji>:
  402b40:	f3 0f 1e fa          	endbr64 
  402b44:	48 63 d2             	movslq %edx,%rdx
  402b47:	48 69 c2 18 20 00 00 	imul   $0x2018,%rdx,%rax
  402b4e:	44 8b 84 07 70 50 40 	mov    0x405070(%rdi,%rax,1),%r8d
  402b55:	00 
  402b56:	45 85 c0             	test   %r8d,%r8d
  402b59:	7e 45                	jle    402ba0 <_ZN9CCounters5read2Eji+0x60>
  402b5b:	48 8d 44 07 64       	lea    0x64(%rdi,%rax,1),%rax
  402b60:	31 c9                	xor    %ecx,%ecx
  402b62:	eb 10                	jmp    402b74 <_ZN9CCounters5read2Eji+0x34>
  402b64:	0f 1f 40 00          	nopl   0x0(%rax)
  402b68:	83 c1 01             	add    $0x1,%ecx
  402b6b:	48 83 c0 10          	add    $0x10,%rax
  402b6f:	44 39 c1             	cmp    %r8d,%ecx
  402b72:	74 2c                	je     402ba0 <_ZN9CCounters5read2Eji+0x60>
  402b74:	83 b8 fc 2f 40 00 02 	cmpl   $0x2,0x402ffc(%rax)
  402b7b:	75 eb                	jne    402b68 <_ZN9CCounters5read2Eji+0x28>
  402b7d:	39 30                	cmp    %esi,(%rax)
  402b7f:	75 e7                	jne    402b68 <_ZN9CCounters5read2Eji+0x28>
  402b81:	48 69 d2 18 20 00 00 	imul   $0x2018,%rdx,%rdx
  402b88:	48 63 c9             	movslq %ecx,%rcx
  402b8b:	48 c1 e1 04          	shl    $0x4,%rcx
  402b8f:	48 8d 04 11          	lea    (%rcx,%rdx,1),%rax
  402b93:	48 8b 84 07 68 30 40 	mov    0x403068(%rdi,%rax,1),%rax
  402b9a:	00 
  402b9b:	c3                   	ret    
  402b9c:	0f 1f 40 00          	nopl   0x0(%rax)
  402ba0:	31 c0                	xor    %eax,%eax
  402ba2:	c3                   	ret    
  402ba3:	90                   	nop
  402ba4:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  402bab:	00 00 00 00 
  402baf:	90                   	nop

0000000000402bb0 <_ZN9CCounters13StartCountersEi>:
  402bb0:	f3 0f 1e fa          	endbr64 
  402bb4:	8b 05 5e d2 00 00    	mov    0xd25e(%rip),%eax        # 40fe18 <UsePMC>
  402bba:	85 c0                	test   %eax,%eax
  402bbc:	75 02                	jne    402bc0 <_ZN9CCounters13StartCountersEi+0x10>
  402bbe:	c3                   	ret    
  402bbf:	90                   	nop
  402bc0:	48 63 f6             	movslq %esi,%rsi
  402bc3:	48 69 f6 18 20 00 00 	imul   $0x2018,%rsi,%rsi
  402bca:	8b 84 37 70 20 00 00 	mov    0x2070(%rdi,%rsi,1),%eax
  402bd1:	c1 e0 04             	shl    $0x4,%eax
  402bd4:	85 c0                	test   %eax,%eax
  402bd6:	7e e6                	jle    402bbe <_ZN9CCounters13StartCountersEi+0xe>
  402bd8:	48 8d 54 37 60       	lea    0x60(%rdi,%rsi,1),%rdx
  402bdd:	8b 7f 08             	mov    0x8(%rdi),%edi
  402be0:	85 ff                	test   %edi,%edi
  402be2:	74 da                	je     402bbe <_ZN9CCounters13StartCountersEi+0xe>
  402be4:	be 01 f9 00 00       	mov    $0xf901,%esi
  402be9:	31 c0                	xor    %eax,%eax
  402beb:	e9 30 e5 ff ff       	jmp    401120 <ioctl@plt>

0000000000402bf0 <_ZN9CCounters12StopCountersEi>:
  402bf0:	f3 0f 1e fa          	endbr64 
  402bf4:	8b 05 1e d2 00 00    	mov    0xd21e(%rip),%eax        # 40fe18 <UsePMC>
  402bfa:	85 c0                	test   %eax,%eax
  402bfc:	75 02                	jne    402c00 <_ZN9CCounters12StopCountersEi+0x10>
  402bfe:	c3                   	ret    
  402bff:	90                   	nop
  402c00:	48 63 f6             	movslq %esi,%rsi
  402c03:	48 69 f6 18 20 00 00 	imul   $0x2018,%rsi,%rsi
  402c0a:	8b 84 37 70 50 40 00 	mov    0x405070(%rdi,%rsi,1),%eax
  402c11:	c1 e0 04             	shl    $0x4,%eax
  402c14:	85 c0                	test   %eax,%eax
  402c16:	7e e6                	jle    402bfe <_ZN9CCounters12StopCountersEi+0xe>
  402c18:	48 8d 94 37 60 30 40 	lea    0x403060(%rdi,%rsi,1),%rdx
  402c1f:	00 
  402c20:	8b 7f 08             	mov    0x8(%rdi),%edi
  402c23:	85 ff                	test   %edi,%edi
  402c25:	74 d7                	je     402bfe <_ZN9CCounters12StopCountersEi+0xe>
  402c27:	be 01 f9 00 00       	mov    $0xf901,%esi
  402c2c:	31 c0                	xor    %eax,%eax
  402c2e:	e9 ed e4 ff ff       	jmp    401120 <ioctl@plt>
  402c33:	90                   	nop
  402c34:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  402c3b:	00 00 00 00 
  402c3f:	90                   	nop

0000000000402c40 <_ZN9CCounters18GetProcessorVendorEv>:
  402c40:	f3 0f 1e fa          	endbr64 
  402c44:	31 c0                	xor    %eax,%eax
  402c46:	53                   	push   %rbx
  402c47:	89 c1                	mov    %eax,%ecx
  402c49:	0f a2                	cpuid  
  402c4b:	81 f9 6e 74 65 6c    	cmp    $0x6c65746e,%ecx
  402c51:	74 35                	je     402c88 <_ZN9CCounters18GetProcessorVendorEv+0x48>
  402c53:	31 c0                	xor    %eax,%eax
  402c55:	81 f9 63 41 4d 44    	cmp    $0x444d4163,%ecx
  402c5b:	0f 94 c0             	sete   %al
  402c5e:	01 c0                	add    %eax,%eax
  402c60:	89 47 50             	mov    %eax,0x50(%rdi)
  402c63:	ba 03 00 00 00       	mov    $0x3,%edx
  402c68:	81 fb 43 65 6e 74    	cmp    $0x746e6543,%ebx
  402c6e:	74 03                	je     402c73 <_ZN9CCounters18GetProcessorVendorEv+0x33>
  402c70:	8b 57 50             	mov    0x50(%rdi),%edx
  402c73:	8b 05 77 9d 01 01    	mov    0x1019d77(%rip),%eax        # 141c9f0 <diagnostics>
  402c79:	89 57 50             	mov    %edx,0x50(%rdi)
  402c7c:	85 c0                	test   %eax,%eax
  402c7e:	75 18                	jne    402c98 <_ZN9CCounters18GetProcessorVendorEv+0x58>
  402c80:	5b                   	pop    %rbx
  402c81:	c3                   	ret    
  402c82:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402c88:	c7 47 50 01 00 00 00 	movl   $0x1,0x50(%rdi)
  402c8f:	eb d2                	jmp    402c63 <_ZN9CCounters18GetProcessorVendorEv+0x23>
  402c91:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402c98:	48 8d 35 45 58 00 00 	lea    0x5845(%rip),%rsi        # 4084e4 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0xa4>
  402c9f:	bf 01 00 00 00       	mov    $0x1,%edi
  402ca4:	31 c0                	xor    %eax,%eax
  402ca6:	5b                   	pop    %rbx
  402ca7:	e9 84 e3 ff ff       	jmp    401030 <__printf_chk@plt>
  402cac:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402cb0 <_ZN9CCounters18GetProcessorFamilyEv>:
  402cb0:	f3 0f 1e fa          	endbr64 
  402cb4:	31 c0                	xor    %eax,%eax
  402cb6:	53                   	push   %rbx
  402cb7:	89 c1                	mov    %eax,%ecx
  402cb9:	c7 47 54 00 00 00 00 	movl   $0x0,0x54(%rdi)
  402cc0:	0f a2                	cpuid  
  402cc2:	85 c0                	test   %eax,%eax
  402cc4:	74 0a                	je     402cd0 <_ZN9CCounters18GetProcessorFamilyEv+0x20>
  402cc6:	5b                   	pop    %rbx
  402cc7:	e9 04 f2 ff ff       	jmp    401ed0 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0>
  402ccc:	0f 1f 40 00          	nopl   0x0(%rax)
  402cd0:	5b                   	pop    %rbx
  402cd1:	c3                   	ret    
  402cd2:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  402cd9:	00 00 00 00 
  402cdd:	0f 1f 00             	nopl   (%rax)

0000000000402ce0 <_ZN9CCounters12GetPMCSchemeEv>:
  402ce0:	f3 0f 1e fa          	endbr64 
  402ce4:	55                   	push   %rbp
  402ce5:	48 89 fd             	mov    %rdi,%rbp
  402ce8:	53                   	push   %rbx
  402ce9:	48 83 ec 08          	sub    $0x8,%rsp
  402ced:	8b 47 50             	mov    0x50(%rdi),%eax
  402cf0:	c7 47 58 00 00 00 00 	movl   $0x0,0x58(%rdi)
  402cf7:	48 c7 87 64 60 80 00 	movq   $0x2,0x806064(%rdi)
  402cfe:	02 00 00 00 
  402d02:	83 f8 02             	cmp    $0x2,%eax
  402d05:	0f 84 f5 00 00 00    	je     402e00 <_ZN9CCounters12GetPMCSchemeEv+0x120>
  402d0b:	83 f8 03             	cmp    $0x3,%eax
  402d0e:	75 38                	jne    402d48 <_ZN9CCounters12GetPMCSchemeEv+0x68>
  402d10:	c7 47 58 00 00 10 00 	movl   $0x100000,0x58(%rdi)
  402d17:	8b 05 d3 9c 01 01    	mov    0x1019cd3(%rip),%eax        # 141c9f0 <diagnostics>
  402d1d:	85 c0                	test   %eax,%eax
  402d1f:	0f 84 cf 00 00 00    	je     402df4 <_ZN9CCounters12GetPMCSchemeEv+0x114>
  402d25:	8b 55 58             	mov    0x58(%rbp),%edx
  402d28:	48 83 c4 08          	add    $0x8,%rsp
  402d2c:	48 8d 35 dc 57 00 00 	lea    0x57dc(%rip),%rsi        # 40850f <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0xcf>
  402d33:	31 c0                	xor    %eax,%eax
  402d35:	5b                   	pop    %rbx
  402d36:	bf 01 00 00 00       	mov    $0x1,%edi
  402d3b:	5d                   	pop    %rbp
  402d3c:	e9 ef e2 ff ff       	jmp    401030 <__printf_chk@plt>
  402d41:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402d48:	83 f8 01             	cmp    $0x1,%eax
  402d4b:	75 ca                	jne    402d17 <_ZN9CCounters12GetPMCSchemeEv+0x37>
  402d4d:	31 f6                	xor    %esi,%esi
  402d4f:	89 f0                	mov    %esi,%eax
  402d51:	89 f1                	mov    %esi,%ecx
  402d53:	0f a2                	cpuid  
  402d55:	83 f8 09             	cmp    $0x9,%eax
  402d58:	7e 66                	jle    402dc0 <_ZN9CCounters12GetPMCSchemeEv+0xe0>
  402d5a:	b8 0a 00 00 00       	mov    $0xa,%eax
  402d5f:	89 f1                	mov    %esi,%ecx
  402d61:	0f a2                	cpuid  
  402d63:	89 c1                	mov    %eax,%ecx
  402d65:	81 e1 ff 00 00 00    	and    $0xff,%ecx
  402d6b:	74 53                	je     402dc0 <_ZN9CCounters12GetPMCSchemeEv+0xe0>
  402d6d:	83 e9 01             	sub    $0x1,%ecx
  402d70:	be 20 00 00 00       	mov    $0x20,%esi
  402d75:	83 e2 1f             	and    $0x1f,%edx
  402d78:	0f b6 c4             	movzbl %ah,%eax
  402d7b:	d3 e6                	shl    %cl,%esi
  402d7d:	89 75 58             	mov    %esi,0x58(%rbp)
  402d80:	89 97 68 60 80 00    	mov    %edx,0x806068(%rdi)
  402d86:	8b 15 64 9c 01 01    	mov    0x1019c64(%rip),%edx        # 141c9f0 <diagnostics>
  402d8c:	89 87 64 60 80 00    	mov    %eax,0x806064(%rdi)
  402d92:	85 f6                	test   %esi,%esi
  402d94:	74 30                	je     402dc6 <_ZN9CCounters12GetPMCSchemeEv+0xe6>
  402d96:	85 d2                	test   %edx,%edx
  402d98:	74 5a                	je     402df4 <_ZN9CCounters12GetPMCSchemeEv+0x114>
  402d9a:	8b 8d 68 60 80 00    	mov    0x806068(%rbp),%ecx
  402da0:	8b 95 64 60 80 00    	mov    0x806064(%rbp),%edx
  402da6:	48 8d 35 44 57 00 00 	lea    0x5744(%rip),%rsi        # 4084f1 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0xb1>
  402dad:	31 c0                	xor    %eax,%eax
  402daf:	bf 01 00 00 00       	mov    $0x1,%edi
  402db4:	e8 77 e2 ff ff       	call   401030 <__printf_chk@plt>
  402db9:	e9 67 ff ff ff       	jmp    402d25 <_ZN9CCounters12GetPMCSchemeEv+0x45>
  402dbe:	66 90                	xchg   %ax,%ax
  402dc0:	8b 15 2a 9c 01 01    	mov    0x1019c2a(%rip),%edx        # 141c9f0 <diagnostics>
  402dc6:	8b 45 54             	mov    0x54(%rbp),%eax
  402dc9:	83 f8 20             	cmp    $0x20,%eax
  402dcc:	0f 87 96 00 00 00    	ja     402e68 <_ZN9CCounters12GetPMCSchemeEv+0x188>
  402dd2:	85 c0                	test   %eax,%eax
  402dd4:	74 1a                	je     402df0 <_ZN9CCounters12GetPMCSchemeEv+0x110>
  402dd6:	83 f8 20             	cmp    $0x20,%eax
  402dd9:	77 15                	ja     402df0 <_ZN9CCounters12GetPMCSchemeEv+0x110>
  402ddb:	48 8d 0d a2 55 00 00 	lea    0x55a2(%rip),%rcx        # 408384 <_IO_stdin_used+0x384>
  402de2:	48 63 04 81          	movslq (%rcx,%rax,4),%rax
  402de6:	48 01 c8             	add    %rcx,%rax
  402de9:	3e ff e0             	notrack jmp *%rax
  402dec:	0f 1f 40 00          	nopl   0x0(%rax)
  402df0:	85 d2                	test   %edx,%edx
  402df2:	75 a6                	jne    402d9a <_ZN9CCounters12GetPMCSchemeEv+0xba>
  402df4:	48 83 c4 08          	add    $0x8,%rsp
  402df8:	5b                   	pop    %rbx
  402df9:	5d                   	pop    %rbp
  402dfa:	c3                   	ret    
  402dfb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402e00:	31 f6                	xor    %esi,%esi
  402e02:	b8 06 00 00 00       	mov    $0x6,%eax
  402e07:	c7 47 58 00 10 00 00 	movl   $0x1000,0x58(%rdi)
  402e0e:	c7 87 64 60 80 00 04 	movl   $0x4,0x806064(%rdi)
  402e15:	00 00 00 
  402e18:	89 f1                	mov    %esi,%ecx
  402e1a:	0f a2                	cpuid  
  402e1c:	83 e1 01             	and    $0x1,%ecx
  402e1f:	0f 84 f2 fe ff ff    	je     402d17 <_ZN9CCounters12GetPMCSchemeEv+0x37>
  402e25:	b8 01 00 00 80       	mov    $0x80000001,%eax
  402e2a:	89 f1                	mov    %esi,%ecx
  402e2c:	0f a2                	cpuid  
  402e2e:	81 e1 00 00 00 10    	and    $0x10000000,%ecx
  402e34:	0f 84 dd fe ff ff    	je     402d17 <_ZN9CCounters12GetPMCSchemeEv+0x37>
  402e3a:	48 b8 10 00 00 00 e8 	movabs $0xc00000e800000010,%rax
  402e41:	00 00 c0 
  402e44:	c7 47 58 00 20 00 00 	movl   $0x2000,0x58(%rdi)
  402e4b:	c7 87 64 60 80 00 06 	movl   $0x6,0x806064(%rdi)
  402e52:	00 00 00 
  402e55:	48 89 87 70 60 80 00 	mov    %rax,0x806070(%rdi)
  402e5c:	e9 b6 fe ff ff       	jmp    402d17 <_ZN9CCounters12GetPMCSchemeEv+0x37>
  402e61:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402e68:	8d 88 00 f0 ff ff    	lea    -0x1000(%rax),%ecx
  402e6e:	81 e1 ff ef ff ff    	and    $0xffffefff,%ecx
  402e74:	74 09                	je     402e7f <_ZN9CCounters12GetPMCSchemeEv+0x19f>
  402e76:	83 f8 40             	cmp    $0x40,%eax
  402e79:	0f 85 71 ff ff ff    	jne    402df0 <_ZN9CCounters12GetPMCSchemeEv+0x110>
  402e7f:	c7 45 58 80 00 00 00 	movl   $0x80,0x58(%rbp)
  402e86:	e9 0b ff ff ff       	jmp    402d96 <_ZN9CCounters12GetPMCSchemeEv+0xb6>
  402e8b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  402e90:	c7 45 58 10 00 00 00 	movl   $0x10,0x58(%rbp)
  402e97:	e9 fa fe ff ff       	jmp    402d96 <_ZN9CCounters12GetPMCSchemeEv+0xb6>
  402e9c:	c7 45 58 01 00 00 00 	movl   $0x1,0x58(%rbp)
  402ea3:	e9 ee fe ff ff       	jmp    402d96 <_ZN9CCounters12GetPMCSchemeEv+0xb6>
  402ea8:	c7 45 58 02 00 00 00 	movl   $0x2,0x58(%rbp)
  402eaf:	e9 e2 fe ff ff       	jmp    402d96 <_ZN9CCounters12GetPMCSchemeEv+0xb6>
  402eb4:	c7 45 58 40 00 00 00 	movl   $0x40,0x58(%rbp)
  402ebb:	e9 d6 fe ff ff       	jmp    402d96 <_ZN9CCounters12GetPMCSchemeEv+0xb6>
  402ec0:	c7 45 58 20 00 00 00 	movl   $0x20,0x58(%rbp)
  402ec7:	e9 ca fe ff ff       	jmp    402d96 <_ZN9CCounters12GetPMCSchemeEv+0xb6>
  402ecc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402ed0 <_ZN9CCounters13DefineCounterER18SCounterDefinition>:
  402ed0:	f3 0f 1e fa          	endbr64 
  402ed4:	41 57                	push   %r15
  402ed6:	4c 8d 05 bb 51 00 00 	lea    0x51bb(%rip),%r8        # 408098 <_IO_stdin_used+0x98>
  402edd:	41 56                	push   %r14
  402edf:	41 55                	push   %r13
  402ee1:	41 54                	push   %r12
  402ee3:	55                   	push   %rbp
  402ee4:	53                   	push   %rbx
  402ee5:	8b 5f 54             	mov    0x54(%rdi),%ebx
  402ee8:	89 da                	mov    %ebx,%edx
  402eea:	23 56 08             	and    0x8(%rsi),%edx
  402eed:	0f 84 88 00 00 00    	je     402f7b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xab>
  402ef3:	48 89 f8             	mov    %rdi,%rax
  402ef6:	8b 3d 0c cf 00 00    	mov    0xcf0c(%rip),%edi        # 40fe08 <NumCounters>
  402efc:	3b 3d 12 cf 00 00    	cmp    0xcf12(%rip),%edi        # 40fe14 <MaxNumCounters>
  402f02:	4c 8d 05 14 56 00 00 	lea    0x5614(%rip),%r8        # 40851d <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0xdd>
  402f09:	7d 70                	jge    402f7b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xab>
  402f0b:	8b 56 0c             	mov    0xc(%rsi),%edx
  402f0e:	f7 c2 00 00 00 40    	test   $0x40000000,%edx
  402f14:	0f 85 e6 00 00 00    	jne    403000 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x130>
  402f1a:	8b 6e 10             	mov    0x10(%rsi),%ebp
  402f1d:	39 ea                	cmp    %ebp,%edx
  402f1f:	0f 8f ab 08 00 00    	jg     4037d0 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x900>
  402f25:	8d 4f ff             	lea    -0x1(%rdi),%ecx
  402f28:	4c 8d 0d 0d cf 00 00 	lea    0xcf0d(%rip),%r9        # 40fe3c <Counters>
  402f2f:	4c 8d 2d 26 cf 00 00 	lea    0xcf26(%rip),%r13        # 40fe5c <EventRegistersUsed>
  402f36:	48 c1 e1 02          	shl    $0x2,%rcx
  402f3a:	4d 8d 41 04          	lea    0x4(%r9),%r8
  402f3e:	4d 8d 5d 04          	lea    0x4(%r13),%r11
  402f42:	49 01 c8             	add    %rcx,%r8
  402f45:	4c 8d 25 f4 54 00 00 	lea    0x54f4(%rip),%r12        # 408440 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables>
  402f4c:	49 01 cb             	add    %rcx,%r11
  402f4f:	4c 89 c9             	mov    %r9,%rcx
  402f52:	85 ff                	test   %edi,%edi
  402f54:	7f 13                	jg     402f69 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x99>
  402f56:	eb 38                	jmp    402f90 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xc0>
  402f58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402f5f:	00 
  402f60:	48 83 c1 04          	add    $0x4,%rcx
  402f64:	4c 39 c1             	cmp    %r8,%rcx
  402f67:	74 27                	je     402f90 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xc0>
  402f69:	39 11                	cmp    %edx,(%rcx)
  402f6b:	75 f3                	jne    402f60 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x90>
  402f6d:	83 c2 01             	add    $0x1,%edx
  402f70:	39 ea                	cmp    %ebp,%edx
  402f72:	7e db                	jle    402f4f <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x7f>
  402f74:	4c 8d 05 55 51 00 00 	lea    0x5155(%rip),%r8        # 4080d0 <_IO_stdin_used+0xd0>
  402f7b:	5b                   	pop    %rbx
  402f7c:	4c 89 c0             	mov    %r8,%rax
  402f7f:	5d                   	pop    %rbp
  402f80:	41 5c                	pop    %r12
  402f82:	41 5d                	pop    %r13
  402f84:	41 5e                	pop    %r14
  402f86:	41 5f                	pop    %r15
  402f88:	c3                   	ret    
  402f89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402f90:	83 fb 08             	cmp    $0x8,%ebx
  402f93:	0f 85 47 08 00 00    	jne    4037e0 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x910>
  402f99:	4c 63 56 14          	movslq 0x14(%rsi),%r10
  402f9d:	83 fa 11             	cmp    $0x11,%edx
  402fa0:	0f 87 55 0d 00 00    	ja     403cfb <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xe2b>
  402fa6:	8d 4a fd             	lea    -0x3(%rdx),%ecx
  402fa9:	83 fa 0f             	cmp    $0xf,%edx
  402fac:	0f 46 ca             	cmovbe %edx,%ecx
  402faf:	41 83 fa 07          	cmp    $0x7,%r10d
  402fb3:	0f 87 42 0d 00 00    	ja     403cfb <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xe2b>
  402fb9:	41 89 ce             	mov    %ecx,%r14d
  402fbc:	41 c1 ee 02          	shr    $0x2,%r14d
  402fc0:	4f 8d 14 f2          	lea    (%r10,%r14,8),%r10
  402fc4:	47 8b 14 94          	mov    (%r12,%r10,4),%r10d
  402fc8:	45 85 d2             	test   %r10d,%r10d
  402fcb:	78 0a                	js     402fd7 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x107>
  402fcd:	83 e1 02             	and    $0x2,%ecx
  402fd0:	83 f9 01             	cmp    $0x1,%ecx
  402fd3:	41 83 da ff          	sbb    $0xffffffff,%r10d
  402fd7:	85 ff                	test   %edi,%edi
  402fd9:	0f 8e 01 08 00 00    	jle    4037e0 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x910>
  402fdf:	4c 89 e9             	mov    %r13,%rcx
  402fe2:	eb 11                	jmp    402ff5 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x125>
  402fe4:	0f 1f 40 00          	nopl   0x0(%rax)
  402fe8:	48 83 c1 04          	add    $0x4,%rcx
  402fec:	4c 39 d9             	cmp    %r11,%rcx
  402fef:	0f 84 eb 07 00 00    	je     4037e0 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x910>
  402ff5:	44 39 11             	cmp    %r10d,(%rcx)
  402ff8:	75 ee                	jne    402fe8 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x118>
  402ffa:	e9 6e ff ff ff       	jmp    402f6d <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x9d>
  402fff:	90                   	nop
  403000:	48 8d 4e 20          	lea    0x20(%rsi),%rcx
  403004:	4c 63 d7             	movslq %edi,%r10
  403007:	4c 8d 0d 2e ce 00 00 	lea    0xce2e(%rip),%r9        # 40fe3c <Counters>
  40300e:	4a 89 4c d0 10       	mov    %rcx,0x10(%rax,%r10,8)
  403013:	8b 48 58             	mov    0x58(%rax),%ecx
  403016:	81 f9 00 01 00 00    	cmp    $0x100,%ecx
  40301c:	0f 84 db 07 00 00    	je     4037fd <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x92d>
  403022:	81 f9 00 01 00 00    	cmp    $0x100,%ecx
  403028:	77 46                	ja     403070 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x1a0>
  40302a:	83 f9 02             	cmp    $0x2,%ecx
  40302d:	0f 84 05 09 00 00    	je     403938 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xa68>
  403033:	0f 86 8d 05 00 00    	jbe    4035c6 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x6f6>
  403039:	83 f9 20             	cmp    $0x20,%ecx
  40303c:	0f 84 d0 03 00 00    	je     403412 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x542>
  403042:	0f 86 c1 03 00 00    	jbe    403409 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x539>
  403048:	83 e9 40             	sub    $0x40,%ecx
  40304b:	83 e1 bf             	and    $0xffffffbf,%ecx
  40304e:	0f 84 2c 07 00 00    	je     403780 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x8b0>
  403054:	4c 8d 05 9d 50 00 00 	lea    0x509d(%rip),%r8        # 4080f8 <_IO_stdin_used+0xf8>
  40305b:	5b                   	pop    %rbx
  40305c:	5d                   	pop    %rbp
  40305d:	4c 89 c0             	mov    %r8,%rax
  403060:	41 5c                	pop    %r12
  403062:	41 5d                	pop    %r13
  403064:	41 5e                	pop    %r14
  403066:	41 5f                	pop    %r15
  403068:	c3                   	ret    
  403069:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  403070:	81 f9 00 20 00 00    	cmp    $0x2000,%ecx
  403076:	0f 84 84 0b 00 00    	je     403c00 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xd30>
  40307c:	0f 86 ce 01 00 00    	jbe    403250 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x380>
  403082:	81 f9 00 00 10 00    	cmp    $0x100000,%ecx
  403088:	75 ca                	jne    403054 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x184>
  40308a:	44 8b 66 18          	mov    0x18(%rsi),%r12d
  40308e:	8b 35 8c cd 00 00    	mov    0xcd8c(%rip),%esi        # 40fe20 <NumThreads>
  403094:	44 8d 82 c1 00 00 00 	lea    0xc1(%rdx),%r8d
  40309b:	8d 9a 86 01 00 00    	lea    0x186(%rdx),%ebx
  4030a1:	4c 8d 0d 94 cd 00 00 	lea    0xcd94(%rip),%r9        # 40fe3c <Counters>
  4030a8:	41 81 cc 00 00 41 00 	or     $0x410000,%r12d
  4030af:	85 f6                	test   %esi,%esi
  4030b1:	0f 8e 74 01 00 00    	jle    40322b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x35b>
  4030b7:	4c 8d 98 70 20 00 00 	lea    0x2070(%rax),%r11
  4030be:	31 ed                	xor    %ebp,%ebp
  4030c0:	4d 89 dd             	mov    %r11,%r13
  4030c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4030c8:	45 8b 4d 00          	mov    0x0(%r13),%r9d
  4030cc:	41 81 f9 ff 01 00 00 	cmp    $0x1ff,%r9d
  4030d3:	7f 34                	jg     403109 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x239>
  4030d5:	4c 63 f5             	movslq %ebp,%r14
  4030d8:	49 63 c9             	movslq %r9d,%rcx
  4030db:	41 83 c1 01          	add    $0x1,%r9d
  4030df:	4d 69 f6 18 20 00 00 	imul   $0x2018,%r14,%r14
  4030e6:	48 c1 e1 04          	shl    $0x4,%rcx
  4030ea:	4c 01 f1             	add    %r14,%rcx
  4030ed:	48 01 c1             	add    %rax,%rcx
  4030f0:	c7 41 60 03 00 00 00 	movl   $0x3,0x60(%rcx)
  4030f7:	89 59 64             	mov    %ebx,0x64(%rcx)
  4030fa:	44 89 61 68          	mov    %r12d,0x68(%rcx)
  4030fe:	c7 41 6c 00 00 00 00 	movl   $0x0,0x6c(%rcx)
  403105:	45 89 4d 00          	mov    %r9d,0x0(%r13)
  403109:	83 c5 01             	add    $0x1,%ebp
  40310c:	49 81 c5 18 20 00 00 	add    $0x2018,%r13
  403113:	39 ee                	cmp    %ebp,%esi
  403115:	75 b1                	jne    4030c8 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x1f8>
  403117:	4c 8d 88 70 50 40 00 	lea    0x405070(%rax),%r9
  40311e:	45 31 e4             	xor    %r12d,%r12d
  403121:	4d 89 cd             	mov    %r9,%r13
  403124:	0f 1f 40 00          	nopl   0x0(%rax)
  403128:	41 8b 6d 00          	mov    0x0(%r13),%ebp
  40312c:	81 fd ff 01 00 00    	cmp    $0x1ff,%ebp
  403132:	7f 39                	jg     40316d <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x29d>
  403134:	4d 63 f4             	movslq %r12d,%r14
  403137:	48 63 cd             	movslq %ebp,%rcx
  40313a:	83 c5 01             	add    $0x1,%ebp
  40313d:	4d 69 f6 18 20 00 00 	imul   $0x2018,%r14,%r14
  403144:	48 c1 e1 04          	shl    $0x4,%rcx
  403148:	4c 01 f1             	add    %r14,%rcx
  40314b:	48 01 c1             	add    %rax,%rcx
  40314e:	c7 81 60 30 40 00 03 	movl   $0x3,0x403060(%rcx)
  403155:	00 00 00 
  403158:	89 99 64 30 40 00    	mov    %ebx,0x403064(%rcx)
  40315e:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  403165:	00 00 00 00 
  403169:	41 89 6d 00          	mov    %ebp,0x0(%r13)
  40316d:	41 83 c4 01          	add    $0x1,%r12d
  403171:	49 81 c5 18 20 00 00 	add    $0x2018,%r13
  403178:	44 39 e6             	cmp    %r12d,%esi
  40317b:	75 ab                	jne    403128 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x258>
  40317d:	31 ed                	xor    %ebp,%ebp
  40317f:	90                   	nop
  403180:	41 8b 1b             	mov    (%r11),%ebx
  403183:	81 fb ff 01 00 00    	cmp    $0x1ff,%ebx
  403189:	7f 30                	jg     4031bb <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x2eb>
  40318b:	4c 63 e5             	movslq %ebp,%r12
  40318e:	48 63 cb             	movslq %ebx,%rcx
  403191:	83 c3 01             	add    $0x1,%ebx
  403194:	4d 69 e4 18 20 00 00 	imul   $0x2018,%r12,%r12
  40319b:	48 c1 e1 04          	shl    $0x4,%rcx
  40319f:	4c 01 e1             	add    %r12,%rcx
  4031a2:	48 01 c1             	add    %rax,%rcx
  4031a5:	c7 41 60 03 00 00 00 	movl   $0x3,0x60(%rcx)
  4031ac:	44 89 41 64          	mov    %r8d,0x64(%rcx)
  4031b0:	48 c7 41 68 00 00 00 	movq   $0x0,0x68(%rcx)
  4031b7:	00 
  4031b8:	41 89 1b             	mov    %ebx,(%r11)
  4031bb:	83 c5 01             	add    $0x1,%ebp
  4031be:	49 81 c3 18 20 00 00 	add    $0x2018,%r11
  4031c5:	39 ee                	cmp    %ebp,%esi
  4031c7:	75 b7                	jne    403180 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x2b0>
  4031c9:	31 ed                	xor    %ebp,%ebp
  4031cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4031d0:	45 8b 19             	mov    (%r9),%r11d
  4031d3:	41 81 fb ff 01 00 00 	cmp    $0x1ff,%r11d
  4031da:	7f 3a                	jg     403216 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x346>
  4031dc:	48 63 dd             	movslq %ebp,%rbx
  4031df:	49 63 cb             	movslq %r11d,%rcx
  4031e2:	41 83 c3 01          	add    $0x1,%r11d
  4031e6:	48 69 db 18 20 00 00 	imul   $0x2018,%rbx,%rbx
  4031ed:	48 c1 e1 04          	shl    $0x4,%rcx
  4031f1:	48 01 d9             	add    %rbx,%rcx
  4031f4:	48 01 c1             	add    %rax,%rcx
  4031f7:	c7 81 60 30 40 00 03 	movl   $0x3,0x403060(%rcx)
  4031fe:	00 00 00 
  403201:	44 89 81 64 30 40 00 	mov    %r8d,0x403064(%rcx)
  403208:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  40320f:	00 00 00 00 
  403213:	45 89 19             	mov    %r11d,(%r9)
  403216:	83 c5 01             	add    $0x1,%ebp
  403219:	49 81 c1 18 20 00 00 	add    $0x2018,%r9
  403220:	39 ee                	cmp    %ebp,%esi
  403222:	75 ac                	jne    4031d0 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x300>
  403224:	4c 8d 0d 11 cc 00 00 	lea    0xcc11(%rip),%r9        # 40fe3c <Counters>
  40322b:	83 c7 01             	add    $0x1,%edi
  40322e:	45 31 c0             	xor    %r8d,%r8d
  403231:	43 89 14 91          	mov    %edx,(%r9,%r10,4)
  403235:	5b                   	pop    %rbx
  403236:	4c 89 c0             	mov    %r8,%rax
  403239:	5d                   	pop    %rbp
  40323a:	41 5c                	pop    %r12
  40323c:	89 3d c6 cb 00 00    	mov    %edi,0xcbc6(%rip)        # 40fe08 <NumCounters>
  403242:	41 5d                	pop    %r13
  403244:	41 5e                	pop    %r14
  403246:	41 5f                	pop    %r15
  403248:	c3                   	ret    
  403249:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  403250:	81 f9 00 02 00 00    	cmp    $0x200,%ecx
  403256:	0f 84 24 05 00 00    	je     403780 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x8b0>
  40325c:	81 f9 00 10 00 00    	cmp    $0x1000,%ecx
  403262:	0f 85 ec fd ff ff    	jne    403054 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x184>
  403268:	44 8b 66 1c          	mov    0x1c(%rsi),%r12d
  40326c:	8d 9a 00 00 01 c0    	lea    -0x3fff0000(%rdx),%ebx
  403272:	44 8d 82 04 00 01 c0 	lea    -0x3ffefffc(%rdx),%r8d
  403279:	4c 8d 0d bc cb 00 00 	lea    0xcbbc(%rip),%r9        # 40fe3c <Counters>
  403280:	41 c1 e4 08          	shl    $0x8,%r12d
  403284:	44 0b 66 18          	or     0x18(%rsi),%r12d
  403288:	8b 35 92 cb 00 00    	mov    0xcb92(%rip),%esi        # 40fe20 <NumThreads>
  40328e:	41 81 cc 00 00 41 00 	or     $0x410000,%r12d
  403295:	85 f6                	test   %esi,%esi
  403297:	7e 92                	jle    40322b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x35b>
  403299:	4c 8d 98 70 20 00 00 	lea    0x2070(%rax),%r11
  4032a0:	31 ed                	xor    %ebp,%ebp
  4032a2:	4d 89 dd             	mov    %r11,%r13
  4032a5:	0f 1f 00             	nopl   (%rax)
  4032a8:	45 8b 4d 00          	mov    0x0(%r13),%r9d
  4032ac:	41 81 f9 ff 01 00 00 	cmp    $0x1ff,%r9d
  4032b3:	7f 34                	jg     4032e9 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x419>
  4032b5:	4c 63 f5             	movslq %ebp,%r14
  4032b8:	49 63 c9             	movslq %r9d,%rcx
  4032bb:	41 83 c1 01          	add    $0x1,%r9d
  4032bf:	4d 69 f6 18 20 00 00 	imul   $0x2018,%r14,%r14
  4032c6:	48 c1 e1 04          	shl    $0x4,%rcx
  4032ca:	4c 01 f1             	add    %r14,%rcx
  4032cd:	48 01 c1             	add    %rax,%rcx
  4032d0:	c7 41 60 03 00 00 00 	movl   $0x3,0x60(%rcx)
  4032d7:	89 59 64             	mov    %ebx,0x64(%rcx)
  4032da:	44 89 61 68          	mov    %r12d,0x68(%rcx)
  4032de:	c7 41 6c 00 00 00 00 	movl   $0x0,0x6c(%rcx)
  4032e5:	45 89 4d 00          	mov    %r9d,0x0(%r13)
  4032e9:	83 c5 01             	add    $0x1,%ebp
  4032ec:	49 81 c5 18 20 00 00 	add    $0x2018,%r13
  4032f3:	39 ee                	cmp    %ebp,%esi
  4032f5:	75 b1                	jne    4032a8 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x3d8>
  4032f7:	4c 8d 88 70 50 40 00 	lea    0x405070(%rax),%r9
  4032fe:	45 31 e4             	xor    %r12d,%r12d
  403301:	4d 89 cd             	mov    %r9,%r13
  403304:	0f 1f 40 00          	nopl   0x0(%rax)
  403308:	41 8b 6d 00          	mov    0x0(%r13),%ebp
  40330c:	81 fd ff 01 00 00    	cmp    $0x1ff,%ebp
  403312:	7f 39                	jg     40334d <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x47d>
  403314:	4d 63 f4             	movslq %r12d,%r14
  403317:	48 63 cd             	movslq %ebp,%rcx
  40331a:	83 c5 01             	add    $0x1,%ebp
  40331d:	4d 69 f6 18 20 00 00 	imul   $0x2018,%r14,%r14
  403324:	48 c1 e1 04          	shl    $0x4,%rcx
  403328:	4c 01 f1             	add    %r14,%rcx
  40332b:	48 01 c1             	add    %rax,%rcx
  40332e:	c7 81 60 30 40 00 03 	movl   $0x3,0x403060(%rcx)
  403335:	00 00 00 
  403338:	89 99 64 30 40 00    	mov    %ebx,0x403064(%rcx)
  40333e:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  403345:	00 00 00 00 
  403349:	41 89 6d 00          	mov    %ebp,0x0(%r13)
  40334d:	41 83 c4 01          	add    $0x1,%r12d
  403351:	49 81 c5 18 20 00 00 	add    $0x2018,%r13
  403358:	44 39 e6             	cmp    %r12d,%esi
  40335b:	75 ab                	jne    403308 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x438>
  40335d:	31 ed                	xor    %ebp,%ebp
  40335f:	90                   	nop
  403360:	41 8b 1b             	mov    (%r11),%ebx
  403363:	81 fb ff 01 00 00    	cmp    $0x1ff,%ebx
  403369:	7f 30                	jg     40339b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x4cb>
  40336b:	4c 63 e5             	movslq %ebp,%r12
  40336e:	48 63 cb             	movslq %ebx,%rcx
  403371:	83 c3 01             	add    $0x1,%ebx
  403374:	4d 69 e4 18 20 00 00 	imul   $0x2018,%r12,%r12
  40337b:	48 c1 e1 04          	shl    $0x4,%rcx
  40337f:	4c 01 e1             	add    %r12,%rcx
  403382:	48 01 c1             	add    %rax,%rcx
  403385:	c7 41 60 03 00 00 00 	movl   $0x3,0x60(%rcx)
  40338c:	44 89 41 64          	mov    %r8d,0x64(%rcx)
  403390:	48 c7 41 68 00 00 00 	movq   $0x0,0x68(%rcx)
  403397:	00 
  403398:	41 89 1b             	mov    %ebx,(%r11)
  40339b:	83 c5 01             	add    $0x1,%ebp
  40339e:	49 81 c3 18 20 00 00 	add    $0x2018,%r11
  4033a5:	39 ee                	cmp    %ebp,%esi
  4033a7:	75 b7                	jne    403360 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x490>
  4033a9:	31 ed                	xor    %ebp,%ebp
  4033ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4033b0:	45 8b 19             	mov    (%r9),%r11d
  4033b3:	41 81 fb ff 01 00 00 	cmp    $0x1ff,%r11d
  4033ba:	7f 3a                	jg     4033f6 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x526>
  4033bc:	48 63 dd             	movslq %ebp,%rbx
  4033bf:	49 63 cb             	movslq %r11d,%rcx
  4033c2:	41 83 c3 01          	add    $0x1,%r11d
  4033c6:	48 69 db 18 20 00 00 	imul   $0x2018,%rbx,%rbx
  4033cd:	48 c1 e1 04          	shl    $0x4,%rcx
  4033d1:	48 01 d9             	add    %rbx,%rcx
  4033d4:	48 01 c1             	add    %rax,%rcx
  4033d7:	c7 81 60 30 40 00 03 	movl   $0x3,0x403060(%rcx)
  4033de:	00 00 00 
  4033e1:	44 89 81 64 30 40 00 	mov    %r8d,0x403064(%rcx)
  4033e8:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  4033ef:	00 00 00 00 
  4033f3:	45 89 19             	mov    %r11d,(%r9)
  4033f6:	83 c5 01             	add    $0x1,%ebp
  4033f9:	49 81 c1 18 20 00 00 	add    $0x2018,%r9
  403400:	39 ee                	cmp    %ebp,%esi
  403402:	75 ac                	jne    4033b0 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x4e0>
  403404:	e9 1b fe ff ff       	jmp    403224 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x354>
  403409:	83 f9 10             	cmp    $0x10,%ecx
  40340c:	0f 85 42 fc ff ff    	jne    403054 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x184>
  403412:	44 8b 4e 1c          	mov    0x1c(%rsi),%r9d
  403416:	44 8b 05 03 ca 00 00 	mov    0xca03(%rip),%r8d        # 40fe20 <NumThreads>
  40341d:	41 c1 e1 08          	shl    $0x8,%r9d
  403421:	44 0b 4e 18          	or     0x18(%rsi),%r9d
  403425:	45 89 cd             	mov    %r9d,%r13d
  403428:	44 89 ce             	mov    %r9d,%esi
  40342b:	4c 8d 0d 0a ca 00 00 	lea    0xca0a(%rip),%r9        # 40fe3c <Counters>
  403432:	41 81 cd 00 40 41 00 	or     $0x414000,%r13d
  403439:	83 f9 20             	cmp    $0x20,%ecx
  40343c:	0f 85 7a 03 00 00    	jne    4037bc <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x8ec>
  403442:	44 8d 9a c1 00 00 00 	lea    0xc1(%rdx),%r11d
  403449:	44 8d a2 86 01 00 00 	lea    0x186(%rdx),%r12d
  403450:	45 85 c0             	test   %r8d,%r8d
  403453:	0f 8e d2 fd ff ff    	jle    40322b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x35b>
  403459:	48 8d 98 70 20 00 00 	lea    0x2070(%rax),%rbx
  403460:	31 ed                	xor    %ebp,%ebp
  403462:	49 89 de             	mov    %rbx,%r14
  403465:	0f 1f 00             	nopl   (%rax)
  403468:	41 8b 36             	mov    (%r14),%esi
  40346b:	81 fe ff 01 00 00    	cmp    $0x1ff,%esi
  403471:	7f 33                	jg     4034a6 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x5d6>
  403473:	4c 63 fd             	movslq %ebp,%r15
  403476:	48 63 ce             	movslq %esi,%rcx
  403479:	83 c6 01             	add    $0x1,%esi
  40347c:	4d 69 ff 18 20 00 00 	imul   $0x2018,%r15,%r15
  403483:	48 c1 e1 04          	shl    $0x4,%rcx
  403487:	4c 01 f9             	add    %r15,%rcx
  40348a:	48 01 c1             	add    %rax,%rcx
  40348d:	c7 41 60 03 00 00 00 	movl   $0x3,0x60(%rcx)
  403494:	44 89 61 64          	mov    %r12d,0x64(%rcx)
  403498:	44 89 69 68          	mov    %r13d,0x68(%rcx)
  40349c:	c7 41 6c 00 00 00 00 	movl   $0x0,0x6c(%rcx)
  4034a3:	41 89 36             	mov    %esi,(%r14)
  4034a6:	83 c5 01             	add    $0x1,%ebp
  4034a9:	49 81 c6 18 20 00 00 	add    $0x2018,%r14
  4034b0:	44 39 c5             	cmp    %r8d,%ebp
  4034b3:	75 b3                	jne    403468 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x598>
  4034b5:	48 8d b0 70 50 40 00 	lea    0x405070(%rax),%rsi
  4034bc:	45 31 ed             	xor    %r13d,%r13d
  4034bf:	49 89 f6             	mov    %rsi,%r14
  4034c2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4034c8:	41 8b 2e             	mov    (%r14),%ebp
  4034cb:	81 fd ff 01 00 00    	cmp    $0x1ff,%ebp
  4034d1:	7f 39                	jg     40350c <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x63c>
  4034d3:	4d 63 fd             	movslq %r13d,%r15
  4034d6:	48 63 cd             	movslq %ebp,%rcx
  4034d9:	83 c5 01             	add    $0x1,%ebp
  4034dc:	4d 69 ff 18 20 00 00 	imul   $0x2018,%r15,%r15
  4034e3:	48 c1 e1 04          	shl    $0x4,%rcx
  4034e7:	4c 01 f9             	add    %r15,%rcx
  4034ea:	48 01 c1             	add    %rax,%rcx
  4034ed:	c7 81 60 30 40 00 03 	movl   $0x3,0x403060(%rcx)
  4034f4:	00 00 00 
  4034f7:	44 89 a1 64 30 40 00 	mov    %r12d,0x403064(%rcx)
  4034fe:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  403505:	00 00 00 00 
  403509:	41 89 2e             	mov    %ebp,(%r14)
  40350c:	41 83 c5 01          	add    $0x1,%r13d
  403510:	49 81 c6 18 20 00 00 	add    $0x2018,%r14
  403517:	45 39 c5             	cmp    %r8d,%r13d
  40351a:	75 ac                	jne    4034c8 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x5f8>
  40351c:	45 31 e4             	xor    %r12d,%r12d
  40351f:	90                   	nop
  403520:	8b 2b                	mov    (%rbx),%ebp
  403522:	81 fd ff 01 00 00    	cmp    $0x1ff,%ebp
  403528:	7f 2f                	jg     403559 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x689>
  40352a:	4d 63 ec             	movslq %r12d,%r13
  40352d:	48 63 cd             	movslq %ebp,%rcx
  403530:	83 c5 01             	add    $0x1,%ebp
  403533:	4d 69 ed 18 20 00 00 	imul   $0x2018,%r13,%r13
  40353a:	48 c1 e1 04          	shl    $0x4,%rcx
  40353e:	4c 01 e9             	add    %r13,%rcx
  403541:	48 01 c1             	add    %rax,%rcx
  403544:	c7 41 60 03 00 00 00 	movl   $0x3,0x60(%rcx)
  40354b:	44 89 59 64          	mov    %r11d,0x64(%rcx)
  40354f:	48 c7 41 68 00 00 00 	movq   $0x0,0x68(%rcx)
  403556:	00 
  403557:	89 2b                	mov    %ebp,(%rbx)
  403559:	41 83 c4 01          	add    $0x1,%r12d
  40355d:	48 81 c3 18 20 00 00 	add    $0x2018,%rbx
  403564:	45 39 c4             	cmp    %r8d,%r12d
  403567:	75 b7                	jne    403520 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x650>
  403569:	31 ed                	xor    %ebp,%ebp
  40356b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  403570:	8b 1e                	mov    (%rsi),%ebx
  403572:	81 fb ff 01 00 00    	cmp    $0x1ff,%ebx
  403578:	7f 38                	jg     4035b2 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x6e2>
  40357a:	4c 63 e5             	movslq %ebp,%r12
  40357d:	48 63 cb             	movslq %ebx,%rcx
  403580:	83 c3 01             	add    $0x1,%ebx
  403583:	4d 69 e4 18 20 00 00 	imul   $0x2018,%r12,%r12
  40358a:	48 c1 e1 04          	shl    $0x4,%rcx
  40358e:	4c 01 e1             	add    %r12,%rcx
  403591:	48 01 c1             	add    %rax,%rcx
  403594:	c7 81 60 30 40 00 03 	movl   $0x3,0x403060(%rcx)
  40359b:	00 00 00 
  40359e:	44 89 99 64 30 40 00 	mov    %r11d,0x403064(%rcx)
  4035a5:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  4035ac:	00 00 00 00 
  4035b0:	89 1e                	mov    %ebx,(%rsi)
  4035b2:	83 c5 01             	add    $0x1,%ebp
  4035b5:	48 81 c6 18 20 00 00 	add    $0x2018,%rsi
  4035bc:	44 39 c5             	cmp    %r8d,%ebp
  4035bf:	75 af                	jne    403570 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x6a0>
  4035c1:	e9 65 fc ff ff       	jmp    40322b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x35b>
  4035c6:	83 f9 01             	cmp    $0x1,%ecx
  4035c9:	0f 85 85 fa ff ff    	jne    403054 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x184>
  4035cf:	8b 6e 1c             	mov    0x1c(%rsi),%ebp
  4035d2:	c1 e5 06             	shl    $0x6,%ebp
  4035d5:	0b 6e 18             	or     0x18(%rsi),%ebp
  4035d8:	83 fa 01             	cmp    $0x1,%edx
  4035db:	0f 84 45 03 00 00    	je     403926 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xa56>
  4035e1:	44 8b 05 38 c8 00 00 	mov    0xc838(%rip),%r8d        # 40fe20 <NumThreads>
  4035e8:	45 31 db             	xor    %r11d,%r11d
  4035eb:	4c 8d 88 70 20 00 00 	lea    0x2070(%rax),%r9
  4035f2:	49 bc 03 00 00 00 11 	movabs $0x1100000003,%r12
  4035f9:	00 00 00 
  4035fc:	4c 89 cb             	mov    %r9,%rbx
  4035ff:	45 85 c0             	test   %r8d,%r8d
  403602:	0f 8e 65 01 00 00    	jle    40376d <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x89d>
  403608:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40360f:	00 
  403610:	8b 33                	mov    (%rbx),%esi
  403612:	81 fe ff 01 00 00    	cmp    $0x1ff,%esi
  403618:	7f 2a                	jg     403644 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x774>
  40361a:	49 63 cb             	movslq %r11d,%rcx
  40361d:	4c 63 ee             	movslq %esi,%r13
  403620:	83 c6 01             	add    $0x1,%esi
  403623:	48 69 c9 18 20 00 00 	imul   $0x2018,%rcx,%rcx
  40362a:	49 c1 e5 04          	shl    $0x4,%r13
  40362e:	4c 01 e9             	add    %r13,%rcx
  403631:	48 01 c1             	add    %rax,%rcx
  403634:	4c 89 61 60          	mov    %r12,0x60(%rcx)
  403638:	89 69 68             	mov    %ebp,0x68(%rcx)
  40363b:	c7 41 6c 00 00 00 00 	movl   $0x0,0x6c(%rcx)
  403642:	89 33                	mov    %esi,(%rbx)
  403644:	41 83 c3 01          	add    $0x1,%r11d
  403648:	48 81 c3 18 20 00 00 	add    $0x2018,%rbx
  40364f:	45 39 d8             	cmp    %r11d,%r8d
  403652:	75 bc                	jne    403610 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x740>
  403654:	48 8d b0 70 50 40 00 	lea    0x405070(%rax),%rsi
  40365b:	31 db                	xor    %ebx,%ebx
  40365d:	49 bd 03 00 00 00 11 	movabs $0x1100000003,%r13
  403664:	00 00 00 
  403667:	49 89 f4             	mov    %rsi,%r12
  40366a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  403670:	45 8b 1c 24          	mov    (%r12),%r11d
  403674:	41 81 fb ff 01 00 00 	cmp    $0x1ff,%r11d
  40367b:	7f 31                	jg     4036ae <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x7de>
  40367d:	4c 63 f3             	movslq %ebx,%r14
  403680:	49 63 cb             	movslq %r11d,%rcx
  403683:	41 83 c3 01          	add    $0x1,%r11d
  403687:	4d 69 f6 18 20 00 00 	imul   $0x2018,%r14,%r14
  40368e:	48 c1 e1 04          	shl    $0x4,%rcx
  403692:	4c 01 f1             	add    %r14,%rcx
  403695:	48 01 c1             	add    %rax,%rcx
  403698:	4c 89 a9 60 30 40 00 	mov    %r13,0x403060(%rcx)
  40369f:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  4036a6:	00 00 00 00 
  4036aa:	45 89 1c 24          	mov    %r11d,(%r12)
  4036ae:	83 c3 01             	add    $0x1,%ebx
  4036b1:	49 81 c4 18 20 00 00 	add    $0x2018,%r12
  4036b8:	41 39 d8             	cmp    %ebx,%r8d
  4036bb:	75 b3                	jne    403670 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x7a0>
  4036bd:	44 8d 5a 12          	lea    0x12(%rdx),%r11d
  4036c1:	45 31 e4             	xor    %r12d,%r12d
  4036c4:	0f 1f 40 00          	nopl   0x0(%rax)
  4036c8:	41 8b 19             	mov    (%r9),%ebx
  4036cb:	81 fb ff 01 00 00    	cmp    $0x1ff,%ebx
  4036d1:	7f 30                	jg     403703 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x833>
  4036d3:	4d 63 ec             	movslq %r12d,%r13
  4036d6:	48 63 cb             	movslq %ebx,%rcx
  4036d9:	83 c3 01             	add    $0x1,%ebx
  4036dc:	4d 69 ed 18 20 00 00 	imul   $0x2018,%r13,%r13
  4036e3:	48 c1 e1 04          	shl    $0x4,%rcx
  4036e7:	4c 01 e9             	add    %r13,%rcx
  4036ea:	48 01 c1             	add    %rax,%rcx
  4036ed:	c7 41 60 03 00 00 00 	movl   $0x3,0x60(%rcx)
  4036f4:	44 89 59 64          	mov    %r11d,0x64(%rcx)
  4036f8:	48 c7 41 68 00 00 00 	movq   $0x0,0x68(%rcx)
  4036ff:	00 
  403700:	41 89 19             	mov    %ebx,(%r9)
  403703:	41 83 c4 01          	add    $0x1,%r12d
  403707:	49 81 c1 18 20 00 00 	add    $0x2018,%r9
  40370e:	45 39 e0             	cmp    %r12d,%r8d
  403711:	75 b5                	jne    4036c8 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x7f8>
  403713:	31 db                	xor    %ebx,%ebx
  403715:	0f 1f 00             	nopl   (%rax)
  403718:	44 8b 0e             	mov    (%rsi),%r9d
  40371b:	41 81 f9 ff 01 00 00 	cmp    $0x1ff,%r9d
  403722:	7f 3a                	jg     40375e <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x88e>
  403724:	4c 63 e3             	movslq %ebx,%r12
  403727:	49 63 c9             	movslq %r9d,%rcx
  40372a:	41 83 c1 01          	add    $0x1,%r9d
  40372e:	4d 69 e4 18 20 00 00 	imul   $0x2018,%r12,%r12
  403735:	48 c1 e1 04          	shl    $0x4,%rcx
  403739:	4c 01 e1             	add    %r12,%rcx
  40373c:	48 01 c1             	add    %rax,%rcx
  40373f:	c7 81 60 30 40 00 03 	movl   $0x3,0x403060(%rcx)
  403746:	00 00 00 
  403749:	44 89 99 64 30 40 00 	mov    %r11d,0x403064(%rcx)
  403750:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  403757:	00 00 00 00 
  40375b:	44 89 0e             	mov    %r9d,(%rsi)
  40375e:	83 c3 01             	add    $0x1,%ebx
  403761:	48 81 c6 18 20 00 00 	add    $0x2018,%rsi
  403768:	41 39 d8             	cmp    %ebx,%r8d
  40376b:	75 ab                	jne    403718 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x848>
  40376d:	89 2d e9 c6 00 00    	mov    %ebp,0xc6e9(%rip)        # 40fe5c <EventRegistersUsed>
  403773:	4c 8d 0d c2 c6 00 00 	lea    0xc6c2(%rip),%r9        # 40fe3c <Counters>
  40377a:	e9 ac fa ff ff       	jmp    40322b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x35b>
  40377f:	90                   	nop
  403780:	4c 8d 0d b5 c6 00 00 	lea    0xc6b5(%rip),%r9        # 40fe3c <Counters>
  403787:	f7 c2 00 00 00 40    	test   $0x40000000,%edx
  40378d:	75 6e                	jne    4037fd <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x92d>
  40378f:	44 8b 1d 62 92 01 01 	mov    0x1019262(%rip),%r11d        # 141c9f8 <_ZZN9CCounters13DefineCounterER18SCounterDefinitionE15CountersEnabled>
  403796:	44 8b 05 83 c6 00 00 	mov    0xc683(%rip),%r8d        # 40fe20 <NumThreads>
  40379d:	45 8d 63 01          	lea    0x1(%r11),%r12d
  4037a1:	44 89 25 50 92 01 01 	mov    %r12d,0x1019250(%rip)        # 141c9f8 <_ZZN9CCounters13DefineCounterER18SCounterDefinitionE15CountersEnabled>
  4037a8:	45 85 db             	test   %r11d,%r11d
  4037ab:	0f 84 55 05 00 00    	je     403d06 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xe36>
  4037b1:	8b 4e 1c             	mov    0x1c(%rsi),%ecx
  4037b4:	c1 e1 08             	shl    $0x8,%ecx
  4037b7:	0b 4e 18             	or     0x18(%rsi),%ecx
  4037ba:	89 ce                	mov    %ecx,%esi
  4037bc:	81 ce 00 00 41 00    	or     $0x410000,%esi
  4037c2:	41 89 f5             	mov    %esi,%r13d
  4037c5:	e9 78 fc ff ff       	jmp    403442 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x572>
  4037ca:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4037d0:	89 56 10             	mov    %edx,0x10(%rsi)
  4037d3:	89 d5                	mov    %edx,%ebp
  4037d5:	e9 4b f7 ff ff       	jmp    402f25 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x55>
  4037da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4037e0:	48 8d 4e 20          	lea    0x20(%rsi),%rcx
  4037e4:	4c 63 d7             	movslq %edi,%r10
  4037e7:	4a 89 4c d0 10       	mov    %rcx,0x10(%rax,%r10,8)
  4037ec:	8b 48 58             	mov    0x58(%rax),%ecx
  4037ef:	81 f9 00 01 00 00    	cmp    $0x100,%ecx
  4037f5:	0f 85 27 f8 ff ff    	jne    403022 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x152>
  4037fb:	eb 8a                	jmp    403787 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x8b7>
  4037fd:	8b 35 f1 91 01 01    	mov    0x10191f1(%rip),%esi        # 141c9f4 <_ZZN9CCounters13DefineCounterER18SCounterDefinitionE20FixedCountersEnabled>
  403803:	44 8d 5e 01          	lea    0x1(%rsi),%r11d
  403807:	44 89 1d e6 91 01 01 	mov    %r11d,0x10191e6(%rip)        # 141c9f4 <_ZZN9CCounters13DefineCounterER18SCounterDefinitionE20FixedCountersEnabled>
  40380e:	85 f6                	test   %esi,%esi
  403810:	0f 85 15 fa ff ff    	jne    40322b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x35b>
  403816:	8b 98 68 60 80 00    	mov    0x806068(%rax),%ebx
  40381c:	85 db                	test   %ebx,%ebx
  40381e:	0f 8e ea 05 00 00    	jle    403e0e <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xf3e>
  403824:	c1 e3 02             	shl    $0x2,%ebx
  403827:	45 31 ed             	xor    %r13d,%r13d
  40382a:	31 c9                	xor    %ecx,%ecx
  40382c:	bd 02 00 00 00       	mov    $0x2,%ebp
  403831:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  403838:	41 89 e8             	mov    %ebp,%r8d
  40383b:	41 d3 e0             	shl    %cl,%r8d
  40383e:	83 c1 04             	add    $0x4,%ecx
  403841:	45 09 c5             	or     %r8d,%r13d
  403844:	39 cb                	cmp    %ecx,%ebx
  403846:	75 f0                	jne    403838 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x968>
  403848:	8b 1d d2 c5 00 00    	mov    0xc5d2(%rip),%ebx        # 40fe20 <NumThreads>
  40384e:	85 db                	test   %ebx,%ebx
  403850:	0f 8e d5 f9 ff ff    	jle    40322b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x35b>
  403856:	4c 8d a0 70 20 00 00 	lea    0x2070(%rax),%r12
  40385d:	31 ed                	xor    %ebp,%ebp
  40385f:	49 be 03 00 00 00 8d 	movabs $0x38d00000003,%r14
  403866:	03 00 00 
  403869:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  403870:	45 8b 04 24          	mov    (%r12),%r8d
  403874:	41 81 f8 ff 01 00 00 	cmp    $0x1ff,%r8d
  40387b:	7f 2e                	jg     4038ab <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x9db>
  40387d:	48 63 cd             	movslq %ebp,%rcx
  403880:	4d 63 f8             	movslq %r8d,%r15
  403883:	41 83 c0 01          	add    $0x1,%r8d
  403887:	48 69 c9 18 20 00 00 	imul   $0x2018,%rcx,%rcx
  40388e:	49 c1 e7 04          	shl    $0x4,%r15
  403892:	4c 01 f9             	add    %r15,%rcx
  403895:	48 01 c1             	add    %rax,%rcx
  403898:	4c 89 71 60          	mov    %r14,0x60(%rcx)
  40389c:	44 89 69 68          	mov    %r13d,0x68(%rcx)
  4038a0:	c7 41 6c 00 00 00 00 	movl   $0x0,0x6c(%rcx)
  4038a7:	45 89 04 24          	mov    %r8d,(%r12)
  4038ab:	83 c5 01             	add    $0x1,%ebp
  4038ae:	49 81 c4 18 20 00 00 	add    $0x2018,%r12
  4038b5:	39 eb                	cmp    %ebp,%ebx
  4038b7:	75 b7                	jne    403870 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x9a0>
  4038b9:	48 8d a8 70 50 40 00 	lea    0x405070(%rax),%rbp
  4038c0:	49 bc 03 00 00 00 8d 	movabs $0x38d00000003,%r12
  4038c7:	03 00 00 
  4038ca:	eb 08                	jmp    4038d4 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xa04>
  4038cc:	0f 1f 40 00          	nopl   0x0(%rax)
  4038d0:	41 83 c3 01          	add    $0x1,%r11d
  4038d4:	44 8b 45 00          	mov    0x0(%rbp),%r8d
  4038d8:	41 81 f8 ff 01 00 00 	cmp    $0x1ff,%r8d
  4038df:	7f 31                	jg     403912 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xa42>
  4038e1:	48 63 ce             	movslq %esi,%rcx
  4038e4:	49 63 f0             	movslq %r8d,%rsi
  4038e7:	41 83 c0 01          	add    $0x1,%r8d
  4038eb:	48 69 c9 18 20 00 00 	imul   $0x2018,%rcx,%rcx
  4038f2:	48 c1 e6 04          	shl    $0x4,%rsi
  4038f6:	48 01 f1             	add    %rsi,%rcx
  4038f9:	48 01 c1             	add    %rax,%rcx
  4038fc:	4c 89 a1 60 30 40 00 	mov    %r12,0x403060(%rcx)
  403903:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  40390a:	00 00 00 00 
  40390e:	44 89 45 00          	mov    %r8d,0x0(%rbp)
  403912:	44 89 de             	mov    %r11d,%esi
  403915:	48 81 c5 18 20 00 00 	add    $0x2018,%rbp
  40391c:	44 39 db             	cmp    %r11d,%ebx
  40391f:	75 af                	jne    4038d0 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xa00>
  403921:	e9 05 f9 ff ff       	jmp    40322b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x35b>
  403926:	c1 e5 10             	shl    $0x10,%ebp
  403929:	0b 2d 2d c5 00 00    	or     0xc52d(%rip),%ebp        # 40fe5c <EventRegistersUsed>
  40392f:	e9 ad fc ff ff       	jmp    4035e1 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x711>
  403934:	0f 1f 40 00          	nopl   0x0(%rax)
  403938:	4c 63 46 14          	movslq 0x14(%rsi),%r8
  40393c:	83 fa 11             	cmp    $0x11,%edx
  40393f:	0f 87 d1 04 00 00    	ja     403e16 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xf46>
  403945:	8d 4a fd             	lea    -0x3(%rdx),%ecx
  403948:	83 fa 0f             	cmp    $0xf,%edx
  40394b:	0f 46 ca             	cmovbe %edx,%ecx
  40394e:	41 83 f8 07          	cmp    $0x7,%r8d
  403952:	0f 87 be 04 00 00    	ja     403e16 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xf46>
  403958:	41 89 c9             	mov    %ecx,%r9d
  40395b:	41 c1 e9 02          	shr    $0x2,%r9d
  40395f:	4f 8d 0c c8          	lea    (%r8,%r9,8),%r9
  403963:	4c 8d 05 d6 4a 00 00 	lea    0x4ad6(%rip),%r8        # 408440 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables>
  40396a:	43 8b 1c 88          	mov    (%r8,%r9,4),%ebx
  40396e:	85 db                	test   %ebx,%ebx
  403970:	78 09                	js     40397b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xaab>
  403972:	83 e1 02             	and    $0x2,%ecx
  403975:	83 f9 01             	cmp    $0x1,%ecx
  403978:	83 db ff             	sbb    $0xffffffff,%ebx
  40397b:	44 8b 6e 1c          	mov    0x1c(%rsi),%r13d
  40397f:	8b 4e 18             	mov    0x18(%rsi),%ecx
  403982:	44 8b 05 97 c4 00 00 	mov    0xc497(%rip),%r8d        # 40fe20 <NumThreads>
  403989:	41 c1 e5 09          	shl    $0x9,%r13d
  40398d:	c1 e1 19             	shl    $0x19,%ecx
  403990:	41 09 cd             	or     %ecx,%r13d
  403993:	41 83 cd 3c          	or     $0x3c,%r13d
  403997:	45 85 c0             	test   %r8d,%r8d
  40399a:	0f 8e 5e 04 00 00    	jle    403dfe <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xf2e>
  4039a0:	4c 8d 98 70 20 00 00 	lea    0x2070(%rax),%r11
  4039a7:	31 ed                	xor    %ebp,%ebp
  4039a9:	4d 89 dc             	mov    %r11,%r12
  4039ac:	0f 1f 40 00          	nopl   0x0(%rax)
  4039b0:	45 8b 0c 24          	mov    (%r12),%r9d
  4039b4:	41 81 f9 ff 01 00 00 	cmp    $0x1ff,%r9d
  4039bb:	7f 34                	jg     4039f1 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xb21>
  4039bd:	4c 63 f5             	movslq %ebp,%r14
  4039c0:	49 63 c9             	movslq %r9d,%rcx
  4039c3:	41 83 c1 01          	add    $0x1,%r9d
  4039c7:	4d 69 f6 18 20 00 00 	imul   $0x2018,%r14,%r14
  4039ce:	48 c1 e1 04          	shl    $0x4,%rcx
  4039d2:	4c 01 f1             	add    %r14,%rcx
  4039d5:	48 01 c1             	add    %rax,%rcx
  4039d8:	c7 41 60 03 00 00 00 	movl   $0x3,0x60(%rcx)
  4039df:	89 59 64             	mov    %ebx,0x64(%rcx)
  4039e2:	44 89 69 68          	mov    %r13d,0x68(%rcx)
  4039e6:	c7 41 6c 00 00 00 00 	movl   $0x0,0x6c(%rcx)
  4039ed:	45 89 0c 24          	mov    %r9d,(%r12)
  4039f1:	83 c5 01             	add    $0x1,%ebp
  4039f4:	49 81 c4 18 20 00 00 	add    $0x2018,%r12
  4039fb:	41 39 e8             	cmp    %ebp,%r8d
  4039fe:	75 b0                	jne    4039b0 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xae0>
  403a00:	4c 8d 88 70 50 40 00 	lea    0x405070(%rax),%r9
  403a07:	45 31 e4             	xor    %r12d,%r12d
  403a0a:	4d 89 cd             	mov    %r9,%r13
  403a0d:	0f 1f 00             	nopl   (%rax)
  403a10:	41 8b 6d 00          	mov    0x0(%r13),%ebp
  403a14:	81 fd ff 01 00 00    	cmp    $0x1ff,%ebp
  403a1a:	7f 39                	jg     403a55 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xb85>
  403a1c:	4d 63 f4             	movslq %r12d,%r14
  403a1f:	48 63 cd             	movslq %ebp,%rcx
  403a22:	83 c5 01             	add    $0x1,%ebp
  403a25:	4d 69 f6 18 20 00 00 	imul   $0x2018,%r14,%r14
  403a2c:	48 c1 e1 04          	shl    $0x4,%rcx
  403a30:	4c 01 f1             	add    %r14,%rcx
  403a33:	48 01 c1             	add    %rax,%rcx
  403a36:	c7 81 60 30 40 00 03 	movl   $0x3,0x403060(%rcx)
  403a3d:	00 00 00 
  403a40:	89 99 64 30 40 00    	mov    %ebx,0x403064(%rcx)
  403a46:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  403a4d:	00 00 00 00 
  403a51:	41 89 6d 00          	mov    %ebp,0x0(%r13)
  403a55:	41 83 c4 01          	add    $0x1,%r12d
  403a59:	49 81 c5 18 20 00 00 	add    $0x2018,%r13
  403a60:	45 39 e0             	cmp    %r12d,%r8d
  403a63:	75 ab                	jne    403a10 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xb40>
  403a65:	48 8d 0d f0 c3 00 00 	lea    0xc3f0(%rip),%rcx        # 40fe5c <EventRegistersUsed>
  403a6c:	4d 89 dc             	mov    %r11,%r12
  403a6f:	31 ed                	xor    %ebp,%ebp
  403a71:	42 89 1c 91          	mov    %ebx,(%rcx,%r10,4)
  403a75:	44 8b 6e 14          	mov    0x14(%rsi),%r13d
  403a79:	8d b2 60 03 00 00    	lea    0x360(%rdx),%esi
  403a7f:	41 c1 e5 0d          	shl    $0xd,%r13d
  403a83:	41 81 cd 00 10 03 00 	or     $0x31000,%r13d
  403a8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  403a90:	41 8b 1c 24          	mov    (%r12),%ebx
  403a94:	81 fb ff 01 00 00    	cmp    $0x1ff,%ebx
  403a9a:	7f 33                	jg     403acf <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xbff>
  403a9c:	4c 63 f5             	movslq %ebp,%r14
  403a9f:	48 63 cb             	movslq %ebx,%rcx
  403aa2:	83 c3 01             	add    $0x1,%ebx
  403aa5:	4d 69 f6 18 20 00 00 	imul   $0x2018,%r14,%r14
  403aac:	48 c1 e1 04          	shl    $0x4,%rcx
  403ab0:	4c 01 f1             	add    %r14,%rcx
  403ab3:	48 01 c1             	add    %rax,%rcx
  403ab6:	c7 41 60 03 00 00 00 	movl   $0x3,0x60(%rcx)
  403abd:	89 71 64             	mov    %esi,0x64(%rcx)
  403ac0:	44 89 69 68          	mov    %r13d,0x68(%rcx)
  403ac4:	c7 41 6c 00 00 00 00 	movl   $0x0,0x6c(%rcx)
  403acb:	41 89 1c 24          	mov    %ebx,(%r12)
  403acf:	83 c5 01             	add    $0x1,%ebp
  403ad2:	49 81 c4 18 20 00 00 	add    $0x2018,%r12
  403ad9:	41 39 e8             	cmp    %ebp,%r8d
  403adc:	75 b2                	jne    403a90 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xbc0>
  403ade:	4d 89 cc             	mov    %r9,%r12
  403ae1:	31 ed                	xor    %ebp,%ebp
  403ae3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  403ae8:	41 8b 1c 24          	mov    (%r12),%ebx
  403aec:	81 fb ff 01 00 00    	cmp    $0x1ff,%ebx
  403af2:	7f 39                	jg     403b2d <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xc5d>
  403af4:	4c 63 ed             	movslq %ebp,%r13
  403af7:	48 63 cb             	movslq %ebx,%rcx
  403afa:	83 c3 01             	add    $0x1,%ebx
  403afd:	4d 69 ed 18 20 00 00 	imul   $0x2018,%r13,%r13
  403b04:	48 c1 e1 04          	shl    $0x4,%rcx
  403b08:	4c 01 e9             	add    %r13,%rcx
  403b0b:	48 01 c1             	add    %rax,%rcx
  403b0e:	c7 81 60 30 40 00 03 	movl   $0x3,0x403060(%rcx)
  403b15:	00 00 00 
  403b18:	89 b1 64 30 40 00    	mov    %esi,0x403064(%rcx)
  403b1e:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  403b25:	00 00 00 00 
  403b29:	41 89 1c 24          	mov    %ebx,(%r12)
  403b2d:	83 c5 01             	add    $0x1,%ebp
  403b30:	49 81 c4 18 20 00 00 	add    $0x2018,%r12
  403b37:	41 39 e8             	cmp    %ebp,%r8d
  403b3a:	75 ac                	jne    403ae8 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xc18>
  403b3c:	8d b2 00 03 00 00    	lea    0x300(%rdx),%esi
  403b42:	31 ed                	xor    %ebp,%ebp
  403b44:	0f 1f 40 00          	nopl   0x0(%rax)
  403b48:	41 8b 1b             	mov    (%r11),%ebx
  403b4b:	81 fb ff 01 00 00    	cmp    $0x1ff,%ebx
  403b51:	7f 2f                	jg     403b82 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xcb2>
  403b53:	4c 63 e5             	movslq %ebp,%r12
  403b56:	48 63 cb             	movslq %ebx,%rcx
  403b59:	83 c3 01             	add    $0x1,%ebx
  403b5c:	4d 69 e4 18 20 00 00 	imul   $0x2018,%r12,%r12
  403b63:	48 c1 e1 04          	shl    $0x4,%rcx
  403b67:	4c 01 e1             	add    %r12,%rcx
  403b6a:	48 01 c1             	add    %rax,%rcx
  403b6d:	c7 41 60 03 00 00 00 	movl   $0x3,0x60(%rcx)
  403b74:	89 71 64             	mov    %esi,0x64(%rcx)
  403b77:	48 c7 41 68 00 00 00 	movq   $0x0,0x68(%rcx)
  403b7e:	00 
  403b7f:	41 89 1b             	mov    %ebx,(%r11)
  403b82:	83 c5 01             	add    $0x1,%ebp
  403b85:	49 81 c3 18 20 00 00 	add    $0x2018,%r11
  403b8c:	41 39 e8             	cmp    %ebp,%r8d
  403b8f:	75 b7                	jne    403b48 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xc78>
  403b91:	31 ed                	xor    %ebp,%ebp
  403b93:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  403b98:	45 8b 19             	mov    (%r9),%r11d
  403b9b:	41 81 fb ff 01 00 00 	cmp    $0x1ff,%r11d
  403ba2:	7f 39                	jg     403bdd <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xd0d>
  403ba4:	48 63 dd             	movslq %ebp,%rbx
  403ba7:	49 63 cb             	movslq %r11d,%rcx
  403baa:	41 83 c3 01          	add    $0x1,%r11d
  403bae:	48 69 db 18 20 00 00 	imul   $0x2018,%rbx,%rbx
  403bb5:	48 c1 e1 04          	shl    $0x4,%rcx
  403bb9:	48 01 d9             	add    %rbx,%rcx
  403bbc:	48 01 c1             	add    %rax,%rcx
  403bbf:	c7 81 60 30 40 00 03 	movl   $0x3,0x403060(%rcx)
  403bc6:	00 00 00 
  403bc9:	89 b1 64 30 40 00    	mov    %esi,0x403064(%rcx)
  403bcf:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  403bd6:	00 00 00 00 
  403bda:	45 89 19             	mov    %r11d,(%r9)
  403bdd:	83 c5 01             	add    $0x1,%ebp
  403be0:	49 81 c1 18 20 00 00 	add    $0x2018,%r9
  403be7:	41 39 e8             	cmp    %ebp,%r8d
  403bea:	75 ac                	jne    403b98 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xcc8>
  403bec:	81 ca 00 00 00 80    	or     $0x80000000,%edx
  403bf2:	4c 8d 0d 43 c2 00 00 	lea    0xc243(%rip),%r9        # 40fe3c <Counters>
  403bf9:	e9 2d f6 ff ff       	jmp    40322b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x35b>
  403bfe:	66 90                	xchg   %ax,%ax
  403c00:	8b 5e 1c             	mov    0x1c(%rsi),%ebx
  403c03:	44 8d 84 12 00 02 01 	lea    -0x3ffefe00(%rdx,%rdx,1),%r8d
  403c0a:	c0 
  403c0b:	4c 8d 0d 2a c2 00 00 	lea    0xc22a(%rip),%r9        # 40fe3c <Counters>
  403c12:	c1 e3 08             	shl    $0x8,%ebx
  403c15:	0b 5e 18             	or     0x18(%rsi),%ebx
  403c18:	8b 35 02 c2 00 00    	mov    0xc202(%rip),%esi        # 40fe20 <NumThreads>
  403c1e:	81 cb 00 00 41 00    	or     $0x410000,%ebx
  403c24:	85 f6                	test   %esi,%esi
  403c26:	0f 8e ff f5 ff ff    	jle    40322b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x35b>
  403c2c:	48 8d a8 70 20 00 00 	lea    0x2070(%rax),%rbp
  403c33:	45 31 db             	xor    %r11d,%r11d
  403c36:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  403c3d:	00 00 00 
  403c40:	44 8b 4d 00          	mov    0x0(%rbp),%r9d
  403c44:	41 81 f9 ff 01 00 00 	cmp    $0x1ff,%r9d
  403c4b:	7f 34                	jg     403c81 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xdb1>
  403c4d:	4d 63 e3             	movslq %r11d,%r12
  403c50:	49 63 c9             	movslq %r9d,%rcx
  403c53:	41 83 c1 01          	add    $0x1,%r9d
  403c57:	4d 69 e4 18 20 00 00 	imul   $0x2018,%r12,%r12
  403c5e:	48 c1 e1 04          	shl    $0x4,%rcx
  403c62:	4c 01 e1             	add    %r12,%rcx
  403c65:	48 01 c1             	add    %rax,%rcx
  403c68:	c7 41 60 03 00 00 00 	movl   $0x3,0x60(%rcx)
  403c6f:	44 89 41 64          	mov    %r8d,0x64(%rcx)
  403c73:	89 59 68             	mov    %ebx,0x68(%rcx)
  403c76:	c7 41 6c 00 00 00 00 	movl   $0x0,0x6c(%rcx)
  403c7d:	44 89 4d 00          	mov    %r9d,0x0(%rbp)
  403c81:	41 83 c3 01          	add    $0x1,%r11d
  403c85:	48 81 c5 18 20 00 00 	add    $0x2018,%rbp
  403c8c:	44 39 de             	cmp    %r11d,%esi
  403c8f:	75 af                	jne    403c40 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xd70>
  403c91:	48 8d a8 70 50 40 00 	lea    0x405070(%rax),%rbp
  403c98:	31 db                	xor    %ebx,%ebx
  403c9a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  403ca0:	44 8b 4d 00          	mov    0x0(%rbp),%r9d
  403ca4:	41 81 f9 ff 01 00 00 	cmp    $0x1ff,%r9d
  403cab:	7f 3b                	jg     403ce8 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xe18>
  403cad:	4c 63 db             	movslq %ebx,%r11
  403cb0:	49 63 c9             	movslq %r9d,%rcx
  403cb3:	41 83 c1 01          	add    $0x1,%r9d
  403cb7:	4d 69 db 18 20 00 00 	imul   $0x2018,%r11,%r11
  403cbe:	48 c1 e1 04          	shl    $0x4,%rcx
  403cc2:	4c 01 d9             	add    %r11,%rcx
  403cc5:	48 01 c1             	add    %rax,%rcx
  403cc8:	c7 81 60 30 40 00 03 	movl   $0x3,0x403060(%rcx)
  403ccf:	00 00 00 
  403cd2:	44 89 81 64 30 40 00 	mov    %r8d,0x403064(%rcx)
  403cd9:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  403ce0:	00 00 00 00 
  403ce4:	44 89 4d 00          	mov    %r9d,0x0(%rbp)
  403ce8:	83 c3 01             	add    $0x1,%ebx
  403ceb:	48 81 c5 18 20 00 00 	add    $0x2018,%rbp
  403cf2:	39 de                	cmp    %ebx,%esi
  403cf4:	75 aa                	jne    403ca0 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xdd0>
  403cf6:	e9 29 f5 ff ff       	jmp    403224 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x354>
  403cfb:	41 ba ff ff ff ff    	mov    $0xffffffff,%r10d
  403d01:	e9 d1 f2 ff ff       	jmp    402fd7 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x107>
  403d06:	8b 88 68 60 80 00    	mov    0x806068(%rax),%ecx
  403d0c:	bb 01 00 00 00       	mov    $0x1,%ebx
  403d11:	41 89 df             	mov    %ebx,%r15d
  403d14:	41 d3 e7             	shl    %cl,%r15d
  403d17:	8b 88 64 60 80 00    	mov    0x806064(%rax),%ecx
  403d1d:	41 8d 6f ff          	lea    -0x1(%r15),%ebp
  403d21:	d3 e3                	shl    %cl,%ebx
  403d23:	8d 4b ff             	lea    -0x1(%rbx),%ecx
  403d26:	45 85 c0             	test   %r8d,%r8d
  403d29:	0f 8e 82 fa ff ff    	jle    4037b1 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x8e1>
  403d2f:	89 7c 24 f8          	mov    %edi,-0x8(%rsp)
  403d33:	89 eb                	mov    %ebp,%ebx
  403d35:	4c 8d b0 70 20 00 00 	lea    0x2070(%rax),%r14
  403d3c:	45 31 ed             	xor    %r13d,%r13d
  403d3f:	49 bf 03 00 00 00 8f 	movabs $0x38f00000003,%r15
  403d46:	03 00 00 
  403d49:	89 54 24 fc          	mov    %edx,-0x4(%rsp)
  403d4d:	89 cd                	mov    %ecx,%ebp
  403d4f:	41 8b 0e             	mov    (%r14),%ecx
  403d52:	81 f9 ff 01 00 00    	cmp    $0x1ff,%ecx
  403d58:	7f 27                	jg     403d81 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xeb1>
  403d5a:	49 63 fd             	movslq %r13d,%rdi
  403d5d:	48 63 d1             	movslq %ecx,%rdx
  403d60:	83 c1 01             	add    $0x1,%ecx
  403d63:	48 69 ff 18 20 00 00 	imul   $0x2018,%rdi,%rdi
  403d6a:	48 c1 e2 04          	shl    $0x4,%rdx
  403d6e:	48 01 fa             	add    %rdi,%rdx
  403d71:	48 01 c2             	add    %rax,%rdx
  403d74:	4c 89 7a 60          	mov    %r15,0x60(%rdx)
  403d78:	89 6a 68             	mov    %ebp,0x68(%rdx)
  403d7b:	89 5a 6c             	mov    %ebx,0x6c(%rdx)
  403d7e:	41 89 0e             	mov    %ecx,(%r14)
  403d81:	41 83 c5 01          	add    $0x1,%r13d
  403d85:	49 81 c6 18 20 00 00 	add    $0x2018,%r14
  403d8c:	45 39 c5             	cmp    %r8d,%r13d
  403d8f:	75 be                	jne    403d4f <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xe7f>
  403d91:	8b 7c 24 f8          	mov    -0x8(%rsp),%edi
  403d95:	8b 54 24 fc          	mov    -0x4(%rsp),%edx
  403d99:	48 8d a8 70 50 40 00 	lea    0x405070(%rax),%rbp
  403da0:	49 bd 03 00 00 00 8f 	movabs $0x38f00000003,%r13
  403da7:	03 00 00 
  403daa:	eb 04                	jmp    403db0 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xee0>
  403dac:	41 83 c4 01          	add    $0x1,%r12d
  403db0:	8b 5d 00             	mov    0x0(%rbp),%ebx
  403db3:	81 fb ff 01 00 00    	cmp    $0x1ff,%ebx
  403db9:	7f 2f                	jg     403dea <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xf1a>
  403dbb:	49 63 cb             	movslq %r11d,%rcx
  403dbe:	4c 63 db             	movslq %ebx,%r11
  403dc1:	83 c3 01             	add    $0x1,%ebx
  403dc4:	48 69 c9 18 20 00 00 	imul   $0x2018,%rcx,%rcx
  403dcb:	49 c1 e3 04          	shl    $0x4,%r11
  403dcf:	4c 01 d9             	add    %r11,%rcx
  403dd2:	48 01 c1             	add    %rax,%rcx
  403dd5:	4c 89 a9 60 30 40 00 	mov    %r13,0x403060(%rcx)
  403ddc:	48 c7 81 68 30 40 00 	movq   $0x0,0x403068(%rcx)
  403de3:	00 00 00 00 
  403de7:	89 5d 00             	mov    %ebx,0x0(%rbp)
  403dea:	45 89 e3             	mov    %r12d,%r11d
  403ded:	48 81 c5 18 20 00 00 	add    $0x2018,%rbp
  403df4:	45 39 c4             	cmp    %r8d,%r12d
  403df7:	75 b3                	jne    403dac <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xedc>
  403df9:	e9 b3 f9 ff ff       	jmp    4037b1 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x8e1>
  403dfe:	48 8d 05 57 c0 00 00 	lea    0xc057(%rip),%rax        # 40fe5c <EventRegistersUsed>
  403e05:	42 89 1c 90          	mov    %ebx,(%rax,%r10,4)
  403e09:	e9 de fd ff ff       	jmp    403bec <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xd1c>
  403e0e:	45 31 ed             	xor    %r13d,%r13d
  403e11:	e9 32 fa ff ff       	jmp    403848 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x978>
  403e16:	83 cb ff             	or     $0xffffffff,%ebx
  403e19:	e9 5d fb ff ff       	jmp    40397b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xaab>
  403e1e:	66 90                	xchg   %ax,%ax

0000000000403e20 <_ZN9CCounters13DefineCounterEi.part.0>:
  403e20:	48 63 87 60 60 80 00 	movslq 0x806060(%rdi),%rax
  403e27:	89 f2                	mov    %esi,%edx
  403e29:	85 c0                	test   %eax,%eax
  403e2b:	7e 43                	jle    403e70 <_ZN9CCounters13DefineCounterEi.part.0+0x50>
  403e2d:	48 8d 0c 80          	lea    (%rax,%rax,4),%rcx
  403e31:	48 8d 35 e8 62 00 00 	lea    0x62e8(%rip),%rsi        # 40a120 <CounterDefinitions>
  403e38:	48 8d 04 48          	lea    (%rax,%rcx,2),%rax
  403e3c:	48 8d 0c 86          	lea    (%rsi,%rax,4),%rcx
  403e40:	eb 0f                	jmp    403e51 <_ZN9CCounters13DefineCounterEi.part.0+0x31>
  403e42:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  403e48:	48 83 c6 2c          	add    $0x2c,%rsi
  403e4c:	48 39 ce             	cmp    %rcx,%rsi
  403e4f:	74 1f                	je     403e70 <_ZN9CCounters13DefineCounterEi.part.0+0x50>
  403e51:	39 16                	cmp    %edx,(%rsi)
  403e53:	75 f3                	jne    403e48 <_ZN9CCounters13DefineCounterEi.part.0+0x28>
  403e55:	8b 46 04             	mov    0x4(%rsi),%eax
  403e58:	23 47 58             	and    0x58(%rdi),%eax
  403e5b:	74 eb                	je     403e48 <_ZN9CCounters13DefineCounterEi.part.0+0x28>
  403e5d:	8b 46 08             	mov    0x8(%rsi),%eax
  403e60:	23 47 54             	and    0x54(%rdi),%eax
  403e63:	74 e3                	je     403e48 <_ZN9CCounters13DefineCounterEi.part.0+0x28>
  403e65:	e9 66 f0 ff ff       	jmp    402ed0 <_ZN9CCounters13DefineCounterER18SCounterDefinition>
  403e6a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  403e70:	48 8d 05 b9 42 00 00 	lea    0x42b9(%rip),%rax        # 408130 <_IO_stdin_used+0x130>
  403e77:	c3                   	ret    
  403e78:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  403e7f:	00 

0000000000403e80 <_ZN9CCounters13DefineCounterEi>:
  403e80:	f3 0f 1e fa          	endbr64 
  403e84:	85 f6                	test   %esi,%esi
  403e86:	74 08                	je     403e90 <_ZN9CCounters13DefineCounterEi+0x10>
  403e88:	eb 96                	jmp    403e20 <_ZN9CCounters13DefineCounterEi.part.0>
  403e8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  403e90:	31 c0                	xor    %eax,%eax
  403e92:	c3                   	ret    
  403e93:	90                   	nop
  403e94:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  403e9b:	00 00 00 00 
  403e9f:	90                   	nop

0000000000403ea0 <_ZN9CCounters13QueueCountersEv>:
  403ea0:	f3 0f 1e fa          	endbr64 
  403ea4:	41 56                	push   %r14
  403ea6:	48 8d 05 73 62 00 00 	lea    0x6273(%rip),%rax        # 40a120 <CounterDefinitions>
  403ead:	31 d2                	xor    %edx,%edx
  403eaf:	41 55                	push   %r13
  403eb1:	41 54                	push   %r12
  403eb3:	49 89 fc             	mov    %rdi,%r12
  403eb6:	55                   	push   %rbp
  403eb7:	53                   	push   %rbx
  403eb8:	eb 0d                	jmp    403ec7 <_ZN9CCounters13QueueCountersEv+0x27>
  403eba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  403ec0:	83 c2 01             	add    $0x1,%edx
  403ec3:	48 83 c0 2c          	add    $0x2c,%rax
  403ec7:	8b 48 08             	mov    0x8(%rax),%ecx
  403eca:	85 c9                	test   %ecx,%ecx
  403ecc:	75 f2                	jne    403ec0 <_ZN9CCounters13QueueCountersEv+0x20>
  403ece:	8b 28                	mov    (%rax),%ebp
  403ed0:	85 ed                	test   %ebp,%ebp
  403ed2:	75 ec                	jne    403ec0 <_ZN9CCounters13QueueCountersEv+0x20>
  403ed4:	41 89 94 24 60 60 80 	mov    %edx,0x806060(%r12)
  403edb:	00 
  403edc:	4c 89 e7             	mov    %r12,%rdi
  403edf:	e8 5c ed ff ff       	call   402c40 <_ZN9CCounters18GetProcessorVendorEv>
  403ee4:	89 e8                	mov    %ebp,%eax
  403ee6:	89 e9                	mov    %ebp,%ecx
  403ee8:	41 c7 44 24 54 00 00 	movl   $0x0,0x54(%r12)
  403eef:	00 00 
  403ef1:	0f a2                	cpuid  
  403ef3:	85 c0                	test   %eax,%eax
  403ef5:	74 08                	je     403eff <_ZN9CCounters13QueueCountersEv+0x5f>
  403ef7:	4c 89 e7             	mov    %r12,%rdi
  403efa:	e8 d1 df ff ff       	call   401ed0 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0>
  403eff:	4c 89 e7             	mov    %r12,%rdi
  403f02:	e8 d9 ed ff ff       	call   402ce0 <_ZN9CCounters12GetPMCSchemeEv>
  403f07:	8b 15 0b bf 00 00    	mov    0xbf0b(%rip),%edx        # 40fe18 <UsePMC>
  403f0d:	85 d2                	test   %edx,%edx
  403f0f:	74 61                	je     403f72 <_ZN9CCounters13QueueCountersEv+0xd2>
  403f11:	8b 05 fd be 00 00    	mov    0xbefd(%rip),%eax        # 40fe14 <MaxNumCounters>
  403f17:	4c 8d 35 22 ae 00 00 	lea    0xae22(%rip),%r14        # 40ed40 <CounterTypesDesired>
  403f1e:	31 db                	xor    %ebx,%ebx
  403f20:	4c 8d 2d 08 46 00 00 	lea    0x4608(%rip),%r13        # 40852f <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0xef>
  403f27:	85 c0                	test   %eax,%eax
  403f29:	7e 3c                	jle    403f67 <_ZN9CCounters13QueueCountersEv+0xc7>
  403f2b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  403f30:	41 8b 36             	mov    (%r14),%esi
  403f33:	83 c3 01             	add    $0x1,%ebx
  403f36:	85 f6                	test   %esi,%esi
  403f38:	74 21                	je     403f5b <_ZN9CCounters13QueueCountersEv+0xbb>
  403f3a:	4c 89 e7             	mov    %r12,%rdi
  403f3d:	e8 de fe ff ff       	call   403e20 <_ZN9CCounters13DefineCounterEi.part.0>
  403f42:	48 89 c1             	mov    %rax,%rcx
  403f45:	48 85 c0             	test   %rax,%rax
  403f48:	74 11                	je     403f5b <_ZN9CCounters13QueueCountersEv+0xbb>
  403f4a:	89 da                	mov    %ebx,%edx
  403f4c:	4c 89 ee             	mov    %r13,%rsi
  403f4f:	bf 01 00 00 00       	mov    $0x1,%edi
  403f54:	31 c0                	xor    %eax,%eax
  403f56:	e8 d5 d0 ff ff       	call   401030 <__printf_chk@plt>
  403f5b:	49 83 c6 04          	add    $0x4,%r14
  403f5f:	39 1d af be 00 00    	cmp    %ebx,0xbeaf(%rip)        # 40fe14 <MaxNumCounters>
  403f65:	7f c9                	jg     403f30 <_ZN9CCounters13QueueCountersEv+0x90>
  403f67:	41 81 7c 24 58 00 20 	cmpl   $0x2000,0x58(%r12)
  403f6e:	00 00 
  403f70:	74 09                	je     403f7b <_ZN9CCounters13QueueCountersEv+0xdb>
  403f72:	5b                   	pop    %rbx
  403f73:	5d                   	pop    %rbp
  403f74:	41 5c                	pop    %r12
  403f76:	41 5d                	pop    %r13
  403f78:	41 5e                	pop    %r14
  403f7a:	c3                   	ret    
  403f7b:	8b 3d 9f be 00 00    	mov    0xbe9f(%rip),%edi        # 40fe20 <NumThreads>
  403f81:	85 ff                	test   %edi,%edi
  403f83:	7e ed                	jle    403f72 <_ZN9CCounters13QueueCountersEv+0xd2>
  403f85:	41 8b b4 24 70 60 80 	mov    0x806070(%r12),%esi
  403f8c:	00 
  403f8d:	41 8b 8c 24 74 60 80 	mov    0x806074(%r12),%ecx
  403f94:	00 
  403f95:	49 8d 94 24 70 20 00 	lea    0x2070(%r12),%rdx
  403f9c:	00 
  403f9d:	0f 1f 00             	nopl   (%rax)
  403fa0:	44 8b 02             	mov    (%rdx),%r8d
  403fa3:	41 81 f8 ff 01 00 00 	cmp    $0x1ff,%r8d
  403faa:	7f 5f                	jg     40400b <_ZN9CCounters13QueueCountersEv+0x16b>
  403fac:	4c 63 cd             	movslq %ebp,%r9
  403faf:	49 63 c0             	movslq %r8d,%rax
  403fb2:	4d 69 c9 18 20 00 00 	imul   $0x2018,%r9,%r9
  403fb9:	48 c1 e0 04          	shl    $0x4,%rax
  403fbd:	4c 01 c8             	add    %r9,%rax
  403fc0:	4c 01 e0             	add    %r12,%rax
  403fc3:	c7 40 60 02 00 00 00 	movl   $0x2,0x60(%rax)
  403fca:	89 70 64             	mov    %esi,0x64(%rax)
  403fcd:	89 68 68             	mov    %ebp,0x68(%rax)
  403fd0:	c7 40 6c 00 00 00 00 	movl   $0x0,0x6c(%rax)
  403fd7:	41 8d 40 01          	lea    0x1(%r8),%eax
  403fdb:	89 02                	mov    %eax,(%rdx)
  403fdd:	3d 00 02 00 00       	cmp    $0x200,%eax
  403fe2:	74 27                	je     40400b <_ZN9CCounters13QueueCountersEv+0x16b>
  403fe4:	48 98                	cltq   
  403fe6:	41 83 c0 02          	add    $0x2,%r8d
  403fea:	48 c1 e0 04          	shl    $0x4,%rax
  403fee:	4c 01 c8             	add    %r9,%rax
  403ff1:	4c 01 e0             	add    %r12,%rax
  403ff4:	c7 40 60 02 00 00 00 	movl   $0x2,0x60(%rax)
  403ffb:	89 48 64             	mov    %ecx,0x64(%rax)
  403ffe:	89 68 68             	mov    %ebp,0x68(%rax)
  404001:	c7 40 6c 00 00 00 00 	movl   $0x0,0x6c(%rax)
  404008:	44 89 02             	mov    %r8d,(%rdx)
  40400b:	44 8b 82 00 30 40 00 	mov    0x403000(%rdx),%r8d
  404012:	41 81 f8 ff 01 00 00 	cmp    $0x1ff,%r8d
  404019:	7f 7f                	jg     40409a <_ZN9CCounters13QueueCountersEv+0x1fa>
  40401b:	4c 63 cd             	movslq %ebp,%r9
  40401e:	49 63 c0             	movslq %r8d,%rax
  404021:	4d 69 c9 18 20 00 00 	imul   $0x2018,%r9,%r9
  404028:	48 c1 e0 04          	shl    $0x4,%rax
  40402c:	4c 01 c8             	add    %r9,%rax
  40402f:	4c 01 e0             	add    %r12,%rax
  404032:	c7 80 60 30 40 00 02 	movl   $0x2,0x403060(%rax)
  404039:	00 00 00 
  40403c:	89 b0 64 30 40 00    	mov    %esi,0x403064(%rax)
  404042:	89 a8 68 30 40 00    	mov    %ebp,0x403068(%rax)
  404048:	c7 80 6c 30 40 00 00 	movl   $0x0,0x40306c(%rax)
  40404f:	00 00 00 
  404052:	41 8d 40 01          	lea    0x1(%r8),%eax
  404056:	89 82 00 30 40 00    	mov    %eax,0x403000(%rdx)
  40405c:	3d 00 02 00 00       	cmp    $0x200,%eax
  404061:	74 37                	je     40409a <_ZN9CCounters13QueueCountersEv+0x1fa>
  404063:	48 98                	cltq   
  404065:	41 83 c0 02          	add    $0x2,%r8d
  404069:	48 c1 e0 04          	shl    $0x4,%rax
  40406d:	4c 01 c8             	add    %r9,%rax
  404070:	4c 01 e0             	add    %r12,%rax
  404073:	c7 80 60 30 40 00 02 	movl   $0x2,0x403060(%rax)
  40407a:	00 00 00 
  40407d:	89 88 64 30 40 00    	mov    %ecx,0x403064(%rax)
  404083:	89 a8 68 30 40 00    	mov    %ebp,0x403068(%rax)
  404089:	c7 80 6c 30 40 00 00 	movl   $0x0,0x40306c(%rax)
  404090:	00 00 00 
  404093:	44 89 82 00 30 40 00 	mov    %r8d,0x403000(%rdx)
  40409a:	83 c5 01             	add    $0x1,%ebp
  40409d:	48 81 c2 18 20 00 00 	add    $0x2018,%rdx
  4040a4:	39 ef                	cmp    %ebp,%edi
  4040a6:	0f 85 f4 fe ff ff    	jne    403fa0 <_ZN9CCounters13QueueCountersEv+0x100>
  4040ac:	5b                   	pop    %rbx
  4040ad:	5d                   	pop    %rbp
  4040ae:	41 5c                	pop    %r12
  4040b0:	41 5d                	pop    %r13
  4040b2:	41 5e                	pop    %r14
  4040b4:	c3                   	ret    
  4040b5:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  4040bc:	00 00 00 00 

00000000004040c0 <_Z11setcountersiPPc>:
  4040c0:	f3 0f 1e fa          	endbr64 
  4040c4:	41 57                	push   %r15
  4040c6:	41 56                	push   %r14
  4040c8:	41 55                	push   %r13
  4040ca:	41 89 fd             	mov    %edi,%r13d
  4040cd:	41 54                	push   %r12
  4040cf:	49 89 f4             	mov    %rsi,%r12
  4040d2:	55                   	push   %rbp
  4040d3:	53                   	push   %rbx
  4040d4:	48 81 ec 28 01 00 00 	sub    $0x128,%rsp
  4040db:	4c 8b 76 08          	mov    0x8(%rsi),%r14
  4040df:	48 8d 35 66 44 00 00 	lea    0x4466(%rip),%rsi        # 40854c <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x10c>
  4040e6:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4040ed:	00 00 
  4040ef:	48 89 84 24 18 01 00 	mov    %rax,0x118(%rsp)
  4040f6:	00 
  4040f7:	31 c0                	xor    %eax,%eax
  4040f9:	4c 89 f7             	mov    %r14,%rdi
  4040fc:	e8 3f cf ff ff       	call   401040 <strstr@plt>
  404101:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%rsp)
  404108:	00 
  404109:	48 85 c0             	test   %rax,%rax
  40410c:	0f 84 eb 02 00 00    	je     4043fd <_Z11setcountersiPPc+0x33d>
  404112:	41 83 fd 02          	cmp    $0x2,%r13d
  404116:	0f 8f 28 02 00 00    	jg     404344 <_Z11setcountersiPPc+0x284>
  40411c:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
  404121:	31 c0                	xor    %eax,%eax
  404123:	b9 10 00 00 00       	mov    $0x10,%ecx
  404128:	be 80 00 00 00       	mov    $0x80,%esi
  40412d:	48 89 d7             	mov    %rdx,%rdi
  404130:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  404133:	31 ff                	xor    %edi,%edi
  404135:	e8 06 d0 ff ff       	call   401140 <sched_getaffinity@plt>
  40413a:	85 c0                	test   %eax,%eax
  40413c:	0f 85 a3 02 00 00    	jne    4043e5 <_Z11setcountersiPPc+0x325>
  404142:	c7 05 d4 bc 00 00 40 	movl   $0x40,0xbcd4(%rip)        # 40fe20 <NumThreads>
  404149:	00 00 00 
  40414c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  404151:	31 c0                	xor    %eax,%eax
  404153:	45 31 e4             	xor    %r12d,%r12d
  404156:	48 8d 1d 83 60 01 01 	lea    0x1016083(%rip),%rbx        # 141a1e0 <ProcNum>
  40415d:	eb 12                	jmp    404171 <_Z11setcountersiPPc+0xb1>
  40415f:	90                   	nop
  404160:	89 14 83             	mov    %edx,(%rbx,%rax,4)
  404163:	48 83 c0 01          	add    $0x1,%rax
  404167:	41 83 c4 01          	add    $0x1,%r12d
  40416b:	48 83 f8 40          	cmp    $0x40,%rax
  40416f:	74 1a                	je     40418b <_Z11setcountersiPPc+0xcb>
  404171:	48 0f a3 c1          	bt     %rax,%rcx
  404175:	89 c2                	mov    %eax,%edx
  404177:	72 e7                	jb     404160 <_Z11setcountersiPPc+0xa0>
  404179:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  40417e:	89 14 83             	mov    %edx,(%rbx,%rax,4)
  404181:	48 83 c0 01          	add    $0x1,%rax
  404185:	48 83 f8 40          	cmp    $0x40,%rax
  404189:	75 e6                	jne    404171 <_Z11setcountersiPPc+0xb1>
  40418b:	4c 8d 35 4e c1 80 00 	lea    0x80c14e(%rip),%r14        # c102e0 <MSRCounters>
  404192:	4c 89 f7             	mov    %r14,%rdi
  404195:	e8 d6 e3 ff ff       	call   402570 <_ZN9CCounters13LockProcessorEv>
  40419a:	4c 89 f7             	mov    %r14,%rdi
  40419d:	e8 fe fc ff ff       	call   403ea0 <_ZN9CCounters13QueueCountersEv>
  4041a2:	8b 0d 70 bc 00 00    	mov    0xbc70(%rip),%ecx        # 40fe18 <UsePMC>
  4041a8:	85 c9                	test   %ecx,%ecx
  4041aa:	0f 85 e8 01 00 00    	jne    404398 <_Z11setcountersiPPc+0x2d8>
  4041b0:	8b 15 6a bc 00 00    	mov    0xbc6a(%rip),%edx        # 40fe20 <NumThreads>
  4041b6:	4c 8d 3d 83 f1 c0 00 	lea    0xc0f183(%rip),%r15        # 1013340 <MSRCounters+0x403060>
  4041bd:	45 31 ed             	xor    %r13d,%r13d
  4041c0:	85 d2                	test   %edx,%edx
  4041c2:	7f 24                	jg     4041e8 <_Z11setcountersiPPc+0x128>
  4041c4:	e9 17 01 00 00       	jmp    4042e0 <_Z11setcountersiPPc+0x220>
  4041c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4041d0:	49 83 c5 01          	add    $0x1,%r13
  4041d4:	49 81 c7 18 20 00 00 	add    $0x2018,%r15
  4041db:	44 39 2d 3e bc 00 00 	cmp    %r13d,0xbc3e(%rip)        # 40fe20 <NumThreads>
  4041e2:	0f 8e f8 00 00 00    	jle    4042e0 <_Z11setcountersiPPc+0x220>
  4041e8:	42 8b 2c ab          	mov    (%rbx,%r13,4),%ebp
  4041ec:	85 ed                	test   %ebp,%ebp
  4041ee:	78 e0                	js     4041d0 <_Z11setcountersiPPc+0x110>
  4041f0:	48 8d 94 24 90 00 00 	lea    0x90(%rsp),%rdx
  4041f7:	00 
  4041f8:	b9 10 00 00 00       	mov    $0x10,%ecx
  4041fd:	31 c0                	xor    %eax,%eax
  4041ff:	48 89 d7             	mov    %rdx,%rdi
  404202:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  404205:	81 fd ff 03 00 00    	cmp    $0x3ff,%ebp
  40420b:	7f 15                	jg     404222 <_Z11setcountersiPPc+0x162>
  40420d:	48 63 c5             	movslq %ebp,%rax
  404210:	be 01 00 00 00       	mov    $0x1,%esi
  404215:	89 e9                	mov    %ebp,%ecx
  404217:	48 c1 e8 06          	shr    $0x6,%rax
  40421b:	48 d3 e6             	shl    %cl,%rsi
  40421e:	48 09 34 c2          	or     %rsi,(%rdx,%rax,8)
  404222:	48 89 14 24          	mov    %rdx,(%rsp)
  404226:	e8 95 ce ff ff       	call   4010c0 <gettid@plt>
  40422b:	48 8b 14 24          	mov    (%rsp),%rdx
  40422f:	be 80 00 00 00       	mov    $0x80,%esi
  404234:	89 c7                	mov    %eax,%edi
  404236:	e8 45 ce ff ff       	call   401080 <sched_setaffinity@plt>
  40423b:	85 c0                	test   %eax,%eax
  40423d:	0f 85 7d 00 00 00    	jne    4042c0 <_Z11setcountersiPPc+0x200>
  404243:	83 7c 24 0c 01       	cmpl   $0x1,0xc(%rsp)
  404248:	8b 05 ca bb 00 00    	mov    0xbbca(%rip),%eax        # 40fe18 <UsePMC>
  40424e:	74 40                	je     404290 <_Z11setcountersiPPc+0x1d0>
  404250:	85 c0                	test   %eax,%eax
  404252:	0f 84 78 ff ff ff    	je     4041d0 <_Z11setcountersiPPc+0x110>
  404258:	41 8b 87 10 20 00 00 	mov    0x2010(%r15),%eax
  40425f:	c1 e0 04             	shl    $0x4,%eax
  404262:	85 c0                	test   %eax,%eax
  404264:	0f 8e 66 ff ff ff    	jle    4041d0 <_Z11setcountersiPPc+0x110>
  40426a:	8b 3d 78 c0 80 00    	mov    0x80c078(%rip),%edi        # c102e8 <MSRCounters+0x8>
  404270:	85 ff                	test   %edi,%edi
  404272:	0f 84 58 ff ff ff    	je     4041d0 <_Z11setcountersiPPc+0x110>
  404278:	4c 89 fa             	mov    %r15,%rdx
  40427b:	be 01 f9 00 00       	mov    $0xf901,%esi
  404280:	31 c0                	xor    %eax,%eax
  404282:	e8 99 ce ff ff       	call   401120 <ioctl@plt>
  404287:	e9 44 ff ff ff       	jmp    4041d0 <_Z11setcountersiPPc+0x110>
  40428c:	0f 1f 40 00          	nopl   0x0(%rax)
  404290:	85 c0                	test   %eax,%eax
  404292:	0f 84 38 ff ff ff    	je     4041d0 <_Z11setcountersiPPc+0x110>
  404298:	41 8b 87 10 f0 bf ff 	mov    -0x400ff0(%r15),%eax
  40429f:	c1 e0 04             	shl    $0x4,%eax
  4042a2:	85 c0                	test   %eax,%eax
  4042a4:	0f 8e 26 ff ff ff    	jle    4041d0 <_Z11setcountersiPPc+0x110>
  4042aa:	8b 3d 38 c0 80 00    	mov    0x80c038(%rip),%edi        # c102e8 <MSRCounters+0x8>
  4042b0:	49 8d 97 00 d0 bf ff 	lea    -0x403000(%r15),%rdx
  4042b7:	85 ff                	test   %edi,%edi
  4042b9:	75 c0                	jne    40427b <_Z11setcountersiPPc+0x1bb>
  4042bb:	e9 10 ff ff ff       	jmp    4041d0 <_Z11setcountersiPPc+0x110>
  4042c0:	89 ea                	mov    %ebp,%edx
  4042c2:	48 8d 35 a7 3d 00 00 	lea    0x3da7(%rip),%rsi        # 408070 <_IO_stdin_used+0x70>
  4042c9:	bf 01 00 00 00       	mov    $0x1,%edi
  4042ce:	31 c0                	xor    %eax,%eax
  4042d0:	e8 5b cd ff ff       	call   401030 <__printf_chk@plt>
  4042d5:	e9 69 ff ff ff       	jmp    404243 <_Z11setcountersiPPc+0x183>
  4042da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4042e0:	4c 89 f7             	mov    %r14,%rdi
  4042e3:	e8 88 e4 ff ff       	call   402770 <_ZN9CCounters7CleanUpEv>
  4042e8:	83 7c 24 0c 01       	cmpl   $0x1,0xc(%rsp)
  4042ed:	8b 15 15 bb 00 00    	mov    0xbb15(%rip),%edx        # 40fe08 <NumCounters>
  4042f3:	0f 84 42 01 00 00    	je     40443b <_Z11setcountersiPPc+0x37b>
  4042f9:	44 89 e1             	mov    %r12d,%ecx
  4042fc:	48 8d 35 ad 3e 00 00 	lea    0x3ead(%rip),%rsi        # 4081b0 <_IO_stdin_used+0x1b0>
  404303:	bf 01 00 00 00       	mov    $0x1,%edi
  404308:	31 c0                	xor    %eax,%eax
  40430a:	e8 21 cd ff ff       	call   401030 <__printf_chk@plt>
  40430f:	bf 0a 00 00 00       	mov    $0xa,%edi
  404314:	e8 e7 cd ff ff       	call   401100 <putchar@plt>
  404319:	31 c0                	xor    %eax,%eax
  40431b:	48 8b 94 24 18 01 00 	mov    0x118(%rsp),%rdx
  404322:	00 
  404323:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  40432a:	00 00 
  40432c:	0f 85 87 01 00 00    	jne    4044b9 <_Z11setcountersiPPc+0x3f9>
  404332:	48 81 c4 28 01 00 00 	add    $0x128,%rsp
  404339:	5b                   	pop    %rbx
  40433a:	5d                   	pop    %rbp
  40433b:	41 5c                	pop    %r12
  40433d:	41 5d                	pop    %r13
  40433f:	41 5e                	pop    %r14
  404341:	41 5f                	pop    %r15
  404343:	c3                   	ret    
  404344:	83 7c 24 0c 02       	cmpl   $0x2,0xc(%rsp)
  404349:	41 be 64 00 00 00    	mov    $0x64,%r14d
  40434f:	b8 00 00 00 00       	mov    $0x0,%eax
  404354:	44 0f 45 f0          	cmovne %eax,%r14d
  404358:	4c 8d 3d e1 a9 00 00 	lea    0xa9e1(%rip),%r15        # 40ed40 <CounterTypesDesired>
  40435f:	31 db                	xor    %ebx,%ebx
  404361:	eb 17                	jmp    40437a <_Z11setcountersiPPc+0x2ba>
  404363:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  404368:	41 89 04 9f          	mov    %eax,(%r15,%rbx,4)
  40436c:	48 83 c3 01          	add    $0x1,%rbx
  404370:	48 83 fb 08          	cmp    $0x8,%rbx
  404374:	0f 84 a2 fd ff ff    	je     40411c <_Z11setcountersiPPc+0x5c>
  40437a:	8d 53 02             	lea    0x2(%rbx),%edx
  40437d:	44 89 f0             	mov    %r14d,%eax
  404380:	41 39 d5             	cmp    %edx,%r13d
  404383:	7e e3                	jle    404368 <_Z11setcountersiPPc+0x2a8>
  404385:	49 8b 7c dc 10       	mov    0x10(%r12,%rbx,8),%rdi
  40438a:	ba 0a 00 00 00       	mov    $0xa,%edx
  40438f:	31 f6                	xor    %esi,%esi
  404391:	e8 7a cd ff ff       	call   401110 <strtol@plt>
  404396:	eb d0                	jmp    404368 <_Z11setcountersiPPc+0x2a8>
  404398:	48 8b 3d 41 bf 80 00 	mov    0x80bf41(%rip),%rdi        # c102e0 <MSRCounters>
  40439f:	31 f6                	xor    %esi,%esi
  4043a1:	31 c0                	xor    %eax,%eax
  4043a3:	e8 c8 cc ff ff       	call   401070 <open@plt>
  4043a8:	89 05 3a bf 80 00    	mov    %eax,0x80bf3a(%rip)        # c102e8 <MSRCounters+0x8>
  4043ae:	83 f8 ff             	cmp    $0xffffffff,%eax
  4043b1:	0f 85 f9 fd ff ff    	jne    4041b0 <_Z11setcountersiPPc+0xf0>
  4043b7:	48 8b 15 22 bf 80 00 	mov    0x80bf22(%rip),%rdx        # c102e0 <MSRCounters>
  4043be:	48 8d 35 07 41 00 00 	lea    0x4107(%rip),%rsi        # 4084cc <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x8c>
  4043c5:	bf 01 00 00 00       	mov    $0x1,%edi
  4043ca:	31 c0                	xor    %eax,%eax
  4043cc:	e8 5f cc ff ff       	call   401030 <__printf_chk@plt>
  4043d1:	b8 01 00 00 00       	mov    $0x1,%eax
  4043d6:	c7 05 08 bf 80 00 00 	movl   $0x0,0x80bf08(%rip)        # c102e8 <MSRCounters+0x8>
  4043dd:	00 00 00 
  4043e0:	e9 36 ff ff ff       	jmp    40431b <_Z11setcountersiPPc+0x25b>
  4043e5:	48 8d 35 7b 41 00 00 	lea    0x417b(%rip),%rsi        # 408567 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x127>
  4043ec:	bf 01 00 00 00       	mov    $0x1,%edi
  4043f1:	31 c0                	xor    %eax,%eax
  4043f3:	e8 38 cc ff ff       	call   401030 <__printf_chk@plt>
  4043f8:	e9 45 fd ff ff       	jmp    404142 <_Z11setcountersiPPc+0x82>
  4043fd:	48 8d 35 56 41 00 00 	lea    0x4156(%rip),%rsi        # 40855a <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x11a>
  404404:	4c 89 f7             	mov    %r14,%rdi
  404407:	e8 34 cc ff ff       	call   401040 <strstr@plt>
  40440c:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%rsp)
  404413:	00 
  404414:	48 85 c0             	test   %rax,%rax
  404417:	0f 85 f5 fc ff ff    	jne    404112 <_Z11setcountersiPPc+0x52>
  40441d:	4c 89 f2             	mov    %r14,%rdx
  404420:	48 8d 35 31 3d 00 00 	lea    0x3d31(%rip),%rsi        # 408158 <_IO_stdin_used+0x158>
  404427:	bf 01 00 00 00       	mov    $0x1,%edi
  40442c:	e8 ff cb ff ff       	call   401030 <__printf_chk@plt>
  404431:	b8 01 00 00 00       	mov    $0x1,%eax
  404436:	e9 e0 fe ff ff       	jmp    40431b <_Z11setcountersiPPc+0x25b>
  40443b:	44 89 e1             	mov    %r12d,%ecx
  40443e:	48 8d 35 3b 3d 00 00 	lea    0x3d3b(%rip),%rsi        # 408180 <_IO_stdin_used+0x180>
  404445:	31 c0                	xor    %eax,%eax
  404447:	31 db                	xor    %ebx,%ebx
  404449:	bf 01 00 00 00       	mov    $0x1,%edi
  40444e:	4c 8d 2d 9b be 80 00 	lea    0x80be9b(%rip),%r13        # c102f0 <MSRCounters+0x10>
  404455:	4c 8d 25 e0 b9 00 00 	lea    0xb9e0(%rip),%r12        # 40fe3c <Counters>
  40445c:	e8 cf cb ff ff       	call   401030 <__printf_chk@plt>
  404461:	48 8d 35 19 41 00 00 	lea    0x4119(%rip),%rsi        # 408581 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x141>
  404468:	31 c0                	xor    %eax,%eax
  40446a:	bf 01 00 00 00       	mov    $0x1,%edi
  40446f:	e8 bc cb ff ff       	call   401030 <__printf_chk@plt>
  404474:	8b 05 8e b9 00 00    	mov    0xb98e(%rip),%eax        # 40fe08 <NumCounters>
  40447a:	48 8d 2d 1e 41 00 00 	lea    0x411e(%rip),%rbp        # 40859f <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x15f>
  404481:	85 c0                	test   %eax,%eax
  404483:	0f 8e 86 fe ff ff    	jle    40430f <_Z11setcountersiPPc+0x24f>
  404489:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  404490:	49 8b 4c dd 00       	mov    0x0(%r13,%rbx,8),%rcx
  404495:	41 8b 14 9c          	mov    (%r12,%rbx,4),%edx
  404499:	31 c0                	xor    %eax,%eax
  40449b:	48 89 ee             	mov    %rbp,%rsi
  40449e:	bf 01 00 00 00       	mov    $0x1,%edi
  4044a3:	48 83 c3 01          	add    $0x1,%rbx
  4044a7:	e8 84 cb ff ff       	call   401030 <__printf_chk@plt>
  4044ac:	39 1d 56 b9 00 00    	cmp    %ebx,0xb956(%rip)        # 40fe08 <NumCounters>
  4044b2:	7f dc                	jg     404490 <_Z11setcountersiPPc+0x3d0>
  4044b4:	e9 56 fe ff ff       	jmp    40430f <_Z11setcountersiPPc+0x24f>
  4044b9:	e8 12 cc ff ff       	call   4010d0 <__stack_chk_fail@plt>
  4044be:	66 90                	xchg   %ax,%ax

00000000004044c0 <_ZN9CCounters26GetP4EventSelectRegAddressEii>:
  4044c0:	f3 0f 1e fa          	endbr64 
  4044c4:	83 ff 11             	cmp    $0x11,%edi
  4044c7:	77 3f                	ja     404508 <_ZN9CCounters26GetP4EventSelectRegAddressEii+0x48>
  4044c9:	8d 47 fd             	lea    -0x3(%rdi),%eax
  4044cc:	83 ff 0f             	cmp    $0xf,%edi
  4044cf:	0f 46 c7             	cmovbe %edi,%eax
  4044d2:	83 fe 07             	cmp    $0x7,%esi
  4044d5:	77 31                	ja     404508 <_ZN9CCounters26GetP4EventSelectRegAddressEii+0x48>
  4044d7:	89 c2                	mov    %eax,%edx
  4044d9:	48 63 f6             	movslq %esi,%rsi
  4044dc:	c1 ea 02             	shr    $0x2,%edx
  4044df:	48 8d 0c d6          	lea    (%rsi,%rdx,8),%rcx
  4044e3:	48 8d 15 56 3f 00 00 	lea    0x3f56(%rip),%rdx        # 408440 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables>
  4044ea:	44 8b 04 8a          	mov    (%rdx,%rcx,4),%r8d
  4044ee:	45 85 c0             	test   %r8d,%r8d
  4044f1:	78 0a                	js     4044fd <_ZN9CCounters26GetP4EventSelectRegAddressEii+0x3d>
  4044f3:	83 e0 02             	and    $0x2,%eax
  4044f6:	83 f8 01             	cmp    $0x1,%eax
  4044f9:	41 83 d8 ff          	sbb    $0xffffffff,%r8d
  4044fd:	44 89 c0             	mov    %r8d,%eax
  404500:	c3                   	ret    
  404501:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  404508:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  40450e:	eb ed                	jmp    4044fd <_ZN9CCounters26GetP4EventSelectRegAddressEii+0x3d>

0000000000404510 <_ZN9CCountersD1Ev>:
  404510:	f3 0f 1e fa          	endbr64 
  404514:	8b 7f 08             	mov    0x8(%rdi),%edi
  404517:	85 ff                	test   %edi,%edi
  404519:	75 05                	jne    404520 <_ZN9CCountersD1Ev+0x10>
  40451b:	c3                   	ret    
  40451c:	0f 1f 40 00          	nopl   0x0(%rax)
  404520:	48 83 ec 08          	sub    $0x8,%rsp
  404524:	e8 67 cc ff ff       	call   401190 <close@plt>
  404529:	48 83 c4 08          	add    $0x8,%rsp
  40452d:	c3                   	ret    
  40452e:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  404535:	00 00 00 
  404538:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40453f:	00 

0000000000404540 <TestLoop>:
  404540:	53                   	push   %rbx
  404541:	55                   	push   %rbp
  404542:	41 54                	push   %r12
  404544:	41 55                	push   %r13
  404546:	41 56                	push   %r14
  404548:	41 57                	push   %r15
  40454a:	41 89 ff             	mov    %edi,%r15d
  40454d:	b9 10 27 00 00       	mov    $0x2710,%ecx
  404552:	b8 01 00 00 00       	mov    $0x1,%eax
  404557:	90                   	nop
  404558:	90                   	nop
  404559:	90                   	nop
  40455a:	90                   	nop
  40455b:	90                   	nop
  40455c:	90                   	nop
  40455d:	90                   	nop
  40455e:	90                   	nop
  40455f:	90                   	nop

0000000000404560 <Warmuploop>:
  404560:	0f af c1             	imul   %ecx,%eax
  404563:	0f af c1             	imul   %ecx,%eax
  404566:	0f af c1             	imul   %ecx,%eax
  404569:	0f af c1             	imul   %ecx,%eax
  40456c:	0f af c1             	imul   %ecx,%eax
  40456f:	0f af c1             	imul   %ecx,%eax
  404572:	0f af c1             	imul   %ecx,%eax
  404575:	0f af c1             	imul   %ecx,%eax
  404578:	0f af c1             	imul   %ecx,%eax
  40457b:	0f af c1             	imul   %ecx,%eax
  40457e:	ff c9                	dec    %ecx
  404580:	75 de                	jne    404560 <Warmuploop>
  404582:	9b db e3             	finit  
  404585:	c5 fc 77             	vzeroall 
  404588:	41 69 c7 00 04 00 00 	imul   $0x400,%r15d,%eax
  40458f:	48 8d 35 2a b9 00 00 	lea    0xb92a(%rip),%rsi        # 40fec0 <UserData>
  404596:	48 01 c6             	add    %rax,%rsi
  404599:	48 8d be 00 02 00 00 	lea    0x200(%rsi),%rdi
  4045a0:	31 ed                	xor    %ebp,%ebp
  4045a2:	4c 8d 2d d7 a7 00 00 	lea    0xa7d7(%rip),%r13        # 40ed80 <ThreadData>
  4045a9:	41 69 c7 80 10 00 00 	imul   $0x1080,%r15d,%eax
  4045b0:	49 01 c5             	add    %rax,%r13
  4045b3:	49 89 a5 58 10 00 00 	mov    %rsp,0x1058(%r13)
  4045ba:	45 31 f6             	xor    %r14d,%r14d

00000000004045bd <TEST_LOOP_1>:
  4045bd:	31 c0                	xor    %eax,%eax
  4045bf:	0f a2                	cpuid  
  4045c1:	8b 0d 75 b8 00 00    	mov    0xb875(%rip),%ecx        # 40fe3c <Counters>
  4045c7:	0f 33                	rdpmc  
  4045c9:	41 89 45 04          	mov    %eax,0x4(%r13)
  4045cd:	8b 0d 6d b8 00 00    	mov    0xb86d(%rip),%ecx        # 40fe40 <Counters+0x4>
  4045d3:	0f 33                	rdpmc  
  4045d5:	41 89 45 08          	mov    %eax,0x8(%r13)
  4045d9:	8b 0d 65 b8 00 00    	mov    0xb865(%rip),%ecx        # 40fe44 <Counters+0x8>
  4045df:	0f 33                	rdpmc  
  4045e1:	41 89 45 0c          	mov    %eax,0xc(%r13)
  4045e5:	8b 0d 5d b8 00 00    	mov    0xb85d(%rip),%ecx        # 40fe48 <Counters+0xc>
  4045eb:	0f 33                	rdpmc  
  4045ed:	41 89 45 10          	mov    %eax,0x10(%r13)
  4045f1:	8b 0d 55 b8 00 00    	mov    0xb855(%rip),%ecx        # 40fe4c <Counters+0x10>
  4045f7:	0f 33                	rdpmc  
  4045f9:	41 89 45 14          	mov    %eax,0x14(%r13)
  4045fd:	8b 0d 4d b8 00 00    	mov    0xb84d(%rip),%ecx        # 40fe50 <Counters+0x14>
  404603:	0f 33                	rdpmc  
  404605:	41 89 45 18          	mov    %eax,0x18(%r13)
  404609:	8b 0d 45 b8 00 00    	mov    0xb845(%rip),%ecx        # 40fe54 <Counters+0x18>
  40460f:	0f 33                	rdpmc  
  404611:	41 89 45 1c          	mov    %eax,0x1c(%r13)
  404615:	8b 0d 3d b8 00 00    	mov    0xb83d(%rip),%ecx        # 40fe58 <Counters+0x1c>
  40461b:	0f 33                	rdpmc  
  40461d:	41 89 45 20          	mov    %eax,0x20(%r13)
  404621:	31 c0                	xor    %eax,%eax
  404623:	0f a2                	cpuid  
  404625:	0f 31                	rdtsc  
  404627:	41 89 45 00          	mov    %eax,0x0(%r13)
  40462b:	31 c0                	xor    %eax,%eax
  40462d:	0f a2                	cpuid  
  40462f:	31 c0                	xor    %eax,%eax
  404631:	0f a2                	cpuid  
  404633:	0f 31                	rdtsc  
  404635:	41 29 45 00          	sub    %eax,0x0(%r13)
  404639:	31 c0                	xor    %eax,%eax
  40463b:	0f a2                	cpuid  
  40463d:	8b 0d f9 b7 00 00    	mov    0xb7f9(%rip),%ecx        # 40fe3c <Counters>
  404643:	0f 33                	rdpmc  
  404645:	41 29 45 04          	sub    %eax,0x4(%r13)
  404649:	8b 0d f1 b7 00 00    	mov    0xb7f1(%rip),%ecx        # 40fe40 <Counters+0x4>
  40464f:	0f 33                	rdpmc  
  404651:	41 29 45 08          	sub    %eax,0x8(%r13)
  404655:	8b 0d e9 b7 00 00    	mov    0xb7e9(%rip),%ecx        # 40fe44 <Counters+0x8>
  40465b:	0f 33                	rdpmc  
  40465d:	41 29 45 0c          	sub    %eax,0xc(%r13)
  404661:	8b 0d e1 b7 00 00    	mov    0xb7e1(%rip),%ecx        # 40fe48 <Counters+0xc>
  404667:	0f 33                	rdpmc  
  404669:	41 29 45 10          	sub    %eax,0x10(%r13)
  40466d:	8b 0d d9 b7 00 00    	mov    0xb7d9(%rip),%ecx        # 40fe4c <Counters+0x10>
  404673:	0f 33                	rdpmc  
  404675:	41 29 45 14          	sub    %eax,0x14(%r13)
  404679:	8b 0d d1 b7 00 00    	mov    0xb7d1(%rip),%ecx        # 40fe50 <Counters+0x14>
  40467f:	0f 33                	rdpmc  
  404681:	41 29 45 18          	sub    %eax,0x18(%r13)
  404685:	8b 0d c9 b7 00 00    	mov    0xb7c9(%rip),%ecx        # 40fe54 <Counters+0x18>
  40468b:	0f 33                	rdpmc  
  40468d:	41 29 45 1c          	sub    %eax,0x1c(%r13)
  404691:	8b 0d c1 b7 00 00    	mov    0xb7c1(%rip),%ecx        # 40fe58 <Counters+0x1c>
  404697:	0f 33                	rdpmc  
  404699:	41 29 45 20          	sub    %eax,0x20(%r13)
  40469d:	31 c0                	xor    %eax,%eax
  40469f:	0f a2                	cpuid  
  4046a1:	41 8b 45 00          	mov    0x0(%r13),%eax
  4046a5:	f7 d8                	neg    %eax
  4046a7:	41 8b 5d 48          	mov    0x48(%r13),%ebx
  4046ab:	39 d8                	cmp    %ebx,%eax
  4046ad:	0f 42 d8             	cmovb  %eax,%ebx
  4046b0:	41 89 5d 48          	mov    %ebx,0x48(%r13)
  4046b4:	41 8b 45 04          	mov    0x4(%r13),%eax
  4046b8:	f7 d8                	neg    %eax
  4046ba:	41 8b 5d 4c          	mov    0x4c(%r13),%ebx
  4046be:	39 d8                	cmp    %ebx,%eax
  4046c0:	0f 42 d8             	cmovb  %eax,%ebx
  4046c3:	41 89 5d 4c          	mov    %ebx,0x4c(%r13)
  4046c7:	41 8b 45 08          	mov    0x8(%r13),%eax
  4046cb:	f7 d8                	neg    %eax
  4046cd:	41 8b 5d 50          	mov    0x50(%r13),%ebx
  4046d1:	39 d8                	cmp    %ebx,%eax
  4046d3:	0f 42 d8             	cmovb  %eax,%ebx
  4046d6:	41 89 5d 50          	mov    %ebx,0x50(%r13)
  4046da:	41 8b 45 0c          	mov    0xc(%r13),%eax
  4046de:	f7 d8                	neg    %eax
  4046e0:	41 8b 5d 54          	mov    0x54(%r13),%ebx
  4046e4:	39 d8                	cmp    %ebx,%eax
  4046e6:	0f 42 d8             	cmovb  %eax,%ebx
  4046e9:	41 89 5d 54          	mov    %ebx,0x54(%r13)
  4046ed:	41 8b 45 10          	mov    0x10(%r13),%eax
  4046f1:	f7 d8                	neg    %eax
  4046f3:	41 8b 5d 58          	mov    0x58(%r13),%ebx
  4046f7:	39 d8                	cmp    %ebx,%eax
  4046f9:	0f 42 d8             	cmovb  %eax,%ebx
  4046fc:	41 89 5d 58          	mov    %ebx,0x58(%r13)
  404700:	41 8b 45 14          	mov    0x14(%r13),%eax
  404704:	f7 d8                	neg    %eax
  404706:	41 8b 5d 5c          	mov    0x5c(%r13),%ebx
  40470a:	39 d8                	cmp    %ebx,%eax
  40470c:	0f 42 d8             	cmovb  %eax,%ebx
  40470f:	41 89 5d 5c          	mov    %ebx,0x5c(%r13)
  404713:	41 8b 45 18          	mov    0x18(%r13),%eax
  404717:	f7 d8                	neg    %eax
  404719:	41 8b 5d 60          	mov    0x60(%r13),%ebx
  40471d:	39 d8                	cmp    %ebx,%eax
  40471f:	0f 42 d8             	cmovb  %eax,%ebx
  404722:	41 89 5d 60          	mov    %ebx,0x60(%r13)
  404726:	41 8b 45 1c          	mov    0x1c(%r13),%eax
  40472a:	f7 d8                	neg    %eax
  40472c:	41 8b 5d 64          	mov    0x64(%r13),%ebx
  404730:	39 d8                	cmp    %ebx,%eax
  404732:	0f 42 d8             	cmovb  %eax,%ebx
  404735:	41 89 5d 64          	mov    %ebx,0x64(%r13)
  404739:	41 8b 45 20          	mov    0x20(%r13),%eax
  40473d:	f7 d8                	neg    %eax
  40473f:	41 8b 5d 68          	mov    0x68(%r13),%ebx
  404743:	39 d8                	cmp    %ebx,%eax
  404745:	0f 42 d8             	cmovb  %eax,%ebx
  404748:	41 89 5d 68          	mov    %ebx,0x68(%r13)
  40474c:	41 ff c6             	inc    %r14d
  40474f:	41 83 fe 04          	cmp    $0x4,%r14d
  404753:	0f 82 64 fe ff ff    	jb     4045bd <TEST_LOOP_1>

0000000000404759 <SECOND_LOOP>:
  404759:	e8 b4 2a 00 00       	call   407212 <dummy_target_0>
  40475e:	e8 b7 2e 00 00       	call   40761a <malicious_target_0>
  404763:	0f ae f0             	mfence 
  404766:	31 c0                	xor    %eax,%eax
  404768:	0f a2                	cpuid  
  40476a:	e8 a3 2a 00 00       	call   407212 <dummy_target_0>
  40476f:	e8 a6 2e 00 00       	call   40761a <malicious_target_0>
  404774:	0f ae f0             	mfence 
  404777:	31 c0                	xor    %eax,%eax
  404779:	0f a2                	cpuid  
  40477b:	e8 92 2a 00 00       	call   407212 <dummy_target_0>
  404780:	e8 95 2e 00 00       	call   40761a <malicious_target_0>
  404785:	0f ae f0             	mfence 
  404788:	31 c0                	xor    %eax,%eax
  40478a:	0f a2                	cpuid  
  40478c:	e8 81 2a 00 00       	call   407212 <dummy_target_0>
  404791:	e8 84 2e 00 00       	call   40761a <malicious_target_0>
  404796:	0f ae f0             	mfence 
  404799:	31 c0                	xor    %eax,%eax
  40479b:	0f a2                	cpuid  
  40479d:	e8 70 2a 00 00       	call   407212 <dummy_target_0>
  4047a2:	e8 73 2e 00 00       	call   40761a <malicious_target_0>
  4047a7:	0f ae f0             	mfence 
  4047aa:	31 c0                	xor    %eax,%eax
  4047ac:	0f a2                	cpuid  
  4047ae:	e8 5f 2a 00 00       	call   407212 <dummy_target_0>
  4047b3:	e8 62 2e 00 00       	call   40761a <malicious_target_0>
  4047b8:	0f ae f0             	mfence 
  4047bb:	31 c0                	xor    %eax,%eax
  4047bd:	0f a2                	cpuid  
  4047bf:	e8 4e 2a 00 00       	call   407212 <dummy_target_0>
  4047c4:	e8 51 2e 00 00       	call   40761a <malicious_target_0>
  4047c9:	0f ae f0             	mfence 
  4047cc:	31 c0                	xor    %eax,%eax
  4047ce:	0f a2                	cpuid  
  4047d0:	e8 3d 2a 00 00       	call   407212 <dummy_target_0>
  4047d5:	e8 40 2e 00 00       	call   40761a <malicious_target_0>
  4047da:	0f ae f0             	mfence 
  4047dd:	31 c0                	xor    %eax,%eax
  4047df:	0f a2                	cpuid  
  4047e1:	e8 2c 2a 00 00       	call   407212 <dummy_target_0>
  4047e6:	e8 2f 2e 00 00       	call   40761a <malicious_target_0>
  4047eb:	0f ae f0             	mfence 
  4047ee:	31 c0                	xor    %eax,%eax
  4047f0:	0f a2                	cpuid  
  4047f2:	e8 1b 2a 00 00       	call   407212 <dummy_target_0>
  4047f7:	e8 1e 2e 00 00       	call   40761a <malicious_target_0>
  4047fc:	0f ae f0             	mfence 
  4047ff:	31 c0                	xor    %eax,%eax
  404801:	0f a2                	cpuid  
  404803:	45 31 f6             	xor    %r14d,%r14d

0000000000404806 <TEST_LOOP_2>:
  404806:	c7 05 0c b6 00 00 01 	movl   $0x1,0xb60c(%rip)        # 40fe1c <PrintCustomPMC>
  40480d:	00 00 00 
  404810:	48 8d 05 a9 b6 00 00 	lea    0xb6a9(%rip),%rax        # 40fec0 <UserData>
  404817:	48 89 05 a2 b6 80 00 	mov    %rax,0x80b6a2(%rip)        # c0fec0 <UserDataPtr>
  40481e:	48 8d 05 9b b6 80 00 	lea    0x80b69b(%rip),%rax        # c0fec0 <UserDataPtr>
  404825:	48 89 05 14 b7 80 00 	mov    %rax,0x80b714(%rip)        # c0ff40 <UserDataPtrPtr>
  40482c:	48 8d 05 0d b7 80 00 	lea    0x80b70d(%rip),%rax        # c0ff40 <UserDataPtrPtr>
  404833:	48 89 05 06 b8 80 00 	mov    %rax,0x80b806(%rip)        # c10040 <UserDataPtrPtrPtr>
  40483a:	31 c0                	xor    %eax,%eax
  40483c:	0f a2                	cpuid  
  40483e:	41 83 ff 00          	cmp    $0x0,%r15d
  404842:	74 00                	je     404844 <THREAD_T0>

0000000000404844 <THREAD_T0>:
  404844:	31 c0                	xor    %eax,%eax
  404846:	0f a2                	cpuid  
  404848:	8b 0d ee b5 00 00    	mov    0xb5ee(%rip),%ecx        # 40fe3c <Counters>
  40484e:	0f 33                	rdpmc  
  404850:	41 89 45 04          	mov    %eax,0x4(%r13)
  404854:	8b 0d e6 b5 00 00    	mov    0xb5e6(%rip),%ecx        # 40fe40 <Counters+0x4>
  40485a:	0f 33                	rdpmc  
  40485c:	41 89 45 08          	mov    %eax,0x8(%r13)
  404860:	8b 0d de b5 00 00    	mov    0xb5de(%rip),%ecx        # 40fe44 <Counters+0x8>
  404866:	0f 33                	rdpmc  
  404868:	41 89 45 0c          	mov    %eax,0xc(%r13)
  40486c:	8b 0d d6 b5 00 00    	mov    0xb5d6(%rip),%ecx        # 40fe48 <Counters+0xc>
  404872:	0f 33                	rdpmc  
  404874:	41 89 45 10          	mov    %eax,0x10(%r13)
  404878:	8b 0d ce b5 00 00    	mov    0xb5ce(%rip),%ecx        # 40fe4c <Counters+0x10>
  40487e:	0f 33                	rdpmc  
  404880:	41 89 45 14          	mov    %eax,0x14(%r13)
  404884:	8b 0d c6 b5 00 00    	mov    0xb5c6(%rip),%ecx        # 40fe50 <Counters+0x14>
  40488a:	0f 33                	rdpmc  
  40488c:	41 89 45 18          	mov    %eax,0x18(%r13)
  404890:	8b 0d be b5 00 00    	mov    0xb5be(%rip),%ecx        # 40fe54 <Counters+0x18>
  404896:	0f 33                	rdpmc  
  404898:	41 89 45 1c          	mov    %eax,0x1c(%r13)
  40489c:	8b 0d b6 b5 00 00    	mov    0xb5b6(%rip),%ecx        # 40fe58 <Counters+0x1c>
  4048a2:	0f 33                	rdpmc  
  4048a4:	41 89 45 20          	mov    %eax,0x20(%r13)
  4048a8:	31 c0                	xor    %eax,%eax
  4048aa:	0f a2                	cpuid  
  4048ac:	0f 31                	rdtsc  
  4048ae:	41 89 45 00          	mov    %eax,0x0(%r13)
  4048b2:	31 c0                	xor    %eax,%eax
  4048b4:	0f a2                	cpuid  

00000000004048b6 <Test_start>:
  4048b6:	41 bc e8 03 00 00    	mov    $0x3e8,%r12d
  4048bc:	90                   	nop
  4048bd:	90                   	nop
  4048be:	90                   	nop
  4048bf:	90                   	nop

00000000004048c0 <REPETITIONS1LOOP>:
  4048c0:	b8 01 00 00 00       	mov    $0x1,%eax
  4048c5:	48 8b 1d b8 b5 00 00 	mov    0xb5b8(%rip),%rbx        # 40fe84 <PSharedMemory2>
  4048cc:	87 03                	xchg   %eax,(%rbx)
  4048ce:	85 c0                	test   %eax,%eax
  4048d0:	75 ee                	jne    4048c0 <REPETITIONS1LOOP>
  4048d2:	4c 8d 1d 39 29 00 00 	lea    0x2939(%rip),%r11        # 407212 <dummy_target_0>
  4048d9:	0f ae f0             	mfence 
  4048dc:	31 c0                	xor    %eax,%eax
  4048de:	0f a2                	cpuid  
  4048e0:	e8 05 15 00 00       	call   405dea <start_collision>
  4048e5:	4c 8d 1d 26 29 00 00 	lea    0x2926(%rip),%r11        # 407212 <dummy_target_0>
  4048ec:	0f ae f0             	mfence 
  4048ef:	31 c0                	xor    %eax,%eax
  4048f1:	0f a2                	cpuid  
  4048f3:	e8 f2 14 00 00       	call   405dea <start_collision>
  4048f8:	4c 8d 1d 13 29 00 00 	lea    0x2913(%rip),%r11        # 407212 <dummy_target_0>
  4048ff:	0f ae f0             	mfence 
  404902:	31 c0                	xor    %eax,%eax
  404904:	0f a2                	cpuid  
  404906:	e8 df 14 00 00       	call   405dea <start_collision>
  40490b:	4c 8d 1d 00 29 00 00 	lea    0x2900(%rip),%r11        # 407212 <dummy_target_0>
  404912:	0f ae f0             	mfence 
  404915:	31 c0                	xor    %eax,%eax
  404917:	0f a2                	cpuid  
  404919:	e8 cc 14 00 00       	call   405dea <start_collision>
  40491e:	4c 8d 1d ed 28 00 00 	lea    0x28ed(%rip),%r11        # 407212 <dummy_target_0>
  404925:	0f ae f0             	mfence 
  404928:	31 c0                	xor    %eax,%eax
  40492a:	0f a2                	cpuid  
  40492c:	e8 b9 14 00 00       	call   405dea <start_collision>
  404931:	4c 8d 1d da 28 00 00 	lea    0x28da(%rip),%r11        # 407212 <dummy_target_0>
  404938:	0f ae f0             	mfence 
  40493b:	31 c0                	xor    %eax,%eax
  40493d:	0f a2                	cpuid  
  40493f:	e8 a6 14 00 00       	call   405dea <start_collision>
  404944:	4c 8d 1d c7 28 00 00 	lea    0x28c7(%rip),%r11        # 407212 <dummy_target_0>
  40494b:	0f ae f0             	mfence 
  40494e:	31 c0                	xor    %eax,%eax
  404950:	0f a2                	cpuid  
  404952:	e8 93 14 00 00       	call   405dea <start_collision>
  404957:	4c 8d 1d b4 28 00 00 	lea    0x28b4(%rip),%r11        # 407212 <dummy_target_0>
  40495e:	0f ae f0             	mfence 
  404961:	31 c0                	xor    %eax,%eax
  404963:	0f a2                	cpuid  
  404965:	e8 80 14 00 00       	call   405dea <start_collision>
  40496a:	4c 8d 1d a1 28 00 00 	lea    0x28a1(%rip),%r11        # 407212 <dummy_target_0>
  404971:	0f ae f0             	mfence 
  404974:	31 c0                	xor    %eax,%eax
  404976:	0f a2                	cpuid  
  404978:	e8 6d 14 00 00       	call   405dea <start_collision>
  40497d:	4c 8d 1d 8e 28 00 00 	lea    0x288e(%rip),%r11        # 407212 <dummy_target_0>
  404984:	0f ae f0             	mfence 
  404987:	31 c0                	xor    %eax,%eax
  404989:	0f a2                	cpuid  
  40498b:	e8 5a 14 00 00       	call   405dea <start_collision>
  404990:	4c 8d 1d 7b 28 00 00 	lea    0x287b(%rip),%r11        # 407212 <dummy_target_0>
  404997:	0f ae f0             	mfence 
  40499a:	31 c0                	xor    %eax,%eax
  40499c:	0f a2                	cpuid  
  40499e:	e8 47 14 00 00       	call   405dea <start_collision>
  4049a3:	4c 8d 1d 68 28 00 00 	lea    0x2868(%rip),%r11        # 407212 <dummy_target_0>
  4049aa:	0f ae f0             	mfence 
  4049ad:	31 c0                	xor    %eax,%eax
  4049af:	0f a2                	cpuid  
  4049b1:	e8 34 14 00 00       	call   405dea <start_collision>
  4049b6:	4c 8d 1d 55 28 00 00 	lea    0x2855(%rip),%r11        # 407212 <dummy_target_0>
  4049bd:	0f ae f0             	mfence 
  4049c0:	31 c0                	xor    %eax,%eax
  4049c2:	0f a2                	cpuid  
  4049c4:	e8 21 14 00 00       	call   405dea <start_collision>
  4049c9:	4c 8d 1d 42 28 00 00 	lea    0x2842(%rip),%r11        # 407212 <dummy_target_0>
  4049d0:	0f ae f0             	mfence 
  4049d3:	31 c0                	xor    %eax,%eax
  4049d5:	0f a2                	cpuid  
  4049d7:	e8 0e 14 00 00       	call   405dea <start_collision>
  4049dc:	4c 8d 1d 2f 28 00 00 	lea    0x282f(%rip),%r11        # 407212 <dummy_target_0>
  4049e3:	0f ae f0             	mfence 
  4049e6:	31 c0                	xor    %eax,%eax
  4049e8:	0f a2                	cpuid  
  4049ea:	e8 fb 13 00 00       	call   405dea <start_collision>
  4049ef:	4c 8d 1d 1c 28 00 00 	lea    0x281c(%rip),%r11        # 407212 <dummy_target_0>
  4049f6:	0f ae f0             	mfence 
  4049f9:	31 c0                	xor    %eax,%eax
  4049fb:	0f a2                	cpuid  
  4049fd:	e8 e8 13 00 00       	call   405dea <start_collision>
  404a02:	4c 8d 1d 09 28 00 00 	lea    0x2809(%rip),%r11        # 407212 <dummy_target_0>
  404a09:	0f ae f0             	mfence 
  404a0c:	31 c0                	xor    %eax,%eax
  404a0e:	0f a2                	cpuid  
  404a10:	e8 d5 13 00 00       	call   405dea <start_collision>
  404a15:	4c 8d 1d f6 27 00 00 	lea    0x27f6(%rip),%r11        # 407212 <dummy_target_0>
  404a1c:	0f ae f0             	mfence 
  404a1f:	31 c0                	xor    %eax,%eax
  404a21:	0f a2                	cpuid  
  404a23:	e8 c2 13 00 00       	call   405dea <start_collision>
  404a28:	4c 8d 1d e3 27 00 00 	lea    0x27e3(%rip),%r11        # 407212 <dummy_target_0>
  404a2f:	0f ae f0             	mfence 
  404a32:	31 c0                	xor    %eax,%eax
  404a34:	0f a2                	cpuid  
  404a36:	e8 af 13 00 00       	call   405dea <start_collision>
  404a3b:	4c 8d 1d d0 27 00 00 	lea    0x27d0(%rip),%r11        # 407212 <dummy_target_0>
  404a42:	0f ae f0             	mfence 
  404a45:	31 c0                	xor    %eax,%eax
  404a47:	0f a2                	cpuid  
  404a49:	e8 9c 13 00 00       	call   405dea <start_collision>
  404a4e:	4c 8d 1d bd 27 00 00 	lea    0x27bd(%rip),%r11        # 407212 <dummy_target_0>
  404a55:	0f ae f0             	mfence 
  404a58:	31 c0                	xor    %eax,%eax
  404a5a:	0f a2                	cpuid  
  404a5c:	e8 89 13 00 00       	call   405dea <start_collision>
  404a61:	4c 8d 1d aa 27 00 00 	lea    0x27aa(%rip),%r11        # 407212 <dummy_target_0>
  404a68:	0f ae f0             	mfence 
  404a6b:	31 c0                	xor    %eax,%eax
  404a6d:	0f a2                	cpuid  
  404a6f:	e8 76 13 00 00       	call   405dea <start_collision>
  404a74:	4c 8d 1d 97 27 00 00 	lea    0x2797(%rip),%r11        # 407212 <dummy_target_0>
  404a7b:	0f ae f0             	mfence 
  404a7e:	31 c0                	xor    %eax,%eax
  404a80:	0f a2                	cpuid  
  404a82:	e8 63 13 00 00       	call   405dea <start_collision>
  404a87:	4c 8d 1d 84 27 00 00 	lea    0x2784(%rip),%r11        # 407212 <dummy_target_0>
  404a8e:	0f ae f0             	mfence 
  404a91:	31 c0                	xor    %eax,%eax
  404a93:	0f a2                	cpuid  
  404a95:	e8 50 13 00 00       	call   405dea <start_collision>
  404a9a:	4c 8d 1d 71 27 00 00 	lea    0x2771(%rip),%r11        # 407212 <dummy_target_0>
  404aa1:	0f ae f0             	mfence 
  404aa4:	31 c0                	xor    %eax,%eax
  404aa6:	0f a2                	cpuid  
  404aa8:	e8 3d 13 00 00       	call   405dea <start_collision>
  404aad:	4c 8d 1d 5e 27 00 00 	lea    0x275e(%rip),%r11        # 407212 <dummy_target_0>
  404ab4:	0f ae f0             	mfence 
  404ab7:	31 c0                	xor    %eax,%eax
  404ab9:	0f a2                	cpuid  
  404abb:	e8 2a 13 00 00       	call   405dea <start_collision>
  404ac0:	4c 8d 1d 4b 27 00 00 	lea    0x274b(%rip),%r11        # 407212 <dummy_target_0>
  404ac7:	0f ae f0             	mfence 
  404aca:	31 c0                	xor    %eax,%eax
  404acc:	0f a2                	cpuid  
  404ace:	e8 17 13 00 00       	call   405dea <start_collision>
  404ad3:	4c 8d 1d 38 27 00 00 	lea    0x2738(%rip),%r11        # 407212 <dummy_target_0>
  404ada:	0f ae f0             	mfence 
  404add:	31 c0                	xor    %eax,%eax
  404adf:	0f a2                	cpuid  
  404ae1:	e8 04 13 00 00       	call   405dea <start_collision>
  404ae6:	4c 8d 1d 25 27 00 00 	lea    0x2725(%rip),%r11        # 407212 <dummy_target_0>
  404aed:	0f ae f0             	mfence 
  404af0:	31 c0                	xor    %eax,%eax
  404af2:	0f a2                	cpuid  
  404af4:	e8 f1 12 00 00       	call   405dea <start_collision>
  404af9:	4c 8d 1d 12 27 00 00 	lea    0x2712(%rip),%r11        # 407212 <dummy_target_0>
  404b00:	0f ae f0             	mfence 
  404b03:	31 c0                	xor    %eax,%eax
  404b05:	0f a2                	cpuid  
  404b07:	e8 de 12 00 00       	call   405dea <start_collision>
  404b0c:	4c 8d 1d ff 26 00 00 	lea    0x26ff(%rip),%r11        # 407212 <dummy_target_0>
  404b13:	0f ae f0             	mfence 
  404b16:	31 c0                	xor    %eax,%eax
  404b18:	0f a2                	cpuid  
  404b1a:	e8 cb 12 00 00       	call   405dea <start_collision>
  404b1f:	4c 8d 1d ec 26 00 00 	lea    0x26ec(%rip),%r11        # 407212 <dummy_target_0>
  404b26:	0f ae f0             	mfence 
  404b29:	31 c0                	xor    %eax,%eax
  404b2b:	0f a2                	cpuid  
  404b2d:	e8 b8 12 00 00       	call   405dea <start_collision>
  404b32:	4c 8d 1d d9 26 00 00 	lea    0x26d9(%rip),%r11        # 407212 <dummy_target_0>
  404b39:	0f ae f0             	mfence 
  404b3c:	31 c0                	xor    %eax,%eax
  404b3e:	0f a2                	cpuid  
  404b40:	e8 a5 12 00 00       	call   405dea <start_collision>
  404b45:	4c 8d 1d c6 26 00 00 	lea    0x26c6(%rip),%r11        # 407212 <dummy_target_0>
  404b4c:	0f ae f0             	mfence 
  404b4f:	31 c0                	xor    %eax,%eax
  404b51:	0f a2                	cpuid  
  404b53:	e8 92 12 00 00       	call   405dea <start_collision>
  404b58:	4c 8d 1d b3 26 00 00 	lea    0x26b3(%rip),%r11        # 407212 <dummy_target_0>
  404b5f:	0f ae f0             	mfence 
  404b62:	31 c0                	xor    %eax,%eax
  404b64:	0f a2                	cpuid  
  404b66:	e8 7f 12 00 00       	call   405dea <start_collision>
  404b6b:	4c 8d 1d a0 26 00 00 	lea    0x26a0(%rip),%r11        # 407212 <dummy_target_0>
  404b72:	0f ae f0             	mfence 
  404b75:	31 c0                	xor    %eax,%eax
  404b77:	0f a2                	cpuid  
  404b79:	e8 6c 12 00 00       	call   405dea <start_collision>
  404b7e:	4c 8d 1d 8d 26 00 00 	lea    0x268d(%rip),%r11        # 407212 <dummy_target_0>
  404b85:	0f ae f0             	mfence 
  404b88:	31 c0                	xor    %eax,%eax
  404b8a:	0f a2                	cpuid  
  404b8c:	e8 59 12 00 00       	call   405dea <start_collision>
  404b91:	4c 8d 1d 7a 26 00 00 	lea    0x267a(%rip),%r11        # 407212 <dummy_target_0>
  404b98:	0f ae f0             	mfence 
  404b9b:	31 c0                	xor    %eax,%eax
  404b9d:	0f a2                	cpuid  
  404b9f:	e8 46 12 00 00       	call   405dea <start_collision>
  404ba4:	4c 8d 1d 67 26 00 00 	lea    0x2667(%rip),%r11        # 407212 <dummy_target_0>
  404bab:	0f ae f0             	mfence 
  404bae:	31 c0                	xor    %eax,%eax
  404bb0:	0f a2                	cpuid  
  404bb2:	e8 33 12 00 00       	call   405dea <start_collision>
  404bb7:	4c 8d 1d 54 26 00 00 	lea    0x2654(%rip),%r11        # 407212 <dummy_target_0>
  404bbe:	0f ae f0             	mfence 
  404bc1:	31 c0                	xor    %eax,%eax
  404bc3:	0f a2                	cpuid  
  404bc5:	e8 20 12 00 00       	call   405dea <start_collision>
  404bca:	4c 8d 1d 41 26 00 00 	lea    0x2641(%rip),%r11        # 407212 <dummy_target_0>
  404bd1:	0f ae f0             	mfence 
  404bd4:	31 c0                	xor    %eax,%eax
  404bd6:	0f a2                	cpuid  
  404bd8:	e8 0d 12 00 00       	call   405dea <start_collision>
  404bdd:	4c 8d 1d 2e 26 00 00 	lea    0x262e(%rip),%r11        # 407212 <dummy_target_0>
  404be4:	0f ae f0             	mfence 
  404be7:	31 c0                	xor    %eax,%eax
  404be9:	0f a2                	cpuid  
  404beb:	e8 fa 11 00 00       	call   405dea <start_collision>
  404bf0:	4c 8d 1d 1b 26 00 00 	lea    0x261b(%rip),%r11        # 407212 <dummy_target_0>
  404bf7:	0f ae f0             	mfence 
  404bfa:	31 c0                	xor    %eax,%eax
  404bfc:	0f a2                	cpuid  
  404bfe:	e8 e7 11 00 00       	call   405dea <start_collision>
  404c03:	4c 8d 1d 08 26 00 00 	lea    0x2608(%rip),%r11        # 407212 <dummy_target_0>
  404c0a:	0f ae f0             	mfence 
  404c0d:	31 c0                	xor    %eax,%eax
  404c0f:	0f a2                	cpuid  
  404c11:	e8 d4 11 00 00       	call   405dea <start_collision>
  404c16:	4c 8d 1d f5 25 00 00 	lea    0x25f5(%rip),%r11        # 407212 <dummy_target_0>
  404c1d:	0f ae f0             	mfence 
  404c20:	31 c0                	xor    %eax,%eax
  404c22:	0f a2                	cpuid  
  404c24:	e8 c1 11 00 00       	call   405dea <start_collision>
  404c29:	4c 8d 1d e2 25 00 00 	lea    0x25e2(%rip),%r11        # 407212 <dummy_target_0>
  404c30:	0f ae f0             	mfence 
  404c33:	31 c0                	xor    %eax,%eax
  404c35:	0f a2                	cpuid  
  404c37:	e8 ae 11 00 00       	call   405dea <start_collision>
  404c3c:	4c 8d 1d cf 25 00 00 	lea    0x25cf(%rip),%r11        # 407212 <dummy_target_0>
  404c43:	0f ae f0             	mfence 
  404c46:	31 c0                	xor    %eax,%eax
  404c48:	0f a2                	cpuid  
  404c4a:	e8 9b 11 00 00       	call   405dea <start_collision>
  404c4f:	4c 8d 1d bc 25 00 00 	lea    0x25bc(%rip),%r11        # 407212 <dummy_target_0>
  404c56:	0f ae f0             	mfence 
  404c59:	31 c0                	xor    %eax,%eax
  404c5b:	0f a2                	cpuid  
  404c5d:	e8 88 11 00 00       	call   405dea <start_collision>
  404c62:	4c 8d 1d a9 25 00 00 	lea    0x25a9(%rip),%r11        # 407212 <dummy_target_0>
  404c69:	0f ae f0             	mfence 
  404c6c:	31 c0                	xor    %eax,%eax
  404c6e:	0f a2                	cpuid  
  404c70:	e8 75 11 00 00       	call   405dea <start_collision>
  404c75:	4c 8d 1d 96 25 00 00 	lea    0x2596(%rip),%r11        # 407212 <dummy_target_0>
  404c7c:	0f ae f0             	mfence 
  404c7f:	31 c0                	xor    %eax,%eax
  404c81:	0f a2                	cpuid  
  404c83:	e8 62 11 00 00       	call   405dea <start_collision>
  404c88:	4c 8d 1d 83 25 00 00 	lea    0x2583(%rip),%r11        # 407212 <dummy_target_0>
  404c8f:	0f ae f0             	mfence 
  404c92:	31 c0                	xor    %eax,%eax
  404c94:	0f a2                	cpuid  
  404c96:	e8 4f 11 00 00       	call   405dea <start_collision>
  404c9b:	4c 8d 1d 70 25 00 00 	lea    0x2570(%rip),%r11        # 407212 <dummy_target_0>
  404ca2:	0f ae f0             	mfence 
  404ca5:	31 c0                	xor    %eax,%eax
  404ca7:	0f a2                	cpuid  
  404ca9:	e8 3c 11 00 00       	call   405dea <start_collision>
  404cae:	4c 8d 1d 5d 25 00 00 	lea    0x255d(%rip),%r11        # 407212 <dummy_target_0>
  404cb5:	0f ae f0             	mfence 
  404cb8:	31 c0                	xor    %eax,%eax
  404cba:	0f a2                	cpuid  
  404cbc:	e8 29 11 00 00       	call   405dea <start_collision>
  404cc1:	4c 8d 1d 4a 25 00 00 	lea    0x254a(%rip),%r11        # 407212 <dummy_target_0>
  404cc8:	0f ae f0             	mfence 
  404ccb:	31 c0                	xor    %eax,%eax
  404ccd:	0f a2                	cpuid  
  404ccf:	e8 16 11 00 00       	call   405dea <start_collision>
  404cd4:	4c 8d 1d 37 25 00 00 	lea    0x2537(%rip),%r11        # 407212 <dummy_target_0>
  404cdb:	0f ae f0             	mfence 
  404cde:	31 c0                	xor    %eax,%eax
  404ce0:	0f a2                	cpuid  
  404ce2:	e8 03 11 00 00       	call   405dea <start_collision>
  404ce7:	4c 8d 1d 24 25 00 00 	lea    0x2524(%rip),%r11        # 407212 <dummy_target_0>
  404cee:	0f ae f0             	mfence 
  404cf1:	31 c0                	xor    %eax,%eax
  404cf3:	0f a2                	cpuid  
  404cf5:	e8 f0 10 00 00       	call   405dea <start_collision>
  404cfa:	4c 8d 1d 11 25 00 00 	lea    0x2511(%rip),%r11        # 407212 <dummy_target_0>
  404d01:	0f ae f0             	mfence 
  404d04:	31 c0                	xor    %eax,%eax
  404d06:	0f a2                	cpuid  
  404d08:	e8 dd 10 00 00       	call   405dea <start_collision>
  404d0d:	4c 8d 1d fe 24 00 00 	lea    0x24fe(%rip),%r11        # 407212 <dummy_target_0>
  404d14:	0f ae f0             	mfence 
  404d17:	31 c0                	xor    %eax,%eax
  404d19:	0f a2                	cpuid  
  404d1b:	e8 ca 10 00 00       	call   405dea <start_collision>
  404d20:	4c 8d 1d eb 24 00 00 	lea    0x24eb(%rip),%r11        # 407212 <dummy_target_0>
  404d27:	0f ae f0             	mfence 
  404d2a:	31 c0                	xor    %eax,%eax
  404d2c:	0f a2                	cpuid  
  404d2e:	e8 b7 10 00 00       	call   405dea <start_collision>
  404d33:	4c 8d 1d d8 24 00 00 	lea    0x24d8(%rip),%r11        # 407212 <dummy_target_0>
  404d3a:	0f ae f0             	mfence 
  404d3d:	31 c0                	xor    %eax,%eax
  404d3f:	0f a2                	cpuid  
  404d41:	e8 a4 10 00 00       	call   405dea <start_collision>
  404d46:	4c 8d 1d c5 24 00 00 	lea    0x24c5(%rip),%r11        # 407212 <dummy_target_0>
  404d4d:	0f ae f0             	mfence 
  404d50:	31 c0                	xor    %eax,%eax
  404d52:	0f a2                	cpuid  
  404d54:	e8 91 10 00 00       	call   405dea <start_collision>
  404d59:	4c 8d 1d b2 24 00 00 	lea    0x24b2(%rip),%r11        # 407212 <dummy_target_0>
  404d60:	0f ae f0             	mfence 
  404d63:	31 c0                	xor    %eax,%eax
  404d65:	0f a2                	cpuid  
  404d67:	e8 7e 10 00 00       	call   405dea <start_collision>
  404d6c:	4c 8d 1d 9f 24 00 00 	lea    0x249f(%rip),%r11        # 407212 <dummy_target_0>
  404d73:	0f ae f0             	mfence 
  404d76:	31 c0                	xor    %eax,%eax
  404d78:	0f a2                	cpuid  
  404d7a:	e8 6b 10 00 00       	call   405dea <start_collision>
  404d7f:	4c 8d 1d 8c 24 00 00 	lea    0x248c(%rip),%r11        # 407212 <dummy_target_0>
  404d86:	0f ae f0             	mfence 
  404d89:	31 c0                	xor    %eax,%eax
  404d8b:	0f a2                	cpuid  
  404d8d:	e8 58 10 00 00       	call   405dea <start_collision>
  404d92:	4c 8d 1d 79 24 00 00 	lea    0x2479(%rip),%r11        # 407212 <dummy_target_0>
  404d99:	0f ae f0             	mfence 
  404d9c:	31 c0                	xor    %eax,%eax
  404d9e:	0f a2                	cpuid  
  404da0:	e8 45 10 00 00       	call   405dea <start_collision>
  404da5:	4c 8d 1d 66 24 00 00 	lea    0x2466(%rip),%r11        # 407212 <dummy_target_0>
  404dac:	0f ae f0             	mfence 
  404daf:	31 c0                	xor    %eax,%eax
  404db1:	0f a2                	cpuid  
  404db3:	e8 32 10 00 00       	call   405dea <start_collision>
  404db8:	4c 8d 1d 53 24 00 00 	lea    0x2453(%rip),%r11        # 407212 <dummy_target_0>
  404dbf:	0f ae f0             	mfence 
  404dc2:	31 c0                	xor    %eax,%eax
  404dc4:	0f a2                	cpuid  
  404dc6:	e8 1f 10 00 00       	call   405dea <start_collision>
  404dcb:	4c 8d 1d 40 24 00 00 	lea    0x2440(%rip),%r11        # 407212 <dummy_target_0>
  404dd2:	0f ae f0             	mfence 
  404dd5:	31 c0                	xor    %eax,%eax
  404dd7:	0f a2                	cpuid  
  404dd9:	e8 0c 10 00 00       	call   405dea <start_collision>
  404dde:	4c 8d 1d 2d 24 00 00 	lea    0x242d(%rip),%r11        # 407212 <dummy_target_0>
  404de5:	0f ae f0             	mfence 
  404de8:	31 c0                	xor    %eax,%eax
  404dea:	0f a2                	cpuid  
  404dec:	e8 f9 0f 00 00       	call   405dea <start_collision>
  404df1:	4c 8d 1d 1a 24 00 00 	lea    0x241a(%rip),%r11        # 407212 <dummy_target_0>
  404df8:	0f ae f0             	mfence 
  404dfb:	31 c0                	xor    %eax,%eax
  404dfd:	0f a2                	cpuid  
  404dff:	e8 e6 0f 00 00       	call   405dea <start_collision>
  404e04:	4c 8d 1d 07 24 00 00 	lea    0x2407(%rip),%r11        # 407212 <dummy_target_0>
  404e0b:	0f ae f0             	mfence 
  404e0e:	31 c0                	xor    %eax,%eax
  404e10:	0f a2                	cpuid  
  404e12:	e8 d3 0f 00 00       	call   405dea <start_collision>
  404e17:	4c 8d 1d f4 23 00 00 	lea    0x23f4(%rip),%r11        # 407212 <dummy_target_0>
  404e1e:	0f ae f0             	mfence 
  404e21:	31 c0                	xor    %eax,%eax
  404e23:	0f a2                	cpuid  
  404e25:	e8 c0 0f 00 00       	call   405dea <start_collision>
  404e2a:	4c 8d 1d e1 23 00 00 	lea    0x23e1(%rip),%r11        # 407212 <dummy_target_0>
  404e31:	0f ae f0             	mfence 
  404e34:	31 c0                	xor    %eax,%eax
  404e36:	0f a2                	cpuid  
  404e38:	e8 ad 0f 00 00       	call   405dea <start_collision>
  404e3d:	4c 8d 1d ce 23 00 00 	lea    0x23ce(%rip),%r11        # 407212 <dummy_target_0>
  404e44:	0f ae f0             	mfence 
  404e47:	31 c0                	xor    %eax,%eax
  404e49:	0f a2                	cpuid  
  404e4b:	e8 9a 0f 00 00       	call   405dea <start_collision>
  404e50:	4c 8d 1d bb 23 00 00 	lea    0x23bb(%rip),%r11        # 407212 <dummy_target_0>
  404e57:	0f ae f0             	mfence 
  404e5a:	31 c0                	xor    %eax,%eax
  404e5c:	0f a2                	cpuid  
  404e5e:	e8 87 0f 00 00       	call   405dea <start_collision>
  404e63:	4c 8d 1d a8 23 00 00 	lea    0x23a8(%rip),%r11        # 407212 <dummy_target_0>
  404e6a:	0f ae f0             	mfence 
  404e6d:	31 c0                	xor    %eax,%eax
  404e6f:	0f a2                	cpuid  
  404e71:	e8 74 0f 00 00       	call   405dea <start_collision>
  404e76:	4c 8d 1d 95 23 00 00 	lea    0x2395(%rip),%r11        # 407212 <dummy_target_0>
  404e7d:	0f ae f0             	mfence 
  404e80:	31 c0                	xor    %eax,%eax
  404e82:	0f a2                	cpuid  
  404e84:	e8 61 0f 00 00       	call   405dea <start_collision>
  404e89:	4c 8d 1d 82 23 00 00 	lea    0x2382(%rip),%r11        # 407212 <dummy_target_0>
  404e90:	0f ae f0             	mfence 
  404e93:	31 c0                	xor    %eax,%eax
  404e95:	0f a2                	cpuid  
  404e97:	e8 4e 0f 00 00       	call   405dea <start_collision>
  404e9c:	4c 8d 1d 6f 23 00 00 	lea    0x236f(%rip),%r11        # 407212 <dummy_target_0>
  404ea3:	0f ae f0             	mfence 
  404ea6:	31 c0                	xor    %eax,%eax
  404ea8:	0f a2                	cpuid  
  404eaa:	e8 3b 0f 00 00       	call   405dea <start_collision>
  404eaf:	4c 8d 1d 5c 23 00 00 	lea    0x235c(%rip),%r11        # 407212 <dummy_target_0>
  404eb6:	0f ae f0             	mfence 
  404eb9:	31 c0                	xor    %eax,%eax
  404ebb:	0f a2                	cpuid  
  404ebd:	e8 28 0f 00 00       	call   405dea <start_collision>
  404ec2:	4c 8d 1d 49 23 00 00 	lea    0x2349(%rip),%r11        # 407212 <dummy_target_0>
  404ec9:	0f ae f0             	mfence 
  404ecc:	31 c0                	xor    %eax,%eax
  404ece:	0f a2                	cpuid  
  404ed0:	e8 15 0f 00 00       	call   405dea <start_collision>
  404ed5:	4c 8d 1d 36 23 00 00 	lea    0x2336(%rip),%r11        # 407212 <dummy_target_0>
  404edc:	0f ae f0             	mfence 
  404edf:	31 c0                	xor    %eax,%eax
  404ee1:	0f a2                	cpuid  
  404ee3:	e8 02 0f 00 00       	call   405dea <start_collision>
  404ee8:	4c 8d 1d 23 23 00 00 	lea    0x2323(%rip),%r11        # 407212 <dummy_target_0>
  404eef:	0f ae f0             	mfence 
  404ef2:	31 c0                	xor    %eax,%eax
  404ef4:	0f a2                	cpuid  
  404ef6:	e8 ef 0e 00 00       	call   405dea <start_collision>
  404efb:	4c 8d 1d 10 23 00 00 	lea    0x2310(%rip),%r11        # 407212 <dummy_target_0>
  404f02:	0f ae f0             	mfence 
  404f05:	31 c0                	xor    %eax,%eax
  404f07:	0f a2                	cpuid  
  404f09:	e8 dc 0e 00 00       	call   405dea <start_collision>
  404f0e:	4c 8d 1d fd 22 00 00 	lea    0x22fd(%rip),%r11        # 407212 <dummy_target_0>
  404f15:	0f ae f0             	mfence 
  404f18:	31 c0                	xor    %eax,%eax
  404f1a:	0f a2                	cpuid  
  404f1c:	e8 c9 0e 00 00       	call   405dea <start_collision>
  404f21:	4c 8d 1d ea 22 00 00 	lea    0x22ea(%rip),%r11        # 407212 <dummy_target_0>
  404f28:	0f ae f0             	mfence 
  404f2b:	31 c0                	xor    %eax,%eax
  404f2d:	0f a2                	cpuid  
  404f2f:	e8 b6 0e 00 00       	call   405dea <start_collision>
  404f34:	4c 8d 1d d7 22 00 00 	lea    0x22d7(%rip),%r11        # 407212 <dummy_target_0>
  404f3b:	0f ae f0             	mfence 
  404f3e:	31 c0                	xor    %eax,%eax
  404f40:	0f a2                	cpuid  
  404f42:	e8 a3 0e 00 00       	call   405dea <start_collision>
  404f47:	4c 8d 1d c4 22 00 00 	lea    0x22c4(%rip),%r11        # 407212 <dummy_target_0>
  404f4e:	0f ae f0             	mfence 
  404f51:	31 c0                	xor    %eax,%eax
  404f53:	0f a2                	cpuid  
  404f55:	e8 90 0e 00 00       	call   405dea <start_collision>
  404f5a:	4c 8d 1d b1 22 00 00 	lea    0x22b1(%rip),%r11        # 407212 <dummy_target_0>
  404f61:	0f ae f0             	mfence 
  404f64:	31 c0                	xor    %eax,%eax
  404f66:	0f a2                	cpuid  
  404f68:	e8 7d 0e 00 00       	call   405dea <start_collision>
  404f6d:	4c 8d 1d 9e 22 00 00 	lea    0x229e(%rip),%r11        # 407212 <dummy_target_0>
  404f74:	0f ae f0             	mfence 
  404f77:	31 c0                	xor    %eax,%eax
  404f79:	0f a2                	cpuid  
  404f7b:	e8 6a 0e 00 00       	call   405dea <start_collision>
  404f80:	4c 8d 1d 8b 22 00 00 	lea    0x228b(%rip),%r11        # 407212 <dummy_target_0>
  404f87:	0f ae f0             	mfence 
  404f8a:	31 c0                	xor    %eax,%eax
  404f8c:	0f a2                	cpuid  
  404f8e:	e8 57 0e 00 00       	call   405dea <start_collision>
  404f93:	4c 8d 1d 78 22 00 00 	lea    0x2278(%rip),%r11        # 407212 <dummy_target_0>
  404f9a:	0f ae f0             	mfence 
  404f9d:	31 c0                	xor    %eax,%eax
  404f9f:	0f a2                	cpuid  
  404fa1:	e8 44 0e 00 00       	call   405dea <start_collision>
  404fa6:	4c 8d 1d 65 22 00 00 	lea    0x2265(%rip),%r11        # 407212 <dummy_target_0>
  404fad:	0f ae f0             	mfence 
  404fb0:	31 c0                	xor    %eax,%eax
  404fb2:	0f a2                	cpuid  
  404fb4:	e8 31 0e 00 00       	call   405dea <start_collision>
  404fb9:	4c 8d 1d 52 22 00 00 	lea    0x2252(%rip),%r11        # 407212 <dummy_target_0>
  404fc0:	0f ae f0             	mfence 
  404fc3:	31 c0                	xor    %eax,%eax
  404fc5:	0f a2                	cpuid  
  404fc7:	e8 1e 0e 00 00       	call   405dea <start_collision>
  404fcc:	4c 8d 1d 3f 22 00 00 	lea    0x223f(%rip),%r11        # 407212 <dummy_target_0>
  404fd3:	0f ae f0             	mfence 
  404fd6:	31 c0                	xor    %eax,%eax
  404fd8:	0f a2                	cpuid  
  404fda:	e8 0b 0e 00 00       	call   405dea <start_collision>
  404fdf:	4c 8d 1d 2c 22 00 00 	lea    0x222c(%rip),%r11        # 407212 <dummy_target_0>
  404fe6:	0f ae f0             	mfence 
  404fe9:	31 c0                	xor    %eax,%eax
  404feb:	0f a2                	cpuid  
  404fed:	e8 f8 0d 00 00       	call   405dea <start_collision>
  404ff2:	4c 8d 1d 19 22 00 00 	lea    0x2219(%rip),%r11        # 407212 <dummy_target_0>
  404ff9:	0f ae f0             	mfence 
  404ffc:	31 c0                	xor    %eax,%eax
  404ffe:	0f a2                	cpuid  
  405000:	e8 e5 0d 00 00       	call   405dea <start_collision>
  405005:	4c 8d 1d 06 22 00 00 	lea    0x2206(%rip),%r11        # 407212 <dummy_target_0>
  40500c:	0f ae f0             	mfence 
  40500f:	31 c0                	xor    %eax,%eax
  405011:	0f a2                	cpuid  
  405013:	e8 d2 0d 00 00       	call   405dea <start_collision>
  405018:	4c 8d 1d f3 21 00 00 	lea    0x21f3(%rip),%r11        # 407212 <dummy_target_0>
  40501f:	0f ae f0             	mfence 
  405022:	31 c0                	xor    %eax,%eax
  405024:	0f a2                	cpuid  
  405026:	e8 bf 0d 00 00       	call   405dea <start_collision>
  40502b:	4c 8d 1d e0 21 00 00 	lea    0x21e0(%rip),%r11        # 407212 <dummy_target_0>
  405032:	0f ae f0             	mfence 
  405035:	31 c0                	xor    %eax,%eax
  405037:	0f a2                	cpuid  
  405039:	e8 ac 0d 00 00       	call   405dea <start_collision>
  40503e:	0f ae f0             	mfence 
  405041:	31 c0                	xor    %eax,%eax
  405043:	0f a2                	cpuid  

0000000000405045 <release_spinlock_0_1>:
  405045:	31 c0                	xor    %eax,%eax
  405047:	0f a2                	cpuid  
  405049:	0f ae f0             	mfence 
  40504c:	48 8b 1d 29 ae 00 00 	mov    0xae29(%rip),%rbx        # 40fe7c <PSharedMemory>
  405053:	ff 0b                	decl   (%rbx)

0000000000405055 <acquire_spinlock_again>:
  405055:	b8 01 00 00 00       	mov    $0x1,%eax
  40505a:	48 8b 1d 23 ae 00 00 	mov    0xae23(%rip),%rbx        # 40fe84 <PSharedMemory2>
  405061:	87 03                	xchg   %eax,(%rbx)
  405063:	85 c0                	test   %eax,%eax
  405065:	75 ee                	jne    405055 <acquire_spinlock_again>
  405067:	0f ae 3d ac 25 00 00 	clflush 0x25ac(%rip)        # 40761a <malicious_target_0>
  40506e:	0f ae f0             	mfence 
  405071:	31 c0                	xor    %eax,%eax
  405073:	0f a2                	cpuid  
  405075:	4c 8d 1d 96 21 00 00 	lea    0x2196(%rip),%r11        # 407212 <dummy_target_0>
  40507c:	0f ae 3d 8f 21 00 00 	clflush 0x218f(%rip)        # 407212 <dummy_target_0>
  405083:	0f ae f0             	mfence 
  405086:	31 c0                	xor    %eax,%eax
  405088:	0f a2                	cpuid  
  40508a:	e8 53 05 00 00       	call   4055e2 <start_gadget_0>
  40508f:	48 89 05 e6 b1 80 00 	mov    %rax,0x80b1e6(%rip)        # c1027c <TempData>
  405096:	48 89 1d e7 b1 80 00 	mov    %rbx,0x80b1e7(%rip)        # c10284 <TempData+0x8>
  40509d:	48 89 0d e8 b1 80 00 	mov    %rcx,0x80b1e8(%rip)        # c1028c <TempData+0x10>
  4050a4:	48 89 15 e9 b1 80 00 	mov    %rdx,0x80b1e9(%rip)        # c10294 <TempData+0x18>
  4050ab:	31 c0                	xor    %eax,%eax
  4050ad:	0f a2                	cpuid  
  4050af:	48 31 c9             	xor    %rcx,%rcx
  4050b2:	8b 0d 84 ad 00 00    	mov    0xad84(%rip),%ecx        # 40fe3c <Counters>
  4050b8:	0f 33                	rdpmc  
  4050ba:	41 89 45 28          	mov    %eax,0x28(%r13)

00000000004050be <debug_counter_0_0>:
  4050be:	48 31 c9             	xor    %rcx,%rcx
  4050c1:	8b 0d 79 ad 00 00    	mov    0xad79(%rip),%ecx        # 40fe40 <Counters+0x4>
  4050c7:	0f 33                	rdpmc  
  4050c9:	41 89 45 2c          	mov    %eax,0x2c(%r13)

00000000004050cd <debug_counter_0_1>:
  4050cd:	48 31 c9             	xor    %rcx,%rcx
  4050d0:	8b 0d 6e ad 00 00    	mov    0xad6e(%rip),%ecx        # 40fe44 <Counters+0x8>
  4050d6:	0f 33                	rdpmc  
  4050d8:	41 89 45 30          	mov    %eax,0x30(%r13)

00000000004050dc <debug_counter_0_2>:
  4050dc:	48 31 c9             	xor    %rcx,%rcx
  4050df:	8b 0d 63 ad 00 00    	mov    0xad63(%rip),%ecx        # 40fe48 <Counters+0xc>
  4050e5:	0f 33                	rdpmc  
  4050e7:	41 89 45 34          	mov    %eax,0x34(%r13)

00000000004050eb <debug_counter_0_3>:
  4050eb:	48 31 c9             	xor    %rcx,%rcx
  4050ee:	8b 0d 58 ad 00 00    	mov    0xad58(%rip),%ecx        # 40fe4c <Counters+0x10>
  4050f4:	0f 33                	rdpmc  
  4050f6:	41 89 45 38          	mov    %eax,0x38(%r13)

00000000004050fa <debug_counter_0_4>:
  4050fa:	48 31 c9             	xor    %rcx,%rcx
  4050fd:	8b 0d 4d ad 00 00    	mov    0xad4d(%rip),%ecx        # 40fe50 <Counters+0x14>
  405103:	0f 33                	rdpmc  
  405105:	41 89 45 3c          	mov    %eax,0x3c(%r13)

0000000000405109 <debug_counter_0_5>:
  405109:	48 31 c9             	xor    %rcx,%rcx
  40510c:	8b 0d 42 ad 00 00    	mov    0xad42(%rip),%ecx        # 40fe54 <Counters+0x18>
  405112:	0f 33                	rdpmc  
  405114:	41 89 45 40          	mov    %eax,0x40(%r13)

0000000000405118 <debug_counter_0_6>:
  405118:	48 31 c9             	xor    %rcx,%rcx
  40511b:	8b 0d 37 ad 00 00    	mov    0xad37(%rip),%ecx        # 40fe58 <Counters+0x1c>
  405121:	0f 33                	rdpmc  
  405123:	41 89 45 44          	mov    %eax,0x44(%r13)

0000000000405127 <debug_counter_0_7>:
  405127:	31 c0                	xor    %eax,%eax
  405129:	0f a2                	cpuid  
  40512b:	0f 31                	rdtsc  
  40512d:	41 89 45 24          	mov    %eax,0x24(%r13)
  405131:	48 8b 05 44 b1 80 00 	mov    0x80b144(%rip),%rax        # c1027c <TempData>
  405138:	48 8b 1d 45 b1 80 00 	mov    0x80b145(%rip),%rbx        # c10284 <TempData+0x8>
  40513f:	48 8b 0d 46 b1 80 00 	mov    0x80b146(%rip),%rcx        # c1028c <TempData+0x10>
  405146:	48 8b 15 47 b1 80 00 	mov    0x80b147(%rip),%rdx        # c10294 <TempData+0x18>
  40514d:	4c 8b 0d c6 24 00 00 	mov    0x24c6(%rip),%r9        # 40761a <malicious_target_0>
  405154:	48 89 05 21 b1 80 00 	mov    %rax,0x80b121(%rip)        # c1027c <TempData>
  40515b:	48 89 1d 22 b1 80 00 	mov    %rbx,0x80b122(%rip)        # c10284 <TempData+0x8>
  405162:	48 89 0d 23 b1 80 00 	mov    %rcx,0x80b123(%rip)        # c1028c <TempData+0x10>
  405169:	48 89 15 24 b1 80 00 	mov    %rdx,0x80b124(%rip)        # c10294 <TempData+0x18>
  405170:	31 c0                	xor    %eax,%eax
  405172:	0f a2                	cpuid  
  405174:	48 31 c0             	xor    %rax,%rax
  405177:	48 31 c9             	xor    %rcx,%rcx
  40517a:	0f 31                	rdtsc  
  40517c:	41 8b 4d 24          	mov    0x24(%r13),%ecx
  405180:	29 c8                	sub    %ecx,%eax
  405182:	43 01 44 b5 70       	add    %eax,0x70(%r13,%r14,4)
  405187:	31 c0                	xor    %eax,%eax
  405189:	0f a2                	cpuid  
  40518b:	48 31 c9             	xor    %rcx,%rcx
  40518e:	48 31 c0             	xor    %rax,%rax
  405191:	8b 0d a5 ac 00 00    	mov    0xaca5(%rip),%ecx        # 40fe3c <Counters>
  405197:	0f 33                	rdpmc  
  405199:	41 8b 4d 28          	mov    0x28(%r13),%ecx

000000000040519d <debug_counter_1_0>:
  40519d:	29 c8                	sub    %ecx,%eax
  40519f:	43 01 84 b5 34 10 00 	add    %eax,0x1034(%r13,%r14,4)
  4051a6:	00 
  4051a7:	48 31 c9             	xor    %rcx,%rcx
  4051aa:	48 31 c0             	xor    %rax,%rax
  4051ad:	8b 0d 8d ac 00 00    	mov    0xac8d(%rip),%ecx        # 40fe40 <Counters+0x4>
  4051b3:	0f 33                	rdpmc  
  4051b5:	41 8b 4d 2c          	mov    0x2c(%r13),%ecx

00000000004051b9 <debug_counter_1_1>:
  4051b9:	29 c8                	sub    %ecx,%eax
  4051bb:	43 01 84 b5 38 10 00 	add    %eax,0x1038(%r13,%r14,4)
  4051c2:	00 
  4051c3:	48 31 c9             	xor    %rcx,%rcx
  4051c6:	48 31 c0             	xor    %rax,%rax
  4051c9:	8b 0d 75 ac 00 00    	mov    0xac75(%rip),%ecx        # 40fe44 <Counters+0x8>
  4051cf:	0f 33                	rdpmc  
  4051d1:	41 8b 4d 30          	mov    0x30(%r13),%ecx

00000000004051d5 <debug_counter_1_2>:
  4051d5:	29 c8                	sub    %ecx,%eax
  4051d7:	43 01 84 b5 3c 10 00 	add    %eax,0x103c(%r13,%r14,4)
  4051de:	00 
  4051df:	48 31 c9             	xor    %rcx,%rcx
  4051e2:	48 31 c0             	xor    %rax,%rax
  4051e5:	8b 0d 5d ac 00 00    	mov    0xac5d(%rip),%ecx        # 40fe48 <Counters+0xc>
  4051eb:	0f 33                	rdpmc  
  4051ed:	41 8b 4d 34          	mov    0x34(%r13),%ecx

00000000004051f1 <debug_counter_1_3>:
  4051f1:	29 c8                	sub    %ecx,%eax
  4051f3:	43 01 84 b5 40 10 00 	add    %eax,0x1040(%r13,%r14,4)
  4051fa:	00 
  4051fb:	48 31 c9             	xor    %rcx,%rcx
  4051fe:	48 31 c0             	xor    %rax,%rax
  405201:	8b 0d 45 ac 00 00    	mov    0xac45(%rip),%ecx        # 40fe4c <Counters+0x10>
  405207:	0f 33                	rdpmc  
  405209:	41 8b 4d 38          	mov    0x38(%r13),%ecx

000000000040520d <debug_counter_1_4>:
  40520d:	29 c8                	sub    %ecx,%eax
  40520f:	43 01 84 b5 44 10 00 	add    %eax,0x1044(%r13,%r14,4)
  405216:	00 
  405217:	48 31 c9             	xor    %rcx,%rcx
  40521a:	48 31 c0             	xor    %rax,%rax
  40521d:	8b 0d 2d ac 00 00    	mov    0xac2d(%rip),%ecx        # 40fe50 <Counters+0x14>
  405223:	0f 33                	rdpmc  
  405225:	41 8b 4d 3c          	mov    0x3c(%r13),%ecx

0000000000405229 <debug_counter_1_5>:
  405229:	29 c8                	sub    %ecx,%eax
  40522b:	43 01 84 b5 48 10 00 	add    %eax,0x1048(%r13,%r14,4)
  405232:	00 
  405233:	48 31 c9             	xor    %rcx,%rcx
  405236:	48 31 c0             	xor    %rax,%rax
  405239:	8b 0d 15 ac 00 00    	mov    0xac15(%rip),%ecx        # 40fe54 <Counters+0x18>
  40523f:	0f 33                	rdpmc  
  405241:	41 8b 4d 40          	mov    0x40(%r13),%ecx

0000000000405245 <debug_counter_1_6>:
  405245:	29 c8                	sub    %ecx,%eax
  405247:	43 01 84 b5 4c 10 00 	add    %eax,0x104c(%r13,%r14,4)
  40524e:	00 
  40524f:	48 31 c9             	xor    %rcx,%rcx
  405252:	48 31 c0             	xor    %rax,%rax
  405255:	8b 0d fd ab 00 00    	mov    0xabfd(%rip),%ecx        # 40fe58 <Counters+0x1c>
  40525b:	0f 33                	rdpmc  
  40525d:	41 8b 4d 44          	mov    0x44(%r13),%ecx

0000000000405261 <debug_counter_1_7>:
  405261:	29 c8                	sub    %ecx,%eax
  405263:	43 01 84 b5 50 10 00 	add    %eax,0x1050(%r13,%r14,4)
  40526a:	00 
  40526b:	48 8b 05 0a b0 80 00 	mov    0x80b00a(%rip),%rax        # c1027c <TempData>
  405272:	48 8b 1d 0b b0 80 00 	mov    0x80b00b(%rip),%rbx        # c10284 <TempData+0x8>
  405279:	48 8b 0d 0c b0 80 00 	mov    0x80b00c(%rip),%rcx        # c1028c <TempData+0x10>
  405280:	48 8b 15 0d b0 80 00 	mov    0x80b00d(%rip),%rdx        # c10294 <TempData+0x18>

0000000000405287 <release_spinlock_again>:
  405287:	31 c0                	xor    %eax,%eax
  405289:	0f a2                	cpuid  
  40528b:	0f ae f0             	mfence 
  40528e:	48 8b 1d ef ab 00 00 	mov    0xabef(%rip),%rbx        # 40fe84 <PSharedMemory2>
  405295:	ff 0b                	decl   (%rbx)
  405297:	90                   	nop
  405298:	90                   	nop
  405299:	90                   	nop
  40529a:	90                   	nop
  40529b:	90                   	nop
  40529c:	90                   	nop
  40529d:	90                   	nop
  40529e:	90                   	nop
  40529f:	90                   	nop
  4052a0:	90                   	nop
  4052a1:	90                   	nop
  4052a2:	90                   	nop
  4052a3:	90                   	nop
  4052a4:	90                   	nop
  4052a5:	90                   	nop
  4052a6:	90                   	nop
  4052a7:	90                   	nop
  4052a8:	90                   	nop
  4052a9:	90                   	nop
  4052aa:	90                   	nop
  4052ab:	90                   	nop
  4052ac:	90                   	nop
  4052ad:	90                   	nop
  4052ae:	90                   	nop
  4052af:	90                   	nop
  4052b0:	90                   	nop
  4052b1:	90                   	nop
  4052b2:	90                   	nop
  4052b3:	90                   	nop
  4052b4:	90                   	nop
  4052b5:	90                   	nop
  4052b6:	90                   	nop
  4052b7:	90                   	nop
  4052b8:	90                   	nop
  4052b9:	90                   	nop
  4052ba:	90                   	nop
  4052bb:	90                   	nop
  4052bc:	90                   	nop
  4052bd:	90                   	nop
  4052be:	90                   	nop
  4052bf:	90                   	nop
  4052c0:	90                   	nop
  4052c1:	90                   	nop
  4052c2:	90                   	nop
  4052c3:	90                   	nop
  4052c4:	90                   	nop
  4052c5:	90                   	nop
  4052c6:	90                   	nop
  4052c7:	90                   	nop
  4052c8:	90                   	nop
  4052c9:	90                   	nop
  4052ca:	90                   	nop
  4052cb:	90                   	nop
  4052cc:	90                   	nop
  4052cd:	90                   	nop
  4052ce:	90                   	nop
  4052cf:	90                   	nop
  4052d0:	90                   	nop
  4052d1:	90                   	nop
  4052d2:	90                   	nop
  4052d3:	90                   	nop
  4052d4:	90                   	nop
  4052d5:	90                   	nop
  4052d6:	90                   	nop
  4052d7:	90                   	nop
  4052d8:	90                   	nop
  4052d9:	90                   	nop
  4052da:	90                   	nop
  4052db:	90                   	nop
  4052dc:	90                   	nop
  4052dd:	90                   	nop
  4052de:	90                   	nop
  4052df:	90                   	nop
  4052e0:	90                   	nop
  4052e1:	90                   	nop
  4052e2:	90                   	nop
  4052e3:	90                   	nop
  4052e4:	90                   	nop
  4052e5:	90                   	nop
  4052e6:	90                   	nop
  4052e7:	90                   	nop
  4052e8:	90                   	nop
  4052e9:	90                   	nop
  4052ea:	90                   	nop
  4052eb:	90                   	nop
  4052ec:	90                   	nop
  4052ed:	90                   	nop
  4052ee:	90                   	nop
  4052ef:	90                   	nop
  4052f0:	90                   	nop
  4052f1:	90                   	nop
  4052f2:	90                   	nop
  4052f3:	90                   	nop
  4052f4:	90                   	nop
  4052f5:	90                   	nop
  4052f6:	90                   	nop
  4052f7:	90                   	nop
  4052f8:	90                   	nop
  4052f9:	90                   	nop
  4052fa:	90                   	nop
  4052fb:	90                   	nop
  4052fc:	90                   	nop
  4052fd:	90                   	nop
  4052fe:	90                   	nop
  4052ff:	90                   	nop
  405300:	90                   	nop
  405301:	90                   	nop
  405302:	90                   	nop
  405303:	90                   	nop
  405304:	90                   	nop
  405305:	90                   	nop
  405306:	90                   	nop
  405307:	90                   	nop
  405308:	90                   	nop
  405309:	90                   	nop
  40530a:	90                   	nop
  40530b:	90                   	nop
  40530c:	90                   	nop
  40530d:	90                   	nop
  40530e:	90                   	nop
  40530f:	90                   	nop
  405310:	90                   	nop
  405311:	90                   	nop
  405312:	90                   	nop
  405313:	90                   	nop
  405314:	90                   	nop
  405315:	90                   	nop
  405316:	90                   	nop
  405317:	90                   	nop
  405318:	90                   	nop
  405319:	90                   	nop
  40531a:	90                   	nop
  40531b:	90                   	nop
  40531c:	90                   	nop
  40531d:	90                   	nop
  40531e:	90                   	nop
  40531f:	90                   	nop
  405320:	90                   	nop
  405321:	90                   	nop
  405322:	90                   	nop
  405323:	90                   	nop
  405324:	90                   	nop
  405325:	90                   	nop
  405326:	90                   	nop
  405327:	90                   	nop
  405328:	90                   	nop
  405329:	90                   	nop
  40532a:	90                   	nop
  40532b:	90                   	nop
  40532c:	90                   	nop
  40532d:	90                   	nop
  40532e:	90                   	nop
  40532f:	90                   	nop
  405330:	90                   	nop
  405331:	90                   	nop
  405332:	90                   	nop
  405333:	90                   	nop
  405334:	90                   	nop
  405335:	90                   	nop
  405336:	90                   	nop
  405337:	90                   	nop
  405338:	90                   	nop
  405339:	90                   	nop
  40533a:	90                   	nop
  40533b:	90                   	nop
  40533c:	90                   	nop
  40533d:	90                   	nop
  40533e:	90                   	nop
  40533f:	90                   	nop
  405340:	90                   	nop
  405341:	90                   	nop
  405342:	90                   	nop
  405343:	90                   	nop
  405344:	90                   	nop
  405345:	90                   	nop
  405346:	90                   	nop
  405347:	90                   	nop
  405348:	90                   	nop
  405349:	90                   	nop
  40534a:	90                   	nop
  40534b:	90                   	nop
  40534c:	90                   	nop
  40534d:	90                   	nop
  40534e:	90                   	nop
  40534f:	90                   	nop
  405350:	90                   	nop
  405351:	90                   	nop
  405352:	90                   	nop
  405353:	90                   	nop
  405354:	90                   	nop
  405355:	90                   	nop
  405356:	90                   	nop
  405357:	90                   	nop
  405358:	90                   	nop
  405359:	90                   	nop
  40535a:	90                   	nop
  40535b:	90                   	nop
  40535c:	90                   	nop
  40535d:	90                   	nop
  40535e:	90                   	nop
  40535f:	90                   	nop
  405360:	90                   	nop
  405361:	90                   	nop
  405362:	90                   	nop
  405363:	90                   	nop
  405364:	90                   	nop
  405365:	90                   	nop
  405366:	90                   	nop
  405367:	90                   	nop
  405368:	90                   	nop
  405369:	90                   	nop
  40536a:	90                   	nop
  40536b:	90                   	nop
  40536c:	90                   	nop
  40536d:	90                   	nop
  40536e:	90                   	nop
  40536f:	90                   	nop
  405370:	90                   	nop
  405371:	90                   	nop
  405372:	90                   	nop
  405373:	90                   	nop
  405374:	90                   	nop
  405375:	90                   	nop
  405376:	90                   	nop
  405377:	90                   	nop
  405378:	90                   	nop
  405379:	90                   	nop
  40537a:	90                   	nop
  40537b:	90                   	nop
  40537c:	90                   	nop
  40537d:	90                   	nop
  40537e:	90                   	nop
  40537f:	90                   	nop
  405380:	90                   	nop
  405381:	90                   	nop
  405382:	90                   	nop
  405383:	90                   	nop
  405384:	90                   	nop
  405385:	90                   	nop
  405386:	90                   	nop
  405387:	90                   	nop
  405388:	90                   	nop
  405389:	90                   	nop
  40538a:	90                   	nop
  40538b:	90                   	nop
  40538c:	90                   	nop
  40538d:	90                   	nop
  40538e:	90                   	nop
  40538f:	90                   	nop
  405390:	90                   	nop
  405391:	90                   	nop
  405392:	90                   	nop
  405393:	90                   	nop
  405394:	90                   	nop
  405395:	90                   	nop
  405396:	90                   	nop
  405397:	90                   	nop
  405398:	90                   	nop
  405399:	90                   	nop
  40539a:	90                   	nop
  40539b:	90                   	nop
  40539c:	90                   	nop
  40539d:	90                   	nop
  40539e:	90                   	nop
  40539f:	90                   	nop
  4053a0:	90                   	nop
  4053a1:	90                   	nop
  4053a2:	90                   	nop
  4053a3:	90                   	nop
  4053a4:	90                   	nop
  4053a5:	90                   	nop
  4053a6:	90                   	nop
  4053a7:	90                   	nop
  4053a8:	90                   	nop
  4053a9:	90                   	nop
  4053aa:	90                   	nop
  4053ab:	90                   	nop
  4053ac:	90                   	nop
  4053ad:	90                   	nop
  4053ae:	90                   	nop
  4053af:	90                   	nop
  4053b0:	90                   	nop
  4053b1:	90                   	nop
  4053b2:	90                   	nop
  4053b3:	90                   	nop
  4053b4:	90                   	nop
  4053b5:	90                   	nop
  4053b6:	90                   	nop
  4053b7:	90                   	nop
  4053b8:	90                   	nop
  4053b9:	90                   	nop
  4053ba:	90                   	nop
  4053bb:	90                   	nop
  4053bc:	90                   	nop
  4053bd:	90                   	nop
  4053be:	90                   	nop
  4053bf:	90                   	nop
  4053c0:	90                   	nop
  4053c1:	90                   	nop
  4053c2:	90                   	nop
  4053c3:	90                   	nop
  4053c4:	90                   	nop
  4053c5:	90                   	nop
  4053c6:	90                   	nop
  4053c7:	90                   	nop
  4053c8:	90                   	nop
  4053c9:	90                   	nop
  4053ca:	90                   	nop
  4053cb:	90                   	nop
  4053cc:	90                   	nop
  4053cd:	90                   	nop
  4053ce:	90                   	nop
  4053cf:	90                   	nop
  4053d0:	90                   	nop
  4053d1:	90                   	nop
  4053d2:	90                   	nop
  4053d3:	90                   	nop
  4053d4:	90                   	nop
  4053d5:	90                   	nop
  4053d6:	90                   	nop
  4053d7:	90                   	nop
  4053d8:	90                   	nop
  4053d9:	90                   	nop
  4053da:	90                   	nop
  4053db:	90                   	nop
  4053dc:	90                   	nop
  4053dd:	90                   	nop
  4053de:	90                   	nop
  4053df:	90                   	nop
  4053e0:	90                   	nop
  4053e1:	90                   	nop
  4053e2:	90                   	nop
  4053e3:	90                   	nop
  4053e4:	90                   	nop
  4053e5:	90                   	nop
  4053e6:	90                   	nop
  4053e7:	90                   	nop
  4053e8:	90                   	nop
  4053e9:	90                   	nop
  4053ea:	90                   	nop
  4053eb:	90                   	nop
  4053ec:	90                   	nop
  4053ed:	90                   	nop
  4053ee:	90                   	nop
  4053ef:	90                   	nop
  4053f0:	90                   	nop
  4053f1:	90                   	nop
  4053f2:	90                   	nop
  4053f3:	90                   	nop
  4053f4:	90                   	nop
  4053f5:	90                   	nop
  4053f6:	90                   	nop
  4053f7:	90                   	nop
  4053f8:	90                   	nop
  4053f9:	90                   	nop
  4053fa:	90                   	nop
  4053fb:	90                   	nop
  4053fc:	90                   	nop
  4053fd:	90                   	nop
  4053fe:	90                   	nop
  4053ff:	90                   	nop
  405400:	90                   	nop
  405401:	90                   	nop
  405402:	90                   	nop
  405403:	90                   	nop
  405404:	90                   	nop
  405405:	90                   	nop
  405406:	90                   	nop
  405407:	90                   	nop
  405408:	90                   	nop
  405409:	90                   	nop
  40540a:	90                   	nop
  40540b:	90                   	nop
  40540c:	90                   	nop
  40540d:	90                   	nop
  40540e:	90                   	nop
  40540f:	90                   	nop
  405410:	90                   	nop
  405411:	90                   	nop
  405412:	90                   	nop
  405413:	90                   	nop
  405414:	90                   	nop
  405415:	90                   	nop
  405416:	90                   	nop
  405417:	90                   	nop
  405418:	90                   	nop
  405419:	90                   	nop
  40541a:	90                   	nop
  40541b:	90                   	nop
  40541c:	90                   	nop
  40541d:	90                   	nop
  40541e:	90                   	nop
  40541f:	90                   	nop
  405420:	90                   	nop
  405421:	90                   	nop
  405422:	90                   	nop
  405423:	90                   	nop
  405424:	90                   	nop
  405425:	90                   	nop
  405426:	90                   	nop
  405427:	90                   	nop
  405428:	90                   	nop
  405429:	90                   	nop
  40542a:	90                   	nop
  40542b:	90                   	nop
  40542c:	90                   	nop
  40542d:	90                   	nop
  40542e:	90                   	nop
  40542f:	90                   	nop
  405430:	90                   	nop
  405431:	90                   	nop
  405432:	90                   	nop
  405433:	90                   	nop
  405434:	90                   	nop
  405435:	90                   	nop
  405436:	90                   	nop
  405437:	90                   	nop
  405438:	90                   	nop
  405439:	90                   	nop
  40543a:	90                   	nop
  40543b:	90                   	nop
  40543c:	90                   	nop
  40543d:	90                   	nop
  40543e:	90                   	nop
  40543f:	90                   	nop
  405440:	90                   	nop
  405441:	90                   	nop
  405442:	90                   	nop
  405443:	90                   	nop
  405444:	90                   	nop
  405445:	90                   	nop
  405446:	90                   	nop
  405447:	90                   	nop
  405448:	90                   	nop
  405449:	90                   	nop
  40544a:	90                   	nop
  40544b:	90                   	nop
  40544c:	90                   	nop
  40544d:	90                   	nop
  40544e:	90                   	nop
  40544f:	90                   	nop
  405450:	90                   	nop
  405451:	90                   	nop
  405452:	90                   	nop
  405453:	90                   	nop
  405454:	90                   	nop
  405455:	90                   	nop
  405456:	90                   	nop
  405457:	90                   	nop
  405458:	90                   	nop
  405459:	90                   	nop
  40545a:	90                   	nop
  40545b:	90                   	nop
  40545c:	90                   	nop
  40545d:	90                   	nop
  40545e:	90                   	nop
  40545f:	90                   	nop
  405460:	90                   	nop
  405461:	90                   	nop
  405462:	90                   	nop
  405463:	90                   	nop
  405464:	90                   	nop
  405465:	90                   	nop
  405466:	90                   	nop
  405467:	90                   	nop
  405468:	90                   	nop
  405469:	90                   	nop
  40546a:	90                   	nop
  40546b:	90                   	nop
  40546c:	90                   	nop
  40546d:	90                   	nop
  40546e:	90                   	nop
  40546f:	90                   	nop
  405470:	90                   	nop
  405471:	90                   	nop
  405472:	90                   	nop
  405473:	90                   	nop
  405474:	90                   	nop
  405475:	90                   	nop
  405476:	90                   	nop
  405477:	90                   	nop
  405478:	90                   	nop
  405479:	90                   	nop
  40547a:	90                   	nop
  40547b:	90                   	nop
  40547c:	90                   	nop
  40547d:	90                   	nop
  40547e:	90                   	nop
  40547f:	90                   	nop
  405480:	90                   	nop
  405481:	90                   	nop
  405482:	90                   	nop
  405483:	90                   	nop
  405484:	90                   	nop
  405485:	90                   	nop
  405486:	90                   	nop
  405487:	90                   	nop
  405488:	90                   	nop
  405489:	90                   	nop
  40548a:	90                   	nop
  40548b:	90                   	nop
  40548c:	90                   	nop
  40548d:	90                   	nop
  40548e:	90                   	nop
  40548f:	90                   	nop
  405490:	90                   	nop
  405491:	90                   	nop
  405492:	90                   	nop
  405493:	90                   	nop
  405494:	90                   	nop
  405495:	90                   	nop
  405496:	90                   	nop
  405497:	41 ff cc             	dec    %r12d
  40549a:	0f 85 20 f4 ff ff    	jne    4048c0 <REPETITIONS1LOOP>
  4054a0:	eb 00                	jmp    4054a2 <THREAD_T1_END>

00000000004054a2 <THREAD_T1_END>:
  4054a2:	31 c0                	xor    %eax,%eax
  4054a4:	0f a2                	cpuid  
  4054a6:	0f 31                	rdtsc  
  4054a8:	41 29 45 00          	sub    %eax,0x0(%r13)
  4054ac:	31 c0                	xor    %eax,%eax
  4054ae:	0f a2                	cpuid  
  4054b0:	8b 0d 86 a9 00 00    	mov    0xa986(%rip),%ecx        # 40fe3c <Counters>
  4054b6:	0f 33                	rdpmc  
  4054b8:	41 29 45 04          	sub    %eax,0x4(%r13)
  4054bc:	8b 0d 7e a9 00 00    	mov    0xa97e(%rip),%ecx        # 40fe40 <Counters+0x4>
  4054c2:	0f 33                	rdpmc  
  4054c4:	41 29 45 08          	sub    %eax,0x8(%r13)
  4054c8:	8b 0d 76 a9 00 00    	mov    0xa976(%rip),%ecx        # 40fe44 <Counters+0x8>
  4054ce:	0f 33                	rdpmc  
  4054d0:	41 29 45 0c          	sub    %eax,0xc(%r13)
  4054d4:	8b 0d 6e a9 00 00    	mov    0xa96e(%rip),%ecx        # 40fe48 <Counters+0xc>
  4054da:	0f 33                	rdpmc  
  4054dc:	41 29 45 10          	sub    %eax,0x10(%r13)
  4054e0:	8b 0d 66 a9 00 00    	mov    0xa966(%rip),%ecx        # 40fe4c <Counters+0x10>
  4054e6:	0f 33                	rdpmc  
  4054e8:	41 29 45 14          	sub    %eax,0x14(%r13)
  4054ec:	8b 0d 5e a9 00 00    	mov    0xa95e(%rip),%ecx        # 40fe50 <Counters+0x14>
  4054f2:	0f 33                	rdpmc  
  4054f4:	41 29 45 18          	sub    %eax,0x18(%r13)
  4054f8:	8b 0d 56 a9 00 00    	mov    0xa956(%rip),%ecx        # 40fe54 <Counters+0x18>
  4054fe:	0f 33                	rdpmc  
  405500:	41 29 45 1c          	sub    %eax,0x1c(%r13)
  405504:	8b 0d 4e a9 00 00    	mov    0xa94e(%rip),%ecx        # 40fe58 <Counters+0x1c>
  40550a:	0f 33                	rdpmc  
  40550c:	41 29 45 20          	sub    %eax,0x20(%r13)
  405510:	31 c0                	xor    %eax,%eax
  405512:	0f a2                	cpuid  
  405514:	41 8b 45 00          	mov    0x0(%r13),%eax
  405518:	f7 d8                	neg    %eax
  40551a:	41 2b 45 48          	sub    0x48(%r13),%eax
  40551e:	43 89 44 b5 6c       	mov    %eax,0x6c(%r13,%r14,4)
  405523:	41 8b 45 04          	mov    0x4(%r13),%eax
  405527:	f7 d8                	neg    %eax
  405529:	41 2b 45 4c          	sub    0x4c(%r13),%eax
  40552d:	43 89 84 b5 14 10 00 	mov    %eax,0x1014(%r13,%r14,4)
  405534:	00 
  405535:	41 8b 45 08          	mov    0x8(%r13),%eax
  405539:	f7 d8                	neg    %eax
  40553b:	41 2b 45 50          	sub    0x50(%r13),%eax
  40553f:	43 89 84 b5 18 10 00 	mov    %eax,0x1018(%r13,%r14,4)
  405546:	00 
  405547:	41 8b 45 0c          	mov    0xc(%r13),%eax
  40554b:	f7 d8                	neg    %eax
  40554d:	41 2b 45 54          	sub    0x54(%r13),%eax
  405551:	43 89 84 b5 1c 10 00 	mov    %eax,0x101c(%r13,%r14,4)
  405558:	00 
  405559:	41 8b 45 10          	mov    0x10(%r13),%eax
  40555d:	f7 d8                	neg    %eax
  40555f:	41 2b 45 58          	sub    0x58(%r13),%eax
  405563:	43 89 84 b5 20 10 00 	mov    %eax,0x1020(%r13,%r14,4)
  40556a:	00 
  40556b:	41 8b 45 14          	mov    0x14(%r13),%eax
  40556f:	f7 d8                	neg    %eax
  405571:	41 2b 45 5c          	sub    0x5c(%r13),%eax
  405575:	43 89 84 b5 24 10 00 	mov    %eax,0x1024(%r13,%r14,4)
  40557c:	00 
  40557d:	41 8b 45 18          	mov    0x18(%r13),%eax
  405581:	f7 d8                	neg    %eax
  405583:	41 2b 45 60          	sub    0x60(%r13),%eax
  405587:	43 89 84 b5 28 10 00 	mov    %eax,0x1028(%r13,%r14,4)
  40558e:	00 
  40558f:	41 8b 45 1c          	mov    0x1c(%r13),%eax
  405593:	f7 d8                	neg    %eax
  405595:	41 2b 45 64          	sub    0x64(%r13),%eax
  405599:	43 89 84 b5 2c 10 00 	mov    %eax,0x102c(%r13,%r14,4)
  4055a0:	00 
  4055a1:	41 8b 45 20          	mov    0x20(%r13),%eax
  4055a5:	f7 d8                	neg    %eax
  4055a7:	41 2b 45 68          	sub    0x68(%r13),%eax
  4055ab:	43 89 84 b5 30 10 00 	mov    %eax,0x1030(%r13,%r14,4)
  4055b2:	00 
  4055b3:	31 c0                	xor    %eax,%eax
  4055b5:	0f a2                	cpuid  

00000000004055b7 <END_TEST_LOOP_2>:
  4055b7:	41 ff c6             	inc    %r14d
  4055ba:	41 83 fe 01          	cmp    $0x1,%r14d
  4055be:	0f 82 42 f2 ff ff    	jb     404806 <TEST_LOOP_2>

00000000004055c4 <EXITALL1>:
  4055c4:	49 8b a5 58 10 00 00 	mov    0x1058(%r13),%rsp
  4055cb:	9b db e3             	finit  
  4055ce:	fc                   	cld    
  4055cf:	c5 fc 77             	vzeroall 

00000000004055d2 <EXITALL2>:
  4055d2:	b8 01 00 00 00       	mov    $0x1,%eax
  4055d7:	41 5f                	pop    %r15
  4055d9:	41 5e                	pop    %r14
  4055db:	41 5d                	pop    %r13
  4055dd:	41 5c                	pop    %r12
  4055df:	5d                   	pop    %rbp
  4055e0:	5b                   	pop    %rbx
  4055e1:	c3                   	ret    

Disassembly of section .sec_gadget_0:

00000000004055e2 <start_gadget_0>:
  4055e2:	41 ff e3             	jmp    *%r11
  4055e5:	90                   	nop
  4055e6:	90                   	nop
  4055e7:	90                   	nop
  4055e8:	90                   	nop
  4055e9:	90                   	nop
  4055ea:	90                   	nop
  4055eb:	90                   	nop
  4055ec:	90                   	nop
  4055ed:	90                   	nop
  4055ee:	90                   	nop
  4055ef:	90                   	nop
  4055f0:	90                   	nop
  4055f1:	90                   	nop
  4055f2:	90                   	nop
  4055f3:	90                   	nop
  4055f4:	90                   	nop
  4055f5:	90                   	nop
  4055f6:	90                   	nop
  4055f7:	90                   	nop
  4055f8:	90                   	nop
  4055f9:	90                   	nop
  4055fa:	90                   	nop
  4055fb:	90                   	nop
  4055fc:	90                   	nop
  4055fd:	90                   	nop
  4055fe:	90                   	nop
  4055ff:	90                   	nop
  405600:	90                   	nop
  405601:	90                   	nop
  405602:	90                   	nop
  405603:	90                   	nop
  405604:	90                   	nop
  405605:	90                   	nop
  405606:	90                   	nop
  405607:	90                   	nop
  405608:	90                   	nop
  405609:	90                   	nop
  40560a:	90                   	nop
  40560b:	90                   	nop
  40560c:	90                   	nop
  40560d:	90                   	nop
  40560e:	90                   	nop
  40560f:	90                   	nop
  405610:	90                   	nop
  405611:	90                   	nop
  405612:	90                   	nop
  405613:	90                   	nop
  405614:	90                   	nop
  405615:	90                   	nop
  405616:	90                   	nop
  405617:	90                   	nop
  405618:	90                   	nop
  405619:	90                   	nop
  40561a:	90                   	nop
  40561b:	90                   	nop
  40561c:	90                   	nop
  40561d:	90                   	nop
  40561e:	90                   	nop
  40561f:	90                   	nop
  405620:	90                   	nop
  405621:	90                   	nop
  405622:	90                   	nop
  405623:	90                   	nop
  405624:	90                   	nop
  405625:	90                   	nop
  405626:	90                   	nop
  405627:	90                   	nop
  405628:	90                   	nop
  405629:	90                   	nop
  40562a:	90                   	nop
  40562b:	90                   	nop
  40562c:	90                   	nop
  40562d:	90                   	nop
  40562e:	90                   	nop
  40562f:	90                   	nop
  405630:	90                   	nop
  405631:	90                   	nop
  405632:	90                   	nop
  405633:	90                   	nop
  405634:	90                   	nop
  405635:	90                   	nop
  405636:	90                   	nop
  405637:	90                   	nop
  405638:	90                   	nop
  405639:	90                   	nop
  40563a:	90                   	nop
  40563b:	90                   	nop
  40563c:	90                   	nop
  40563d:	90                   	nop
  40563e:	90                   	nop
  40563f:	90                   	nop
  405640:	90                   	nop
  405641:	90                   	nop
  405642:	90                   	nop
  405643:	90                   	nop
  405644:	90                   	nop
  405645:	90                   	nop
  405646:	90                   	nop
  405647:	90                   	nop
  405648:	90                   	nop
  405649:	90                   	nop
  40564a:	90                   	nop
  40564b:	90                   	nop
  40564c:	90                   	nop
  40564d:	90                   	nop
  40564e:	90                   	nop
  40564f:	90                   	nop
  405650:	90                   	nop
  405651:	90                   	nop
  405652:	90                   	nop
  405653:	90                   	nop
  405654:	90                   	nop
  405655:	90                   	nop
  405656:	90                   	nop
  405657:	90                   	nop
  405658:	90                   	nop
  405659:	90                   	nop
  40565a:	90                   	nop
  40565b:	90                   	nop
  40565c:	90                   	nop
  40565d:	90                   	nop
  40565e:	90                   	nop
  40565f:	90                   	nop
  405660:	90                   	nop
  405661:	90                   	nop
  405662:	90                   	nop
  405663:	90                   	nop
  405664:	90                   	nop
  405665:	90                   	nop
  405666:	90                   	nop
  405667:	90                   	nop
  405668:	90                   	nop
  405669:	90                   	nop
  40566a:	90                   	nop
  40566b:	90                   	nop
  40566c:	90                   	nop
  40566d:	90                   	nop
  40566e:	90                   	nop
  40566f:	90                   	nop
  405670:	90                   	nop
  405671:	90                   	nop
  405672:	90                   	nop
  405673:	90                   	nop
  405674:	90                   	nop
  405675:	90                   	nop
  405676:	90                   	nop
  405677:	90                   	nop
  405678:	90                   	nop
  405679:	90                   	nop
  40567a:	90                   	nop
  40567b:	90                   	nop
  40567c:	90                   	nop
  40567d:	90                   	nop
  40567e:	90                   	nop
  40567f:	90                   	nop
  405680:	90                   	nop
  405681:	90                   	nop
  405682:	90                   	nop
  405683:	90                   	nop
  405684:	90                   	nop
  405685:	90                   	nop
  405686:	90                   	nop
  405687:	90                   	nop
  405688:	90                   	nop
  405689:	90                   	nop
  40568a:	90                   	nop
  40568b:	90                   	nop
  40568c:	90                   	nop
  40568d:	90                   	nop
  40568e:	90                   	nop
  40568f:	90                   	nop
  405690:	90                   	nop
  405691:	90                   	nop
  405692:	90                   	nop
  405693:	90                   	nop
  405694:	90                   	nop
  405695:	90                   	nop
  405696:	90                   	nop
  405697:	90                   	nop
  405698:	90                   	nop
  405699:	90                   	nop
  40569a:	90                   	nop
  40569b:	90                   	nop
  40569c:	90                   	nop
  40569d:	90                   	nop
  40569e:	90                   	nop
  40569f:	90                   	nop
  4056a0:	90                   	nop
  4056a1:	90                   	nop
  4056a2:	90                   	nop
  4056a3:	90                   	nop
  4056a4:	90                   	nop
  4056a5:	90                   	nop
  4056a6:	90                   	nop
  4056a7:	90                   	nop
  4056a8:	90                   	nop
  4056a9:	90                   	nop
  4056aa:	90                   	nop
  4056ab:	90                   	nop
  4056ac:	90                   	nop
  4056ad:	90                   	nop
  4056ae:	90                   	nop
  4056af:	90                   	nop
  4056b0:	90                   	nop
  4056b1:	90                   	nop
  4056b2:	90                   	nop
  4056b3:	90                   	nop
  4056b4:	90                   	nop
  4056b5:	90                   	nop
  4056b6:	90                   	nop
  4056b7:	90                   	nop
  4056b8:	90                   	nop
  4056b9:	90                   	nop
  4056ba:	90                   	nop
  4056bb:	90                   	nop
  4056bc:	90                   	nop
  4056bd:	90                   	nop
  4056be:	90                   	nop
  4056bf:	90                   	nop
  4056c0:	90                   	nop
  4056c1:	90                   	nop
  4056c2:	90                   	nop
  4056c3:	90                   	nop
  4056c4:	90                   	nop
  4056c5:	90                   	nop
  4056c6:	90                   	nop
  4056c7:	90                   	nop
  4056c8:	90                   	nop
  4056c9:	90                   	nop
  4056ca:	90                   	nop
  4056cb:	90                   	nop
  4056cc:	90                   	nop
  4056cd:	90                   	nop
  4056ce:	90                   	nop
  4056cf:	90                   	nop
  4056d0:	90                   	nop
  4056d1:	90                   	nop
  4056d2:	90                   	nop
  4056d3:	90                   	nop
  4056d4:	90                   	nop
  4056d5:	90                   	nop
  4056d6:	90                   	nop
  4056d7:	90                   	nop
  4056d8:	90                   	nop
  4056d9:	90                   	nop
  4056da:	90                   	nop
  4056db:	90                   	nop
  4056dc:	90                   	nop
  4056dd:	90                   	nop
  4056de:	90                   	nop
  4056df:	90                   	nop
  4056e0:	90                   	nop
  4056e1:	90                   	nop
  4056e2:	90                   	nop
  4056e3:	90                   	nop
  4056e4:	90                   	nop
  4056e5:	90                   	nop
  4056e6:	90                   	nop
  4056e7:	90                   	nop
  4056e8:	90                   	nop
  4056e9:	90                   	nop
  4056ea:	90                   	nop
  4056eb:	90                   	nop
  4056ec:	90                   	nop
  4056ed:	90                   	nop
  4056ee:	90                   	nop
  4056ef:	90                   	nop
  4056f0:	90                   	nop
  4056f1:	90                   	nop
  4056f2:	90                   	nop
  4056f3:	90                   	nop
  4056f4:	90                   	nop
  4056f5:	90                   	nop
  4056f6:	90                   	nop
  4056f7:	90                   	nop
  4056f8:	90                   	nop
  4056f9:	90                   	nop
  4056fa:	90                   	nop
  4056fb:	90                   	nop
  4056fc:	90                   	nop
  4056fd:	90                   	nop
  4056fe:	90                   	nop
  4056ff:	90                   	nop
  405700:	90                   	nop
  405701:	90                   	nop
  405702:	90                   	nop
  405703:	90                   	nop
  405704:	90                   	nop
  405705:	90                   	nop
  405706:	90                   	nop
  405707:	90                   	nop
  405708:	90                   	nop
  405709:	90                   	nop
  40570a:	90                   	nop
  40570b:	90                   	nop
  40570c:	90                   	nop
  40570d:	90                   	nop
  40570e:	90                   	nop
  40570f:	90                   	nop
  405710:	90                   	nop
  405711:	90                   	nop
  405712:	90                   	nop
  405713:	90                   	nop
  405714:	90                   	nop
  405715:	90                   	nop
  405716:	90                   	nop
  405717:	90                   	nop
  405718:	90                   	nop
  405719:	90                   	nop
  40571a:	90                   	nop
  40571b:	90                   	nop
  40571c:	90                   	nop
  40571d:	90                   	nop
  40571e:	90                   	nop
  40571f:	90                   	nop
  405720:	90                   	nop
  405721:	90                   	nop
  405722:	90                   	nop
  405723:	90                   	nop
  405724:	90                   	nop
  405725:	90                   	nop
  405726:	90                   	nop
  405727:	90                   	nop
  405728:	90                   	nop
  405729:	90                   	nop
  40572a:	90                   	nop
  40572b:	90                   	nop
  40572c:	90                   	nop
  40572d:	90                   	nop
  40572e:	90                   	nop
  40572f:	90                   	nop
  405730:	90                   	nop
  405731:	90                   	nop
  405732:	90                   	nop
  405733:	90                   	nop
  405734:	90                   	nop
  405735:	90                   	nop
  405736:	90                   	nop
  405737:	90                   	nop
  405738:	90                   	nop
  405739:	90                   	nop
  40573a:	90                   	nop
  40573b:	90                   	nop
  40573c:	90                   	nop
  40573d:	90                   	nop
  40573e:	90                   	nop
  40573f:	90                   	nop
  405740:	90                   	nop
  405741:	90                   	nop
  405742:	90                   	nop
  405743:	90                   	nop
  405744:	90                   	nop
  405745:	90                   	nop
  405746:	90                   	nop
  405747:	90                   	nop
  405748:	90                   	nop
  405749:	90                   	nop
  40574a:	90                   	nop
  40574b:	90                   	nop
  40574c:	90                   	nop
  40574d:	90                   	nop
  40574e:	90                   	nop
  40574f:	90                   	nop
  405750:	90                   	nop
  405751:	90                   	nop
  405752:	90                   	nop
  405753:	90                   	nop
  405754:	90                   	nop
  405755:	90                   	nop
  405756:	90                   	nop
  405757:	90                   	nop
  405758:	90                   	nop
  405759:	90                   	nop
  40575a:	90                   	nop
  40575b:	90                   	nop
  40575c:	90                   	nop
  40575d:	90                   	nop
  40575e:	90                   	nop
  40575f:	90                   	nop
  405760:	90                   	nop
  405761:	90                   	nop
  405762:	90                   	nop
  405763:	90                   	nop
  405764:	90                   	nop
  405765:	90                   	nop
  405766:	90                   	nop
  405767:	90                   	nop
  405768:	90                   	nop
  405769:	90                   	nop
  40576a:	90                   	nop
  40576b:	90                   	nop
  40576c:	90                   	nop
  40576d:	90                   	nop
  40576e:	90                   	nop
  40576f:	90                   	nop
  405770:	90                   	nop
  405771:	90                   	nop
  405772:	90                   	nop
  405773:	90                   	nop
  405774:	90                   	nop
  405775:	90                   	nop
  405776:	90                   	nop
  405777:	90                   	nop
  405778:	90                   	nop
  405779:	90                   	nop
  40577a:	90                   	nop
  40577b:	90                   	nop
  40577c:	90                   	nop
  40577d:	90                   	nop
  40577e:	90                   	nop
  40577f:	90                   	nop
  405780:	90                   	nop
  405781:	90                   	nop
  405782:	90                   	nop
  405783:	90                   	nop
  405784:	90                   	nop
  405785:	90                   	nop
  405786:	90                   	nop
  405787:	90                   	nop
  405788:	90                   	nop
  405789:	90                   	nop
  40578a:	90                   	nop
  40578b:	90                   	nop
  40578c:	90                   	nop
  40578d:	90                   	nop
  40578e:	90                   	nop
  40578f:	90                   	nop
  405790:	90                   	nop
  405791:	90                   	nop
  405792:	90                   	nop
  405793:	90                   	nop
  405794:	90                   	nop
  405795:	90                   	nop
  405796:	90                   	nop
  405797:	90                   	nop
  405798:	90                   	nop
  405799:	90                   	nop
  40579a:	90                   	nop
  40579b:	90                   	nop
  40579c:	90                   	nop
  40579d:	90                   	nop
  40579e:	90                   	nop
  40579f:	90                   	nop
  4057a0:	90                   	nop
  4057a1:	90                   	nop
  4057a2:	90                   	nop
  4057a3:	90                   	nop
  4057a4:	90                   	nop
  4057a5:	90                   	nop
  4057a6:	90                   	nop
  4057a7:	90                   	nop
  4057a8:	90                   	nop
  4057a9:	90                   	nop
  4057aa:	90                   	nop
  4057ab:	90                   	nop
  4057ac:	90                   	nop
  4057ad:	90                   	nop
  4057ae:	90                   	nop
  4057af:	90                   	nop
  4057b0:	90                   	nop
  4057b1:	90                   	nop
  4057b2:	90                   	nop
  4057b3:	90                   	nop
  4057b4:	90                   	nop
  4057b5:	90                   	nop
  4057b6:	90                   	nop
  4057b7:	90                   	nop
  4057b8:	90                   	nop
  4057b9:	90                   	nop
  4057ba:	90                   	nop
  4057bb:	90                   	nop
  4057bc:	90                   	nop
  4057bd:	90                   	nop
  4057be:	90                   	nop
  4057bf:	90                   	nop
  4057c0:	90                   	nop
  4057c1:	90                   	nop
  4057c2:	90                   	nop
  4057c3:	90                   	nop
  4057c4:	90                   	nop
  4057c5:	90                   	nop
  4057c6:	90                   	nop
  4057c7:	90                   	nop
  4057c8:	90                   	nop
  4057c9:	90                   	nop
  4057ca:	90                   	nop
  4057cb:	90                   	nop
  4057cc:	90                   	nop
  4057cd:	90                   	nop
  4057ce:	90                   	nop
  4057cf:	90                   	nop
  4057d0:	90                   	nop
  4057d1:	90                   	nop
  4057d2:	90                   	nop
  4057d3:	90                   	nop
  4057d4:	90                   	nop
  4057d5:	90                   	nop
  4057d6:	90                   	nop
  4057d7:	90                   	nop
  4057d8:	90                   	nop
  4057d9:	90                   	nop
  4057da:	90                   	nop
  4057db:	90                   	nop
  4057dc:	90                   	nop
  4057dd:	90                   	nop
  4057de:	90                   	nop
  4057df:	90                   	nop
  4057e0:	90                   	nop
  4057e1:	90                   	nop
  4057e2:	90                   	nop
  4057e3:	90                   	nop
  4057e4:	90                   	nop
  4057e5:	c3                   	ret    
  4057e6:	90                   	nop
  4057e7:	90                   	nop
  4057e8:	90                   	nop
  4057e9:	90                   	nop
  4057ea:	90                   	nop
  4057eb:	90                   	nop
  4057ec:	90                   	nop
  4057ed:	90                   	nop
  4057ee:	90                   	nop
  4057ef:	90                   	nop
  4057f0:	90                   	nop
  4057f1:	90                   	nop
  4057f2:	90                   	nop
  4057f3:	90                   	nop
  4057f4:	90                   	nop
  4057f5:	90                   	nop
  4057f6:	90                   	nop
  4057f7:	90                   	nop
  4057f8:	90                   	nop
  4057f9:	90                   	nop
  4057fa:	90                   	nop
  4057fb:	90                   	nop
  4057fc:	90                   	nop
  4057fd:	90                   	nop
  4057fe:	90                   	nop
  4057ff:	90                   	nop
  405800:	90                   	nop
  405801:	90                   	nop
  405802:	90                   	nop
  405803:	90                   	nop
  405804:	90                   	nop
  405805:	90                   	nop
  405806:	90                   	nop
  405807:	90                   	nop
  405808:	90                   	nop
  405809:	90                   	nop
  40580a:	90                   	nop
  40580b:	90                   	nop
  40580c:	90                   	nop
  40580d:	90                   	nop
  40580e:	90                   	nop
  40580f:	90                   	nop
  405810:	90                   	nop
  405811:	90                   	nop
  405812:	90                   	nop
  405813:	90                   	nop
  405814:	90                   	nop
  405815:	90                   	nop
  405816:	90                   	nop
  405817:	90                   	nop
  405818:	90                   	nop
  405819:	90                   	nop
  40581a:	90                   	nop
  40581b:	90                   	nop
  40581c:	90                   	nop
  40581d:	90                   	nop
  40581e:	90                   	nop
  40581f:	90                   	nop
  405820:	90                   	nop
  405821:	90                   	nop
  405822:	90                   	nop
  405823:	90                   	nop
  405824:	90                   	nop
  405825:	90                   	nop
  405826:	90                   	nop
  405827:	90                   	nop
  405828:	90                   	nop
  405829:	90                   	nop
  40582a:	90                   	nop
  40582b:	90                   	nop
  40582c:	90                   	nop
  40582d:	90                   	nop
  40582e:	90                   	nop
  40582f:	90                   	nop
  405830:	90                   	nop
  405831:	90                   	nop
  405832:	90                   	nop
  405833:	90                   	nop
  405834:	90                   	nop
  405835:	90                   	nop
  405836:	90                   	nop
  405837:	90                   	nop
  405838:	90                   	nop
  405839:	90                   	nop
  40583a:	90                   	nop
  40583b:	90                   	nop
  40583c:	90                   	nop
  40583d:	90                   	nop
  40583e:	90                   	nop
  40583f:	90                   	nop
  405840:	90                   	nop
  405841:	90                   	nop
  405842:	90                   	nop
  405843:	90                   	nop
  405844:	90                   	nop
  405845:	90                   	nop
  405846:	90                   	nop
  405847:	90                   	nop
  405848:	90                   	nop
  405849:	90                   	nop
  40584a:	90                   	nop
  40584b:	90                   	nop
  40584c:	90                   	nop
  40584d:	90                   	nop
  40584e:	90                   	nop
  40584f:	90                   	nop
  405850:	90                   	nop
  405851:	90                   	nop
  405852:	90                   	nop
  405853:	90                   	nop
  405854:	90                   	nop
  405855:	90                   	nop
  405856:	90                   	nop
  405857:	90                   	nop
  405858:	90                   	nop
  405859:	90                   	nop
  40585a:	90                   	nop
  40585b:	90                   	nop
  40585c:	90                   	nop
  40585d:	90                   	nop
  40585e:	90                   	nop
  40585f:	90                   	nop
  405860:	90                   	nop
  405861:	90                   	nop
  405862:	90                   	nop
  405863:	90                   	nop
  405864:	90                   	nop
  405865:	90                   	nop
  405866:	90                   	nop
  405867:	90                   	nop
  405868:	90                   	nop
  405869:	90                   	nop
  40586a:	90                   	nop
  40586b:	90                   	nop
  40586c:	90                   	nop
  40586d:	90                   	nop
  40586e:	90                   	nop
  40586f:	90                   	nop
  405870:	90                   	nop
  405871:	90                   	nop
  405872:	90                   	nop
  405873:	90                   	nop
  405874:	90                   	nop
  405875:	90                   	nop
  405876:	90                   	nop
  405877:	90                   	nop
  405878:	90                   	nop
  405879:	90                   	nop
  40587a:	90                   	nop
  40587b:	90                   	nop
  40587c:	90                   	nop
  40587d:	90                   	nop
  40587e:	90                   	nop
  40587f:	90                   	nop
  405880:	90                   	nop
  405881:	90                   	nop
  405882:	90                   	nop
  405883:	90                   	nop
  405884:	90                   	nop
  405885:	90                   	nop
  405886:	90                   	nop
  405887:	90                   	nop
  405888:	90                   	nop
  405889:	90                   	nop
  40588a:	90                   	nop
  40588b:	90                   	nop
  40588c:	90                   	nop
  40588d:	90                   	nop
  40588e:	90                   	nop
  40588f:	90                   	nop
  405890:	90                   	nop
  405891:	90                   	nop
  405892:	90                   	nop
  405893:	90                   	nop
  405894:	90                   	nop
  405895:	90                   	nop
  405896:	90                   	nop
  405897:	90                   	nop
  405898:	90                   	nop
  405899:	90                   	nop
  40589a:	90                   	nop
  40589b:	90                   	nop
  40589c:	90                   	nop
  40589d:	90                   	nop
  40589e:	90                   	nop
  40589f:	90                   	nop
  4058a0:	90                   	nop
  4058a1:	90                   	nop
  4058a2:	90                   	nop
  4058a3:	90                   	nop
  4058a4:	90                   	nop
  4058a5:	90                   	nop
  4058a6:	90                   	nop
  4058a7:	90                   	nop
  4058a8:	90                   	nop
  4058a9:	90                   	nop
  4058aa:	90                   	nop
  4058ab:	90                   	nop
  4058ac:	90                   	nop
  4058ad:	90                   	nop
  4058ae:	90                   	nop
  4058af:	90                   	nop
  4058b0:	90                   	nop
  4058b1:	90                   	nop
  4058b2:	90                   	nop
  4058b3:	90                   	nop
  4058b4:	90                   	nop
  4058b5:	90                   	nop
  4058b6:	90                   	nop
  4058b7:	90                   	nop
  4058b8:	90                   	nop
  4058b9:	90                   	nop
  4058ba:	90                   	nop
  4058bb:	90                   	nop
  4058bc:	90                   	nop
  4058bd:	90                   	nop
  4058be:	90                   	nop
  4058bf:	90                   	nop
  4058c0:	90                   	nop
  4058c1:	90                   	nop
  4058c2:	90                   	nop
  4058c3:	90                   	nop
  4058c4:	90                   	nop
  4058c5:	90                   	nop
  4058c6:	90                   	nop
  4058c7:	90                   	nop
  4058c8:	90                   	nop
  4058c9:	90                   	nop
  4058ca:	90                   	nop
  4058cb:	90                   	nop
  4058cc:	90                   	nop
  4058cd:	90                   	nop
  4058ce:	90                   	nop
  4058cf:	90                   	nop
  4058d0:	90                   	nop
  4058d1:	90                   	nop
  4058d2:	90                   	nop
  4058d3:	90                   	nop
  4058d4:	90                   	nop
  4058d5:	90                   	nop
  4058d6:	90                   	nop
  4058d7:	90                   	nop
  4058d8:	90                   	nop
  4058d9:	90                   	nop
  4058da:	90                   	nop
  4058db:	90                   	nop
  4058dc:	90                   	nop
  4058dd:	90                   	nop
  4058de:	90                   	nop
  4058df:	90                   	nop
  4058e0:	90                   	nop
  4058e1:	90                   	nop
  4058e2:	90                   	nop
  4058e3:	90                   	nop
  4058e4:	90                   	nop
  4058e5:	90                   	nop
  4058e6:	90                   	nop
  4058e7:	90                   	nop
  4058e8:	90                   	nop
  4058e9:	90                   	nop
  4058ea:	90                   	nop
  4058eb:	90                   	nop
  4058ec:	90                   	nop
  4058ed:	90                   	nop
  4058ee:	90                   	nop
  4058ef:	90                   	nop
  4058f0:	90                   	nop
  4058f1:	90                   	nop
  4058f2:	90                   	nop
  4058f3:	90                   	nop
  4058f4:	90                   	nop
  4058f5:	90                   	nop
  4058f6:	90                   	nop
  4058f7:	90                   	nop
  4058f8:	90                   	nop
  4058f9:	90                   	nop
  4058fa:	90                   	nop
  4058fb:	90                   	nop
  4058fc:	90                   	nop
  4058fd:	90                   	nop
  4058fe:	90                   	nop
  4058ff:	90                   	nop
  405900:	90                   	nop
  405901:	90                   	nop
  405902:	90                   	nop
  405903:	90                   	nop
  405904:	90                   	nop
  405905:	90                   	nop
  405906:	90                   	nop
  405907:	90                   	nop
  405908:	90                   	nop
  405909:	90                   	nop
  40590a:	90                   	nop
  40590b:	90                   	nop
  40590c:	90                   	nop
  40590d:	90                   	nop
  40590e:	90                   	nop
  40590f:	90                   	nop
  405910:	90                   	nop
  405911:	90                   	nop
  405912:	90                   	nop
  405913:	90                   	nop
  405914:	90                   	nop
  405915:	90                   	nop
  405916:	90                   	nop
  405917:	90                   	nop
  405918:	90                   	nop
  405919:	90                   	nop
  40591a:	90                   	nop
  40591b:	90                   	nop
  40591c:	90                   	nop
  40591d:	90                   	nop
  40591e:	90                   	nop
  40591f:	90                   	nop
  405920:	90                   	nop
  405921:	90                   	nop
  405922:	90                   	nop
  405923:	90                   	nop
  405924:	90                   	nop
  405925:	90                   	nop
  405926:	90                   	nop
  405927:	90                   	nop
  405928:	90                   	nop
  405929:	90                   	nop
  40592a:	90                   	nop
  40592b:	90                   	nop
  40592c:	90                   	nop
  40592d:	90                   	nop
  40592e:	90                   	nop
  40592f:	90                   	nop
  405930:	90                   	nop
  405931:	90                   	nop
  405932:	90                   	nop
  405933:	90                   	nop
  405934:	90                   	nop
  405935:	90                   	nop
  405936:	90                   	nop
  405937:	90                   	nop
  405938:	90                   	nop
  405939:	90                   	nop
  40593a:	90                   	nop
  40593b:	90                   	nop
  40593c:	90                   	nop
  40593d:	90                   	nop
  40593e:	90                   	nop
  40593f:	90                   	nop
  405940:	90                   	nop
  405941:	90                   	nop
  405942:	90                   	nop
  405943:	90                   	nop
  405944:	90                   	nop
  405945:	90                   	nop
  405946:	90                   	nop
  405947:	90                   	nop
  405948:	90                   	nop
  405949:	90                   	nop
  40594a:	90                   	nop
  40594b:	90                   	nop
  40594c:	90                   	nop
  40594d:	90                   	nop
  40594e:	90                   	nop
  40594f:	90                   	nop
  405950:	90                   	nop
  405951:	90                   	nop
  405952:	90                   	nop
  405953:	90                   	nop
  405954:	90                   	nop
  405955:	90                   	nop
  405956:	90                   	nop
  405957:	90                   	nop
  405958:	90                   	nop
  405959:	90                   	nop
  40595a:	90                   	nop
  40595b:	90                   	nop
  40595c:	90                   	nop
  40595d:	90                   	nop
  40595e:	90                   	nop
  40595f:	90                   	nop
  405960:	90                   	nop
  405961:	90                   	nop
  405962:	90                   	nop
  405963:	90                   	nop
  405964:	90                   	nop
  405965:	90                   	nop
  405966:	90                   	nop
  405967:	90                   	nop
  405968:	90                   	nop
  405969:	90                   	nop
  40596a:	90                   	nop
  40596b:	90                   	nop
  40596c:	90                   	nop
  40596d:	90                   	nop
  40596e:	90                   	nop
  40596f:	90                   	nop
  405970:	90                   	nop
  405971:	90                   	nop
  405972:	90                   	nop
  405973:	90                   	nop
  405974:	90                   	nop
  405975:	90                   	nop
  405976:	90                   	nop
  405977:	90                   	nop
  405978:	90                   	nop
  405979:	90                   	nop
  40597a:	90                   	nop
  40597b:	90                   	nop
  40597c:	90                   	nop
  40597d:	90                   	nop
  40597e:	90                   	nop
  40597f:	90                   	nop
  405980:	90                   	nop
  405981:	90                   	nop
  405982:	90                   	nop
  405983:	90                   	nop
  405984:	90                   	nop
  405985:	90                   	nop
  405986:	90                   	nop
  405987:	90                   	nop
  405988:	90                   	nop
  405989:	90                   	nop
  40598a:	90                   	nop
  40598b:	90                   	nop
  40598c:	90                   	nop
  40598d:	90                   	nop
  40598e:	90                   	nop
  40598f:	90                   	nop
  405990:	90                   	nop
  405991:	90                   	nop
  405992:	90                   	nop
  405993:	90                   	nop
  405994:	90                   	nop
  405995:	90                   	nop
  405996:	90                   	nop
  405997:	90                   	nop
  405998:	90                   	nop
  405999:	90                   	nop
  40599a:	90                   	nop
  40599b:	90                   	nop
  40599c:	90                   	nop
  40599d:	90                   	nop
  40599e:	90                   	nop
  40599f:	90                   	nop
  4059a0:	90                   	nop
  4059a1:	90                   	nop
  4059a2:	90                   	nop
  4059a3:	90                   	nop
  4059a4:	90                   	nop
  4059a5:	90                   	nop
  4059a6:	90                   	nop
  4059a7:	90                   	nop
  4059a8:	90                   	nop
  4059a9:	90                   	nop
  4059aa:	90                   	nop
  4059ab:	90                   	nop
  4059ac:	90                   	nop
  4059ad:	90                   	nop
  4059ae:	90                   	nop
  4059af:	90                   	nop
  4059b0:	90                   	nop
  4059b1:	90                   	nop
  4059b2:	90                   	nop
  4059b3:	90                   	nop
  4059b4:	90                   	nop
  4059b5:	90                   	nop
  4059b6:	90                   	nop
  4059b7:	90                   	nop
  4059b8:	90                   	nop
  4059b9:	90                   	nop
  4059ba:	90                   	nop
  4059bb:	90                   	nop
  4059bc:	90                   	nop
  4059bd:	90                   	nop
  4059be:	90                   	nop
  4059bf:	90                   	nop
  4059c0:	90                   	nop
  4059c1:	90                   	nop
  4059c2:	90                   	nop
  4059c3:	90                   	nop
  4059c4:	90                   	nop
  4059c5:	90                   	nop
  4059c6:	90                   	nop
  4059c7:	90                   	nop
  4059c8:	90                   	nop
  4059c9:	90                   	nop
  4059ca:	90                   	nop
  4059cb:	90                   	nop
  4059cc:	90                   	nop
  4059cd:	90                   	nop
  4059ce:	90                   	nop
  4059cf:	90                   	nop
  4059d0:	90                   	nop
  4059d1:	90                   	nop
  4059d2:	90                   	nop
  4059d3:	90                   	nop
  4059d4:	90                   	nop
  4059d5:	90                   	nop
  4059d6:	90                   	nop
  4059d7:	90                   	nop
  4059d8:	90                   	nop
  4059d9:	90                   	nop
  4059da:	90                   	nop
  4059db:	90                   	nop
  4059dc:	90                   	nop
  4059dd:	90                   	nop
  4059de:	90                   	nop
  4059df:	90                   	nop
  4059e0:	90                   	nop
  4059e1:	90                   	nop
  4059e2:	90                   	nop
  4059e3:	90                   	nop
  4059e4:	90                   	nop
  4059e5:	90                   	nop

Disassembly of section .sec_gadget_1:

00000000004059e6 <start_gadget_1>:
  4059e6:	41 ff e3             	jmp    *%r11
  4059e9:	90                   	nop
  4059ea:	90                   	nop
  4059eb:	90                   	nop
  4059ec:	90                   	nop
  4059ed:	90                   	nop
  4059ee:	90                   	nop
  4059ef:	90                   	nop
  4059f0:	90                   	nop
  4059f1:	90                   	nop
  4059f2:	90                   	nop
  4059f3:	90                   	nop
  4059f4:	90                   	nop
  4059f5:	90                   	nop
  4059f6:	90                   	nop
  4059f7:	90                   	nop
  4059f8:	90                   	nop
  4059f9:	90                   	nop
  4059fa:	90                   	nop
  4059fb:	90                   	nop
  4059fc:	90                   	nop
  4059fd:	90                   	nop
  4059fe:	90                   	nop
  4059ff:	90                   	nop
  405a00:	90                   	nop
  405a01:	90                   	nop
  405a02:	90                   	nop
  405a03:	90                   	nop
  405a04:	90                   	nop
  405a05:	90                   	nop
  405a06:	90                   	nop
  405a07:	90                   	nop
  405a08:	90                   	nop
  405a09:	90                   	nop
  405a0a:	90                   	nop
  405a0b:	90                   	nop
  405a0c:	90                   	nop
  405a0d:	90                   	nop
  405a0e:	90                   	nop
  405a0f:	90                   	nop
  405a10:	90                   	nop
  405a11:	90                   	nop
  405a12:	90                   	nop
  405a13:	90                   	nop
  405a14:	90                   	nop
  405a15:	90                   	nop
  405a16:	90                   	nop
  405a17:	90                   	nop
  405a18:	90                   	nop
  405a19:	90                   	nop
  405a1a:	90                   	nop
  405a1b:	90                   	nop
  405a1c:	90                   	nop
  405a1d:	90                   	nop
  405a1e:	90                   	nop
  405a1f:	90                   	nop
  405a20:	90                   	nop
  405a21:	90                   	nop
  405a22:	90                   	nop
  405a23:	90                   	nop
  405a24:	90                   	nop
  405a25:	90                   	nop
  405a26:	90                   	nop
  405a27:	90                   	nop
  405a28:	90                   	nop
  405a29:	90                   	nop
  405a2a:	90                   	nop
  405a2b:	90                   	nop
  405a2c:	90                   	nop
  405a2d:	90                   	nop
  405a2e:	90                   	nop
  405a2f:	90                   	nop
  405a30:	90                   	nop
  405a31:	90                   	nop
  405a32:	90                   	nop
  405a33:	90                   	nop
  405a34:	90                   	nop
  405a35:	90                   	nop
  405a36:	90                   	nop
  405a37:	90                   	nop
  405a38:	90                   	nop
  405a39:	90                   	nop
  405a3a:	90                   	nop
  405a3b:	90                   	nop
  405a3c:	90                   	nop
  405a3d:	90                   	nop
  405a3e:	90                   	nop
  405a3f:	90                   	nop
  405a40:	90                   	nop
  405a41:	90                   	nop
  405a42:	90                   	nop
  405a43:	90                   	nop
  405a44:	90                   	nop
  405a45:	90                   	nop
  405a46:	90                   	nop
  405a47:	90                   	nop
  405a48:	90                   	nop
  405a49:	90                   	nop
  405a4a:	90                   	nop
  405a4b:	90                   	nop
  405a4c:	90                   	nop
  405a4d:	90                   	nop
  405a4e:	90                   	nop
  405a4f:	90                   	nop
  405a50:	90                   	nop
  405a51:	90                   	nop
  405a52:	90                   	nop
  405a53:	90                   	nop
  405a54:	90                   	nop
  405a55:	90                   	nop
  405a56:	90                   	nop
  405a57:	90                   	nop
  405a58:	90                   	nop
  405a59:	90                   	nop
  405a5a:	90                   	nop
  405a5b:	90                   	nop
  405a5c:	90                   	nop
  405a5d:	90                   	nop
  405a5e:	90                   	nop
  405a5f:	90                   	nop
  405a60:	90                   	nop
  405a61:	90                   	nop
  405a62:	90                   	nop
  405a63:	90                   	nop
  405a64:	90                   	nop
  405a65:	90                   	nop
  405a66:	90                   	nop
  405a67:	90                   	nop
  405a68:	90                   	nop
  405a69:	90                   	nop
  405a6a:	90                   	nop
  405a6b:	90                   	nop
  405a6c:	90                   	nop
  405a6d:	90                   	nop
  405a6e:	90                   	nop
  405a6f:	90                   	nop
  405a70:	90                   	nop
  405a71:	90                   	nop
  405a72:	90                   	nop
  405a73:	90                   	nop
  405a74:	90                   	nop
  405a75:	90                   	nop
  405a76:	90                   	nop
  405a77:	90                   	nop
  405a78:	90                   	nop
  405a79:	90                   	nop
  405a7a:	90                   	nop
  405a7b:	90                   	nop
  405a7c:	90                   	nop
  405a7d:	90                   	nop
  405a7e:	90                   	nop
  405a7f:	90                   	nop
  405a80:	90                   	nop
  405a81:	90                   	nop
  405a82:	90                   	nop
  405a83:	90                   	nop
  405a84:	90                   	nop
  405a85:	90                   	nop
  405a86:	90                   	nop
  405a87:	90                   	nop
  405a88:	90                   	nop
  405a89:	90                   	nop
  405a8a:	90                   	nop
  405a8b:	90                   	nop
  405a8c:	90                   	nop
  405a8d:	90                   	nop
  405a8e:	90                   	nop
  405a8f:	90                   	nop
  405a90:	90                   	nop
  405a91:	90                   	nop
  405a92:	90                   	nop
  405a93:	90                   	nop
  405a94:	90                   	nop
  405a95:	90                   	nop
  405a96:	90                   	nop
  405a97:	90                   	nop
  405a98:	90                   	nop
  405a99:	90                   	nop
  405a9a:	90                   	nop
  405a9b:	90                   	nop
  405a9c:	90                   	nop
  405a9d:	90                   	nop
  405a9e:	90                   	nop
  405a9f:	90                   	nop
  405aa0:	90                   	nop
  405aa1:	90                   	nop
  405aa2:	90                   	nop
  405aa3:	90                   	nop
  405aa4:	90                   	nop
  405aa5:	90                   	nop
  405aa6:	90                   	nop
  405aa7:	90                   	nop
  405aa8:	90                   	nop
  405aa9:	90                   	nop
  405aaa:	90                   	nop
  405aab:	90                   	nop
  405aac:	90                   	nop
  405aad:	90                   	nop
  405aae:	90                   	nop
  405aaf:	90                   	nop
  405ab0:	90                   	nop
  405ab1:	90                   	nop
  405ab2:	90                   	nop
  405ab3:	90                   	nop
  405ab4:	90                   	nop
  405ab5:	90                   	nop
  405ab6:	90                   	nop
  405ab7:	90                   	nop
  405ab8:	90                   	nop
  405ab9:	90                   	nop
  405aba:	90                   	nop
  405abb:	90                   	nop
  405abc:	90                   	nop
  405abd:	90                   	nop
  405abe:	90                   	nop
  405abf:	90                   	nop
  405ac0:	90                   	nop
  405ac1:	90                   	nop
  405ac2:	90                   	nop
  405ac3:	90                   	nop
  405ac4:	90                   	nop
  405ac5:	90                   	nop
  405ac6:	90                   	nop
  405ac7:	90                   	nop
  405ac8:	90                   	nop
  405ac9:	90                   	nop
  405aca:	90                   	nop
  405acb:	90                   	nop
  405acc:	90                   	nop
  405acd:	90                   	nop
  405ace:	90                   	nop
  405acf:	90                   	nop
  405ad0:	90                   	nop
  405ad1:	90                   	nop
  405ad2:	90                   	nop
  405ad3:	90                   	nop
  405ad4:	90                   	nop
  405ad5:	90                   	nop
  405ad6:	90                   	nop
  405ad7:	90                   	nop
  405ad8:	90                   	nop
  405ad9:	90                   	nop
  405ada:	90                   	nop
  405adb:	90                   	nop
  405adc:	90                   	nop
  405add:	90                   	nop
  405ade:	90                   	nop
  405adf:	90                   	nop
  405ae0:	90                   	nop
  405ae1:	90                   	nop
  405ae2:	90                   	nop
  405ae3:	90                   	nop
  405ae4:	90                   	nop
  405ae5:	90                   	nop
  405ae6:	90                   	nop
  405ae7:	90                   	nop
  405ae8:	90                   	nop
  405ae9:	90                   	nop
  405aea:	90                   	nop
  405aeb:	90                   	nop
  405aec:	90                   	nop
  405aed:	90                   	nop
  405aee:	90                   	nop
  405aef:	90                   	nop
  405af0:	90                   	nop
  405af1:	90                   	nop
  405af2:	90                   	nop
  405af3:	90                   	nop
  405af4:	90                   	nop
  405af5:	90                   	nop
  405af6:	90                   	nop
  405af7:	90                   	nop
  405af8:	90                   	nop
  405af9:	90                   	nop
  405afa:	90                   	nop
  405afb:	90                   	nop
  405afc:	90                   	nop
  405afd:	90                   	nop
  405afe:	90                   	nop
  405aff:	90                   	nop
  405b00:	90                   	nop
  405b01:	90                   	nop
  405b02:	90                   	nop
  405b03:	90                   	nop
  405b04:	90                   	nop
  405b05:	90                   	nop
  405b06:	90                   	nop
  405b07:	90                   	nop
  405b08:	90                   	nop
  405b09:	90                   	nop
  405b0a:	90                   	nop
  405b0b:	90                   	nop
  405b0c:	90                   	nop
  405b0d:	90                   	nop
  405b0e:	90                   	nop
  405b0f:	90                   	nop
  405b10:	90                   	nop
  405b11:	90                   	nop
  405b12:	90                   	nop
  405b13:	90                   	nop
  405b14:	90                   	nop
  405b15:	90                   	nop
  405b16:	90                   	nop
  405b17:	90                   	nop
  405b18:	90                   	nop
  405b19:	90                   	nop
  405b1a:	90                   	nop
  405b1b:	90                   	nop
  405b1c:	90                   	nop
  405b1d:	90                   	nop
  405b1e:	90                   	nop
  405b1f:	90                   	nop
  405b20:	90                   	nop
  405b21:	90                   	nop
  405b22:	90                   	nop
  405b23:	90                   	nop
  405b24:	90                   	nop
  405b25:	90                   	nop
  405b26:	90                   	nop
  405b27:	90                   	nop
  405b28:	90                   	nop
  405b29:	90                   	nop
  405b2a:	90                   	nop
  405b2b:	90                   	nop
  405b2c:	90                   	nop
  405b2d:	90                   	nop
  405b2e:	90                   	nop
  405b2f:	90                   	nop
  405b30:	90                   	nop
  405b31:	90                   	nop
  405b32:	90                   	nop
  405b33:	90                   	nop
  405b34:	90                   	nop
  405b35:	90                   	nop
  405b36:	90                   	nop
  405b37:	90                   	nop
  405b38:	90                   	nop
  405b39:	90                   	nop
  405b3a:	90                   	nop
  405b3b:	90                   	nop
  405b3c:	90                   	nop
  405b3d:	90                   	nop
  405b3e:	90                   	nop
  405b3f:	90                   	nop
  405b40:	90                   	nop
  405b41:	90                   	nop
  405b42:	90                   	nop
  405b43:	90                   	nop
  405b44:	90                   	nop
  405b45:	90                   	nop
  405b46:	90                   	nop
  405b47:	90                   	nop
  405b48:	90                   	nop
  405b49:	90                   	nop
  405b4a:	90                   	nop
  405b4b:	90                   	nop
  405b4c:	90                   	nop
  405b4d:	90                   	nop
  405b4e:	90                   	nop
  405b4f:	90                   	nop
  405b50:	90                   	nop
  405b51:	90                   	nop
  405b52:	90                   	nop
  405b53:	90                   	nop
  405b54:	90                   	nop
  405b55:	90                   	nop
  405b56:	90                   	nop
  405b57:	90                   	nop
  405b58:	90                   	nop
  405b59:	90                   	nop
  405b5a:	90                   	nop
  405b5b:	90                   	nop
  405b5c:	90                   	nop
  405b5d:	90                   	nop
  405b5e:	90                   	nop
  405b5f:	90                   	nop
  405b60:	90                   	nop
  405b61:	90                   	nop
  405b62:	90                   	nop
  405b63:	90                   	nop
  405b64:	90                   	nop
  405b65:	90                   	nop
  405b66:	90                   	nop
  405b67:	90                   	nop
  405b68:	90                   	nop
  405b69:	90                   	nop
  405b6a:	90                   	nop
  405b6b:	90                   	nop
  405b6c:	90                   	nop
  405b6d:	90                   	nop
  405b6e:	90                   	nop
  405b6f:	90                   	nop
  405b70:	90                   	nop
  405b71:	90                   	nop
  405b72:	90                   	nop
  405b73:	90                   	nop
  405b74:	90                   	nop
  405b75:	90                   	nop
  405b76:	90                   	nop
  405b77:	90                   	nop
  405b78:	90                   	nop
  405b79:	90                   	nop
  405b7a:	90                   	nop
  405b7b:	90                   	nop
  405b7c:	90                   	nop
  405b7d:	90                   	nop
  405b7e:	90                   	nop
  405b7f:	90                   	nop
  405b80:	90                   	nop
  405b81:	90                   	nop
  405b82:	90                   	nop
  405b83:	90                   	nop
  405b84:	90                   	nop
  405b85:	90                   	nop
  405b86:	90                   	nop
  405b87:	90                   	nop
  405b88:	90                   	nop
  405b89:	90                   	nop
  405b8a:	90                   	nop
  405b8b:	90                   	nop
  405b8c:	90                   	nop
  405b8d:	90                   	nop
  405b8e:	90                   	nop
  405b8f:	90                   	nop
  405b90:	90                   	nop
  405b91:	90                   	nop
  405b92:	90                   	nop
  405b93:	90                   	nop
  405b94:	90                   	nop
  405b95:	90                   	nop
  405b96:	90                   	nop
  405b97:	90                   	nop
  405b98:	90                   	nop
  405b99:	90                   	nop
  405b9a:	90                   	nop
  405b9b:	90                   	nop
  405b9c:	90                   	nop
  405b9d:	90                   	nop
  405b9e:	90                   	nop
  405b9f:	90                   	nop
  405ba0:	90                   	nop
  405ba1:	90                   	nop
  405ba2:	90                   	nop
  405ba3:	90                   	nop
  405ba4:	90                   	nop
  405ba5:	90                   	nop
  405ba6:	90                   	nop
  405ba7:	90                   	nop
  405ba8:	90                   	nop
  405ba9:	90                   	nop
  405baa:	90                   	nop
  405bab:	90                   	nop
  405bac:	90                   	nop
  405bad:	90                   	nop
  405bae:	90                   	nop
  405baf:	90                   	nop
  405bb0:	90                   	nop
  405bb1:	90                   	nop
  405bb2:	90                   	nop
  405bb3:	90                   	nop
  405bb4:	90                   	nop
  405bb5:	90                   	nop
  405bb6:	90                   	nop
  405bb7:	90                   	nop
  405bb8:	90                   	nop
  405bb9:	90                   	nop
  405bba:	90                   	nop
  405bbb:	90                   	nop
  405bbc:	90                   	nop
  405bbd:	90                   	nop
  405bbe:	90                   	nop
  405bbf:	90                   	nop
  405bc0:	90                   	nop
  405bc1:	90                   	nop
  405bc2:	90                   	nop
  405bc3:	90                   	nop
  405bc4:	90                   	nop
  405bc5:	90                   	nop
  405bc6:	90                   	nop
  405bc7:	90                   	nop
  405bc8:	90                   	nop
  405bc9:	90                   	nop
  405bca:	90                   	nop
  405bcb:	90                   	nop
  405bcc:	90                   	nop
  405bcd:	90                   	nop
  405bce:	90                   	nop
  405bcf:	90                   	nop
  405bd0:	90                   	nop
  405bd1:	90                   	nop
  405bd2:	90                   	nop
  405bd3:	90                   	nop
  405bd4:	90                   	nop
  405bd5:	90                   	nop
  405bd6:	90                   	nop
  405bd7:	90                   	nop
  405bd8:	90                   	nop
  405bd9:	90                   	nop
  405bda:	90                   	nop
  405bdb:	90                   	nop
  405bdc:	90                   	nop
  405bdd:	90                   	nop
  405bde:	90                   	nop
  405bdf:	90                   	nop
  405be0:	90                   	nop
  405be1:	90                   	nop
  405be2:	90                   	nop
  405be3:	90                   	nop
  405be4:	90                   	nop
  405be5:	90                   	nop
  405be6:	90                   	nop
  405be7:	90                   	nop
  405be8:	90                   	nop
  405be9:	c3                   	ret    
  405bea:	90                   	nop
  405beb:	90                   	nop
  405bec:	90                   	nop
  405bed:	90                   	nop
  405bee:	90                   	nop
  405bef:	90                   	nop
  405bf0:	90                   	nop
  405bf1:	90                   	nop
  405bf2:	90                   	nop
  405bf3:	90                   	nop
  405bf4:	90                   	nop
  405bf5:	90                   	nop
  405bf6:	90                   	nop
  405bf7:	90                   	nop
  405bf8:	90                   	nop
  405bf9:	90                   	nop
  405bfa:	90                   	nop
  405bfb:	90                   	nop
  405bfc:	90                   	nop
  405bfd:	90                   	nop
  405bfe:	90                   	nop
  405bff:	90                   	nop
  405c00:	90                   	nop
  405c01:	90                   	nop
  405c02:	90                   	nop
  405c03:	90                   	nop
  405c04:	90                   	nop
  405c05:	90                   	nop
  405c06:	90                   	nop
  405c07:	90                   	nop
  405c08:	90                   	nop
  405c09:	90                   	nop
  405c0a:	90                   	nop
  405c0b:	90                   	nop
  405c0c:	90                   	nop
  405c0d:	90                   	nop
  405c0e:	90                   	nop
  405c0f:	90                   	nop
  405c10:	90                   	nop
  405c11:	90                   	nop
  405c12:	90                   	nop
  405c13:	90                   	nop
  405c14:	90                   	nop
  405c15:	90                   	nop
  405c16:	90                   	nop
  405c17:	90                   	nop
  405c18:	90                   	nop
  405c19:	90                   	nop
  405c1a:	90                   	nop
  405c1b:	90                   	nop
  405c1c:	90                   	nop
  405c1d:	90                   	nop
  405c1e:	90                   	nop
  405c1f:	90                   	nop
  405c20:	90                   	nop
  405c21:	90                   	nop
  405c22:	90                   	nop
  405c23:	90                   	nop
  405c24:	90                   	nop
  405c25:	90                   	nop
  405c26:	90                   	nop
  405c27:	90                   	nop
  405c28:	90                   	nop
  405c29:	90                   	nop
  405c2a:	90                   	nop
  405c2b:	90                   	nop
  405c2c:	90                   	nop
  405c2d:	90                   	nop
  405c2e:	90                   	nop
  405c2f:	90                   	nop
  405c30:	90                   	nop
  405c31:	90                   	nop
  405c32:	90                   	nop
  405c33:	90                   	nop
  405c34:	90                   	nop
  405c35:	90                   	nop
  405c36:	90                   	nop
  405c37:	90                   	nop
  405c38:	90                   	nop
  405c39:	90                   	nop
  405c3a:	90                   	nop
  405c3b:	90                   	nop
  405c3c:	90                   	nop
  405c3d:	90                   	nop
  405c3e:	90                   	nop
  405c3f:	90                   	nop
  405c40:	90                   	nop
  405c41:	90                   	nop
  405c42:	90                   	nop
  405c43:	90                   	nop
  405c44:	90                   	nop
  405c45:	90                   	nop
  405c46:	90                   	nop
  405c47:	90                   	nop
  405c48:	90                   	nop
  405c49:	90                   	nop
  405c4a:	90                   	nop
  405c4b:	90                   	nop
  405c4c:	90                   	nop
  405c4d:	90                   	nop
  405c4e:	90                   	nop
  405c4f:	90                   	nop
  405c50:	90                   	nop
  405c51:	90                   	nop
  405c52:	90                   	nop
  405c53:	90                   	nop
  405c54:	90                   	nop
  405c55:	90                   	nop
  405c56:	90                   	nop
  405c57:	90                   	nop
  405c58:	90                   	nop
  405c59:	90                   	nop
  405c5a:	90                   	nop
  405c5b:	90                   	nop
  405c5c:	90                   	nop
  405c5d:	90                   	nop
  405c5e:	90                   	nop
  405c5f:	90                   	nop
  405c60:	90                   	nop
  405c61:	90                   	nop
  405c62:	90                   	nop
  405c63:	90                   	nop
  405c64:	90                   	nop
  405c65:	90                   	nop
  405c66:	90                   	nop
  405c67:	90                   	nop
  405c68:	90                   	nop
  405c69:	90                   	nop
  405c6a:	90                   	nop
  405c6b:	90                   	nop
  405c6c:	90                   	nop
  405c6d:	90                   	nop
  405c6e:	90                   	nop
  405c6f:	90                   	nop
  405c70:	90                   	nop
  405c71:	90                   	nop
  405c72:	90                   	nop
  405c73:	90                   	nop
  405c74:	90                   	nop
  405c75:	90                   	nop
  405c76:	90                   	nop
  405c77:	90                   	nop
  405c78:	90                   	nop
  405c79:	90                   	nop
  405c7a:	90                   	nop
  405c7b:	90                   	nop
  405c7c:	90                   	nop
  405c7d:	90                   	nop
  405c7e:	90                   	nop
  405c7f:	90                   	nop
  405c80:	90                   	nop
  405c81:	90                   	nop
  405c82:	90                   	nop
  405c83:	90                   	nop
  405c84:	90                   	nop
  405c85:	90                   	nop
  405c86:	90                   	nop
  405c87:	90                   	nop
  405c88:	90                   	nop
  405c89:	90                   	nop
  405c8a:	90                   	nop
  405c8b:	90                   	nop
  405c8c:	90                   	nop
  405c8d:	90                   	nop
  405c8e:	90                   	nop
  405c8f:	90                   	nop
  405c90:	90                   	nop
  405c91:	90                   	nop
  405c92:	90                   	nop
  405c93:	90                   	nop
  405c94:	90                   	nop
  405c95:	90                   	nop
  405c96:	90                   	nop
  405c97:	90                   	nop
  405c98:	90                   	nop
  405c99:	90                   	nop
  405c9a:	90                   	nop
  405c9b:	90                   	nop
  405c9c:	90                   	nop
  405c9d:	90                   	nop
  405c9e:	90                   	nop
  405c9f:	90                   	nop
  405ca0:	90                   	nop
  405ca1:	90                   	nop
  405ca2:	90                   	nop
  405ca3:	90                   	nop
  405ca4:	90                   	nop
  405ca5:	90                   	nop
  405ca6:	90                   	nop
  405ca7:	90                   	nop
  405ca8:	90                   	nop
  405ca9:	90                   	nop
  405caa:	90                   	nop
  405cab:	90                   	nop
  405cac:	90                   	nop
  405cad:	90                   	nop
  405cae:	90                   	nop
  405caf:	90                   	nop
  405cb0:	90                   	nop
  405cb1:	90                   	nop
  405cb2:	90                   	nop
  405cb3:	90                   	nop
  405cb4:	90                   	nop
  405cb5:	90                   	nop
  405cb6:	90                   	nop
  405cb7:	90                   	nop
  405cb8:	90                   	nop
  405cb9:	90                   	nop
  405cba:	90                   	nop
  405cbb:	90                   	nop
  405cbc:	90                   	nop
  405cbd:	90                   	nop
  405cbe:	90                   	nop
  405cbf:	90                   	nop
  405cc0:	90                   	nop
  405cc1:	90                   	nop
  405cc2:	90                   	nop
  405cc3:	90                   	nop
  405cc4:	90                   	nop
  405cc5:	90                   	nop
  405cc6:	90                   	nop
  405cc7:	90                   	nop
  405cc8:	90                   	nop
  405cc9:	90                   	nop
  405cca:	90                   	nop
  405ccb:	90                   	nop
  405ccc:	90                   	nop
  405ccd:	90                   	nop
  405cce:	90                   	nop
  405ccf:	90                   	nop
  405cd0:	90                   	nop
  405cd1:	90                   	nop
  405cd2:	90                   	nop
  405cd3:	90                   	nop
  405cd4:	90                   	nop
  405cd5:	90                   	nop
  405cd6:	90                   	nop
  405cd7:	90                   	nop
  405cd8:	90                   	nop
  405cd9:	90                   	nop
  405cda:	90                   	nop
  405cdb:	90                   	nop
  405cdc:	90                   	nop
  405cdd:	90                   	nop
  405cde:	90                   	nop
  405cdf:	90                   	nop
  405ce0:	90                   	nop
  405ce1:	90                   	nop
  405ce2:	90                   	nop
  405ce3:	90                   	nop
  405ce4:	90                   	nop
  405ce5:	90                   	nop
  405ce6:	90                   	nop
  405ce7:	90                   	nop
  405ce8:	90                   	nop
  405ce9:	90                   	nop
  405cea:	90                   	nop
  405ceb:	90                   	nop
  405cec:	90                   	nop
  405ced:	90                   	nop
  405cee:	90                   	nop
  405cef:	90                   	nop
  405cf0:	90                   	nop
  405cf1:	90                   	nop
  405cf2:	90                   	nop
  405cf3:	90                   	nop
  405cf4:	90                   	nop
  405cf5:	90                   	nop
  405cf6:	90                   	nop
  405cf7:	90                   	nop
  405cf8:	90                   	nop
  405cf9:	90                   	nop
  405cfa:	90                   	nop
  405cfb:	90                   	nop
  405cfc:	90                   	nop
  405cfd:	90                   	nop
  405cfe:	90                   	nop
  405cff:	90                   	nop
  405d00:	90                   	nop
  405d01:	90                   	nop
  405d02:	90                   	nop
  405d03:	90                   	nop
  405d04:	90                   	nop
  405d05:	90                   	nop
  405d06:	90                   	nop
  405d07:	90                   	nop
  405d08:	90                   	nop
  405d09:	90                   	nop
  405d0a:	90                   	nop
  405d0b:	90                   	nop
  405d0c:	90                   	nop
  405d0d:	90                   	nop
  405d0e:	90                   	nop
  405d0f:	90                   	nop
  405d10:	90                   	nop
  405d11:	90                   	nop
  405d12:	90                   	nop
  405d13:	90                   	nop
  405d14:	90                   	nop
  405d15:	90                   	nop
  405d16:	90                   	nop
  405d17:	90                   	nop
  405d18:	90                   	nop
  405d19:	90                   	nop
  405d1a:	90                   	nop
  405d1b:	90                   	nop
  405d1c:	90                   	nop
  405d1d:	90                   	nop
  405d1e:	90                   	nop
  405d1f:	90                   	nop
  405d20:	90                   	nop
  405d21:	90                   	nop
  405d22:	90                   	nop
  405d23:	90                   	nop
  405d24:	90                   	nop
  405d25:	90                   	nop
  405d26:	90                   	nop
  405d27:	90                   	nop
  405d28:	90                   	nop
  405d29:	90                   	nop
  405d2a:	90                   	nop
  405d2b:	90                   	nop
  405d2c:	90                   	nop
  405d2d:	90                   	nop
  405d2e:	90                   	nop
  405d2f:	90                   	nop
  405d30:	90                   	nop
  405d31:	90                   	nop
  405d32:	90                   	nop
  405d33:	90                   	nop
  405d34:	90                   	nop
  405d35:	90                   	nop
  405d36:	90                   	nop
  405d37:	90                   	nop
  405d38:	90                   	nop
  405d39:	90                   	nop
  405d3a:	90                   	nop
  405d3b:	90                   	nop
  405d3c:	90                   	nop
  405d3d:	90                   	nop
  405d3e:	90                   	nop
  405d3f:	90                   	nop
  405d40:	90                   	nop
  405d41:	90                   	nop
  405d42:	90                   	nop
  405d43:	90                   	nop
  405d44:	90                   	nop
  405d45:	90                   	nop
  405d46:	90                   	nop
  405d47:	90                   	nop
  405d48:	90                   	nop
  405d49:	90                   	nop
  405d4a:	90                   	nop
  405d4b:	90                   	nop
  405d4c:	90                   	nop
  405d4d:	90                   	nop
  405d4e:	90                   	nop
  405d4f:	90                   	nop
  405d50:	90                   	nop
  405d51:	90                   	nop
  405d52:	90                   	nop
  405d53:	90                   	nop
  405d54:	90                   	nop
  405d55:	90                   	nop
  405d56:	90                   	nop
  405d57:	90                   	nop
  405d58:	90                   	nop
  405d59:	90                   	nop
  405d5a:	90                   	nop
  405d5b:	90                   	nop
  405d5c:	90                   	nop
  405d5d:	90                   	nop
  405d5e:	90                   	nop
  405d5f:	90                   	nop
  405d60:	90                   	nop
  405d61:	90                   	nop
  405d62:	90                   	nop
  405d63:	90                   	nop
  405d64:	90                   	nop
  405d65:	90                   	nop
  405d66:	90                   	nop
  405d67:	90                   	nop
  405d68:	90                   	nop
  405d69:	90                   	nop
  405d6a:	90                   	nop
  405d6b:	90                   	nop
  405d6c:	90                   	nop
  405d6d:	90                   	nop
  405d6e:	90                   	nop
  405d6f:	90                   	nop
  405d70:	90                   	nop
  405d71:	90                   	nop
  405d72:	90                   	nop
  405d73:	90                   	nop
  405d74:	90                   	nop
  405d75:	90                   	nop
  405d76:	90                   	nop
  405d77:	90                   	nop
  405d78:	90                   	nop
  405d79:	90                   	nop
  405d7a:	90                   	nop
  405d7b:	90                   	nop
  405d7c:	90                   	nop
  405d7d:	90                   	nop
  405d7e:	90                   	nop
  405d7f:	90                   	nop
  405d80:	90                   	nop
  405d81:	90                   	nop
  405d82:	90                   	nop
  405d83:	90                   	nop
  405d84:	90                   	nop
  405d85:	90                   	nop
  405d86:	90                   	nop
  405d87:	90                   	nop
  405d88:	90                   	nop
  405d89:	90                   	nop
  405d8a:	90                   	nop
  405d8b:	90                   	nop
  405d8c:	90                   	nop
  405d8d:	90                   	nop
  405d8e:	90                   	nop
  405d8f:	90                   	nop
  405d90:	90                   	nop
  405d91:	90                   	nop
  405d92:	90                   	nop
  405d93:	90                   	nop
  405d94:	90                   	nop
  405d95:	90                   	nop
  405d96:	90                   	nop
  405d97:	90                   	nop
  405d98:	90                   	nop
  405d99:	90                   	nop
  405d9a:	90                   	nop
  405d9b:	90                   	nop
  405d9c:	90                   	nop
  405d9d:	90                   	nop
  405d9e:	90                   	nop
  405d9f:	90                   	nop
  405da0:	90                   	nop
  405da1:	90                   	nop
  405da2:	90                   	nop
  405da3:	90                   	nop
  405da4:	90                   	nop
  405da5:	90                   	nop
  405da6:	90                   	nop
  405da7:	90                   	nop
  405da8:	90                   	nop
  405da9:	90                   	nop
  405daa:	90                   	nop
  405dab:	90                   	nop
  405dac:	90                   	nop
  405dad:	90                   	nop
  405dae:	90                   	nop
  405daf:	90                   	nop
  405db0:	90                   	nop
  405db1:	90                   	nop
  405db2:	90                   	nop
  405db3:	90                   	nop
  405db4:	90                   	nop
  405db5:	90                   	nop
  405db6:	90                   	nop
  405db7:	90                   	nop
  405db8:	90                   	nop
  405db9:	90                   	nop
  405dba:	90                   	nop
  405dbb:	90                   	nop
  405dbc:	90                   	nop
  405dbd:	90                   	nop
  405dbe:	90                   	nop
  405dbf:	90                   	nop
  405dc0:	90                   	nop
  405dc1:	90                   	nop
  405dc2:	90                   	nop
  405dc3:	90                   	nop
  405dc4:	90                   	nop
  405dc5:	90                   	nop
  405dc6:	90                   	nop
  405dc7:	90                   	nop
  405dc8:	90                   	nop
  405dc9:	90                   	nop
  405dca:	90                   	nop
  405dcb:	90                   	nop
  405dcc:	90                   	nop
  405dcd:	90                   	nop
  405dce:	90                   	nop
  405dcf:	90                   	nop
  405dd0:	90                   	nop
  405dd1:	90                   	nop
  405dd2:	90                   	nop
  405dd3:	90                   	nop
  405dd4:	90                   	nop
  405dd5:	90                   	nop
  405dd6:	90                   	nop
  405dd7:	90                   	nop
  405dd8:	90                   	nop
  405dd9:	90                   	nop
  405dda:	90                   	nop
  405ddb:	90                   	nop
  405ddc:	90                   	nop
  405ddd:	90                   	nop
  405dde:	90                   	nop
  405ddf:	90                   	nop
  405de0:	90                   	nop
  405de1:	90                   	nop
  405de2:	90                   	nop
  405de3:	90                   	nop
  405de4:	90                   	nop
  405de5:	90                   	nop
  405de6:	90                   	nop
  405de7:	90                   	nop
  405de8:	90                   	nop
  405de9:	90                   	nop

Disassembly of section .sec_collision:

0000000000405dea <start_collision>:
  405dea:	4c 8d 15 f1 f7 ff ff 	lea    -0x80f(%rip),%r10        # 4055e2 <start_gadget_0>
  405df1:	4c 89 15 08 a1 00 00 	mov    %r10,0xa108(%rip)        # 40ff00 <UserData+0x40>
  405df8:	0f ae f0             	mfence 
  405dfb:	31 c0                	xor    %eax,%eax
  405dfd:	0f a2                	cpuid  
  405dff:	90                   	nop
  405e00:	90                   	nop
  405e01:	90                   	nop
  405e02:	90                   	nop
  405e03:	90                   	nop
  405e04:	90                   	nop
  405e05:	90                   	nop
  405e06:	90                   	nop
  405e07:	90                   	nop
  405e08:	90                   	nop
  405e09:	90                   	nop

0000000000405e0a <collision_ibranch_pc>:
  405e0a:	ff 25 f0 a0 00 00    	jmp    *0xa0f0(%rip)        # 40ff00 <UserData+0x40>
  405e10:	90                   	nop
  405e11:	90                   	nop
  405e12:	90                   	nop
  405e13:	90                   	nop
  405e14:	90                   	nop
  405e15:	90                   	nop
  405e16:	90                   	nop
  405e17:	90                   	nop
  405e18:	90                   	nop
  405e19:	90                   	nop
  405e1a:	90                   	nop
  405e1b:	90                   	nop
  405e1c:	90                   	nop
  405e1d:	90                   	nop
  405e1e:	90                   	nop
  405e1f:	90                   	nop
  405e20:	90                   	nop
  405e21:	90                   	nop
  405e22:	90                   	nop
  405e23:	90                   	nop
  405e24:	90                   	nop
  405e25:	90                   	nop
  405e26:	90                   	nop
  405e27:	90                   	nop
  405e28:	90                   	nop
  405e29:	90                   	nop
  405e2a:	90                   	nop
  405e2b:	90                   	nop
  405e2c:	90                   	nop
  405e2d:	90                   	nop
  405e2e:	90                   	nop
  405e2f:	90                   	nop
  405e30:	90                   	nop
  405e31:	90                   	nop
  405e32:	90                   	nop
  405e33:	90                   	nop
  405e34:	90                   	nop
  405e35:	90                   	nop
  405e36:	90                   	nop
  405e37:	90                   	nop
  405e38:	90                   	nop
  405e39:	90                   	nop
  405e3a:	90                   	nop
  405e3b:	90                   	nop
  405e3c:	90                   	nop
  405e3d:	90                   	nop
  405e3e:	90                   	nop
  405e3f:	90                   	nop
  405e40:	90                   	nop
  405e41:	90                   	nop
  405e42:	90                   	nop
  405e43:	90                   	nop
  405e44:	90                   	nop
  405e45:	90                   	nop
  405e46:	90                   	nop
  405e47:	90                   	nop
  405e48:	90                   	nop
  405e49:	90                   	nop
  405e4a:	90                   	nop
  405e4b:	90                   	nop
  405e4c:	90                   	nop
  405e4d:	90                   	nop
  405e4e:	90                   	nop
  405e4f:	90                   	nop
  405e50:	90                   	nop
  405e51:	90                   	nop
  405e52:	90                   	nop
  405e53:	90                   	nop
  405e54:	90                   	nop
  405e55:	90                   	nop
  405e56:	90                   	nop
  405e57:	90                   	nop
  405e58:	90                   	nop
  405e59:	90                   	nop
  405e5a:	90                   	nop
  405e5b:	90                   	nop
  405e5c:	90                   	nop
  405e5d:	90                   	nop
  405e5e:	90                   	nop
  405e5f:	90                   	nop
  405e60:	90                   	nop
  405e61:	90                   	nop
  405e62:	90                   	nop
  405e63:	90                   	nop
  405e64:	90                   	nop
  405e65:	90                   	nop
  405e66:	90                   	nop
  405e67:	90                   	nop
  405e68:	90                   	nop
  405e69:	90                   	nop
  405e6a:	90                   	nop
  405e6b:	90                   	nop
  405e6c:	90                   	nop
  405e6d:	90                   	nop
  405e6e:	90                   	nop
  405e6f:	90                   	nop
  405e70:	90                   	nop
  405e71:	90                   	nop
  405e72:	90                   	nop
  405e73:	90                   	nop
  405e74:	90                   	nop
  405e75:	90                   	nop
  405e76:	90                   	nop
  405e77:	90                   	nop
  405e78:	90                   	nop
  405e79:	90                   	nop
  405e7a:	90                   	nop
  405e7b:	90                   	nop
  405e7c:	90                   	nop
  405e7d:	90                   	nop
  405e7e:	90                   	nop
  405e7f:	90                   	nop
  405e80:	90                   	nop
  405e81:	90                   	nop
  405e82:	90                   	nop
  405e83:	90                   	nop
  405e84:	90                   	nop
  405e85:	90                   	nop
  405e86:	90                   	nop
  405e87:	90                   	nop
  405e88:	90                   	nop
  405e89:	90                   	nop
  405e8a:	90                   	nop
  405e8b:	90                   	nop
  405e8c:	90                   	nop
  405e8d:	90                   	nop
  405e8e:	90                   	nop
  405e8f:	90                   	nop
  405e90:	90                   	nop
  405e91:	90                   	nop
  405e92:	90                   	nop
  405e93:	90                   	nop
  405e94:	90                   	nop
  405e95:	90                   	nop
  405e96:	90                   	nop
  405e97:	90                   	nop
  405e98:	90                   	nop
  405e99:	90                   	nop
  405e9a:	90                   	nop
  405e9b:	90                   	nop
  405e9c:	90                   	nop
  405e9d:	90                   	nop
  405e9e:	90                   	nop
  405e9f:	90                   	nop
  405ea0:	90                   	nop
  405ea1:	90                   	nop
  405ea2:	90                   	nop
  405ea3:	90                   	nop
  405ea4:	90                   	nop
  405ea5:	90                   	nop
  405ea6:	90                   	nop
  405ea7:	90                   	nop
  405ea8:	90                   	nop
  405ea9:	90                   	nop
  405eaa:	90                   	nop
  405eab:	90                   	nop
  405eac:	90                   	nop
  405ead:	90                   	nop
  405eae:	90                   	nop
  405eaf:	90                   	nop
  405eb0:	90                   	nop
  405eb1:	90                   	nop
  405eb2:	90                   	nop
  405eb3:	90                   	nop
  405eb4:	90                   	nop
  405eb5:	90                   	nop
  405eb6:	90                   	nop
  405eb7:	90                   	nop
  405eb8:	90                   	nop
  405eb9:	90                   	nop
  405eba:	90                   	nop
  405ebb:	90                   	nop
  405ebc:	90                   	nop
  405ebd:	90                   	nop
  405ebe:	90                   	nop
  405ebf:	90                   	nop
  405ec0:	90                   	nop
  405ec1:	90                   	nop
  405ec2:	90                   	nop
  405ec3:	90                   	nop
  405ec4:	90                   	nop
  405ec5:	90                   	nop
  405ec6:	90                   	nop
  405ec7:	90                   	nop
  405ec8:	90                   	nop
  405ec9:	90                   	nop
  405eca:	90                   	nop
  405ecb:	90                   	nop
  405ecc:	90                   	nop
  405ecd:	90                   	nop
  405ece:	90                   	nop
  405ecf:	90                   	nop
  405ed0:	90                   	nop
  405ed1:	90                   	nop
  405ed2:	90                   	nop
  405ed3:	90                   	nop
  405ed4:	90                   	nop
  405ed5:	90                   	nop
  405ed6:	90                   	nop
  405ed7:	90                   	nop
  405ed8:	90                   	nop
  405ed9:	90                   	nop
  405eda:	90                   	nop
  405edb:	90                   	nop
  405edc:	90                   	nop
  405edd:	90                   	nop
  405ede:	90                   	nop
  405edf:	90                   	nop
  405ee0:	90                   	nop
  405ee1:	90                   	nop
  405ee2:	90                   	nop
  405ee3:	90                   	nop
  405ee4:	90                   	nop
  405ee5:	90                   	nop
  405ee6:	90                   	nop
  405ee7:	90                   	nop
  405ee8:	90                   	nop
  405ee9:	90                   	nop
  405eea:	90                   	nop
  405eeb:	90                   	nop
  405eec:	90                   	nop
  405eed:	90                   	nop
  405eee:	90                   	nop
  405eef:	90                   	nop
  405ef0:	90                   	nop
  405ef1:	90                   	nop
  405ef2:	90                   	nop
  405ef3:	90                   	nop
  405ef4:	90                   	nop
  405ef5:	90                   	nop
  405ef6:	90                   	nop
  405ef7:	90                   	nop
  405ef8:	90                   	nop
  405ef9:	90                   	nop
  405efa:	90                   	nop
  405efb:	90                   	nop
  405efc:	90                   	nop
  405efd:	90                   	nop
  405efe:	90                   	nop
  405eff:	90                   	nop
  405f00:	90                   	nop
  405f01:	90                   	nop
  405f02:	90                   	nop
  405f03:	90                   	nop
  405f04:	90                   	nop
  405f05:	90                   	nop
  405f06:	90                   	nop
  405f07:	90                   	nop
  405f08:	90                   	nop
  405f09:	90                   	nop
  405f0a:	90                   	nop
  405f0b:	90                   	nop
  405f0c:	90                   	nop
  405f0d:	90                   	nop
  405f0e:	90                   	nop
  405f0f:	90                   	nop
  405f10:	90                   	nop
  405f11:	90                   	nop
  405f12:	90                   	nop
  405f13:	90                   	nop
  405f14:	90                   	nop
  405f15:	90                   	nop
  405f16:	90                   	nop
  405f17:	90                   	nop
  405f18:	90                   	nop
  405f19:	90                   	nop
  405f1a:	90                   	nop
  405f1b:	90                   	nop
  405f1c:	90                   	nop
  405f1d:	90                   	nop
  405f1e:	90                   	nop
  405f1f:	90                   	nop
  405f20:	90                   	nop
  405f21:	90                   	nop
  405f22:	90                   	nop
  405f23:	90                   	nop
  405f24:	90                   	nop
  405f25:	90                   	nop
  405f26:	90                   	nop
  405f27:	90                   	nop
  405f28:	90                   	nop
  405f29:	90                   	nop
  405f2a:	90                   	nop
  405f2b:	90                   	nop
  405f2c:	90                   	nop
  405f2d:	90                   	nop
  405f2e:	90                   	nop
  405f2f:	90                   	nop
  405f30:	90                   	nop
  405f31:	90                   	nop
  405f32:	90                   	nop
  405f33:	90                   	nop
  405f34:	90                   	nop
  405f35:	90                   	nop
  405f36:	90                   	nop
  405f37:	90                   	nop
  405f38:	90                   	nop
  405f39:	90                   	nop
  405f3a:	90                   	nop
  405f3b:	90                   	nop
  405f3c:	90                   	nop
  405f3d:	90                   	nop
  405f3e:	90                   	nop
  405f3f:	90                   	nop
  405f40:	90                   	nop
  405f41:	90                   	nop
  405f42:	90                   	nop
  405f43:	90                   	nop
  405f44:	90                   	nop
  405f45:	90                   	nop
  405f46:	90                   	nop
  405f47:	90                   	nop
  405f48:	90                   	nop
  405f49:	90                   	nop
  405f4a:	90                   	nop
  405f4b:	90                   	nop
  405f4c:	90                   	nop
  405f4d:	90                   	nop
  405f4e:	90                   	nop
  405f4f:	90                   	nop
  405f50:	90                   	nop
  405f51:	90                   	nop
  405f52:	90                   	nop
  405f53:	90                   	nop
  405f54:	90                   	nop
  405f55:	90                   	nop
  405f56:	90                   	nop
  405f57:	90                   	nop
  405f58:	90                   	nop
  405f59:	90                   	nop
  405f5a:	90                   	nop
  405f5b:	90                   	nop
  405f5c:	90                   	nop
  405f5d:	90                   	nop
  405f5e:	90                   	nop
  405f5f:	90                   	nop
  405f60:	90                   	nop
  405f61:	90                   	nop
  405f62:	90                   	nop
  405f63:	90                   	nop
  405f64:	90                   	nop
  405f65:	90                   	nop
  405f66:	90                   	nop
  405f67:	90                   	nop
  405f68:	90                   	nop
  405f69:	90                   	nop
  405f6a:	90                   	nop
  405f6b:	90                   	nop
  405f6c:	90                   	nop
  405f6d:	90                   	nop
  405f6e:	90                   	nop
  405f6f:	90                   	nop
  405f70:	90                   	nop
  405f71:	90                   	nop
  405f72:	90                   	nop
  405f73:	90                   	nop
  405f74:	90                   	nop
  405f75:	90                   	nop
  405f76:	90                   	nop
  405f77:	90                   	nop
  405f78:	90                   	nop
  405f79:	90                   	nop
  405f7a:	90                   	nop
  405f7b:	90                   	nop
  405f7c:	90                   	nop
  405f7d:	90                   	nop
  405f7e:	90                   	nop
  405f7f:	90                   	nop
  405f80:	90                   	nop
  405f81:	90                   	nop
  405f82:	90                   	nop
  405f83:	90                   	nop
  405f84:	90                   	nop
  405f85:	90                   	nop
  405f86:	90                   	nop
  405f87:	90                   	nop
  405f88:	90                   	nop
  405f89:	90                   	nop
  405f8a:	90                   	nop
  405f8b:	90                   	nop
  405f8c:	90                   	nop
  405f8d:	90                   	nop
  405f8e:	90                   	nop
  405f8f:	90                   	nop
  405f90:	90                   	nop
  405f91:	90                   	nop
  405f92:	90                   	nop
  405f93:	90                   	nop
  405f94:	90                   	nop
  405f95:	90                   	nop
  405f96:	90                   	nop
  405f97:	90                   	nop
  405f98:	90                   	nop
  405f99:	90                   	nop
  405f9a:	90                   	nop
  405f9b:	90                   	nop
  405f9c:	90                   	nop
  405f9d:	90                   	nop
  405f9e:	90                   	nop
  405f9f:	90                   	nop
  405fa0:	90                   	nop
  405fa1:	90                   	nop
  405fa2:	90                   	nop
  405fa3:	90                   	nop
  405fa4:	90                   	nop
  405fa5:	90                   	nop
  405fa6:	90                   	nop
  405fa7:	90                   	nop
  405fa8:	90                   	nop
  405fa9:	90                   	nop
  405faa:	90                   	nop
  405fab:	90                   	nop
  405fac:	90                   	nop
  405fad:	90                   	nop
  405fae:	90                   	nop
  405faf:	90                   	nop
  405fb0:	90                   	nop
  405fb1:	90                   	nop
  405fb2:	90                   	nop
  405fb3:	90                   	nop
  405fb4:	90                   	nop
  405fb5:	90                   	nop
  405fb6:	90                   	nop
  405fb7:	90                   	nop
  405fb8:	90                   	nop
  405fb9:	90                   	nop
  405fba:	90                   	nop
  405fbb:	90                   	nop
  405fbc:	90                   	nop
  405fbd:	90                   	nop
  405fbe:	90                   	nop
  405fbf:	90                   	nop
  405fc0:	90                   	nop
  405fc1:	90                   	nop
  405fc2:	90                   	nop
  405fc3:	90                   	nop
  405fc4:	90                   	nop
  405fc5:	90                   	nop
  405fc6:	90                   	nop
  405fc7:	90                   	nop
  405fc8:	90                   	nop
  405fc9:	90                   	nop
  405fca:	90                   	nop
  405fcb:	90                   	nop
  405fcc:	90                   	nop
  405fcd:	90                   	nop
  405fce:	90                   	nop
  405fcf:	90                   	nop
  405fd0:	90                   	nop
  405fd1:	90                   	nop
  405fd2:	90                   	nop
  405fd3:	90                   	nop
  405fd4:	90                   	nop
  405fd5:	90                   	nop
  405fd6:	90                   	nop
  405fd7:	90                   	nop
  405fd8:	90                   	nop
  405fd9:	90                   	nop
  405fda:	90                   	nop
  405fdb:	90                   	nop
  405fdc:	90                   	nop
  405fdd:	90                   	nop
  405fde:	90                   	nop
  405fdf:	90                   	nop
  405fe0:	90                   	nop
  405fe1:	90                   	nop
  405fe2:	90                   	nop
  405fe3:	90                   	nop
  405fe4:	90                   	nop
  405fe5:	90                   	nop
  405fe6:	90                   	nop
  405fe7:	90                   	nop
  405fe8:	90                   	nop
  405fe9:	90                   	nop
  405fea:	90                   	nop
  405feb:	90                   	nop
  405fec:	90                   	nop
  405fed:	90                   	nop
  405fee:	90                   	nop
  405fef:	90                   	nop
  405ff0:	90                   	nop
  405ff1:	90                   	nop
  405ff2:	90                   	nop
  405ff3:	90                   	nop
  405ff4:	90                   	nop
  405ff5:	90                   	nop
  405ff6:	90                   	nop
  405ff7:	90                   	nop
  405ff8:	90                   	nop
  405ff9:	90                   	nop
  405ffa:	90                   	nop
  405ffb:	90                   	nop
  405ffc:	90                   	nop
  405ffd:	90                   	nop
  405ffe:	90                   	nop
  405fff:	90                   	nop
  406000:	90                   	nop
  406001:	90                   	nop
  406002:	90                   	nop
  406003:	90                   	nop
  406004:	90                   	nop
  406005:	90                   	nop
  406006:	90                   	nop
  406007:	90                   	nop
  406008:	90                   	nop
  406009:	90                   	nop
  40600a:	90                   	nop
  40600b:	90                   	nop
  40600c:	90                   	nop
  40600d:	90                   	nop
  40600e:	90                   	nop
  40600f:	90                   	nop

0000000000406010 <collision_ind_0>:
  406010:	90                   	nop
  406011:	90                   	nop
  406012:	90                   	nop
  406013:	90                   	nop
  406014:	90                   	nop
  406015:	90                   	nop
  406016:	90                   	nop
  406017:	90                   	nop
  406018:	90                   	nop
  406019:	90                   	nop
  40601a:	90                   	nop
  40601b:	90                   	nop
  40601c:	90                   	nop
  40601d:	90                   	nop
  40601e:	90                   	nop
  40601f:	90                   	nop
  406020:	90                   	nop
  406021:	90                   	nop
  406022:	90                   	nop
  406023:	90                   	nop
  406024:	90                   	nop
  406025:	90                   	nop
  406026:	90                   	nop
  406027:	90                   	nop
  406028:	90                   	nop
  406029:	90                   	nop
  40602a:	90                   	nop
  40602b:	90                   	nop
  40602c:	90                   	nop
  40602d:	90                   	nop
  40602e:	90                   	nop
  40602f:	90                   	nop
  406030:	90                   	nop
  406031:	90                   	nop
  406032:	90                   	nop
  406033:	90                   	nop
  406034:	90                   	nop
  406035:	90                   	nop
  406036:	90                   	nop
  406037:	90                   	nop
  406038:	90                   	nop
  406039:	90                   	nop
  40603a:	90                   	nop
  40603b:	90                   	nop
  40603c:	90                   	nop
  40603d:	90                   	nop
  40603e:	90                   	nop
  40603f:	90                   	nop
  406040:	90                   	nop
  406041:	90                   	nop
  406042:	90                   	nop
  406043:	90                   	nop
  406044:	90                   	nop
  406045:	90                   	nop
  406046:	90                   	nop
  406047:	90                   	nop
  406048:	90                   	nop
  406049:	90                   	nop
  40604a:	90                   	nop
  40604b:	90                   	nop
  40604c:	90                   	nop
  40604d:	90                   	nop
  40604e:	90                   	nop
  40604f:	90                   	nop
  406050:	90                   	nop
  406051:	90                   	nop
  406052:	90                   	nop
  406053:	90                   	nop
  406054:	90                   	nop
  406055:	90                   	nop
  406056:	90                   	nop
  406057:	90                   	nop
  406058:	90                   	nop
  406059:	90                   	nop
  40605a:	90                   	nop
  40605b:	90                   	nop
  40605c:	90                   	nop
  40605d:	90                   	nop
  40605e:	90                   	nop
  40605f:	90                   	nop
  406060:	90                   	nop
  406061:	90                   	nop
  406062:	90                   	nop
  406063:	90                   	nop
  406064:	90                   	nop
  406065:	90                   	nop
  406066:	90                   	nop
  406067:	90                   	nop
  406068:	90                   	nop
  406069:	90                   	nop
  40606a:	90                   	nop
  40606b:	90                   	nop
  40606c:	90                   	nop
  40606d:	90                   	nop
  40606e:	90                   	nop
  40606f:	90                   	nop
  406070:	90                   	nop
  406071:	90                   	nop
  406072:	90                   	nop
  406073:	90                   	nop
  406074:	90                   	nop
  406075:	90                   	nop
  406076:	90                   	nop
  406077:	90                   	nop
  406078:	90                   	nop
  406079:	90                   	nop
  40607a:	90                   	nop
  40607b:	90                   	nop
  40607c:	90                   	nop
  40607d:	90                   	nop
  40607e:	90                   	nop
  40607f:	90                   	nop
  406080:	90                   	nop
  406081:	90                   	nop
  406082:	90                   	nop
  406083:	90                   	nop
  406084:	90                   	nop
  406085:	90                   	nop
  406086:	90                   	nop
  406087:	90                   	nop
  406088:	90                   	nop
  406089:	90                   	nop
  40608a:	90                   	nop
  40608b:	90                   	nop
  40608c:	90                   	nop
  40608d:	90                   	nop
  40608e:	90                   	nop
  40608f:	90                   	nop
  406090:	90                   	nop
  406091:	90                   	nop
  406092:	90                   	nop
  406093:	90                   	nop
  406094:	90                   	nop
  406095:	90                   	nop
  406096:	90                   	nop
  406097:	90                   	nop
  406098:	90                   	nop
  406099:	90                   	nop
  40609a:	90                   	nop
  40609b:	90                   	nop
  40609c:	90                   	nop
  40609d:	90                   	nop
  40609e:	90                   	nop
  40609f:	90                   	nop
  4060a0:	90                   	nop
  4060a1:	90                   	nop
  4060a2:	90                   	nop
  4060a3:	90                   	nop
  4060a4:	90                   	nop
  4060a5:	90                   	nop
  4060a6:	90                   	nop
  4060a7:	90                   	nop
  4060a8:	90                   	nop
  4060a9:	90                   	nop
  4060aa:	90                   	nop
  4060ab:	90                   	nop
  4060ac:	90                   	nop
  4060ad:	90                   	nop
  4060ae:	90                   	nop
  4060af:	90                   	nop
  4060b0:	90                   	nop
  4060b1:	90                   	nop
  4060b2:	90                   	nop
  4060b3:	90                   	nop
  4060b4:	90                   	nop
  4060b5:	90                   	nop
  4060b6:	90                   	nop
  4060b7:	90                   	nop
  4060b8:	90                   	nop
  4060b9:	90                   	nop
  4060ba:	90                   	nop
  4060bb:	90                   	nop
  4060bc:	90                   	nop
  4060bd:	90                   	nop
  4060be:	90                   	nop
  4060bf:	90                   	nop
  4060c0:	90                   	nop
  4060c1:	90                   	nop
  4060c2:	90                   	nop
  4060c3:	90                   	nop
  4060c4:	90                   	nop
  4060c5:	90                   	nop
  4060c6:	90                   	nop
  4060c7:	90                   	nop
  4060c8:	90                   	nop
  4060c9:	90                   	nop
  4060ca:	90                   	nop
  4060cb:	90                   	nop
  4060cc:	90                   	nop
  4060cd:	90                   	nop
  4060ce:	90                   	nop
  4060cf:	90                   	nop
  4060d0:	90                   	nop
  4060d1:	90                   	nop
  4060d2:	90                   	nop
  4060d3:	90                   	nop
  4060d4:	90                   	nop
  4060d5:	90                   	nop
  4060d6:	90                   	nop
  4060d7:	90                   	nop
  4060d8:	90                   	nop
  4060d9:	90                   	nop
  4060da:	90                   	nop
  4060db:	90                   	nop
  4060dc:	90                   	nop
  4060dd:	90                   	nop
  4060de:	90                   	nop
  4060df:	90                   	nop
  4060e0:	90                   	nop
  4060e1:	90                   	nop
  4060e2:	90                   	nop
  4060e3:	90                   	nop
  4060e4:	90                   	nop
  4060e5:	90                   	nop
  4060e6:	90                   	nop
  4060e7:	90                   	nop
  4060e8:	90                   	nop
  4060e9:	90                   	nop
  4060ea:	90                   	nop
  4060eb:	90                   	nop
  4060ec:	90                   	nop
  4060ed:	90                   	nop
  4060ee:	90                   	nop
  4060ef:	90                   	nop
  4060f0:	90                   	nop
  4060f1:	90                   	nop
  4060f2:	90                   	nop
  4060f3:	90                   	nop
  4060f4:	90                   	nop
  4060f5:	90                   	nop
  4060f6:	90                   	nop
  4060f7:	90                   	nop
  4060f8:	90                   	nop
  4060f9:	90                   	nop
  4060fa:	90                   	nop
  4060fb:	90                   	nop
  4060fc:	90                   	nop
  4060fd:	90                   	nop
  4060fe:	90                   	nop
  4060ff:	90                   	nop
  406100:	90                   	nop
  406101:	90                   	nop
  406102:	90                   	nop
  406103:	90                   	nop
  406104:	90                   	nop
  406105:	90                   	nop
  406106:	90                   	nop
  406107:	90                   	nop
  406108:	90                   	nop
  406109:	90                   	nop
  40610a:	90                   	nop
  40610b:	90                   	nop
  40610c:	90                   	nop
  40610d:	90                   	nop
  40610e:	90                   	nop
  40610f:	90                   	nop
  406110:	90                   	nop
  406111:	90                   	nop
  406112:	90                   	nop
  406113:	90                   	nop
  406114:	90                   	nop
  406115:	90                   	nop
  406116:	90                   	nop
  406117:	90                   	nop
  406118:	90                   	nop
  406119:	90                   	nop
  40611a:	90                   	nop
  40611b:	90                   	nop
  40611c:	90                   	nop
  40611d:	90                   	nop
  40611e:	90                   	nop
  40611f:	90                   	nop
  406120:	90                   	nop
  406121:	90                   	nop
  406122:	90                   	nop
  406123:	90                   	nop
  406124:	90                   	nop
  406125:	90                   	nop
  406126:	90                   	nop
  406127:	90                   	nop
  406128:	90                   	nop
  406129:	90                   	nop
  40612a:	90                   	nop
  40612b:	90                   	nop
  40612c:	90                   	nop
  40612d:	90                   	nop
  40612e:	90                   	nop
  40612f:	90                   	nop
  406130:	90                   	nop
  406131:	90                   	nop
  406132:	90                   	nop
  406133:	90                   	nop
  406134:	90                   	nop
  406135:	90                   	nop
  406136:	90                   	nop
  406137:	90                   	nop
  406138:	90                   	nop
  406139:	90                   	nop
  40613a:	90                   	nop
  40613b:	90                   	nop
  40613c:	90                   	nop
  40613d:	90                   	nop
  40613e:	90                   	nop
  40613f:	90                   	nop
  406140:	90                   	nop
  406141:	90                   	nop
  406142:	90                   	nop
  406143:	90                   	nop
  406144:	90                   	nop
  406145:	90                   	nop
  406146:	90                   	nop
  406147:	90                   	nop
  406148:	90                   	nop
  406149:	90                   	nop
  40614a:	90                   	nop
  40614b:	90                   	nop
  40614c:	90                   	nop
  40614d:	90                   	nop
  40614e:	90                   	nop
  40614f:	90                   	nop
  406150:	90                   	nop
  406151:	90                   	nop
  406152:	90                   	nop
  406153:	90                   	nop
  406154:	90                   	nop
  406155:	90                   	nop
  406156:	90                   	nop
  406157:	90                   	nop
  406158:	90                   	nop
  406159:	90                   	nop
  40615a:	90                   	nop
  40615b:	90                   	nop
  40615c:	90                   	nop
  40615d:	90                   	nop
  40615e:	90                   	nop
  40615f:	90                   	nop
  406160:	90                   	nop
  406161:	90                   	nop
  406162:	90                   	nop
  406163:	90                   	nop
  406164:	90                   	nop
  406165:	90                   	nop
  406166:	90                   	nop
  406167:	90                   	nop
  406168:	90                   	nop
  406169:	90                   	nop
  40616a:	90                   	nop
  40616b:	90                   	nop
  40616c:	90                   	nop
  40616d:	90                   	nop
  40616e:	90                   	nop
  40616f:	90                   	nop
  406170:	90                   	nop
  406171:	90                   	nop
  406172:	90                   	nop
  406173:	90                   	nop
  406174:	90                   	nop
  406175:	90                   	nop
  406176:	90                   	nop
  406177:	90                   	nop
  406178:	90                   	nop
  406179:	90                   	nop
  40617a:	90                   	nop
  40617b:	90                   	nop
  40617c:	90                   	nop
  40617d:	90                   	nop
  40617e:	90                   	nop
  40617f:	90                   	nop
  406180:	90                   	nop
  406181:	90                   	nop
  406182:	90                   	nop
  406183:	90                   	nop
  406184:	90                   	nop
  406185:	90                   	nop
  406186:	90                   	nop
  406187:	90                   	nop
  406188:	90                   	nop
  406189:	90                   	nop
  40618a:	90                   	nop
  40618b:	90                   	nop
  40618c:	90                   	nop
  40618d:	90                   	nop
  40618e:	90                   	nop
  40618f:	90                   	nop
  406190:	90                   	nop
  406191:	90                   	nop
  406192:	90                   	nop
  406193:	90                   	nop
  406194:	90                   	nop
  406195:	90                   	nop
  406196:	90                   	nop
  406197:	90                   	nop
  406198:	90                   	nop
  406199:	90                   	nop
  40619a:	90                   	nop
  40619b:	90                   	nop
  40619c:	90                   	nop
  40619d:	90                   	nop
  40619e:	90                   	nop
  40619f:	90                   	nop
  4061a0:	90                   	nop
  4061a1:	90                   	nop
  4061a2:	90                   	nop
  4061a3:	90                   	nop
  4061a4:	90                   	nop
  4061a5:	90                   	nop
  4061a6:	90                   	nop
  4061a7:	90                   	nop
  4061a8:	90                   	nop
  4061a9:	90                   	nop
  4061aa:	90                   	nop
  4061ab:	90                   	nop
  4061ac:	90                   	nop
  4061ad:	90                   	nop
  4061ae:	90                   	nop
  4061af:	90                   	nop
  4061b0:	90                   	nop
  4061b1:	90                   	nop
  4061b2:	90                   	nop
  4061b3:	90                   	nop
  4061b4:	90                   	nop
  4061b5:	90                   	nop
  4061b6:	90                   	nop
  4061b7:	90                   	nop
  4061b8:	90                   	nop
  4061b9:	90                   	nop
  4061ba:	90                   	nop
  4061bb:	90                   	nop
  4061bc:	90                   	nop
  4061bd:	90                   	nop
  4061be:	90                   	nop
  4061bf:	90                   	nop
  4061c0:	90                   	nop
  4061c1:	90                   	nop
  4061c2:	90                   	nop
  4061c3:	90                   	nop
  4061c4:	90                   	nop
  4061c5:	90                   	nop
  4061c6:	90                   	nop
  4061c7:	90                   	nop
  4061c8:	90                   	nop
  4061c9:	90                   	nop
  4061ca:	90                   	nop
  4061cb:	90                   	nop
  4061cc:	90                   	nop
  4061cd:	90                   	nop
  4061ce:	90                   	nop
  4061cf:	90                   	nop
  4061d0:	90                   	nop
  4061d1:	90                   	nop
  4061d2:	90                   	nop
  4061d3:	90                   	nop
  4061d4:	90                   	nop
  4061d5:	90                   	nop
  4061d6:	90                   	nop
  4061d7:	90                   	nop
  4061d8:	90                   	nop
  4061d9:	90                   	nop
  4061da:	90                   	nop
  4061db:	90                   	nop
  4061dc:	90                   	nop
  4061dd:	90                   	nop
  4061de:	90                   	nop
  4061df:	90                   	nop
  4061e0:	90                   	nop
  4061e1:	90                   	nop
  4061e2:	90                   	nop
  4061e3:	90                   	nop
  4061e4:	90                   	nop
  4061e5:	90                   	nop
  4061e6:	90                   	nop
  4061e7:	90                   	nop
  4061e8:	90                   	nop
  4061e9:	90                   	nop
  4061ea:	90                   	nop
  4061eb:	90                   	nop
  4061ec:	90                   	nop
  4061ed:	90                   	nop
  4061ee:	90                   	nop
  4061ef:	90                   	nop
  4061f0:	90                   	nop
  4061f1:	90                   	nop
  4061f2:	90                   	nop
  4061f3:	90                   	nop
  4061f4:	90                   	nop
  4061f5:	90                   	nop
  4061f6:	90                   	nop
  4061f7:	90                   	nop
  4061f8:	90                   	nop
  4061f9:	90                   	nop
  4061fa:	90                   	nop
  4061fb:	90                   	nop
  4061fc:	90                   	nop
  4061fd:	90                   	nop
  4061fe:	90                   	nop
  4061ff:	90                   	nop
  406200:	90                   	nop
  406201:	90                   	nop
  406202:	90                   	nop
  406203:	90                   	nop
  406204:	90                   	nop
  406205:	90                   	nop
  406206:	90                   	nop
  406207:	90                   	nop
  406208:	90                   	nop
  406209:	90                   	nop
  40620a:	90                   	nop
  40620b:	90                   	nop
  40620c:	90                   	nop
  40620d:	90                   	nop
  40620e:	90                   	nop
  40620f:	90                   	nop
  406210:	c3                   	ret    

0000000000406211 <collision_ind_1>:
  406211:	90                   	nop
  406212:	90                   	nop
  406213:	90                   	nop
  406214:	90                   	nop
  406215:	90                   	nop
  406216:	90                   	nop
  406217:	90                   	nop
  406218:	90                   	nop
  406219:	90                   	nop
  40621a:	90                   	nop
  40621b:	90                   	nop
  40621c:	90                   	nop
  40621d:	90                   	nop
  40621e:	90                   	nop
  40621f:	90                   	nop
  406220:	90                   	nop
  406221:	90                   	nop
  406222:	90                   	nop
  406223:	90                   	nop
  406224:	90                   	nop
  406225:	90                   	nop
  406226:	90                   	nop
  406227:	90                   	nop
  406228:	90                   	nop
  406229:	90                   	nop
  40622a:	90                   	nop
  40622b:	90                   	nop
  40622c:	90                   	nop
  40622d:	90                   	nop
  40622e:	90                   	nop
  40622f:	90                   	nop
  406230:	90                   	nop
  406231:	90                   	nop
  406232:	90                   	nop
  406233:	90                   	nop
  406234:	90                   	nop
  406235:	90                   	nop
  406236:	90                   	nop
  406237:	90                   	nop
  406238:	90                   	nop
  406239:	90                   	nop
  40623a:	90                   	nop
  40623b:	90                   	nop
  40623c:	90                   	nop
  40623d:	90                   	nop
  40623e:	90                   	nop
  40623f:	90                   	nop
  406240:	90                   	nop
  406241:	90                   	nop
  406242:	90                   	nop
  406243:	90                   	nop
  406244:	90                   	nop
  406245:	90                   	nop
  406246:	90                   	nop
  406247:	90                   	nop
  406248:	90                   	nop
  406249:	90                   	nop
  40624a:	90                   	nop
  40624b:	90                   	nop
  40624c:	90                   	nop
  40624d:	90                   	nop
  40624e:	90                   	nop
  40624f:	90                   	nop
  406250:	90                   	nop
  406251:	90                   	nop
  406252:	90                   	nop
  406253:	90                   	nop
  406254:	90                   	nop
  406255:	90                   	nop
  406256:	90                   	nop
  406257:	90                   	nop
  406258:	90                   	nop
  406259:	90                   	nop
  40625a:	90                   	nop
  40625b:	90                   	nop
  40625c:	90                   	nop
  40625d:	90                   	nop
  40625e:	90                   	nop
  40625f:	90                   	nop
  406260:	90                   	nop
  406261:	90                   	nop
  406262:	90                   	nop
  406263:	90                   	nop
  406264:	90                   	nop
  406265:	90                   	nop
  406266:	90                   	nop
  406267:	90                   	nop
  406268:	90                   	nop
  406269:	90                   	nop
  40626a:	90                   	nop
  40626b:	90                   	nop
  40626c:	90                   	nop
  40626d:	90                   	nop
  40626e:	90                   	nop
  40626f:	90                   	nop
  406270:	90                   	nop
  406271:	90                   	nop
  406272:	90                   	nop
  406273:	90                   	nop
  406274:	90                   	nop
  406275:	90                   	nop
  406276:	90                   	nop
  406277:	90                   	nop
  406278:	90                   	nop
  406279:	90                   	nop
  40627a:	90                   	nop
  40627b:	90                   	nop
  40627c:	90                   	nop
  40627d:	90                   	nop
  40627e:	90                   	nop
  40627f:	90                   	nop
  406280:	90                   	nop
  406281:	90                   	nop
  406282:	90                   	nop
  406283:	90                   	nop
  406284:	90                   	nop
  406285:	90                   	nop
  406286:	90                   	nop
  406287:	90                   	nop
  406288:	90                   	nop
  406289:	90                   	nop
  40628a:	90                   	nop
  40628b:	90                   	nop
  40628c:	90                   	nop
  40628d:	90                   	nop
  40628e:	90                   	nop
  40628f:	90                   	nop
  406290:	90                   	nop
  406291:	90                   	nop
  406292:	90                   	nop
  406293:	90                   	nop
  406294:	90                   	nop
  406295:	90                   	nop
  406296:	90                   	nop
  406297:	90                   	nop
  406298:	90                   	nop
  406299:	90                   	nop
  40629a:	90                   	nop
  40629b:	90                   	nop
  40629c:	90                   	nop
  40629d:	90                   	nop
  40629e:	90                   	nop
  40629f:	90                   	nop
  4062a0:	90                   	nop
  4062a1:	90                   	nop
  4062a2:	90                   	nop
  4062a3:	90                   	nop
  4062a4:	90                   	nop
  4062a5:	90                   	nop
  4062a6:	90                   	nop
  4062a7:	90                   	nop
  4062a8:	90                   	nop
  4062a9:	90                   	nop
  4062aa:	90                   	nop
  4062ab:	90                   	nop
  4062ac:	90                   	nop
  4062ad:	90                   	nop
  4062ae:	90                   	nop
  4062af:	90                   	nop
  4062b0:	90                   	nop
  4062b1:	90                   	nop
  4062b2:	90                   	nop
  4062b3:	90                   	nop
  4062b4:	90                   	nop
  4062b5:	90                   	nop
  4062b6:	90                   	nop
  4062b7:	90                   	nop
  4062b8:	90                   	nop
  4062b9:	90                   	nop
  4062ba:	90                   	nop
  4062bb:	90                   	nop
  4062bc:	90                   	nop
  4062bd:	90                   	nop
  4062be:	90                   	nop
  4062bf:	90                   	nop
  4062c0:	90                   	nop
  4062c1:	90                   	nop
  4062c2:	90                   	nop
  4062c3:	90                   	nop
  4062c4:	90                   	nop
  4062c5:	90                   	nop
  4062c6:	90                   	nop
  4062c7:	90                   	nop
  4062c8:	90                   	nop
  4062c9:	90                   	nop
  4062ca:	90                   	nop
  4062cb:	90                   	nop
  4062cc:	90                   	nop
  4062cd:	90                   	nop
  4062ce:	90                   	nop
  4062cf:	90                   	nop
  4062d0:	90                   	nop
  4062d1:	90                   	nop
  4062d2:	90                   	nop
  4062d3:	90                   	nop
  4062d4:	90                   	nop
  4062d5:	90                   	nop
  4062d6:	90                   	nop
  4062d7:	90                   	nop
  4062d8:	90                   	nop
  4062d9:	90                   	nop
  4062da:	90                   	nop
  4062db:	90                   	nop
  4062dc:	90                   	nop
  4062dd:	90                   	nop
  4062de:	90                   	nop
  4062df:	90                   	nop
  4062e0:	90                   	nop
  4062e1:	90                   	nop
  4062e2:	90                   	nop
  4062e3:	90                   	nop
  4062e4:	90                   	nop
  4062e5:	90                   	nop
  4062e6:	90                   	nop
  4062e7:	90                   	nop
  4062e8:	90                   	nop
  4062e9:	90                   	nop
  4062ea:	90                   	nop
  4062eb:	90                   	nop
  4062ec:	90                   	nop
  4062ed:	90                   	nop
  4062ee:	90                   	nop
  4062ef:	90                   	nop
  4062f0:	90                   	nop
  4062f1:	90                   	nop
  4062f2:	90                   	nop
  4062f3:	90                   	nop
  4062f4:	90                   	nop
  4062f5:	90                   	nop
  4062f6:	90                   	nop
  4062f7:	90                   	nop
  4062f8:	90                   	nop
  4062f9:	90                   	nop
  4062fa:	90                   	nop
  4062fb:	90                   	nop
  4062fc:	90                   	nop
  4062fd:	90                   	nop
  4062fe:	90                   	nop
  4062ff:	90                   	nop
  406300:	90                   	nop
  406301:	90                   	nop
  406302:	90                   	nop
  406303:	90                   	nop
  406304:	90                   	nop
  406305:	90                   	nop
  406306:	90                   	nop
  406307:	90                   	nop
  406308:	90                   	nop
  406309:	90                   	nop
  40630a:	90                   	nop
  40630b:	90                   	nop
  40630c:	90                   	nop
  40630d:	90                   	nop
  40630e:	90                   	nop
  40630f:	90                   	nop
  406310:	90                   	nop
  406311:	90                   	nop
  406312:	90                   	nop
  406313:	90                   	nop
  406314:	90                   	nop
  406315:	90                   	nop
  406316:	90                   	nop
  406317:	90                   	nop
  406318:	90                   	nop
  406319:	90                   	nop
  40631a:	90                   	nop
  40631b:	90                   	nop
  40631c:	90                   	nop
  40631d:	90                   	nop
  40631e:	90                   	nop
  40631f:	90                   	nop
  406320:	90                   	nop
  406321:	90                   	nop
  406322:	90                   	nop
  406323:	90                   	nop
  406324:	90                   	nop
  406325:	90                   	nop
  406326:	90                   	nop
  406327:	90                   	nop
  406328:	90                   	nop
  406329:	90                   	nop
  40632a:	90                   	nop
  40632b:	90                   	nop
  40632c:	90                   	nop
  40632d:	90                   	nop
  40632e:	90                   	nop
  40632f:	90                   	nop
  406330:	90                   	nop
  406331:	90                   	nop
  406332:	90                   	nop
  406333:	90                   	nop
  406334:	90                   	nop
  406335:	90                   	nop
  406336:	90                   	nop
  406337:	90                   	nop
  406338:	90                   	nop
  406339:	90                   	nop
  40633a:	90                   	nop
  40633b:	90                   	nop
  40633c:	90                   	nop
  40633d:	90                   	nop
  40633e:	90                   	nop
  40633f:	90                   	nop
  406340:	90                   	nop
  406341:	90                   	nop
  406342:	90                   	nop
  406343:	90                   	nop
  406344:	90                   	nop
  406345:	90                   	nop
  406346:	90                   	nop
  406347:	90                   	nop
  406348:	90                   	nop
  406349:	90                   	nop
  40634a:	90                   	nop
  40634b:	90                   	nop
  40634c:	90                   	nop
  40634d:	90                   	nop
  40634e:	90                   	nop
  40634f:	90                   	nop
  406350:	90                   	nop
  406351:	90                   	nop
  406352:	90                   	nop
  406353:	90                   	nop
  406354:	90                   	nop
  406355:	90                   	nop
  406356:	90                   	nop
  406357:	90                   	nop
  406358:	90                   	nop
  406359:	90                   	nop
  40635a:	90                   	nop
  40635b:	90                   	nop
  40635c:	90                   	nop
  40635d:	90                   	nop
  40635e:	90                   	nop
  40635f:	90                   	nop
  406360:	90                   	nop
  406361:	90                   	nop
  406362:	90                   	nop
  406363:	90                   	nop
  406364:	90                   	nop
  406365:	90                   	nop
  406366:	90                   	nop
  406367:	90                   	nop
  406368:	90                   	nop
  406369:	90                   	nop
  40636a:	90                   	nop
  40636b:	90                   	nop
  40636c:	90                   	nop
  40636d:	90                   	nop
  40636e:	90                   	nop
  40636f:	90                   	nop
  406370:	90                   	nop
  406371:	90                   	nop
  406372:	90                   	nop
  406373:	90                   	nop
  406374:	90                   	nop
  406375:	90                   	nop
  406376:	90                   	nop
  406377:	90                   	nop
  406378:	90                   	nop
  406379:	90                   	nop
  40637a:	90                   	nop
  40637b:	90                   	nop
  40637c:	90                   	nop
  40637d:	90                   	nop
  40637e:	90                   	nop
  40637f:	90                   	nop
  406380:	90                   	nop
  406381:	90                   	nop
  406382:	90                   	nop
  406383:	90                   	nop
  406384:	90                   	nop
  406385:	90                   	nop
  406386:	90                   	nop
  406387:	90                   	nop
  406388:	90                   	nop
  406389:	90                   	nop
  40638a:	90                   	nop
  40638b:	90                   	nop
  40638c:	90                   	nop
  40638d:	90                   	nop
  40638e:	90                   	nop
  40638f:	90                   	nop
  406390:	90                   	nop
  406391:	90                   	nop
  406392:	90                   	nop
  406393:	90                   	nop
  406394:	90                   	nop
  406395:	90                   	nop
  406396:	90                   	nop
  406397:	90                   	nop
  406398:	90                   	nop
  406399:	90                   	nop
  40639a:	90                   	nop
  40639b:	90                   	nop
  40639c:	90                   	nop
  40639d:	90                   	nop
  40639e:	90                   	nop
  40639f:	90                   	nop
  4063a0:	90                   	nop
  4063a1:	90                   	nop
  4063a2:	90                   	nop
  4063a3:	90                   	nop
  4063a4:	90                   	nop
  4063a5:	90                   	nop
  4063a6:	90                   	nop
  4063a7:	90                   	nop
  4063a8:	90                   	nop
  4063a9:	90                   	nop
  4063aa:	90                   	nop
  4063ab:	90                   	nop
  4063ac:	90                   	nop
  4063ad:	90                   	nop
  4063ae:	90                   	nop
  4063af:	90                   	nop
  4063b0:	90                   	nop
  4063b1:	90                   	nop
  4063b2:	90                   	nop
  4063b3:	90                   	nop
  4063b4:	90                   	nop
  4063b5:	90                   	nop
  4063b6:	90                   	nop
  4063b7:	90                   	nop
  4063b8:	90                   	nop
  4063b9:	90                   	nop
  4063ba:	90                   	nop
  4063bb:	90                   	nop
  4063bc:	90                   	nop
  4063bd:	90                   	nop
  4063be:	90                   	nop
  4063bf:	90                   	nop
  4063c0:	90                   	nop
  4063c1:	90                   	nop
  4063c2:	90                   	nop
  4063c3:	90                   	nop
  4063c4:	90                   	nop
  4063c5:	90                   	nop
  4063c6:	90                   	nop
  4063c7:	90                   	nop
  4063c8:	90                   	nop
  4063c9:	90                   	nop
  4063ca:	90                   	nop
  4063cb:	90                   	nop
  4063cc:	90                   	nop
  4063cd:	90                   	nop
  4063ce:	90                   	nop
  4063cf:	90                   	nop
  4063d0:	90                   	nop
  4063d1:	90                   	nop
  4063d2:	90                   	nop
  4063d3:	90                   	nop
  4063d4:	90                   	nop
  4063d5:	90                   	nop
  4063d6:	90                   	nop
  4063d7:	90                   	nop
  4063d8:	90                   	nop
  4063d9:	90                   	nop
  4063da:	90                   	nop
  4063db:	90                   	nop
  4063dc:	90                   	nop
  4063dd:	90                   	nop
  4063de:	90                   	nop
  4063df:	90                   	nop
  4063e0:	90                   	nop
  4063e1:	90                   	nop
  4063e2:	90                   	nop
  4063e3:	90                   	nop
  4063e4:	90                   	nop
  4063e5:	90                   	nop
  4063e6:	90                   	nop
  4063e7:	90                   	nop
  4063e8:	90                   	nop
  4063e9:	90                   	nop
  4063ea:	90                   	nop
  4063eb:	90                   	nop
  4063ec:	90                   	nop
  4063ed:	90                   	nop
  4063ee:	90                   	nop
  4063ef:	90                   	nop
  4063f0:	90                   	nop
  4063f1:	90                   	nop
  4063f2:	90                   	nop
  4063f3:	90                   	nop
  4063f4:	90                   	nop
  4063f5:	90                   	nop
  4063f6:	90                   	nop
  4063f7:	90                   	nop
  4063f8:	90                   	nop
  4063f9:	90                   	nop
  4063fa:	90                   	nop
  4063fb:	90                   	nop
  4063fc:	90                   	nop
  4063fd:	90                   	nop
  4063fe:	90                   	nop
  4063ff:	90                   	nop
  406400:	90                   	nop
  406401:	90                   	nop
  406402:	90                   	nop
  406403:	90                   	nop
  406404:	90                   	nop
  406405:	90                   	nop
  406406:	90                   	nop
  406407:	90                   	nop
  406408:	90                   	nop
  406409:	90                   	nop
  40640a:	90                   	nop
  40640b:	90                   	nop
  40640c:	90                   	nop
  40640d:	90                   	nop
  40640e:	90                   	nop
  40640f:	90                   	nop
  406410:	90                   	nop
  406411:	90                   	nop
  406412:	90                   	nop
  406413:	90                   	nop
  406414:	90                   	nop
  406415:	90                   	nop
  406416:	90                   	nop
  406417:	90                   	nop
  406418:	90                   	nop
  406419:	90                   	nop
  40641a:	90                   	nop
  40641b:	90                   	nop
  40641c:	90                   	nop
  40641d:	90                   	nop
  40641e:	90                   	nop
  40641f:	90                   	nop
  406420:	90                   	nop
  406421:	90                   	nop
  406422:	90                   	nop
  406423:	90                   	nop
  406424:	90                   	nop
  406425:	90                   	nop
  406426:	90                   	nop
  406427:	90                   	nop
  406428:	90                   	nop
  406429:	90                   	nop
  40642a:	90                   	nop
  40642b:	90                   	nop
  40642c:	90                   	nop
  40642d:	90                   	nop
  40642e:	90                   	nop
  40642f:	90                   	nop
  406430:	90                   	nop
  406431:	90                   	nop
  406432:	90                   	nop
  406433:	90                   	nop
  406434:	90                   	nop
  406435:	90                   	nop
  406436:	90                   	nop
  406437:	90                   	nop
  406438:	90                   	nop
  406439:	90                   	nop
  40643a:	90                   	nop
  40643b:	90                   	nop
  40643c:	90                   	nop
  40643d:	90                   	nop
  40643e:	90                   	nop
  40643f:	90                   	nop
  406440:	90                   	nop
  406441:	90                   	nop
  406442:	90                   	nop
  406443:	90                   	nop
  406444:	90                   	nop
  406445:	90                   	nop
  406446:	90                   	nop
  406447:	90                   	nop
  406448:	90                   	nop
  406449:	90                   	nop
  40644a:	90                   	nop
  40644b:	90                   	nop
  40644c:	90                   	nop
  40644d:	90                   	nop
  40644e:	90                   	nop
  40644f:	90                   	nop
  406450:	90                   	nop
  406451:	90                   	nop
  406452:	90                   	nop
  406453:	90                   	nop
  406454:	90                   	nop
  406455:	90                   	nop
  406456:	90                   	nop
  406457:	90                   	nop
  406458:	90                   	nop
  406459:	90                   	nop
  40645a:	90                   	nop
  40645b:	90                   	nop
  40645c:	90                   	nop
  40645d:	90                   	nop
  40645e:	90                   	nop
  40645f:	90                   	nop
  406460:	90                   	nop
  406461:	90                   	nop
  406462:	90                   	nop
  406463:	90                   	nop
  406464:	90                   	nop
  406465:	90                   	nop
  406466:	90                   	nop
  406467:	90                   	nop
  406468:	90                   	nop
  406469:	90                   	nop
  40646a:	90                   	nop
  40646b:	90                   	nop
  40646c:	90                   	nop
  40646d:	90                   	nop
  40646e:	90                   	nop
  40646f:	90                   	nop
  406470:	90                   	nop
  406471:	90                   	nop
  406472:	90                   	nop
  406473:	90                   	nop
  406474:	90                   	nop
  406475:	90                   	nop
  406476:	90                   	nop
  406477:	90                   	nop
  406478:	90                   	nop
  406479:	90                   	nop
  40647a:	90                   	nop
  40647b:	90                   	nop
  40647c:	90                   	nop
  40647d:	90                   	nop
  40647e:	90                   	nop
  40647f:	90                   	nop
  406480:	90                   	nop
  406481:	90                   	nop
  406482:	90                   	nop
  406483:	90                   	nop
  406484:	90                   	nop
  406485:	90                   	nop
  406486:	90                   	nop
  406487:	90                   	nop
  406488:	90                   	nop
  406489:	90                   	nop
  40648a:	90                   	nop
  40648b:	90                   	nop
  40648c:	90                   	nop
  40648d:	90                   	nop
  40648e:	90                   	nop
  40648f:	90                   	nop
  406490:	90                   	nop
  406491:	90                   	nop
  406492:	90                   	nop
  406493:	90                   	nop
  406494:	90                   	nop
  406495:	90                   	nop
  406496:	90                   	nop
  406497:	90                   	nop
  406498:	90                   	nop
  406499:	90                   	nop
  40649a:	90                   	nop
  40649b:	90                   	nop
  40649c:	90                   	nop
  40649d:	90                   	nop
  40649e:	90                   	nop
  40649f:	90                   	nop
  4064a0:	90                   	nop
  4064a1:	90                   	nop
  4064a2:	90                   	nop
  4064a3:	90                   	nop
  4064a4:	90                   	nop
  4064a5:	90                   	nop
  4064a6:	90                   	nop
  4064a7:	90                   	nop
  4064a8:	90                   	nop
  4064a9:	90                   	nop
  4064aa:	90                   	nop
  4064ab:	90                   	nop
  4064ac:	90                   	nop
  4064ad:	90                   	nop
  4064ae:	90                   	nop
  4064af:	90                   	nop
  4064b0:	90                   	nop
  4064b1:	90                   	nop
  4064b2:	90                   	nop
  4064b3:	90                   	nop
  4064b4:	90                   	nop
  4064b5:	90                   	nop
  4064b6:	90                   	nop
  4064b7:	90                   	nop
  4064b8:	90                   	nop
  4064b9:	90                   	nop
  4064ba:	90                   	nop
  4064bb:	90                   	nop
  4064bc:	90                   	nop
  4064bd:	90                   	nop
  4064be:	90                   	nop
  4064bf:	90                   	nop
  4064c0:	90                   	nop
  4064c1:	90                   	nop
  4064c2:	90                   	nop
  4064c3:	90                   	nop
  4064c4:	90                   	nop
  4064c5:	90                   	nop
  4064c6:	90                   	nop
  4064c7:	90                   	nop
  4064c8:	90                   	nop
  4064c9:	90                   	nop
  4064ca:	90                   	nop
  4064cb:	90                   	nop
  4064cc:	90                   	nop
  4064cd:	90                   	nop
  4064ce:	90                   	nop
  4064cf:	90                   	nop
  4064d0:	90                   	nop
  4064d1:	90                   	nop
  4064d2:	90                   	nop
  4064d3:	90                   	nop
  4064d4:	90                   	nop
  4064d5:	90                   	nop
  4064d6:	90                   	nop
  4064d7:	90                   	nop
  4064d8:	90                   	nop
  4064d9:	90                   	nop
  4064da:	90                   	nop
  4064db:	90                   	nop
  4064dc:	90                   	nop
  4064dd:	90                   	nop
  4064de:	90                   	nop
  4064df:	90                   	nop
  4064e0:	90                   	nop
  4064e1:	90                   	nop
  4064e2:	90                   	nop
  4064e3:	90                   	nop
  4064e4:	90                   	nop
  4064e5:	90                   	nop
  4064e6:	90                   	nop
  4064e7:	90                   	nop
  4064e8:	90                   	nop
  4064e9:	90                   	nop
  4064ea:	90                   	nop
  4064eb:	90                   	nop
  4064ec:	90                   	nop
  4064ed:	90                   	nop
  4064ee:	90                   	nop
  4064ef:	90                   	nop
  4064f0:	90                   	nop
  4064f1:	90                   	nop
  4064f2:	90                   	nop
  4064f3:	90                   	nop
  4064f4:	90                   	nop
  4064f5:	90                   	nop
  4064f6:	90                   	nop
  4064f7:	90                   	nop
  4064f8:	90                   	nop
  4064f9:	90                   	nop
  4064fa:	90                   	nop
  4064fb:	90                   	nop
  4064fc:	90                   	nop
  4064fd:	90                   	nop
  4064fe:	90                   	nop
  4064ff:	90                   	nop
  406500:	90                   	nop
  406501:	90                   	nop
  406502:	90                   	nop
  406503:	90                   	nop
  406504:	90                   	nop
  406505:	90                   	nop
  406506:	90                   	nop
  406507:	90                   	nop
  406508:	90                   	nop
  406509:	90                   	nop
  40650a:	90                   	nop
  40650b:	90                   	nop
  40650c:	90                   	nop
  40650d:	90                   	nop
  40650e:	90                   	nop
  40650f:	90                   	nop
  406510:	90                   	nop
  406511:	90                   	nop
  406512:	90                   	nop
  406513:	90                   	nop
  406514:	90                   	nop
  406515:	90                   	nop
  406516:	90                   	nop
  406517:	90                   	nop
  406518:	90                   	nop
  406519:	90                   	nop
  40651a:	90                   	nop
  40651b:	90                   	nop
  40651c:	90                   	nop
  40651d:	90                   	nop
  40651e:	90                   	nop
  40651f:	90                   	nop
  406520:	90                   	nop
  406521:	90                   	nop
  406522:	90                   	nop
  406523:	90                   	nop
  406524:	90                   	nop
  406525:	90                   	nop
  406526:	90                   	nop
  406527:	90                   	nop
  406528:	90                   	nop
  406529:	90                   	nop
  40652a:	90                   	nop
  40652b:	90                   	nop
  40652c:	90                   	nop
  40652d:	90                   	nop
  40652e:	90                   	nop
  40652f:	90                   	nop
  406530:	90                   	nop
  406531:	90                   	nop
  406532:	90                   	nop
  406533:	90                   	nop
  406534:	90                   	nop
  406535:	90                   	nop
  406536:	90                   	nop
  406537:	90                   	nop
  406538:	90                   	nop
  406539:	90                   	nop
  40653a:	90                   	nop
  40653b:	90                   	nop
  40653c:	90                   	nop
  40653d:	90                   	nop
  40653e:	90                   	nop
  40653f:	90                   	nop
  406540:	90                   	nop
  406541:	90                   	nop
  406542:	90                   	nop
  406543:	90                   	nop
  406544:	90                   	nop
  406545:	90                   	nop
  406546:	90                   	nop
  406547:	90                   	nop
  406548:	90                   	nop
  406549:	90                   	nop
  40654a:	90                   	nop
  40654b:	90                   	nop
  40654c:	90                   	nop
  40654d:	90                   	nop
  40654e:	90                   	nop
  40654f:	90                   	nop
  406550:	90                   	nop
  406551:	90                   	nop
  406552:	90                   	nop
  406553:	90                   	nop
  406554:	90                   	nop
  406555:	90                   	nop
  406556:	90                   	nop
  406557:	90                   	nop
  406558:	90                   	nop
  406559:	90                   	nop
  40655a:	90                   	nop
  40655b:	90                   	nop
  40655c:	90                   	nop
  40655d:	90                   	nop
  40655e:	90                   	nop
  40655f:	90                   	nop
  406560:	90                   	nop
  406561:	90                   	nop
  406562:	90                   	nop
  406563:	90                   	nop
  406564:	90                   	nop
  406565:	90                   	nop
  406566:	90                   	nop
  406567:	90                   	nop
  406568:	90                   	nop
  406569:	90                   	nop
  40656a:	90                   	nop
  40656b:	90                   	nop
  40656c:	90                   	nop
  40656d:	90                   	nop
  40656e:	90                   	nop
  40656f:	90                   	nop
  406570:	90                   	nop
  406571:	90                   	nop
  406572:	90                   	nop
  406573:	90                   	nop
  406574:	90                   	nop
  406575:	90                   	nop
  406576:	90                   	nop
  406577:	90                   	nop
  406578:	90                   	nop
  406579:	90                   	nop
  40657a:	90                   	nop
  40657b:	90                   	nop
  40657c:	90                   	nop
  40657d:	90                   	nop
  40657e:	90                   	nop
  40657f:	90                   	nop
  406580:	90                   	nop
  406581:	90                   	nop
  406582:	90                   	nop
  406583:	90                   	nop
  406584:	90                   	nop
  406585:	90                   	nop
  406586:	90                   	nop
  406587:	90                   	nop
  406588:	90                   	nop
  406589:	90                   	nop
  40658a:	90                   	nop
  40658b:	90                   	nop
  40658c:	90                   	nop
  40658d:	90                   	nop
  40658e:	90                   	nop
  40658f:	90                   	nop
  406590:	90                   	nop
  406591:	90                   	nop
  406592:	90                   	nop
  406593:	90                   	nop
  406594:	90                   	nop
  406595:	90                   	nop
  406596:	90                   	nop
  406597:	90                   	nop
  406598:	90                   	nop
  406599:	90                   	nop
  40659a:	90                   	nop
  40659b:	90                   	nop
  40659c:	90                   	nop
  40659d:	90                   	nop
  40659e:	90                   	nop
  40659f:	90                   	nop
  4065a0:	90                   	nop
  4065a1:	90                   	nop
  4065a2:	90                   	nop
  4065a3:	90                   	nop
  4065a4:	90                   	nop
  4065a5:	90                   	nop
  4065a6:	90                   	nop
  4065a7:	90                   	nop
  4065a8:	90                   	nop
  4065a9:	90                   	nop
  4065aa:	90                   	nop
  4065ab:	90                   	nop
  4065ac:	90                   	nop
  4065ad:	90                   	nop
  4065ae:	90                   	nop
  4065af:	90                   	nop
  4065b0:	90                   	nop
  4065b1:	90                   	nop
  4065b2:	90                   	nop
  4065b3:	90                   	nop
  4065b4:	90                   	nop
  4065b5:	90                   	nop
  4065b6:	90                   	nop
  4065b7:	90                   	nop
  4065b8:	90                   	nop
  4065b9:	90                   	nop
  4065ba:	90                   	nop
  4065bb:	90                   	nop
  4065bc:	90                   	nop
  4065bd:	90                   	nop
  4065be:	90                   	nop
  4065bf:	90                   	nop
  4065c0:	90                   	nop
  4065c1:	90                   	nop
  4065c2:	90                   	nop
  4065c3:	90                   	nop
  4065c4:	90                   	nop
  4065c5:	90                   	nop
  4065c6:	90                   	nop
  4065c7:	90                   	nop
  4065c8:	90                   	nop
  4065c9:	90                   	nop
  4065ca:	90                   	nop
  4065cb:	90                   	nop
  4065cc:	90                   	nop
  4065cd:	90                   	nop
  4065ce:	90                   	nop
  4065cf:	90                   	nop
  4065d0:	90                   	nop
  4065d1:	90                   	nop
  4065d2:	90                   	nop
  4065d3:	90                   	nop
  4065d4:	90                   	nop
  4065d5:	90                   	nop
  4065d6:	90                   	nop
  4065d7:	90                   	nop
  4065d8:	90                   	nop
  4065d9:	90                   	nop
  4065da:	90                   	nop
  4065db:	90                   	nop
  4065dc:	90                   	nop
  4065dd:	90                   	nop
  4065de:	90                   	nop
  4065df:	90                   	nop
  4065e0:	90                   	nop
  4065e1:	90                   	nop
  4065e2:	90                   	nop
  4065e3:	90                   	nop
  4065e4:	90                   	nop
  4065e5:	90                   	nop
  4065e6:	90                   	nop
  4065e7:	90                   	nop
  4065e8:	90                   	nop
  4065e9:	90                   	nop
  4065ea:	90                   	nop
  4065eb:	90                   	nop
  4065ec:	90                   	nop
  4065ed:	90                   	nop
  4065ee:	90                   	nop
  4065ef:	90                   	nop
  4065f0:	90                   	nop
  4065f1:	90                   	nop
  4065f2:	90                   	nop
  4065f3:	90                   	nop
  4065f4:	90                   	nop
  4065f5:	90                   	nop
  4065f6:	90                   	nop
  4065f7:	90                   	nop
  4065f8:	90                   	nop
  4065f9:	90                   	nop
  4065fa:	90                   	nop
  4065fb:	90                   	nop
  4065fc:	90                   	nop
  4065fd:	90                   	nop
  4065fe:	90                   	nop
  4065ff:	90                   	nop
  406600:	90                   	nop
  406601:	90                   	nop
  406602:	90                   	nop
  406603:	90                   	nop
  406604:	90                   	nop
  406605:	90                   	nop
  406606:	90                   	nop
  406607:	90                   	nop
  406608:	90                   	nop
  406609:	90                   	nop
  40660a:	90                   	nop
  40660b:	90                   	nop
  40660c:	90                   	nop
  40660d:	90                   	nop
  40660e:	90                   	nop
  40660f:	90                   	nop
  406610:	90                   	nop
  406611:	90                   	nop
  406612:	90                   	nop
  406613:	90                   	nop
  406614:	90                   	nop
  406615:	90                   	nop
  406616:	90                   	nop
  406617:	90                   	nop
  406618:	90                   	nop
  406619:	90                   	nop
  40661a:	90                   	nop
  40661b:	90                   	nop
  40661c:	90                   	nop
  40661d:	90                   	nop
  40661e:	90                   	nop
  40661f:	90                   	nop
  406620:	90                   	nop
  406621:	90                   	nop
  406622:	90                   	nop
  406623:	90                   	nop
  406624:	90                   	nop
  406625:	90                   	nop
  406626:	90                   	nop
  406627:	90                   	nop
  406628:	90                   	nop
  406629:	90                   	nop
  40662a:	90                   	nop
  40662b:	90                   	nop
  40662c:	90                   	nop
  40662d:	90                   	nop
  40662e:	90                   	nop
  40662f:	90                   	nop
  406630:	90                   	nop
  406631:	90                   	nop
  406632:	90                   	nop
  406633:	90                   	nop
  406634:	90                   	nop
  406635:	90                   	nop
  406636:	90                   	nop
  406637:	90                   	nop
  406638:	90                   	nop
  406639:	90                   	nop
  40663a:	90                   	nop
  40663b:	90                   	nop
  40663c:	90                   	nop
  40663d:	90                   	nop
  40663e:	90                   	nop
  40663f:	90                   	nop
  406640:	90                   	nop
  406641:	90                   	nop
  406642:	90                   	nop
  406643:	90                   	nop
  406644:	90                   	nop
  406645:	90                   	nop
  406646:	90                   	nop
  406647:	90                   	nop
  406648:	90                   	nop
  406649:	90                   	nop
  40664a:	90                   	nop
  40664b:	90                   	nop
  40664c:	90                   	nop
  40664d:	90                   	nop
  40664e:	90                   	nop
  40664f:	90                   	nop
  406650:	90                   	nop
  406651:	90                   	nop
  406652:	90                   	nop
  406653:	90                   	nop
  406654:	90                   	nop
  406655:	90                   	nop
  406656:	90                   	nop
  406657:	90                   	nop
  406658:	90                   	nop
  406659:	90                   	nop
  40665a:	90                   	nop
  40665b:	90                   	nop
  40665c:	90                   	nop
  40665d:	90                   	nop
  40665e:	90                   	nop
  40665f:	90                   	nop
  406660:	90                   	nop
  406661:	90                   	nop
  406662:	90                   	nop
  406663:	90                   	nop
  406664:	90                   	nop
  406665:	90                   	nop
  406666:	90                   	nop
  406667:	90                   	nop
  406668:	90                   	nop
  406669:	90                   	nop
  40666a:	90                   	nop
  40666b:	90                   	nop
  40666c:	90                   	nop
  40666d:	90                   	nop
  40666e:	90                   	nop
  40666f:	90                   	nop
  406670:	90                   	nop
  406671:	90                   	nop
  406672:	90                   	nop
  406673:	90                   	nop
  406674:	90                   	nop
  406675:	90                   	nop
  406676:	90                   	nop
  406677:	90                   	nop
  406678:	90                   	nop
  406679:	90                   	nop
  40667a:	90                   	nop
  40667b:	90                   	nop
  40667c:	90                   	nop
  40667d:	90                   	nop
  40667e:	90                   	nop
  40667f:	90                   	nop
  406680:	90                   	nop
  406681:	90                   	nop
  406682:	90                   	nop
  406683:	90                   	nop
  406684:	90                   	nop
  406685:	90                   	nop
  406686:	90                   	nop
  406687:	90                   	nop
  406688:	90                   	nop
  406689:	90                   	nop
  40668a:	90                   	nop
  40668b:	90                   	nop
  40668c:	90                   	nop
  40668d:	90                   	nop
  40668e:	90                   	nop
  40668f:	90                   	nop
  406690:	90                   	nop
  406691:	90                   	nop
  406692:	90                   	nop
  406693:	90                   	nop
  406694:	90                   	nop
  406695:	90                   	nop
  406696:	90                   	nop
  406697:	90                   	nop
  406698:	90                   	nop
  406699:	90                   	nop
  40669a:	90                   	nop
  40669b:	90                   	nop
  40669c:	90                   	nop
  40669d:	90                   	nop
  40669e:	90                   	nop
  40669f:	90                   	nop
  4066a0:	90                   	nop
  4066a1:	90                   	nop
  4066a2:	90                   	nop
  4066a3:	90                   	nop
  4066a4:	90                   	nop
  4066a5:	90                   	nop
  4066a6:	90                   	nop
  4066a7:	90                   	nop
  4066a8:	90                   	nop
  4066a9:	90                   	nop
  4066aa:	90                   	nop
  4066ab:	90                   	nop
  4066ac:	90                   	nop
  4066ad:	90                   	nop
  4066ae:	90                   	nop
  4066af:	90                   	nop
  4066b0:	90                   	nop
  4066b1:	90                   	nop
  4066b2:	90                   	nop
  4066b3:	90                   	nop
  4066b4:	90                   	nop
  4066b5:	90                   	nop
  4066b6:	90                   	nop
  4066b7:	90                   	nop
  4066b8:	90                   	nop
  4066b9:	90                   	nop
  4066ba:	90                   	nop
  4066bb:	90                   	nop
  4066bc:	90                   	nop
  4066bd:	90                   	nop
  4066be:	90                   	nop
  4066bf:	90                   	nop
  4066c0:	90                   	nop
  4066c1:	90                   	nop
  4066c2:	90                   	nop
  4066c3:	90                   	nop
  4066c4:	90                   	nop
  4066c5:	90                   	nop
  4066c6:	90                   	nop
  4066c7:	90                   	nop
  4066c8:	90                   	nop
  4066c9:	90                   	nop
  4066ca:	90                   	nop
  4066cb:	90                   	nop
  4066cc:	90                   	nop
  4066cd:	90                   	nop
  4066ce:	90                   	nop
  4066cf:	90                   	nop
  4066d0:	90                   	nop
  4066d1:	90                   	nop
  4066d2:	90                   	nop
  4066d3:	90                   	nop
  4066d4:	90                   	nop
  4066d5:	90                   	nop
  4066d6:	90                   	nop
  4066d7:	90                   	nop
  4066d8:	90                   	nop
  4066d9:	90                   	nop
  4066da:	90                   	nop
  4066db:	90                   	nop
  4066dc:	90                   	nop
  4066dd:	90                   	nop
  4066de:	90                   	nop
  4066df:	90                   	nop
  4066e0:	90                   	nop
  4066e1:	90                   	nop
  4066e2:	90                   	nop
  4066e3:	90                   	nop
  4066e4:	90                   	nop
  4066e5:	90                   	nop
  4066e6:	90                   	nop
  4066e7:	90                   	nop
  4066e8:	90                   	nop
  4066e9:	90                   	nop
  4066ea:	90                   	nop
  4066eb:	90                   	nop
  4066ec:	90                   	nop
  4066ed:	90                   	nop
  4066ee:	90                   	nop
  4066ef:	90                   	nop
  4066f0:	90                   	nop
  4066f1:	90                   	nop
  4066f2:	90                   	nop
  4066f3:	90                   	nop
  4066f4:	90                   	nop
  4066f5:	90                   	nop
  4066f6:	90                   	nop
  4066f7:	90                   	nop
  4066f8:	90                   	nop
  4066f9:	90                   	nop
  4066fa:	90                   	nop
  4066fb:	90                   	nop
  4066fc:	90                   	nop
  4066fd:	90                   	nop
  4066fe:	90                   	nop
  4066ff:	90                   	nop
  406700:	90                   	nop
  406701:	90                   	nop
  406702:	90                   	nop
  406703:	90                   	nop
  406704:	90                   	nop
  406705:	90                   	nop
  406706:	90                   	nop
  406707:	90                   	nop
  406708:	90                   	nop
  406709:	90                   	nop
  40670a:	90                   	nop
  40670b:	90                   	nop
  40670c:	90                   	nop
  40670d:	90                   	nop
  40670e:	90                   	nop
  40670f:	90                   	nop
  406710:	90                   	nop
  406711:	90                   	nop
  406712:	90                   	nop
  406713:	90                   	nop
  406714:	90                   	nop
  406715:	90                   	nop
  406716:	90                   	nop
  406717:	90                   	nop
  406718:	90                   	nop
  406719:	90                   	nop
  40671a:	90                   	nop
  40671b:	90                   	nop
  40671c:	90                   	nop
  40671d:	90                   	nop
  40671e:	90                   	nop
  40671f:	90                   	nop
  406720:	90                   	nop
  406721:	90                   	nop
  406722:	90                   	nop
  406723:	90                   	nop
  406724:	90                   	nop
  406725:	90                   	nop
  406726:	90                   	nop
  406727:	90                   	nop
  406728:	90                   	nop
  406729:	90                   	nop
  40672a:	90                   	nop
  40672b:	90                   	nop
  40672c:	90                   	nop
  40672d:	90                   	nop
  40672e:	90                   	nop
  40672f:	90                   	nop
  406730:	90                   	nop
  406731:	90                   	nop
  406732:	90                   	nop
  406733:	90                   	nop
  406734:	90                   	nop
  406735:	90                   	nop
  406736:	90                   	nop
  406737:	90                   	nop
  406738:	90                   	nop
  406739:	90                   	nop
  40673a:	90                   	nop
  40673b:	90                   	nop
  40673c:	90                   	nop
  40673d:	90                   	nop
  40673e:	90                   	nop
  40673f:	90                   	nop
  406740:	90                   	nop
  406741:	90                   	nop
  406742:	90                   	nop
  406743:	90                   	nop
  406744:	90                   	nop
  406745:	90                   	nop
  406746:	90                   	nop
  406747:	90                   	nop
  406748:	90                   	nop
  406749:	90                   	nop
  40674a:	90                   	nop
  40674b:	90                   	nop
  40674c:	90                   	nop
  40674d:	90                   	nop
  40674e:	90                   	nop
  40674f:	90                   	nop
  406750:	90                   	nop
  406751:	90                   	nop
  406752:	90                   	nop
  406753:	90                   	nop
  406754:	90                   	nop
  406755:	90                   	nop
  406756:	90                   	nop
  406757:	90                   	nop
  406758:	90                   	nop
  406759:	90                   	nop
  40675a:	90                   	nop
  40675b:	90                   	nop
  40675c:	90                   	nop
  40675d:	90                   	nop
  40675e:	90                   	nop
  40675f:	90                   	nop
  406760:	90                   	nop
  406761:	90                   	nop
  406762:	90                   	nop
  406763:	90                   	nop
  406764:	90                   	nop
  406765:	90                   	nop
  406766:	90                   	nop
  406767:	90                   	nop
  406768:	90                   	nop
  406769:	90                   	nop
  40676a:	90                   	nop
  40676b:	90                   	nop
  40676c:	90                   	nop
  40676d:	90                   	nop
  40676e:	90                   	nop
  40676f:	90                   	nop
  406770:	90                   	nop
  406771:	90                   	nop
  406772:	90                   	nop
  406773:	90                   	nop
  406774:	90                   	nop
  406775:	90                   	nop
  406776:	90                   	nop
  406777:	90                   	nop
  406778:	90                   	nop
  406779:	90                   	nop
  40677a:	90                   	nop
  40677b:	90                   	nop
  40677c:	90                   	nop
  40677d:	90                   	nop
  40677e:	90                   	nop
  40677f:	90                   	nop
  406780:	90                   	nop
  406781:	90                   	nop
  406782:	90                   	nop
  406783:	90                   	nop
  406784:	90                   	nop
  406785:	90                   	nop
  406786:	90                   	nop
  406787:	90                   	nop
  406788:	90                   	nop
  406789:	90                   	nop
  40678a:	90                   	nop
  40678b:	90                   	nop
  40678c:	90                   	nop
  40678d:	90                   	nop
  40678e:	90                   	nop
  40678f:	90                   	nop
  406790:	90                   	nop
  406791:	90                   	nop
  406792:	90                   	nop
  406793:	90                   	nop
  406794:	90                   	nop
  406795:	90                   	nop
  406796:	90                   	nop
  406797:	90                   	nop
  406798:	90                   	nop
  406799:	90                   	nop
  40679a:	90                   	nop
  40679b:	90                   	nop
  40679c:	90                   	nop
  40679d:	90                   	nop
  40679e:	90                   	nop
  40679f:	90                   	nop
  4067a0:	90                   	nop
  4067a1:	90                   	nop
  4067a2:	90                   	nop
  4067a3:	90                   	nop
  4067a4:	90                   	nop
  4067a5:	90                   	nop
  4067a6:	90                   	nop
  4067a7:	90                   	nop
  4067a8:	90                   	nop
  4067a9:	90                   	nop
  4067aa:	90                   	nop
  4067ab:	90                   	nop
  4067ac:	90                   	nop
  4067ad:	90                   	nop
  4067ae:	90                   	nop
  4067af:	90                   	nop
  4067b0:	90                   	nop
  4067b1:	90                   	nop
  4067b2:	90                   	nop
  4067b3:	90                   	nop
  4067b4:	90                   	nop
  4067b5:	90                   	nop
  4067b6:	90                   	nop
  4067b7:	90                   	nop
  4067b8:	90                   	nop
  4067b9:	90                   	nop
  4067ba:	90                   	nop
  4067bb:	90                   	nop
  4067bc:	90                   	nop
  4067bd:	90                   	nop
  4067be:	90                   	nop
  4067bf:	90                   	nop
  4067c0:	90                   	nop
  4067c1:	90                   	nop
  4067c2:	90                   	nop
  4067c3:	90                   	nop
  4067c4:	90                   	nop
  4067c5:	90                   	nop
  4067c6:	90                   	nop
  4067c7:	90                   	nop
  4067c8:	90                   	nop
  4067c9:	90                   	nop
  4067ca:	90                   	nop
  4067cb:	90                   	nop
  4067cc:	90                   	nop
  4067cd:	90                   	nop
  4067ce:	90                   	nop
  4067cf:	90                   	nop
  4067d0:	90                   	nop
  4067d1:	90                   	nop
  4067d2:	90                   	nop
  4067d3:	90                   	nop
  4067d4:	90                   	nop
  4067d5:	90                   	nop
  4067d6:	90                   	nop
  4067d7:	90                   	nop
  4067d8:	90                   	nop
  4067d9:	90                   	nop
  4067da:	90                   	nop
  4067db:	90                   	nop
  4067dc:	90                   	nop
  4067dd:	90                   	nop
  4067de:	90                   	nop
  4067df:	90                   	nop
  4067e0:	90                   	nop
  4067e1:	90                   	nop
  4067e2:	90                   	nop
  4067e3:	90                   	nop
  4067e4:	90                   	nop
  4067e5:	90                   	nop
  4067e6:	90                   	nop
  4067e7:	90                   	nop
  4067e8:	90                   	nop
  4067e9:	90                   	nop
  4067ea:	90                   	nop
  4067eb:	90                   	nop
  4067ec:	90                   	nop
  4067ed:	90                   	nop
  4067ee:	90                   	nop
  4067ef:	90                   	nop
  4067f0:	90                   	nop
  4067f1:	90                   	nop
  4067f2:	90                   	nop
  4067f3:	90                   	nop
  4067f4:	90                   	nop
  4067f5:	90                   	nop
  4067f6:	90                   	nop
  4067f7:	90                   	nop
  4067f8:	90                   	nop
  4067f9:	90                   	nop
  4067fa:	90                   	nop
  4067fb:	90                   	nop
  4067fc:	90                   	nop
  4067fd:	90                   	nop
  4067fe:	90                   	nop
  4067ff:	90                   	nop
  406800:	90                   	nop
  406801:	90                   	nop
  406802:	90                   	nop
  406803:	90                   	nop
  406804:	90                   	nop
  406805:	90                   	nop
  406806:	90                   	nop
  406807:	90                   	nop
  406808:	90                   	nop
  406809:	90                   	nop
  40680a:	90                   	nop
  40680b:	90                   	nop
  40680c:	90                   	nop
  40680d:	90                   	nop
  40680e:	90                   	nop
  40680f:	90                   	nop
  406810:	90                   	nop
  406811:	90                   	nop
  406812:	90                   	nop
  406813:	90                   	nop
  406814:	90                   	nop
  406815:	90                   	nop
  406816:	90                   	nop
  406817:	90                   	nop
  406818:	90                   	nop
  406819:	90                   	nop
  40681a:	90                   	nop
  40681b:	90                   	nop
  40681c:	90                   	nop
  40681d:	90                   	nop
  40681e:	90                   	nop
  40681f:	90                   	nop
  406820:	90                   	nop
  406821:	90                   	nop
  406822:	90                   	nop
  406823:	90                   	nop
  406824:	90                   	nop
  406825:	90                   	nop
  406826:	90                   	nop
  406827:	90                   	nop
  406828:	90                   	nop
  406829:	90                   	nop
  40682a:	90                   	nop
  40682b:	90                   	nop
  40682c:	90                   	nop
  40682d:	90                   	nop
  40682e:	90                   	nop
  40682f:	90                   	nop
  406830:	90                   	nop
  406831:	90                   	nop
  406832:	90                   	nop
  406833:	90                   	nop
  406834:	90                   	nop
  406835:	90                   	nop
  406836:	90                   	nop
  406837:	90                   	nop
  406838:	90                   	nop
  406839:	90                   	nop
  40683a:	90                   	nop
  40683b:	90                   	nop
  40683c:	90                   	nop
  40683d:	90                   	nop
  40683e:	90                   	nop
  40683f:	90                   	nop
  406840:	90                   	nop
  406841:	90                   	nop
  406842:	90                   	nop
  406843:	90                   	nop
  406844:	90                   	nop
  406845:	90                   	nop
  406846:	90                   	nop
  406847:	90                   	nop
  406848:	90                   	nop
  406849:	90                   	nop
  40684a:	90                   	nop
  40684b:	90                   	nop
  40684c:	90                   	nop
  40684d:	90                   	nop
  40684e:	90                   	nop
  40684f:	90                   	nop
  406850:	90                   	nop
  406851:	90                   	nop
  406852:	90                   	nop
  406853:	90                   	nop
  406854:	90                   	nop
  406855:	90                   	nop
  406856:	90                   	nop
  406857:	90                   	nop
  406858:	90                   	nop
  406859:	90                   	nop
  40685a:	90                   	nop
  40685b:	90                   	nop
  40685c:	90                   	nop
  40685d:	90                   	nop
  40685e:	90                   	nop
  40685f:	90                   	nop
  406860:	90                   	nop
  406861:	90                   	nop
  406862:	90                   	nop
  406863:	90                   	nop
  406864:	90                   	nop
  406865:	90                   	nop
  406866:	90                   	nop
  406867:	90                   	nop
  406868:	90                   	nop
  406869:	90                   	nop
  40686a:	90                   	nop
  40686b:	90                   	nop
  40686c:	90                   	nop
  40686d:	90                   	nop
  40686e:	90                   	nop
  40686f:	90                   	nop
  406870:	90                   	nop
  406871:	90                   	nop
  406872:	90                   	nop
  406873:	90                   	nop
  406874:	90                   	nop
  406875:	90                   	nop
  406876:	90                   	nop
  406877:	90                   	nop
  406878:	90                   	nop
  406879:	90                   	nop
  40687a:	90                   	nop
  40687b:	90                   	nop
  40687c:	90                   	nop
  40687d:	90                   	nop
  40687e:	90                   	nop
  40687f:	90                   	nop
  406880:	90                   	nop
  406881:	90                   	nop
  406882:	90                   	nop
  406883:	90                   	nop
  406884:	90                   	nop
  406885:	90                   	nop
  406886:	90                   	nop
  406887:	90                   	nop
  406888:	90                   	nop
  406889:	90                   	nop
  40688a:	90                   	nop
  40688b:	90                   	nop
  40688c:	90                   	nop
  40688d:	90                   	nop
  40688e:	90                   	nop
  40688f:	90                   	nop
  406890:	90                   	nop
  406891:	90                   	nop
  406892:	90                   	nop
  406893:	90                   	nop
  406894:	90                   	nop
  406895:	90                   	nop
  406896:	90                   	nop
  406897:	90                   	nop
  406898:	90                   	nop
  406899:	90                   	nop
  40689a:	90                   	nop
  40689b:	90                   	nop
  40689c:	90                   	nop
  40689d:	90                   	nop
  40689e:	90                   	nop
  40689f:	90                   	nop
  4068a0:	90                   	nop
  4068a1:	90                   	nop
  4068a2:	90                   	nop
  4068a3:	90                   	nop
  4068a4:	90                   	nop
  4068a5:	90                   	nop
  4068a6:	90                   	nop
  4068a7:	90                   	nop
  4068a8:	90                   	nop
  4068a9:	90                   	nop
  4068aa:	90                   	nop
  4068ab:	90                   	nop
  4068ac:	90                   	nop
  4068ad:	90                   	nop
  4068ae:	90                   	nop
  4068af:	90                   	nop
  4068b0:	90                   	nop
  4068b1:	90                   	nop
  4068b2:	90                   	nop
  4068b3:	90                   	nop
  4068b4:	90                   	nop
  4068b5:	90                   	nop
  4068b6:	90                   	nop
  4068b7:	90                   	nop
  4068b8:	90                   	nop
  4068b9:	90                   	nop
  4068ba:	90                   	nop
  4068bb:	90                   	nop
  4068bc:	90                   	nop
  4068bd:	90                   	nop
  4068be:	90                   	nop
  4068bf:	90                   	nop
  4068c0:	90                   	nop
  4068c1:	90                   	nop
  4068c2:	90                   	nop
  4068c3:	90                   	nop
  4068c4:	90                   	nop
  4068c5:	90                   	nop
  4068c6:	90                   	nop
  4068c7:	90                   	nop
  4068c8:	90                   	nop
  4068c9:	90                   	nop
  4068ca:	90                   	nop
  4068cb:	90                   	nop
  4068cc:	90                   	nop
  4068cd:	90                   	nop
  4068ce:	90                   	nop
  4068cf:	90                   	nop
  4068d0:	90                   	nop
  4068d1:	90                   	nop
  4068d2:	90                   	nop
  4068d3:	90                   	nop
  4068d4:	90                   	nop
  4068d5:	90                   	nop
  4068d6:	90                   	nop
  4068d7:	90                   	nop
  4068d8:	90                   	nop
  4068d9:	90                   	nop
  4068da:	90                   	nop
  4068db:	90                   	nop
  4068dc:	90                   	nop
  4068dd:	90                   	nop
  4068de:	90                   	nop
  4068df:	90                   	nop
  4068e0:	90                   	nop
  4068e1:	90                   	nop
  4068e2:	90                   	nop
  4068e3:	90                   	nop
  4068e4:	90                   	nop
  4068e5:	90                   	nop
  4068e6:	90                   	nop
  4068e7:	90                   	nop
  4068e8:	90                   	nop
  4068e9:	90                   	nop
  4068ea:	90                   	nop
  4068eb:	90                   	nop
  4068ec:	90                   	nop
  4068ed:	90                   	nop
  4068ee:	90                   	nop
  4068ef:	90                   	nop
  4068f0:	90                   	nop
  4068f1:	90                   	nop
  4068f2:	90                   	nop
  4068f3:	90                   	nop
  4068f4:	90                   	nop
  4068f5:	90                   	nop
  4068f6:	90                   	nop
  4068f7:	90                   	nop
  4068f8:	90                   	nop
  4068f9:	90                   	nop
  4068fa:	90                   	nop
  4068fb:	90                   	nop
  4068fc:	90                   	nop
  4068fd:	90                   	nop
  4068fe:	90                   	nop
  4068ff:	90                   	nop
  406900:	90                   	nop
  406901:	90                   	nop
  406902:	90                   	nop
  406903:	90                   	nop
  406904:	90                   	nop
  406905:	90                   	nop
  406906:	90                   	nop
  406907:	90                   	nop
  406908:	90                   	nop
  406909:	90                   	nop
  40690a:	90                   	nop
  40690b:	90                   	nop
  40690c:	90                   	nop
  40690d:	90                   	nop
  40690e:	90                   	nop
  40690f:	90                   	nop
  406910:	90                   	nop
  406911:	90                   	nop
  406912:	90                   	nop
  406913:	90                   	nop
  406914:	90                   	nop
  406915:	90                   	nop
  406916:	90                   	nop
  406917:	90                   	nop
  406918:	90                   	nop
  406919:	90                   	nop
  40691a:	90                   	nop
  40691b:	90                   	nop
  40691c:	90                   	nop
  40691d:	90                   	nop
  40691e:	90                   	nop
  40691f:	90                   	nop
  406920:	90                   	nop
  406921:	90                   	nop
  406922:	90                   	nop
  406923:	90                   	nop
  406924:	90                   	nop
  406925:	90                   	nop
  406926:	90                   	nop
  406927:	90                   	nop
  406928:	90                   	nop
  406929:	90                   	nop
  40692a:	90                   	nop
  40692b:	90                   	nop
  40692c:	90                   	nop
  40692d:	90                   	nop
  40692e:	90                   	nop
  40692f:	90                   	nop
  406930:	90                   	nop
  406931:	90                   	nop
  406932:	90                   	nop
  406933:	90                   	nop
  406934:	90                   	nop
  406935:	90                   	nop
  406936:	90                   	nop
  406937:	90                   	nop
  406938:	90                   	nop
  406939:	90                   	nop
  40693a:	90                   	nop
  40693b:	90                   	nop
  40693c:	90                   	nop
  40693d:	90                   	nop
  40693e:	90                   	nop
  40693f:	90                   	nop
  406940:	90                   	nop
  406941:	90                   	nop
  406942:	90                   	nop
  406943:	90                   	nop
  406944:	90                   	nop
  406945:	90                   	nop
  406946:	90                   	nop
  406947:	90                   	nop
  406948:	90                   	nop
  406949:	90                   	nop
  40694a:	90                   	nop
  40694b:	90                   	nop
  40694c:	90                   	nop
  40694d:	90                   	nop
  40694e:	90                   	nop
  40694f:	90                   	nop
  406950:	90                   	nop
  406951:	90                   	nop
  406952:	90                   	nop
  406953:	90                   	nop
  406954:	90                   	nop
  406955:	90                   	nop
  406956:	90                   	nop
  406957:	90                   	nop
  406958:	90                   	nop
  406959:	90                   	nop
  40695a:	90                   	nop
  40695b:	90                   	nop
  40695c:	90                   	nop
  40695d:	90                   	nop
  40695e:	90                   	nop
  40695f:	90                   	nop
  406960:	90                   	nop
  406961:	90                   	nop
  406962:	90                   	nop
  406963:	90                   	nop
  406964:	90                   	nop
  406965:	90                   	nop
  406966:	90                   	nop
  406967:	90                   	nop
  406968:	90                   	nop
  406969:	90                   	nop
  40696a:	90                   	nop
  40696b:	90                   	nop
  40696c:	90                   	nop
  40696d:	90                   	nop
  40696e:	90                   	nop
  40696f:	90                   	nop
  406970:	90                   	nop
  406971:	90                   	nop
  406972:	90                   	nop
  406973:	90                   	nop
  406974:	90                   	nop
  406975:	90                   	nop
  406976:	90                   	nop
  406977:	90                   	nop
  406978:	90                   	nop
  406979:	90                   	nop
  40697a:	90                   	nop
  40697b:	90                   	nop
  40697c:	90                   	nop
  40697d:	90                   	nop
  40697e:	90                   	nop
  40697f:	90                   	nop
  406980:	90                   	nop
  406981:	90                   	nop
  406982:	90                   	nop
  406983:	90                   	nop
  406984:	90                   	nop
  406985:	90                   	nop
  406986:	90                   	nop
  406987:	90                   	nop
  406988:	90                   	nop
  406989:	90                   	nop
  40698a:	90                   	nop
  40698b:	90                   	nop
  40698c:	90                   	nop
  40698d:	90                   	nop
  40698e:	90                   	nop
  40698f:	90                   	nop
  406990:	90                   	nop
  406991:	90                   	nop
  406992:	90                   	nop
  406993:	90                   	nop
  406994:	90                   	nop
  406995:	90                   	nop
  406996:	90                   	nop
  406997:	90                   	nop
  406998:	90                   	nop
  406999:	90                   	nop
  40699a:	90                   	nop
  40699b:	90                   	nop
  40699c:	90                   	nop
  40699d:	90                   	nop
  40699e:	90                   	nop
  40699f:	90                   	nop
  4069a0:	90                   	nop
  4069a1:	90                   	nop
  4069a2:	90                   	nop
  4069a3:	90                   	nop
  4069a4:	90                   	nop
  4069a5:	90                   	nop
  4069a6:	90                   	nop
  4069a7:	90                   	nop
  4069a8:	90                   	nop
  4069a9:	90                   	nop
  4069aa:	90                   	nop
  4069ab:	90                   	nop
  4069ac:	90                   	nop
  4069ad:	90                   	nop
  4069ae:	90                   	nop
  4069af:	90                   	nop
  4069b0:	90                   	nop
  4069b1:	90                   	nop
  4069b2:	90                   	nop
  4069b3:	90                   	nop
  4069b4:	90                   	nop
  4069b5:	90                   	nop
  4069b6:	90                   	nop
  4069b7:	90                   	nop
  4069b8:	90                   	nop
  4069b9:	90                   	nop
  4069ba:	90                   	nop
  4069bb:	90                   	nop
  4069bc:	90                   	nop
  4069bd:	90                   	nop
  4069be:	90                   	nop
  4069bf:	90                   	nop
  4069c0:	90                   	nop
  4069c1:	90                   	nop
  4069c2:	90                   	nop
  4069c3:	90                   	nop
  4069c4:	90                   	nop
  4069c5:	90                   	nop
  4069c6:	90                   	nop
  4069c7:	90                   	nop
  4069c8:	90                   	nop
  4069c9:	90                   	nop
  4069ca:	90                   	nop
  4069cb:	90                   	nop
  4069cc:	90                   	nop
  4069cd:	90                   	nop
  4069ce:	90                   	nop
  4069cf:	90                   	nop
  4069d0:	90                   	nop
  4069d1:	90                   	nop
  4069d2:	90                   	nop
  4069d3:	90                   	nop
  4069d4:	90                   	nop
  4069d5:	90                   	nop
  4069d6:	90                   	nop
  4069d7:	90                   	nop
  4069d8:	90                   	nop
  4069d9:	90                   	nop
  4069da:	90                   	nop
  4069db:	90                   	nop
  4069dc:	90                   	nop
  4069dd:	90                   	nop
  4069de:	90                   	nop
  4069df:	90                   	nop
  4069e0:	90                   	nop
  4069e1:	90                   	nop
  4069e2:	90                   	nop
  4069e3:	90                   	nop
  4069e4:	90                   	nop
  4069e5:	90                   	nop
  4069e6:	90                   	nop
  4069e7:	90                   	nop
  4069e8:	90                   	nop
  4069e9:	90                   	nop
  4069ea:	90                   	nop
  4069eb:	90                   	nop
  4069ec:	90                   	nop
  4069ed:	90                   	nop
  4069ee:	90                   	nop
  4069ef:	90                   	nop
  4069f0:	90                   	nop
  4069f1:	90                   	nop
  4069f2:	90                   	nop
  4069f3:	90                   	nop
  4069f4:	90                   	nop
  4069f5:	90                   	nop
  4069f6:	90                   	nop
  4069f7:	90                   	nop
  4069f8:	90                   	nop
  4069f9:	90                   	nop
  4069fa:	90                   	nop
  4069fb:	90                   	nop
  4069fc:	90                   	nop
  4069fd:	90                   	nop
  4069fe:	90                   	nop
  4069ff:	90                   	nop
  406a00:	90                   	nop
  406a01:	90                   	nop
  406a02:	90                   	nop
  406a03:	90                   	nop
  406a04:	90                   	nop
  406a05:	90                   	nop
  406a06:	90                   	nop
  406a07:	90                   	nop
  406a08:	90                   	nop
  406a09:	90                   	nop
  406a0a:	90                   	nop
  406a0b:	90                   	nop
  406a0c:	90                   	nop
  406a0d:	90                   	nop
  406a0e:	90                   	nop
  406a0f:	90                   	nop
  406a10:	90                   	nop
  406a11:	90                   	nop
  406a12:	90                   	nop
  406a13:	90                   	nop
  406a14:	90                   	nop
  406a15:	90                   	nop
  406a16:	90                   	nop
  406a17:	90                   	nop
  406a18:	90                   	nop
  406a19:	90                   	nop
  406a1a:	90                   	nop
  406a1b:	90                   	nop
  406a1c:	90                   	nop
  406a1d:	90                   	nop
  406a1e:	90                   	nop
  406a1f:	90                   	nop
  406a20:	90                   	nop
  406a21:	90                   	nop
  406a22:	90                   	nop
  406a23:	90                   	nop
  406a24:	90                   	nop
  406a25:	90                   	nop
  406a26:	90                   	nop
  406a27:	90                   	nop
  406a28:	90                   	nop
  406a29:	90                   	nop
  406a2a:	90                   	nop
  406a2b:	90                   	nop
  406a2c:	90                   	nop
  406a2d:	90                   	nop
  406a2e:	90                   	nop
  406a2f:	90                   	nop
  406a30:	90                   	nop
  406a31:	90                   	nop
  406a32:	90                   	nop
  406a33:	90                   	nop
  406a34:	90                   	nop
  406a35:	90                   	nop
  406a36:	90                   	nop
  406a37:	90                   	nop
  406a38:	90                   	nop
  406a39:	90                   	nop
  406a3a:	90                   	nop
  406a3b:	90                   	nop
  406a3c:	90                   	nop
  406a3d:	90                   	nop
  406a3e:	90                   	nop
  406a3f:	90                   	nop
  406a40:	90                   	nop
  406a41:	90                   	nop
  406a42:	90                   	nop
  406a43:	90                   	nop
  406a44:	90                   	nop
  406a45:	90                   	nop
  406a46:	90                   	nop
  406a47:	90                   	nop
  406a48:	90                   	nop
  406a49:	90                   	nop
  406a4a:	90                   	nop
  406a4b:	90                   	nop
  406a4c:	90                   	nop
  406a4d:	90                   	nop
  406a4e:	90                   	nop
  406a4f:	90                   	nop
  406a50:	90                   	nop
  406a51:	90                   	nop
  406a52:	90                   	nop
  406a53:	90                   	nop
  406a54:	90                   	nop
  406a55:	90                   	nop
  406a56:	90                   	nop
  406a57:	90                   	nop
  406a58:	90                   	nop
  406a59:	90                   	nop
  406a5a:	90                   	nop
  406a5b:	90                   	nop
  406a5c:	90                   	nop
  406a5d:	90                   	nop
  406a5e:	90                   	nop
  406a5f:	90                   	nop
  406a60:	90                   	nop
  406a61:	90                   	nop
  406a62:	90                   	nop
  406a63:	90                   	nop
  406a64:	90                   	nop
  406a65:	90                   	nop
  406a66:	90                   	nop
  406a67:	90                   	nop
  406a68:	90                   	nop
  406a69:	90                   	nop
  406a6a:	90                   	nop
  406a6b:	90                   	nop
  406a6c:	90                   	nop
  406a6d:	90                   	nop
  406a6e:	90                   	nop
  406a6f:	90                   	nop
  406a70:	90                   	nop
  406a71:	90                   	nop
  406a72:	90                   	nop
  406a73:	90                   	nop
  406a74:	90                   	nop
  406a75:	90                   	nop
  406a76:	90                   	nop
  406a77:	90                   	nop
  406a78:	90                   	nop
  406a79:	90                   	nop
  406a7a:	90                   	nop
  406a7b:	90                   	nop
  406a7c:	90                   	nop
  406a7d:	90                   	nop
  406a7e:	90                   	nop
  406a7f:	90                   	nop
  406a80:	90                   	nop
  406a81:	90                   	nop
  406a82:	90                   	nop
  406a83:	90                   	nop
  406a84:	90                   	nop
  406a85:	90                   	nop
  406a86:	90                   	nop
  406a87:	90                   	nop
  406a88:	90                   	nop
  406a89:	90                   	nop
  406a8a:	90                   	nop
  406a8b:	90                   	nop
  406a8c:	90                   	nop
  406a8d:	90                   	nop
  406a8e:	90                   	nop
  406a8f:	90                   	nop
  406a90:	90                   	nop
  406a91:	90                   	nop
  406a92:	90                   	nop
  406a93:	90                   	nop
  406a94:	90                   	nop
  406a95:	90                   	nop
  406a96:	90                   	nop
  406a97:	90                   	nop
  406a98:	90                   	nop
  406a99:	90                   	nop
  406a9a:	90                   	nop
  406a9b:	90                   	nop
  406a9c:	90                   	nop
  406a9d:	90                   	nop
  406a9e:	90                   	nop
  406a9f:	90                   	nop
  406aa0:	90                   	nop
  406aa1:	90                   	nop
  406aa2:	90                   	nop
  406aa3:	90                   	nop
  406aa4:	90                   	nop
  406aa5:	90                   	nop
  406aa6:	90                   	nop
  406aa7:	90                   	nop
  406aa8:	90                   	nop
  406aa9:	90                   	nop
  406aaa:	90                   	nop
  406aab:	90                   	nop
  406aac:	90                   	nop
  406aad:	90                   	nop
  406aae:	90                   	nop
  406aaf:	90                   	nop
  406ab0:	90                   	nop
  406ab1:	90                   	nop
  406ab2:	90                   	nop
  406ab3:	90                   	nop
  406ab4:	90                   	nop
  406ab5:	90                   	nop
  406ab6:	90                   	nop
  406ab7:	90                   	nop
  406ab8:	90                   	nop
  406ab9:	90                   	nop
  406aba:	90                   	nop
  406abb:	90                   	nop
  406abc:	90                   	nop
  406abd:	90                   	nop
  406abe:	90                   	nop
  406abf:	90                   	nop
  406ac0:	90                   	nop
  406ac1:	90                   	nop
  406ac2:	90                   	nop
  406ac3:	90                   	nop
  406ac4:	90                   	nop
  406ac5:	90                   	nop
  406ac6:	90                   	nop
  406ac7:	90                   	nop
  406ac8:	90                   	nop
  406ac9:	90                   	nop
  406aca:	90                   	nop
  406acb:	90                   	nop
  406acc:	90                   	nop
  406acd:	90                   	nop
  406ace:	90                   	nop
  406acf:	90                   	nop
  406ad0:	90                   	nop
  406ad1:	90                   	nop
  406ad2:	90                   	nop
  406ad3:	90                   	nop
  406ad4:	90                   	nop
  406ad5:	90                   	nop
  406ad6:	90                   	nop
  406ad7:	90                   	nop
  406ad8:	90                   	nop
  406ad9:	90                   	nop
  406ada:	90                   	nop
  406adb:	90                   	nop
  406adc:	90                   	nop
  406add:	90                   	nop
  406ade:	90                   	nop
  406adf:	90                   	nop
  406ae0:	90                   	nop
  406ae1:	90                   	nop
  406ae2:	90                   	nop
  406ae3:	90                   	nop
  406ae4:	90                   	nop
  406ae5:	90                   	nop
  406ae6:	90                   	nop
  406ae7:	90                   	nop
  406ae8:	90                   	nop
  406ae9:	90                   	nop
  406aea:	90                   	nop
  406aeb:	90                   	nop
  406aec:	90                   	nop
  406aed:	90                   	nop
  406aee:	90                   	nop
  406aef:	90                   	nop
  406af0:	90                   	nop
  406af1:	90                   	nop
  406af2:	90                   	nop
  406af3:	90                   	nop
  406af4:	90                   	nop
  406af5:	90                   	nop
  406af6:	90                   	nop
  406af7:	90                   	nop
  406af8:	90                   	nop
  406af9:	90                   	nop
  406afa:	90                   	nop
  406afb:	90                   	nop
  406afc:	90                   	nop
  406afd:	90                   	nop
  406afe:	90                   	nop
  406aff:	90                   	nop
  406b00:	90                   	nop
  406b01:	90                   	nop
  406b02:	90                   	nop
  406b03:	90                   	nop
  406b04:	90                   	nop
  406b05:	90                   	nop
  406b06:	90                   	nop
  406b07:	90                   	nop
  406b08:	90                   	nop
  406b09:	90                   	nop
  406b0a:	90                   	nop
  406b0b:	90                   	nop
  406b0c:	90                   	nop
  406b0d:	90                   	nop
  406b0e:	90                   	nop
  406b0f:	90                   	nop
  406b10:	90                   	nop
  406b11:	90                   	nop
  406b12:	90                   	nop
  406b13:	90                   	nop
  406b14:	90                   	nop
  406b15:	90                   	nop
  406b16:	90                   	nop
  406b17:	90                   	nop
  406b18:	90                   	nop
  406b19:	90                   	nop
  406b1a:	90                   	nop
  406b1b:	90                   	nop
  406b1c:	90                   	nop
  406b1d:	90                   	nop
  406b1e:	90                   	nop
  406b1f:	90                   	nop
  406b20:	90                   	nop
  406b21:	90                   	nop
  406b22:	90                   	nop
  406b23:	90                   	nop
  406b24:	90                   	nop
  406b25:	90                   	nop
  406b26:	90                   	nop
  406b27:	90                   	nop
  406b28:	90                   	nop
  406b29:	90                   	nop
  406b2a:	90                   	nop
  406b2b:	90                   	nop
  406b2c:	90                   	nop
  406b2d:	90                   	nop
  406b2e:	90                   	nop
  406b2f:	90                   	nop
  406b30:	90                   	nop
  406b31:	90                   	nop
  406b32:	90                   	nop
  406b33:	90                   	nop
  406b34:	90                   	nop
  406b35:	90                   	nop
  406b36:	90                   	nop
  406b37:	90                   	nop
  406b38:	90                   	nop
  406b39:	90                   	nop
  406b3a:	90                   	nop
  406b3b:	90                   	nop
  406b3c:	90                   	nop
  406b3d:	90                   	nop
  406b3e:	90                   	nop
  406b3f:	90                   	nop
  406b40:	90                   	nop
  406b41:	90                   	nop
  406b42:	90                   	nop
  406b43:	90                   	nop
  406b44:	90                   	nop
  406b45:	90                   	nop
  406b46:	90                   	nop
  406b47:	90                   	nop
  406b48:	90                   	nop
  406b49:	90                   	nop
  406b4a:	90                   	nop
  406b4b:	90                   	nop
  406b4c:	90                   	nop
  406b4d:	90                   	nop
  406b4e:	90                   	nop
  406b4f:	90                   	nop
  406b50:	90                   	nop
  406b51:	90                   	nop
  406b52:	90                   	nop
  406b53:	90                   	nop
  406b54:	90                   	nop
  406b55:	90                   	nop
  406b56:	90                   	nop
  406b57:	90                   	nop
  406b58:	90                   	nop
  406b59:	90                   	nop
  406b5a:	90                   	nop
  406b5b:	90                   	nop
  406b5c:	90                   	nop
  406b5d:	90                   	nop
  406b5e:	90                   	nop
  406b5f:	90                   	nop
  406b60:	90                   	nop
  406b61:	90                   	nop
  406b62:	90                   	nop
  406b63:	90                   	nop
  406b64:	90                   	nop
  406b65:	90                   	nop
  406b66:	90                   	nop
  406b67:	90                   	nop
  406b68:	90                   	nop
  406b69:	90                   	nop
  406b6a:	90                   	nop
  406b6b:	90                   	nop
  406b6c:	90                   	nop
  406b6d:	90                   	nop
  406b6e:	90                   	nop
  406b6f:	90                   	nop
  406b70:	90                   	nop
  406b71:	90                   	nop
  406b72:	90                   	nop
  406b73:	90                   	nop
  406b74:	90                   	nop
  406b75:	90                   	nop
  406b76:	90                   	nop
  406b77:	90                   	nop
  406b78:	90                   	nop
  406b79:	90                   	nop
  406b7a:	90                   	nop
  406b7b:	90                   	nop
  406b7c:	90                   	nop
  406b7d:	90                   	nop
  406b7e:	90                   	nop
  406b7f:	90                   	nop
  406b80:	90                   	nop
  406b81:	90                   	nop
  406b82:	90                   	nop
  406b83:	90                   	nop
  406b84:	90                   	nop
  406b85:	90                   	nop
  406b86:	90                   	nop
  406b87:	90                   	nop
  406b88:	90                   	nop
  406b89:	90                   	nop
  406b8a:	90                   	nop
  406b8b:	90                   	nop
  406b8c:	90                   	nop
  406b8d:	90                   	nop
  406b8e:	90                   	nop
  406b8f:	90                   	nop
  406b90:	90                   	nop
  406b91:	90                   	nop
  406b92:	90                   	nop
  406b93:	90                   	nop
  406b94:	90                   	nop
  406b95:	90                   	nop
  406b96:	90                   	nop
  406b97:	90                   	nop
  406b98:	90                   	nop
  406b99:	90                   	nop
  406b9a:	90                   	nop
  406b9b:	90                   	nop
  406b9c:	90                   	nop
  406b9d:	90                   	nop
  406b9e:	90                   	nop
  406b9f:	90                   	nop
  406ba0:	90                   	nop
  406ba1:	90                   	nop
  406ba2:	90                   	nop
  406ba3:	90                   	nop
  406ba4:	90                   	nop
  406ba5:	90                   	nop
  406ba6:	90                   	nop
  406ba7:	90                   	nop
  406ba8:	90                   	nop
  406ba9:	90                   	nop
  406baa:	90                   	nop
  406bab:	90                   	nop
  406bac:	90                   	nop
  406bad:	90                   	nop
  406bae:	90                   	nop
  406baf:	90                   	nop
  406bb0:	90                   	nop
  406bb1:	90                   	nop
  406bb2:	90                   	nop
  406bb3:	90                   	nop
  406bb4:	90                   	nop
  406bb5:	90                   	nop
  406bb6:	90                   	nop
  406bb7:	90                   	nop
  406bb8:	90                   	nop
  406bb9:	90                   	nop
  406bba:	90                   	nop
  406bbb:	90                   	nop
  406bbc:	90                   	nop
  406bbd:	90                   	nop
  406bbe:	90                   	nop
  406bbf:	90                   	nop
  406bc0:	90                   	nop
  406bc1:	90                   	nop
  406bc2:	90                   	nop
  406bc3:	90                   	nop
  406bc4:	90                   	nop
  406bc5:	90                   	nop
  406bc6:	90                   	nop
  406bc7:	90                   	nop
  406bc8:	90                   	nop
  406bc9:	90                   	nop
  406bca:	90                   	nop
  406bcb:	90                   	nop
  406bcc:	90                   	nop
  406bcd:	90                   	nop
  406bce:	90                   	nop
  406bcf:	90                   	nop
  406bd0:	90                   	nop
  406bd1:	90                   	nop
  406bd2:	90                   	nop
  406bd3:	90                   	nop
  406bd4:	90                   	nop
  406bd5:	90                   	nop
  406bd6:	90                   	nop
  406bd7:	90                   	nop
  406bd8:	90                   	nop
  406bd9:	90                   	nop
  406bda:	90                   	nop
  406bdb:	90                   	nop
  406bdc:	90                   	nop
  406bdd:	90                   	nop
  406bde:	90                   	nop
  406bdf:	90                   	nop
  406be0:	90                   	nop
  406be1:	90                   	nop
  406be2:	90                   	nop
  406be3:	90                   	nop
  406be4:	90                   	nop
  406be5:	90                   	nop
  406be6:	90                   	nop
  406be7:	90                   	nop
  406be8:	90                   	nop
  406be9:	90                   	nop
  406bea:	90                   	nop
  406beb:	90                   	nop
  406bec:	90                   	nop
  406bed:	90                   	nop
  406bee:	90                   	nop
  406bef:	90                   	nop
  406bf0:	90                   	nop
  406bf1:	90                   	nop
  406bf2:	90                   	nop
  406bf3:	90                   	nop
  406bf4:	90                   	nop
  406bf5:	90                   	nop
  406bf6:	90                   	nop
  406bf7:	90                   	nop
  406bf8:	90                   	nop
  406bf9:	90                   	nop
  406bfa:	90                   	nop
  406bfb:	90                   	nop
  406bfc:	90                   	nop
  406bfd:	90                   	nop
  406bfe:	90                   	nop
  406bff:	90                   	nop
  406c00:	90                   	nop
  406c01:	90                   	nop
  406c02:	90                   	nop
  406c03:	90                   	nop
  406c04:	90                   	nop
  406c05:	90                   	nop
  406c06:	90                   	nop
  406c07:	90                   	nop
  406c08:	90                   	nop
  406c09:	90                   	nop
  406c0a:	90                   	nop
  406c0b:	90                   	nop
  406c0c:	90                   	nop
  406c0d:	90                   	nop
  406c0e:	90                   	nop
  406c0f:	90                   	nop
  406c10:	90                   	nop
  406c11:	90                   	nop
  406c12:	90                   	nop
  406c13:	90                   	nop
  406c14:	90                   	nop
  406c15:	90                   	nop
  406c16:	90                   	nop
  406c17:	90                   	nop
  406c18:	90                   	nop
  406c19:	90                   	nop
  406c1a:	90                   	nop
  406c1b:	90                   	nop
  406c1c:	90                   	nop
  406c1d:	90                   	nop
  406c1e:	90                   	nop
  406c1f:	90                   	nop
  406c20:	90                   	nop
  406c21:	90                   	nop
  406c22:	90                   	nop
  406c23:	90                   	nop
  406c24:	90                   	nop
  406c25:	90                   	nop
  406c26:	90                   	nop
  406c27:	90                   	nop
  406c28:	90                   	nop
  406c29:	90                   	nop
  406c2a:	90                   	nop
  406c2b:	90                   	nop
  406c2c:	90                   	nop
  406c2d:	90                   	nop
  406c2e:	90                   	nop
  406c2f:	90                   	nop
  406c30:	90                   	nop
  406c31:	90                   	nop
  406c32:	90                   	nop
  406c33:	90                   	nop
  406c34:	90                   	nop
  406c35:	90                   	nop
  406c36:	90                   	nop
  406c37:	90                   	nop
  406c38:	90                   	nop
  406c39:	90                   	nop
  406c3a:	90                   	nop
  406c3b:	90                   	nop
  406c3c:	90                   	nop
  406c3d:	90                   	nop
  406c3e:	90                   	nop
  406c3f:	90                   	nop
  406c40:	90                   	nop
  406c41:	90                   	nop
  406c42:	90                   	nop
  406c43:	90                   	nop
  406c44:	90                   	nop
  406c45:	90                   	nop
  406c46:	90                   	nop
  406c47:	90                   	nop
  406c48:	90                   	nop
  406c49:	90                   	nop
  406c4a:	90                   	nop
  406c4b:	90                   	nop
  406c4c:	90                   	nop
  406c4d:	90                   	nop
  406c4e:	90                   	nop
  406c4f:	90                   	nop
  406c50:	90                   	nop
  406c51:	90                   	nop
  406c52:	90                   	nop
  406c53:	90                   	nop
  406c54:	90                   	nop
  406c55:	90                   	nop
  406c56:	90                   	nop
  406c57:	90                   	nop
  406c58:	90                   	nop
  406c59:	90                   	nop
  406c5a:	90                   	nop
  406c5b:	90                   	nop
  406c5c:	90                   	nop
  406c5d:	90                   	nop
  406c5e:	90                   	nop
  406c5f:	90                   	nop
  406c60:	90                   	nop
  406c61:	90                   	nop
  406c62:	90                   	nop
  406c63:	90                   	nop
  406c64:	90                   	nop
  406c65:	90                   	nop
  406c66:	90                   	nop
  406c67:	90                   	nop
  406c68:	90                   	nop
  406c69:	90                   	nop
  406c6a:	90                   	nop
  406c6b:	90                   	nop
  406c6c:	90                   	nop
  406c6d:	90                   	nop
  406c6e:	90                   	nop
  406c6f:	90                   	nop
  406c70:	90                   	nop
  406c71:	90                   	nop
  406c72:	90                   	nop
  406c73:	90                   	nop
  406c74:	90                   	nop
  406c75:	90                   	nop
  406c76:	90                   	nop
  406c77:	90                   	nop
  406c78:	90                   	nop
  406c79:	90                   	nop
  406c7a:	90                   	nop
  406c7b:	90                   	nop
  406c7c:	90                   	nop
  406c7d:	90                   	nop
  406c7e:	90                   	nop
  406c7f:	90                   	nop
  406c80:	90                   	nop
  406c81:	90                   	nop
  406c82:	90                   	nop
  406c83:	90                   	nop
  406c84:	90                   	nop
  406c85:	90                   	nop
  406c86:	90                   	nop
  406c87:	90                   	nop
  406c88:	90                   	nop
  406c89:	90                   	nop
  406c8a:	90                   	nop
  406c8b:	90                   	nop
  406c8c:	90                   	nop
  406c8d:	90                   	nop
  406c8e:	90                   	nop
  406c8f:	90                   	nop
  406c90:	90                   	nop
  406c91:	90                   	nop
  406c92:	90                   	nop
  406c93:	90                   	nop
  406c94:	90                   	nop
  406c95:	90                   	nop
  406c96:	90                   	nop
  406c97:	90                   	nop
  406c98:	90                   	nop
  406c99:	90                   	nop
  406c9a:	90                   	nop
  406c9b:	90                   	nop
  406c9c:	90                   	nop
  406c9d:	90                   	nop
  406c9e:	90                   	nop
  406c9f:	90                   	nop
  406ca0:	90                   	nop
  406ca1:	90                   	nop
  406ca2:	90                   	nop
  406ca3:	90                   	nop
  406ca4:	90                   	nop
  406ca5:	90                   	nop
  406ca6:	90                   	nop
  406ca7:	90                   	nop
  406ca8:	90                   	nop
  406ca9:	90                   	nop
  406caa:	90                   	nop
  406cab:	90                   	nop
  406cac:	90                   	nop
  406cad:	90                   	nop
  406cae:	90                   	nop
  406caf:	90                   	nop
  406cb0:	90                   	nop
  406cb1:	90                   	nop
  406cb2:	90                   	nop
  406cb3:	90                   	nop
  406cb4:	90                   	nop
  406cb5:	90                   	nop
  406cb6:	90                   	nop
  406cb7:	90                   	nop
  406cb8:	90                   	nop
  406cb9:	90                   	nop
  406cba:	90                   	nop
  406cbb:	90                   	nop
  406cbc:	90                   	nop
  406cbd:	90                   	nop
  406cbe:	90                   	nop
  406cbf:	90                   	nop
  406cc0:	90                   	nop
  406cc1:	90                   	nop
  406cc2:	90                   	nop
  406cc3:	90                   	nop
  406cc4:	90                   	nop
  406cc5:	90                   	nop
  406cc6:	90                   	nop
  406cc7:	90                   	nop
  406cc8:	90                   	nop
  406cc9:	90                   	nop
  406cca:	90                   	nop
  406ccb:	90                   	nop
  406ccc:	90                   	nop
  406ccd:	90                   	nop
  406cce:	90                   	nop
  406ccf:	90                   	nop
  406cd0:	90                   	nop
  406cd1:	90                   	nop
  406cd2:	90                   	nop
  406cd3:	90                   	nop
  406cd4:	90                   	nop
  406cd5:	90                   	nop
  406cd6:	90                   	nop
  406cd7:	90                   	nop
  406cd8:	90                   	nop
  406cd9:	90                   	nop
  406cda:	90                   	nop
  406cdb:	90                   	nop
  406cdc:	90                   	nop
  406cdd:	90                   	nop
  406cde:	90                   	nop
  406cdf:	90                   	nop
  406ce0:	90                   	nop
  406ce1:	90                   	nop
  406ce2:	90                   	nop
  406ce3:	90                   	nop
  406ce4:	90                   	nop
  406ce5:	90                   	nop
  406ce6:	90                   	nop
  406ce7:	90                   	nop
  406ce8:	90                   	nop
  406ce9:	90                   	nop
  406cea:	90                   	nop
  406ceb:	90                   	nop
  406cec:	90                   	nop
  406ced:	90                   	nop
  406cee:	90                   	nop
  406cef:	90                   	nop
  406cf0:	90                   	nop
  406cf1:	90                   	nop
  406cf2:	90                   	nop
  406cf3:	90                   	nop
  406cf4:	90                   	nop
  406cf5:	90                   	nop
  406cf6:	90                   	nop
  406cf7:	90                   	nop
  406cf8:	90                   	nop
  406cf9:	90                   	nop
  406cfa:	90                   	nop
  406cfb:	90                   	nop
  406cfc:	90                   	nop
  406cfd:	90                   	nop
  406cfe:	90                   	nop
  406cff:	90                   	nop
  406d00:	90                   	nop
  406d01:	90                   	nop
  406d02:	90                   	nop
  406d03:	90                   	nop
  406d04:	90                   	nop
  406d05:	90                   	nop
  406d06:	90                   	nop
  406d07:	90                   	nop
  406d08:	90                   	nop
  406d09:	90                   	nop
  406d0a:	90                   	nop
  406d0b:	90                   	nop
  406d0c:	90                   	nop
  406d0d:	90                   	nop
  406d0e:	90                   	nop
  406d0f:	90                   	nop
  406d10:	90                   	nop
  406d11:	90                   	nop
  406d12:	90                   	nop
  406d13:	90                   	nop
  406d14:	90                   	nop
  406d15:	90                   	nop
  406d16:	90                   	nop
  406d17:	90                   	nop
  406d18:	90                   	nop
  406d19:	90                   	nop
  406d1a:	90                   	nop
  406d1b:	90                   	nop
  406d1c:	90                   	nop
  406d1d:	90                   	nop
  406d1e:	90                   	nop
  406d1f:	90                   	nop
  406d20:	90                   	nop
  406d21:	90                   	nop
  406d22:	90                   	nop
  406d23:	90                   	nop
  406d24:	90                   	nop
  406d25:	90                   	nop
  406d26:	90                   	nop
  406d27:	90                   	nop
  406d28:	90                   	nop
  406d29:	90                   	nop
  406d2a:	90                   	nop
  406d2b:	90                   	nop
  406d2c:	90                   	nop
  406d2d:	90                   	nop
  406d2e:	90                   	nop
  406d2f:	90                   	nop
  406d30:	90                   	nop
  406d31:	90                   	nop
  406d32:	90                   	nop
  406d33:	90                   	nop
  406d34:	90                   	nop
  406d35:	90                   	nop
  406d36:	90                   	nop
  406d37:	90                   	nop
  406d38:	90                   	nop
  406d39:	90                   	nop
  406d3a:	90                   	nop
  406d3b:	90                   	nop
  406d3c:	90                   	nop
  406d3d:	90                   	nop
  406d3e:	90                   	nop
  406d3f:	90                   	nop
  406d40:	90                   	nop
  406d41:	90                   	nop
  406d42:	90                   	nop
  406d43:	90                   	nop
  406d44:	90                   	nop
  406d45:	90                   	nop
  406d46:	90                   	nop
  406d47:	90                   	nop
  406d48:	90                   	nop
  406d49:	90                   	nop
  406d4a:	90                   	nop
  406d4b:	90                   	nop
  406d4c:	90                   	nop
  406d4d:	90                   	nop
  406d4e:	90                   	nop
  406d4f:	90                   	nop
  406d50:	90                   	nop
  406d51:	90                   	nop
  406d52:	90                   	nop
  406d53:	90                   	nop
  406d54:	90                   	nop
  406d55:	90                   	nop
  406d56:	90                   	nop
  406d57:	90                   	nop
  406d58:	90                   	nop
  406d59:	90                   	nop
  406d5a:	90                   	nop
  406d5b:	90                   	nop
  406d5c:	90                   	nop
  406d5d:	90                   	nop
  406d5e:	90                   	nop
  406d5f:	90                   	nop
  406d60:	90                   	nop
  406d61:	90                   	nop
  406d62:	90                   	nop
  406d63:	90                   	nop
  406d64:	90                   	nop
  406d65:	90                   	nop
  406d66:	90                   	nop
  406d67:	90                   	nop
  406d68:	90                   	nop
  406d69:	90                   	nop
  406d6a:	90                   	nop
  406d6b:	90                   	nop
  406d6c:	90                   	nop
  406d6d:	90                   	nop
  406d6e:	90                   	nop
  406d6f:	90                   	nop
  406d70:	90                   	nop
  406d71:	90                   	nop
  406d72:	90                   	nop
  406d73:	90                   	nop
  406d74:	90                   	nop
  406d75:	90                   	nop
  406d76:	90                   	nop
  406d77:	90                   	nop
  406d78:	90                   	nop
  406d79:	90                   	nop
  406d7a:	90                   	nop
  406d7b:	90                   	nop
  406d7c:	90                   	nop
  406d7d:	90                   	nop
  406d7e:	90                   	nop
  406d7f:	90                   	nop
  406d80:	90                   	nop
  406d81:	90                   	nop
  406d82:	90                   	nop
  406d83:	90                   	nop
  406d84:	90                   	nop
  406d85:	90                   	nop
  406d86:	90                   	nop
  406d87:	90                   	nop
  406d88:	90                   	nop
  406d89:	90                   	nop
  406d8a:	90                   	nop
  406d8b:	90                   	nop
  406d8c:	90                   	nop
  406d8d:	90                   	nop
  406d8e:	90                   	nop
  406d8f:	90                   	nop
  406d90:	90                   	nop
  406d91:	90                   	nop
  406d92:	90                   	nop
  406d93:	90                   	nop
  406d94:	90                   	nop
  406d95:	90                   	nop
  406d96:	90                   	nop
  406d97:	90                   	nop
  406d98:	90                   	nop
  406d99:	90                   	nop
  406d9a:	90                   	nop
  406d9b:	90                   	nop
  406d9c:	90                   	nop
  406d9d:	90                   	nop
  406d9e:	90                   	nop
  406d9f:	90                   	nop
  406da0:	90                   	nop
  406da1:	90                   	nop
  406da2:	90                   	nop
  406da3:	90                   	nop
  406da4:	90                   	nop
  406da5:	90                   	nop
  406da6:	90                   	nop
  406da7:	90                   	nop
  406da8:	90                   	nop
  406da9:	90                   	nop
  406daa:	90                   	nop
  406dab:	90                   	nop
  406dac:	90                   	nop
  406dad:	90                   	nop
  406dae:	90                   	nop
  406daf:	90                   	nop
  406db0:	90                   	nop
  406db1:	90                   	nop
  406db2:	90                   	nop
  406db3:	90                   	nop
  406db4:	90                   	nop
  406db5:	90                   	nop
  406db6:	90                   	nop
  406db7:	90                   	nop
  406db8:	90                   	nop
  406db9:	90                   	nop
  406dba:	90                   	nop
  406dbb:	90                   	nop
  406dbc:	90                   	nop
  406dbd:	90                   	nop
  406dbe:	90                   	nop
  406dbf:	90                   	nop
  406dc0:	90                   	nop
  406dc1:	90                   	nop
  406dc2:	90                   	nop
  406dc3:	90                   	nop
  406dc4:	90                   	nop
  406dc5:	90                   	nop
  406dc6:	90                   	nop
  406dc7:	90                   	nop
  406dc8:	90                   	nop
  406dc9:	90                   	nop
  406dca:	90                   	nop
  406dcb:	90                   	nop
  406dcc:	90                   	nop
  406dcd:	90                   	nop
  406dce:	90                   	nop
  406dcf:	90                   	nop
  406dd0:	90                   	nop
  406dd1:	90                   	nop
  406dd2:	90                   	nop
  406dd3:	90                   	nop
  406dd4:	90                   	nop
  406dd5:	90                   	nop
  406dd6:	90                   	nop
  406dd7:	90                   	nop
  406dd8:	90                   	nop
  406dd9:	90                   	nop
  406dda:	90                   	nop
  406ddb:	90                   	nop
  406ddc:	90                   	nop
  406ddd:	90                   	nop
  406dde:	90                   	nop
  406ddf:	90                   	nop
  406de0:	90                   	nop
  406de1:	90                   	nop
  406de2:	90                   	nop
  406de3:	90                   	nop
  406de4:	90                   	nop
  406de5:	90                   	nop
  406de6:	90                   	nop
  406de7:	90                   	nop
  406de8:	90                   	nop
  406de9:	90                   	nop
  406dea:	90                   	nop
  406deb:	90                   	nop
  406dec:	90                   	nop
  406ded:	90                   	nop
  406dee:	90                   	nop
  406def:	90                   	nop
  406df0:	90                   	nop
  406df1:	90                   	nop
  406df2:	90                   	nop
  406df3:	90                   	nop
  406df4:	90                   	nop
  406df5:	90                   	nop
  406df6:	90                   	nop
  406df7:	90                   	nop
  406df8:	90                   	nop
  406df9:	90                   	nop
  406dfa:	90                   	nop
  406dfb:	90                   	nop
  406dfc:	90                   	nop
  406dfd:	90                   	nop
  406dfe:	90                   	nop
  406dff:	90                   	nop
  406e00:	90                   	nop
  406e01:	90                   	nop
  406e02:	90                   	nop
  406e03:	90                   	nop
  406e04:	90                   	nop
  406e05:	90                   	nop
  406e06:	90                   	nop
  406e07:	90                   	nop
  406e08:	90                   	nop
  406e09:	90                   	nop
  406e0a:	90                   	nop
  406e0b:	90                   	nop
  406e0c:	90                   	nop
  406e0d:	90                   	nop
  406e0e:	90                   	nop
  406e0f:	90                   	nop
  406e10:	90                   	nop
  406e11:	90                   	nop
  406e12:	90                   	nop
  406e13:	90                   	nop
  406e14:	90                   	nop
  406e15:	90                   	nop
  406e16:	90                   	nop
  406e17:	90                   	nop
  406e18:	90                   	nop
  406e19:	90                   	nop
  406e1a:	90                   	nop
  406e1b:	90                   	nop
  406e1c:	90                   	nop
  406e1d:	90                   	nop
  406e1e:	90                   	nop
  406e1f:	90                   	nop
  406e20:	90                   	nop
  406e21:	90                   	nop
  406e22:	90                   	nop
  406e23:	90                   	nop
  406e24:	90                   	nop
  406e25:	90                   	nop
  406e26:	90                   	nop
  406e27:	90                   	nop
  406e28:	90                   	nop
  406e29:	90                   	nop
  406e2a:	90                   	nop
  406e2b:	90                   	nop
  406e2c:	90                   	nop
  406e2d:	90                   	nop
  406e2e:	90                   	nop
  406e2f:	90                   	nop
  406e30:	90                   	nop
  406e31:	90                   	nop
  406e32:	90                   	nop
  406e33:	90                   	nop
  406e34:	90                   	nop
  406e35:	90                   	nop
  406e36:	90                   	nop
  406e37:	90                   	nop
  406e38:	90                   	nop
  406e39:	90                   	nop
  406e3a:	90                   	nop
  406e3b:	90                   	nop
  406e3c:	90                   	nop
  406e3d:	90                   	nop
  406e3e:	90                   	nop
  406e3f:	90                   	nop
  406e40:	90                   	nop
  406e41:	90                   	nop
  406e42:	90                   	nop
  406e43:	90                   	nop
  406e44:	90                   	nop
  406e45:	90                   	nop
  406e46:	90                   	nop
  406e47:	90                   	nop
  406e48:	90                   	nop
  406e49:	90                   	nop
  406e4a:	90                   	nop
  406e4b:	90                   	nop
  406e4c:	90                   	nop
  406e4d:	90                   	nop
  406e4e:	90                   	nop
  406e4f:	90                   	nop
  406e50:	90                   	nop
  406e51:	90                   	nop
  406e52:	90                   	nop
  406e53:	90                   	nop
  406e54:	90                   	nop
  406e55:	90                   	nop
  406e56:	90                   	nop
  406e57:	90                   	nop
  406e58:	90                   	nop
  406e59:	90                   	nop
  406e5a:	90                   	nop
  406e5b:	90                   	nop
  406e5c:	90                   	nop
  406e5d:	90                   	nop
  406e5e:	90                   	nop
  406e5f:	90                   	nop
  406e60:	90                   	nop
  406e61:	90                   	nop
  406e62:	90                   	nop
  406e63:	90                   	nop
  406e64:	90                   	nop
  406e65:	90                   	nop
  406e66:	90                   	nop
  406e67:	90                   	nop
  406e68:	90                   	nop
  406e69:	90                   	nop
  406e6a:	90                   	nop
  406e6b:	90                   	nop
  406e6c:	90                   	nop
  406e6d:	90                   	nop
  406e6e:	90                   	nop
  406e6f:	90                   	nop
  406e70:	90                   	nop
  406e71:	90                   	nop
  406e72:	90                   	nop
  406e73:	90                   	nop
  406e74:	90                   	nop
  406e75:	90                   	nop
  406e76:	90                   	nop
  406e77:	90                   	nop
  406e78:	90                   	nop
  406e79:	90                   	nop
  406e7a:	90                   	nop
  406e7b:	90                   	nop
  406e7c:	90                   	nop
  406e7d:	90                   	nop
  406e7e:	90                   	nop
  406e7f:	90                   	nop
  406e80:	90                   	nop
  406e81:	90                   	nop
  406e82:	90                   	nop
  406e83:	90                   	nop
  406e84:	90                   	nop
  406e85:	90                   	nop
  406e86:	90                   	nop
  406e87:	90                   	nop
  406e88:	90                   	nop
  406e89:	90                   	nop
  406e8a:	90                   	nop
  406e8b:	90                   	nop
  406e8c:	90                   	nop
  406e8d:	90                   	nop
  406e8e:	90                   	nop
  406e8f:	90                   	nop
  406e90:	90                   	nop
  406e91:	90                   	nop
  406e92:	90                   	nop
  406e93:	90                   	nop
  406e94:	90                   	nop
  406e95:	90                   	nop
  406e96:	90                   	nop
  406e97:	90                   	nop
  406e98:	90                   	nop
  406e99:	90                   	nop
  406e9a:	90                   	nop
  406e9b:	90                   	nop
  406e9c:	90                   	nop
  406e9d:	90                   	nop
  406e9e:	90                   	nop
  406e9f:	90                   	nop
  406ea0:	90                   	nop
  406ea1:	90                   	nop
  406ea2:	90                   	nop
  406ea3:	90                   	nop
  406ea4:	90                   	nop
  406ea5:	90                   	nop
  406ea6:	90                   	nop
  406ea7:	90                   	nop
  406ea8:	90                   	nop
  406ea9:	90                   	nop
  406eaa:	90                   	nop
  406eab:	90                   	nop
  406eac:	90                   	nop
  406ead:	90                   	nop
  406eae:	90                   	nop
  406eaf:	90                   	nop
  406eb0:	90                   	nop
  406eb1:	90                   	nop
  406eb2:	90                   	nop
  406eb3:	90                   	nop
  406eb4:	90                   	nop
  406eb5:	90                   	nop
  406eb6:	90                   	nop
  406eb7:	90                   	nop
  406eb8:	90                   	nop
  406eb9:	90                   	nop
  406eba:	90                   	nop
  406ebb:	90                   	nop
  406ebc:	90                   	nop
  406ebd:	90                   	nop
  406ebe:	90                   	nop
  406ebf:	90                   	nop
  406ec0:	90                   	nop
  406ec1:	90                   	nop
  406ec2:	90                   	nop
  406ec3:	90                   	nop
  406ec4:	90                   	nop
  406ec5:	90                   	nop
  406ec6:	90                   	nop
  406ec7:	90                   	nop
  406ec8:	90                   	nop
  406ec9:	90                   	nop
  406eca:	90                   	nop
  406ecb:	90                   	nop
  406ecc:	90                   	nop
  406ecd:	90                   	nop
  406ece:	90                   	nop
  406ecf:	90                   	nop
  406ed0:	90                   	nop
  406ed1:	90                   	nop
  406ed2:	90                   	nop
  406ed3:	90                   	nop
  406ed4:	90                   	nop
  406ed5:	90                   	nop
  406ed6:	90                   	nop
  406ed7:	90                   	nop
  406ed8:	90                   	nop
  406ed9:	90                   	nop
  406eda:	90                   	nop
  406edb:	90                   	nop
  406edc:	90                   	nop
  406edd:	90                   	nop
  406ede:	90                   	nop
  406edf:	90                   	nop
  406ee0:	90                   	nop
  406ee1:	90                   	nop
  406ee2:	90                   	nop
  406ee3:	90                   	nop
  406ee4:	90                   	nop
  406ee5:	90                   	nop
  406ee6:	90                   	nop
  406ee7:	90                   	nop
  406ee8:	90                   	nop
  406ee9:	90                   	nop
  406eea:	90                   	nop
  406eeb:	90                   	nop
  406eec:	90                   	nop
  406eed:	90                   	nop
  406eee:	90                   	nop
  406eef:	90                   	nop
  406ef0:	90                   	nop
  406ef1:	90                   	nop
  406ef2:	90                   	nop
  406ef3:	90                   	nop
  406ef4:	90                   	nop
  406ef5:	90                   	nop
  406ef6:	90                   	nop
  406ef7:	90                   	nop
  406ef8:	90                   	nop
  406ef9:	90                   	nop
  406efa:	90                   	nop
  406efb:	90                   	nop
  406efc:	90                   	nop
  406efd:	90                   	nop
  406efe:	90                   	nop
  406eff:	90                   	nop
  406f00:	90                   	nop
  406f01:	90                   	nop
  406f02:	90                   	nop
  406f03:	90                   	nop
  406f04:	90                   	nop
  406f05:	90                   	nop
  406f06:	90                   	nop
  406f07:	90                   	nop
  406f08:	90                   	nop
  406f09:	90                   	nop
  406f0a:	90                   	nop
  406f0b:	90                   	nop
  406f0c:	90                   	nop
  406f0d:	90                   	nop
  406f0e:	90                   	nop
  406f0f:	90                   	nop
  406f10:	90                   	nop
  406f11:	90                   	nop
  406f12:	90                   	nop
  406f13:	90                   	nop
  406f14:	90                   	nop
  406f15:	90                   	nop
  406f16:	90                   	nop
  406f17:	90                   	nop
  406f18:	90                   	nop
  406f19:	90                   	nop
  406f1a:	90                   	nop
  406f1b:	90                   	nop
  406f1c:	90                   	nop
  406f1d:	90                   	nop
  406f1e:	90                   	nop
  406f1f:	90                   	nop
  406f20:	90                   	nop
  406f21:	90                   	nop
  406f22:	90                   	nop
  406f23:	90                   	nop
  406f24:	90                   	nop
  406f25:	90                   	nop
  406f26:	90                   	nop
  406f27:	90                   	nop
  406f28:	90                   	nop
  406f29:	90                   	nop
  406f2a:	90                   	nop
  406f2b:	90                   	nop
  406f2c:	90                   	nop
  406f2d:	90                   	nop
  406f2e:	90                   	nop
  406f2f:	90                   	nop
  406f30:	90                   	nop
  406f31:	90                   	nop
  406f32:	90                   	nop
  406f33:	90                   	nop
  406f34:	90                   	nop
  406f35:	90                   	nop
  406f36:	90                   	nop
  406f37:	90                   	nop
  406f38:	90                   	nop
  406f39:	90                   	nop
  406f3a:	90                   	nop
  406f3b:	90                   	nop
  406f3c:	90                   	nop
  406f3d:	90                   	nop
  406f3e:	90                   	nop
  406f3f:	90                   	nop
  406f40:	90                   	nop
  406f41:	90                   	nop
  406f42:	90                   	nop
  406f43:	90                   	nop
  406f44:	90                   	nop
  406f45:	90                   	nop
  406f46:	90                   	nop
  406f47:	90                   	nop
  406f48:	90                   	nop
  406f49:	90                   	nop
  406f4a:	90                   	nop
  406f4b:	90                   	nop
  406f4c:	90                   	nop
  406f4d:	90                   	nop
  406f4e:	90                   	nop
  406f4f:	90                   	nop
  406f50:	90                   	nop
  406f51:	90                   	nop
  406f52:	90                   	nop
  406f53:	90                   	nop
  406f54:	90                   	nop
  406f55:	90                   	nop
  406f56:	90                   	nop
  406f57:	90                   	nop
  406f58:	90                   	nop
  406f59:	90                   	nop
  406f5a:	90                   	nop
  406f5b:	90                   	nop
  406f5c:	90                   	nop
  406f5d:	90                   	nop
  406f5e:	90                   	nop
  406f5f:	90                   	nop
  406f60:	90                   	nop
  406f61:	90                   	nop
  406f62:	90                   	nop
  406f63:	90                   	nop
  406f64:	90                   	nop
  406f65:	90                   	nop
  406f66:	90                   	nop
  406f67:	90                   	nop
  406f68:	90                   	nop
  406f69:	90                   	nop
  406f6a:	90                   	nop
  406f6b:	90                   	nop
  406f6c:	90                   	nop
  406f6d:	90                   	nop
  406f6e:	90                   	nop
  406f6f:	90                   	nop
  406f70:	90                   	nop
  406f71:	90                   	nop
  406f72:	90                   	nop
  406f73:	90                   	nop
  406f74:	90                   	nop
  406f75:	90                   	nop
  406f76:	90                   	nop
  406f77:	90                   	nop
  406f78:	90                   	nop
  406f79:	90                   	nop
  406f7a:	90                   	nop
  406f7b:	90                   	nop
  406f7c:	90                   	nop
  406f7d:	90                   	nop
  406f7e:	90                   	nop
  406f7f:	90                   	nop
  406f80:	90                   	nop
  406f81:	90                   	nop
  406f82:	90                   	nop
  406f83:	90                   	nop
  406f84:	90                   	nop
  406f85:	90                   	nop
  406f86:	90                   	nop
  406f87:	90                   	nop
  406f88:	90                   	nop
  406f89:	90                   	nop
  406f8a:	90                   	nop
  406f8b:	90                   	nop
  406f8c:	90                   	nop
  406f8d:	90                   	nop
  406f8e:	90                   	nop
  406f8f:	90                   	nop
  406f90:	90                   	nop
  406f91:	90                   	nop
  406f92:	90                   	nop
  406f93:	90                   	nop
  406f94:	90                   	nop
  406f95:	90                   	nop
  406f96:	90                   	nop
  406f97:	90                   	nop
  406f98:	90                   	nop
  406f99:	90                   	nop
  406f9a:	90                   	nop
  406f9b:	90                   	nop
  406f9c:	90                   	nop
  406f9d:	90                   	nop
  406f9e:	90                   	nop
  406f9f:	90                   	nop
  406fa0:	90                   	nop
  406fa1:	90                   	nop
  406fa2:	90                   	nop
  406fa3:	90                   	nop
  406fa4:	90                   	nop
  406fa5:	90                   	nop
  406fa6:	90                   	nop
  406fa7:	90                   	nop
  406fa8:	90                   	nop
  406fa9:	90                   	nop
  406faa:	90                   	nop
  406fab:	90                   	nop
  406fac:	90                   	nop
  406fad:	90                   	nop
  406fae:	90                   	nop
  406faf:	90                   	nop
  406fb0:	90                   	nop
  406fb1:	90                   	nop
  406fb2:	90                   	nop
  406fb3:	90                   	nop
  406fb4:	90                   	nop
  406fb5:	90                   	nop
  406fb6:	90                   	nop
  406fb7:	90                   	nop
  406fb8:	90                   	nop
  406fb9:	90                   	nop
  406fba:	90                   	nop
  406fbb:	90                   	nop
  406fbc:	90                   	nop
  406fbd:	90                   	nop
  406fbe:	90                   	nop
  406fbf:	90                   	nop
  406fc0:	90                   	nop
  406fc1:	90                   	nop
  406fc2:	90                   	nop
  406fc3:	90                   	nop
  406fc4:	90                   	nop
  406fc5:	90                   	nop
  406fc6:	90                   	nop
  406fc7:	90                   	nop
  406fc8:	90                   	nop
  406fc9:	90                   	nop
  406fca:	90                   	nop
  406fcb:	90                   	nop
  406fcc:	90                   	nop
  406fcd:	90                   	nop
  406fce:	90                   	nop
  406fcf:	90                   	nop
  406fd0:	90                   	nop
  406fd1:	90                   	nop
  406fd2:	90                   	nop
  406fd3:	90                   	nop
  406fd4:	90                   	nop
  406fd5:	90                   	nop
  406fd6:	90                   	nop
  406fd7:	90                   	nop
  406fd8:	90                   	nop
  406fd9:	90                   	nop
  406fda:	90                   	nop
  406fdb:	90                   	nop
  406fdc:	90                   	nop
  406fdd:	90                   	nop
  406fde:	90                   	nop
  406fdf:	90                   	nop
  406fe0:	90                   	nop
  406fe1:	90                   	nop
  406fe2:	90                   	nop
  406fe3:	90                   	nop
  406fe4:	90                   	nop
  406fe5:	90                   	nop
  406fe6:	90                   	nop
  406fe7:	90                   	nop
  406fe8:	90                   	nop
  406fe9:	90                   	nop
  406fea:	90                   	nop
  406feb:	90                   	nop
  406fec:	90                   	nop
  406fed:	90                   	nop
  406fee:	90                   	nop
  406fef:	90                   	nop
  406ff0:	90                   	nop
  406ff1:	90                   	nop
  406ff2:	90                   	nop
  406ff3:	90                   	nop
  406ff4:	90                   	nop
  406ff5:	90                   	nop
  406ff6:	90                   	nop
  406ff7:	90                   	nop
  406ff8:	90                   	nop
  406ff9:	90                   	nop
  406ffa:	90                   	nop
  406ffb:	90                   	nop
  406ffc:	90                   	nop
  406ffd:	90                   	nop
  406ffe:	90                   	nop
  406fff:	90                   	nop
  407000:	90                   	nop
  407001:	90                   	nop
  407002:	90                   	nop
  407003:	90                   	nop
  407004:	90                   	nop
  407005:	90                   	nop
  407006:	90                   	nop
  407007:	90                   	nop
  407008:	90                   	nop
  407009:	90                   	nop
  40700a:	90                   	nop
  40700b:	90                   	nop
  40700c:	90                   	nop
  40700d:	90                   	nop
  40700e:	90                   	nop
  40700f:	90                   	nop
  407010:	90                   	nop
  407011:	90                   	nop
  407012:	90                   	nop
  407013:	90                   	nop
  407014:	90                   	nop
  407015:	90                   	nop
  407016:	90                   	nop
  407017:	90                   	nop
  407018:	90                   	nop
  407019:	90                   	nop
  40701a:	90                   	nop
  40701b:	90                   	nop
  40701c:	90                   	nop
  40701d:	90                   	nop
  40701e:	90                   	nop
  40701f:	90                   	nop
  407020:	90                   	nop
  407021:	90                   	nop
  407022:	90                   	nop
  407023:	90                   	nop
  407024:	90                   	nop
  407025:	90                   	nop
  407026:	90                   	nop
  407027:	90                   	nop
  407028:	90                   	nop
  407029:	90                   	nop
  40702a:	90                   	nop
  40702b:	90                   	nop
  40702c:	90                   	nop
  40702d:	90                   	nop
  40702e:	90                   	nop
  40702f:	90                   	nop
  407030:	90                   	nop
  407031:	90                   	nop
  407032:	90                   	nop
  407033:	90                   	nop
  407034:	90                   	nop
  407035:	90                   	nop
  407036:	90                   	nop
  407037:	90                   	nop
  407038:	90                   	nop
  407039:	90                   	nop
  40703a:	90                   	nop
  40703b:	90                   	nop
  40703c:	90                   	nop
  40703d:	90                   	nop
  40703e:	90                   	nop
  40703f:	90                   	nop
  407040:	90                   	nop
  407041:	90                   	nop
  407042:	90                   	nop
  407043:	90                   	nop
  407044:	90                   	nop
  407045:	90                   	nop
  407046:	90                   	nop
  407047:	90                   	nop
  407048:	90                   	nop
  407049:	90                   	nop
  40704a:	90                   	nop
  40704b:	90                   	nop
  40704c:	90                   	nop
  40704d:	90                   	nop
  40704e:	90                   	nop
  40704f:	90                   	nop
  407050:	90                   	nop
  407051:	90                   	nop
  407052:	90                   	nop
  407053:	90                   	nop
  407054:	90                   	nop
  407055:	90                   	nop
  407056:	90                   	nop
  407057:	90                   	nop
  407058:	90                   	nop
  407059:	90                   	nop
  40705a:	90                   	nop
  40705b:	90                   	nop
  40705c:	90                   	nop
  40705d:	90                   	nop
  40705e:	90                   	nop
  40705f:	90                   	nop
  407060:	90                   	nop
  407061:	90                   	nop
  407062:	90                   	nop
  407063:	90                   	nop
  407064:	90                   	nop
  407065:	90                   	nop
  407066:	90                   	nop
  407067:	90                   	nop
  407068:	90                   	nop
  407069:	90                   	nop
  40706a:	90                   	nop
  40706b:	90                   	nop
  40706c:	90                   	nop
  40706d:	90                   	nop
  40706e:	90                   	nop
  40706f:	90                   	nop
  407070:	90                   	nop
  407071:	90                   	nop
  407072:	90                   	nop
  407073:	90                   	nop
  407074:	90                   	nop
  407075:	90                   	nop
  407076:	90                   	nop
  407077:	90                   	nop
  407078:	90                   	nop
  407079:	90                   	nop
  40707a:	90                   	nop
  40707b:	90                   	nop
  40707c:	90                   	nop
  40707d:	90                   	nop
  40707e:	90                   	nop
  40707f:	90                   	nop
  407080:	90                   	nop
  407081:	90                   	nop
  407082:	90                   	nop
  407083:	90                   	nop
  407084:	90                   	nop
  407085:	90                   	nop
  407086:	90                   	nop
  407087:	90                   	nop
  407088:	90                   	nop
  407089:	90                   	nop
  40708a:	90                   	nop
  40708b:	90                   	nop
  40708c:	90                   	nop
  40708d:	90                   	nop
  40708e:	90                   	nop
  40708f:	90                   	nop
  407090:	90                   	nop
  407091:	90                   	nop
  407092:	90                   	nop
  407093:	90                   	nop
  407094:	90                   	nop
  407095:	90                   	nop
  407096:	90                   	nop
  407097:	90                   	nop
  407098:	90                   	nop
  407099:	90                   	nop
  40709a:	90                   	nop
  40709b:	90                   	nop
  40709c:	90                   	nop
  40709d:	90                   	nop
  40709e:	90                   	nop
  40709f:	90                   	nop
  4070a0:	90                   	nop
  4070a1:	90                   	nop
  4070a2:	90                   	nop
  4070a3:	90                   	nop
  4070a4:	90                   	nop
  4070a5:	90                   	nop
  4070a6:	90                   	nop
  4070a7:	90                   	nop
  4070a8:	90                   	nop
  4070a9:	90                   	nop
  4070aa:	90                   	nop
  4070ab:	90                   	nop
  4070ac:	90                   	nop
  4070ad:	90                   	nop
  4070ae:	90                   	nop
  4070af:	90                   	nop
  4070b0:	90                   	nop
  4070b1:	90                   	nop
  4070b2:	90                   	nop
  4070b3:	90                   	nop
  4070b4:	90                   	nop
  4070b5:	90                   	nop
  4070b6:	90                   	nop
  4070b7:	90                   	nop
  4070b8:	90                   	nop
  4070b9:	90                   	nop
  4070ba:	90                   	nop
  4070bb:	90                   	nop
  4070bc:	90                   	nop
  4070bd:	90                   	nop
  4070be:	90                   	nop
  4070bf:	90                   	nop
  4070c0:	90                   	nop
  4070c1:	90                   	nop
  4070c2:	90                   	nop
  4070c3:	90                   	nop
  4070c4:	90                   	nop
  4070c5:	90                   	nop
  4070c6:	90                   	nop
  4070c7:	90                   	nop
  4070c8:	90                   	nop
  4070c9:	90                   	nop
  4070ca:	90                   	nop
  4070cb:	90                   	nop
  4070cc:	90                   	nop
  4070cd:	90                   	nop
  4070ce:	90                   	nop
  4070cf:	90                   	nop
  4070d0:	90                   	nop
  4070d1:	90                   	nop
  4070d2:	90                   	nop
  4070d3:	90                   	nop
  4070d4:	90                   	nop
  4070d5:	90                   	nop
  4070d6:	90                   	nop
  4070d7:	90                   	nop
  4070d8:	90                   	nop
  4070d9:	90                   	nop
  4070da:	90                   	nop
  4070db:	90                   	nop
  4070dc:	90                   	nop
  4070dd:	90                   	nop
  4070de:	90                   	nop
  4070df:	90                   	nop
  4070e0:	90                   	nop
  4070e1:	90                   	nop
  4070e2:	90                   	nop
  4070e3:	90                   	nop
  4070e4:	90                   	nop
  4070e5:	90                   	nop
  4070e6:	90                   	nop
  4070e7:	90                   	nop
  4070e8:	90                   	nop
  4070e9:	90                   	nop
  4070ea:	90                   	nop
  4070eb:	90                   	nop
  4070ec:	90                   	nop
  4070ed:	90                   	nop
  4070ee:	90                   	nop
  4070ef:	90                   	nop
  4070f0:	90                   	nop
  4070f1:	90                   	nop
  4070f2:	90                   	nop
  4070f3:	90                   	nop
  4070f4:	90                   	nop
  4070f5:	90                   	nop
  4070f6:	90                   	nop
  4070f7:	90                   	nop
  4070f8:	90                   	nop
  4070f9:	90                   	nop
  4070fa:	90                   	nop
  4070fb:	90                   	nop
  4070fc:	90                   	nop
  4070fd:	90                   	nop
  4070fe:	90                   	nop
  4070ff:	90                   	nop
  407100:	90                   	nop
  407101:	90                   	nop
  407102:	90                   	nop
  407103:	90                   	nop
  407104:	90                   	nop
  407105:	90                   	nop
  407106:	90                   	nop
  407107:	90                   	nop
  407108:	90                   	nop
  407109:	90                   	nop
  40710a:	90                   	nop
  40710b:	90                   	nop
  40710c:	90                   	nop
  40710d:	90                   	nop
  40710e:	90                   	nop
  40710f:	90                   	nop
  407110:	90                   	nop
  407111:	90                   	nop
  407112:	90                   	nop
  407113:	90                   	nop
  407114:	90                   	nop
  407115:	90                   	nop
  407116:	90                   	nop
  407117:	90                   	nop
  407118:	90                   	nop
  407119:	90                   	nop
  40711a:	90                   	nop
  40711b:	90                   	nop
  40711c:	90                   	nop
  40711d:	90                   	nop
  40711e:	90                   	nop
  40711f:	90                   	nop
  407120:	90                   	nop
  407121:	90                   	nop
  407122:	90                   	nop
  407123:	90                   	nop
  407124:	90                   	nop
  407125:	90                   	nop
  407126:	90                   	nop
  407127:	90                   	nop
  407128:	90                   	nop
  407129:	90                   	nop
  40712a:	90                   	nop
  40712b:	90                   	nop
  40712c:	90                   	nop
  40712d:	90                   	nop
  40712e:	90                   	nop
  40712f:	90                   	nop
  407130:	90                   	nop
  407131:	90                   	nop
  407132:	90                   	nop
  407133:	90                   	nop
  407134:	90                   	nop
  407135:	90                   	nop
  407136:	90                   	nop
  407137:	90                   	nop
  407138:	90                   	nop
  407139:	90                   	nop
  40713a:	90                   	nop
  40713b:	90                   	nop
  40713c:	90                   	nop
  40713d:	90                   	nop
  40713e:	90                   	nop
  40713f:	90                   	nop
  407140:	90                   	nop
  407141:	90                   	nop
  407142:	90                   	nop
  407143:	90                   	nop
  407144:	90                   	nop
  407145:	90                   	nop
  407146:	90                   	nop
  407147:	90                   	nop
  407148:	90                   	nop
  407149:	90                   	nop
  40714a:	90                   	nop
  40714b:	90                   	nop
  40714c:	90                   	nop
  40714d:	90                   	nop
  40714e:	90                   	nop
  40714f:	90                   	nop
  407150:	90                   	nop
  407151:	90                   	nop
  407152:	90                   	nop
  407153:	90                   	nop
  407154:	90                   	nop
  407155:	90                   	nop
  407156:	90                   	nop
  407157:	90                   	nop
  407158:	90                   	nop
  407159:	90                   	nop
  40715a:	90                   	nop
  40715b:	90                   	nop
  40715c:	90                   	nop
  40715d:	90                   	nop
  40715e:	90                   	nop
  40715f:	90                   	nop
  407160:	90                   	nop
  407161:	90                   	nop
  407162:	90                   	nop
  407163:	90                   	nop
  407164:	90                   	nop
  407165:	90                   	nop
  407166:	90                   	nop
  407167:	90                   	nop
  407168:	90                   	nop
  407169:	90                   	nop
  40716a:	90                   	nop
  40716b:	90                   	nop
  40716c:	90                   	nop
  40716d:	90                   	nop
  40716e:	90                   	nop
  40716f:	90                   	nop
  407170:	90                   	nop
  407171:	90                   	nop
  407172:	90                   	nop
  407173:	90                   	nop
  407174:	90                   	nop
  407175:	90                   	nop
  407176:	90                   	nop
  407177:	90                   	nop
  407178:	90                   	nop
  407179:	90                   	nop
  40717a:	90                   	nop
  40717b:	90                   	nop
  40717c:	90                   	nop
  40717d:	90                   	nop
  40717e:	90                   	nop
  40717f:	90                   	nop
  407180:	90                   	nop
  407181:	90                   	nop
  407182:	90                   	nop
  407183:	90                   	nop
  407184:	90                   	nop
  407185:	90                   	nop
  407186:	90                   	nop
  407187:	90                   	nop
  407188:	90                   	nop
  407189:	90                   	nop
  40718a:	90                   	nop
  40718b:	90                   	nop
  40718c:	90                   	nop
  40718d:	90                   	nop
  40718e:	90                   	nop
  40718f:	90                   	nop
  407190:	90                   	nop
  407191:	90                   	nop
  407192:	90                   	nop
  407193:	90                   	nop
  407194:	90                   	nop
  407195:	90                   	nop
  407196:	90                   	nop
  407197:	90                   	nop
  407198:	90                   	nop
  407199:	90                   	nop
  40719a:	90                   	nop
  40719b:	90                   	nop
  40719c:	90                   	nop
  40719d:	90                   	nop
  40719e:	90                   	nop
  40719f:	90                   	nop
  4071a0:	90                   	nop
  4071a1:	90                   	nop
  4071a2:	90                   	nop
  4071a3:	90                   	nop
  4071a4:	90                   	nop
  4071a5:	90                   	nop
  4071a6:	90                   	nop
  4071a7:	90                   	nop
  4071a8:	90                   	nop
  4071a9:	90                   	nop
  4071aa:	90                   	nop
  4071ab:	90                   	nop
  4071ac:	90                   	nop
  4071ad:	90                   	nop
  4071ae:	90                   	nop
  4071af:	90                   	nop
  4071b0:	90                   	nop
  4071b1:	90                   	nop
  4071b2:	90                   	nop
  4071b3:	90                   	nop
  4071b4:	90                   	nop
  4071b5:	90                   	nop
  4071b6:	90                   	nop
  4071b7:	90                   	nop
  4071b8:	90                   	nop
  4071b9:	90                   	nop
  4071ba:	90                   	nop
  4071bb:	90                   	nop
  4071bc:	90                   	nop
  4071bd:	90                   	nop
  4071be:	90                   	nop
  4071bf:	90                   	nop
  4071c0:	90                   	nop
  4071c1:	90                   	nop
  4071c2:	90                   	nop
  4071c3:	90                   	nop
  4071c4:	90                   	nop
  4071c5:	90                   	nop
  4071c6:	90                   	nop
  4071c7:	90                   	nop
  4071c8:	90                   	nop
  4071c9:	90                   	nop
  4071ca:	90                   	nop
  4071cb:	90                   	nop
  4071cc:	90                   	nop
  4071cd:	90                   	nop
  4071ce:	90                   	nop
  4071cf:	90                   	nop
  4071d0:	90                   	nop
  4071d1:	90                   	nop
  4071d2:	90                   	nop
  4071d3:	90                   	nop
  4071d4:	90                   	nop
  4071d5:	90                   	nop
  4071d6:	90                   	nop
  4071d7:	90                   	nop
  4071d8:	90                   	nop
  4071d9:	90                   	nop
  4071da:	90                   	nop
  4071db:	90                   	nop
  4071dc:	90                   	nop
  4071dd:	90                   	nop
  4071de:	90                   	nop
  4071df:	90                   	nop
  4071e0:	90                   	nop
  4071e1:	90                   	nop
  4071e2:	90                   	nop
  4071e3:	90                   	nop
  4071e4:	90                   	nop
  4071e5:	90                   	nop
  4071e6:	90                   	nop
  4071e7:	90                   	nop
  4071e8:	90                   	nop
  4071e9:	90                   	nop
  4071ea:	90                   	nop
  4071eb:	90                   	nop
  4071ec:	90                   	nop
  4071ed:	90                   	nop
  4071ee:	90                   	nop
  4071ef:	90                   	nop
  4071f0:	90                   	nop
  4071f1:	90                   	nop
  4071f2:	90                   	nop
  4071f3:	90                   	nop
  4071f4:	90                   	nop
  4071f5:	90                   	nop
  4071f6:	90                   	nop
  4071f7:	90                   	nop
  4071f8:	90                   	nop
  4071f9:	90                   	nop
  4071fa:	90                   	nop
  4071fb:	90                   	nop
  4071fc:	90                   	nop
  4071fd:	90                   	nop
  4071fe:	90                   	nop
  4071ff:	90                   	nop
  407200:	90                   	nop
  407201:	90                   	nop
  407202:	90                   	nop
  407203:	90                   	nop
  407204:	90                   	nop
  407205:	90                   	nop
  407206:	90                   	nop
  407207:	90                   	nop
  407208:	90                   	nop
  407209:	90                   	nop
  40720a:	90                   	nop
  40720b:	90                   	nop
  40720c:	90                   	nop
  40720d:	90                   	nop
  40720e:	90                   	nop
  40720f:	90                   	nop
  407210:	90                   	nop
  407211:	c3                   	ret    

Disassembly of section .sec_dummy_target:

0000000000407212 <dummy_target_0>:
  407212:	4c 8b 0d a7 8e 00 00 	mov    0x8ea7(%rip),%r9        # 4100c0 <UserData+0x200>
  407219:	90                   	nop
  40721a:	90                   	nop
  40721b:	90                   	nop
  40721c:	90                   	nop
  40721d:	90                   	nop
  40721e:	90                   	nop
  40721f:	90                   	nop
  407220:	90                   	nop
  407221:	90                   	nop
  407222:	90                   	nop
  407223:	90                   	nop
  407224:	90                   	nop
  407225:	90                   	nop
  407226:	90                   	nop
  407227:	90                   	nop
  407228:	90                   	nop
  407229:	90                   	nop
  40722a:	90                   	nop
  40722b:	90                   	nop
  40722c:	90                   	nop
  40722d:	90                   	nop
  40722e:	90                   	nop
  40722f:	90                   	nop
  407230:	90                   	nop
  407231:	90                   	nop
  407232:	90                   	nop
  407233:	90                   	nop
  407234:	90                   	nop
  407235:	90                   	nop
  407236:	90                   	nop
  407237:	90                   	nop
  407238:	90                   	nop
  407239:	90                   	nop
  40723a:	90                   	nop
  40723b:	90                   	nop
  40723c:	90                   	nop
  40723d:	90                   	nop
  40723e:	90                   	nop
  40723f:	90                   	nop
  407240:	90                   	nop
  407241:	90                   	nop
  407242:	90                   	nop
  407243:	90                   	nop
  407244:	90                   	nop
  407245:	90                   	nop
  407246:	90                   	nop
  407247:	90                   	nop
  407248:	90                   	nop
  407249:	90                   	nop
  40724a:	90                   	nop
  40724b:	90                   	nop
  40724c:	90                   	nop
  40724d:	90                   	nop
  40724e:	90                   	nop
  40724f:	90                   	nop
  407250:	90                   	nop
  407251:	90                   	nop
  407252:	90                   	nop
  407253:	90                   	nop
  407254:	90                   	nop
  407255:	90                   	nop
  407256:	90                   	nop
  407257:	90                   	nop
  407258:	90                   	nop
  407259:	90                   	nop
  40725a:	90                   	nop
  40725b:	90                   	nop
  40725c:	90                   	nop
  40725d:	90                   	nop
  40725e:	90                   	nop
  40725f:	90                   	nop
  407260:	90                   	nop
  407261:	90                   	nop
  407262:	90                   	nop
  407263:	90                   	nop
  407264:	90                   	nop
  407265:	90                   	nop
  407266:	90                   	nop
  407267:	90                   	nop
  407268:	90                   	nop
  407269:	90                   	nop
  40726a:	90                   	nop
  40726b:	90                   	nop
  40726c:	90                   	nop
  40726d:	90                   	nop
  40726e:	90                   	nop
  40726f:	90                   	nop
  407270:	90                   	nop
  407271:	90                   	nop
  407272:	90                   	nop
  407273:	90                   	nop
  407274:	90                   	nop
  407275:	90                   	nop
  407276:	90                   	nop
  407277:	90                   	nop
  407278:	90                   	nop
  407279:	90                   	nop
  40727a:	90                   	nop
  40727b:	90                   	nop
  40727c:	90                   	nop
  40727d:	90                   	nop
  40727e:	90                   	nop
  40727f:	90                   	nop
  407280:	90                   	nop
  407281:	90                   	nop
  407282:	90                   	nop
  407283:	90                   	nop
  407284:	90                   	nop
  407285:	90                   	nop
  407286:	90                   	nop
  407287:	90                   	nop
  407288:	90                   	nop
  407289:	90                   	nop
  40728a:	90                   	nop
  40728b:	90                   	nop
  40728c:	90                   	nop
  40728d:	90                   	nop
  40728e:	90                   	nop
  40728f:	90                   	nop
  407290:	90                   	nop
  407291:	90                   	nop
  407292:	90                   	nop
  407293:	90                   	nop
  407294:	90                   	nop
  407295:	90                   	nop
  407296:	90                   	nop
  407297:	90                   	nop
  407298:	90                   	nop
  407299:	90                   	nop
  40729a:	90                   	nop
  40729b:	90                   	nop
  40729c:	90                   	nop
  40729d:	90                   	nop
  40729e:	90                   	nop
  40729f:	90                   	nop
  4072a0:	90                   	nop
  4072a1:	90                   	nop
  4072a2:	90                   	nop
  4072a3:	90                   	nop
  4072a4:	90                   	nop
  4072a5:	90                   	nop
  4072a6:	90                   	nop
  4072a7:	90                   	nop
  4072a8:	90                   	nop
  4072a9:	90                   	nop
  4072aa:	90                   	nop
  4072ab:	90                   	nop
  4072ac:	90                   	nop
  4072ad:	90                   	nop
  4072ae:	90                   	nop
  4072af:	90                   	nop
  4072b0:	90                   	nop
  4072b1:	90                   	nop
  4072b2:	90                   	nop
  4072b3:	90                   	nop
  4072b4:	90                   	nop
  4072b5:	90                   	nop
  4072b6:	90                   	nop
  4072b7:	90                   	nop
  4072b8:	90                   	nop
  4072b9:	90                   	nop
  4072ba:	90                   	nop
  4072bb:	90                   	nop
  4072bc:	90                   	nop
  4072bd:	90                   	nop
  4072be:	90                   	nop
  4072bf:	90                   	nop
  4072c0:	90                   	nop
  4072c1:	90                   	nop
  4072c2:	90                   	nop
  4072c3:	90                   	nop
  4072c4:	90                   	nop
  4072c5:	90                   	nop
  4072c6:	90                   	nop
  4072c7:	90                   	nop
  4072c8:	90                   	nop
  4072c9:	90                   	nop
  4072ca:	90                   	nop
  4072cb:	90                   	nop
  4072cc:	90                   	nop
  4072cd:	90                   	nop
  4072ce:	90                   	nop
  4072cf:	90                   	nop
  4072d0:	90                   	nop
  4072d1:	90                   	nop
  4072d2:	90                   	nop
  4072d3:	90                   	nop
  4072d4:	90                   	nop
  4072d5:	90                   	nop
  4072d6:	90                   	nop
  4072d7:	90                   	nop
  4072d8:	90                   	nop
  4072d9:	90                   	nop
  4072da:	90                   	nop
  4072db:	90                   	nop
  4072dc:	90                   	nop
  4072dd:	90                   	nop
  4072de:	90                   	nop
  4072df:	90                   	nop
  4072e0:	90                   	nop
  4072e1:	90                   	nop
  4072e2:	90                   	nop
  4072e3:	90                   	nop
  4072e4:	90                   	nop
  4072e5:	90                   	nop
  4072e6:	90                   	nop
  4072e7:	90                   	nop
  4072e8:	90                   	nop
  4072e9:	90                   	nop
  4072ea:	90                   	nop
  4072eb:	90                   	nop
  4072ec:	90                   	nop
  4072ed:	90                   	nop
  4072ee:	90                   	nop
  4072ef:	90                   	nop
  4072f0:	90                   	nop
  4072f1:	90                   	nop
  4072f2:	90                   	nop
  4072f3:	90                   	nop
  4072f4:	90                   	nop
  4072f5:	90                   	nop
  4072f6:	90                   	nop
  4072f7:	90                   	nop
  4072f8:	90                   	nop
  4072f9:	90                   	nop
  4072fa:	90                   	nop
  4072fb:	90                   	nop
  4072fc:	90                   	nop
  4072fd:	90                   	nop
  4072fe:	90                   	nop
  4072ff:	90                   	nop
  407300:	90                   	nop
  407301:	90                   	nop
  407302:	90                   	nop
  407303:	90                   	nop
  407304:	90                   	nop
  407305:	90                   	nop
  407306:	90                   	nop
  407307:	90                   	nop
  407308:	90                   	nop
  407309:	90                   	nop
  40730a:	90                   	nop
  40730b:	90                   	nop
  40730c:	90                   	nop
  40730d:	90                   	nop
  40730e:	90                   	nop
  40730f:	90                   	nop
  407310:	90                   	nop
  407311:	90                   	nop
  407312:	90                   	nop
  407313:	90                   	nop
  407314:	90                   	nop
  407315:	90                   	nop
  407316:	90                   	nop
  407317:	90                   	nop
  407318:	90                   	nop
  407319:	90                   	nop
  40731a:	90                   	nop
  40731b:	90                   	nop
  40731c:	90                   	nop
  40731d:	90                   	nop
  40731e:	90                   	nop
  40731f:	90                   	nop
  407320:	90                   	nop
  407321:	90                   	nop
  407322:	90                   	nop
  407323:	90                   	nop
  407324:	90                   	nop
  407325:	90                   	nop
  407326:	90                   	nop
  407327:	90                   	nop
  407328:	90                   	nop
  407329:	90                   	nop
  40732a:	90                   	nop
  40732b:	90                   	nop
  40732c:	90                   	nop
  40732d:	90                   	nop
  40732e:	90                   	nop
  40732f:	90                   	nop
  407330:	90                   	nop
  407331:	90                   	nop
  407332:	90                   	nop
  407333:	90                   	nop
  407334:	90                   	nop
  407335:	90                   	nop
  407336:	90                   	nop
  407337:	90                   	nop
  407338:	90                   	nop
  407339:	90                   	nop
  40733a:	90                   	nop
  40733b:	90                   	nop
  40733c:	90                   	nop
  40733d:	90                   	nop
  40733e:	90                   	nop
  40733f:	90                   	nop
  407340:	90                   	nop
  407341:	90                   	nop
  407342:	90                   	nop
  407343:	90                   	nop
  407344:	90                   	nop
  407345:	90                   	nop
  407346:	90                   	nop
  407347:	90                   	nop
  407348:	90                   	nop
  407349:	90                   	nop
  40734a:	90                   	nop
  40734b:	90                   	nop
  40734c:	90                   	nop
  40734d:	90                   	nop
  40734e:	90                   	nop
  40734f:	90                   	nop
  407350:	90                   	nop
  407351:	90                   	nop
  407352:	90                   	nop
  407353:	90                   	nop
  407354:	90                   	nop
  407355:	90                   	nop
  407356:	90                   	nop
  407357:	90                   	nop
  407358:	90                   	nop
  407359:	90                   	nop
  40735a:	90                   	nop
  40735b:	90                   	nop
  40735c:	90                   	nop
  40735d:	90                   	nop
  40735e:	90                   	nop
  40735f:	90                   	nop
  407360:	90                   	nop
  407361:	90                   	nop
  407362:	90                   	nop
  407363:	90                   	nop
  407364:	90                   	nop
  407365:	90                   	nop
  407366:	90                   	nop
  407367:	90                   	nop
  407368:	90                   	nop
  407369:	90                   	nop
  40736a:	90                   	nop
  40736b:	90                   	nop
  40736c:	90                   	nop
  40736d:	90                   	nop
  40736e:	90                   	nop
  40736f:	90                   	nop
  407370:	90                   	nop
  407371:	90                   	nop
  407372:	90                   	nop
  407373:	90                   	nop
  407374:	90                   	nop
  407375:	90                   	nop
  407376:	90                   	nop
  407377:	90                   	nop
  407378:	90                   	nop
  407379:	90                   	nop
  40737a:	90                   	nop
  40737b:	90                   	nop
  40737c:	90                   	nop
  40737d:	90                   	nop
  40737e:	90                   	nop
  40737f:	90                   	nop
  407380:	90                   	nop
  407381:	90                   	nop
  407382:	90                   	nop
  407383:	90                   	nop
  407384:	90                   	nop
  407385:	90                   	nop
  407386:	90                   	nop
  407387:	90                   	nop
  407388:	90                   	nop
  407389:	90                   	nop
  40738a:	90                   	nop
  40738b:	90                   	nop
  40738c:	90                   	nop
  40738d:	90                   	nop
  40738e:	90                   	nop
  40738f:	90                   	nop
  407390:	90                   	nop
  407391:	90                   	nop
  407392:	90                   	nop
  407393:	90                   	nop
  407394:	90                   	nop
  407395:	90                   	nop
  407396:	90                   	nop
  407397:	90                   	nop
  407398:	90                   	nop
  407399:	90                   	nop
  40739a:	90                   	nop
  40739b:	90                   	nop
  40739c:	90                   	nop
  40739d:	90                   	nop
  40739e:	90                   	nop
  40739f:	90                   	nop
  4073a0:	90                   	nop
  4073a1:	90                   	nop
  4073a2:	90                   	nop
  4073a3:	90                   	nop
  4073a4:	90                   	nop
  4073a5:	90                   	nop
  4073a6:	90                   	nop
  4073a7:	90                   	nop
  4073a8:	90                   	nop
  4073a9:	90                   	nop
  4073aa:	90                   	nop
  4073ab:	90                   	nop
  4073ac:	90                   	nop
  4073ad:	90                   	nop
  4073ae:	90                   	nop
  4073af:	90                   	nop
  4073b0:	90                   	nop
  4073b1:	90                   	nop
  4073b2:	90                   	nop
  4073b3:	90                   	nop
  4073b4:	90                   	nop
  4073b5:	90                   	nop
  4073b6:	90                   	nop
  4073b7:	90                   	nop
  4073b8:	90                   	nop
  4073b9:	90                   	nop
  4073ba:	90                   	nop
  4073bb:	90                   	nop
  4073bc:	90                   	nop
  4073bd:	90                   	nop
  4073be:	90                   	nop
  4073bf:	90                   	nop
  4073c0:	90                   	nop
  4073c1:	90                   	nop
  4073c2:	90                   	nop
  4073c3:	90                   	nop
  4073c4:	90                   	nop
  4073c5:	90                   	nop
  4073c6:	90                   	nop
  4073c7:	90                   	nop
  4073c8:	90                   	nop
  4073c9:	90                   	nop
  4073ca:	90                   	nop
  4073cb:	90                   	nop
  4073cc:	90                   	nop
  4073cd:	90                   	nop
  4073ce:	90                   	nop
  4073cf:	90                   	nop
  4073d0:	90                   	nop
  4073d1:	90                   	nop
  4073d2:	90                   	nop
  4073d3:	90                   	nop
  4073d4:	90                   	nop
  4073d5:	90                   	nop
  4073d6:	90                   	nop
  4073d7:	90                   	nop
  4073d8:	90                   	nop
  4073d9:	90                   	nop
  4073da:	90                   	nop
  4073db:	90                   	nop
  4073dc:	90                   	nop
  4073dd:	90                   	nop
  4073de:	90                   	nop
  4073df:	90                   	nop
  4073e0:	90                   	nop
  4073e1:	90                   	nop
  4073e2:	90                   	nop
  4073e3:	90                   	nop
  4073e4:	90                   	nop
  4073e5:	90                   	nop
  4073e6:	90                   	nop
  4073e7:	90                   	nop
  4073e8:	90                   	nop
  4073e9:	90                   	nop
  4073ea:	90                   	nop
  4073eb:	90                   	nop
  4073ec:	90                   	nop
  4073ed:	90                   	nop
  4073ee:	90                   	nop
  4073ef:	90                   	nop
  4073f0:	90                   	nop
  4073f1:	90                   	nop
  4073f2:	90                   	nop
  4073f3:	90                   	nop
  4073f4:	90                   	nop
  4073f5:	90                   	nop
  4073f6:	90                   	nop
  4073f7:	90                   	nop
  4073f8:	90                   	nop
  4073f9:	90                   	nop
  4073fa:	90                   	nop
  4073fb:	90                   	nop
  4073fc:	90                   	nop
  4073fd:	90                   	nop
  4073fe:	90                   	nop
  4073ff:	90                   	nop
  407400:	90                   	nop
  407401:	90                   	nop
  407402:	90                   	nop
  407403:	90                   	nop
  407404:	90                   	nop
  407405:	90                   	nop
  407406:	90                   	nop
  407407:	90                   	nop
  407408:	90                   	nop
  407409:	90                   	nop
  40740a:	90                   	nop
  40740b:	90                   	nop
  40740c:	90                   	nop
  40740d:	90                   	nop
  40740e:	90                   	nop
  40740f:	90                   	nop
  407410:	90                   	nop
  407411:	90                   	nop
  407412:	90                   	nop
  407413:	90                   	nop
  407414:	90                   	nop
  407415:	90                   	nop
  407416:	90                   	nop
  407417:	90                   	nop
  407418:	90                   	nop
  407419:	c3                   	ret    
  40741a:	90                   	nop
  40741b:	90                   	nop
  40741c:	90                   	nop
  40741d:	90                   	nop
  40741e:	90                   	nop
  40741f:	90                   	nop
  407420:	90                   	nop
  407421:	90                   	nop
  407422:	90                   	nop
  407423:	90                   	nop
  407424:	90                   	nop
  407425:	90                   	nop
  407426:	90                   	nop
  407427:	90                   	nop
  407428:	90                   	nop
  407429:	90                   	nop
  40742a:	90                   	nop
  40742b:	90                   	nop
  40742c:	90                   	nop
  40742d:	90                   	nop
  40742e:	90                   	nop
  40742f:	90                   	nop
  407430:	90                   	nop
  407431:	90                   	nop
  407432:	90                   	nop
  407433:	90                   	nop
  407434:	90                   	nop
  407435:	90                   	nop
  407436:	90                   	nop
  407437:	90                   	nop
  407438:	90                   	nop
  407439:	90                   	nop
  40743a:	90                   	nop
  40743b:	90                   	nop
  40743c:	90                   	nop
  40743d:	90                   	nop
  40743e:	90                   	nop
  40743f:	90                   	nop
  407440:	90                   	nop
  407441:	90                   	nop
  407442:	90                   	nop
  407443:	90                   	nop
  407444:	90                   	nop
  407445:	90                   	nop
  407446:	90                   	nop
  407447:	90                   	nop
  407448:	90                   	nop
  407449:	90                   	nop
  40744a:	90                   	nop
  40744b:	90                   	nop
  40744c:	90                   	nop
  40744d:	90                   	nop
  40744e:	90                   	nop
  40744f:	90                   	nop
  407450:	90                   	nop
  407451:	90                   	nop
  407452:	90                   	nop
  407453:	90                   	nop
  407454:	90                   	nop
  407455:	90                   	nop
  407456:	90                   	nop
  407457:	90                   	nop
  407458:	90                   	nop
  407459:	90                   	nop
  40745a:	90                   	nop
  40745b:	90                   	nop
  40745c:	90                   	nop
  40745d:	90                   	nop
  40745e:	90                   	nop
  40745f:	90                   	nop
  407460:	90                   	nop
  407461:	90                   	nop
  407462:	90                   	nop
  407463:	90                   	nop
  407464:	90                   	nop
  407465:	90                   	nop
  407466:	90                   	nop
  407467:	90                   	nop
  407468:	90                   	nop
  407469:	90                   	nop
  40746a:	90                   	nop
  40746b:	90                   	nop
  40746c:	90                   	nop
  40746d:	90                   	nop
  40746e:	90                   	nop
  40746f:	90                   	nop
  407470:	90                   	nop
  407471:	90                   	nop
  407472:	90                   	nop
  407473:	90                   	nop
  407474:	90                   	nop
  407475:	90                   	nop
  407476:	90                   	nop
  407477:	90                   	nop
  407478:	90                   	nop
  407479:	90                   	nop
  40747a:	90                   	nop
  40747b:	90                   	nop
  40747c:	90                   	nop
  40747d:	90                   	nop
  40747e:	90                   	nop
  40747f:	90                   	nop
  407480:	90                   	nop
  407481:	90                   	nop
  407482:	90                   	nop
  407483:	90                   	nop
  407484:	90                   	nop
  407485:	90                   	nop
  407486:	90                   	nop
  407487:	90                   	nop
  407488:	90                   	nop
  407489:	90                   	nop
  40748a:	90                   	nop
  40748b:	90                   	nop
  40748c:	90                   	nop
  40748d:	90                   	nop
  40748e:	90                   	nop
  40748f:	90                   	nop
  407490:	90                   	nop
  407491:	90                   	nop
  407492:	90                   	nop
  407493:	90                   	nop
  407494:	90                   	nop
  407495:	90                   	nop
  407496:	90                   	nop
  407497:	90                   	nop
  407498:	90                   	nop
  407499:	90                   	nop
  40749a:	90                   	nop
  40749b:	90                   	nop
  40749c:	90                   	nop
  40749d:	90                   	nop
  40749e:	90                   	nop
  40749f:	90                   	nop
  4074a0:	90                   	nop
  4074a1:	90                   	nop
  4074a2:	90                   	nop
  4074a3:	90                   	nop
  4074a4:	90                   	nop
  4074a5:	90                   	nop
  4074a6:	90                   	nop
  4074a7:	90                   	nop
  4074a8:	90                   	nop
  4074a9:	90                   	nop
  4074aa:	90                   	nop
  4074ab:	90                   	nop
  4074ac:	90                   	nop
  4074ad:	90                   	nop
  4074ae:	90                   	nop
  4074af:	90                   	nop
  4074b0:	90                   	nop
  4074b1:	90                   	nop
  4074b2:	90                   	nop
  4074b3:	90                   	nop
  4074b4:	90                   	nop
  4074b5:	90                   	nop
  4074b6:	90                   	nop
  4074b7:	90                   	nop
  4074b8:	90                   	nop
  4074b9:	90                   	nop
  4074ba:	90                   	nop
  4074bb:	90                   	nop
  4074bc:	90                   	nop
  4074bd:	90                   	nop
  4074be:	90                   	nop
  4074bf:	90                   	nop
  4074c0:	90                   	nop
  4074c1:	90                   	nop
  4074c2:	90                   	nop
  4074c3:	90                   	nop
  4074c4:	90                   	nop
  4074c5:	90                   	nop
  4074c6:	90                   	nop
  4074c7:	90                   	nop
  4074c8:	90                   	nop
  4074c9:	90                   	nop
  4074ca:	90                   	nop
  4074cb:	90                   	nop
  4074cc:	90                   	nop
  4074cd:	90                   	nop
  4074ce:	90                   	nop
  4074cf:	90                   	nop
  4074d0:	90                   	nop
  4074d1:	90                   	nop
  4074d2:	90                   	nop
  4074d3:	90                   	nop
  4074d4:	90                   	nop
  4074d5:	90                   	nop
  4074d6:	90                   	nop
  4074d7:	90                   	nop
  4074d8:	90                   	nop
  4074d9:	90                   	nop
  4074da:	90                   	nop
  4074db:	90                   	nop
  4074dc:	90                   	nop
  4074dd:	90                   	nop
  4074de:	90                   	nop
  4074df:	90                   	nop
  4074e0:	90                   	nop
  4074e1:	90                   	nop
  4074e2:	90                   	nop
  4074e3:	90                   	nop
  4074e4:	90                   	nop
  4074e5:	90                   	nop
  4074e6:	90                   	nop
  4074e7:	90                   	nop
  4074e8:	90                   	nop
  4074e9:	90                   	nop
  4074ea:	90                   	nop
  4074eb:	90                   	nop
  4074ec:	90                   	nop
  4074ed:	90                   	nop
  4074ee:	90                   	nop
  4074ef:	90                   	nop
  4074f0:	90                   	nop
  4074f1:	90                   	nop
  4074f2:	90                   	nop
  4074f3:	90                   	nop
  4074f4:	90                   	nop
  4074f5:	90                   	nop
  4074f6:	90                   	nop
  4074f7:	90                   	nop
  4074f8:	90                   	nop
  4074f9:	90                   	nop
  4074fa:	90                   	nop
  4074fb:	90                   	nop
  4074fc:	90                   	nop
  4074fd:	90                   	nop
  4074fe:	90                   	nop
  4074ff:	90                   	nop
  407500:	90                   	nop
  407501:	90                   	nop
  407502:	90                   	nop
  407503:	90                   	nop
  407504:	90                   	nop
  407505:	90                   	nop
  407506:	90                   	nop
  407507:	90                   	nop
  407508:	90                   	nop
  407509:	90                   	nop
  40750a:	90                   	nop
  40750b:	90                   	nop
  40750c:	90                   	nop
  40750d:	90                   	nop
  40750e:	90                   	nop
  40750f:	90                   	nop
  407510:	90                   	nop
  407511:	90                   	nop
  407512:	90                   	nop
  407513:	90                   	nop
  407514:	90                   	nop
  407515:	90                   	nop
  407516:	90                   	nop
  407517:	90                   	nop
  407518:	90                   	nop
  407519:	90                   	nop
  40751a:	90                   	nop
  40751b:	90                   	nop
  40751c:	90                   	nop
  40751d:	90                   	nop
  40751e:	90                   	nop
  40751f:	90                   	nop
  407520:	90                   	nop
  407521:	90                   	nop
  407522:	90                   	nop
  407523:	90                   	nop
  407524:	90                   	nop
  407525:	90                   	nop
  407526:	90                   	nop
  407527:	90                   	nop
  407528:	90                   	nop
  407529:	90                   	nop
  40752a:	90                   	nop
  40752b:	90                   	nop
  40752c:	90                   	nop
  40752d:	90                   	nop
  40752e:	90                   	nop
  40752f:	90                   	nop
  407530:	90                   	nop
  407531:	90                   	nop
  407532:	90                   	nop
  407533:	90                   	nop
  407534:	90                   	nop
  407535:	90                   	nop
  407536:	90                   	nop
  407537:	90                   	nop
  407538:	90                   	nop
  407539:	90                   	nop
  40753a:	90                   	nop
  40753b:	90                   	nop
  40753c:	90                   	nop
  40753d:	90                   	nop
  40753e:	90                   	nop
  40753f:	90                   	nop
  407540:	90                   	nop
  407541:	90                   	nop
  407542:	90                   	nop
  407543:	90                   	nop
  407544:	90                   	nop
  407545:	90                   	nop
  407546:	90                   	nop
  407547:	90                   	nop
  407548:	90                   	nop
  407549:	90                   	nop
  40754a:	90                   	nop
  40754b:	90                   	nop
  40754c:	90                   	nop
  40754d:	90                   	nop
  40754e:	90                   	nop
  40754f:	90                   	nop
  407550:	90                   	nop
  407551:	90                   	nop
  407552:	90                   	nop
  407553:	90                   	nop
  407554:	90                   	nop
  407555:	90                   	nop
  407556:	90                   	nop
  407557:	90                   	nop
  407558:	90                   	nop
  407559:	90                   	nop
  40755a:	90                   	nop
  40755b:	90                   	nop
  40755c:	90                   	nop
  40755d:	90                   	nop
  40755e:	90                   	nop
  40755f:	90                   	nop
  407560:	90                   	nop
  407561:	90                   	nop
  407562:	90                   	nop
  407563:	90                   	nop
  407564:	90                   	nop
  407565:	90                   	nop
  407566:	90                   	nop
  407567:	90                   	nop
  407568:	90                   	nop
  407569:	90                   	nop
  40756a:	90                   	nop
  40756b:	90                   	nop
  40756c:	90                   	nop
  40756d:	90                   	nop
  40756e:	90                   	nop
  40756f:	90                   	nop
  407570:	90                   	nop
  407571:	90                   	nop
  407572:	90                   	nop
  407573:	90                   	nop
  407574:	90                   	nop
  407575:	90                   	nop
  407576:	90                   	nop
  407577:	90                   	nop
  407578:	90                   	nop
  407579:	90                   	nop
  40757a:	90                   	nop
  40757b:	90                   	nop
  40757c:	90                   	nop
  40757d:	90                   	nop
  40757e:	90                   	nop
  40757f:	90                   	nop
  407580:	90                   	nop
  407581:	90                   	nop
  407582:	90                   	nop
  407583:	90                   	nop
  407584:	90                   	nop
  407585:	90                   	nop
  407586:	90                   	nop
  407587:	90                   	nop
  407588:	90                   	nop
  407589:	90                   	nop
  40758a:	90                   	nop
  40758b:	90                   	nop
  40758c:	90                   	nop
  40758d:	90                   	nop
  40758e:	90                   	nop
  40758f:	90                   	nop
  407590:	90                   	nop
  407591:	90                   	nop
  407592:	90                   	nop
  407593:	90                   	nop
  407594:	90                   	nop
  407595:	90                   	nop
  407596:	90                   	nop
  407597:	90                   	nop
  407598:	90                   	nop
  407599:	90                   	nop
  40759a:	90                   	nop
  40759b:	90                   	nop
  40759c:	90                   	nop
  40759d:	90                   	nop
  40759e:	90                   	nop
  40759f:	90                   	nop
  4075a0:	90                   	nop
  4075a1:	90                   	nop
  4075a2:	90                   	nop
  4075a3:	90                   	nop
  4075a4:	90                   	nop
  4075a5:	90                   	nop
  4075a6:	90                   	nop
  4075a7:	90                   	nop
  4075a8:	90                   	nop
  4075a9:	90                   	nop
  4075aa:	90                   	nop
  4075ab:	90                   	nop
  4075ac:	90                   	nop
  4075ad:	90                   	nop
  4075ae:	90                   	nop
  4075af:	90                   	nop
  4075b0:	90                   	nop
  4075b1:	90                   	nop
  4075b2:	90                   	nop
  4075b3:	90                   	nop
  4075b4:	90                   	nop
  4075b5:	90                   	nop
  4075b6:	90                   	nop
  4075b7:	90                   	nop
  4075b8:	90                   	nop
  4075b9:	90                   	nop
  4075ba:	90                   	nop
  4075bb:	90                   	nop
  4075bc:	90                   	nop
  4075bd:	90                   	nop
  4075be:	90                   	nop
  4075bf:	90                   	nop
  4075c0:	90                   	nop
  4075c1:	90                   	nop
  4075c2:	90                   	nop
  4075c3:	90                   	nop
  4075c4:	90                   	nop
  4075c5:	90                   	nop
  4075c6:	90                   	nop
  4075c7:	90                   	nop
  4075c8:	90                   	nop
  4075c9:	90                   	nop
  4075ca:	90                   	nop
  4075cb:	90                   	nop
  4075cc:	90                   	nop
  4075cd:	90                   	nop
  4075ce:	90                   	nop
  4075cf:	90                   	nop
  4075d0:	90                   	nop
  4075d1:	90                   	nop
  4075d2:	90                   	nop
  4075d3:	90                   	nop
  4075d4:	90                   	nop
  4075d5:	90                   	nop
  4075d6:	90                   	nop
  4075d7:	90                   	nop
  4075d8:	90                   	nop
  4075d9:	90                   	nop
  4075da:	90                   	nop
  4075db:	90                   	nop
  4075dc:	90                   	nop
  4075dd:	90                   	nop
  4075de:	90                   	nop
  4075df:	90                   	nop
  4075e0:	90                   	nop
  4075e1:	90                   	nop
  4075e2:	90                   	nop
  4075e3:	90                   	nop
  4075e4:	90                   	nop
  4075e5:	90                   	nop
  4075e6:	90                   	nop
  4075e7:	90                   	nop
  4075e8:	90                   	nop
  4075e9:	90                   	nop
  4075ea:	90                   	nop
  4075eb:	90                   	nop
  4075ec:	90                   	nop
  4075ed:	90                   	nop
  4075ee:	90                   	nop
  4075ef:	90                   	nop
  4075f0:	90                   	nop
  4075f1:	90                   	nop
  4075f2:	90                   	nop
  4075f3:	90                   	nop
  4075f4:	90                   	nop
  4075f5:	90                   	nop
  4075f6:	90                   	nop
  4075f7:	90                   	nop
  4075f8:	90                   	nop
  4075f9:	90                   	nop
  4075fa:	90                   	nop
  4075fb:	90                   	nop
  4075fc:	90                   	nop
  4075fd:	90                   	nop
  4075fe:	90                   	nop
  4075ff:	90                   	nop
  407600:	90                   	nop
  407601:	90                   	nop
  407602:	90                   	nop
  407603:	90                   	nop
  407604:	90                   	nop
  407605:	90                   	nop
  407606:	90                   	nop
  407607:	90                   	nop
  407608:	90                   	nop
  407609:	90                   	nop
  40760a:	90                   	nop
  40760b:	90                   	nop
  40760c:	90                   	nop
  40760d:	90                   	nop
  40760e:	90                   	nop
  40760f:	90                   	nop
  407610:	90                   	nop
  407611:	90                   	nop
  407612:	90                   	nop
  407613:	90                   	nop
  407614:	90                   	nop
  407615:	90                   	nop
  407616:	90                   	nop
  407617:	90                   	nop
  407618:	90                   	nop
  407619:	90                   	nop

Disassembly of section .sec_malicious_target:

000000000040761a <malicious_target_0>:
  40761a:	4c 8b 0d 9f 8c 00 00 	mov    0x8c9f(%rip),%r9        # 4102c0 <UserData+0x400>
  407621:	90                   	nop
  407622:	90                   	nop
  407623:	90                   	nop
  407624:	90                   	nop
  407625:	90                   	nop
  407626:	90                   	nop
  407627:	90                   	nop
  407628:	90                   	nop
  407629:	90                   	nop
  40762a:	90                   	nop
  40762b:	90                   	nop
  40762c:	90                   	nop
  40762d:	90                   	nop
  40762e:	90                   	nop
  40762f:	90                   	nop
  407630:	90                   	nop
  407631:	90                   	nop
  407632:	90                   	nop
  407633:	90                   	nop
  407634:	90                   	nop
  407635:	90                   	nop
  407636:	90                   	nop
  407637:	90                   	nop
  407638:	90                   	nop
  407639:	90                   	nop
  40763a:	90                   	nop
  40763b:	90                   	nop
  40763c:	90                   	nop
  40763d:	90                   	nop
  40763e:	90                   	nop
  40763f:	90                   	nop
  407640:	90                   	nop
  407641:	90                   	nop
  407642:	90                   	nop
  407643:	90                   	nop
  407644:	90                   	nop
  407645:	90                   	nop
  407646:	90                   	nop
  407647:	90                   	nop
  407648:	90                   	nop
  407649:	90                   	nop
  40764a:	90                   	nop
  40764b:	90                   	nop
  40764c:	90                   	nop
  40764d:	90                   	nop
  40764e:	90                   	nop
  40764f:	90                   	nop
  407650:	90                   	nop
  407651:	90                   	nop
  407652:	90                   	nop
  407653:	90                   	nop
  407654:	90                   	nop
  407655:	90                   	nop
  407656:	90                   	nop
  407657:	90                   	nop
  407658:	90                   	nop
  407659:	90                   	nop
  40765a:	90                   	nop
  40765b:	90                   	nop
  40765c:	90                   	nop
  40765d:	90                   	nop
  40765e:	90                   	nop
  40765f:	90                   	nop
  407660:	90                   	nop
  407661:	90                   	nop
  407662:	90                   	nop
  407663:	90                   	nop
  407664:	90                   	nop
  407665:	90                   	nop
  407666:	90                   	nop
  407667:	90                   	nop
  407668:	90                   	nop
  407669:	90                   	nop
  40766a:	90                   	nop
  40766b:	90                   	nop
  40766c:	90                   	nop
  40766d:	90                   	nop
  40766e:	90                   	nop
  40766f:	90                   	nop
  407670:	90                   	nop
  407671:	90                   	nop
  407672:	90                   	nop
  407673:	90                   	nop
  407674:	90                   	nop
  407675:	90                   	nop
  407676:	90                   	nop
  407677:	90                   	nop
  407678:	90                   	nop
  407679:	90                   	nop
  40767a:	90                   	nop
  40767b:	90                   	nop
  40767c:	90                   	nop
  40767d:	90                   	nop
  40767e:	90                   	nop
  40767f:	90                   	nop
  407680:	90                   	nop
  407681:	90                   	nop
  407682:	90                   	nop
  407683:	90                   	nop
  407684:	90                   	nop
  407685:	90                   	nop
  407686:	90                   	nop
  407687:	90                   	nop
  407688:	90                   	nop
  407689:	90                   	nop
  40768a:	90                   	nop
  40768b:	90                   	nop
  40768c:	90                   	nop
  40768d:	90                   	nop
  40768e:	90                   	nop
  40768f:	90                   	nop
  407690:	90                   	nop
  407691:	90                   	nop
  407692:	90                   	nop
  407693:	90                   	nop
  407694:	90                   	nop
  407695:	90                   	nop
  407696:	90                   	nop
  407697:	90                   	nop
  407698:	90                   	nop
  407699:	90                   	nop
  40769a:	90                   	nop
  40769b:	90                   	nop
  40769c:	90                   	nop
  40769d:	90                   	nop
  40769e:	90                   	nop
  40769f:	90                   	nop
  4076a0:	90                   	nop
  4076a1:	90                   	nop
  4076a2:	90                   	nop
  4076a3:	90                   	nop
  4076a4:	90                   	nop
  4076a5:	90                   	nop
  4076a6:	90                   	nop
  4076a7:	90                   	nop
  4076a8:	90                   	nop
  4076a9:	90                   	nop
  4076aa:	90                   	nop
  4076ab:	90                   	nop
  4076ac:	90                   	nop
  4076ad:	90                   	nop
  4076ae:	90                   	nop
  4076af:	90                   	nop
  4076b0:	90                   	nop
  4076b1:	90                   	nop
  4076b2:	90                   	nop
  4076b3:	90                   	nop
  4076b4:	90                   	nop
  4076b5:	90                   	nop
  4076b6:	90                   	nop
  4076b7:	90                   	nop
  4076b8:	90                   	nop
  4076b9:	90                   	nop
  4076ba:	90                   	nop
  4076bb:	90                   	nop
  4076bc:	90                   	nop
  4076bd:	90                   	nop
  4076be:	90                   	nop
  4076bf:	90                   	nop
  4076c0:	90                   	nop
  4076c1:	90                   	nop
  4076c2:	90                   	nop
  4076c3:	90                   	nop
  4076c4:	90                   	nop
  4076c5:	90                   	nop
  4076c6:	90                   	nop
  4076c7:	90                   	nop
  4076c8:	90                   	nop
  4076c9:	90                   	nop
  4076ca:	90                   	nop
  4076cb:	90                   	nop
  4076cc:	90                   	nop
  4076cd:	90                   	nop
  4076ce:	90                   	nop
  4076cf:	90                   	nop
  4076d0:	90                   	nop
  4076d1:	90                   	nop
  4076d2:	90                   	nop
  4076d3:	90                   	nop
  4076d4:	90                   	nop
  4076d5:	90                   	nop
  4076d6:	90                   	nop
  4076d7:	90                   	nop
  4076d8:	90                   	nop
  4076d9:	90                   	nop
  4076da:	90                   	nop
  4076db:	90                   	nop
  4076dc:	90                   	nop
  4076dd:	90                   	nop
  4076de:	90                   	nop
  4076df:	90                   	nop
  4076e0:	90                   	nop
  4076e1:	90                   	nop
  4076e2:	90                   	nop
  4076e3:	90                   	nop
  4076e4:	90                   	nop
  4076e5:	90                   	nop
  4076e6:	90                   	nop
  4076e7:	90                   	nop
  4076e8:	90                   	nop
  4076e9:	90                   	nop
  4076ea:	90                   	nop
  4076eb:	90                   	nop
  4076ec:	90                   	nop
  4076ed:	90                   	nop
  4076ee:	90                   	nop
  4076ef:	90                   	nop
  4076f0:	90                   	nop
  4076f1:	90                   	nop
  4076f2:	90                   	nop
  4076f3:	90                   	nop
  4076f4:	90                   	nop
  4076f5:	90                   	nop
  4076f6:	90                   	nop
  4076f7:	90                   	nop
  4076f8:	90                   	nop
  4076f9:	90                   	nop
  4076fa:	90                   	nop
  4076fb:	90                   	nop
  4076fc:	90                   	nop
  4076fd:	90                   	nop
  4076fe:	90                   	nop
  4076ff:	90                   	nop
  407700:	90                   	nop
  407701:	90                   	nop
  407702:	90                   	nop
  407703:	90                   	nop
  407704:	90                   	nop
  407705:	90                   	nop
  407706:	90                   	nop
  407707:	90                   	nop
  407708:	90                   	nop
  407709:	90                   	nop
  40770a:	90                   	nop
  40770b:	90                   	nop
  40770c:	90                   	nop
  40770d:	90                   	nop
  40770e:	90                   	nop
  40770f:	90                   	nop
  407710:	90                   	nop
  407711:	90                   	nop
  407712:	90                   	nop
  407713:	90                   	nop
  407714:	90                   	nop
  407715:	90                   	nop
  407716:	90                   	nop
  407717:	90                   	nop
  407718:	90                   	nop
  407719:	90                   	nop
  40771a:	90                   	nop
  40771b:	90                   	nop
  40771c:	90                   	nop
  40771d:	90                   	nop
  40771e:	90                   	nop
  40771f:	90                   	nop
  407720:	90                   	nop
  407721:	90                   	nop
  407722:	90                   	nop
  407723:	90                   	nop
  407724:	90                   	nop
  407725:	90                   	nop
  407726:	90                   	nop
  407727:	90                   	nop
  407728:	90                   	nop
  407729:	90                   	nop
  40772a:	90                   	nop
  40772b:	90                   	nop
  40772c:	90                   	nop
  40772d:	90                   	nop
  40772e:	90                   	nop
  40772f:	90                   	nop
  407730:	90                   	nop
  407731:	90                   	nop
  407732:	90                   	nop
  407733:	90                   	nop
  407734:	90                   	nop
  407735:	90                   	nop
  407736:	90                   	nop
  407737:	90                   	nop
  407738:	90                   	nop
  407739:	90                   	nop
  40773a:	90                   	nop
  40773b:	90                   	nop
  40773c:	90                   	nop
  40773d:	90                   	nop
  40773e:	90                   	nop
  40773f:	90                   	nop
  407740:	90                   	nop
  407741:	90                   	nop
  407742:	90                   	nop
  407743:	90                   	nop
  407744:	90                   	nop
  407745:	90                   	nop
  407746:	90                   	nop
  407747:	90                   	nop
  407748:	90                   	nop
  407749:	90                   	nop
  40774a:	90                   	nop
  40774b:	90                   	nop
  40774c:	90                   	nop
  40774d:	90                   	nop
  40774e:	90                   	nop
  40774f:	90                   	nop
  407750:	90                   	nop
  407751:	90                   	nop
  407752:	90                   	nop
  407753:	90                   	nop
  407754:	90                   	nop
  407755:	90                   	nop
  407756:	90                   	nop
  407757:	90                   	nop
  407758:	90                   	nop
  407759:	90                   	nop
  40775a:	90                   	nop
  40775b:	90                   	nop
  40775c:	90                   	nop
  40775d:	90                   	nop
  40775e:	90                   	nop
  40775f:	90                   	nop
  407760:	90                   	nop
  407761:	90                   	nop
  407762:	90                   	nop
  407763:	90                   	nop
  407764:	90                   	nop
  407765:	90                   	nop
  407766:	90                   	nop
  407767:	90                   	nop
  407768:	90                   	nop
  407769:	90                   	nop
  40776a:	90                   	nop
  40776b:	90                   	nop
  40776c:	90                   	nop
  40776d:	90                   	nop
  40776e:	90                   	nop
  40776f:	90                   	nop
  407770:	90                   	nop
  407771:	90                   	nop
  407772:	90                   	nop
  407773:	90                   	nop
  407774:	90                   	nop
  407775:	90                   	nop
  407776:	90                   	nop
  407777:	90                   	nop
  407778:	90                   	nop
  407779:	90                   	nop
  40777a:	90                   	nop
  40777b:	90                   	nop
  40777c:	90                   	nop
  40777d:	90                   	nop
  40777e:	90                   	nop
  40777f:	90                   	nop
  407780:	90                   	nop
  407781:	90                   	nop
  407782:	90                   	nop
  407783:	90                   	nop
  407784:	90                   	nop
  407785:	90                   	nop
  407786:	90                   	nop
  407787:	90                   	nop
  407788:	90                   	nop
  407789:	90                   	nop
  40778a:	90                   	nop
  40778b:	90                   	nop
  40778c:	90                   	nop
  40778d:	90                   	nop
  40778e:	90                   	nop
  40778f:	90                   	nop
  407790:	90                   	nop
  407791:	90                   	nop
  407792:	90                   	nop
  407793:	90                   	nop
  407794:	90                   	nop
  407795:	90                   	nop
  407796:	90                   	nop
  407797:	90                   	nop
  407798:	90                   	nop
  407799:	90                   	nop
  40779a:	90                   	nop
  40779b:	90                   	nop
  40779c:	90                   	nop
  40779d:	90                   	nop
  40779e:	90                   	nop
  40779f:	90                   	nop
  4077a0:	90                   	nop
  4077a1:	90                   	nop
  4077a2:	90                   	nop
  4077a3:	90                   	nop
  4077a4:	90                   	nop
  4077a5:	90                   	nop
  4077a6:	90                   	nop
  4077a7:	90                   	nop
  4077a8:	90                   	nop
  4077a9:	90                   	nop
  4077aa:	90                   	nop
  4077ab:	90                   	nop
  4077ac:	90                   	nop
  4077ad:	90                   	nop
  4077ae:	90                   	nop
  4077af:	90                   	nop
  4077b0:	90                   	nop
  4077b1:	90                   	nop
  4077b2:	90                   	nop
  4077b3:	90                   	nop
  4077b4:	90                   	nop
  4077b5:	90                   	nop
  4077b6:	90                   	nop
  4077b7:	90                   	nop
  4077b8:	90                   	nop
  4077b9:	90                   	nop
  4077ba:	90                   	nop
  4077bb:	90                   	nop
  4077bc:	90                   	nop
  4077bd:	90                   	nop
  4077be:	90                   	nop
  4077bf:	90                   	nop
  4077c0:	90                   	nop
  4077c1:	90                   	nop
  4077c2:	90                   	nop
  4077c3:	90                   	nop
  4077c4:	90                   	nop
  4077c5:	90                   	nop
  4077c6:	90                   	nop
  4077c7:	90                   	nop
  4077c8:	90                   	nop
  4077c9:	90                   	nop
  4077ca:	90                   	nop
  4077cb:	90                   	nop
  4077cc:	90                   	nop
  4077cd:	90                   	nop
  4077ce:	90                   	nop
  4077cf:	90                   	nop
  4077d0:	90                   	nop
  4077d1:	90                   	nop
  4077d2:	90                   	nop
  4077d3:	90                   	nop
  4077d4:	90                   	nop
  4077d5:	90                   	nop
  4077d6:	90                   	nop
  4077d7:	90                   	nop
  4077d8:	90                   	nop
  4077d9:	90                   	nop
  4077da:	90                   	nop
  4077db:	90                   	nop
  4077dc:	90                   	nop
  4077dd:	90                   	nop
  4077de:	90                   	nop
  4077df:	90                   	nop
  4077e0:	90                   	nop
  4077e1:	90                   	nop
  4077e2:	90                   	nop
  4077e3:	90                   	nop
  4077e4:	90                   	nop
  4077e5:	90                   	nop
  4077e6:	90                   	nop
  4077e7:	90                   	nop
  4077e8:	90                   	nop
  4077e9:	90                   	nop
  4077ea:	90                   	nop
  4077eb:	90                   	nop
  4077ec:	90                   	nop
  4077ed:	90                   	nop
  4077ee:	90                   	nop
  4077ef:	90                   	nop
  4077f0:	90                   	nop
  4077f1:	90                   	nop
  4077f2:	90                   	nop
  4077f3:	90                   	nop
  4077f4:	90                   	nop
  4077f5:	90                   	nop
  4077f6:	90                   	nop
  4077f7:	90                   	nop
  4077f8:	90                   	nop
  4077f9:	90                   	nop
  4077fa:	90                   	nop
  4077fb:	90                   	nop
  4077fc:	90                   	nop
  4077fd:	90                   	nop
  4077fe:	90                   	nop
  4077ff:	90                   	nop
  407800:	90                   	nop
  407801:	90                   	nop
  407802:	90                   	nop
  407803:	90                   	nop
  407804:	90                   	nop
  407805:	90                   	nop
  407806:	90                   	nop
  407807:	90                   	nop
  407808:	90                   	nop
  407809:	90                   	nop
  40780a:	90                   	nop
  40780b:	90                   	nop
  40780c:	90                   	nop
  40780d:	90                   	nop
  40780e:	90                   	nop
  40780f:	90                   	nop
  407810:	90                   	nop
  407811:	90                   	nop
  407812:	90                   	nop
  407813:	90                   	nop
  407814:	90                   	nop
  407815:	90                   	nop
  407816:	90                   	nop
  407817:	90                   	nop
  407818:	90                   	nop
  407819:	90                   	nop
  40781a:	90                   	nop
  40781b:	90                   	nop
  40781c:	90                   	nop
  40781d:	90                   	nop
  40781e:	90                   	nop
  40781f:	90                   	nop
  407820:	90                   	nop
  407821:	c3                   	ret    
  407822:	90                   	nop
  407823:	90                   	nop
  407824:	90                   	nop
  407825:	90                   	nop
  407826:	90                   	nop
  407827:	90                   	nop
  407828:	90                   	nop
  407829:	90                   	nop
  40782a:	90                   	nop
  40782b:	90                   	nop
  40782c:	90                   	nop
  40782d:	90                   	nop
  40782e:	90                   	nop
  40782f:	90                   	nop
  407830:	90                   	nop
  407831:	90                   	nop
  407832:	90                   	nop
  407833:	90                   	nop
  407834:	90                   	nop
  407835:	90                   	nop
  407836:	90                   	nop
  407837:	90                   	nop
  407838:	90                   	nop
  407839:	90                   	nop
  40783a:	90                   	nop
  40783b:	90                   	nop
  40783c:	90                   	nop
  40783d:	90                   	nop
  40783e:	90                   	nop
  40783f:	90                   	nop
  407840:	90                   	nop
  407841:	90                   	nop
  407842:	90                   	nop
  407843:	90                   	nop
  407844:	90                   	nop
  407845:	90                   	nop
  407846:	90                   	nop
  407847:	90                   	nop
  407848:	90                   	nop
  407849:	90                   	nop
  40784a:	90                   	nop
  40784b:	90                   	nop
  40784c:	90                   	nop
  40784d:	90                   	nop
  40784e:	90                   	nop
  40784f:	90                   	nop
  407850:	90                   	nop
  407851:	90                   	nop
  407852:	90                   	nop
  407853:	90                   	nop
  407854:	90                   	nop
  407855:	90                   	nop
  407856:	90                   	nop
  407857:	90                   	nop
  407858:	90                   	nop
  407859:	90                   	nop
  40785a:	90                   	nop
  40785b:	90                   	nop
  40785c:	90                   	nop
  40785d:	90                   	nop
  40785e:	90                   	nop
  40785f:	90                   	nop
  407860:	90                   	nop
  407861:	90                   	nop
  407862:	90                   	nop
  407863:	90                   	nop
  407864:	90                   	nop
  407865:	90                   	nop
  407866:	90                   	nop
  407867:	90                   	nop
  407868:	90                   	nop
  407869:	90                   	nop
  40786a:	90                   	nop
  40786b:	90                   	nop
  40786c:	90                   	nop
  40786d:	90                   	nop
  40786e:	90                   	nop
  40786f:	90                   	nop
  407870:	90                   	nop
  407871:	90                   	nop
  407872:	90                   	nop
  407873:	90                   	nop
  407874:	90                   	nop
  407875:	90                   	nop
  407876:	90                   	nop
  407877:	90                   	nop
  407878:	90                   	nop
  407879:	90                   	nop
  40787a:	90                   	nop
  40787b:	90                   	nop
  40787c:	90                   	nop
  40787d:	90                   	nop
  40787e:	90                   	nop
  40787f:	90                   	nop
  407880:	90                   	nop
  407881:	90                   	nop
  407882:	90                   	nop
  407883:	90                   	nop
  407884:	90                   	nop
  407885:	90                   	nop
  407886:	90                   	nop
  407887:	90                   	nop
  407888:	90                   	nop
  407889:	90                   	nop
  40788a:	90                   	nop
  40788b:	90                   	nop
  40788c:	90                   	nop
  40788d:	90                   	nop
  40788e:	90                   	nop
  40788f:	90                   	nop
  407890:	90                   	nop
  407891:	90                   	nop
  407892:	90                   	nop
  407893:	90                   	nop
  407894:	90                   	nop
  407895:	90                   	nop
  407896:	90                   	nop
  407897:	90                   	nop
  407898:	90                   	nop
  407899:	90                   	nop
  40789a:	90                   	nop
  40789b:	90                   	nop
  40789c:	90                   	nop
  40789d:	90                   	nop
  40789e:	90                   	nop
  40789f:	90                   	nop
  4078a0:	90                   	nop
  4078a1:	90                   	nop
  4078a2:	90                   	nop
  4078a3:	90                   	nop
  4078a4:	90                   	nop
  4078a5:	90                   	nop
  4078a6:	90                   	nop
  4078a7:	90                   	nop
  4078a8:	90                   	nop
  4078a9:	90                   	nop
  4078aa:	90                   	nop
  4078ab:	90                   	nop
  4078ac:	90                   	nop
  4078ad:	90                   	nop
  4078ae:	90                   	nop
  4078af:	90                   	nop
  4078b0:	90                   	nop
  4078b1:	90                   	nop
  4078b2:	90                   	nop
  4078b3:	90                   	nop
  4078b4:	90                   	nop
  4078b5:	90                   	nop
  4078b6:	90                   	nop
  4078b7:	90                   	nop
  4078b8:	90                   	nop
  4078b9:	90                   	nop
  4078ba:	90                   	nop
  4078bb:	90                   	nop
  4078bc:	90                   	nop
  4078bd:	90                   	nop
  4078be:	90                   	nop
  4078bf:	90                   	nop
  4078c0:	90                   	nop
  4078c1:	90                   	nop
  4078c2:	90                   	nop
  4078c3:	90                   	nop
  4078c4:	90                   	nop
  4078c5:	90                   	nop
  4078c6:	90                   	nop
  4078c7:	90                   	nop
  4078c8:	90                   	nop
  4078c9:	90                   	nop
  4078ca:	90                   	nop
  4078cb:	90                   	nop
  4078cc:	90                   	nop
  4078cd:	90                   	nop
  4078ce:	90                   	nop
  4078cf:	90                   	nop
  4078d0:	90                   	nop
  4078d1:	90                   	nop
  4078d2:	90                   	nop
  4078d3:	90                   	nop
  4078d4:	90                   	nop
  4078d5:	90                   	nop
  4078d6:	90                   	nop
  4078d7:	90                   	nop
  4078d8:	90                   	nop
  4078d9:	90                   	nop
  4078da:	90                   	nop
  4078db:	90                   	nop
  4078dc:	90                   	nop
  4078dd:	90                   	nop
  4078de:	90                   	nop
  4078df:	90                   	nop
  4078e0:	90                   	nop
  4078e1:	90                   	nop
  4078e2:	90                   	nop
  4078e3:	90                   	nop
  4078e4:	90                   	nop
  4078e5:	90                   	nop
  4078e6:	90                   	nop
  4078e7:	90                   	nop
  4078e8:	90                   	nop
  4078e9:	90                   	nop
  4078ea:	90                   	nop
  4078eb:	90                   	nop
  4078ec:	90                   	nop
  4078ed:	90                   	nop
  4078ee:	90                   	nop
  4078ef:	90                   	nop
  4078f0:	90                   	nop
  4078f1:	90                   	nop
  4078f2:	90                   	nop
  4078f3:	90                   	nop
  4078f4:	90                   	nop
  4078f5:	90                   	nop
  4078f6:	90                   	nop
  4078f7:	90                   	nop
  4078f8:	90                   	nop
  4078f9:	90                   	nop
  4078fa:	90                   	nop
  4078fb:	90                   	nop
  4078fc:	90                   	nop
  4078fd:	90                   	nop
  4078fe:	90                   	nop
  4078ff:	90                   	nop
  407900:	90                   	nop
  407901:	90                   	nop
  407902:	90                   	nop
  407903:	90                   	nop
  407904:	90                   	nop
  407905:	90                   	nop
  407906:	90                   	nop
  407907:	90                   	nop
  407908:	90                   	nop
  407909:	90                   	nop
  40790a:	90                   	nop
  40790b:	90                   	nop
  40790c:	90                   	nop
  40790d:	90                   	nop
  40790e:	90                   	nop
  40790f:	90                   	nop
  407910:	90                   	nop
  407911:	90                   	nop
  407912:	90                   	nop
  407913:	90                   	nop
  407914:	90                   	nop
  407915:	90                   	nop
  407916:	90                   	nop
  407917:	90                   	nop
  407918:	90                   	nop
  407919:	90                   	nop
  40791a:	90                   	nop
  40791b:	90                   	nop
  40791c:	90                   	nop
  40791d:	90                   	nop
  40791e:	90                   	nop
  40791f:	90                   	nop
  407920:	90                   	nop
  407921:	90                   	nop
  407922:	90                   	nop
  407923:	90                   	nop
  407924:	90                   	nop
  407925:	90                   	nop
  407926:	90                   	nop
  407927:	90                   	nop
  407928:	90                   	nop
  407929:	90                   	nop
  40792a:	90                   	nop
  40792b:	90                   	nop
  40792c:	90                   	nop
  40792d:	90                   	nop
  40792e:	90                   	nop
  40792f:	90                   	nop
  407930:	90                   	nop
  407931:	90                   	nop
  407932:	90                   	nop
  407933:	90                   	nop
  407934:	90                   	nop
  407935:	90                   	nop
  407936:	90                   	nop
  407937:	90                   	nop
  407938:	90                   	nop
  407939:	90                   	nop
  40793a:	90                   	nop
  40793b:	90                   	nop
  40793c:	90                   	nop
  40793d:	90                   	nop
  40793e:	90                   	nop
  40793f:	90                   	nop
  407940:	90                   	nop
  407941:	90                   	nop
  407942:	90                   	nop
  407943:	90                   	nop
  407944:	90                   	nop
  407945:	90                   	nop
  407946:	90                   	nop
  407947:	90                   	nop
  407948:	90                   	nop
  407949:	90                   	nop
  40794a:	90                   	nop
  40794b:	90                   	nop
  40794c:	90                   	nop
  40794d:	90                   	nop
  40794e:	90                   	nop
  40794f:	90                   	nop
  407950:	90                   	nop
  407951:	90                   	nop
  407952:	90                   	nop
  407953:	90                   	nop
  407954:	90                   	nop
  407955:	90                   	nop
  407956:	90                   	nop
  407957:	90                   	nop
  407958:	90                   	nop
  407959:	90                   	nop
  40795a:	90                   	nop
  40795b:	90                   	nop
  40795c:	90                   	nop
  40795d:	90                   	nop
  40795e:	90                   	nop
  40795f:	90                   	nop
  407960:	90                   	nop
  407961:	90                   	nop
  407962:	90                   	nop
  407963:	90                   	nop
  407964:	90                   	nop
  407965:	90                   	nop
  407966:	90                   	nop
  407967:	90                   	nop
  407968:	90                   	nop
  407969:	90                   	nop
  40796a:	90                   	nop
  40796b:	90                   	nop
  40796c:	90                   	nop
  40796d:	90                   	nop
  40796e:	90                   	nop
  40796f:	90                   	nop
  407970:	90                   	nop
  407971:	90                   	nop
  407972:	90                   	nop
  407973:	90                   	nop
  407974:	90                   	nop
  407975:	90                   	nop
  407976:	90                   	nop
  407977:	90                   	nop
  407978:	90                   	nop
  407979:	90                   	nop
  40797a:	90                   	nop
  40797b:	90                   	nop
  40797c:	90                   	nop
  40797d:	90                   	nop
  40797e:	90                   	nop
  40797f:	90                   	nop
  407980:	90                   	nop
  407981:	90                   	nop
  407982:	90                   	nop
  407983:	90                   	nop
  407984:	90                   	nop
  407985:	90                   	nop
  407986:	90                   	nop
  407987:	90                   	nop
  407988:	90                   	nop
  407989:	90                   	nop
  40798a:	90                   	nop
  40798b:	90                   	nop
  40798c:	90                   	nop
  40798d:	90                   	nop
  40798e:	90                   	nop
  40798f:	90                   	nop
  407990:	90                   	nop
  407991:	90                   	nop
  407992:	90                   	nop
  407993:	90                   	nop
  407994:	90                   	nop
  407995:	90                   	nop
  407996:	90                   	nop
  407997:	90                   	nop
  407998:	90                   	nop
  407999:	90                   	nop
  40799a:	90                   	nop
  40799b:	90                   	nop
  40799c:	90                   	nop
  40799d:	90                   	nop
  40799e:	90                   	nop
  40799f:	90                   	nop
  4079a0:	90                   	nop
  4079a1:	90                   	nop
  4079a2:	90                   	nop
  4079a3:	90                   	nop
  4079a4:	90                   	nop
  4079a5:	90                   	nop
  4079a6:	90                   	nop
  4079a7:	90                   	nop
  4079a8:	90                   	nop
  4079a9:	90                   	nop
  4079aa:	90                   	nop
  4079ab:	90                   	nop
  4079ac:	90                   	nop
  4079ad:	90                   	nop
  4079ae:	90                   	nop
  4079af:	90                   	nop
  4079b0:	90                   	nop
  4079b1:	90                   	nop
  4079b2:	90                   	nop
  4079b3:	90                   	nop
  4079b4:	90                   	nop
  4079b5:	90                   	nop
  4079b6:	90                   	nop
  4079b7:	90                   	nop
  4079b8:	90                   	nop
  4079b9:	90                   	nop
  4079ba:	90                   	nop
  4079bb:	90                   	nop
  4079bc:	90                   	nop
  4079bd:	90                   	nop
  4079be:	90                   	nop
  4079bf:	90                   	nop
  4079c0:	90                   	nop
  4079c1:	90                   	nop
  4079c2:	90                   	nop
  4079c3:	90                   	nop
  4079c4:	90                   	nop
  4079c5:	90                   	nop
  4079c6:	90                   	nop
  4079c7:	90                   	nop
  4079c8:	90                   	nop
  4079c9:	90                   	nop
  4079ca:	90                   	nop
  4079cb:	90                   	nop
  4079cc:	90                   	nop
  4079cd:	90                   	nop
  4079ce:	90                   	nop
  4079cf:	90                   	nop
  4079d0:	90                   	nop
  4079d1:	90                   	nop
  4079d2:	90                   	nop
  4079d3:	90                   	nop
  4079d4:	90                   	nop
  4079d5:	90                   	nop
  4079d6:	90                   	nop
  4079d7:	90                   	nop
  4079d8:	90                   	nop
  4079d9:	90                   	nop
  4079da:	90                   	nop
  4079db:	90                   	nop
  4079dc:	90                   	nop
  4079dd:	90                   	nop
  4079de:	90                   	nop
  4079df:	90                   	nop
  4079e0:	90                   	nop
  4079e1:	90                   	nop
  4079e2:	90                   	nop
  4079e3:	90                   	nop
  4079e4:	90                   	nop
  4079e5:	90                   	nop
  4079e6:	90                   	nop
  4079e7:	90                   	nop
  4079e8:	90                   	nop
  4079e9:	90                   	nop
  4079ea:	90                   	nop
  4079eb:	90                   	nop
  4079ec:	90                   	nop
  4079ed:	90                   	nop
  4079ee:	90                   	nop
  4079ef:	90                   	nop
  4079f0:	90                   	nop
  4079f1:	90                   	nop
  4079f2:	90                   	nop
  4079f3:	90                   	nop
  4079f4:	90                   	nop
  4079f5:	90                   	nop
  4079f6:	90                   	nop
  4079f7:	90                   	nop
  4079f8:	90                   	nop
  4079f9:	90                   	nop
  4079fa:	90                   	nop
  4079fb:	90                   	nop
  4079fc:	90                   	nop
  4079fd:	90                   	nop
  4079fe:	90                   	nop
  4079ff:	90                   	nop
  407a00:	90                   	nop
  407a01:	90                   	nop
  407a02:	90                   	nop
  407a03:	90                   	nop
  407a04:	90                   	nop
  407a05:	90                   	nop
  407a06:	90                   	nop
  407a07:	90                   	nop
  407a08:	90                   	nop
  407a09:	90                   	nop
  407a0a:	90                   	nop
  407a0b:	90                   	nop
  407a0c:	90                   	nop
  407a0d:	90                   	nop
  407a0e:	90                   	nop
  407a0f:	90                   	nop
  407a10:	90                   	nop
  407a11:	90                   	nop
  407a12:	90                   	nop
  407a13:	90                   	nop
  407a14:	90                   	nop
  407a15:	90                   	nop
  407a16:	90                   	nop
  407a17:	90                   	nop
  407a18:	90                   	nop
  407a19:	90                   	nop
  407a1a:	90                   	nop
  407a1b:	90                   	nop
  407a1c:	90                   	nop
  407a1d:	90                   	nop
  407a1e:	90                   	nop
  407a1f:	90                   	nop
  407a20:	90                   	nop
  407a21:	90                   	nop

Disassembly of section .fini:

0000000000407a24 <_fini>:
  407a24:	f3 0f 1e fa          	endbr64 
  407a28:	48 83 ec 08          	sub    $0x8,%rsp
  407a2c:	48 83 c4 08          	add    $0x8,%rsp
  407a30:	c3                   	ret    
