; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-08-02-CastTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @test(i32 %X) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  %0 = load i32* %X.addr, align 4
  %conv = trunc i32 %0 to i8
  %conv1 = zext i8 %conv to i32
  ret i32 %conv1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test(i32 123456)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %call)
  ret i32 0
}

declare i32 @printf(i8*, ...)
