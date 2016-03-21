; ModuleID = './cq-20-s714-e.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.f = internal global [17 x i8] c"Local error %d.\0A\00", align 16
@sec.s714er = internal global [11 x i8] c"s714,er%d\0A\00", align 1
@sec.qs714 = internal global [8 x i8] c"s714   \00", align 1
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
  %prlc = alloca i32, align 4
  %lrc = alloca i32, align 4
  %rc = alloca i32, align 4
  %cl = alloca i8, align 1
  %cr = alloca i8, align 1
  %sl = alloca i16, align 2
  %sr = alloca i16, align 2
  %il = alloca i32, align 4
  %ir = alloca i32, align 4
  %ll = alloca i64, align 8
  %lr = alloca i64, align 8
  %ul = alloca i32, align 4
  %ur = alloca i32, align 4
  %fl = alloca float, align 4
  %fr = alloca float, align 4
  %dl = alloca double, align 8
  %dr = alloca double, align 8
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  store %struct.defs* %pd0, %struct.defs** %1, align 8
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @sec.qs714, i32 0, i32 0), i8** %ps, align 8
  %2 = load %struct.defs*, %struct.defs** %1, align 8
  %3 = getelementptr inbounds %struct.defs, %struct.defs* %2, i32 0, i32 15
  %4 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i32 0, i32 0
  store i8* %4, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  store i32 0, i32* %lrc, align 4
  %5 = load %struct.defs*, %struct.defs** %1, align 8
  %6 = getelementptr inbounds %struct.defs, %struct.defs* %5, i32 0, i32 12
  %7 = load i32, i32* %6, align 4
  store i32 %7, i32* %prlc, align 4
  br label %8

; <label>:8                                       ; preds = %15, %0
  %9 = load i8*, i8** %ps, align 8
  %10 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %10, i8** %ps, align 8
  %11 = load i8, i8* %9, align 1
  %12 = load i8*, i8** %pt, align 8
  %13 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %13, i8** %pt, align 8
  store i8 %11, i8* %12, align 1
  %14 = icmp ne i8 %11, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8
  br label %8

; <label>:16                                      ; preds = %8
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %17 = load i32, i32* %ur, align 4
  %18 = load i8, i8* %cl, align 1
  %19 = sext i8 %18 to i32
  %20 = udiv i32 %19, %17
  %21 = trunc i32 %20 to i8
  store i8 %21, i8* %cl, align 1
  %22 = load i8, i8* %cl, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 2
  br i1 %24, label %25, label %32

; <label>:25                                      ; preds = %16
  store i32 201, i32* %lrc, align 4
  %26 = load i32, i32* %prlc, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %31

; <label>:28                                      ; preds = %25
  %29 = load i32, i32* %lrc, align 4
  %30 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %29)
  br label %31

; <label>:31                                      ; preds = %28, %25
  br label %32

; <label>:32                                      ; preds = %31, %16
  store i8 5, i8* %cl, align 1
  store float 2.000000e+00, float* %fr, align 4
  %33 = load float, float* %fr, align 4
  %34 = load i8, i8* %cl, align 1
  %35 = sitofp i8 %34 to float
  %36 = fdiv float %35, %33
  %37 = fptosi float %36 to i8
  store i8 %37, i8* %cl, align 1
  %38 = load i8, i8* %cl, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp ne i32 %39, 2
  br i1 %40, label %41, label %48

; <label>:41                                      ; preds = %32
  store i32 202, i32* %lrc, align 4
  %42 = load i32, i32* %prlc, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %47

; <label>:44                                      ; preds = %41
  %45 = load i32, i32* %lrc, align 4
  %46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %45)
  br label %47

; <label>:47                                      ; preds = %44, %41
  br label %48

; <label>:48                                      ; preds = %47, %32
  store i8 5, i8* %cl, align 1
  store double 2.000000e+00, double* %dr, align 8
  %49 = load double, double* %dr, align 8
  %50 = load i8, i8* %cl, align 1
  %51 = sitofp i8 %50 to double
  %52 = fdiv double %51, %49
  %53 = fptosi double %52 to i8
  store i8 %53, i8* %cl, align 1
  %54 = load i8, i8* %cl, align 1
  %55 = sext i8 %54 to i32
  %56 = icmp ne i32 %55, 2
  br i1 %56, label %57, label %64

; <label>:57                                      ; preds = %48
  store i32 203, i32* %lrc, align 4
  %58 = load i32, i32* %prlc, align 4
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %63

; <label>:60                                      ; preds = %57
  %61 = load i32, i32* %lrc, align 4
  %62 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %61)
  br label %63

; <label>:63                                      ; preds = %60, %57
  br label %64

; <label>:64                                      ; preds = %63, %48
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %65 = load i8, i8* %cr, align 1
  %66 = sext i8 %65 to i32
  %67 = load i16, i16* %sl, align 2
  %68 = sext i16 %67 to i32
  %69 = sdiv i32 %68, %66
  %70 = trunc i32 %69 to i16
  store i16 %70, i16* %sl, align 2
  %71 = load i16, i16* %sl, align 2
  %72 = sext i16 %71 to i32
  %73 = icmp ne i32 %72, 2
  br i1 %73, label %74, label %81

; <label>:74                                      ; preds = %64
  store i32 204, i32* %lrc, align 4
  %75 = load i32, i32* %prlc, align 4
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %80

; <label>:77                                      ; preds = %74
  %78 = load i32, i32* %lrc, align 4
  %79 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %78)
  br label %80

; <label>:80                                      ; preds = %77, %74
  br label %81

; <label>:81                                      ; preds = %80, %64
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %82 = load i16, i16* %sr, align 2
  %83 = sext i16 %82 to i32
  %84 = load i16, i16* %sl, align 2
  %85 = sext i16 %84 to i32
  %86 = sdiv i32 %85, %83
  %87 = trunc i32 %86 to i16
  store i16 %87, i16* %sl, align 2
  %88 = load i16, i16* %sl, align 2
  %89 = sext i16 %88 to i32
  %90 = icmp ne i32 %89, 2
  br i1 %90, label %91, label %98

; <label>:91                                      ; preds = %81
  store i32 205, i32* %lrc, align 4
  %92 = load i32, i32* %prlc, align 4
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %94, label %97

; <label>:94                                      ; preds = %91
  %95 = load i32, i32* %lrc, align 4
  %96 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %95)
  br label %97

; <label>:97                                      ; preds = %94, %91
  br label %98

; <label>:98                                      ; preds = %97, %81
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %99 = load i32, i32* %ir, align 4
  %100 = load i16, i16* %sl, align 2
  %101 = sext i16 %100 to i32
  %102 = sdiv i32 %101, %99
  %103 = trunc i32 %102 to i16
  store i16 %103, i16* %sl, align 2
  %104 = load i16, i16* %sl, align 2
  %105 = sext i16 %104 to i32
  %106 = icmp ne i32 %105, 2
  br i1 %106, label %107, label %114

; <label>:107                                     ; preds = %98
  store i32 206, i32* %lrc, align 4
  %108 = load i32, i32* %prlc, align 4
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %113

; <label>:110                                     ; preds = %107
  %111 = load i32, i32* %lrc, align 4
  %112 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %111)
  br label %113

; <label>:113                                     ; preds = %110, %107
  br label %114

; <label>:114                                     ; preds = %113, %98
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %115 = load i64, i64* %lr, align 8
  %116 = load i16, i16* %sl, align 2
  %117 = sext i16 %116 to i64
  %118 = sdiv i64 %117, %115
  %119 = trunc i64 %118 to i16
  store i16 %119, i16* %sl, align 2
  %120 = load i16, i16* %sl, align 2
  %121 = sext i16 %120 to i32
  %122 = icmp ne i32 %121, 2
  br i1 %122, label %123, label %130

; <label>:123                                     ; preds = %114
  store i32 207, i32* %lrc, align 4
  %124 = load i32, i32* %prlc, align 4
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %129

; <label>:126                                     ; preds = %123
  %127 = load i32, i32* %lrc, align 4
  %128 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %127)
  br label %129

; <label>:129                                     ; preds = %126, %123
  br label %130

; <label>:130                                     ; preds = %129, %114
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %131 = load i32, i32* %ur, align 4
  %132 = load i16, i16* %sl, align 2
  %133 = sext i16 %132 to i32
  %134 = udiv i32 %133, %131
  %135 = trunc i32 %134 to i16
  store i16 %135, i16* %sl, align 2
  %136 = load i16, i16* %sl, align 2
  %137 = sext i16 %136 to i32
  %138 = icmp ne i32 %137, 2
  br i1 %138, label %139, label %146

; <label>:139                                     ; preds = %130
  store i32 208, i32* %lrc, align 4
  %140 = load i32, i32* %prlc, align 4
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %145

; <label>:142                                     ; preds = %139
  %143 = load i32, i32* %lrc, align 4
  %144 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %143)
  br label %145

; <label>:145                                     ; preds = %142, %139
  br label %146

; <label>:146                                     ; preds = %145, %130
  store i16 5, i16* %sl, align 2
  store float 2.000000e+00, float* %fr, align 4
  %147 = load float, float* %fr, align 4
  %148 = load i16, i16* %sl, align 2
  %149 = sitofp i16 %148 to float
  %150 = fdiv float %149, %147
  %151 = fptosi float %150 to i16
  store i16 %151, i16* %sl, align 2
  %152 = load i16, i16* %sl, align 2
  %153 = sext i16 %152 to i32
  %154 = icmp ne i32 %153, 2
  br i1 %154, label %155, label %162

; <label>:155                                     ; preds = %146
  store i32 209, i32* %lrc, align 4
  %156 = load i32, i32* %prlc, align 4
  %157 = icmp ne i32 %156, 0
  br i1 %157, label %158, label %161

; <label>:158                                     ; preds = %155
  %159 = load i32, i32* %lrc, align 4
  %160 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %159)
  br label %161

; <label>:161                                     ; preds = %158, %155
  br label %162

; <label>:162                                     ; preds = %161, %146
  store i16 5, i16* %sl, align 2
  store double 2.000000e+00, double* %dr, align 8
  %163 = load double, double* %dr, align 8
  %164 = load i16, i16* %sl, align 2
  %165 = sitofp i16 %164 to double
  %166 = fdiv double %165, %163
  %167 = fptosi double %166 to i16
  store i16 %167, i16* %sl, align 2
  %168 = load i16, i16* %sl, align 2
  %169 = sext i16 %168 to i32
  %170 = icmp ne i32 %169, 2
  br i1 %170, label %171, label %178

; <label>:171                                     ; preds = %162
  store i32 210, i32* %lrc, align 4
  %172 = load i32, i32* %prlc, align 4
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %177

; <label>:174                                     ; preds = %171
  %175 = load i32, i32* %lrc, align 4
  %176 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %175)
  br label %177

; <label>:177                                     ; preds = %174, %171
  br label %178

; <label>:178                                     ; preds = %177, %162
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %179 = load i8, i8* %cr, align 1
  %180 = sext i8 %179 to i32
  %181 = load i32, i32* %il, align 4
  %182 = sdiv i32 %181, %180
  store i32 %182, i32* %il, align 4
  %183 = load i32, i32* %il, align 4
  %184 = icmp ne i32 %183, 2
  br i1 %184, label %185, label %192

; <label>:185                                     ; preds = %178
  store i32 211, i32* %lrc, align 4
  %186 = load i32, i32* %prlc, align 4
  %187 = icmp ne i32 %186, 0
  br i1 %187, label %188, label %191

; <label>:188                                     ; preds = %185
  %189 = load i32, i32* %lrc, align 4
  %190 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %189)
  br label %191

; <label>:191                                     ; preds = %188, %185
  br label %192

; <label>:192                                     ; preds = %191, %178
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %193 = load i16, i16* %sr, align 2
  %194 = sext i16 %193 to i32
  %195 = load i32, i32* %il, align 4
  %196 = sdiv i32 %195, %194
  store i32 %196, i32* %il, align 4
  %197 = load i32, i32* %il, align 4
  %198 = icmp ne i32 %197, 2
  br i1 %198, label %199, label %206

; <label>:199                                     ; preds = %192
  store i32 212, i32* %lrc, align 4
  %200 = load i32, i32* %prlc, align 4
  %201 = icmp ne i32 %200, 0
  br i1 %201, label %202, label %205

; <label>:202                                     ; preds = %199
  %203 = load i32, i32* %lrc, align 4
  %204 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %203)
  br label %205

; <label>:205                                     ; preds = %202, %199
  br label %206

; <label>:206                                     ; preds = %205, %192
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %207 = load i32, i32* %ir, align 4
  %208 = load i32, i32* %il, align 4
  %209 = sdiv i32 %208, %207
  store i32 %209, i32* %il, align 4
  %210 = load i32, i32* %il, align 4
  %211 = icmp ne i32 %210, 2
  br i1 %211, label %212, label %219

; <label>:212                                     ; preds = %206
  store i32 213, i32* %lrc, align 4
  %213 = load i32, i32* %prlc, align 4
  %214 = icmp ne i32 %213, 0
  br i1 %214, label %215, label %218

; <label>:215                                     ; preds = %212
  %216 = load i32, i32* %lrc, align 4
  %217 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %216)
  br label %218

; <label>:218                                     ; preds = %215, %212
  br label %219

; <label>:219                                     ; preds = %218, %206
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %220 = load i64, i64* %lr, align 8
  %221 = load i32, i32* %il, align 4
  %222 = sext i32 %221 to i64
  %223 = sdiv i64 %222, %220
  %224 = trunc i64 %223 to i32
  store i32 %224, i32* %il, align 4
  %225 = load i32, i32* %il, align 4
  %226 = icmp ne i32 %225, 2
  br i1 %226, label %227, label %234

; <label>:227                                     ; preds = %219
  store i32 214, i32* %lrc, align 4
  %228 = load i32, i32* %prlc, align 4
  %229 = icmp ne i32 %228, 0
  br i1 %229, label %230, label %233

; <label>:230                                     ; preds = %227
  %231 = load i32, i32* %lrc, align 4
  %232 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %231)
  br label %233

; <label>:233                                     ; preds = %230, %227
  br label %234

; <label>:234                                     ; preds = %233, %219
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %235 = load i32, i32* %ur, align 4
  %236 = load i32, i32* %il, align 4
  %237 = udiv i32 %236, %235
  store i32 %237, i32* %il, align 4
  %238 = load i32, i32* %il, align 4
  %239 = icmp ne i32 %238, 2
  br i1 %239, label %240, label %247

; <label>:240                                     ; preds = %234
  store i32 215, i32* %lrc, align 4
  %241 = load i32, i32* %prlc, align 4
  %242 = icmp ne i32 %241, 0
  br i1 %242, label %243, label %246

; <label>:243                                     ; preds = %240
  %244 = load i32, i32* %lrc, align 4
  %245 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %244)
  br label %246

; <label>:246                                     ; preds = %243, %240
  br label %247

; <label>:247                                     ; preds = %246, %234
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %248 = load float, float* %fr, align 4
  %249 = load i32, i32* %il, align 4
  %250 = sitofp i32 %249 to float
  %251 = fdiv float %250, %248
  %252 = fptosi float %251 to i32
  store i32 %252, i32* %il, align 4
  %253 = load i32, i32* %il, align 4
  %254 = icmp ne i32 %253, 2
  br i1 %254, label %255, label %262

; <label>:255                                     ; preds = %247
  store i32 216, i32* %lrc, align 4
  %256 = load i32, i32* %prlc, align 4
  %257 = icmp ne i32 %256, 0
  br i1 %257, label %258, label %261

; <label>:258                                     ; preds = %255
  %259 = load i32, i32* %lrc, align 4
  %260 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %259)
  br label %261

; <label>:261                                     ; preds = %258, %255
  br label %262

; <label>:262                                     ; preds = %261, %247
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %263 = load double, double* %dr, align 8
  %264 = load i32, i32* %il, align 4
  %265 = sitofp i32 %264 to double
  %266 = fdiv double %265, %263
  %267 = fptosi double %266 to i32
  store i32 %267, i32* %il, align 4
  %268 = load i32, i32* %il, align 4
  %269 = icmp ne i32 %268, 2
  br i1 %269, label %270, label %277

; <label>:270                                     ; preds = %262
  store i32 217, i32* %lrc, align 4
  %271 = load i32, i32* %prlc, align 4
  %272 = icmp ne i32 %271, 0
  br i1 %272, label %273, label %276

; <label>:273                                     ; preds = %270
  %274 = load i32, i32* %lrc, align 4
  %275 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %274)
  br label %276

; <label>:276                                     ; preds = %273, %270
  br label %277

; <label>:277                                     ; preds = %276, %262
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %278 = load i8, i8* %cr, align 1
  %279 = sext i8 %278 to i64
  %280 = load i64, i64* %ll, align 8
  %281 = sdiv i64 %280, %279
  store i64 %281, i64* %ll, align 8
  %282 = load i64, i64* %ll, align 8
  %283 = icmp ne i64 %282, 2
  br i1 %283, label %284, label %291

; <label>:284                                     ; preds = %277
  store i32 218, i32* %lrc, align 4
  %285 = load i32, i32* %prlc, align 4
  %286 = icmp ne i32 %285, 0
  br i1 %286, label %287, label %290

; <label>:287                                     ; preds = %284
  %288 = load i32, i32* %lrc, align 4
  %289 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %288)
  br label %290

; <label>:290                                     ; preds = %287, %284
  br label %291

; <label>:291                                     ; preds = %290, %277
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %292 = load i16, i16* %sr, align 2
  %293 = sext i16 %292 to i64
  %294 = load i64, i64* %ll, align 8
  %295 = sdiv i64 %294, %293
  store i64 %295, i64* %ll, align 8
  %296 = load i64, i64* %ll, align 8
  %297 = icmp ne i64 %296, 2
  br i1 %297, label %298, label %305

; <label>:298                                     ; preds = %291
  store i32 219, i32* %lrc, align 4
  %299 = load i32, i32* %prlc, align 4
  %300 = icmp ne i32 %299, 0
  br i1 %300, label %301, label %304

; <label>:301                                     ; preds = %298
  %302 = load i32, i32* %lrc, align 4
  %303 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %302)
  br label %304

; <label>:304                                     ; preds = %301, %298
  br label %305

; <label>:305                                     ; preds = %304, %291
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %306 = load i32, i32* %ir, align 4
  %307 = sext i32 %306 to i64
  %308 = load i64, i64* %ll, align 8
  %309 = sdiv i64 %308, %307
  store i64 %309, i64* %ll, align 8
  %310 = load i64, i64* %ll, align 8
  %311 = icmp ne i64 %310, 2
  br i1 %311, label %312, label %319

; <label>:312                                     ; preds = %305
  store i32 220, i32* %lrc, align 4
  %313 = load i32, i32* %prlc, align 4
  %314 = icmp ne i32 %313, 0
  br i1 %314, label %315, label %318

; <label>:315                                     ; preds = %312
  %316 = load i32, i32* %lrc, align 4
  %317 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %316)
  br label %318

; <label>:318                                     ; preds = %315, %312
  br label %319

; <label>:319                                     ; preds = %318, %305
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %320 = load i64, i64* %lr, align 8
  %321 = load i64, i64* %ll, align 8
  %322 = sdiv i64 %321, %320
  store i64 %322, i64* %ll, align 8
  %323 = load i64, i64* %ll, align 8
  %324 = icmp ne i64 %323, 2
  br i1 %324, label %325, label %332

; <label>:325                                     ; preds = %319
  store i32 221, i32* %lrc, align 4
  %326 = load i32, i32* %prlc, align 4
  %327 = icmp ne i32 %326, 0
  br i1 %327, label %328, label %331

; <label>:328                                     ; preds = %325
  %329 = load i32, i32* %lrc, align 4
  %330 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %329)
  br label %331

; <label>:331                                     ; preds = %328, %325
  br label %332

; <label>:332                                     ; preds = %331, %319
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %333 = load i32, i32* %ur, align 4
  %334 = zext i32 %333 to i64
  %335 = load i64, i64* %ll, align 8
  %336 = sdiv i64 %335, %334
  store i64 %336, i64* %ll, align 8
  %337 = load i64, i64* %ll, align 8
  %338 = icmp ne i64 %337, 2
  br i1 %338, label %339, label %346

; <label>:339                                     ; preds = %332
  store i32 222, i32* %lrc, align 4
  %340 = load i32, i32* %prlc, align 4
  %341 = icmp ne i32 %340, 0
  br i1 %341, label %342, label %345

; <label>:342                                     ; preds = %339
  %343 = load i32, i32* %lrc, align 4
  %344 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %343)
  br label %345

; <label>:345                                     ; preds = %342, %339
  br label %346

; <label>:346                                     ; preds = %345, %332
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %347 = load float, float* %fr, align 4
  %348 = load i64, i64* %ll, align 8
  %349 = sitofp i64 %348 to float
  %350 = fdiv float %349, %347
  %351 = fptosi float %350 to i64
  store i64 %351, i64* %ll, align 8
  %352 = load i64, i64* %ll, align 8
  %353 = icmp ne i64 %352, 2
  br i1 %353, label %354, label %361

; <label>:354                                     ; preds = %346
  store i32 223, i32* %lrc, align 4
  %355 = load i32, i32* %prlc, align 4
  %356 = icmp ne i32 %355, 0
  br i1 %356, label %357, label %360

; <label>:357                                     ; preds = %354
  %358 = load i32, i32* %lrc, align 4
  %359 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %358)
  br label %360

; <label>:360                                     ; preds = %357, %354
  br label %361

; <label>:361                                     ; preds = %360, %346
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %362 = load double, double* %dr, align 8
  %363 = load i64, i64* %ll, align 8
  %364 = sitofp i64 %363 to double
  %365 = fdiv double %364, %362
  %366 = fptosi double %365 to i64
  store i64 %366, i64* %ll, align 8
  %367 = load i64, i64* %ll, align 8
  %368 = icmp ne i64 %367, 2
  br i1 %368, label %369, label %376

; <label>:369                                     ; preds = %361
  store i32 224, i32* %lrc, align 4
  %370 = load i32, i32* %prlc, align 4
  %371 = icmp ne i32 %370, 0
  br i1 %371, label %372, label %375

; <label>:372                                     ; preds = %369
  %373 = load i32, i32* %lrc, align 4
  %374 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %373)
  br label %375

; <label>:375                                     ; preds = %372, %369
  br label %376

; <label>:376                                     ; preds = %375, %361
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %377 = load i8, i8* %cr, align 1
  %378 = sext i8 %377 to i32
  %379 = load i32, i32* %ul, align 4
  %380 = udiv i32 %379, %378
  store i32 %380, i32* %ul, align 4
  %381 = load i32, i32* %ul, align 4
  %382 = icmp ne i32 %381, 2
  br i1 %382, label %383, label %390

; <label>:383                                     ; preds = %376
  store i32 225, i32* %lrc, align 4
  %384 = load i32, i32* %prlc, align 4
  %385 = icmp ne i32 %384, 0
  br i1 %385, label %386, label %389

; <label>:386                                     ; preds = %383
  %387 = load i32, i32* %lrc, align 4
  %388 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %387)
  br label %389

; <label>:389                                     ; preds = %386, %383
  br label %390

; <label>:390                                     ; preds = %389, %376
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %391 = load i16, i16* %sr, align 2
  %392 = sext i16 %391 to i32
  %393 = load i32, i32* %ul, align 4
  %394 = udiv i32 %393, %392
  store i32 %394, i32* %ul, align 4
  %395 = load i32, i32* %ul, align 4
  %396 = icmp ne i32 %395, 2
  br i1 %396, label %397, label %404

; <label>:397                                     ; preds = %390
  store i32 226, i32* %lrc, align 4
  %398 = load i32, i32* %prlc, align 4
  %399 = icmp ne i32 %398, 0
  br i1 %399, label %400, label %403

; <label>:400                                     ; preds = %397
  %401 = load i32, i32* %lrc, align 4
  %402 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %401)
  br label %403

; <label>:403                                     ; preds = %400, %397
  br label %404

; <label>:404                                     ; preds = %403, %390
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %405 = load i32, i32* %ir, align 4
  %406 = load i32, i32* %ul, align 4
  %407 = udiv i32 %406, %405
  store i32 %407, i32* %ul, align 4
  %408 = load i32, i32* %ul, align 4
  %409 = icmp ne i32 %408, 2
  br i1 %409, label %410, label %417

; <label>:410                                     ; preds = %404
  store i32 227, i32* %lrc, align 4
  %411 = load i32, i32* %prlc, align 4
  %412 = icmp ne i32 %411, 0
  br i1 %412, label %413, label %416

; <label>:413                                     ; preds = %410
  %414 = load i32, i32* %lrc, align 4
  %415 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %414)
  br label %416

; <label>:416                                     ; preds = %413, %410
  br label %417

; <label>:417                                     ; preds = %416, %404
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %418 = load i64, i64* %lr, align 8
  %419 = load i32, i32* %ul, align 4
  %420 = zext i32 %419 to i64
  %421 = sdiv i64 %420, %418
  %422 = trunc i64 %421 to i32
  store i32 %422, i32* %ul, align 4
  %423 = load i32, i32* %ul, align 4
  %424 = icmp ne i32 %423, 2
  br i1 %424, label %425, label %432

; <label>:425                                     ; preds = %417
  store i32 228, i32* %lrc, align 4
  %426 = load i32, i32* %prlc, align 4
  %427 = icmp ne i32 %426, 0
  br i1 %427, label %428, label %431

; <label>:428                                     ; preds = %425
  %429 = load i32, i32* %lrc, align 4
  %430 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %429)
  br label %431

; <label>:431                                     ; preds = %428, %425
  br label %432

; <label>:432                                     ; preds = %431, %417
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %433 = load i32, i32* %ur, align 4
  %434 = load i32, i32* %ul, align 4
  %435 = udiv i32 %434, %433
  store i32 %435, i32* %ul, align 4
  %436 = load i32, i32* %ul, align 4
  %437 = icmp ne i32 %436, 2
  br i1 %437, label %438, label %445

; <label>:438                                     ; preds = %432
  store i32 229, i32* %lrc, align 4
  %439 = load i32, i32* %prlc, align 4
  %440 = icmp ne i32 %439, 0
  br i1 %440, label %441, label %444

; <label>:441                                     ; preds = %438
  %442 = load i32, i32* %lrc, align 4
  %443 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %442)
  br label %444

; <label>:444                                     ; preds = %441, %438
  br label %445

; <label>:445                                     ; preds = %444, %432
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %446 = load float, float* %fr, align 4
  %447 = load i32, i32* %ul, align 4
  %448 = uitofp i32 %447 to float
  %449 = fdiv float %448, %446
  %450 = fptoui float %449 to i32
  store i32 %450, i32* %ul, align 4
  %451 = load i32, i32* %ul, align 4
  %452 = icmp ne i32 %451, 2
  br i1 %452, label %453, label %460

; <label>:453                                     ; preds = %445
  store i32 230, i32* %lrc, align 4
  %454 = load i32, i32* %prlc, align 4
  %455 = icmp ne i32 %454, 0
  br i1 %455, label %456, label %459

; <label>:456                                     ; preds = %453
  %457 = load i32, i32* %lrc, align 4
  %458 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %457)
  br label %459

; <label>:459                                     ; preds = %456, %453
  br label %460

; <label>:460                                     ; preds = %459, %445
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %461 = load double, double* %dr, align 8
  %462 = load i32, i32* %ul, align 4
  %463 = uitofp i32 %462 to double
  %464 = fdiv double %463, %461
  %465 = fptoui double %464 to i32
  store i32 %465, i32* %ul, align 4
  %466 = load i32, i32* %ul, align 4
  %467 = icmp ne i32 %466, 2
  br i1 %467, label %468, label %475

; <label>:468                                     ; preds = %460
  store i32 231, i32* %lrc, align 4
  %469 = load i32, i32* %prlc, align 4
  %470 = icmp ne i32 %469, 0
  br i1 %470, label %471, label %474

; <label>:471                                     ; preds = %468
  %472 = load i32, i32* %lrc, align 4
  %473 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %472)
  br label %474

; <label>:474                                     ; preds = %471, %468
  br label %475

; <label>:475                                     ; preds = %474, %460
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %476 = load i8, i8* %cr, align 1
  %477 = sext i8 %476 to i32
  %478 = sitofp i32 %477 to float
  %479 = load float, float* %fl, align 4
  %480 = fdiv float %479, %478
  store float %480, float* %fl, align 4
  %481 = load float, float* %fl, align 4
  %482 = fpext float %481 to double
  %483 = fcmp une double %482, 2.500000e+00
  br i1 %483, label %484, label %491

; <label>:484                                     ; preds = %475
  store i32 232, i32* %lrc, align 4
  %485 = load i32, i32* %prlc, align 4
  %486 = icmp ne i32 %485, 0
  br i1 %486, label %487, label %490

; <label>:487                                     ; preds = %484
  %488 = load i32, i32* %lrc, align 4
  %489 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %488)
  br label %490

; <label>:490                                     ; preds = %487, %484
  br label %491

; <label>:491                                     ; preds = %490, %475
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %492 = load i16, i16* %sr, align 2
  %493 = sext i16 %492 to i32
  %494 = sitofp i32 %493 to float
  %495 = load float, float* %fl, align 4
  %496 = fdiv float %495, %494
  store float %496, float* %fl, align 4
  %497 = load float, float* %fl, align 4
  %498 = fpext float %497 to double
  %499 = fcmp une double %498, 2.500000e+00
  br i1 %499, label %500, label %507

; <label>:500                                     ; preds = %491
  store i32 233, i32* %lrc, align 4
  %501 = load i32, i32* %prlc, align 4
  %502 = icmp ne i32 %501, 0
  br i1 %502, label %503, label %506

; <label>:503                                     ; preds = %500
  %504 = load i32, i32* %lrc, align 4
  %505 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %504)
  br label %506

; <label>:506                                     ; preds = %503, %500
  br label %507

; <label>:507                                     ; preds = %506, %491
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %508 = load i32, i32* %ir, align 4
  %509 = sitofp i32 %508 to float
  %510 = load float, float* %fl, align 4
  %511 = fdiv float %510, %509
  store float %511, float* %fl, align 4
  %512 = load float, float* %fl, align 4
  %513 = fpext float %512 to double
  %514 = fcmp une double %513, 2.500000e+00
  br i1 %514, label %515, label %522

; <label>:515                                     ; preds = %507
  store i32 234, i32* %lrc, align 4
  %516 = load i32, i32* %prlc, align 4
  %517 = icmp ne i32 %516, 0
  br i1 %517, label %518, label %521

; <label>:518                                     ; preds = %515
  %519 = load i32, i32* %lrc, align 4
  %520 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %519)
  br label %521

; <label>:521                                     ; preds = %518, %515
  br label %522

; <label>:522                                     ; preds = %521, %507
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %523 = load i64, i64* %lr, align 8
  %524 = sitofp i64 %523 to float
  %525 = load float, float* %fl, align 4
  %526 = fdiv float %525, %524
  store float %526, float* %fl, align 4
  %527 = load float, float* %fl, align 4
  %528 = fpext float %527 to double
  %529 = fcmp une double %528, 2.500000e+00
  br i1 %529, label %530, label %537

; <label>:530                                     ; preds = %522
  store i32 235, i32* %lrc, align 4
  %531 = load i32, i32* %prlc, align 4
  %532 = icmp ne i32 %531, 0
  br i1 %532, label %533, label %536

; <label>:533                                     ; preds = %530
  %534 = load i32, i32* %lrc, align 4
  %535 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %534)
  br label %536

; <label>:536                                     ; preds = %533, %530
  br label %537

; <label>:537                                     ; preds = %536, %522
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %538 = load i32, i32* %ur, align 4
  %539 = uitofp i32 %538 to float
  %540 = load float, float* %fl, align 4
  %541 = fdiv float %540, %539
  store float %541, float* %fl, align 4
  %542 = load float, float* %fl, align 4
  %543 = fpext float %542 to double
  %544 = fcmp une double %543, 2.500000e+00
  br i1 %544, label %545, label %552

; <label>:545                                     ; preds = %537
  store i32 236, i32* %lrc, align 4
  %546 = load i32, i32* %prlc, align 4
  %547 = icmp ne i32 %546, 0
  br i1 %547, label %548, label %551

; <label>:548                                     ; preds = %545
  %549 = load i32, i32* %lrc, align 4
  %550 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %549)
  br label %551

; <label>:551                                     ; preds = %548, %545
  br label %552

; <label>:552                                     ; preds = %551, %537
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %553 = load float, float* %fr, align 4
  %554 = load float, float* %fl, align 4
  %555 = fdiv float %554, %553
  store float %555, float* %fl, align 4
  %556 = load float, float* %fl, align 4
  %557 = fpext float %556 to double
  %558 = fcmp une double %557, 2.500000e+00
  br i1 %558, label %559, label %566

; <label>:559                                     ; preds = %552
  store i32 237, i32* %lrc, align 4
  %560 = load i32, i32* %prlc, align 4
  %561 = icmp ne i32 %560, 0
  br i1 %561, label %562, label %565

; <label>:562                                     ; preds = %559
  %563 = load i32, i32* %lrc, align 4
  %564 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %563)
  br label %565

; <label>:565                                     ; preds = %562, %559
  br label %566

; <label>:566                                     ; preds = %565, %552
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %567 = load double, double* %dr, align 8
  %568 = load float, float* %fl, align 4
  %569 = fpext float %568 to double
  %570 = fdiv double %569, %567
  %571 = fptrunc double %570 to float
  store float %571, float* %fl, align 4
  %572 = load float, float* %fl, align 4
  %573 = fpext float %572 to double
  %574 = fcmp une double %573, 2.500000e+00
  br i1 %574, label %575, label %582

; <label>:575                                     ; preds = %566
  store i32 238, i32* %lrc, align 4
  %576 = load i32, i32* %prlc, align 4
  %577 = icmp ne i32 %576, 0
  br i1 %577, label %578, label %581

; <label>:578                                     ; preds = %575
  %579 = load i32, i32* %lrc, align 4
  %580 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %579)
  br label %581

; <label>:581                                     ; preds = %578, %575
  br label %582

; <label>:582                                     ; preds = %581, %566
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %583 = load i8, i8* %cr, align 1
  %584 = sext i8 %583 to i32
  %585 = sitofp i32 %584 to double
  %586 = load double, double* %dl, align 8
  %587 = fdiv double %586, %585
  store double %587, double* %dl, align 8
  %588 = load double, double* %dl, align 8
  %589 = fcmp une double %588, 2.500000e+00
  br i1 %589, label %590, label %597

; <label>:590                                     ; preds = %582
  store i32 239, i32* %lrc, align 4
  %591 = load i32, i32* %prlc, align 4
  %592 = icmp ne i32 %591, 0
  br i1 %592, label %593, label %596

; <label>:593                                     ; preds = %590
  %594 = load i32, i32* %lrc, align 4
  %595 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %594)
  br label %596

; <label>:596                                     ; preds = %593, %590
  br label %597

; <label>:597                                     ; preds = %596, %582
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %598 = load i16, i16* %sr, align 2
  %599 = sext i16 %598 to i32
  %600 = sitofp i32 %599 to double
  %601 = load double, double* %dl, align 8
  %602 = fdiv double %601, %600
  store double %602, double* %dl, align 8
  %603 = load double, double* %dl, align 8
  %604 = fcmp une double %603, 2.500000e+00
  br i1 %604, label %605, label %612

; <label>:605                                     ; preds = %597
  store i32 240, i32* %lrc, align 4
  %606 = load i32, i32* %prlc, align 4
  %607 = icmp ne i32 %606, 0
  br i1 %607, label %608, label %611

; <label>:608                                     ; preds = %605
  %609 = load i32, i32* %lrc, align 4
  %610 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %609)
  br label %611

; <label>:611                                     ; preds = %608, %605
  br label %612

; <label>:612                                     ; preds = %611, %597
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %613 = load i32, i32* %ir, align 4
  %614 = sitofp i32 %613 to double
  %615 = load double, double* %dl, align 8
  %616 = fdiv double %615, %614
  store double %616, double* %dl, align 8
  %617 = load double, double* %dl, align 8
  %618 = fcmp une double %617, 2.500000e+00
  br i1 %618, label %619, label %626

; <label>:619                                     ; preds = %612
  store i32 241, i32* %lrc, align 4
  %620 = load i32, i32* %prlc, align 4
  %621 = icmp ne i32 %620, 0
  br i1 %621, label %622, label %625

; <label>:622                                     ; preds = %619
  %623 = load i32, i32* %lrc, align 4
  %624 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %623)
  br label %625

; <label>:625                                     ; preds = %622, %619
  br label %626

; <label>:626                                     ; preds = %625, %612
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %627 = load i64, i64* %lr, align 8
  %628 = sitofp i64 %627 to double
  %629 = load double, double* %dl, align 8
  %630 = fdiv double %629, %628
  store double %630, double* %dl, align 8
  %631 = load double, double* %dl, align 8
  %632 = fcmp une double %631, 2.500000e+00
  br i1 %632, label %633, label %640

; <label>:633                                     ; preds = %626
  store i32 242, i32* %lrc, align 4
  %634 = load i32, i32* %prlc, align 4
  %635 = icmp ne i32 %634, 0
  br i1 %635, label %636, label %639

; <label>:636                                     ; preds = %633
  %637 = load i32, i32* %lrc, align 4
  %638 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %637)
  br label %639

; <label>:639                                     ; preds = %636, %633
  br label %640

; <label>:640                                     ; preds = %639, %626
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %641 = load i32, i32* %ur, align 4
  %642 = uitofp i32 %641 to double
  %643 = load double, double* %dl, align 8
  %644 = fdiv double %643, %642
  store double %644, double* %dl, align 8
  %645 = load double, double* %dl, align 8
  %646 = fcmp une double %645, 2.500000e+00
  br i1 %646, label %647, label %654

; <label>:647                                     ; preds = %640
  store i32 243, i32* %lrc, align 4
  %648 = load i32, i32* %prlc, align 4
  %649 = icmp ne i32 %648, 0
  br i1 %649, label %650, label %653

; <label>:650                                     ; preds = %647
  %651 = load i32, i32* %lrc, align 4
  %652 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %651)
  br label %653

; <label>:653                                     ; preds = %650, %647
  br label %654

; <label>:654                                     ; preds = %653, %640
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %655 = load float, float* %fr, align 4
  %656 = fpext float %655 to double
  %657 = load double, double* %dl, align 8
  %658 = fdiv double %657, %656
  store double %658, double* %dl, align 8
  %659 = load double, double* %dl, align 8
  %660 = fcmp une double %659, 2.500000e+00
  br i1 %660, label %661, label %668

; <label>:661                                     ; preds = %654
  store i32 244, i32* %lrc, align 4
  %662 = load i32, i32* %prlc, align 4
  %663 = icmp ne i32 %662, 0
  br i1 %663, label %664, label %667

; <label>:664                                     ; preds = %661
  %665 = load i32, i32* %lrc, align 4
  %666 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %665)
  br label %667

; <label>:667                                     ; preds = %664, %661
  br label %668

; <label>:668                                     ; preds = %667, %654
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %669 = load double, double* %dr, align 8
  %670 = load double, double* %dl, align 8
  %671 = fdiv double %670, %669
  store double %671, double* %dl, align 8
  %672 = load double, double* %dl, align 8
  %673 = fcmp une double %672, 2.500000e+00
  br i1 %673, label %674, label %681

; <label>:674                                     ; preds = %668
  store i32 245, i32* %lrc, align 4
  %675 = load i32, i32* %prlc, align 4
  %676 = icmp ne i32 %675, 0
  br i1 %676, label %677, label %680

; <label>:677                                     ; preds = %674
  %678 = load i32, i32* %lrc, align 4
  %679 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %678)
  br label %680

; <label>:680                                     ; preds = %677, %674
  br label %681

; <label>:681                                     ; preds = %680, %668
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %682 = load i8, i8* %cr, align 1
  %683 = sext i8 %682 to i32
  %684 = load i8, i8* %cl, align 1
  %685 = sext i8 %684 to i32
  %686 = srem i32 %685, %683
  %687 = trunc i32 %686 to i8
  store i8 %687, i8* %cl, align 1
  %688 = load i8, i8* %cl, align 1
  %689 = sext i8 %688 to i32
  %690 = icmp ne i32 %689, 1
  br i1 %690, label %691, label %698

; <label>:691                                     ; preds = %681
  store i32 246, i32* %lrc, align 4
  %692 = load i32, i32* %prlc, align 4
  %693 = icmp ne i32 %692, 0
  br i1 %693, label %694, label %697

; <label>:694                                     ; preds = %691
  %695 = load i32, i32* %lrc, align 4
  %696 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %695)
  br label %697

; <label>:697                                     ; preds = %694, %691
  br label %698

; <label>:698                                     ; preds = %697, %681
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %699 = load i16, i16* %sr, align 2
  %700 = sext i16 %699 to i32
  %701 = load i8, i8* %cl, align 1
  %702 = sext i8 %701 to i32
  %703 = srem i32 %702, %700
  %704 = trunc i32 %703 to i8
  store i8 %704, i8* %cl, align 1
  %705 = load i8, i8* %cl, align 1
  %706 = sext i8 %705 to i32
  %707 = icmp ne i32 %706, 1
  br i1 %707, label %708, label %715

; <label>:708                                     ; preds = %698
  store i32 247, i32* %lrc, align 4
  %709 = load i32, i32* %prlc, align 4
  %710 = icmp ne i32 %709, 0
  br i1 %710, label %711, label %714

; <label>:711                                     ; preds = %708
  %712 = load i32, i32* %lrc, align 4
  %713 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %712)
  br label %714

; <label>:714                                     ; preds = %711, %708
  br label %715

; <label>:715                                     ; preds = %714, %698
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %716 = load i32, i32* %ir, align 4
  %717 = load i8, i8* %cl, align 1
  %718 = sext i8 %717 to i32
  %719 = srem i32 %718, %716
  %720 = trunc i32 %719 to i8
  store i8 %720, i8* %cl, align 1
  %721 = load i8, i8* %cl, align 1
  %722 = sext i8 %721 to i32
  %723 = icmp ne i32 %722, 1
  br i1 %723, label %724, label %731

; <label>:724                                     ; preds = %715
  store i32 248, i32* %lrc, align 4
  %725 = load i32, i32* %prlc, align 4
  %726 = icmp ne i32 %725, 0
  br i1 %726, label %727, label %730

; <label>:727                                     ; preds = %724
  %728 = load i32, i32* %lrc, align 4
  %729 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %728)
  br label %730

; <label>:730                                     ; preds = %727, %724
  br label %731

; <label>:731                                     ; preds = %730, %715
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %732 = load i64, i64* %lr, align 8
  %733 = load i8, i8* %cl, align 1
  %734 = sext i8 %733 to i64
  %735 = srem i64 %734, %732
  %736 = trunc i64 %735 to i8
  store i8 %736, i8* %cl, align 1
  %737 = load i8, i8* %cl, align 1
  %738 = sext i8 %737 to i32
  %739 = icmp ne i32 %738, 1
  br i1 %739, label %740, label %747

; <label>:740                                     ; preds = %731
  store i32 249, i32* %lrc, align 4
  %741 = load i32, i32* %prlc, align 4
  %742 = icmp ne i32 %741, 0
  br i1 %742, label %743, label %746

; <label>:743                                     ; preds = %740
  %744 = load i32, i32* %lrc, align 4
  %745 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %744)
  br label %746

; <label>:746                                     ; preds = %743, %740
  br label %747

; <label>:747                                     ; preds = %746, %731
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %748 = load i32, i32* %ur, align 4
  %749 = load i8, i8* %cl, align 1
  %750 = sext i8 %749 to i32
  %751 = urem i32 %750, %748
  %752 = trunc i32 %751 to i8
  store i8 %752, i8* %cl, align 1
  %753 = load i8, i8* %cl, align 1
  %754 = sext i8 %753 to i32
  %755 = icmp ne i32 %754, 1
  br i1 %755, label %756, label %763

; <label>:756                                     ; preds = %747
  store i32 250, i32* %lrc, align 4
  %757 = load i32, i32* %prlc, align 4
  %758 = icmp ne i32 %757, 0
  br i1 %758, label %759, label %762

; <label>:759                                     ; preds = %756
  %760 = load i32, i32* %lrc, align 4
  %761 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %760)
  br label %762

; <label>:762                                     ; preds = %759, %756
  br label %763

; <label>:763                                     ; preds = %762, %747
  %764 = load i32, i32* %lrc, align 4
  %765 = icmp ne i32 %764, 0
  br i1 %765, label %766, label %774

; <label>:766                                     ; preds = %763
  store i32 1, i32* %rc, align 4
  %767 = load %struct.defs*, %struct.defs** %1, align 8
  %768 = getelementptr inbounds %struct.defs, %struct.defs* %767, i32 0, i32 11
  %769 = load i32, i32* %768, align 4
  %770 = icmp ne i32 %769, 0
  br i1 %770, label %771, label %773

; <label>:771                                     ; preds = %766
  %772 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %773

; <label>:773                                     ; preds = %771, %766
  br label %774

; <label>:774                                     ; preds = %773, %763
  %775 = load i32, i32* %rc, align 4
  ret i32 %775
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
