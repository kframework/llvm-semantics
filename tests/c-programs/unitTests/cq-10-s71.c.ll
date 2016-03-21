; ModuleID = './cq-10-s71.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s71er = internal global [10 x i8] c"s71,er%d\0A\00", align 1
@sec.qs71 = internal global [8 x i8] c"s71    \00", align 1
@sec.q = internal global i8 113, align 1
@.str = private unnamed_addr constant [6 x i8] c"queep\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str.1 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str.3 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @pow2(i64 %n) #0 {
  %1 = alloca i64, align 8
  %s = alloca i64, align 8
  store i64 %n, i64* %1, align 8
  store i64 1, i64* %s, align 8
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i64, i64* %1, align 8
  %4 = add nsw i64 %3, -1
  store i64 %4, i64* %1, align 8
  %5 = icmp ne i64 %3, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %2
  %7 = load i64, i64* %s, align 8
  %8 = mul nsw i64 %7, 2
  store i64 %8, i64* %s, align 8
  br label %2

; <label>:9                                       ; preds = %2
  %10 = load i64, i64* %s, align 8
  ret i64 %10
}

; Function Attrs: nounwind uwtable
define void @zerofill(i8* %x) #0 {
  %1 = alloca i8*, align 8
  %j = alloca i32, align 4
  store i8* %x, i8** %1, align 8
  store i32 0, i32* %j, align 4
  br label %2

; <label>:2                                       ; preds = %8, %0
  %3 = load i32, i32* %j, align 4
  %4 = icmp slt i32 %3, 256
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %2
  %6 = load i8*, i8** %1, align 8
  %7 = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %7, i8** %1, align 8
  store i8 0, i8* %6, align 1
  br label %8

; <label>:8                                       ; preds = %5
  %9 = load i32, i32* %j, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %j, align 4
  br label %2

; <label>:11                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @sumof(i8* %x) #0 {
  %1 = alloca i8*, align 8
  %p = alloca i8*, align 8
  %total = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %x, i8** %1, align 8
  %2 = load i8*, i8** %1, align 8
  store i8* %2, i8** %p, align 8
  store i32 0, i32* %total, align 4
  store i32 0, i32* %j, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32, i32* %j, align 4
  %5 = icmp slt i32 %4, 256
  br i1 %5, label %6, label %16

; <label>:6                                       ; preds = %3
  %7 = load i32, i32* %total, align 4
  %8 = load i8*, i8** %p, align 8
  %9 = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %9, i8** %p, align 8
  %10 = load i8, i8* %8, align 1
  %11 = sext i8 %10 to i32
  %12 = add nsw i32 %7, %11
  store i32 %12, i32* %total, align 4
  br label %13

; <label>:13                                      ; preds = %6
  %14 = load i32, i32* %j, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %j, align 4
  br label %3

; <label>:16                                      ; preds = %3
  %17 = load i32, i32* %total, align 4
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define i32 @setupTable(%struct.defs* %pd0) #0 {
  %1 = alloca %struct.defs*, align 8
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %c0 = alloca i8, align 1
  %c1 = alloca i8, align 1
  %temp = alloca float, align 4
  %one = alloca float, align 4
  %delta = alloca float, align 4
  %tempd = alloca double, align 8
  %oned = alloca double, align 8
  store %struct.defs* %pd0, %struct.defs** %1, align 8
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @setupTable.qs26, i32 0, i32 0), i8** %ps, align 8
  %2 = load %struct.defs*, %struct.defs** %1, align 8
  %3 = getelementptr inbounds %struct.defs, %struct.defs* %2, i32 0, i32 15
  %4 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i32 0, i32 0
  store i8* %4, i8** %pt, align 8
  br label %5

; <label>:5                                       ; preds = %12, %0
  %6 = load i8*, i8** %ps, align 8
  %7 = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %7, i8** %ps, align 8
  %8 = load i8, i8* %6, align 1
  %9 = load i8*, i8** %pt, align 8
  %10 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %10, i8** %pt, align 8
  store i8 %8, i8* %9, align 1
  %11 = icmp ne i8 %8, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %5
  br label %5

; <label>:13                                      ; preds = %5
  %14 = load %struct.defs*, %struct.defs** %1, align 8
  %15 = getelementptr inbounds %struct.defs, %struct.defs* %14, i32 0, i32 0
  store i32 0, i32* %15, align 4
  store i8 0, i8* %c0, align 1
  store i8 1, i8* %c1, align 1
  br label %16

; <label>:16                                      ; preds = %22, %13
  %17 = load i8, i8* %c0, align 1
  %18 = zext i8 %17 to i32
  %19 = load i8, i8* %c1, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %18, %20
  br i1 %21, label %22, label %33

; <label>:22                                      ; preds = %16
  %23 = load i8, i8* %c1, align 1
  %24 = zext i8 %23 to i32
  %25 = shl i32 %24, 1
  %26 = trunc i32 %25 to i8
  store i8 %26, i8* %c1, align 1
  %27 = load %struct.defs*, %struct.defs** %1, align 8
  %28 = getelementptr inbounds %struct.defs, %struct.defs* %27, i32 0, i32 0
  %29 = load i32, i32* %28, align 4
  %30 = add nsw i32 %29, 1
  %31 = load %struct.defs*, %struct.defs** %1, align 8
  %32 = getelementptr inbounds %struct.defs, %struct.defs* %31, i32 0, i32 0
  store i32 %30, i32* %32, align 4
  br label %16

; <label>:33                                      ; preds = %16
  %34 = load %struct.defs*, %struct.defs** %1, align 8
  %35 = getelementptr inbounds %struct.defs, %struct.defs* %34, i32 0, i32 0
  %36 = load i32, i32* %35, align 4
  %37 = sext i32 %36 to i64
  %38 = mul i64 %37, 4
  %39 = trunc i64 %38 to i32
  %40 = load %struct.defs*, %struct.defs** %1, align 8
  %41 = getelementptr inbounds %struct.defs, %struct.defs* %40, i32 0, i32 1
  store i32 %39, i32* %41, align 4
  %42 = load %struct.defs*, %struct.defs** %1, align 8
  %43 = getelementptr inbounds %struct.defs, %struct.defs* %42, i32 0, i32 0
  %44 = load i32, i32* %43, align 4
  %45 = sext i32 %44 to i64
  %46 = mul i64 %45, 2
  %47 = trunc i64 %46 to i32
  %48 = load %struct.defs*, %struct.defs** %1, align 8
  %49 = getelementptr inbounds %struct.defs, %struct.defs* %48, i32 0, i32 2
  store i32 %47, i32* %49, align 4
  %50 = load %struct.defs*, %struct.defs** %1, align 8
  %51 = getelementptr inbounds %struct.defs, %struct.defs* %50, i32 0, i32 0
  %52 = load i32, i32* %51, align 4
  %53 = sext i32 %52 to i64
  %54 = mul i64 %53, 8
  %55 = trunc i64 %54 to i32
  %56 = load %struct.defs*, %struct.defs** %1, align 8
  %57 = getelementptr inbounds %struct.defs, %struct.defs* %56, i32 0, i32 3
  store i32 %55, i32* %57, align 4
  %58 = load %struct.defs*, %struct.defs** %1, align 8
  %59 = getelementptr inbounds %struct.defs, %struct.defs* %58, i32 0, i32 0
  %60 = load i32, i32* %59, align 4
  %61 = sext i32 %60 to i64
  %62 = mul i64 %61, 4
  %63 = trunc i64 %62 to i32
  %64 = load %struct.defs*, %struct.defs** %1, align 8
  %65 = getelementptr inbounds %struct.defs, %struct.defs* %64, i32 0, i32 4
  store i32 %63, i32* %65, align 4
  %66 = load %struct.defs*, %struct.defs** %1, align 8
  %67 = getelementptr inbounds %struct.defs, %struct.defs* %66, i32 0, i32 0
  %68 = load i32, i32* %67, align 4
  %69 = sext i32 %68 to i64
  %70 = mul i64 %69, 4
  %71 = trunc i64 %70 to i32
  %72 = load %struct.defs*, %struct.defs** %1, align 8
  %73 = getelementptr inbounds %struct.defs, %struct.defs* %72, i32 0, i32 5
  store i32 %71, i32* %73, align 4
  %74 = load %struct.defs*, %struct.defs** %1, align 8
  %75 = getelementptr inbounds %struct.defs, %struct.defs* %74, i32 0, i32 0
  %76 = load i32, i32* %75, align 4
  %77 = sext i32 %76 to i64
  %78 = mul i64 %77, 8
  %79 = trunc i64 %78 to i32
  %80 = load %struct.defs*, %struct.defs** %1, align 8
  %81 = getelementptr inbounds %struct.defs, %struct.defs* %80, i32 0, i32 6
  store i32 %79, i32* %81, align 4
  store float 1.000000e+00, float* %one, align 4
  store float 1.000000e+00, float* %delta, align 4
  store float 0.000000e+00, float* %temp, align 4
  br label %82

; <label>:82                                      ; preds = %86, %33
  %83 = load float, float* %temp, align 4
  %84 = load float, float* %one, align 4
  %85 = fcmp une float %83, %84
  br i1 %85, label %86, label %94

; <label>:86                                      ; preds = %82
  %87 = load float, float* %one, align 4
  %88 = load float, float* %delta, align 4
  %89 = fadd float %87, %88
  store float %89, float* %temp, align 4
  %90 = load float, float* %delta, align 4
  %91 = fpext float %90 to double
  %92 = fdiv double %91, 2.000000e+00
  %93 = fptrunc double %92 to float
  store float %93, float* %delta, align 4
  br label %82

; <label>:94                                      ; preds = %82
  %95 = load float, float* %delta, align 4
  %96 = fpext float %95 to double
  %97 = fmul double %96, 4.000000e+00
  %98 = fptrunc double %97 to float
  %99 = load %struct.defs*, %struct.defs** %1, align 8
  %100 = getelementptr inbounds %struct.defs, %struct.defs* %99, i32 0, i32 7
  store float %98, float* %100, align 4
  store double 1.000000e+00, double* %oned, align 8
  store float 1.000000e+00, float* %delta, align 4
  store double 0.000000e+00, double* %tempd, align 8
  br label %101

; <label>:101                                     ; preds = %105, %94
  %102 = load double, double* %tempd, align 8
  %103 = load double, double* %oned, align 8
  %104 = fcmp une double %102, %103
  br i1 %104, label %105, label %114

; <label>:105                                     ; preds = %101
  %106 = load double, double* %oned, align 8
  %107 = load float, float* %delta, align 4
  %108 = fpext float %107 to double
  %109 = fadd double %106, %108
  store double %109, double* %tempd, align 8
  %110 = load float, float* %delta, align 4
  %111 = fpext float %110 to double
  %112 = fdiv double %111, 2.000000e+00
  %113 = fptrunc double %112 to float
  store float %113, float* %delta, align 4
  br label %101

; <label>:114                                     ; preds = %101
  %115 = load float, float* %delta, align 4
  %116 = fpext float %115 to double
  %117 = fmul double %116, 4.000000e+00
  %118 = fptrunc double %117 to float
  %119 = load %struct.defs*, %struct.defs** %1, align 8
  %120 = getelementptr inbounds %struct.defs, %struct.defs* %119, i32 0, i32 8
  store float %118, float* %120, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @svtest(i32 %n) #0 {
  %1 = alloca i32, align 4
  %rc = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  switch i32 %2, label %16 [
    i32 0, label %3
    i32 1, label %4
    i32 2, label %10
  ]

; <label>:3                                       ; preds = %0
  store i32 1978, i32* @svtest.k, align 4
  store i32 0, i32* %rc, align 4
  br label %16

; <label>:4                                       ; preds = %0
  %5 = load i32, i32* @svtest.k, align 4
  %6 = icmp ne i32 %5, 1978
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4
  store i32 1, i32* %rc, align 4
  br label %9

; <label>:8                                       ; preds = %4
  store i32 1929, i32* @svtest.k, align 4
  store i32 0, i32* %rc, align 4
  br label %9

; <label>:9                                       ; preds = %8, %7
  br label %16

; <label>:10                                      ; preds = %0
  %11 = load i32, i32* @svtest.k, align 4
  %12 = icmp ne i32 %11, 1929
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10
  store i32 1, i32* %rc, align 4
  br label %15

; <label>:14                                      ; preds = %10
  store i32 0, i32* %rc, align 4
  br label %15

; <label>:15                                      ; preds = %14, %13
  br label %16

; <label>:16                                      ; preds = %0, %15, %9, %3
  %17 = load i32, i32* %rc, align 4
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define i32 @zero() #0 {
  %rc = alloca i32, align 4
  store i32 2, i32* @zero.k, align 4
  store i32 0, i32* %rc, align 4
  %1 = load i32, i32* %rc, align 4
  ret i32 %1
}

; Function Attrs: nounwind uwtable
define i32 @testev() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @extvar, align 4
  %3 = icmp ne i32 %2, 1066
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32 1, i32* %1
  br label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %6

; <label>:6                                       ; preds = %5, %4
  %7 = load i32, i32* %1
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define void @setev() #0 {
  store i32 1066, i32* @extvar, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @McCarthy(i32 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp sgt i32 %3, 100
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i32, i32* %2, align 4
  %7 = sub nsw i32 %6, 10
  store i32 %7, i32* %1
  br label %13

; <label>:8                                       ; preds = %0
  %9 = load i32, i32* %2, align 4
  %10 = add nsw i32 %9, 11
  %11 = call i32 @McCarthy(i32 %10)
  %12 = call i32 @McCarthy(i32 %11)
  store i32 %12, i32* %1
  br label %13

; <label>:13                                      ; preds = %8, %5
  %14 = load i32, i32* %1
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @clobber(i32 %x, i32* %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  store i32 %x, i32* %1, align 4
  store i32* %y, i32** %2, align 8
  store i32 3, i32* %1, align 4
  %3 = load i32*, i32** %2, align 8
  store i32 2, i32* %3, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @sec(%struct.defs* %pd0) #0 {
  %1 = alloca %struct.defs*, align 8
  %rc = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %x = alloca [10 x i32], align 16
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %p = alloca i32*, align 8
  store %struct.defs* %pd0, %struct.defs** %1, align 8
  %2 = load %struct.defs*, %struct.defs** %1, align 8
  %3 = call i32 @setupTable(%struct.defs* %2)
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @sec.qs71, i32 0, i32 0), i8** %ps, align 8
  %4 = load %struct.defs*, %struct.defs** %1, align 8
  %5 = getelementptr inbounds %struct.defs, %struct.defs* %4, i32 0, i32 15
  %6 = getelementptr inbounds [8 x i8], [8 x i8]* %5, i32 0, i32 0
  store i8* %6, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  br label %7

; <label>:7                                       ; preds = %14, %0
  %8 = load i8*, i8** %ps, align 8
  %9 = getelementptr inbounds i8, i8* %8, i32 1
  store i8* %9, i8** %ps, align 8
  %10 = load i8, i8* %8, align 1
  %11 = load i8*, i8** %pt, align 8
  %12 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %12, i8** %pt, align 8
  store i8 %10, i8* %11, align 1
  %13 = icmp ne i8 %10, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %7
  br label %7

; <label>:15                                      ; preds = %7
  %16 = load i8, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), align 1
  %17 = sext i8 %16 to i32
  %18 = load i8, i8* @sec.q, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp ne i32 %17, %19
  br i1 %20, label %21, label %31

; <label>:21                                      ; preds = %15
  %22 = load i32, i32* %rc, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %rc, align 4
  %24 = load %struct.defs*, %struct.defs** %1, align 8
  %25 = getelementptr inbounds %struct.defs, %struct.defs* %24, i32 0, i32 11
  %26 = load i32, i32* %25, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %30

; <label>:28                                      ; preds = %21
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @sec.s71er, i32 0, i32 0), i32 1)
  br label %30

; <label>:30                                      ; preds = %28, %21
  br label %31

; <label>:31                                      ; preds = %30, %15
  %32 = getelementptr inbounds [10 x i32], [10 x i32]* %x, i32 0, i64 5
  store i32 1942, i32* %32, align 4
  %33 = getelementptr inbounds [10 x i32], [10 x i32]* %x, i32 0, i64 5
  %34 = load i32, i32* %33, align 4
  %35 = icmp ne i32 %34, 1942
  br i1 %35, label %43, label %36

; <label>:36                                      ; preds = %31
  %37 = getelementptr inbounds [10 x i32], [10 x i32]* %x, i32 0, i64 5
  %38 = load i32, i32* %37, align 4
  %39 = getelementptr inbounds [10 x i32], [10 x i32]* %x, i32 0, i32 0
  %40 = getelementptr inbounds i32, i32* %39, i64 5
  %41 = load i32, i32* %40, align 4
  %42 = icmp ne i32 %38, %41
  br i1 %42, label %43, label %53

; <label>:43                                      ; preds = %36, %31
  %44 = load i32, i32* %rc, align 4
  %45 = add nsw i32 %44, 4
  store i32 %45, i32* %rc, align 4
  %46 = load %struct.defs*, %struct.defs** %1, align 8
  %47 = getelementptr inbounds %struct.defs, %struct.defs* %46, i32 0, i32 11
  %48 = load i32, i32* %47, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %52

; <label>:50                                      ; preds = %43
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @sec.s71er, i32 0, i32 0), i32 4)
  br label %52

; <label>:52                                      ; preds = %50, %43
  br label %53

; <label>:53                                      ; preds = %52, %36
  %54 = call i32 @McCarthy(i32 -5)
  %55 = icmp ne i32 %54, 91
  br i1 %55, label %56, label %66

; <label>:56                                      ; preds = %53
  %57 = load i32, i32* %rc, align 4
  %58 = add nsw i32 %57, 8
  store i32 %58, i32* %rc, align 4
  %59 = load %struct.defs*, %struct.defs** %1, align 8
  %60 = getelementptr inbounds %struct.defs, %struct.defs* %59, i32 0, i32 11
  %61 = load i32, i32* %60, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %65

; <label>:63                                      ; preds = %56
  %64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @sec.s71er, i32 0, i32 0), i32 8)
  br label %65

; <label>:65                                      ; preds = %63, %56
  br label %66

; <label>:66                                      ; preds = %65, %53
  store i32 2, i32* %a, align 4
  store i32 3, i32* %b, align 4
  store i32* %b, i32** %p, align 8
  %67 = load i32, i32* %a, align 4
  %68 = load i32*, i32** %p, align 8
  %69 = call i32 @clobber(i32 %67, i32* %68)
  %70 = load i32, i32* %a, align 4
  %71 = icmp ne i32 %70, 2
  br i1 %71, label %75, label %72

; <label>:72                                      ; preds = %66
  %73 = load i32, i32* %b, align 4
  %74 = icmp ne i32 %73, 2
  br i1 %74, label %75, label %85

; <label>:75                                      ; preds = %72, %66
  %76 = load i32, i32* %rc, align 4
  %77 = add nsw i32 %76, 16
  store i32 %77, i32* %rc, align 4
  %78 = load %struct.defs*, %struct.defs** %1, align 8
  %79 = getelementptr inbounds %struct.defs, %struct.defs* %78, i32 0, i32 11
  %80 = load i32, i32* %79, align 4
  %81 = icmp ne i32 %80, 0
  br i1 %81, label %82, label %84

; <label>:82                                      ; preds = %75
  %83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @sec.s71er, i32 0, i32 0), i32 16)
  br label %84

; <label>:84                                      ; preds = %82, %75
  br label %85

; <label>:85                                      ; preds = %84, %72
  %86 = load %struct.defs*, %struct.defs** %1, align 8
  %87 = getelementptr inbounds %struct.defs, %struct.defs* %86, i32 0, i32 8
  %88 = load float, float* %87, align 4
  %89 = load %struct.defs*, %struct.defs** %1, align 8
  %90 = getelementptr inbounds %struct.defs, %struct.defs* %89, i32 0, i32 8
  %91 = load float, float* %90, align 4
  %92 = fcmp une float %88, %91
  br i1 %92, label %93, label %103

; <label>:93                                      ; preds = %85
  %94 = load i32, i32* %rc, align 4
  %95 = add nsw i32 %94, 32
  store i32 %95, i32* %rc, align 4
  %96 = load %struct.defs*, %struct.defs** %1, align 8
  %97 = getelementptr inbounds %struct.defs, %struct.defs* %96, i32 0, i32 11
  %98 = load i32, i32* %97, align 4
  %99 = icmp ne i32 %98, 0
  br i1 %99, label %100, label %102

; <label>:100                                     ; preds = %93
  %101 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @sec.s71er, i32 0, i32 0), i32 32)
  br label %102

; <label>:102                                     ; preds = %100, %93
  br label %103

; <label>:103                                     ; preds = %102, %85
  %104 = load i32, i32* %rc, align 4
  ret i32 %104
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 9), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 10), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 11), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 12), align 4
  store %struct.defs* @main.d0, %struct.defs** @main.pd0, align 8
  %2 = load %struct.defs*, %struct.defs** @main.pd0, align 8
  %3 = call i32 @sec(%struct.defs* %2)
  store i32 %3, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 13), align 4
  %4 = load i32, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 14), align 4
  %5 = load i32, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 13), align 4
  %6 = add nsw i32 %4, %5
  store i32 %6, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 14), align 4
  %7 = load i32, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 9), align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %0
  %10 = load i32, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 13), align 4
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %10)
  br label %12

; <label>:12                                      ; preds = %9, %0
  %13 = load i32, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 14), align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %12
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.2, i32 0, i32 0))
  br label %19

; <label>:17                                      ; preds = %12
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.3, i32 0, i32 0))
  br label %19

; <label>:19                                      ; preds = %17, %15
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
