; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020225-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @foo(i64 %base, i32 %val) nounwind uwtable {
entry:
  %base.addr = alloca i64, align 8
  %val.addr = alloca i32, align 4
  store i64 %base, i64* %base.addr, align 8
  store i32 %val, i32* %val.addr, align 4
  %0 = load i64* %base.addr, align 8
  %1 = load i32* %val.addr, align 4
  %and = and i32 %1, -2147483647
  %conv = zext i32 %and to i64
  %add = add i64 %0, %conv
  ret i64 %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @foo(i64 0, i32 268435440)
  %cmp = icmp ne i64 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
