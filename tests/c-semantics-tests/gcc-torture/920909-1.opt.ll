; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920909-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %a) nounwind uwtable readnone {
entry:
  switch i32 %a, label %sw.epilog [
    i32 1026, label %sw.bb
    i32 1027, label %sw.bb1
    i32 1028, label %sw.bb3
    i32 1029, label %sw.bb5
    i32 1030, label %return
    i32 1031, label %sw.bb8
  ]

sw.bb:                                            ; preds = %entry
  br label %return

sw.bb1:                                           ; preds = %entry
  br label %return

sw.bb3:                                           ; preds = %entry
  br label %return

sw.bb5:                                           ; preds = %entry
  br label %return

sw.bb8:                                           ; preds = %entry
  br label %return

sw.epilog:                                        ; preds = %entry
  br label %return

return:                                           ; preds = %entry, %sw.epilog, %sw.bb8, %sw.bb5, %sw.bb3, %sw.bb1, %sw.bb
  %retval.0 = phi i32 [ 0, %sw.epilog ], [ 4, %sw.bb8 ], [ 1033, %sw.bb5 ], [ 1031, %sw.bb3 ], [ 1029, %sw.bb1 ], [ 1027, %sw.bb ], [ 1, %entry ]
  ret i32 %retval.0
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
