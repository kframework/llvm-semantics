; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr23941.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@d = global double 0x3800000000000000, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca double, align 8
  store i32 0, i32* %retval
  store double 0x3800000000000000, double* %x, align 8
  %0 = load double* %x, align 8
  %1 = load double* @d, align 8
  %cmp = fcmp une double %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
