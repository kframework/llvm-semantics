; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr25125.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define zeroext i16 @f(i16 signext %a) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp sgt i16 %a, 0
  %add = xor i16 %a, -32768
  %retval.0 = select i1 %cmp, i16 0, i16 %add
  ret i16 %retval.0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %call = tail call zeroext i16 @f(i16 signext -32767)
  %cmp = icmp eq i16 %call, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
