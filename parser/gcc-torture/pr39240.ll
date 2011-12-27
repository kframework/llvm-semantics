; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr39240.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@l1 = global i64 4294967292, align 8
@l2 = global i64 65532, align 8
@l3 = global i64 252, align 8
@l4 = global i64 -4, align 8
@l5 = global i64 -4, align 8
@l6 = global i64 -4, align 8

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

define i32 @bar1(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %add = add nsw i32 %tmp, 6
  %call = call i32 @foo1(i32 %add)
  ret i32 %call
}

define internal i32 @foo1(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  ret i32 %tmp
}

define zeroext i16 @bar2(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %add = add nsw i32 %tmp, 6
  %call = call signext i16 @foo2(i32 %add)
  ret i16 %call
}

define internal signext i16 @foo2(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %conv = trunc i32 %tmp to i16
  ret i16 %conv
}

define zeroext i8 @bar3(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %add = add nsw i32 %tmp, 6
  %call = call signext i8 @foo3(i32 %add)
  ret i8 %call
}

define internal signext i8 @foo3(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %conv = trunc i32 %tmp to i8
  ret i8 %conv
}

define i32 @bar4(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %add = add nsw i32 %tmp, 6
  %call = call i32 @foo4(i32 %add)
  ret i32 %call
}

define internal i32 @foo4(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  ret i32 %tmp
}

define signext i16 @bar5(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %add = add nsw i32 %tmp, 6
  %call = call zeroext i16 @foo5(i32 %add)
  ret i16 %call
}

define internal zeroext i16 @foo5(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %conv = trunc i32 %tmp to i16
  ret i16 %conv
}

define signext i8 @bar6(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %add = add nsw i32 %tmp, 6
  %call = call zeroext i8 @foo6(i32 %add)
  ret i8 %call
}

define internal zeroext i8 @foo6(i32 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %conv = trunc i32 %tmp to i8
  ret i8 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @bar1(i32 -10)
  %conv = zext i32 %call to i64
  %tmp = volatile load i64* @l1, align 8
  %cmp = icmp ne i64 %conv, %tmp
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call2 = call zeroext i16 @bar2(i32 -10)
  %conv3 = zext i16 %call2 to i64
  %tmp4 = volatile load i64* @l2, align 8
  %cmp5 = icmp ne i64 %conv3, %tmp4
  br i1 %cmp5, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end
  %call9 = call zeroext i8 @bar3(i32 -10)
  %conv10 = zext i8 %call9 to i64
  %tmp11 = volatile load i64* @l3, align 8
  %cmp12 = icmp ne i64 %conv10, %tmp11
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end8
  %call16 = call i32 @bar4(i32 -10)
  %conv17 = sext i32 %call16 to i64
  %tmp18 = volatile load i64* @l4, align 8
  %cmp19 = icmp ne i64 %conv17, %tmp18
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end15
  %call23 = call signext i16 @bar5(i32 -10)
  %conv24 = sext i16 %call23 to i64
  %tmp25 = volatile load i64* @l5, align 8
  %cmp26 = icmp ne i64 %conv24, %tmp25
  br i1 %cmp26, label %if.then28, label %if.end29

if.then28:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %if.end22
  %call30 = call signext i8 @bar6(i32 -10)
  %conv31 = sext i8 %call30 to i64
  %tmp32 = volatile load i64* @l6, align 8
  %cmp33 = icmp ne i64 %conv31, %tmp32
  br i1 %cmp33, label %if.then35, label %if.end36

if.then35:                                        ; preds = %if.end29
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end29
  ret i32 0
}

declare void @abort() noreturn nounwind
