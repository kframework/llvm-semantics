; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/inst-check.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %m) nounwind uwtable readnone {
entry:
  %cmp1 = icmp sgt i32 %m, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %0 = add i32 %m, -1
  %1 = zext i32 %0 to i33
  %2 = add i32 %m, -2
  %3 = zext i32 %2 to i33
  %4 = mul i33 %1, %3
  %5 = lshr i33 %4, 1
  %6 = trunc i33 %5 to i32
  %7 = add i32 %6, %m
  %8 = add i32 %7, -1
  br label %for.end

for.end:                                          ; preds = %for.body.lr.ph, %entry
  %s.0.lcssa = phi i32 [ %8, %for.body.lr.ph ], [ 0, %entry ]
  ret i32 %s.0.lcssa
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
