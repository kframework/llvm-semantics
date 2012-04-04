; ModuleID = '/home/david/src/c-semantics/tests/cil/test26.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@s = global [4 x i8] c"fun\00", align 1
@.str = private unnamed_addr constant [22 x i8] c"hello world %d %d %d\0A\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i8* getelementptr inbounds ([4 x i8]* @s, i32 0, i64 0), align 1
  %conv = sext i8 %0 to i32
  %1 = load i8* getelementptr inbounds ([4 x i8]* @s, i32 0, i64 1), align 1
  %conv1 = sext i8 %1 to i32
  %2 = load i8* getelementptr inbounds ([4 x i8]* @s, i32 0, i64 3), align 1
  %conv2 = sext i8 %2 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %conv, i32 %conv1, i32 %conv2)
  ret i32 0
}

declare i32 @printf(i8*, ...)
