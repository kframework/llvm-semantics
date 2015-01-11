; ModuleID = './regehr01.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@z = internal global i32* @x, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@x = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load volatile i32** @z, align 8
  store i32 1, i32* %2, align 4
  %3 = call i32 @foo(i32* @x)
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %3)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal i32 @foo(i32* %y) #0 {
  %1 = alloca i32*, align 8
  store i32* %y, i32** %1, align 8
  %2 = load i32** %1, align 8
  %3 = load i32* %2, align 4
  ret i32 %3
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
