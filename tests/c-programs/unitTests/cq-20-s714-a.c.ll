; ModuleID = './cq-20-s714-a.c'
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
  store i8 2, i8* %cr, align 1
  %17 = load i8, i8* %cr, align 1
  store i8 %17, i8* %cl, align 1
  %18 = load i8, i8* %cl, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp ne i32 %19, 2
  br i1 %20, label %21, label %28

; <label>:21                                      ; preds = %16
  store i32 1, i32* %lrc, align 4
  %22 = load i32, i32* %prlc, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %27

; <label>:24                                      ; preds = %21
  %25 = load i32, i32* %lrc, align 4
  %26 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %25)
  br label %27

; <label>:27                                      ; preds = %24, %21
  br label %28

; <label>:28                                      ; preds = %27, %16
  store i8 5, i8* %cl, align 1
  store i16 2, i16* %sr, align 2
  %29 = load i16, i16* %sr, align 2
  %30 = trunc i16 %29 to i8
  store i8 %30, i8* %cl, align 1
  %31 = load i8, i8* %cl, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp ne i32 %32, 2
  br i1 %33, label %34, label %41

; <label>:34                                      ; preds = %28
  store i32 2, i32* %lrc, align 4
  %35 = load i32, i32* %prlc, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %40

; <label>:37                                      ; preds = %34
  %38 = load i32, i32* %lrc, align 4
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %38)
  br label %40

; <label>:40                                      ; preds = %37, %34
  br label %41

; <label>:41                                      ; preds = %40, %28
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %42 = load i32, i32* %ir, align 4
  %43 = trunc i32 %42 to i8
  store i8 %43, i8* %cl, align 1
  %44 = load i8, i8* %cl, align 1
  %45 = sext i8 %44 to i32
  %46 = icmp ne i32 %45, 2
  br i1 %46, label %47, label %54

; <label>:47                                      ; preds = %41
  store i32 3, i32* %lrc, align 4
  %48 = load i32, i32* %prlc, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %53

; <label>:50                                      ; preds = %47
  %51 = load i32, i32* %lrc, align 4
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %51)
  br label %53

; <label>:53                                      ; preds = %50, %47
  br label %54

; <label>:54                                      ; preds = %53, %41
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %55 = load i64, i64* %lr, align 8
  %56 = trunc i64 %55 to i8
  store i8 %56, i8* %cl, align 1
  %57 = load i8, i8* %cl, align 1
  %58 = sext i8 %57 to i32
  %59 = icmp ne i32 %58, 2
  br i1 %59, label %60, label %67

; <label>:60                                      ; preds = %54
  store i32 4, i32* %lrc, align 4
  %61 = load i32, i32* %prlc, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %66

; <label>:63                                      ; preds = %60
  %64 = load i32, i32* %lrc, align 4
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %64)
  br label %66

; <label>:66                                      ; preds = %63, %60
  br label %67

; <label>:67                                      ; preds = %66, %54
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %68 = load i32, i32* %ur, align 4
  %69 = trunc i32 %68 to i8
  store i8 %69, i8* %cl, align 1
  %70 = load i8, i8* %cl, align 1
  %71 = sext i8 %70 to i32
  %72 = icmp ne i32 %71, 2
  br i1 %72, label %73, label %80

; <label>:73                                      ; preds = %67
  store i32 5, i32* %lrc, align 4
  %74 = load i32, i32* %prlc, align 4
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %79

; <label>:76                                      ; preds = %73
  %77 = load i32, i32* %lrc, align 4
  %78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %77)
  br label %79

; <label>:79                                      ; preds = %76, %73
  br label %80

; <label>:80                                      ; preds = %79, %67
  store i8 5, i8* %cl, align 1
  store float 2.000000e+00, float* %fr, align 4
  %81 = load float, float* %fr, align 4
  %82 = fptosi float %81 to i8
  store i8 %82, i8* %cl, align 1
  %83 = load i8, i8* %cl, align 1
  %84 = sext i8 %83 to i32
  %85 = icmp ne i32 %84, 2
  br i1 %85, label %86, label %93

; <label>:86                                      ; preds = %80
  store i32 6, i32* %lrc, align 4
  %87 = load i32, i32* %prlc, align 4
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %89, label %92

; <label>:89                                      ; preds = %86
  %90 = load i32, i32* %lrc, align 4
  %91 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %90)
  br label %92

; <label>:92                                      ; preds = %89, %86
  br label %93

; <label>:93                                      ; preds = %92, %80
  store i8 5, i8* %cl, align 1
  store double 2.000000e+00, double* %dr, align 8
  %94 = load double, double* %dr, align 8
  %95 = fptosi double %94 to i8
  store i8 %95, i8* %cl, align 1
  %96 = load i8, i8* %cl, align 1
  %97 = sext i8 %96 to i32
  %98 = icmp ne i32 %97, 2
  br i1 %98, label %99, label %106

; <label>:99                                      ; preds = %93
  store i32 7, i32* %lrc, align 4
  %100 = load i32, i32* %prlc, align 4
  %101 = icmp ne i32 %100, 0
  br i1 %101, label %102, label %105

; <label>:102                                     ; preds = %99
  %103 = load i32, i32* %lrc, align 4
  %104 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %103)
  br label %105

; <label>:105                                     ; preds = %102, %99
  br label %106

; <label>:106                                     ; preds = %105, %93
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %107 = load i8, i8* %cr, align 1
  %108 = sext i8 %107 to i16
  store i16 %108, i16* %sl, align 2
  %109 = load i16, i16* %sl, align 2
  %110 = sext i16 %109 to i32
  %111 = icmp ne i32 %110, 2
  br i1 %111, label %112, label %119

; <label>:112                                     ; preds = %106
  store i32 8, i32* %lrc, align 4
  %113 = load i32, i32* %prlc, align 4
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %118

; <label>:115                                     ; preds = %112
  %116 = load i32, i32* %lrc, align 4
  %117 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %116)
  br label %118

; <label>:118                                     ; preds = %115, %112
  br label %119

; <label>:119                                     ; preds = %118, %106
  store i16 5, i16* %sl, align 2
  store i16 2, i16* %sr, align 2
  %120 = load i16, i16* %sr, align 2
  store i16 %120, i16* %sl, align 2
  %121 = load i16, i16* %sl, align 2
  %122 = sext i16 %121 to i32
  %123 = icmp ne i32 %122, 2
  br i1 %123, label %124, label %131

; <label>:124                                     ; preds = %119
  store i32 9, i32* %lrc, align 4
  %125 = load i32, i32* %prlc, align 4
  %126 = icmp ne i32 %125, 0
  br i1 %126, label %127, label %130

; <label>:127                                     ; preds = %124
  %128 = load i32, i32* %lrc, align 4
  %129 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %128)
  br label %130

; <label>:130                                     ; preds = %127, %124
  br label %131

; <label>:131                                     ; preds = %130, %119
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %132 = load i32, i32* %ir, align 4
  %133 = trunc i32 %132 to i16
  store i16 %133, i16* %sl, align 2
  %134 = load i16, i16* %sl, align 2
  %135 = sext i16 %134 to i32
  %136 = icmp ne i32 %135, 2
  br i1 %136, label %137, label %144

; <label>:137                                     ; preds = %131
  store i32 10, i32* %lrc, align 4
  %138 = load i32, i32* %prlc, align 4
  %139 = icmp ne i32 %138, 0
  br i1 %139, label %140, label %143

; <label>:140                                     ; preds = %137
  %141 = load i32, i32* %lrc, align 4
  %142 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %141)
  br label %143

; <label>:143                                     ; preds = %140, %137
  br label %144

; <label>:144                                     ; preds = %143, %131
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %145 = load i64, i64* %lr, align 8
  %146 = trunc i64 %145 to i16
  store i16 %146, i16* %sl, align 2
  %147 = load i16, i16* %sl, align 2
  %148 = sext i16 %147 to i32
  %149 = icmp ne i32 %148, 2
  br i1 %149, label %150, label %157

; <label>:150                                     ; preds = %144
  store i32 11, i32* %lrc, align 4
  %151 = load i32, i32* %prlc, align 4
  %152 = icmp ne i32 %151, 0
  br i1 %152, label %153, label %156

; <label>:153                                     ; preds = %150
  %154 = load i32, i32* %lrc, align 4
  %155 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %154)
  br label %156

; <label>:156                                     ; preds = %153, %150
  br label %157

; <label>:157                                     ; preds = %156, %144
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %158 = load i32, i32* %ur, align 4
  %159 = trunc i32 %158 to i16
  store i16 %159, i16* %sl, align 2
  %160 = load i16, i16* %sl, align 2
  %161 = sext i16 %160 to i32
  %162 = icmp ne i32 %161, 2
  br i1 %162, label %163, label %170

; <label>:163                                     ; preds = %157
  store i32 12, i32* %lrc, align 4
  %164 = load i32, i32* %prlc, align 4
  %165 = icmp ne i32 %164, 0
  br i1 %165, label %166, label %169

; <label>:166                                     ; preds = %163
  %167 = load i32, i32* %lrc, align 4
  %168 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %167)
  br label %169

; <label>:169                                     ; preds = %166, %163
  br label %170

; <label>:170                                     ; preds = %169, %157
  store i16 5, i16* %sl, align 2
  store float 2.000000e+00, float* %fr, align 4
  %171 = load float, float* %fr, align 4
  %172 = fptosi float %171 to i16
  store i16 %172, i16* %sl, align 2
  %173 = load i16, i16* %sl, align 2
  %174 = sext i16 %173 to i32
  %175 = icmp ne i32 %174, 2
  br i1 %175, label %176, label %183

; <label>:176                                     ; preds = %170
  store i32 13, i32* %lrc, align 4
  %177 = load i32, i32* %prlc, align 4
  %178 = icmp ne i32 %177, 0
  br i1 %178, label %179, label %182

; <label>:179                                     ; preds = %176
  %180 = load i32, i32* %lrc, align 4
  %181 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %180)
  br label %182

; <label>:182                                     ; preds = %179, %176
  br label %183

; <label>:183                                     ; preds = %182, %170
  store i16 5, i16* %sl, align 2
  store double 2.000000e+00, double* %dr, align 8
  %184 = load double, double* %dr, align 8
  %185 = fptosi double %184 to i16
  store i16 %185, i16* %sl, align 2
  %186 = load i16, i16* %sl, align 2
  %187 = sext i16 %186 to i32
  %188 = icmp ne i32 %187, 2
  br i1 %188, label %189, label %196

; <label>:189                                     ; preds = %183
  store i32 14, i32* %lrc, align 4
  %190 = load i32, i32* %prlc, align 4
  %191 = icmp ne i32 %190, 0
  br i1 %191, label %192, label %195

; <label>:192                                     ; preds = %189
  %193 = load i32, i32* %lrc, align 4
  %194 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %193)
  br label %195

; <label>:195                                     ; preds = %192, %189
  br label %196

; <label>:196                                     ; preds = %195, %183
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %197 = load i8, i8* %cr, align 1
  %198 = sext i8 %197 to i32
  store i32 %198, i32* %il, align 4
  %199 = load i32, i32* %il, align 4
  %200 = icmp ne i32 %199, 2
  br i1 %200, label %201, label %208

; <label>:201                                     ; preds = %196
  store i32 15, i32* %lrc, align 4
  %202 = load i32, i32* %prlc, align 4
  %203 = icmp ne i32 %202, 0
  br i1 %203, label %204, label %207

; <label>:204                                     ; preds = %201
  %205 = load i32, i32* %lrc, align 4
  %206 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %205)
  br label %207

; <label>:207                                     ; preds = %204, %201
  br label %208

; <label>:208                                     ; preds = %207, %196
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %209 = load i16, i16* %sr, align 2
  %210 = sext i16 %209 to i32
  store i32 %210, i32* %il, align 4
  %211 = load i32, i32* %il, align 4
  %212 = icmp ne i32 %211, 2
  br i1 %212, label %213, label %220

; <label>:213                                     ; preds = %208
  store i32 16, i32* %lrc, align 4
  %214 = load i32, i32* %prlc, align 4
  %215 = icmp ne i32 %214, 0
  br i1 %215, label %216, label %219

; <label>:216                                     ; preds = %213
  %217 = load i32, i32* %lrc, align 4
  %218 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %217)
  br label %219

; <label>:219                                     ; preds = %216, %213
  br label %220

; <label>:220                                     ; preds = %219, %208
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %221 = load i32, i32* %ir, align 4
  store i32 %221, i32* %il, align 4
  %222 = load i32, i32* %il, align 4
  %223 = icmp ne i32 %222, 2
  br i1 %223, label %224, label %231

; <label>:224                                     ; preds = %220
  store i32 17, i32* %lrc, align 4
  %225 = load i32, i32* %prlc, align 4
  %226 = icmp ne i32 %225, 0
  br i1 %226, label %227, label %230

; <label>:227                                     ; preds = %224
  %228 = load i32, i32* %lrc, align 4
  %229 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %228)
  br label %230

; <label>:230                                     ; preds = %227, %224
  br label %231

; <label>:231                                     ; preds = %230, %220
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %232 = load i64, i64* %lr, align 8
  %233 = trunc i64 %232 to i32
  store i32 %233, i32* %il, align 4
  %234 = load i32, i32* %il, align 4
  %235 = icmp ne i32 %234, 2
  br i1 %235, label %236, label %243

; <label>:236                                     ; preds = %231
  store i32 18, i32* %lrc, align 4
  %237 = load i32, i32* %prlc, align 4
  %238 = icmp ne i32 %237, 0
  br i1 %238, label %239, label %242

; <label>:239                                     ; preds = %236
  %240 = load i32, i32* %lrc, align 4
  %241 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %240)
  br label %242

; <label>:242                                     ; preds = %239, %236
  br label %243

; <label>:243                                     ; preds = %242, %231
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %244 = load i32, i32* %ur, align 4
  store i32 %244, i32* %il, align 4
  %245 = load i32, i32* %il, align 4
  %246 = icmp ne i32 %245, 2
  br i1 %246, label %247, label %254

; <label>:247                                     ; preds = %243
  store i32 19, i32* %lrc, align 4
  %248 = load i32, i32* %prlc, align 4
  %249 = icmp ne i32 %248, 0
  br i1 %249, label %250, label %253

; <label>:250                                     ; preds = %247
  %251 = load i32, i32* %lrc, align 4
  %252 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %251)
  br label %253

; <label>:253                                     ; preds = %250, %247
  br label %254

; <label>:254                                     ; preds = %253, %243
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %255 = load float, float* %fr, align 4
  %256 = fptosi float %255 to i32
  store i32 %256, i32* %il, align 4
  %257 = load i32, i32* %il, align 4
  %258 = icmp ne i32 %257, 2
  br i1 %258, label %259, label %266

; <label>:259                                     ; preds = %254
  store i32 20, i32* %lrc, align 4
  %260 = load i32, i32* %prlc, align 4
  %261 = icmp ne i32 %260, 0
  br i1 %261, label %262, label %265

; <label>:262                                     ; preds = %259
  %263 = load i32, i32* %lrc, align 4
  %264 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %263)
  br label %265

; <label>:265                                     ; preds = %262, %259
  br label %266

; <label>:266                                     ; preds = %265, %254
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %267 = load double, double* %dr, align 8
  %268 = fptosi double %267 to i32
  store i32 %268, i32* %il, align 4
  %269 = load i32, i32* %il, align 4
  %270 = icmp ne i32 %269, 2
  br i1 %270, label %271, label %278

; <label>:271                                     ; preds = %266
  store i32 21, i32* %lrc, align 4
  %272 = load i32, i32* %prlc, align 4
  %273 = icmp ne i32 %272, 0
  br i1 %273, label %274, label %277

; <label>:274                                     ; preds = %271
  %275 = load i32, i32* %lrc, align 4
  %276 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %275)
  br label %277

; <label>:277                                     ; preds = %274, %271
  br label %278

; <label>:278                                     ; preds = %277, %266
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %279 = load i8, i8* %cr, align 1
  %280 = sext i8 %279 to i64
  store i64 %280, i64* %ll, align 8
  %281 = load i64, i64* %ll, align 8
  %282 = icmp ne i64 %281, 2
  br i1 %282, label %283, label %290

; <label>:283                                     ; preds = %278
  store i32 22, i32* %lrc, align 4
  %284 = load i32, i32* %prlc, align 4
  %285 = icmp ne i32 %284, 0
  br i1 %285, label %286, label %289

; <label>:286                                     ; preds = %283
  %287 = load i32, i32* %lrc, align 4
  %288 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %287)
  br label %289

; <label>:289                                     ; preds = %286, %283
  br label %290

; <label>:290                                     ; preds = %289, %278
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %291 = load i16, i16* %sr, align 2
  %292 = sext i16 %291 to i64
  store i64 %292, i64* %ll, align 8
  %293 = load i64, i64* %ll, align 8
  %294 = icmp ne i64 %293, 2
  br i1 %294, label %295, label %302

; <label>:295                                     ; preds = %290
  store i32 23, i32* %lrc, align 4
  %296 = load i32, i32* %prlc, align 4
  %297 = icmp ne i32 %296, 0
  br i1 %297, label %298, label %301

; <label>:298                                     ; preds = %295
  %299 = load i32, i32* %lrc, align 4
  %300 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %299)
  br label %301

; <label>:301                                     ; preds = %298, %295
  br label %302

; <label>:302                                     ; preds = %301, %290
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %303 = load i32, i32* %ir, align 4
  %304 = sext i32 %303 to i64
  store i64 %304, i64* %ll, align 8
  %305 = load i64, i64* %ll, align 8
  %306 = icmp ne i64 %305, 2
  br i1 %306, label %307, label %314

; <label>:307                                     ; preds = %302
  store i32 24, i32* %lrc, align 4
  %308 = load i32, i32* %prlc, align 4
  %309 = icmp ne i32 %308, 0
  br i1 %309, label %310, label %313

; <label>:310                                     ; preds = %307
  %311 = load i32, i32* %lrc, align 4
  %312 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %311)
  br label %313

; <label>:313                                     ; preds = %310, %307
  br label %314

; <label>:314                                     ; preds = %313, %302
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %315 = load i64, i64* %lr, align 8
  store i64 %315, i64* %ll, align 8
  %316 = load i64, i64* %ll, align 8
  %317 = icmp ne i64 %316, 2
  br i1 %317, label %318, label %325

; <label>:318                                     ; preds = %314
  store i32 25, i32* %lrc, align 4
  %319 = load i32, i32* %prlc, align 4
  %320 = icmp ne i32 %319, 0
  br i1 %320, label %321, label %324

; <label>:321                                     ; preds = %318
  %322 = load i32, i32* %lrc, align 4
  %323 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %322)
  br label %324

; <label>:324                                     ; preds = %321, %318
  br label %325

; <label>:325                                     ; preds = %324, %314
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %326 = load i32, i32* %ur, align 4
  %327 = zext i32 %326 to i64
  store i64 %327, i64* %ll, align 8
  %328 = load i64, i64* %ll, align 8
  %329 = icmp ne i64 %328, 2
  br i1 %329, label %330, label %337

; <label>:330                                     ; preds = %325
  store i32 26, i32* %lrc, align 4
  %331 = load i32, i32* %prlc, align 4
  %332 = icmp ne i32 %331, 0
  br i1 %332, label %333, label %336

; <label>:333                                     ; preds = %330
  %334 = load i32, i32* %lrc, align 4
  %335 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %334)
  br label %336

; <label>:336                                     ; preds = %333, %330
  br label %337

; <label>:337                                     ; preds = %336, %325
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %338 = load float, float* %fr, align 4
  %339 = fptosi float %338 to i64
  store i64 %339, i64* %ll, align 8
  %340 = load i64, i64* %ll, align 8
  %341 = icmp ne i64 %340, 2
  br i1 %341, label %342, label %349

; <label>:342                                     ; preds = %337
  store i32 27, i32* %lrc, align 4
  %343 = load i32, i32* %prlc, align 4
  %344 = icmp ne i32 %343, 0
  br i1 %344, label %345, label %348

; <label>:345                                     ; preds = %342
  %346 = load i32, i32* %lrc, align 4
  %347 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %346)
  br label %348

; <label>:348                                     ; preds = %345, %342
  br label %349

; <label>:349                                     ; preds = %348, %337
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %350 = load double, double* %dr, align 8
  %351 = fptosi double %350 to i64
  store i64 %351, i64* %ll, align 8
  %352 = load i64, i64* %ll, align 8
  %353 = icmp ne i64 %352, 2
  br i1 %353, label %354, label %361

; <label>:354                                     ; preds = %349
  store i32 28, i32* %lrc, align 4
  %355 = load i32, i32* %prlc, align 4
  %356 = icmp ne i32 %355, 0
  br i1 %356, label %357, label %360

; <label>:357                                     ; preds = %354
  %358 = load i32, i32* %lrc, align 4
  %359 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %358)
  br label %360

; <label>:360                                     ; preds = %357, %354
  br label %361

; <label>:361                                     ; preds = %360, %349
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %362 = load i8, i8* %cr, align 1
  %363 = sext i8 %362 to i32
  store i32 %363, i32* %ul, align 4
  %364 = load i32, i32* %ul, align 4
  %365 = icmp ne i32 %364, 2
  br i1 %365, label %366, label %373

; <label>:366                                     ; preds = %361
  store i32 29, i32* %lrc, align 4
  %367 = load i32, i32* %prlc, align 4
  %368 = icmp ne i32 %367, 0
  br i1 %368, label %369, label %372

; <label>:369                                     ; preds = %366
  %370 = load i32, i32* %lrc, align 4
  %371 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %370)
  br label %372

; <label>:372                                     ; preds = %369, %366
  br label %373

; <label>:373                                     ; preds = %372, %361
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %374 = load i16, i16* %sr, align 2
  %375 = sext i16 %374 to i32
  store i32 %375, i32* %ul, align 4
  %376 = load i32, i32* %ul, align 4
  %377 = icmp ne i32 %376, 2
  br i1 %377, label %378, label %385

; <label>:378                                     ; preds = %373
  store i32 30, i32* %lrc, align 4
  %379 = load i32, i32* %prlc, align 4
  %380 = icmp ne i32 %379, 0
  br i1 %380, label %381, label %384

; <label>:381                                     ; preds = %378
  %382 = load i32, i32* %lrc, align 4
  %383 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %382)
  br label %384

; <label>:384                                     ; preds = %381, %378
  br label %385

; <label>:385                                     ; preds = %384, %373
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %386 = load i32, i32* %ir, align 4
  store i32 %386, i32* %ul, align 4
  %387 = load i32, i32* %ul, align 4
  %388 = icmp ne i32 %387, 2
  br i1 %388, label %389, label %396

; <label>:389                                     ; preds = %385
  store i32 31, i32* %lrc, align 4
  %390 = load i32, i32* %prlc, align 4
  %391 = icmp ne i32 %390, 0
  br i1 %391, label %392, label %395

; <label>:392                                     ; preds = %389
  %393 = load i32, i32* %lrc, align 4
  %394 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %393)
  br label %395

; <label>:395                                     ; preds = %392, %389
  br label %396

; <label>:396                                     ; preds = %395, %385
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %397 = load i64, i64* %lr, align 8
  %398 = trunc i64 %397 to i32
  store i32 %398, i32* %ul, align 4
  %399 = load i32, i32* %ul, align 4
  %400 = icmp ne i32 %399, 2
  br i1 %400, label %401, label %408

; <label>:401                                     ; preds = %396
  store i32 32, i32* %lrc, align 4
  %402 = load i32, i32* %prlc, align 4
  %403 = icmp ne i32 %402, 0
  br i1 %403, label %404, label %407

; <label>:404                                     ; preds = %401
  %405 = load i32, i32* %lrc, align 4
  %406 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %405)
  br label %407

; <label>:407                                     ; preds = %404, %401
  br label %408

; <label>:408                                     ; preds = %407, %396
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %409 = load i32, i32* %ur, align 4
  store i32 %409, i32* %ul, align 4
  %410 = load i32, i32* %ul, align 4
  %411 = icmp ne i32 %410, 2
  br i1 %411, label %412, label %419

; <label>:412                                     ; preds = %408
  store i32 33, i32* %lrc, align 4
  %413 = load i32, i32* %prlc, align 4
  %414 = icmp ne i32 %413, 0
  br i1 %414, label %415, label %418

; <label>:415                                     ; preds = %412
  %416 = load i32, i32* %lrc, align 4
  %417 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %416)
  br label %418

; <label>:418                                     ; preds = %415, %412
  br label %419

; <label>:419                                     ; preds = %418, %408
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %420 = load float, float* %fr, align 4
  %421 = fptoui float %420 to i32
  store i32 %421, i32* %ul, align 4
  %422 = load i32, i32* %ul, align 4
  %423 = icmp ne i32 %422, 2
  br i1 %423, label %424, label %431

; <label>:424                                     ; preds = %419
  store i32 34, i32* %lrc, align 4
  %425 = load i32, i32* %prlc, align 4
  %426 = icmp ne i32 %425, 0
  br i1 %426, label %427, label %430

; <label>:427                                     ; preds = %424
  %428 = load i32, i32* %lrc, align 4
  %429 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %428)
  br label %430

; <label>:430                                     ; preds = %427, %424
  br label %431

; <label>:431                                     ; preds = %430, %419
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %432 = load double, double* %dr, align 8
  %433 = fptoui double %432 to i32
  store i32 %433, i32* %ul, align 4
  %434 = load i32, i32* %ul, align 4
  %435 = icmp ne i32 %434, 2
  br i1 %435, label %436, label %443

; <label>:436                                     ; preds = %431
  store i32 35, i32* %lrc, align 4
  %437 = load i32, i32* %prlc, align 4
  %438 = icmp ne i32 %437, 0
  br i1 %438, label %439, label %442

; <label>:439                                     ; preds = %436
  %440 = load i32, i32* %lrc, align 4
  %441 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %440)
  br label %442

; <label>:442                                     ; preds = %439, %436
  br label %443

; <label>:443                                     ; preds = %442, %431
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %444 = load i8, i8* %cr, align 1
  %445 = sitofp i8 %444 to float
  store float %445, float* %fl, align 4
  %446 = load float, float* %fl, align 4
  %447 = fcmp une float %446, 2.000000e+00
  br i1 %447, label %448, label %455

; <label>:448                                     ; preds = %443
  store i32 36, i32* %lrc, align 4
  %449 = load i32, i32* %prlc, align 4
  %450 = icmp ne i32 %449, 0
  br i1 %450, label %451, label %454

; <label>:451                                     ; preds = %448
  %452 = load i32, i32* %lrc, align 4
  %453 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %452)
  br label %454

; <label>:454                                     ; preds = %451, %448
  br label %455

; <label>:455                                     ; preds = %454, %443
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %456 = load i16, i16* %sr, align 2
  %457 = sitofp i16 %456 to float
  store float %457, float* %fl, align 4
  %458 = load float, float* %fl, align 4
  %459 = fcmp une float %458, 2.000000e+00
  br i1 %459, label %460, label %467

; <label>:460                                     ; preds = %455
  store i32 37, i32* %lrc, align 4
  %461 = load i32, i32* %prlc, align 4
  %462 = icmp ne i32 %461, 0
  br i1 %462, label %463, label %466

; <label>:463                                     ; preds = %460
  %464 = load i32, i32* %lrc, align 4
  %465 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %464)
  br label %466

; <label>:466                                     ; preds = %463, %460
  br label %467

; <label>:467                                     ; preds = %466, %455
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %468 = load i32, i32* %ir, align 4
  %469 = sitofp i32 %468 to float
  store float %469, float* %fl, align 4
  %470 = load float, float* %fl, align 4
  %471 = fcmp une float %470, 2.000000e+00
  br i1 %471, label %472, label %479

; <label>:472                                     ; preds = %467
  store i32 38, i32* %lrc, align 4
  %473 = load i32, i32* %prlc, align 4
  %474 = icmp ne i32 %473, 0
  br i1 %474, label %475, label %478

; <label>:475                                     ; preds = %472
  %476 = load i32, i32* %lrc, align 4
  %477 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %476)
  br label %478

; <label>:478                                     ; preds = %475, %472
  br label %479

; <label>:479                                     ; preds = %478, %467
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %480 = load i64, i64* %lr, align 8
  %481 = sitofp i64 %480 to float
  store float %481, float* %fl, align 4
  %482 = load float, float* %fl, align 4
  %483 = fcmp une float %482, 2.000000e+00
  br i1 %483, label %484, label %491

; <label>:484                                     ; preds = %479
  store i32 39, i32* %lrc, align 4
  %485 = load i32, i32* %prlc, align 4
  %486 = icmp ne i32 %485, 0
  br i1 %486, label %487, label %490

; <label>:487                                     ; preds = %484
  %488 = load i32, i32* %lrc, align 4
  %489 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %488)
  br label %490

; <label>:490                                     ; preds = %487, %484
  br label %491

; <label>:491                                     ; preds = %490, %479
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %492 = load i32, i32* %ur, align 4
  %493 = uitofp i32 %492 to float
  store float %493, float* %fl, align 4
  %494 = load float, float* %fl, align 4
  %495 = fcmp une float %494, 2.000000e+00
  br i1 %495, label %496, label %503

; <label>:496                                     ; preds = %491
  store i32 40, i32* %lrc, align 4
  %497 = load i32, i32* %prlc, align 4
  %498 = icmp ne i32 %497, 0
  br i1 %498, label %499, label %502

; <label>:499                                     ; preds = %496
  %500 = load i32, i32* %lrc, align 4
  %501 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %500)
  br label %502

; <label>:502                                     ; preds = %499, %496
  br label %503

; <label>:503                                     ; preds = %502, %491
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %504 = load float, float* %fr, align 4
  store float %504, float* %fl, align 4
  %505 = load float, float* %fl, align 4
  %506 = fcmp une float %505, 2.000000e+00
  br i1 %506, label %507, label %514

; <label>:507                                     ; preds = %503
  store i32 41, i32* %lrc, align 4
  %508 = load i32, i32* %prlc, align 4
  %509 = icmp ne i32 %508, 0
  br i1 %509, label %510, label %513

; <label>:510                                     ; preds = %507
  %511 = load i32, i32* %lrc, align 4
  %512 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %511)
  br label %513

; <label>:513                                     ; preds = %510, %507
  br label %514

; <label>:514                                     ; preds = %513, %503
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %515 = load double, double* %dr, align 8
  %516 = fptrunc double %515 to float
  store float %516, float* %fl, align 4
  %517 = load float, float* %fl, align 4
  %518 = fcmp une float %517, 2.000000e+00
  br i1 %518, label %519, label %526

; <label>:519                                     ; preds = %514
  store i32 42, i32* %lrc, align 4
  %520 = load i32, i32* %prlc, align 4
  %521 = icmp ne i32 %520, 0
  br i1 %521, label %522, label %525

; <label>:522                                     ; preds = %519
  %523 = load i32, i32* %lrc, align 4
  %524 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %523)
  br label %525

; <label>:525                                     ; preds = %522, %519
  br label %526

; <label>:526                                     ; preds = %525, %514
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %527 = load i8, i8* %cr, align 1
  %528 = sitofp i8 %527 to double
  store double %528, double* %dl, align 8
  %529 = load double, double* %dl, align 8
  %530 = fcmp une double %529, 2.000000e+00
  br i1 %530, label %531, label %538

; <label>:531                                     ; preds = %526
  store i32 43, i32* %lrc, align 4
  %532 = load i32, i32* %prlc, align 4
  %533 = icmp ne i32 %532, 0
  br i1 %533, label %534, label %537

; <label>:534                                     ; preds = %531
  %535 = load i32, i32* %lrc, align 4
  %536 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %535)
  br label %537

; <label>:537                                     ; preds = %534, %531
  br label %538

; <label>:538                                     ; preds = %537, %526
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %539 = load i16, i16* %sr, align 2
  %540 = sitofp i16 %539 to double
  store double %540, double* %dl, align 8
  %541 = load double, double* %dl, align 8
  %542 = fcmp une double %541, 2.000000e+00
  br i1 %542, label %543, label %550

; <label>:543                                     ; preds = %538
  store i32 44, i32* %lrc, align 4
  %544 = load i32, i32* %prlc, align 4
  %545 = icmp ne i32 %544, 0
  br i1 %545, label %546, label %549

; <label>:546                                     ; preds = %543
  %547 = load i32, i32* %lrc, align 4
  %548 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %547)
  br label %549

; <label>:549                                     ; preds = %546, %543
  br label %550

; <label>:550                                     ; preds = %549, %538
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %551 = load i32, i32* %ir, align 4
  %552 = sitofp i32 %551 to double
  store double %552, double* %dl, align 8
  %553 = load double, double* %dl, align 8
  %554 = fcmp une double %553, 2.000000e+00
  br i1 %554, label %555, label %562

; <label>:555                                     ; preds = %550
  store i32 45, i32* %lrc, align 4
  %556 = load i32, i32* %prlc, align 4
  %557 = icmp ne i32 %556, 0
  br i1 %557, label %558, label %561

; <label>:558                                     ; preds = %555
  %559 = load i32, i32* %lrc, align 4
  %560 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %559)
  br label %561

; <label>:561                                     ; preds = %558, %555
  br label %562

; <label>:562                                     ; preds = %561, %550
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %563 = load i64, i64* %lr, align 8
  %564 = sitofp i64 %563 to double
  store double %564, double* %dl, align 8
  %565 = load double, double* %dl, align 8
  %566 = fcmp une double %565, 2.000000e+00
  br i1 %566, label %567, label %574

; <label>:567                                     ; preds = %562
  store i32 46, i32* %lrc, align 4
  %568 = load i32, i32* %prlc, align 4
  %569 = icmp ne i32 %568, 0
  br i1 %569, label %570, label %573

; <label>:570                                     ; preds = %567
  %571 = load i32, i32* %lrc, align 4
  %572 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %571)
  br label %573

; <label>:573                                     ; preds = %570, %567
  br label %574

; <label>:574                                     ; preds = %573, %562
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %575 = load i32, i32* %ur, align 4
  %576 = uitofp i32 %575 to double
  store double %576, double* %dl, align 8
  %577 = load double, double* %dl, align 8
  %578 = fcmp une double %577, 2.000000e+00
  br i1 %578, label %579, label %586

; <label>:579                                     ; preds = %574
  store i32 47, i32* %lrc, align 4
  %580 = load i32, i32* %prlc, align 4
  %581 = icmp ne i32 %580, 0
  br i1 %581, label %582, label %585

; <label>:582                                     ; preds = %579
  %583 = load i32, i32* %lrc, align 4
  %584 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %583)
  br label %585

; <label>:585                                     ; preds = %582, %579
  br label %586

; <label>:586                                     ; preds = %585, %574
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %587 = load float, float* %fr, align 4
  %588 = fpext float %587 to double
  store double %588, double* %dl, align 8
  %589 = load double, double* %dl, align 8
  %590 = fcmp une double %589, 2.000000e+00
  br i1 %590, label %591, label %598

; <label>:591                                     ; preds = %586
  store i32 48, i32* %lrc, align 4
  %592 = load i32, i32* %prlc, align 4
  %593 = icmp ne i32 %592, 0
  br i1 %593, label %594, label %597

; <label>:594                                     ; preds = %591
  %595 = load i32, i32* %lrc, align 4
  %596 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %595)
  br label %597

; <label>:597                                     ; preds = %594, %591
  br label %598

; <label>:598                                     ; preds = %597, %586
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %599 = load double, double* %dr, align 8
  store double %599, double* %dl, align 8
  %600 = load double, double* %dl, align 8
  %601 = fcmp une double %600, 2.000000e+00
  br i1 %601, label %602, label %609

; <label>:602                                     ; preds = %598
  store i32 49, i32* %lrc, align 4
  %603 = load i32, i32* %prlc, align 4
  %604 = icmp ne i32 %603, 0
  br i1 %604, label %605, label %608

; <label>:605                                     ; preds = %602
  %606 = load i32, i32* %lrc, align 4
  %607 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %606)
  br label %608

; <label>:608                                     ; preds = %605, %602
  br label %609

; <label>:609                                     ; preds = %608, %598
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %610 = load i8, i8* %cr, align 1
  %611 = sext i8 %610 to i32
  %612 = load i8, i8* %cl, align 1
  %613 = sext i8 %612 to i32
  %614 = add nsw i32 %613, %611
  %615 = trunc i32 %614 to i8
  store i8 %615, i8* %cl, align 1
  %616 = load i8, i8* %cl, align 1
  %617 = sext i8 %616 to i32
  %618 = icmp ne i32 %617, 7
  br i1 %618, label %619, label %626

; <label>:619                                     ; preds = %609
  store i32 50, i32* %lrc, align 4
  %620 = load i32, i32* %prlc, align 4
  %621 = icmp ne i32 %620, 0
  br i1 %621, label %622, label %625

; <label>:622                                     ; preds = %619
  %623 = load i32, i32* %lrc, align 4
  %624 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @sec.f, i32 0, i32 0), i32 %623)
  br label %625

; <label>:625                                     ; preds = %622, %619
  br label %626

; <label>:626                                     ; preds = %625, %609
  %627 = load i32, i32* %lrc, align 4
  %628 = icmp ne i32 %627, 0
  br i1 %628, label %629, label %637

; <label>:629                                     ; preds = %626
  store i32 1, i32* %rc, align 4
  %630 = load %struct.defs*, %struct.defs** %1, align 8
  %631 = getelementptr inbounds %struct.defs, %struct.defs* %630, i32 0, i32 11
  %632 = load i32, i32* %631, align 4
  %633 = icmp ne i32 %632, 0
  br i1 %633, label %634, label %636

; <label>:634                                     ; preds = %629
  %635 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %636

; <label>:636                                     ; preds = %634, %629
  br label %637

; <label>:637                                     ; preds = %636, %626
  %638 = load i32, i32* %rc, align 4
  ret i32 %638
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
