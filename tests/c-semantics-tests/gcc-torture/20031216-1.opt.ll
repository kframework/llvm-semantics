; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20031216-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @DisplayNumber(i64 %v) nounwind uwtable {
entry:
  %cmp = icmp eq i64 %v, 154
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i64 @ReadNumber() nounwind uwtable readnone {
entry:
  ret i64 10092544
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}
