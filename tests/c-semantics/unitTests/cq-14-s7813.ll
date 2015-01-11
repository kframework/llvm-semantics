; ModuleID = './cq-14-s7813.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@setupTable.s = internal global [18 x i8] c"%3d bits in %ss.\0A\00", align 16
@setupTable.s2 = internal global [54 x i8] c"%f is the least number that can be added to 1. (%s).\0A\00", align 16
@svtest.k = internal global i32 0, align 4
@zero.k = internal global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.fl = internal global [17 x i8] c"Local error %d.\0A\00", align 16
@sec.s7813er = internal global [12 x i8] c"s7813,er%d\0A\00", align 1
@sec.qs7813 = internal global [8 x i8] c"s7813  \00", align 1
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
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %r = alloca i32, align 4
  %zero = alloca i32, align 4
  %one = alloca i32, align 4
  %rc = alloca i32, align 4
  %ps = alloca i8*, align 8
  %pt = alloca i8*, align 8
  store %struct.defs* %pd0, %struct.defs** %1, align 8
  store i8* getelementptr inbounds ([8 x i8]* @sec.qs7813, i32 0, i32 0), i8** %ps, align 8
  %2 = load %struct.defs** %1, align 8
  %3 = getelementptr inbounds %struct.defs* %2, i32 0, i32 15
  %4 = getelementptr inbounds [8 x i8]* %3, i32 0, i32 0
  store i8* %4, i8** %pt, align 8
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %rc, align 4
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
  %17 = load i32* %lrc, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %29

; <label>:19                                      ; preds = %16
  %20 = load %struct.defs** %1, align 8
  %21 = getelementptr inbounds %struct.defs* %20, i32 0, i32 11
  %22 = load i32* %21, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24                                      ; preds = %19
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 1)
  br label %26

; <label>:26                                      ; preds = %24, %19
  %27 = load i32* %rc, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %rc, align 4
  br label %29

; <label>:29                                      ; preds = %26, %16
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  %30 = load i32* %i, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %i, align 4
  %32 = icmp ne i32 %30, 0
  br i1 %32, label %33, label %37

; <label>:33                                      ; preds = %29
  %34 = load i32* %j, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %j, align 4
  %36 = icmp ne i32 %34, 0
  br label %37

; <label>:37                                      ; preds = %33, %29
  %38 = phi i1 [ false, %29 ], [ %36, %33 ]
  %39 = zext i1 %38 to i32
  store i32 %39, i32* %r, align 4
  %40 = load i32* %i, align 4
  %41 = icmp ne i32 %40, 1
  br i1 %41, label %42, label %49

; <label>:42                                      ; preds = %37
  store i32 1, i32* %lrc, align 4
  %43 = load i32* %prlc, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %48

; <label>:45                                      ; preds = %42
  %46 = load i32* %lrc, align 4
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %46)
  br label %48

; <label>:48                                      ; preds = %45, %42
  br label %49

; <label>:49                                      ; preds = %48, %37
  %50 = load i32* %j, align 4
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %59

; <label>:52                                      ; preds = %49
  store i32 2, i32* %lrc, align 4
  %53 = load i32* %prlc, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %58

; <label>:55                                      ; preds = %52
  %56 = load i32* %lrc, align 4
  %57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %56)
  br label %58

; <label>:58                                      ; preds = %55, %52
  br label %59

; <label>:59                                      ; preds = %58, %49
  %60 = load i32* %r, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %69

; <label>:62                                      ; preds = %59
  store i32 3, i32* %lrc, align 4
  %63 = load i32* %prlc, align 4
  %64 = icmp ne i32 %63, 0
  br i1 %64, label %65, label %68

; <label>:65                                      ; preds = %62
  %66 = load i32* %lrc, align 4
  %67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %66)
  br label %68

; <label>:68                                      ; preds = %65, %62
  br label %69

; <label>:69                                      ; preds = %68, %59
  %70 = load i32* %i, align 4
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %76

; <label>:72                                      ; preds = %69
  %73 = load i32* %j, align 4
  %74 = add nsw i32 %73, 1
  store i32 %74, i32* %j, align 4
  %75 = icmp ne i32 %73, 0
  br label %76

; <label>:76                                      ; preds = %72, %69
  %77 = phi i1 [ false, %69 ], [ %75, %72 ]
  %78 = zext i1 %77 to i32
  store i32 %78, i32* %r, align 4
  %79 = load i32* %i, align 4
  %80 = icmp ne i32 %79, 1
  br i1 %80, label %81, label %88

; <label>:81                                      ; preds = %76
  store i32 4, i32* %lrc, align 4
  %82 = load i32* %prlc, align 4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %87

; <label>:84                                      ; preds = %81
  %85 = load i32* %lrc, align 4
  %86 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %85)
  br label %87

; <label>:87                                      ; preds = %84, %81
  br label %88

; <label>:88                                      ; preds = %87, %76
  %89 = load i32* %j, align 4
  %90 = icmp ne i32 %89, 1
  br i1 %90, label %91, label %98

; <label>:91                                      ; preds = %88
  store i32 5, i32* %lrc, align 4
  %92 = load i32* %prlc, align 4
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %94, label %97

; <label>:94                                      ; preds = %91
  %95 = load i32* %lrc, align 4
  %96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %95)
  br label %97

; <label>:97                                      ; preds = %94, %91
  br label %98

; <label>:98                                      ; preds = %97, %88
  %99 = load i32* %r, align 4
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %101, label %108

; <label>:101                                     ; preds = %98
  store i32 6, i32* %lrc, align 4
  %102 = load i32* %prlc, align 4
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %104, label %107

; <label>:104                                     ; preds = %101
  %105 = load i32* %lrc, align 4
  %106 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %105)
  br label %107

; <label>:107                                     ; preds = %104, %101
  br label %108

; <label>:108                                     ; preds = %107, %98
  %109 = load i32* %i, align 4
  %110 = add nsw i32 %109, -1
  store i32 %110, i32* %i, align 4
  %111 = icmp ne i32 %109, 0
  br i1 %111, label %112, label %115

; <label>:112                                     ; preds = %108
  %113 = load i32* %j, align 4
  %114 = icmp ne i32 %113, 0
  br label %115

; <label>:115                                     ; preds = %112, %108
  %116 = phi i1 [ false, %108 ], [ %114, %112 ]
  %117 = zext i1 %116 to i32
  store i32 %117, i32* %r, align 4
  %118 = load i32* %i, align 4
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %120, label %127

; <label>:120                                     ; preds = %115
  store i32 7, i32* %lrc, align 4
  %121 = load i32* %prlc, align 4
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %123, label %126

; <label>:123                                     ; preds = %120
  %124 = load i32* %lrc, align 4
  %125 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %124)
  br label %126

; <label>:126                                     ; preds = %123, %120
  br label %127

; <label>:127                                     ; preds = %126, %115
  %128 = load i32* %j, align 4
  %129 = icmp ne i32 %128, 1
  br i1 %129, label %130, label %137

; <label>:130                                     ; preds = %127
  store i32 8, i32* %lrc, align 4
  %131 = load i32* %prlc, align 4
  %132 = icmp ne i32 %131, 0
  br i1 %132, label %133, label %136

; <label>:133                                     ; preds = %130
  %134 = load i32* %lrc, align 4
  %135 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %134)
  br label %136

; <label>:136                                     ; preds = %133, %130
  br label %137

; <label>:137                                     ; preds = %136, %127
  %138 = load i32* %r, align 4
  %139 = icmp ne i32 %138, 1
  br i1 %139, label %140, label %147

; <label>:140                                     ; preds = %137
  store i32 9, i32* %lrc, align 4
  %141 = load i32* %prlc, align 4
  %142 = icmp ne i32 %141, 0
  br i1 %142, label %143, label %146

; <label>:143                                     ; preds = %140
  %144 = load i32* %lrc, align 4
  %145 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %144)
  br label %146

; <label>:146                                     ; preds = %143, %140
  br label %147

; <label>:147                                     ; preds = %146, %137
  %148 = load i32* %i, align 4
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %150, label %154

; <label>:150                                     ; preds = %147
  %151 = load i32* %j, align 4
  %152 = add nsw i32 %151, -1
  store i32 %152, i32* %j, align 4
  %153 = icmp ne i32 %151, 0
  br label %154

; <label>:154                                     ; preds = %150, %147
  %155 = phi i1 [ false, %147 ], [ %153, %150 ]
  %156 = zext i1 %155 to i32
  store i32 %156, i32* %r, align 4
  %157 = load i32* %i, align 4
  %158 = icmp ne i32 %157, 0
  br i1 %158, label %159, label %166

; <label>:159                                     ; preds = %154
  store i32 10, i32* %lrc, align 4
  %160 = load i32* %prlc, align 4
  %161 = icmp ne i32 %160, 0
  br i1 %161, label %162, label %165

; <label>:162                                     ; preds = %159
  %163 = load i32* %lrc, align 4
  %164 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %163)
  br label %165

; <label>:165                                     ; preds = %162, %159
  br label %166

; <label>:166                                     ; preds = %165, %154
  %167 = load i32* %j, align 4
  %168 = icmp ne i32 %167, 1
  br i1 %168, label %169, label %176

; <label>:169                                     ; preds = %166
  store i32 11, i32* %lrc, align 4
  %170 = load i32* %prlc, align 4
  %171 = icmp ne i32 %170, 0
  br i1 %171, label %172, label %175

; <label>:172                                     ; preds = %169
  %173 = load i32* %lrc, align 4
  %174 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %173)
  br label %175

; <label>:175                                     ; preds = %172, %169
  br label %176

; <label>:176                                     ; preds = %175, %166
  %177 = load i32* %r, align 4
  %178 = icmp ne i32 %177, 0
  br i1 %178, label %179, label %186

; <label>:179                                     ; preds = %176
  store i32 12, i32* %lrc, align 4
  %180 = load i32* %prlc, align 4
  %181 = icmp ne i32 %180, 0
  br i1 %181, label %182, label %185

; <label>:182                                     ; preds = %179
  %183 = load i32* %lrc, align 4
  %184 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %183)
  br label %185

; <label>:185                                     ; preds = %182, %179
  br label %186

; <label>:186                                     ; preds = %185, %176
  %187 = load i32* %lrc, align 4
  %188 = icmp ne i32 %187, 0
  br i1 %188, label %189, label %199

; <label>:189                                     ; preds = %186
  %190 = load %struct.defs** %1, align 8
  %191 = getelementptr inbounds %struct.defs* %190, i32 0, i32 11
  %192 = load i32* %191, align 4
  %193 = icmp ne i32 %192, 0
  br i1 %193, label %194, label %196

; <label>:194                                     ; preds = %189
  %195 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 2)
  br label %196

; <label>:196                                     ; preds = %194, %189
  %197 = load i32* %rc, align 4
  %198 = add nsw i32 %197, 2
  store i32 %198, i32* %rc, align 4
  br label %199

; <label>:199                                     ; preds = %196, %186
  store i32 0, i32* %lrc, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  %200 = load i32* %i, align 4
  %201 = add nsw i32 %200, 1
  store i32 %201, i32* %i, align 4
  %202 = icmp ne i32 %200, 0
  br i1 %202, label %206, label %203

; <label>:203                                     ; preds = %199
  %204 = load i32* %j, align 4
  %205 = icmp ne i32 %204, 0
  br label %206

; <label>:206                                     ; preds = %203, %199
  %207 = phi i1 [ true, %199 ], [ %205, %203 ]
  %208 = zext i1 %207 to i32
  store i32 %208, i32* %r, align 4
  %209 = load i32* %i, align 4
  %210 = icmp ne i32 %209, 1
  br i1 %210, label %211, label %218

; <label>:211                                     ; preds = %206
  store i32 1, i32* %lrc, align 4
  %212 = load i32* %prlc, align 4
  %213 = icmp ne i32 %212, 0
  br i1 %213, label %214, label %217

; <label>:214                                     ; preds = %211
  %215 = load i32* %lrc, align 4
  %216 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %215)
  br label %217

; <label>:217                                     ; preds = %214, %211
  br label %218

; <label>:218                                     ; preds = %217, %206
  %219 = load i32* %j, align 4
  %220 = icmp ne i32 %219, 0
  br i1 %220, label %221, label %228

; <label>:221                                     ; preds = %218
  store i32 2, i32* %lrc, align 4
  %222 = load i32* %prlc, align 4
  %223 = icmp ne i32 %222, 0
  br i1 %223, label %224, label %227

; <label>:224                                     ; preds = %221
  %225 = load i32* %lrc, align 4
  %226 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %225)
  br label %227

; <label>:227                                     ; preds = %224, %221
  br label %228

; <label>:228                                     ; preds = %227, %218
  %229 = load i32* %r, align 4
  %230 = icmp ne i32 %229, 0
  br i1 %230, label %231, label %238

; <label>:231                                     ; preds = %228
  store i32 3, i32* %lrc, align 4
  %232 = load i32* %prlc, align 4
  %233 = icmp ne i32 %232, 0
  br i1 %233, label %234, label %237

; <label>:234                                     ; preds = %231
  %235 = load i32* %lrc, align 4
  %236 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %235)
  br label %237

; <label>:237                                     ; preds = %234, %231
  br label %238

; <label>:238                                     ; preds = %237, %228
  %239 = load i32* %j, align 4
  %240 = add nsw i32 %239, 1
  store i32 %240, i32* %j, align 4
  %241 = icmp ne i32 %239, 0
  br i1 %241, label %245, label %242

; <label>:242                                     ; preds = %238
  %243 = load i32* %i, align 4
  %244 = icmp ne i32 %243, 0
  br label %245

; <label>:245                                     ; preds = %242, %238
  %246 = phi i1 [ true, %238 ], [ %244, %242 ]
  %247 = zext i1 %246 to i32
  store i32 %247, i32* %r, align 4
  %248 = load i32* %i, align 4
  %249 = icmp ne i32 %248, 1
  br i1 %249, label %250, label %257

; <label>:250                                     ; preds = %245
  store i32 4, i32* %lrc, align 4
  %251 = load i32* %prlc, align 4
  %252 = icmp ne i32 %251, 0
  br i1 %252, label %253, label %256

; <label>:253                                     ; preds = %250
  %254 = load i32* %lrc, align 4
  %255 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %254)
  br label %256

; <label>:256                                     ; preds = %253, %250
  br label %257

; <label>:257                                     ; preds = %256, %245
  %258 = load i32* %j, align 4
  %259 = icmp ne i32 %258, 1
  br i1 %259, label %260, label %267

; <label>:260                                     ; preds = %257
  store i32 5, i32* %lrc, align 4
  %261 = load i32* %prlc, align 4
  %262 = icmp ne i32 %261, 0
  br i1 %262, label %263, label %266

; <label>:263                                     ; preds = %260
  %264 = load i32* %lrc, align 4
  %265 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %264)
  br label %266

; <label>:266                                     ; preds = %263, %260
  br label %267

; <label>:267                                     ; preds = %266, %257
  %268 = load i32* %r, align 4
  %269 = icmp ne i32 %268, 1
  br i1 %269, label %270, label %277

; <label>:270                                     ; preds = %267
  store i32 6, i32* %lrc, align 4
  %271 = load i32* %prlc, align 4
  %272 = icmp ne i32 %271, 0
  br i1 %272, label %273, label %276

; <label>:273                                     ; preds = %270
  %274 = load i32* %lrc, align 4
  %275 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %274)
  br label %276

; <label>:276                                     ; preds = %273, %270
  br label %277

; <label>:277                                     ; preds = %276, %267
  %278 = load i32* %i, align 4
  %279 = add nsw i32 %278, -1
  store i32 %279, i32* %i, align 4
  %280 = icmp ne i32 %278, 0
  br i1 %280, label %285, label %281

; <label>:281                                     ; preds = %277
  %282 = load i32* %j, align 4
  %283 = add nsw i32 %282, -1
  store i32 %283, i32* %j, align 4
  %284 = icmp ne i32 %282, 0
  br label %285

; <label>:285                                     ; preds = %281, %277
  %286 = phi i1 [ true, %277 ], [ %284, %281 ]
  %287 = zext i1 %286 to i32
  store i32 %287, i32* %r, align 4
  %288 = load i32* %i, align 4
  %289 = icmp ne i32 %288, 0
  br i1 %289, label %290, label %297

; <label>:290                                     ; preds = %285
  store i32 7, i32* %lrc, align 4
  %291 = load i32* %prlc, align 4
  %292 = icmp ne i32 %291, 0
  br i1 %292, label %293, label %296

; <label>:293                                     ; preds = %290
  %294 = load i32* %lrc, align 4
  %295 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %294)
  br label %296

; <label>:296                                     ; preds = %293, %290
  br label %297

; <label>:297                                     ; preds = %296, %285
  %298 = load i32* %j, align 4
  %299 = icmp ne i32 %298, 1
  br i1 %299, label %300, label %307

; <label>:300                                     ; preds = %297
  store i32 8, i32* %lrc, align 4
  %301 = load i32* %prlc, align 4
  %302 = icmp ne i32 %301, 0
  br i1 %302, label %303, label %306

; <label>:303                                     ; preds = %300
  %304 = load i32* %lrc, align 4
  %305 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %304)
  br label %306

; <label>:306                                     ; preds = %303, %300
  br label %307

; <label>:307                                     ; preds = %306, %297
  %308 = load i32* %r, align 4
  %309 = icmp ne i32 %308, 1
  br i1 %309, label %310, label %317

; <label>:310                                     ; preds = %307
  store i32 9, i32* %lrc, align 4
  %311 = load i32* %prlc, align 4
  %312 = icmp ne i32 %311, 0
  br i1 %312, label %313, label %316

; <label>:313                                     ; preds = %310
  %314 = load i32* %lrc, align 4
  %315 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %314)
  br label %316

; <label>:316                                     ; preds = %313, %310
  br label %317

; <label>:317                                     ; preds = %316, %307
  %318 = load i32* %i, align 4
  %319 = icmp ne i32 %318, 0
  br i1 %319, label %324, label %320

; <label>:320                                     ; preds = %317
  %321 = load i32* %j, align 4
  %322 = add nsw i32 %321, -1
  store i32 %322, i32* %j, align 4
  %323 = icmp ne i32 %321, 0
  br label %324

; <label>:324                                     ; preds = %320, %317
  %325 = phi i1 [ true, %317 ], [ %323, %320 ]
  %326 = zext i1 %325 to i32
  store i32 %326, i32* %r, align 4
  %327 = load i32* %i, align 4
  %328 = icmp ne i32 %327, 0
  br i1 %328, label %329, label %336

; <label>:329                                     ; preds = %324
  store i32 10, i32* %lrc, align 4
  %330 = load i32* %prlc, align 4
  %331 = icmp ne i32 %330, 0
  br i1 %331, label %332, label %335

; <label>:332                                     ; preds = %329
  %333 = load i32* %lrc, align 4
  %334 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %333)
  br label %335

; <label>:335                                     ; preds = %332, %329
  br label %336

; <label>:336                                     ; preds = %335, %324
  %337 = load i32* %j, align 4
  %338 = icmp ne i32 %337, 0
  br i1 %338, label %339, label %346

; <label>:339                                     ; preds = %336
  store i32 11, i32* %lrc, align 4
  %340 = load i32* %prlc, align 4
  %341 = icmp ne i32 %340, 0
  br i1 %341, label %342, label %345

; <label>:342                                     ; preds = %339
  %343 = load i32* %lrc, align 4
  %344 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %343)
  br label %345

; <label>:345                                     ; preds = %342, %339
  br label %346

; <label>:346                                     ; preds = %345, %336
  %347 = load i32* %r, align 4
  %348 = icmp ne i32 %347, 1
  br i1 %348, label %349, label %356

; <label>:349                                     ; preds = %346
  store i32 12, i32* %lrc, align 4
  %350 = load i32* %prlc, align 4
  %351 = icmp ne i32 %350, 0
  br i1 %351, label %352, label %355

; <label>:352                                     ; preds = %349
  %353 = load i32* %lrc, align 4
  %354 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.fl, i32 0, i32 0), i32 %353)
  br label %355

; <label>:355                                     ; preds = %352, %349
  br label %356

; <label>:356                                     ; preds = %355, %346
  %357 = load i32* %lrc, align 4
  %358 = icmp ne i32 %357, 0
  br i1 %358, label %359, label %369

; <label>:359                                     ; preds = %356
  %360 = load %struct.defs** %1, align 8
  %361 = getelementptr inbounds %struct.defs* %360, i32 0, i32 11
  %362 = load i32* %361, align 4
  %363 = icmp ne i32 %362, 0
  br i1 %363, label %364, label %366

; <label>:364                                     ; preds = %359
  %365 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 4)
  br label %366

; <label>:366                                     ; preds = %364, %359
  %367 = load i32* %rc, align 4
  %368 = add nsw i32 %367, 4
  store i32 %368, i32* %rc, align 4
  br label %369

; <label>:369                                     ; preds = %366, %356
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %zero, align 4
  store i32 1, i32* %one, align 4
  %370 = load i32* %one, align 4
  %371 = icmp ne i32 %370, 0
  br i1 %371, label %372, label %374

; <label>:372                                     ; preds = %369
  %373 = load i32* %zero, align 4
  br label %385

; <label>:374                                     ; preds = %369
  %375 = load i32* %one, align 4
  %376 = icmp ne i32 %375, 0
  br i1 %376, label %377, label %380

; <label>:377                                     ; preds = %374
  %378 = load i32* %i, align 4
  %379 = add nsw i32 %378, 1
  store i32 %379, i32* %i, align 4
  br label %383

; <label>:380                                     ; preds = %374
  %381 = load i32* %j, align 4
  %382 = add nsw i32 %381, 1
  store i32 %382, i32* %j, align 4
  br label %383

; <label>:383                                     ; preds = %380, %377
  %384 = phi i32 [ %378, %377 ], [ %381, %380 ]
  br label %385

; <label>:385                                     ; preds = %383, %372
  %386 = phi i32 [ %373, %372 ], [ %384, %383 ]
  store i32 %386, i32* %r, align 4
  %387 = load i32* %r, align 4
  %388 = icmp ne i32 %387, 0
  br i1 %388, label %395, label %389

; <label>:389                                     ; preds = %385
  %390 = load i32* %i, align 4
  %391 = icmp ne i32 %390, 0
  br i1 %391, label %395, label %392

; <label>:392                                     ; preds = %389
  %393 = load i32* %j, align 4
  %394 = icmp ne i32 %393, 0
  br i1 %394, label %395, label %405

; <label>:395                                     ; preds = %392, %389, %385
  %396 = load %struct.defs** %1, align 8
  %397 = getelementptr inbounds %struct.defs* %396, i32 0, i32 11
  %398 = load i32* %397, align 4
  %399 = icmp ne i32 %398, 0
  br i1 %399, label %400, label %402

; <label>:400                                     ; preds = %395
  %401 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 8)
  br label %402

; <label>:402                                     ; preds = %400, %395
  %403 = load i32* %rc, align 4
  %404 = add nsw i32 %403, 8
  store i32 %404, i32* %rc, align 4
  br label %405

; <label>:405                                     ; preds = %402, %392
  %406 = load i32* %one, align 4
  %407 = icmp ne i32 %406, 0
  br i1 %407, label %408, label %410

; <label>:408                                     ; preds = %405
  %409 = load i32* %zero, align 4
  br label %411

; <label>:410                                     ; preds = %405
  br label %411

; <label>:411                                     ; preds = %410, %408
  %412 = phi i32 [ %409, %408 ], [ 1, %410 ]
  %413 = icmp ne i32 %412, 0
  br i1 %413, label %423, label %414

; <label>:414                                     ; preds = %411
  %415 = load i32* %zero, align 4
  %416 = icmp ne i32 %415, 0
  br i1 %416, label %417, label %418

; <label>:417                                     ; preds = %414
  br label %420

; <label>:418                                     ; preds = %414
  %419 = load i32* %zero, align 4
  br label %420

; <label>:420                                     ; preds = %418, %417
  %421 = phi i32 [ 1, %417 ], [ %419, %418 ]
  %422 = icmp ne i32 %421, 0
  br i1 %422, label %423, label %433

; <label>:423                                     ; preds = %420, %411
  %424 = load %struct.defs** %1, align 8
  %425 = getelementptr inbounds %struct.defs* %424, i32 0, i32 11
  %426 = load i32* %425, align 4
  %427 = icmp ne i32 %426, 0
  br i1 %427, label %428, label %430

; <label>:428                                     ; preds = %423
  %429 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @sec.s7813er, i32 0, i32 0), i32 16)
  br label %430

; <label>:430                                     ; preds = %428, %423
  %431 = load i32* %rc, align 4
  %432 = add nsw i32 %431, 16
  store i32 %432, i32* %rc, align 4
  br label %433

; <label>:433                                     ; preds = %430, %420
  %434 = load i32* %rc, align 4
  ret i32 %434
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
