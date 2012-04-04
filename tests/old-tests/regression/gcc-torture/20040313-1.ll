; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20040313-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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
  %t = alloca [1025 x i32], align 16
  %d = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = bitcast [1025 x i32]* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 4100, i32 16, i1 false)
  %0 = bitcast i8* %tmp to [1025 x i32]*
  %1 = getelementptr [1025 x i32]* %0, i32 0, i32 0
  store i32 1024, i32* %1
  store i32 0, i32* %d, align 4
  %tmp2 = load i32* %d, align 4
  %idxprom = sext i32 %tmp2 to i64
  %arrayidx = getelementptr inbounds [1025 x i32]* %t, i32 0, i64 %idxprom
  %tmp3 = load i32* %arrayidx, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* %arrayidx, align 4
  store i32 %tmp3, i32* %d, align 4
  %arrayidx4 = getelementptr inbounds [1025 x i32]* %t, i32 0, i64 0
  %tmp5 = load i32* %arrayidx4, align 4
  %cmp = icmp ne i32 %tmp5, 1025
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp6 = load i32* %d, align 4
  %cmp7 = icmp ne i32 %tmp6, 1024
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
