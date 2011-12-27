; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000403-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@aa = global [1 x i64] [i64 9223372036854771713], align 8
@bb = global [1 x i64] [i64 9223372036854771713], align 8

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = load i64* getelementptr inbounds ([1 x i64]* @aa, i32 0, i32 0)
  %tmp1 = load i64* getelementptr inbounds ([1 x i64]* @bb, i32 0, i32 0)
  %call = call i32 @seqgt(i64 %tmp, i16 zeroext 4096, i64 %tmp1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i64* getelementptr inbounds ([1 x i64]* @aa, i32 0, i32 0)
  %tmp3 = load i64* getelementptr inbounds ([1 x i64]* @bb, i32 0, i32 0)
  %call4 = call i32 @seqgt2(i64 %tmp2, i16 zeroext 4096, i64 %tmp3)
  %tobool5 = icmp ne i32 %call4, 0
  br i1 %tobool5, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define i32 @seqgt(i64 %a, i16 zeroext %win, i64 %b) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  %win.addr = alloca i16, align 2
  %b.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  store i16 %win, i16* %win.addr, align 2
  store i64 %b, i64* %b.addr, align 8
  %tmp = load i64* %a.addr, align 8
  %tmp1 = load i16* %win.addr, align 2
  %conv = zext i16 %tmp1 to i64
  %add = add i64 %tmp, %conv
  %tmp2 = load i64* %b.addr, align 8
  %sub = sub i64 %add, %tmp2
  %cmp = icmp sgt i64 %sub, 0
  %conv3 = zext i1 %cmp to i32
  ret i32 %conv3
}

define i32 @seqgt2(i64 %a, i16 zeroext %win, i64 %b) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  %win.addr = alloca i16, align 2
  %b.addr = alloca i64, align 8
  %l = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  store i16 %win, i16* %win.addr, align 2
  store i64 %b, i64* %b.addr, align 8
  %tmp = load i64* %a.addr, align 8
  %tmp1 = load i16* %win.addr, align 2
  %conv = zext i16 %tmp1 to i64
  %add = add i64 %tmp, %conv
  %tmp2 = load i64* %b.addr, align 8
  %sub = sub i64 %add, %tmp2
  store i64 %sub, i64* %l, align 8
  %tmp3 = load i64* %l, align 8
  %cmp = icmp sgt i64 %tmp3, 0
  %conv4 = zext i1 %cmp to i32
  ret i32 %conv4
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
