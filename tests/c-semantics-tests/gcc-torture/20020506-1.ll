; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020506-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @test1(i8 signext %c, i32 %set) nounwind uwtable {
entry:
  %c.addr = alloca i8, align 1
  %set.addr = alloca i32, align 4
  store i8 %c, i8* %c.addr, align 1
  store i32 %set, i32* %set.addr, align 4
  %0 = load i8* %c.addr, align 1
  %conv = sext i8 %0 to i32
  %and = and i32 %conv, 128
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %entry
  %2 = load i32* %set.addr, align 4
  %tobool3 = icmp ne i32 %2, 0
  br i1 %tobool3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  %3 = load i8* %c.addr, align 1
  %conv7 = sext i8 %3 to i32
  %and8 = and i32 %conv7, 128
  %cmp9 = icmp ne i32 %and8, 0
  br i1 %cmp9, label %if.then11, label %if.else15

if.then11:                                        ; preds = %if.end6
  %4 = load i32* %set.addr, align 4
  %tobool12 = icmp ne i32 %4, 0
  br i1 %tobool12, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.then11
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.then11
  br label %if.end19

if.else15:                                        ; preds = %if.end6
  %5 = load i32* %set.addr, align 4
  %tobool16 = icmp ne i32 %5, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.else15
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.else15
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.end14
  %6 = load i8* %c.addr, align 1
  %conv20 = sext i8 %6 to i32
  %and21 = and i32 %conv20, 128
  %cmp22 = icmp eq i32 %and21, 128
  br i1 %cmp22, label %if.then24, label %if.else28

if.then24:                                        ; preds = %if.end19
  %7 = load i32* %set.addr, align 4
  %tobool25 = icmp ne i32 %7, 0
  br i1 %tobool25, label %if.end27, label %if.then26

if.then26:                                        ; preds = %if.then24
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.then24
  br label %if.end32

if.else28:                                        ; preds = %if.end19
  %8 = load i32* %set.addr, align 4
  %tobool29 = icmp ne i32 %8, 0
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.else28
  call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %if.else28
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.end27
  %9 = load i8* %c.addr, align 1
  %conv33 = sext i8 %9 to i32
  %and34 = and i32 %conv33, 128
  %cmp35 = icmp ne i32 %and34, 128
  br i1 %cmp35, label %if.then37, label %if.else41

if.then37:                                        ; preds = %if.end32
  %10 = load i32* %set.addr, align 4
  %tobool38 = icmp ne i32 %10, 0
  br i1 %tobool38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.then37
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.then37
  br label %if.end45

if.else41:                                        ; preds = %if.end32
  %11 = load i32* %set.addr, align 4
  %tobool42 = icmp ne i32 %11, 0
  br i1 %tobool42, label %if.end44, label %if.then43

if.then43:                                        ; preds = %if.else41
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.else41
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.end40
  ret void
}

declare void @abort() noreturn nounwind

define void @test2(i8 zeroext %c, i32 %set) nounwind uwtable {
entry:
  %c.addr = alloca i8, align 1
  %set.addr = alloca i32, align 4
  store i8 %c, i8* %c.addr, align 1
  store i32 %set, i32* %set.addr, align 4
  %0 = load i8* %c.addr, align 1
  %conv = zext i8 %0 to i32
  %and = and i32 %conv, 128
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %entry
  %2 = load i32* %set.addr, align 4
  %tobool3 = icmp ne i32 %2, 0
  br i1 %tobool3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  %3 = load i8* %c.addr, align 1
  %conv7 = zext i8 %3 to i32
  %and8 = and i32 %conv7, 128
  %cmp9 = icmp ne i32 %and8, 0
  br i1 %cmp9, label %if.then11, label %if.else15

if.then11:                                        ; preds = %if.end6
  %4 = load i32* %set.addr, align 4
  %tobool12 = icmp ne i32 %4, 0
  br i1 %tobool12, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.then11
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.then11
  br label %if.end19

if.else15:                                        ; preds = %if.end6
  %5 = load i32* %set.addr, align 4
  %tobool16 = icmp ne i32 %5, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.else15
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.else15
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.end14
  %6 = load i8* %c.addr, align 1
  %conv20 = zext i8 %6 to i32
  %and21 = and i32 %conv20, 128
  %cmp22 = icmp eq i32 %and21, 128
  br i1 %cmp22, label %if.then24, label %if.else28

if.then24:                                        ; preds = %if.end19
  %7 = load i32* %set.addr, align 4
  %tobool25 = icmp ne i32 %7, 0
  br i1 %tobool25, label %if.end27, label %if.then26

if.then26:                                        ; preds = %if.then24
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.then24
  br label %if.end32

if.else28:                                        ; preds = %if.end19
  %8 = load i32* %set.addr, align 4
  %tobool29 = icmp ne i32 %8, 0
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.else28
  call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %if.else28
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.end27
  %9 = load i8* %c.addr, align 1
  %conv33 = zext i8 %9 to i32
  %and34 = and i32 %conv33, 128
  %cmp35 = icmp ne i32 %and34, 128
  br i1 %cmp35, label %if.then37, label %if.else41

if.then37:                                        ; preds = %if.end32
  %10 = load i32* %set.addr, align 4
  %tobool38 = icmp ne i32 %10, 0
  br i1 %tobool38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.then37
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.then37
  br label %if.end45

if.else41:                                        ; preds = %if.end32
  %11 = load i32* %set.addr, align 4
  %tobool42 = icmp ne i32 %11, 0
  br i1 %tobool42, label %if.end44, label %if.then43

if.then43:                                        ; preds = %if.else41
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.else41
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.end40
  ret void
}

define void @test3(i16 signext %s, i32 %set) nounwind uwtable {
entry:
  %s.addr = alloca i16, align 2
  %set.addr = alloca i32, align 4
  store i16 %s, i16* %s.addr, align 2
  store i32 %set, i32* %set.addr, align 4
  %0 = load i16* %s.addr, align 2
  %conv = sext i16 %0 to i32
  %and = and i32 %conv, 32768
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %entry
  %2 = load i32* %set.addr, align 4
  %tobool3 = icmp ne i32 %2, 0
  br i1 %tobool3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  %3 = load i16* %s.addr, align 2
  %conv7 = sext i16 %3 to i32
  %and8 = and i32 %conv7, 32768
  %cmp9 = icmp ne i32 %and8, 0
  br i1 %cmp9, label %if.then11, label %if.else15

if.then11:                                        ; preds = %if.end6
  %4 = load i32* %set.addr, align 4
  %tobool12 = icmp ne i32 %4, 0
  br i1 %tobool12, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.then11
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.then11
  br label %if.end19

if.else15:                                        ; preds = %if.end6
  %5 = load i32* %set.addr, align 4
  %tobool16 = icmp ne i32 %5, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.else15
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.else15
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.end14
  %6 = load i16* %s.addr, align 2
  %conv20 = sext i16 %6 to i32
  %and21 = and i32 %conv20, 32768
  %cmp22 = icmp eq i32 %and21, 32768
  br i1 %cmp22, label %if.then24, label %if.else28

if.then24:                                        ; preds = %if.end19
  %7 = load i32* %set.addr, align 4
  %tobool25 = icmp ne i32 %7, 0
  br i1 %tobool25, label %if.end27, label %if.then26

if.then26:                                        ; preds = %if.then24
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.then24
  br label %if.end32

if.else28:                                        ; preds = %if.end19
  %8 = load i32* %set.addr, align 4
  %tobool29 = icmp ne i32 %8, 0
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.else28
  call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %if.else28
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.end27
  %9 = load i16* %s.addr, align 2
  %conv33 = sext i16 %9 to i32
  %and34 = and i32 %conv33, 32768
  %cmp35 = icmp ne i32 %and34, 32768
  br i1 %cmp35, label %if.then37, label %if.else41

if.then37:                                        ; preds = %if.end32
  %10 = load i32* %set.addr, align 4
  %tobool38 = icmp ne i32 %10, 0
  br i1 %tobool38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.then37
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.then37
  br label %if.end45

if.else41:                                        ; preds = %if.end32
  %11 = load i32* %set.addr, align 4
  %tobool42 = icmp ne i32 %11, 0
  br i1 %tobool42, label %if.end44, label %if.then43

if.then43:                                        ; preds = %if.else41
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.else41
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.end40
  ret void
}

define void @test4(i16 zeroext %s, i32 %set) nounwind uwtable {
entry:
  %s.addr = alloca i16, align 2
  %set.addr = alloca i32, align 4
  store i16 %s, i16* %s.addr, align 2
  store i32 %set, i32* %set.addr, align 4
  %0 = load i16* %s.addr, align 2
  %conv = zext i16 %0 to i32
  %and = and i32 %conv, 32768
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then2, label %if.end

if.then2:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end6

if.else:                                          ; preds = %entry
  %2 = load i32* %set.addr, align 4
  %tobool3 = icmp ne i32 %2, 0
  br i1 %tobool3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.else
  br label %if.end6

if.end6:                                          ; preds = %if.end5, %if.end
  %3 = load i16* %s.addr, align 2
  %conv7 = zext i16 %3 to i32
  %and8 = and i32 %conv7, 32768
  %cmp9 = icmp ne i32 %and8, 0
  br i1 %cmp9, label %if.then11, label %if.else15

if.then11:                                        ; preds = %if.end6
  %4 = load i32* %set.addr, align 4
  %tobool12 = icmp ne i32 %4, 0
  br i1 %tobool12, label %if.end14, label %if.then13

if.then13:                                        ; preds = %if.then11
  call void @abort() noreturn nounwind
  unreachable

if.end14:                                         ; preds = %if.then11
  br label %if.end19

if.else15:                                        ; preds = %if.end6
  %5 = load i32* %set.addr, align 4
  %tobool16 = icmp ne i32 %5, 0
  br i1 %tobool16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.else15
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.else15
  br label %if.end19

if.end19:                                         ; preds = %if.end18, %if.end14
  %6 = load i16* %s.addr, align 2
  %conv20 = zext i16 %6 to i32
  %and21 = and i32 %conv20, 32768
  %cmp22 = icmp eq i32 %and21, 32768
  br i1 %cmp22, label %if.then24, label %if.else28

if.then24:                                        ; preds = %if.end19
  %7 = load i32* %set.addr, align 4
  %tobool25 = icmp ne i32 %7, 0
  br i1 %tobool25, label %if.end27, label %if.then26

if.then26:                                        ; preds = %if.then24
  call void @abort() noreturn nounwind
  unreachable

if.end27:                                         ; preds = %if.then24
  br label %if.end32

if.else28:                                        ; preds = %if.end19
  %8 = load i32* %set.addr, align 4
  %tobool29 = icmp ne i32 %8, 0
  br i1 %tobool29, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.else28
  call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %if.else28
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.end27
  %9 = load i16* %s.addr, align 2
  %conv33 = zext i16 %9 to i32
  %and34 = and i32 %conv33, 32768
  %cmp35 = icmp ne i32 %and34, 32768
  br i1 %cmp35, label %if.then37, label %if.else41

if.then37:                                        ; preds = %if.end32
  %10 = load i32* %set.addr, align 4
  %tobool38 = icmp ne i32 %10, 0
  br i1 %tobool38, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.then37
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.then37
  br label %if.end45

if.else41:                                        ; preds = %if.end32
  %11 = load i32* %set.addr, align 4
  %tobool42 = icmp ne i32 %11, 0
  br i1 %tobool42, label %if.end44, label %if.then43

if.then43:                                        ; preds = %if.else41
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.else41
  br label %if.end45

if.end45:                                         ; preds = %if.end44, %if.end40
  ret void
}

define void @test5(i32 %i, i32 %set) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %set.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %set, i32* %set.addr, align 4
  %0 = load i32* %i.addr, align 4
  %and = and i32 %0, -2147483648
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end5

if.else:                                          ; preds = %entry
  %2 = load i32* %set.addr, align 4
  %tobool2 = icmp ne i32 %2, 0
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.else
  br label %if.end5

if.end5:                                          ; preds = %if.end4, %if.end
  %3 = load i32* %i.addr, align 4
  %and6 = and i32 %3, -2147483648
  %cmp7 = icmp ne i32 %and6, 0
  br i1 %cmp7, label %if.then8, label %if.else12

if.then8:                                         ; preds = %if.end5
  %4 = load i32* %set.addr, align 4
  %tobool9 = icmp ne i32 %4, 0
  br i1 %tobool9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.then8
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.then8
  br label %if.end16

if.else12:                                        ; preds = %if.end5
  %5 = load i32* %set.addr, align 4
  %tobool13 = icmp ne i32 %5, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.else12
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.else12
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.end11
  %6 = load i32* %i.addr, align 4
  %and17 = and i32 %6, -2147483648
  %cmp18 = icmp eq i32 %and17, -2147483648
  br i1 %cmp18, label %if.then19, label %if.else23

if.then19:                                        ; preds = %if.end16
  %7 = load i32* %set.addr, align 4
  %tobool20 = icmp ne i32 %7, 0
  br i1 %tobool20, label %if.end22, label %if.then21

if.then21:                                        ; preds = %if.then19
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.then19
  br label %if.end27

if.else23:                                        ; preds = %if.end16
  %8 = load i32* %set.addr, align 4
  %tobool24 = icmp ne i32 %8, 0
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.else23
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.else23
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end22
  %9 = load i32* %i.addr, align 4
  %and28 = and i32 %9, -2147483648
  %cmp29 = icmp ne i32 %and28, -2147483648
  br i1 %cmp29, label %if.then30, label %if.else34

if.then30:                                        ; preds = %if.end27
  %10 = load i32* %set.addr, align 4
  %tobool31 = icmp ne i32 %10, 0
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.then30
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.then30
  br label %if.end38

if.else34:                                        ; preds = %if.end27
  %11 = load i32* %set.addr, align 4
  %tobool35 = icmp ne i32 %11, 0
  br i1 %tobool35, label %if.end37, label %if.then36

if.then36:                                        ; preds = %if.else34
  call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.else34
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.end33
  ret void
}

define void @test6(i32 %i, i32 %set) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %set.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  store i32 %set, i32* %set.addr, align 4
  %0 = load i32* %i.addr, align 4
  %and = and i32 %0, -2147483648
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end5

if.else:                                          ; preds = %entry
  %2 = load i32* %set.addr, align 4
  %tobool2 = icmp ne i32 %2, 0
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.else
  br label %if.end5

if.end5:                                          ; preds = %if.end4, %if.end
  %3 = load i32* %i.addr, align 4
  %and6 = and i32 %3, -2147483648
  %cmp7 = icmp ne i32 %and6, 0
  br i1 %cmp7, label %if.then8, label %if.else12

if.then8:                                         ; preds = %if.end5
  %4 = load i32* %set.addr, align 4
  %tobool9 = icmp ne i32 %4, 0
  br i1 %tobool9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.then8
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.then8
  br label %if.end16

if.else12:                                        ; preds = %if.end5
  %5 = load i32* %set.addr, align 4
  %tobool13 = icmp ne i32 %5, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.else12
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.else12
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.end11
  %6 = load i32* %i.addr, align 4
  %and17 = and i32 %6, -2147483648
  %cmp18 = icmp eq i32 %and17, -2147483648
  br i1 %cmp18, label %if.then19, label %if.else23

if.then19:                                        ; preds = %if.end16
  %7 = load i32* %set.addr, align 4
  %tobool20 = icmp ne i32 %7, 0
  br i1 %tobool20, label %if.end22, label %if.then21

if.then21:                                        ; preds = %if.then19
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.then19
  br label %if.end27

if.else23:                                        ; preds = %if.end16
  %8 = load i32* %set.addr, align 4
  %tobool24 = icmp ne i32 %8, 0
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.else23
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.else23
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end22
  %9 = load i32* %i.addr, align 4
  %and28 = and i32 %9, -2147483648
  %cmp29 = icmp ne i32 %and28, -2147483648
  br i1 %cmp29, label %if.then30, label %if.else34

if.then30:                                        ; preds = %if.end27
  %10 = load i32* %set.addr, align 4
  %tobool31 = icmp ne i32 %10, 0
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.then30
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.then30
  br label %if.end38

if.else34:                                        ; preds = %if.end27
  %11 = load i32* %set.addr, align 4
  %tobool35 = icmp ne i32 %11, 0
  br i1 %tobool35, label %if.end37, label %if.then36

if.then36:                                        ; preds = %if.else34
  call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.else34
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.end33
  ret void
}

define void @test7(i64 %l, i32 %set) nounwind uwtable {
entry:
  %l.addr = alloca i64, align 8
  %set.addr = alloca i32, align 4
  store i64 %l, i64* %l.addr, align 8
  store i32 %set, i32* %set.addr, align 4
  %0 = load i64* %l.addr, align 8
  %and = and i64 %0, -9223372036854775808
  %cmp = icmp eq i64 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end5

if.else:                                          ; preds = %entry
  %2 = load i32* %set.addr, align 4
  %tobool2 = icmp ne i32 %2, 0
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.else
  br label %if.end5

if.end5:                                          ; preds = %if.end4, %if.end
  %3 = load i64* %l.addr, align 8
  %and6 = and i64 %3, -9223372036854775808
  %cmp7 = icmp ne i64 %and6, 0
  br i1 %cmp7, label %if.then8, label %if.else12

if.then8:                                         ; preds = %if.end5
  %4 = load i32* %set.addr, align 4
  %tobool9 = icmp ne i32 %4, 0
  br i1 %tobool9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.then8
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.then8
  br label %if.end16

if.else12:                                        ; preds = %if.end5
  %5 = load i32* %set.addr, align 4
  %tobool13 = icmp ne i32 %5, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.else12
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.else12
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.end11
  %6 = load i64* %l.addr, align 8
  %and17 = and i64 %6, -9223372036854775808
  %cmp18 = icmp eq i64 %and17, -9223372036854775808
  br i1 %cmp18, label %if.then19, label %if.else23

if.then19:                                        ; preds = %if.end16
  %7 = load i32* %set.addr, align 4
  %tobool20 = icmp ne i32 %7, 0
  br i1 %tobool20, label %if.end22, label %if.then21

if.then21:                                        ; preds = %if.then19
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.then19
  br label %if.end27

if.else23:                                        ; preds = %if.end16
  %8 = load i32* %set.addr, align 4
  %tobool24 = icmp ne i32 %8, 0
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.else23
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.else23
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end22
  %9 = load i64* %l.addr, align 8
  %and28 = and i64 %9, -9223372036854775808
  %cmp29 = icmp ne i64 %and28, -9223372036854775808
  br i1 %cmp29, label %if.then30, label %if.else34

if.then30:                                        ; preds = %if.end27
  %10 = load i32* %set.addr, align 4
  %tobool31 = icmp ne i32 %10, 0
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.then30
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.then30
  br label %if.end38

if.else34:                                        ; preds = %if.end27
  %11 = load i32* %set.addr, align 4
  %tobool35 = icmp ne i32 %11, 0
  br i1 %tobool35, label %if.end37, label %if.then36

if.then36:                                        ; preds = %if.else34
  call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.else34
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.end33
  ret void
}

define void @test8(i64 %l, i32 %set) nounwind uwtable {
entry:
  %l.addr = alloca i64, align 8
  %set.addr = alloca i32, align 4
  store i64 %l, i64* %l.addr, align 8
  store i32 %set, i32* %set.addr, align 4
  %0 = load i64* %l.addr, align 8
  %and = and i64 %0, -9223372036854775808
  %cmp = icmp eq i64 %and, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32* %set.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then1, label %if.end

if.then1:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  br label %if.end5

if.else:                                          ; preds = %entry
  %2 = load i32* %set.addr, align 4
  %tobool2 = icmp ne i32 %2, 0
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.else
  br label %if.end5

if.end5:                                          ; preds = %if.end4, %if.end
  %3 = load i64* %l.addr, align 8
  %and6 = and i64 %3, -9223372036854775808
  %cmp7 = icmp ne i64 %and6, 0
  br i1 %cmp7, label %if.then8, label %if.else12

if.then8:                                         ; preds = %if.end5
  %4 = load i32* %set.addr, align 4
  %tobool9 = icmp ne i32 %4, 0
  br i1 %tobool9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.then8
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.then8
  br label %if.end16

if.else12:                                        ; preds = %if.end5
  %5 = load i32* %set.addr, align 4
  %tobool13 = icmp ne i32 %5, 0
  br i1 %tobool13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.else12
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.else12
  br label %if.end16

if.end16:                                         ; preds = %if.end15, %if.end11
  %6 = load i64* %l.addr, align 8
  %and17 = and i64 %6, -9223372036854775808
  %cmp18 = icmp eq i64 %and17, -9223372036854775808
  br i1 %cmp18, label %if.then19, label %if.else23

if.then19:                                        ; preds = %if.end16
  %7 = load i32* %set.addr, align 4
  %tobool20 = icmp ne i32 %7, 0
  br i1 %tobool20, label %if.end22, label %if.then21

if.then21:                                        ; preds = %if.then19
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.then19
  br label %if.end27

if.else23:                                        ; preds = %if.end16
  %8 = load i32* %set.addr, align 4
  %tobool24 = icmp ne i32 %8, 0
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.else23
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.else23
  br label %if.end27

if.end27:                                         ; preds = %if.end26, %if.end22
  %9 = load i64* %l.addr, align 8
  %and28 = and i64 %9, -9223372036854775808
  %cmp29 = icmp ne i64 %and28, -9223372036854775808
  br i1 %cmp29, label %if.then30, label %if.else34

if.then30:                                        ; preds = %if.end27
  %10 = load i32* %set.addr, align 4
  %tobool31 = icmp ne i32 %10, 0
  br i1 %tobool31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.then30
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.then30
  br label %if.end38

if.else34:                                        ; preds = %if.end27
  %11 = load i32* %set.addr, align 4
  %tobool35 = icmp ne i32 %11, 0
  br i1 %tobool35, label %if.end37, label %if.then36

if.then36:                                        ; preds = %if.else34
  call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.else34
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.end33
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @test1(i8 signext 0, i32 0)
  call void @test1(i8 signext 127, i32 0)
  call void @test1(i8 signext -128, i32 1)
  call void @test1(i8 signext -1, i32 1)
  call void @test2(i8 zeroext 0, i32 0)
  call void @test2(i8 zeroext 127, i32 0)
  call void @test2(i8 zeroext -128, i32 1)
  call void @test2(i8 zeroext -1, i32 1)
  call void @test3(i16 signext 0, i32 0)
  call void @test3(i16 signext 32767, i32 0)
  call void @test3(i16 signext -32768, i32 1)
  call void @test3(i16 signext -1, i32 1)
  call void @test4(i16 zeroext 0, i32 0)
  call void @test4(i16 zeroext 32767, i32 0)
  call void @test4(i16 zeroext -32768, i32 1)
  call void @test4(i16 zeroext -1, i32 1)
  call void @test5(i32 0, i32 0)
  call void @test5(i32 2147483647, i32 0)
  call void @test5(i32 -2147483648, i32 1)
  call void @test5(i32 -1, i32 1)
  call void @test6(i32 0, i32 0)
  call void @test6(i32 2147483647, i32 0)
  call void @test6(i32 -2147483648, i32 1)
  call void @test6(i32 -1, i32 1)
  call void @test7(i64 0, i32 0)
  call void @test7(i64 9223372036854775807, i32 0)
  call void @test7(i64 -9223372036854775808, i32 1)
  call void @test7(i64 -1, i32 1)
  call void @test8(i64 0, i32 0)
  call void @test8(i64 9223372036854775807, i32 0)
  call void @test8(i64 -9223372036854775808, i32 1)
  call void @test8(i64 -1, i32 1)
  ret i32 0
}
