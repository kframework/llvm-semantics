; ModuleID = './pr34415.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"Bbb:\00", align 1

; Function Attrs: noinline nounwind uwtable
define i8* @foo(i8* %p) #0 {
  %1 = alloca i8*, align 8
  %end = alloca i8*, align 8
  %len = alloca i32, align 4
  %c = alloca i32, align 4
  store i8* %p, i8** %1, align 8
  store i32 1, i32* %len, align 4
  br label %2

; <label>:2                                       ; preds = %39, %0
  %3 = load i8*, i8** %1, align 8
  %4 = load i8, i8* %3, align 1
  %5 = sext i8 %4 to i32
  store i32 %5, i32* %c, align 4
  %6 = load i32, i32* %c, align 4
  %7 = icmp sge i32 %6, 97
  br i1 %7, label %8, label %15

; <label>:8                                       ; preds = %2
  %9 = load i32, i32* %c, align 4
  %10 = icmp sle i32 %9, 122
  br i1 %10, label %11, label %15

; <label>:11                                      ; preds = %8
  %12 = load i32, i32* %c, align 4
  %13 = sub nsw i32 %12, 97
  %14 = add nsw i32 %13, 65
  br label %17

; <label>:15                                      ; preds = %8, %2
  %16 = load i32, i32* %c, align 4
  br label %17

; <label>:17                                      ; preds = %15, %11
  %18 = phi i32 [ %14, %11 ], [ %16, %15 ]
  store i32 %18, i32* %c, align 4
  %19 = load i32, i32* %c, align 4
  %20 = icmp eq i32 %19, 66
  br i1 %20, label %21, label %23

; <label>:21                                      ; preds = %17
  %22 = load i8*, i8** %1, align 8
  store i8* %22, i8** %end, align 8
  br label %39

; <label>:23                                      ; preds = %17
  %24 = load i32, i32* %c, align 4
  %25 = icmp eq i32 %24, 65
  br i1 %25, label %26, label %37

; <label>:26                                      ; preds = %23
  %27 = load i8*, i8** %1, align 8
  store i8* %27, i8** %end, align 8
  br label %28

; <label>:28                                      ; preds = %31, %26
  %29 = load i8*, i8** %1, align 8
  %30 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %30, i8** %1, align 8
  br label %31

; <label>:31                                      ; preds = %28
  %32 = load i8*, i8** %1, align 8
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp eq i32 %34, 43
  br i1 %35, label %28, label %36

; <label>:36                                      ; preds = %31
  br label %38

; <label>:37                                      ; preds = %23
  br label %44

; <label>:38                                      ; preds = %36
  br label %39

; <label>:39                                      ; preds = %38, %21
  %40 = load i8*, i8** %1, align 8
  %41 = getelementptr inbounds i8, i8* %40, i32 1
  store i8* %41, i8** %1, align 8
  %42 = load i32, i32* %len, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %len, align 4
  br label %2

; <label>:44                                      ; preds = %37
  %45 = load i32, i32* %len, align 4
  %46 = icmp sgt i32 %45, 2
  br i1 %46, label %47, label %54

; <label>:47                                      ; preds = %44
  %48 = load i8*, i8** %1, align 8
  %49 = load i8, i8* %48, align 1
  %50 = sext i8 %49 to i32
  %51 = icmp eq i32 %50, 58
  br i1 %51, label %52, label %54

; <label>:52                                      ; preds = %47
  %53 = load i8*, i8** %end, align 8
  store i8* %53, i8** %1, align 8
  br label %54

; <label>:54                                      ; preds = %52, %47, %44
  %55 = load i8*, i8** %1, align 8
  ret i8* %55
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %input = alloca i8*, align 8
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i32 0, i32 0), i8** %input, align 8
  %2 = load i8*, i8** %input, align 8
  %3 = call i8* @foo(i8* %2)
  %4 = load i8*, i8** %input, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 2
  %6 = icmp ne i8* %3, %5
  %7 = zext i1 %6 to i32
  ret i32 %7
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
