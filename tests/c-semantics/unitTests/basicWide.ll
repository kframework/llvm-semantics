; ModuleID = './basicWide.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"bar\00", align 1
@.str1 = private unnamed_addr constant [4 x i32] [i32 102, i32 111, i32 111, i32 0], align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  %z = alloca i8*, align 8
  %s = alloca i32*, align 8
  store i32 0, i32* %1
  store i32 0, i32* %retval, align 4
  store i32 120, i32* %c, align 4
  %2 = load i32* %c, align 4
  store i32 %2, i32* %retval, align 4
  store i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8** %z, align 8
  %3 = load i8** %z, align 8
  %4 = getelementptr inbounds i8* %3, i64 0
  %5 = load i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = load i32* %retval, align 4
  %8 = add nsw i32 %7, %6
  store i32 %8, i32* %retval, align 4
  store i32* getelementptr inbounds ([4 x i32]* @.str1, i32 0, i32 0), i32** %s, align 8
  %9 = load i32** %s, align 8
  %10 = getelementptr inbounds i32* %9, i64 0
  %11 = load i32* %10, align 4
  %12 = load i32* %retval, align 4
  %13 = add nsw i32 %12, %11
  store i32 %13, i32* %retval, align 4
  %14 = load i32* %retval, align 4
  ret i32 %14
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
