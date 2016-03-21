; ModuleID = './cq-17-s86.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s86er = internal global [10 x i8] c"s86,er%d\0A\00", align 1
@sec.qs86 = internal global [8 x i8] c"s86    \00", align 1
@sec.x = internal global [3 x i32] [i32 1, i32 3, i32 5], align 4
@sec.pint = internal global i32* bitcast (i8* getelementptr (i8, i8* bitcast ([3 x i32]* @sec.x to i8*), i64 8) to i32*), align 8
@sec.zero = internal global [10 x i32] zeroinitializer, align 16
@sec.y0 = internal global [12 x float] [float 1.000000e+00, float 3.000000e+00, float 5.000000e+00, float 2.000000e+00, float 4.000000e+00, float 6.000000e+00, float 3.000000e+00, float 5.000000e+00, float 7.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00], align 16
@sec.y1 = internal global [4 x [3 x float]] [[3 x float] [float 1.000000e+00, float 3.000000e+00, float 5.000000e+00], [3 x float] [float 2.000000e+00, float 4.000000e+00, float 6.000000e+00], [3 x float] [float 3.000000e+00, float 5.000000e+00, float 7.000000e+00], [3 x float] zeroinitializer], align 16
@sec.y2 = internal global [4 x [3 x float]] [[3 x float] [float 1.000000e+00, float 3.000000e+00, float 5.000000e+00], [3 x float] [float 2.000000e+00, float 4.000000e+00, float 6.000000e+00], [3 x float] [float 3.000000e+00, float 5.000000e+00, float 7.000000e+00], [3 x float] zeroinitializer], align 16
@sec.y3 = internal global [4 x [3 x float]] [[3 x float] [float 1.000000e+00, float 0.000000e+00, float 0.000000e+00], [3 x float] [float 2.000000e+00, float 0.000000e+00, float 0.000000e+00], [3 x float] [float 3.000000e+00, float 0.000000e+00, float 0.000000e+00], [3 x float] [float 4.000000e+00, float 0.000000e+00, float 0.000000e+00]], align 16
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str.1 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str.2 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

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
  %lrc = alloca i32, align 4
  %rc = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %apint = alloca i32*, align 8
  %rpint = alloca i32*, align 8
  store %struct.defs* %pd0, %struct.defs** %1, align 8
  %2 = load i32*, i32** @sec.pint, align 8
  %3 = getelementptr inbounds i32, i32* %2, i64 -1
  store i32* %3, i32** %apint, align 8
  %4 = load i32*, i32** %apint, align 8
  %5 = call i32 @one()
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i32, i32* %4, i64 %6
  store i32* %7, i32** %rpint, align 8
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @sec.qs86, i32 0, i32 0), i8** %ps, align 8
  %8 = load %struct.defs*, %struct.defs** %1, align 8
  %9 = getelementptr inbounds %struct.defs, %struct.defs* %8, i32 0, i32 15
  %10 = getelementptr inbounds [8 x i8], [8 x i8]* %9, i32 0, i32 0
  store i8* %10, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  br label %11

; <label>:11                                      ; preds = %18, %0
  %12 = load i8*, i8** %ps, align 8
  %13 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %13, i8** %ps, align 8
  %14 = load i8, i8* %12, align 1
  %15 = load i8*, i8** %pt, align 8
  %16 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %16, i8** %pt, align 8
  store i8 %14, i8* %15, align 1
  %17 = icmp ne i8 %14, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %11
  br label %11

; <label>:19                                      ; preds = %11
  %20 = load i32*, i32** @sec.pint, align 8
  %21 = load i32, i32* %20, align 4
  %22 = icmp ne i32 %21, 5
  br i1 %22, label %23, label %33

; <label>:23                                      ; preds = %19
  %24 = load %struct.defs*, %struct.defs** %1, align 8
  %25 = getelementptr inbounds %struct.defs, %struct.defs* %24, i32 0, i32 11
  %26 = load i32, i32* %25, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %30

; <label>:28                                      ; preds = %23
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @sec.s86er, i32 0, i32 0), i32 1)
  br label %30

; <label>:30                                      ; preds = %28, %23
  %31 = load i32, i32* %rc, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %rc, align 4
  br label %33

; <label>:33                                      ; preds = %30, %19
  %34 = load i32*, i32** %apint, align 8
  %35 = load i32, i32* %34, align 4
  %36 = icmp ne i32 %35, 3
  br i1 %36, label %37, label %47

; <label>:37                                      ; preds = %33
  %38 = load %struct.defs*, %struct.defs** %1, align 8
  %39 = getelementptr inbounds %struct.defs, %struct.defs* %38, i32 0, i32 11
  %40 = load i32, i32* %39, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %44

; <label>:42                                      ; preds = %37
  %43 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @sec.s86er, i32 0, i32 0), i32 2)
  br label %44

; <label>:44                                      ; preds = %42, %37
  %45 = load i32, i32* %rc, align 4
  %46 = add nsw i32 %45, 2
  store i32 %46, i32* %rc, align 4
  br label %47

; <label>:47                                      ; preds = %44, %33
  %48 = load i32*, i32** %rpint, align 8
  %49 = load i32, i32* %48, align 4
  %50 = icmp ne i32 %49, 5
  br i1 %50, label %51, label %61

; <label>:51                                      ; preds = %47
  %52 = load %struct.defs*, %struct.defs** %1, align 8
  %53 = getelementptr inbounds %struct.defs, %struct.defs* %52, i32 0, i32 11
  %54 = load i32, i32* %53, align 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %58

; <label>:56                                      ; preds = %51
  %57 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @sec.s86er, i32 0, i32 0), i32 4)
  br label %58

; <label>:58                                      ; preds = %56, %51
  %59 = load i32, i32* %rc, align 4
  %60 = add nsw i32 %59, 4
  store i32 %60, i32* %rc, align 4
  br label %61

; <label>:61                                      ; preds = %58, %47
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  br label %62

; <label>:62                                      ; preds = %73, %61
  %63 = load i32, i32* %j, align 4
  %64 = icmp slt i32 %63, 10
  br i1 %64, label %65, label %76

; <label>:65                                      ; preds = %62
  %66 = load i32, i32* %j, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [10 x i32], [10 x i32]* @sec.zero, i32 0, i64 %67
  %69 = load i32, i32* %68, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %71, label %72

; <label>:71                                      ; preds = %65
  store i32 1, i32* %lrc, align 4
  br label %72

; <label>:72                                      ; preds = %71, %65
  br label %73

; <label>:73                                      ; preds = %72
  %74 = load i32, i32* %j, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %j, align 4
  br label %62

; <label>:76                                      ; preds = %62
  %77 = load i32, i32* %lrc, align 4
  %78 = icmp ne i32 %77, 0
  br i1 %78, label %79, label %89

; <label>:79                                      ; preds = %76
  %80 = load %struct.defs*, %struct.defs** %1, align 8
  %81 = getelementptr inbounds %struct.defs, %struct.defs* %80, i32 0, i32 11
  %82 = load i32, i32* %81, align 4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %86

; <label>:84                                      ; preds = %79
  %85 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @sec.s86er, i32 0, i32 0), i32 8)
  br label %86

; <label>:86                                      ; preds = %84, %79
  %87 = load i32, i32* %rc, align 4
  %88 = add nsw i32 %87, 8
  store i32 %88, i32* %rc, align 4
  br label %89

; <label>:89                                      ; preds = %86, %76
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %i, align 4
  br label %90

; <label>:90                                      ; preds = %136, %89
  %91 = load i32, i32* %i, align 4
  %92 = icmp slt i32 %91, 4
  br i1 %92, label %93, label %139

; <label>:93                                      ; preds = %90
  store i32 0, i32* %j, align 4
  br label %94

; <label>:94                                      ; preds = %132, %93
  %95 = load i32, i32* %j, align 4
  %96 = icmp slt i32 %95, 3
  br i1 %96, label %97, label %135

; <label>:97                                      ; preds = %94
  %98 = load i32, i32* %i, align 4
  %99 = mul nsw i32 3, %98
  %100 = load i32, i32* %j, align 4
  %101 = add nsw i32 %99, %100
  store i32 %101, i32* %k, align 4
  %102 = load i32, i32* %j, align 4
  %103 = sext i32 %102 to i64
  %104 = load i32, i32* %i, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [4 x [3 x float]], [4 x [3 x float]]* @sec.y1, i32 0, i64 %105
  %107 = getelementptr inbounds [3 x float], [3 x float]* %106, i32 0, i64 %103
  %108 = load float, float* %107, align 4
  %109 = load i32, i32* %j, align 4
  %110 = sext i32 %109 to i64
  %111 = load i32, i32* %i, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [4 x [3 x float]], [4 x [3 x float]]* @sec.y2, i32 0, i64 %112
  %114 = getelementptr inbounds [3 x float], [3 x float]* %113, i32 0, i64 %110
  %115 = load float, float* %114, align 4
  %116 = fcmp une float %108, %115
  br i1 %116, label %130, label %117

; <label>:117                                     ; preds = %97
  %118 = load i32, i32* %j, align 4
  %119 = sext i32 %118 to i64
  %120 = load i32, i32* %i, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [4 x [3 x float]], [4 x [3 x float]]* @sec.y1, i32 0, i64 %121
  %123 = getelementptr inbounds [3 x float], [3 x float]* %122, i32 0, i64 %119
  %124 = load float, float* %123, align 4
  %125 = load i32, i32* %k, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [12 x float], [12 x float]* @sec.y0, i32 0, i64 %126
  %128 = load float, float* %127, align 4
  %129 = fcmp une float %124, %128
  br i1 %129, label %130, label %131

; <label>:130                                     ; preds = %117, %97
  store i32 1, i32* %lrc, align 4
  br label %131

; <label>:131                                     ; preds = %130, %117
  br label %132

; <label>:132                                     ; preds = %131
  %133 = load i32, i32* %j, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %j, align 4
  br label %94

; <label>:135                                     ; preds = %94
  br label %136

; <label>:136                                     ; preds = %135
  %137 = load i32, i32* %i, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, i32* %i, align 4
  br label %90

; <label>:139                                     ; preds = %90
  %140 = load i32, i32* %lrc, align 4
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %152

; <label>:142                                     ; preds = %139
  %143 = load %struct.defs*, %struct.defs** %1, align 8
  %144 = getelementptr inbounds %struct.defs, %struct.defs* %143, i32 0, i32 11
  %145 = load i32, i32* %144, align 4
  %146 = icmp ne i32 %145, 0
  br i1 %146, label %147, label %149

; <label>:147                                     ; preds = %142
  %148 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @sec.s86er, i32 0, i32 0), i32 16)
  br label %149

; <label>:149                                     ; preds = %147, %142
  %150 = load i32, i32* %rc, align 4
  %151 = add nsw i32 %150, 16
  store i32 %151, i32* %rc, align 4
  br label %152

; <label>:152                                     ; preds = %149, %139
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  br label %153

; <label>:153                                     ; preds = %168, %152
  %154 = load i32, i32* %j, align 4
  %155 = icmp slt i32 %154, 4
  br i1 %155, label %156, label %171

; <label>:156                                     ; preds = %153
  %157 = load i32, i32* %j, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds [4 x [3 x float]], [4 x [3 x float]]* @sec.y3, i32 0, i64 %158
  %160 = getelementptr inbounds [3 x float], [3 x float]* %159, i32 0, i64 0
  %161 = load float, float* %160, align 4
  %162 = load i32, i32* %j, align 4
  %163 = add nsw i32 %162, 1
  %164 = sitofp i32 %163 to float
  %165 = fcmp une float %161, %164
  br i1 %165, label %166, label %167

; <label>:166                                     ; preds = %156
  store i32 1, i32* %lrc, align 4
  br label %167

; <label>:167                                     ; preds = %166, %156
  br label %168

; <label>:168                                     ; preds = %167
  %169 = load i32, i32* %j, align 4
  %170 = add nsw i32 %169, 1
  store i32 %170, i32* %j, align 4
  br label %153

; <label>:171                                     ; preds = %153
  %172 = load i32, i32* %lrc, align 4
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %184

; <label>:174                                     ; preds = %171
  %175 = load %struct.defs*, %struct.defs** %1, align 8
  %176 = getelementptr inbounds %struct.defs, %struct.defs* %175, i32 0, i32 11
  %177 = load i32, i32* %176, align 4
  %178 = icmp ne i32 %177, 0
  br i1 %178, label %179, label %181

; <label>:179                                     ; preds = %174
  %180 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @sec.s86er, i32 0, i32 0), i32 32)
  br label %181

; <label>:181                                     ; preds = %179, %174
  %182 = load i32, i32* %rc, align 4
  %183 = add nsw i32 %182, 32
  store i32 %183, i32* %rc, align 4
  br label %184

; <label>:184                                     ; preds = %181, %171
  %185 = load i32, i32* %rc, align 4
  ret i32 %185
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @one() #0 {
  ret i32 1
}

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
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %10)
  br label %12

; <label>:12                                      ; preds = %9, %0
  %13 = load i32, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 14), align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %12
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.1, i32 0, i32 0))
  br label %19

; <label>:17                                      ; preds = %12
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.2, i32 0, i32 0))
  br label %19

; <label>:19                                      ; preds = %17, %15
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
