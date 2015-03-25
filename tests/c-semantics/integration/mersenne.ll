; ModuleID = './mersenne.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@mt = internal global [11 x i64] zeroinitializer, align 16
@mti = internal global i32 12, align 4
@genrand_int32.mag01 = internal global [2 x i64] [i64 0, i64 2567483615], align 16
@main.init = private unnamed_addr constant [4 x i64] [i64 291, i64 564, i64 837, i64 1110], align 16
@.str = private unnamed_addr constant [30 x i8] c"5 outputs of genrand_int32()\0A\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"%u \00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @init_genrand(i64 %s) #0 {
  %1 = alloca i64, align 8
  store i64 %s, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = and i64 %2, 4294967295
  store i64 %3, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  store i32 1, i32* @mti, align 4
  br label %4

; <label>:4                                       ; preds = %32, %0
  %5 = load i32* @mti, align 4
  %6 = icmp slt i32 %5, 11
  br i1 %6, label %7, label %35

; <label>:7                                       ; preds = %4
  %8 = load i32* @mti, align 4
  %9 = sub nsw i32 %8, 1
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %10
  %12 = load i64* %11, align 8
  %13 = load i32* @mti, align 4
  %14 = sub nsw i32 %13, 1
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %15
  %17 = load i64* %16, align 8
  %18 = lshr i64 %17, 30
  %19 = xor i64 %12, %18
  %20 = mul i64 1812433253, %19
  %21 = load i32* @mti, align 4
  %22 = sext i32 %21 to i64
  %23 = add i64 %20, %22
  %24 = load i32* @mti, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %25
  store i64 %23, i64* %26, align 8
  %27 = load i32* @mti, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %28
  %30 = load i64* %29, align 8
  %31 = and i64 %30, 4294967295
  store i64 %31, i64* %29, align 8
  br label %32

; <label>:32                                      ; preds = %7
  %33 = load i32* @mti, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* @mti, align 4
  br label %4

; <label>:35                                      ; preds = %4
  ret void
}

; Function Attrs: nounwind uwtable
define void @init_by_array(i64* %init_key, i32 %key_length) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i64* %init_key, i64** %1, align 8
  store i32 %key_length, i32* %2, align 4
  call void @init_genrand(i64 19650218)
  store i32 1, i32* %i, align 4
  store i32 0, i32* %j, align 4
  %3 = load i32* %2, align 4
  %4 = icmp sgt i32 11, %3
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  br label %8

; <label>:6                                       ; preds = %0
  %7 = load i32* %2, align 4
  br label %8

; <label>:8                                       ; preds = %6, %5
  %9 = phi i32 [ 11, %5 ], [ %7, %6 ]
  store i32 %9, i32* %k, align 4
  br label %10

; <label>:10                                      ; preds = %63, %8
  %11 = load i32* %k, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %66

; <label>:13                                      ; preds = %10
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %15
  %17 = load i64* %16, align 8
  %18 = load i32* %i, align 4
  %19 = sub nsw i32 %18, 1
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %20
  %22 = load i64* %21, align 8
  %23 = load i32* %i, align 4
  %24 = sub nsw i32 %23, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %25
  %27 = load i64* %26, align 8
  %28 = lshr i64 %27, 30
  %29 = xor i64 %22, %28
  %30 = mul i64 %29, 1664525
  %31 = xor i64 %17, %30
  %32 = load i32* %j, align 4
  %33 = sext i32 %32 to i64
  %34 = load i64** %1, align 8
  %35 = getelementptr inbounds i64* %34, i64 %33
  %36 = load i64* %35, align 8
  %37 = add i64 %31, %36
  %38 = load i32* %j, align 4
  %39 = sext i32 %38 to i64
  %40 = add i64 %37, %39
  %41 = load i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %42
  store i64 %40, i64* %43, align 8
  %44 = load i32* %i, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %45
  %47 = load i64* %46, align 8
  %48 = and i64 %47, 4294967295
  store i64 %48, i64* %46, align 8
  %49 = load i32* %i, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %i, align 4
  %51 = load i32* %j, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %j, align 4
  %53 = load i32* %i, align 4
  %54 = icmp sge i32 %53, 11
  br i1 %54, label %55, label %57

; <label>:55                                      ; preds = %13
  %56 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 10), align 8
  store i64 %56, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  store i32 1, i32* %i, align 4
  br label %57

; <label>:57                                      ; preds = %55, %13
  %58 = load i32* %j, align 4
  %59 = load i32* %2, align 4
  %60 = icmp sge i32 %58, %59
  br i1 %60, label %61, label %62

; <label>:61                                      ; preds = %57
  store i32 0, i32* %j, align 4
  br label %62

; <label>:62                                      ; preds = %61, %57
  br label %63

; <label>:63                                      ; preds = %62
  %64 = load i32* %k, align 4
  %65 = add nsw i32 %64, -1
  store i32 %65, i32* %k, align 4
  br label %10

; <label>:66                                      ; preds = %10
  store i32 10, i32* %k, align 4
  br label %67

; <label>:67                                      ; preds = %107, %66
  %68 = load i32* %k, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %110

; <label>:70                                      ; preds = %67
  %71 = load i32* %i, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %72
  %74 = load i64* %73, align 8
  %75 = load i32* %i, align 4
  %76 = sub nsw i32 %75, 1
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %77
  %79 = load i64* %78, align 8
  %80 = load i32* %i, align 4
  %81 = sub nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %82
  %84 = load i64* %83, align 8
  %85 = lshr i64 %84, 30
  %86 = xor i64 %79, %85
  %87 = mul i64 %86, 1566083941
  %88 = xor i64 %74, %87
  %89 = load i32* %i, align 4
  %90 = sext i32 %89 to i64
  %91 = sub i64 %88, %90
  %92 = load i32* %i, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %93
  store i64 %91, i64* %94, align 8
  %95 = load i32* %i, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %96
  %98 = load i64* %97, align 8
  %99 = and i64 %98, 4294967295
  store i64 %99, i64* %97, align 8
  %100 = load i32* %i, align 4
  %101 = add nsw i32 %100, 1
  store i32 %101, i32* %i, align 4
  %102 = load i32* %i, align 4
  %103 = icmp sge i32 %102, 11
  br i1 %103, label %104, label %106

; <label>:104                                     ; preds = %70
  %105 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 10), align 8
  store i64 %105, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  store i32 1, i32* %i, align 4
  br label %106

; <label>:106                                     ; preds = %104, %70
  br label %107

; <label>:107                                     ; preds = %106
  %108 = load i32* %k, align 4
  %109 = add nsw i32 %108, -1
  store i32 %109, i32* %k, align 4
  br label %67

; <label>:110                                     ; preds = %67
  store i64 2147483648, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i64 @genrand_int32() #0 {
  %y = alloca i64, align 8
  %kk = alloca i32, align 4
  %1 = load i32* @mti, align 4
  %2 = icmp sge i32 %1, 11
  br i1 %2, label %3, label %94

; <label>:3                                       ; preds = %0
  %4 = load i32* @mti, align 4
  %5 = icmp eq i32 %4, 12
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %3
  call void @init_genrand(i64 5489)
  br label %7

; <label>:7                                       ; preds = %6, %3
  store i32 0, i32* %kk, align 4
  br label %8

; <label>:8                                       ; preds = %40, %7
  %9 = load i32* %kk, align 4
  %10 = icmp slt i32 %9, 4
  br i1 %10, label %11, label %43

; <label>:11                                      ; preds = %8
  %12 = load i32* %kk, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %13
  %15 = load i64* %14, align 8
  %16 = and i64 %15, 2147483648
  %17 = load i32* %kk, align 4
  %18 = add nsw i32 %17, 1
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %19
  %21 = load i64* %20, align 8
  %22 = and i64 %21, 2147483647
  %23 = or i64 %16, %22
  store i64 %23, i64* %y, align 8
  %24 = load i32* %kk, align 4
  %25 = add nsw i32 %24, 7
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %26
  %28 = load i64* %27, align 8
  %29 = load i64* %y, align 8
  %30 = lshr i64 %29, 1
  %31 = xor i64 %28, %30
  %32 = load i64* %y, align 8
  %33 = and i64 %32, 1
  %34 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i32 0, i64 %33
  %35 = load i64* %34, align 8
  %36 = xor i64 %31, %35
  %37 = load i32* %kk, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %38
  store i64 %36, i64* %39, align 8
  br label %40

; <label>:40                                      ; preds = %11
  %41 = load i32* %kk, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %kk, align 4
  br label %8

; <label>:43                                      ; preds = %8
  br label %44

; <label>:44                                      ; preds = %76, %43
  %45 = load i32* %kk, align 4
  %46 = icmp slt i32 %45, 10
  br i1 %46, label %47, label %79

; <label>:47                                      ; preds = %44
  %48 = load i32* %kk, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %49
  %51 = load i64* %50, align 8
  %52 = and i64 %51, 2147483648
  %53 = load i32* %kk, align 4
  %54 = add nsw i32 %53, 1
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %55
  %57 = load i64* %56, align 8
  %58 = and i64 %57, 2147483647
  %59 = or i64 %52, %58
  store i64 %59, i64* %y, align 8
  %60 = load i32* %kk, align 4
  %61 = add nsw i32 %60, -4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %62
  %64 = load i64* %63, align 8
  %65 = load i64* %y, align 8
  %66 = lshr i64 %65, 1
  %67 = xor i64 %64, %66
  %68 = load i64* %y, align 8
  %69 = and i64 %68, 1
  %70 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i32 0, i64 %69
  %71 = load i64* %70, align 8
  %72 = xor i64 %67, %71
  %73 = load i32* %kk, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %74
  store i64 %72, i64* %75, align 8
  br label %76

; <label>:76                                      ; preds = %47
  %77 = load i32* %kk, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %kk, align 4
  br label %44

; <label>:79                                      ; preds = %44
  %80 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 10), align 8
  %81 = and i64 %80, 2147483648
  %82 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 0), align 8
  %83 = and i64 %82, 2147483647
  %84 = or i64 %81, %83
  store i64 %84, i64* %y, align 8
  %85 = load i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 6), align 8
  %86 = load i64* %y, align 8
  %87 = lshr i64 %86, 1
  %88 = xor i64 %85, %87
  %89 = load i64* %y, align 8
  %90 = and i64 %89, 1
  %91 = getelementptr inbounds [2 x i64]* @genrand_int32.mag01, i32 0, i64 %90
  %92 = load i64* %91, align 8
  %93 = xor i64 %88, %92
  store i64 %93, i64* getelementptr inbounds ([11 x i64]* @mt, i32 0, i64 10), align 8
  store i32 0, i32* @mti, align 4
  br label %94

; <label>:94                                      ; preds = %79, %0
  %95 = load i32* @mti, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* @mti, align 4
  %97 = sext i32 %95 to i64
  %98 = getelementptr inbounds [11 x i64]* @mt, i32 0, i64 %97
  %99 = load i64* %98, align 8
  store i64 %99, i64* %y, align 8
  %100 = load i64* %y, align 8
  %101 = lshr i64 %100, 11
  %102 = load i64* %y, align 8
  %103 = xor i64 %102, %101
  store i64 %103, i64* %y, align 8
  %104 = load i64* %y, align 8
  %105 = shl i64 %104, 7
  %106 = and i64 %105, 2636928640
  %107 = load i64* %y, align 8
  %108 = xor i64 %107, %106
  store i64 %108, i64* %y, align 8
  %109 = load i64* %y, align 8
  %110 = shl i64 %109, 15
  %111 = and i64 %110, 4022730752
  %112 = load i64* %y, align 8
  %113 = xor i64 %112, %111
  store i64 %113, i64* %y, align 8
  %114 = load i64* %y, align 8
  %115 = lshr i64 %114, 18
  %116 = load i64* %y, align 8
  %117 = xor i64 %116, %115
  store i64 %117, i64* %y, align 8
  %118 = load i64* %y, align 8
  ret i64 %118
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %init = alloca [4 x i64], align 16
  %length = alloca i64, align 8
  store i32 0, i32* %1
  %2 = bitcast [4 x i64]* %init to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([4 x i64]* @main.init to i8*), i64 32, i32 16, i1 false)
  store i64 4, i64* %length, align 8
  %3 = getelementptr inbounds [4 x i64]* %init, i32 0, i32 0
  %4 = load i64* %length, align 8
  %5 = trunc i64 %4 to i32
  call void @init_by_array(i64* %3, i32 %5)
  %6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([30 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %7

; <label>:7                                       ; preds = %19, %0
  %8 = load i32* %i, align 4
  %9 = icmp slt i32 %8, 10
  br i1 %9, label %10, label %22

; <label>:10                                      ; preds = %7
  %11 = call i64 @genrand_int32()
  %12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i64 %11)
  %13 = load i32* %i, align 4
  %14 = srem i32 %13, 5
  %15 = icmp eq i32 %14, 4
  br i1 %15, label %16, label %18

; <label>:16                                      ; preds = %10
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  br label %18

; <label>:18                                      ; preds = %16, %10
  br label %19

; <label>:19                                      ; preds = %18
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %7

; <label>:22                                      ; preds = %7
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
