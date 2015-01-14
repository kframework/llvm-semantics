; ModuleID = './testStatic.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = global i32 17, align 4
@y = global i32 5, align 4
@f.x = internal global i32 0, align 4
@f.x1 = internal global i32 0, align 4
@g.x = internal global i32 0, align 4
@.str = private unnamed_addr constant [8 x i8] c"01y=%d\0A\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"02y=%d\0A\00", align 1
@.str3 = private unnamed_addr constant [8 x i8] c"03y=%d\0A\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"04y=%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %y = alloca i32, align 4
  %1 = load i32* @f.x, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, i32* @f.x, align 4
  %3 = load i32* @f.x1, align 4
  %4 = add nsw i32 %3, 2
  store i32 %4, i32* @f.x1, align 4
  %5 = load i32* @f.x1, align 4
  store i32 %5, i32* %y, align 4
  %6 = load i32* %y, align 4
  %7 = mul nsw i32 %6, 2
  %8 = load i32* @f.x, align 4
  %9 = mul nsw i32 %8, 3
  %10 = add nsw i32 %7, %9
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @g() #0 {
  %1 = load i32* @g.x, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, i32* @g.x, align 4
  %3 = load i32* @g.x, align 4
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %x, align 4
  %2 = load i32* @y, align 4
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0), i32 %2)
  store i32 6, i32* %y, align 4
  %4 = load i32* %y, align 4
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0), i32 %4)
  %6 = load i32* @y, align 4
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str3, i32 0, i32 0), i32 %6)
  %8 = load i32* %y, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0), i32 %8)
  %10 = call i32 @f()
  %11 = call i32 @f()
  %12 = call i32 @g()
  %13 = call i32 @g()
  %14 = call i32 @g()
  %15 = call i32 @f()
  %16 = call i32 @g()
  %17 = add nsw i32 %15, %16
  ret i32 %17
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
