; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/inst-check.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %m) nounwind uwtable readnone {
entry:
  %cmp2 = icmp sgt i32 %m, 0
  br i1 %cmp2, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %tmp = add i32 %m, -1
  %tmp5 = zext i32 %tmp to i33
  %tmp6 = add i32 %m, -2
  %tmp7 = zext i32 %tmp6 to i33
  %tmp8 = mul i33 %tmp5, %tmp7
  %tmp9 = lshr i33 %tmp8, 1
  %tmp10 = trunc i33 %tmp9 to i32
  %tmp11 = add i32 %tmp10, %m
  %tmp12 = add i32 %tmp11, -1
  br label %for.end

for.end:                                          ; preds = %for.body.lr.ph, %entry
  %tmp51.lcssa = phi i32 [ %tmp12, %for.body.lr.ph ], [ 0, %entry ]
  ret i32 %tmp51.lcssa
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
