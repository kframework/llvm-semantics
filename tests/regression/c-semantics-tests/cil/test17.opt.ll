; ModuleID = '/home/david/src/c-semantics/tests/cil/test17.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"hello world - %d %d %d %d\0A\00", align 1

define i32 @silly(i32 %w) nounwind uwtable readnone {
entry:
  switch i32 %w, label %sw.epilog [
    i32 11, label %return
    i32 5, label %sw.bb1
    i32 6, label %sw.bb2
  ]

sw.bb1:                                           ; preds = %entry
  br label %sw.bb2

sw.bb2:                                           ; preds = %entry, %sw.bb1
  %a.0 = phi i32 [ 49, %entry ], [ 63, %sw.bb1 ]
  br label %return

sw.epilog:                                        ; preds = %entry
  br label %return

return:                                           ; preds = %entry, %sw.epilog, %sw.bb2
  %retval.0 = phi i32 [ 7, %sw.epilog ], [ %a.0, %sw.bb2 ], [ 22, %entry ]
  ret i32 %retval.0
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([27 x i8]* @.str, i64 0, i64 0), i32 7, i32 22, i32 63, i32 49) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
