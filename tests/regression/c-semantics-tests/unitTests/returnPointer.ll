; ModuleID = '/home/david/src/c-semantics/tests/unitTests/returnPointer.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [39 x i8] c"BUG: different addresses for p and &x\0A\00", align 1
@.str1 = private unnamed_addr constant [39 x i8] c"BUG: different addresses for q and &p\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %p = alloca i32*, align 8
  %q = alloca i32**, align 8
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  %call = call i32* @f(i32* %x)
  store i32* %call, i32** %p, align 8
  %call1 = call i32** @g(i32** %p)
  store i32** %call1, i32*** %q, align 8
  %0 = load i32** %p, align 8
  %cmp = icmp ne i32* %0, %x
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i32*** %q, align 8
  %cmp3 = icmp ne i32** %1, %p
  br i1 %cmp3, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str1, i32 0, i32 0))
  br label %if.end6

if.end6:                                          ; preds = %if.then4, %if.end
  %2 = load i32* %x, align 4
  ret i32 %2
}

define i32* @f(i32* %x) nounwind uwtable {
entry:
  %x.addr = alloca i32*, align 8
  store i32* %x, i32** %x.addr, align 8
  %0 = load i32** %x.addr, align 8
  %1 = load i32* %0, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %0, align 4
  %2 = load i32** %x.addr, align 8
  ret i32* %2
}

define i32** @g(i32** %x) nounwind uwtable {
entry:
  %x.addr = alloca i32**, align 8
  store i32** %x, i32*** %x.addr, align 8
  %0 = load i32*** %x.addr, align 8
  %1 = load i32** %0, align 8
  %2 = load i32* %1, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %1, align 4
  %3 = load i32*** %x.addr, align 8
  ret i32** %3
}

declare i32 @printf(i8*, ...)
