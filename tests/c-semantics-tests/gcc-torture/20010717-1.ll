; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010717-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %u = alloca i64, align 8
  %r1 = alloca i64, align 8
  %r2 = alloca i64, align 8
  store i32 0, i32* %retval
  store i32 -16, i32* %i, align 4
  store i32 1, i32* %j, align 4
  %0 = load i32* %i, align 4
  %1 = load i32* %j, align 4
  %add = add nsw i32 %0, %1
  %conv = sext i32 %add to i64
  store i64 %conv, i64* %u, align 8
  %2 = load i64* %u, align 8
  %shr = lshr i64 %2, 1
  store i64 %shr, i64* %r1, align 8
  %3 = load i32* %i, align 4
  %4 = load i32* %j, align 4
  %add1 = add nsw i32 %3, %4
  %conv2 = sext i32 %add1 to i64
  %shr3 = lshr i64 %conv2, 1
  store i64 %shr3, i64* %r2, align 8
  %5 = load i64* %r1, align 8
  %6 = load i64* %r2, align 8
  %cmp = icmp ne i64 %5, %6
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
