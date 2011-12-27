; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/961213-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.ar = internal unnamed_addr constant [5 x i32] [i32 10, i32 11, i32 12, i32 13, i32 14], align 16

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

define i32 @g(i64* %v, i32 %n, i32* %a, i32 %b) nounwind uwtable {
entry:
  %v.addr = alloca i64*, align 8
  %n.addr = alloca i32, align 4
  %a.addr = alloca i32*, align 8
  %b.addr = alloca i32, align 4
  %cnt = alloca i32, align 4
  store i64* %v, i64** %v.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  store i32* %a, i32** %a.addr, align 8
  store i32 %b, i32* %b.addr, align 4
  %tmp = load i64** %v.addr, align 8
  store i64 0, i64* %tmp
  store i32 0, i32* %cnt, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* %cnt, align 4
  %tmp2 = load i32* %n.addr, align 4
  %cmp = icmp slt i32 %tmp1, %tmp2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i64** %v.addr, align 8
  %tmp4 = load i64* %tmp3
  %tmp5 = load i32* %b.addr, align 4
  %conv = sext i32 %tmp5 to i64
  %mul = mul i64 %tmp4, %conv
  %tmp6 = load i32* %cnt, align 4
  %idxprom = sext i32 %tmp6 to i64
  %tmp7 = load i32** %a.addr, align 8
  %arrayidx = getelementptr inbounds i32* %tmp7, i64 %idxprom
  %tmp8 = load i32* %arrayidx
  %conv9 = zext i32 %tmp8 to i64
  %add = add i64 %mul, %conv9
  %tmp10 = load i64** %v.addr, align 8
  store i64 %add, i64* %tmp10
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp11 = load i32* %cnt, align 4
  %inc = add nsw i32 %tmp11, 1
  store i32 %inc, i32* %cnt, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp12 = load i32* %n.addr, align 4
  ret i32 %tmp12
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %res = alloca i32, align 4
  %ar = alloca [5 x i32], align 16
  %v = alloca i64, align 8
  store i32 0, i32* %retval
  %tmp = bitcast [5 x i32]* %ar to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([5 x i32]* @main.ar to i8*), i64 20, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [5 x i32]* %ar, i32 0, i32 0
  %call = call i32 @g(i64* %v, i32 5, i32* %arraydecay, i32 16)
  store i32 %call, i32* %res, align 4
  %tmp2 = load i64* %v, align 8
  %cmp = icmp ne i64 %tmp2, 703710
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
