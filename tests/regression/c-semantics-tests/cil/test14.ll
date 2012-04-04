; ModuleID = '/home/david/src/c-semantics/tests/cil/test14.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [20 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @f() nounwind uwtable {
entry:
  %b = alloca i32*, align 8
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32* getelementptr inbounds ([20 x i32]* @a, i32 0, i32 0), i32** %b, align 8
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 20
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %mul = mul nsw i32 %1, 2
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i32** %b, align 8
  %arrayidx = getelementptr inbounds i32* %3, i64 %idxprom
  store i32 %mul, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 5, i32* %i, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc6, %for.end
  %5 = load i32* %i, align 4
  %cmp2 = icmp slt i32 %5, 15
  br i1 %cmp2, label %for.body3, label %for.end8

for.body3:                                        ; preds = %for.cond1
  %6 = load i32* %i, align 4
  %idxprom4 = sext i32 %6 to i64
  %arrayidx5 = getelementptr inbounds [20 x i32]* @a, i32 0, i64 %idxprom4
  %7 = load i32* %arrayidx5, align 4
  %8 = load i32* %sum, align 4
  %add = add nsw i32 %8, %7
  store i32 %add, i32* %sum, align 4
  br label %for.inc6

for.inc6:                                         ; preds = %for.body3
  %9 = load i32* %i, align 4
  %inc7 = add nsw i32 %9, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond1

for.end8:                                         ; preds = %for.cond1
  %10 = load i32* %sum, align 4
  ret i32 %10
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %zz = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @f()
  store i32 %call, i32* %zz, align 4
  %0 = load i32* %zz, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %0)
  ret i32 0
}

declare i32 @printf(i8*, ...)
