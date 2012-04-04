; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20070212-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %k, i32 %i1, i32 %j1) nounwind uwtable {
entry:
  %k.addr = alloca i32, align 4
  %i1.addr = alloca i32, align 4
  %j1.addr = alloca i32, align 4
  %f1 = alloca i32*, align 8
  store i32 %k, i32* %k.addr, align 4
  store i32 %i1, i32* %i1.addr, align 4
  store i32 %j1, i32* %j1.addr, align 4
  %0 = load i32* %k.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32* %i1.addr, i32** %f1, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  store i32* %j1.addr, i32** %f1, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  store i32 0, i32* %i1.addr, align 4
  %1 = load i32** %f1, align 8
  %2 = load i32* %1, align 4
  ret i32 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f(i32 1, i32 1, i32 2)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
