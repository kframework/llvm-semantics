; ModuleID = './cq-20-s714-b.c'
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
  store i16 2, i16* %sr, align 2
  %17 = load i16* %sr, align 2
  %18 = sext i16 %17 to i32
  %19 = load i8* %cl, align 1
  %20 = sext i8 %19 to i32
  %21 = add nsw i32 %20, %18
  %22 = trunc i32 %21 to i8
  store i8 %22, i8* %cl, align 1
  %23 = load i8* %cl, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp ne i32 %24, 7
  br i1 %25, label %26, label %33

; <label>:26                                      ; preds = %16
  store i32 51, i32* %lrc, align 4
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
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ir, align 4
  %34 = load i32* %ir, align 4
  %35 = load i8* %cl, align 1
  %36 = sext i8 %35 to i32
  %37 = add nsw i32 %36, %34
  %38 = trunc i32 %37 to i8
  store i8 %38, i8* %cl, align 1
  %39 = load i8* %cl, align 1
  %40 = sext i8 %39 to i32
  %41 = icmp ne i32 %40, 7
  br i1 %41, label %42, label %49

; <label>:42                                      ; preds = %33
  store i32 52, i32* %lrc, align 4
  %43 = load i32* %prlc, align 4
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %48

; <label>:45                                      ; preds = %42
  %46 = load i32* %lrc, align 4
  %47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %46)
  br label %48

; <label>:48                                      ; preds = %45, %42
  br label %49

; <label>:49                                      ; preds = %48, %33
  store i8 5, i8* %cl, align 1
  store i64 2, i64* %lr, align 8
  %50 = load i64* %lr, align 8
  %51 = load i8* %cl, align 1
  %52 = sext i8 %51 to i64
  %53 = add nsw i64 %52, %50
  %54 = trunc i64 %53 to i8
  store i8 %54, i8* %cl, align 1
  %55 = load i8* %cl, align 1
  %56 = sext i8 %55 to i32
  %57 = icmp ne i32 %56, 7
  br i1 %57, label %58, label %65

; <label>:58                                      ; preds = %49
  store i32 53, i32* %lrc, align 4
  %59 = load i32* %prlc, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %64

; <label>:61                                      ; preds = %58
  %62 = load i32* %lrc, align 4
  %63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %62)
  br label %64

; <label>:64                                      ; preds = %61, %58
  br label %65

; <label>:65                                      ; preds = %64, %49
  store i8 5, i8* %cl, align 1
  store i32 2, i32* %ur, align 4
  %66 = load i32* %ur, align 4
  %67 = load i8* %cl, align 1
  %68 = sext i8 %67 to i32
  %69 = add i32 %68, %66
  %70 = trunc i32 %69 to i8
  store i8 %70, i8* %cl, align 1
  %71 = load i8* %cl, align 1
  %72 = sext i8 %71 to i32
  %73 = icmp ne i32 %72, 7
  br i1 %73, label %74, label %81

; <label>:74                                      ; preds = %65
  store i32 54, i32* %lrc, align 4
  %75 = load i32* %prlc, align 4
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %80

; <label>:77                                      ; preds = %74
  %78 = load i32* %lrc, align 4
  %79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %78)
  br label %80

; <label>:80                                      ; preds = %77, %74
  br label %81

; <label>:81                                      ; preds = %80, %65
  store i8 5, i8* %cl, align 1
  store float 2.000000e+00, float* %fr, align 4
  %82 = load float* %fr, align 4
  %83 = load i8* %cl, align 1
  %84 = sitofp i8 %83 to float
  %85 = fadd float %84, %82
  %86 = fptosi float %85 to i8
  store i8 %86, i8* %cl, align 1
  %87 = load i8* %cl, align 1
  %88 = sext i8 %87 to i32
  %89 = icmp ne i32 %88, 7
  br i1 %89, label %90, label %97

; <label>:90                                      ; preds = %81
  store i32 55, i32* %lrc, align 4
  %91 = load i32* %prlc, align 4
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %96

; <label>:93                                      ; preds = %90
  %94 = load i32* %lrc, align 4
  %95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %94)
  br label %96

; <label>:96                                      ; preds = %93, %90
  br label %97

; <label>:97                                      ; preds = %96, %81
  store i8 5, i8* %cl, align 1
  store double 2.000000e+00, double* %dr, align 8
  %98 = load double* %dr, align 8
  %99 = load i8* %cl, align 1
  %100 = sitofp i8 %99 to double
  %101 = fadd double %100, %98
  %102 = fptosi double %101 to i8
  store i8 %102, i8* %cl, align 1
  %103 = load i8* %cl, align 1
  %104 = sext i8 %103 to i32
  %105 = icmp ne i32 %104, 7
  br i1 %105, label %106, label %113

; <label>:106                                     ; preds = %97
  store i32 56, i32* %lrc, align 4
  %107 = load i32* %prlc, align 4
  %108 = icmp ne i32 %107, 0
  br i1 %108, label %109, label %112

; <label>:109                                     ; preds = %106
  %110 = load i32* %lrc, align 4
  %111 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %110)
  br label %112

; <label>:112                                     ; preds = %109, %106
  br label %113

; <label>:113                                     ; preds = %112, %97
  store i16 5, i16* %sl, align 2
  store i8 2, i8* %cr, align 1
  %114 = load i8* %cr, align 1
  %115 = sext i8 %114 to i32
  %116 = load i16* %sl, align 2
  %117 = sext i16 %116 to i32
  %118 = add nsw i32 %117, %115
  %119 = trunc i32 %118 to i16
  store i16 %119, i16* %sl, align 2
  %120 = load i16* %sl, align 2
  %121 = sext i16 %120 to i32
  %122 = icmp ne i32 %121, 7
  br i1 %122, label %123, label %130

; <label>:123                                     ; preds = %113
  store i32 57, i32* %lrc, align 4
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
  store i16 2, i16* %sr, align 2
  %131 = load i16* %sr, align 2
  %132 = sext i16 %131 to i32
  %133 = load i16* %sl, align 2
  %134 = sext i16 %133 to i32
  %135 = add nsw i32 %134, %132
  %136 = trunc i32 %135 to i16
  store i16 %136, i16* %sl, align 2
  %137 = load i16* %sl, align 2
  %138 = sext i16 %137 to i32
  %139 = icmp ne i32 %138, 7
  br i1 %139, label %140, label %147

; <label>:140                                     ; preds = %130
  store i32 58, i32* %lrc, align 4
  %141 = load i32* %prlc, align 4
  %142 = icmp ne i32 %141, 0
  br i1 %142, label %143, label %146

; <label>:143                                     ; preds = %140
  %144 = load i32* %lrc, align 4
  %145 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %144)
  br label %146

; <label>:146                                     ; preds = %143, %140
  br label %147

; <label>:147                                     ; preds = %146, %130
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ir, align 4
  %148 = load i32* %ir, align 4
  %149 = load i16* %sl, align 2
  %150 = sext i16 %149 to i32
  %151 = add nsw i32 %150, %148
  %152 = trunc i32 %151 to i16
  store i16 %152, i16* %sl, align 2
  %153 = load i16* %sl, align 2
  %154 = sext i16 %153 to i32
  %155 = icmp ne i32 %154, 7
  br i1 %155, label %156, label %163

; <label>:156                                     ; preds = %147
  store i32 59, i32* %lrc, align 4
  %157 = load i32* %prlc, align 4
  %158 = icmp ne i32 %157, 0
  br i1 %158, label %159, label %162

; <label>:159                                     ; preds = %156
  %160 = load i32* %lrc, align 4
  %161 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %160)
  br label %162

; <label>:162                                     ; preds = %159, %156
  br label %163

; <label>:163                                     ; preds = %162, %147
  store i16 5, i16* %sl, align 2
  store i64 2, i64* %lr, align 8
  %164 = load i64* %lr, align 8
  %165 = load i16* %sl, align 2
  %166 = sext i16 %165 to i64
  %167 = add nsw i64 %166, %164
  %168 = trunc i64 %167 to i16
  store i16 %168, i16* %sl, align 2
  %169 = load i16* %sl, align 2
  %170 = sext i16 %169 to i32
  %171 = icmp ne i32 %170, 7
  br i1 %171, label %172, label %179

; <label>:172                                     ; preds = %163
  store i32 60, i32* %lrc, align 4
  %173 = load i32* %prlc, align 4
  %174 = icmp ne i32 %173, 0
  br i1 %174, label %175, label %178

; <label>:175                                     ; preds = %172
  %176 = load i32* %lrc, align 4
  %177 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %176)
  br label %178

; <label>:178                                     ; preds = %175, %172
  br label %179

; <label>:179                                     ; preds = %178, %163
  store i16 5, i16* %sl, align 2
  store i32 2, i32* %ur, align 4
  %180 = load i32* %ur, align 4
  %181 = load i16* %sl, align 2
  %182 = sext i16 %181 to i32
  %183 = add i32 %182, %180
  %184 = trunc i32 %183 to i16
  store i16 %184, i16* %sl, align 2
  %185 = load i16* %sl, align 2
  %186 = sext i16 %185 to i32
  %187 = icmp ne i32 %186, 7
  br i1 %187, label %188, label %195

; <label>:188                                     ; preds = %179
  store i32 61, i32* %lrc, align 4
  %189 = load i32* %prlc, align 4
  %190 = icmp ne i32 %189, 0
  br i1 %190, label %191, label %194

; <label>:191                                     ; preds = %188
  %192 = load i32* %lrc, align 4
  %193 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %192)
  br label %194

; <label>:194                                     ; preds = %191, %188
  br label %195

; <label>:195                                     ; preds = %194, %179
  store i16 5, i16* %sl, align 2
  store float 2.000000e+00, float* %fr, align 4
  %196 = load float* %fr, align 4
  %197 = load i16* %sl, align 2
  %198 = sitofp i16 %197 to float
  %199 = fadd float %198, %196
  %200 = fptosi float %199 to i16
  store i16 %200, i16* %sl, align 2
  %201 = load i16* %sl, align 2
  %202 = sext i16 %201 to i32
  %203 = icmp ne i32 %202, 7
  br i1 %203, label %204, label %211

; <label>:204                                     ; preds = %195
  store i32 62, i32* %lrc, align 4
  %205 = load i32* %prlc, align 4
  %206 = icmp ne i32 %205, 0
  br i1 %206, label %207, label %210

; <label>:207                                     ; preds = %204
  %208 = load i32* %lrc, align 4
  %209 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %208)
  br label %210

; <label>:210                                     ; preds = %207, %204
  br label %211

; <label>:211                                     ; preds = %210, %195
  store i16 5, i16* %sl, align 2
  store double 2.000000e+00, double* %dr, align 8
  %212 = load double* %dr, align 8
  %213 = load i16* %sl, align 2
  %214 = sitofp i16 %213 to double
  %215 = fadd double %214, %212
  %216 = fptosi double %215 to i16
  store i16 %216, i16* %sl, align 2
  %217 = load i16* %sl, align 2
  %218 = sext i16 %217 to i32
  %219 = icmp ne i32 %218, 7
  br i1 %219, label %220, label %227

; <label>:220                                     ; preds = %211
  store i32 63, i32* %lrc, align 4
  %221 = load i32* %prlc, align 4
  %222 = icmp ne i32 %221, 0
  br i1 %222, label %223, label %226

; <label>:223                                     ; preds = %220
  %224 = load i32* %lrc, align 4
  %225 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %224)
  br label %226

; <label>:226                                     ; preds = %223, %220
  br label %227

; <label>:227                                     ; preds = %226, %211
  store i32 5, i32* %il, align 4
  store i8 2, i8* %cr, align 1
  %228 = load i8* %cr, align 1
  %229 = sext i8 %228 to i32
  %230 = load i32* %il, align 4
  %231 = add nsw i32 %230, %229
  store i32 %231, i32* %il, align 4
  %232 = load i32* %il, align 4
  %233 = icmp ne i32 %232, 7
  br i1 %233, label %234, label %241

; <label>:234                                     ; preds = %227
  store i32 64, i32* %lrc, align 4
  %235 = load i32* %prlc, align 4
  %236 = icmp ne i32 %235, 0
  br i1 %236, label %237, label %240

; <label>:237                                     ; preds = %234
  %238 = load i32* %lrc, align 4
  %239 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %238)
  br label %240

; <label>:240                                     ; preds = %237, %234
  br label %241

; <label>:241                                     ; preds = %240, %227
  store i32 5, i32* %il, align 4
  store i16 2, i16* %sr, align 2
  %242 = load i16* %sr, align 2
  %243 = sext i16 %242 to i32
  %244 = load i32* %il, align 4
  %245 = add nsw i32 %244, %243
  store i32 %245, i32* %il, align 4
  %246 = load i32* %il, align 4
  %247 = icmp ne i32 %246, 7
  br i1 %247, label %248, label %255

; <label>:248                                     ; preds = %241
  store i32 65, i32* %lrc, align 4
  %249 = load i32* %prlc, align 4
  %250 = icmp ne i32 %249, 0
  br i1 %250, label %251, label %254

; <label>:251                                     ; preds = %248
  %252 = load i32* %lrc, align 4
  %253 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %252)
  br label %254

; <label>:254                                     ; preds = %251, %248
  br label %255

; <label>:255                                     ; preds = %254, %241
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ir, align 4
  %256 = load i32* %ir, align 4
  %257 = load i32* %il, align 4
  %258 = add nsw i32 %257, %256
  store i32 %258, i32* %il, align 4
  %259 = load i32* %il, align 4
  %260 = icmp ne i32 %259, 7
  br i1 %260, label %261, label %268

; <label>:261                                     ; preds = %255
  store i32 66, i32* %lrc, align 4
  %262 = load i32* %prlc, align 4
  %263 = icmp ne i32 %262, 0
  br i1 %263, label %264, label %267

; <label>:264                                     ; preds = %261
  %265 = load i32* %lrc, align 4
  %266 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %265)
  br label %267

; <label>:267                                     ; preds = %264, %261
  br label %268

; <label>:268                                     ; preds = %267, %255
  store i32 5, i32* %il, align 4
  store i64 2, i64* %lr, align 8
  %269 = load i64* %lr, align 8
  %270 = load i32* %il, align 4
  %271 = sext i32 %270 to i64
  %272 = add nsw i64 %271, %269
  %273 = trunc i64 %272 to i32
  store i32 %273, i32* %il, align 4
  %274 = load i32* %il, align 4
  %275 = icmp ne i32 %274, 7
  br i1 %275, label %276, label %283

; <label>:276                                     ; preds = %268
  store i32 67, i32* %lrc, align 4
  %277 = load i32* %prlc, align 4
  %278 = icmp ne i32 %277, 0
  br i1 %278, label %279, label %282

; <label>:279                                     ; preds = %276
  %280 = load i32* %lrc, align 4
  %281 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %280)
  br label %282

; <label>:282                                     ; preds = %279, %276
  br label %283

; <label>:283                                     ; preds = %282, %268
  store i32 5, i32* %il, align 4
  store i32 2, i32* %ur, align 4
  %284 = load i32* %ur, align 4
  %285 = load i32* %il, align 4
  %286 = add i32 %285, %284
  store i32 %286, i32* %il, align 4
  %287 = load i32* %il, align 4
  %288 = icmp ne i32 %287, 7
  br i1 %288, label %289, label %296

; <label>:289                                     ; preds = %283
  store i32 68, i32* %lrc, align 4
  %290 = load i32* %prlc, align 4
  %291 = icmp ne i32 %290, 0
  br i1 %291, label %292, label %295

; <label>:292                                     ; preds = %289
  %293 = load i32* %lrc, align 4
  %294 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %293)
  br label %295

; <label>:295                                     ; preds = %292, %289
  br label %296

; <label>:296                                     ; preds = %295, %283
  store i32 5, i32* %il, align 4
  store float 2.000000e+00, float* %fr, align 4
  %297 = load float* %fr, align 4
  %298 = load i32* %il, align 4
  %299 = sitofp i32 %298 to float
  %300 = fadd float %299, %297
  %301 = fptosi float %300 to i32
  store i32 %301, i32* %il, align 4
  %302 = load i32* %il, align 4
  %303 = icmp ne i32 %302, 7
  br i1 %303, label %304, label %311

; <label>:304                                     ; preds = %296
  store i32 69, i32* %lrc, align 4
  %305 = load i32* %prlc, align 4
  %306 = icmp ne i32 %305, 0
  br i1 %306, label %307, label %310

; <label>:307                                     ; preds = %304
  %308 = load i32* %lrc, align 4
  %309 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %308)
  br label %310

; <label>:310                                     ; preds = %307, %304
  br label %311

; <label>:311                                     ; preds = %310, %296
  store i32 5, i32* %il, align 4
  store double 2.000000e+00, double* %dr, align 8
  %312 = load double* %dr, align 8
  %313 = load i32* %il, align 4
  %314 = sitofp i32 %313 to double
  %315 = fadd double %314, %312
  %316 = fptosi double %315 to i32
  store i32 %316, i32* %il, align 4
  %317 = load i32* %il, align 4
  %318 = icmp ne i32 %317, 7
  br i1 %318, label %319, label %326

; <label>:319                                     ; preds = %311
  store i32 70, i32* %lrc, align 4
  %320 = load i32* %prlc, align 4
  %321 = icmp ne i32 %320, 0
  br i1 %321, label %322, label %325

; <label>:322                                     ; preds = %319
  %323 = load i32* %lrc, align 4
  %324 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %323)
  br label %325

; <label>:325                                     ; preds = %322, %319
  br label %326

; <label>:326                                     ; preds = %325, %311
  store i64 5, i64* %ll, align 8
  store i8 2, i8* %cr, align 1
  %327 = load i8* %cr, align 1
  %328 = sext i8 %327 to i64
  %329 = load i64* %ll, align 8
  %330 = add nsw i64 %329, %328
  store i64 %330, i64* %ll, align 8
  %331 = load i64* %ll, align 8
  %332 = icmp ne i64 %331, 7
  br i1 %332, label %333, label %340

; <label>:333                                     ; preds = %326
  store i32 71, i32* %lrc, align 4
  %334 = load i32* %prlc, align 4
  %335 = icmp ne i32 %334, 0
  br i1 %335, label %336, label %339

; <label>:336                                     ; preds = %333
  %337 = load i32* %lrc, align 4
  %338 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %337)
  br label %339

; <label>:339                                     ; preds = %336, %333
  br label %340

; <label>:340                                     ; preds = %339, %326
  store i64 5, i64* %ll, align 8
  store i16 2, i16* %sr, align 2
  %341 = load i16* %sr, align 2
  %342 = sext i16 %341 to i64
  %343 = load i64* %ll, align 8
  %344 = add nsw i64 %343, %342
  store i64 %344, i64* %ll, align 8
  %345 = load i64* %ll, align 8
  %346 = icmp ne i64 %345, 7
  br i1 %346, label %347, label %354

; <label>:347                                     ; preds = %340
  store i32 72, i32* %lrc, align 4
  %348 = load i32* %prlc, align 4
  %349 = icmp ne i32 %348, 0
  br i1 %349, label %350, label %353

; <label>:350                                     ; preds = %347
  %351 = load i32* %lrc, align 4
  %352 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %351)
  br label %353

; <label>:353                                     ; preds = %350, %347
  br label %354

; <label>:354                                     ; preds = %353, %340
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ir, align 4
  %355 = load i32* %ir, align 4
  %356 = sext i32 %355 to i64
  %357 = load i64* %ll, align 8
  %358 = add nsw i64 %357, %356
  store i64 %358, i64* %ll, align 8
  %359 = load i64* %ll, align 8
  %360 = icmp ne i64 %359, 7
  br i1 %360, label %361, label %368

; <label>:361                                     ; preds = %354
  store i32 73, i32* %lrc, align 4
  %362 = load i32* %prlc, align 4
  %363 = icmp ne i32 %362, 0
  br i1 %363, label %364, label %367

; <label>:364                                     ; preds = %361
  %365 = load i32* %lrc, align 4
  %366 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %365)
  br label %367

; <label>:367                                     ; preds = %364, %361
  br label %368

; <label>:368                                     ; preds = %367, %354
  store i64 5, i64* %ll, align 8
  store i64 2, i64* %lr, align 8
  %369 = load i64* %lr, align 8
  %370 = load i64* %ll, align 8
  %371 = add nsw i64 %370, %369
  store i64 %371, i64* %ll, align 8
  %372 = load i64* %ll, align 8
  %373 = icmp ne i64 %372, 7
  br i1 %373, label %374, label %381

; <label>:374                                     ; preds = %368
  store i32 74, i32* %lrc, align 4
  %375 = load i32* %prlc, align 4
  %376 = icmp ne i32 %375, 0
  br i1 %376, label %377, label %380

; <label>:377                                     ; preds = %374
  %378 = load i32* %lrc, align 4
  %379 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %378)
  br label %380

; <label>:380                                     ; preds = %377, %374
  br label %381

; <label>:381                                     ; preds = %380, %368
  store i64 5, i64* %ll, align 8
  store i32 2, i32* %ur, align 4
  %382 = load i32* %ur, align 4
  %383 = zext i32 %382 to i64
  %384 = load i64* %ll, align 8
  %385 = add nsw i64 %384, %383
  store i64 %385, i64* %ll, align 8
  %386 = load i64* %ll, align 8
  %387 = icmp ne i64 %386, 7
  br i1 %387, label %388, label %395

; <label>:388                                     ; preds = %381
  store i32 75, i32* %lrc, align 4
  %389 = load i32* %prlc, align 4
  %390 = icmp ne i32 %389, 0
  br i1 %390, label %391, label %394

; <label>:391                                     ; preds = %388
  %392 = load i32* %lrc, align 4
  %393 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %392)
  br label %394

; <label>:394                                     ; preds = %391, %388
  br label %395

; <label>:395                                     ; preds = %394, %381
  store i64 5, i64* %ll, align 8
  store float 2.000000e+00, float* %fr, align 4
  %396 = load float* %fr, align 4
  %397 = load i64* %ll, align 8
  %398 = sitofp i64 %397 to float
  %399 = fadd float %398, %396
  %400 = fptosi float %399 to i64
  store i64 %400, i64* %ll, align 8
  %401 = load i64* %ll, align 8
  %402 = icmp ne i64 %401, 7
  br i1 %402, label %403, label %410

; <label>:403                                     ; preds = %395
  store i32 76, i32* %lrc, align 4
  %404 = load i32* %prlc, align 4
  %405 = icmp ne i32 %404, 0
  br i1 %405, label %406, label %409

; <label>:406                                     ; preds = %403
  %407 = load i32* %lrc, align 4
  %408 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %407)
  br label %409

; <label>:409                                     ; preds = %406, %403
  br label %410

; <label>:410                                     ; preds = %409, %395
  store i64 5, i64* %ll, align 8
  store double 2.000000e+00, double* %dr, align 8
  %411 = load double* %dr, align 8
  %412 = load i64* %ll, align 8
  %413 = sitofp i64 %412 to double
  %414 = fadd double %413, %411
  %415 = fptosi double %414 to i64
  store i64 %415, i64* %ll, align 8
  %416 = load i64* %ll, align 8
  %417 = icmp ne i64 %416, 7
  br i1 %417, label %418, label %425

; <label>:418                                     ; preds = %410
  store i32 77, i32* %lrc, align 4
  %419 = load i32* %prlc, align 4
  %420 = icmp ne i32 %419, 0
  br i1 %420, label %421, label %424

; <label>:421                                     ; preds = %418
  %422 = load i32* %lrc, align 4
  %423 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %422)
  br label %424

; <label>:424                                     ; preds = %421, %418
  br label %425

; <label>:425                                     ; preds = %424, %410
  store i32 5, i32* %ul, align 4
  store i8 2, i8* %cr, align 1
  %426 = load i8* %cr, align 1
  %427 = sext i8 %426 to i32
  %428 = load i32* %ul, align 4
  %429 = add i32 %428, %427
  store i32 %429, i32* %ul, align 4
  %430 = load i32* %ul, align 4
  %431 = icmp ne i32 %430, 7
  br i1 %431, label %432, label %439

; <label>:432                                     ; preds = %425
  store i32 78, i32* %lrc, align 4
  %433 = load i32* %prlc, align 4
  %434 = icmp ne i32 %433, 0
  br i1 %434, label %435, label %438

; <label>:435                                     ; preds = %432
  %436 = load i32* %lrc, align 4
  %437 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %436)
  br label %438

; <label>:438                                     ; preds = %435, %432
  br label %439

; <label>:439                                     ; preds = %438, %425
  store i32 5, i32* %ul, align 4
  store i16 2, i16* %sr, align 2
  %440 = load i16* %sr, align 2
  %441 = sext i16 %440 to i32
  %442 = load i32* %ul, align 4
  %443 = add i32 %442, %441
  store i32 %443, i32* %ul, align 4
  %444 = load i32* %ul, align 4
  %445 = icmp ne i32 %444, 7
  br i1 %445, label %446, label %453

; <label>:446                                     ; preds = %439
  store i32 79, i32* %lrc, align 4
  %447 = load i32* %prlc, align 4
  %448 = icmp ne i32 %447, 0
  br i1 %448, label %449, label %452

; <label>:449                                     ; preds = %446
  %450 = load i32* %lrc, align 4
  %451 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %450)
  br label %452

; <label>:452                                     ; preds = %449, %446
  br label %453

; <label>:453                                     ; preds = %452, %439
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ir, align 4
  %454 = load i32* %ir, align 4
  %455 = load i32* %ul, align 4
  %456 = add i32 %455, %454
  store i32 %456, i32* %ul, align 4
  %457 = load i32* %ul, align 4
  %458 = icmp ne i32 %457, 7
  br i1 %458, label %459, label %466

; <label>:459                                     ; preds = %453
  store i32 80, i32* %lrc, align 4
  %460 = load i32* %prlc, align 4
  %461 = icmp ne i32 %460, 0
  br i1 %461, label %462, label %465

; <label>:462                                     ; preds = %459
  %463 = load i32* %lrc, align 4
  %464 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %463)
  br label %465

; <label>:465                                     ; preds = %462, %459
  br label %466

; <label>:466                                     ; preds = %465, %453
  store i32 5, i32* %ul, align 4
  store i64 2, i64* %lr, align 8
  %467 = load i64* %lr, align 8
  %468 = load i32* %ul, align 4
  %469 = zext i32 %468 to i64
  %470 = add nsw i64 %469, %467
  %471 = trunc i64 %470 to i32
  store i32 %471, i32* %ul, align 4
  %472 = load i32* %ul, align 4
  %473 = icmp ne i32 %472, 7
  br i1 %473, label %474, label %481

; <label>:474                                     ; preds = %466
  store i32 81, i32* %lrc, align 4
  %475 = load i32* %prlc, align 4
  %476 = icmp ne i32 %475, 0
  br i1 %476, label %477, label %480

; <label>:477                                     ; preds = %474
  %478 = load i32* %lrc, align 4
  %479 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %478)
  br label %480

; <label>:480                                     ; preds = %477, %474
  br label %481

; <label>:481                                     ; preds = %480, %466
  store i32 5, i32* %ul, align 4
  store i32 2, i32* %ur, align 4
  %482 = load i32* %ur, align 4
  %483 = load i32* %ul, align 4
  %484 = add i32 %483, %482
  store i32 %484, i32* %ul, align 4
  %485 = load i32* %ul, align 4
  %486 = icmp ne i32 %485, 7
  br i1 %486, label %487, label %494

; <label>:487                                     ; preds = %481
  store i32 82, i32* %lrc, align 4
  %488 = load i32* %prlc, align 4
  %489 = icmp ne i32 %488, 0
  br i1 %489, label %490, label %493

; <label>:490                                     ; preds = %487
  %491 = load i32* %lrc, align 4
  %492 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %491)
  br label %493

; <label>:493                                     ; preds = %490, %487
  br label %494

; <label>:494                                     ; preds = %493, %481
  store i32 5, i32* %ul, align 4
  store float 2.000000e+00, float* %fr, align 4
  %495 = load float* %fr, align 4
  %496 = load i32* %ul, align 4
  %497 = uitofp i32 %496 to float
  %498 = fadd float %497, %495
  %499 = fptoui float %498 to i32
  store i32 %499, i32* %ul, align 4
  %500 = load i32* %ul, align 4
  %501 = icmp ne i32 %500, 7
  br i1 %501, label %502, label %509

; <label>:502                                     ; preds = %494
  store i32 83, i32* %lrc, align 4
  %503 = load i32* %prlc, align 4
  %504 = icmp ne i32 %503, 0
  br i1 %504, label %505, label %508

; <label>:505                                     ; preds = %502
  %506 = load i32* %lrc, align 4
  %507 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %506)
  br label %508

; <label>:508                                     ; preds = %505, %502
  br label %509

; <label>:509                                     ; preds = %508, %494
  store i32 5, i32* %ul, align 4
  store double 2.000000e+00, double* %dr, align 8
  %510 = load double* %dr, align 8
  %511 = load i32* %ul, align 4
  %512 = uitofp i32 %511 to double
  %513 = fadd double %512, %510
  %514 = fptoui double %513 to i32
  store i32 %514, i32* %ul, align 4
  %515 = load i32* %ul, align 4
  %516 = icmp ne i32 %515, 7
  br i1 %516, label %517, label %524

; <label>:517                                     ; preds = %509
  store i32 84, i32* %lrc, align 4
  %518 = load i32* %prlc, align 4
  %519 = icmp ne i32 %518, 0
  br i1 %519, label %520, label %523

; <label>:520                                     ; preds = %517
  %521 = load i32* %lrc, align 4
  %522 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %521)
  br label %523

; <label>:523                                     ; preds = %520, %517
  br label %524

; <label>:524                                     ; preds = %523, %509
  store float 5.000000e+00, float* %fl, align 4
  store i8 2, i8* %cr, align 1
  %525 = load i8* %cr, align 1
  %526 = sext i8 %525 to i32
  %527 = sitofp i32 %526 to float
  %528 = load float* %fl, align 4
  %529 = fadd float %528, %527
  store float %529, float* %fl, align 4
  %530 = load float* %fl, align 4
  %531 = fcmp une float %530, 7.000000e+00
  br i1 %531, label %532, label %539

; <label>:532                                     ; preds = %524
  store i32 85, i32* %lrc, align 4
  %533 = load i32* %prlc, align 4
  %534 = icmp ne i32 %533, 0
  br i1 %534, label %535, label %538

; <label>:535                                     ; preds = %532
  %536 = load i32* %lrc, align 4
  %537 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %536)
  br label %538

; <label>:538                                     ; preds = %535, %532
  br label %539

; <label>:539                                     ; preds = %538, %524
  store float 5.000000e+00, float* %fl, align 4
  store i16 2, i16* %sr, align 2
  %540 = load i16* %sr, align 2
  %541 = sext i16 %540 to i32
  %542 = sitofp i32 %541 to float
  %543 = load float* %fl, align 4
  %544 = fadd float %543, %542
  store float %544, float* %fl, align 4
  %545 = load float* %fl, align 4
  %546 = fcmp une float %545, 7.000000e+00
  br i1 %546, label %547, label %554

; <label>:547                                     ; preds = %539
  store i32 86, i32* %lrc, align 4
  %548 = load i32* %prlc, align 4
  %549 = icmp ne i32 %548, 0
  br i1 %549, label %550, label %553

; <label>:550                                     ; preds = %547
  %551 = load i32* %lrc, align 4
  %552 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %551)
  br label %553

; <label>:553                                     ; preds = %550, %547
  br label %554

; <label>:554                                     ; preds = %553, %539
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ir, align 4
  %555 = load i32* %ir, align 4
  %556 = sitofp i32 %555 to float
  %557 = load float* %fl, align 4
  %558 = fadd float %557, %556
  store float %558, float* %fl, align 4
  %559 = load float* %fl, align 4
  %560 = fcmp une float %559, 7.000000e+00
  br i1 %560, label %561, label %568

; <label>:561                                     ; preds = %554
  store i32 87, i32* %lrc, align 4
  %562 = load i32* %prlc, align 4
  %563 = icmp ne i32 %562, 0
  br i1 %563, label %564, label %567

; <label>:564                                     ; preds = %561
  %565 = load i32* %lrc, align 4
  %566 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %565)
  br label %567

; <label>:567                                     ; preds = %564, %561
  br label %568

; <label>:568                                     ; preds = %567, %554
  store float 5.000000e+00, float* %fl, align 4
  store i64 2, i64* %lr, align 8
  %569 = load i64* %lr, align 8
  %570 = sitofp i64 %569 to float
  %571 = load float* %fl, align 4
  %572 = fadd float %571, %570
  store float %572, float* %fl, align 4
  %573 = load float* %fl, align 4
  %574 = fcmp une float %573, 7.000000e+00
  br i1 %574, label %575, label %582

; <label>:575                                     ; preds = %568
  store i32 88, i32* %lrc, align 4
  %576 = load i32* %prlc, align 4
  %577 = icmp ne i32 %576, 0
  br i1 %577, label %578, label %581

; <label>:578                                     ; preds = %575
  %579 = load i32* %lrc, align 4
  %580 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %579)
  br label %581

; <label>:581                                     ; preds = %578, %575
  br label %582

; <label>:582                                     ; preds = %581, %568
  store float 5.000000e+00, float* %fl, align 4
  store i32 2, i32* %ur, align 4
  %583 = load i32* %ur, align 4
  %584 = uitofp i32 %583 to float
  %585 = load float* %fl, align 4
  %586 = fadd float %585, %584
  store float %586, float* %fl, align 4
  %587 = load float* %fl, align 4
  %588 = fcmp une float %587, 7.000000e+00
  br i1 %588, label %589, label %596

; <label>:589                                     ; preds = %582
  store i32 89, i32* %lrc, align 4
  %590 = load i32* %prlc, align 4
  %591 = icmp ne i32 %590, 0
  br i1 %591, label %592, label %595

; <label>:592                                     ; preds = %589
  %593 = load i32* %lrc, align 4
  %594 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %593)
  br label %595

; <label>:595                                     ; preds = %592, %589
  br label %596

; <label>:596                                     ; preds = %595, %582
  store float 5.000000e+00, float* %fl, align 4
  store float 2.000000e+00, float* %fr, align 4
  %597 = load float* %fr, align 4
  %598 = load float* %fl, align 4
  %599 = fadd float %598, %597
  store float %599, float* %fl, align 4
  %600 = load float* %fl, align 4
  %601 = fcmp une float %600, 7.000000e+00
  br i1 %601, label %602, label %609

; <label>:602                                     ; preds = %596
  store i32 90, i32* %lrc, align 4
  %603 = load i32* %prlc, align 4
  %604 = icmp ne i32 %603, 0
  br i1 %604, label %605, label %608

; <label>:605                                     ; preds = %602
  %606 = load i32* %lrc, align 4
  %607 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %606)
  br label %608

; <label>:608                                     ; preds = %605, %602
  br label %609

; <label>:609                                     ; preds = %608, %596
  store float 5.000000e+00, float* %fl, align 4
  store double 2.000000e+00, double* %dr, align 8
  %610 = load double* %dr, align 8
  %611 = load float* %fl, align 4
  %612 = fpext float %611 to double
  %613 = fadd double %612, %610
  %614 = fptrunc double %613 to float
  store float %614, float* %fl, align 4
  %615 = load float* %fl, align 4
  %616 = fcmp une float %615, 7.000000e+00
  br i1 %616, label %617, label %624

; <label>:617                                     ; preds = %609
  store i32 91, i32* %lrc, align 4
  %618 = load i32* %prlc, align 4
  %619 = icmp ne i32 %618, 0
  br i1 %619, label %620, label %623

; <label>:620                                     ; preds = %617
  %621 = load i32* %lrc, align 4
  %622 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %621)
  br label %623

; <label>:623                                     ; preds = %620, %617
  br label %624

; <label>:624                                     ; preds = %623, %609
  store double 5.000000e+00, double* %dl, align 8
  store i8 2, i8* %cr, align 1
  %625 = load i8* %cr, align 1
  %626 = sext i8 %625 to i32
  %627 = sitofp i32 %626 to double
  %628 = load double* %dl, align 8
  %629 = fadd double %628, %627
  store double %629, double* %dl, align 8
  %630 = load double* %dl, align 8
  %631 = fcmp une double %630, 7.000000e+00
  br i1 %631, label %632, label %639

; <label>:632                                     ; preds = %624
  store i32 92, i32* %lrc, align 4
  %633 = load i32* %prlc, align 4
  %634 = icmp ne i32 %633, 0
  br i1 %634, label %635, label %638

; <label>:635                                     ; preds = %632
  %636 = load i32* %lrc, align 4
  %637 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %636)
  br label %638

; <label>:638                                     ; preds = %635, %632
  br label %639

; <label>:639                                     ; preds = %638, %624
  store double 5.000000e+00, double* %dl, align 8
  store i16 2, i16* %sr, align 2
  %640 = load i16* %sr, align 2
  %641 = sext i16 %640 to i32
  %642 = sitofp i32 %641 to double
  %643 = load double* %dl, align 8
  %644 = fadd double %643, %642
  store double %644, double* %dl, align 8
  %645 = load double* %dl, align 8
  %646 = fcmp une double %645, 7.000000e+00
  br i1 %646, label %647, label %654

; <label>:647                                     ; preds = %639
  store i32 93, i32* %lrc, align 4
  %648 = load i32* %prlc, align 4
  %649 = icmp ne i32 %648, 0
  br i1 %649, label %650, label %653

; <label>:650                                     ; preds = %647
  %651 = load i32* %lrc, align 4
  %652 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %651)
  br label %653

; <label>:653                                     ; preds = %650, %647
  br label %654

; <label>:654                                     ; preds = %653, %639
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ir, align 4
  %655 = load i32* %ir, align 4
  %656 = sitofp i32 %655 to double
  %657 = load double* %dl, align 8
  %658 = fadd double %657, %656
  store double %658, double* %dl, align 8
  %659 = load double* %dl, align 8
  %660 = fcmp une double %659, 7.000000e+00
  br i1 %660, label %661, label %668

; <label>:661                                     ; preds = %654
  store i32 94, i32* %lrc, align 4
  %662 = load i32* %prlc, align 4
  %663 = icmp ne i32 %662, 0
  br i1 %663, label %664, label %667

; <label>:664                                     ; preds = %661
  %665 = load i32* %lrc, align 4
  %666 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %665)
  br label %667

; <label>:667                                     ; preds = %664, %661
  br label %668

; <label>:668                                     ; preds = %667, %654
  store double 5.000000e+00, double* %dl, align 8
  store i64 2, i64* %lr, align 8
  %669 = load i64* %lr, align 8
  %670 = sitofp i64 %669 to double
  %671 = load double* %dl, align 8
  %672 = fadd double %671, %670
  store double %672, double* %dl, align 8
  %673 = load double* %dl, align 8
  %674 = fcmp une double %673, 7.000000e+00
  br i1 %674, label %675, label %682

; <label>:675                                     ; preds = %668
  store i32 95, i32* %lrc, align 4
  %676 = load i32* %prlc, align 4
  %677 = icmp ne i32 %676, 0
  br i1 %677, label %678, label %681

; <label>:678                                     ; preds = %675
  %679 = load i32* %lrc, align 4
  %680 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %679)
  br label %681

; <label>:681                                     ; preds = %678, %675
  br label %682

; <label>:682                                     ; preds = %681, %668
  store double 5.000000e+00, double* %dl, align 8
  store i32 2, i32* %ur, align 4
  %683 = load i32* %ur, align 4
  %684 = uitofp i32 %683 to double
  %685 = load double* %dl, align 8
  %686 = fadd double %685, %684
  store double %686, double* %dl, align 8
  %687 = load double* %dl, align 8
  %688 = fcmp une double %687, 7.000000e+00
  br i1 %688, label %689, label %696

; <label>:689                                     ; preds = %682
  store i32 96, i32* %lrc, align 4
  %690 = load i32* %prlc, align 4
  %691 = icmp ne i32 %690, 0
  br i1 %691, label %692, label %695

; <label>:692                                     ; preds = %689
  %693 = load i32* %lrc, align 4
  %694 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %693)
  br label %695

; <label>:695                                     ; preds = %692, %689
  br label %696

; <label>:696                                     ; preds = %695, %682
  store double 5.000000e+00, double* %dl, align 8
  store float 2.000000e+00, float* %fr, align 4
  %697 = load float* %fr, align 4
  %698 = fpext float %697 to double
  %699 = load double* %dl, align 8
  %700 = fadd double %699, %698
  store double %700, double* %dl, align 8
  %701 = load double* %dl, align 8
  %702 = fcmp une double %701, 7.000000e+00
  br i1 %702, label %703, label %710

; <label>:703                                     ; preds = %696
  store i32 97, i32* %lrc, align 4
  %704 = load i32* %prlc, align 4
  %705 = icmp ne i32 %704, 0
  br i1 %705, label %706, label %709

; <label>:706                                     ; preds = %703
  %707 = load i32* %lrc, align 4
  %708 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %707)
  br label %709

; <label>:709                                     ; preds = %706, %703
  br label %710

; <label>:710                                     ; preds = %709, %696
  store double 5.000000e+00, double* %dl, align 8
  store double 2.000000e+00, double* %dr, align 8
  %711 = load double* %dr, align 8
  %712 = load double* %dl, align 8
  %713 = fadd double %712, %711
  store double %713, double* %dl, align 8
  %714 = load double* %dl, align 8
  %715 = fcmp une double %714, 7.000000e+00
  br i1 %715, label %716, label %723

; <label>:716                                     ; preds = %710
  store i32 98, i32* %lrc, align 4
  %717 = load i32* %prlc, align 4
  %718 = icmp ne i32 %717, 0
  br i1 %718, label %719, label %722

; <label>:719                                     ; preds = %716
  %720 = load i32* %lrc, align 4
  %721 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %720)
  br label %722

; <label>:722                                     ; preds = %719, %716
  br label %723

; <label>:723                                     ; preds = %722, %710
  store i8 5, i8* %cl, align 1
  store i8 2, i8* %cr, align 1
  %724 = load i8* %cr, align 1
  %725 = sext i8 %724 to i32
  %726 = load i8* %cl, align 1
  %727 = sext i8 %726 to i32
  %728 = sub nsw i32 %727, %725
  %729 = trunc i32 %728 to i8
  store i8 %729, i8* %cl, align 1
  %730 = load i8* %cl, align 1
  %731 = sext i8 %730 to i32
  %732 = icmp ne i32 %731, 3
  br i1 %732, label %733, label %740

; <label>:733                                     ; preds = %723
  store i32 99, i32* %lrc, align 4
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
  store i16 2, i16* %sr, align 2
  %741 = load i16* %sr, align 2
  %742 = sext i16 %741 to i32
  %743 = load i8* %cl, align 1
  %744 = sext i8 %743 to i32
  %745 = sub nsw i32 %744, %742
  %746 = trunc i32 %745 to i8
  store i8 %746, i8* %cl, align 1
  %747 = load i8* %cl, align 1
  %748 = sext i8 %747 to i32
  %749 = icmp ne i32 %748, 3
  br i1 %749, label %750, label %757

; <label>:750                                     ; preds = %740
  store i32 100, i32* %lrc, align 4
  %751 = load i32* %prlc, align 4
  %752 = icmp ne i32 %751, 0
  br i1 %752, label %753, label %756

; <label>:753                                     ; preds = %750
  %754 = load i32* %lrc, align 4
  %755 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @sec.f, i32 0, i32 0), i32 %754)
  br label %756

; <label>:756                                     ; preds = %753, %750
  br label %757

; <label>:757                                     ; preds = %756, %740
  %758 = load i32* %lrc, align 4
  %759 = icmp ne i32 %758, 0
  br i1 %759, label %760, label %768

; <label>:760                                     ; preds = %757
  store i32 1, i32* %rc, align 4
  %761 = load %struct.defs** %1, align 8
  %762 = getelementptr inbounds %struct.defs* %761, i32 0, i32 11
  %763 = load i32* %762, align 4
  %764 = icmp ne i32 %763, 0
  br i1 %764, label %765, label %767

; <label>:765                                     ; preds = %760
  %766 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s714er, i32 0, i32 0), i32 1)
  br label %767

; <label>:767                                     ; preds = %765, %760
  br label %768

; <label>:768                                     ; preds = %767, %757
  %769 = load i32* %rc, align 4
  ret i32 %769
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
