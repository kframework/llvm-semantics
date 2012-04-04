; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931102-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %x) nounwind uwtable readnone {
entry:
  %and10 = and i32 %x, 1
  %cmp11 = icmp eq i32 %and10, 0
  br i1 %cmp11, label %while.body, label %while.end

while.body:                                       ; preds = %entry, %while.body
  %num.013 = phi i32 [ %inc, %while.body ], [ 0, %entry ]
  %reg.0.1.0.in12 = phi i32 [ %shr, %while.body ], [ %x, %entry ]
  %sext = shl i32 %reg.0.1.0.in12, 24
  %inc = add nsw i32 %num.013, 1
  %shr = ashr i32 %sext, 25
  %and = and i32 %shr, 1
  %cmp = icmp eq i32 %and, 0
  br i1 %cmp, label %while.body, label %while.end

while.end:                                        ; preds = %while.body, %entry
  %num.0.lcssa = phi i32 [ 0, %entry ], [ %inc, %while.body ]
  ret i32 %num.0.lcssa
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
