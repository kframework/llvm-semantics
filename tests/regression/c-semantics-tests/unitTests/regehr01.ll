; ModuleID = '/home/david/src/c-semantics/tests/unitTests/regehr01.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@z = internal global i32* @x, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@x = internal global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load volatile i32** @z, align 8
  store i32 1, i32* %0, align 4
  %call = call i32 @foo(i32* @x)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call)
  ret i32 0
}

declare i32 @printf(i8*, ...)

define internal i32 @foo(i32* %y) nounwind uwtable {
entry:
  %y.addr = alloca i32*, align 8
  store i32* %y, i32** %y.addr, align 8
  %0 = load i32** %y.addr, align 8
  %1 = load i32* %0, align 4
  ret i32 %1
}
