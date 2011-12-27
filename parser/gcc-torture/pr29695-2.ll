; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr29695-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 128, align 4
@b = global i8 -128, align 1
@c = global i64 2147483648, align 8
@d = global i32 -2147483648, align 4

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @f1() nounwind uwtable {
entry:
  %tmp = load i32* @a, align 4
  %and = and i32 %tmp, 128
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i32 128, i32 0
  ret i32 %cond
}

define i32 @f2() nounwind uwtable {
entry:
  %tmp = load i8* @b, align 1
  %conv = zext i8 %tmp to i32
  %and = and i32 %conv, 128
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i32 128, i32 0
  ret i32 %cond
}

define i32 @f3() nounwind uwtable {
entry:
  %tmp = load i8* @b, align 1
  %conv = zext i8 %tmp to i32
  %and = and i32 %conv, 128
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i32 896, i32 0
  ret i32 %cond
}

define i32 @f4() nounwind uwtable {
entry:
  %tmp = load i8* @b, align 1
  %conv = zext i8 %tmp to i32
  %and = and i32 %conv, 128
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i32 -128, i32 0
  ret i32 %cond
}

define i64 @f5() nounwind uwtable {
entry:
  %tmp = load i64* @c, align 8
  %and = and i64 %tmp, 2147483648
  %tobool = icmp ne i64 %and, 0
  %cond = select i1 %tobool, i64 2147483648, i64 0
  ret i64 %cond
}

define i64 @f6() nounwind uwtable {
entry:
  %tmp = load i32* @d, align 4
  %and = and i32 %tmp, -2147483648
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i64 2147483648, i64 0
  ret i64 %cond
}

define i64 @f7() nounwind uwtable {
entry:
  %tmp = load i32* @d, align 4
  %and = and i32 %tmp, -2147483648
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i64 15032385536, i64 0
  ret i64 %cond
}

define i64 @f8() nounwind uwtable {
entry:
  %tmp = load i32* @d, align 4
  %and = and i32 %tmp, -2147483648
  %tobool = icmp ne i32 %and, 0
  %cond = select i1 %tobool, i64 -2147483648, i64 0
  ret i64 %cond
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f1()
  %cmp = icmp ne i32 %call, 128
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @f2()
  %cmp2 = icmp ne i32 %call1, 128
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @f3()
  %cmp6 = icmp ne i32 %call5, 896
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 @f4()
  %cmp10 = icmp ne i32 %call9, -128
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i64 @f5()
  %cmp14 = icmp ne i64 %call13, 2147483648
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call i64 @f6()
  %cmp18 = icmp ne i64 %call17, 2147483648
  br i1 %cmp18, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call i64 @f7()
  %cmp22 = icmp ne i64 %call21, 15032385536
  br i1 %cmp22, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call i64 @f8()
  %cmp26 = icmp ne i64 %call25, -2147483648
  br i1 %cmp26, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  ret i32 0
}

declare void @abort() noreturn nounwind
