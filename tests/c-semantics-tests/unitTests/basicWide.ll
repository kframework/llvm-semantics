; ModuleID = '/home/david/src/c-semantics/tests/unitTests/basicWide.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"bar\00", align 1
@.str1 = private unnamed_addr constant [4 x i32] [i32 102, i32 111, i32 111, i32 0], align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %retval1 = alloca i32, align 4
  %c = alloca i32, align 4
  %z = alloca i8*, align 8
  %s = alloca i32*, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %retval1, align 4
  store i32 120, i32* %c, align 4
  %0 = load i32* %c, align 4
  store i32 %0, i32* %retval1, align 4
  store i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8** %z, align 8
  %1 = load i8** %z, align 8
  %arrayidx = getelementptr inbounds i8* %1, i64 0
  %2 = load i8* %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %3 = load i32* %retval1, align 4
  %add = add nsw i32 %3, %conv
  store i32 %add, i32* %retval1, align 4
  store i32* getelementptr inbounds ([4 x i32]* @.str1, i32 0, i32 0), i32** %s, align 8
  %4 = load i32** %s, align 8
  %arrayidx2 = getelementptr inbounds i32* %4, i64 0
  %5 = load i32* %arrayidx2, align 4
  %6 = load i32* %retval1, align 4
  %add3 = add nsw i32 %6, %5
  store i32 %add3, i32* %retval1, align 4
  %7 = load i32* %retval1, align 4
  ret i32 %7
}
