; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr43783.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.UINT192 = type { [3 x i64] }

@bid_Kx192 = common global [32 x %struct.UINT192] zeroinitializer, align 16

define i32 @main() nounwind uwtable {
entry:
  br label %for.body

for.cond7.preheader:                              ; preds = %for.body
  %tmp12 = load i64* getelementptr inbounds ([32 x %struct.UINT192]* @bid_Kx192, i64 0, i64 1, i32 0, i64 1), align 8
  %tmp.mask = and i64 %tmp12, 576460752303423487
  %cmp19 = icmp eq i64 %tmp.mask, 1
  br i1 %cmp19, label %if.end, label %if.then

for.body:                                         ; preds = %for.body, %entry
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %for.body ]
  %arrayidx5 = getelementptr [32 x %struct.UINT192]* @bid_Kx192, i64 0, i64 %indvar, i32 0, i64 1
  %storemerge5 = trunc i64 %indvar to i32
  %cmp2 = icmp eq i32 %storemerge5, 1
  %conv3 = zext i1 %cmp2 to i64
  store i64 %conv3, i64* %arrayidx5, align 8
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 32
  br i1 %exitcond, label %for.cond7.preheader, label %for.body

if.then:                                          ; preds = %for.cond7.preheader
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.cond7.preheader
  ret i32 0
}

declare void @abort() noreturn
