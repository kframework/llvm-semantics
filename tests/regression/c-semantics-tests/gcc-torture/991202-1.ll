; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991202-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32 0, align 4
@y = common global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 2, i32* @x, align 4
  %0 = load i32* @x, align 4
  store i32 %0, i32* @y, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %1 = load i32* @y, align 4
  store i32 %1, i32* @x, align 4
  %2 = load i32* @y, align 4
  %mul = mul nsw i32 2, %2
  store i32 %mul, i32* @y, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %3 = load i32* @y, align 4
  %4 = load i32* @x, align 4
  %sub = sub nsw i32 %3, %4
  %cmp = icmp sge i32 %sub, 20
  %lnot = xor i1 %cmp, true
  br i1 %lnot, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @exit(i32) noreturn nounwind
