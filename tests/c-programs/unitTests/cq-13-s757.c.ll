; ModuleID = './cq-13-s757.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s757er = internal global [11 x i8] c"s757,er%d\0A\00", align 1
@sec.qs757 = internal global [8 x i8] c"s757   \00", align 1
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
  %rc = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  %t = alloca i32, align 4
  %lrc = alloca i32, align 4
  %k = alloca i32, align 4
  %j = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %x = alloca [16 x i32], align 16
  %p = alloca i32*, align 8
  %rs = alloca i32, align 4
  %ls = alloca i32, align 4
  %rt = alloca i32, align 4
  %lt = alloca i32, align 4
  store %struct.defs* %pd0, %struct.defs** %1, align 8
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @sec.qs757, i32 0, i32 0), i8** %ps, align 8
  %2 = load %struct.defs*, %struct.defs** %1, align 8
  %3 = getelementptr inbounds %struct.defs, %struct.defs* %2, i32 0, i32 15
  %4 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i32 0, i32 0
  store i8* %4, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
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
  store i32 40, i32* %t, align 4
  %14 = load i32, i32* %t, align 4
  %15 = shl i32 %14, 3
  %16 = shl i32 %15, 2
  %17 = icmp ne i32 %16, 1280
  br i1 %17, label %23, label %18

; <label>:18                                      ; preds = %13
  %19 = load i32, i32* %t, align 4
  %20 = ashr i32 %19, 3
  %21 = ashr i32 %20, 2
  %22 = icmp ne i32 %21, 1
  br i1 %22, label %23, label %33

; <label>:23                                      ; preds = %18, %13
  %24 = load i32, i32* %rc, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %rc, align 4
  %26 = load %struct.defs*, %struct.defs** %1, align 8
  %27 = getelementptr inbounds %struct.defs, %struct.defs* %26, i32 0, i32 11
  %28 = load i32, i32* %27, align 4
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %32

; <label>:30                                      ; preds = %23
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @sec.s757er, i32 0, i32 0), i32 1)
  br label %32

; <label>:32                                      ; preds = %30, %23
  br label %33

; <label>:33                                      ; preds = %32, %18
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %k, align 4
  br label %34

; <label>:34                                      ; preds = %93, %33
  %35 = load i32, i32* %k, align 4
  %36 = load %struct.defs*, %struct.defs** %1, align 8
  %37 = getelementptr inbounds %struct.defs, %struct.defs* %36, i32 0, i32 4
  %38 = load i32, i32* %37, align 4
  %39 = icmp slt i32 %35, %38
  br i1 %39, label %40, label %96

; <label>:40                                      ; preds = %34
  store i32 1, i32* %rs, align 4
  %41 = load i32, i32* %rs, align 4
  %42 = load %struct.defs*, %struct.defs** %1, align 8
  %43 = getelementptr inbounds %struct.defs, %struct.defs* %42, i32 0, i32 4
  %44 = load i32, i32* %43, align 4
  %45 = sub nsw i32 %44, 1
  %46 = shl i32 %41, %45
  store i32 %46, i32* %ls, align 4
  store i32 0, i32* %rt, align 4
  %47 = load i32, i32* %rt, align 4
  %48 = xor i32 %47, -1
  %49 = load i32, i32* %k, align 4
  %50 = lshr i32 %48, %49
  store i32 %50, i32* %lt, align 4
  %51 = load i32, i32* %rt, align 4
  %52 = xor i32 %51, -1
  %53 = load i32, i32* %k, align 4
  %54 = shl i32 %52, %53
  store i32 %54, i32* %rt, align 4
  store i32 0, i32* %j, align 4
  br label %55

; <label>:55                                      ; preds = %89, %40
  %56 = load i32, i32* %j, align 4
  %57 = load %struct.defs*, %struct.defs** %1, align 8
  %58 = getelementptr inbounds %struct.defs, %struct.defs* %57, i32 0, i32 4
  %59 = load i32, i32* %58, align 4
  %60 = icmp slt i32 %56, %59
  br i1 %60, label %61, label %92

; <label>:61                                      ; preds = %55
  %62 = load i32, i32* %j, align 4
  %63 = load i32, i32* %k, align 4
  %64 = icmp slt i32 %62, %63
  %65 = zext i1 %64 to i32
  %66 = load i32, i32* %rs, align 4
  %67 = load i32, i32* %rt, align 4
  %68 = and i32 %66, %67
  %69 = icmp eq i32 %68, 0
  %70 = zext i1 %69 to i32
  %71 = icmp ne i32 %65, %70
  br i1 %71, label %83, label %72

; <label>:72                                      ; preds = %61
  %73 = load i32, i32* %j, align 4
  %74 = load i32, i32* %k, align 4
  %75 = icmp slt i32 %73, %74
  %76 = zext i1 %75 to i32
  %77 = load i32, i32* %ls, align 4
  %78 = load i32, i32* %lt, align 4
  %79 = and i32 %77, %78
  %80 = icmp eq i32 %79, 0
  %81 = zext i1 %80 to i32
  %82 = icmp ne i32 %76, %81
  br i1 %82, label %83, label %84

; <label>:83                                      ; preds = %72, %61
  store i32 1, i32* %lrc, align 4
  br label %84

; <label>:84                                      ; preds = %83, %72
  %85 = load i32, i32* %rs, align 4
  %86 = shl i32 %85, 1
  store i32 %86, i32* %rs, align 4
  %87 = load i32, i32* %ls, align 4
  %88 = lshr i32 %87, 1
  store i32 %88, i32* %ls, align 4
  br label %89

; <label>:89                                      ; preds = %84
  %90 = load i32, i32* %j, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %j, align 4
  br label %55

; <label>:92                                      ; preds = %55
  br label %93

; <label>:93                                      ; preds = %92
  %94 = load i32, i32* %k, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %k, align 4
  br label %34

; <label>:96                                      ; preds = %34
  %97 = load i32, i32* %lrc, align 4
  %98 = icmp ne i32 %97, 0
  br i1 %98, label %99, label %109

; <label>:99                                      ; preds = %96
  %100 = load i32, i32* %rc, align 4
  %101 = add nsw i32 %100, 2
  store i32 %101, i32* %rc, align 4
  %102 = load %struct.defs*, %struct.defs** %1, align 8
  %103 = getelementptr inbounds %struct.defs, %struct.defs* %102, i32 0, i32 11
  %104 = load i32, i32* %103, align 4
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %106, label %108

; <label>:106                                     ; preds = %99
  %107 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @sec.s757er, i32 0, i32 0), i32 2)
  br label %108

; <label>:108                                     ; preds = %106, %99
  br label %109

; <label>:109                                     ; preds = %108, %96
  store i32 3, i32* %a, align 4
  store i32 2, i32* %b, align 4
  store i32 1, i32* %c, align 4
  %110 = load i32, i32* %a, align 4
  %111 = load i32, i32* %b, align 4
  %112 = icmp slt i32 %110, %111
  %113 = zext i1 %112 to i32
  %114 = load i32, i32* %c, align 4
  %115 = icmp slt i32 %113, %114
  %116 = zext i1 %115 to i32
  %117 = icmp ne i32 %116, 1
  br i1 %117, label %118, label %128

; <label>:118                                     ; preds = %109
  %119 = load i32, i32* %rc, align 4
  %120 = add nsw i32 %119, 4
  store i32 %120, i32* %rc, align 4
  %121 = load %struct.defs*, %struct.defs** %1, align 8
  %122 = getelementptr inbounds %struct.defs, %struct.defs* %121, i32 0, i32 11
  %123 = load i32, i32* %122, align 4
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %125, label %127

; <label>:125                                     ; preds = %118
  %126 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @sec.s757er, i32 0, i32 0), i32 4)
  br label %127

; <label>:127                                     ; preds = %125, %118
  br label %128

; <label>:128                                     ; preds = %127, %109
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  br label %129

; <label>:129                                     ; preds = %136, %128
  %130 = load i32, i32* %j, align 4
  %131 = icmp slt i32 %130, 16
  br i1 %131, label %132, label %139

; <label>:132                                     ; preds = %129
  %133 = load i32, i32* %j, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [16 x i32], [16 x i32]* %x, i32 0, i64 %134
  store i32 1, i32* %135, align 4
  br label %136

; <label>:136                                     ; preds = %132
  %137 = load i32, i32* %j, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, i32* %j, align 4
  br label %129

; <label>:139                                     ; preds = %129
  %140 = getelementptr inbounds [16 x i32], [16 x i32]* %x, i32 0, i64 1
  store i32 0, i32* %140, align 4
  %141 = getelementptr inbounds [16 x i32], [16 x i32]* %x, i32 0, i64 4
  store i32 0, i32* %141, align 4
  %142 = getelementptr inbounds [16 x i32], [16 x i32]* %x, i32 0, i64 6
  store i32 0, i32* %142, align 4
  %143 = getelementptr inbounds [16 x i32], [16 x i32]* %x, i32 0, i64 7
  store i32 0, i32* %143, align 4
  %144 = getelementptr inbounds [16 x i32], [16 x i32]* %x, i32 0, i64 9
  store i32 0, i32* %144, align 4
  %145 = getelementptr inbounds [16 x i32], [16 x i32]* %x, i32 0, i64 13
  store i32 0, i32* %145, align 4
  store i32 0, i32* %a, align 4
  br label %146

; <label>:146                                     ; preds = %200, %139
  %147 = load i32, i32* %a, align 4
  %148 = icmp slt i32 %147, 2
  br i1 %148, label %149, label %203

; <label>:149                                     ; preds = %146
  store i32 0, i32* %b, align 4
  br label %150

; <label>:150                                     ; preds = %196, %149
  %151 = load i32, i32* %b, align 4
  %152 = icmp slt i32 %151, 2
  br i1 %152, label %153, label %199

; <label>:153                                     ; preds = %150
  store i32 0, i32* %c, align 4
  br label %154

; <label>:154                                     ; preds = %192, %153
  %155 = load i32, i32* %c, align 4
  %156 = icmp slt i32 %155, 2
  br i1 %156, label %157, label %195

; <label>:157                                     ; preds = %154
  store i32 0, i32* %d, align 4
  br label %158

; <label>:158                                     ; preds = %188, %157
  %159 = load i32, i32* %d, align 4
  %160 = icmp slt i32 %159, 2
  br i1 %160, label %161, label %191

; <label>:161                                     ; preds = %158
  %162 = load i32, i32* %a, align 4
  %163 = load i32, i32* %b, align 4
  %164 = icmp slt i32 %162, %163
  %165 = zext i1 %164 to i32
  %166 = load i32, i32* %c, align 4
  %167 = load i32, i32* %d, align 4
  %168 = icmp slt i32 %166, %167
  %169 = zext i1 %168 to i32
  %170 = icmp eq i32 %165, %169
  %171 = zext i1 %170 to i32
  %172 = load i32, i32* %a, align 4
  %173 = mul nsw i32 8, %172
  %174 = load i32, i32* %b, align 4
  %175 = mul nsw i32 4, %174
  %176 = add nsw i32 %173, %175
  %177 = load i32, i32* %c, align 4
  %178 = mul nsw i32 2, %177
  %179 = add nsw i32 %176, %178
  %180 = load i32, i32* %d, align 4
  %181 = add nsw i32 %179, %180
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [16 x i32], [16 x i32]* %x, i32 0, i64 %182
  %184 = load i32, i32* %183, align 4
  %185 = icmp ne i32 %171, %184
  br i1 %185, label %186, label %187

; <label>:186                                     ; preds = %161
  store i32 1, i32* %lrc, align 4
  br label %187

; <label>:187                                     ; preds = %186, %161
  br label %188

; <label>:188                                     ; preds = %187
  %189 = load i32, i32* %d, align 4
  %190 = add nsw i32 %189, 1
  store i32 %190, i32* %d, align 4
  br label %158

; <label>:191                                     ; preds = %158
  br label %192

; <label>:192                                     ; preds = %191
  %193 = load i32, i32* %c, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* %c, align 4
  br label %154

; <label>:195                                     ; preds = %154
  br label %196

; <label>:196                                     ; preds = %195
  %197 = load i32, i32* %b, align 4
  %198 = add nsw i32 %197, 1
  store i32 %198, i32* %b, align 4
  br label %150

; <label>:199                                     ; preds = %150
  br label %200

; <label>:200                                     ; preds = %199
  %201 = load i32, i32* %a, align 4
  %202 = add nsw i32 %201, 1
  store i32 %202, i32* %a, align 4
  br label %146

; <label>:203                                     ; preds = %146
  %204 = load i32, i32* %lrc, align 4
  %205 = icmp ne i32 %204, 0
  br i1 %205, label %206, label %216

; <label>:206                                     ; preds = %203
  %207 = load i32, i32* %rc, align 4
  %208 = add nsw i32 %207, 16
  store i32 %208, i32* %rc, align 4
  %209 = load %struct.defs*, %struct.defs** %1, align 8
  %210 = getelementptr inbounds %struct.defs, %struct.defs* %209, i32 0, i32 11
  %211 = load i32, i32* %210, align 4
  %212 = icmp ne i32 %211, 0
  br i1 %212, label %213, label %215

; <label>:213                                     ; preds = %206
  %214 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @sec.s757er, i32 0, i32 0), i32 16)
  br label %215

; <label>:215                                     ; preds = %213, %206
  br label %216

; <label>:216                                     ; preds = %215, %203
  store i32* null, i32** %p, align 8
  %217 = load i32*, i32** %p, align 8
  %218 = icmp ne i32* %217, null
  br i1 %218, label %219, label %229

; <label>:219                                     ; preds = %216
  %220 = load i32, i32* %rc, align 4
  %221 = add nsw i32 %220, 32
  store i32 %221, i32* %rc, align 4
  %222 = load %struct.defs*, %struct.defs** %1, align 8
  %223 = getelementptr inbounds %struct.defs, %struct.defs* %222, i32 0, i32 11
  %224 = load i32, i32* %223, align 4
  %225 = icmp ne i32 %224, 0
  br i1 %225, label %226, label %228

; <label>:226                                     ; preds = %219
  %227 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @sec.s757er, i32 0, i32 0), i32 32)
  br label %228

; <label>:228                                     ; preds = %226, %219
  br label %229

; <label>:229                                     ; preds = %228, %216
  %230 = load i32, i32* %rc, align 4
  ret i32 %230
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
