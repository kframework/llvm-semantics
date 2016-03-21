; ModuleID = './j035.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"hi0\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"hi1\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"hi2\00", align 1

; Function Attrs: nounwind uwtable
define i32 @f(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @foo(i32* %p1, i32* %p2) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32*, align 8
  store i32* %p1, i32** %1, align 8
  store i32* %p2, i32** %2, align 8
  %3 = load i32*, i32** %1, align 8
  %4 = load i32, i32* %3, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %3, align 4
  %6 = load i32*, i32** %2, align 8
  %7 = load i32, i32* %6, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %6, align 4
  %9 = add nsw i32 %4, %7
  ret i32 %9
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %x, align 4
  store i32 0, i32* %y, align 4
  store i32 1, i32* %x, align 4
  %2 = load i32, i32* %y, align 4
  %3 = add nsw i32 1, %2
  %4 = load i32, i32* %x, align 4
  store i32 1, i32* %y, align 4
  %5 = add nsw i32 %4, 1
  store i32 1, i32* %x, align 4
  store i32 1, i32* %y, align 4
  store i32 0, i32* %x, align 4
  %6 = load i32, i32* %y, align 4
  %7 = call i32 @f(i32 0, i32 %6)
  %8 = load i32, i32* %x, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %x, align 4
  %10 = load i32, i32* %y, align 4
  %11 = add nsw i32 %9, %10
  %12 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i64 0), align 1
  %13 = sext i8 %12 to i32
  %14 = load i32, i32* %x, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %x, align 4
  %16 = add nsw i32 %13, %14
  %17 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i64 0), align 1
  %18 = sext i8 %17 to i32
  %19 = load i32, i32* %x, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %x, align 4
  %21 = add nsw i32 %18, %19
  %22 = load i8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i64 0), align 1
  %23 = sext i8 %22 to i32
  %24 = add nsw i32 %21, %23
  %25 = call i32 @foo(i32* %x, i32* %y)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
