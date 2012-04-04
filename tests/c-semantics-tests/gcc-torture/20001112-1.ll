; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001112-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 1, i64* %i, align 8
  %0 = load i64* %i, align 8
  %mul = mul nsw i64 %0, 2
  %add = add nsw i64 %mul, 1
  store i64 %add, i64* %i, align 8
  %1 = load i64* %i, align 8
  %cmp = icmp ne i64 %1, 3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
