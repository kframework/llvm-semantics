; ModuleID = './zerosInInits.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32, i32*, [2 x i32], %struct.anon.0 }
%struct.anon.0 = type { i32* }

@main.a1 = private unnamed_addr constant [3 x i8] c"\01\00\00", align 1
@main.a2 = private unnamed_addr constant [3 x float] [float 1.000000e+00, float 2.000000e+00, float 0.000000e+00], align 4
@main.a4 = private unnamed_addr constant [3 x i32] [i32 1, i32 0, i32 0], align 4
@main.a5 = private unnamed_addr constant %struct.anon { i32 1, i32* null, [2 x i32] [i32 0, i32 1], %struct.anon.0 zeroinitializer }, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a1 = alloca [3 x i8], align 1
  %a2 = alloca [3 x float], align 4
  %a3 = alloca [3 x i32*], align 16
  %a4 = alloca [3 x i32], align 4
  %a5 = alloca %struct.anon, align 8
  store i32 0, i32* %1
  %2 = bitcast [3 x i8]* %a1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds ([3 x i8]* @main.a1, i32 0, i32 0), i64 3, i32 1, i1 false)
  %3 = bitcast [3 x float]* %a2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([3 x float]* @main.a2 to i8*), i64 12, i32 4, i1 false)
  %4 = getelementptr inbounds [3 x i32*]* %a3, i64 0, i64 0
  %5 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 3
  %6 = bitcast i8* %5 to i32*
  store i32* %6, i32** %4
  %7 = getelementptr inbounds i32** %4, i64 1
  %8 = getelementptr inbounds i32** %4, i64 3
  br label %9

; <label>:9                                       ; preds = %9, %0
  %10 = phi i32** [ %7, %0 ], [ %11, %9 ]
  store i32* null, i32** %10
  %11 = getelementptr inbounds i32** %10, i64 1
  %12 = icmp eq i32** %11, %8
  br i1 %12, label %13, label %9

; <label>:13                                      ; preds = %9
  %14 = bitcast [3 x i32]* %a4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %14, i8* bitcast ([3 x i32]* @main.a4 to i8*), i64 12, i32 4, i1 false)
  %15 = bitcast %struct.anon* %a5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %15, i8* bitcast (%struct.anon* @main.a5 to i8*), i64 32, i32 8, i1 false)
  %16 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 0
  %17 = load i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = icmp ne i32 %18, 1
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %13
  store i32 1, i32* %1
  br label %151

; <label>:21                                      ; preds = %13
  %22 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 1
  %23 = load i8* %22, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %21
  store i32 2, i32* %1
  br label %151

; <label>:27                                      ; preds = %21
  %28 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 2
  %29 = load i8* %28, align 1
  %30 = sext i8 %29 to i32
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %27
  store i32 3, i32* %1
  br label %151

; <label>:33                                      ; preds = %27
  %34 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 0
  %35 = load float* %34, align 4
  %36 = fcmp une float %35, 1.000000e+00
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %33
  store i32 4, i32* %1
  br label %151

; <label>:38                                      ; preds = %33
  %39 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 1
  %40 = load float* %39, align 4
  %41 = fpext float %40 to double
  %42 = fcmp une double %41, 2.000000e+00
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %38
  store i32 5, i32* %1
  br label %151

; <label>:44                                      ; preds = %38
  %45 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 2
  %46 = load float* %45, align 4
  %47 = fcmp une float %46, 0.000000e+00
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %44
  store i32 6, i32* %1
  br label %151

; <label>:49                                      ; preds = %44
  %50 = getelementptr inbounds [3 x i32*]* %a3, i32 0, i64 0
  %51 = load i32** %50, align 8
  %52 = getelementptr inbounds [3 x i8]* %a1, i32 0, i64 3
  %53 = ptrtoint i8* %52 to i64
  %54 = inttoptr i64 %53 to i32*
  %55 = icmp ne i32* %51, %54
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %49
  store i32 7, i32* %1
  br label %151

; <label>:57                                      ; preds = %49
  %58 = getelementptr inbounds [3 x i32*]* %a3, i32 0, i64 1
  %59 = load i32** %58, align 8
  %60 = icmp ne i32* %59, null
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %57
  store i32 8, i32* %1
  br label %151

; <label>:62                                      ; preds = %57
  %63 = getelementptr inbounds [3 x i32*]* %a3, i32 0, i64 2
  %64 = load i32** %63, align 8
  %65 = icmp ne i32* %64, null
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %62
  store i32 9, i32* %1
  br label %151

; <label>:67                                      ; preds = %62
  %68 = getelementptr inbounds [3 x i32]* %a4, i32 0, i64 0
  %69 = load i32* %68, align 4
  %70 = icmp ne i32 %69, 1
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %67
  store i32 10, i32* %1
  br label %151

; <label>:72                                      ; preds = %67
  %73 = getelementptr inbounds [3 x i32]* %a4, i32 0, i64 1
  %74 = load i32* %73, align 4
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %72
  store i32 11, i32* %1
  br label %151

; <label>:77                                      ; preds = %72
  %78 = getelementptr inbounds [3 x i32]* %a4, i32 0, i64 2
  %79 = load i32* %78, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %82

; <label>:81                                      ; preds = %77
  store i32 12, i32* %1
  br label %151

; <label>:82                                      ; preds = %77
  %83 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 0
  %84 = load float* %83, align 4
  %85 = fcmp une float %84, 1.000000e+00
  br i1 %85, label %86, label %87

; <label>:86                                      ; preds = %82
  store i32 13, i32* %1
  br label %151

; <label>:87                                      ; preds = %82
  %88 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 1
  %89 = load float* %88, align 4
  %90 = fcmp une float %89, 2.000000e+00
  br i1 %90, label %91, label %92

; <label>:91                                      ; preds = %87
  store i32 14, i32* %1
  br label %151

; <label>:92                                      ; preds = %87
  %93 = getelementptr inbounds [3 x float]* %a2, i32 0, i64 2
  %94 = load float* %93, align 4
  %95 = fpext float %94 to double
  %96 = fcmp une double %95, 0.000000e+00
  br i1 %96, label %97, label %98

; <label>:97                                      ; preds = %92
  store i32 15, i32* %1
  br label %151

; <label>:98                                      ; preds = %92
  %99 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 0
  %100 = load i32* %99, align 4
  %101 = sitofp i32 %100 to float
  %102 = fcmp une float %101, 1.000000e+00
  br i1 %102, label %103, label %104

; <label>:103                                     ; preds = %98
  store i32 16, i32* %1
  br label %151

; <label>:104                                     ; preds = %98
  %105 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 0
  %106 = load i32* %105, align 4
  %107 = icmp ne i32 %106, 1
  br i1 %107, label %108, label %109

; <label>:108                                     ; preds = %104
  store i32 17, i32* %1
  br label %151

; <label>:109                                     ; preds = %104
  %110 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 1
  %111 = load i32** %110, align 8
  %112 = icmp ne i32* %111, null
  br i1 %112, label %113, label %114

; <label>:113                                     ; preds = %109
  store i32 18, i32* %1
  br label %151

; <label>:114                                     ; preds = %109
  %115 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 1
  %116 = load i32** %115, align 8
  %117 = icmp ne i32* %116, null
  br i1 %117, label %118, label %119

; <label>:118                                     ; preds = %114
  store i32 19, i32* %1
  br label %151

; <label>:119                                     ; preds = %114
  %120 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 2
  %121 = getelementptr inbounds [2 x i32]* %120, i32 0, i64 0
  %122 = load i32* %121, align 4
  %123 = sitofp i32 %122 to double
  %124 = fcmp une double %123, 0.000000e+00
  br i1 %124, label %125, label %126

; <label>:125                                     ; preds = %119
  store i32 21, i32* %1
  br label %151

; <label>:126                                     ; preds = %119
  %127 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 2
  %128 = getelementptr inbounds [2 x i32]* %127, i32 0, i64 0
  %129 = load i32* %128, align 4
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %131, label %132

; <label>:131                                     ; preds = %126
  store i32 22, i32* %1
  br label %151

; <label>:132                                     ; preds = %126
  %133 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 2
  %134 = getelementptr inbounds [2 x i32]* %133, i32 0, i64 1
  %135 = load i32* %134, align 4
  %136 = icmp ne i32 %135, 1
  br i1 %136, label %137, label %138

; <label>:137                                     ; preds = %132
  store i32 23, i32* %1
  br label %151

; <label>:138                                     ; preds = %132
  %139 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 3
  %140 = getelementptr inbounds %struct.anon.0* %139, i32 0, i32 0
  %141 = load i32** %140, align 8
  %142 = icmp ne i32* %141, null
  br i1 %142, label %143, label %144

; <label>:143                                     ; preds = %138
  store i32 24, i32* %1
  br label %151

; <label>:144                                     ; preds = %138
  %145 = getelementptr inbounds %struct.anon* %a5, i32 0, i32 3
  %146 = getelementptr inbounds %struct.anon.0* %145, i32 0, i32 0
  %147 = load i32** %146, align 8
  %148 = icmp ne i32* %147, null
  br i1 %148, label %149, label %150

; <label>:149                                     ; preds = %144
  store i32 25, i32* %1
  br label %151

; <label>:150                                     ; preds = %144
  store i32 0, i32* %1
  br label %151

; <label>:151                                     ; preds = %150, %149, %143, %137, %131, %125, %118, %113, %108, %103, %97, %91, %86, %81, %76, %71, %66, %61, %56, %48, %43, %37, %32, %26, %20
  %152 = load i32* %1
  ret i32 %152
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
