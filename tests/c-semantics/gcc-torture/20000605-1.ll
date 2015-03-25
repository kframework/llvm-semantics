; ModuleID = './20000605-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._RenderInfo = type { i32, float, i32 }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %info = alloca %struct._RenderInfo, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct._RenderInfo* %info, i32 0, i32 0
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds %struct._RenderInfo* %info, i32 0, i32 2
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds %struct._RenderInfo* %info, i32 0, i32 1
  store float 1.000000e+00, float* %4, align 4
  %5 = call i32 @render_image_rgb_a(%struct._RenderInfo* %info)
  %6 = icmp ne i32 %5, 256
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %10 = load i32* %1
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define internal i32 @render_image_rgb_a(%struct._RenderInfo* %info) #0 {
  %1 = alloca %struct._RenderInfo*, align 8
  %y = alloca i32, align 4
  %ye = alloca i32, align 4
  %error = alloca float, align 4
  %step = alloca float, align 4
  store %struct._RenderInfo* %info, %struct._RenderInfo** %1, align 8
  %2 = load %struct._RenderInfo** %1, align 8
  %3 = getelementptr inbounds %struct._RenderInfo* %2, i32 0, i32 0
  %4 = load i32* %3, align 4
  store i32 %4, i32* %y, align 4
  store i32 256, i32* %ye, align 4
  %5 = load %struct._RenderInfo** %1, align 8
  %6 = getelementptr inbounds %struct._RenderInfo* %5, i32 0, i32 1
  %7 = load float* %6, align 4
  %8 = fpext float %7 to double
  %9 = fdiv double 1.000000e+00, %8
  %10 = fptrunc double %9 to float
  store float %10, float* %step, align 4
  %11 = load i32* %y, align 4
  %12 = sitofp i32 %11 to float
  %13 = load float* %step, align 4
  %14 = fmul float %12, %13
  store float %14, float* %error, align 4
  %15 = load float* %error, align 4
  %16 = fptosi float %15 to i32
  %17 = sitofp i32 %16 to float
  %18 = load float* %step, align 4
  %19 = fsub float %17, %18
  %20 = load float* %error, align 4
  %21 = fsub float %20, %19
  store float %21, float* %error, align 4
  br label %22

; <label>:22                                      ; preds = %46, %0
  %23 = load i32* %y, align 4
  %24 = load i32* %ye, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %49

; <label>:26                                      ; preds = %22
  %27 = load float* %error, align 4
  %28 = fpext float %27 to double
  %29 = fcmp oge double %28, 1.000000e+00
  br i1 %29, label %30, label %42

; <label>:30                                      ; preds = %26
  %31 = load float* %error, align 4
  %32 = fptosi float %31 to i32
  %33 = load %struct._RenderInfo** %1, align 8
  %34 = getelementptr inbounds %struct._RenderInfo* %33, i32 0, i32 2
  %35 = load i32* %34, align 4
  %36 = add nsw i32 %35, %32
  store i32 %36, i32* %34, align 4
  %37 = load float* %error, align 4
  %38 = fptosi float %37 to i32
  %39 = sitofp i32 %38 to float
  %40 = load float* %error, align 4
  %41 = fsub float %40, %39
  store float %41, float* %error, align 4
  call void @bar()
  br label %42

; <label>:42                                      ; preds = %30, %26
  %43 = load float* %step, align 4
  %44 = load float* %error, align 4
  %45 = fadd float %44, %43
  store float %45, float* %error, align 4
  br label %46

; <label>:46                                      ; preds = %42
  %47 = load i32* %y, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %y, align 4
  br label %22

; <label>:49                                      ; preds = %22
  %50 = load %struct._RenderInfo** %1, align 8
  %51 = getelementptr inbounds %struct._RenderInfo* %50, i32 0, i32 2
  %52 = load i32* %51, align 4
  ret i32 %52
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define internal void @bar() #0 {
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
