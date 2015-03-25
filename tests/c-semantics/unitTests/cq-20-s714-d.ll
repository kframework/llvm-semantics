; ModuleID = './cq-20-s714-d.c'
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
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs714, i32 0, i32 0), i8** %ps, align 8
  %2 = load %struct.defs** %1, align 8
  %3 = getelementptr inbounds %struct.defs* %2, i32 0, i32 15
  %4 = getelementptr inbounds [8 x i8]* %3, i32 0, i32 0
  store i8* %4, i8** %pt, align 8
  store i32 0, i32* %rc, align 4
  store i32 0, i32* %lrc, align 4
  %5 = load %struct.defs** %1, align 8
  %6 = getelementptr inbounds %struct.defs* %5, i32 0, i32 12
  %7 = load i32* %6, align 4
  store i32 %7, i32* %prlc, align 4
  br label %8

; <label>:8                                       ; preds = %15, %0
  %9 = load i8** %ps, align 8
  %10 = getelementptr inbounds i8* %9, i32 1
  store i8* %10, i8** %ps, align 8
  %11 = load i8* %9, align 1
  %12 = load i8** %pt, align 8
  %13 = getelementptr inbounds i8* %12, i32 1
  store i8* %13, i8** %pt, align 8
  store i8 %11, i8* %12, align 1
  %14 = icmp ne i8 %11, 0
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %8
  br label %8

; <label>:16                                      ; preds = %8
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %17 = load i64* %lr, align 8
  %18 = load i8* %cl, align 1
  %19 = sext i8 %18 to i64
  %20 = mul nsw i64 %19, %17
  %21 = trunc i64 %20 to i8
  store i8 %21, i8* %cl, align 1
  %22 = load i8* %cl, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 10
  br i1 %24, label %25, label %32

; <label>:25                                      ; preds = %16
  store i32 151, i32* %lrc, align 4
  %26 = load i32* %prlc, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %31

; <label>:28                                      ; preds = %25
  %29 = load i32* %lrc, align 4
  %30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %29)
  br label %31

; <label>:31                                      ; preds = %28, %25
  br label %32

; <label>:32                                      ; preds = %31, %16
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %33 = load i32* %ur, align 4
  %34 = load i8* %cl, align 1
  %35 = sext i8 %34 to i32
  %36 = mul i32 %35, %33
  %37 = trunc i32 %36 to i8
  store i8 %37, i8* %cl, align 1
  %38 = load i8* %cl, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp ne i32 %39, 10
  br i1 %40, label %41, label %48

; <label>:41                                      ; preds = %32
  store i32 152, i32* %lrc, align 4
  %42 = load i32* %prlc, align 4
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %47

; <label>:44                                      ; preds = %41
  %45 = load i32* %lrc, align 4
  %46 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %45)
  br label %47

; <label>:47                                      ; preds = %44, %41
  br label %48

; <label>:48                                      ; preds = %47, %32
  store i8 5, i8* %cl, align 1
  store float 2.000000e+00, float* %fr, align 4
  %49 = load float* %fr, align 4
  %50 = load i8* %cl, align 1
  %51 = sitofp i8 %50 to float
  %52 = fmul float %51, %49
  %53 = fptosi float %52 to i8
  store i8 %53, i8* %cl, align 1
  %54 = load i8* %cl, align 1
  %55 = sext i8 %54 to i32
  %56 = icmp ne i32 %55, 10
  br i1 %56, label %57, label %64

; <label>:57                                      ; preds = %48
  store i32 153, i32* %lrc, align 4
  %58 = load i32* %prlc, align 4
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %63

; <label>:60                                      ; preds = %57
  %61 = load i32* %lrc, align 4
  %62 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %61)
  br label %63

; <label>:63                                      ; preds = %60, %57
  br label %64

; <label>:64                                      ; preds = %63, %48
  store i8 5, i8* %cl, align 1
  store double 2.000000e+00, double* %dr, align 8
  %65 = load double* %dr, align 8
  %66 = load i8* %cl, align 1
  %67 = sitofp i8 %66 to double
  %68 = fmul double %67, %65
  %69 = fptosi double %68 to i8
  store i8 %69, i8* %cl, align 1
  %70 = load i8* %cl, align 1
  %71 = sext i8 %70 to i32
  %72 = icmp ne i32 %71, 10
  br i1 %72, label %73, label %80

; <label>:73                                      ; preds = %64
  store i32 154, i32* %lrc, align 4
  %74 = load i32* %prlc, align 4
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %79

; <label>:76                                      ; preds = %73
  %77 = load i32* %lrc, align 4
  %78 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %77)
  br label %79

; <label>:79                                      ; preds = %76, %73
  br label %80

; <label>:80                                      ; preds = %79, %64
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %81 = load i8* %cr, align 1
  %82 = sext i8 %81 to i32
  %83 = load i16* %sl, align 2
  %84 = sext i16 %83 to i32
  %85 = mul nsw i32 %84, %82
  %86 = trunc i32 %85 to i16
  store i16 %86, i16* %sl, align 2
  %87 = load i16* %sl, align 2
  %88 = sext i16 %87 to i32
  %89 = icmp ne i32 %88, 10
  br i1 %89, label %90, label %97

; <label>:90                                      ; preds = %80
  store i32 155, i32* %lrc, align 4
  %91 = load i32* %prlc, align 4
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %96

; <label>:93                                      ; preds = %90
  %94 = load i32* %lrc, align 4
  %95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %94)
  br label %96

; <label>:96                                      ; preds = %93, %90
  br label %97

; <label>:97                                      ; preds = %96, %80
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %98 = load i16* %sr, align 2
  %99 = sext i16 %98 to i32
  %100 = load i16* %sl, align 2
  %101 = sext i16 %100 to i32
  %102 = mul nsw i32 %101, %99
  %103 = trunc i32 %102 to i16
  store i16 %103, i16* %sl, align 2
  %104 = load i16* %sl, align 2
  %105 = sext i16 %104 to i32
  %106 = icmp ne i32 %105, 10
  br i1 %106, label %107, label %114

; <label>:107                                     ; preds = %97
  store i32 156, i32* %lrc, align 4
  %108 = load i32* %prlc, align 4
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %113

; <label>:110                                     ; preds = %107
  %111 = load i32* %lrc, align 4
  %112 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %111)
  br label %113

; <label>:113                                     ; preds = %110, %107
  br label %114

; <label>:114                                     ; preds = %113, %97
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %115 = load i32* %ir, align 4
  %116 = load i16* %sl, align 2
  %117 = sext i16 %116 to i32
  %118 = mul nsw i32 %117, %115
  %119 = trunc i32 %118 to i16
  store i16 %119, i16* %sl, align 2
  %120 = load i16* %sl, align 2
  %121 = sext i16 %120 to i32
  %122 = icmp ne i32 %121, 10
  br i1 %122, label %123, label %130

; <label>:123                                     ; preds = %114
  store i32 157, i32* %lrc, align 4
  %124 = load i32* %prlc, align 4
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %129

; <label>:126                                     ; preds = %123
  %127 = load i32* %lrc, align 4
  %128 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %127)
  br label %129

; <label>:129                                     ; preds = %126, %123
  br label %130

; <label>:130                                     ; preds = %129, %114
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %131 = load i64* %lr, align 8
  %132 = load i16* %sl, align 2
  %133 = sext i16 %132 to i64
  %134 = mul nsw i64 %133, %131
  %135 = trunc i64 %134 to i16
  store i16 %135, i16* %sl, align 2
  %136 = load i16* %sl, align 2
  %137 = sext i16 %136 to i32
  %138 = icmp ne i32 %137, 10
  br i1 %138, label %139, label %146

; <label>:139                                     ; preds = %130
  store i32 158, i32* %lrc, align 4
  %140 = load i32* %prlc, align 4
  %141 = icmp ne i32 %140, 0
  br i1 %141, label %142, label %145

; <label>:142                                     ; preds = %139
  %143 = load i32* %lrc, align 4
  %144 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %143)
  br label %145

; <label>:145                                     ; preds = %142, %139
  br label %146

; <label>:146                                     ; preds = %145, %130
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %147 = load i32* %ur, align 4
  %148 = load i16* %sl, align 2
  %149 = sext i16 %148 to i32
  %150 = mul i32 %149, %147
  %151 = trunc i32 %150 to i16
  store i16 %151, i16* %sl, align 2
  %152 = load i16* %sl, align 2
  %153 = sext i16 %152 to i32
  %154 = icmp ne i32 %153, 10
  br i1 %154, label %155, label %162

; <label>:155                                     ; preds = %146
  store i32 159, i32* %lrc, align 4
  %156 = load i32* %prlc, align 4
  %157 = icmp ne i32 %156, 0
  br i1 %157, label %158, label %161

; <label>:158                                     ; preds = %155
  %159 = load i32* %lrc, align 4
  %160 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %159)
  br label %161

; <label>:161                                     ; preds = %158, %155
  br label %162

; <label>:162                                     ; preds = %161, %146
  store i16 5, i16* %sl, align 2
  store float 2.000000e+00, float* %fr, align 4
  %163 = load float* %fr, align 4
  %164 = load i16* %sl, align 2
  %165 = sitofp i16 %164 to float
  %166 = fmul float %165, %163
  %167 = fptosi float %166 to i16
  store i16 %167, i16* %sl, align 2
  %168 = load i16* %sl, align 2
  %169 = sext i16 %168 to i32
  %170 = icmp ne i32 %169, 10
  br i1 %170, label %171, label %178

; <label>:171                                     ; preds = %162
  store i32 160, i32* %lrc, align 4
  %172 = load i32* %prlc, align 4
  %173 = icmp ne i32 %172, 0
  br i1 %173, label %174, label %177

; <label>:174                                     ; preds = %171
  %175 = load i32* %lrc, align 4
  %176 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %175)
  br label %177

; <label>:177                                     ; preds = %174, %171
  br label %178

; <label>:178                                     ; preds = %177, %162
  store i16 5, i16* %sl, align 2
  store double 2.000000e+00, double* %dr, align 8
  %179 = load double* %dr, align 8
  %180 = load i16* %sl, align 2
  %181 = sitofp i16 %180 to double
  %182 = fmul double %181, %179
  %183 = fptosi double %182 to i16
  store i16 %183, i16* %sl, align 2
  %184 = load i16* %sl, align 2
  %185 = sext i16 %184 to i32
  %186 = icmp ne i32 %185, 10
  br i1 %186, label %187, label %194

; <label>:187                                     ; preds = %178
  store i32 161, i32* %lrc, align 4
  %188 = load i32* %prlc, align 4
  %189 = icmp ne i32 %188, 0
  br i1 %189, label %190, label %193

; <label>:190                                     ; preds = %187
  %191 = load i32* %lrc, align 4
  %192 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %191)
  br label %193

; <label>:193                                     ; preds = %190, %187
  br label %194

; <label>:194                                     ; preds = %193, %178
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %195 = load i8* %cr, align 1
  %196 = sext i8 %195 to i32
  %197 = load i32* %il, align 4
  %198 = mul nsw i32 %197, %196
  store i32 %198, i32* %il, align 4
  %199 = load i32* %il, align 4
  %200 = icmp ne i32 %199, 10
  br i1 %200, label %201, label %208

; <label>:201                                     ; preds = %194
  store i32 162, i32* %lrc, align 4
  %202 = load i32* %prlc, align 4
  %203 = icmp ne i32 %202, 0
  br i1 %203, label %204, label %207

; <label>:204                                     ; preds = %201
  %205 = load i32* %lrc, align 4
  %206 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %205)
  br label %207

; <label>:207                                     ; preds = %204, %201
  br label %208

; <label>:208                                     ; preds = %207, %194
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %209 = load i16* %sr, align 2
  %210 = sext i16 %209 to i32
  %211 = load i32* %il, align 4
  %212 = mul nsw i32 %211, %210
  store i32 %212, i32* %il, align 4
  %213 = load i32* %il, align 4
  %214 = icmp ne i32 %213, 10
  br i1 %214, label %215, label %222

; <label>:215                                     ; preds = %208
  store i32 163, i32* %lrc, align 4
  %216 = load i32* %prlc, align 4
  %217 = icmp ne i32 %216, 0
  br i1 %217, label %218, label %221

; <label>:218                                     ; preds = %215
  %219 = load i32* %lrc, align 4
  %220 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %219)
  br label %221

; <label>:221                                     ; preds = %218, %215
  br label %222

; <label>:222                                     ; preds = %221, %208
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %223 = load i32* %ir, align 4
  %224 = load i32* %il, align 4
  %225 = mul nsw i32 %224, %223
  store i32 %225, i32* %il, align 4
  %226 = load i32* %il, align 4
  %227 = icmp ne i32 %226, 10
  br i1 %227, label %228, label %235

; <label>:228                                     ; preds = %222
  store i32 164, i32* %lrc, align 4
  %229 = load i32* %prlc, align 4
  %230 = icmp ne i32 %229, 0
  br i1 %230, label %231, label %234

; <label>:231                                     ; preds = %228
  %232 = load i32* %lrc, align 4
  %233 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %232)
  br label %234

; <label>:234                                     ; preds = %231, %228
  br label %235

; <label>:235                                     ; preds = %234, %222
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %236 = load i64* %lr, align 8
  %237 = load i32* %il, align 4
  %238 = sext i32 %237 to i64
  %239 = mul nsw i64 %238, %236
  %240 = trunc i64 %239 to i32
  store i32 %240, i32* %il, align 4
  %241 = load i32* %il, align 4
  %242 = icmp ne i32 %241, 10
  br i1 %242, label %243, label %250

; <label>:243                                     ; preds = %235
  store i32 165, i32* %lrc, align 4
  %244 = load i32* %prlc, align 4
  %245 = icmp ne i32 %244, 0
  br i1 %245, label %246, label %249

; <label>:246                                     ; preds = %243
  %247 = load i32* %lrc, align 4
  %248 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %247)
  br label %249

; <label>:249                                     ; preds = %246, %243
  br label %250

; <label>:250                                     ; preds = %249, %235
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %251 = load i32* %ur, align 4
  %252 = load i32* %il, align 4
  %253 = mul i32 %252, %251
  store i32 %253, i32* %il, align 4
  %254 = load i32* %il, align 4
  %255 = icmp ne i32 %254, 10
  br i1 %255, label %256, label %263

; <label>:256                                     ; preds = %250
  store i32 166, i32* %lrc, align 4
  %257 = load i32* %prlc, align 4
  %258 = icmp ne i32 %257, 0
  br i1 %258, label %259, label %262

; <label>:259                                     ; preds = %256
  %260 = load i32* %lrc, align 4
  %261 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %260)
  br label %262

; <label>:262                                     ; preds = %259, %256
  br label %263

; <label>:263                                     ; preds = %262, %250
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %264 = load float* %fr, align 4
  %265 = load i32* %il, align 4
  %266 = sitofp i32 %265 to float
  %267 = fmul float %266, %264
  %268 = fptosi float %267 to i32
  store i32 %268, i32* %il, align 4
  %269 = load i32* %il, align 4
  %270 = icmp ne i32 %269, 10
  br i1 %270, label %271, label %278

; <label>:271                                     ; preds = %263
  store i32 167, i32* %lrc, align 4
  %272 = load i32* %prlc, align 4
  %273 = icmp ne i32 %272, 0
  br i1 %273, label %274, label %277

; <label>:274                                     ; preds = %271
  %275 = load i32* %lrc, align 4
  %276 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %275)
  br label %277

; <label>:277                                     ; preds = %274, %271
  br label %278

; <label>:278                                     ; preds = %277, %263
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %279 = load double* %dr, align 8
  %280 = load i32* %il, align 4
  %281 = sitofp i32 %280 to double
  %282 = fmul double %281, %279
  %283 = fptosi double %282 to i32
  store i32 %283, i32* %il, align 4
  %284 = load i32* %il, align 4
  %285 = icmp ne i32 %284, 10
  br i1 %285, label %286, label %293

; <label>:286                                     ; preds = %278
  store i32 168, i32* %lrc, align 4
  %287 = load i32* %prlc, align 4
  %288 = icmp ne i32 %287, 0
  br i1 %288, label %289, label %292

; <label>:289                                     ; preds = %286
  %290 = load i32* %lrc, align 4
  %291 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %290)
  br label %292

; <label>:292                                     ; preds = %289, %286
  br label %293

; <label>:293                                     ; preds = %292, %278
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %294 = load i8* %cr, align 1
  %295 = sext i8 %294 to i64
  %296 = load i64* %ll, align 8
  %297 = mul nsw i64 %296, %295
  store i64 %297, i64* %ll, align 8
  %298 = load i64* %ll, align 8
  %299 = icmp ne i64 %298, 10
  br i1 %299, label %300, label %307

; <label>:300                                     ; preds = %293
  store i32 169, i32* %lrc, align 4
  %301 = load i32* %prlc, align 4
  %302 = icmp ne i32 %301, 0
  br i1 %302, label %303, label %306

; <label>:303                                     ; preds = %300
  %304 = load i32* %lrc, align 4
  %305 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %304)
  br label %306

; <label>:306                                     ; preds = %303, %300
  br label %307

; <label>:307                                     ; preds = %306, %293
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %308 = load i16* %sr, align 2
  %309 = sext i16 %308 to i64
  %310 = load i64* %ll, align 8
  %311 = mul nsw i64 %310, %309
  store i64 %311, i64* %ll, align 8
  %312 = load i64* %ll, align 8
  %313 = icmp ne i64 %312, 10
  br i1 %313, label %314, label %321

; <label>:314                                     ; preds = %307
  store i32 170, i32* %lrc, align 4
  %315 = load i32* %prlc, align 4
  %316 = icmp ne i32 %315, 0
  br i1 %316, label %317, label %320

; <label>:317                                     ; preds = %314
  %318 = load i32* %lrc, align 4
  %319 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %318)
  br label %320

; <label>:320                                     ; preds = %317, %314
  br label %321

; <label>:321                                     ; preds = %320, %307
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %322 = load i32* %ir, align 4
  %323 = sext i32 %322 to i64
  %324 = load i64* %ll, align 8
  %325 = mul nsw i64 %324, %323
  store i64 %325, i64* %ll, align 8
  %326 = load i64* %ll, align 8
  %327 = icmp ne i64 %326, 10
  br i1 %327, label %328, label %335

; <label>:328                                     ; preds = %321
  store i32 171, i32* %lrc, align 4
  %329 = load i32* %prlc, align 4
  %330 = icmp ne i32 %329, 0
  br i1 %330, label %331, label %334

; <label>:331                                     ; preds = %328
  %332 = load i32* %lrc, align 4
  %333 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %332)
  br label %334

; <label>:334                                     ; preds = %331, %328
  br label %335

; <label>:335                                     ; preds = %334, %321
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %336 = load i64* %lr, align 8
  %337 = load i64* %ll, align 8
  %338 = mul nsw i64 %337, %336
  store i64 %338, i64* %ll, align 8
  %339 = load i64* %ll, align 8
  %340 = icmp ne i64 %339, 10
  br i1 %340, label %341, label %348

; <label>:341                                     ; preds = %335
  store i32 172, i32* %lrc, align 4
  %342 = load i32* %prlc, align 4
  %343 = icmp ne i32 %342, 0
  br i1 %343, label %344, label %347

; <label>:344                                     ; preds = %341
  %345 = load i32* %lrc, align 4
  %346 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %345)
  br label %347

; <label>:347                                     ; preds = %344, %341
  br label %348

; <label>:348                                     ; preds = %347, %335
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %349 = load i32* %ur, align 4
  %350 = zext i32 %349 to i64
  %351 = load i64* %ll, align 8
  %352 = mul nsw i64 %351, %350
  store i64 %352, i64* %ll, align 8
  %353 = load i64* %ll, align 8
  %354 = icmp ne i64 %353, 10
  br i1 %354, label %355, label %362

; <label>:355                                     ; preds = %348
  store i32 173, i32* %lrc, align 4
  %356 = load i32* %prlc, align 4
  %357 = icmp ne i32 %356, 0
  br i1 %357, label %358, label %361

; <label>:358                                     ; preds = %355
  %359 = load i32* %lrc, align 4
  %360 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %359)
  br label %361

; <label>:361                                     ; preds = %358, %355
  br label %362

; <label>:362                                     ; preds = %361, %348
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %363 = load float* %fr, align 4
  %364 = load i64* %ll, align 8
  %365 = sitofp i64 %364 to float
  %366 = fmul float %365, %363
  %367 = fptosi float %366 to i64
  store i64 %367, i64* %ll, align 8
  %368 = load i64* %ll, align 8
  %369 = icmp ne i64 %368, 10
  br i1 %369, label %370, label %377

; <label>:370                                     ; preds = %362
  store i32 174, i32* %lrc, align 4
  %371 = load i32* %prlc, align 4
  %372 = icmp ne i32 %371, 0
  br i1 %372, label %373, label %376

; <label>:373                                     ; preds = %370
  %374 = load i32* %lrc, align 4
  %375 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %374)
  br label %376

; <label>:376                                     ; preds = %373, %370
  br label %377

; <label>:377                                     ; preds = %376, %362
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %378 = load double* %dr, align 8
  %379 = load i64* %ll, align 8
  %380 = sitofp i64 %379 to double
  %381 = fmul double %380, %378
  %382 = fptosi double %381 to i64
  store i64 %382, i64* %ll, align 8
  %383 = load i64* %ll, align 8
  %384 = icmp ne i64 %383, 10
  br i1 %384, label %385, label %392

; <label>:385                                     ; preds = %377
  store i32 175, i32* %lrc, align 4
  %386 = load i32* %prlc, align 4
  %387 = icmp ne i32 %386, 0
  br i1 %387, label %388, label %391

; <label>:388                                     ; preds = %385
  %389 = load i32* %lrc, align 4
  %390 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %389)
  br label %391

; <label>:391                                     ; preds = %388, %385
  br label %392

; <label>:392                                     ; preds = %391, %377
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %393 = load i8* %cr, align 1
  %394 = sext i8 %393 to i32
  %395 = load i32* %ul, align 4
  %396 = mul i32 %395, %394
  store i32 %396, i32* %ul, align 4
  %397 = load i32* %ul, align 4
  %398 = icmp ne i32 %397, 10
  br i1 %398, label %399, label %406

; <label>:399                                     ; preds = %392
  store i32 176, i32* %lrc, align 4
  %400 = load i32* %prlc, align 4
  %401 = icmp ne i32 %400, 0
  br i1 %401, label %402, label %405

; <label>:402                                     ; preds = %399
  %403 = load i32* %lrc, align 4
  %404 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %403)
  br label %405

; <label>:405                                     ; preds = %402, %399
  br label %406

; <label>:406                                     ; preds = %405, %392
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %407 = load i16* %sr, align 2
  %408 = sext i16 %407 to i32
  %409 = load i32* %ul, align 4
  %410 = mul i32 %409, %408
  store i32 %410, i32* %ul, align 4
  %411 = load i32* %ul, align 4
  %412 = icmp ne i32 %411, 10
  br i1 %412, label %413, label %420

; <label>:413                                     ; preds = %406
  store i32 177, i32* %lrc, align 4
  %414 = load i32* %prlc, align 4
  %415 = icmp ne i32 %414, 0
  br i1 %415, label %416, label %419

; <label>:416                                     ; preds = %413
  %417 = load i32* %lrc, align 4
  %418 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %417)
  br label %419

; <label>:419                                     ; preds = %416, %413
  br label %420

; <label>:420                                     ; preds = %419, %406
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %421 = load i32* %ir, align 4
  %422 = load i32* %ul, align 4
  %423 = mul i32 %422, %421
  store i32 %423, i32* %ul, align 4
  %424 = load i32* %ul, align 4
  %425 = icmp ne i32 %424, 10
  br i1 %425, label %426, label %433

; <label>:426                                     ; preds = %420
  store i32 178, i32* %lrc, align 4
  %427 = load i32* %prlc, align 4
  %428 = icmp ne i32 %427, 0
  br i1 %428, label %429, label %432

; <label>:429                                     ; preds = %426
  %430 = load i32* %lrc, align 4
  %431 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %430)
  br label %432

; <label>:432                                     ; preds = %429, %426
  br label %433

; <label>:433                                     ; preds = %432, %420
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %434 = load i64* %lr, align 8
  %435 = load i32* %ul, align 4
  %436 = zext i32 %435 to i64
  %437 = mul nsw i64 %436, %434
  %438 = trunc i64 %437 to i32
  store i32 %438, i32* %ul, align 4
  %439 = load i32* %ul, align 4
  %440 = icmp ne i32 %439, 10
  br i1 %440, label %441, label %448

; <label>:441                                     ; preds = %433
  store i32 179, i32* %lrc, align 4
  %442 = load i32* %prlc, align 4
  %443 = icmp ne i32 %442, 0
  br i1 %443, label %444, label %447

; <label>:444                                     ; preds = %441
  %445 = load i32* %lrc, align 4
  %446 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %445)
  br label %447

; <label>:447                                     ; preds = %444, %441
  br label %448

; <label>:448                                     ; preds = %447, %433
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %449 = load i32* %ur, align 4
  %450 = load i32* %ul, align 4
  %451 = mul i32 %450, %449
  store i32 %451, i32* %ul, align 4
  %452 = load i32* %ul, align 4
  %453 = icmp ne i32 %452, 10
  br i1 %453, label %454, label %461

; <label>:454                                     ; preds = %448
  store i32 180, i32* %lrc, align 4
  %455 = load i32* %prlc, align 4
  %456 = icmp ne i32 %455, 0
  br i1 %456, label %457, label %460

; <label>:457                                     ; preds = %454
  %458 = load i32* %lrc, align 4
  %459 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %458)
  br label %460

; <label>:460                                     ; preds = %457, %454
  br label %461

; <label>:461                                     ; preds = %460, %448
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %462 = load float* %fr, align 4
  %463 = load i32* %ul, align 4
  %464 = uitofp i32 %463 to float
  %465 = fmul float %464, %462
  %466 = fptoui float %465 to i32
  store i32 %466, i32* %ul, align 4
  %467 = load i32* %ul, align 4
  %468 = icmp ne i32 %467, 10
  br i1 %468, label %469, label %476

; <label>:469                                     ; preds = %461
  store i32 181, i32* %lrc, align 4
  %470 = load i32* %prlc, align 4
  %471 = icmp ne i32 %470, 0
  br i1 %471, label %472, label %475

; <label>:472                                     ; preds = %469
  %473 = load i32* %lrc, align 4
  %474 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %473)
  br label %475

; <label>:475                                     ; preds = %472, %469
  br label %476

; <label>:476                                     ; preds = %475, %461
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %477 = load double* %dr, align 8
  %478 = load i32* %ul, align 4
  %479 = uitofp i32 %478 to double
  %480 = fmul double %479, %477
  %481 = fptoui double %480 to i32
  store i32 %481, i32* %ul, align 4
  %482 = load i32* %ul, align 4
  %483 = icmp ne i32 %482, 10
  br i1 %483, label %484, label %491

; <label>:484                                     ; preds = %476
  store i32 182, i32* %lrc, align 4
  %485 = load i32* %prlc, align 4
  %486 = icmp ne i32 %485, 0
  br i1 %486, label %487, label %490

; <label>:487                                     ; preds = %484
  %488 = load i32* %lrc, align 4
  %489 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %488)
  br label %490

; <label>:490                                     ; preds = %487, %484
  br label %491

; <label>:491                                     ; preds = %490, %476
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %492 = load i8* %cr, align 1
  %493 = sext i8 %492 to i32
  %494 = sitofp i32 %493 to float
  %495 = load float* %fl, align 4
  %496 = fmul float %495, %494
  store float %496, float* %fl, align 4
  %497 = load float* %fl, align 4
  %498 = fcmp une float %497, 1.000000e+01
  br i1 %498, label %499, label %506

; <label>:499                                     ; preds = %491
  store i32 183, i32* %lrc, align 4
  %500 = load i32* %prlc, align 4
  %501 = icmp ne i32 %500, 0
  br i1 %501, label %502, label %505

; <label>:502                                     ; preds = %499
  %503 = load i32* %lrc, align 4
  %504 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %503)
  br label %505

; <label>:505                                     ; preds = %502, %499
  br label %506

; <label>:506                                     ; preds = %505, %491
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %507 = load i16* %sr, align 2
  %508 = sext i16 %507 to i32
  %509 = sitofp i32 %508 to float
  %510 = load float* %fl, align 4
  %511 = fmul float %510, %509
  store float %511, float* %fl, align 4
  %512 = load float* %fl, align 4
  %513 = fcmp une float %512, 1.000000e+01
  br i1 %513, label %514, label %521

; <label>:514                                     ; preds = %506
  store i32 184, i32* %lrc, align 4
  %515 = load i32* %prlc, align 4
  %516 = icmp ne i32 %515, 0
  br i1 %516, label %517, label %520

; <label>:517                                     ; preds = %514
  %518 = load i32* %lrc, align 4
  %519 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %518)
  br label %520

; <label>:520                                     ; preds = %517, %514
  br label %521

; <label>:521                                     ; preds = %520, %506
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %522 = load i32* %ir, align 4
  %523 = sitofp i32 %522 to float
  %524 = load float* %fl, align 4
  %525 = fmul float %524, %523
  store float %525, float* %fl, align 4
  %526 = load float* %fl, align 4
  %527 = fcmp une float %526, 1.000000e+01
  br i1 %527, label %528, label %535

; <label>:528                                     ; preds = %521
  store i32 185, i32* %lrc, align 4
  %529 = load i32* %prlc, align 4
  %530 = icmp ne i32 %529, 0
  br i1 %530, label %531, label %534

; <label>:531                                     ; preds = %528
  %532 = load i32* %lrc, align 4
  %533 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %532)
  br label %534

; <label>:534                                     ; preds = %531, %528
  br label %535

; <label>:535                                     ; preds = %534, %521
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %536 = load i64* %lr, align 8
  %537 = sitofp i64 %536 to float
  %538 = load float* %fl, align 4
  %539 = fmul float %538, %537
  store float %539, float* %fl, align 4
  %540 = load float* %fl, align 4
  %541 = fcmp une float %540, 1.000000e+01
  br i1 %541, label %542, label %549

; <label>:542                                     ; preds = %535
  store i32 186, i32* %lrc, align 4
  %543 = load i32* %prlc, align 4
  %544 = icmp ne i32 %543, 0
  br i1 %544, label %545, label %548

; <label>:545                                     ; preds = %542
  %546 = load i32* %lrc, align 4
  %547 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %546)
  br label %548

; <label>:548                                     ; preds = %545, %542
  br label %549

; <label>:549                                     ; preds = %548, %535
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %550 = load i32* %ur, align 4
  %551 = uitofp i32 %550 to float
  %552 = load float* %fl, align 4
  %553 = fmul float %552, %551
  store float %553, float* %fl, align 4
  %554 = load float* %fl, align 4
  %555 = fcmp une float %554, 1.000000e+01
  br i1 %555, label %556, label %563

; <label>:556                                     ; preds = %549
  store i32 187, i32* %lrc, align 4
  %557 = load i32* %prlc, align 4
  %558 = icmp ne i32 %557, 0
  br i1 %558, label %559, label %562

; <label>:559                                     ; preds = %556
  %560 = load i32* %lrc, align 4
  %561 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %560)
  br label %562

; <label>:562                                     ; preds = %559, %556
  br label %563

; <label>:563                                     ; preds = %562, %549
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %564 = load float* %fr, align 4
  %565 = load float* %fl, align 4
  %566 = fmul float %565, %564
  store float %566, float* %fl, align 4
  %567 = load float* %fl, align 4
  %568 = fcmp une float %567, 1.000000e+01
  br i1 %568, label %569, label %576

; <label>:569                                     ; preds = %563
  store i32 188, i32* %lrc, align 4
  %570 = load i32* %prlc, align 4
  %571 = icmp ne i32 %570, 0
  br i1 %571, label %572, label %575

; <label>:572                                     ; preds = %569
  %573 = load i32* %lrc, align 4
  %574 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %573)
  br label %575

; <label>:575                                     ; preds = %572, %569
  br label %576

; <label>:576                                     ; preds = %575, %563
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %577 = load double* %dr, align 8
  %578 = load float* %fl, align 4
  %579 = fpext float %578 to double
  %580 = fmul double %579, %577
  %581 = fptrunc double %580 to float
  store float %581, float* %fl, align 4
  %582 = load float* %fl, align 4
  %583 = fcmp une float %582, 1.000000e+01
  br i1 %583, label %584, label %591

; <label>:584                                     ; preds = %576
  store i32 189, i32* %lrc, align 4
  %585 = load i32* %prlc, align 4
  %586 = icmp ne i32 %585, 0
  br i1 %586, label %587, label %590

; <label>:587                                     ; preds = %584
  %588 = load i32* %lrc, align 4
  %589 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %588)
  br label %590

; <label>:590                                     ; preds = %587, %584
  br label %591

; <label>:591                                     ; preds = %590, %576
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %592 = load i8* %cr, align 1
  %593 = sext i8 %592 to i32
  %594 = sitofp i32 %593 to double
  %595 = load double* %dl, align 8
  %596 = fmul double %595, %594
  store double %596, double* %dl, align 8
  %597 = load double* %dl, align 8
  %598 = fcmp une double %597, 1.000000e+01
  br i1 %598, label %599, label %606

; <label>:599                                     ; preds = %591
  store i32 190, i32* %lrc, align 4
  %600 = load i32* %prlc, align 4
  %601 = icmp ne i32 %600, 0
  br i1 %601, label %602, label %605

; <label>:602                                     ; preds = %599
  %603 = load i32* %lrc, align 4
  %604 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %603)
  br label %605

; <label>:605                                     ; preds = %602, %599
  br label %606

; <label>:606                                     ; preds = %605, %591
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %607 = load i16* %sr, align 2
  %608 = sext i16 %607 to i32
  %609 = sitofp i32 %608 to double
  %610 = load double* %dl, align 8
  %611 = fmul double %610, %609
  store double %611, double* %dl, align 8
  %612 = load double* %dl, align 8
  %613 = fcmp une double %612, 1.000000e+01
  br i1 %613, label %614, label %621

; <label>:614                                     ; preds = %606
  store i32 191, i32* %lrc, align 4
  %615 = load i32* %prlc, align 4
  %616 = icmp ne i32 %615, 0
  br i1 %616, label %617, label %620

; <label>:617                                     ; preds = %614
  %618 = load i32* %lrc, align 4
  %619 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %618)
  br label %620

; <label>:620                                     ; preds = %617, %614
  br label %621

; <label>:621                                     ; preds = %620, %606
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %622 = load i32* %ir, align 4
  %623 = sitofp i32 %622 to double
  %624 = load double* %dl, align 8
  %625 = fmul double %624, %623
  store double %625, double* %dl, align 8
  %626 = load double* %dl, align 8
  %627 = fcmp une double %626, 1.000000e+01
  br i1 %627, label %628, label %635

; <label>:628                                     ; preds = %621
  store i32 192, i32* %lrc, align 4
  %629 = load i32* %prlc, align 4
  %630 = icmp ne i32 %629, 0
  br i1 %630, label %631, label %634

; <label>:631                                     ; preds = %628
  %632 = load i32* %lrc, align 4
  %633 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %632)
  br label %634

; <label>:634                                     ; preds = %631, %628
  br label %635

; <label>:635                                     ; preds = %634, %621
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %636 = load i64* %lr, align 8
  %637 = sitofp i64 %636 to double
  %638 = load double* %dl, align 8
  %639 = fmul double %638, %637
  store double %639, double* %dl, align 8
  %640 = load double* %dl, align 8
  %641 = fcmp une double %640, 1.000000e+01
  br i1 %641, label %642, label %649

; <label>:642                                     ; preds = %635
  store i32 193, i32* %lrc, align 4
  %643 = load i32* %prlc, align 4
  %644 = icmp ne i32 %643, 0
  br i1 %644, label %645, label %648

; <label>:645                                     ; preds = %642
  %646 = load i32* %lrc, align 4
  %647 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %646)
  br label %648

; <label>:648                                     ; preds = %645, %642
  br label %649

; <label>:649                                     ; preds = %648, %635
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %650 = load i32* %ur, align 4
  %651 = uitofp i32 %650 to double
  %652 = load double* %dl, align 8
  %653 = fmul double %652, %651
  store double %653, double* %dl, align 8
  %654 = load double* %dl, align 8
  %655 = fcmp une double %654, 1.000000e+01
  br i1 %655, label %656, label %663

; <label>:656                                     ; preds = %649
  store i32 194, i32* %lrc, align 4
  %657 = load i32* %prlc, align 4
  %658 = icmp ne i32 %657, 0
  br i1 %658, label %659, label %662

; <label>:659                                     ; preds = %656
  %660 = load i32* %lrc, align 4
  %661 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %660)
  br label %662

; <label>:662                                     ; preds = %659, %656
  br label %663

; <label>:663                                     ; preds = %662, %649
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %664 = load float* %fr, align 4
  %665 = fpext float %664 to double
  %666 = load double* %dl, align 8
  %667 = fmul double %666, %665
  store double %667, double* %dl, align 8
  %668 = load double* %dl, align 8
  %669 = fcmp une double %668, 1.000000e+01
  br i1 %669, label %670, label %677

; <label>:670                                     ; preds = %663
  store i32 195, i32* %lrc, align 4
  %671 = load i32* %prlc, align 4
  %672 = icmp ne i32 %671, 0
  br i1 %672, label %673, label %676

; <label>:673                                     ; preds = %670
  %674 = load i32* %lrc, align 4
  %675 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %674)
  br label %676

; <label>:676                                     ; preds = %673, %670
  br label %677

; <label>:677                                     ; preds = %676, %663
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %678 = load double* %dr, align 8
  %679 = load double* %dl, align 8
  %680 = fmul double %679, %678
  store double %680, double* %dl, align 8
  %681 = load double* %dl, align 8
  %682 = fcmp une double %681, 1.000000e+01
  br i1 %682, label %683, label %690

; <label>:683                                     ; preds = %677
  store i32 196, i32* %lrc, align 4
  %684 = load i32* %prlc, align 4
  %685 = icmp ne i32 %684, 0
  br i1 %685, label %686, label %689

; <label>:686                                     ; preds = %683
  %687 = load i32* %lrc, align 4
  %688 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %687)
  br label %689

; <label>:689                                     ; preds = %686, %683
  br label %690

; <label>:690                                     ; preds = %689, %677
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %691 = load i8* %cr, align 1
  %692 = sext i8 %691 to i32
  %693 = load i8* %cl, align 1
  %694 = sext i8 %693 to i32
  %695 = sdiv i32 %694, %692
  %696 = trunc i32 %695 to i8
  store i8 %696, i8* %cl, align 1
  %697 = load i8* %cl, align 1
  %698 = sext i8 %697 to i32
  %699 = icmp ne i32 %698, 2
  br i1 %699, label %700, label %707

; <label>:700                                     ; preds = %690
  store i32 197, i32* %lrc, align 4
  %701 = load i32* %prlc, align 4
  %702 = icmp ne i32 %701, 0
  br i1 %702, label %703, label %706

; <label>:703                                     ; preds = %700
  %704 = load i32* %lrc, align 4
  %705 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %704)
  br label %706

; <label>:706                                     ; preds = %703, %700
  br label %707

; <label>:707                                     ; preds = %706, %690
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %708 = load i16* %sr, align 2
  %709 = sext i16 %708 to i32
  %710 = load i8* %cl, align 1
  %711 = sext i8 %710 to i32
  %712 = sdiv i32 %711, %709
  %713 = trunc i32 %712 to i8
  store i8 %713, i8* %cl, align 1
  %714 = load i8* %cl, align 1
  %715 = sext i8 %714 to i32
  %716 = icmp ne i32 %715, 2
  br i1 %716, label %717, label %724

; <label>:717                                     ; preds = %707
  store i32 198, i32* %lrc, align 4
  %718 = load i32* %prlc, align 4
  %719 = icmp ne i32 %718, 0
  br i1 %719, label %720, label %723

; <label>:720                                     ; preds = %717
  %721 = load i32* %lrc, align 4
  %722 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %721)
  br label %723

; <label>:723                                     ; preds = %720, %717
  br label %724

; <label>:724                                     ; preds = %723, %707
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %725 = load i32* %ir, align 4
  %726 = load i8* %cl, align 1
  %727 = sext i8 %726 to i32
  %728 = sdiv i32 %727, %725
  %729 = trunc i32 %728 to i8
  store i8 %729, i8* %cl, align 1
  %730 = load i8* %cl, align 1
  %731 = sext i8 %730 to i32
  %732 = icmp ne i32 %731, 2
  br i1 %732, label %733, label %740

; <label>:733                                     ; preds = %724
  store i32 199, i32* %lrc, align 4
  %734 = load i32* %prlc, align 4
  %735 = icmp ne i32 %734, 0
  br i1 %735, label %736, label %739

; <label>:736                                     ; preds = %733
  %737 = load i32* %lrc, align 4
  %738 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %737)
  br label %739

; <label>:739                                     ; preds = %736, %733
  br label %740

; <label>:740                                     ; preds = %739, %724
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %741 = load i64* %lr, align 8
  %742 = load i8* %cl, align 1
  %743 = sext i8 %742 to i64
  %744 = sdiv i64 %743, %741
  %745 = trunc i64 %744 to i8
  store i8 %745, i8* %cl, align 1
  %746 = load i8* %cl, align 1
  %747 = sext i8 %746 to i32
  %748 = icmp ne i32 %747, 2
  br i1 %748, label %749, label %756

; <label>:749                                     ; preds = %740
  store i32 200, i32* %lrc, align 4
  %750 = load i32* %prlc, align 4
  %751 = icmp ne i32 %750, 0
  br i1 %751, label %752, label %755

; <label>:752                                     ; preds = %749
  %753 = load i32* %lrc, align 4
  %754 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %753)
  br label %755

; <label>:755                                     ; preds = %752, %749
  br label %756

; <label>:756                                     ; preds = %755, %740
  %757 = load i32* %lrc, align 4
  %758 = icmp ne i32 %757, 0
  br i1 %758, label %759, label %767

; <label>:759                                     ; preds = %756
  store i32 1, i32* %rc, align 4
  %760 = load %struct.defs** %1, align 8
  %761 = getelementptr inbounds %struct.defs* %760, i32 0, i32 11
  %762 = load i32* %761, align 4
  %763 = icmp ne i32 %762, 0
  br i1 %763, label %764, label %766

; <label>:764                                     ; preds = %759
  %765 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %766

; <label>:766                                     ; preds = %764, %759
  br label %767

; <label>:767                                     ; preds = %766, %756
  %768 = load i32* %rc, align 4
  ret i32 %768
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
