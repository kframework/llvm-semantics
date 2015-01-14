; ModuleID = './921013-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.a = private unnamed_addr constant [4 x float] [float 5.000000e+00, float 1.000000e+00, float 3.000000e+00, float 5.000000e+00], align 16
@main.b = private unnamed_addr constant [4 x float] [float 2.000000e+00, float 4.000000e+00, float 3.000000e+00, float 0.000000e+00], align 16

; Function Attrs: nounwind uwtable
define void @f(i32* %d, float* %x, float* %y, i32 %n) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca float*, align 8
  %3 = alloca float*, align 8
  %4 = alloca i32, align 4
  store i32* %d, i32** %1, align 8
  store float* %x, float** %2, align 8
  store float* %y, float** %3, align 8
  store i32 %n, i32* %4, align 4
  br label %5

; <label>:5                                       ; preds = %9, %0
  %6 = load i32* %4, align 4
  %7 = add nsw i32 %6, -1
  store i32 %7, i32* %4, align 4
  %8 = icmp ne i32 %6, 0
  br i1 %8, label %9, label %20

; <label>:9                                       ; preds = %5
  %10 = load float** %2, align 8
  %11 = getelementptr inbounds float* %10, i32 1
  store float* %11, float** %2, align 8
  %12 = load float* %10, align 4
  %13 = load float** %3, align 8
  %14 = getelementptr inbounds float* %13, i32 1
  store float* %14, float** %3, align 8
  %15 = load float* %13, align 4
  %16 = fcmp oeq float %12, %15
  %17 = zext i1 %16 to i32
  %18 = load i32** %1, align 8
  %19 = getelementptr inbounds i32* %18, i32 1
  store i32* %19, i32** %1, align 8
  store i32 %17, i32* %18, align 4
  br label %5

; <label>:20                                      ; preds = %5
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %r = alloca [4 x i32], align 16
  %a = alloca [4 x float], align 16
  %b = alloca [4 x float], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast [4 x float]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([4 x float]* @main.a to i8*), i64 16, i32 16, i1 false)
  %3 = bitcast [4 x float]* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([4 x float]* @main.b to i8*), i64 16, i32 16, i1 false)
  %4 = getelementptr inbounds [4 x i32]* %r, i32 0, i32 0
  %5 = getelementptr inbounds [4 x float]* %a, i32 0, i32 0
  %6 = getelementptr inbounds [4 x float]* %b, i32 0, i32 0
  call void @f(i32* %4, float* %5, float* %6, i32 4)
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %28, %0
  %8 = load i32* %i, align 4
  %9 = icmp slt i32 %8, 4
  br i1 %9, label %10, label %31

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [4 x float]* %a, i32 0, i64 %12
  %14 = load float* %13, align 4
  %15 = load i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [4 x float]* %b, i32 0, i64 %16
  %18 = load float* %17, align 4
  %19 = fcmp oeq float %14, %18
  %20 = zext i1 %19 to i32
  %21 = load i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds [4 x i32]* %r, i32 0, i64 %22
  %24 = load i32* %23, align 4
  %25 = icmp ne i32 %20, %24
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %10
  call void @abort() #3
  unreachable

; <label>:27                                      ; preds = %10
  br label %28

; <label>:28                                      ; preds = %27
  %29 = load i32* %i, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %i, align 4
  br label %7

; <label>:31                                      ; preds = %7
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %33 = load i32* %1
  ret i32 %33
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
