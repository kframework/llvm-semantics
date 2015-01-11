; ModuleID = './merge-sort.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d,\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %head = alloca i32*, align 8
  %curr = alloca i32*, align 8
  store i32 0, i32* %1
  store i32* null, i32** %head, align 8
  %2 = load i32** %head, align 8
  %3 = call i32* @listCons(i32* %2, i32 20)
  store i32* %3, i32** %head, align 8
  %4 = load i32** %head, align 8
  %5 = call i32* @listCons(i32* %4, i32 25)
  store i32* %5, i32** %head, align 8
  %6 = load i32** %head, align 8
  %7 = call i32* @listCons(i32* %6, i32 15)
  store i32* %7, i32** %head, align 8
  %8 = load i32** %head, align 8
  %9 = call i32* @listCons(i32* %8, i32 30)
  store i32* %9, i32** %head, align 8
  %10 = load i32** %head, align 8
  %11 = call i32* @listCons(i32* %10, i32 10)
  store i32* %11, i32** %head, align 8
  %12 = load i32** %head, align 8
  %13 = call i32* @listCons(i32* %12, i32 35)
  store i32* %13, i32** %head, align 8
  %14 = load i32** %head, align 8
  %15 = call i32* @fsl_mergesort(i32* %14)
  store i32* %15, i32** %head, align 8
  %16 = load i32** %head, align 8
  store i32* %16, i32** %curr, align 8
  br label %17

; <label>:17                                      ; preds = %20, %0
  %18 = load i32** %curr, align 8
  %19 = icmp ne i32* %18, null
  br i1 %19, label %20, label %28

; <label>:20                                      ; preds = %17
  %21 = load i32** %curr, align 8
  %22 = load i32* %21, align 4
  %23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %22)
  %24 = load i32** %curr, align 8
  %25 = getelementptr inbounds i32* %24, i64 1
  %26 = bitcast i32* %25 to i32**
  %27 = load i32** %26, align 8
  store i32* %27, i32** %curr, align 8
  br label %17

; <label>:28                                      ; preds = %17
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32* @listCons(i32* %p, i32 %n) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %next = alloca i32*, align 8
  store i32* %p, i32** %1, align 8
  store i32 %n, i32* %2, align 4
  %3 = call noalias i8* @malloc(i64 12) #3
  %4 = bitcast i8* %3 to i32*
  store i32* %4, i32** %next, align 8
  %5 = load i32* %2, align 4
  %6 = load i32** %next, align 8
  store i32 %5, i32* %6, align 4
  %7 = load i32** %1, align 8
  %8 = load i32** %next, align 8
  %9 = getelementptr inbounds i32* %8, i64 1
  %10 = bitcast i32* %9 to i32**
  store i32* %7, i32** %10, align 8
  %11 = load i32** %next, align 8
  ret i32* %11
}

; Function Attrs: nounwind uwtable
define i32* @fsl_mergesort(i32* %l) #0 {
  %1 = alloca i32*, align 8
  %a = alloca i32*, align 8
  %b = alloca i32*, align 8
  %e = alloca i32*, align 8
  %t = alloca i32*, align 8
  %h = alloca i32*, align 8
  store i32* %l, i32** %1, align 8
  %2 = load i32** %1, align 8
  %3 = icmp ne i32* %2, null
  br i1 %3, label %4, label %106

; <label>:4                                       ; preds = %0
  %5 = load i32** %1, align 8
  %6 = getelementptr inbounds i32* %5, i64 1
  %7 = bitcast i32* %6 to i32**
  %8 = load i32** %7, align 8
  %9 = icmp ne i32* %8, null
  br i1 %9, label %10, label %106

; <label>:10                                      ; preds = %4
  store i32* null, i32** %a, align 8
  store i32* null, i32** %b, align 8
  %11 = load i32** %1, align 8
  %12 = getelementptr inbounds i32* %11, i64 1
  %13 = bitcast i32* %12 to i32**
  %14 = load i32** %13, align 8
  %15 = load i32* %14, align 4
  %16 = load i32** %1, align 8
  %17 = getelementptr inbounds i32* %16, i64 1
  %18 = bitcast i32* %17 to i32**
  %19 = load i32** %18, align 8
  store i32 %15, i32* %19, align 4
  br label %20

; <label>:20                                      ; preds = %47, %10
  %21 = load i32** %1, align 8
  %22 = icmp ne i32* %21, null
  br i1 %22, label %23, label %48

; <label>:23                                      ; preds = %20
  %24 = load i32** %1, align 8
  store i32* %24, i32** %e, align 8
  %25 = load i32** %e, align 8
  %26 = getelementptr inbounds i32* %25, i64 1
  %27 = bitcast i32* %26 to i32**
  %28 = load i32** %27, align 8
  store i32* %28, i32** %1, align 8
  %29 = load i32** %a, align 8
  %30 = load i32** %e, align 8
  %31 = getelementptr inbounds i32* %30, i64 1
  %32 = bitcast i32* %31 to i32**
  store i32* %29, i32** %32, align 8
  %33 = load i32** %e, align 8
  store i32* %33, i32** %a, align 8
  %34 = load i32** %1, align 8
  %35 = icmp ne i32* %34, null
  br i1 %35, label %36, label %47

; <label>:36                                      ; preds = %23
  %37 = load i32** %1, align 8
  store i32* %37, i32** %e, align 8
  %38 = load i32** %e, align 8
  %39 = getelementptr inbounds i32* %38, i64 1
  %40 = bitcast i32* %39 to i32**
  %41 = load i32** %40, align 8
  store i32* %41, i32** %1, align 8
  %42 = load i32** %b, align 8
  %43 = load i32** %e, align 8
  %44 = getelementptr inbounds i32* %43, i64 1
  %45 = bitcast i32* %44 to i32**
  store i32* %42, i32** %45, align 8
  %46 = load i32** %e, align 8
  store i32* %46, i32** %b, align 8
  br label %47

; <label>:47                                      ; preds = %36, %23
  br label %20

; <label>:48                                      ; preds = %20
  %49 = load i32** %a, align 8
  %50 = call i32* @fsl_mergesort(i32* %49)
  store i32* %50, i32** %a, align 8
  %51 = load i32** %b, align 8
  %52 = call i32* @fsl_mergesort(i32* %51)
  store i32* %52, i32** %b, align 8
  store i32* null, i32** %h, align 8
  store i32* null, i32** %t, align 8
  br label %53

; <label>:53                                      ; preds = %89, %48
  %54 = load i32** %a, align 8
  %55 = icmp ne i32* %54, null
  br i1 %55, label %56, label %59

; <label>:56                                      ; preds = %53
  %57 = load i32** %b, align 8
  %58 = icmp ne i32* %57, null
  br label %59

; <label>:59                                      ; preds = %56, %53
  %60 = phi i1 [ false, %53 ], [ %58, %56 ]
  br i1 %60, label %61, label %91

; <label>:61                                      ; preds = %59
  %62 = load i32** %b, align 8
  %63 = load i32* %62, align 4
  %64 = load i32** %a, align 8
  %65 = load i32* %64, align 4
  %66 = icmp sgt i32 %63, %65
  br i1 %66, label %67, label %73

; <label>:67                                      ; preds = %61
  %68 = load i32** %a, align 8
  store i32* %68, i32** %e, align 8
  %69 = load i32** %a, align 8
  %70 = getelementptr inbounds i32* %69, i64 1
  %71 = bitcast i32* %70 to i32**
  %72 = load i32** %71, align 8
  store i32* %72, i32** %a, align 8
  br label %79

; <label>:73                                      ; preds = %61
  %74 = load i32** %b, align 8
  store i32* %74, i32** %e, align 8
  %75 = load i32** %b, align 8
  %76 = getelementptr inbounds i32* %75, i64 1
  %77 = bitcast i32* %76 to i32**
  %78 = load i32** %77, align 8
  store i32* %78, i32** %b, align 8
  br label %79

; <label>:79                                      ; preds = %73, %67
  %80 = load i32** %h, align 8
  %81 = icmp ne i32* %80, null
  br i1 %81, label %82, label %87

; <label>:82                                      ; preds = %79
  %83 = load i32** %e, align 8
  %84 = load i32** %t, align 8
  %85 = getelementptr inbounds i32* %84, i64 1
  %86 = bitcast i32* %85 to i32**
  store i32* %83, i32** %86, align 8
  br label %89

; <label>:87                                      ; preds = %79
  %88 = load i32** %e, align 8
  store i32* %88, i32** %h, align 8
  br label %89

; <label>:89                                      ; preds = %87, %82
  %90 = load i32** %e, align 8
  store i32* %90, i32** %t, align 8
  br label %53

; <label>:91                                      ; preds = %59
  %92 = load i32** %a, align 8
  %93 = icmp ne i32* %92, null
  br i1 %93, label %94, label %99

; <label>:94                                      ; preds = %91
  %95 = load i32** %a, align 8
  %96 = load i32** %t, align 8
  %97 = getelementptr inbounds i32* %96, i64 1
  %98 = bitcast i32* %97 to i32**
  store i32* %95, i32** %98, align 8
  br label %104

; <label>:99                                      ; preds = %91
  %100 = load i32** %b, align 8
  %101 = load i32** %t, align 8
  %102 = getelementptr inbounds i32* %101, i64 1
  %103 = bitcast i32* %102 to i32**
  store i32* %100, i32** %103, align 8
  br label %104

; <label>:104                                     ; preds = %99, %94
  %105 = load i32** %h, align 8
  store i32* %105, i32** %1, align 8
  br label %106

; <label>:106                                     ; preds = %104, %4, %0
  %107 = load i32** %1, align 8
  ret i32* %107
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
