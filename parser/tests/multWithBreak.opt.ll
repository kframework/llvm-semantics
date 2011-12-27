; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/multWithBreak.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.arr1 = internal unnamed_addr constant [6 x i32] [i32 1, i32 2, i32 3, i32 0, i32 4, i32 5], align 16

define i32 @main() nounwind uwtable readnone {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %tmp272 = phi i32 [ %mul, %for.inc ], [ 1, %entry ]
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, 6
  br i1 %cmp, label %for.body, label %for.cond13.preheader

for.cond13.preheader:                             ; preds = %for.body, %for.cond
  %tmp273.ph = phi i32 [ %tmp272, %for.cond ], [ 0, %for.body ]
  %add = add nsw i32 %tmp273.ph, 120
  ret i32 %add

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr [6 x i32]* @main.arr1, i64 0, i64 %indvar
  %tmp6 = load i32* %arrayidx, align 4
  %mul = mul nsw i32 %tmp6, %tmp272
  %cmp9 = icmp eq i32 %mul, 0
  br i1 %cmp9, label %for.cond13.preheader, label %for.inc

for.inc:                                          ; preds = %for.body
  %indvar.next = add i64 %indvar, 1
  br label %for.cond
}
