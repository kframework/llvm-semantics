; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr27364.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %number_of_digits_to_use) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %number_of_digits_to_use.addr = alloca i32, align 4
  store i32 %number_of_digits_to_use, i32* %number_of_digits_to_use.addr, align 4
  %0 = load i32* %number_of_digits_to_use.addr, align 4
  %cmp = icmp ugt i32 %0, 1294
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32* %number_of_digits_to_use.addr, align 4
  %mul = mul i32 %1, 3321928
  %div = udiv i32 %mul, 1000000
  %add = add i32 %div, 1
  %div1 = udiv i32 %add, 16
  store i32 %div1, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f(i32 11)
  %cmp = icmp ne i32 %call, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
