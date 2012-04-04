; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20090623-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32* null, align 8

define i32 @foo(i32 %y) nounwind uwtable {
entry:
  %y.addr = alloca i32, align 4
  store i32 %y, i32* %y.addr, align 4
  %0 = load i32* %y.addr, align 4
  %1 = load i32** @x, align 8
  store i32 %0, i32* %1, align 4
  %2 = load i32** @x, align 8
  %3 = load i32* %2, align 4
  ret i32 %3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  store i32* %i, i32** @x, align 8
  %call = call i32 @foo(i32 1)
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn
