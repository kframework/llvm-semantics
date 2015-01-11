; ModuleID = './cq-12-s72.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s72er = internal global [10 x i8] c"s72,er%d\0A\00", align 1
@sec.qs72 = internal global [8 x i8] c"s72    \00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

; Function Attrs: nounwind uwtable
define i64 @pow2(i64 %n) #0 {
  %1 = alloca i64, align 8
  %s = alloca i64, align 8
  store i64 %n, i64* %1, align 8
  store i64 1, i64* %s, align 8
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i64* %1, align 8
  %4 = add nsw i64 %3, -1
  store i64 %4, i64* %1, align 8
  %5 = icmp ne i64 %3, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %2
  %7 = load i64* %s, align 8
  %8 = mul nsw i64 %7, 2
  store i64 %8, i64* %s, align 8
  br label %2

; <label>:9                                       ; preds = %2
  %10 = load i64* %s, align 8
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
  %3 = load i32* %j, align 4
  %4 = icmp slt i32 %3, 256
  br i1 %4, label %5, label %11

; <label>:5                                       ; preds = %2
  %6 = load i8** %1, align 8
  %7 = getelementptr inbounds i8* %6, i32 1
  store i8* %7, i8** %1, align 8
  store i8 0, i8* %6, align 1
  br label %8

; <label>:8                                       ; preds = %5
  %9 = load i32* %j, align 4
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
  %2 = load i8** %1, align 8
  store i8* %2, i8** %p, align 8
  store i32 0, i32* %total, align 4
  store i32 0, i32* %j, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32* %j, align 4
  %5 = icmp slt i32 %4, 256
  br i1 %5, label %6, label %16

; <label>:6                                       ; preds = %3
  %7 = load i32* %total, align 4
  %8 = load i8** %p, align 8
  %9 = getelementptr inbounds i8* %8, i32 1
  store i8* %9, i8** %p, align 8
  %10 = load i8* %8, align 1
  %11 = sext i8 %10 to i32
  %12 = add nsw i32 %7, %11
  store i32 %12, i32* %total, align 4
  br label %13

; <label>:13                                      ; preds = %6
  %14 = load i32* %j, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %j, align 4
  br label %3

; <label>:16                                      ; preds = %3
  %17 = load i32* %total, align 4
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
  store i8* getelementptr inbounds ([8 x i8]* @setupTable.qs26, i32 0, i32 0), i8** %ps, align 8
  %2 = load %struct.defs** %1, align 8
  %3 = getelementptr inbounds %struct.defs* %2, i32 0, i32 15
  %4 = getelementptr inbounds [8 x i8]* %3, i32 0, i32 0
  store i8* %4, i8** %pt, align 8
  br label %5

; <label>:5                                       ; preds = %12, %0
  %6 = load i8** %ps, align 8
  %7 = getelementptr inbounds i8* %6, i32 1
  store i8* %7, i8** %ps, align 8
  %8 = load i8* %6, align 1
  %9 = load i8** %pt, align 8
  %10 = getelementptr inbounds i8* %9, i32 1
  store i8* %10, i8** %pt, align 8
  store i8 %8, i8* %9, align 1
  %11 = icmp ne i8 %8, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %5
  br label %5

; <label>:13                                      ; preds = %5
  %14 = load %struct.defs** %1, align 8
  %15 = getelementptr inbounds %struct.defs* %14, i32 0, i32 0
  store i32 0, i32* %15, align 4
  store i8 0, i8* %c0, align 1
  store i8 1, i8* %c1, align 1
  br label %16

; <label>:16                                      ; preds = %22, %13
  %17 = load i8* %c0, align 1
  %18 = zext i8 %17 to i32
  %19 = load i8* %c1, align 1
  %20 = zext i8 %19 to i32
  %21 = icmp ne i32 %18, %20
  br i1 %21, label %22, label %33

; <label>:22                                      ; preds = %16
  %23 = load i8* %c1, align 1
  %24 = zext i8 %23 to i32
  %25 = shl i32 %24, 1
  %26 = trunc i32 %25 to i8
  store i8 %26, i8* %c1, align 1
  %27 = load %struct.defs** %1, align 8
  %28 = getelementptr inbounds %struct.defs* %27, i32 0, i32 0
  %29 = load i32* %28, align 4
  %30 = add nsw i32 %29, 1
  %31 = load %struct.defs** %1, align 8
  %32 = getelementptr inbounds %struct.defs* %31, i32 0, i32 0
  store i32 %30, i32* %32, align 4
  br label %16

; <label>:33                                      ; preds = %16
  %34 = load %struct.defs** %1, align 8
  %35 = getelementptr inbounds %struct.defs* %34, i32 0, i32 0
  %36 = load i32* %35, align 4
  %37 = sext i32 %36 to i64
  %38 = mul i64 %37, 4
  %39 = trunc i64 %38 to i32
  %40 = load %struct.defs** %1, align 8
  %41 = getelementptr inbounds %struct.defs* %40, i32 0, i32 1
  store i32 %39, i32* %41, align 4
  %42 = load %struct.defs** %1, align 8
  %43 = getelementptr inbounds %struct.defs* %42, i32 0, i32 0
  %44 = load i32* %43, align 4
  %45 = sext i32 %44 to i64
  %46 = mul i64 %45, 2
  %47 = trunc i64 %46 to i32
  %48 = load %struct.defs** %1, align 8
  %49 = getelementptr inbounds %struct.defs* %48, i32 0, i32 2
  store i32 %47, i32* %49, align 4
  %50 = load %struct.defs** %1, align 8
  %51 = getelementptr inbounds %struct.defs* %50, i32 0, i32 0
  %52 = load i32* %51, align 4
  %53 = sext i32 %52 to i64
  %54 = mul i64 %53, 8
  %55 = trunc i64 %54 to i32
  %56 = load %struct.defs** %1, align 8
  %57 = getelementptr inbounds %struct.defs* %56, i32 0, i32 3
  store i32 %55, i32* %57, align 4
  %58 = load %struct.defs** %1, align 8
  %59 = getelementptr inbounds %struct.defs* %58, i32 0, i32 0
  %60 = load i32* %59, align 4
  %61 = sext i32 %60 to i64
  %62 = mul i64 %61, 4
  %63 = trunc i64 %62 to i32
  %64 = load %struct.defs** %1, align 8
  %65 = getelementptr inbounds %struct.defs* %64, i32 0, i32 4
  store i32 %63, i32* %65, align 4
  %66 = load %struct.defs** %1, align 8
  %67 = getelementptr inbounds %struct.defs* %66, i32 0, i32 0
  %68 = load i32* %67, align 4
  %69 = sext i32 %68 to i64
  %70 = mul i64 %69, 4
  %71 = trunc i64 %70 to i32
  %72 = load %struct.defs** %1, align 8
  %73 = getelementptr inbounds %struct.defs* %72, i32 0, i32 5
  store i32 %71, i32* %73, align 4
  %74 = load %struct.defs** %1, align 8
  %75 = getelementptr inbounds %struct.defs* %74, i32 0, i32 0
  %76 = load i32* %75, align 4
  %77 = sext i32 %76 to i64
  %78 = mul i64 %77, 8
  %79 = trunc i64 %78 to i32
  %80 = load %struct.defs** %1, align 8
  %81 = getelementptr inbounds %struct.defs* %80, i32 0, i32 6
  store i32 %79, i32* %81, align 4
  store float 1.000000e+00, float* %one, align 4
  store float 1.000000e+00, float* %delta, align 4
  store float 0.000000e+00, float* %temp, align 4
  br label %82

; <label>:82                                      ; preds = %86, %33
  %83 = load float* %temp, align 4
  %84 = load float* %one, align 4
  %85 = fcmp une float %83, %84
  br i1 %85, label %86, label %94

; <label>:86                                      ; preds = %82
  %87 = load float* %one, align 4
  %88 = load float* %delta, align 4
  %89 = fadd float %87, %88
  store float %89, float* %temp, align 4
  %90 = load float* %delta, align 4
  %91 = fpext float %90 to double
  %92 = fdiv double %91, 2.000000e+00
  %93 = fptrunc double %92 to float
  store float %93, float* %delta, align 4
  br label %82

; <label>:94                                      ; preds = %82
  %95 = load float* %delta, align 4
  %96 = fpext float %95 to double
  %97 = fmul double %96, 4.000000e+00
  %98 = fptrunc double %97 to float
  %99 = load %struct.defs** %1, align 8
  %100 = getelementptr inbounds %struct.defs* %99, i32 0, i32 7
  store float %98, float* %100, align 4
  store double 1.000000e+00, double* %oned, align 8
  store float 1.000000e+00, float* %delta, align 4
  store double 0.000000e+00, double* %tempd, align 8
  br label %101

; <label>:101                                     ; preds = %105, %94
  %102 = load double* %tempd, align 8
  %103 = load double* %oned, align 8
  %104 = fcmp une double %102, %103
  br i1 %104, label %105, label %114

; <label>:105                                     ; preds = %101
  %106 = load double* %oned, align 8
  %107 = load float* %delta, align 4
  %108 = fpext float %107 to double
  %109 = fadd double %106, %108
  store double %109, double* %tempd, align 8
  %110 = load float* %delta, align 4
  %111 = fpext float %110 to double
  %112 = fdiv double %111, 2.000000e+00
  %113 = fptrunc double %112 to float
  store float %113, float* %delta, align 4
  br label %101

; <label>:114                                     ; preds = %101
  %115 = load float* %delta, align 4
  %116 = fpext float %115 to double
  %117 = fmul double %116, 4.000000e+00
  %118 = fptrunc double %117 to float
  %119 = load %struct.defs** %1, align 8
  %120 = getelementptr inbounds %struct.defs* %119, i32 0, i32 8
  store float %118, float* %120, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @svtest(i32 %n) #0 {
  %1 = alloca i32, align 4
  %rc = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32* %1, align 4
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
  %5 = load i32* @svtest.k, align 4
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
  %11 = load i32* @svtest.k, align 4
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
  %17 = load i32* %rc, align 4
  ret i32 %17
}

; Function Attrs: nounwind uwtable
define i32 @zero() #0 {
  %rc = alloca i32, align 4
  store i32 2, i32* @zero.k, align 4
  store i32 0, i32* %rc, align 4
  %1 = load i32* %rc, align 4
  ret i32 %1
}

; Function Attrs: nounwind uwtable
define i32 @testev() #0 {
  %1 = alloca i32, align 4
  %2 = load i32* @extvar, align 4
  %3 = icmp ne i32 %2, 1066
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32 1, i32* %1
  br label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %6

; <label>:6                                       ; preds = %5, %4
  %7 = load i32* %1
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
  %3 = load i32* %2, align 4
  %4 = icmp sgt i32 %3, 100
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i32* %2, align 4
  %7 = sub nsw i32 %6, 10
  store i32 %7, i32* %1
  br label %13

; <label>:8                                       ; preds = %0
  %9 = load i32* %2, align 4
  %10 = add nsw i32 %9, 11
  %11 = call i32 @McCarthy(i32 %10)
  %12 = call i32 @McCarthy(i32 %11)
  store i32 %12, i32* %1
  br label %13

; <label>:13                                      ; preds = %8, %5
  %14 = load i32* %1
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @clobber(i32 %x, i32* %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32*, align 8
  store i32 %x, i32* %1, align 4
  store i32* %y, i32** %2, align 8
  store i32 3, i32* %1, align 4
  %3 = load i32** %2, align 8
  store i32 2, i32* %3, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @sec(%struct.defs* %pd0) #0 {
  %1 = alloca %struct.defs*, align 8
  %rc = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %k = alloca i32, align 4
  %j = alloca i32, align 4
  %i = alloca i32, align 4
  %lrc = alloca i32, align 4
  %c = alloca i8, align 1
  %s = alloca i16, align 2
  %l = alloca i64, align 8
  %u = alloca i32, align 4
  %d = alloca double, align 8
  %f = alloca float, align 4
  store %struct.defs* %pd0, %struct.defs** %1, align 8
  %2 = load %struct.defs** %1, align 8
  %3 = call i32 @setupTable(%struct.defs* %2)
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs72, i32 0, i32 0), i8** %ps, align 8
  %4 = load %struct.defs** %1, align 8
  %5 = getelementptr inbounds %struct.defs* %4, i32 0, i32 15
  %6 = getelementptr inbounds [8 x i8]* %5, i32 0, i32 0
  store i8* %6, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  br label %7

; <label>:7                                       ; preds = %14, %0
  %8 = load i8** %ps, align 8
  %9 = getelementptr inbounds i8* %8, i32 1
  store i8* %9, i8** %ps, align 8
  %10 = load i8* %8, align 1
  %11 = load i8** %pt, align 8
  %12 = getelementptr inbounds i8* %11, i32 1
  store i8* %12, i8** %pt, align 8
  store i8 %10, i8* %11, align 1
  %13 = icmp ne i8 %10, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %7
  br label %7

; <label>:15                                      ; preds = %7
  store i32 2, i32* %k, align 4
  %16 = load i32* %k, align 4
  %17 = icmp ne i32 %16, 2
  br i1 %17, label %18, label %22

; <label>:18                                      ; preds = %15
  %19 = load i32* %rc, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %rc, align 4
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 1)
  br label %22

; <label>:22                                      ; preds = %18, %15
  %23 = load i32* %k, align 4
  %24 = load i32* %k, align 4
  %25 = sub nsw i32 0, %24
  %26 = add nsw i32 %23, %25
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %32

; <label>:28                                      ; preds = %22
  %29 = load i32* %rc, align 4
  %30 = add nsw i32 %29, 2
  store i32 %30, i32* %rc, align 4
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 2)
  br label %32

; <label>:32                                      ; preds = %28, %22
  store i32 0, i32* %k, align 4
  store i32 0, i32* %j, align 4
  br label %33

; <label>:33                                      ; preds = %44, %32
  %34 = load i32* %j, align 4
  %35 = load %struct.defs** %1, align 8
  %36 = getelementptr inbounds %struct.defs* %35, i32 0, i32 1
  %37 = load i32* %36, align 4
  %38 = sub nsw i32 %37, 1
  %39 = icmp slt i32 %34, %38
  br i1 %39, label %40, label %47

; <label>:40                                      ; preds = %33
  %41 = load i32* %k, align 4
  %42 = shl i32 %41, 1
  %43 = or i32 %42, 1
  store i32 %43, i32* %k, align 4
  br label %44

; <label>:44                                      ; preds = %40
  %45 = load i32* %j, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %j, align 4
  br label %33

; <label>:47                                      ; preds = %33
  %48 = load i32* %k, align 4
  %49 = xor i32 %48, -1
  %50 = load i32* %k, align 4
  %51 = add nsw i32 %49, %50
  %52 = icmp ne i32 %51, -1
  br i1 %52, label %53, label %57

; <label>:53                                      ; preds = %47
  %54 = load i32* %rc, align 4
  %55 = add nsw i32 %54, 4
  store i32 %55, i32* %rc, align 4
  %56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 4)
  br label %57

; <label>:57                                      ; preds = %53, %47
  store i32 5, i32* %k, align 4
  %58 = load i32* %k, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %k, align 4
  %60 = icmp ne i32 %59, 6
  br i1 %60, label %76, label %61

; <label>:61                                      ; preds = %57
  %62 = load i32* %k, align 4
  %63 = add nsw i32 %62, -1
  store i32 %63, i32* %k, align 4
  %64 = icmp ne i32 %63, 5
  br i1 %64, label %76, label %65

; <label>:65                                      ; preds = %61
  %66 = load i32* %k, align 4
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %k, align 4
  %68 = icmp ne i32 %66, 5
  br i1 %68, label %76, label %69

; <label>:69                                      ; preds = %65
  %70 = load i32* %k, align 4
  %71 = add nsw i32 %70, -1
  store i32 %71, i32* %k, align 4
  %72 = icmp ne i32 %70, 6
  br i1 %72, label %76, label %73

; <label>:73                                      ; preds = %69
  %74 = load i32* %k, align 4
  %75 = icmp ne i32 %74, 5
  br i1 %75, label %76, label %80

; <label>:76                                      ; preds = %73, %69, %65, %61, %57
  %77 = load i32* %rc, align 4
  %78 = add nsw i32 %77, 8
  store i32 %78, i32* %rc, align 4
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 8)
  br label %80

; <label>:80                                      ; preds = %76, %73
  store i8 26, i8* %c, align 1
  store i64 26, i64* %l, align 8
  store double 2.600000e+01, double* %d, align 8
  store i16 26, i16* %s, align 2
  store i32 26, i32* %u, align 4
  store i32 26, i32* %i, align 4
  store float 2.600000e+01, float* %f, align 4
  store i32 0, i32* %lrc, align 4
  %81 = load i16* %s, align 2
  %82 = trunc i16 %81 to i8
  %83 = sext i8 %82 to i32
  %84 = icmp ne i32 %83, 26
  br i1 %84, label %110, label %85

; <label>:85                                      ; preds = %80
  %86 = load i32* %i, align 4
  %87 = trunc i32 %86 to i8
  %88 = sext i8 %87 to i32
  %89 = icmp ne i32 %88, 26
  br i1 %89, label %110, label %90

; <label>:90                                      ; preds = %85
  %91 = load i64* %l, align 8
  %92 = trunc i64 %91 to i8
  %93 = sext i8 %92 to i32
  %94 = icmp ne i32 %93, 26
  br i1 %94, label %110, label %95

; <label>:95                                      ; preds = %90
  %96 = load i32* %u, align 4
  %97 = trunc i32 %96 to i8
  %98 = sext i8 %97 to i32
  %99 = icmp ne i32 %98, 26
  br i1 %99, label %110, label %100

; <label>:100                                     ; preds = %95
  %101 = load float* %f, align 4
  %102 = fptosi float %101 to i8
  %103 = sext i8 %102 to i32
  %104 = icmp ne i32 %103, 26
  br i1 %104, label %110, label %105

; <label>:105                                     ; preds = %100
  %106 = load double* %d, align 8
  %107 = fptosi double %106 to i8
  %108 = sext i8 %107 to i32
  %109 = icmp ne i32 %108, 26
  br i1 %109, label %110, label %113

; <label>:110                                     ; preds = %105, %100, %95, %90, %85, %80
  %111 = load i32* %lrc, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %lrc, align 4
  br label %113

; <label>:113                                     ; preds = %110, %105
  %114 = load i8* %c, align 1
  %115 = sext i8 %114 to i16
  %116 = sext i16 %115 to i32
  %117 = icmp ne i32 %116, 26
  br i1 %117, label %143, label %118

; <label>:118                                     ; preds = %113
  %119 = load i32* %i, align 4
  %120 = trunc i32 %119 to i16
  %121 = sext i16 %120 to i32
  %122 = icmp ne i32 %121, 26
  br i1 %122, label %143, label %123

; <label>:123                                     ; preds = %118
  %124 = load i64* %l, align 8
  %125 = trunc i64 %124 to i16
  %126 = sext i16 %125 to i32
  %127 = icmp ne i32 %126, 26
  br i1 %127, label %143, label %128

; <label>:128                                     ; preds = %123
  %129 = load i32* %u, align 4
  %130 = trunc i32 %129 to i16
  %131 = sext i16 %130 to i32
  %132 = icmp ne i32 %131, 26
  br i1 %132, label %143, label %133

; <label>:133                                     ; preds = %128
  %134 = load float* %f, align 4
  %135 = fptosi float %134 to i16
  %136 = sext i16 %135 to i32
  %137 = icmp ne i32 %136, 26
  br i1 %137, label %143, label %138

; <label>:138                                     ; preds = %133
  %139 = load double* %d, align 8
  %140 = fptosi double %139 to i16
  %141 = sext i16 %140 to i32
  %142 = icmp ne i32 %141, 26
  br i1 %142, label %143, label %146

; <label>:143                                     ; preds = %138, %133, %128, %123, %118, %113
  %144 = load i32* %lrc, align 4
  %145 = add nsw i32 %144, 2
  store i32 %145, i32* %lrc, align 4
  br label %146

; <label>:146                                     ; preds = %143, %138
  %147 = load i8* %c, align 1
  %148 = sext i8 %147 to i32
  %149 = icmp ne i32 %148, 26
  br i1 %149, label %169, label %150

; <label>:150                                     ; preds = %146
  %151 = load i16* %s, align 2
  %152 = sext i16 %151 to i32
  %153 = icmp ne i32 %152, 26
  br i1 %153, label %169, label %154

; <label>:154                                     ; preds = %150
  %155 = load i64* %l, align 8
  %156 = trunc i64 %155 to i32
  %157 = icmp ne i32 %156, 26
  br i1 %157, label %169, label %158

; <label>:158                                     ; preds = %154
  %159 = load i32* %u, align 4
  %160 = icmp ne i32 %159, 26
  br i1 %160, label %169, label %161

; <label>:161                                     ; preds = %158
  %162 = load float* %f, align 4
  %163 = fptosi float %162 to i32
  %164 = icmp ne i32 %163, 26
  br i1 %164, label %169, label %165

; <label>:165                                     ; preds = %161
  %166 = load double* %d, align 8
  %167 = fptosi double %166 to i32
  %168 = icmp ne i32 %167, 26
  br i1 %168, label %169, label %172

; <label>:169                                     ; preds = %165, %161, %158, %154, %150, %146
  %170 = load i32* %lrc, align 4
  %171 = add nsw i32 %170, 4
  store i32 %171, i32* %lrc, align 4
  br label %172

; <label>:172                                     ; preds = %169, %165
  %173 = load i8* %c, align 1
  %174 = sext i8 %173 to i64
  %175 = icmp ne i64 %174, 26
  br i1 %175, label %196, label %176

; <label>:176                                     ; preds = %172
  %177 = load i16* %s, align 2
  %178 = sext i16 %177 to i64
  %179 = icmp ne i64 %178, 26
  br i1 %179, label %196, label %180

; <label>:180                                     ; preds = %176
  %181 = load i32* %i, align 4
  %182 = sext i32 %181 to i64
  %183 = icmp ne i64 %182, 26
  br i1 %183, label %196, label %184

; <label>:184                                     ; preds = %180
  %185 = load i32* %u, align 4
  %186 = zext i32 %185 to i64
  %187 = icmp ne i64 %186, 26
  br i1 %187, label %196, label %188

; <label>:188                                     ; preds = %184
  %189 = load float* %f, align 4
  %190 = fptosi float %189 to i64
  %191 = icmp ne i64 %190, 26
  br i1 %191, label %196, label %192

; <label>:192                                     ; preds = %188
  %193 = load double* %d, align 8
  %194 = fptosi double %193 to i64
  %195 = icmp ne i64 %194, 26
  br i1 %195, label %196, label %199

; <label>:196                                     ; preds = %192, %188, %184, %180, %176, %172
  %197 = load i32* %lrc, align 4
  %198 = add nsw i32 %197, 8
  store i32 %198, i32* %lrc, align 4
  br label %199

; <label>:199                                     ; preds = %196, %192
  %200 = load i8* %c, align 1
  %201 = sext i8 %200 to i32
  %202 = icmp ne i32 %201, 26
  br i1 %202, label %222, label %203

; <label>:203                                     ; preds = %199
  %204 = load i16* %s, align 2
  %205 = sext i16 %204 to i32
  %206 = icmp ne i32 %205, 26
  br i1 %206, label %222, label %207

; <label>:207                                     ; preds = %203
  %208 = load i32* %i, align 4
  %209 = icmp ne i32 %208, 26
  br i1 %209, label %222, label %210

; <label>:210                                     ; preds = %207
  %211 = load i64* %l, align 8
  %212 = trunc i64 %211 to i32
  %213 = icmp ne i32 %212, 26
  br i1 %213, label %222, label %214

; <label>:214                                     ; preds = %210
  %215 = load float* %f, align 4
  %216 = fptoui float %215 to i32
  %217 = icmp ne i32 %216, 26
  br i1 %217, label %222, label %218

; <label>:218                                     ; preds = %214
  %219 = load double* %d, align 8
  %220 = fptoui double %219 to i32
  %221 = icmp ne i32 %220, 26
  br i1 %221, label %222, label %225

; <label>:222                                     ; preds = %218, %214, %210, %207, %203, %199
  %223 = load i32* %lrc, align 4
  %224 = add nsw i32 %223, 16
  store i32 %224, i32* %lrc, align 4
  br label %225

; <label>:225                                     ; preds = %222, %218
  %226 = load i8* %c, align 1
  %227 = sitofp i8 %226 to float
  %228 = fpext float %227 to double
  %229 = fcmp une double %228, 2.600000e+01
  br i1 %229, label %255, label %230

; <label>:230                                     ; preds = %225
  %231 = load i16* %s, align 2
  %232 = sitofp i16 %231 to float
  %233 = fpext float %232 to double
  %234 = fcmp une double %233, 2.600000e+01
  br i1 %234, label %255, label %235

; <label>:235                                     ; preds = %230
  %236 = load i32* %i, align 4
  %237 = sitofp i32 %236 to float
  %238 = fpext float %237 to double
  %239 = fcmp une double %238, 2.600000e+01
  br i1 %239, label %255, label %240

; <label>:240                                     ; preds = %235
  %241 = load i64* %l, align 8
  %242 = sitofp i64 %241 to float
  %243 = fpext float %242 to double
  %244 = fcmp une double %243, 2.600000e+01
  br i1 %244, label %255, label %245

; <label>:245                                     ; preds = %240
  %246 = load i32* %u, align 4
  %247 = uitofp i32 %246 to float
  %248 = fpext float %247 to double
  %249 = fcmp une double %248, 2.600000e+01
  br i1 %249, label %255, label %250

; <label>:250                                     ; preds = %245
  %251 = load double* %d, align 8
  %252 = fptrunc double %251 to float
  %253 = fpext float %252 to double
  %254 = fcmp une double %253, 2.600000e+01
  br i1 %254, label %255, label %258

; <label>:255                                     ; preds = %250, %245, %240, %235, %230, %225
  %256 = load i32* %lrc, align 4
  %257 = add nsw i32 %256, 32
  store i32 %257, i32* %lrc, align 4
  br label %258

; <label>:258                                     ; preds = %255, %250
  %259 = load i8* %c, align 1
  %260 = sitofp i8 %259 to double
  %261 = fcmp une double %260, 2.600000e+01
  br i1 %261, label %282, label %262

; <label>:262                                     ; preds = %258
  %263 = load i16* %s, align 2
  %264 = sitofp i16 %263 to double
  %265 = fcmp une double %264, 2.600000e+01
  br i1 %265, label %282, label %266

; <label>:266                                     ; preds = %262
  %267 = load i32* %i, align 4
  %268 = sitofp i32 %267 to double
  %269 = fcmp une double %268, 2.600000e+01
  br i1 %269, label %282, label %270

; <label>:270                                     ; preds = %266
  %271 = load i64* %l, align 8
  %272 = sitofp i64 %271 to double
  %273 = fcmp une double %272, 2.600000e+01
  br i1 %273, label %282, label %274

; <label>:274                                     ; preds = %270
  %275 = load i32* %u, align 4
  %276 = uitofp i32 %275 to double
  %277 = fcmp une double %276, 2.600000e+01
  br i1 %277, label %282, label %278

; <label>:278                                     ; preds = %274
  %279 = load float* %f, align 4
  %280 = fpext float %279 to double
  %281 = fcmp une double %280, 2.600000e+01
  br i1 %281, label %282, label %285

; <label>:282                                     ; preds = %278, %274, %270, %266, %262, %258
  %283 = load i32* %lrc, align 4
  %284 = add nsw i32 %283, 64
  store i32 %284, i32* %lrc, align 4
  br label %285

; <label>:285                                     ; preds = %282, %278
  %286 = load i32* %lrc, align 4
  %287 = icmp ne i32 %286, 0
  br i1 %287, label %288, label %292

; <label>:288                                     ; preds = %285
  %289 = load i32* %rc, align 4
  %290 = add nsw i32 %289, 16
  store i32 %290, i32* %rc, align 4
  %291 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s72er, i32 0, i32 0), i32 16)
  br label %292

; <label>:292                                     ; preds = %288, %285
  %293 = load i32* %rc, align 4
  ret i32 %293
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 9), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 10), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 11), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 12), align 4
  store %struct.defs* @main.d0, %struct.defs** @main.pd0, align 8
  %2 = load %struct.defs** @main.pd0, align 8
  %3 = call i32 @sec(%struct.defs* %2)
  store i32 %3, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 13), align 4
  %4 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %5 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 13), align 4
  %6 = add nsw i32 %4, %5
  store i32 %6, i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %7 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 9), align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %0
  %10 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 13), align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %10)
  br label %12

; <label>:12                                      ; preds = %9, %0
  %13 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i32 0, i32 14), align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %12
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0))
  br label %19

; <label>:17                                      ; preds = %12
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0))
  br label %19

; <label>:19                                      ; preds = %17, %15
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
