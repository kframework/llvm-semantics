; ModuleID = './spill.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@i = common global i32 0, align 4
@a = common global [10 x double] zeroinitializer, align 16
@b = common global [10 x double] zeroinitializer, align 16
@k = common global i32 0, align 4
@m = common global i32 0, align 4
@A = common global double* null, align 8
@j = common global i32 0, align 4
@n = common global i32 0, align 4
@B = common global double* null, align 8
@x = common global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %1 = call i32 @f()
  %2 = call i32 @f()
  %3 = add nsw i32 %1, %2
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define void @f2(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = call i32 @f()
  %3 = load i32, i32* %1, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @f()
  br label %8

; <label>:7                                       ; preds = %0
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = phi i32 [ %6, %5 ], [ 1, %7 ]
  %10 = add nsw i32 %2, %9
  store i32 %10, i32* %1, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @f3(i32 %i, i32* %p) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  %r1 = alloca i32, align 4
  %r2 = alloca i32, align 4
  %r3 = alloca i32, align 4
  %r4 = alloca i32, align 4
  %r5 = alloca i32, align 4
  %r6 = alloca i32, align 4
  %r7 = alloca i32, align 4
  %r8 = alloca i32, align 4
  %r9 = alloca i32, align 4
  %r10 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  store i32* %p, i32** %2, align 8
  store i32 0, i32* %r1, align 4
  store i32 0, i32* %r2, align 4
  store i32 0, i32* %r3, align 4
  store i32 0, i32* %r4, align 4
  store i32 0, i32* %r5, align 4
  store i32 0, i32* %r6, align 4
  store i32 0, i32* %r7, align 4
  store i32 0, i32* %r8, align 4
  store i32 0, i32* %r9, align 4
  store i32 0, i32* %r10, align 4
  %3 = load i32, i32* %1, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = call i32 @f()
  br label %8

; <label>:7                                       ; preds = %0
  br label %8

; <label>:8                                       ; preds = %7, %5
  %9 = phi i32 [ %6, %5 ], [ 0, %7 ]
  %10 = load i32*, i32** %2, align 8
  %11 = getelementptr inbounds i32, i32* %10, i32 1
  store i32* %11, i32** %2, align 8
  store i32 %9, i32* %10, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @f4() #0 {
  %r6 = alloca i32, align 4
  %r7 = alloca i32, align 4
  %r8 = alloca i32, align 4
  %r9 = alloca i32, align 4
  %r10 = alloca i32, align 4
  %r11 = alloca i32, align 4
  store i32 0, i32* %r6, align 4
  store i32 0, i32* %r7, align 4
  store i32 0, i32* %r8, align 4
  store i32 0, i32* %r9, align 4
  store i32 0, i32* %r10, align 4
  store i32 0, i32* %r11, align 4
  %1 = load i32, i32* @i, align 4
  %2 = sext i32 %1 to i64
  %3 = getelementptr inbounds [10 x double], [10 x double]* @a, i32 0, i64 %2
  %4 = load double, double* %3, align 8
  %5 = load i32, i32* @i, align 4
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds [10 x double], [10 x double]* @b, i32 0, i64 %6
  %8 = load double, double* %7, align 8
  %9 = fadd double %4, %8
  %10 = fcmp une double %9, 0.000000e+00
  br i1 %10, label %11, label %25

; <label>:11                                      ; preds = %0
  %12 = load i32, i32* @i, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %25

; <label>:14                                      ; preds = %11
  %15 = load i32, i32* @i, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [10 x double], [10 x double]* @a, i32 0, i64 %16
  %18 = load double, double* %17, align 8
  %19 = load i32, i32* @i, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [10 x double], [10 x double]* @b, i32 0, i64 %20
  %22 = load double, double* %21, align 8
  %23 = fsub double %18, %22
  %24 = fcmp une double %23, 0.000000e+00
  br label %25

; <label>:25                                      ; preds = %14, %11, %0
  %26 = phi i1 [ false, %11 ], [ false, %0 ], [ %24, %14 ]
  %27 = zext i1 %26 to i32
  store i32 %27, i32* @i, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @f5() #0 {
  %1 = load i32, i32* @k, align 4
  %2 = load i32, i32* @m, align 4
  %3 = mul nsw i32 %1, %2
  %4 = sext i32 %3 to i64
  %5 = load double*, double** @A, align 8
  %6 = getelementptr inbounds double, double* %5, i64 %4
  %7 = load double, double* %6, align 8
  %8 = load i32, i32* @j, align 4
  %9 = load i32, i32* @m, align 4
  %10 = mul nsw i32 %8, %9
  %11 = sext i32 %10 to i64
  %12 = load double*, double** @A, align 8
  %13 = getelementptr inbounds double, double* %12, i64 %11
  %14 = load double, double* %13, align 8
  %15 = fmul double %7, %14
  %16 = load i32, i32* @k, align 4
  %17 = load i32, i32* @n, align 4
  %18 = mul nsw i32 %16, %17
  %19 = sext i32 %18 to i64
  %20 = load double*, double** @B, align 8
  %21 = getelementptr inbounds double, double* %20, i64 %19
  %22 = load double, double* %21, align 8
  %23 = load i32, i32* @j, align 4
  %24 = load i32, i32* @n, align 4
  %25 = mul nsw i32 %23, %24
  %26 = sext i32 %25 to i64
  %27 = load double*, double** @B, align 8
  %28 = getelementptr inbounds double, double* %27, i64 %26
  %29 = load double, double* %28, align 8
  %30 = fmul double %22, %29
  %31 = fadd double %15, %30
  store double %31, double* @x, align 8
  %32 = load i32, i32* @k, align 4
  %33 = load i32, i32* @m, align 4
  %34 = mul nsw i32 %32, %33
  %35 = sext i32 %34 to i64
  %36 = load double*, double** @A, align 8
  %37 = getelementptr inbounds double, double* %36, i64 %35
  %38 = load double, double* %37, align 8
  %39 = load i32, i32* @j, align 4
  %40 = load i32, i32* @n, align 4
  %41 = mul nsw i32 %39, %40
  %42 = sext i32 %41 to i64
  %43 = load double*, double** @B, align 8
  %44 = getelementptr inbounds double, double* %43, i64 %42
  %45 = load double, double* %44, align 8
  %46 = fmul double %38, %45
  %47 = load i32, i32* @k, align 4
  %48 = load i32, i32* @n, align 4
  %49 = mul nsw i32 %47, %48
  %50 = sext i32 %49 to i64
  %51 = load double*, double** @B, align 8
  %52 = getelementptr inbounds double, double* %51, i64 %50
  %53 = load double, double* %52, align 8
  %54 = load i32, i32* @j, align 4
  %55 = load i32, i32* @m, align 4
  %56 = mul nsw i32 %54, %55
  %57 = sext i32 %56 to i64
  %58 = load double*, double** @A, align 8
  %59 = getelementptr inbounds double, double* %58, i64 %57
  %60 = load double, double* %59, align 8
  %61 = fmul double %53, %60
  %62 = fsub double %46, %61
  store double %62, double* @x, align 8
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
