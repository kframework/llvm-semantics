; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/multdi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@mpy_res = common global i64 0, align 8

define i64 @mpy(i64 %a, i64 %b) nounwind uwtable {
entry:
  %a.addr = alloca i64, align 8
  %b.addr = alloca i64, align 8
  store i64 %a, i64* %a.addr, align 8
  store i64 %b, i64* %b.addr, align 8
  %0 = load i64* %a.addr, align 8
  %1 = load i64* %b.addr, align 8
  %mul = mul i64 %0, %1
  ret i64 %mul
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @mpy(i64 1, i64 -1)
  store i64 %call, i64* @mpy_res, align 8
  %0 = load i64* @mpy_res, align 8
  %cmp = icmp ne i64 %0, -1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
