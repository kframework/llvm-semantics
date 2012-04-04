; ModuleID = '/home/david/src/c-semantics/tests/integration/factorial.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %fact = alloca i32, align 4
  %factorial = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 10, i32* %n, align 4
  %0 = load i32* %n, align 4
  %call = call i32 @factorial(i32 %0)
  store i32 %call, i32* %fact, align 4
  %1 = load i32* %fact, align 4
  store i32 %1, i32* %factorial, align 4
  %2 = load i32* %factorial, align 4
  ret i32 %2
}

define i32 @factorial(i32 %n) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n.addr = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %0 = load i32* %n.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* %n.addr, align 4
  %cmp1 = icmp eq i32 %1, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i32* %n.addr, align 4
  %3 = load i32* %n.addr, align 4
  %sub = sub nsw i32 %3, 1
  %call = call i32 @factorial(i32 %sub)
  %mul = mul nsw i32 %2, %call
  store i32 %mul, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32* %retval
  ret i32 %4
}
