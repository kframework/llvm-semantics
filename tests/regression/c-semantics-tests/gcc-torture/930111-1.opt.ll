; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930111-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

define i32 @wwrite(i64 %i) nounwind uwtable readnone {
entry:
  switch i64 %i, label %sw.default [
    i64 3, label %return
    i64 10, label %return
    i64 23, label %return
    i64 28, label %return
    i64 47, label %return
  ]

sw.default:                                       ; preds = %entry
  br label %return

return:                                           ; preds = %entry, %entry, %entry, %entry, %entry, %sw.default
  %retval.0 = phi i32 [ 123, %sw.default ], [ 0, %entry ], [ 0, %entry ], [ 0, %entry ], [ 0, %entry ], [ 0, %entry ]
  ret i32 %retval.0
}
