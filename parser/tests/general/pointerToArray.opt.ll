; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/pointerToArray.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f([0 x i32]* %x, i32 %num) nounwind uwtable readonly {
entry:
  %cmp2 = icmp sgt i32 %num, 0
  br i1 %cmp2, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %tmp = zext i32 %num to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvar = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next, %for.body ]
  %tmp713 = phi i32 [ 0, %for.body.lr.ph ], [ %add, %for.body ]
  %arrayidx = getelementptr [0 x i32]* %x, i64 0, i64 %indvar
  %tmp4 = load i32* %arrayidx, align 4
  %add = add nsw i32 %tmp4, %tmp713
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %tmp71.lcssa = phi i32 [ 0, %entry ], [ %add, %for.body ]
  ret i32 %tmp71.lcssa
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
