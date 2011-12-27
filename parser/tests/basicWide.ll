; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/basicWide.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"bar\00", align 1
@.str1 = private unnamed_addr constant [16 x i8] c"f\00\00\00o\00\00\00o\00\00\00\00\00\00\00", align 1

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
  %tmp = load i32* %c, align 4
  store i32 %tmp, i32* %retval1, align 4
  store i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8** %z, align 8
  %tmp3 = load i8** %z, align 8
  %arrayidx = getelementptr inbounds i8* %tmp3, i64 0
  %tmp4 = load i8* %arrayidx
  %conv = sext i8 %tmp4 to i32
  %tmp5 = load i32* %retval1, align 4
  %add = add nsw i32 %tmp5, %conv
  store i32 %add, i32* %retval1, align 4
  store i32* bitcast ([16 x i8]* @.str1 to i32*), i32** %s, align 8
  %tmp7 = load i32** %s, align 8
  %arrayidx8 = getelementptr inbounds i32* %tmp7, i64 0
  %tmp9 = load i32* %arrayidx8
  %tmp10 = load i32* %retval1, align 4
  %add11 = add nsw i32 %tmp10, %tmp9
  store i32 %add11, i32* %retval1, align 4
  %tmp12 = load i32* %retval1, align 4
  ret i32 %tmp12
}
