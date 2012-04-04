; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010224-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@masktab = global [6 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 0], align 2
@psd = global [6 x i16] [i16 50, i16 40, i16 30, i16 20, i16 10, i16 0], align 2
@bndpsd = global [6 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 0], align 2

define void @ba_compute_psd(i16 signext %start) nounwind uwtable {
entry:
  %start.addr = alloca i16, align 2
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %lastbin = alloca i16, align 2
  store i16 %start, i16* %start.addr, align 2
  store i16 4, i16* %lastbin, align 2
  %0 = load i16* %start.addr, align 2
  %conv = sext i16 %0 to i32
  store i32 %conv, i32* %j, align 4
  %1 = load i16* %start.addr, align 2
  %idxprom = sext i16 %1 to i64
  %arrayidx = getelementptr inbounds [6 x i16]* @masktab, i32 0, i64 %idxprom
  %2 = load i16* %arrayidx, align 2
  %conv1 = sext i16 %2 to i32
  store i32 %conv1, i32* %k, align 4
  %3 = load i32* %j, align 4
  %idxprom2 = sext i32 %3 to i64
  %arrayidx3 = getelementptr inbounds [6 x i16]* @psd, i32 0, i64 %idxprom2
  %4 = load i16* %arrayidx3, align 2
  %5 = load i32* %k, align 4
  %idxprom4 = sext i32 %5 to i64
  %arrayidx5 = getelementptr inbounds [6 x i16]* @bndpsd, i32 0, i64 %idxprom4
  store i16 %4, i16* %arrayidx5, align 2
  %6 = load i32* %j, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %j, align 4
  %7 = load i32* %j, align 4
  store i32 %7, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %8 = load i32* %i, align 4
  %9 = load i16* %lastbin, align 2
  %conv6 = sext i16 %9 to i32
  %cmp = icmp slt i32 %8, %conv6
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %10 = load i32* %k, align 4
  %idxprom8 = sext i32 %10 to i64
  %arrayidx9 = getelementptr inbounds [6 x i16]* @bndpsd, i32 0, i64 %idxprom8
  %11 = load i32* %j, align 4
  %idxprom10 = sext i32 %11 to i64
  %arrayidx11 = getelementptr inbounds [6 x i16]* @psd, i32 0, i64 %idxprom10
  %call = call signext i16 @logadd(i16* %arrayidx9, i16* %arrayidx11)
  %12 = load i32* %k, align 4
  %idxprom12 = sext i32 %12 to i64
  %arrayidx13 = getelementptr inbounds [6 x i16]* @bndpsd, i32 0, i64 %idxprom12
  store i16 %call, i16* %arrayidx13, align 2
  %13 = load i32* %j, align 4
  %inc14 = add nsw i32 %13, 1
  store i32 %inc14, i32* %j, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %14 = load i32* %i, align 4
  %inc15 = add nsw i32 %14, 1
  store i32 %inc15, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define signext i16 @logadd(i16* %a, i16* %b) nounwind uwtable {
entry:
  %a.addr = alloca i16*, align 8
  %b.addr = alloca i16*, align 8
  store i16* %a, i16** %a.addr, align 8
  store i16* %b, i16** %b.addr, align 8
  %0 = load i16** %a.addr, align 8
  %1 = load i16* %0, align 2
  %conv = sext i16 %1 to i32
  %2 = load i16** %b.addr, align 8
  %3 = load i16* %2, align 2
  %conv1 = sext i16 %3 to i32
  %add = add nsw i32 %conv, %conv1
  %conv2 = trunc i32 %add to i16
  ret i16 %conv2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  call void @ba_compute_psd(i16 signext 0)
  %0 = load i16* getelementptr inbounds ([6 x i16]* @bndpsd, i32 0, i64 1), align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp ne i32 %conv, 140
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
