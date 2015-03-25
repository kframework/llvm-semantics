; ModuleID = './c1x0605160106.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"**cpp == %c\0A\00", align 1
@.str1 = private unnamed_addr constant [10 x i8] c"*p == %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"c == %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %cpp = alloca i8**, align 8
  %p = alloca i8*, align 8
  %c = alloca i8, align 1
  store i32 0, i32* %1
  store i8 65, i8* %c, align 1
  store i8** %p, i8*** %cpp, align 8
  %2 = load i8*** %cpp, align 8
  store i8* %c, i8** %2, align 8
  %3 = load i8*** %cpp, align 8
  %4 = load i8** %3, align 8
  %5 = load i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i8** %p, align 8
  store i8 0, i8* %8, align 1
  %9 = load i8** %p, align 8
  %10 = load i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str1, i32 0, i32 0), i32 %11)
  %13 = load i8* %c, align 1
  %14 = sext i8 %13 to i32
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32 %14)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
