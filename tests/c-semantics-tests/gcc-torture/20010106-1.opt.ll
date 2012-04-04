; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010106-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %i) nounwind uwtable {
entry:
  switch i32 %i, label %sw.default [
    i32 -2, label %return
    i32 -1, label %sw.bb1
    i32 0, label %sw.bb2
    i32 1, label %sw.bb3
    i32 2, label %sw.bb4
    i32 3, label %sw.bb5
    i32 4, label %sw.bb6
  ]

sw.bb1:                                           ; preds = %entry
  br label %return

sw.bb2:                                           ; preds = %entry
  br label %return

sw.bb3:                                           ; preds = %entry
  br label %return

sw.bb4:                                           ; preds = %entry
  br label %return

sw.bb5:                                           ; preds = %entry
  br label %return

sw.bb6:                                           ; preds = %entry
  br label %return

sw.default:                                       ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

return:                                           ; preds = %entry, %sw.bb6, %sw.bb5, %sw.bb4, %sw.bb3, %sw.bb2, %sw.bb1
  %retval.0 = phi i32 [ 9, %sw.bb6 ], [ 15, %sw.bb5 ], [ 3, %sw.bb4 ], [ 4, %sw.bb3 ], [ 7, %sw.bb2 ], [ 0, %sw.bb1 ], [ 33, %entry ]
  ret i32 %retval.0
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
