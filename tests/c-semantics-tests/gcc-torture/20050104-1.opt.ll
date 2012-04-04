; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050104-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i64 %j) nounwind uwtable {
entry:
  %cmp = icmp sgt i64 %j, 10
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  ret void

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}
