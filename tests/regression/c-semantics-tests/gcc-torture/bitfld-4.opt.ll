; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/bitfld-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global { i8, i8, i8, i8 } { i8 -123, i8 -113, i8 -29, i8 -1 }, align 4

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* bitcast ({ i8, i8, i8, i8 }* @x to i32*), align 4
  %1 = icmp eq i32 %0, -1863803
  br i1 %1, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
