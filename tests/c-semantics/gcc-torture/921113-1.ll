; ModuleID = './921113-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.vector_t = type { float, float }
%struct.struct_list = type { float }

@pos = global [1 x %struct.vector_t] zeroinitializer, align 4
@limit = global [2 x %struct.vector_t] [%struct.vector_t zeroinitializer, %struct.vector_t { float 1.000000e+00, float 1.000000e+00 }], align 16

; Function Attrs: nounwind uwtable
define void @w(float %x, float %y) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %x, float* %1, align 4
  store float %y, float* %2, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @f1(float %x, float %y) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %x, float* %1, align 4
  store float %y, float* %2, align 4
  %3 = load float* %1, align 4
  %4 = fcmp une float %3, 0.000000e+00
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load float* %2, align 4
  %7 = fcmp une float %6, 0.000000e+00
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5, %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @f2(float %x, float %y) #0 {
  %1 = alloca float, align 4
  %2 = alloca float, align 4
  store float %x, float* %1, align 4
  store float %y, float* %2, align 4
  %3 = load float* %1, align 4
  %4 = fcmp une float %3, 1.000000e+00
  br i1 %4, label %8, label %5

; <label>:5                                       ; preds = %0
  %6 = load float* %2, align 4
  %7 = fcmp une float %6, 1.000000e+00
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5, %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  ret void
}

; Function Attrs: nounwind uwtable
define void @gitter(i32 %count, %struct.vector_t* %pos, %struct.struct_list* %list, i32* %nww, %struct.vector_t* %limit, float %r) #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.vector_t*, align 8
  %3 = alloca %struct.struct_list*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca %struct.vector_t*, align 8
  %6 = alloca float, align 4
  %d = alloca float, align 4
  %gitt = alloca [128 x [128 x i32]], align 16
  store i32 %count, i32* %1, align 4
  store %struct.vector_t* %pos, %struct.vector_t** %2, align 8
  store %struct.struct_list* %list, %struct.struct_list** %3, align 8
  store i32* %nww, i32** %4, align 8
  store %struct.vector_t* %limit, %struct.vector_t** %5, align 8
  store float %r, float* %6, align 4
  %7 = load %struct.vector_t** %5, align 8
  %8 = getelementptr inbounds %struct.vector_t* %7, i64 0
  %9 = getelementptr inbounds %struct.vector_t* %8, i32 0, i32 0
  %10 = load float* %9, align 4
  %11 = load %struct.vector_t** %5, align 8
  %12 = getelementptr inbounds %struct.vector_t* %11, i64 0
  %13 = getelementptr inbounds %struct.vector_t* %12, i32 0, i32 1
  %14 = load float* %13, align 4
  call void @f1(float %10, float %14)
  %15 = load %struct.vector_t** %5, align 8
  %16 = getelementptr inbounds %struct.vector_t* %15, i64 1
  %17 = getelementptr inbounds %struct.vector_t* %16, i32 0, i32 0
  %18 = load float* %17, align 4
  %19 = load %struct.vector_t** %5, align 8
  %20 = getelementptr inbounds %struct.vector_t* %19, i64 1
  %21 = getelementptr inbounds %struct.vector_t* %20, i32 0, i32 1
  %22 = load float* %21, align 4
  call void @f2(float %18, float %22)
  %23 = load i32** %4, align 8
  store i32 0, i32* %23, align 4
  %24 = load %struct.vector_t** %2, align 8
  %25 = getelementptr inbounds %struct.vector_t* %24, i64 0
  %26 = getelementptr inbounds %struct.vector_t* %25, i32 0, i32 0
  %27 = load float* %26, align 4
  store float %27, float* %d, align 4
  %28 = load float* %d, align 4
  %29 = fpext float %28 to double
  %30 = fcmp ole double %29, 0.000000e+00
  br i1 %30, label %31, label %47

; <label>:31                                      ; preds = %0
  %32 = load float* %d, align 4
  %33 = load float* %6, align 4
  call void @w(float %32, float %33)
  %34 = load float* %d, align 4
  %35 = fpext float %34 to double
  %36 = load float* %6, align 4
  %37 = fpext float %36 to double
  %38 = fmul double %37, 5.000000e-01
  %39 = fcmp ole double %35, %38
  br i1 %39, label %40, label %46

; <label>:40                                      ; preds = %31
  %41 = load float* %d, align 4
  %42 = load float* %6, align 4
  call void @w(float %41, float %42)
  %43 = load %struct.struct_list** %3, align 8
  %44 = getelementptr inbounds %struct.struct_list* %43, i64 0
  %45 = getelementptr inbounds %struct.struct_list* %44, i32 0, i32 0
  store float 1.000000e+00, float* %45, align 4
  br label %46

; <label>:46                                      ; preds = %40, %31
  br label %47

; <label>:47                                      ; preds = %46, %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %nww = alloca i32, align 4
  %list = alloca %struct.struct_list, align 4
  store i32 0, i32* %1
  call void @gitter(i32 1, %struct.vector_t* getelementptr inbounds ([1 x %struct.vector_t]* @pos, i32 0, i32 0), %struct.struct_list* %list, i32* %nww, %struct.vector_t* getelementptr inbounds ([2 x %struct.vector_t]* @limit, i32 0, i32 0), float 1.000000e+00)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
