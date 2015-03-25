; ModuleID = './arr.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.point = type { i32, i32 }

@main.arr = private unnamed_addr constant [2 x [2 x i32]] [[2 x i32] [i32 1, i32 2], [2 x i32] [i32 3, i32 4]], align 16
@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"OK\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"*((int*)arr + 0) != 1\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"*((int*)arr + 1) != 2\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"*((int*)arr + 2) != 3\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"*((int*)arr + 3) != 4\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"*((*(arr + 0)) + 0) != 1\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"*((*(arr + 0)) + 1) != 2\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"*((*(arr + 1)) + 0) != 3\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"*((*(arr + 1)) + 1) != 4\0A\00", align 1
@.str10 = private unnamed_addr constant [33 x i8] c"(*(pointArr + 3)).x != 7, == %d\0A\00", align 1
@.str11 = private unnamed_addr constant [33 x i8] c"(*(pointArr + 3)).y != 8, == %d\0A\00", align 1
@.str12 = private unnamed_addr constant [36 x i8] c"*((int*)(&(*(pointArr + 3)))) != 7\0A\00", align 1
@.str13 = private unnamed_addr constant [40 x i8] c"*((int*)(&(*(pointArr + 3))) + 1) != 8\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %arr = alloca [2 x [2 x i32]], align 16
  %typetest = alloca i32, align 4
  %myintp = alloca i32*, align 8
  %bob = alloca i8*, align 8
  %pointArr = alloca [4 x %struct.point], align 16
  store i32 0, i32* %1
  %2 = bitcast [2 x [2 x i32]]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([2 x [2 x i32]]* @main.arr to i8*), i64 16, i32 16, i1 false)
  store i32 32, i32* %typetest, align 4
  %3 = bitcast [2 x [2 x i32]]* %arr to i32*
  store i32* %3, i32** %myintp, align 8
  store i32* %typetest, i32** %myintp, align 8
  store i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i8** %bob, align 8
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %9 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %10 = bitcast [2 x i32]* %9 to i32*
  %11 = getelementptr inbounds i32* %10, i64 0
  %12 = load i32* %11, align 4
  %13 = icmp ne i32 %12, 1
  br i1 %13, label %14, label %16

; <label>:14                                      ; preds = %0
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0))
  br label %18

; <label>:16                                      ; preds = %0
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %18

; <label>:18                                      ; preds = %16, %14
  %19 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %20 = bitcast [2 x i32]* %19 to i32*
  %21 = getelementptr inbounds i32* %20, i64 1
  %22 = load i32* %21, align 4
  %23 = icmp ne i32 %22, 2
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %18
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0))
  br label %28

; <label>:26                                      ; preds = %18
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %28

; <label>:28                                      ; preds = %26, %24
  %29 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %30 = bitcast [2 x i32]* %29 to i32*
  %31 = getelementptr inbounds i32* %30, i64 2
  %32 = load i32* %31, align 4
  %33 = icmp ne i32 %32, 3
  br i1 %33, label %34, label %36

; <label>:34                                      ; preds = %28
  %35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0))
  br label %38

; <label>:36                                      ; preds = %28
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %38

; <label>:38                                      ; preds = %36, %34
  %39 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %40 = bitcast [2 x i32]* %39 to i32*
  %41 = getelementptr inbounds i32* %40, i64 3
  %42 = load i32* %41, align 4
  %43 = icmp ne i32 %42, 4
  br i1 %43, label %44, label %46

; <label>:44                                      ; preds = %38
  %45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0))
  br label %48

; <label>:46                                      ; preds = %38
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %48

; <label>:48                                      ; preds = %46, %44
  %49 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %50 = getelementptr inbounds [2 x i32]* %49, i64 0
  %51 = getelementptr inbounds [2 x i32]* %50, i32 0, i32 0
  %52 = getelementptr inbounds i32* %51, i64 0
  %53 = load i32* %52, align 4
  %54 = icmp ne i32 %53, 1
  br i1 %54, label %55, label %57

; <label>:55                                      ; preds = %48
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0))
  br label %59

; <label>:57                                      ; preds = %48
  %58 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %59

; <label>:59                                      ; preds = %57, %55
  %60 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %61 = getelementptr inbounds [2 x i32]* %60, i64 0
  %62 = getelementptr inbounds [2 x i32]* %61, i32 0, i32 0
  %63 = getelementptr inbounds i32* %62, i64 1
  %64 = load i32* %63, align 4
  %65 = icmp ne i32 %64, 2
  br i1 %65, label %66, label %68

; <label>:66                                      ; preds = %59
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i32 0, i32 0))
  br label %70

; <label>:68                                      ; preds = %59
  %69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %70

; <label>:70                                      ; preds = %68, %66
  %71 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %72 = getelementptr inbounds [2 x i32]* %71, i64 1
  %73 = getelementptr inbounds [2 x i32]* %72, i32 0, i32 0
  %74 = getelementptr inbounds i32* %73, i64 0
  %75 = load i32* %74, align 4
  %76 = icmp ne i32 %75, 3
  br i1 %76, label %77, label %79

; <label>:77                                      ; preds = %70
  %78 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i32 0, i32 0))
  br label %81

; <label>:79                                      ; preds = %70
  %80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %81

; <label>:81                                      ; preds = %79, %77
  %82 = getelementptr inbounds [2 x [2 x i32]]* %arr, i32 0, i32 0
  %83 = getelementptr inbounds [2 x i32]* %82, i64 1
  %84 = getelementptr inbounds [2 x i32]* %83, i32 0, i32 0
  %85 = getelementptr inbounds i32* %84, i64 1
  %86 = load i32* %85, align 4
  %87 = icmp ne i32 %86, 4
  br i1 %87, label %88, label %90

; <label>:88                                      ; preds = %81
  %89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i32 0, i32 0))
  br label %92

; <label>:90                                      ; preds = %81
  %91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %92

; <label>:92                                      ; preds = %90, %88
  %93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %95 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 0
  %96 = getelementptr inbounds %struct.point* %95, i32 0, i32 0
  store i32 1, i32* %96, align 4
  %97 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 0
  %98 = getelementptr inbounds %struct.point* %97, i32 0, i32 1
  store i32 2, i32* %98, align 4
  %99 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 1
  %100 = getelementptr inbounds %struct.point* %99, i32 0, i32 0
  store i32 3, i32* %100, align 4
  %101 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 1
  %102 = getelementptr inbounds %struct.point* %101, i32 0, i32 1
  store i32 4, i32* %102, align 4
  %103 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 2
  %104 = getelementptr inbounds %struct.point* %103, i32 0, i32 0
  store i32 5, i32* %104, align 4
  %105 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 2
  %106 = getelementptr inbounds %struct.point* %105, i32 0, i32 1
  store i32 6, i32* %106, align 4
  %107 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 3
  %108 = getelementptr inbounds %struct.point* %107, i32 0, i32 0
  store i32 7, i32* %108, align 4
  %109 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i64 3
  %110 = getelementptr inbounds %struct.point* %109, i32 0, i32 1
  store i32 8, i32* %110, align 4
  %111 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %112 = getelementptr inbounds %struct.point* %111, i64 3
  %113 = getelementptr inbounds %struct.point* %112, i32 0, i32 0
  %114 = load i32* %113, align 4
  %115 = icmp ne i32 %114, 7
  br i1 %115, label %116, label %122

; <label>:116                                     ; preds = %92
  %117 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %118 = getelementptr inbounds %struct.point* %117, i64 3
  %119 = getelementptr inbounds %struct.point* %118, i32 0, i32 0
  %120 = load i32* %119, align 4
  %121 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str10, i32 0, i32 0), i32 %120)
  br label %124

; <label>:122                                     ; preds = %92
  %123 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %124

; <label>:124                                     ; preds = %122, %116
  %125 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %126 = getelementptr inbounds %struct.point* %125, i64 3
  %127 = getelementptr inbounds %struct.point* %126, i32 0, i32 1
  %128 = load i32* %127, align 4
  %129 = icmp ne i32 %128, 8
  br i1 %129, label %130, label %136

; <label>:130                                     ; preds = %124
  %131 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %132 = getelementptr inbounds %struct.point* %131, i64 3
  %133 = getelementptr inbounds %struct.point* %132, i32 0, i32 1
  %134 = load i32* %133, align 4
  %135 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str11, i32 0, i32 0), i32 %134)
  br label %138

; <label>:136                                     ; preds = %124
  %137 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %138

; <label>:138                                     ; preds = %136, %130
  %139 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %140 = getelementptr inbounds %struct.point* %139, i64 3
  %141 = bitcast %struct.point* %140 to i32*
  %142 = load i32* %141, align 4
  %143 = icmp ne i32 %142, 7
  br i1 %143, label %144, label %146

; <label>:144                                     ; preds = %138
  %145 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str12, i32 0, i32 0))
  br label %148

; <label>:146                                     ; preds = %138
  %147 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %148

; <label>:148                                     ; preds = %146, %144
  %149 = getelementptr inbounds [4 x %struct.point]* %pointArr, i32 0, i32 0
  %150 = getelementptr inbounds %struct.point* %149, i64 3
  %151 = bitcast %struct.point* %150 to i32*
  %152 = getelementptr inbounds i32* %151, i64 1
  %153 = load i32* %152, align 4
  %154 = icmp ne i32 %153, 8
  br i1 %154, label %155, label %157

; <label>:155                                     ; preds = %148
  %156 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str13, i32 0, i32 0))
  br label %159

; <label>:157                                     ; preds = %148
  %158 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  br label %159

; <label>:159                                     ; preds = %157, %155
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
