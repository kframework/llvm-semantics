; ModuleID = './cq-20-s714-f.c'
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
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %17 = load i8, i8* %cr, align 1
  %18 = sext i8 %17 to i32
  %19 = load i16, i16* %sl, align 2
  %20 = sext i16 %19 to i32
  %21 = srem i32 %20, %18
  %22 = trunc i32 %21 to i16
  store i16 %22, i16* %sl, align 2
  %23 = load i16, i16* %sl, align 2
  %24 = sext i16 %23 to i32
  %25 = icmp ne i32 %24, 1
  br i1 %25, label %26, label %33

; <label>:26                                      ; preds = %16
  store i32 251, i32* %lrc, align 4
  %27 = load i32, i32* %prlc, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %26
  %30 = load i32, i32* %lrc, align 4
  %31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %30)
  br label %32

; <label>:32                                      ; preds = %29, %26
  br label %33

; <label>:33                                      ; preds = %32, %16
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %34 = load i16, i16* %sr, align 2
  %35 = sext i16 %34 to i32
  %36 = load i16, i16* %sl, align 2
  %37 = sext i16 %36 to i32
  %38 = srem i32 %37, %35
  %39 = trunc i32 %38 to i16
  store i16 %39, i16* %sl, align 2
  %40 = load i16, i16* %sl, align 2
  %41 = sext i16 %40 to i32
  %42 = icmp ne i32 %41, 1
  br i1 %42, label %43, label %50

; <label>:43                                      ; preds = %33
  store i32 252, i32* %lrc, align 4
  %44 = load i32, i32* %prlc, align 4
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %46, label %49

; <label>:46                                      ; preds = %43
  %47 = load i32, i32* %lrc, align 4
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %47)
  br label %49

; <label>:49                                      ; preds = %46, %43
  br label %50

; <label>:50                                      ; preds = %49, %33
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %51 = load i32, i32* %ir, align 4
  %52 = load i16, i16* %sl, align 2
  %53 = sext i16 %52 to i32
  %54 = srem i32 %53, %51
  %55 = trunc i32 %54 to i16
  store i16 %55, i16* %sl, align 2
  %56 = load i16, i16* %sl, align 2
  %57 = sext i16 %56 to i32
  %58 = icmp ne i32 %57, 1
  br i1 %58, label %59, label %66

; <label>:59                                      ; preds = %50
  store i32 253, i32* %lrc, align 4
  %60 = load i32, i32* %prlc, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %65

; <label>:62                                      ; preds = %59
  %63 = load i32, i32* %lrc, align 4
  %64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %63)
  br label %65

; <label>:65                                      ; preds = %62, %59
  br label %66

; <label>:66                                      ; preds = %65, %50
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %67 = load i64, i64* %lr, align 8
  %68 = load i16, i16* %sl, align 2
  %69 = sext i16 %68 to i64
  %70 = srem i64 %69, %67
  %71 = trunc i64 %70 to i16
  store i16 %71, i16* %sl, align 2
  %72 = load i16, i16* %sl, align 2
  %73 = sext i16 %72 to i32
  %74 = icmp ne i32 %73, 1
  br i1 %74, label %75, label %82

; <label>:75                                      ; preds = %66
  store i32 254, i32* %lrc, align 4
  %76 = load i32, i32* %prlc, align 4
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %81

; <label>:78                                      ; preds = %75
  %79 = load i32, i32* %lrc, align 4
  %80 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %79)
  br label %81

; <label>:81                                      ; preds = %78, %75
  br label %82

; <label>:82                                      ; preds = %81, %66
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %83 = load i32, i32* %ur, align 4
  %84 = load i16, i16* %sl, align 2
  %85 = sext i16 %84 to i32
  %86 = urem i32 %85, %83
  %87 = trunc i32 %86 to i16
  store i16 %87, i16* %sl, align 2
  %88 = load i16, i16* %sl, align 2
  %89 = sext i16 %88 to i32
  %90 = icmp ne i32 %89, 1
  br i1 %90, label %91, label %98

; <label>:91                                      ; preds = %82
  store i32 255, i32* %lrc, align 4
  %92 = load i32, i32* %prlc, align 4
  %93 = icmp ne i32 %92, 0
  br i1 %93, label %94, label %97

; <label>:94                                      ; preds = %91
  %95 = load i32, i32* %lrc, align 4
  %96 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %95)
  br label %97

; <label>:97                                      ; preds = %94, %91
  br label %98

; <label>:98                                      ; preds = %97, %82
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %99 = load i8, i8* %cr, align 1
  %100 = sext i8 %99 to i32
  %101 = load i32, i32* %il, align 4
  %102 = srem i32 %101, %100
  store i32 %102, i32* %il, align 4
  %103 = load i32, i32* %il, align 4
  %104 = icmp ne i32 %103, 1
  br i1 %104, label %105, label %112

; <label>:105                                     ; preds = %98
  store i32 256, i32* %lrc, align 4
  %106 = load i32, i32* %prlc, align 4
  %107 = icmp ne i32 %106, 0
  br i1 %107, label %108, label %111

; <label>:108                                     ; preds = %105
  %109 = load i32, i32* %lrc, align 4
  %110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %109)
  br label %111

; <label>:111                                     ; preds = %108, %105
  br label %112

; <label>:112                                     ; preds = %111, %98
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %113 = load i16, i16* %sr, align 2
  %114 = sext i16 %113 to i32
  %115 = load i32, i32* %il, align 4
  %116 = srem i32 %115, %114
  store i32 %116, i32* %il, align 4
  %117 = load i32, i32* %il, align 4
  %118 = icmp ne i32 %117, 1
  br i1 %118, label %119, label %126

; <label>:119                                     ; preds = %112
  store i32 257, i32* %lrc, align 4
  %120 = load i32, i32* %prlc, align 4
  %121 = icmp ne i32 %120, 0
  br i1 %121, label %122, label %125

; <label>:122                                     ; preds = %119
  %123 = load i32, i32* %lrc, align 4
  %124 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %123)
  br label %125

; <label>:125                                     ; preds = %122, %119
  br label %126

; <label>:126                                     ; preds = %125, %112
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %127 = load i32, i32* %ir, align 4
  %128 = load i32, i32* %il, align 4
  %129 = srem i32 %128, %127
  store i32 %129, i32* %il, align 4
  %130 = load i32, i32* %il, align 4
  %131 = icmp ne i32 %130, 1
  br i1 %131, label %132, label %139

; <label>:132                                     ; preds = %126
  store i32 258, i32* %lrc, align 4
  %133 = load i32, i32* %prlc, align 4
  %134 = icmp ne i32 %133, 0
  br i1 %134, label %135, label %138

; <label>:135                                     ; preds = %132
  %136 = load i32, i32* %lrc, align 4
  %137 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %136)
  br label %138

; <label>:138                                     ; preds = %135, %132
  br label %139

; <label>:139                                     ; preds = %138, %126
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %140 = load i64, i64* %lr, align 8
  %141 = load i32, i32* %il, align 4
  %142 = sext i32 %141 to i64
  %143 = srem i64 %142, %140
  %144 = trunc i64 %143 to i32
  store i32 %144, i32* %il, align 4
  %145 = load i32, i32* %il, align 4
  %146 = icmp ne i32 %145, 1
  br i1 %146, label %147, label %154

; <label>:147                                     ; preds = %139
  store i32 259, i32* %lrc, align 4
  %148 = load i32, i32* %prlc, align 4
  %149 = icmp ne i32 %148, 0
  br i1 %149, label %150, label %153

; <label>:150                                     ; preds = %147
  %151 = load i32, i32* %lrc, align 4
  %152 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %151)
  br label %153

; <label>:153                                     ; preds = %150, %147
  br label %154

; <label>:154                                     ; preds = %153, %139
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %155 = load i32, i32* %ur, align 4
  %156 = load i32, i32* %il, align 4
  %157 = urem i32 %156, %155
  store i32 %157, i32* %il, align 4
  %158 = load i32, i32* %il, align 4
  %159 = icmp ne i32 %158, 1
  br i1 %159, label %160, label %167

; <label>:160                                     ; preds = %154
  store i32 260, i32* %lrc, align 4
  %161 = load i32, i32* %prlc, align 4
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %163, label %166

; <label>:163                                     ; preds = %160
  %164 = load i32, i32* %lrc, align 4
  %165 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %164)
  br label %166

; <label>:166                                     ; preds = %163, %160
  br label %167

; <label>:167                                     ; preds = %166, %154
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %168 = load i8, i8* %cr, align 1
  %169 = sext i8 %168 to i64
  %170 = load i64, i64* %ll, align 8
  %171 = srem i64 %170, %169
  store i64 %171, i64* %ll, align 8
  %172 = load i64, i64* %ll, align 8
  %173 = icmp ne i64 %172, 1
  br i1 %173, label %174, label %181

; <label>:174                                     ; preds = %167
  store i32 261, i32* %lrc, align 4
  %175 = load i32, i32* %prlc, align 4
  %176 = icmp ne i32 %175, 0
  br i1 %176, label %177, label %180

; <label>:177                                     ; preds = %174
  %178 = load i32, i32* %lrc, align 4
  %179 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %178)
  br label %180

; <label>:180                                     ; preds = %177, %174
  br label %181

; <label>:181                                     ; preds = %180, %167
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %182 = load i16, i16* %sr, align 2
  %183 = sext i16 %182 to i64
  %184 = load i64, i64* %ll, align 8
  %185 = srem i64 %184, %183
  store i64 %185, i64* %ll, align 8
  %186 = load i64, i64* %ll, align 8
  %187 = icmp ne i64 %186, 1
  br i1 %187, label %188, label %195

; <label>:188                                     ; preds = %181
  store i32 262, i32* %lrc, align 4
  %189 = load i32, i32* %prlc, align 4
  %190 = icmp ne i32 %189, 0
  br i1 %190, label %191, label %194

; <label>:191                                     ; preds = %188
  %192 = load i32, i32* %lrc, align 4
  %193 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %192)
  br label %194

; <label>:194                                     ; preds = %191, %188
  br label %195

; <label>:195                                     ; preds = %194, %181
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %196 = load i32, i32* %ir, align 4
  %197 = sext i32 %196 to i64
  %198 = load i64, i64* %ll, align 8
  %199 = srem i64 %198, %197
  store i64 %199, i64* %ll, align 8
  %200 = load i64, i64* %ll, align 8
  %201 = icmp ne i64 %200, 1
  br i1 %201, label %202, label %209

; <label>:202                                     ; preds = %195
  store i32 263, i32* %lrc, align 4
  %203 = load i32, i32* %prlc, align 4
  %204 = icmp ne i32 %203, 0
  br i1 %204, label %205, label %208

; <label>:205                                     ; preds = %202
  %206 = load i32, i32* %lrc, align 4
  %207 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %206)
  br label %208

; <label>:208                                     ; preds = %205, %202
  br label %209

; <label>:209                                     ; preds = %208, %195
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %210 = load i64, i64* %lr, align 8
  %211 = load i64, i64* %ll, align 8
  %212 = srem i64 %211, %210
  store i64 %212, i64* %ll, align 8
  %213 = load i64, i64* %ll, align 8
  %214 = icmp ne i64 %213, 1
  br i1 %214, label %215, label %222

; <label>:215                                     ; preds = %209
  store i32 264, i32* %lrc, align 4
  %216 = load i32, i32* %prlc, align 4
  %217 = icmp ne i32 %216, 0
  br i1 %217, label %218, label %221

; <label>:218                                     ; preds = %215
  %219 = load i32, i32* %lrc, align 4
  %220 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %219)
  br label %221

; <label>:221                                     ; preds = %218, %215
  br label %222

; <label>:222                                     ; preds = %221, %209
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %223 = load i32, i32* %ur, align 4
  %224 = zext i32 %223 to i64
  %225 = load i64, i64* %ll, align 8
  %226 = srem i64 %225, %224
  store i64 %226, i64* %ll, align 8
  %227 = load i64, i64* %ll, align 8
  %228 = icmp ne i64 %227, 1
  br i1 %228, label %229, label %236

; <label>:229                                     ; preds = %222
  store i32 265, i32* %lrc, align 4
  %230 = load i32, i32* %prlc, align 4
  %231 = icmp ne i32 %230, 0
  br i1 %231, label %232, label %235

; <label>:232                                     ; preds = %229
  %233 = load i32, i32* %lrc, align 4
  %234 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %233)
  br label %235

; <label>:235                                     ; preds = %232, %229
  br label %236

; <label>:236                                     ; preds = %235, %222
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %237 = load i8, i8* %cr, align 1
  %238 = sext i8 %237 to i32
  %239 = load i32, i32* %ul, align 4
  %240 = urem i32 %239, %238
  store i32 %240, i32* %ul, align 4
  %241 = load i32, i32* %ul, align 4
  %242 = icmp ne i32 %241, 1
  br i1 %242, label %243, label %250

; <label>:243                                     ; preds = %236
  store i32 266, i32* %lrc, align 4
  %244 = load i32, i32* %prlc, align 4
  %245 = icmp ne i32 %244, 0
  br i1 %245, label %246, label %249

; <label>:246                                     ; preds = %243
  %247 = load i32, i32* %lrc, align 4
  %248 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %247)
  br label %249

; <label>:249                                     ; preds = %246, %243
  br label %250

; <label>:250                                     ; preds = %249, %236
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %251 = load i16, i16* %sr, align 2
  %252 = sext i16 %251 to i32
  %253 = load i32, i32* %ul, align 4
  %254 = urem i32 %253, %252
  store i32 %254, i32* %ul, align 4
  %255 = load i32, i32* %ul, align 4
  %256 = icmp ne i32 %255, 1
  br i1 %256, label %257, label %264

; <label>:257                                     ; preds = %250
  store i32 267, i32* %lrc, align 4
  %258 = load i32, i32* %prlc, align 4
  %259 = icmp ne i32 %258, 0
  br i1 %259, label %260, label %263

; <label>:260                                     ; preds = %257
  %261 = load i32, i32* %lrc, align 4
  %262 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %261)
  br label %263

; <label>:263                                     ; preds = %260, %257
  br label %264

; <label>:264                                     ; preds = %263, %250
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %265 = load i32, i32* %ir, align 4
  %266 = load i32, i32* %ul, align 4
  %267 = urem i32 %266, %265
  store i32 %267, i32* %ul, align 4
  %268 = load i32, i32* %ul, align 4
  %269 = icmp ne i32 %268, 1
  br i1 %269, label %270, label %277

; <label>:270                                     ; preds = %264
  store i32 268, i32* %lrc, align 4
  %271 = load i32, i32* %prlc, align 4
  %272 = icmp ne i32 %271, 0
  br i1 %272, label %273, label %276

; <label>:273                                     ; preds = %270
  %274 = load i32, i32* %lrc, align 4
  %275 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %274)
  br label %276

; <label>:276                                     ; preds = %273, %270
  br label %277

; <label>:277                                     ; preds = %276, %264
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %278 = load i64, i64* %lr, align 8
  %279 = load i32, i32* %ul, align 4
  %280 = zext i32 %279 to i64
  %281 = srem i64 %280, %278
  %282 = trunc i64 %281 to i32
  store i32 %282, i32* %ul, align 4
  %283 = load i32, i32* %ul, align 4
  %284 = icmp ne i32 %283, 1
  br i1 %284, label %285, label %292

; <label>:285                                     ; preds = %277
  store i32 269, i32* %lrc, align 4
  %286 = load i32, i32* %prlc, align 4
  %287 = icmp ne i32 %286, 0
  br i1 %287, label %288, label %291

; <label>:288                                     ; preds = %285
  %289 = load i32, i32* %lrc, align 4
  %290 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %289)
  br label %291

; <label>:291                                     ; preds = %288, %285
  br label %292

; <label>:292                                     ; preds = %291, %277
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %293 = load i32, i32* %ur, align 4
  %294 = load i32, i32* %ul, align 4
  %295 = urem i32 %294, %293
  store i32 %295, i32* %ul, align 4
  %296 = load i32, i32* %ul, align 4
  %297 = icmp ne i32 %296, 1
  br i1 %297, label %298, label %305

; <label>:298                                     ; preds = %292
  store i32 270, i32* %lrc, align 4
  %299 = load i32, i32* %prlc, align 4
  %300 = icmp ne i32 %299, 0
  br i1 %300, label %301, label %304

; <label>:301                                     ; preds = %298
  %302 = load i32, i32* %lrc, align 4
  %303 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %302)
  br label %304

; <label>:304                                     ; preds = %301, %298
  br label %305

; <label>:305                                     ; preds = %304, %292
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %306 = load i8, i8* %cr, align 1
  %307 = sext i8 %306 to i32
  %308 = load i8, i8* %cl, align 1
  %309 = sext i8 %308 to i32
  %310 = ashr i32 %309, %307
  %311 = trunc i32 %310 to i8
  store i8 %311, i8* %cl, align 1
  %312 = load i8, i8* %cl, align 1
  %313 = sext i8 %312 to i32
  %314 = icmp ne i32 %313, 1
  br i1 %314, label %315, label %322

; <label>:315                                     ; preds = %305
  store i32 271, i32* %lrc, align 4
  %316 = load i32, i32* %prlc, align 4
  %317 = icmp ne i32 %316, 0
  br i1 %317, label %318, label %321

; <label>:318                                     ; preds = %315
  %319 = load i32, i32* %lrc, align 4
  %320 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %319)
  br label %321

; <label>:321                                     ; preds = %318, %315
  br label %322

; <label>:322                                     ; preds = %321, %305
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %323 = load i16, i16* %sr, align 2
  %324 = sext i16 %323 to i32
  %325 = load i8, i8* %cl, align 1
  %326 = sext i8 %325 to i32
  %327 = ashr i32 %326, %324
  %328 = trunc i32 %327 to i8
  store i8 %328, i8* %cl, align 1
  %329 = load i8, i8* %cl, align 1
  %330 = sext i8 %329 to i32
  %331 = icmp ne i32 %330, 1
  br i1 %331, label %332, label %339

; <label>:332                                     ; preds = %322
  store i32 272, i32* %lrc, align 4
  %333 = load i32, i32* %prlc, align 4
  %334 = icmp ne i32 %333, 0
  br i1 %334, label %335, label %338

; <label>:335                                     ; preds = %332
  %336 = load i32, i32* %lrc, align 4
  %337 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %336)
  br label %338

; <label>:338                                     ; preds = %335, %332
  br label %339

; <label>:339                                     ; preds = %338, %322
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %340 = load i32, i32* %ir, align 4
  %341 = load i8, i8* %cl, align 1
  %342 = sext i8 %341 to i32
  %343 = ashr i32 %342, %340
  %344 = trunc i32 %343 to i8
  store i8 %344, i8* %cl, align 1
  %345 = load i8, i8* %cl, align 1
  %346 = sext i8 %345 to i32
  %347 = icmp ne i32 %346, 1
  br i1 %347, label %348, label %355

; <label>:348                                     ; preds = %339
  store i32 273, i32* %lrc, align 4
  %349 = load i32, i32* %prlc, align 4
  %350 = icmp ne i32 %349, 0
  br i1 %350, label %351, label %354

; <label>:351                                     ; preds = %348
  %352 = load i32, i32* %lrc, align 4
  %353 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %352)
  br label %354

; <label>:354                                     ; preds = %351, %348
  br label %355

; <label>:355                                     ; preds = %354, %339
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %356 = load i64, i64* %lr, align 8
  %357 = load i8, i8* %cl, align 1
  %358 = sext i8 %357 to i32
  %359 = trunc i64 %356 to i32
  %360 = ashr i32 %358, %359
  %361 = trunc i32 %360 to i8
  store i8 %361, i8* %cl, align 1
  %362 = load i8, i8* %cl, align 1
  %363 = sext i8 %362 to i32
  %364 = icmp ne i32 %363, 1
  br i1 %364, label %365, label %372

; <label>:365                                     ; preds = %355
  store i32 274, i32* %lrc, align 4
  %366 = load i32, i32* %prlc, align 4
  %367 = icmp ne i32 %366, 0
  br i1 %367, label %368, label %371

; <label>:368                                     ; preds = %365
  %369 = load i32, i32* %lrc, align 4
  %370 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %369)
  br label %371

; <label>:371                                     ; preds = %368, %365
  br label %372

; <label>:372                                     ; preds = %371, %355
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %373 = load i32, i32* %ur, align 4
  %374 = load i8, i8* %cl, align 1
  %375 = sext i8 %374 to i32
  %376 = ashr i32 %375, %373
  %377 = trunc i32 %376 to i8
  store i8 %377, i8* %cl, align 1
  %378 = load i8, i8* %cl, align 1
  %379 = sext i8 %378 to i32
  %380 = icmp ne i32 %379, 1
  br i1 %380, label %381, label %388

; <label>:381                                     ; preds = %372
  store i32 275, i32* %lrc, align 4
  %382 = load i32, i32* %prlc, align 4
  %383 = icmp ne i32 %382, 0
  br i1 %383, label %384, label %387

; <label>:384                                     ; preds = %381
  %385 = load i32, i32* %lrc, align 4
  %386 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %385)
  br label %387

; <label>:387                                     ; preds = %384, %381
  br label %388

; <label>:388                                     ; preds = %387, %372
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %389 = load i8, i8* %cr, align 1
  %390 = sext i8 %389 to i32
  %391 = load i16, i16* %sl, align 2
  %392 = sext i16 %391 to i32
  %393 = ashr i32 %392, %390
  %394 = trunc i32 %393 to i16
  store i16 %394, i16* %sl, align 2
  %395 = load i16, i16* %sl, align 2
  %396 = sext i16 %395 to i32
  %397 = icmp ne i32 %396, 1
  br i1 %397, label %398, label %405

; <label>:398                                     ; preds = %388
  store i32 276, i32* %lrc, align 4
  %399 = load i32, i32* %prlc, align 4
  %400 = icmp ne i32 %399, 0
  br i1 %400, label %401, label %404

; <label>:401                                     ; preds = %398
  %402 = load i32, i32* %lrc, align 4
  %403 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %402)
  br label %404

; <label>:404                                     ; preds = %401, %398
  br label %405

; <label>:405                                     ; preds = %404, %388
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %406 = load i16, i16* %sr, align 2
  %407 = sext i16 %406 to i32
  %408 = load i16, i16* %sl, align 2
  %409 = sext i16 %408 to i32
  %410 = ashr i32 %409, %407
  %411 = trunc i32 %410 to i16
  store i16 %411, i16* %sl, align 2
  %412 = load i16, i16* %sl, align 2
  %413 = sext i16 %412 to i32
  %414 = icmp ne i32 %413, 1
  br i1 %414, label %415, label %422

; <label>:415                                     ; preds = %405
  store i32 277, i32* %lrc, align 4
  %416 = load i32, i32* %prlc, align 4
  %417 = icmp ne i32 %416, 0
  br i1 %417, label %418, label %421

; <label>:418                                     ; preds = %415
  %419 = load i32, i32* %lrc, align 4
  %420 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %419)
  br label %421

; <label>:421                                     ; preds = %418, %415
  br label %422

; <label>:422                                     ; preds = %421, %405
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %423 = load i32, i32* %ir, align 4
  %424 = load i16, i16* %sl, align 2
  %425 = sext i16 %424 to i32
  %426 = ashr i32 %425, %423
  %427 = trunc i32 %426 to i16
  store i16 %427, i16* %sl, align 2
  %428 = load i16, i16* %sl, align 2
  %429 = sext i16 %428 to i32
  %430 = icmp ne i32 %429, 1
  br i1 %430, label %431, label %438

; <label>:431                                     ; preds = %422
  store i32 278, i32* %lrc, align 4
  %432 = load i32, i32* %prlc, align 4
  %433 = icmp ne i32 %432, 0
  br i1 %433, label %434, label %437

; <label>:434                                     ; preds = %431
  %435 = load i32, i32* %lrc, align 4
  %436 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %435)
  br label %437

; <label>:437                                     ; preds = %434, %431
  br label %438

; <label>:438                                     ; preds = %437, %422
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %439 = load i64, i64* %lr, align 8
  %440 = load i16, i16* %sl, align 2
  %441 = sext i16 %440 to i32
  %442 = trunc i64 %439 to i32
  %443 = ashr i32 %441, %442
  %444 = trunc i32 %443 to i16
  store i16 %444, i16* %sl, align 2
  %445 = load i16, i16* %sl, align 2
  %446 = sext i16 %445 to i32
  %447 = icmp ne i32 %446, 1
  br i1 %447, label %448, label %455

; <label>:448                                     ; preds = %438
  store i32 279, i32* %lrc, align 4
  %449 = load i32, i32* %prlc, align 4
  %450 = icmp ne i32 %449, 0
  br i1 %450, label %451, label %454

; <label>:451                                     ; preds = %448
  %452 = load i32, i32* %lrc, align 4
  %453 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %452)
  br label %454

; <label>:454                                     ; preds = %451, %448
  br label %455

; <label>:455                                     ; preds = %454, %438
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %456 = load i32, i32* %ur, align 4
  %457 = load i16, i16* %sl, align 2
  %458 = sext i16 %457 to i32
  %459 = ashr i32 %458, %456
  %460 = trunc i32 %459 to i16
  store i16 %460, i16* %sl, align 2
  %461 = load i16, i16* %sl, align 2
  %462 = sext i16 %461 to i32
  %463 = icmp ne i32 %462, 1
  br i1 %463, label %464, label %471

; <label>:464                                     ; preds = %455
  store i32 280, i32* %lrc, align 4
  %465 = load i32, i32* %prlc, align 4
  %466 = icmp ne i32 %465, 0
  br i1 %466, label %467, label %470

; <label>:467                                     ; preds = %464
  %468 = load i32, i32* %lrc, align 4
  %469 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %468)
  br label %470

; <label>:470                                     ; preds = %467, %464
  br label %471

; <label>:471                                     ; preds = %470, %455
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %472 = load i8, i8* %cr, align 1
  %473 = sext i8 %472 to i32
  %474 = load i32, i32* %il, align 4
  %475 = ashr i32 %474, %473
  store i32 %475, i32* %il, align 4
  %476 = load i32, i32* %il, align 4
  %477 = icmp ne i32 %476, 1
  br i1 %477, label %478, label %485

; <label>:478                                     ; preds = %471
  store i32 281, i32* %lrc, align 4
  %479 = load i32, i32* %prlc, align 4
  %480 = icmp ne i32 %479, 0
  br i1 %480, label %481, label %484

; <label>:481                                     ; preds = %478
  %482 = load i32, i32* %lrc, align 4
  %483 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %482)
  br label %484

; <label>:484                                     ; preds = %481, %478
  br label %485

; <label>:485                                     ; preds = %484, %471
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %486 = load i16, i16* %sr, align 2
  %487 = sext i16 %486 to i32
  %488 = load i32, i32* %il, align 4
  %489 = ashr i32 %488, %487
  store i32 %489, i32* %il, align 4
  %490 = load i32, i32* %il, align 4
  %491 = icmp ne i32 %490, 1
  br i1 %491, label %492, label %499

; <label>:492                                     ; preds = %485
  store i32 282, i32* %lrc, align 4
  %493 = load i32, i32* %prlc, align 4
  %494 = icmp ne i32 %493, 0
  br i1 %494, label %495, label %498

; <label>:495                                     ; preds = %492
  %496 = load i32, i32* %lrc, align 4
  %497 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %496)
  br label %498

; <label>:498                                     ; preds = %495, %492
  br label %499

; <label>:499                                     ; preds = %498, %485
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %500 = load i32, i32* %ir, align 4
  %501 = load i32, i32* %il, align 4
  %502 = ashr i32 %501, %500
  store i32 %502, i32* %il, align 4
  %503 = load i32, i32* %il, align 4
  %504 = icmp ne i32 %503, 1
  br i1 %504, label %505, label %512

; <label>:505                                     ; preds = %499
  store i32 283, i32* %lrc, align 4
  %506 = load i32, i32* %prlc, align 4
  %507 = icmp ne i32 %506, 0
  br i1 %507, label %508, label %511

; <label>:508                                     ; preds = %505
  %509 = load i32, i32* %lrc, align 4
  %510 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %509)
  br label %511

; <label>:511                                     ; preds = %508, %505
  br label %512

; <label>:512                                     ; preds = %511, %499
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %513 = load i64, i64* %lr, align 8
  %514 = load i32, i32* %il, align 4
  %515 = trunc i64 %513 to i32
  %516 = ashr i32 %514, %515
  store i32 %516, i32* %il, align 4
  %517 = load i32, i32* %il, align 4
  %518 = icmp ne i32 %517, 1
  br i1 %518, label %519, label %526

; <label>:519                                     ; preds = %512
  store i32 284, i32* %lrc, align 4
  %520 = load i32, i32* %prlc, align 4
  %521 = icmp ne i32 %520, 0
  br i1 %521, label %522, label %525

; <label>:522                                     ; preds = %519
  %523 = load i32, i32* %lrc, align 4
  %524 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %523)
  br label %525

; <label>:525                                     ; preds = %522, %519
  br label %526

; <label>:526                                     ; preds = %525, %512
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %527 = load i32, i32* %ur, align 4
  %528 = load i32, i32* %il, align 4
  %529 = ashr i32 %528, %527
  store i32 %529, i32* %il, align 4
  %530 = load i32, i32* %il, align 4
  %531 = icmp ne i32 %530, 1
  br i1 %531, label %532, label %539

; <label>:532                                     ; preds = %526
  store i32 285, i32* %lrc, align 4
  %533 = load i32, i32* %prlc, align 4
  %534 = icmp ne i32 %533, 0
  br i1 %534, label %535, label %538

; <label>:535                                     ; preds = %532
  %536 = load i32, i32* %lrc, align 4
  %537 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %536)
  br label %538

; <label>:538                                     ; preds = %535, %532
  br label %539

; <label>:539                                     ; preds = %538, %526
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %540 = load i8, i8* %cr, align 1
  %541 = sext i8 %540 to i32
  %542 = load i64, i64* %ll, align 8
  %543 = zext i32 %541 to i64
  %544 = ashr i64 %542, %543
  store i64 %544, i64* %ll, align 8
  %545 = load i64, i64* %ll, align 8
  %546 = icmp ne i64 %545, 1
  br i1 %546, label %547, label %554

; <label>:547                                     ; preds = %539
  store i32 286, i32* %lrc, align 4
  %548 = load i32, i32* %prlc, align 4
  %549 = icmp ne i32 %548, 0
  br i1 %549, label %550, label %553

; <label>:550                                     ; preds = %547
  %551 = load i32, i32* %lrc, align 4
  %552 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %551)
  br label %553

; <label>:553                                     ; preds = %550, %547
  br label %554

; <label>:554                                     ; preds = %553, %539
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %555 = load i16, i16* %sr, align 2
  %556 = sext i16 %555 to i32
  %557 = load i64, i64* %ll, align 8
  %558 = zext i32 %556 to i64
  %559 = ashr i64 %557, %558
  store i64 %559, i64* %ll, align 8
  %560 = load i64, i64* %ll, align 8
  %561 = icmp ne i64 %560, 1
  br i1 %561, label %562, label %569

; <label>:562                                     ; preds = %554
  store i32 287, i32* %lrc, align 4
  %563 = load i32, i32* %prlc, align 4
  %564 = icmp ne i32 %563, 0
  br i1 %564, label %565, label %568

; <label>:565                                     ; preds = %562
  %566 = load i32, i32* %lrc, align 4
  %567 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %566)
  br label %568

; <label>:568                                     ; preds = %565, %562
  br label %569

; <label>:569                                     ; preds = %568, %554
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %570 = load i32, i32* %ir, align 4
  %571 = load i64, i64* %ll, align 8
  %572 = zext i32 %570 to i64
  %573 = ashr i64 %571, %572
  store i64 %573, i64* %ll, align 8
  %574 = load i64, i64* %ll, align 8
  %575 = icmp ne i64 %574, 1
  br i1 %575, label %576, label %583

; <label>:576                                     ; preds = %569
  store i32 288, i32* %lrc, align 4
  %577 = load i32, i32* %prlc, align 4
  %578 = icmp ne i32 %577, 0
  br i1 %578, label %579, label %582

; <label>:579                                     ; preds = %576
  %580 = load i32, i32* %lrc, align 4
  %581 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %580)
  br label %582

; <label>:582                                     ; preds = %579, %576
  br label %583

; <label>:583                                     ; preds = %582, %569
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %584 = load i64, i64* %lr, align 8
  %585 = load i64, i64* %ll, align 8
  %586 = ashr i64 %585, %584
  store i64 %586, i64* %ll, align 8
  %587 = load i64, i64* %ll, align 8
  %588 = icmp ne i64 %587, 1
  br i1 %588, label %589, label %596

; <label>:589                                     ; preds = %583
  store i32 289, i32* %lrc, align 4
  %590 = load i32, i32* %prlc, align 4
  %591 = icmp ne i32 %590, 0
  br i1 %591, label %592, label %595

; <label>:592                                     ; preds = %589
  %593 = load i32, i32* %lrc, align 4
  %594 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %593)
  br label %595

; <label>:595                                     ; preds = %592, %589
  br label %596

; <label>:596                                     ; preds = %595, %583
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %597 = load i32, i32* %ur, align 4
  %598 = load i64, i64* %ll, align 8
  %599 = zext i32 %597 to i64
  %600 = ashr i64 %598, %599
  store i64 %600, i64* %ll, align 8
  %601 = load i64, i64* %ll, align 8
  %602 = icmp ne i64 %601, 1
  br i1 %602, label %603, label %610

; <label>:603                                     ; preds = %596
  store i32 290, i32* %lrc, align 4
  %604 = load i32, i32* %prlc, align 4
  %605 = icmp ne i32 %604, 0
  br i1 %605, label %606, label %609

; <label>:606                                     ; preds = %603
  %607 = load i32, i32* %lrc, align 4
  %608 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %607)
  br label %609

; <label>:609                                     ; preds = %606, %603
  br label %610

; <label>:610                                     ; preds = %609, %596
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %611 = load i8, i8* %cr, align 1
  %612 = sext i8 %611 to i32
  %613 = load i32, i32* %ul, align 4
  %614 = lshr i32 %613, %612
  store i32 %614, i32* %ul, align 4
  %615 = load i32, i32* %ul, align 4
  %616 = icmp ne i32 %615, 1
  br i1 %616, label %617, label %624

; <label>:617                                     ; preds = %610
  store i32 291, i32* %lrc, align 4
  %618 = load i32, i32* %prlc, align 4
  %619 = icmp ne i32 %618, 0
  br i1 %619, label %620, label %623

; <label>:620                                     ; preds = %617
  %621 = load i32, i32* %lrc, align 4
  %622 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %621)
  br label %623

; <label>:623                                     ; preds = %620, %617
  br label %624

; <label>:624                                     ; preds = %623, %610
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %625 = load i16, i16* %sr, align 2
  %626 = sext i16 %625 to i32
  %627 = load i32, i32* %ul, align 4
  %628 = lshr i32 %627, %626
  store i32 %628, i32* %ul, align 4
  %629 = load i32, i32* %ul, align 4
  %630 = icmp ne i32 %629, 1
  br i1 %630, label %631, label %638

; <label>:631                                     ; preds = %624
  store i32 292, i32* %lrc, align 4
  %632 = load i32, i32* %prlc, align 4
  %633 = icmp ne i32 %632, 0
  br i1 %633, label %634, label %637

; <label>:634                                     ; preds = %631
  %635 = load i32, i32* %lrc, align 4
  %636 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %635)
  br label %637

; <label>:637                                     ; preds = %634, %631
  br label %638

; <label>:638                                     ; preds = %637, %624
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %639 = load i32, i32* %ir, align 4
  %640 = load i32, i32* %ul, align 4
  %641 = lshr i32 %640, %639
  store i32 %641, i32* %ul, align 4
  %642 = load i32, i32* %ul, align 4
  %643 = icmp ne i32 %642, 1
  br i1 %643, label %644, label %651

; <label>:644                                     ; preds = %638
  store i32 293, i32* %lrc, align 4
  %645 = load i32, i32* %prlc, align 4
  %646 = icmp ne i32 %645, 0
  br i1 %646, label %647, label %650

; <label>:647                                     ; preds = %644
  %648 = load i32, i32* %lrc, align 4
  %649 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %648)
  br label %650

; <label>:650                                     ; preds = %647, %644
  br label %651

; <label>:651                                     ; preds = %650, %638
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %652 = load i64, i64* %lr, align 8
  %653 = load i32, i32* %ul, align 4
  %654 = trunc i64 %652 to i32
  %655 = lshr i32 %653, %654
  store i32 %655, i32* %ul, align 4
  %656 = load i32, i32* %ul, align 4
  %657 = icmp ne i32 %656, 1
  br i1 %657, label %658, label %665

; <label>:658                                     ; preds = %651
  store i32 294, i32* %lrc, align 4
  %659 = load i32, i32* %prlc, align 4
  %660 = icmp ne i32 %659, 0
  br i1 %660, label %661, label %664

; <label>:661                                     ; preds = %658
  %662 = load i32, i32* %lrc, align 4
  %663 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %662)
  br label %664

; <label>:664                                     ; preds = %661, %658
  br label %665

; <label>:665                                     ; preds = %664, %651
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %666 = load i32, i32* %ur, align 4
  %667 = load i32, i32* %ul, align 4
  %668 = lshr i32 %667, %666
  store i32 %668, i32* %ul, align 4
  %669 = load i32, i32* %ul, align 4
  %670 = icmp ne i32 %669, 1
  br i1 %670, label %671, label %678

; <label>:671                                     ; preds = %665
  store i32 295, i32* %lrc, align 4
  %672 = load i32, i32* %prlc, align 4
  %673 = icmp ne i32 %672, 0
  br i1 %673, label %674, label %677

; <label>:674                                     ; preds = %671
  %675 = load i32, i32* %lrc, align 4
  %676 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %675)
  br label %677

; <label>:677                                     ; preds = %674, %671
  br label %678

; <label>:678                                     ; preds = %677, %665
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %679 = load i8, i8* %cr, align 1
  %680 = sext i8 %679 to i32
  %681 = load i8, i8* %cl, align 1
  %682 = sext i8 %681 to i32
  %683 = shl i32 %682, %680
  %684 = trunc i32 %683 to i8
  store i8 %684, i8* %cl, align 1
  %685 = load i8, i8* %cl, align 1
  %686 = sext i8 %685 to i32
  %687 = icmp ne i32 %686, 20
  br i1 %687, label %688, label %695

; <label>:688                                     ; preds = %678
  store i32 296, i32* %lrc, align 4
  %689 = load i32, i32* %prlc, align 4
  %690 = icmp ne i32 %689, 0
  br i1 %690, label %691, label %694

; <label>:691                                     ; preds = %688
  %692 = load i32, i32* %lrc, align 4
  %693 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %692)
  br label %694

; <label>:694                                     ; preds = %691, %688
  br label %695

; <label>:695                                     ; preds = %694, %678
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %696 = load i16, i16* %sr, align 2
  %697 = sext i16 %696 to i32
  %698 = load i8, i8* %cl, align 1
  %699 = sext i8 %698 to i32
  %700 = shl i32 %699, %697
  %701 = trunc i32 %700 to i8
  store i8 %701, i8* %cl, align 1
  %702 = load i8, i8* %cl, align 1
  %703 = sext i8 %702 to i32
  %704 = icmp ne i32 %703, 20
  br i1 %704, label %705, label %712

; <label>:705                                     ; preds = %695
  store i32 297, i32* %lrc, align 4
  %706 = load i32, i32* %prlc, align 4
  %707 = icmp ne i32 %706, 0
  br i1 %707, label %708, label %711

; <label>:708                                     ; preds = %705
  %709 = load i32, i32* %lrc, align 4
  %710 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %709)
  br label %711

; <label>:711                                     ; preds = %708, %705
  br label %712

; <label>:712                                     ; preds = %711, %695
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %713 = load i32, i32* %ir, align 4
  %714 = load i8, i8* %cl, align 1
  %715 = sext i8 %714 to i32
  %716 = shl i32 %715, %713
  %717 = trunc i32 %716 to i8
  store i8 %717, i8* %cl, align 1
  %718 = load i8, i8* %cl, align 1
  %719 = sext i8 %718 to i32
  %720 = icmp ne i32 %719, 20
  br i1 %720, label %721, label %728

; <label>:721                                     ; preds = %712
  store i32 298, i32* %lrc, align 4
  %722 = load i32, i32* %prlc, align 4
  %723 = icmp ne i32 %722, 0
  br i1 %723, label %724, label %727

; <label>:724                                     ; preds = %721
  %725 = load i32, i32* %lrc, align 4
  %726 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %725)
  br label %727

; <label>:727                                     ; preds = %724, %721
  br label %728

; <label>:728                                     ; preds = %727, %712
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %729 = load i64, i64* %lr, align 8
  %730 = load i8, i8* %cl, align 1
  %731 = sext i8 %730 to i32
  %732 = trunc i64 %729 to i32
  %733 = shl i32 %731, %732
  %734 = trunc i32 %733 to i8
  store i8 %734, i8* %cl, align 1
  %735 = load i8, i8* %cl, align 1
  %736 = sext i8 %735 to i32
  %737 = icmp ne i32 %736, 20
  br i1 %737, label %738, label %745

; <label>:738                                     ; preds = %728
  store i32 299, i32* %lrc, align 4
  %739 = load i32, i32* %prlc, align 4
  %740 = icmp ne i32 %739, 0
  br i1 %740, label %741, label %744

; <label>:741                                     ; preds = %738
  %742 = load i32, i32* %lrc, align 4
  %743 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %742)
  br label %744

; <label>:744                                     ; preds = %741, %738
  br label %745

; <label>:745                                     ; preds = %744, %728
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %746 = load i32, i32* %ur, align 4
  %747 = load i8, i8* %cl, align 1
  %748 = sext i8 %747 to i32
  %749 = shl i32 %748, %746
  %750 = trunc i32 %749 to i8
  store i8 %750, i8* %cl, align 1
  %751 = load i8, i8* %cl, align 1
  %752 = sext i8 %751 to i32
  %753 = icmp ne i32 %752, 20
  br i1 %753, label %754, label %761

; <label>:754                                     ; preds = %745
  store i32 300, i32* %lrc, align 4
  %755 = load i32, i32* %prlc, align 4
  %756 = icmp ne i32 %755, 0
  br i1 %756, label %757, label %760

; <label>:757                                     ; preds = %754
  %758 = load i32, i32* %lrc, align 4
  %759 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %758)
  br label %760

; <label>:760                                     ; preds = %757, %754
  br label %761

; <label>:761                                     ; preds = %760, %745
  %762 = load i32, i32* %lrc, align 4
  %763 = icmp ne i32 %762, 0
  br i1 %763, label %764, label %772

; <label>:764                                     ; preds = %761
  store i32 1, i32* %rc, align 4
  %765 = load %struct.defs*, %struct.defs** %1, align 8
  %766 = getelementptr inbounds %struct.defs, %struct.defs* %765, i32 0, i32 11
  %767 = load i32, i32* %766, align 4
  %768 = icmp ne i32 %767, 0
  br i1 %768, label %769, label %771

; <label>:769                                     ; preds = %764
  %770 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %771

; <label>:771                                     ; preds = %769, %764
  br label %772

; <label>:772                                     ; preds = %771, %761
  %773 = load i32, i32* %rc, align 4
  ret i32 %773
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
