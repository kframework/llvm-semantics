; ModuleID = './c1x06050610.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"p == &a[0]\0A\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"p != &a[0]\0A\00", align 1
@.str.2 = private unnamed_addr constant [12 x i8] c"p == &a[1]\0A\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"p != &a[1]\0A\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"a[1][2] == %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [9 x i8] c"n == %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %2 = alloca i8*
  %p = alloca i32*, align 8
  store i32 0, i32* %1
  store i32 4, i32* %n, align 4
  store i32 3, i32* %m, align 4
  %3 = load i32, i32* %n, align 4
  %4 = zext i32 %3 to i64
  %5 = load i32, i32* %m, align 4
  %6 = zext i32 %5 to i64
  %7 = call i8* @llvm.stacksave()
  store i8* %7, i8** %2
  %8 = mul nuw i64 %4, %6
  %9 = alloca i32, i64 %8, align 16
  %10 = load i32, i32* %m, align 4
  %11 = zext i32 %10 to i64
  store i32* %9, i32** %p, align 8
  %12 = load i32*, i32** %p, align 8
  %13 = mul nsw i64 0, %6
  %14 = getelementptr inbounds i32, i32* %9, i64 %13
  %15 = icmp eq i32* %12, %14
  br i1 %15, label %16, label %18

; <label>:16                                      ; preds = %0
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str, i32 0, i32 0))
  br label %20

; <label>:18                                      ; preds = %0
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i32 0, i32 0))
  br label %20

; <label>:20                                      ; preds = %18, %16
  %21 = load i32*, i32** %p, align 8
  %22 = mul nsw i64 1, %11
  %23 = getelementptr inbounds i32, i32* %21, i64 %22
  store i32* %23, i32** %p, align 8
  %24 = load i32*, i32** %p, align 8
  %25 = mul nsw i64 1, %6
  %26 = getelementptr inbounds i32, i32* %9, i64 %25
  %27 = icmp eq i32* %24, %26
  br i1 %27, label %28, label %30

; <label>:28                                      ; preds = %20
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.2, i32 0, i32 0))
  br label %32

; <label>:30                                      ; preds = %20
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i32 0, i32 0))
  br label %32

; <label>:32                                      ; preds = %30, %28
  %33 = load i32*, i32** %p, align 8
  %34 = getelementptr inbounds i32, i32* %33, i64 2
  store i32 99, i32* %34, align 4
  %35 = mul nsw i64 1, %6
  %36 = getelementptr inbounds i32, i32* %9, i64 %35
  %37 = getelementptr inbounds i32, i32* %36, i64 2
  %38 = load i32, i32* %37, align 4
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i32 0, i32 0), i32 %38)
  %40 = load i32*, i32** %p, align 8
  %41 = ptrtoint i32* %40 to i64
  %42 = ptrtoint i32* %9 to i64
  %43 = sub i64 %41, %42
  %44 = mul nuw i64 4, %11
  %45 = sdiv exact i64 %43, %44
  %46 = trunc i64 %45 to i32
  store i32 %46, i32* %n, align 4
  %47 = load i32, i32* %n, align 4
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.5, i32 0, i32 0), i32 %47)
  store i32 0, i32* %1
  %49 = load i8*, i8** %2
  call void @llvm.stackrestore(i8* %49)
  %50 = load i32, i32* %1
  ret i32 %50
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
