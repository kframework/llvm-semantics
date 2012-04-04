; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr35231.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i32 %bits_per_pixel, i32 %depth) nounwind uwtable noinline {
entry:
  %bits_per_pixel.addr = alloca i32, align 4
  %depth.addr = alloca i32, align 4
  store i32 %bits_per_pixel, i32* %bits_per_pixel.addr, align 4
  store i32 %depth, i32* %depth.addr, align 4
  %0 = load i32* %bits_per_pixel.addr, align 4
  %1 = load i32* %depth.addr, align 4
  %or = or i32 %0, %1
  %cmp = icmp eq i32 %or, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i32* %bits_per_pixel.addr, align 4
  ret i32 %2
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i32 2, i32 0)
  %cmp = icmp ne i32 %call, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}
