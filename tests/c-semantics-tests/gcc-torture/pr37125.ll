; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr37125.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @func_44(i32 %p_45) nounwind uwtable {
entry:
  %p_45.addr = alloca i32, align 4
  store i32 %p_45, i32* %p_45.addr, align 4
  %0 = load i32* %p_45.addr, align 4
  %mul = mul i32 %0, -9
  %call = call i32 @mod_rhs(i32 -9)
  %rem = urem i32 %mul, %call
  %tobool = icmp ne i32 %rem, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define internal i32 @mod_rhs(i32 %rhs) nounwind uwtable inlinehint {
entry:
  %retval = alloca i32, align 4
  %rhs.addr = alloca i32, align 4
  store i32 %rhs, i32* %rhs.addr, align 4
  %0 = load i32* %rhs.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32* %rhs.addr, align 4
  store i32 %1, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @func_44(i32 2)
  ret i32 0
}
