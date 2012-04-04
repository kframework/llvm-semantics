; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr41917.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 1, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -942519458, i32* %c, align 4
  %0 = load i32* @a, align 4
  %or = or i32 %0, -2
  store i32 %or, i32* %d, align 4
  %1 = load i32* %d, align 4
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32* %c, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %3 = load i32* %c, align 4
  %4 = load i32* %d, align 4
  %rem = urem i32 %3, %4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ %rem, %cond.false ]
  store i32 %cond, i32* %b, align 4
  %5 = load i32* %b, align 4
  %6 = load i32* %c, align 4
  %cmp1 = icmp ne i32 %5, %6
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %cond.end
  ret i32 0
}

declare void @abort() noreturn nounwind
