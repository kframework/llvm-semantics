; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990604-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b = common global i32 0, align 4

define void @f() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  %0 = load i32* @b, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.then
  %1 = load i32* %i, align 4
  store i32 %1, i32* @b, align 4
  %2 = load i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %do.cond

do.cond:                                          ; preds = %do.body
  %3 = load i32* %i, align 4
  %cmp1 = icmp slt i32 %3, 10
  br i1 %cmp1, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  br label %if.end

if.end:                                           ; preds = %do.end, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @f()
  %0 = load i32* @b, align 4
  %cmp = icmp ne i32 %0, 9
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
