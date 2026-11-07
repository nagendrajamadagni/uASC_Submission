
./x_test_p1:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	f3 0f 1e fa          	endbr64 
  401004:	48 83 ec 08          	sub    $0x8,%rsp
  401008:	48 8b 05 e9 1f c0 00 	mov    0xc01fe9(%rip),%rax        # 1002ff8 <__gmon_start__@Base>
  40100f:	48 85 c0             	test   %rax,%rax
  401012:	74 02                	je     401016 <_init+0x16>
  401014:	ff d0                	call   *%rax
  401016:	48 83 c4 08          	add    $0x8,%rsp
  40101a:	c3                   	ret    

Disassembly of section .plt:

0000000000401020 <__printf_chk@plt-0x10>:
  401020:	ff 35 e2 1f c0 00    	push   0xc01fe2(%rip)        # 1003008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	ff 25 e4 1f c0 00    	jmp    *0xc01fe4(%rip)        # 1003010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401030 <__printf_chk@plt>:
  401030:	ff 25 e2 1f c0 00    	jmp    *0xc01fe2(%rip)        # 1003018 <__printf_chk@GLIBC_2.3.4>
  401036:	68 00 00 00 00       	push   $0x0
  40103b:	e9 e0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401040 <strstr@plt>:
  401040:	ff 25 da 1f c0 00    	jmp    *0xc01fda(%rip)        # 1003020 <strstr@GLIBC_2.2.5>
  401046:	68 01 00 00 00       	push   $0x1
  40104b:	e9 d0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401050 <setpriority@plt>:
  401050:	ff 25 d2 1f c0 00    	jmp    *0xc01fd2(%rip)        # 1003028 <setpriority@GLIBC_2.2.5>
  401056:	68 02 00 00 00       	push   $0x2
  40105b:	e9 c0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401060 <memset@plt>:
  401060:	ff 25 ca 1f c0 00    	jmp    *0xc01fca(%rip)        # 1003030 <memset@GLIBC_2.2.5>
  401066:	68 03 00 00 00       	push   $0x3
  40106b:	e9 b0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401070 <open@plt>:
  401070:	ff 25 c2 1f c0 00    	jmp    *0xc01fc2(%rip)        # 1003038 <open@GLIBC_2.2.5>
  401076:	68 04 00 00 00       	push   $0x4
  40107b:	e9 a0 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401080 <sched_setaffinity@plt>:
  401080:	ff 25 ba 1f c0 00    	jmp    *0xc01fba(%rip)        # 1003040 <sched_setaffinity@GLIBC_2.3.4>
  401086:	68 05 00 00 00       	push   $0x5
  40108b:	e9 90 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401090 <perror@plt>:
  401090:	ff 25 b2 1f c0 00    	jmp    *0xc01fb2(%rip)        # 1003048 <perror@GLIBC_2.2.5>
  401096:	68 06 00 00 00       	push   $0x6
  40109b:	e9 80 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010a0 <__cxa_atexit@plt>:
  4010a0:	ff 25 aa 1f c0 00    	jmp    *0xc01faa(%rip)        # 1003050 <__cxa_atexit@GLIBC_2.2.5>
  4010a6:	68 07 00 00 00       	push   $0x7
  4010ab:	e9 70 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010b0 <pthread_join@plt>:
  4010b0:	ff 25 a2 1f c0 00    	jmp    *0xc01fa2(%rip)        # 1003058 <pthread_join@GLIBC_2.34>
  4010b6:	68 08 00 00 00       	push   $0x8
  4010bb:	e9 60 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010c0 <gettid@plt>:
  4010c0:	ff 25 9a 1f c0 00    	jmp    *0xc01f9a(%rip)        # 1003060 <gettid@GLIBC_2.30>
  4010c6:	68 09 00 00 00       	push   $0x9
  4010cb:	e9 50 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010d0 <__stack_chk_fail@plt>:
  4010d0:	ff 25 92 1f c0 00    	jmp    *0xc01f92(%rip)        # 1003068 <__stack_chk_fail@GLIBC_2.4>
  4010d6:	68 0a 00 00 00       	push   $0xa
  4010db:	e9 40 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010e0 <exit@plt>:
  4010e0:	ff 25 8a 1f c0 00    	jmp    *0xc01f8a(%rip)        # 1003070 <exit@GLIBC_2.2.5>
  4010e6:	68 0b 00 00 00       	push   $0xb
  4010eb:	e9 30 ff ff ff       	jmp    401020 <_init+0x20>

00000000004010f0 <ftruncate@plt>:
  4010f0:	ff 25 82 1f c0 00    	jmp    *0xc01f82(%rip)        # 1003078 <ftruncate@GLIBC_2.2.5>
  4010f6:	68 0c 00 00 00       	push   $0xc
  4010fb:	e9 20 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401100 <putchar@plt>:
  401100:	ff 25 7a 1f c0 00    	jmp    *0xc01f7a(%rip)        # 1003080 <putchar@GLIBC_2.2.5>
  401106:	68 0d 00 00 00       	push   $0xd
  40110b:	e9 10 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401110 <strtol@plt>:
  401110:	ff 25 72 1f c0 00    	jmp    *0xc01f72(%rip)        # 1003088 <strtol@GLIBC_2.2.5>
  401116:	68 0e 00 00 00       	push   $0xe
  40111b:	e9 00 ff ff ff       	jmp    401020 <_init+0x20>

0000000000401120 <ioctl@plt>:
  401120:	ff 25 6a 1f c0 00    	jmp    *0xc01f6a(%rip)        # 1003090 <ioctl@GLIBC_2.2.5>
  401126:	68 0f 00 00 00       	push   $0xf
  40112b:	e9 f0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401130 <sched_yield@plt>:
  401130:	ff 25 62 1f c0 00    	jmp    *0xc01f62(%rip)        # 1003098 <sched_yield@GLIBC_2.2.5>
  401136:	68 10 00 00 00       	push   $0x10
  40113b:	e9 e0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401140 <sched_getaffinity@plt>:
  401140:	ff 25 5a 1f c0 00    	jmp    *0xc01f5a(%rip)        # 10030a0 <sched_getaffinity@GLIBC_2.3.4>
  401146:	68 11 00 00 00       	push   $0x11
  40114b:	e9 d0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401150 <shm_open@plt>:
  401150:	ff 25 52 1f c0 00    	jmp    *0xc01f52(%rip)        # 10030a8 <shm_open@GLIBC_2.34>
  401156:	68 12 00 00 00       	push   $0x12
  40115b:	e9 c0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401160 <_Unwind_Resume@plt>:
  401160:	ff 25 4a 1f c0 00    	jmp    *0xc01f4a(%rip)        # 10030b0 <_Unwind_Resume@GCC_3.0>
  401166:	68 13 00 00 00       	push   $0x13
  40116b:	e9 b0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401170 <mmap@plt>:
  401170:	ff 25 42 1f c0 00    	jmp    *0xc01f42(%rip)        # 10030b8 <mmap@GLIBC_2.2.5>
  401176:	68 14 00 00 00       	push   $0x14
  40117b:	e9 a0 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401180 <pthread_create@plt>:
  401180:	ff 25 3a 1f c0 00    	jmp    *0xc01f3a(%rip)        # 10030c0 <pthread_create@GLIBC_2.34>
  401186:	68 15 00 00 00       	push   $0x15
  40118b:	e9 90 fe ff ff       	jmp    401020 <_init+0x20>

0000000000401190 <close@plt>:
  401190:	ff 25 32 1f c0 00    	jmp    *0xc01f32(%rip)        # 10030c8 <close@GLIBC_2.2.5>
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
  40121b:	48 8d 3d 8f 03 c0 00 	lea    0xc0038f(%rip),%rdi        # 10015b1 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x171>
  401222:	be 42 00 00 00       	mov    $0x42,%esi
  401227:	e8 24 ff ff ff       	call   401150 <shm_open@plt>
  40122c:	ba ff 01 00 00       	mov    $0x1ff,%edx
  401231:	be 42 00 00 00       	mov    $0x42,%esi
  401236:	48 8d 3d 81 03 c0 00 	lea    0xc00381(%rip),%rdi        # 10015be <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x17e>
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
  4012c3:	48 89 05 b2 7b c0 00 	mov    %rax,0xc07bb2(%rip)        # 1008e7c <PSharedMemory>
  4012ca:	e8 a1 fe ff ff       	call   401170 <mmap@plt>
  4012cf:	48 8b 15 a6 7b c0 00 	mov    0xc07ba6(%rip),%rdx        # 1008e7c <PSharedMemory>
  4012d6:	48 89 05 a7 7b c0 00 	mov    %rax,0xc07ba7(%rip)        # 1008e84 <PSharedMemory2>
  4012dd:	48 89 c1             	mov    %rax,%rcx
  4012e0:	48 83 fa ff          	cmp    $0xffffffffffffffff,%rdx
  4012e4:	0f 84 ff 09 00 00    	je     401ce9 <main+0xb19>
  4012ea:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  4012ee:	0f 84 f5 09 00 00    	je     401ce9 <main+0xb19>
  4012f4:	48 8d 35 e5 fe bf 00 	lea    0xbffee5(%rip),%rsi        # 10011e0 <_IO_stdin_used+0x1e0>
  4012fb:	bf 01 00 00 00       	mov    $0x1,%edi
  401300:	31 c0                	xor    %eax,%eax
  401302:	e8 29 fd ff ff       	call   401030 <__printf_chk@plt>
  401307:	48 8b 05 76 7b c0 00 	mov    0xc07b76(%rip),%rax        # 1008e84 <PSharedMemory2>
  40130e:	bf 01 00 00 00       	mov    $0x1,%edi
  401313:	48 8d 35 f6 fe bf 00 	lea    0xbffef6(%rip),%rsi        # 1001210 <_IO_stdin_used+0x210>
  40131a:	8b 08                	mov    (%rax),%ecx
  40131c:	48 8b 05 59 7b c0 00 	mov    0xc07b59(%rip),%rax        # 1008e7c <PSharedMemory>
  401323:	8b 10                	mov    (%rax),%edx
  401325:	31 c0                	xor    %eax,%eax
  401327:	e8 04 fd ff ff       	call   401030 <__printf_chk@plt>
  40132c:	83 fd 01             	cmp    $0x1,%ebp
  40132f:	7e 27                	jle    401358 <main+0x188>
  401331:	4d 8b 6c 24 08       	mov    0x8(%r12),%r13
  401336:	48 8d 35 a7 02 c0 00 	lea    0xc002a7(%rip),%rsi        # 10015e4 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1a4>
  40133d:	4c 89 ef             	mov    %r13,%rdi
  401340:	e8 fb fc ff ff       	call   401040 <strstr@plt>
  401345:	48 85 c0             	test   %rax,%rax
  401348:	0f 84 c4 07 00 00    	je     401b12 <main+0x942>
  40134e:	c7 05 98 46 c1 01 01 	movl   $0x1,0x1c14698(%rip)        # 20159f0 <diagnostics>
  401355:	00 00 00 
  401358:	81 3d be 7a c0 00 d0 	cmpl   $0x7d0,0xc07abe(%rip)        # 1008e20 <NumThreads>
  40135f:	07 00 00 
  401362:	0f 8f 58 07 00 00    	jg     401ac0 <main+0x8f0>
  401368:	8b 35 b2 7a c0 00    	mov    0xc07ab2(%rip),%esi        # 1008e20 <NumThreads>
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
  4013e7:	4c 8d 2d f2 7e 40 01 	lea    0x1407ef2(%rip),%r13        # 18092e0 <MSRCounters>
  4013ee:	4c 89 ef             	mov    %r13,%rdi
  4013f1:	e8 4a 18 00 00       	call   402c40 <_ZN9CCounters18GetProcessorVendorEv>
  4013f6:	4c 89 ef             	mov    %r13,%rdi
  4013f9:	e8 b2 18 00 00       	call   402cb0 <_ZN9CCounters18GetProcessorFamilyEv>
  4013fe:	8b 15 1c 7a c0 00    	mov    0xc07a1c(%rip),%edx        # 1008e20 <NumThreads>
  401404:	8d 42 ff             	lea    -0x1(%rdx),%eax
  401407:	85 d2                	test   %edx,%edx
  401409:	0f 8e b1 00 00 00    	jle    4014c0 <main+0x2f0>
  40140f:	41 89 d8             	mov    %ebx,%r8d
  401412:	8b 3d 1c 7f 40 01    	mov    0x1407f1c(%rip),%edi        # 1809334 <MSRCounters+0x54>
  401418:	31 c9                	xor    %ecx,%ecx
  40141a:	48 8d 35 bf 1d c1 01 	lea    0x1c11dbf(%rip),%rsi        # 20131e0 <ProcNum>
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
  401450:	48 8d 35 f9 fd bf 00 	lea    0xbffdf9(%rip),%rsi        # 1001250 <_IO_stdin_used+0x250>
  401457:	bf 01 00 00 00       	mov    $0x1,%edi
  40145c:	31 c0                	xor    %eax,%eax
  40145e:	31 db                	xor    %ebx,%ebx
  401460:	e8 cb fb ff ff       	call   401030 <__printf_chk@plt>
  401465:	48 8d 2d 96 01 c0 00 	lea    0xc00196(%rip),%rbp        # 1001602 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1c2>
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
  4014d0:	8b 05 1a 45 c1 01    	mov    0x1c1451a(%rip),%eax        # 20159f0 <diagnostics>
  4014d6:	89 44 24 14          	mov    %eax,0x14(%rsp)
  4014da:	85 c0                	test   %eax,%eax
  4014dc:	0f 85 99 07 00 00    	jne    401c7b <main+0xaab>
  4014e2:	83 3d 2f 79 c0 00 00 	cmpl   $0x0,0xc0792f(%rip)        # 1008e18 <UsePMC>
  4014e9:	0f 85 46 07 00 00    	jne    401c35 <main+0xa65>
  4014ef:	31 ff                	xor    %edi,%edi
  4014f1:	ba ec ff ff ff       	mov    $0xffffffec,%edx
  4014f6:	31 f6                	xor    %esi,%esi
  4014f8:	e8 53 fb ff ff       	call   401050 <setpriority@plt>
  4014fd:	8b 15 1d 79 c0 00    	mov    0xc0791d(%rip),%edx        # 1008e20 <NumThreads>
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
  40154f:	4c 8d 3d b1 00 c0 00 	lea    0xc000b1(%rip),%r15        # 1001607 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1c7>
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
  4015f1:	c7 05 25 78 c0 00 01 	movl   $0x1,0xc07825(%rip)        # 1008e20 <NumThreads>
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
  40167d:	8b 3d b5 77 c0 00    	mov    0xc077b5(%rip),%edi        # 1008e38 <CustomPMCResultsOS>
  401683:	48 63 05 9e 77 c0 00 	movslq 0xc0779e(%rip),%rax        # 1008e28 <ClockResultsOS>
  40168a:	4c 63 25 a3 77 c0 00 	movslq 0xc077a3(%rip),%r12        # 1008e34 <PMCResultsOS>
  401691:	89 7c 24 18          	mov    %edi,0x18(%rsp)
  401695:	8b 3d 91 77 c0 00    	mov    0xc07791(%rip),%edi        # 1008e2c <CustomClockResultsOS>
  40169b:	48 c1 e8 02          	shr    $0x2,%rax
  40169f:	49 c1 ec 02          	shr    $0x2,%r12
  4016a3:	83 3d ae dc c0 01 00 	cmpl   $0x0,0x1c0dcae(%rip)        # 200f358 <repetitions>
  4016aa:	89 7c 24 1c          	mov    %edi,0x1c(%rsp)
  4016ae:	0f 8e 09 02 00 00    	jle    4018bd <main+0x6ed>
  4016b4:	48 98                	cltq   
  4016b6:	45 31 ed             	xor    %r13d,%r13d
  4016b9:	4c 8d 35 64 ff bf 00 	lea    0xbfff64(%rip),%r14        # 1001624 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1e4>
  4016c0:	4c 8d 3c 85 00 00 00 	lea    0x0(,%rax,4),%r15
  4016c7:	00 
  4016c8:	48 8d 05 54 ff bf 00 	lea    0xbfff54(%rip),%rax        # 1001623 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1e3>
  4016cf:	48 89 04 24          	mov    %rax,(%rsp)
  4016d3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  4016d8:	48 8b 05 21 77 c0 00 	mov    0xc07721(%rip),%rax        # 1008e00 <PThreadData>
  4016df:	48 8b 34 24          	mov    (%rsp),%rsi
  4016e3:	bf 01 00 00 00       	mov    $0x1,%edi
  4016e8:	44 89 ed             	mov    %r13d,%ebp
  4016eb:	42 8b 1c 38          	mov    (%rax,%r15,1),%ebx
  4016ef:	31 c0                	xor    %eax,%eax
  4016f1:	89 da                	mov    %ebx,%edx
  4016f3:	e8 38 f9 ff ff       	call   401030 <__printf_chk@plt>
  4016f8:	8b 0d 1a 77 c0 00    	mov    0xc0771a(%rip),%ecx        # 1008e18 <UsePMC>
  4016fe:	85 c9                	test   %ecx,%ecx
  401700:	74 52                	je     401754 <main+0x584>
  401702:	81 3d 2c 7c 40 01 00 	cmpl   $0x2000,0x1407c2c(%rip)        # 1809338 <MSRCounters+0x58>
  401709:	20 00 00 
  40170c:	0f 84 d0 03 00 00    	je     401ae2 <main+0x912>
  401712:	8b 15 f0 76 c0 00    	mov    0xc076f0(%rip),%edx        # 1008e08 <NumCounters>
  401718:	85 d2                	test   %edx,%edx
  40171a:	7e 38                	jle    401754 <main+0x584>
  40171c:	31 db                	xor    %ebx,%ebx
  40171e:	66 90                	xchg   %ax,%ax
  401720:	8b 05 32 dc c0 01    	mov    0x1c0dc32(%rip),%eax        # 200f358 <repetitions>
  401726:	48 8b 15 d3 76 c0 00 	mov    0xc076d3(%rip),%rdx        # 1008e00 <PThreadData>
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
  40174c:	39 1d b6 76 c0 00    	cmp    %ebx,0xc076b6(%rip)        # 1008e08 <NumCounters>
  401752:	7f cc                	jg     401720 <main+0x550>
  401754:	8b 35 3a 77 c0 00    	mov    0xc0773a(%rip),%esi        # 1008e94 <RatioOut>
  40175a:	85 f6                	test   %esi,%esi
  40175c:	0f 84 8c 00 00 00    	je     4017ee <main+0x61e>
  401762:	8b 15 30 77 c0 00    	mov    0xc07730(%rip),%edx        # 1008e98 <RatioOut+0x4>
  401768:	8b 05 32 77 c0 00    	mov    0xc07732(%rip),%eax        # 1008ea0 <RatioOut+0xc>
  40176e:	8b 0d 28 77 c0 00    	mov    0xc07728(%rip),%ecx        # 1008e9c <RatioOut+0x8>
  401774:	85 d2                	test   %edx,%edx
  401776:	0f 85 70 02 00 00    	jne    4019ec <main+0x81c>
  40177c:	48 8b 15 7d 76 c0 00 	mov    0xc0767d(%rip),%rdx        # 1008e00 <PThreadData>
  401783:	81 3d ab 7b 40 01 00 	cmpl   $0x2000,0x1407bab(%rip)        # 1809338 <MSRCounters+0x58>
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
  4017cd:	48 8d 35 5f fe bf 00 	lea    0xbffe5f(%rip),%rsi        # 1001633 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1f3>
  4017d4:	f2 0f 59 c1          	mulsd  %xmm1,%xmm0
  4017d8:	66 0f ef c9          	pxor   %xmm1,%xmm1
  4017dc:	f2 0f 2a cf          	cvtsi2sd %edi,%xmm1
  4017e0:	bf 01 00 00 00       	mov    $0x1,%edi
  4017e5:	f2 0f 5e c1          	divsd  %xmm1,%xmm0
  4017e9:	e8 42 f8 ff ff       	call   401030 <__printf_chk@plt>
  4017ee:	8b 15 b0 76 c0 00    	mov    0xc076b0(%rip),%edx        # 1008ea4 <TempOut>
  4017f4:	85 d2                	test   %edx,%edx
  4017f6:	0f 84 ac 00 00 00    	je     4018a8 <main+0x6d8>
  4017fc:	48 8b 0d fd 75 c0 00 	mov    0xc075fd(%rip),%rcx        # 1008e00 <PThreadData>
  401803:	4a 8d 04 ad 00 00 00 	lea    0x0(,%r13,4),%rax
  40180a:	00 
  40180b:	48 01 c1             	add    %rax,%rcx
  40180e:	48 01 c8             	add    %rcx,%rax
  401811:	f6 c2 01             	test   $0x1,%dl
  401814:	48 0f 45 c8          	cmovne %rax,%rcx
  401818:	83 fa 08             	cmp    $0x8,%edx
  40181b:	77 74                	ja     401891 <main+0x6c1>
  40181d:	48 8d 35 e4 fb bf 00 	lea    0xbffbe4(%rip),%rsi        # 1001408 <_IO_stdin_used+0x408>
  401824:	89 d0                	mov    %edx,%eax
  401826:	48 63 04 86          	movslq (%rsi,%rax,4),%rax
  40182a:	48 01 f0             	add    %rsi,%rax
  40182d:	3e ff e0             	notrack jmp *%rax
  401830:	66 0f ef c0          	pxor   %xmm0,%xmm0
  401834:	f2 0f 10 0d 24 db c0 	movsd  0x1c0db24(%rip),%xmm1        # 200f360 <clockFactor>
  40183b:	01 
  40183c:	f2 0f 10 15 6c fe bf 	movsd  0xbffe6c(%rip),%xmm2        # 10016b0 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x270>
  401843:	00 
  401844:	48 8d 15 15 db c0 01 	lea    0x1c0db15(%rip),%rdx        # 200f360 <clockFactor>
  40184b:	f2 0f 2a c7          	cvtsi2sd %edi,%xmm0
  40184f:	f2 0f 59 c8          	mulsd  %xmm0,%xmm1
  401853:	f2 0f 58 ca          	addsd  %xmm2,%xmm1
  401857:	f2 44 0f 2c c1       	cvttsd2si %xmm1,%r8d
  40185c:	85 c9                	test   %ecx,%ecx
  40185e:	0f 84 ed 01 00 00    	je     401a51 <main+0x881>
  401864:	3b 0d 9e 75 c0 00    	cmp    0xc0759e(%rip),%ecx        # 1008e08 <NumCounters>
  40186a:	0f 87 0f 02 00 00    	ja     401a7f <main+0x8af>
  401870:	8d 51 ff             	lea    -0x1(%rcx),%edx
  401873:	48 8b 0d 86 75 c0 00 	mov    0xc07586(%rip),%rcx        # 1008e00 <PThreadData>
  40187a:	0f af 15 d7 da c0 01 	imul   0x1c0dad7(%rip),%edx        # 200f358 <repetitions>
  401881:	01 ea                	add    %ebp,%edx
  401883:	44 01 e2             	add    %r12d,%edx
  401886:	48 63 d2             	movslq %edx,%rdx
  401889:	8b 3c 91             	mov    (%rcx,%rdx,4),%edi
  40188c:	e9 11 ff ff ff       	jmp    4017a2 <main+0x5d2>
  401891:	48 8d 35 c8 fd bf 00 	lea    0xbffdc8(%rip),%rsi        # 1001660 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x220>
  401898:	bf 01 00 00 00       	mov    $0x1,%edi
  40189d:	31 c0                	xor    %eax,%eax
  40189f:	e8 8c f7 ff ff       	call   401030 <__printf_chk@plt>
  4018a4:	0f 1f 40 00          	nopl   0x0(%rax)
  4018a8:	49 83 c5 01          	add    $0x1,%r13
  4018ac:	49 83 c7 04          	add    $0x4,%r15
  4018b0:	44 39 2d a1 da c0 01 	cmp    %r13d,0x1c0daa1(%rip)        # 200f358 <repetitions>
  4018b7:	0f 8f 1b fe ff ff    	jg     4016d8 <main+0x508>
  4018bd:	81 3d 71 7a 40 01 00 	cmpl   $0x2000,0x1407a71(%rip)        # 1809338 <MSRCounters+0x58>
  4018c4:	20 00 00 
  4018c7:	0f 84 bb 03 00 00    	je     401c88 <main+0xab8>
  4018cd:	83 3d 48 75 c0 00 00 	cmpl   $0x0,0xc07548(%rip)        # 1008e1c <PrintCustomPMC>
  4018d4:	0f 84 cc 00 00 00    	je     4019a6 <main+0x7d6>
  4018da:	48 8d 35 a5 fd bf 00 	lea    0xbffda5(%rip),%rsi        # 1001686 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x246>
  4018e1:	bf 01 00 00 00       	mov    $0x1,%edi
  4018e6:	31 c0                	xor    %eax,%eax
  4018e8:	e8 43 f7 ff ff       	call   401030 <__printf_chk@plt>
  4018ed:	83 3d 64 da c0 01 00 	cmpl   $0x0,0x1c0da64(%rip)        # 200f358 <repetitions>
  4018f4:	0f 8e ac 00 00 00    	jle    4019a6 <main+0x7d6>
  4018fa:	4c 63 6c 24 18       	movslq 0x18(%rsp),%r13
  4018ff:	4c 63 64 24 1c       	movslq 0x1c(%rsp),%r12
  401904:	48 8d 05 18 fd bf 00 	lea    0xbffd18(%rip),%rax        # 1001623 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1e3>
  40190b:	31 ed                	xor    %ebp,%ebp
  40190d:	48 89 04 24          	mov    %rax,(%rsp)
  401911:	4c 8d 35 0c fd bf 00 	lea    0xbffd0c(%rip),%r14        # 1001624 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1e4>
  401918:	49 c1 ed 02          	shr    $0x2,%r13
  40191c:	49 83 e4 fc          	and    $0xfffffffffffffffc,%r12
  401920:	eb 15                	jmp    401937 <main+0x767>
  401922:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  401928:	83 c5 01             	add    $0x1,%ebp
  40192b:	49 83 c4 04          	add    $0x4,%r12
  40192f:	39 2d 23 da c0 01    	cmp    %ebp,0x1c0da23(%rip)        # 200f358 <repetitions>
  401935:	7e 6f                	jle    4019a6 <main+0x7d6>
  401937:	48 8b 05 c2 74 c0 00 	mov    0xc074c2(%rip),%rax        # 1008e00 <PThreadData>
  40193e:	48 8b 34 24          	mov    (%rsp),%rsi
  401942:	bf 01 00 00 00       	mov    $0x1,%edi
  401947:	42 8b 14 20          	mov    (%rax,%r12,1),%edx
  40194b:	31 c0                	xor    %eax,%eax
  40194d:	e8 de f6 ff ff       	call   401030 <__printf_chk@plt>
  401952:	8b 05 c0 74 c0 00    	mov    0xc074c0(%rip),%eax        # 1008e18 <UsePMC>
  401958:	85 c0                	test   %eax,%eax
  40195a:	74 cc                	je     401928 <main+0x758>
  40195c:	83 3d a5 74 c0 00 00 	cmpl   $0x0,0xc074a5(%rip)        # 1008e08 <NumCounters>
  401963:	7e c3                	jle    401928 <main+0x758>
  401965:	31 db                	xor    %ebx,%ebx
  401967:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40196e:	00 00 
  401970:	8b 05 e2 d9 c0 01    	mov    0x1c0d9e2(%rip),%eax        # 200f358 <repetitions>
  401976:	48 8b 15 83 74 c0 00 	mov    0xc07483(%rip),%rdx        # 1008e00 <PThreadData>
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
  40199c:	39 1d 66 74 c0 00    	cmp    %ebx,0xc07466(%rip)        # 1008e08 <NumCounters>
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
  4019ec:	3b 15 16 74 c0 00    	cmp    0xc07416(%rip),%edx        # 1008e08 <NumCounters>
  4019f2:	41 b8 01 00 00 00    	mov    $0x1,%r8d
  4019f8:	77 1d                	ja     401a17 <main+0x847>
  4019fa:	83 ea 01             	sub    $0x1,%edx
  4019fd:	0f af 15 54 d9 c0 01 	imul   0x1c0d954(%rip),%edx        # 200f358 <repetitions>
  401a04:	48 8b 3d f5 73 c0 00 	mov    0xc073f5(%rip),%rdi        # 1008e00 <PThreadData>
  401a0b:	01 ea                	add    %ebp,%edx
  401a0d:	44 01 e2             	add    %r12d,%edx
  401a10:	48 63 d2             	movslq %edx,%rdx
  401a13:	44 8b 04 97          	mov    (%rdi,%rdx,4),%r8d
  401a17:	85 c9                	test   %ecx,%ecx
  401a19:	0f 85 45 fe ff ff    	jne    401864 <main+0x694>
  401a1f:	48 8b 15 da 73 c0 00 	mov    0xc073da(%rip),%rdx        # 1008e00 <PThreadData>
  401a26:	81 3d 08 79 40 01 00 	cmpl   $0x2000,0x1407908(%rip)        # 1809338 <MSRCounters+0x58>
  401a2d:	20 00 00 
  401a30:	42 8b 3c 3a          	mov    (%rdx,%r15,1),%edi
  401a34:	0f 85 68 fd ff ff    	jne    4017a2 <main+0x5d2>
  401a3a:	66 0f ef c0          	pxor   %xmm0,%xmm0
  401a3e:	f2 0f 10 15 6a fc bf 	movsd  0xbffc6a(%rip),%xmm2        # 10016b0 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x270>
  401a45:	00 
  401a46:	48 8d 15 13 d9 c0 01 	lea    0x1c0d913(%rip),%rdx        # 200f360 <clockFactor>
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
  401a89:	48 8d 15 9a fb bf 00 	lea    0xbffb9a(%rip),%rdx        # 100162a <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1ea>
  401a90:	48 8d 35 97 fb bf 00 	lea    0xbffb97(%rip),%rsi        # 100162e <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1ee>
  401a97:	bf 01 00 00 00       	mov    $0x1,%edi
  401a9c:	31 c0                	xor    %eax,%eax
  401a9e:	e8 8d f5 ff ff       	call   401030 <__printf_chk@plt>
  401aa3:	e9 46 fd ff ff       	jmp    4017ee <main+0x61e>
  401aa8:	48 8d 35 b8 fa bf 00 	lea    0xbffab8(%rip),%rsi        # 1001567 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x127>
  401aaf:	bf 01 00 00 00       	mov    $0x1,%edi
  401ab4:	31 c0                	xor    %eax,%eax
  401ab6:	e8 75 f5 ff ff       	call   401030 <__printf_chk@plt>
  401abb:	e9 dc f8 ff ff       	jmp    40139c <main+0x1cc>
  401ac0:	48 8d 35 29 fb bf 00 	lea    0xbffb29(%rip),%rsi        # 10015f0 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1b0>
  401ac7:	bf 01 00 00 00       	mov    $0x1,%edi
  401acc:	31 c0                	xor    %eax,%eax
  401ace:	c7 05 48 73 c0 00 d0 	movl   $0x7d0,0xc07348(%rip)        # 1008e20 <NumThreads>
  401ad5:	07 00 00 
  401ad8:	e8 53 f5 ff ff       	call   401030 <__printf_chk@plt>
  401add:	e9 86 f8 ff ff       	jmp    401368 <main+0x198>
  401ae2:	66 0f ef c0          	pxor   %xmm0,%xmm0
  401ae6:	4c 89 f6             	mov    %r14,%rsi
  401ae9:	bf 01 00 00 00       	mov    $0x1,%edi
  401aee:	31 c0                	xor    %eax,%eax
  401af0:	f2 0f 2a c3          	cvtsi2sd %ebx,%xmm0
  401af4:	f2 0f 59 05 64 d8 c0 	mulsd  0x1c0d864(%rip),%xmm0        # 200f360 <clockFactor>
  401afb:	01 
  401afc:	f2 0f 58 05 ac fb bf 	addsd  0xbffbac(%rip),%xmm0        # 10016b0 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x270>
  401b03:	00 
  401b04:	f2 0f 2c d0          	cvttsd2si %xmm0,%edx
  401b08:	e8 23 f5 ff ff       	call   401030 <__printf_chk@plt>
  401b0d:	e9 00 fc ff ff       	jmp    401712 <main+0x542>
  401b12:	48 8d 35 0d fa bf 00 	lea    0xbffa0d(%rip),%rsi        # 1001526 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0xe6>
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
  401b5e:	48 8d 35 e2 fa bf 00 	lea    0xbffae2(%rip),%rsi        # 1001647 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x207>
  401b65:	bf 01 00 00 00       	mov    $0x1,%edi
  401b6a:	31 c0                	xor    %eax,%eax
  401b6c:	e8 bf f4 ff ff       	call   401030 <__printf_chk@plt>
  401b71:	e9 32 fd ff ff       	jmp    4018a8 <main+0x6d8>
  401b76:	48 8b 11             	mov    (%rcx),%rdx
  401b79:	48 8d 35 c0 fa bf 00 	lea    0xbffac0(%rip),%rsi        # 1001640 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x200>
  401b80:	bf 01 00 00 00       	mov    $0x1,%edi
  401b85:	31 c0                	xor    %eax,%eax
  401b87:	e8 a4 f4 ff ff       	call   401030 <__printf_chk@plt>
  401b8c:	e9 17 fd ff ff       	jmp    4018a8 <main+0x6d8>
  401b91:	8b 11                	mov    (%rcx),%edx
  401b93:	48 8d 35 a1 fa bf 00 	lea    0xbffaa1(%rip),%rsi        # 100163b <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x1fb>
  401b9a:	bf 01 00 00 00       	mov    $0x1,%edi
  401b9f:	31 c0                	xor    %eax,%eax
  401ba1:	e8 8a f4 ff ff       	call   401030 <__printf_chk@plt>
  401ba6:	e9 fd fc ff ff       	jmp    4018a8 <main+0x6d8>
  401bab:	66 0f ef c0          	pxor   %xmm0,%xmm0
  401baf:	bf 01 00 00 00       	mov    $0x1,%edi
  401bb4:	b8 01 00 00 00       	mov    $0x1,%eax
  401bb9:	48 8d 35 99 fa bf 00 	lea    0xbffa99(%rip),%rsi        # 1001659 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x219>
  401bc0:	f3 0f 5a 01          	cvtss2sd (%rcx),%xmm0
  401bc4:	f2 0f 5e 05 94 d7 c0 	divsd  0x1c0d794(%rip),%xmm0        # 200f360 <clockFactor>
  401bcb:	01 
  401bcc:	e8 5f f4 ff ff       	call   401030 <__printf_chk@plt>
  401bd1:	e9 d2 fc ff ff       	jmp    4018a8 <main+0x6d8>
  401bd6:	f2 0f 10 01          	movsd  (%rcx),%xmm0
  401bda:	bf 01 00 00 00       	mov    $0x1,%edi
  401bdf:	b8 01 00 00 00       	mov    $0x1,%eax
  401be4:	48 8d 35 6e fa bf 00 	lea    0xbffa6e(%rip),%rsi        # 1001659 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x219>
  401beb:	e8 40 f4 ff ff       	call   401030 <__printf_chk@plt>
  401bf0:	e9 b3 fc ff ff       	jmp    4018a8 <main+0x6d8>
  401bf5:	66 0f ef c0          	pxor   %xmm0,%xmm0
  401bf9:	bf 01 00 00 00       	mov    $0x1,%edi
  401bfe:	b8 01 00 00 00       	mov    $0x1,%eax
  401c03:	48 8d 35 4f fa bf 00 	lea    0xbffa4f(%rip),%rsi        # 1001659 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x219>
  401c0a:	f3 0f 5a 01          	cvtss2sd (%rcx),%xmm0
  401c0e:	e8 1d f4 ff ff       	call   401030 <__printf_chk@plt>
  401c13:	e9 90 fc ff ff       	jmp    4018a8 <main+0x6d8>
  401c18:	8b 51 04             	mov    0x4(%rcx),%edx
  401c1b:	8b 09                	mov    (%rcx),%ecx
  401c1d:	48 8d 35 2a fa bf 00 	lea    0xbffa2a(%rip),%rsi        # 100164e <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x20e>
  401c24:	bf 01 00 00 00       	mov    $0x1,%edi
  401c29:	31 c0                	xor    %eax,%eax
  401c2b:	e8 00 f4 ff ff       	call   401030 <__printf_chk@plt>
  401c30:	e9 73 fc ff ff       	jmp    4018a8 <main+0x6d8>
  401c35:	48 8b 3d a4 76 40 01 	mov    0x14076a4(%rip),%rdi        # 18092e0 <MSRCounters>
  401c3c:	31 f6                	xor    %esi,%esi
  401c3e:	e8 2d f4 ff ff       	call   401070 <open@plt>
  401c43:	89 05 9f 76 40 01    	mov    %eax,0x140769f(%rip)        # 18092e8 <MSRCounters+0x8>
  401c49:	83 c0 01             	add    $0x1,%eax
  401c4c:	0f 85 9d f8 ff ff    	jne    4014ef <main+0x31f>
  401c52:	48 8b 15 87 76 40 01 	mov    0x1407687(%rip),%rdx        # 18092e0 <MSRCounters>
  401c59:	48 8d 35 6c f8 bf 00 	lea    0xbff86c(%rip),%rsi        # 10014cc <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x8c>
  401c60:	bf 01 00 00 00       	mov    $0x1,%edi
  401c65:	31 c0                	xor    %eax,%eax
  401c67:	e8 c4 f3 ff ff       	call   401030 <__printf_chk@plt>
  401c6c:	c7 05 72 76 40 01 00 	movl   $0x0,0x1407672(%rip)        # 18092e8 <MSRCounters+0x8>
  401c73:	00 00 00 
  401c76:	e9 74 f8 ff ff       	jmp    4014ef <main+0x31f>
  401c7b:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%rsp)
  401c82:	00 
  401c83:	e9 8a f9 ff ff       	jmp    401612 <main+0x442>
  401c88:	f2 0f 10 05 d0 d6 c0 	movsd  0x1c0d6d0(%rip),%xmm0        # 200f360 <clockFactor>
  401c8f:	01 
  401c90:	bf 01 00 00 00       	mov    $0x1,%edi
  401c95:	b8 01 00 00 00       	mov    $0x1,%eax
  401c9a:	48 8d 35 d2 f9 bf 00 	lea    0xbff9d2(%rip),%rsi        # 1001673 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x233>
  401ca1:	e8 8a f3 ff ff       	call   401030 <__printf_chk@plt>
  401ca6:	e9 22 fc ff ff       	jmp    4018cd <main+0x6fd>
  401cab:	4c 89 ea             	mov    %r13,%rdx
  401cae:	48 8d 35 a3 f4 bf 00 	lea    0xbff4a3(%rip),%rsi        # 1001158 <_IO_stdin_used+0x158>
  401cb5:	bf 01 00 00 00       	mov    $0x1,%edi
  401cba:	31 c0                	xor    %eax,%eax
  401cbc:	e8 6f f3 ff ff       	call   401030 <__printf_chk@plt>
  401cc1:	c7 44 24 14 01 00 00 	movl   $0x1,0x14(%rsp)
  401cc8:	00 
  401cc9:	e9 44 f9 ff ff       	jmp    401612 <main+0x442>
  401cce:	e8 fd f3 ff ff       	call   4010d0 <__stack_chk_fail@plt>
  401cd3:	48 8d 3d f2 f8 bf 00 	lea    0xbff8f2(%rip),%rdi        # 10015cc <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x18c>
  401cda:	e8 b1 f3 ff ff       	call   401090 <perror@plt>
  401cdf:	bf 01 00 00 00       	mov    $0x1,%edi
  401ce4:	e8 f7 f3 ff ff       	call   4010e0 <exit@plt>
  401ce9:	48 8d 3d ef f8 bf 00 	lea    0xbff8ef(%rip),%rdi        # 10015df <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x19f>
  401cf0:	e8 9b f3 ff ff       	call   401090 <perror@plt>
  401cf5:	bf 01 00 00 00       	mov    $0x1,%edi
  401cfa:	e8 e1 f3 ff ff       	call   4010e0 <exit@plt>
  401cff:	48 8d 3d cf f8 bf 00 	lea    0xbff8cf(%rip),%rdi        # 10015d5 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x195>
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
  401d34:	4c 8d 05 a5 75 40 01 	lea    0x14075a5(%rip),%r8        # 18092e0 <MSRCounters>
  401d3b:	48 83 ec 08          	sub    $0x8,%rsp
  401d3f:	4c 89 c7             	mov    %r8,%rdi
  401d42:	e8 49 07 00 00       	call   402490 <_ZN9CCountersC1Ev>
  401d47:	48 8d 15 ba 13 c0 00 	lea    0xc013ba(%rip),%rdx        # 1003108 <__dso_handle>
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
  401d8f:	ff 15 5b 12 c0 00    	call   *0xc0125b(%rip)        # 1002ff0 <__libc_start_main@GLIBC_2.34>
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
  401db0:	b8 b8 92 80 01       	mov    $0x18092b8,%eax
  401db5:	48 3d b8 92 80 01    	cmp    $0x18092b8,%rax
  401dbb:	74 13                	je     401dd0 <deregister_tm_clones+0x20>
  401dbd:	b8 00 00 00 00       	mov    $0x0,%eax
  401dc2:	48 85 c0             	test   %rax,%rax
  401dc5:	74 09                	je     401dd0 <deregister_tm_clones+0x20>
  401dc7:	bf b8 92 80 01       	mov    $0x18092b8,%edi
  401dcc:	ff e0                	jmp    *%rax
  401dce:	66 90                	xchg   %ax,%ax
  401dd0:	c3                   	ret    
  401dd1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401dd8:	00 00 00 00 
  401ddc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401de0 <register_tm_clones>:
  401de0:	be b8 92 80 01       	mov    $0x18092b8,%esi
  401de5:	48 81 ee b8 92 80 01 	sub    $0x18092b8,%rsi
  401dec:	48 89 f0             	mov    %rsi,%rax
  401def:	48 c1 ee 3f          	shr    $0x3f,%rsi
  401df3:	48 c1 f8 03          	sar    $0x3,%rax
  401df7:	48 01 c6             	add    %rax,%rsi
  401dfa:	48 d1 fe             	sar    %rsi
  401dfd:	74 11                	je     401e10 <register_tm_clones+0x30>
  401dff:	b8 00 00 00 00       	mov    $0x0,%eax
  401e04:	48 85 c0             	test   %rax,%rax
  401e07:	74 07                	je     401e10 <register_tm_clones+0x30>
  401e09:	bf b8 92 80 01       	mov    $0x18092b8,%edi
  401e0e:	ff e0                	jmp    *%rax
  401e10:	c3                   	ret    
  401e11:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401e18:	00 00 00 00 
  401e1c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401e20 <__do_global_dtors_aux>:
  401e20:	f3 0f 1e fa          	endbr64 
  401e24:	80 3d 95 74 40 01 00 	cmpb   $0x0,0x1407495(%rip)        # 18092c0 <completed.0>
  401e2b:	75 13                	jne    401e40 <__do_global_dtors_aux+0x20>
  401e2d:	55                   	push   %rbp
  401e2e:	48 89 e5             	mov    %rsp,%rbp
  401e31:	e8 7a ff ff ff       	call   401db0 <deregister_tm_clones>
  401e36:	c6 05 83 74 40 01 01 	movb   $0x1,0x1407483(%rip)        # 18092c0 <completed.0>
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
  401e77:	4c 8d 2d 8a f1 bf 00 	lea    0xbff18a(%rip),%r13        # 1001008 <_IO_stdin_used+0x8>
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
  401f48:	8b 05 a2 3a c1 01    	mov    0x1c13aa2(%rip),%eax        # 20159f0 <diagnostics>
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
  401f68:	8b 05 82 3a c1 01    	mov    0x1c13a82(%rip),%eax        # 20159f0 <diagnostics>
  401f6e:	c7 47 54 00 00 10 00 	movl   $0x100000,0x54(%rdi)
  401f75:	85 c0                	test   %eax,%eax
  401f77:	74 d9                	je     401f52 <_ZN9CCounters18GetProcessorFamilyEv.part.0.constprop.0+0x82>
  401f79:	44 8b 46 54          	mov    0x54(%rsi),%r8d
  401f7d:	44 89 c9             	mov    %r9d,%ecx
  401f80:	48 8d 35 a1 f0 bf 00 	lea    0xbff0a1(%rip),%rsi        # 1001028 <_IO_stdin_used+0x28>
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
  401fee:	48 8d 0d ab f2 bf 00 	lea    0xbff2ab(%rip),%rcx        # 10012a0 <_IO_stdin_used+0x2a0>
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
  4020e9:	48 8d 0d 04 f2 bf 00 	lea    0xbff204(%rip),%rcx        # 10012f4 <_IO_stdin_used+0x2f4>
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
  402237:	44 39 25 e2 6b c0 00 	cmp    %r12d,0xc06be2(%rip)        # 1008e20 <NumThreads>
  40223e:	0f 86 9c 01 00 00    	jbe    4023e0 <_Z11ThreadProc1Pv+0x1d0>
  402244:	48 8d 05 95 0f c1 01 	lea    0x1c10f95(%rip),%rax        # 20131e0 <ProcNum>
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
  4022ab:	48 63 15 6e 6b c0 00 	movslq 0xc06b6e(%rip),%rdx        # 1008e20 <NumThreads>
  4022b2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  4022b9:	00 
  4022ba:	85 d2                	test   %edx,%edx
  4022bc:	0f 8e 3e 01 00 00    	jle    402400 <_Z11ThreadProc1Pv+0x1f0>
  4022c2:	be 01 00 00 00       	mov    $0x1,%esi
  4022c7:	48 89 ef             	mov    %rbp,%rdi
  4022ca:	e8 91 ed ff ff       	call   401060 <memset@plt>
  4022cf:	48 8b 0c 24          	mov    (%rsp),%rcx
  4022d3:	48 8d 15 46 2f c1 01 	lea    0x1c12f46(%rip),%rdx        # 2015220 <TSync>
  4022da:	c6 04 1a 01          	movb   $0x1,(%rdx,%rbx,1)
  4022de:	66 90                	xchg   %ax,%ax
  4022e0:	48 8b 02             	mov    (%rdx),%rax
  4022e3:	48 39 c8             	cmp    %rcx,%rax
  4022e6:	75 f8                	jne    4022e0 <_Z11ThreadProc1Pv+0xd0>
  4022e8:	44 89 e7             	mov    %r12d,%edi
  4022eb:	e8 50 22 00 00       	call   404540 <TestLoop>
  4022f0:	89 05 62 d0 c0 01    	mov    %eax,0x1c0d062(%rip)        # 200f358 <repetitions>
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
  402330:	8b 05 e2 6a c0 00    	mov    0xc06ae2(%rip),%eax        # 1008e18 <UsePMC>
  402336:	85 c0                	test   %eax,%eax
  402338:	74 c6                	je     402300 <_Z11ThreadProc1Pv+0xf0>
  40233a:	8b 05 10 c0 80 01    	mov    0x180c010(%rip),%eax        # 1c0e350 <MSRCounters+0x405070>
  402340:	c1 e0 04             	shl    $0x4,%eax
  402343:	85 c0                	test   %eax,%eax
  402345:	7e b9                	jle    402300 <_Z11ThreadProc1Pv+0xf0>
  402347:	8b 3d 9b 6f 40 01    	mov    0x1406f9b(%rip),%edi        # 18092e8 <MSRCounters+0x8>
  40234d:	85 ff                	test   %edi,%edi
  40234f:	74 af                	je     402300 <_Z11ThreadProc1Pv+0xf0>
  402351:	48 8d 15 e8 9f 80 01 	lea    0x1809fe8(%rip),%rdx        # 1c0c340 <MSRCounters+0x403060>
  402358:	be 01 f9 00 00       	mov    $0xf901,%esi
  40235d:	31 c0                	xor    %eax,%eax
  40235f:	e8 bc ed ff ff       	call   401120 <ioctl@plt>
  402364:	eb 9a                	jmp    402300 <_Z11ThreadProc1Pv+0xf0>
  402366:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40236d:	00 00 00 
  402370:	8b 15 a2 6a c0 00    	mov    0xc06aa2(%rip),%edx        # 1008e18 <UsePMC>
  402376:	85 d2                	test   %edx,%edx
  402378:	0f 84 28 ff ff ff    	je     4022a6 <_Z11ThreadProc1Pv+0x96>
  40237e:	8b 05 cc 8f 40 01    	mov    0x1408fcc(%rip),%eax        # 180b350 <MSRCounters+0x2070>
  402384:	c1 e0 04             	shl    $0x4,%eax
  402387:	85 c0                	test   %eax,%eax
  402389:	0f 8e 17 ff ff ff    	jle    4022a6 <_Z11ThreadProc1Pv+0x96>
  40238f:	8b 3d 53 6f 40 01    	mov    0x1406f53(%rip),%edi        # 18092e8 <MSRCounters+0x8>
  402395:	85 ff                	test   %edi,%edi
  402397:	0f 84 09 ff ff ff    	je     4022a6 <_Z11ThreadProc1Pv+0x96>
  40239d:	48 8d 15 9c 6f 40 01 	lea    0x1406f9c(%rip),%rdx        # 1809340 <MSRCounters+0x60>
  4023a4:	be 01 f9 00 00       	mov    $0xf901,%esi
  4023a9:	31 c0                	xor    %eax,%eax
  4023ab:	e8 70 ed ff ff       	call   401120 <ioctl@plt>
  4023b0:	e9 f1 fe ff ff       	jmp    4022a6 <_Z11ThreadProc1Pv+0x96>
  4023b5:	0f 1f 00             	nopl   (%rax)
  4023b8:	31 c0                	xor    %eax,%eax
  4023ba:	44 89 ea             	mov    %r13d,%edx
  4023bd:	bf 01 00 00 00       	mov    $0x1,%edi
  4023c2:	48 8d 35 a7 ec bf 00 	lea    0xbfeca7(%rip),%rsi        # 1001070 <_IO_stdin_used+0x70>
  4023c9:	e8 62 ec ff ff       	call   401030 <__printf_chk@plt>
  4023ce:	45 85 e4             	test   %r12d,%r12d
  4023d1:	0f 85 cf fe ff ff    	jne    4022a6 <_Z11ThreadProc1Pv+0x96>
  4023d7:	eb 97                	jmp    402370 <_Z11ThreadProc1Pv+0x160>
  4023d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4023e0:	44 89 e2             	mov    %r12d,%edx
  4023e3:	48 8d 35 66 ec bf 00 	lea    0xbfec66(%rip),%rsi        # 1001050 <_IO_stdin_used+0x50>
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
  402494:	48 8d 05 25 f0 bf 00 	lea    0xbff025(%rip),%rax        # 10014c0 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x80>
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
  402574:	4c 63 0d a5 68 c0 00 	movslq 0xc068a5(%rip),%r9        # 1008e20 <NumThreads>
  40257b:	45 85 c9             	test   %r9d,%r9d
  40257e:	0f 8e 60 01 00 00    	jle    4026e4 <_ZN9CCounters13LockProcessorEv+0x174>
  402584:	49 89 f8             	mov    %rdi,%r8
  402587:	48 8d b7 70 20 00 00 	lea    0x2070(%rdi),%rsi
  40258e:	31 ff                	xor    %edi,%edi
  402590:	4c 8d 15 49 0c c1 01 	lea    0x1c10c49(%rip),%r10        # 20131e0 <ProcNum>
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
  402714:	8b 05 fe 66 c0 00    	mov    0xc066fe(%rip),%eax        # 1008e18 <UsePMC>
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
  40274b:	48 8d 35 7a ed bf 00 	lea    0xbfed7a(%rip),%rsi        # 10014cc <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x8c>
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
  40277d:	48 63 2d 9c 66 c0 00 	movslq 0xc0669c(%rip),%rbp        # 1008e20 <NumThreads>
  402784:	53                   	push   %rbx
  402785:	85 ed                	test   %ebp,%ebp
  402787:	0f 8e 13 02 00 00    	jle    4029a0 <_ZN9CCounters7CleanUpEv+0x230>
  40278d:	4c 8d 05 b0 6b 40 01 	lea    0x1406bb0(%rip),%r8        # 1809344 <MSRCounters+0x64>
  402794:	44 8b 77 58          	mov    0x58(%rdi),%r14d
  402798:	49 89 fc             	mov    %rdi,%r12
  40279b:	f2 0f 10 0d 05 ef bf 	movsd  0xbfef05(%rip),%xmm1        # 10016a8 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x268>
  4027a2:	00 
  4027a3:	4d 8d 58 fc          	lea    -0x4(%r8),%r11
  4027a7:	31 ff                	xor    %edi,%edi
  4027a9:	4c 8d 2d b0 cb c0 01 	lea    0x1c0cbb0(%rip),%r13        # 200f360 <clockFactor>
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
  402840:	48 8d 0d 99 6a 40 01 	lea    0x1406a99(%rip),%rcx        # 18092e0 <MSRCounters>
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
  40289f:	48 8d 05 3a 6a 40 01 	lea    0x1406a3a(%rip),%rax        # 18092e0 <MSRCounters>
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
  4028f1:	48 8d 1d e8 69 40 01 	lea    0x14069e8(%rip),%rbx        # 18092e0 <MSRCounters>
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
  40293c:	48 8d 35 9d 69 40 01 	lea    0x140699d(%rip),%rsi        # 18092e0 <MSRCounters>
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
  402bb4:	8b 05 5e 62 c0 00    	mov    0xc0625e(%rip),%eax        # 1008e18 <UsePMC>
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
  402bf4:	8b 05 1e 62 c0 00    	mov    0xc0621e(%rip),%eax        # 1008e18 <UsePMC>
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
  402c73:	8b 05 77 2d c1 01    	mov    0x1c12d77(%rip),%eax        # 20159f0 <diagnostics>
  402c79:	89 57 50             	mov    %edx,0x50(%rdi)
  402c7c:	85 c0                	test   %eax,%eax
  402c7e:	75 18                	jne    402c98 <_ZN9CCounters18GetProcessorVendorEv+0x58>
  402c80:	5b                   	pop    %rbx
  402c81:	c3                   	ret    
  402c82:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  402c88:	c7 47 50 01 00 00 00 	movl   $0x1,0x50(%rdi)
  402c8f:	eb d2                	jmp    402c63 <_ZN9CCounters18GetProcessorVendorEv+0x23>
  402c91:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  402c98:	48 8d 35 45 e8 bf 00 	lea    0xbfe845(%rip),%rsi        # 10014e4 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0xa4>
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
  402d17:	8b 05 d3 2c c1 01    	mov    0x1c12cd3(%rip),%eax        # 20159f0 <diagnostics>
  402d1d:	85 c0                	test   %eax,%eax
  402d1f:	0f 84 cf 00 00 00    	je     402df4 <_ZN9CCounters12GetPMCSchemeEv+0x114>
  402d25:	8b 55 58             	mov    0x58(%rbp),%edx
  402d28:	48 83 c4 08          	add    $0x8,%rsp
  402d2c:	48 8d 35 dc e7 bf 00 	lea    0xbfe7dc(%rip),%rsi        # 100150f <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0xcf>
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
  402d86:	8b 15 64 2c c1 01    	mov    0x1c12c64(%rip),%edx        # 20159f0 <diagnostics>
  402d8c:	89 87 64 60 80 00    	mov    %eax,0x806064(%rdi)
  402d92:	85 f6                	test   %esi,%esi
  402d94:	74 30                	je     402dc6 <_ZN9CCounters12GetPMCSchemeEv+0xe6>
  402d96:	85 d2                	test   %edx,%edx
  402d98:	74 5a                	je     402df4 <_ZN9CCounters12GetPMCSchemeEv+0x114>
  402d9a:	8b 8d 68 60 80 00    	mov    0x806068(%rbp),%ecx
  402da0:	8b 95 64 60 80 00    	mov    0x806064(%rbp),%edx
  402da6:	48 8d 35 44 e7 bf 00 	lea    0xbfe744(%rip),%rsi        # 10014f1 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0xb1>
  402dad:	31 c0                	xor    %eax,%eax
  402daf:	bf 01 00 00 00       	mov    $0x1,%edi
  402db4:	e8 77 e2 ff ff       	call   401030 <__printf_chk@plt>
  402db9:	e9 67 ff ff ff       	jmp    402d25 <_ZN9CCounters12GetPMCSchemeEv+0x45>
  402dbe:	66 90                	xchg   %ax,%ax
  402dc0:	8b 15 2a 2c c1 01    	mov    0x1c12c2a(%rip),%edx        # 20159f0 <diagnostics>
  402dc6:	8b 45 54             	mov    0x54(%rbp),%eax
  402dc9:	83 f8 20             	cmp    $0x20,%eax
  402dcc:	0f 87 96 00 00 00    	ja     402e68 <_ZN9CCounters12GetPMCSchemeEv+0x188>
  402dd2:	85 c0                	test   %eax,%eax
  402dd4:	74 1a                	je     402df0 <_ZN9CCounters12GetPMCSchemeEv+0x110>
  402dd6:	83 f8 20             	cmp    $0x20,%eax
  402dd9:	77 15                	ja     402df0 <_ZN9CCounters12GetPMCSchemeEv+0x110>
  402ddb:	48 8d 0d a2 e5 bf 00 	lea    0xbfe5a2(%rip),%rcx        # 1001384 <_IO_stdin_used+0x384>
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
  402ed6:	4c 8d 05 bb e1 bf 00 	lea    0xbfe1bb(%rip),%r8        # 1001098 <_IO_stdin_used+0x98>
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
  402ef6:	8b 3d 0c 5f c0 00    	mov    0xc05f0c(%rip),%edi        # 1008e08 <NumCounters>
  402efc:	3b 3d 12 5f c0 00    	cmp    0xc05f12(%rip),%edi        # 1008e14 <MaxNumCounters>
  402f02:	4c 8d 05 14 e6 bf 00 	lea    0xbfe614(%rip),%r8        # 100151d <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0xdd>
  402f09:	7d 70                	jge    402f7b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xab>
  402f0b:	8b 56 0c             	mov    0xc(%rsi),%edx
  402f0e:	f7 c2 00 00 00 40    	test   $0x40000000,%edx
  402f14:	0f 85 e6 00 00 00    	jne    403000 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x130>
  402f1a:	8b 6e 10             	mov    0x10(%rsi),%ebp
  402f1d:	39 ea                	cmp    %ebp,%edx
  402f1f:	0f 8f ab 08 00 00    	jg     4037d0 <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x900>
  402f25:	8d 4f ff             	lea    -0x1(%rdi),%ecx
  402f28:	4c 8d 0d 0d 5f c0 00 	lea    0xc05f0d(%rip),%r9        # 1008e3c <Counters>
  402f2f:	4c 8d 2d 26 5f c0 00 	lea    0xc05f26(%rip),%r13        # 1008e5c <EventRegistersUsed>
  402f36:	48 c1 e1 02          	shl    $0x2,%rcx
  402f3a:	4d 8d 41 04          	lea    0x4(%r9),%r8
  402f3e:	4d 8d 5d 04          	lea    0x4(%r13),%r11
  402f42:	49 01 c8             	add    %rcx,%r8
  402f45:	4c 8d 25 f4 e4 bf 00 	lea    0xbfe4f4(%rip),%r12        # 1001440 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables>
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
  402f74:	4c 8d 05 55 e1 bf 00 	lea    0xbfe155(%rip),%r8        # 10010d0 <_IO_stdin_used+0xd0>
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
  403007:	4c 8d 0d 2e 5e c0 00 	lea    0xc05e2e(%rip),%r9        # 1008e3c <Counters>
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
  403054:	4c 8d 05 9d e0 bf 00 	lea    0xbfe09d(%rip),%r8        # 10010f8 <_IO_stdin_used+0xf8>
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
  40308e:	8b 35 8c 5d c0 00    	mov    0xc05d8c(%rip),%esi        # 1008e20 <NumThreads>
  403094:	44 8d 82 c1 00 00 00 	lea    0xc1(%rdx),%r8d
  40309b:	8d 9a 86 01 00 00    	lea    0x186(%rdx),%ebx
  4030a1:	4c 8d 0d 94 5d c0 00 	lea    0xc05d94(%rip),%r9        # 1008e3c <Counters>
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
  403224:	4c 8d 0d 11 5c c0 00 	lea    0xc05c11(%rip),%r9        # 1008e3c <Counters>
  40322b:	83 c7 01             	add    $0x1,%edi
  40322e:	45 31 c0             	xor    %r8d,%r8d
  403231:	43 89 14 91          	mov    %edx,(%r9,%r10,4)
  403235:	5b                   	pop    %rbx
  403236:	4c 89 c0             	mov    %r8,%rax
  403239:	5d                   	pop    %rbp
  40323a:	41 5c                	pop    %r12
  40323c:	89 3d c6 5b c0 00    	mov    %edi,0xc05bc6(%rip)        # 1008e08 <NumCounters>
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
  403279:	4c 8d 0d bc 5b c0 00 	lea    0xc05bbc(%rip),%r9        # 1008e3c <Counters>
  403280:	41 c1 e4 08          	shl    $0x8,%r12d
  403284:	44 0b 66 18          	or     0x18(%rsi),%r12d
  403288:	8b 35 92 5b c0 00    	mov    0xc05b92(%rip),%esi        # 1008e20 <NumThreads>
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
  403416:	44 8b 05 03 5a c0 00 	mov    0xc05a03(%rip),%r8d        # 1008e20 <NumThreads>
  40341d:	41 c1 e1 08          	shl    $0x8,%r9d
  403421:	44 0b 4e 18          	or     0x18(%rsi),%r9d
  403425:	45 89 cd             	mov    %r9d,%r13d
  403428:	44 89 ce             	mov    %r9d,%esi
  40342b:	4c 8d 0d 0a 5a c0 00 	lea    0xc05a0a(%rip),%r9        # 1008e3c <Counters>
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
  4035e1:	44 8b 05 38 58 c0 00 	mov    0xc05838(%rip),%r8d        # 1008e20 <NumThreads>
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
  40376d:	89 2d e9 56 c0 00    	mov    %ebp,0xc056e9(%rip)        # 1008e5c <EventRegistersUsed>
  403773:	4c 8d 0d c2 56 c0 00 	lea    0xc056c2(%rip),%r9        # 1008e3c <Counters>
  40377a:	e9 ac fa ff ff       	jmp    40322b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x35b>
  40377f:	90                   	nop
  403780:	4c 8d 0d b5 56 c0 00 	lea    0xc056b5(%rip),%r9        # 1008e3c <Counters>
  403787:	f7 c2 00 00 00 40    	test   $0x40000000,%edx
  40378d:	75 6e                	jne    4037fd <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x92d>
  40378f:	44 8b 1d 62 22 c1 01 	mov    0x1c12262(%rip),%r11d        # 20159f8 <_ZZN9CCounters13DefineCounterER18SCounterDefinitionE15CountersEnabled>
  403796:	44 8b 05 83 56 c0 00 	mov    0xc05683(%rip),%r8d        # 1008e20 <NumThreads>
  40379d:	45 8d 63 01          	lea    0x1(%r11),%r12d
  4037a1:	44 89 25 50 22 c1 01 	mov    %r12d,0x1c12250(%rip)        # 20159f8 <_ZZN9CCounters13DefineCounterER18SCounterDefinitionE15CountersEnabled>
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
  4037fd:	8b 35 f1 21 c1 01    	mov    0x1c121f1(%rip),%esi        # 20159f4 <_ZZN9CCounters13DefineCounterER18SCounterDefinitionE20FixedCountersEnabled>
  403803:	44 8d 5e 01          	lea    0x1(%rsi),%r11d
  403807:	44 89 1d e6 21 c1 01 	mov    %r11d,0x1c121e6(%rip)        # 20159f4 <_ZZN9CCounters13DefineCounterER18SCounterDefinitionE20FixedCountersEnabled>
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
  403848:	8b 1d d2 55 c0 00    	mov    0xc055d2(%rip),%ebx        # 1008e20 <NumThreads>
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
  403929:	0b 2d 2d 55 c0 00    	or     0xc0552d(%rip),%ebp        # 1008e5c <EventRegistersUsed>
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
  403963:	4c 8d 05 d6 da bf 00 	lea    0xbfdad6(%rip),%r8        # 1001440 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables>
  40396a:	43 8b 1c 88          	mov    (%r8,%r9,4),%ebx
  40396e:	85 db                	test   %ebx,%ebx
  403970:	78 09                	js     40397b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0xaab>
  403972:	83 e1 02             	and    $0x2,%ecx
  403975:	83 f9 01             	cmp    $0x1,%ecx
  403978:	83 db ff             	sbb    $0xffffffff,%ebx
  40397b:	44 8b 6e 1c          	mov    0x1c(%rsi),%r13d
  40397f:	8b 4e 18             	mov    0x18(%rsi),%ecx
  403982:	44 8b 05 97 54 c0 00 	mov    0xc05497(%rip),%r8d        # 1008e20 <NumThreads>
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
  403a65:	48 8d 0d f0 53 c0 00 	lea    0xc053f0(%rip),%rcx        # 1008e5c <EventRegistersUsed>
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
  403bf2:	4c 8d 0d 43 52 c0 00 	lea    0xc05243(%rip),%r9        # 1008e3c <Counters>
  403bf9:	e9 2d f6 ff ff       	jmp    40322b <_ZN9CCounters13DefineCounterER18SCounterDefinition+0x35b>
  403bfe:	66 90                	xchg   %ax,%ax
  403c00:	8b 5e 1c             	mov    0x1c(%rsi),%ebx
  403c03:	44 8d 84 12 00 02 01 	lea    -0x3ffefe00(%rdx,%rdx,1),%r8d
  403c0a:	c0 
  403c0b:	4c 8d 0d 2a 52 c0 00 	lea    0xc0522a(%rip),%r9        # 1008e3c <Counters>
  403c12:	c1 e3 08             	shl    $0x8,%ebx
  403c15:	0b 5e 18             	or     0x18(%rsi),%ebx
  403c18:	8b 35 02 52 c0 00    	mov    0xc05202(%rip),%esi        # 1008e20 <NumThreads>
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
  403dfe:	48 8d 05 57 50 c0 00 	lea    0xc05057(%rip),%rax        # 1008e5c <EventRegistersUsed>
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
  403e31:	48 8d 35 e8 f2 bf 00 	lea    0xbff2e8(%rip),%rsi        # 1003120 <CounterDefinitions>
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
  403e70:	48 8d 05 b9 d2 bf 00 	lea    0xbfd2b9(%rip),%rax        # 1001130 <_IO_stdin_used+0x130>
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
  403ea6:	48 8d 05 73 f2 bf 00 	lea    0xbff273(%rip),%rax        # 1003120 <CounterDefinitions>
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
  403f07:	8b 15 0b 4f c0 00    	mov    0xc04f0b(%rip),%edx        # 1008e18 <UsePMC>
  403f0d:	85 d2                	test   %edx,%edx
  403f0f:	74 61                	je     403f72 <_ZN9CCounters13QueueCountersEv+0xd2>
  403f11:	8b 05 fd 4e c0 00    	mov    0xc04efd(%rip),%eax        # 1008e14 <MaxNumCounters>
  403f17:	4c 8d 35 22 3e c0 00 	lea    0xc03e22(%rip),%r14        # 1007d40 <CounterTypesDesired>
  403f1e:	31 db                	xor    %ebx,%ebx
  403f20:	4c 8d 2d 08 d6 bf 00 	lea    0xbfd608(%rip),%r13        # 100152f <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0xef>
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
  403f5f:	39 1d af 4e c0 00    	cmp    %ebx,0xc04eaf(%rip)        # 1008e14 <MaxNumCounters>
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
  403f7b:	8b 3d 9f 4e c0 00    	mov    0xc04e9f(%rip),%edi        # 1008e20 <NumThreads>
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
  4040df:	48 8d 35 66 d4 bf 00 	lea    0xbfd466(%rip),%rsi        # 100154c <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x10c>
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
  404142:	c7 05 d4 4c c0 00 40 	movl   $0x40,0xc04cd4(%rip)        # 1008e20 <NumThreads>
  404149:	00 00 00 
  40414c:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
  404151:	31 c0                	xor    %eax,%eax
  404153:	45 31 e4             	xor    %r12d,%r12d
  404156:	48 8d 1d 83 f0 c0 01 	lea    0x1c0f083(%rip),%rbx        # 20131e0 <ProcNum>
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
  40418b:	4c 8d 35 4e 51 40 01 	lea    0x140514e(%rip),%r14        # 18092e0 <MSRCounters>
  404192:	4c 89 f7             	mov    %r14,%rdi
  404195:	e8 d6 e3 ff ff       	call   402570 <_ZN9CCounters13LockProcessorEv>
  40419a:	4c 89 f7             	mov    %r14,%rdi
  40419d:	e8 fe fc ff ff       	call   403ea0 <_ZN9CCounters13QueueCountersEv>
  4041a2:	8b 0d 70 4c c0 00    	mov    0xc04c70(%rip),%ecx        # 1008e18 <UsePMC>
  4041a8:	85 c9                	test   %ecx,%ecx
  4041aa:	0f 85 e8 01 00 00    	jne    404398 <_Z11setcountersiPPc+0x2d8>
  4041b0:	8b 15 6a 4c c0 00    	mov    0xc04c6a(%rip),%edx        # 1008e20 <NumThreads>
  4041b6:	4c 8d 3d 83 81 80 01 	lea    0x1808183(%rip),%r15        # 1c0c340 <MSRCounters+0x403060>
  4041bd:	45 31 ed             	xor    %r13d,%r13d
  4041c0:	85 d2                	test   %edx,%edx
  4041c2:	7f 24                	jg     4041e8 <_Z11setcountersiPPc+0x128>
  4041c4:	e9 17 01 00 00       	jmp    4042e0 <_Z11setcountersiPPc+0x220>
  4041c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4041d0:	49 83 c5 01          	add    $0x1,%r13
  4041d4:	49 81 c7 18 20 00 00 	add    $0x2018,%r15
  4041db:	44 39 2d 3e 4c c0 00 	cmp    %r13d,0xc04c3e(%rip)        # 1008e20 <NumThreads>
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
  404248:	8b 05 ca 4b c0 00    	mov    0xc04bca(%rip),%eax        # 1008e18 <UsePMC>
  40424e:	74 40                	je     404290 <_Z11setcountersiPPc+0x1d0>
  404250:	85 c0                	test   %eax,%eax
  404252:	0f 84 78 ff ff ff    	je     4041d0 <_Z11setcountersiPPc+0x110>
  404258:	41 8b 87 10 20 00 00 	mov    0x2010(%r15),%eax
  40425f:	c1 e0 04             	shl    $0x4,%eax
  404262:	85 c0                	test   %eax,%eax
  404264:	0f 8e 66 ff ff ff    	jle    4041d0 <_Z11setcountersiPPc+0x110>
  40426a:	8b 3d 78 50 40 01    	mov    0x1405078(%rip),%edi        # 18092e8 <MSRCounters+0x8>
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
  4042aa:	8b 3d 38 50 40 01    	mov    0x1405038(%rip),%edi        # 18092e8 <MSRCounters+0x8>
  4042b0:	49 8d 97 00 d0 bf ff 	lea    -0x403000(%r15),%rdx
  4042b7:	85 ff                	test   %edi,%edi
  4042b9:	75 c0                	jne    40427b <_Z11setcountersiPPc+0x1bb>
  4042bb:	e9 10 ff ff ff       	jmp    4041d0 <_Z11setcountersiPPc+0x110>
  4042c0:	89 ea                	mov    %ebp,%edx
  4042c2:	48 8d 35 a7 cd bf 00 	lea    0xbfcda7(%rip),%rsi        # 1001070 <_IO_stdin_used+0x70>
  4042c9:	bf 01 00 00 00       	mov    $0x1,%edi
  4042ce:	31 c0                	xor    %eax,%eax
  4042d0:	e8 5b cd ff ff       	call   401030 <__printf_chk@plt>
  4042d5:	e9 69 ff ff ff       	jmp    404243 <_Z11setcountersiPPc+0x183>
  4042da:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  4042e0:	4c 89 f7             	mov    %r14,%rdi
  4042e3:	e8 88 e4 ff ff       	call   402770 <_ZN9CCounters7CleanUpEv>
  4042e8:	83 7c 24 0c 01       	cmpl   $0x1,0xc(%rsp)
  4042ed:	8b 15 15 4b c0 00    	mov    0xc04b15(%rip),%edx        # 1008e08 <NumCounters>
  4042f3:	0f 84 42 01 00 00    	je     40443b <_Z11setcountersiPPc+0x37b>
  4042f9:	44 89 e1             	mov    %r12d,%ecx
  4042fc:	48 8d 35 ad ce bf 00 	lea    0xbfcead(%rip),%rsi        # 10011b0 <_IO_stdin_used+0x1b0>
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
  404358:	4c 8d 3d e1 39 c0 00 	lea    0xc039e1(%rip),%r15        # 1007d40 <CounterTypesDesired>
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
  404398:	48 8b 3d 41 4f 40 01 	mov    0x1404f41(%rip),%rdi        # 18092e0 <MSRCounters>
  40439f:	31 f6                	xor    %esi,%esi
  4043a1:	31 c0                	xor    %eax,%eax
  4043a3:	e8 c8 cc ff ff       	call   401070 <open@plt>
  4043a8:	89 05 3a 4f 40 01    	mov    %eax,0x1404f3a(%rip)        # 18092e8 <MSRCounters+0x8>
  4043ae:	83 f8 ff             	cmp    $0xffffffff,%eax
  4043b1:	0f 85 f9 fd ff ff    	jne    4041b0 <_Z11setcountersiPPc+0xf0>
  4043b7:	48 8b 15 22 4f 40 01 	mov    0x1404f22(%rip),%rdx        # 18092e0 <MSRCounters>
  4043be:	48 8d 35 07 d1 bf 00 	lea    0xbfd107(%rip),%rsi        # 10014cc <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x8c>
  4043c5:	bf 01 00 00 00       	mov    $0x1,%edi
  4043ca:	31 c0                	xor    %eax,%eax
  4043cc:	e8 5f cc ff ff       	call   401030 <__printf_chk@plt>
  4043d1:	b8 01 00 00 00       	mov    $0x1,%eax
  4043d6:	c7 05 08 4f 40 01 00 	movl   $0x0,0x1404f08(%rip)        # 18092e8 <MSRCounters+0x8>
  4043dd:	00 00 00 
  4043e0:	e9 36 ff ff ff       	jmp    40431b <_Z11setcountersiPPc+0x25b>
  4043e5:	48 8d 35 7b d1 bf 00 	lea    0xbfd17b(%rip),%rsi        # 1001567 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x127>
  4043ec:	bf 01 00 00 00       	mov    $0x1,%edi
  4043f1:	31 c0                	xor    %eax,%eax
  4043f3:	e8 38 cc ff ff       	call   401030 <__printf_chk@plt>
  4043f8:	e9 45 fd ff ff       	jmp    404142 <_Z11setcountersiPPc+0x82>
  4043fd:	48 8d 35 56 d1 bf 00 	lea    0xbfd156(%rip),%rsi        # 100155a <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x11a>
  404404:	4c 89 f7             	mov    %r14,%rdi
  404407:	e8 34 cc ff ff       	call   401040 <strstr@plt>
  40440c:	c7 44 24 0c 02 00 00 	movl   $0x2,0xc(%rsp)
  404413:	00 
  404414:	48 85 c0             	test   %rax,%rax
  404417:	0f 85 f5 fc ff ff    	jne    404112 <_Z11setcountersiPPc+0x52>
  40441d:	4c 89 f2             	mov    %r14,%rdx
  404420:	48 8d 35 31 cd bf 00 	lea    0xbfcd31(%rip),%rsi        # 1001158 <_IO_stdin_used+0x158>
  404427:	bf 01 00 00 00       	mov    $0x1,%edi
  40442c:	e8 ff cb ff ff       	call   401030 <__printf_chk@plt>
  404431:	b8 01 00 00 00       	mov    $0x1,%eax
  404436:	e9 e0 fe ff ff       	jmp    40431b <_Z11setcountersiPPc+0x25b>
  40443b:	44 89 e1             	mov    %r12d,%ecx
  40443e:	48 8d 35 3b cd bf 00 	lea    0xbfcd3b(%rip),%rsi        # 1001180 <_IO_stdin_used+0x180>
  404445:	31 c0                	xor    %eax,%eax
  404447:	31 db                	xor    %ebx,%ebx
  404449:	bf 01 00 00 00       	mov    $0x1,%edi
  40444e:	4c 8d 2d 9b 4e 40 01 	lea    0x1404e9b(%rip),%r13        # 18092f0 <MSRCounters+0x10>
  404455:	4c 8d 25 e0 49 c0 00 	lea    0xc049e0(%rip),%r12        # 1008e3c <Counters>
  40445c:	e8 cf cb ff ff       	call   401030 <__printf_chk@plt>
  404461:	48 8d 35 19 d1 bf 00 	lea    0xbfd119(%rip),%rsi        # 1001581 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x141>
  404468:	31 c0                	xor    %eax,%eax
  40446a:	bf 01 00 00 00       	mov    $0x1,%edi
  40446f:	e8 bc cb ff ff       	call   401030 <__printf_chk@plt>
  404474:	8b 05 8e 49 c0 00    	mov    0xc0498e(%rip),%eax        # 1008e08 <NumCounters>
  40447a:	48 8d 2d 1e d1 bf 00 	lea    0xbfd11e(%rip),%rbp        # 100159f <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables+0x15f>
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
  4044ac:	39 1d 56 49 c0 00    	cmp    %ebx,0xc04956(%rip)        # 1008e08 <NumCounters>
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
  4044e3:	48 8d 15 56 cf bf 00 	lea    0xbfcf56(%rip),%rdx        # 1001440 <_ZZN9CCounters26GetP4EventSelectRegAddressEiiE17TranslationTables>
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
  40458f:	48 8d 35 2a 49 c0 00 	lea    0xc0492a(%rip),%rsi        # 1008ec0 <UserData>
  404596:	48 01 c6             	add    %rax,%rsi
  404599:	48 8d be 00 02 00 00 	lea    0x200(%rsi),%rdi
  4045a0:	31 ed                	xor    %ebp,%ebp
  4045a2:	4c 8d 2d d7 37 c0 00 	lea    0xc037d7(%rip),%r13        # 1007d80 <ThreadData>
  4045a9:	41 69 c7 80 10 00 00 	imul   $0x1080,%r15d,%eax
  4045b0:	49 01 c5             	add    %rax,%r13
  4045b3:	49 89 a5 58 10 00 00 	mov    %rsp,0x1058(%r13)
  4045ba:	45 31 f6             	xor    %r14d,%r14d

00000000004045bd <TEST_LOOP_1>:
  4045bd:	31 c0                	xor    %eax,%eax
  4045bf:	0f a2                	cpuid  
  4045c1:	8b 0d 75 48 c0 00    	mov    0xc04875(%rip),%ecx        # 1008e3c <Counters>
  4045c7:	0f 33                	rdpmc  
  4045c9:	41 89 45 04          	mov    %eax,0x4(%r13)
  4045cd:	8b 0d 6d 48 c0 00    	mov    0xc0486d(%rip),%ecx        # 1008e40 <Counters+0x4>
  4045d3:	0f 33                	rdpmc  
  4045d5:	41 89 45 08          	mov    %eax,0x8(%r13)
  4045d9:	8b 0d 65 48 c0 00    	mov    0xc04865(%rip),%ecx        # 1008e44 <Counters+0x8>
  4045df:	0f 33                	rdpmc  
  4045e1:	41 89 45 0c          	mov    %eax,0xc(%r13)
  4045e5:	8b 0d 5d 48 c0 00    	mov    0xc0485d(%rip),%ecx        # 1008e48 <Counters+0xc>
  4045eb:	0f 33                	rdpmc  
  4045ed:	41 89 45 10          	mov    %eax,0x10(%r13)
  4045f1:	8b 0d 55 48 c0 00    	mov    0xc04855(%rip),%ecx        # 1008e4c <Counters+0x10>
  4045f7:	0f 33                	rdpmc  
  4045f9:	41 89 45 14          	mov    %eax,0x14(%r13)
  4045fd:	8b 0d 4d 48 c0 00    	mov    0xc0484d(%rip),%ecx        # 1008e50 <Counters+0x14>
  404603:	0f 33                	rdpmc  
  404605:	41 89 45 18          	mov    %eax,0x18(%r13)
  404609:	8b 0d 45 48 c0 00    	mov    0xc04845(%rip),%ecx        # 1008e54 <Counters+0x18>
  40460f:	0f 33                	rdpmc  
  404611:	41 89 45 1c          	mov    %eax,0x1c(%r13)
  404615:	8b 0d 3d 48 c0 00    	mov    0xc0483d(%rip),%ecx        # 1008e58 <Counters+0x1c>
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
  40463d:	8b 0d f9 47 c0 00    	mov    0xc047f9(%rip),%ecx        # 1008e3c <Counters>
  404643:	0f 33                	rdpmc  
  404645:	41 29 45 04          	sub    %eax,0x4(%r13)
  404649:	8b 0d f1 47 c0 00    	mov    0xc047f1(%rip),%ecx        # 1008e40 <Counters+0x4>
  40464f:	0f 33                	rdpmc  
  404651:	41 29 45 08          	sub    %eax,0x8(%r13)
  404655:	8b 0d e9 47 c0 00    	mov    0xc047e9(%rip),%ecx        # 1008e44 <Counters+0x8>
  40465b:	0f 33                	rdpmc  
  40465d:	41 29 45 0c          	sub    %eax,0xc(%r13)
  404661:	8b 0d e1 47 c0 00    	mov    0xc047e1(%rip),%ecx        # 1008e48 <Counters+0xc>
  404667:	0f 33                	rdpmc  
  404669:	41 29 45 10          	sub    %eax,0x10(%r13)
  40466d:	8b 0d d9 47 c0 00    	mov    0xc047d9(%rip),%ecx        # 1008e4c <Counters+0x10>
  404673:	0f 33                	rdpmc  
  404675:	41 29 45 14          	sub    %eax,0x14(%r13)
  404679:	8b 0d d1 47 c0 00    	mov    0xc047d1(%rip),%ecx        # 1008e50 <Counters+0x14>
  40467f:	0f 33                	rdpmc  
  404681:	41 29 45 18          	sub    %eax,0x18(%r13)
  404685:	8b 0d c9 47 c0 00    	mov    0xc047c9(%rip),%ecx        # 1008e54 <Counters+0x18>
  40468b:	0f 33                	rdpmc  
  40468d:	41 29 45 1c          	sub    %eax,0x1c(%r13)
  404691:	8b 0d c1 47 c0 00    	mov    0xc047c1(%rip),%ecx        # 1008e58 <Counters+0x1c>
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
  404759:	e8 25 c1 bf 00       	call   1000883 <dummy_target_0>
  40475e:	e8 8c c1 bf 00       	call   10008ef <dummy_target_1>
  404763:	0f ae f0             	mfence 
  404766:	31 c0                	xor    %eax,%eax
  404768:	0f a2                	cpuid  
  40476a:	e8 14 c1 bf 00       	call   1000883 <dummy_target_0>
  40476f:	e8 7b c1 bf 00       	call   10008ef <dummy_target_1>
  404774:	0f ae f0             	mfence 
  404777:	31 c0                	xor    %eax,%eax
  404779:	0f a2                	cpuid  
  40477b:	e8 03 c1 bf 00       	call   1000883 <dummy_target_0>
  404780:	e8 6a c1 bf 00       	call   10008ef <dummy_target_1>
  404785:	0f ae f0             	mfence 
  404788:	31 c0                	xor    %eax,%eax
  40478a:	0f a2                	cpuid  
  40478c:	e8 f2 c0 bf 00       	call   1000883 <dummy_target_0>
  404791:	e8 59 c1 bf 00       	call   10008ef <dummy_target_1>
  404796:	0f ae f0             	mfence 
  404799:	31 c0                	xor    %eax,%eax
  40479b:	0f a2                	cpuid  
  40479d:	e8 e1 c0 bf 00       	call   1000883 <dummy_target_0>
  4047a2:	e8 48 c1 bf 00       	call   10008ef <dummy_target_1>
  4047a7:	0f ae f0             	mfence 
  4047aa:	31 c0                	xor    %eax,%eax
  4047ac:	0f a2                	cpuid  
  4047ae:	e8 d0 c0 bf 00       	call   1000883 <dummy_target_0>
  4047b3:	e8 37 c1 bf 00       	call   10008ef <dummy_target_1>
  4047b8:	0f ae f0             	mfence 
  4047bb:	31 c0                	xor    %eax,%eax
  4047bd:	0f a2                	cpuid  
  4047bf:	e8 bf c0 bf 00       	call   1000883 <dummy_target_0>
  4047c4:	e8 26 c1 bf 00       	call   10008ef <dummy_target_1>
  4047c9:	0f ae f0             	mfence 
  4047cc:	31 c0                	xor    %eax,%eax
  4047ce:	0f a2                	cpuid  
  4047d0:	e8 ae c0 bf 00       	call   1000883 <dummy_target_0>
  4047d5:	e8 15 c1 bf 00       	call   10008ef <dummy_target_1>
  4047da:	0f ae f0             	mfence 
  4047dd:	31 c0                	xor    %eax,%eax
  4047df:	0f a2                	cpuid  
  4047e1:	e8 9d c0 bf 00       	call   1000883 <dummy_target_0>
  4047e6:	e8 04 c1 bf 00       	call   10008ef <dummy_target_1>
  4047eb:	0f ae f0             	mfence 
  4047ee:	31 c0                	xor    %eax,%eax
  4047f0:	0f a2                	cpuid  
  4047f2:	e8 8c c0 bf 00       	call   1000883 <dummy_target_0>
  4047f7:	e8 f3 c0 bf 00       	call   10008ef <dummy_target_1>
  4047fc:	0f ae f0             	mfence 
  4047ff:	31 c0                	xor    %eax,%eax
  404801:	0f a2                	cpuid  
  404803:	45 31 f6             	xor    %r14d,%r14d

0000000000404806 <TEST_LOOP_2>:
  404806:	c7 05 0c 46 c0 00 01 	movl   $0x1,0xc0460c(%rip)        # 1008e1c <PrintCustomPMC>
  40480d:	00 00 00 
  404810:	48 8d 05 a9 46 c0 00 	lea    0xc046a9(%rip),%rax        # 1008ec0 <UserData>
  404817:	48 89 05 a2 46 40 01 	mov    %rax,0x14046a2(%rip)        # 1808ec0 <UserDataPtr>
  40481e:	48 8d 05 9b 46 40 01 	lea    0x140469b(%rip),%rax        # 1808ec0 <UserDataPtr>
  404825:	48 89 05 14 47 40 01 	mov    %rax,0x1404714(%rip)        # 1808f40 <UserDataPtrPtr>
  40482c:	48 8d 05 0d 47 40 01 	lea    0x140470d(%rip),%rax        # 1808f40 <UserDataPtrPtr>
  404833:	48 89 05 06 48 40 01 	mov    %rax,0x1404806(%rip)        # 1809040 <UserDataPtrPtrPtr>
  40483a:	31 c0                	xor    %eax,%eax
  40483c:	0f a2                	cpuid  
  40483e:	41 83 ff 00          	cmp    $0x0,%r15d
  404842:	74 00                	je     404844 <THREAD_T0>

0000000000404844 <THREAD_T0>:
  404844:	31 c0                	xor    %eax,%eax
  404846:	0f a2                	cpuid  
  404848:	8b 0d ee 45 c0 00    	mov    0xc045ee(%rip),%ecx        # 1008e3c <Counters>
  40484e:	0f 33                	rdpmc  
  404850:	41 89 45 04          	mov    %eax,0x4(%r13)
  404854:	8b 0d e6 45 c0 00    	mov    0xc045e6(%rip),%ecx        # 1008e40 <Counters+0x4>
  40485a:	0f 33                	rdpmc  
  40485c:	41 89 45 08          	mov    %eax,0x8(%r13)
  404860:	8b 0d de 45 c0 00    	mov    0xc045de(%rip),%ecx        # 1008e44 <Counters+0x8>
  404866:	0f 33                	rdpmc  
  404868:	41 89 45 0c          	mov    %eax,0xc(%r13)
  40486c:	8b 0d d6 45 c0 00    	mov    0xc045d6(%rip),%ecx        # 1008e48 <Counters+0xc>
  404872:	0f 33                	rdpmc  
  404874:	41 89 45 10          	mov    %eax,0x10(%r13)
  404878:	8b 0d ce 45 c0 00    	mov    0xc045ce(%rip),%ecx        # 1008e4c <Counters+0x10>
  40487e:	0f 33                	rdpmc  
  404880:	41 89 45 14          	mov    %eax,0x14(%r13)
  404884:	8b 0d c6 45 c0 00    	mov    0xc045c6(%rip),%ecx        # 1008e50 <Counters+0x14>
  40488a:	0f 33                	rdpmc  
  40488c:	41 89 45 18          	mov    %eax,0x18(%r13)
  404890:	8b 0d be 45 c0 00    	mov    0xc045be(%rip),%ecx        # 1008e54 <Counters+0x18>
  404896:	0f 33                	rdpmc  
  404898:	41 89 45 1c          	mov    %eax,0x1c(%r13)
  40489c:	8b 0d b6 45 c0 00    	mov    0xc045b6(%rip),%ecx        # 1008e58 <Counters+0x1c>
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
  4048c5:	48 8b 1d b8 45 c0 00 	mov    0xc045b8(%rip),%rbx        # 1008e84 <PSharedMemory2>
  4048cc:	87 03                	xchg   %eax,(%rbx)
  4048ce:	85 c0                	test   %eax,%eax
  4048d0:	75 ee                	jne    4048c0 <REPETITIONS1LOOP>
  4048d2:	0f ae 3d aa bf bf 00 	clflush 0xbfbfaa(%rip)        # 1000883 <dummy_target_0>
  4048d9:	0f ae 3d 0f c0 bf 00 	clflush 0xbfc00f(%rip)        # 10008ef <dummy_target_1>
  4048e0:	0f ae 3d d9 47 c0 00 	clflush 0xc047d9(%rip)        # 10090c0 <UserData+0x200>
  4048e7:	0f ae f0             	mfence 
  4048ea:	31 c0                	xor    %eax,%eax
  4048ec:	0f a2                	cpuid  
  4048ee:	ba 01 00 00 00       	mov    $0x1,%edx
  4048f3:	48 89 15 c6 45 c0 00 	mov    %rdx,0xc045c6(%rip)        # 1008ec0 <UserData>
  4048fa:	0f ae f0             	mfence 
  4048fd:	31 c0                	xor    %eax,%eax
  4048ff:	0f a2                	cpuid  
  404901:	e8 fa b6 bf 00       	call   1000000 <start_test_ibranch>
  404906:	0f ae f0             	mfence 
  404909:	31 c0                	xor    %eax,%eax
  40490b:	0f a2                	cpuid  
  40490d:	48 89 05 68 49 40 01 	mov    %rax,0x1404968(%rip)        # 180927c <TempData>
  404914:	48 89 1d 69 49 40 01 	mov    %rbx,0x1404969(%rip)        # 1809284 <TempData+0x8>
  40491b:	48 89 0d 6a 49 40 01 	mov    %rcx,0x140496a(%rip)        # 180928c <TempData+0x10>
  404922:	48 89 15 6b 49 40 01 	mov    %rdx,0x140496b(%rip)        # 1809294 <TempData+0x18>
  404929:	31 c0                	xor    %eax,%eax
  40492b:	0f a2                	cpuid  
  40492d:	48 31 c9             	xor    %rcx,%rcx
  404930:	8b 0d 06 45 c0 00    	mov    0xc04506(%rip),%ecx        # 1008e3c <Counters>
  404936:	0f 33                	rdpmc  
  404938:	41 89 45 28          	mov    %eax,0x28(%r13)

000000000040493c <debug_counter_0_0>:
  40493c:	48 31 c9             	xor    %rcx,%rcx
  40493f:	8b 0d fb 44 c0 00    	mov    0xc044fb(%rip),%ecx        # 1008e40 <Counters+0x4>
  404945:	0f 33                	rdpmc  
  404947:	41 89 45 2c          	mov    %eax,0x2c(%r13)

000000000040494b <debug_counter_0_1>:
  40494b:	48 31 c9             	xor    %rcx,%rcx
  40494e:	8b 0d f0 44 c0 00    	mov    0xc044f0(%rip),%ecx        # 1008e44 <Counters+0x8>
  404954:	0f 33                	rdpmc  
  404956:	41 89 45 30          	mov    %eax,0x30(%r13)

000000000040495a <debug_counter_0_2>:
  40495a:	48 31 c9             	xor    %rcx,%rcx
  40495d:	8b 0d e5 44 c0 00    	mov    0xc044e5(%rip),%ecx        # 1008e48 <Counters+0xc>
  404963:	0f 33                	rdpmc  
  404965:	41 89 45 34          	mov    %eax,0x34(%r13)

0000000000404969 <debug_counter_0_3>:
  404969:	48 31 c9             	xor    %rcx,%rcx
  40496c:	8b 0d da 44 c0 00    	mov    0xc044da(%rip),%ecx        # 1008e4c <Counters+0x10>
  404972:	0f 33                	rdpmc  
  404974:	41 89 45 38          	mov    %eax,0x38(%r13)

0000000000404978 <debug_counter_0_4>:
  404978:	48 31 c9             	xor    %rcx,%rcx
  40497b:	8b 0d cf 44 c0 00    	mov    0xc044cf(%rip),%ecx        # 1008e50 <Counters+0x14>
  404981:	0f 33                	rdpmc  
  404983:	41 89 45 3c          	mov    %eax,0x3c(%r13)

0000000000404987 <debug_counter_0_5>:
  404987:	48 31 c9             	xor    %rcx,%rcx
  40498a:	8b 0d c4 44 c0 00    	mov    0xc044c4(%rip),%ecx        # 1008e54 <Counters+0x18>
  404990:	0f 33                	rdpmc  
  404992:	41 89 45 40          	mov    %eax,0x40(%r13)

0000000000404996 <debug_counter_0_6>:
  404996:	48 31 c9             	xor    %rcx,%rcx
  404999:	8b 0d b9 44 c0 00    	mov    0xc044b9(%rip),%ecx        # 1008e58 <Counters+0x1c>
  40499f:	0f 33                	rdpmc  
  4049a1:	41 89 45 44          	mov    %eax,0x44(%r13)

00000000004049a5 <debug_counter_0_7>:
  4049a5:	31 c0                	xor    %eax,%eax
  4049a7:	0f a2                	cpuid  
  4049a9:	0f 31                	rdtsc  
  4049ab:	41 89 45 24          	mov    %eax,0x24(%r13)
  4049af:	48 8b 05 c6 48 40 01 	mov    0x14048c6(%rip),%rax        # 180927c <TempData>
  4049b6:	48 8b 1d c7 48 40 01 	mov    0x14048c7(%rip),%rbx        # 1809284 <TempData+0x8>
  4049bd:	48 8b 0d c8 48 40 01 	mov    0x14048c8(%rip),%rcx        # 180928c <TempData+0x10>
  4049c4:	48 8b 15 c9 48 40 01 	mov    0x14048c9(%rip),%rdx        # 1809294 <TempData+0x18>
  4049cb:	4c 8b 1d ee 46 c0 00 	mov    0xc046ee(%rip),%r11        # 10090c0 <UserData+0x200>
  4049d2:	48 89 05 a3 48 40 01 	mov    %rax,0x14048a3(%rip)        # 180927c <TempData>
  4049d9:	48 89 1d a4 48 40 01 	mov    %rbx,0x14048a4(%rip)        # 1809284 <TempData+0x8>
  4049e0:	48 89 0d a5 48 40 01 	mov    %rcx,0x14048a5(%rip)        # 180928c <TempData+0x10>
  4049e7:	48 89 15 a6 48 40 01 	mov    %rdx,0x14048a6(%rip)        # 1809294 <TempData+0x18>
  4049ee:	31 c0                	xor    %eax,%eax
  4049f0:	0f a2                	cpuid  
  4049f2:	48 31 c0             	xor    %rax,%rax
  4049f5:	48 31 c9             	xor    %rcx,%rcx
  4049f8:	0f 31                	rdtsc  
  4049fa:	41 8b 4d 24          	mov    0x24(%r13),%ecx
  4049fe:	29 c8                	sub    %ecx,%eax
  404a00:	43 01 44 b5 70       	add    %eax,0x70(%r13,%r14,4)
  404a05:	31 c0                	xor    %eax,%eax
  404a07:	0f a2                	cpuid  
  404a09:	48 31 c9             	xor    %rcx,%rcx
  404a0c:	48 31 c0             	xor    %rax,%rax
  404a0f:	8b 0d 27 44 c0 00    	mov    0xc04427(%rip),%ecx        # 1008e3c <Counters>
  404a15:	0f 33                	rdpmc  
  404a17:	41 8b 4d 28          	mov    0x28(%r13),%ecx

0000000000404a1b <debug_counter_1_0>:
  404a1b:	29 c8                	sub    %ecx,%eax
  404a1d:	43 01 84 b5 34 10 00 	add    %eax,0x1034(%r13,%r14,4)
  404a24:	00 
  404a25:	48 31 c9             	xor    %rcx,%rcx
  404a28:	48 31 c0             	xor    %rax,%rax
  404a2b:	8b 0d 0f 44 c0 00    	mov    0xc0440f(%rip),%ecx        # 1008e40 <Counters+0x4>
  404a31:	0f 33                	rdpmc  
  404a33:	41 8b 4d 2c          	mov    0x2c(%r13),%ecx

0000000000404a37 <debug_counter_1_1>:
  404a37:	29 c8                	sub    %ecx,%eax
  404a39:	43 01 84 b5 38 10 00 	add    %eax,0x1038(%r13,%r14,4)
  404a40:	00 
  404a41:	48 31 c9             	xor    %rcx,%rcx
  404a44:	48 31 c0             	xor    %rax,%rax
  404a47:	8b 0d f7 43 c0 00    	mov    0xc043f7(%rip),%ecx        # 1008e44 <Counters+0x8>
  404a4d:	0f 33                	rdpmc  
  404a4f:	41 8b 4d 30          	mov    0x30(%r13),%ecx

0000000000404a53 <debug_counter_1_2>:
  404a53:	29 c8                	sub    %ecx,%eax
  404a55:	43 01 84 b5 3c 10 00 	add    %eax,0x103c(%r13,%r14,4)
  404a5c:	00 
  404a5d:	48 31 c9             	xor    %rcx,%rcx
  404a60:	48 31 c0             	xor    %rax,%rax
  404a63:	8b 0d df 43 c0 00    	mov    0xc043df(%rip),%ecx        # 1008e48 <Counters+0xc>
  404a69:	0f 33                	rdpmc  
  404a6b:	41 8b 4d 34          	mov    0x34(%r13),%ecx

0000000000404a6f <debug_counter_1_3>:
  404a6f:	29 c8                	sub    %ecx,%eax
  404a71:	43 01 84 b5 40 10 00 	add    %eax,0x1040(%r13,%r14,4)
  404a78:	00 
  404a79:	48 31 c9             	xor    %rcx,%rcx
  404a7c:	48 31 c0             	xor    %rax,%rax
  404a7f:	8b 0d c7 43 c0 00    	mov    0xc043c7(%rip),%ecx        # 1008e4c <Counters+0x10>
  404a85:	0f 33                	rdpmc  
  404a87:	41 8b 4d 38          	mov    0x38(%r13),%ecx

0000000000404a8b <debug_counter_1_4>:
  404a8b:	29 c8                	sub    %ecx,%eax
  404a8d:	43 01 84 b5 44 10 00 	add    %eax,0x1044(%r13,%r14,4)
  404a94:	00 
  404a95:	48 31 c9             	xor    %rcx,%rcx
  404a98:	48 31 c0             	xor    %rax,%rax
  404a9b:	8b 0d af 43 c0 00    	mov    0xc043af(%rip),%ecx        # 1008e50 <Counters+0x14>
  404aa1:	0f 33                	rdpmc  
  404aa3:	41 8b 4d 3c          	mov    0x3c(%r13),%ecx

0000000000404aa7 <debug_counter_1_5>:
  404aa7:	29 c8                	sub    %ecx,%eax
  404aa9:	43 01 84 b5 48 10 00 	add    %eax,0x1048(%r13,%r14,4)
  404ab0:	00 
  404ab1:	48 31 c9             	xor    %rcx,%rcx
  404ab4:	48 31 c0             	xor    %rax,%rax
  404ab7:	8b 0d 97 43 c0 00    	mov    0xc04397(%rip),%ecx        # 1008e54 <Counters+0x18>
  404abd:	0f 33                	rdpmc  
  404abf:	41 8b 4d 40          	mov    0x40(%r13),%ecx

0000000000404ac3 <debug_counter_1_6>:
  404ac3:	29 c8                	sub    %ecx,%eax
  404ac5:	43 01 84 b5 4c 10 00 	add    %eax,0x104c(%r13,%r14,4)
  404acc:	00 
  404acd:	48 31 c9             	xor    %rcx,%rcx
  404ad0:	48 31 c0             	xor    %rax,%rax
  404ad3:	8b 0d 7f 43 c0 00    	mov    0xc0437f(%rip),%ecx        # 1008e58 <Counters+0x1c>
  404ad9:	0f 33                	rdpmc  
  404adb:	41 8b 4d 44          	mov    0x44(%r13),%ecx

0000000000404adf <debug_counter_1_7>:
  404adf:	29 c8                	sub    %ecx,%eax
  404ae1:	43 01 84 b5 50 10 00 	add    %eax,0x1050(%r13,%r14,4)
  404ae8:	00 
  404ae9:	48 8b 05 8c 47 40 01 	mov    0x140478c(%rip),%rax        # 180927c <TempData>
  404af0:	48 8b 1d 8d 47 40 01 	mov    0x140478d(%rip),%rbx        # 1809284 <TempData+0x8>
  404af7:	48 8b 0d 8e 47 40 01 	mov    0x140478e(%rip),%rcx        # 180928c <TempData+0x10>
  404afe:	48 8b 15 8f 47 40 01 	mov    0x140478f(%rip),%rdx        # 1809294 <TempData+0x18>

0000000000404b05 <release_spinlock_0_1>:
  404b05:	31 c0                	xor    %eax,%eax
  404b07:	0f a2                	cpuid  
  404b09:	0f ae f0             	mfence 
  404b0c:	48 8b 1d 69 43 c0 00 	mov    0xc04369(%rip),%rbx        # 1008e7c <PSharedMemory>
  404b13:	ff 0b                	decl   (%rbx)
  404b15:	90                   	nop
  404b16:	90                   	nop
  404b17:	90                   	nop
  404b18:	90                   	nop
  404b19:	90                   	nop
  404b1a:	90                   	nop
  404b1b:	90                   	nop
  404b1c:	90                   	nop
  404b1d:	90                   	nop
  404b1e:	90                   	nop
  404b1f:	90                   	nop
  404b20:	90                   	nop
  404b21:	90                   	nop
  404b22:	90                   	nop
  404b23:	90                   	nop
  404b24:	90                   	nop
  404b25:	90                   	nop
  404b26:	90                   	nop
  404b27:	90                   	nop
  404b28:	90                   	nop
  404b29:	90                   	nop
  404b2a:	90                   	nop
  404b2b:	90                   	nop
  404b2c:	90                   	nop
  404b2d:	90                   	nop
  404b2e:	90                   	nop
  404b2f:	90                   	nop
  404b30:	90                   	nop
  404b31:	90                   	nop
  404b32:	90                   	nop
  404b33:	90                   	nop
  404b34:	90                   	nop
  404b35:	90                   	nop
  404b36:	90                   	nop
  404b37:	90                   	nop
  404b38:	90                   	nop
  404b39:	90                   	nop
  404b3a:	90                   	nop
  404b3b:	90                   	nop
  404b3c:	90                   	nop
  404b3d:	90                   	nop
  404b3e:	90                   	nop
  404b3f:	90                   	nop
  404b40:	90                   	nop
  404b41:	90                   	nop
  404b42:	90                   	nop
  404b43:	90                   	nop
  404b44:	90                   	nop
  404b45:	90                   	nop
  404b46:	90                   	nop
  404b47:	90                   	nop
  404b48:	90                   	nop
  404b49:	90                   	nop
  404b4a:	90                   	nop
  404b4b:	90                   	nop
  404b4c:	90                   	nop
  404b4d:	90                   	nop
  404b4e:	90                   	nop
  404b4f:	90                   	nop
  404b50:	90                   	nop
  404b51:	90                   	nop
  404b52:	90                   	nop
  404b53:	90                   	nop
  404b54:	90                   	nop
  404b55:	90                   	nop
  404b56:	90                   	nop
  404b57:	90                   	nop
  404b58:	90                   	nop
  404b59:	90                   	nop
  404b5a:	90                   	nop
  404b5b:	90                   	nop
  404b5c:	90                   	nop
  404b5d:	90                   	nop
  404b5e:	90                   	nop
  404b5f:	90                   	nop
  404b60:	90                   	nop
  404b61:	90                   	nop
  404b62:	90                   	nop
  404b63:	90                   	nop
  404b64:	90                   	nop
  404b65:	90                   	nop
  404b66:	90                   	nop
  404b67:	90                   	nop
  404b68:	90                   	nop
  404b69:	90                   	nop
  404b6a:	90                   	nop
  404b6b:	90                   	nop
  404b6c:	90                   	nop
  404b6d:	90                   	nop
  404b6e:	90                   	nop
  404b6f:	90                   	nop
  404b70:	90                   	nop
  404b71:	90                   	nop
  404b72:	90                   	nop
  404b73:	90                   	nop
  404b74:	90                   	nop
  404b75:	90                   	nop
  404b76:	90                   	nop
  404b77:	90                   	nop
  404b78:	90                   	nop
  404b79:	90                   	nop
  404b7a:	90                   	nop
  404b7b:	90                   	nop
  404b7c:	90                   	nop
  404b7d:	90                   	nop
  404b7e:	90                   	nop
  404b7f:	90                   	nop
  404b80:	90                   	nop
  404b81:	90                   	nop
  404b82:	90                   	nop
  404b83:	90                   	nop
  404b84:	90                   	nop
  404b85:	90                   	nop
  404b86:	90                   	nop
  404b87:	90                   	nop
  404b88:	90                   	nop
  404b89:	90                   	nop
  404b8a:	90                   	nop
  404b8b:	90                   	nop
  404b8c:	90                   	nop
  404b8d:	90                   	nop
  404b8e:	90                   	nop
  404b8f:	90                   	nop
  404b90:	90                   	nop
  404b91:	90                   	nop
  404b92:	90                   	nop
  404b93:	90                   	nop
  404b94:	90                   	nop
  404b95:	90                   	nop
  404b96:	90                   	nop
  404b97:	90                   	nop
  404b98:	90                   	nop
  404b99:	90                   	nop
  404b9a:	90                   	nop
  404b9b:	90                   	nop
  404b9c:	90                   	nop
  404b9d:	90                   	nop
  404b9e:	90                   	nop
  404b9f:	90                   	nop
  404ba0:	90                   	nop
  404ba1:	90                   	nop
  404ba2:	90                   	nop
  404ba3:	90                   	nop
  404ba4:	90                   	nop
  404ba5:	90                   	nop
  404ba6:	90                   	nop
  404ba7:	90                   	nop
  404ba8:	90                   	nop
  404ba9:	90                   	nop
  404baa:	90                   	nop
  404bab:	90                   	nop
  404bac:	90                   	nop
  404bad:	90                   	nop
  404bae:	90                   	nop
  404baf:	90                   	nop
  404bb0:	90                   	nop
  404bb1:	90                   	nop
  404bb2:	90                   	nop
  404bb3:	90                   	nop
  404bb4:	90                   	nop
  404bb5:	90                   	nop
  404bb6:	90                   	nop
  404bb7:	90                   	nop
  404bb8:	90                   	nop
  404bb9:	90                   	nop
  404bba:	90                   	nop
  404bbb:	90                   	nop
  404bbc:	90                   	nop
  404bbd:	90                   	nop
  404bbe:	90                   	nop
  404bbf:	90                   	nop
  404bc0:	90                   	nop
  404bc1:	90                   	nop
  404bc2:	90                   	nop
  404bc3:	90                   	nop
  404bc4:	90                   	nop
  404bc5:	90                   	nop
  404bc6:	90                   	nop
  404bc7:	90                   	nop
  404bc8:	90                   	nop
  404bc9:	90                   	nop
  404bca:	90                   	nop
  404bcb:	90                   	nop
  404bcc:	90                   	nop
  404bcd:	90                   	nop
  404bce:	90                   	nop
  404bcf:	90                   	nop
  404bd0:	90                   	nop
  404bd1:	90                   	nop
  404bd2:	90                   	nop
  404bd3:	90                   	nop
  404bd4:	90                   	nop
  404bd5:	90                   	nop
  404bd6:	90                   	nop
  404bd7:	90                   	nop
  404bd8:	90                   	nop
  404bd9:	90                   	nop
  404bda:	90                   	nop
  404bdb:	90                   	nop
  404bdc:	90                   	nop
  404bdd:	90                   	nop
  404bde:	90                   	nop
  404bdf:	90                   	nop
  404be0:	90                   	nop
  404be1:	90                   	nop
  404be2:	90                   	nop
  404be3:	90                   	nop
  404be4:	90                   	nop
  404be5:	90                   	nop
  404be6:	90                   	nop
  404be7:	90                   	nop
  404be8:	90                   	nop
  404be9:	90                   	nop
  404bea:	90                   	nop
  404beb:	90                   	nop
  404bec:	90                   	nop
  404bed:	90                   	nop
  404bee:	90                   	nop
  404bef:	90                   	nop
  404bf0:	90                   	nop
  404bf1:	90                   	nop
  404bf2:	90                   	nop
  404bf3:	90                   	nop
  404bf4:	90                   	nop
  404bf5:	90                   	nop
  404bf6:	90                   	nop
  404bf7:	90                   	nop
  404bf8:	90                   	nop
  404bf9:	90                   	nop
  404bfa:	90                   	nop
  404bfb:	90                   	nop
  404bfc:	90                   	nop
  404bfd:	90                   	nop
  404bfe:	90                   	nop
  404bff:	90                   	nop
  404c00:	90                   	nop
  404c01:	90                   	nop
  404c02:	90                   	nop
  404c03:	90                   	nop
  404c04:	90                   	nop
  404c05:	90                   	nop
  404c06:	90                   	nop
  404c07:	90                   	nop
  404c08:	90                   	nop
  404c09:	90                   	nop
  404c0a:	90                   	nop
  404c0b:	90                   	nop
  404c0c:	90                   	nop
  404c0d:	90                   	nop
  404c0e:	90                   	nop
  404c0f:	90                   	nop
  404c10:	90                   	nop
  404c11:	90                   	nop
  404c12:	90                   	nop
  404c13:	90                   	nop
  404c14:	90                   	nop
  404c15:	90                   	nop
  404c16:	90                   	nop
  404c17:	90                   	nop
  404c18:	90                   	nop
  404c19:	90                   	nop
  404c1a:	90                   	nop
  404c1b:	90                   	nop
  404c1c:	90                   	nop
  404c1d:	90                   	nop
  404c1e:	90                   	nop
  404c1f:	90                   	nop
  404c20:	90                   	nop
  404c21:	90                   	nop
  404c22:	90                   	nop
  404c23:	90                   	nop
  404c24:	90                   	nop
  404c25:	90                   	nop
  404c26:	90                   	nop
  404c27:	90                   	nop
  404c28:	90                   	nop
  404c29:	90                   	nop
  404c2a:	90                   	nop
  404c2b:	90                   	nop
  404c2c:	90                   	nop
  404c2d:	90                   	nop
  404c2e:	90                   	nop
  404c2f:	90                   	nop
  404c30:	90                   	nop
  404c31:	90                   	nop
  404c32:	90                   	nop
  404c33:	90                   	nop
  404c34:	90                   	nop
  404c35:	90                   	nop
  404c36:	90                   	nop
  404c37:	90                   	nop
  404c38:	90                   	nop
  404c39:	90                   	nop
  404c3a:	90                   	nop
  404c3b:	90                   	nop
  404c3c:	90                   	nop
  404c3d:	90                   	nop
  404c3e:	90                   	nop
  404c3f:	90                   	nop
  404c40:	90                   	nop
  404c41:	90                   	nop
  404c42:	90                   	nop
  404c43:	90                   	nop
  404c44:	90                   	nop
  404c45:	90                   	nop
  404c46:	90                   	nop
  404c47:	90                   	nop
  404c48:	90                   	nop
  404c49:	90                   	nop
  404c4a:	90                   	nop
  404c4b:	90                   	nop
  404c4c:	90                   	nop
  404c4d:	90                   	nop
  404c4e:	90                   	nop
  404c4f:	90                   	nop
  404c50:	90                   	nop
  404c51:	90                   	nop
  404c52:	90                   	nop
  404c53:	90                   	nop
  404c54:	90                   	nop
  404c55:	90                   	nop
  404c56:	90                   	nop
  404c57:	90                   	nop
  404c58:	90                   	nop
  404c59:	90                   	nop
  404c5a:	90                   	nop
  404c5b:	90                   	nop
  404c5c:	90                   	nop
  404c5d:	90                   	nop
  404c5e:	90                   	nop
  404c5f:	90                   	nop
  404c60:	90                   	nop
  404c61:	90                   	nop
  404c62:	90                   	nop
  404c63:	90                   	nop
  404c64:	90                   	nop
  404c65:	90                   	nop
  404c66:	90                   	nop
  404c67:	90                   	nop
  404c68:	90                   	nop
  404c69:	90                   	nop
  404c6a:	90                   	nop
  404c6b:	90                   	nop
  404c6c:	90                   	nop
  404c6d:	90                   	nop
  404c6e:	90                   	nop
  404c6f:	90                   	nop
  404c70:	90                   	nop
  404c71:	90                   	nop
  404c72:	90                   	nop
  404c73:	90                   	nop
  404c74:	90                   	nop
  404c75:	90                   	nop
  404c76:	90                   	nop
  404c77:	90                   	nop
  404c78:	90                   	nop
  404c79:	90                   	nop
  404c7a:	90                   	nop
  404c7b:	90                   	nop
  404c7c:	90                   	nop
  404c7d:	90                   	nop
  404c7e:	90                   	nop
  404c7f:	90                   	nop
  404c80:	90                   	nop
  404c81:	90                   	nop
  404c82:	90                   	nop
  404c83:	90                   	nop
  404c84:	90                   	nop
  404c85:	90                   	nop
  404c86:	90                   	nop
  404c87:	90                   	nop
  404c88:	90                   	nop
  404c89:	90                   	nop
  404c8a:	90                   	nop
  404c8b:	90                   	nop
  404c8c:	90                   	nop
  404c8d:	90                   	nop
  404c8e:	90                   	nop
  404c8f:	90                   	nop
  404c90:	90                   	nop
  404c91:	90                   	nop
  404c92:	90                   	nop
  404c93:	90                   	nop
  404c94:	90                   	nop
  404c95:	90                   	nop
  404c96:	90                   	nop
  404c97:	90                   	nop
  404c98:	90                   	nop
  404c99:	90                   	nop
  404c9a:	90                   	nop
  404c9b:	90                   	nop
  404c9c:	90                   	nop
  404c9d:	90                   	nop
  404c9e:	90                   	nop
  404c9f:	90                   	nop
  404ca0:	90                   	nop
  404ca1:	90                   	nop
  404ca2:	90                   	nop
  404ca3:	90                   	nop
  404ca4:	90                   	nop
  404ca5:	90                   	nop
  404ca6:	90                   	nop
  404ca7:	90                   	nop
  404ca8:	90                   	nop
  404ca9:	90                   	nop
  404caa:	90                   	nop
  404cab:	90                   	nop
  404cac:	90                   	nop
  404cad:	90                   	nop
  404cae:	90                   	nop
  404caf:	90                   	nop
  404cb0:	90                   	nop
  404cb1:	90                   	nop
  404cb2:	90                   	nop
  404cb3:	90                   	nop
  404cb4:	90                   	nop
  404cb5:	90                   	nop
  404cb6:	90                   	nop
  404cb7:	90                   	nop
  404cb8:	90                   	nop
  404cb9:	90                   	nop
  404cba:	90                   	nop
  404cbb:	90                   	nop
  404cbc:	90                   	nop
  404cbd:	90                   	nop
  404cbe:	90                   	nop
  404cbf:	90                   	nop
  404cc0:	90                   	nop
  404cc1:	90                   	nop
  404cc2:	90                   	nop
  404cc3:	90                   	nop
  404cc4:	90                   	nop
  404cc5:	90                   	nop
  404cc6:	90                   	nop
  404cc7:	90                   	nop
  404cc8:	90                   	nop
  404cc9:	90                   	nop
  404cca:	90                   	nop
  404ccb:	90                   	nop
  404ccc:	90                   	nop
  404ccd:	90                   	nop
  404cce:	90                   	nop
  404ccf:	90                   	nop
  404cd0:	90                   	nop
  404cd1:	90                   	nop
  404cd2:	90                   	nop
  404cd3:	90                   	nop
  404cd4:	90                   	nop
  404cd5:	90                   	nop
  404cd6:	90                   	nop
  404cd7:	90                   	nop
  404cd8:	90                   	nop
  404cd9:	90                   	nop
  404cda:	90                   	nop
  404cdb:	90                   	nop
  404cdc:	90                   	nop
  404cdd:	90                   	nop
  404cde:	90                   	nop
  404cdf:	90                   	nop
  404ce0:	90                   	nop
  404ce1:	90                   	nop
  404ce2:	90                   	nop
  404ce3:	90                   	nop
  404ce4:	90                   	nop
  404ce5:	90                   	nop
  404ce6:	90                   	nop
  404ce7:	90                   	nop
  404ce8:	90                   	nop
  404ce9:	90                   	nop
  404cea:	90                   	nop
  404ceb:	90                   	nop
  404cec:	90                   	nop
  404ced:	90                   	nop
  404cee:	90                   	nop
  404cef:	90                   	nop
  404cf0:	90                   	nop
  404cf1:	90                   	nop
  404cf2:	90                   	nop
  404cf3:	90                   	nop
  404cf4:	90                   	nop
  404cf5:	90                   	nop
  404cf6:	90                   	nop
  404cf7:	90                   	nop
  404cf8:	90                   	nop
  404cf9:	90                   	nop
  404cfa:	90                   	nop
  404cfb:	90                   	nop
  404cfc:	90                   	nop
  404cfd:	90                   	nop
  404cfe:	90                   	nop
  404cff:	90                   	nop
  404d00:	90                   	nop
  404d01:	90                   	nop
  404d02:	90                   	nop
  404d03:	90                   	nop
  404d04:	90                   	nop
  404d05:	90                   	nop
  404d06:	90                   	nop
  404d07:	90                   	nop
  404d08:	90                   	nop
  404d09:	90                   	nop
  404d0a:	90                   	nop
  404d0b:	90                   	nop
  404d0c:	90                   	nop
  404d0d:	90                   	nop
  404d0e:	90                   	nop
  404d0f:	90                   	nop
  404d10:	90                   	nop
  404d11:	90                   	nop
  404d12:	90                   	nop
  404d13:	90                   	nop
  404d14:	90                   	nop
  404d15:	41 ff cc             	dec    %r12d
  404d18:	0f 85 a2 fb ff ff    	jne    4048c0 <REPETITIONS1LOOP>
  404d1e:	eb 00                	jmp    404d20 <THREAD_T1_END>

0000000000404d20 <THREAD_T1_END>:
  404d20:	31 c0                	xor    %eax,%eax
  404d22:	0f a2                	cpuid  
  404d24:	0f 31                	rdtsc  
  404d26:	41 29 45 00          	sub    %eax,0x0(%r13)
  404d2a:	31 c0                	xor    %eax,%eax
  404d2c:	0f a2                	cpuid  
  404d2e:	8b 0d 08 41 c0 00    	mov    0xc04108(%rip),%ecx        # 1008e3c <Counters>
  404d34:	0f 33                	rdpmc  
  404d36:	41 29 45 04          	sub    %eax,0x4(%r13)
  404d3a:	8b 0d 00 41 c0 00    	mov    0xc04100(%rip),%ecx        # 1008e40 <Counters+0x4>
  404d40:	0f 33                	rdpmc  
  404d42:	41 29 45 08          	sub    %eax,0x8(%r13)
  404d46:	8b 0d f8 40 c0 00    	mov    0xc040f8(%rip),%ecx        # 1008e44 <Counters+0x8>
  404d4c:	0f 33                	rdpmc  
  404d4e:	41 29 45 0c          	sub    %eax,0xc(%r13)
  404d52:	8b 0d f0 40 c0 00    	mov    0xc040f0(%rip),%ecx        # 1008e48 <Counters+0xc>
  404d58:	0f 33                	rdpmc  
  404d5a:	41 29 45 10          	sub    %eax,0x10(%r13)
  404d5e:	8b 0d e8 40 c0 00    	mov    0xc040e8(%rip),%ecx        # 1008e4c <Counters+0x10>
  404d64:	0f 33                	rdpmc  
  404d66:	41 29 45 14          	sub    %eax,0x14(%r13)
  404d6a:	8b 0d e0 40 c0 00    	mov    0xc040e0(%rip),%ecx        # 1008e50 <Counters+0x14>
  404d70:	0f 33                	rdpmc  
  404d72:	41 29 45 18          	sub    %eax,0x18(%r13)
  404d76:	8b 0d d8 40 c0 00    	mov    0xc040d8(%rip),%ecx        # 1008e54 <Counters+0x18>
  404d7c:	0f 33                	rdpmc  
  404d7e:	41 29 45 1c          	sub    %eax,0x1c(%r13)
  404d82:	8b 0d d0 40 c0 00    	mov    0xc040d0(%rip),%ecx        # 1008e58 <Counters+0x1c>
  404d88:	0f 33                	rdpmc  
  404d8a:	41 29 45 20          	sub    %eax,0x20(%r13)
  404d8e:	31 c0                	xor    %eax,%eax
  404d90:	0f a2                	cpuid  
  404d92:	41 8b 45 00          	mov    0x0(%r13),%eax
  404d96:	f7 d8                	neg    %eax
  404d98:	41 2b 45 48          	sub    0x48(%r13),%eax
  404d9c:	43 89 44 b5 6c       	mov    %eax,0x6c(%r13,%r14,4)
  404da1:	41 8b 45 04          	mov    0x4(%r13),%eax
  404da5:	f7 d8                	neg    %eax
  404da7:	41 2b 45 4c          	sub    0x4c(%r13),%eax
  404dab:	43 89 84 b5 14 10 00 	mov    %eax,0x1014(%r13,%r14,4)
  404db2:	00 
  404db3:	41 8b 45 08          	mov    0x8(%r13),%eax
  404db7:	f7 d8                	neg    %eax
  404db9:	41 2b 45 50          	sub    0x50(%r13),%eax
  404dbd:	43 89 84 b5 18 10 00 	mov    %eax,0x1018(%r13,%r14,4)
  404dc4:	00 
  404dc5:	41 8b 45 0c          	mov    0xc(%r13),%eax
  404dc9:	f7 d8                	neg    %eax
  404dcb:	41 2b 45 54          	sub    0x54(%r13),%eax
  404dcf:	43 89 84 b5 1c 10 00 	mov    %eax,0x101c(%r13,%r14,4)
  404dd6:	00 
  404dd7:	41 8b 45 10          	mov    0x10(%r13),%eax
  404ddb:	f7 d8                	neg    %eax
  404ddd:	41 2b 45 58          	sub    0x58(%r13),%eax
  404de1:	43 89 84 b5 20 10 00 	mov    %eax,0x1020(%r13,%r14,4)
  404de8:	00 
  404de9:	41 8b 45 14          	mov    0x14(%r13),%eax
  404ded:	f7 d8                	neg    %eax
  404def:	41 2b 45 5c          	sub    0x5c(%r13),%eax
  404df3:	43 89 84 b5 24 10 00 	mov    %eax,0x1024(%r13,%r14,4)
  404dfa:	00 
  404dfb:	41 8b 45 18          	mov    0x18(%r13),%eax
  404dff:	f7 d8                	neg    %eax
  404e01:	41 2b 45 60          	sub    0x60(%r13),%eax
  404e05:	43 89 84 b5 28 10 00 	mov    %eax,0x1028(%r13,%r14,4)
  404e0c:	00 
  404e0d:	41 8b 45 1c          	mov    0x1c(%r13),%eax
  404e11:	f7 d8                	neg    %eax
  404e13:	41 2b 45 64          	sub    0x64(%r13),%eax
  404e17:	43 89 84 b5 2c 10 00 	mov    %eax,0x102c(%r13,%r14,4)
  404e1e:	00 
  404e1f:	41 8b 45 20          	mov    0x20(%r13),%eax
  404e23:	f7 d8                	neg    %eax
  404e25:	41 2b 45 68          	sub    0x68(%r13),%eax
  404e29:	43 89 84 b5 30 10 00 	mov    %eax,0x1030(%r13,%r14,4)
  404e30:	00 
  404e31:	31 c0                	xor    %eax,%eax
  404e33:	0f a2                	cpuid  

0000000000404e35 <END_TEST_LOOP_2>:
  404e35:	41 ff c6             	inc    %r14d
  404e38:	41 83 fe 01          	cmp    $0x1,%r14d
  404e3c:	0f 82 c4 f9 ff ff    	jb     404806 <TEST_LOOP_2>

0000000000404e42 <EXITALL1>:
  404e42:	49 8b a5 58 10 00 00 	mov    0x1058(%r13),%rsp
  404e49:	9b db e3             	finit  
  404e4c:	fc                   	cld    
  404e4d:	c5 fc 77             	vzeroall 

0000000000404e50 <EXITALL2>:
  404e50:	b8 01 00 00 00       	mov    $0x1,%eax
  404e55:	41 5f                	pop    %r15
  404e57:	41 5e                	pop    %r14
  404e59:	41 5d                	pop    %r13
  404e5b:	41 5c                	pop    %r12
  404e5d:	5d                   	pop    %rbp
  404e5e:	5b                   	pop    %rbx
  404e5f:	c3                   	ret    

Disassembly of section .sec_test_ibranch:

0000000001000000 <start_test_ibranch>:
 1000000:	4c 8d 15 7a 02 00 00 	lea    0x27a(%rip),%r10        # 1000281 <target_test_0>
 1000007:	4c 8d 0d 74 04 00 00 	lea    0x474(%rip),%r9        # 1000482 <target_test_1>
 100000e:	48 83 3d aa 8e 00 00 	cmpq   $0x1,0x8eaa(%rip)        # 1008ec0 <UserData>
 1000015:	01 
 1000016:	4d 0f 44 d1          	cmove  %r9,%r10
 100001a:	4c 89 15 df 8e 00 00 	mov    %r10,0x8edf(%rip)        # 1008f00 <UserData+0x40>
 1000021:	0f ae 3d d8 8e 00 00 	clflush 0x8ed8(%rip)        # 1008f00 <UserData+0x40>
 1000028:	0f ae f0             	mfence 
 100002b:	31 c0                	xor    %eax,%eax
 100002d:	0f a2                	cpuid  
 100002f:	90                   	nop
 1000030:	90                   	nop
 1000031:	90                   	nop
 1000032:	90                   	nop
 1000033:	90                   	nop
 1000034:	90                   	nop
 1000035:	90                   	nop
 1000036:	90                   	nop
 1000037:	90                   	nop
 1000038:	90                   	nop
 1000039:	90                   	nop
 100003a:	90                   	nop
 100003b:	90                   	nop
 100003c:	90                   	nop
 100003d:	90                   	nop
 100003e:	90                   	nop
 100003f:	90                   	nop
 1000040:	90                   	nop
 1000041:	90                   	nop
 1000042:	90                   	nop
 1000043:	90                   	nop
 1000044:	90                   	nop
 1000045:	90                   	nop
 1000046:	90                   	nop
 1000047:	90                   	nop
 1000048:	90                   	nop
 1000049:	90                   	nop
 100004a:	90                   	nop
 100004b:	90                   	nop
 100004c:	90                   	nop
 100004d:	90                   	nop
 100004e:	90                   	nop
 100004f:	90                   	nop
 1000050:	90                   	nop
 1000051:	90                   	nop
 1000052:	90                   	nop
 1000053:	90                   	nop
 1000054:	90                   	nop
 1000055:	90                   	nop
 1000056:	90                   	nop
 1000057:	90                   	nop
 1000058:	90                   	nop
 1000059:	90                   	nop
 100005a:	90                   	nop
 100005b:	90                   	nop
 100005c:	90                   	nop
 100005d:	90                   	nop
 100005e:	90                   	nop
 100005f:	90                   	nop
 1000060:	90                   	nop
 1000061:	90                   	nop
 1000062:	90                   	nop
 1000063:	90                   	nop
 1000064:	90                   	nop
 1000065:	90                   	nop
 1000066:	90                   	nop
 1000067:	90                   	nop
 1000068:	90                   	nop
 1000069:	90                   	nop
 100006a:	90                   	nop
 100006b:	90                   	nop
 100006c:	90                   	nop
 100006d:	90                   	nop
 100006e:	90                   	nop
 100006f:	90                   	nop
 1000070:	90                   	nop
 1000071:	90                   	nop
 1000072:	90                   	nop
 1000073:	90                   	nop
 1000074:	90                   	nop
 1000075:	90                   	nop
 1000076:	90                   	nop
 1000077:	90                   	nop
 1000078:	90                   	nop
 1000079:	90                   	nop

000000000100007a <test_ibranch_pc>:
 100007a:	ff 25 80 8e 00 00    	jmp    *0x8e80(%rip)        # 1008f00 <UserData+0x40>
 1000080:	90                   	nop
 1000081:	90                   	nop
 1000082:	90                   	nop
 1000083:	90                   	nop
 1000084:	90                   	nop
 1000085:	90                   	nop
 1000086:	90                   	nop
 1000087:	90                   	nop
 1000088:	90                   	nop
 1000089:	90                   	nop
 100008a:	90                   	nop
 100008b:	90                   	nop
 100008c:	90                   	nop
 100008d:	90                   	nop
 100008e:	90                   	nop
 100008f:	90                   	nop
 1000090:	90                   	nop
 1000091:	90                   	nop
 1000092:	90                   	nop
 1000093:	90                   	nop
 1000094:	90                   	nop
 1000095:	90                   	nop
 1000096:	90                   	nop
 1000097:	90                   	nop
 1000098:	90                   	nop
 1000099:	90                   	nop
 100009a:	90                   	nop
 100009b:	90                   	nop
 100009c:	90                   	nop
 100009d:	90                   	nop
 100009e:	90                   	nop
 100009f:	90                   	nop
 10000a0:	90                   	nop
 10000a1:	90                   	nop
 10000a2:	90                   	nop
 10000a3:	90                   	nop
 10000a4:	90                   	nop
 10000a5:	90                   	nop
 10000a6:	90                   	nop
 10000a7:	90                   	nop
 10000a8:	90                   	nop
 10000a9:	90                   	nop
 10000aa:	90                   	nop
 10000ab:	90                   	nop
 10000ac:	90                   	nop
 10000ad:	90                   	nop
 10000ae:	90                   	nop
 10000af:	90                   	nop
 10000b0:	90                   	nop
 10000b1:	90                   	nop
 10000b2:	90                   	nop
 10000b3:	90                   	nop
 10000b4:	90                   	nop
 10000b5:	90                   	nop
 10000b6:	90                   	nop
 10000b7:	90                   	nop
 10000b8:	90                   	nop
 10000b9:	90                   	nop
 10000ba:	90                   	nop
 10000bb:	90                   	nop
 10000bc:	90                   	nop
 10000bd:	90                   	nop
 10000be:	90                   	nop
 10000bf:	90                   	nop
 10000c0:	90                   	nop
 10000c1:	90                   	nop
 10000c2:	90                   	nop
 10000c3:	90                   	nop
 10000c4:	90                   	nop
 10000c5:	90                   	nop
 10000c6:	90                   	nop
 10000c7:	90                   	nop
 10000c8:	90                   	nop
 10000c9:	90                   	nop
 10000ca:	90                   	nop
 10000cb:	90                   	nop
 10000cc:	90                   	nop
 10000cd:	90                   	nop
 10000ce:	90                   	nop
 10000cf:	90                   	nop
 10000d0:	90                   	nop
 10000d1:	90                   	nop
 10000d2:	90                   	nop
 10000d3:	90                   	nop
 10000d4:	90                   	nop
 10000d5:	90                   	nop
 10000d6:	90                   	nop
 10000d7:	90                   	nop
 10000d8:	90                   	nop
 10000d9:	90                   	nop
 10000da:	90                   	nop
 10000db:	90                   	nop
 10000dc:	90                   	nop
 10000dd:	90                   	nop
 10000de:	90                   	nop
 10000df:	90                   	nop
 10000e0:	90                   	nop
 10000e1:	90                   	nop
 10000e2:	90                   	nop
 10000e3:	90                   	nop
 10000e4:	90                   	nop
 10000e5:	90                   	nop
 10000e6:	90                   	nop
 10000e7:	90                   	nop
 10000e8:	90                   	nop
 10000e9:	90                   	nop
 10000ea:	90                   	nop
 10000eb:	90                   	nop
 10000ec:	90                   	nop
 10000ed:	90                   	nop
 10000ee:	90                   	nop
 10000ef:	90                   	nop
 10000f0:	90                   	nop
 10000f1:	90                   	nop
 10000f2:	90                   	nop
 10000f3:	90                   	nop
 10000f4:	90                   	nop
 10000f5:	90                   	nop
 10000f6:	90                   	nop
 10000f7:	90                   	nop
 10000f8:	90                   	nop
 10000f9:	90                   	nop
 10000fa:	90                   	nop
 10000fb:	90                   	nop
 10000fc:	90                   	nop
 10000fd:	90                   	nop
 10000fe:	90                   	nop
 10000ff:	90                   	nop
 1000100:	90                   	nop
 1000101:	90                   	nop
 1000102:	90                   	nop
 1000103:	90                   	nop
 1000104:	90                   	nop
 1000105:	90                   	nop
 1000106:	90                   	nop
 1000107:	90                   	nop
 1000108:	90                   	nop
 1000109:	90                   	nop
 100010a:	90                   	nop
 100010b:	90                   	nop
 100010c:	90                   	nop
 100010d:	90                   	nop
 100010e:	90                   	nop
 100010f:	90                   	nop
 1000110:	90                   	nop
 1000111:	90                   	nop
 1000112:	90                   	nop
 1000113:	90                   	nop
 1000114:	90                   	nop
 1000115:	90                   	nop
 1000116:	90                   	nop
 1000117:	90                   	nop
 1000118:	90                   	nop
 1000119:	90                   	nop
 100011a:	90                   	nop
 100011b:	90                   	nop
 100011c:	90                   	nop
 100011d:	90                   	nop
 100011e:	90                   	nop
 100011f:	90                   	nop
 1000120:	90                   	nop
 1000121:	90                   	nop
 1000122:	90                   	nop
 1000123:	90                   	nop
 1000124:	90                   	nop
 1000125:	90                   	nop
 1000126:	90                   	nop
 1000127:	90                   	nop
 1000128:	90                   	nop
 1000129:	90                   	nop
 100012a:	90                   	nop
 100012b:	90                   	nop
 100012c:	90                   	nop
 100012d:	90                   	nop
 100012e:	90                   	nop
 100012f:	90                   	nop
 1000130:	90                   	nop
 1000131:	90                   	nop
 1000132:	90                   	nop
 1000133:	90                   	nop
 1000134:	90                   	nop
 1000135:	90                   	nop
 1000136:	90                   	nop
 1000137:	90                   	nop
 1000138:	90                   	nop
 1000139:	90                   	nop
 100013a:	90                   	nop
 100013b:	90                   	nop
 100013c:	90                   	nop
 100013d:	90                   	nop
 100013e:	90                   	nop
 100013f:	90                   	nop
 1000140:	90                   	nop
 1000141:	90                   	nop
 1000142:	90                   	nop
 1000143:	90                   	nop
 1000144:	90                   	nop
 1000145:	90                   	nop
 1000146:	90                   	nop
 1000147:	90                   	nop
 1000148:	90                   	nop
 1000149:	90                   	nop
 100014a:	90                   	nop
 100014b:	90                   	nop
 100014c:	90                   	nop
 100014d:	90                   	nop
 100014e:	90                   	nop
 100014f:	90                   	nop
 1000150:	90                   	nop
 1000151:	90                   	nop
 1000152:	90                   	nop
 1000153:	90                   	nop
 1000154:	90                   	nop
 1000155:	90                   	nop
 1000156:	90                   	nop
 1000157:	90                   	nop
 1000158:	90                   	nop
 1000159:	90                   	nop
 100015a:	90                   	nop
 100015b:	90                   	nop
 100015c:	90                   	nop
 100015d:	90                   	nop
 100015e:	90                   	nop
 100015f:	90                   	nop
 1000160:	90                   	nop
 1000161:	90                   	nop
 1000162:	90                   	nop
 1000163:	90                   	nop
 1000164:	90                   	nop
 1000165:	90                   	nop
 1000166:	90                   	nop
 1000167:	90                   	nop
 1000168:	90                   	nop
 1000169:	90                   	nop
 100016a:	90                   	nop
 100016b:	90                   	nop
 100016c:	90                   	nop
 100016d:	90                   	nop
 100016e:	90                   	nop
 100016f:	90                   	nop
 1000170:	90                   	nop
 1000171:	90                   	nop
 1000172:	90                   	nop
 1000173:	90                   	nop
 1000174:	90                   	nop
 1000175:	90                   	nop
 1000176:	90                   	nop
 1000177:	90                   	nop
 1000178:	90                   	nop
 1000179:	90                   	nop
 100017a:	90                   	nop
 100017b:	90                   	nop
 100017c:	90                   	nop
 100017d:	90                   	nop
 100017e:	90                   	nop
 100017f:	90                   	nop
 1000180:	90                   	nop
 1000181:	90                   	nop
 1000182:	90                   	nop
 1000183:	90                   	nop
 1000184:	90                   	nop
 1000185:	90                   	nop
 1000186:	90                   	nop
 1000187:	90                   	nop
 1000188:	90                   	nop
 1000189:	90                   	nop
 100018a:	90                   	nop
 100018b:	90                   	nop
 100018c:	90                   	nop
 100018d:	90                   	nop
 100018e:	90                   	nop
 100018f:	90                   	nop
 1000190:	90                   	nop
 1000191:	90                   	nop
 1000192:	90                   	nop
 1000193:	90                   	nop
 1000194:	90                   	nop
 1000195:	90                   	nop
 1000196:	90                   	nop
 1000197:	90                   	nop
 1000198:	90                   	nop
 1000199:	90                   	nop
 100019a:	90                   	nop
 100019b:	90                   	nop
 100019c:	90                   	nop
 100019d:	90                   	nop
 100019e:	90                   	nop
 100019f:	90                   	nop
 10001a0:	90                   	nop
 10001a1:	90                   	nop
 10001a2:	90                   	nop
 10001a3:	90                   	nop
 10001a4:	90                   	nop
 10001a5:	90                   	nop
 10001a6:	90                   	nop
 10001a7:	90                   	nop
 10001a8:	90                   	nop
 10001a9:	90                   	nop
 10001aa:	90                   	nop
 10001ab:	90                   	nop
 10001ac:	90                   	nop
 10001ad:	90                   	nop
 10001ae:	90                   	nop
 10001af:	90                   	nop
 10001b0:	90                   	nop
 10001b1:	90                   	nop
 10001b2:	90                   	nop
 10001b3:	90                   	nop
 10001b4:	90                   	nop
 10001b5:	90                   	nop
 10001b6:	90                   	nop
 10001b7:	90                   	nop
 10001b8:	90                   	nop
 10001b9:	90                   	nop
 10001ba:	90                   	nop
 10001bb:	90                   	nop
 10001bc:	90                   	nop
 10001bd:	90                   	nop
 10001be:	90                   	nop
 10001bf:	90                   	nop
 10001c0:	90                   	nop
 10001c1:	90                   	nop
 10001c2:	90                   	nop
 10001c3:	90                   	nop
 10001c4:	90                   	nop
 10001c5:	90                   	nop
 10001c6:	90                   	nop
 10001c7:	90                   	nop
 10001c8:	90                   	nop
 10001c9:	90                   	nop
 10001ca:	90                   	nop
 10001cb:	90                   	nop
 10001cc:	90                   	nop
 10001cd:	90                   	nop
 10001ce:	90                   	nop
 10001cf:	90                   	nop
 10001d0:	90                   	nop
 10001d1:	90                   	nop
 10001d2:	90                   	nop
 10001d3:	90                   	nop
 10001d4:	90                   	nop
 10001d5:	90                   	nop
 10001d6:	90                   	nop
 10001d7:	90                   	nop
 10001d8:	90                   	nop
 10001d9:	90                   	nop
 10001da:	90                   	nop
 10001db:	90                   	nop
 10001dc:	90                   	nop
 10001dd:	90                   	nop
 10001de:	90                   	nop
 10001df:	90                   	nop
 10001e0:	90                   	nop
 10001e1:	90                   	nop
 10001e2:	90                   	nop
 10001e3:	90                   	nop
 10001e4:	90                   	nop
 10001e5:	90                   	nop
 10001e6:	90                   	nop
 10001e7:	90                   	nop
 10001e8:	90                   	nop
 10001e9:	90                   	nop
 10001ea:	90                   	nop
 10001eb:	90                   	nop
 10001ec:	90                   	nop
 10001ed:	90                   	nop
 10001ee:	90                   	nop
 10001ef:	90                   	nop
 10001f0:	90                   	nop
 10001f1:	90                   	nop
 10001f2:	90                   	nop
 10001f3:	90                   	nop
 10001f4:	90                   	nop
 10001f5:	90                   	nop
 10001f6:	90                   	nop
 10001f7:	90                   	nop
 10001f8:	90                   	nop
 10001f9:	90                   	nop
 10001fa:	90                   	nop
 10001fb:	90                   	nop
 10001fc:	90                   	nop
 10001fd:	90                   	nop
 10001fe:	90                   	nop
 10001ff:	90                   	nop
 1000200:	90                   	nop
 1000201:	90                   	nop
 1000202:	90                   	nop
 1000203:	90                   	nop
 1000204:	90                   	nop
 1000205:	90                   	nop
 1000206:	90                   	nop
 1000207:	90                   	nop
 1000208:	90                   	nop
 1000209:	90                   	nop
 100020a:	90                   	nop
 100020b:	90                   	nop
 100020c:	90                   	nop
 100020d:	90                   	nop
 100020e:	90                   	nop
 100020f:	90                   	nop
 1000210:	90                   	nop
 1000211:	90                   	nop
 1000212:	90                   	nop
 1000213:	90                   	nop
 1000214:	90                   	nop
 1000215:	90                   	nop
 1000216:	90                   	nop
 1000217:	90                   	nop
 1000218:	90                   	nop
 1000219:	90                   	nop
 100021a:	90                   	nop
 100021b:	90                   	nop
 100021c:	90                   	nop
 100021d:	90                   	nop
 100021e:	90                   	nop
 100021f:	90                   	nop
 1000220:	90                   	nop
 1000221:	90                   	nop
 1000222:	90                   	nop
 1000223:	90                   	nop
 1000224:	90                   	nop
 1000225:	90                   	nop
 1000226:	90                   	nop
 1000227:	90                   	nop
 1000228:	90                   	nop
 1000229:	90                   	nop
 100022a:	90                   	nop
 100022b:	90                   	nop
 100022c:	90                   	nop
 100022d:	90                   	nop
 100022e:	90                   	nop
 100022f:	90                   	nop
 1000230:	90                   	nop
 1000231:	90                   	nop
 1000232:	90                   	nop
 1000233:	90                   	nop
 1000234:	90                   	nop
 1000235:	90                   	nop
 1000236:	90                   	nop
 1000237:	90                   	nop
 1000238:	90                   	nop
 1000239:	90                   	nop
 100023a:	90                   	nop
 100023b:	90                   	nop
 100023c:	90                   	nop
 100023d:	90                   	nop
 100023e:	90                   	nop
 100023f:	90                   	nop
 1000240:	90                   	nop
 1000241:	90                   	nop
 1000242:	90                   	nop
 1000243:	90                   	nop
 1000244:	90                   	nop
 1000245:	90                   	nop
 1000246:	90                   	nop
 1000247:	90                   	nop
 1000248:	90                   	nop
 1000249:	90                   	nop
 100024a:	90                   	nop
 100024b:	90                   	nop
 100024c:	90                   	nop
 100024d:	90                   	nop
 100024e:	90                   	nop
 100024f:	90                   	nop
 1000250:	90                   	nop
 1000251:	90                   	nop
 1000252:	90                   	nop
 1000253:	90                   	nop
 1000254:	90                   	nop
 1000255:	90                   	nop
 1000256:	90                   	nop
 1000257:	90                   	nop
 1000258:	90                   	nop
 1000259:	90                   	nop
 100025a:	90                   	nop
 100025b:	90                   	nop
 100025c:	90                   	nop
 100025d:	90                   	nop
 100025e:	90                   	nop
 100025f:	90                   	nop
 1000260:	90                   	nop
 1000261:	90                   	nop
 1000262:	90                   	nop
 1000263:	90                   	nop
 1000264:	90                   	nop
 1000265:	90                   	nop
 1000266:	90                   	nop
 1000267:	90                   	nop
 1000268:	90                   	nop
 1000269:	90                   	nop
 100026a:	90                   	nop
 100026b:	90                   	nop
 100026c:	90                   	nop
 100026d:	90                   	nop
 100026e:	90                   	nop
 100026f:	90                   	nop
 1000270:	90                   	nop
 1000271:	90                   	nop
 1000272:	90                   	nop
 1000273:	90                   	nop
 1000274:	90                   	nop
 1000275:	90                   	nop
 1000276:	90                   	nop
 1000277:	90                   	nop
 1000278:	90                   	nop
 1000279:	90                   	nop
 100027a:	90                   	nop
 100027b:	90                   	nop
 100027c:	90                   	nop
 100027d:	90                   	nop
 100027e:	90                   	nop
 100027f:	90                   	nop
 1000280:	c3                   	ret    

0000000001000281 <target_test_0>:
 1000281:	90                   	nop
 1000282:	90                   	nop
 1000283:	90                   	nop
 1000284:	90                   	nop
 1000285:	90                   	nop
 1000286:	90                   	nop
 1000287:	90                   	nop
 1000288:	90                   	nop
 1000289:	90                   	nop
 100028a:	90                   	nop
 100028b:	90                   	nop
 100028c:	90                   	nop
 100028d:	90                   	nop
 100028e:	90                   	nop
 100028f:	90                   	nop
 1000290:	90                   	nop
 1000291:	90                   	nop
 1000292:	90                   	nop
 1000293:	90                   	nop
 1000294:	90                   	nop
 1000295:	90                   	nop
 1000296:	90                   	nop
 1000297:	90                   	nop
 1000298:	90                   	nop
 1000299:	90                   	nop
 100029a:	90                   	nop
 100029b:	90                   	nop
 100029c:	90                   	nop
 100029d:	90                   	nop
 100029e:	90                   	nop
 100029f:	90                   	nop
 10002a0:	90                   	nop
 10002a1:	90                   	nop
 10002a2:	90                   	nop
 10002a3:	90                   	nop
 10002a4:	90                   	nop
 10002a5:	90                   	nop
 10002a6:	90                   	nop
 10002a7:	90                   	nop
 10002a8:	90                   	nop
 10002a9:	90                   	nop
 10002aa:	90                   	nop
 10002ab:	90                   	nop
 10002ac:	90                   	nop
 10002ad:	90                   	nop
 10002ae:	90                   	nop
 10002af:	90                   	nop
 10002b0:	90                   	nop
 10002b1:	90                   	nop
 10002b2:	90                   	nop
 10002b3:	90                   	nop
 10002b4:	90                   	nop
 10002b5:	90                   	nop
 10002b6:	90                   	nop
 10002b7:	90                   	nop
 10002b8:	90                   	nop
 10002b9:	90                   	nop
 10002ba:	90                   	nop
 10002bb:	90                   	nop
 10002bc:	90                   	nop
 10002bd:	90                   	nop
 10002be:	90                   	nop
 10002bf:	90                   	nop
 10002c0:	90                   	nop
 10002c1:	90                   	nop
 10002c2:	90                   	nop
 10002c3:	90                   	nop
 10002c4:	90                   	nop
 10002c5:	90                   	nop
 10002c6:	90                   	nop
 10002c7:	90                   	nop
 10002c8:	90                   	nop
 10002c9:	90                   	nop
 10002ca:	90                   	nop
 10002cb:	90                   	nop
 10002cc:	90                   	nop
 10002cd:	90                   	nop
 10002ce:	90                   	nop
 10002cf:	90                   	nop
 10002d0:	90                   	nop
 10002d1:	90                   	nop
 10002d2:	90                   	nop
 10002d3:	90                   	nop
 10002d4:	90                   	nop
 10002d5:	90                   	nop
 10002d6:	90                   	nop
 10002d7:	90                   	nop
 10002d8:	90                   	nop
 10002d9:	90                   	nop
 10002da:	90                   	nop
 10002db:	90                   	nop
 10002dc:	90                   	nop
 10002dd:	90                   	nop
 10002de:	90                   	nop
 10002df:	90                   	nop
 10002e0:	90                   	nop
 10002e1:	90                   	nop
 10002e2:	90                   	nop
 10002e3:	90                   	nop
 10002e4:	90                   	nop
 10002e5:	90                   	nop
 10002e6:	90                   	nop
 10002e7:	90                   	nop
 10002e8:	90                   	nop
 10002e9:	90                   	nop
 10002ea:	90                   	nop
 10002eb:	90                   	nop
 10002ec:	90                   	nop
 10002ed:	90                   	nop
 10002ee:	90                   	nop
 10002ef:	90                   	nop
 10002f0:	90                   	nop
 10002f1:	90                   	nop
 10002f2:	90                   	nop
 10002f3:	90                   	nop
 10002f4:	90                   	nop
 10002f5:	90                   	nop
 10002f6:	90                   	nop
 10002f7:	90                   	nop
 10002f8:	90                   	nop
 10002f9:	90                   	nop
 10002fa:	90                   	nop
 10002fb:	90                   	nop
 10002fc:	90                   	nop
 10002fd:	90                   	nop
 10002fe:	90                   	nop
 10002ff:	90                   	nop
 1000300:	90                   	nop
 1000301:	90                   	nop
 1000302:	90                   	nop
 1000303:	90                   	nop
 1000304:	90                   	nop
 1000305:	90                   	nop
 1000306:	90                   	nop
 1000307:	90                   	nop
 1000308:	90                   	nop
 1000309:	90                   	nop
 100030a:	90                   	nop
 100030b:	90                   	nop
 100030c:	90                   	nop
 100030d:	90                   	nop
 100030e:	90                   	nop
 100030f:	90                   	nop
 1000310:	90                   	nop
 1000311:	90                   	nop
 1000312:	90                   	nop
 1000313:	90                   	nop
 1000314:	90                   	nop
 1000315:	90                   	nop
 1000316:	90                   	nop
 1000317:	90                   	nop
 1000318:	90                   	nop
 1000319:	90                   	nop
 100031a:	90                   	nop
 100031b:	90                   	nop
 100031c:	90                   	nop
 100031d:	90                   	nop
 100031e:	90                   	nop
 100031f:	90                   	nop
 1000320:	90                   	nop
 1000321:	90                   	nop
 1000322:	90                   	nop
 1000323:	90                   	nop
 1000324:	90                   	nop
 1000325:	90                   	nop
 1000326:	90                   	nop
 1000327:	90                   	nop
 1000328:	90                   	nop
 1000329:	90                   	nop
 100032a:	90                   	nop
 100032b:	90                   	nop
 100032c:	90                   	nop
 100032d:	90                   	nop
 100032e:	90                   	nop
 100032f:	90                   	nop
 1000330:	90                   	nop
 1000331:	90                   	nop
 1000332:	90                   	nop
 1000333:	90                   	nop
 1000334:	90                   	nop
 1000335:	90                   	nop
 1000336:	90                   	nop
 1000337:	90                   	nop
 1000338:	90                   	nop
 1000339:	90                   	nop
 100033a:	90                   	nop
 100033b:	90                   	nop
 100033c:	90                   	nop
 100033d:	90                   	nop
 100033e:	90                   	nop
 100033f:	90                   	nop
 1000340:	90                   	nop
 1000341:	90                   	nop
 1000342:	90                   	nop
 1000343:	90                   	nop
 1000344:	90                   	nop
 1000345:	90                   	nop
 1000346:	90                   	nop
 1000347:	90                   	nop
 1000348:	90                   	nop
 1000349:	90                   	nop
 100034a:	90                   	nop
 100034b:	90                   	nop
 100034c:	90                   	nop
 100034d:	90                   	nop
 100034e:	90                   	nop
 100034f:	90                   	nop
 1000350:	90                   	nop
 1000351:	90                   	nop
 1000352:	90                   	nop
 1000353:	90                   	nop
 1000354:	90                   	nop
 1000355:	90                   	nop
 1000356:	90                   	nop
 1000357:	90                   	nop
 1000358:	90                   	nop
 1000359:	90                   	nop
 100035a:	90                   	nop
 100035b:	90                   	nop
 100035c:	90                   	nop
 100035d:	90                   	nop
 100035e:	90                   	nop
 100035f:	90                   	nop
 1000360:	90                   	nop
 1000361:	90                   	nop
 1000362:	90                   	nop
 1000363:	90                   	nop
 1000364:	90                   	nop
 1000365:	90                   	nop
 1000366:	90                   	nop
 1000367:	90                   	nop
 1000368:	90                   	nop
 1000369:	90                   	nop
 100036a:	90                   	nop
 100036b:	90                   	nop
 100036c:	90                   	nop
 100036d:	90                   	nop
 100036e:	90                   	nop
 100036f:	90                   	nop
 1000370:	90                   	nop
 1000371:	90                   	nop
 1000372:	90                   	nop
 1000373:	90                   	nop
 1000374:	90                   	nop
 1000375:	90                   	nop
 1000376:	90                   	nop
 1000377:	90                   	nop
 1000378:	90                   	nop
 1000379:	90                   	nop
 100037a:	90                   	nop
 100037b:	90                   	nop
 100037c:	90                   	nop
 100037d:	90                   	nop
 100037e:	90                   	nop
 100037f:	90                   	nop
 1000380:	90                   	nop
 1000381:	90                   	nop
 1000382:	90                   	nop
 1000383:	90                   	nop
 1000384:	90                   	nop
 1000385:	90                   	nop
 1000386:	90                   	nop
 1000387:	90                   	nop
 1000388:	90                   	nop
 1000389:	90                   	nop
 100038a:	90                   	nop
 100038b:	90                   	nop
 100038c:	90                   	nop
 100038d:	90                   	nop
 100038e:	90                   	nop
 100038f:	90                   	nop
 1000390:	90                   	nop
 1000391:	90                   	nop
 1000392:	90                   	nop
 1000393:	90                   	nop
 1000394:	90                   	nop
 1000395:	90                   	nop
 1000396:	90                   	nop
 1000397:	90                   	nop
 1000398:	90                   	nop
 1000399:	90                   	nop
 100039a:	90                   	nop
 100039b:	90                   	nop
 100039c:	90                   	nop
 100039d:	90                   	nop
 100039e:	90                   	nop
 100039f:	90                   	nop
 10003a0:	90                   	nop
 10003a1:	90                   	nop
 10003a2:	90                   	nop
 10003a3:	90                   	nop
 10003a4:	90                   	nop
 10003a5:	90                   	nop
 10003a6:	90                   	nop
 10003a7:	90                   	nop
 10003a8:	90                   	nop
 10003a9:	90                   	nop
 10003aa:	90                   	nop
 10003ab:	90                   	nop
 10003ac:	90                   	nop
 10003ad:	90                   	nop
 10003ae:	90                   	nop
 10003af:	90                   	nop
 10003b0:	90                   	nop
 10003b1:	90                   	nop
 10003b2:	90                   	nop
 10003b3:	90                   	nop
 10003b4:	90                   	nop
 10003b5:	90                   	nop
 10003b6:	90                   	nop
 10003b7:	90                   	nop
 10003b8:	90                   	nop
 10003b9:	90                   	nop
 10003ba:	90                   	nop
 10003bb:	90                   	nop
 10003bc:	90                   	nop
 10003bd:	90                   	nop
 10003be:	90                   	nop
 10003bf:	90                   	nop
 10003c0:	90                   	nop
 10003c1:	90                   	nop
 10003c2:	90                   	nop
 10003c3:	90                   	nop
 10003c4:	90                   	nop
 10003c5:	90                   	nop
 10003c6:	90                   	nop
 10003c7:	90                   	nop
 10003c8:	90                   	nop
 10003c9:	90                   	nop
 10003ca:	90                   	nop
 10003cb:	90                   	nop
 10003cc:	90                   	nop
 10003cd:	90                   	nop
 10003ce:	90                   	nop
 10003cf:	90                   	nop
 10003d0:	90                   	nop
 10003d1:	90                   	nop
 10003d2:	90                   	nop
 10003d3:	90                   	nop
 10003d4:	90                   	nop
 10003d5:	90                   	nop
 10003d6:	90                   	nop
 10003d7:	90                   	nop
 10003d8:	90                   	nop
 10003d9:	90                   	nop
 10003da:	90                   	nop
 10003db:	90                   	nop
 10003dc:	90                   	nop
 10003dd:	90                   	nop
 10003de:	90                   	nop
 10003df:	90                   	nop
 10003e0:	90                   	nop
 10003e1:	90                   	nop
 10003e2:	90                   	nop
 10003e3:	90                   	nop
 10003e4:	90                   	nop
 10003e5:	90                   	nop
 10003e6:	90                   	nop
 10003e7:	90                   	nop
 10003e8:	90                   	nop
 10003e9:	90                   	nop
 10003ea:	90                   	nop
 10003eb:	90                   	nop
 10003ec:	90                   	nop
 10003ed:	90                   	nop
 10003ee:	90                   	nop
 10003ef:	90                   	nop
 10003f0:	90                   	nop
 10003f1:	90                   	nop
 10003f2:	90                   	nop
 10003f3:	90                   	nop
 10003f4:	90                   	nop
 10003f5:	90                   	nop
 10003f6:	90                   	nop
 10003f7:	90                   	nop
 10003f8:	90                   	nop
 10003f9:	90                   	nop
 10003fa:	90                   	nop
 10003fb:	90                   	nop
 10003fc:	90                   	nop
 10003fd:	90                   	nop
 10003fe:	90                   	nop
 10003ff:	90                   	nop
 1000400:	90                   	nop
 1000401:	90                   	nop
 1000402:	90                   	nop
 1000403:	90                   	nop
 1000404:	90                   	nop
 1000405:	90                   	nop
 1000406:	90                   	nop
 1000407:	90                   	nop
 1000408:	90                   	nop
 1000409:	90                   	nop
 100040a:	90                   	nop
 100040b:	90                   	nop
 100040c:	90                   	nop
 100040d:	90                   	nop
 100040e:	90                   	nop
 100040f:	90                   	nop
 1000410:	90                   	nop
 1000411:	90                   	nop
 1000412:	90                   	nop
 1000413:	90                   	nop
 1000414:	90                   	nop
 1000415:	90                   	nop
 1000416:	90                   	nop
 1000417:	90                   	nop
 1000418:	90                   	nop
 1000419:	90                   	nop
 100041a:	90                   	nop
 100041b:	90                   	nop
 100041c:	90                   	nop
 100041d:	90                   	nop
 100041e:	90                   	nop
 100041f:	90                   	nop
 1000420:	90                   	nop
 1000421:	90                   	nop
 1000422:	90                   	nop
 1000423:	90                   	nop
 1000424:	90                   	nop
 1000425:	90                   	nop
 1000426:	90                   	nop
 1000427:	90                   	nop
 1000428:	90                   	nop
 1000429:	90                   	nop
 100042a:	90                   	nop
 100042b:	90                   	nop
 100042c:	90                   	nop
 100042d:	90                   	nop
 100042e:	90                   	nop
 100042f:	90                   	nop
 1000430:	90                   	nop
 1000431:	90                   	nop
 1000432:	90                   	nop
 1000433:	90                   	nop
 1000434:	90                   	nop
 1000435:	90                   	nop
 1000436:	90                   	nop
 1000437:	90                   	nop
 1000438:	90                   	nop
 1000439:	90                   	nop
 100043a:	90                   	nop
 100043b:	90                   	nop
 100043c:	90                   	nop
 100043d:	90                   	nop
 100043e:	90                   	nop
 100043f:	90                   	nop
 1000440:	90                   	nop
 1000441:	90                   	nop
 1000442:	90                   	nop
 1000443:	90                   	nop
 1000444:	90                   	nop
 1000445:	90                   	nop
 1000446:	90                   	nop
 1000447:	90                   	nop
 1000448:	90                   	nop
 1000449:	90                   	nop
 100044a:	90                   	nop
 100044b:	90                   	nop
 100044c:	90                   	nop
 100044d:	90                   	nop
 100044e:	90                   	nop
 100044f:	90                   	nop
 1000450:	90                   	nop
 1000451:	90                   	nop
 1000452:	90                   	nop
 1000453:	90                   	nop
 1000454:	90                   	nop
 1000455:	90                   	nop
 1000456:	90                   	nop
 1000457:	90                   	nop
 1000458:	90                   	nop
 1000459:	90                   	nop
 100045a:	90                   	nop
 100045b:	90                   	nop
 100045c:	90                   	nop
 100045d:	90                   	nop
 100045e:	90                   	nop
 100045f:	90                   	nop
 1000460:	90                   	nop
 1000461:	90                   	nop
 1000462:	90                   	nop
 1000463:	90                   	nop
 1000464:	90                   	nop
 1000465:	90                   	nop
 1000466:	90                   	nop
 1000467:	90                   	nop
 1000468:	90                   	nop
 1000469:	90                   	nop
 100046a:	90                   	nop
 100046b:	90                   	nop
 100046c:	90                   	nop
 100046d:	90                   	nop
 100046e:	90                   	nop
 100046f:	90                   	nop
 1000470:	90                   	nop
 1000471:	90                   	nop
 1000472:	90                   	nop
 1000473:	90                   	nop
 1000474:	90                   	nop
 1000475:	90                   	nop
 1000476:	90                   	nop
 1000477:	90                   	nop
 1000478:	90                   	nop
 1000479:	90                   	nop
 100047a:	90                   	nop
 100047b:	90                   	nop
 100047c:	90                   	nop
 100047d:	90                   	nop
 100047e:	90                   	nop
 100047f:	90                   	nop
 1000480:	90                   	nop
 1000481:	c3                   	ret    

0000000001000482 <target_test_1>:
 1000482:	90                   	nop
 1000483:	90                   	nop
 1000484:	90                   	nop
 1000485:	90                   	nop
 1000486:	90                   	nop
 1000487:	90                   	nop
 1000488:	90                   	nop
 1000489:	90                   	nop
 100048a:	90                   	nop
 100048b:	90                   	nop
 100048c:	90                   	nop
 100048d:	90                   	nop
 100048e:	90                   	nop
 100048f:	90                   	nop
 1000490:	90                   	nop
 1000491:	90                   	nop
 1000492:	90                   	nop
 1000493:	90                   	nop
 1000494:	90                   	nop
 1000495:	90                   	nop
 1000496:	90                   	nop
 1000497:	90                   	nop
 1000498:	90                   	nop
 1000499:	90                   	nop
 100049a:	90                   	nop
 100049b:	90                   	nop
 100049c:	90                   	nop
 100049d:	90                   	nop
 100049e:	90                   	nop
 100049f:	90                   	nop
 10004a0:	90                   	nop
 10004a1:	90                   	nop
 10004a2:	90                   	nop
 10004a3:	90                   	nop
 10004a4:	90                   	nop
 10004a5:	90                   	nop
 10004a6:	90                   	nop
 10004a7:	90                   	nop
 10004a8:	90                   	nop
 10004a9:	90                   	nop
 10004aa:	90                   	nop
 10004ab:	90                   	nop
 10004ac:	90                   	nop
 10004ad:	90                   	nop
 10004ae:	90                   	nop
 10004af:	90                   	nop
 10004b0:	90                   	nop
 10004b1:	90                   	nop
 10004b2:	90                   	nop
 10004b3:	90                   	nop
 10004b4:	90                   	nop
 10004b5:	90                   	nop
 10004b6:	90                   	nop
 10004b7:	90                   	nop
 10004b8:	90                   	nop
 10004b9:	90                   	nop
 10004ba:	90                   	nop
 10004bb:	90                   	nop
 10004bc:	90                   	nop
 10004bd:	90                   	nop
 10004be:	90                   	nop
 10004bf:	90                   	nop
 10004c0:	90                   	nop
 10004c1:	90                   	nop
 10004c2:	90                   	nop
 10004c3:	90                   	nop
 10004c4:	90                   	nop
 10004c5:	90                   	nop
 10004c6:	90                   	nop
 10004c7:	90                   	nop
 10004c8:	90                   	nop
 10004c9:	90                   	nop
 10004ca:	90                   	nop
 10004cb:	90                   	nop
 10004cc:	90                   	nop
 10004cd:	90                   	nop
 10004ce:	90                   	nop
 10004cf:	90                   	nop
 10004d0:	90                   	nop
 10004d1:	90                   	nop
 10004d2:	90                   	nop
 10004d3:	90                   	nop
 10004d4:	90                   	nop
 10004d5:	90                   	nop
 10004d6:	90                   	nop
 10004d7:	90                   	nop
 10004d8:	90                   	nop
 10004d9:	90                   	nop
 10004da:	90                   	nop
 10004db:	90                   	nop
 10004dc:	90                   	nop
 10004dd:	90                   	nop
 10004de:	90                   	nop
 10004df:	90                   	nop
 10004e0:	90                   	nop
 10004e1:	90                   	nop
 10004e2:	90                   	nop
 10004e3:	90                   	nop
 10004e4:	90                   	nop
 10004e5:	90                   	nop
 10004e6:	90                   	nop
 10004e7:	90                   	nop
 10004e8:	90                   	nop
 10004e9:	90                   	nop
 10004ea:	90                   	nop
 10004eb:	90                   	nop
 10004ec:	90                   	nop
 10004ed:	90                   	nop
 10004ee:	90                   	nop
 10004ef:	90                   	nop
 10004f0:	90                   	nop
 10004f1:	90                   	nop
 10004f2:	90                   	nop
 10004f3:	90                   	nop
 10004f4:	90                   	nop
 10004f5:	90                   	nop
 10004f6:	90                   	nop
 10004f7:	90                   	nop
 10004f8:	90                   	nop
 10004f9:	90                   	nop
 10004fa:	90                   	nop
 10004fb:	90                   	nop
 10004fc:	90                   	nop
 10004fd:	90                   	nop
 10004fe:	90                   	nop
 10004ff:	90                   	nop
 1000500:	90                   	nop
 1000501:	90                   	nop
 1000502:	90                   	nop
 1000503:	90                   	nop
 1000504:	90                   	nop
 1000505:	90                   	nop
 1000506:	90                   	nop
 1000507:	90                   	nop
 1000508:	90                   	nop
 1000509:	90                   	nop
 100050a:	90                   	nop
 100050b:	90                   	nop
 100050c:	90                   	nop
 100050d:	90                   	nop
 100050e:	90                   	nop
 100050f:	90                   	nop
 1000510:	90                   	nop
 1000511:	90                   	nop
 1000512:	90                   	nop
 1000513:	90                   	nop
 1000514:	90                   	nop
 1000515:	90                   	nop
 1000516:	90                   	nop
 1000517:	90                   	nop
 1000518:	90                   	nop
 1000519:	90                   	nop
 100051a:	90                   	nop
 100051b:	90                   	nop
 100051c:	90                   	nop
 100051d:	90                   	nop
 100051e:	90                   	nop
 100051f:	90                   	nop
 1000520:	90                   	nop
 1000521:	90                   	nop
 1000522:	90                   	nop
 1000523:	90                   	nop
 1000524:	90                   	nop
 1000525:	90                   	nop
 1000526:	90                   	nop
 1000527:	90                   	nop
 1000528:	90                   	nop
 1000529:	90                   	nop
 100052a:	90                   	nop
 100052b:	90                   	nop
 100052c:	90                   	nop
 100052d:	90                   	nop
 100052e:	90                   	nop
 100052f:	90                   	nop
 1000530:	90                   	nop
 1000531:	90                   	nop
 1000532:	90                   	nop
 1000533:	90                   	nop
 1000534:	90                   	nop
 1000535:	90                   	nop
 1000536:	90                   	nop
 1000537:	90                   	nop
 1000538:	90                   	nop
 1000539:	90                   	nop
 100053a:	90                   	nop
 100053b:	90                   	nop
 100053c:	90                   	nop
 100053d:	90                   	nop
 100053e:	90                   	nop
 100053f:	90                   	nop
 1000540:	90                   	nop
 1000541:	90                   	nop
 1000542:	90                   	nop
 1000543:	90                   	nop
 1000544:	90                   	nop
 1000545:	90                   	nop
 1000546:	90                   	nop
 1000547:	90                   	nop
 1000548:	90                   	nop
 1000549:	90                   	nop
 100054a:	90                   	nop
 100054b:	90                   	nop
 100054c:	90                   	nop
 100054d:	90                   	nop
 100054e:	90                   	nop
 100054f:	90                   	nop
 1000550:	90                   	nop
 1000551:	90                   	nop
 1000552:	90                   	nop
 1000553:	90                   	nop
 1000554:	90                   	nop
 1000555:	90                   	nop
 1000556:	90                   	nop
 1000557:	90                   	nop
 1000558:	90                   	nop
 1000559:	90                   	nop
 100055a:	90                   	nop
 100055b:	90                   	nop
 100055c:	90                   	nop
 100055d:	90                   	nop
 100055e:	90                   	nop
 100055f:	90                   	nop
 1000560:	90                   	nop
 1000561:	90                   	nop
 1000562:	90                   	nop
 1000563:	90                   	nop
 1000564:	90                   	nop
 1000565:	90                   	nop
 1000566:	90                   	nop
 1000567:	90                   	nop
 1000568:	90                   	nop
 1000569:	90                   	nop
 100056a:	90                   	nop
 100056b:	90                   	nop
 100056c:	90                   	nop
 100056d:	90                   	nop
 100056e:	90                   	nop
 100056f:	90                   	nop
 1000570:	90                   	nop
 1000571:	90                   	nop
 1000572:	90                   	nop
 1000573:	90                   	nop
 1000574:	90                   	nop
 1000575:	90                   	nop
 1000576:	90                   	nop
 1000577:	90                   	nop
 1000578:	90                   	nop
 1000579:	90                   	nop
 100057a:	90                   	nop
 100057b:	90                   	nop
 100057c:	90                   	nop
 100057d:	90                   	nop
 100057e:	90                   	nop
 100057f:	90                   	nop
 1000580:	90                   	nop
 1000581:	90                   	nop
 1000582:	90                   	nop
 1000583:	90                   	nop
 1000584:	90                   	nop
 1000585:	90                   	nop
 1000586:	90                   	nop
 1000587:	90                   	nop
 1000588:	90                   	nop
 1000589:	90                   	nop
 100058a:	90                   	nop
 100058b:	90                   	nop
 100058c:	90                   	nop
 100058d:	90                   	nop
 100058e:	90                   	nop
 100058f:	90                   	nop
 1000590:	90                   	nop
 1000591:	90                   	nop
 1000592:	90                   	nop
 1000593:	90                   	nop
 1000594:	90                   	nop
 1000595:	90                   	nop
 1000596:	90                   	nop
 1000597:	90                   	nop
 1000598:	90                   	nop
 1000599:	90                   	nop
 100059a:	90                   	nop
 100059b:	90                   	nop
 100059c:	90                   	nop
 100059d:	90                   	nop
 100059e:	90                   	nop
 100059f:	90                   	nop
 10005a0:	90                   	nop
 10005a1:	90                   	nop
 10005a2:	90                   	nop
 10005a3:	90                   	nop
 10005a4:	90                   	nop
 10005a5:	90                   	nop
 10005a6:	90                   	nop
 10005a7:	90                   	nop
 10005a8:	90                   	nop
 10005a9:	90                   	nop
 10005aa:	90                   	nop
 10005ab:	90                   	nop
 10005ac:	90                   	nop
 10005ad:	90                   	nop
 10005ae:	90                   	nop
 10005af:	90                   	nop
 10005b0:	90                   	nop
 10005b1:	90                   	nop
 10005b2:	90                   	nop
 10005b3:	90                   	nop
 10005b4:	90                   	nop
 10005b5:	90                   	nop
 10005b6:	90                   	nop
 10005b7:	90                   	nop
 10005b8:	90                   	nop
 10005b9:	90                   	nop
 10005ba:	90                   	nop
 10005bb:	90                   	nop
 10005bc:	90                   	nop
 10005bd:	90                   	nop
 10005be:	90                   	nop
 10005bf:	90                   	nop
 10005c0:	90                   	nop
 10005c1:	90                   	nop
 10005c2:	90                   	nop
 10005c3:	90                   	nop
 10005c4:	90                   	nop
 10005c5:	90                   	nop
 10005c6:	90                   	nop
 10005c7:	90                   	nop
 10005c8:	90                   	nop
 10005c9:	90                   	nop
 10005ca:	90                   	nop
 10005cb:	90                   	nop
 10005cc:	90                   	nop
 10005cd:	90                   	nop
 10005ce:	90                   	nop
 10005cf:	90                   	nop
 10005d0:	90                   	nop
 10005d1:	90                   	nop
 10005d2:	90                   	nop
 10005d3:	90                   	nop
 10005d4:	90                   	nop
 10005d5:	90                   	nop
 10005d6:	90                   	nop
 10005d7:	90                   	nop
 10005d8:	90                   	nop
 10005d9:	90                   	nop
 10005da:	90                   	nop
 10005db:	90                   	nop
 10005dc:	90                   	nop
 10005dd:	90                   	nop
 10005de:	90                   	nop
 10005df:	90                   	nop
 10005e0:	90                   	nop
 10005e1:	90                   	nop
 10005e2:	90                   	nop
 10005e3:	90                   	nop
 10005e4:	90                   	nop
 10005e5:	90                   	nop
 10005e6:	90                   	nop
 10005e7:	90                   	nop
 10005e8:	90                   	nop
 10005e9:	90                   	nop
 10005ea:	90                   	nop
 10005eb:	90                   	nop
 10005ec:	90                   	nop
 10005ed:	90                   	nop
 10005ee:	90                   	nop
 10005ef:	90                   	nop
 10005f0:	90                   	nop
 10005f1:	90                   	nop
 10005f2:	90                   	nop
 10005f3:	90                   	nop
 10005f4:	90                   	nop
 10005f5:	90                   	nop
 10005f6:	90                   	nop
 10005f7:	90                   	nop
 10005f8:	90                   	nop
 10005f9:	90                   	nop
 10005fa:	90                   	nop
 10005fb:	90                   	nop
 10005fc:	90                   	nop
 10005fd:	90                   	nop
 10005fe:	90                   	nop
 10005ff:	90                   	nop
 1000600:	90                   	nop
 1000601:	90                   	nop
 1000602:	90                   	nop
 1000603:	90                   	nop
 1000604:	90                   	nop
 1000605:	90                   	nop
 1000606:	90                   	nop
 1000607:	90                   	nop
 1000608:	90                   	nop
 1000609:	90                   	nop
 100060a:	90                   	nop
 100060b:	90                   	nop
 100060c:	90                   	nop
 100060d:	90                   	nop
 100060e:	90                   	nop
 100060f:	90                   	nop
 1000610:	90                   	nop
 1000611:	90                   	nop
 1000612:	90                   	nop
 1000613:	90                   	nop
 1000614:	90                   	nop
 1000615:	90                   	nop
 1000616:	90                   	nop
 1000617:	90                   	nop
 1000618:	90                   	nop
 1000619:	90                   	nop
 100061a:	90                   	nop
 100061b:	90                   	nop
 100061c:	90                   	nop
 100061d:	90                   	nop
 100061e:	90                   	nop
 100061f:	90                   	nop
 1000620:	90                   	nop
 1000621:	90                   	nop
 1000622:	90                   	nop
 1000623:	90                   	nop
 1000624:	90                   	nop
 1000625:	90                   	nop
 1000626:	90                   	nop
 1000627:	90                   	nop
 1000628:	90                   	nop
 1000629:	90                   	nop
 100062a:	90                   	nop
 100062b:	90                   	nop
 100062c:	90                   	nop
 100062d:	90                   	nop
 100062e:	90                   	nop
 100062f:	90                   	nop
 1000630:	90                   	nop
 1000631:	90                   	nop
 1000632:	90                   	nop
 1000633:	90                   	nop
 1000634:	90                   	nop
 1000635:	90                   	nop
 1000636:	90                   	nop
 1000637:	90                   	nop
 1000638:	90                   	nop
 1000639:	90                   	nop
 100063a:	90                   	nop
 100063b:	90                   	nop
 100063c:	90                   	nop
 100063d:	90                   	nop
 100063e:	90                   	nop
 100063f:	90                   	nop
 1000640:	90                   	nop
 1000641:	90                   	nop
 1000642:	90                   	nop
 1000643:	90                   	nop
 1000644:	90                   	nop
 1000645:	90                   	nop
 1000646:	90                   	nop
 1000647:	90                   	nop
 1000648:	90                   	nop
 1000649:	90                   	nop
 100064a:	90                   	nop
 100064b:	90                   	nop
 100064c:	90                   	nop
 100064d:	90                   	nop
 100064e:	90                   	nop
 100064f:	90                   	nop
 1000650:	90                   	nop
 1000651:	90                   	nop
 1000652:	90                   	nop
 1000653:	90                   	nop
 1000654:	90                   	nop
 1000655:	90                   	nop
 1000656:	90                   	nop
 1000657:	90                   	nop
 1000658:	90                   	nop
 1000659:	90                   	nop
 100065a:	90                   	nop
 100065b:	90                   	nop
 100065c:	90                   	nop
 100065d:	90                   	nop
 100065e:	90                   	nop
 100065f:	90                   	nop
 1000660:	90                   	nop
 1000661:	90                   	nop
 1000662:	90                   	nop
 1000663:	90                   	nop
 1000664:	90                   	nop
 1000665:	90                   	nop
 1000666:	90                   	nop
 1000667:	90                   	nop
 1000668:	90                   	nop
 1000669:	90                   	nop
 100066a:	90                   	nop
 100066b:	90                   	nop
 100066c:	90                   	nop
 100066d:	90                   	nop
 100066e:	90                   	nop
 100066f:	90                   	nop
 1000670:	90                   	nop
 1000671:	90                   	nop
 1000672:	90                   	nop
 1000673:	90                   	nop
 1000674:	90                   	nop
 1000675:	90                   	nop
 1000676:	90                   	nop
 1000677:	90                   	nop
 1000678:	90                   	nop
 1000679:	90                   	nop
 100067a:	90                   	nop
 100067b:	90                   	nop
 100067c:	90                   	nop
 100067d:	90                   	nop
 100067e:	90                   	nop
 100067f:	90                   	nop
 1000680:	90                   	nop
 1000681:	90                   	nop
 1000682:	c3                   	ret    

Disassembly of section .sec_dummy_target_0:

0000000001000683 <dummy_target_0-0x200>:
 1000683:	90                   	nop
 1000684:	90                   	nop
 1000685:	90                   	nop
 1000686:	90                   	nop
 1000687:	90                   	nop
 1000688:	90                   	nop
 1000689:	90                   	nop
 100068a:	90                   	nop
 100068b:	90                   	nop
 100068c:	90                   	nop
 100068d:	90                   	nop
 100068e:	90                   	nop
 100068f:	90                   	nop
 1000690:	90                   	nop
 1000691:	90                   	nop
 1000692:	90                   	nop
 1000693:	90                   	nop
 1000694:	90                   	nop
 1000695:	90                   	nop
 1000696:	90                   	nop
 1000697:	90                   	nop
 1000698:	90                   	nop
 1000699:	90                   	nop
 100069a:	90                   	nop
 100069b:	90                   	nop
 100069c:	90                   	nop
 100069d:	90                   	nop
 100069e:	90                   	nop
 100069f:	90                   	nop
 10006a0:	90                   	nop
 10006a1:	90                   	nop
 10006a2:	90                   	nop
 10006a3:	90                   	nop
 10006a4:	90                   	nop
 10006a5:	90                   	nop
 10006a6:	90                   	nop
 10006a7:	90                   	nop
 10006a8:	90                   	nop
 10006a9:	90                   	nop
 10006aa:	90                   	nop
 10006ab:	90                   	nop
 10006ac:	90                   	nop
 10006ad:	90                   	nop
 10006ae:	90                   	nop
 10006af:	90                   	nop
 10006b0:	90                   	nop
 10006b1:	90                   	nop
 10006b2:	90                   	nop
 10006b3:	90                   	nop
 10006b4:	90                   	nop
 10006b5:	90                   	nop
 10006b6:	90                   	nop
 10006b7:	90                   	nop
 10006b8:	90                   	nop
 10006b9:	90                   	nop
 10006ba:	90                   	nop
 10006bb:	90                   	nop
 10006bc:	90                   	nop
 10006bd:	90                   	nop
 10006be:	90                   	nop
 10006bf:	90                   	nop
 10006c0:	90                   	nop
 10006c1:	90                   	nop
 10006c2:	90                   	nop
 10006c3:	90                   	nop
 10006c4:	90                   	nop
 10006c5:	90                   	nop
 10006c6:	90                   	nop
 10006c7:	90                   	nop
 10006c8:	90                   	nop
 10006c9:	90                   	nop
 10006ca:	90                   	nop
 10006cb:	90                   	nop
 10006cc:	90                   	nop
 10006cd:	90                   	nop
 10006ce:	90                   	nop
 10006cf:	90                   	nop
 10006d0:	90                   	nop
 10006d1:	90                   	nop
 10006d2:	90                   	nop
 10006d3:	90                   	nop
 10006d4:	90                   	nop
 10006d5:	90                   	nop
 10006d6:	90                   	nop
 10006d7:	90                   	nop
 10006d8:	90                   	nop
 10006d9:	90                   	nop
 10006da:	90                   	nop
 10006db:	90                   	nop
 10006dc:	90                   	nop
 10006dd:	90                   	nop
 10006de:	90                   	nop
 10006df:	90                   	nop
 10006e0:	90                   	nop
 10006e1:	90                   	nop
 10006e2:	90                   	nop
 10006e3:	90                   	nop
 10006e4:	90                   	nop
 10006e5:	90                   	nop
 10006e6:	90                   	nop
 10006e7:	90                   	nop
 10006e8:	90                   	nop
 10006e9:	90                   	nop
 10006ea:	90                   	nop
 10006eb:	90                   	nop
 10006ec:	90                   	nop
 10006ed:	90                   	nop
 10006ee:	90                   	nop
 10006ef:	90                   	nop
 10006f0:	90                   	nop
 10006f1:	90                   	nop
 10006f2:	90                   	nop
 10006f3:	90                   	nop
 10006f4:	90                   	nop
 10006f5:	90                   	nop
 10006f6:	90                   	nop
 10006f7:	90                   	nop
 10006f8:	90                   	nop
 10006f9:	90                   	nop
 10006fa:	90                   	nop
 10006fb:	90                   	nop
 10006fc:	90                   	nop
 10006fd:	90                   	nop
 10006fe:	90                   	nop
 10006ff:	90                   	nop
 1000700:	90                   	nop
 1000701:	90                   	nop
 1000702:	90                   	nop
 1000703:	90                   	nop
 1000704:	90                   	nop
 1000705:	90                   	nop
 1000706:	90                   	nop
 1000707:	90                   	nop
 1000708:	90                   	nop
 1000709:	90                   	nop
 100070a:	90                   	nop
 100070b:	90                   	nop
 100070c:	90                   	nop
 100070d:	90                   	nop
 100070e:	90                   	nop
 100070f:	90                   	nop
 1000710:	90                   	nop
 1000711:	90                   	nop
 1000712:	90                   	nop
 1000713:	90                   	nop
 1000714:	90                   	nop
 1000715:	90                   	nop
 1000716:	90                   	nop
 1000717:	90                   	nop
 1000718:	90                   	nop
 1000719:	90                   	nop
 100071a:	90                   	nop
 100071b:	90                   	nop
 100071c:	90                   	nop
 100071d:	90                   	nop
 100071e:	90                   	nop
 100071f:	90                   	nop
 1000720:	90                   	nop
 1000721:	90                   	nop
 1000722:	90                   	nop
 1000723:	90                   	nop
 1000724:	90                   	nop
 1000725:	90                   	nop
 1000726:	90                   	nop
 1000727:	90                   	nop
 1000728:	90                   	nop
 1000729:	90                   	nop
 100072a:	90                   	nop
 100072b:	90                   	nop
 100072c:	90                   	nop
 100072d:	90                   	nop
 100072e:	90                   	nop
 100072f:	90                   	nop
 1000730:	90                   	nop
 1000731:	90                   	nop
 1000732:	90                   	nop
 1000733:	90                   	nop
 1000734:	90                   	nop
 1000735:	90                   	nop
 1000736:	90                   	nop
 1000737:	90                   	nop
 1000738:	90                   	nop
 1000739:	90                   	nop
 100073a:	90                   	nop
 100073b:	90                   	nop
 100073c:	90                   	nop
 100073d:	90                   	nop
 100073e:	90                   	nop
 100073f:	90                   	nop
 1000740:	90                   	nop
 1000741:	90                   	nop
 1000742:	90                   	nop
 1000743:	90                   	nop
 1000744:	90                   	nop
 1000745:	90                   	nop
 1000746:	90                   	nop
 1000747:	90                   	nop
 1000748:	90                   	nop
 1000749:	90                   	nop
 100074a:	90                   	nop
 100074b:	90                   	nop
 100074c:	90                   	nop
 100074d:	90                   	nop
 100074e:	90                   	nop
 100074f:	90                   	nop
 1000750:	90                   	nop
 1000751:	90                   	nop
 1000752:	90                   	nop
 1000753:	90                   	nop
 1000754:	90                   	nop
 1000755:	90                   	nop
 1000756:	90                   	nop
 1000757:	90                   	nop
 1000758:	90                   	nop
 1000759:	90                   	nop
 100075a:	90                   	nop
 100075b:	90                   	nop
 100075c:	90                   	nop
 100075d:	90                   	nop
 100075e:	90                   	nop
 100075f:	90                   	nop
 1000760:	90                   	nop
 1000761:	90                   	nop
 1000762:	90                   	nop
 1000763:	90                   	nop
 1000764:	90                   	nop
 1000765:	90                   	nop
 1000766:	90                   	nop
 1000767:	90                   	nop
 1000768:	90                   	nop
 1000769:	90                   	nop
 100076a:	90                   	nop
 100076b:	90                   	nop
 100076c:	90                   	nop
 100076d:	90                   	nop
 100076e:	90                   	nop
 100076f:	90                   	nop
 1000770:	90                   	nop
 1000771:	90                   	nop
 1000772:	90                   	nop
 1000773:	90                   	nop
 1000774:	90                   	nop
 1000775:	90                   	nop
 1000776:	90                   	nop
 1000777:	90                   	nop
 1000778:	90                   	nop
 1000779:	90                   	nop
 100077a:	90                   	nop
 100077b:	90                   	nop
 100077c:	90                   	nop
 100077d:	90                   	nop
 100077e:	90                   	nop
 100077f:	90                   	nop
 1000780:	90                   	nop
 1000781:	90                   	nop
 1000782:	90                   	nop
 1000783:	90                   	nop
 1000784:	90                   	nop
 1000785:	90                   	nop
 1000786:	90                   	nop
 1000787:	90                   	nop
 1000788:	90                   	nop
 1000789:	90                   	nop
 100078a:	90                   	nop
 100078b:	90                   	nop
 100078c:	90                   	nop
 100078d:	90                   	nop
 100078e:	90                   	nop
 100078f:	90                   	nop
 1000790:	90                   	nop
 1000791:	90                   	nop
 1000792:	90                   	nop
 1000793:	90                   	nop
 1000794:	90                   	nop
 1000795:	90                   	nop
 1000796:	90                   	nop
 1000797:	90                   	nop
 1000798:	90                   	nop
 1000799:	90                   	nop
 100079a:	90                   	nop
 100079b:	90                   	nop
 100079c:	90                   	nop
 100079d:	90                   	nop
 100079e:	90                   	nop
 100079f:	90                   	nop
 10007a0:	90                   	nop
 10007a1:	90                   	nop
 10007a2:	90                   	nop
 10007a3:	90                   	nop
 10007a4:	90                   	nop
 10007a5:	90                   	nop
 10007a6:	90                   	nop
 10007a7:	90                   	nop
 10007a8:	90                   	nop
 10007a9:	90                   	nop
 10007aa:	90                   	nop
 10007ab:	90                   	nop
 10007ac:	90                   	nop
 10007ad:	90                   	nop
 10007ae:	90                   	nop
 10007af:	90                   	nop
 10007b0:	90                   	nop
 10007b1:	90                   	nop
 10007b2:	90                   	nop
 10007b3:	90                   	nop
 10007b4:	90                   	nop
 10007b5:	90                   	nop
 10007b6:	90                   	nop
 10007b7:	90                   	nop
 10007b8:	90                   	nop
 10007b9:	90                   	nop
 10007ba:	90                   	nop
 10007bb:	90                   	nop
 10007bc:	90                   	nop
 10007bd:	90                   	nop
 10007be:	90                   	nop
 10007bf:	90                   	nop
 10007c0:	90                   	nop
 10007c1:	90                   	nop
 10007c2:	90                   	nop
 10007c3:	90                   	nop
 10007c4:	90                   	nop
 10007c5:	90                   	nop
 10007c6:	90                   	nop
 10007c7:	90                   	nop
 10007c8:	90                   	nop
 10007c9:	90                   	nop
 10007ca:	90                   	nop
 10007cb:	90                   	nop
 10007cc:	90                   	nop
 10007cd:	90                   	nop
 10007ce:	90                   	nop
 10007cf:	90                   	nop
 10007d0:	90                   	nop
 10007d1:	90                   	nop
 10007d2:	90                   	nop
 10007d3:	90                   	nop
 10007d4:	90                   	nop
 10007d5:	90                   	nop
 10007d6:	90                   	nop
 10007d7:	90                   	nop
 10007d8:	90                   	nop
 10007d9:	90                   	nop
 10007da:	90                   	nop
 10007db:	90                   	nop
 10007dc:	90                   	nop
 10007dd:	90                   	nop
 10007de:	90                   	nop
 10007df:	90                   	nop
 10007e0:	90                   	nop
 10007e1:	90                   	nop
 10007e2:	90                   	nop
 10007e3:	90                   	nop
 10007e4:	90                   	nop
 10007e5:	90                   	nop
 10007e6:	90                   	nop
 10007e7:	90                   	nop
 10007e8:	90                   	nop
 10007e9:	90                   	nop
 10007ea:	90                   	nop
 10007eb:	90                   	nop
 10007ec:	90                   	nop
 10007ed:	90                   	nop
 10007ee:	90                   	nop
 10007ef:	90                   	nop
 10007f0:	90                   	nop
 10007f1:	90                   	nop
 10007f2:	90                   	nop
 10007f3:	90                   	nop
 10007f4:	90                   	nop
 10007f5:	90                   	nop
 10007f6:	90                   	nop
 10007f7:	90                   	nop
 10007f8:	90                   	nop
 10007f9:	90                   	nop
 10007fa:	90                   	nop
 10007fb:	90                   	nop
 10007fc:	90                   	nop
 10007fd:	90                   	nop
 10007fe:	90                   	nop
 10007ff:	90                   	nop
 1000800:	90                   	nop
 1000801:	90                   	nop
 1000802:	90                   	nop
 1000803:	90                   	nop
 1000804:	90                   	nop
 1000805:	90                   	nop
 1000806:	90                   	nop
 1000807:	90                   	nop
 1000808:	90                   	nop
 1000809:	90                   	nop
 100080a:	90                   	nop
 100080b:	90                   	nop
 100080c:	90                   	nop
 100080d:	90                   	nop
 100080e:	90                   	nop
 100080f:	90                   	nop
 1000810:	90                   	nop
 1000811:	90                   	nop
 1000812:	90                   	nop
 1000813:	90                   	nop
 1000814:	90                   	nop
 1000815:	90                   	nop
 1000816:	90                   	nop
 1000817:	90                   	nop
 1000818:	90                   	nop
 1000819:	90                   	nop
 100081a:	90                   	nop
 100081b:	90                   	nop
 100081c:	90                   	nop
 100081d:	90                   	nop
 100081e:	90                   	nop
 100081f:	90                   	nop
 1000820:	90                   	nop
 1000821:	90                   	nop
 1000822:	90                   	nop
 1000823:	90                   	nop
 1000824:	90                   	nop
 1000825:	90                   	nop
 1000826:	90                   	nop
 1000827:	90                   	nop
 1000828:	90                   	nop
 1000829:	90                   	nop
 100082a:	90                   	nop
 100082b:	90                   	nop
 100082c:	90                   	nop
 100082d:	90                   	nop
 100082e:	90                   	nop
 100082f:	90                   	nop
 1000830:	90                   	nop
 1000831:	90                   	nop
 1000832:	90                   	nop
 1000833:	90                   	nop
 1000834:	90                   	nop
 1000835:	90                   	nop
 1000836:	90                   	nop
 1000837:	90                   	nop
 1000838:	90                   	nop
 1000839:	90                   	nop
 100083a:	90                   	nop
 100083b:	90                   	nop
 100083c:	90                   	nop
 100083d:	90                   	nop
 100083e:	90                   	nop
 100083f:	90                   	nop
 1000840:	90                   	nop
 1000841:	90                   	nop
 1000842:	90                   	nop
 1000843:	90                   	nop
 1000844:	90                   	nop
 1000845:	90                   	nop
 1000846:	90                   	nop
 1000847:	90                   	nop
 1000848:	90                   	nop
 1000849:	90                   	nop
 100084a:	90                   	nop
 100084b:	90                   	nop
 100084c:	90                   	nop
 100084d:	90                   	nop
 100084e:	90                   	nop
 100084f:	90                   	nop
 1000850:	90                   	nop
 1000851:	90                   	nop
 1000852:	90                   	nop
 1000853:	90                   	nop
 1000854:	90                   	nop
 1000855:	90                   	nop
 1000856:	90                   	nop
 1000857:	90                   	nop
 1000858:	90                   	nop
 1000859:	90                   	nop
 100085a:	90                   	nop
 100085b:	90                   	nop
 100085c:	90                   	nop
 100085d:	90                   	nop
 100085e:	90                   	nop
 100085f:	90                   	nop
 1000860:	90                   	nop
 1000861:	90                   	nop
 1000862:	90                   	nop
 1000863:	90                   	nop
 1000864:	90                   	nop
 1000865:	90                   	nop
 1000866:	90                   	nop
 1000867:	90                   	nop
 1000868:	90                   	nop
 1000869:	90                   	nop
 100086a:	90                   	nop
 100086b:	90                   	nop
 100086c:	90                   	nop
 100086d:	90                   	nop
 100086e:	90                   	nop
 100086f:	90                   	nop
 1000870:	90                   	nop
 1000871:	90                   	nop
 1000872:	90                   	nop
 1000873:	90                   	nop
 1000874:	90                   	nop
 1000875:	90                   	nop
 1000876:	90                   	nop
 1000877:	90                   	nop
 1000878:	90                   	nop
 1000879:	90                   	nop
 100087a:	90                   	nop
 100087b:	90                   	nop
 100087c:	90                   	nop
 100087d:	90                   	nop
 100087e:	90                   	nop
 100087f:	90                   	nop
 1000880:	90                   	nop
 1000881:	90                   	nop
 1000882:	90                   	nop

0000000001000883 <dummy_target_0>:
 1000883:	4c 8b 0d 36 88 00 00 	mov    0x8836(%rip),%r9        # 10090c0 <UserData+0x200>
 100088a:	90                   	nop
 100088b:	90                   	nop
 100088c:	90                   	nop
 100088d:	90                   	nop
 100088e:	90                   	nop
 100088f:	90                   	nop
 1000890:	90                   	nop
 1000891:	90                   	nop
 1000892:	90                   	nop
 1000893:	90                   	nop
 1000894:	90                   	nop
 1000895:	90                   	nop
 1000896:	90                   	nop
 1000897:	90                   	nop
 1000898:	90                   	nop
 1000899:	90                   	nop
 100089a:	90                   	nop
 100089b:	90                   	nop
 100089c:	90                   	nop
 100089d:	90                   	nop
 100089e:	90                   	nop
 100089f:	90                   	nop
 10008a0:	90                   	nop
 10008a1:	90                   	nop
 10008a2:	90                   	nop
 10008a3:	90                   	nop
 10008a4:	90                   	nop
 10008a5:	90                   	nop
 10008a6:	90                   	nop
 10008a7:	90                   	nop
 10008a8:	90                   	nop
 10008a9:	90                   	nop
 10008aa:	90                   	nop
 10008ab:	90                   	nop
 10008ac:	90                   	nop
 10008ad:	90                   	nop
 10008ae:	90                   	nop
 10008af:	90                   	nop
 10008b0:	90                   	nop
 10008b1:	90                   	nop
 10008b2:	90                   	nop
 10008b3:	90                   	nop
 10008b4:	90                   	nop
 10008b5:	90                   	nop
 10008b6:	90                   	nop
 10008b7:	90                   	nop
 10008b8:	90                   	nop
 10008b9:	90                   	nop
 10008ba:	90                   	nop
 10008bb:	90                   	nop
 10008bc:	90                   	nop
 10008bd:	90                   	nop
 10008be:	90                   	nop
 10008bf:	90                   	nop
 10008c0:	90                   	nop
 10008c1:	90                   	nop
 10008c2:	90                   	nop
 10008c3:	90                   	nop
 10008c4:	90                   	nop
 10008c5:	90                   	nop
 10008c6:	90                   	nop
 10008c7:	90                   	nop
 10008c8:	90                   	nop
 10008c9:	90                   	nop
 10008ca:	90                   	nop
 10008cb:	90                   	nop
 10008cc:	90                   	nop
 10008cd:	90                   	nop
 10008ce:	90                   	nop
 10008cf:	90                   	nop
 10008d0:	90                   	nop
 10008d1:	90                   	nop
 10008d2:	90                   	nop
 10008d3:	90                   	nop
 10008d4:	90                   	nop
 10008d5:	90                   	nop
 10008d6:	90                   	nop
 10008d7:	90                   	nop
 10008d8:	90                   	nop
 10008d9:	90                   	nop
 10008da:	90                   	nop
 10008db:	90                   	nop
 10008dc:	90                   	nop
 10008dd:	90                   	nop
 10008de:	90                   	nop
 10008df:	90                   	nop
 10008e0:	90                   	nop
 10008e1:	90                   	nop
 10008e2:	90                   	nop
 10008e3:	90                   	nop
 10008e4:	90                   	nop
 10008e5:	90                   	nop
 10008e6:	90                   	nop
 10008e7:	90                   	nop
 10008e8:	90                   	nop
 10008e9:	90                   	nop
 10008ea:	90                   	nop
 10008eb:	90                   	nop
 10008ec:	90                   	nop
 10008ed:	90                   	nop
 10008ee:	c3                   	ret    

00000000010008ef <dummy_target_1>:
 10008ef:	4c 8b 0d ca 87 00 00 	mov    0x87ca(%rip),%r9        # 10090c0 <UserData+0x200>
 10008f6:	90                   	nop
 10008f7:	90                   	nop
 10008f8:	90                   	nop
 10008f9:	90                   	nop
 10008fa:	90                   	nop
 10008fb:	90                   	nop
 10008fc:	90                   	nop
 10008fd:	90                   	nop
 10008fe:	90                   	nop
 10008ff:	90                   	nop
 1000900:	90                   	nop
 1000901:	90                   	nop
 1000902:	90                   	nop
 1000903:	90                   	nop
 1000904:	90                   	nop
 1000905:	90                   	nop
 1000906:	90                   	nop
 1000907:	90                   	nop
 1000908:	90                   	nop
 1000909:	90                   	nop
 100090a:	90                   	nop
 100090b:	90                   	nop
 100090c:	90                   	nop
 100090d:	90                   	nop
 100090e:	90                   	nop
 100090f:	90                   	nop
 1000910:	90                   	nop
 1000911:	90                   	nop
 1000912:	90                   	nop
 1000913:	90                   	nop
 1000914:	90                   	nop
 1000915:	90                   	nop
 1000916:	90                   	nop
 1000917:	90                   	nop
 1000918:	90                   	nop
 1000919:	90                   	nop
 100091a:	90                   	nop
 100091b:	90                   	nop
 100091c:	90                   	nop
 100091d:	90                   	nop
 100091e:	90                   	nop
 100091f:	90                   	nop
 1000920:	90                   	nop
 1000921:	90                   	nop
 1000922:	90                   	nop
 1000923:	90                   	nop
 1000924:	90                   	nop
 1000925:	90                   	nop
 1000926:	90                   	nop
 1000927:	90                   	nop
 1000928:	90                   	nop
 1000929:	90                   	nop
 100092a:	90                   	nop
 100092b:	90                   	nop
 100092c:	90                   	nop
 100092d:	90                   	nop
 100092e:	90                   	nop
 100092f:	90                   	nop
 1000930:	90                   	nop
 1000931:	90                   	nop
 1000932:	90                   	nop
 1000933:	90                   	nop
 1000934:	90                   	nop
 1000935:	90                   	nop
 1000936:	90                   	nop
 1000937:	90                   	nop
 1000938:	90                   	nop
 1000939:	90                   	nop
 100093a:	90                   	nop
 100093b:	90                   	nop
 100093c:	90                   	nop
 100093d:	90                   	nop
 100093e:	90                   	nop
 100093f:	90                   	nop
 1000940:	90                   	nop
 1000941:	90                   	nop
 1000942:	90                   	nop
 1000943:	90                   	nop
 1000944:	90                   	nop
 1000945:	90                   	nop
 1000946:	90                   	nop
 1000947:	90                   	nop
 1000948:	90                   	nop
 1000949:	90                   	nop
 100094a:	90                   	nop
 100094b:	90                   	nop
 100094c:	90                   	nop
 100094d:	90                   	nop
 100094e:	90                   	nop
 100094f:	90                   	nop
 1000950:	90                   	nop
 1000951:	90                   	nop
 1000952:	90                   	nop
 1000953:	90                   	nop
 1000954:	90                   	nop
 1000955:	90                   	nop
 1000956:	90                   	nop
 1000957:	90                   	nop
 1000958:	90                   	nop
 1000959:	90                   	nop
 100095a:	c3                   	ret    

Disassembly of section .fini:

000000000100095c <_fini>:
 100095c:	f3 0f 1e fa          	endbr64 
 1000960:	48 83 ec 08          	sub    $0x8,%rsp
 1000964:	48 83 c4 08          	add    $0x8,%rsp
 1000968:	c3                   	ret    
