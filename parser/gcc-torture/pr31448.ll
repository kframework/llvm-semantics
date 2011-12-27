; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr31448.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct._st = type { [3 x i8], i8, [3 x i8], i8 }

@g.constreg = internal constant [1 x i32] zeroinitializer, align 4
@f.constreg = internal constant [1 x i32] [i32 -16843010], align 4
@next = common global %struct._st* null, align 8

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

define void @g() nounwind uwtable {
entry:
  %next = alloca %struct._st*, align 8
  %nIndx = alloca i32, align 4
  store %struct._st* null, %struct._st** %next, align 8
  store i32 0, i32* %nIndx, align 4
  %tmp = load i32* %nIndx, align 4
  %idxprom = sext i32 %tmp to i64
  %arrayidx = getelementptr inbounds [1 x i32]* @g.constreg, i32 0, i64 %idxprom
  %tmp1 = load i32* %arrayidx, align 4
  %tmp2 = load %struct._st** %next, align 8
  %bf.value = and i32 %tmp1, 16777215
  %0 = shl i32 %bf.value, 8
  %bf.reload.sext = ashr i32 %0, 8
  %1 = bitcast %struct._st* %tmp2 to i32*
  %2 = and i32 %bf.value, 16777215
  %3 = load i32* %1, align 4
  %4 = and i32 %3, -16777216
  %5 = or i32 %4, %2
  store i32 %5, i32* %1, align 4
  ret void
}

define void @f() nounwind uwtable {
entry:
  %nIndx = alloca i32, align 4
  store i32 0, i32* %nIndx, align 4
  %tmp = load i32* %nIndx, align 4
  %idxprom = sext i32 %tmp to i64
  %arrayidx = getelementptr inbounds [1 x i32]* @f.constreg, i32 0, i64 %idxprom
  %tmp1 = load i32* %arrayidx, align 4
  %tmp2 = load %struct._st** @next, align 8
  %bf.value = and i32 %tmp1, 16777215
  %0 = shl i32 %bf.value, 8
  %bf.reload.sext = ashr i32 %0, 8
  %1 = bitcast %struct._st* %tmp2 to i32*
  %2 = and i32 %bf.value, 16777215
  %3 = load i32* %1, align 4
  %4 = and i32 %3, -16777216
  %5 = or i32 %4, %2
  store i32 %5, i32* %1, align 4
  %tmp3 = load i32* %nIndx, align 4
  %idxprom4 = sext i32 %tmp3 to i64
  %arrayidx5 = getelementptr inbounds [1 x i32]* @f.constreg, i32 0, i64 %idxprom4
  %tmp6 = load i32* %arrayidx5, align 4
  %tmp7 = load %struct._st** @next, align 8
  %bf.value8 = and i32 %tmp6, 16777215
  %6 = shl i32 %bf.value8, 8
  %bf.reload.sext9 = ashr i32 %6, 8
  %7 = bitcast %struct._st* %tmp7 to i8*
  %bf.field.offs = getelementptr i8* %7, i32 4
  %8 = bitcast i8* %bf.field.offs to i32*
  %9 = and i32 %bf.value8, 16777215
  %10 = load i32* %8, align 4
  %11 = and i32 %10, -16777216
  %12 = or i32 %11, %9
  store i32 %12, i32* %8, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct._st, align 4
  store i32 0, i32* %retval
  store %struct._st* %a, %struct._st** @next, align 8
  call void @f()
  %tmp = load %struct._st** @next, align 8
  %0 = bitcast %struct._st* %tmp to i32*
  %1 = load i32* %0, align 4
  %bf.clear = and i32 %1, 16777215
  %2 = shl i32 %bf.clear, 8
  %bf.val.sext = ashr i32 %2, 8
  %cmp = icmp ne i32 %bf.val.sext, -65794
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp1 = load %struct._st** @next, align 8
  %3 = bitcast %struct._st* %tmp1 to i8*
  %bf.field.offs = getelementptr i8* %3, i32 4
  %4 = bitcast i8* %bf.field.offs to i32*
  %5 = load i32* %4, align 4
  %bf.clear2 = and i32 %5, 16777215
  %6 = shl i32 %bf.clear2, 8
  %bf.val.sext3 = ashr i32 %6, 8
  %cmp4 = icmp ne i32 %bf.val.sext3, -65794
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
