; ModuleID = './testUnion.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i32, %union.anon }
%union.anon = type { double }

@.str = private unnamed_addr constant [23 x i8] c"This S has type INTS.\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"%d, %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"This S has type FLOATS.\0A\00", align 1
@.str3 = private unnamed_addr constant [48 x i8] c"s->u.s_floats[0] != - s->u.s_floats[1]: %f, %f\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"This S has type DOUBLE.\0A\00", align 1
@.str5 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"s->u.s_double is off: %f\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @do_something(%struct.S* %s) #0 {
  %1 = alloca %struct.S*, align 8
  store %struct.S* %s, %struct.S** %1, align 8
  %2 = load %struct.S** %1, align 8
  %3 = getelementptr inbounds %struct.S* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  switch i32 %4, label %90 [
    i32 0, label %5
    i32 1, label %18
    i32 2, label %63
  ]

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0))
  %7 = load %struct.S** %1, align 8
  %8 = getelementptr inbounds %struct.S* %7, i32 0, i32 1
  %9 = bitcast %union.anon* %8 to [2 x i32]*
  %10 = getelementptr inbounds [2 x i32]* %9, i32 0, i64 0
  %11 = load i32* %10, align 4
  %12 = load %struct.S** %1, align 8
  %13 = getelementptr inbounds %struct.S* %12, i32 0, i32 1
  %14 = bitcast %union.anon* %13 to [2 x i32]*
  %15 = getelementptr inbounds [2 x i32]* %14, i32 0, i64 1
  %16 = load i32* %15, align 4
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %11, i32 %16)
  br label %90

; <label>:18                                      ; preds = %0
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0))
  %20 = load %struct.S** %1, align 8
  %21 = getelementptr inbounds %struct.S* %20, i32 0, i32 1
  %22 = bitcast %union.anon* %21 to [2 x float]*
  %23 = getelementptr inbounds [2 x float]* %22, i32 0, i64 0
  %24 = load float* %23, align 4
  %25 = fmul float 1.000000e+04, %24
  %26 = fptosi float %25 to i32
  %27 = load %struct.S** %1, align 8
  %28 = getelementptr inbounds %struct.S* %27, i32 0, i32 1
  %29 = bitcast %union.anon* %28 to [2 x float]*
  %30 = getelementptr inbounds [2 x float]* %29, i32 0, i64 1
  %31 = load float* %30, align 4
  %32 = fmul float 1.000000e+04, %31
  %33 = fptosi float %32 to i32
  %34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %26, i32 %33)
  %35 = load %struct.S** %1, align 8
  %36 = getelementptr inbounds %struct.S* %35, i32 0, i32 1
  %37 = bitcast %union.anon* %36 to [2 x float]*
  %38 = getelementptr inbounds [2 x float]* %37, i32 0, i64 0
  %39 = load float* %38, align 4
  %40 = load %struct.S** %1, align 8
  %41 = getelementptr inbounds %struct.S* %40, i32 0, i32 1
  %42 = bitcast %union.anon* %41 to [2 x float]*
  %43 = getelementptr inbounds [2 x float]* %42, i32 0, i64 1
  %44 = load float* %43, align 4
  %45 = fsub float -0.000000e+00, %44
  %46 = fcmp une float %39, %45
  br i1 %46, label %47, label %62

; <label>:47                                      ; preds = %18
  %48 = load %struct.S** %1, align 8
  %49 = getelementptr inbounds %struct.S* %48, i32 0, i32 1
  %50 = bitcast %union.anon* %49 to [2 x float]*
  %51 = getelementptr inbounds [2 x float]* %50, i32 0, i64 0
  %52 = load float* %51, align 4
  %53 = fpext float %52 to double
  %54 = load %struct.S** %1, align 8
  %55 = getelementptr inbounds %struct.S* %54, i32 0, i32 1
  %56 = bitcast %union.anon* %55 to [2 x float]*
  %57 = getelementptr inbounds [2 x float]* %56, i32 0, i64 1
  %58 = load float* %57, align 4
  %59 = fsub float -0.000000e+00, %58
  %60 = fpext float %59 to double
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([48 x i8]* @.str3, i32 0, i32 0), double %53, double %60)
  br label %62

; <label>:62                                      ; preds = %47, %18
  br label %90

; <label>:63                                      ; preds = %0
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0))
  %65 = load %struct.S** %1, align 8
  %66 = getelementptr inbounds %struct.S* %65, i32 0, i32 1
  %67 = bitcast %union.anon* %66 to double*
  %68 = load double* %67, align 8
  %69 = fmul double 1.000000e+04, %68
  %70 = fptosi double %69 to i32
  %71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str5, i32 0, i32 0), i32 %70)
  %72 = load %struct.S** %1, align 8
  %73 = getelementptr inbounds %struct.S* %72, i32 0, i32 1
  %74 = bitcast %union.anon* %73 to double*
  %75 = load double* %74, align 8
  %76 = fcmp ogt double %75, 1.570800e+00
  br i1 %76, label %83, label %77

; <label>:77                                      ; preds = %63
  %78 = load %struct.S** %1, align 8
  %79 = getelementptr inbounds %struct.S* %78, i32 0, i32 1
  %80 = bitcast %union.anon* %79 to double*
  %81 = load double* %80, align 8
  %82 = fcmp olt double %81, 1.570790e+00
  br i1 %82, label %83, label %89

; <label>:83                                      ; preds = %77, %63
  %84 = load %struct.S** %1, align 8
  %85 = getelementptr inbounds %struct.S* %84, i32 0, i32 1
  %86 = bitcast %union.anon* %85 to double*
  %87 = load double* %86, align 8
  %88 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i32 0, i32 0), double %87)
  br label %89

; <label>:89                                      ; preds = %83, %77
  br label %90

; <label>:90                                      ; preds = %0, %89, %62, %5
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %esses = alloca [3 x %struct.S], align 16
  %numEsses = alloca i32, align 4
  %newStruct = alloca %struct.S, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 3, i32* %numEsses, align 4
  %2 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 0
  %3 = getelementptr inbounds %struct.S* %2, i32 0, i32 0
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 0
  %5 = getelementptr inbounds %struct.S* %4, i32 0, i32 1
  %6 = bitcast %union.anon* %5 to [2 x i32]*
  %7 = getelementptr inbounds [2 x i32]* %6, i32 0, i64 0
  store i32 2123456789, i32* %7, align 4
  %8 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 0
  %9 = getelementptr inbounds %struct.S* %8, i32 0, i32 1
  %10 = bitcast %union.anon* %9 to [2 x i32]*
  %11 = getelementptr inbounds [2 x i32]* %10, i32 0, i64 1
  store i32 -2123456789, i32* %11, align 4
  %12 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 1
  %13 = getelementptr inbounds %struct.S* %12, i32 0, i32 0
  store i32 1, i32* %13, align 4
  %14 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 1
  %15 = getelementptr inbounds %struct.S* %14, i32 0, i32 1
  %16 = bitcast %union.anon* %15 to [2 x float]*
  %17 = getelementptr inbounds [2 x float]* %16, i32 0, i64 0
  store float 0x400921FB60000000, float* %17, align 4
  %18 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 1
  %19 = getelementptr inbounds %struct.S* %18, i32 0, i32 1
  %20 = bitcast %union.anon* %19 to [2 x float]*
  %21 = getelementptr inbounds [2 x float]* %20, i32 0, i64 1
  store float 0xC00921FB60000000, float* %21, align 4
  %22 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 2
  %23 = getelementptr inbounds %struct.S* %22, i32 0, i32 0
  store i32 2, i32* %23, align 4
  %24 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 2
  %25 = getelementptr inbounds %struct.S* %24, i32 0, i32 1
  %26 = bitcast %union.anon* %25 to double*
  store double 0x3FF921FB54442D11, double* %26, align 8
  %27 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 1
  %28 = bitcast %struct.S* %newStruct to i8*
  %29 = bitcast %struct.S* %27 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 16, i32 8, i1 false)
  store i32 0, i32* %i, align 4
  br label %30

; <label>:30                                      ; preds = %38, %0
  %31 = load i32* %i, align 4
  %32 = load i32* %numEsses, align 4
  %33 = icmp slt i32 %31, %32
  br i1 %33, label %34, label %41

; <label>:34                                      ; preds = %30
  %35 = load i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [3 x %struct.S]* %esses, i32 0, i64 %36
  call void @do_something(%struct.S* %37)
  br label %38

; <label>:38                                      ; preds = %34
  %39 = load i32* %i, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %i, align 4
  br label %30

; <label>:41                                      ; preds = %30
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
