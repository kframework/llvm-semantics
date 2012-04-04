; ModuleID = '/home/david/src/c-semantics/tests/cil/test48.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fun = type { i32, i32 }

@a = common global [10 x [20 x %struct.fun]] zeroinitializer, align 16
@b = global [20 x %struct.fun]* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i32 0, i32 0), align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @f() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  %sum1 = alloca i32, align 4
  %sum2 = alloca i32, align 4
  store i32 0, i32* %sum1, align 4
  store i32 0, i32* %sum2, align 4
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
  %3 = load [20 x %struct.fun]** @b, align 8
  %arrayidx = getelementptr inbounds [20 x %struct.fun]* %3, i64 1
  %arrayidx1 = getelementptr inbounds [20 x %struct.fun]* %arrayidx, i32 0, i64 %idxprom
  %x = getelementptr inbounds %struct.fun* %arrayidx1, i32 0, i32 0
  store i32 %mul, i32* %x, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 5, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc8, %for.end
  %5 = load i32* %i, align 4
  %cmp3 = icmp slt i32 %5, 15
  br i1 %cmp3, label %for.body4, label %for.end10

for.body4:                                        ; preds = %for.cond2
  %6 = load i32* %i, align 4
  %idxprom5 = sext i32 %6 to i64
  %arrayidx6 = getelementptr inbounds [20 x %struct.fun]* getelementptr inbounds ([10 x [20 x %struct.fun]]* @a, i32 0, i64 1), i32 0, i64 %idxprom5
  %x7 = getelementptr inbounds %struct.fun* %arrayidx6, i32 0, i32 0
  %7 = load i32* %x7, align 4
  %8 = load i32* %sum1, align 4
  %add = add nsw i32 %8, %7
  store i32 %add, i32* %sum1, align 4
  br label %for.inc8

for.inc8:                                         ; preds = %for.body4
  %9 = load i32* %i, align 4
  %inc9 = add nsw i32 %9, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond2

for.end10:                                        ; preds = %for.cond2
  store i32 5, i32* %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc19, %for.end10
  %10 = load i32* %i, align 4
  %cmp12 = icmp slt i32 %10, 15
  br i1 %cmp12, label %for.body13, label %for.end21

for.body13:                                       ; preds = %for.cond11
  %11 = load i32* %i, align 4
  %idxprom14 = sext i32 %11 to i64
  %12 = load [20 x %struct.fun]** @b, align 8
  %arrayidx15 = getelementptr inbounds [20 x %struct.fun]* %12, i64 1
  %arrayidx16 = getelementptr inbounds [20 x %struct.fun]* %arrayidx15, i32 0, i64 %idxprom14
  %x17 = getelementptr inbounds %struct.fun* %arrayidx16, i32 0, i32 0
  %13 = load i32* %x17, align 4
  %14 = load i32* %sum2, align 4
  %add18 = add nsw i32 %14, %13
  store i32 %add18, i32* %sum2, align 4
  br label %for.inc19

for.inc19:                                        ; preds = %for.body13
  %15 = load i32* %i, align 4
  %inc20 = add nsw i32 %15, 1
  store i32 %inc20, i32* %i, align 4
  br label %for.cond11

for.end21:                                        ; preds = %for.cond11
  %16 = load i32* %sum1, align 4
  %17 = load i32* %sum2, align 4
  %cmp22 = icmp eq i32 %16, %17
  %conv = zext i1 %cmp22 to i32
  ret i32 %conv
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
