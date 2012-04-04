; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021010-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @sub() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %dummy = alloca i32, align 4
  %a = alloca i32, align 4
  store i32 0, i32* %dummy, align 4
  store i32 16, i32* %a, align 4
  %0 = load i32* %a, align 4
  %div = sdiv i32 %0, 2147483647
  %div1 = sdiv i32 %div, 16
  %cmp = icmp eq i32 %div1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %1 = load i32* %a, align 4
  %div2 = sdiv i32 %1, 2147483647
  %div3 = sdiv i32 %div2, 16
  store i32 %div3, i32* %retval
  br label %return

return:                                           ; preds = %if.else, %if.then
  %2 = load i32* %retval
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @sub()
  %cmp = icmp ne i32 %call, 0
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
