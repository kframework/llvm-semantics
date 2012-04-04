; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960801-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f() nounwind uwtable {
entry:
  %l2 = alloca i64, align 8
  %us = alloca i16, align 2
  %ul = alloca i64, align 8
  %s2 = alloca i16, align 2
  store i16 -1, i16* %s2, align 2
  store i64 -1, i64* %l2, align 8
  store i16 -1, i16* %us, align 2
  store i64 65535, i64* %ul, align 8
  %0 = load i64* %ul, align 8
  %conv = trunc i64 %0 to i32
  ret i32 %conv
}

define i64 @g() nounwind uwtable {
entry:
  %l2 = alloca i64, align 8
  %us = alloca i16, align 2
  %ul = alloca i64, align 8
  %s2 = alloca i16, align 2
  store i16 -1, i16* %s2, align 2
  store i64 -1, i64* %l2, align 8
  store i16 -1, i16* %us, align 2
  store i64 65535, i64* %ul, align 8
  %0 = load i64* %ul, align 8
  ret i64 %0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f()
  %cmp = icmp ne i32 %call, 65535
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i64 @g()
  %cmp2 = icmp ne i64 %call1, 65535
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
