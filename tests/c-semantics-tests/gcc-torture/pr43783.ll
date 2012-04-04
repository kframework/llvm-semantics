; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr43783.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.UINT192 = type { [3 x i64] }

@bid_Kx192 = common global [32 x %struct.UINT192] zeroinitializer, align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  store i64 0, i64* %x, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 32
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %cmp1 = icmp eq i32 %1, 1
  %conv = zext i1 %cmp1 to i32
  %conv2 = sext i32 %conv to i64
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [32 x %struct.UINT192]* @bid_Kx192, i32 0, i64 %idxprom
  %w = getelementptr inbounds %struct.UINT192* %arrayidx, i32 0, i32 0
  %arrayidx3 = getelementptr inbounds [3 x i64]* %w, i32 0, i64 1
  store i64 %conv2, i64* %arrayidx3, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc8, %for.end
  %4 = load i32* %i, align 4
  %cmp5 = icmp slt i32 %4, 32
  br i1 %cmp5, label %for.body7, label %for.end10

for.body7:                                        ; preds = %for.cond4
  %5 = load i64* getelementptr inbounds ([32 x %struct.UINT192]* @bid_Kx192, i32 0, i64 1, i32 0, i64 1), align 8
  %6 = load i64* %x, align 8
  %add = add i64 %6, %5
  store i64 %add, i64* %x, align 8
  br label %for.inc8

for.inc8:                                         ; preds = %for.body7
  %7 = load i32* %i, align 4
  %inc9 = add nsw i32 %7, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond4

for.end10:                                        ; preds = %for.cond4
  %8 = load i64* %x, align 8
  %cmp11 = icmp ne i64 %8, 32
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.end10
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %for.end10
  ret i32 0
}

declare void @abort() noreturn
