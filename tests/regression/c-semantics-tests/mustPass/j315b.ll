; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j315b.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"hi0\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"hi1\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"hi2\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %x, align 4
  %0 = load i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i64 0), align 1
  %conv = sext i8 %0 to i32
  %1 = load i32* %x, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* %x, align 4
  %add = add nsw i32 %conv, %1
  %2 = load i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i64 0), align 1
  %conv1 = sext i8 %2 to i32
  %3 = load i32* %x, align 4
  %inc2 = add nsw i32 %3, 1
  store i32 %inc2, i32* %x, align 4
  %add3 = add nsw i32 %conv1, %3
  %4 = load i8* getelementptr inbounds ([4 x i8]* @.str2, i32 0, i64 0), align 1
  %conv4 = sext i8 %4 to i32
  %add5 = add nsw i32 %add3, %conv4
  ret i32 0
}
