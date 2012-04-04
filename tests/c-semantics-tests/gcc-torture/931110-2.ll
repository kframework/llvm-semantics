; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931110-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.a = internal global [2 x i32] [i32 3, i32 4], align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %b = alloca i32*, align 8
  %c = alloca i32, align 4
  store i32 0, i32* %retval
  store i32* getelementptr inbounds ([2 x i32]* @main.a, i32 0, i32 0), i32** %b, align 8
  %0 = load i32** %b, align 8
  %incdec.ptr = getelementptr inbounds i32* %0, i32 1
  store i32* %incdec.ptr, i32** %b, align 8
  %1 = load i32* %0, align 4
  %rem = srem i32 %1, 8
  store i32 %rem, i32* %c, align 4
  %2 = load i32* %c, align 4
  %cmp = icmp ne i32 %2, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
