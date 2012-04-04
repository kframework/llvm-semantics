; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000503-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @sub(i32 %a) nounwind uwtable readnone {
entry:
  %sub = add nsw i32 %a, -2
  %cmp = icmp slt i32 %sub, 0
  br i1 %cmp, label %cond.end, label %cond.false

cond.false:                                       ; preds = %entry
  %phitmp = sext i32 %sub to i64
  %phitmp2 = shl nsw i64 %phitmp, 3
  br label %cond.end

cond.end:                                         ; preds = %entry, %cond.false
  %cond = phi i64 [ %phitmp2, %cond.false ], [ 0, %entry ]
  ret i64 %cond
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
