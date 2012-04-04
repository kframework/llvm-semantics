; ModuleID = '/home/david/src/c-semantics/tests/unitTests/c1x0605160106.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"**cpp == %c\0A\00", align 1
@.str1 = private unnamed_addr constant [10 x i8] c"*p == %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"c == %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %cpp = alloca i8**, align 8
  %p = alloca i8*, align 8
  %c = alloca i8, align 1
  store i32 0, i32* %retval
  store i8 65, i8* %c, align 1
  store i8** %p, i8*** %cpp, align 8
  %0 = load i8*** %cpp, align 8
  store i8* %c, i8** %0, align 8
  %1 = load i8*** %cpp, align 8
  %2 = load i8** %1, align 8
  %3 = load i8* %2, align 1
  %conv = sext i8 %3 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %4 = load i8** %p, align 8
  store i8 0, i8* %4, align 1
  %5 = load i8** %p, align 8
  %6 = load i8* %5, align 1
  %conv1 = sext i8 %6 to i32
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str1, i32 0, i32 0), i32 %conv1)
  %7 = load i8* %c, align 1
  %conv3 = sext i8 %7 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32 %conv3)
  ret i32 0
}

declare i32 @printf(i8*, ...)
