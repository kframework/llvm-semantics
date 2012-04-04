; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20040307-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i8, [3 x i8] }

@main.sdata = internal unnamed_addr constant %struct.anon { i8 1, [3 x i8] undef }, align 4

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
  %b = alloca i32, align 4
  %sdata = alloca %struct.anon, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %b, align 4
  %tmp = bitcast %struct.anon* %sdata to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* getelementptr inbounds (%struct.anon* @main.sdata, i32 0, i32 0), i64 4, i32 4, i1 false)
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = bitcast %struct.anon* %sdata to i32*
  %1 = load i32* %0, align 4
  %bf.clear = and i32 %1, 1
  %dec = add i32 %bf.clear, -1
  %bf.value = and i32 %dec, 1
  %2 = bitcast %struct.anon* %sdata to i32*
  %3 = and i32 %bf.value, 1
  %4 = load i32* %2, align 4
  %5 = and i32 %4, -2
  %6 = or i32 %5, %3
  store i32 %6, i32* %2, align 4
  %cmp = icmp ugt i32 %bf.clear, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp1 = load i32* %b, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* %b, align 4
  %tmp2 = load i32* %b, align 4
  %cmp3 = icmp sgt i32 %tmp2, 100
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  %tmp4 = load i32* %b, align 4
  %cmp5 = icmp ne i32 %tmp4, 1
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %while.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %while.end
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
