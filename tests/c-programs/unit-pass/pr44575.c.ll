; ModuleID = './pr44575.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { [3 x float] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@fails = global i32 0, align 4
@a = common global [5 x %struct.S] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @check(i32 %z, ...) #0 {
  %1 = alloca i32, align 4
  %arg = alloca %struct.S, align 4
  %p = alloca %struct.S*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %i = alloca i32, align 4
  %2 = alloca %struct.S, align 4
  store i32 %z, i32* %1, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %k, align 4
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  store i32 2, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %68, %0
  %6 = load i32, i32* %i, align 4
  %7 = icmp slt i32 %6, 4
  br i1 %7, label %8, label %71

; <label>:8                                       ; preds = %5
  store %struct.S* null, %struct.S** %p, align 8
  %9 = load i32, i32* %j, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %j, align 4
  %11 = load i32, i32* %k, align 4
  %12 = add nsw i32 %11, 2
  store i32 %12, i32* %k, align 4
  %13 = load i32, i32* %1, align 4
  %14 = shl i32 %13, 4
  %15 = load i32, i32* %i, align 4
  %16 = or i32 %14, %15
  switch i32 %16, label %45 [
    i32 18, label %17
    i32 19, label %17
  ]

; <label>:17                                      ; preds = %8, %8
  store %struct.S* getelementptr inbounds ([5 x %struct.S], [5 x %struct.S]* @a, i32 0, i64 2), %struct.S** %p, align 8
  %18 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %19 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %18, i32 0, i32 1
  %20 = load i32, i32* %19
  %21 = icmp ule i32 %20, 144
  br i1 %21, label %22, label %36

; <label>:22                                      ; preds = %17
  %23 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %18, i32 0, i32 3
  %24 = load i8*, i8** %23
  %25 = getelementptr i8, i8* %24, i32 %20
  %26 = getelementptr i8, i8* %25, i32 16
  %27 = bitcast %struct.S* %2 to { double, double }*
  %28 = bitcast i8* %25 to double*
  %29 = load double, double* %28
  %30 = getelementptr inbounds { double, double }, { double, double }* %27, i32 0, i32 0
  store double %29, double* %30
  %31 = bitcast i8* %26 to double*
  %32 = load double, double* %31
  %33 = getelementptr inbounds { double, double }, { double, double }* %27, i32 0, i32 1
  store double %32, double* %33
  %34 = bitcast { double, double }* %27 to %struct.S*
  %35 = add i32 %20, 32
  store i32 %35, i32* %19
  br label %41

; <label>:36                                      ; preds = %17
  %37 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %18, i32 0, i32 2
  %38 = load i8*, i8** %37
  %39 = bitcast i8* %38 to %struct.S*
  %40 = getelementptr i8, i8* %38, i32 16
  store i8* %40, i8** %37
  br label %41

; <label>:41                                      ; preds = %36, %22
  %42 = phi %struct.S* [ %34, %22 ], [ %39, %36 ]
  %43 = bitcast %struct.S* %arg to i8*
  %44 = bitcast %struct.S* %42 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %43, i8* %44, i64 12, i32 4, i1 false)
  br label %48

; <label>:45                                      ; preds = %8
  %46 = load i32, i32* @fails, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* @fails, align 4
  br label %48

; <label>:48                                      ; preds = %45, %41
  %49 = load %struct.S*, %struct.S** %p, align 8
  %50 = icmp ne %struct.S* %49, null
  br i1 %50, label %51, label %63

; <label>:51                                      ; preds = %48
  %52 = load %struct.S*, %struct.S** %p, align 8
  %53 = getelementptr inbounds %struct.S, %struct.S* %52, i32 0, i32 0
  %54 = getelementptr inbounds [3 x float], [3 x float]* %53, i32 0, i64 2
  %55 = load float, float* %54, align 4
  %56 = getelementptr inbounds %struct.S, %struct.S* %arg, i32 0, i32 0
  %57 = getelementptr inbounds [3 x float], [3 x float]* %56, i32 0, i64 2
  %58 = load float, float* %57, align 4
  %59 = fcmp une float %55, %58
  br i1 %59, label %60, label %63

; <label>:60                                      ; preds = %51
  %61 = load i32, i32* @fails, align 4
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* @fails, align 4
  br label %63

; <label>:63                                      ; preds = %60, %51, %48
  %64 = load i32, i32* @fails, align 4
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %67

; <label>:66                                      ; preds = %63
  br label %71

; <label>:67                                      ; preds = %63
  br label %68

; <label>:68                                      ; preds = %67
  %69 = load i32, i32* %i, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %i, align 4
  br label %5

; <label>:71                                      ; preds = %66, %5
  %72 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %73 = bitcast %struct.__va_list_tag* %72 to i8*
  call void @llvm.va_end(i8* %73)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca { <2 x float>, float }
  %3 = alloca { <2 x float>, float }
  store i32 0, i32* %1
  store float -4.902600e+04, float* getelementptr inbounds ([5 x %struct.S], [5 x %struct.S]* @a, i32 0, i64 2, i32 0, i64 2), align 4
  %4 = bitcast { <2 x float>, float }* %2 to i8*
  %5 = bitcast %struct.S* getelementptr inbounds ([5 x %struct.S], [5 x %struct.S]* @a, i32 0, i64 2) to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 12, i32 0, i1 false)
  %6 = getelementptr { <2 x float>, float }, { <2 x float>, float }* %2, i32 0, i32 0
  %7 = load <2 x float>, <2 x float>* %6, align 1
  %8 = getelementptr { <2 x float>, float }, { <2 x float>, float }* %2, i32 0, i32 1
  %9 = load float, float* %8, align 1
  %10 = bitcast { <2 x float>, float }* %3 to i8*
  %11 = bitcast %struct.S* getelementptr inbounds ([5 x %struct.S], [5 x %struct.S]* @a, i32 0, i64 2) to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 12, i32 0, i1 false)
  %12 = getelementptr { <2 x float>, float }, { <2 x float>, float }* %3, i32 0, i32 0
  %13 = load <2 x float>, <2 x float>* %12, align 1
  %14 = getelementptr { <2 x float>, float }, { <2 x float>, float }* %3, i32 0, i32 1
  %15 = load float, float* %14, align 1
  call void (i32, ...) @check(i32 1, <2 x float> %7, float %9, <2 x float> %13, float %15)
  %16 = load i32, i32* @fails, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:19                                      ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
