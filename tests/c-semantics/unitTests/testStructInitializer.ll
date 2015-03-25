; ModuleID = './testStructInitializer.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i8, i8* }
%struct.anon.0 = type { i8, [2 x i8] }
%struct.sa3b = type { %struct.sa3, [3 x i8] }
%struct.sa3 = type { i8, [0 x i8] }
%struct.anon.1 = type { i8, [2 x i8] }
%struct.anon.2 = type { i8, %struct.inner_Struct }
%struct.inner_Struct = type { i8, [2 x i8] }

@basicInit = global i32 5, align 4
@basicInit2 = global i8 10, align 1
@basicArr = global [2 x i32] [i32 15, i32 20], align 4
@.str = private unnamed_addr constant [3 x i8] c"62\00", align 1
@a1 = global %struct.anon { i8 52, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0) }, align 8
@a2 = global %struct.anon.0 { i8 118, [2 x i8] c"cq" }, align 1
@a3 = global %struct.sa3b { %struct.sa3 { i8 111, [0 x i8] zeroinitializer }, [3 x i8] c"wx\00" }, align 1
@a4 = global %struct.anon.1 { i8 57, [2 x i8] c"eb" }, align 1
@a5 = global %struct.anon.2 { i8 57, %struct.inner_Struct { i8 55, [2 x i8] c"zd" } }, align 1
@.str1 = private unnamed_addr constant [5 x i8] c"FAIL\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i32* @basicInit, align 4
  %3 = icmp ne i32 %2, 5
  br i1 %3, label %4, label %6

; <label>:4                                       ; preds = %0
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %6

; <label>:6                                       ; preds = %4, %0
  %7 = load i8* @basicInit2, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 10
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %12

; <label>:12                                      ; preds = %10, %6
  %13 = load i32* getelementptr inbounds ([2 x i32]* @basicArr, i32 0, i64 0), align 4
  %14 = icmp ne i32 %13, 15
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %12
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %17

; <label>:17                                      ; preds = %15, %12
  %18 = load i32* getelementptr inbounds ([2 x i32]* @basicArr, i32 0, i64 1), align 4
  %19 = icmp ne i32 %18, 20
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %17
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %22

; <label>:22                                      ; preds = %20, %17
  %23 = load i8* getelementptr inbounds (%struct.anon* @a1, i32 0, i32 0), align 1
  %24 = sext i8 %23 to i32
  %25 = icmp ne i32 %24, 52
  br i1 %25, label %26, label %28

; <label>:26                                      ; preds = %22
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %28

; <label>:28                                      ; preds = %26, %22
  %29 = load i8** getelementptr inbounds (%struct.anon* @a1, i32 0, i32 1), align 8
  %30 = getelementptr inbounds i8* %29, i64 0
  %31 = load i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp ne i32 %32, 54
  br i1 %33, label %34, label %36

; <label>:34                                      ; preds = %28
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %36

; <label>:36                                      ; preds = %34, %28
  %37 = load i8** getelementptr inbounds (%struct.anon* @a1, i32 0, i32 1), align 8
  %38 = getelementptr inbounds i8* %37, i64 1
  %39 = load i8* %38, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp ne i32 %40, 50
  br i1 %41, label %42, label %44

; <label>:42                                      ; preds = %36
  %43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %44

; <label>:44                                      ; preds = %42, %36
  %45 = load i8** getelementptr inbounds (%struct.anon* @a1, i32 0, i32 1), align 8
  %46 = getelementptr inbounds i8* %45, i64 2
  %47 = load i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %52

; <label>:50                                      ; preds = %44
  %51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %52

; <label>:52                                      ; preds = %50, %44
  %53 = load i8* getelementptr inbounds (%struct.anon.0* @a2, i32 0, i32 0), align 1
  %54 = sext i8 %53 to i32
  %55 = icmp ne i32 %54, 118
  br i1 %55, label %56, label %58

; <label>:56                                      ; preds = %52
  %57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %58

; <label>:58                                      ; preds = %56, %52
  %59 = load i8* getelementptr inbounds (%struct.anon.0* @a2, i32 0, i32 1, i64 0), align 1
  %60 = sext i8 %59 to i32
  %61 = icmp ne i32 %60, 99
  br i1 %61, label %62, label %64

; <label>:62                                      ; preds = %58
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %64

; <label>:64                                      ; preds = %62, %58
  %65 = load i8* getelementptr inbounds (%struct.anon.0* @a2, i32 0, i32 1, i64 1), align 1
  %66 = sext i8 %65 to i32
  %67 = icmp ne i32 %66, 113
  br i1 %67, label %68, label %70

; <label>:68                                      ; preds = %64
  %69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %70

; <label>:70                                      ; preds = %68, %64
  %71 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i32 0, i32 0, i32 0), align 1
  %72 = sext i8 %71 to i32
  %73 = icmp ne i32 %72, 111
  br i1 %73, label %74, label %76

; <label>:74                                      ; preds = %70
  %75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %76

; <label>:76                                      ; preds = %74, %70
  %77 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i32 0, i32 1, i64 0), align 1
  %78 = sext i8 %77 to i32
  %79 = icmp ne i32 %78, 119
  br i1 %79, label %80, label %82

; <label>:80                                      ; preds = %76
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %82

; <label>:82                                      ; preds = %80, %76
  %83 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i32 0, i32 1, i64 1), align 1
  %84 = sext i8 %83 to i32
  %85 = icmp ne i32 %84, 120
  br i1 %85, label %86, label %88

; <label>:86                                      ; preds = %82
  %87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %88

; <label>:88                                      ; preds = %86, %82
  %89 = load i8* getelementptr inbounds (%struct.anon.1* @a4, i32 0, i32 0), align 1
  %90 = sext i8 %89 to i32
  %91 = icmp ne i32 %90, 57
  br i1 %91, label %92, label %94

; <label>:92                                      ; preds = %88
  %93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %94

; <label>:94                                      ; preds = %92, %88
  %95 = load i8* getelementptr inbounds (%struct.anon.1* @a4, i32 0, i32 1, i64 0), align 1
  %96 = sext i8 %95 to i32
  %97 = icmp ne i32 %96, 101
  br i1 %97, label %98, label %100

; <label>:98                                      ; preds = %94
  %99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %100

; <label>:100                                     ; preds = %98, %94
  %101 = load i8* getelementptr inbounds (%struct.anon.1* @a4, i32 0, i32 1, i64 1), align 1
  %102 = sext i8 %101 to i32
  %103 = icmp ne i32 %102, 98
  br i1 %103, label %104, label %106

; <label>:104                                     ; preds = %100
  %105 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i32 0, i32 0))
  br label %106

; <label>:106                                     ; preds = %104, %100
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
