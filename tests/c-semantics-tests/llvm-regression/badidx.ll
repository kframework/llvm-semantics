; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/badidx.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %y = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32* %argc.addr, align 4
  %cmp = icmp eq i32 %0, 2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8** %1, i64 1
  %2 = load i8** %arrayidx, align 8
  %call = call i32 @atoi(i8* %2) nounwind readonly
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 1, %cond.false ]
  store i32 %cond, i32* %n, align 4
  %3 = load i32* %n, align 4
  %conv = sext i32 %3 to i64
  %call1 = call noalias i8* @calloc(i64 %conv, i64 4) nounwind
  %4 = bitcast i8* %call1 to i32*
  store i32* %4, i32** %y, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %cond.end
  %5 = load i32* %i, align 4
  %6 = load i32* %n, align 4
  %cmp2 = icmp slt i32 %5, %6
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i32* %i, align 4
  %8 = load i32* %i, align 4
  %mul = mul nsw i32 %7, %8
  %9 = load i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %10 = load i32** %y, align 8
  %arrayidx4 = getelementptr inbounds i32* %10, i64 %idxprom
  store i32 %mul, i32* %arrayidx4, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i32* %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load i32* %n, align 4
  %sub = sub nsw i32 %12, 1
  %idxprom5 = sext i32 %sub to i64
  %13 = load i32** %y, align 8
  %arrayidx6 = getelementptr inbounds i32* %13, i64 %idxprom5
  %14 = load i32* %arrayidx6, align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %14)
  ret i32 0
}

declare i32 @atoi(i8*) nounwind readonly

declare noalias i8* @calloc(i64, i64) nounwind

declare i32 @printf(i8*, ...)
