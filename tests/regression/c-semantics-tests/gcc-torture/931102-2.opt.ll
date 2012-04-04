; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931102-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %x) nounwind uwtable readnone {
entry:
  %conv = zext i32 %x to i64
  %0 = shl nuw nsw i64 %conv, 16
  %reg.0.tr14 = trunc i64 %0 to i32
  %and15 = and i32 %reg.0.tr14, 65536
  %cmp16 = icmp eq i32 %and15, 0
  br i1 %cmp16, label %while.body.lr.ph, label %while.end

while.body.lr.ph:                                 ; preds = %entry
  %1 = and i64 %0, 4294901760
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %reg.0.tr19 = phi i32 [ %reg.0.tr14, %while.body.lr.ph ], [ %reg.0.tr, %while.body ]
  %num.018 = phi i32 [ 0, %while.body.lr.ph ], [ %inc, %while.body ]
  %reg.017 = phi i64 [ %1, %while.body.lr.ph ], [ %ins, %while.body ]
  %inc = add nsw i32 %num.018, 1
  %shr = ashr i32 %reg.0.tr19, 17
  %conv8 = zext i32 %shr to i64
  %2 = shl nuw nsw i64 %conv8, 16
  %3 = and i64 %2, 4294901760
  %mask = and i64 %reg.017, -4294901761
  %ins = or i64 %3, %mask
  %reg.0.tr = trunc i64 %ins to i32
  %and = and i32 %reg.0.tr, 65536
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
