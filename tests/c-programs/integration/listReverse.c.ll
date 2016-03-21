; ModuleID = './listReverse.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %head = alloca i32*, align 8
  %curr = alloca i32*, align 8
  %sum1 = alloca i32, align 4
  %first = alloca i32, align 4
  %last = alloca i32, align 4
  %sum2 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call noalias i8* @malloc(i64 12) #3
  %3 = bitcast i8* %2 to i32*
  store i32* %3, i32** %head, align 8
  %4 = load i32*, i32** %head, align 8
  store i32 20, i32* %4, align 4
  %5 = load i32*, i32** %head, align 8
  %6 = getelementptr inbounds i32, i32* %5, i64 1
  %7 = bitcast i32* %6 to i32**
  store i32* null, i32** %7, align 8
  %8 = load i32*, i32** %head, align 8
  %9 = call i32* @listAppend(i32* %8, i32 25)
  %10 = load i32*, i32** %head, align 8
  %11 = call i32* @listAppend(i32* %10, i32 15)
  %12 = load i32*, i32** %head, align 8
  %13 = call i32* @listAppend(i32* %12, i32 30)
  %14 = load i32*, i32** %head, align 8
  %15 = call i32* @listAppend(i32* %14, i32 10)
  %16 = load i32*, i32** %head, align 8
  %17 = call i32* @listAppend(i32* %16, i32 35)
  %18 = load i32*, i32** %head, align 8
  store i32* %18, i32** %curr, align 8
  br label %19

; <label>:19                                      ; preds = %22, %0
  %20 = load i32*, i32** %curr, align 8
  %21 = icmp ne i32* %20, null
  br i1 %21, label %22, label %30

; <label>:22                                      ; preds = %19
  %23 = load i32*, i32** %curr, align 8
  %24 = load i32, i32* %23, align 4
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %24)
  %26 = load i32*, i32** %curr, align 8
  %27 = getelementptr inbounds i32, i32* %26, i64 1
  %28 = bitcast i32* %27 to i32**
  %29 = load i32*, i32** %28, align 8
  store i32* %29, i32** %curr, align 8
  br label %19

; <label>:30                                      ; preds = %19
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  %32 = load i32*, i32** %head, align 8
  %33 = call i32 @listSum(i32* %32)
  store i32 %33, i32* %sum1, align 4
  %34 = load i32*, i32** %head, align 8
  %35 = load i32, i32* %34, align 4
  store i32 %35, i32* %first, align 4
  %36 = load i32*, i32** %head, align 8
  %37 = call i32* @listReverse(i32* %36)
  store i32* %37, i32** %head, align 8
  %38 = load i32*, i32** %head, align 8
  store i32* %38, i32** %curr, align 8
  br label %39

; <label>:39                                      ; preds = %42, %30
  %40 = load i32*, i32** %curr, align 8
  %41 = icmp ne i32* %40, null
  br i1 %41, label %42, label %50

; <label>:42                                      ; preds = %39
  %43 = load i32*, i32** %curr, align 8
  %44 = load i32, i32* %43, align 4
  %45 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %44)
  %46 = load i32*, i32** %curr, align 8
  %47 = getelementptr inbounds i32, i32* %46, i64 1
  %48 = bitcast i32* %47 to i32**
  %49 = load i32*, i32** %48, align 8
  store i32* %49, i32** %curr, align 8
  br label %39

; <label>:50                                      ; preds = %39
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i32 0, i32 0))
  %52 = load i32*, i32** %head, align 8
  %53 = load i32, i32* %52, align 4
  store i32 %53, i32* %last, align 4
  %54 = load i32*, i32** %head, align 8
  %55 = call i32 @listSum(i32* %54)
  store i32 %55, i32* %sum2, align 4
  %56 = load i32, i32* %sum1, align 4
  %57 = load i32, i32* %sum2, align 4
  %58 = sub nsw i32 %56, %57
  %59 = load i32, i32* %last, align 4
  %60 = load i32, i32* %first, align 4
  %61 = sub nsw i32 %59, %60
  %62 = add nsw i32 %58, %61
  ret i32 %62
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i32* @listAppend(i32* %p, i32 %n) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %x = alloca i32*, align 8
  %next = alloca i32*, align 8
  store i32* %p, i32** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = load i32*, i32** %1, align 8
  %4 = icmp ne i32* %3, null
  br i1 %4, label %5, label %30

; <label>:5                                       ; preds = %0
  %6 = load i32*, i32** %1, align 8
  store i32* %6, i32** %x, align 8
  br label %7

; <label>:7                                       ; preds = %13, %5
  %8 = load i32*, i32** %x, align 8
  %9 = getelementptr inbounds i32, i32* %8, i64 1
  %10 = bitcast i32* %9 to i32**
  %11 = load i32*, i32** %10, align 8
  %12 = icmp ne i32* %11, null
  br i1 %12, label %13, label %18

; <label>:13                                      ; preds = %7
  %14 = load i32*, i32** %x, align 8
  %15 = getelementptr inbounds i32, i32* %14, i64 1
  %16 = bitcast i32* %15 to i32**
  %17 = load i32*, i32** %16, align 8
  store i32* %17, i32** %x, align 8
  br label %7

; <label>:18                                      ; preds = %7
  %19 = call noalias i8* @malloc(i64 12) #3
  %20 = bitcast i8* %19 to i32*
  store i32* %20, i32** %next, align 8
  %21 = load i32*, i32** %next, align 8
  %22 = load i32*, i32** %x, align 8
  %23 = getelementptr inbounds i32, i32* %22, i64 1
  %24 = bitcast i32* %23 to i32**
  store i32* %21, i32** %24, align 8
  %25 = load i32, i32* %2, align 4
  %26 = load i32*, i32** %next, align 8
  store i32 %25, i32* %26, align 4
  %27 = load i32*, i32** %next, align 8
  %28 = getelementptr inbounds i32, i32* %27, i64 1
  %29 = bitcast i32* %28 to i32**
  store i32* null, i32** %29, align 8
  br label %30

; <label>:30                                      ; preds = %18, %0
  %31 = load i32*, i32** %1, align 8
  ret i32* %31
}

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @listSum(i32* %p) #0 {
  %1 = alloca i32*, align 8
  %sum = alloca i32, align 4
  %x = alloca i32*, align 8
  store i32* %p, i32** %1, align 8
  store i32 0, i32* %sum, align 4
  %2 = load i32*, i32** %1, align 8
  %3 = icmp ne i32* %2, null
  br i1 %3, label %4, label %26

; <label>:4                                       ; preds = %0
  %5 = load i32*, i32** %1, align 8
  store i32* %5, i32** %x, align 8
  %6 = load i32*, i32** %x, align 8
  %7 = load i32, i32* %6, align 4
  %8 = load i32, i32* %sum, align 4
  %9 = add nsw i32 %8, %7
  store i32 %9, i32* %sum, align 4
  br label %10

; <label>:10                                      ; preds = %16, %4
  %11 = load i32*, i32** %x, align 8
  %12 = getelementptr inbounds i32, i32* %11, i64 1
  %13 = bitcast i32* %12 to i32**
  %14 = load i32*, i32** %13, align 8
  %15 = icmp ne i32* %14, null
  br i1 %15, label %16, label %25

; <label>:16                                      ; preds = %10
  %17 = load i32*, i32** %x, align 8
  %18 = getelementptr inbounds i32, i32* %17, i64 1
  %19 = bitcast i32* %18 to i32**
  %20 = load i32*, i32** %19, align 8
  store i32* %20, i32** %x, align 8
  %21 = load i32*, i32** %x, align 8
  %22 = load i32, i32* %21, align 4
  %23 = load i32, i32* %sum, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, i32* %sum, align 4
  br label %10

; <label>:25                                      ; preds = %10
  br label %26

; <label>:26                                      ; preds = %25, %0
  %27 = load i32, i32* %sum, align 4
  ret i32 %27
}

; Function Attrs: nounwind uwtable
define i32* @listReverse(i32* %p) #0 {
  %1 = alloca i32*, align 8
  %x = alloca i32*, align 8
  %tmp = alloca i32*, align 8
  store i32* %p, i32** %1, align 8
  %2 = load i32*, i32** %1, align 8
  %3 = icmp ne i32* %2, null
  br i1 %3, label %4, label %27

; <label>:4                                       ; preds = %0
  %5 = load i32*, i32** %1, align 8
  %6 = getelementptr inbounds i32, i32* %5, i64 1
  %7 = bitcast i32* %6 to i32**
  %8 = load i32*, i32** %7, align 8
  store i32* %8, i32** %x, align 8
  %9 = load i32*, i32** %1, align 8
  %10 = getelementptr inbounds i32, i32* %9, i64 1
  %11 = bitcast i32* %10 to i32**
  store i32* null, i32** %11, align 8
  br label %12

; <label>:12                                      ; preds = %15, %4
  %13 = load i32*, i32** %x, align 8
  %14 = icmp ne i32* %13, null
  br i1 %14, label %15, label %26

; <label>:15                                      ; preds = %12
  %16 = load i32*, i32** %x, align 8
  %17 = getelementptr inbounds i32, i32* %16, i64 1
  %18 = bitcast i32* %17 to i32**
  %19 = load i32*, i32** %18, align 8
  store i32* %19, i32** %tmp, align 8
  %20 = load i32*, i32** %1, align 8
  %21 = load i32*, i32** %x, align 8
  %22 = getelementptr inbounds i32, i32* %21, i64 1
  %23 = bitcast i32* %22 to i32**
  store i32* %20, i32** %23, align 8
  %24 = load i32*, i32** %x, align 8
  store i32* %24, i32** %1, align 8
  %25 = load i32*, i32** %tmp, align 8
  store i32* %25, i32** %x, align 8
  br label %12

; <label>:26                                      ; preds = %12
  br label %27

; <label>:27                                      ; preds = %26, %0
  %28 = load i32*, i32** %1, align 8
  ret i32* %28
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
