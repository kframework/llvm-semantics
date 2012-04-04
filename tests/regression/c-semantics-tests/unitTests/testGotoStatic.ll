; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testGotoStatic.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@f.staticInt = internal global i32 0, align 4

define i32 @f(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %retval1 = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  store i32 0, i32* %retval1, align 4
  %0 = load i32* %x.addr, align 4
  %rem = srem i32 %0, 2
  %cmp = icmp eq i32 %rem, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  br label %pastStatic

if.end:                                           ; preds = %entry
  br label %pastStatic

pastStatic:                                       ; preds = %if.end, %if.then
  %1 = load i32* @f.staticInt, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @f.staticInt, align 4
  store i32 %inc, i32* %retval1, align 4
  %2 = load i32* %retval1, align 4
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %retval1, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %call = call i32 @f(i32 %1)
  store i32 %call, i32* %retval1, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %3 = load i32* %retval1, align 4
  ret i32 %3
}
