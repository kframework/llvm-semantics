; ModuleID = '/home/david/src/c-semantics/tests/integration/euclid.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c".\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @euclidean_gcd(i32 %a, i32 %b) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %t = alloca i32, align 4
  %m = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load i32* %b.addr, align 4
  %1 = load i32* %a.addr, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i32* %a.addr, align 4
  store i32 %2, i32* %t, align 4
  %3 = load i32* %b.addr, align 4
  store i32 %3, i32* %a.addr, align 4
  %4 = load i32* %t, align 4
  store i32 %4, i32* %b.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  br label %while.cond

while.cond:                                       ; preds = %while.body, %if.end
  %5 = load i32* %b.addr, align 4
  %cmp1 = icmp ne i32 %5, 0
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  %6 = load i32* %a.addr, align 4
  %7 = load i32* %b.addr, align 4
  %rem = srem i32 %6, %7
  store i32 %rem, i32* %m, align 4
  %8 = load i32* %b.addr, align 4
  store i32 %8, i32* %a.addr, align 4
  %9 = load i32* %m, align 4
  store i32 %9, i32* %b.addr, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %10 = load i32* %a.addr, align 4
  ret i32 %10
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @euclidean_gcd(i32 105537739, i32 78401179)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i32 %call)
  ret i32 0
}
