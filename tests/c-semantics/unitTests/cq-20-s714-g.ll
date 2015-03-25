; ModuleID = './cq-20-s714-g.c'
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
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %17 = load i8* %cr, align 1
  %18 = sext i8 %17 to i32
  %19 = load i16* %sl, align 2
  %20 = sext i16 %19 to i32
  %21 = shl i32 %20, %18
  %22 = trunc i32 %21 to i16
  store i16 %22, i16* %sl, align 2
  %23 = load i16* %sl, align 2
  %24 = sext i16 %23 to i32
  %25 = icmp ne i32 %24, 20
  br i1 %25, label %26, label %33

; <label>:26                                      ; preds = %16
  store i32 301, i32* %lrc, align 4
  %27 = load i32* %prlc, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %26
  %30 = load i32* %lrc, align 4
  %31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %30)
  br label %32

; <label>:32                                      ; preds = %29, %26
  br label %33

; <label>:33                                      ; preds = %32, %16
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %34 = load i16* %sr, align 2
  %35 = sext i16 %34 to i32
  %36 = load i16* %sl, align 2
  %37 = sext i16 %36 to i32
  %38 = shl i32 %37, %35
  %39 = trunc i32 %38 to i16
  store i16 %39, i16* %sl, align 2
  %40 = load i16* %sl, align 2
  %41 = sext i16 %40 to i32
  %42 = icmp ne i32 %41, 20
  br i1 %42, label %43, label %50

; <label>:43                                      ; preds = %33
  store i32 302, i32* %lrc, align 4
  %44 = load i32* %prlc, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %49

; <label>:46                                      ; preds = %43
  %47 = load i32* %lrc, align 4
  %48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %47)
  br label %49

; <label>:49                                      ; preds = %46, %43
  br label %50

; <label>:50                                      ; preds = %49, %33
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %51 = load i32* %ir, align 4
  %52 = load i16* %sl, align 2
  %53 = sext i16 %52 to i32
  %54 = shl i32 %53, %51
  %55 = trunc i32 %54 to i16
  store i16 %55, i16* %sl, align 2
  %56 = load i16* %sl, align 2
  %57 = sext i16 %56 to i32
  %58 = icmp ne i32 %57, 20
  br i1 %58, label %59, label %66

; <label>:59                                      ; preds = %50
  store i32 303, i32* %lrc, align 4
  %60 = load i32* %prlc, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %65

; <label>:62                                      ; preds = %59
  %63 = load i32* %lrc, align 4
  %64 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %63)
  br label %65

; <label>:65                                      ; preds = %62, %59
  br label %66

; <label>:66                                      ; preds = %65, %50
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %67 = load i64* %lr, align 8
  %68 = load i16* %sl, align 2
  %69 = sext i16 %68 to i32
  %70 = trunc i64 %67 to i32
  %71 = shl i32 %69, %70
  %72 = trunc i32 %71 to i16
  store i16 %72, i16* %sl, align 2
  %73 = load i16* %sl, align 2
  %74 = sext i16 %73 to i32
  %75 = icmp ne i32 %74, 20
  br i1 %75, label %76, label %83

; <label>:76                                      ; preds = %66
  store i32 304, i32* %lrc, align 4
  %77 = load i32* %prlc, align 4
  %78 = icmp ne i32 %77, 0
  br i1 %78, label %79, label %82

; <label>:79                                      ; preds = %76
  %80 = load i32* %lrc, align 4
  %81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %80)
  br label %82

; <label>:82                                      ; preds = %79, %76
  br label %83

; <label>:83                                      ; preds = %82, %66
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %84 = load i32* %ur, align 4
  %85 = load i16* %sl, align 2
  %86 = sext i16 %85 to i32
  %87 = shl i32 %86, %84
  %88 = trunc i32 %87 to i16
  store i16 %88, i16* %sl, align 2
  %89 = load i16* %sl, align 2
  %90 = sext i16 %89 to i32
  %91 = icmp ne i32 %90, 20
  br i1 %91, label %92, label %99

; <label>:92                                      ; preds = %83
  store i32 305, i32* %lrc, align 4
  %93 = load i32* %prlc, align 4
  %94 = icmp ne i32 %93, 0
  br i1 %94, label %95, label %98

; <label>:95                                      ; preds = %92
  %96 = load i32* %lrc, align 4
  %97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %96)
  br label %98

; <label>:98                                      ; preds = %95, %92
  br label %99

; <label>:99                                      ; preds = %98, %83
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %100 = load i8* %cr, align 1
  %101 = sext i8 %100 to i32
  %102 = load i32* %il, align 4
  %103 = shl i32 %102, %101
  store i32 %103, i32* %il, align 4
  %104 = load i32* %il, align 4
  %105 = icmp ne i32 %104, 20
  br i1 %105, label %106, label %113

; <label>:106                                     ; preds = %99
  store i32 306, i32* %lrc, align 4
  %107 = load i32* %prlc, align 4
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %112

; <label>:109                                     ; preds = %106
  %110 = load i32* %lrc, align 4
  %111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %110)
  br label %112

; <label>:112                                     ; preds = %109, %106
  br label %113

; <label>:113                                     ; preds = %112, %99
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %114 = load i16* %sr, align 2
  %115 = sext i16 %114 to i32
  %116 = load i32* %il, align 4
  %117 = shl i32 %116, %115
  store i32 %117, i32* %il, align 4
  %118 = load i32* %il, align 4
  %119 = icmp ne i32 %118, 20
  br i1 %119, label %120, label %127

; <label>:120                                     ; preds = %113
  store i32 307, i32* %lrc, align 4
  %121 = load i32* %prlc, align 4
  %122 = icmp ne i32 %121, 0
  br i1 %122, label %123, label %126

; <label>:123                                     ; preds = %120
  %124 = load i32* %lrc, align 4
  %125 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %124)
  br label %126

; <label>:126                                     ; preds = %123, %120
  br label %127

; <label>:127                                     ; preds = %126, %113
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %128 = load i32* %ir, align 4
  %129 = load i32* %il, align 4
  %130 = shl i32 %129, %128
  store i32 %130, i32* %il, align 4
  %131 = load i32* %il, align 4
  %132 = icmp ne i32 %131, 20
  br i1 %132, label %133, label %140

; <label>:133                                     ; preds = %127
  store i32 308, i32* %lrc, align 4
  %134 = load i32* %prlc, align 4
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %136, label %139

; <label>:136                                     ; preds = %133
  %137 = load i32* %lrc, align 4
  %138 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %137)
  br label %139

; <label>:139                                     ; preds = %136, %133
  br label %140

; <label>:140                                     ; preds = %139, %127
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %141 = load i64* %lr, align 8
  %142 = load i32* %il, align 4
  %143 = trunc i64 %141 to i32
  %144 = shl i32 %142, %143
  store i32 %144, i32* %il, align 4
  %145 = load i32* %il, align 4
  %146 = icmp ne i32 %145, 20
  br i1 %146, label %147, label %154

; <label>:147                                     ; preds = %140
  store i32 309, i32* %lrc, align 4
  %148 = load i32* %prlc, align 4
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %150, label %153

; <label>:150                                     ; preds = %147
  %151 = load i32* %lrc, align 4
  %152 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %151)
  br label %153

; <label>:153                                     ; preds = %150, %147
  br label %154

; <label>:154                                     ; preds = %153, %140
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %155 = load i32* %ur, align 4
  %156 = load i32* %il, align 4
  %157 = shl i32 %156, %155
  store i32 %157, i32* %il, align 4
  %158 = load i32* %il, align 4
  %159 = icmp ne i32 %158, 20
  br i1 %159, label %160, label %167

; <label>:160                                     ; preds = %154
  store i32 310, i32* %lrc, align 4
  %161 = load i32* %prlc, align 4
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %163, label %166

; <label>:163                                     ; preds = %160
  %164 = load i32* %lrc, align 4
  %165 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %164)
  br label %166

; <label>:166                                     ; preds = %163, %160
  br label %167

; <label>:167                                     ; preds = %166, %154
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %168 = load i8* %cr, align 1
  %169 = sext i8 %168 to i32
  %170 = load i64* %ll, align 8
  %171 = zext i32 %169 to i64
  %172 = shl i64 %170, %171
  store i64 %172, i64* %ll, align 8
  %173 = load i64* %ll, align 8
  %174 = icmp ne i64 %173, 20
  br i1 %174, label %175, label %182

; <label>:175                                     ; preds = %167
  store i32 311, i32* %lrc, align 4
  %176 = load i32* %prlc, align 4
  %177 = icmp ne i32 %176, 0
  br i1 %177, label %178, label %181

; <label>:178                                     ; preds = %175
  %179 = load i32* %lrc, align 4
  %180 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %179)
  br label %181

; <label>:181                                     ; preds = %178, %175
  br label %182

; <label>:182                                     ; preds = %181, %167
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %183 = load i16* %sr, align 2
  %184 = sext i16 %183 to i32
  %185 = load i64* %ll, align 8
  %186 = zext i32 %184 to i64
  %187 = shl i64 %185, %186
  store i64 %187, i64* %ll, align 8
  %188 = load i64* %ll, align 8
  %189 = icmp ne i64 %188, 20
  br i1 %189, label %190, label %197

; <label>:190                                     ; preds = %182
  store i32 312, i32* %lrc, align 4
  %191 = load i32* %prlc, align 4
  %192 = icmp ne i32 %191, 0
  br i1 %192, label %193, label %196

; <label>:193                                     ; preds = %190
  %194 = load i32* %lrc, align 4
  %195 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %194)
  br label %196

; <label>:196                                     ; preds = %193, %190
  br label %197

; <label>:197                                     ; preds = %196, %182
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %198 = load i32* %ir, align 4
  %199 = load i64* %ll, align 8
  %200 = zext i32 %198 to i64
  %201 = shl i64 %199, %200
  store i64 %201, i64* %ll, align 8
  %202 = load i64* %ll, align 8
  %203 = icmp ne i64 %202, 20
  br i1 %203, label %204, label %211

; <label>:204                                     ; preds = %197
  store i32 313, i32* %lrc, align 4
  %205 = load i32* %prlc, align 4
  %206 = icmp ne i32 %205, 0
  br i1 %206, label %207, label %210

; <label>:207                                     ; preds = %204
  %208 = load i32* %lrc, align 4
  %209 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %208)
  br label %210

; <label>:210                                     ; preds = %207, %204
  br label %211

; <label>:211                                     ; preds = %210, %197
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %212 = load i64* %lr, align 8
  %213 = load i64* %ll, align 8
  %214 = shl i64 %213, %212
  store i64 %214, i64* %ll, align 8
  %215 = load i64* %ll, align 8
  %216 = icmp ne i64 %215, 20
  br i1 %216, label %217, label %224

; <label>:217                                     ; preds = %211
  store i32 314, i32* %lrc, align 4
  %218 = load i32* %prlc, align 4
  %219 = icmp ne i32 %218, 0
  br i1 %219, label %220, label %223

; <label>:220                                     ; preds = %217
  %221 = load i32* %lrc, align 4
  %222 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %221)
  br label %223

; <label>:223                                     ; preds = %220, %217
  br label %224

; <label>:224                                     ; preds = %223, %211
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %225 = load i32* %ur, align 4
  %226 = load i64* %ll, align 8
  %227 = zext i32 %225 to i64
  %228 = shl i64 %226, %227
  store i64 %228, i64* %ll, align 8
  %229 = load i64* %ll, align 8
  %230 = icmp ne i64 %229, 20
  br i1 %230, label %231, label %238

; <label>:231                                     ; preds = %224
  store i32 315, i32* %lrc, align 4
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
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %239 = load i8* %cr, align 1
  %240 = sext i8 %239 to i32
  %241 = load i32* %ul, align 4
  %242 = shl i32 %241, %240
  store i32 %242, i32* %ul, align 4
  %243 = load i32* %ul, align 4
  %244 = icmp ne i32 %243, 20
  br i1 %244, label %245, label %252

; <label>:245                                     ; preds = %238
  store i32 316, i32* %lrc, align 4
  %246 = load i32* %prlc, align 4
  %247 = icmp ne i32 %246, 0
  br i1 %247, label %248, label %251

; <label>:248                                     ; preds = %245
  %249 = load i32* %lrc, align 4
  %250 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %249)
  br label %251

; <label>:251                                     ; preds = %248, %245
  br label %252

; <label>:252                                     ; preds = %251, %238
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %253 = load i16* %sr, align 2
  %254 = sext i16 %253 to i32
  %255 = load i32* %ul, align 4
  %256 = shl i32 %255, %254
  store i32 %256, i32* %ul, align 4
  %257 = load i32* %ul, align 4
  %258 = icmp ne i32 %257, 20
  br i1 %258, label %259, label %266

; <label>:259                                     ; preds = %252
  store i32 317, i32* %lrc, align 4
  %260 = load i32* %prlc, align 4
  %261 = icmp ne i32 %260, 0
  br i1 %261, label %262, label %265

; <label>:262                                     ; preds = %259
  %263 = load i32* %lrc, align 4
  %264 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %263)
  br label %265

; <label>:265                                     ; preds = %262, %259
  br label %266

; <label>:266                                     ; preds = %265, %252
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %267 = load i32* %ir, align 4
  %268 = load i32* %ul, align 4
  %269 = shl i32 %268, %267
  store i32 %269, i32* %ul, align 4
  %270 = load i32* %ul, align 4
  %271 = icmp ne i32 %270, 20
  br i1 %271, label %272, label %279

; <label>:272                                     ; preds = %266
  store i32 318, i32* %lrc, align 4
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
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %280 = load i64* %lr, align 8
  %281 = load i32* %ul, align 4
  %282 = trunc i64 %280 to i32
  %283 = shl i32 %281, %282
  store i32 %283, i32* %ul, align 4
  %284 = load i32* %ul, align 4
  %285 = icmp ne i32 %284, 20
  br i1 %285, label %286, label %293

; <label>:286                                     ; preds = %279
  store i32 319, i32* %lrc, align 4
  %287 = load i32* %prlc, align 4
  %288 = icmp ne i32 %287, 0
  br i1 %288, label %289, label %292

; <label>:289                                     ; preds = %286
  %290 = load i32* %lrc, align 4
  %291 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %290)
  br label %292

; <label>:292                                     ; preds = %289, %286
  br label %293

; <label>:293                                     ; preds = %292, %279
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %294 = load i32* %ur, align 4
  %295 = load i32* %ul, align 4
  %296 = shl i32 %295, %294
  store i32 %296, i32* %ul, align 4
  %297 = load i32* %ul, align 4
  %298 = icmp ne i32 %297, 20
  br i1 %298, label %299, label %306

; <label>:299                                     ; preds = %293
  store i32 320, i32* %lrc, align 4
  %300 = load i32* %prlc, align 4
  %301 = icmp ne i32 %300, 0
  br i1 %301, label %302, label %305

; <label>:302                                     ; preds = %299
  %303 = load i32* %lrc, align 4
  %304 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %303)
  br label %305

; <label>:305                                     ; preds = %302, %299
  br label %306

; <label>:306                                     ; preds = %305, %293
  store i8 12, i8* %cl, align 1
  store i8 10, i8* %cr, align 1
  %307 = load i8* %cr, align 1
  %308 = sext i8 %307 to i32
  %309 = load i8* %cl, align 1
  %310 = sext i8 %309 to i32
  %311 = and i32 %310, %308
  %312 = trunc i32 %311 to i8
  store i8 %312, i8* %cl, align 1
  %313 = load i8* %cl, align 1
  %314 = sext i8 %313 to i32
  %315 = icmp ne i32 %314, 8
  br i1 %315, label %316, label %323

; <label>:316                                     ; preds = %306
  store i32 321, i32* %lrc, align 4
  %317 = load i32* %prlc, align 4
  %318 = icmp ne i32 %317, 0
  br i1 %318, label %319, label %322

; <label>:319                                     ; preds = %316
  %320 = load i32* %lrc, align 4
  %321 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %320)
  br label %322

; <label>:322                                     ; preds = %319, %316
  br label %323

; <label>:323                                     ; preds = %322, %306
  store i8 12, i8* %cl, align 1
  store i16 10, i16* %sr, align 2
  %324 = load i16* %sr, align 2
  %325 = sext i16 %324 to i32
  %326 = load i8* %cl, align 1
  %327 = sext i8 %326 to i32
  %328 = and i32 %327, %325
  %329 = trunc i32 %328 to i8
  store i8 %329, i8* %cl, align 1
  %330 = load i8* %cl, align 1
  %331 = sext i8 %330 to i32
  %332 = icmp ne i32 %331, 8
  br i1 %332, label %333, label %340

; <label>:333                                     ; preds = %323
  store i32 322, i32* %lrc, align 4
  %334 = load i32* %prlc, align 4
  %335 = icmp ne i32 %334, 0
  br i1 %335, label %336, label %339

; <label>:336                                     ; preds = %333
  %337 = load i32* %lrc, align 4
  %338 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %337)
  br label %339

; <label>:339                                     ; preds = %336, %333
  br label %340

; <label>:340                                     ; preds = %339, %323
  store i8 12, i8* %cl, align 1
  store i32 10, i32* %ir, align 4
  %341 = load i32* %ir, align 4
  %342 = load i8* %cl, align 1
  %343 = sext i8 %342 to i32
  %344 = and i32 %343, %341
  %345 = trunc i32 %344 to i8
  store i8 %345, i8* %cl, align 1
  %346 = load i8* %cl, align 1
  %347 = sext i8 %346 to i32
  %348 = icmp ne i32 %347, 8
  br i1 %348, label %349, label %356

; <label>:349                                     ; preds = %340
  store i32 323, i32* %lrc, align 4
  %350 = load i32* %prlc, align 4
  %351 = icmp ne i32 %350, 0
  br i1 %351, label %352, label %355

; <label>:352                                     ; preds = %349
  %353 = load i32* %lrc, align 4
  %354 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %353)
  br label %355

; <label>:355                                     ; preds = %352, %349
  br label %356

; <label>:356                                     ; preds = %355, %340
  store i8 12, i8* %cl, align 1
  store i64 10, i64* %lr, align 8
  %357 = load i64* %lr, align 8
  %358 = load i8* %cl, align 1
  %359 = sext i8 %358 to i64
  %360 = and i64 %359, %357
  %361 = trunc i64 %360 to i8
  store i8 %361, i8* %cl, align 1
  %362 = load i8* %cl, align 1
  %363 = sext i8 %362 to i32
  %364 = icmp ne i32 %363, 8
  br i1 %364, label %365, label %372

; <label>:365                                     ; preds = %356
  store i32 324, i32* %lrc, align 4
  %366 = load i32* %prlc, align 4
  %367 = icmp ne i32 %366, 0
  br i1 %367, label %368, label %371

; <label>:368                                     ; preds = %365
  %369 = load i32* %lrc, align 4
  %370 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %369)
  br label %371

; <label>:371                                     ; preds = %368, %365
  br label %372

; <label>:372                                     ; preds = %371, %356
  store i8 12, i8* %cl, align 1
  store i32 10, i32* %ur, align 4
  %373 = load i32* %ur, align 4
  %374 = load i8* %cl, align 1
  %375 = sext i8 %374 to i32
  %376 = and i32 %375, %373
  %377 = trunc i32 %376 to i8
  store i8 %377, i8* %cl, align 1
  %378 = load i8* %cl, align 1
  %379 = sext i8 %378 to i32
  %380 = icmp ne i32 %379, 8
  br i1 %380, label %381, label %388

; <label>:381                                     ; preds = %372
  store i32 325, i32* %lrc, align 4
  %382 = load i32* %prlc, align 4
  %383 = icmp ne i32 %382, 0
  br i1 %383, label %384, label %387

; <label>:384                                     ; preds = %381
  %385 = load i32* %lrc, align 4
  %386 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %385)
  br label %387

; <label>:387                                     ; preds = %384, %381
  br label %388

; <label>:388                                     ; preds = %387, %372
  store i16 12, i16* %sl, align 2
  store i8 10, i8* %cr, align 1
  %389 = load i8* %cr, align 1
  %390 = sext i8 %389 to i32
  %391 = load i16* %sl, align 2
  %392 = sext i16 %391 to i32
  %393 = and i32 %392, %390
  %394 = trunc i32 %393 to i16
  store i16 %394, i16* %sl, align 2
  %395 = load i16* %sl, align 2
  %396 = sext i16 %395 to i32
  %397 = icmp ne i32 %396, 8
  br i1 %397, label %398, label %405

; <label>:398                                     ; preds = %388
  store i32 326, i32* %lrc, align 4
  %399 = load i32* %prlc, align 4
  %400 = icmp ne i32 %399, 0
  br i1 %400, label %401, label %404

; <label>:401                                     ; preds = %398
  %402 = load i32* %lrc, align 4
  %403 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %402)
  br label %404

; <label>:404                                     ; preds = %401, %398
  br label %405

; <label>:405                                     ; preds = %404, %388
  store i16 12, i16* %sl, align 2
  store i16 10, i16* %sr, align 2
  %406 = load i16* %sr, align 2
  %407 = sext i16 %406 to i32
  %408 = load i16* %sl, align 2
  %409 = sext i16 %408 to i32
  %410 = and i32 %409, %407
  %411 = trunc i32 %410 to i16
  store i16 %411, i16* %sl, align 2
  %412 = load i16* %sl, align 2
  %413 = sext i16 %412 to i32
  %414 = icmp ne i32 %413, 8
  br i1 %414, label %415, label %422

; <label>:415                                     ; preds = %405
  store i32 327, i32* %lrc, align 4
  %416 = load i32* %prlc, align 4
  %417 = icmp ne i32 %416, 0
  br i1 %417, label %418, label %421

; <label>:418                                     ; preds = %415
  %419 = load i32* %lrc, align 4
  %420 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %419)
  br label %421

; <label>:421                                     ; preds = %418, %415
  br label %422

; <label>:422                                     ; preds = %421, %405
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ir, align 4
  %423 = load i32* %ir, align 4
  %424 = load i16* %sl, align 2
  %425 = sext i16 %424 to i32
  %426 = and i32 %425, %423
  %427 = trunc i32 %426 to i16
  store i16 %427, i16* %sl, align 2
  %428 = load i16* %sl, align 2
  %429 = sext i16 %428 to i32
  %430 = icmp ne i32 %429, 8
  br i1 %430, label %431, label %438

; <label>:431                                     ; preds = %422
  store i32 328, i32* %lrc, align 4
  %432 = load i32* %prlc, align 4
  %433 = icmp ne i32 %432, 0
  br i1 %433, label %434, label %437

; <label>:434                                     ; preds = %431
  %435 = load i32* %lrc, align 4
  %436 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %435)
  br label %437

; <label>:437                                     ; preds = %434, %431
  br label %438

; <label>:438                                     ; preds = %437, %422
  store i16 12, i16* %sl, align 2
  store i64 10, i64* %lr, align 8
  %439 = load i64* %lr, align 8
  %440 = load i16* %sl, align 2
  %441 = sext i16 %440 to i64
  %442 = and i64 %441, %439
  %443 = trunc i64 %442 to i16
  store i16 %443, i16* %sl, align 2
  %444 = load i16* %sl, align 2
  %445 = sext i16 %444 to i32
  %446 = icmp ne i32 %445, 8
  br i1 %446, label %447, label %454

; <label>:447                                     ; preds = %438
  store i32 329, i32* %lrc, align 4
  %448 = load i32* %prlc, align 4
  %449 = icmp ne i32 %448, 0
  br i1 %449, label %450, label %453

; <label>:450                                     ; preds = %447
  %451 = load i32* %lrc, align 4
  %452 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %451)
  br label %453

; <label>:453                                     ; preds = %450, %447
  br label %454

; <label>:454                                     ; preds = %453, %438
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ur, align 4
  %455 = load i32* %ur, align 4
  %456 = load i16* %sl, align 2
  %457 = sext i16 %456 to i32
  %458 = and i32 %457, %455
  %459 = trunc i32 %458 to i16
  store i16 %459, i16* %sl, align 2
  %460 = load i16* %sl, align 2
  %461 = sext i16 %460 to i32
  %462 = icmp ne i32 %461, 8
  br i1 %462, label %463, label %470

; <label>:463                                     ; preds = %454
  store i32 330, i32* %lrc, align 4
  %464 = load i32* %prlc, align 4
  %465 = icmp ne i32 %464, 0
  br i1 %465, label %466, label %469

; <label>:466                                     ; preds = %463
  %467 = load i32* %lrc, align 4
  %468 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %467)
  br label %469

; <label>:469                                     ; preds = %466, %463
  br label %470

; <label>:470                                     ; preds = %469, %454
  store i32 12, i32* %il, align 4
  store i8 10, i8* %cr, align 1
  %471 = load i8* %cr, align 1
  %472 = sext i8 %471 to i32
  %473 = load i32* %il, align 4
  %474 = and i32 %473, %472
  store i32 %474, i32* %il, align 4
  %475 = load i32* %il, align 4
  %476 = icmp ne i32 %475, 8
  br i1 %476, label %477, label %484

; <label>:477                                     ; preds = %470
  store i32 331, i32* %lrc, align 4
  %478 = load i32* %prlc, align 4
  %479 = icmp ne i32 %478, 0
  br i1 %479, label %480, label %483

; <label>:480                                     ; preds = %477
  %481 = load i32* %lrc, align 4
  %482 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %481)
  br label %483

; <label>:483                                     ; preds = %480, %477
  br label %484

; <label>:484                                     ; preds = %483, %470
  store i32 12, i32* %il, align 4
  store i16 10, i16* %sr, align 2
  %485 = load i16* %sr, align 2
  %486 = sext i16 %485 to i32
  %487 = load i32* %il, align 4
  %488 = and i32 %487, %486
  store i32 %488, i32* %il, align 4
  %489 = load i32* %il, align 4
  %490 = icmp ne i32 %489, 8
  br i1 %490, label %491, label %498

; <label>:491                                     ; preds = %484
  store i32 332, i32* %lrc, align 4
  %492 = load i32* %prlc, align 4
  %493 = icmp ne i32 %492, 0
  br i1 %493, label %494, label %497

; <label>:494                                     ; preds = %491
  %495 = load i32* %lrc, align 4
  %496 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %495)
  br label %497

; <label>:497                                     ; preds = %494, %491
  br label %498

; <label>:498                                     ; preds = %497, %484
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ir, align 4
  %499 = load i32* %ir, align 4
  %500 = load i32* %il, align 4
  %501 = and i32 %500, %499
  store i32 %501, i32* %il, align 4
  %502 = load i32* %il, align 4
  %503 = icmp ne i32 %502, 8
  br i1 %503, label %504, label %511

; <label>:504                                     ; preds = %498
  store i32 333, i32* %lrc, align 4
  %505 = load i32* %prlc, align 4
  %506 = icmp ne i32 %505, 0
  br i1 %506, label %507, label %510

; <label>:507                                     ; preds = %504
  %508 = load i32* %lrc, align 4
  %509 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %508)
  br label %510

; <label>:510                                     ; preds = %507, %504
  br label %511

; <label>:511                                     ; preds = %510, %498
  store i32 12, i32* %il, align 4
  store i64 10, i64* %lr, align 8
  %512 = load i64* %lr, align 8
  %513 = load i32* %il, align 4
  %514 = sext i32 %513 to i64
  %515 = and i64 %514, %512
  %516 = trunc i64 %515 to i32
  store i32 %516, i32* %il, align 4
  %517 = load i32* %il, align 4
  %518 = icmp ne i32 %517, 8
  br i1 %518, label %519, label %526

; <label>:519                                     ; preds = %511
  store i32 334, i32* %lrc, align 4
  %520 = load i32* %prlc, align 4
  %521 = icmp ne i32 %520, 0
  br i1 %521, label %522, label %525

; <label>:522                                     ; preds = %519
  %523 = load i32* %lrc, align 4
  %524 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %523)
  br label %525

; <label>:525                                     ; preds = %522, %519
  br label %526

; <label>:526                                     ; preds = %525, %511
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ur, align 4
  %527 = load i32* %ur, align 4
  %528 = load i32* %il, align 4
  %529 = and i32 %528, %527
  store i32 %529, i32* %il, align 4
  %530 = load i32* %il, align 4
  %531 = icmp ne i32 %530, 8
  br i1 %531, label %532, label %539

; <label>:532                                     ; preds = %526
  store i32 335, i32* %lrc, align 4
  %533 = load i32* %prlc, align 4
  %534 = icmp ne i32 %533, 0
  br i1 %534, label %535, label %538

; <label>:535                                     ; preds = %532
  %536 = load i32* %lrc, align 4
  %537 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %536)
  br label %538

; <label>:538                                     ; preds = %535, %532
  br label %539

; <label>:539                                     ; preds = %538, %526
  store i64 12, i64* %ll, align 8
  store i8 10, i8* %cr, align 1
  %540 = load i8* %cr, align 1
  %541 = sext i8 %540 to i64
  %542 = load i64* %ll, align 8
  %543 = and i64 %542, %541
  store i64 %543, i64* %ll, align 8
  %544 = load i64* %ll, align 8
  %545 = icmp ne i64 %544, 8
  br i1 %545, label %546, label %553

; <label>:546                                     ; preds = %539
  store i32 336, i32* %lrc, align 4
  %547 = load i32* %prlc, align 4
  %548 = icmp ne i32 %547, 0
  br i1 %548, label %549, label %552

; <label>:549                                     ; preds = %546
  %550 = load i32* %lrc, align 4
  %551 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %550)
  br label %552

; <label>:552                                     ; preds = %549, %546
  br label %553

; <label>:553                                     ; preds = %552, %539
  store i64 12, i64* %ll, align 8
  store i16 10, i16* %sr, align 2
  %554 = load i16* %sr, align 2
  %555 = sext i16 %554 to i64
  %556 = load i64* %ll, align 8
  %557 = and i64 %556, %555
  store i64 %557, i64* %ll, align 8
  %558 = load i64* %ll, align 8
  %559 = icmp ne i64 %558, 8
  br i1 %559, label %560, label %567

; <label>:560                                     ; preds = %553
  store i32 337, i32* %lrc, align 4
  %561 = load i32* %prlc, align 4
  %562 = icmp ne i32 %561, 0
  br i1 %562, label %563, label %566

; <label>:563                                     ; preds = %560
  %564 = load i32* %lrc, align 4
  %565 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %564)
  br label %566

; <label>:566                                     ; preds = %563, %560
  br label %567

; <label>:567                                     ; preds = %566, %553
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ir, align 4
  %568 = load i32* %ir, align 4
  %569 = sext i32 %568 to i64
  %570 = load i64* %ll, align 8
  %571 = and i64 %570, %569
  store i64 %571, i64* %ll, align 8
  %572 = load i64* %ll, align 8
  %573 = icmp ne i64 %572, 8
  br i1 %573, label %574, label %581

; <label>:574                                     ; preds = %567
  store i32 338, i32* %lrc, align 4
  %575 = load i32* %prlc, align 4
  %576 = icmp ne i32 %575, 0
  br i1 %576, label %577, label %580

; <label>:577                                     ; preds = %574
  %578 = load i32* %lrc, align 4
  %579 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %578)
  br label %580

; <label>:580                                     ; preds = %577, %574
  br label %581

; <label>:581                                     ; preds = %580, %567
  store i64 12, i64* %ll, align 8
  store i64 10, i64* %lr, align 8
  %582 = load i64* %lr, align 8
  %583 = load i64* %ll, align 8
  %584 = and i64 %583, %582
  store i64 %584, i64* %ll, align 8
  %585 = load i64* %ll, align 8
  %586 = icmp ne i64 %585, 8
  br i1 %586, label %587, label %594

; <label>:587                                     ; preds = %581
  store i32 339, i32* %lrc, align 4
  %588 = load i32* %prlc, align 4
  %589 = icmp ne i32 %588, 0
  br i1 %589, label %590, label %593

; <label>:590                                     ; preds = %587
  %591 = load i32* %lrc, align 4
  %592 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %591)
  br label %593

; <label>:593                                     ; preds = %590, %587
  br label %594

; <label>:594                                     ; preds = %593, %581
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ur, align 4
  %595 = load i32* %ur, align 4
  %596 = zext i32 %595 to i64
  %597 = load i64* %ll, align 8
  %598 = and i64 %597, %596
  store i64 %598, i64* %ll, align 8
  %599 = load i64* %ll, align 8
  %600 = icmp ne i64 %599, 8
  br i1 %600, label %601, label %608

; <label>:601                                     ; preds = %594
  store i32 340, i32* %lrc, align 4
  %602 = load i32* %prlc, align 4
  %603 = icmp ne i32 %602, 0
  br i1 %603, label %604, label %607

; <label>:604                                     ; preds = %601
  %605 = load i32* %lrc, align 4
  %606 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %605)
  br label %607

; <label>:607                                     ; preds = %604, %601
  br label %608

; <label>:608                                     ; preds = %607, %594
  store i32 12, i32* %ul, align 4
  store i8 10, i8* %cr, align 1
  %609 = load i8* %cr, align 1
  %610 = sext i8 %609 to i32
  %611 = load i32* %ul, align 4
  %612 = and i32 %611, %610
  store i32 %612, i32* %ul, align 4
  %613 = load i32* %ul, align 4
  %614 = icmp ne i32 %613, 8
  br i1 %614, label %615, label %622

; <label>:615                                     ; preds = %608
  store i32 341, i32* %lrc, align 4
  %616 = load i32* %prlc, align 4
  %617 = icmp ne i32 %616, 0
  br i1 %617, label %618, label %621

; <label>:618                                     ; preds = %615
  %619 = load i32* %lrc, align 4
  %620 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %619)
  br label %621

; <label>:621                                     ; preds = %618, %615
  br label %622

; <label>:622                                     ; preds = %621, %608
  store i32 12, i32* %ul, align 4
  store i16 10, i16* %sr, align 2
  %623 = load i16* %sr, align 2
  %624 = sext i16 %623 to i32
  %625 = load i32* %ul, align 4
  %626 = and i32 %625, %624
  store i32 %626, i32* %ul, align 4
  %627 = load i32* %ul, align 4
  %628 = icmp ne i32 %627, 8
  br i1 %628, label %629, label %636

; <label>:629                                     ; preds = %622
  store i32 342, i32* %lrc, align 4
  %630 = load i32* %prlc, align 4
  %631 = icmp ne i32 %630, 0
  br i1 %631, label %632, label %635

; <label>:632                                     ; preds = %629
  %633 = load i32* %lrc, align 4
  %634 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %633)
  br label %635

; <label>:635                                     ; preds = %632, %629
  br label %636

; <label>:636                                     ; preds = %635, %622
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ir, align 4
  %637 = load i32* %ir, align 4
  %638 = load i32* %ul, align 4
  %639 = and i32 %638, %637
  store i32 %639, i32* %ul, align 4
  %640 = load i32* %ul, align 4
  %641 = icmp ne i32 %640, 8
  br i1 %641, label %642, label %649

; <label>:642                                     ; preds = %636
  store i32 343, i32* %lrc, align 4
  %643 = load i32* %prlc, align 4
  %644 = icmp ne i32 %643, 0
  br i1 %644, label %645, label %648

; <label>:645                                     ; preds = %642
  %646 = load i32* %lrc, align 4
  %647 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %646)
  br label %648

; <label>:648                                     ; preds = %645, %642
  br label %649

; <label>:649                                     ; preds = %648, %636
  store i32 12, i32* %ul, align 4
  store i64 10, i64* %lr, align 8
  %650 = load i64* %lr, align 8
  %651 = load i32* %ul, align 4
  %652 = zext i32 %651 to i64
  %653 = and i64 %652, %650
  %654 = trunc i64 %653 to i32
  store i32 %654, i32* %ul, align 4
  %655 = load i32* %ul, align 4
  %656 = icmp ne i32 %655, 8
  br i1 %656, label %657, label %664

; <label>:657                                     ; preds = %649
  store i32 344, i32* %lrc, align 4
  %658 = load i32* %prlc, align 4
  %659 = icmp ne i32 %658, 0
  br i1 %659, label %660, label %663

; <label>:660                                     ; preds = %657
  %661 = load i32* %lrc, align 4
  %662 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %661)
  br label %663

; <label>:663                                     ; preds = %660, %657
  br label %664

; <label>:664                                     ; preds = %663, %649
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ur, align 4
  %665 = load i32* %ur, align 4
  %666 = load i32* %ul, align 4
  %667 = and i32 %666, %665
  store i32 %667, i32* %ul, align 4
  %668 = load i32* %ul, align 4
  %669 = icmp ne i32 %668, 8
  br i1 %669, label %670, label %677

; <label>:670                                     ; preds = %664
  store i32 345, i32* %lrc, align 4
  %671 = load i32* %prlc, align 4
  %672 = icmp ne i32 %671, 0
  br i1 %672, label %673, label %676

; <label>:673                                     ; preds = %670
  %674 = load i32* %lrc, align 4
  %675 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %674)
  br label %676

; <label>:676                                     ; preds = %673, %670
  br label %677

; <label>:677                                     ; preds = %676, %664
  store i8 12, i8* %cl, align 1
  store i8 10, i8* %cr, align 1
  %678 = load i8* %cr, align 1
  %679 = sext i8 %678 to i32
  %680 = load i8* %cl, align 1
  %681 = sext i8 %680 to i32
  %682 = xor i32 %681, %679
  %683 = trunc i32 %682 to i8
  store i8 %683, i8* %cl, align 1
  %684 = load i8* %cl, align 1
  %685 = sext i8 %684 to i32
  %686 = icmp ne i32 %685, 6
  br i1 %686, label %687, label %694

; <label>:687                                     ; preds = %677
  store i32 346, i32* %lrc, align 4
  %688 = load i32* %prlc, align 4
  %689 = icmp ne i32 %688, 0
  br i1 %689, label %690, label %693

; <label>:690                                     ; preds = %687
  %691 = load i32* %lrc, align 4
  %692 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %691)
  br label %693

; <label>:693                                     ; preds = %690, %687
  br label %694

; <label>:694                                     ; preds = %693, %677
  store i8 12, i8* %cl, align 1
  store i16 10, i16* %sr, align 2
  %695 = load i16* %sr, align 2
  %696 = sext i16 %695 to i32
  %697 = load i8* %cl, align 1
  %698 = sext i8 %697 to i32
  %699 = xor i32 %698, %696
  %700 = trunc i32 %699 to i8
  store i8 %700, i8* %cl, align 1
  %701 = load i8* %cl, align 1
  %702 = sext i8 %701 to i32
  %703 = icmp ne i32 %702, 6
  br i1 %703, label %704, label %711

; <label>:704                                     ; preds = %694
  store i32 347, i32* %lrc, align 4
  %705 = load i32* %prlc, align 4
  %706 = icmp ne i32 %705, 0
  br i1 %706, label %707, label %710

; <label>:707                                     ; preds = %704
  %708 = load i32* %lrc, align 4
  %709 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %708)
  br label %710

; <label>:710                                     ; preds = %707, %704
  br label %711

; <label>:711                                     ; preds = %710, %694
  store i8 12, i8* %cl, align 1
  store i32 10, i32* %ir, align 4
  %712 = load i32* %ir, align 4
  %713 = load i8* %cl, align 1
  %714 = sext i8 %713 to i32
  %715 = xor i32 %714, %712
  %716 = trunc i32 %715 to i8
  store i8 %716, i8* %cl, align 1
  %717 = load i8* %cl, align 1
  %718 = sext i8 %717 to i32
  %719 = icmp ne i32 %718, 6
  br i1 %719, label %720, label %727

; <label>:720                                     ; preds = %711
  store i32 348, i32* %lrc, align 4
  %721 = load i32* %prlc, align 4
  %722 = icmp ne i32 %721, 0
  br i1 %722, label %723, label %726

; <label>:723                                     ; preds = %720
  %724 = load i32* %lrc, align 4
  %725 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %724)
  br label %726

; <label>:726                                     ; preds = %723, %720
  br label %727

; <label>:727                                     ; preds = %726, %711
  store i8 12, i8* %cl, align 1
  store i64 10, i64* %lr, align 8
  %728 = load i64* %lr, align 8
  %729 = load i8* %cl, align 1
  %730 = sext i8 %729 to i64
  %731 = xor i64 %730, %728
  %732 = trunc i64 %731 to i8
  store i8 %732, i8* %cl, align 1
  %733 = load i8* %cl, align 1
  %734 = sext i8 %733 to i32
  %735 = icmp ne i32 %734, 6
  br i1 %735, label %736, label %743

; <label>:736                                     ; preds = %727
  store i32 349, i32* %lrc, align 4
  %737 = load i32* %prlc, align 4
  %738 = icmp ne i32 %737, 0
  br i1 %738, label %739, label %742

; <label>:739                                     ; preds = %736
  %740 = load i32* %lrc, align 4
  %741 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %740)
  br label %742

; <label>:742                                     ; preds = %739, %736
  br label %743

; <label>:743                                     ; preds = %742, %727
  store i8 12, i8* %cl, align 1
  store i32 10, i32* %ur, align 4
  %744 = load i32* %ur, align 4
  %745 = load i8* %cl, align 1
  %746 = sext i8 %745 to i32
  %747 = xor i32 %746, %744
  %748 = trunc i32 %747 to i8
  store i8 %748, i8* %cl, align 1
  %749 = load i8* %cl, align 1
  %750 = sext i8 %749 to i32
  %751 = icmp ne i32 %750, 6
  br i1 %751, label %752, label %759

; <label>:752                                     ; preds = %743
  store i32 350, i32* %lrc, align 4
  %753 = load i32* %prlc, align 4
  %754 = icmp ne i32 %753, 0
  br i1 %754, label %755, label %758

; <label>:755                                     ; preds = %752
  %756 = load i32* %lrc, align 4
  %757 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %756)
  br label %758

; <label>:758                                     ; preds = %755, %752
  br label %759

; <label>:759                                     ; preds = %758, %743
  %760 = load i32* %lrc, align 4
  %761 = icmp ne i32 %760, 0
  br i1 %761, label %762, label %770

; <label>:762                                     ; preds = %759
  store i32 1, i32* %rc, align 4
  %763 = load %struct.defs** %1, align 8
  %764 = getelementptr inbounds %struct.defs* %763, i32 0, i32 11
  %765 = load i32* %764, align 4
  %766 = icmp ne i32 %765, 0
  br i1 %766, label %767, label %769

; <label>:767                                     ; preds = %762
  %768 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %769

; <label>:769                                     ; preds = %767, %762
  br label %770

; <label>:770                                     ; preds = %769, %759
  %771 = load i32* %rc, align 4
  ret i32 %771
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
