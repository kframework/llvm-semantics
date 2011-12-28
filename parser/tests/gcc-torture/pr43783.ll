; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr43783.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 32
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %cmp2 = icmp eq i32 %tmp1, 1
  %conv = zext i1 %cmp2 to i32
  %conv3 = sext i32 %conv to i64
  %tmp4 = load i32* %i, align 4
  %idxprom = sext i32 %tmp4 to i64
  %arrayidx = getelementptr inbounds [32 x %struct.UINT192]* @bid_Kx192, i32 0, i64 %idxprom
  %w = getelementptr inbounds %struct.UINT192* %arrayidx, i32 0, i32 0
  %arrayidx5 = getelementptr inbounds [3 x i64]* %w, i32 0, i64 1
  store i64 %conv3, i64* %arrayidx5, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp6 = load i32* %i, align 4
  %inc = add nsw i32 %tmp6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc14, %for.end
  %tmp8 = load i32* %i, align 4
  %cmp9 = icmp slt i32 %tmp8, 32
  br i1 %cmp9, label %for.body11, label %for.end17

for.body11:                                       ; preds = %for.cond7
  %tmp12 = load i64* getelementptr inbounds ([32 x %struct.UINT192]* @bid_Kx192, i32 0, i64 1, i32 0, i64 1), align 8
  %tmp13 = load i64* %x, align 8
  %add = add i64 %tmp13, %tmp12
  store i64 %add, i64* %x, align 8
  br label %for.inc14

for.inc14:                                        ; preds = %for.body11
  %tmp15 = load i32* %i, align 4
  %inc16 = add nsw i32 %tmp15, 1
  store i32 %inc16, i32* %i, align 4
  br label %for.cond7

for.end17:                                        ; preds = %for.cond7
  %tmp18 = load i64* %x, align 8
  %cmp19 = icmp ne i64 %tmp18, 32
  br i1 %cmp19, label %if.then, label %if.end

if.then:                                          ; preds = %for.end17
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %for.end17
  ret i32 0
}

declare void @abort() noreturn
