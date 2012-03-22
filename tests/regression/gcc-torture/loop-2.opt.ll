; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [2 x i32] zeroinitializer, align 4

define void @f(i32 %b) nounwind uwtable {
entry:
  %cmp1 = icmp eq i32 %b, 0
  br i1 %cmp1, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %tmp = zext i32 %b to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvar = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next, %for.body ]
  %arrayidx = getelementptr [2 x i32]* @a, i64 0, i64 %indvar
  %tmp3 = add i64 %indvar, 4294967294
  %sub = trunc i64 %tmp3 to i32
  store i32 %sub, i32* %arrayidx, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  store i32 -2, i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 0), align 4
  store i32 -1, i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 1), align 4
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
