; ModuleID = './cq-20-s714-c.c'
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
  store i32 2, i32* %ir, align 4
  %17 = load i32* %ir, align 4
  %18 = load i8* %cl, align 1
  %19 = sext i8 %18 to i32
  %20 = sub nsw i32 %19, %17
  %21 = trunc i32 %20 to i8
  store i8 %21, i8* %cl, align 1
  %22 = load i8* %cl, align 1
  %23 = sext i8 %22 to i32
  %24 = icmp ne i32 %23, 3
  br i1 %24, label %25, label %32

; <label>:25                                      ; preds = %16
  store i32 101, i32* %lrc, align 4
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
  store i64 2, i64* %lr, align 8
  %33 = load i64* %lr, align 8
  %34 = load i8* %cl, align 1
  %35 = sext i8 %34 to i64
  %36 = sub nsw i64 %35, %33
  %37 = trunc i64 %36 to i8
  store i8 %37, i8* %cl, align 1
  %38 = load i8* %cl, align 1
  %39 = sext i8 %38 to i32
  %40 = icmp ne i32 %39, 3
  br i1 %40, label %41, label %48

; <label>:41                                      ; preds = %32
  store i32 102, i32* %lrc, align 4
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
  store i32 2, i32* %ur, align 4
  %49 = load i32* %ur, align 4
  %50 = load i8* %cl, align 1
  %51 = sext i8 %50 to i32
  %52 = sub i32 %51, %49
  %53 = trunc i32 %52 to i8
  store i8 %53, i8* %cl, align 1
  %54 = load i8* %cl, align 1
  %55 = sext i8 %54 to i32
  %56 = icmp ne i32 %55, 3
  br i1 %56, label %57, label %64

; <label>:57                                      ; preds = %48
  store i32 103, i32* %lrc, align 4
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
  store float 2.000000e+00, float* %fr, align 4
  %65 = load float* %fr, align 4
  %66 = load i8* %cl, align 1
  %67 = sitofp i8 %66 to float
  %68 = fsub float %67, %65
  %69 = fptosi float %68 to i8
  store i8 %69, i8* %cl, align 1
  %70 = load i8* %cl, align 1
  %71 = sext i8 %70 to i32
  %72 = icmp ne i32 %71, 3
  br i1 %72, label %73, label %80

; <label>:73                                      ; preds = %64
  store i32 104, i32* %lrc, align 4
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
  store i8 5, i8* %cl, align 1
  store double 2.000000e+00, double* %dr, align 8
  %81 = load double* %dr, align 8
  %82 = load i8* %cl, align 1
  %83 = sitofp i8 %82 to double
  %84 = fsub double %83, %81
  %85 = fptosi double %84 to i8
  store i8 %85, i8* %cl, align 1
  %86 = load i8* %cl, align 1
  %87 = sext i8 %86 to i32
  %88 = icmp ne i32 %87, 3
  br i1 %88, label %89, label %96

; <label>:89                                      ; preds = %80
  store i32 105, i32* %lrc, align 4
  %90 = load i32* %prlc, align 4
  %91 = icmp ne i32 %90, 0
  br i1 %91, label %92, label %95

; <label>:92                                      ; preds = %89
  %93 = load i32* %lrc, align 4
  %94 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %93)
  br label %95

; <label>:95                                      ; preds = %92, %89
  br label %96

; <label>:96                                      ; preds = %95, %80
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %97 = load i8* %cr, align 1
  %98 = sext i8 %97 to i32
  %99 = load i16* %sl, align 2
  %100 = sext i16 %99 to i32
  %101 = sub nsw i32 %100, %98
  %102 = trunc i32 %101 to i16
  store i16 %102, i16* %sl, align 2
  %103 = load i16* %sl, align 2
  %104 = sext i16 %103 to i32
  %105 = icmp ne i32 %104, 3
  br i1 %105, label %106, label %113

; <label>:106                                     ; preds = %96
  store i32 106, i32* %lrc, align 4
  %107 = load i32* %prlc, align 4
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %112

; <label>:109                                     ; preds = %106
  %110 = load i32* %lrc, align 4
  %111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %110)
  br label %112

; <label>:112                                     ; preds = %109, %106
  br label %113

; <label>:113                                     ; preds = %112, %96
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %114 = load i16* %sr, align 2
  %115 = sext i16 %114 to i32
  %116 = load i16* %sl, align 2
  %117 = sext i16 %116 to i32
  %118 = sub nsw i32 %117, %115
  %119 = trunc i32 %118 to i16
  store i16 %119, i16* %sl, align 2
  %120 = load i16* %sl, align 2
  %121 = sext i16 %120 to i32
  %122 = icmp ne i32 %121, 3
  br i1 %122, label %123, label %130

; <label>:123                                     ; preds = %113
  store i32 107, i32* %lrc, align 4
  %124 = load i32* %prlc, align 4
  %125 = icmp ne i32 %124, 0
  br i1 %125, label %126, label %129

; <label>:126                                     ; preds = %123
  %127 = load i32* %lrc, align 4
  %128 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %127)
  br label %129

; <label>:129                                     ; preds = %126, %123
  br label %130

; <label>:130                                     ; preds = %129, %113
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %131 = load i32* %ir, align 4
  %132 = load i16* %sl, align 2
  %133 = sext i16 %132 to i32
  %134 = sub nsw i32 %133, %131
  %135 = trunc i32 %134 to i16
  store i16 %135, i16* %sl, align 2
  %136 = load i16* %sl, align 2
  %137 = sext i16 %136 to i32
  %138 = icmp ne i32 %137, 3
  br i1 %138, label %139, label %146

; <label>:139                                     ; preds = %130
  store i32 108, i32* %lrc, align 4
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
  store i64 2, i64* %lr, align 8
  %147 = load i64* %lr, align 8
  %148 = load i16* %sl, align 2
  %149 = sext i16 %148 to i64
  %150 = sub nsw i64 %149, %147
  %151 = trunc i64 %150 to i16
  store i16 %151, i16* %sl, align 2
  %152 = load i16* %sl, align 2
  %153 = sext i16 %152 to i32
  %154 = icmp ne i32 %153, 3
  br i1 %154, label %155, label %162

; <label>:155                                     ; preds = %146
  store i32 109, i32* %lrc, align 4
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
  store i32 2, i32* %ur, align 4
  %163 = load i32* %ur, align 4
  %164 = load i16* %sl, align 2
  %165 = sext i16 %164 to i32
  %166 = sub i32 %165, %163
  %167 = trunc i32 %166 to i16
  store i16 %167, i16* %sl, align 2
  %168 = load i16* %sl, align 2
  %169 = sext i16 %168 to i32
  %170 = icmp ne i32 %169, 3
  br i1 %170, label %171, label %178

; <label>:171                                     ; preds = %162
  store i32 110, i32* %lrc, align 4
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
  store float 2.000000e+00, float* %fr, align 4
  %179 = load float* %fr, align 4
  %180 = load i16* %sl, align 2
  %181 = sitofp i16 %180 to float
  %182 = fsub float %181, %179
  %183 = fptosi float %182 to i16
  store i16 %183, i16* %sl, align 2
  %184 = load i16* %sl, align 2
  %185 = sext i16 %184 to i32
  %186 = icmp ne i32 %185, 3
  br i1 %186, label %187, label %194

; <label>:187                                     ; preds = %178
  store i32 111, i32* %lrc, align 4
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
  store i16 5, i16* %sl, align 2
  store double 2.000000e+00, double* %dr, align 8
  %195 = load double* %dr, align 8
  %196 = load i16* %sl, align 2
  %197 = sitofp i16 %196 to double
  %198 = fsub double %197, %195
  %199 = fptosi double %198 to i16
  store i16 %199, i16* %sl, align 2
  %200 = load i16* %sl, align 2
  %201 = sext i16 %200 to i32
  %202 = icmp ne i32 %201, 3
  br i1 %202, label %203, label %210

; <label>:203                                     ; preds = %194
  store i32 112, i32* %lrc, align 4
  %204 = load i32* %prlc, align 4
  %205 = icmp ne i32 %204, 0
  br i1 %205, label %206, label %209

; <label>:206                                     ; preds = %203
  %207 = load i32* %lrc, align 4
  %208 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %207)
  br label %209

; <label>:209                                     ; preds = %206, %203
  br label %210

; <label>:210                                     ; preds = %209, %194
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %211 = load i8* %cr, align 1
  %212 = sext i8 %211 to i32
  %213 = load i32* %il, align 4
  %214 = sub nsw i32 %213, %212
  store i32 %214, i32* %il, align 4
  %215 = load i32* %il, align 4
  %216 = icmp ne i32 %215, 3
  br i1 %216, label %217, label %224

; <label>:217                                     ; preds = %210
  store i32 113, i32* %lrc, align 4
  %218 = load i32* %prlc, align 4
  %219 = icmp ne i32 %218, 0
  br i1 %219, label %220, label %223

; <label>:220                                     ; preds = %217
  %221 = load i32* %lrc, align 4
  %222 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %221)
  br label %223

; <label>:223                                     ; preds = %220, %217
  br label %224

; <label>:224                                     ; preds = %223, %210
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %225 = load i16* %sr, align 2
  %226 = sext i16 %225 to i32
  %227 = load i32* %il, align 4
  %228 = sub nsw i32 %227, %226
  store i32 %228, i32* %il, align 4
  %229 = load i32* %il, align 4
  %230 = icmp ne i32 %229, 3
  br i1 %230, label %231, label %238

; <label>:231                                     ; preds = %224
  store i32 114, i32* %lrc, align 4
  %232 = load i32* %prlc, align 4
  %233 = icmp ne i32 %232, 0
  br i1 %233, label %234, label %237

; <label>:234                                     ; preds = %231
  %235 = load i32* %lrc, align 4
  %236 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %235)
  br label %237

; <label>:237                                     ; preds = %234, %231
  br label %238

; <label>:238                                     ; preds = %237, %224
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %239 = load i32* %ir, align 4
  %240 = load i32* %il, align 4
  %241 = sub nsw i32 %240, %239
  store i32 %241, i32* %il, align 4
  %242 = load i32* %il, align 4
  %243 = icmp ne i32 %242, 3
  br i1 %243, label %244, label %251

; <label>:244                                     ; preds = %238
  store i32 115, i32* %lrc, align 4
  %245 = load i32* %prlc, align 4
  %246 = icmp ne i32 %245, 0
  br i1 %246, label %247, label %250

; <label>:247                                     ; preds = %244
  %248 = load i32* %lrc, align 4
  %249 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %248)
  br label %250

; <label>:250                                     ; preds = %247, %244
  br label %251

; <label>:251                                     ; preds = %250, %238
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %252 = load i64* %lr, align 8
  %253 = load i32* %il, align 4
  %254 = sext i32 %253 to i64
  %255 = sub nsw i64 %254, %252
  %256 = trunc i64 %255 to i32
  store i32 %256, i32* %il, align 4
  %257 = load i32* %il, align 4
  %258 = icmp ne i32 %257, 3
  br i1 %258, label %259, label %266

; <label>:259                                     ; preds = %251
  store i32 116, i32* %lrc, align 4
  %260 = load i32* %prlc, align 4
  %261 = icmp ne i32 %260, 0
  br i1 %261, label %262, label %265

; <label>:262                                     ; preds = %259
  %263 = load i32* %lrc, align 4
  %264 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %263)
  br label %265

; <label>:265                                     ; preds = %262, %259
  br label %266

; <label>:266                                     ; preds = %265, %251
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %267 = load i32* %ur, align 4
  %268 = load i32* %il, align 4
  %269 = sub i32 %268, %267
  store i32 %269, i32* %il, align 4
  %270 = load i32* %il, align 4
  %271 = icmp ne i32 %270, 3
  br i1 %271, label %272, label %279

; <label>:272                                     ; preds = %266
  store i32 117, i32* %lrc, align 4
  %273 = load i32* %prlc, align 4
  %274 = icmp ne i32 %273, 0
  br i1 %274, label %275, label %278

; <label>:275                                     ; preds = %272
  %276 = load i32* %lrc, align 4
  %277 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %276)
  br label %278

; <label>:278                                     ; preds = %275, %272
  br label %279

; <label>:279                                     ; preds = %278, %266
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %280 = load float* %fr, align 4
  %281 = load i32* %il, align 4
  %282 = sitofp i32 %281 to float
  %283 = fsub float %282, %280
  %284 = fptosi float %283 to i32
  store i32 %284, i32* %il, align 4
  %285 = load i32* %il, align 4
  %286 = icmp ne i32 %285, 3
  br i1 %286, label %287, label %294

; <label>:287                                     ; preds = %279
  store i32 118, i32* %lrc, align 4
  %288 = load i32* %prlc, align 4
  %289 = icmp ne i32 %288, 0
  br i1 %289, label %290, label %293

; <label>:290                                     ; preds = %287
  %291 = load i32* %lrc, align 4
  %292 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %291)
  br label %293

; <label>:293                                     ; preds = %290, %287
  br label %294

; <label>:294                                     ; preds = %293, %279
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %295 = load double* %dr, align 8
  %296 = load i32* %il, align 4
  %297 = sitofp i32 %296 to double
  %298 = fsub double %297, %295
  %299 = fptosi double %298 to i32
  store i32 %299, i32* %il, align 4
  %300 = load i32* %il, align 4
  %301 = icmp ne i32 %300, 3
  br i1 %301, label %302, label %309

; <label>:302                                     ; preds = %294
  store i32 119, i32* %lrc, align 4
  %303 = load i32* %prlc, align 4
  %304 = icmp ne i32 %303, 0
  br i1 %304, label %305, label %308

; <label>:305                                     ; preds = %302
  %306 = load i32* %lrc, align 4
  %307 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %306)
  br label %308

; <label>:308                                     ; preds = %305, %302
  br label %309

; <label>:309                                     ; preds = %308, %294
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %310 = load i8* %cr, align 1
  %311 = sext i8 %310 to i64
  %312 = load i64* %ll, align 8
  %313 = sub nsw i64 %312, %311
  store i64 %313, i64* %ll, align 8
  %314 = load i64* %ll, align 8
  %315 = icmp ne i64 %314, 3
  br i1 %315, label %316, label %323

; <label>:316                                     ; preds = %309
  store i32 120, i32* %lrc, align 4
  %317 = load i32* %prlc, align 4
  %318 = icmp ne i32 %317, 0
  br i1 %318, label %319, label %322

; <label>:319                                     ; preds = %316
  %320 = load i32* %lrc, align 4
  %321 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %320)
  br label %322

; <label>:322                                     ; preds = %319, %316
  br label %323

; <label>:323                                     ; preds = %322, %309
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %324 = load i16* %sr, align 2
  %325 = sext i16 %324 to i64
  %326 = load i64* %ll, align 8
  %327 = sub nsw i64 %326, %325
  store i64 %327, i64* %ll, align 8
  %328 = load i64* %ll, align 8
  %329 = icmp ne i64 %328, 3
  br i1 %329, label %330, label %337

; <label>:330                                     ; preds = %323
  store i32 121, i32* %lrc, align 4
  %331 = load i32* %prlc, align 4
  %332 = icmp ne i32 %331, 0
  br i1 %332, label %333, label %336

; <label>:333                                     ; preds = %330
  %334 = load i32* %lrc, align 4
  %335 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %334)
  br label %336

; <label>:336                                     ; preds = %333, %330
  br label %337

; <label>:337                                     ; preds = %336, %323
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %338 = load i32* %ir, align 4
  %339 = sext i32 %338 to i64
  %340 = load i64* %ll, align 8
  %341 = sub nsw i64 %340, %339
  store i64 %341, i64* %ll, align 8
  %342 = load i64* %ll, align 8
  %343 = icmp ne i64 %342, 3
  br i1 %343, label %344, label %351

; <label>:344                                     ; preds = %337
  store i32 122, i32* %lrc, align 4
  %345 = load i32* %prlc, align 4
  %346 = icmp ne i32 %345, 0
  br i1 %346, label %347, label %350

; <label>:347                                     ; preds = %344
  %348 = load i32* %lrc, align 4
  %349 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %348)
  br label %350

; <label>:350                                     ; preds = %347, %344
  br label %351

; <label>:351                                     ; preds = %350, %337
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %352 = load i64* %lr, align 8
  %353 = load i64* %ll, align 8
  %354 = sub nsw i64 %353, %352
  store i64 %354, i64* %ll, align 8
  %355 = load i64* %ll, align 8
  %356 = icmp ne i64 %355, 3
  br i1 %356, label %357, label %364

; <label>:357                                     ; preds = %351
  store i32 123, i32* %lrc, align 4
  %358 = load i32* %prlc, align 4
  %359 = icmp ne i32 %358, 0
  br i1 %359, label %360, label %363

; <label>:360                                     ; preds = %357
  %361 = load i32* %lrc, align 4
  %362 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %361)
  br label %363

; <label>:363                                     ; preds = %360, %357
  br label %364

; <label>:364                                     ; preds = %363, %351
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %365 = load i32* %ur, align 4
  %366 = zext i32 %365 to i64
  %367 = load i64* %ll, align 8
  %368 = sub nsw i64 %367, %366
  store i64 %368, i64* %ll, align 8
  %369 = load i64* %ll, align 8
  %370 = icmp ne i64 %369, 3
  br i1 %370, label %371, label %378

; <label>:371                                     ; preds = %364
  store i32 124, i32* %lrc, align 4
  %372 = load i32* %prlc, align 4
  %373 = icmp ne i32 %372, 0
  br i1 %373, label %374, label %377

; <label>:374                                     ; preds = %371
  %375 = load i32* %lrc, align 4
  %376 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %375)
  br label %377

; <label>:377                                     ; preds = %374, %371
  br label %378

; <label>:378                                     ; preds = %377, %364
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %379 = load float* %fr, align 4
  %380 = load i64* %ll, align 8
  %381 = sitofp i64 %380 to float
  %382 = fsub float %381, %379
  %383 = fptosi float %382 to i64
  store i64 %383, i64* %ll, align 8
  %384 = load i64* %ll, align 8
  %385 = icmp ne i64 %384, 3
  br i1 %385, label %386, label %393

; <label>:386                                     ; preds = %378
  store i32 125, i32* %lrc, align 4
  %387 = load i32* %prlc, align 4
  %388 = icmp ne i32 %387, 0
  br i1 %388, label %389, label %392

; <label>:389                                     ; preds = %386
  %390 = load i32* %lrc, align 4
  %391 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %390)
  br label %392

; <label>:392                                     ; preds = %389, %386
  br label %393

; <label>:393                                     ; preds = %392, %378
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %394 = load double* %dr, align 8
  %395 = load i64* %ll, align 8
  %396 = sitofp i64 %395 to double
  %397 = fsub double %396, %394
  %398 = fptosi double %397 to i64
  store i64 %398, i64* %ll, align 8
  %399 = load i64* %ll, align 8
  %400 = icmp ne i64 %399, 3
  br i1 %400, label %401, label %408

; <label>:401                                     ; preds = %393
  store i32 126, i32* %lrc, align 4
  %402 = load i32* %prlc, align 4
  %403 = icmp ne i32 %402, 0
  br i1 %403, label %404, label %407

; <label>:404                                     ; preds = %401
  %405 = load i32* %lrc, align 4
  %406 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %405)
  br label %407

; <label>:407                                     ; preds = %404, %401
  br label %408

; <label>:408                                     ; preds = %407, %393
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %409 = load i8* %cr, align 1
  %410 = sext i8 %409 to i32
  %411 = load i32* %ul, align 4
  %412 = sub i32 %411, %410
  store i32 %412, i32* %ul, align 4
  %413 = load i32* %ul, align 4
  %414 = icmp ne i32 %413, 3
  br i1 %414, label %415, label %422

; <label>:415                                     ; preds = %408
  store i32 127, i32* %lrc, align 4
  %416 = load i32* %prlc, align 4
  %417 = icmp ne i32 %416, 0
  br i1 %417, label %418, label %421

; <label>:418                                     ; preds = %415
  %419 = load i32* %lrc, align 4
  %420 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %419)
  br label %421

; <label>:421                                     ; preds = %418, %415
  br label %422

; <label>:422                                     ; preds = %421, %408
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %423 = load i16* %sr, align 2
  %424 = sext i16 %423 to i32
  %425 = load i32* %ul, align 4
  %426 = sub i32 %425, %424
  store i32 %426, i32* %ul, align 4
  %427 = load i32* %ul, align 4
  %428 = icmp ne i32 %427, 3
  br i1 %428, label %429, label %436

; <label>:429                                     ; preds = %422
  store i32 128, i32* %lrc, align 4
  %430 = load i32* %prlc, align 4
  %431 = icmp ne i32 %430, 0
  br i1 %431, label %432, label %435

; <label>:432                                     ; preds = %429
  %433 = load i32* %lrc, align 4
  %434 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %433)
  br label %435

; <label>:435                                     ; preds = %432, %429
  br label %436

; <label>:436                                     ; preds = %435, %422
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %437 = load i32* %ir, align 4
  %438 = load i32* %ul, align 4
  %439 = sub i32 %438, %437
  store i32 %439, i32* %ul, align 4
  %440 = load i32* %ul, align 4
  %441 = icmp ne i32 %440, 3
  br i1 %441, label %442, label %449

; <label>:442                                     ; preds = %436
  store i32 129, i32* %lrc, align 4
  %443 = load i32* %prlc, align 4
  %444 = icmp ne i32 %443, 0
  br i1 %444, label %445, label %448

; <label>:445                                     ; preds = %442
  %446 = load i32* %lrc, align 4
  %447 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %446)
  br label %448

; <label>:448                                     ; preds = %445, %442
  br label %449

; <label>:449                                     ; preds = %448, %436
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %450 = load i64* %lr, align 8
  %451 = load i32* %ul, align 4
  %452 = zext i32 %451 to i64
  %453 = sub nsw i64 %452, %450
  %454 = trunc i64 %453 to i32
  store i32 %454, i32* %ul, align 4
  %455 = load i32* %ul, align 4
  %456 = icmp ne i32 %455, 3
  br i1 %456, label %457, label %464

; <label>:457                                     ; preds = %449
  store i32 130, i32* %lrc, align 4
  %458 = load i32* %prlc, align 4
  %459 = icmp ne i32 %458, 0
  br i1 %459, label %460, label %463

; <label>:460                                     ; preds = %457
  %461 = load i32* %lrc, align 4
  %462 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %461)
  br label %463

; <label>:463                                     ; preds = %460, %457
  br label %464

; <label>:464                                     ; preds = %463, %449
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %465 = load i32* %ur, align 4
  %466 = load i32* %ul, align 4
  %467 = sub i32 %466, %465
  store i32 %467, i32* %ul, align 4
  %468 = load i32* %ul, align 4
  %469 = icmp ne i32 %468, 3
  br i1 %469, label %470, label %477

; <label>:470                                     ; preds = %464
  store i32 131, i32* %lrc, align 4
  %471 = load i32* %prlc, align 4
  %472 = icmp ne i32 %471, 0
  br i1 %472, label %473, label %476

; <label>:473                                     ; preds = %470
  %474 = load i32* %lrc, align 4
  %475 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %474)
  br label %476

; <label>:476                                     ; preds = %473, %470
  br label %477

; <label>:477                                     ; preds = %476, %464
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %478 = load float* %fr, align 4
  %479 = load i32* %ul, align 4
  %480 = uitofp i32 %479 to float
  %481 = fsub float %480, %478
  %482 = fptoui float %481 to i32
  store i32 %482, i32* %ul, align 4
  %483 = load i32* %ul, align 4
  %484 = icmp ne i32 %483, 3
  br i1 %484, label %485, label %492

; <label>:485                                     ; preds = %477
  store i32 132, i32* %lrc, align 4
  %486 = load i32* %prlc, align 4
  %487 = icmp ne i32 %486, 0
  br i1 %487, label %488, label %491

; <label>:488                                     ; preds = %485
  %489 = load i32* %lrc, align 4
  %490 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %489)
  br label %491

; <label>:491                                     ; preds = %488, %485
  br label %492

; <label>:492                                     ; preds = %491, %477
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %493 = load double* %dr, align 8
  %494 = load i32* %ul, align 4
  %495 = uitofp i32 %494 to double
  %496 = fsub double %495, %493
  %497 = fptoui double %496 to i32
  store i32 %497, i32* %ul, align 4
  %498 = load i32* %ul, align 4
  %499 = icmp ne i32 %498, 3
  br i1 %499, label %500, label %507

; <label>:500                                     ; preds = %492
  store i32 133, i32* %lrc, align 4
  %501 = load i32* %prlc, align 4
  %502 = icmp ne i32 %501, 0
  br i1 %502, label %503, label %506

; <label>:503                                     ; preds = %500
  %504 = load i32* %lrc, align 4
  %505 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %504)
  br label %506

; <label>:506                                     ; preds = %503, %500
  br label %507

; <label>:507                                     ; preds = %506, %492
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %508 = load i8* %cr, align 1
  %509 = sext i8 %508 to i32
  %510 = sitofp i32 %509 to float
  %511 = load float* %fl, align 4
  %512 = fsub float %511, %510
  store float %512, float* %fl, align 4
  %513 = load float* %fl, align 4
  %514 = fcmp une float %513, 3.000000e+00
  br i1 %514, label %515, label %522

; <label>:515                                     ; preds = %507
  store i32 134, i32* %lrc, align 4
  %516 = load i32* %prlc, align 4
  %517 = icmp ne i32 %516, 0
  br i1 %517, label %518, label %521

; <label>:518                                     ; preds = %515
  %519 = load i32* %lrc, align 4
  %520 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %519)
  br label %521

; <label>:521                                     ; preds = %518, %515
  br label %522

; <label>:522                                     ; preds = %521, %507
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %523 = load i16* %sr, align 2
  %524 = sext i16 %523 to i32
  %525 = sitofp i32 %524 to float
  %526 = load float* %fl, align 4
  %527 = fsub float %526, %525
  store float %527, float* %fl, align 4
  %528 = load float* %fl, align 4
  %529 = fcmp une float %528, 3.000000e+00
  br i1 %529, label %530, label %537

; <label>:530                                     ; preds = %522
  store i32 135, i32* %lrc, align 4
  %531 = load i32* %prlc, align 4
  %532 = icmp ne i32 %531, 0
  br i1 %532, label %533, label %536

; <label>:533                                     ; preds = %530
  %534 = load i32* %lrc, align 4
  %535 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %534)
  br label %536

; <label>:536                                     ; preds = %533, %530
  br label %537

; <label>:537                                     ; preds = %536, %522
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %538 = load i32* %ir, align 4
  %539 = sitofp i32 %538 to float
  %540 = load float* %fl, align 4
  %541 = fsub float %540, %539
  store float %541, float* %fl, align 4
  %542 = load float* %fl, align 4
  %543 = fcmp une float %542, 3.000000e+00
  br i1 %543, label %544, label %551

; <label>:544                                     ; preds = %537
  store i32 136, i32* %lrc, align 4
  %545 = load i32* %prlc, align 4
  %546 = icmp ne i32 %545, 0
  br i1 %546, label %547, label %550

; <label>:547                                     ; preds = %544
  %548 = load i32* %lrc, align 4
  %549 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %548)
  br label %550

; <label>:550                                     ; preds = %547, %544
  br label %551

; <label>:551                                     ; preds = %550, %537
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %552 = load i64* %lr, align 8
  %553 = sitofp i64 %552 to float
  %554 = load float* %fl, align 4
  %555 = fsub float %554, %553
  store float %555, float* %fl, align 4
  %556 = load float* %fl, align 4
  %557 = fcmp une float %556, 3.000000e+00
  br i1 %557, label %558, label %565

; <label>:558                                     ; preds = %551
  store i32 137, i32* %lrc, align 4
  %559 = load i32* %prlc, align 4
  %560 = icmp ne i32 %559, 0
  br i1 %560, label %561, label %564

; <label>:561                                     ; preds = %558
  %562 = load i32* %lrc, align 4
  %563 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %562)
  br label %564

; <label>:564                                     ; preds = %561, %558
  br label %565

; <label>:565                                     ; preds = %564, %551
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %566 = load i32* %ur, align 4
  %567 = uitofp i32 %566 to float
  %568 = load float* %fl, align 4
  %569 = fsub float %568, %567
  store float %569, float* %fl, align 4
  %570 = load float* %fl, align 4
  %571 = fcmp une float %570, 3.000000e+00
  br i1 %571, label %572, label %579

; <label>:572                                     ; preds = %565
  store i32 138, i32* %lrc, align 4
  %573 = load i32* %prlc, align 4
  %574 = icmp ne i32 %573, 0
  br i1 %574, label %575, label %578

; <label>:575                                     ; preds = %572
  %576 = load i32* %lrc, align 4
  %577 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %576)
  br label %578

; <label>:578                                     ; preds = %575, %572
  br label %579

; <label>:579                                     ; preds = %578, %565
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %580 = load float* %fr, align 4
  %581 = load float* %fl, align 4
  %582 = fsub float %581, %580
  store float %582, float* %fl, align 4
  %583 = load float* %fl, align 4
  %584 = fcmp une float %583, 3.000000e+00
  br i1 %584, label %585, label %592

; <label>:585                                     ; preds = %579
  store i32 139, i32* %lrc, align 4
  %586 = load i32* %prlc, align 4
  %587 = icmp ne i32 %586, 0
  br i1 %587, label %588, label %591

; <label>:588                                     ; preds = %585
  %589 = load i32* %lrc, align 4
  %590 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %589)
  br label %591

; <label>:591                                     ; preds = %588, %585
  br label %592

; <label>:592                                     ; preds = %591, %579
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %593 = load double* %dr, align 8
  %594 = load float* %fl, align 4
  %595 = fpext float %594 to double
  %596 = fsub double %595, %593
  %597 = fptrunc double %596 to float
  store float %597, float* %fl, align 4
  %598 = load float* %fl, align 4
  %599 = fcmp une float %598, 3.000000e+00
  br i1 %599, label %600, label %607

; <label>:600                                     ; preds = %592
  store i32 140, i32* %lrc, align 4
  %601 = load i32* %prlc, align 4
  %602 = icmp ne i32 %601, 0
  br i1 %602, label %603, label %606

; <label>:603                                     ; preds = %600
  %604 = load i32* %lrc, align 4
  %605 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %604)
  br label %606

; <label>:606                                     ; preds = %603, %600
  br label %607

; <label>:607                                     ; preds = %606, %592
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %608 = load i8* %cr, align 1
  %609 = sext i8 %608 to i32
  %610 = sitofp i32 %609 to double
  %611 = load double* %dl, align 8
  %612 = fsub double %611, %610
  store double %612, double* %dl, align 8
  %613 = load double* %dl, align 8
  %614 = fcmp une double %613, 3.000000e+00
  br i1 %614, label %615, label %622

; <label>:615                                     ; preds = %607
  store i32 141, i32* %lrc, align 4
  %616 = load i32* %prlc, align 4
  %617 = icmp ne i32 %616, 0
  br i1 %617, label %618, label %621

; <label>:618                                     ; preds = %615
  %619 = load i32* %lrc, align 4
  %620 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %619)
  br label %621

; <label>:621                                     ; preds = %618, %615
  br label %622

; <label>:622                                     ; preds = %621, %607
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %623 = load i16* %sr, align 2
  %624 = sext i16 %623 to i32
  %625 = sitofp i32 %624 to double
  %626 = load double* %dl, align 8
  %627 = fsub double %626, %625
  store double %627, double* %dl, align 8
  %628 = load double* %dl, align 8
  %629 = fcmp une double %628, 3.000000e+00
  br i1 %629, label %630, label %637

; <label>:630                                     ; preds = %622
  store i32 142, i32* %lrc, align 4
  %631 = load i32* %prlc, align 4
  %632 = icmp ne i32 %631, 0
  br i1 %632, label %633, label %636

; <label>:633                                     ; preds = %630
  %634 = load i32* %lrc, align 4
  %635 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %634)
  br label %636

; <label>:636                                     ; preds = %633, %630
  br label %637

; <label>:637                                     ; preds = %636, %622
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %638 = load i32* %ir, align 4
  %639 = sitofp i32 %638 to double
  %640 = load double* %dl, align 8
  %641 = fsub double %640, %639
  store double %641, double* %dl, align 8
  %642 = load double* %dl, align 8
  %643 = fcmp une double %642, 3.000000e+00
  br i1 %643, label %644, label %651

; <label>:644                                     ; preds = %637
  store i32 143, i32* %lrc, align 4
  %645 = load i32* %prlc, align 4
  %646 = icmp ne i32 %645, 0
  br i1 %646, label %647, label %650

; <label>:647                                     ; preds = %644
  %648 = load i32* %lrc, align 4
  %649 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %648)
  br label %650

; <label>:650                                     ; preds = %647, %644
  br label %651

; <label>:651                                     ; preds = %650, %637
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %652 = load i64* %lr, align 8
  %653 = sitofp i64 %652 to double
  %654 = load double* %dl, align 8
  %655 = fsub double %654, %653
  store double %655, double* %dl, align 8
  %656 = load double* %dl, align 8
  %657 = fcmp une double %656, 3.000000e+00
  br i1 %657, label %658, label %665

; <label>:658                                     ; preds = %651
  store i32 144, i32* %lrc, align 4
  %659 = load i32* %prlc, align 4
  %660 = icmp ne i32 %659, 0
  br i1 %660, label %661, label %664

; <label>:661                                     ; preds = %658
  %662 = load i32* %lrc, align 4
  %663 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %662)
  br label %664

; <label>:664                                     ; preds = %661, %658
  br label %665

; <label>:665                                     ; preds = %664, %651
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %666 = load i32* %ur, align 4
  %667 = uitofp i32 %666 to double
  %668 = load double* %dl, align 8
  %669 = fsub double %668, %667
  store double %669, double* %dl, align 8
  %670 = load double* %dl, align 8
  %671 = fcmp une double %670, 3.000000e+00
  br i1 %671, label %672, label %679

; <label>:672                                     ; preds = %665
  store i32 145, i32* %lrc, align 4
  %673 = load i32* %prlc, align 4
  %674 = icmp ne i32 %673, 0
  br i1 %674, label %675, label %678

; <label>:675                                     ; preds = %672
  %676 = load i32* %lrc, align 4
  %677 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %676)
  br label %678

; <label>:678                                     ; preds = %675, %672
  br label %679

; <label>:679                                     ; preds = %678, %665
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %680 = load float* %fr, align 4
  %681 = fpext float %680 to double
  %682 = load double* %dl, align 8
  %683 = fsub double %682, %681
  store double %683, double* %dl, align 8
  %684 = load double* %dl, align 8
  %685 = fcmp une double %684, 3.000000e+00
  br i1 %685, label %686, label %693

; <label>:686                                     ; preds = %679
  store i32 146, i32* %lrc, align 4
  %687 = load i32* %prlc, align 4
  %688 = icmp ne i32 %687, 0
  br i1 %688, label %689, label %692

; <label>:689                                     ; preds = %686
  %690 = load i32* %lrc, align 4
  %691 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %690)
  br label %692

; <label>:692                                     ; preds = %689, %686
  br label %693

; <label>:693                                     ; preds = %692, %679
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %694 = load double* %dr, align 8
  %695 = load double* %dl, align 8
  %696 = fsub double %695, %694
  store double %696, double* %dl, align 8
  %697 = load double* %dl, align 8
  %698 = fcmp une double %697, 3.000000e+00
  br i1 %698, label %699, label %706

; <label>:699                                     ; preds = %693
  store i32 147, i32* %lrc, align 4
  %700 = load i32* %prlc, align 4
  %701 = icmp ne i32 %700, 0
  br i1 %701, label %702, label %705

; <label>:702                                     ; preds = %699
  %703 = load i32* %lrc, align 4
  %704 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %703)
  br label %705

; <label>:705                                     ; preds = %702, %699
  br label %706

; <label>:706                                     ; preds = %705, %693
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %707 = load i8* %cr, align 1
  %708 = sext i8 %707 to i32
  %709 = load i8* %cl, align 1
  %710 = sext i8 %709 to i32
  %711 = mul nsw i32 %710, %708
  %712 = trunc i32 %711 to i8
  store i8 %712, i8* %cl, align 1
  %713 = load i8* %cl, align 1
  %714 = sext i8 %713 to i32
  %715 = icmp ne i32 %714, 10
  br i1 %715, label %716, label %723

; <label>:716                                     ; preds = %706
  store i32 148, i32* %lrc, align 4
  %717 = load i32* %prlc, align 4
  %718 = icmp ne i32 %717, 0
  br i1 %718, label %719, label %722

; <label>:719                                     ; preds = %716
  %720 = load i32* %lrc, align 4
  %721 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %720)
  br label %722

; <label>:722                                     ; preds = %719, %716
  br label %723

; <label>:723                                     ; preds = %722, %706
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %724 = load i16* %sr, align 2
  %725 = sext i16 %724 to i32
  %726 = load i8* %cl, align 1
  %727 = sext i8 %726 to i32
  %728 = mul nsw i32 %727, %725
  %729 = trunc i32 %728 to i8
  store i8 %729, i8* %cl, align 1
  %730 = load i8* %cl, align 1
  %731 = sext i8 %730 to i32
  %732 = icmp ne i32 %731, 10
  br i1 %732, label %733, label %740

; <label>:733                                     ; preds = %723
  store i32 149, i32* %lrc, align 4
  %734 = load i32* %prlc, align 4
  %735 = icmp ne i32 %734, 0
  br i1 %735, label %736, label %739

; <label>:736                                     ; preds = %733
  %737 = load i32* %lrc, align 4
  %738 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %737)
  br label %739

; <label>:739                                     ; preds = %736, %733
  br label %740

; <label>:740                                     ; preds = %739, %723
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %741 = load i32* %ir, align 4
  %742 = load i8* %cl, align 1
  %743 = sext i8 %742 to i32
  %744 = mul nsw i32 %743, %741
  %745 = trunc i32 %744 to i8
  store i8 %745, i8* %cl, align 1
  %746 = load i8* %cl, align 1
  %747 = sext i8 %746 to i32
  %748 = icmp ne i32 %747, 10
  br i1 %748, label %749, label %756

; <label>:749                                     ; preds = %740
  store i32 150, i32* %lrc, align 4
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
