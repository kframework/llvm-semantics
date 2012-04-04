; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000225-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %nResult = alloca i32, align 4
  %b = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %b, align 4
  store i32 -1, i32* %i, align 4
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %0 = load i32* %b, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %do.body
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %do.body
  store i32 0, i32* %nResult, align 4
  br label %if.end

if.end:                                           ; preds = %if.else
  %1 = load i32* %i, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %i, align 4
  %2 = load i32* %i, align 4
  %add = add nsw i32 %2, 2
  %mul = mul nsw i32 %add, 4
  store i32 %mul, i32* %b, align 4
  br label %do.cond

do.cond:                                          ; preds = %if.end
  %3 = load i32* %i, align 4
  %cmp1 = icmp slt i32 %3, 0
  br i1 %cmp1, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
