; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = internal global [4 x i32] zeroinitializer, align 16
@testit.ir = internal unnamed_addr constant [4 x i32] [i32 0, i32 1, i32 2, i32 3], align 16
@t = internal global i32 0, align 4

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
  call void @testit()
  %tmp = load i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i64 0), align 4
  %cmp = icmp ne i32 %tmp, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp1 = load i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i64 1), align 4
  %cmp2 = icmp ne i32 %tmp1, 3
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %tmp5 = load i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i64 2), align 4
  %cmp6 = icmp ne i32 %tmp5, 2
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %tmp9 = load i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i64 3), align 4
  %cmp10 = icmp ne i32 %tmp9, 1
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

define internal void @testit() nounwind uwtable {
entry:
  %ir = alloca [4 x i32], align 16
  %ix = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %tmp = bitcast [4 x i32]* %ir to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([4 x i32]* @testit.ir to i8*), i64 16, i32 16, i1 false)
  store i32 1, i32* %n, align 4
  store i32 3, i32* %m, align 4
  store i32 1, i32* %ix, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp4 = load i32* %ix, align 4
  %cmp = icmp sle i32 %tmp4, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp5 = load i32* %n, align 4
  %cmp6 = icmp eq i32 %tmp5, 1
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  store i32 4, i32* %m, align 4
  br label %if.end

if.else:                                          ; preds = %for.body
  %tmp7 = load i32* %n, align 4
  %sub = sub nsw i32 %tmp7, 1
  store i32 %sub, i32* %m, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tmp8 = load i32* %n, align 4
  %sub9 = sub nsw i32 %tmp8, 1
  %idxprom = sext i32 %sub9 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* %ir, i32 0, i64 %idxprom
  %tmp10 = load i32* %arrayidx, align 4
  %call = call i32 @ap(i32 %tmp10)
  %tmp11 = load i32* %m, align 4
  store i32 %tmp11, i32* %n, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp12 = load i32* %ix, align 4
  %inc = add nsw i32 %tmp12, 1
  store i32 %inc, i32* %ix, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define internal i32 @ap(i32 %i) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, i32* %i.addr, align 4
  %tmp = load i32* @t, align 4
  %cmp = icmp sgt i32 %tmp, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp1 = load i32* %i.addr, align 4
  %tmp2 = load i32* @t, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* @t, align 4
  %idxprom = sext i32 %tmp2 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* @a, i32 0, i64 %idxprom
  store i32 %tmp1, i32* %arrayidx, align 4
  ret i32 1
}
