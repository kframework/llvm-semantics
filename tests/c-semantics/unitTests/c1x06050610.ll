; ModuleID = './c1x06050610.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"p == &a[0]\0A\00", align 1
@.str1 = private unnamed_addr constant [12 x i8] c"p != &a[0]\0A\00", align 1
@.str2 = private unnamed_addr constant [12 x i8] c"p == &a[1]\0A\00", align 1
@.str3 = private unnamed_addr constant [12 x i8] c"p != &a[1]\0A\00", align 1
@.str4 = private unnamed_addr constant [15 x i8] c"a[1][2] == %d\0A\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"n == %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %2 = alloca i8*
  %p = alloca i32*, align 8
  %3 = alloca i32
  store i32 0, i32* %1
  store i32 4, i32* %n, align 4
  store i32 3, i32* %m, align 4
  %4 = load i32* %n, align 4
  %5 = zext i32 %4 to i64
  %6 = load i32* %m, align 4
  %7 = zext i32 %6 to i64
  %8 = call i8* @llvm.stacksave()
  store i8* %8, i8** %2
  %9 = mul nuw i64 %5, %7
  %10 = alloca i32, i64 %9, align 16
  %11 = load i32* %m, align 4
  %12 = zext i32 %11 to i64
  store i32* %10, i32** %p, align 8
  %13 = load i32** %p, align 8
  %14 = mul nsw i64 0, %7
  %15 = getelementptr inbounds i32* %10, i64 %14
  %16 = icmp eq i32* %13, %15
  br i1 %16, label %17, label %19

; <label>:17                                      ; preds = %0
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i32 0, i32 0))
  br label %21

; <label>:19                                      ; preds = %0
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str1, i32 0, i32 0))
  br label %21

; <label>:21                                      ; preds = %19, %17
  %22 = load i32** %p, align 8
  %23 = mul nsw i64 1, %12
  %24 = getelementptr inbounds i32* %22, i64 %23
  store i32* %24, i32** %p, align 8
  %25 = load i32** %p, align 8
  %26 = mul nsw i64 1, %7
  %27 = getelementptr inbounds i32* %10, i64 %26
  %28 = icmp eq i32* %25, %27
  br i1 %28, label %29, label %31

; <label>:29                                      ; preds = %21
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str2, i32 0, i32 0))
  br label %33

; <label>:31                                      ; preds = %21
  %32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str3, i32 0, i32 0))
  br label %33

; <label>:33                                      ; preds = %31, %29
  %34 = load i32** %p, align 8
  %35 = getelementptr inbounds i32* %34, i64 2
  store i32 99, i32* %35, align 4
  %36 = mul nsw i64 1, %7
  %37 = getelementptr inbounds i32* %10, i64 %36
  %38 = getelementptr inbounds i32* %37, i64 2
  %39 = load i32* %38, align 4
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([15 x i8]* @.str4, i32 0, i32 0), i32 %39)
  %41 = load i32** %p, align 8
  %42 = ptrtoint i32* %41 to i64
  %43 = ptrtoint i32* %10 to i64
  %44 = sub i64 %42, %43
  %45 = mul nuw i64 4, %12
  %46 = sdiv exact i64 %44, %45
  %47 = trunc i64 %46 to i32
  store i32 %47, i32* %n, align 4
  %48 = load i32* %n, align 4
  %49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0), i32 %48)
  store i32 0, i32* %1
  store i32 1, i32* %3
  %50 = load i8** %2
  call void @llvm.stackrestore(i8* %50)
  %51 = load i32* %1
  ret i32 %51
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
