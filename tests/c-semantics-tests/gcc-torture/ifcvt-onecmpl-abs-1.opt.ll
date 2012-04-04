; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/ifcvt-onecmpl-abs-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %n) nounwind uwtable readnone noinline {
entry:
  %n.lobit = ashr i32 %n, 31
  %neg.n = xor i32 %n.lobit, %n
  ret i32 %neg.n
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @foo(i32 -1)
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn
