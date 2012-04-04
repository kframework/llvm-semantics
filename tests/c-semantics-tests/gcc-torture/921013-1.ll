; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921013-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.a = private unnamed_addr constant [4 x float] [float 5.000000e+00, float 1.000000e+00, float 3.000000e+00, float 5.000000e+00], align 16
@main.b = private unnamed_addr constant [4 x float] [float 2.000000e+00, float 4.000000e+00, float 3.000000e+00, float 0.000000e+00], align 16

define void @f(i32* %d, float* %x, float* %y, i32 %n) nounwind uwtable {
entry:
  %d.addr = alloca i32*, align 8
  %x.addr = alloca float*, align 8
  %y.addr = alloca float*, align 8
  %n.addr = alloca i32, align 4
  store i32* %d, i32** %d.addr, align 8
  store float* %x, float** %x.addr, align 8
  store float* %y, float** %y.addr, align 8
  store i32 %n, i32* %n.addr, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load i32* %n.addr, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load float** %x.addr, align 8
  %incdec.ptr = getelementptr inbounds float* %1, i32 1
  store float* %incdec.ptr, float** %x.addr, align 8
  %2 = load float* %1, align 4
  %3 = load float** %y.addr, align 8
  %incdec.ptr1 = getelementptr inbounds float* %3, i32 1
  store float* %incdec.ptr1, float** %y.addr, align 8
  %4 = load float* %3, align 4
  %cmp = fcmp oeq float %2, %4
  %conv = zext i1 %cmp to i32
  %5 = load i32** %d.addr, align 8
  %incdec.ptr2 = getelementptr inbounds i32* %5, i32 1
  store i32* %incdec.ptr2, i32** %d.addr, align 8
  store i32 %conv, i32* %5, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %r = alloca [4 x i32], align 16
  %a = alloca [4 x float], align 16
  %b = alloca [4 x float], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = bitcast [4 x float]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([4 x float]* @main.a to i8*), i64 16, i32 16, i1 false)
  %1 = bitcast [4 x float]* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast ([4 x float]* @main.b to i8*), i64 16, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [4 x i32]* %r, i32 0, i32 0
  %arraydecay1 = getelementptr inbounds [4 x float]* %a, i32 0, i32 0
  %arraydecay2 = getelementptr inbounds [4 x float]* %b, i32 0, i32 0
  call void (...)* bitcast (void (i32*, float*, float*, i32)* @f to void (...)*)(i32* %arraydecay, float* %arraydecay1, float* %arraydecay2, i32 4)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32* %i, align 4
  %cmp = icmp slt i32 %2, 4
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [4 x float]* %a, i32 0, i64 %idxprom
  %4 = load float* %arrayidx, align 4
  %5 = load i32* %i, align 4
  %idxprom3 = sext i32 %5 to i64
  %arrayidx4 = getelementptr inbounds [4 x float]* %b, i32 0, i64 %idxprom3
  %6 = load float* %arrayidx4, align 4
  %cmp5 = fcmp oeq float %4, %6
  %conv = zext i1 %cmp5 to i32
  %7 = load i32* %i, align 4
  %idxprom6 = sext i32 %7 to i64
  %arrayidx7 = getelementptr inbounds [4 x i32]* %r, i32 0, i64 %idxprom6
  %8 = load i32* %arrayidx7, align 4
  %cmp8 = icmp ne i32 %conv, %8
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load i32* %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %10 = load i32* %retval
  ret i32 %10
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
