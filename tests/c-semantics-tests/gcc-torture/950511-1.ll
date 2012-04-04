; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950511-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %xx = alloca i64, align 8
  %x = alloca i64*, align 8
  store i32 0, i32* %retval
  store i64* %xx, i64** %x, align 8
  %0 = load i64** %x, align 8
  store i64 -3, i64* %0, align 8
  %1 = load i64** %x, align 8
  %2 = load i64* %1, align 8
  %3 = load i64** %x, align 8
  %4 = load i64* %3, align 8
  %mul = mul i64 %2, %4
  %5 = load i64** %x, align 8
  store i64 %mul, i64* %5, align 8
  %6 = load i64** %x, align 8
  %7 = load i64* %6, align 8
  %cmp = icmp ne i64 %7, 9
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
