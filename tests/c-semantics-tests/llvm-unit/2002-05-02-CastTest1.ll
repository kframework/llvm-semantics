; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-05-02-CastTest1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [14 x i8] c"bs0  = %d %d\0A\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %c0 = alloca i8, align 1
  %c1 = alloca i8, align 1
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i8 -1, i8* %c0, align 1
  store i8 -1, i8* %c1, align 1
  %0 = load i8* %c0, align 1
  %conv = sext i8 %0 to i32
  %1 = load i8* %c1, align 1
  %conv1 = zext i8 %1 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %conv1)
  ret i32 0
}

declare i32 @printf(i8*, ...)
