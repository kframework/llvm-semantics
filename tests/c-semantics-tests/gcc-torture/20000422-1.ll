; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000422-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@ops = global [13 x i32] [i32 11, i32 12, i32 46, i32 3, i32 2, i32 2, i32 3, i32 2, i32 1, i32 3, i32 2, i32 1, i32 2], align 16
@correct = global [13 x i32] [i32 46, i32 12, i32 11, i32 3, i32 3, i32 3, i32 2, i32 2, i32 2, i32 2, i32 2, i32 1, i32 1], align 16
@num = global i32 13, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %op = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc18, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* @num, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end19

for.body:                                         ; preds = %for.cond
  %2 = load i32* @num, align 4
  %sub = sub nsw i32 %2, 1
  store i32 %sub, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %j, align 4
  %4 = load i32* %i, align 4
  %cmp2 = icmp sgt i32 %3, %4
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %5 = load i32* %j, align 4
  %sub4 = sub nsw i32 %5, 1
  %idxprom = sext i32 %sub4 to i64
  %arrayidx = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom
  %6 = load i32* %arrayidx, align 4
  %7 = load i32* %j, align 4
  %idxprom5 = sext i32 %7 to i64
  %arrayidx6 = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom5
  %8 = load i32* %arrayidx6, align 4
  %cmp7 = icmp slt i32 %6, %8
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %9 = load i32* %j, align 4
  %idxprom8 = sext i32 %9 to i64
  %arrayidx9 = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom8
  %10 = load i32* %arrayidx9, align 4
  store i32 %10, i32* %op, align 4
  %11 = load i32* %j, align 4
  %sub10 = sub nsw i32 %11, 1
  %idxprom11 = sext i32 %sub10 to i64
  %arrayidx12 = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom11
  %12 = load i32* %arrayidx12, align 4
  %13 = load i32* %j, align 4
  %idxprom13 = sext i32 %13 to i64
  %arrayidx14 = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom13
  store i32 %12, i32* %arrayidx14, align 4
  %14 = load i32* %op, align 4
  %15 = load i32* %j, align 4
  %sub15 = sub nsw i32 %15, 1
  %idxprom16 = sext i32 %sub15 to i64
  %arrayidx17 = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom16
  store i32 %14, i32* %arrayidx17, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body3
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %16 = load i32* %j, align 4
  %dec = add nsw i32 %16, -1
  store i32 %dec, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc18

for.inc18:                                        ; preds = %for.end
  %17 = load i32* %i, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end19:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc30, %for.end19
  %18 = load i32* %i, align 4
  %19 = load i32* @num, align 4
  %cmp21 = icmp slt i32 %18, %19
  br i1 %cmp21, label %for.body22, label %for.end32

for.body22:                                       ; preds = %for.cond20
  %20 = load i32* %i, align 4
  %idxprom23 = sext i32 %20 to i64
  %arrayidx24 = getelementptr inbounds [13 x i32]* @ops, i32 0, i64 %idxprom23
  %21 = load i32* %arrayidx24, align 4
  %22 = load i32* %i, align 4
  %idxprom25 = sext i32 %22 to i64
  %arrayidx26 = getelementptr inbounds [13 x i32]* @correct, i32 0, i64 %idxprom25
  %23 = load i32* %arrayidx26, align 4
  %cmp27 = icmp ne i32 %21, %23
  br i1 %cmp27, label %if.then28, label %if.end29

if.then28:                                        ; preds = %for.body22
  call void @abort() noreturn nounwind
  unreachable

if.end29:                                         ; preds = %for.body22
  br label %for.inc30

for.inc30:                                        ; preds = %if.end29
  %24 = load i32* %i, align 4
  %inc31 = add nsw i32 %24, 1
  store i32 %inc31, i32* %i, align 4
  br label %for.cond20

for.end32:                                        ; preds = %for.cond20
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %25 = load i32* %retval
  ret i32 %25
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
