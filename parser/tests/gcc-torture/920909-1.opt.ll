; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/920909-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %a) nounwind uwtable readnone {
entry:
  switch i32 %a, label %sw.epilog [
    i32 1026, label %sw.bb
    i32 1027, label %sw.bb2
    i32 1028, label %sw.bb5
    i32 1029, label %sw.bb8
    i32 1030, label %return
    i32 1031, label %sw.bb12
  ]

sw.bb:                                            ; preds = %entry
  %add = add nsw i32 %a, 1
  br label %return

sw.bb2:                                           ; preds = %entry
  %add4 = add nsw i32 %a, 2
  br label %return

sw.bb5:                                           ; preds = %entry
  %add7 = add nsw i32 %a, 3
  br label %return

sw.bb8:                                           ; preds = %entry
  %add10 = add nsw i32 %a, 4
  br label %return

sw.bb12:                                          ; preds = %entry
  br label %return

sw.epilog:                                        ; preds = %entry
  br label %return

return:                                           ; preds = %entry, %sw.epilog, %sw.bb12, %sw.bb8, %sw.bb5, %sw.bb2, %sw.bb
  %0 = phi i32 [ 0, %sw.epilog ], [ 4, %sw.bb12 ], [ %add10, %sw.bb8 ], [ %add7, %sw.bb5 ], [ %add4, %sw.bb2 ], [ %add, %sw.bb ], [ 1, %entry ]
  ret i32 %0
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
