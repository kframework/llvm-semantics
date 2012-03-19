; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/testBreakFor.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable readnone {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %storemerge = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %cmp4 = icmp eq i32 %storemerge, 4
  br i1 %cmp4, label %for.end, label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %storemerge, 1
  br label %for.body

for.end:                                          ; preds = %for.body
  ret i32 5
}
