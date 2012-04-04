; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031214-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { double, [2 x i32] }

@g = global %struct.anon { double 0.000000e+00, [2 x i32] [i32 1, i32 2] }, align 8
@k = global i32 0, align 4

define void @b(i32* %j) nounwind uwtable {
entry:
  %j.addr = alloca i32*, align 8
  store i32* %j, i32** %j.addr, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %j, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %j, align 4
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* @k, align 4
  %2 = load i32* %j, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [2 x i32]* getelementptr inbounds (%struct.anon* @g, i32 0, i32 1), i32 0, i64 %idxprom
  %3 = load i32* %arrayidx, align 4
  %cmp1 = icmp sgt i32 %1, %3
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  %4 = load i32* @k, align 4
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %5 = load i32* %j, align 4
  %idxprom2 = sext i32 %5 to i64
  %arrayidx3 = getelementptr inbounds [2 x i32]* getelementptr inbounds (%struct.anon* @g, i32 0, i32 1), i32 0, i64 %idxprom2
  %6 = load i32* %arrayidx3, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %4, %cond.true ], [ %6, %cond.false ]
  store i32 %cond, i32* @k, align 4
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %7 = load i32* %j, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %8 = load i32* @k, align 4
  %inc4 = add nsw i32 %8, 1
  store i32 %inc4, i32* @k, align 4
  call void @b(i32* %j)
  ret i32 0
}
