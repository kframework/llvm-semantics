; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/higherOrder.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str, i64 0, i64 0), i32 15) nounwind
  ret i32 0
}

define i32 @fold(i32* %arr, i32 %length, i32 %start, i32 (i32, i32)* %f) nounwind uwtable {
entry:
  %cmp2 = icmp sgt i32 %length, 0
  br i1 %cmp2, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %tmp = zext i32 %length to i64
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvar = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next, %for.body ]
  %tmp1013 = phi i32 [ %start, %for.body.lr.ph ], [ %call, %for.body ]
  %add.ptr = getelementptr i32* %arr, i64 %indvar
  %tmp8 = load i32* %add.ptr, align 4
  %call = tail call i32 %f(i32 %tmp1013, i32 %tmp8) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %tmp101.lcssa = phi i32 [ %start, %entry ], [ %call, %for.body ]
  ret i32 %tmp101.lcssa
}

define i32 @sum(i32 %x, i32 %y) nounwind uwtable readnone {
entry:
  %add = add nsw i32 %y, %x
  ret i32 %add
}

declare i32 @printf(i8* nocapture, ...) nounwind
