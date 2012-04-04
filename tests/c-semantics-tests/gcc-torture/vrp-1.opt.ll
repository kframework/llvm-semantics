; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/vrp-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %a) nounwind uwtable readnone {
entry:
  switch i32 %a, label %if.end [
    i32 2, label %if.end3
    i32 -2, label %return
  ]

if.end:                                           ; preds = %entry
  br label %return

if.end3:                                          ; preds = %entry
  br label %return

return:                                           ; preds = %entry, %if.end3, %if.end
  %retval.0 = phi i32 [ 1, %if.end ], [ 1, %if.end3 ], [ 0, %entry ]
  ret i32 %retval.0
}

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
