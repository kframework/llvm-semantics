; ModuleID = '/home/david/src/c-semantics/tests/unitTests/fromRegehr.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g = global i32 1, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @func() nounwind uwtable {
entry:
  store i32 2, i32* @g, align 4
  ret i32 3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32* @g, i32** %l, align 8
  %call = call i32 @func()
  %0 = load i32** %l, align 8
  store i32 %call, i32* %0, align 4
  %1 = load i32* @g, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %1)
  ret i32 0
}

declare i32 @printf(i8*, ...)
