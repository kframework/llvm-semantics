; ModuleID = './20011126-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"aab\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %out = alloca [4 x i8], align 1
  store i32 0, i32* %1
  %2 = getelementptr inbounds [4 x i8], [4 x i8]* %out, i32 0, i32 0
  %3 = call i8* @test(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %2)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i8* @test(i8* %in, i8* %out) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8*, align 8
  %p = alloca i8*, align 8
  store i8* %in, i8** %1, align 8
  store i8* %out, i8** %2, align 8
  br label %3

; <label>:3                                       ; preds = %0, %38
  %4 = load i8*, i8** %1, align 8
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, 97
  br i1 %7, label %8, label %38

; <label>:8                                       ; preds = %3
  %9 = load i8*, i8** %1, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 1
  store i8* %10, i8** %p, align 8
  br label %11

; <label>:11                                      ; preds = %16, %8
  %12 = load i8*, i8** %p, align 8
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp eq i32 %14, 120
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %11
  %17 = load i8*, i8** %p, align 8
  %18 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %18, i8** %p, align 8
  br label %11

; <label>:19                                      ; preds = %11
  %20 = load i8*, i8** %p, align 8
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp eq i32 %22, 98
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %19
  %25 = load i8*, i8** %p, align 8
  ret i8* %25

; <label>:26                                      ; preds = %19
  br label %27

; <label>:27                                      ; preds = %31, %26
  %28 = load i8*, i8** %1, align 8
  %29 = load i8*, i8** %p, align 8
  %30 = icmp ult i8* %28, %29
  br i1 %30, label %31, label %37

; <label>:31                                      ; preds = %27
  %32 = load i8*, i8** %1, align 8
  %33 = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %33, i8** %1, align 8
  %34 = load i8, i8* %32, align 1
  %35 = load i8*, i8** %2, align 8
  %36 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %36, i8** %2, align 8
  store i8 %34, i8* %35, align 1
  br label %27

; <label>:37                                      ; preds = %27
  br label %38

; <label>:38                                      ; preds = %37, %3
  br label %3
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
