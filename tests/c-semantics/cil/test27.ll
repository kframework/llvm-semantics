; ModuleID = './test27.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"fun\00", align 1
@s = global i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), align 8
@.str1 = private unnamed_addr constant [22 x i8] c"hello world %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i8** @s, align 8
  %5 = getelementptr inbounds i8* %4, i64 0
  %6 = load i8* %5, align 1
  %7 = sext i8 %6 to i32
  %8 = load i8** @s, align 8
  %9 = getelementptr inbounds i8* %8, i64 1
  %10 = load i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = load i8** @s, align 8
  %13 = getelementptr inbounds i8* %12, i64 3
  %14 = load i8* %13, align 1
  %15 = sext i8 %14 to i32
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %7, i32 %11, i32 %15)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
