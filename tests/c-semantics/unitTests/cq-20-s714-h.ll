; ModuleID = './cq-20-s714-h.c'
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
  store i16 12, i16* %sl, align 2
  store i8 10, i8* %cr, align 1
  %17 = load i8* %cr, align 1
  %18 = sext i8 %17 to i32
  %19 = load i16* %sl, align 2
  %20 = sext i16 %19 to i32
  %21 = xor i32 %20, %18
  %22 = trunc i32 %21 to i16
  store i16 %22, i16* %sl, align 2
  %23 = load i16* %sl, align 2
  %24 = sext i16 %23 to i32
  %25 = icmp ne i32 %24, 6
  br i1 %25, label %26, label %33

; <label>:26                                      ; preds = %16
  store i32 351, i32* %lrc, align 4
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
  store i16 12, i16* %sl, align 2
  store i16 10, i16* %sr, align 2
  %34 = load i16* %sr, align 2
  %35 = sext i16 %34 to i32
  %36 = load i16* %sl, align 2
  %37 = sext i16 %36 to i32
  %38 = xor i32 %37, %35
  %39 = trunc i32 %38 to i16
  store i16 %39, i16* %sl, align 2
  %40 = load i16* %sl, align 2
  %41 = sext i16 %40 to i32
  %42 = icmp ne i32 %41, 6
  br i1 %42, label %43, label %50

; <label>:43                                      ; preds = %33
  store i32 352, i32* %lrc, align 4
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
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ir, align 4
  %51 = load i32* %ir, align 4
  %52 = load i16* %sl, align 2
  %53 = sext i16 %52 to i32
  %54 = xor i32 %53, %51
  %55 = trunc i32 %54 to i16
  store i16 %55, i16* %sl, align 2
  %56 = load i16* %sl, align 2
  %57 = sext i16 %56 to i32
  %58 = icmp ne i32 %57, 6
  br i1 %58, label %59, label %66

; <label>:59                                      ; preds = %50
  store i32 353, i32* %lrc, align 4
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
  store i16 12, i16* %sl, align 2
  store i64 10, i64* %lr, align 8
  %67 = load i64* %lr, align 8
  %68 = load i16* %sl, align 2
  %69 = sext i16 %68 to i64
  %70 = xor i64 %69, %67
  %71 = trunc i64 %70 to i16
  store i16 %71, i16* %sl, align 2
  %72 = load i16* %sl, align 2
  %73 = sext i16 %72 to i32
  %74 = icmp ne i32 %73, 6
  br i1 %74, label %75, label %82

; <label>:75                                      ; preds = %66
  store i32 354, i32* %lrc, align 4
  %76 = load i32* %prlc, align 4
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %81

; <label>:78                                      ; preds = %75
  %79 = load i32* %lrc, align 4
  %80 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %79)
  br label %81

; <label>:81                                      ; preds = %78, %75
  br label %82

; <label>:82                                      ; preds = %81, %66
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ur, align 4
  %83 = load i32* %ur, align 4
  %84 = load i16* %sl, align 2
  %85 = sext i16 %84 to i32
  %86 = xor i32 %85, %83
  %87 = trunc i32 %86 to i16
  store i16 %87, i16* %sl, align 2
  %88 = load i16* %sl, align 2
  %89 = sext i16 %88 to i32
  %90 = icmp ne i32 %89, 6
  br i1 %90, label %91, label %98

; <label>:91                                      ; preds = %82
  store i32 355, i32* %lrc, align 4
  %92 = load i32* %prlc, align 4
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %94, label %97

; <label>:94                                      ; preds = %91
  %95 = load i32* %lrc, align 4
  %96 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %95)
  br label %97

; <label>:97                                      ; preds = %94, %91
  br label %98

; <label>:98                                      ; preds = %97, %82
  store i32 12, i32* %il, align 4
  store i8 10, i8* %cr, align 1
  %99 = load i8* %cr, align 1
  %100 = sext i8 %99 to i32
  %101 = load i32* %il, align 4
  %102 = xor i32 %101, %100
  store i32 %102, i32* %il, align 4
  %103 = load i32* %il, align 4
  %104 = icmp ne i32 %103, 6
  br i1 %104, label %105, label %112

; <label>:105                                     ; preds = %98
  store i32 356, i32* %lrc, align 4
  %106 = load i32* %prlc, align 4
  %107 = icmp ne i32 %106, 0
  br i1 %107, label %108, label %111

; <label>:108                                     ; preds = %105
  %109 = load i32* %lrc, align 4
  %110 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %109)
  br label %111

; <label>:111                                     ; preds = %108, %105
  br label %112

; <label>:112                                     ; preds = %111, %98
  store i32 12, i32* %il, align 4
  store i16 10, i16* %sr, align 2
  %113 = load i16* %sr, align 2
  %114 = sext i16 %113 to i32
  %115 = load i32* %il, align 4
  %116 = xor i32 %115, %114
  store i32 %116, i32* %il, align 4
  %117 = load i32* %il, align 4
  %118 = icmp ne i32 %117, 6
  br i1 %118, label %119, label %126

; <label>:119                                     ; preds = %112
  store i32 357, i32* %lrc, align 4
  %120 = load i32* %prlc, align 4
  %121 = icmp ne i32 %120, 0
  br i1 %121, label %122, label %125

; <label>:122                                     ; preds = %119
  %123 = load i32* %lrc, align 4
  %124 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %123)
  br label %125

; <label>:125                                     ; preds = %122, %119
  br label %126

; <label>:126                                     ; preds = %125, %112
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ir, align 4
  %127 = load i32* %ir, align 4
  %128 = load i32* %il, align 4
  %129 = xor i32 %128, %127
  store i32 %129, i32* %il, align 4
  %130 = load i32* %il, align 4
  %131 = icmp ne i32 %130, 6
  br i1 %131, label %132, label %139

; <label>:132                                     ; preds = %126
  store i32 358, i32* %lrc, align 4
  %133 = load i32* %prlc, align 4
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %135, label %138

; <label>:135                                     ; preds = %132
  %136 = load i32* %lrc, align 4
  %137 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %136)
  br label %138

; <label>:138                                     ; preds = %135, %132
  br label %139

; <label>:139                                     ; preds = %138, %126
  store i32 12, i32* %il, align 4
  store i64 10, i64* %lr, align 8
  %140 = load i64* %lr, align 8
  %141 = load i32* %il, align 4
  %142 = sext i32 %141 to i64
  %143 = xor i64 %142, %140
  %144 = trunc i64 %143 to i32
  store i32 %144, i32* %il, align 4
  %145 = load i32* %il, align 4
  %146 = icmp ne i32 %145, 6
  br i1 %146, label %147, label %154

; <label>:147                                     ; preds = %139
  store i32 359, i32* %lrc, align 4
  %148 = load i32* %prlc, align 4
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %150, label %153

; <label>:150                                     ; preds = %147
  %151 = load i32* %lrc, align 4
  %152 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %151)
  br label %153

; <label>:153                                     ; preds = %150, %147
  br label %154

; <label>:154                                     ; preds = %153, %139
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ur, align 4
  %155 = load i32* %ur, align 4
  %156 = load i32* %il, align 4
  %157 = xor i32 %156, %155
  store i32 %157, i32* %il, align 4
  %158 = load i32* %il, align 4
  %159 = icmp ne i32 %158, 6
  br i1 %159, label %160, label %167

; <label>:160                                     ; preds = %154
  store i32 360, i32* %lrc, align 4
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
  store i64 12, i64* %ll, align 8
  store i8 10, i8* %cr, align 1
  %168 = load i8* %cr, align 1
  %169 = sext i8 %168 to i64
  %170 = load i64* %ll, align 8
  %171 = xor i64 %170, %169
  store i64 %171, i64* %ll, align 8
  %172 = load i64* %ll, align 8
  %173 = icmp ne i64 %172, 6
  br i1 %173, label %174, label %181

; <label>:174                                     ; preds = %167
  store i32 361, i32* %lrc, align 4
  %175 = load i32* %prlc, align 4
  %176 = icmp ne i32 %175, 0
  br i1 %176, label %177, label %180

; <label>:177                                     ; preds = %174
  %178 = load i32* %lrc, align 4
  %179 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %178)
  br label %180

; <label>:180                                     ; preds = %177, %174
  br label %181

; <label>:181                                     ; preds = %180, %167
  store i64 12, i64* %ll, align 8
  store i16 10, i16* %sr, align 2
  %182 = load i16* %sr, align 2
  %183 = sext i16 %182 to i64
  %184 = load i64* %ll, align 8
  %185 = xor i64 %184, %183
  store i64 %185, i64* %ll, align 8
  %186 = load i64* %ll, align 8
  %187 = icmp ne i64 %186, 6
  br i1 %187, label %188, label %195

; <label>:188                                     ; preds = %181
  store i32 362, i32* %lrc, align 4
  %189 = load i32* %prlc, align 4
  %190 = icmp ne i32 %189, 0
  br i1 %190, label %191, label %194

; <label>:191                                     ; preds = %188
  %192 = load i32* %lrc, align 4
  %193 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %192)
  br label %194

; <label>:194                                     ; preds = %191, %188
  br label %195

; <label>:195                                     ; preds = %194, %181
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ir, align 4
  %196 = load i32* %ir, align 4
  %197 = sext i32 %196 to i64
  %198 = load i64* %ll, align 8
  %199 = xor i64 %198, %197
  store i64 %199, i64* %ll, align 8
  %200 = load i64* %ll, align 8
  %201 = icmp ne i64 %200, 6
  br i1 %201, label %202, label %209

; <label>:202                                     ; preds = %195
  store i32 363, i32* %lrc, align 4
  %203 = load i32* %prlc, align 4
  %204 = icmp ne i32 %203, 0
  br i1 %204, label %205, label %208

; <label>:205                                     ; preds = %202
  %206 = load i32* %lrc, align 4
  %207 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %206)
  br label %208

; <label>:208                                     ; preds = %205, %202
  br label %209

; <label>:209                                     ; preds = %208, %195
  store i64 12, i64* %ll, align 8
  store i64 10, i64* %lr, align 8
  %210 = load i64* %lr, align 8
  %211 = load i64* %ll, align 8
  %212 = xor i64 %211, %210
  store i64 %212, i64* %ll, align 8
  %213 = load i64* %ll, align 8
  %214 = icmp ne i64 %213, 6
  br i1 %214, label %215, label %222

; <label>:215                                     ; preds = %209
  store i32 364, i32* %lrc, align 4
  %216 = load i32* %prlc, align 4
  %217 = icmp ne i32 %216, 0
  br i1 %217, label %218, label %221

; <label>:218                                     ; preds = %215
  %219 = load i32* %lrc, align 4
  %220 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %219)
  br label %221

; <label>:221                                     ; preds = %218, %215
  br label %222

; <label>:222                                     ; preds = %221, %209
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ur, align 4
  %223 = load i32* %ur, align 4
  %224 = zext i32 %223 to i64
  %225 = load i64* %ll, align 8
  %226 = xor i64 %225, %224
  store i64 %226, i64* %ll, align 8
  %227 = load i64* %ll, align 8
  %228 = icmp ne i64 %227, 6
  br i1 %228, label %229, label %236

; <label>:229                                     ; preds = %222
  store i32 365, i32* %lrc, align 4
  %230 = load i32* %prlc, align 4
  %231 = icmp ne i32 %230, 0
  br i1 %231, label %232, label %235

; <label>:232                                     ; preds = %229
  %233 = load i32* %lrc, align 4
  %234 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %233)
  br label %235

; <label>:235                                     ; preds = %232, %229
  br label %236

; <label>:236                                     ; preds = %235, %222
  store i32 12, i32* %ul, align 4
  store i8 10, i8* %cr, align 1
  %237 = load i8* %cr, align 1
  %238 = sext i8 %237 to i32
  %239 = load i32* %ul, align 4
  %240 = xor i32 %239, %238
  store i32 %240, i32* %ul, align 4
  %241 = load i32* %ul, align 4
  %242 = icmp ne i32 %241, 6
  br i1 %242, label %243, label %250

; <label>:243                                     ; preds = %236
  store i32 366, i32* %lrc, align 4
  %244 = load i32* %prlc, align 4
  %245 = icmp ne i32 %244, 0
  br i1 %245, label %246, label %249

; <label>:246                                     ; preds = %243
  %247 = load i32* %lrc, align 4
  %248 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %247)
  br label %249

; <label>:249                                     ; preds = %246, %243
  br label %250

; <label>:250                                     ; preds = %249, %236
  store i32 12, i32* %ul, align 4
  store i16 10, i16* %sr, align 2
  %251 = load i16* %sr, align 2
  %252 = sext i16 %251 to i32
  %253 = load i32* %ul, align 4
  %254 = xor i32 %253, %252
  store i32 %254, i32* %ul, align 4
  %255 = load i32* %ul, align 4
  %256 = icmp ne i32 %255, 6
  br i1 %256, label %257, label %264

; <label>:257                                     ; preds = %250
  store i32 367, i32* %lrc, align 4
  %258 = load i32* %prlc, align 4
  %259 = icmp ne i32 %258, 0
  br i1 %259, label %260, label %263

; <label>:260                                     ; preds = %257
  %261 = load i32* %lrc, align 4
  %262 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %261)
  br label %263

; <label>:263                                     ; preds = %260, %257
  br label %264

; <label>:264                                     ; preds = %263, %250
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ir, align 4
  %265 = load i32* %ir, align 4
  %266 = load i32* %ul, align 4
  %267 = xor i32 %266, %265
  store i32 %267, i32* %ul, align 4
  %268 = load i32* %ul, align 4
  %269 = icmp ne i32 %268, 6
  br i1 %269, label %270, label %277

; <label>:270                                     ; preds = %264
  store i32 368, i32* %lrc, align 4
  %271 = load i32* %prlc, align 4
  %272 = icmp ne i32 %271, 0
  br i1 %272, label %273, label %276

; <label>:273                                     ; preds = %270
  %274 = load i32* %lrc, align 4
  %275 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %274)
  br label %276

; <label>:276                                     ; preds = %273, %270
  br label %277

; <label>:277                                     ; preds = %276, %264
  store i32 12, i32* %ul, align 4
  store i64 10, i64* %lr, align 8
  %278 = load i64* %lr, align 8
  %279 = load i32* %ul, align 4
  %280 = zext i32 %279 to i64
  %281 = xor i64 %280, %278
  %282 = trunc i64 %281 to i32
  store i32 %282, i32* %ul, align 4
  %283 = load i32* %ul, align 4
  %284 = icmp ne i32 %283, 6
  br i1 %284, label %285, label %292

; <label>:285                                     ; preds = %277
  store i32 369, i32* %lrc, align 4
  %286 = load i32* %prlc, align 4
  %287 = icmp ne i32 %286, 0
  br i1 %287, label %288, label %291

; <label>:288                                     ; preds = %285
  %289 = load i32* %lrc, align 4
  %290 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %289)
  br label %291

; <label>:291                                     ; preds = %288, %285
  br label %292

; <label>:292                                     ; preds = %291, %277
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ur, align 4
  %293 = load i32* %ur, align 4
  %294 = load i32* %ul, align 4
  %295 = xor i32 %294, %293
  store i32 %295, i32* %ul, align 4
  %296 = load i32* %ul, align 4
  %297 = icmp ne i32 %296, 6
  br i1 %297, label %298, label %305

; <label>:298                                     ; preds = %292
  store i32 370, i32* %lrc, align 4
  %299 = load i32* %prlc, align 4
  %300 = icmp ne i32 %299, 0
  br i1 %300, label %301, label %304

; <label>:301                                     ; preds = %298
  %302 = load i32* %lrc, align 4
  %303 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %302)
  br label %304

; <label>:304                                     ; preds = %301, %298
  br label %305

; <label>:305                                     ; preds = %304, %292
  store i8 12, i8* %cl, align 1
  store i8 10, i8* %cr, align 1
  %306 = load i8* %cr, align 1
  %307 = sext i8 %306 to i32
  %308 = load i8* %cl, align 1
  %309 = sext i8 %308 to i32
  %310 = or i32 %309, %307
  %311 = trunc i32 %310 to i8
  store i8 %311, i8* %cl, align 1
  %312 = load i8* %cl, align 1
  %313 = sext i8 %312 to i32
  %314 = icmp ne i32 %313, 14
  br i1 %314, label %315, label %322

; <label>:315                                     ; preds = %305
  store i32 371, i32* %lrc, align 4
  %316 = load i32* %prlc, align 4
  %317 = icmp ne i32 %316, 0
  br i1 %317, label %318, label %321

; <label>:318                                     ; preds = %315
  %319 = load i32* %lrc, align 4
  %320 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %319)
  br label %321

; <label>:321                                     ; preds = %318, %315
  br label %322

; <label>:322                                     ; preds = %321, %305
  store i8 12, i8* %cl, align 1
  store i16 10, i16* %sr, align 2
  %323 = load i16* %sr, align 2
  %324 = sext i16 %323 to i32
  %325 = load i8* %cl, align 1
  %326 = sext i8 %325 to i32
  %327 = or i32 %326, %324
  %328 = trunc i32 %327 to i8
  store i8 %328, i8* %cl, align 1
  %329 = load i8* %cl, align 1
  %330 = sext i8 %329 to i32
  %331 = icmp ne i32 %330, 14
  br i1 %331, label %332, label %339

; <label>:332                                     ; preds = %322
  store i32 372, i32* %lrc, align 4
  %333 = load i32* %prlc, align 4
  %334 = icmp ne i32 %333, 0
  br i1 %334, label %335, label %338

; <label>:335                                     ; preds = %332
  %336 = load i32* %lrc, align 4
  %337 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %336)
  br label %338

; <label>:338                                     ; preds = %335, %332
  br label %339

; <label>:339                                     ; preds = %338, %322
  store i8 12, i8* %cl, align 1
  store i32 10, i32* %ir, align 4
  %340 = load i32* %ir, align 4
  %341 = load i8* %cl, align 1
  %342 = sext i8 %341 to i32
  %343 = or i32 %342, %340
  %344 = trunc i32 %343 to i8
  store i8 %344, i8* %cl, align 1
  %345 = load i8* %cl, align 1
  %346 = sext i8 %345 to i32
  %347 = icmp ne i32 %346, 14
  br i1 %347, label %348, label %355

; <label>:348                                     ; preds = %339
  store i32 373, i32* %lrc, align 4
  %349 = load i32* %prlc, align 4
  %350 = icmp ne i32 %349, 0
  br i1 %350, label %351, label %354

; <label>:351                                     ; preds = %348
  %352 = load i32* %lrc, align 4
  %353 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %352)
  br label %354

; <label>:354                                     ; preds = %351, %348
  br label %355

; <label>:355                                     ; preds = %354, %339
  store i8 12, i8* %cl, align 1
  store i64 10, i64* %lr, align 8
  %356 = load i64* %lr, align 8
  %357 = load i8* %cl, align 1
  %358 = sext i8 %357 to i64
  %359 = or i64 %358, %356
  %360 = trunc i64 %359 to i8
  store i8 %360, i8* %cl, align 1
  %361 = load i8* %cl, align 1
  %362 = sext i8 %361 to i32
  %363 = icmp ne i32 %362, 14
  br i1 %363, label %364, label %371

; <label>:364                                     ; preds = %355
  store i32 374, i32* %lrc, align 4
  %365 = load i32* %prlc, align 4
  %366 = icmp ne i32 %365, 0
  br i1 %366, label %367, label %370

; <label>:367                                     ; preds = %364
  %368 = load i32* %lrc, align 4
  %369 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %368)
  br label %370

; <label>:370                                     ; preds = %367, %364
  br label %371

; <label>:371                                     ; preds = %370, %355
  store i8 12, i8* %cl, align 1
  store i32 10, i32* %ur, align 4
  %372 = load i32* %ur, align 4
  %373 = load i8* %cl, align 1
  %374 = sext i8 %373 to i32
  %375 = or i32 %374, %372
  %376 = trunc i32 %375 to i8
  store i8 %376, i8* %cl, align 1
  %377 = load i8* %cl, align 1
  %378 = sext i8 %377 to i32
  %379 = icmp ne i32 %378, 14
  br i1 %379, label %380, label %387

; <label>:380                                     ; preds = %371
  store i32 375, i32* %lrc, align 4
  %381 = load i32* %prlc, align 4
  %382 = icmp ne i32 %381, 0
  br i1 %382, label %383, label %386

; <label>:383                                     ; preds = %380
  %384 = load i32* %lrc, align 4
  %385 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %384)
  br label %386

; <label>:386                                     ; preds = %383, %380
  br label %387

; <label>:387                                     ; preds = %386, %371
  store i16 12, i16* %sl, align 2
  store i8 10, i8* %cr, align 1
  %388 = load i8* %cr, align 1
  %389 = sext i8 %388 to i32
  %390 = load i16* %sl, align 2
  %391 = sext i16 %390 to i32
  %392 = or i32 %391, %389
  %393 = trunc i32 %392 to i16
  store i16 %393, i16* %sl, align 2
  %394 = load i16* %sl, align 2
  %395 = sext i16 %394 to i32
  %396 = icmp ne i32 %395, 14
  br i1 %396, label %397, label %404

; <label>:397                                     ; preds = %387
  store i32 376, i32* %lrc, align 4
  %398 = load i32* %prlc, align 4
  %399 = icmp ne i32 %398, 0
  br i1 %399, label %400, label %403

; <label>:400                                     ; preds = %397
  %401 = load i32* %lrc, align 4
  %402 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %401)
  br label %403

; <label>:403                                     ; preds = %400, %397
  br label %404

; <label>:404                                     ; preds = %403, %387
  store i16 12, i16* %sl, align 2
  store i16 10, i16* %sr, align 2
  %405 = load i16* %sr, align 2
  %406 = sext i16 %405 to i32
  %407 = load i16* %sl, align 2
  %408 = sext i16 %407 to i32
  %409 = or i32 %408, %406
  %410 = trunc i32 %409 to i16
  store i16 %410, i16* %sl, align 2
  %411 = load i16* %sl, align 2
  %412 = sext i16 %411 to i32
  %413 = icmp ne i32 %412, 14
  br i1 %413, label %414, label %421

; <label>:414                                     ; preds = %404
  store i32 377, i32* %lrc, align 4
  %415 = load i32* %prlc, align 4
  %416 = icmp ne i32 %415, 0
  br i1 %416, label %417, label %420

; <label>:417                                     ; preds = %414
  %418 = load i32* %lrc, align 4
  %419 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %418)
  br label %420

; <label>:420                                     ; preds = %417, %414
  br label %421

; <label>:421                                     ; preds = %420, %404
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ir, align 4
  %422 = load i32* %ir, align 4
  %423 = load i16* %sl, align 2
  %424 = sext i16 %423 to i32
  %425 = or i32 %424, %422
  %426 = trunc i32 %425 to i16
  store i16 %426, i16* %sl, align 2
  %427 = load i16* %sl, align 2
  %428 = sext i16 %427 to i32
  %429 = icmp ne i32 %428, 14
  br i1 %429, label %430, label %437

; <label>:430                                     ; preds = %421
  store i32 378, i32* %lrc, align 4
  %431 = load i32* %prlc, align 4
  %432 = icmp ne i32 %431, 0
  br i1 %432, label %433, label %436

; <label>:433                                     ; preds = %430
  %434 = load i32* %lrc, align 4
  %435 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %434)
  br label %436

; <label>:436                                     ; preds = %433, %430
  br label %437

; <label>:437                                     ; preds = %436, %421
  store i16 12, i16* %sl, align 2
  store i64 10, i64* %lr, align 8
  %438 = load i64* %lr, align 8
  %439 = load i16* %sl, align 2
  %440 = sext i16 %439 to i64
  %441 = or i64 %440, %438
  %442 = trunc i64 %441 to i16
  store i16 %442, i16* %sl, align 2
  %443 = load i16* %sl, align 2
  %444 = sext i16 %443 to i32
  %445 = icmp ne i32 %444, 14
  br i1 %445, label %446, label %453

; <label>:446                                     ; preds = %437
  store i32 379, i32* %lrc, align 4
  %447 = load i32* %prlc, align 4
  %448 = icmp ne i32 %447, 0
  br i1 %448, label %449, label %452

; <label>:449                                     ; preds = %446
  %450 = load i32* %lrc, align 4
  %451 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %450)
  br label %452

; <label>:452                                     ; preds = %449, %446
  br label %453

; <label>:453                                     ; preds = %452, %437
  store i16 12, i16* %sl, align 2
  store i32 10, i32* %ur, align 4
  %454 = load i32* %ur, align 4
  %455 = load i16* %sl, align 2
  %456 = sext i16 %455 to i32
  %457 = or i32 %456, %454
  %458 = trunc i32 %457 to i16
  store i16 %458, i16* %sl, align 2
  %459 = load i16* %sl, align 2
  %460 = sext i16 %459 to i32
  %461 = icmp ne i32 %460, 14
  br i1 %461, label %462, label %469

; <label>:462                                     ; preds = %453
  store i32 380, i32* %lrc, align 4
  %463 = load i32* %prlc, align 4
  %464 = icmp ne i32 %463, 0
  br i1 %464, label %465, label %468

; <label>:465                                     ; preds = %462
  %466 = load i32* %lrc, align 4
  %467 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %466)
  br label %468

; <label>:468                                     ; preds = %465, %462
  br label %469

; <label>:469                                     ; preds = %468, %453
  store i32 12, i32* %il, align 4
  store i8 10, i8* %cr, align 1
  %470 = load i8* %cr, align 1
  %471 = sext i8 %470 to i32
  %472 = load i32* %il, align 4
  %473 = or i32 %472, %471
  store i32 %473, i32* %il, align 4
  %474 = load i32* %il, align 4
  %475 = icmp ne i32 %474, 14
  br i1 %475, label %476, label %483

; <label>:476                                     ; preds = %469
  store i32 381, i32* %lrc, align 4
  %477 = load i32* %prlc, align 4
  %478 = icmp ne i32 %477, 0
  br i1 %478, label %479, label %482

; <label>:479                                     ; preds = %476
  %480 = load i32* %lrc, align 4
  %481 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %480)
  br label %482

; <label>:482                                     ; preds = %479, %476
  br label %483

; <label>:483                                     ; preds = %482, %469
  store i32 12, i32* %il, align 4
  store i16 10, i16* %sr, align 2
  %484 = load i16* %sr, align 2
  %485 = sext i16 %484 to i32
  %486 = load i32* %il, align 4
  %487 = or i32 %486, %485
  store i32 %487, i32* %il, align 4
  %488 = load i32* %il, align 4
  %489 = icmp ne i32 %488, 14
  br i1 %489, label %490, label %497

; <label>:490                                     ; preds = %483
  store i32 382, i32* %lrc, align 4
  %491 = load i32* %prlc, align 4
  %492 = icmp ne i32 %491, 0
  br i1 %492, label %493, label %496

; <label>:493                                     ; preds = %490
  %494 = load i32* %lrc, align 4
  %495 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %494)
  br label %496

; <label>:496                                     ; preds = %493, %490
  br label %497

; <label>:497                                     ; preds = %496, %483
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ir, align 4
  %498 = load i32* %ir, align 4
  %499 = load i32* %il, align 4
  %500 = or i32 %499, %498
  store i32 %500, i32* %il, align 4
  %501 = load i32* %il, align 4
  %502 = icmp ne i32 %501, 14
  br i1 %502, label %503, label %510

; <label>:503                                     ; preds = %497
  store i32 383, i32* %lrc, align 4
  %504 = load i32* %prlc, align 4
  %505 = icmp ne i32 %504, 0
  br i1 %505, label %506, label %509

; <label>:506                                     ; preds = %503
  %507 = load i32* %lrc, align 4
  %508 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %507)
  br label %509

; <label>:509                                     ; preds = %506, %503
  br label %510

; <label>:510                                     ; preds = %509, %497
  store i32 12, i32* %il, align 4
  store i64 10, i64* %lr, align 8
  %511 = load i64* %lr, align 8
  %512 = load i32* %il, align 4
  %513 = sext i32 %512 to i64
  %514 = or i64 %513, %511
  %515 = trunc i64 %514 to i32
  store i32 %515, i32* %il, align 4
  %516 = load i32* %il, align 4
  %517 = icmp ne i32 %516, 14
  br i1 %517, label %518, label %525

; <label>:518                                     ; preds = %510
  store i32 384, i32* %lrc, align 4
  %519 = load i32* %prlc, align 4
  %520 = icmp ne i32 %519, 0
  br i1 %520, label %521, label %524

; <label>:521                                     ; preds = %518
  %522 = load i32* %lrc, align 4
  %523 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %522)
  br label %524

; <label>:524                                     ; preds = %521, %518
  br label %525

; <label>:525                                     ; preds = %524, %510
  store i32 12, i32* %il, align 4
  store i32 10, i32* %ur, align 4
  %526 = load i32* %ur, align 4
  %527 = load i32* %il, align 4
  %528 = or i32 %527, %526
  store i32 %528, i32* %il, align 4
  %529 = load i32* %il, align 4
  %530 = icmp ne i32 %529, 14
  br i1 %530, label %531, label %538

; <label>:531                                     ; preds = %525
  store i32 385, i32* %lrc, align 4
  %532 = load i32* %prlc, align 4
  %533 = icmp ne i32 %532, 0
  br i1 %533, label %534, label %537

; <label>:534                                     ; preds = %531
  %535 = load i32* %lrc, align 4
  %536 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %535)
  br label %537

; <label>:537                                     ; preds = %534, %531
  br label %538

; <label>:538                                     ; preds = %537, %525
  store i64 12, i64* %ll, align 8
  store i8 10, i8* %cr, align 1
  %539 = load i8* %cr, align 1
  %540 = sext i8 %539 to i64
  %541 = load i64* %ll, align 8
  %542 = or i64 %541, %540
  store i64 %542, i64* %ll, align 8
  %543 = load i64* %ll, align 8
  %544 = icmp ne i64 %543, 14
  br i1 %544, label %545, label %552

; <label>:545                                     ; preds = %538
  store i32 386, i32* %lrc, align 4
  %546 = load i32* %prlc, align 4
  %547 = icmp ne i32 %546, 0
  br i1 %547, label %548, label %551

; <label>:548                                     ; preds = %545
  %549 = load i32* %lrc, align 4
  %550 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %549)
  br label %551

; <label>:551                                     ; preds = %548, %545
  br label %552

; <label>:552                                     ; preds = %551, %538
  store i64 12, i64* %ll, align 8
  store i16 10, i16* %sr, align 2
  %553 = load i16* %sr, align 2
  %554 = sext i16 %553 to i64
  %555 = load i64* %ll, align 8
  %556 = or i64 %555, %554
  store i64 %556, i64* %ll, align 8
  %557 = load i64* %ll, align 8
  %558 = icmp ne i64 %557, 14
  br i1 %558, label %559, label %566

; <label>:559                                     ; preds = %552
  store i32 387, i32* %lrc, align 4
  %560 = load i32* %prlc, align 4
  %561 = icmp ne i32 %560, 0
  br i1 %561, label %562, label %565

; <label>:562                                     ; preds = %559
  %563 = load i32* %lrc, align 4
  %564 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %563)
  br label %565

; <label>:565                                     ; preds = %562, %559
  br label %566

; <label>:566                                     ; preds = %565, %552
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ir, align 4
  %567 = load i32* %ir, align 4
  %568 = sext i32 %567 to i64
  %569 = load i64* %ll, align 8
  %570 = or i64 %569, %568
  store i64 %570, i64* %ll, align 8
  %571 = load i64* %ll, align 8
  %572 = icmp ne i64 %571, 14
  br i1 %572, label %573, label %580

; <label>:573                                     ; preds = %566
  store i32 388, i32* %lrc, align 4
  %574 = load i32* %prlc, align 4
  %575 = icmp ne i32 %574, 0
  br i1 %575, label %576, label %579

; <label>:576                                     ; preds = %573
  %577 = load i32* %lrc, align 4
  %578 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %577)
  br label %579

; <label>:579                                     ; preds = %576, %573
  br label %580

; <label>:580                                     ; preds = %579, %566
  store i64 12, i64* %ll, align 8
  store i64 10, i64* %lr, align 8
  %581 = load i64* %lr, align 8
  %582 = load i64* %ll, align 8
  %583 = or i64 %582, %581
  store i64 %583, i64* %ll, align 8
  %584 = load i64* %ll, align 8
  %585 = icmp ne i64 %584, 14
  br i1 %585, label %586, label %593

; <label>:586                                     ; preds = %580
  store i32 389, i32* %lrc, align 4
  %587 = load i32* %prlc, align 4
  %588 = icmp ne i32 %587, 0
  br i1 %588, label %589, label %592

; <label>:589                                     ; preds = %586
  %590 = load i32* %lrc, align 4
  %591 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %590)
  br label %592

; <label>:592                                     ; preds = %589, %586
  br label %593

; <label>:593                                     ; preds = %592, %580
  store i64 12, i64* %ll, align 8
  store i32 10, i32* %ur, align 4
  %594 = load i32* %ur, align 4
  %595 = zext i32 %594 to i64
  %596 = load i64* %ll, align 8
  %597 = or i64 %596, %595
  store i64 %597, i64* %ll, align 8
  %598 = load i64* %ll, align 8
  %599 = icmp ne i64 %598, 14
  br i1 %599, label %600, label %607

; <label>:600                                     ; preds = %593
  store i32 390, i32* %lrc, align 4
  %601 = load i32* %prlc, align 4
  %602 = icmp ne i32 %601, 0
  br i1 %602, label %603, label %606

; <label>:603                                     ; preds = %600
  %604 = load i32* %lrc, align 4
  %605 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %604)
  br label %606

; <label>:606                                     ; preds = %603, %600
  br label %607

; <label>:607                                     ; preds = %606, %593
  store i32 12, i32* %ul, align 4
  store i8 10, i8* %cr, align 1
  %608 = load i8* %cr, align 1
  %609 = sext i8 %608 to i32
  %610 = load i32* %ul, align 4
  %611 = or i32 %610, %609
  store i32 %611, i32* %ul, align 4
  %612 = load i32* %ul, align 4
  %613 = icmp ne i32 %612, 14
  br i1 %613, label %614, label %621

; <label>:614                                     ; preds = %607
  store i32 391, i32* %lrc, align 4
  %615 = load i32* %prlc, align 4
  %616 = icmp ne i32 %615, 0
  br i1 %616, label %617, label %620

; <label>:617                                     ; preds = %614
  %618 = load i32* %lrc, align 4
  %619 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %618)
  br label %620

; <label>:620                                     ; preds = %617, %614
  br label %621

; <label>:621                                     ; preds = %620, %607
  store i32 12, i32* %ul, align 4
  store i16 10, i16* %sr, align 2
  %622 = load i16* %sr, align 2
  %623 = sext i16 %622 to i32
  %624 = load i32* %ul, align 4
  %625 = or i32 %624, %623
  store i32 %625, i32* %ul, align 4
  %626 = load i32* %ul, align 4
  %627 = icmp ne i32 %626, 14
  br i1 %627, label %628, label %635

; <label>:628                                     ; preds = %621
  store i32 392, i32* %lrc, align 4
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
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ir, align 4
  %636 = load i32* %ir, align 4
  %637 = load i32* %ul, align 4
  %638 = or i32 %637, %636
  store i32 %638, i32* %ul, align 4
  %639 = load i32* %ul, align 4
  %640 = icmp ne i32 %639, 14
  br i1 %640, label %641, label %648

; <label>:641                                     ; preds = %635
  store i32 393, i32* %lrc, align 4
  %642 = load i32* %prlc, align 4
  %643 = icmp ne i32 %642, 0
  br i1 %643, label %644, label %647

; <label>:644                                     ; preds = %641
  %645 = load i32* %lrc, align 4
  %646 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %645)
  br label %647

; <label>:647                                     ; preds = %644, %641
  br label %648

; <label>:648                                     ; preds = %647, %635
  store i32 12, i32* %ul, align 4
  store i64 10, i64* %lr, align 8
  %649 = load i64* %lr, align 8
  %650 = load i32* %ul, align 4
  %651 = zext i32 %650 to i64
  %652 = or i64 %651, %649
  %653 = trunc i64 %652 to i32
  store i32 %653, i32* %ul, align 4
  %654 = load i32* %ul, align 4
  %655 = icmp ne i32 %654, 14
  br i1 %655, label %656, label %663

; <label>:656                                     ; preds = %648
  store i32 394, i32* %lrc, align 4
  %657 = load i32* %prlc, align 4
  %658 = icmp ne i32 %657, 0
  br i1 %658, label %659, label %662

; <label>:659                                     ; preds = %656
  %660 = load i32* %lrc, align 4
  %661 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %660)
  br label %662

; <label>:662                                     ; preds = %659, %656
  br label %663

; <label>:663                                     ; preds = %662, %648
  store i32 12, i32* %ul, align 4
  store i32 10, i32* %ur, align 4
  %664 = load i32* %ur, align 4
  %665 = load i32* %ul, align 4
  %666 = or i32 %665, %664
  store i32 %666, i32* %ul, align 4
  %667 = load i32* %ul, align 4
  %668 = icmp ne i32 %667, 14
  br i1 %668, label %669, label %676

; <label>:669                                     ; preds = %663
  store i32 395, i32* %lrc, align 4
  %670 = load i32* %prlc, align 4
  %671 = icmp ne i32 %670, 0
  br i1 %671, label %672, label %675

; <label>:672                                     ; preds = %669
  %673 = load i32* %lrc, align 4
  %674 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %673)
  br label %675

; <label>:675                                     ; preds = %672, %669
  br label %676

; <label>:676                                     ; preds = %675, %663
  %677 = load i32* %lrc, align 4
  %678 = icmp ne i32 %677, 0
  br i1 %678, label %679, label %687

; <label>:679                                     ; preds = %676
  store i32 1, i32* %rc, align 4
  %680 = load %struct.defs** %1, align 8
  %681 = getelementptr inbounds %struct.defs* %680, i32 0, i32 11
  %682 = load i32* %681, align 4
  %683 = icmp ne i32 %682, 0
  br i1 %683, label %684, label %686

; <label>:684                                     ; preds = %679
  %685 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %686

; <label>:686                                     ; preds = %684, %679
  br label %687

; <label>:687                                     ; preds = %686, %676
  %688 = load i32* %rc, align 4
  ret i32 %688
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
