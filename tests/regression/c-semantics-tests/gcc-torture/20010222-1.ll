; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010222-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [2 x i32] [i32 18, i32 6], align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  %mul = mul nsw i32 -3, %0
  %1 = load i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1), align 4
  %mul1 = mul nsw i32 3, %1
  %sub = sub nsw i32 %mul, %mul1
  %div = sdiv i32 %sub, 12
  store i32 %div, i32* %b, align 4
  %2 = load i32* %b, align 4
  %cmp = icmp ne i32 %2, -6
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
