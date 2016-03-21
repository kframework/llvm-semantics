; ModuleID = './cq-02-s241.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s241er = internal global [11 x i8] c"s241,er%d\0A\00", align 1
@sec.qs241 = internal global [8 x i8] c"s241   \00", align 1
@sec.g = internal global [39 x i64] [i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 6, i64 0, i64 8, i64 0, i64 12, i64 0, i64 16, i64 0, i64 18, i64 0, i64 20, i64 0, i64 24, i64 0, i64 28, i64 0, i64 30, i64 0, i64 32, i64 0, i64 36], align 16
@.str = private unnamed_addr constant [48 x i8] c"Decimal and octal/hex constants sometimes give\0A\00", align 1
@.str.1 = private unnamed_addr constant [46 x i8] c"   different results when assigned to longs.\0A\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@main.pd0 = internal global %struct.defs* null, align 8
@.str.2 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"\0ANo errors detected.\0A\00", align 1
@.str.4 = private unnamed_addr constant [10 x i8] c"\0AFailed.\0A\00", align 1

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
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %rc = alloca i32, align 4
  %j = alloca i32, align 4
  %lrc = alloca i32, align 4
  %d = alloca [39 x i64], align 16
  %o = alloca [39 x i64], align 16
  %x = alloca [39 x i64], align 16
  store %struct.defs* %pd0, %struct.defs** %1, align 8
  store i32 0, i32* %rc, align 4
  store i32 0, i32* %lrc, align 4
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @sec.qs241, i32 0, i32 0), i8** %ps, align 8
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
  store i32 0, i32* %j, align 4
  br label %14

; <label>:14                                      ; preds = %23, %13
  %15 = load i32, i32* %j, align 4
  %16 = icmp slt i32 %15, 17
  br i1 %16, label %17, label %26

; <label>:17                                      ; preds = %14
  %18 = load i32, i32* %j, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32, i32* %j, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [39 x i64], [39 x i64]* @sec.g, i32 0, i64 %21
  store i64 %19, i64* %22, align 8
  br label %23

; <label>:23                                      ; preds = %17
  %24 = load i32, i32* %j, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %j, align 4
  br label %14

; <label>:26                                      ; preds = %14
  store i32 18, i32* %j, align 4
  br label %27

; <label>:27                                      ; preds = %30, %26
  %28 = load i32, i32* %j, align 4
  %29 = icmp slt i32 %28, 35
  br i1 %29, label %30, label %50

; <label>:30                                      ; preds = %27
  %31 = load i32, i32* %j, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [39 x i64], [39 x i64]* @sec.g, i32 0, i64 %32
  %34 = load i64, i64* %33, align 8
  %35 = call i64 @pow2(i64 %34)
  %36 = load i32, i32* %j, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds [39 x i64], [39 x i64]* @sec.g, i32 0, i64 %37
  store i64 %35, i64* %38, align 8
  %39 = load i32, i32* %j, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [39 x i64], [39 x i64]* @sec.g, i32 0, i64 %40
  %42 = load i64, i64* %41, align 8
  %43 = sub nsw i64 %42, 1
  %44 = load i32, i32* %j, align 4
  %45 = sub nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [39 x i64], [39 x i64]* @sec.g, i32 0, i64 %46
  store i64 %43, i64* %47, align 8
  %48 = load i32, i32* %j, align 4
  %49 = add nsw i32 %48, 2
  store i32 %49, i32* %j, align 4
  br label %27

; <label>:50                                      ; preds = %27
  %51 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 0
  store i64 0, i64* %51, align 8
  %52 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 0
  store i64 0, i64* %52, align 8
  %53 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 0
  store i64 0, i64* %53, align 8
  %54 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 1
  store i64 1, i64* %54, align 8
  %55 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 1
  store i64 1, i64* %55, align 8
  %56 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 1
  store i64 1, i64* %56, align 8
  %57 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 2
  store i64 2, i64* %57, align 8
  %58 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 2
  store i64 2, i64* %58, align 8
  %59 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 2
  store i64 2, i64* %59, align 8
  %60 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 3
  store i64 3, i64* %60, align 8
  %61 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 3
  store i64 3, i64* %61, align 8
  %62 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 3
  store i64 3, i64* %62, align 8
  %63 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 4
  store i64 4, i64* %63, align 8
  %64 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 4
  store i64 4, i64* %64, align 8
  %65 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 4
  store i64 4, i64* %65, align 8
  %66 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 5
  store i64 5, i64* %66, align 8
  %67 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 5
  store i64 5, i64* %67, align 8
  %68 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 5
  store i64 5, i64* %68, align 8
  %69 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 6
  store i64 6, i64* %69, align 8
  %70 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 6
  store i64 6, i64* %70, align 8
  %71 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 6
  store i64 6, i64* %71, align 8
  %72 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 7
  store i64 7, i64* %72, align 8
  %73 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 7
  store i64 7, i64* %73, align 8
  %74 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 7
  store i64 7, i64* %74, align 8
  %75 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 8
  store i64 8, i64* %75, align 8
  %76 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 8
  store i64 8, i64* %76, align 8
  %77 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 8
  store i64 8, i64* %77, align 8
  %78 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 9
  store i64 9, i64* %78, align 8
  %79 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 9
  store i64 9, i64* %79, align 8
  %80 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 9
  store i64 9, i64* %80, align 8
  %81 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 10
  store i64 10, i64* %81, align 8
  %82 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 10
  store i64 10, i64* %82, align 8
  %83 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 10
  store i64 10, i64* %83, align 8
  %84 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 11
  store i64 11, i64* %84, align 8
  %85 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 11
  store i64 11, i64* %85, align 8
  %86 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 11
  store i64 11, i64* %86, align 8
  %87 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 12
  store i64 12, i64* %87, align 8
  %88 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 12
  store i64 12, i64* %88, align 8
  %89 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 12
  store i64 12, i64* %89, align 8
  %90 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 13
  store i64 13, i64* %90, align 8
  %91 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 13
  store i64 13, i64* %91, align 8
  %92 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 13
  store i64 13, i64* %92, align 8
  %93 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 14
  store i64 14, i64* %93, align 8
  %94 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 14
  store i64 14, i64* %94, align 8
  %95 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 14
  store i64 14, i64* %95, align 8
  %96 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 15
  store i64 15, i64* %96, align 8
  %97 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 15
  store i64 15, i64* %97, align 8
  %98 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 15
  store i64 15, i64* %98, align 8
  %99 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 16
  store i64 16, i64* %99, align 8
  %100 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 16
  store i64 16, i64* %100, align 8
  %101 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 16
  store i64 16, i64* %101, align 8
  %102 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 17
  store i64 63, i64* %102, align 8
  %103 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 17
  store i64 63, i64* %103, align 8
  %104 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 17
  store i64 63, i64* %104, align 8
  %105 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 18
  store i64 64, i64* %105, align 8
  %106 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 18
  store i64 64, i64* %106, align 8
  %107 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 18
  store i64 64, i64* %107, align 8
  %108 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 19
  store i64 255, i64* %108, align 8
  %109 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 19
  store i64 255, i64* %109, align 8
  %110 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 19
  store i64 255, i64* %110, align 8
  %111 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 20
  store i64 256, i64* %111, align 8
  %112 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 20
  store i64 256, i64* %112, align 8
  %113 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 20
  store i64 256, i64* %113, align 8
  %114 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 21
  store i64 4095, i64* %114, align 8
  %115 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 21
  store i64 4095, i64* %115, align 8
  %116 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 21
  store i64 4095, i64* %116, align 8
  %117 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 22
  store i64 4096, i64* %117, align 8
  %118 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 22
  store i64 4096, i64* %118, align 8
  %119 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 22
  store i64 4096, i64* %119, align 8
  %120 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 23
  store i64 65535, i64* %120, align 8
  %121 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 23
  store i64 65535, i64* %121, align 8
  %122 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 23
  store i64 65535, i64* %122, align 8
  %123 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 24
  store i64 65536, i64* %123, align 8
  %124 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 24
  store i64 65536, i64* %124, align 8
  %125 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 24
  store i64 65536, i64* %125, align 8
  %126 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 25
  store i64 262143, i64* %126, align 8
  %127 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 25
  store i64 262143, i64* %127, align 8
  %128 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 25
  store i64 262143, i64* %128, align 8
  %129 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 26
  store i64 262144, i64* %129, align 8
  %130 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 26
  store i64 262144, i64* %130, align 8
  %131 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 26
  store i64 262144, i64* %131, align 8
  %132 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 27
  store i64 1048575, i64* %132, align 8
  %133 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 27
  store i64 1048575, i64* %133, align 8
  %134 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 27
  store i64 1048575, i64* %134, align 8
  %135 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 28
  store i64 1048576, i64* %135, align 8
  %136 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 28
  store i64 1048576, i64* %136, align 8
  %137 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 28
  store i64 1048576, i64* %137, align 8
  %138 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 29
  store i64 16777215, i64* %138, align 8
  %139 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 29
  store i64 16777215, i64* %139, align 8
  %140 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 29
  store i64 16777215, i64* %140, align 8
  %141 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 30
  store i64 16777216, i64* %141, align 8
  %142 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 30
  store i64 16777216, i64* %142, align 8
  %143 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 30
  store i64 16777216, i64* %143, align 8
  %144 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 31
  store i64 268435455, i64* %144, align 8
  %145 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 31
  store i64 268435455, i64* %145, align 8
  %146 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 31
  store i64 268435455, i64* %146, align 8
  %147 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 32
  store i64 268435456, i64* %147, align 8
  %148 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 32
  store i64 268435456, i64* %148, align 8
  %149 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 32
  store i64 268435456, i64* %149, align 8
  %150 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 33
  store i64 1073741823, i64* %150, align 8
  %151 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 33
  store i64 1073741823, i64* %151, align 8
  %152 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 33
  store i64 1073741823, i64* %152, align 8
  %153 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 34
  store i64 1073741824, i64* %153, align 8
  %154 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 34
  store i64 1073741824, i64* %154, align 8
  %155 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 34
  store i64 1073741824, i64* %155, align 8
  store i32 0, i32* %j, align 4
  br label %156

; <label>:156                                     ; preds = %199, %50
  %157 = load i32, i32* %j, align 4
  %158 = icmp slt i32 %157, 35
  br i1 %158, label %159, label %202

; <label>:159                                     ; preds = %156
  %160 = load i32, i32* %j, align 4
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds [39 x i64], [39 x i64]* @sec.g, i32 0, i64 %161
  %163 = load i64, i64* %162, align 8
  %164 = load i32, i32* %j, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 %165
  %167 = load i64, i64* %166, align 8
  %168 = icmp ne i64 %163, %167
  br i1 %168, label %189, label %169

; <label>:169                                     ; preds = %159
  %170 = load i32, i32* %j, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [39 x i64], [39 x i64]* %d, i32 0, i64 %171
  %173 = load i64, i64* %172, align 8
  %174 = load i32, i32* %j, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 %175
  %177 = load i64, i64* %176, align 8
  %178 = icmp ne i64 %173, %177
  br i1 %178, label %189, label %179

; <label>:179                                     ; preds = %169
  %180 = load i32, i32* %j, align 4
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds [39 x i64], [39 x i64]* %o, i32 0, i64 %181
  %183 = load i64, i64* %182, align 8
  %184 = load i32, i32* %j, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [39 x i64], [39 x i64]* %x, i32 0, i64 %185
  %187 = load i64, i64* %186, align 8
  %188 = icmp ne i64 %183, %187
  br i1 %188, label %189, label %198

; <label>:189                                     ; preds = %179, %169, %159
  %190 = load %struct.defs*, %struct.defs** %1, align 8
  %191 = getelementptr inbounds %struct.defs, %struct.defs* %190, i32 0, i32 10
  %192 = load i32, i32* %191, align 4
  %193 = icmp ne i32 %192, 0
  br i1 %193, label %194, label %197

; <label>:194                                     ; preds = %189
  %195 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str, i32 0, i32 0))
  %196 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.1, i32 0, i32 0))
  br label %197

; <label>:197                                     ; preds = %194, %189
  br label %198

; <label>:198                                     ; preds = %197, %179
  br label %199

; <label>:199                                     ; preds = %198
  %200 = load i32, i32* %j, align 4
  %201 = add nsw i32 %200, 1
  store i32 %201, i32* %j, align 4
  br label %156

; <label>:202                                     ; preds = %156
  %203 = load i32, i32* %lrc, align 4
  %204 = icmp ne i32 %203, 0
  br i1 %204, label %205, label %206

; <label>:205                                     ; preds = %202
  store i32 16, i32* %rc, align 4
  br label %206

; <label>:206                                     ; preds = %205, %202
  %207 = load i32, i32* %rc, align 4
  ret i32 %207
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
  %11 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 15, i32 0), i32 %10)
  br label %12

; <label>:12                                      ; preds = %9, %0
  %13 = load i32, i32* getelementptr inbounds (%struct.defs, %struct.defs* @main.d0, i32 0, i32 14), align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15                                      ; preds = %12
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i32 0, i32 0))
  br label %19

; <label>:17                                      ; preds = %12
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.4, i32 0, i32 0))
  br label %19

; <label>:19                                      ; preds = %17, %15
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
