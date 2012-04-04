; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050104-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i64 %j) nounwind uwtable {
entry:
  %j.addr = alloca i64, align 8
  store i64 %j, i64* %j.addr, align 8
  %0 = load i64* %j.addr, align 8
  %cmp = icmp sgt i64 %0, 10
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i64* %j.addr, align 8
  %call = call i64 @min()
  %cmp1 = icmp slt i64 %1, %call
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i64 10)
  ret i32 0
}

define internal i64 @min() nounwind uwtable {
entry:
  ret i64 -9223372036854775808
}
