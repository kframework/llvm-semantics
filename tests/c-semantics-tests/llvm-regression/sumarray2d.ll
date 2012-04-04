; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/sumarray2d.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"Sum(Array[%d,%d] = %d\0A\00", align 1

define i32 @SumArray([10 x i32]* %Array, i32 %NumI, i32 %NumJ) nounwind uwtable {
entry:
  %Array.addr = alloca [10 x i32]*, align 8
  %NumI.addr = alloca i32, align 4
  %NumJ.addr = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %Result = alloca i32, align 4
  store [10 x i32]* %Array, [10 x i32]** %Array.addr, align 8
  store i32 %NumI, i32* %NumI.addr, align 4
  store i32 %NumJ, i32* %NumJ.addr, align 4
  store i32 0, i32* %Result, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc6, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %NumI.addr, align 4
  %cmp = icmp ult i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end8

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32* %j, align 4
  %3 = load i32* %NumJ.addr, align 4
  %cmp2 = icmp ult i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load i32* %j, align 4
  %idxprom = zext i32 %4 to i64
  %5 = load i32* %i, align 4
  %idxprom4 = zext i32 %5 to i64
  %6 = load [10 x i32]** %Array.addr, align 8
  %arrayidx = getelementptr inbounds [10 x i32]* %6, i64 %idxprom4
  %arrayidx5 = getelementptr inbounds [10 x i32]* %arrayidx, i32 0, i64 %idxprom
  %7 = load i32* %arrayidx5, align 4
  %8 = load i32* %Result, align 4
  %add = add nsw i32 %8, %7
  store i32 %add, i32* %Result, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %9 = load i32* %j, align 4
  %inc = add i32 %9, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc6

for.inc6:                                         ; preds = %for.end
  %10 = load i32* %i, align 4
  %inc7 = add i32 %10, 1
  store i32 %inc7, i32* %i, align 4
  br label %for.cond

for.end8:                                         ; preds = %for.cond
  %11 = load i32* %Result, align 4
  ret i32 %11
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %Array = alloca [10 x [10 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp ult i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %sub = sub i32 0, %1
  %2 = load i32* %i, align 4
  %idxprom = zext i32 %2 to i64
  %3 = load i32* %i, align 4
  %idxprom1 = zext i32 %3 to i64
  %arrayidx = getelementptr inbounds [10 x [10 x i32]]* %Array, i32 0, i64 %idxprom1
  %arrayidx2 = getelementptr inbounds [10 x i32]* %arrayidx, i32 0, i64 %idxprom
  store i32 %sub, i32* %arrayidx2, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4
  %inc = add i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc17, %for.end
  %5 = load i32* %i, align 4
  %cmp4 = icmp ult i32 %5, 10
  br i1 %cmp4, label %for.body5, label %for.end19

for.body5:                                        ; preds = %for.cond3
  store i32 0, i32* %j, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc14, %for.body5
  %6 = load i32* %j, align 4
  %cmp7 = icmp ult i32 %6, 10
  br i1 %cmp7, label %for.body8, label %for.end16

for.body8:                                        ; preds = %for.cond6
  %7 = load i32* %j, align 4
  %8 = load i32* %i, align 4
  %cmp9 = icmp ne i32 %7, %8
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %for.body8
  %9 = load i32* %i, align 4
  %10 = load i32* %j, align 4
  %add = add i32 %9, %10
  %11 = load i32* %j, align 4
  %idxprom10 = zext i32 %11 to i64
  %12 = load i32* %i, align 4
  %idxprom11 = zext i32 %12 to i64
  %arrayidx12 = getelementptr inbounds [10 x [10 x i32]]* %Array, i32 0, i64 %idxprom11
  %arrayidx13 = getelementptr inbounds [10 x i32]* %arrayidx12, i32 0, i64 %idxprom10
  store i32 %add, i32* %arrayidx13, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body8
  br label %for.inc14

for.inc14:                                        ; preds = %if.end
  %13 = load i32* %j, align 4
  %inc15 = add i32 %13, 1
  store i32 %inc15, i32* %j, align 4
  br label %for.cond6

for.end16:                                        ; preds = %for.cond6
  br label %for.inc17

for.inc17:                                        ; preds = %for.end16
  %14 = load i32* %i, align 4
  %inc18 = add i32 %14, 1
  store i32 %inc18, i32* %i, align 4
  br label %for.cond3

for.end19:                                        ; preds = %for.cond3
  %arraydecay = getelementptr inbounds [10 x [10 x i32]]* %Array, i32 0, i32 0
  %call = call i32 @SumArray([10 x i32]* %arraydecay, i32 10, i32 10)
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 10, i32 10, i32 %call)
  ret i32 0
}

declare i32 @printf(i8*, ...)
