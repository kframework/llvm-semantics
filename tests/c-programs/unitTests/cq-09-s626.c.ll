; ModuleID = './cq-09-s626.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s626er = internal global [11 x i8] c"s626,er%d\0A\00", align 1
@sec.qs626 = internal global [8 x i8] c"s626   \00", align 1
@.str = private unnamed_addr constant [8 x i8] c"   key=\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str.3 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str.5 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

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
  %eps = alloca float, align 4
  %f1 = alloca float, align 4
  %f2 = alloca float, align 4
  %f3 = alloca float, align 4
  %f4 = alloca float, align 4
  %f = alloca float, align 4
  %lint1 = alloca i64, align 8
  %lint2 = alloca i64, align 8
  %l = alloca i64, align 8
  %ls = alloca i64, align 8
  %c = alloca i8, align 1
  %t = alloca [28 x i8], align 16
  %t0 = alloca i8, align 1
  %s = alloca i16, align 2
  %is = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %u = alloca i32, align 4
  %us = alloca i32, align 4
  %d = alloca double, align 8
  %ds = alloca double, align 8
  store %struct.defs* %pd0, %struct.defs** %1, align 8
  %2 = load %struct.defs*, %struct.defs** %1, align 8
  %3 = call i32 @setupTable(%struct.defs* %2)
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @sec.qs626, i32 0, i32 0), i8** %ps, align 8
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
  store float 1.000000e+00, float* %f1, align 4
  store i64 1, i64* %lint1, align 8
  store i64 1, i64* %lint2, align 8
  store i32 0, i32* %j, align 4
  br label %16

; <label>:16                                      ; preds = %30, %15
  %17 = load i32, i32* %j, align 4
  %18 = load %struct.defs*, %struct.defs** %1, align 8
  %19 = getelementptr inbounds %struct.defs, %struct.defs* %18, i32 0, i32 3
  %20 = load i32, i32* %19, align 4
  %21 = sub nsw i32 %20, 2
  %22 = icmp slt i32 %17, %21
  br i1 %22, label %23, label %33

; <label>:23                                      ; preds = %16
  %24 = load float, float* %f1, align 4
  %25 = fmul float %24, 2.000000e+00
  store float %25, float* %f1, align 4
  %26 = load i64, i64* %lint2, align 8
  %27 = shl i64 %26, 1
  %28 = load i64, i64* %lint1, align 8
  %29 = or i64 %27, %28
  store i64 %29, i64* %lint2, align 8
  br label %30

; <label>:30                                      ; preds = %23
  %31 = load i32, i32* %j, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %j, align 4
  br label %16

; <label>:33                                      ; preds = %16
  %34 = load i64, i64* %lint2, align 8
  %35 = sitofp i64 %34 to float
  store float %35, float* %f2, align 4
  %36 = load float, float* %f1, align 4
  %37 = load float, float* %f2, align 4
  %38 = fsub float %36, %37
  %39 = load float, float* %f1, align 4
  %40 = fdiv float %38, %39
  store float %40, float* %f1, align 4
  %41 = load float, float* %f1, align 4
  %42 = fpext float %41 to double
  %43 = load %struct.defs*, %struct.defs** %1, align 8
  %44 = getelementptr inbounds %struct.defs, %struct.defs* %43, i32 0, i32 7
  %45 = load float, float* %44, align 4
  %46 = fpext float %45 to double
  %47 = fmul double 2.000000e+00, %46
  %48 = fcmp ogt double %42, %47
  br i1 %48, label %49, label %59

; <label>:49                                      ; preds = %33
  %50 = load i32, i32* %rc, align 4
  %51 = add nsw i32 %50, 2
  store i32 %51, i32* %rc, align 4
  %52 = load %struct.defs*, %struct.defs** %1, align 8
  %53 = getelementptr inbounds %struct.defs, %struct.defs* %52, i32 0, i32 11
  %54 = load i32, i32* %53, align 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %58

; <label>:56                                      ; preds = %49
  %57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @sec.s626er, i32 0, i32 0), i32 2)
  br label %58

; <label>:58                                      ; preds = %56, %49
  br label %59

; <label>:59                                      ; preds = %58, %33
  store i8 125, i8* %c, align 1
  store i16 125, i16* %s, align 2
  store i32 125, i32* %i, align 4
  store i32 15625, i32* %is, align 4
  store i32 125, i32* %u, align 4
  store i32 15625, i32* %us, align 4
  store i64 125, i64* %l, align 8
  store i64 15625, i64* %ls, align 8
  store float 1.250000e+02, float* %f, align 4
  store double 1.250000e+02, double* %d, align 8
  store double 1.562500e+04, double* %ds, align 8
  store i32 0, i32* %j, align 4
  br label %60

; <label>:60                                      ; preds = %67, %59
  %61 = load i32, i32* %j, align 4
  %62 = icmp slt i32 %61, 28
  br i1 %62, label %63, label %70

; <label>:63                                      ; preds = %60
  %64 = load i32, i32* %j, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 %65
  store i8 0, i8* %66, align 1
  br label %67

; <label>:67                                      ; preds = %63
  %68 = load i32, i32* %j, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %j, align 4
  br label %60

; <label>:70                                      ; preds = %60
  %71 = load i8, i8* %c, align 1
  %72 = sext i8 %71 to i32
  %73 = load i8, i8* %c, align 1
  %74 = sext i8 %73 to i32
  %75 = mul nsw i32 %72, %74
  %76 = load i32, i32* %is, align 4
  %77 = icmp ne i32 %75, %76
  br i1 %77, label %78, label %80

; <label>:78                                      ; preds = %70
  %79 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 0
  store i8 1, i8* %79, align 1
  br label %80

; <label>:80                                      ; preds = %78, %70
  %81 = load i16, i16* %s, align 2
  %82 = sext i16 %81 to i32
  %83 = load i8, i8* %c, align 1
  %84 = sext i8 %83 to i32
  %85 = mul nsw i32 %82, %84
  %86 = load i32, i32* %is, align 4
  %87 = icmp ne i32 %85, %86
  br i1 %87, label %88, label %90

; <label>:88                                      ; preds = %80
  %89 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 1
  store i8 1, i8* %89, align 1
  br label %90

; <label>:90                                      ; preds = %88, %80
  %91 = load i16, i16* %s, align 2
  %92 = sext i16 %91 to i32
  %93 = load i16, i16* %s, align 2
  %94 = sext i16 %93 to i32
  %95 = mul nsw i32 %92, %94
  %96 = load i32, i32* %is, align 4
  %97 = icmp ne i32 %95, %96
  br i1 %97, label %98, label %100

; <label>:98                                      ; preds = %90
  %99 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 2
  store i8 1, i8* %99, align 1
  br label %100

; <label>:100                                     ; preds = %98, %90
  %101 = load i32, i32* %i, align 4
  %102 = load i8, i8* %c, align 1
  %103 = sext i8 %102 to i32
  %104 = mul nsw i32 %101, %103
  %105 = load i32, i32* %is, align 4
  %106 = icmp ne i32 %104, %105
  br i1 %106, label %107, label %109

; <label>:107                                     ; preds = %100
  %108 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 3
  store i8 1, i8* %108, align 1
  br label %109

; <label>:109                                     ; preds = %107, %100
  %110 = load i32, i32* %i, align 4
  %111 = load i16, i16* %s, align 2
  %112 = sext i16 %111 to i32
  %113 = mul nsw i32 %110, %112
  %114 = load i32, i32* %is, align 4
  %115 = icmp ne i32 %113, %114
  br i1 %115, label %116, label %118

; <label>:116                                     ; preds = %109
  %117 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 4
  store i8 1, i8* %117, align 1
  br label %118

; <label>:118                                     ; preds = %116, %109
  %119 = load i32, i32* %i, align 4
  %120 = load i32, i32* %i, align 4
  %121 = mul nsw i32 %119, %120
  %122 = load i32, i32* %is, align 4
  %123 = icmp ne i32 %121, %122
  br i1 %123, label %124, label %126

; <label>:124                                     ; preds = %118
  %125 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 5
  store i8 1, i8* %125, align 1
  br label %126

; <label>:126                                     ; preds = %124, %118
  %127 = load i32, i32* %u, align 4
  %128 = load i8, i8* %c, align 1
  %129 = sext i8 %128 to i32
  %130 = mul i32 %127, %129
  %131 = load i32, i32* %us, align 4
  %132 = icmp ne i32 %130, %131
  br i1 %132, label %133, label %135

; <label>:133                                     ; preds = %126
  %134 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 6
  store i8 1, i8* %134, align 1
  br label %135

; <label>:135                                     ; preds = %133, %126
  %136 = load i32, i32* %u, align 4
  %137 = load i16, i16* %s, align 2
  %138 = sext i16 %137 to i32
  %139 = mul i32 %136, %138
  %140 = load i32, i32* %us, align 4
  %141 = icmp ne i32 %139, %140
  br i1 %141, label %142, label %144

; <label>:142                                     ; preds = %135
  %143 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 7
  store i8 1, i8* %143, align 1
  br label %144

; <label>:144                                     ; preds = %142, %135
  %145 = load i32, i32* %u, align 4
  %146 = load i32, i32* %i, align 4
  %147 = mul i32 %145, %146
  %148 = load i32, i32* %us, align 4
  %149 = icmp ne i32 %147, %148
  br i1 %149, label %150, label %152

; <label>:150                                     ; preds = %144
  %151 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 8
  store i8 1, i8* %151, align 1
  br label %152

; <label>:152                                     ; preds = %150, %144
  %153 = load i32, i32* %u, align 4
  %154 = load i32, i32* %u, align 4
  %155 = mul i32 %153, %154
  %156 = load i32, i32* %us, align 4
  %157 = icmp ne i32 %155, %156
  br i1 %157, label %158, label %160

; <label>:158                                     ; preds = %152
  %159 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 9
  store i8 1, i8* %159, align 1
  br label %160

; <label>:160                                     ; preds = %158, %152
  %161 = load i64, i64* %l, align 8
  %162 = load i8, i8* %c, align 1
  %163 = sext i8 %162 to i64
  %164 = mul nsw i64 %161, %163
  %165 = load i64, i64* %ls, align 8
  %166 = icmp ne i64 %164, %165
  br i1 %166, label %167, label %169

; <label>:167                                     ; preds = %160
  %168 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 10
  store i8 1, i8* %168, align 1
  br label %169

; <label>:169                                     ; preds = %167, %160
  %170 = load i64, i64* %l, align 8
  %171 = load i16, i16* %s, align 2
  %172 = sext i16 %171 to i64
  %173 = mul nsw i64 %170, %172
  %174 = load i64, i64* %ls, align 8
  %175 = icmp ne i64 %173, %174
  br i1 %175, label %176, label %178

; <label>:176                                     ; preds = %169
  %177 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 11
  store i8 1, i8* %177, align 1
  br label %178

; <label>:178                                     ; preds = %176, %169
  %179 = load i64, i64* %l, align 8
  %180 = load i32, i32* %i, align 4
  %181 = sext i32 %180 to i64
  %182 = mul nsw i64 %179, %181
  %183 = load i64, i64* %ls, align 8
  %184 = icmp ne i64 %182, %183
  br i1 %184, label %185, label %187

; <label>:185                                     ; preds = %178
  %186 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 12
  store i8 1, i8* %186, align 1
  br label %187

; <label>:187                                     ; preds = %185, %178
  %188 = load i64, i64* %l, align 8
  %189 = load i32, i32* %u, align 4
  %190 = zext i32 %189 to i64
  %191 = mul nsw i64 %188, %190
  %192 = load i32, i32* %us, align 4
  %193 = zext i32 %192 to i64
  %194 = icmp ne i64 %191, %193
  br i1 %194, label %195, label %197

; <label>:195                                     ; preds = %187
  %196 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 13
  store i8 1, i8* %196, align 1
  br label %197

; <label>:197                                     ; preds = %195, %187
  %198 = load i64, i64* %l, align 8
  %199 = load i64, i64* %l, align 8
  %200 = mul nsw i64 %198, %199
  %201 = load i64, i64* %ls, align 8
  %202 = icmp ne i64 %200, %201
  br i1 %202, label %203, label %205

; <label>:203                                     ; preds = %197
  %204 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 14
  store i8 1, i8* %204, align 1
  br label %205

; <label>:205                                     ; preds = %203, %197
  %206 = load float, float* %f, align 4
  %207 = load i8, i8* %c, align 1
  %208 = sext i8 %207 to i32
  %209 = sitofp i32 %208 to float
  %210 = fmul float %206, %209
  %211 = fpext float %210 to double
  %212 = load double, double* %ds, align 8
  %213 = fcmp une double %211, %212
  br i1 %213, label %214, label %216

; <label>:214                                     ; preds = %205
  %215 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 15
  store i8 1, i8* %215, align 1
  br label %216

; <label>:216                                     ; preds = %214, %205
  %217 = load float, float* %f, align 4
  %218 = load i16, i16* %s, align 2
  %219 = sext i16 %218 to i32
  %220 = sitofp i32 %219 to float
  %221 = fmul float %217, %220
  %222 = fpext float %221 to double
  %223 = load double, double* %ds, align 8
  %224 = fcmp une double %222, %223
  br i1 %224, label %225, label %227

; <label>:225                                     ; preds = %216
  %226 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 16
  store i8 1, i8* %226, align 1
  br label %227

; <label>:227                                     ; preds = %225, %216
  %228 = load float, float* %f, align 4
  %229 = load i32, i32* %i, align 4
  %230 = sitofp i32 %229 to float
  %231 = fmul float %228, %230
  %232 = fpext float %231 to double
  %233 = load double, double* %ds, align 8
  %234 = fcmp une double %232, %233
  br i1 %234, label %235, label %237

; <label>:235                                     ; preds = %227
  %236 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 17
  store i8 1, i8* %236, align 1
  br label %237

; <label>:237                                     ; preds = %235, %227
  %238 = load float, float* %f, align 4
  %239 = load i32, i32* %u, align 4
  %240 = uitofp i32 %239 to float
  %241 = fmul float %238, %240
  %242 = fpext float %241 to double
  %243 = load double, double* %ds, align 8
  %244 = fcmp une double %242, %243
  br i1 %244, label %245, label %247

; <label>:245                                     ; preds = %237
  %246 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 18
  store i8 1, i8* %246, align 1
  br label %247

; <label>:247                                     ; preds = %245, %237
  %248 = load float, float* %f, align 4
  %249 = load i64, i64* %l, align 8
  %250 = sitofp i64 %249 to float
  %251 = fmul float %248, %250
  %252 = fpext float %251 to double
  %253 = load double, double* %ds, align 8
  %254 = fcmp une double %252, %253
  br i1 %254, label %255, label %257

; <label>:255                                     ; preds = %247
  %256 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 19
  store i8 1, i8* %256, align 1
  br label %257

; <label>:257                                     ; preds = %255, %247
  %258 = load float, float* %f, align 4
  %259 = load float, float* %f, align 4
  %260 = fmul float %258, %259
  %261 = fpext float %260 to double
  %262 = load double, double* %ds, align 8
  %263 = fcmp une double %261, %262
  br i1 %263, label %264, label %266

; <label>:264                                     ; preds = %257
  %265 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 20
  store i8 1, i8* %265, align 1
  br label %266

; <label>:266                                     ; preds = %264, %257
  %267 = load double, double* %d, align 8
  %268 = load i8, i8* %c, align 1
  %269 = sext i8 %268 to i32
  %270 = sitofp i32 %269 to double
  %271 = fmul double %267, %270
  %272 = load double, double* %ds, align 8
  %273 = fcmp une double %271, %272
  br i1 %273, label %274, label %276

; <label>:274                                     ; preds = %266
  %275 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 21
  store i8 1, i8* %275, align 1
  br label %276

; <label>:276                                     ; preds = %274, %266
  %277 = load double, double* %d, align 8
  %278 = load i16, i16* %s, align 2
  %279 = sext i16 %278 to i32
  %280 = sitofp i32 %279 to double
  %281 = fmul double %277, %280
  %282 = load double, double* %ds, align 8
  %283 = fcmp une double %281, %282
  br i1 %283, label %284, label %286

; <label>:284                                     ; preds = %276
  %285 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 22
  store i8 1, i8* %285, align 1
  br label %286

; <label>:286                                     ; preds = %284, %276
  %287 = load double, double* %d, align 8
  %288 = load i32, i32* %i, align 4
  %289 = sitofp i32 %288 to double
  %290 = fmul double %287, %289
  %291 = load double, double* %ds, align 8
  %292 = fcmp une double %290, %291
  br i1 %292, label %293, label %295

; <label>:293                                     ; preds = %286
  %294 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 23
  store i8 1, i8* %294, align 1
  br label %295

; <label>:295                                     ; preds = %293, %286
  %296 = load double, double* %d, align 8
  %297 = load i32, i32* %u, align 4
  %298 = uitofp i32 %297 to double
  %299 = fmul double %296, %298
  %300 = load double, double* %ds, align 8
  %301 = fcmp une double %299, %300
  br i1 %301, label %302, label %304

; <label>:302                                     ; preds = %295
  %303 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 24
  store i8 1, i8* %303, align 1
  br label %304

; <label>:304                                     ; preds = %302, %295
  %305 = load double, double* %d, align 8
  %306 = load i64, i64* %l, align 8
  %307 = sitofp i64 %306 to double
  %308 = fmul double %305, %307
  %309 = load double, double* %ds, align 8
  %310 = fcmp une double %308, %309
  br i1 %310, label %311, label %313

; <label>:311                                     ; preds = %304
  %312 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 25
  store i8 1, i8* %312, align 1
  br label %313

; <label>:313                                     ; preds = %311, %304
  %314 = load double, double* %d, align 8
  %315 = load float, float* %f, align 4
  %316 = fpext float %315 to double
  %317 = fmul double %314, %316
  %318 = load double, double* %ds, align 8
  %319 = fcmp une double %317, %318
  br i1 %319, label %320, label %322

; <label>:320                                     ; preds = %313
  %321 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 26
  store i8 1, i8* %321, align 1
  br label %322

; <label>:322                                     ; preds = %320, %313
  %323 = load double, double* %d, align 8
  %324 = load double, double* %d, align 8
  %325 = fmul double %323, %324
  %326 = load double, double* %ds, align 8
  %327 = fcmp une double %325, %326
  br i1 %327, label %328, label %330

; <label>:328                                     ; preds = %322
  %329 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 27
  store i8 1, i8* %329, align 1
  br label %330

; <label>:330                                     ; preds = %328, %322
  store i8 0, i8* %t0, align 1
  store i32 0, i32* %j, align 4
  br label %331

; <label>:331                                     ; preds = %344, %330
  %332 = load i32, i32* %j, align 4
  %333 = icmp slt i32 %332, 28
  br i1 %333, label %334, label %347

; <label>:334                                     ; preds = %331
  %335 = load i8, i8* %t0, align 1
  %336 = sext i8 %335 to i32
  %337 = load i32, i32* %j, align 4
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 %338
  %340 = load i8, i8* %339, align 1
  %341 = sext i8 %340 to i32
  %342 = add nsw i32 %336, %341
  %343 = trunc i32 %342 to i8
  store i8 %343, i8* %t0, align 1
  br label %344

; <label>:344                                     ; preds = %334
  %345 = load i32, i32* %j, align 4
  %346 = add nsw i32 %345, 1
  store i32 %346, i32* %j, align 4
  br label %331

; <label>:347                                     ; preds = %331
  %348 = load i8, i8* %t0, align 1
  %349 = sext i8 %348 to i32
  %350 = icmp ne i32 %349, 0
  br i1 %350, label %351, label %377

; <label>:351                                     ; preds = %347
  %352 = load i32, i32* %rc, align 4
  %353 = add nsw i32 %352, 4
  store i32 %353, i32* %rc, align 4
  %354 = load %struct.defs*, %struct.defs** %1, align 8
  %355 = getelementptr inbounds %struct.defs, %struct.defs* %354, i32 0, i32 11
  %356 = load i32, i32* %355, align 4
  %357 = icmp ne i32 %356, 0
  br i1 %357, label %358, label %376

; <label>:358                                     ; preds = %351
  %359 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @sec.s626er, i32 0, i32 0), i32 4)
  %360 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %j, align 4
  br label %361

; <label>:361                                     ; preds = %371, %358
  %362 = load i32, i32* %j, align 4
  %363 = icmp slt i32 %362, 28
  br i1 %363, label %364, label %374

; <label>:364                                     ; preds = %361
  %365 = load i32, i32* %j, align 4
  %366 = sext i32 %365 to i64
  %367 = getelementptr inbounds [28 x i8], [28 x i8]* %t, i32 0, i64 %366
  %368 = load i8, i8* %367, align 1
  %369 = sext i8 %368 to i32
  %370 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0), i32 %369)
  br label %371

; <label>:371                                     ; preds = %364
  %372 = load i32, i32* %j, align 4
  %373 = add nsw i32 %372, 1
  store i32 %373, i32* %j, align 4
  br label %361

; <label>:374                                     ; preds = %361
  %375 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0))
  br label %376

; <label>:376                                     ; preds = %374, %351
  br label %377

; <label>:377                                     ; preds = %376, %347
  store i64 32768, i64* %l, align 8
  %378 = load i64, i64* %l, align 8
  %379 = icmp sgt i64 %378, 32768
  br i1 %379, label %380, label %390

; <label>:380                                     ; preds = %377
  %381 = load i32, i32* %rc, align 4
  %382 = add nsw i32 %381, 8
  store i32 %382, i32* %rc, align 4
  %383 = load %struct.defs*, %struct.defs** %1, align 8
  %384 = getelementptr inbounds %struct.defs, %struct.defs* %383, i32 0, i32 11
  %385 = load i32, i32* %384, align 4
  %386 = icmp ne i32 %385, 0
  br i1 %386, label %387, label %389

; <label>:387                                     ; preds = %380
  %388 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @sec.s626er, i32 0, i32 0), i32 8)
  br label %389

; <label>:389                                     ; preds = %387, %380
  br label %390

; <label>:390                                     ; preds = %389, %377
  %391 = load i32, i32* %rc, align 4
  ret i32 %391
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
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %10)
  br label %12

; <label>:12                                      ; preds = %9, %0
  %13 = load i32, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 14), align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %12
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i32 0, i32 0))
  br label %19

; <label>:17                                      ; preds = %12
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.5, i32 0, i32 0))
  br label %19

; <label>:19                                      ; preds = %17, %15
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
