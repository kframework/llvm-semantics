; ModuleID = '/home/david/src/c-semantics/tests/cil/test56.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i16 -15200, align 2
@b = global i16 1995, align 2
@.str = private unnamed_addr constant [16 x i8] c"hello world %d\0A\00", align 1

define i32 @sum() nounwind uwtable {
entry:
  %0 = load i16* @a, align 2
  %conv = zext i16 %0 to i32
  %1 = load i16* @b, align 2
  %conv1 = zext i16 %1 to i32
  %add = add nsw i32 %conv, %conv1
  ret i32 %add
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @sum()
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i32 %call)
  ret i32 0
}

declare i32 @printf(i8*, ...)
