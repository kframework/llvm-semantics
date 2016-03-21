; ModuleID = './casts.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [41 x i8] c"\0ACHAR             C = '%c' (%d)\09\09(0x%x)\0A\00", align 1
@.str.1 = private unnamed_addr constant [33 x i8] c"char to short   s1 = %d\09\09(0x%x)\0A\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"char to int     i1 = %d\09\09(0x%x)\0A\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"char to int64_t l1 = %ld\09\09(0x%lx)\0A\00", align 1
@.str.4 = private unnamed_addr constant [34 x i8] c"\0Achar to ubyte  uc1 = %u\09\09(0x%x)\0A\00", align 1
@.str.5 = private unnamed_addr constant [33 x i8] c"char to ushort us1 = %u\09\09(0x%x)\0A\00", align 1
@.str.6 = private unnamed_addr constant [33 x i8] c"char to uint   ui1 = %u\09\09(0x%x)\0A\00", align 1
@.str.7 = private unnamed_addr constant [37 x i8] c"char to uint64_t ul1 = %lu\09\09(0x%lx)\0A\00", align 1
@.str.8 = private unnamed_addr constant [35 x i8] c"\0A\0ASHORT            S = %d\09\09(0x%x)\0A\00", align 1
@.str.9 = private unnamed_addr constant [34 x i8] c"short to byte    c1 = %d\09\09(0x%x)\0A\00", align 1
@.str.10 = private unnamed_addr constant [34 x i8] c"short to int     i1 = %d\09\09(0x%x)\0A\00", align 1
@.str.11 = private unnamed_addr constant [36 x i8] c"short to int64_t l1 = %ld\09\09(0x%lx)\0A\00", align 1
@.str.12 = private unnamed_addr constant [35 x i8] c"\0Ashort to ubyte  uc1 = %u\09\09(0x%x)\0A\00", align 1
@.str.13 = private unnamed_addr constant [34 x i8] c"short to ushort us1 = %u\09\09(0x%x)\0A\00", align 1
@.str.14 = private unnamed_addr constant [34 x i8] c"short to uint   ui1 = %u\09\09(0x%x)\0A\00", align 1
@.str.15 = private unnamed_addr constant [38 x i8] c"short to uint64_t ul1 = %lu\09\09(0x%lx)\0A\00", align 1
@.str.16 = private unnamed_addr constant [36 x i8] c"\0A\0ALONG            L = %ld\09\09(0x%lx)\0A\00", align 1
@.str.17 = private unnamed_addr constant [33 x i8] c"long to byte    c1 = %d\09\09(0x%x)\0A\00", align 1
@.str.18 = private unnamed_addr constant [33 x i8] c"long to short   s1 = %d\09\09(0x%x)\0A\00", align 1
@.str.19 = private unnamed_addr constant [33 x i8] c"long to int     i1 = %d\09\09(0x%x)\0A\00", align 1
@.str.20 = private unnamed_addr constant [34 x i8] c"\0Along to ubyte  uc1 = %u\09\09(0x%x)\0A\00", align 1
@.str.21 = private unnamed_addr constant [33 x i8] c"long to ushort us1 = %u\09\09(0x%x)\0A\00", align 1
@.str.22 = private unnamed_addr constant [33 x i8] c"long to uint   ui1 = %u\09\09(0x%x)\0A\00", align 1
@.str.23 = private unnamed_addr constant [37 x i8] c"long to uint64_t ul1 = %lu\09\09(0x%lx)\0A\00", align 1
@.str.24 = private unnamed_addr constant [27 x i8] c"\0A\0AFLOAT            F = %f\0A\00", align 1
@.str.25 = private unnamed_addr constant [34 x i8] c"float to short   s1 = %d\09\09(0x%x)\0A\00", align 1
@.str.26 = private unnamed_addr constant [34 x i8] c"float to int     i1 = %d\09\09(0x%x)\0A\00", align 1
@.str.27 = private unnamed_addr constant [34 x i8] c"float to ushort us1 = %u\09\09(0x%x)\0A\00", align 1
@.str.28 = private unnamed_addr constant [34 x i8] c"float to uint   ui1 = %u\09\09(0x%x)\0A\00", align 1
@.str.29 = private unnamed_addr constant [38 x i8] c"float to uint64_t ul1 = %lu\09\09(0x%lx)\0A\00", align 1
@.str.30 = private unnamed_addr constant [28 x i8] c"\0A\0ADOUBLE            D = %f\0A\00", align 1
@.str.31 = private unnamed_addr constant [35 x i8] c"double to short   s1 = %d\09\09(0x%x)\0A\00", align 1
@.str.32 = private unnamed_addr constant [35 x i8] c"double to int     i1 = %d\09\09(0x%x)\0A\00", align 1
@.str.33 = private unnamed_addr constant [37 x i8] c"double to int64_t l1 = %ld\09\09(0x%lx)\0A\00", align 1
@.str.34 = private unnamed_addr constant [35 x i8] c"double to ushort us1 = %u\09\09(0x%x)\0A\00", align 1
@.str.35 = private unnamed_addr constant [35 x i8] c"double to uint   ui1 = %u\09\09(0x%x)\0A\00", align 1
@.str.36 = private unnamed_addr constant [39 x i8] c"double to uint64_t ul1 = %lu\09\09(0x%lx)\0A\00", align 1
@lls = internal global [6 x i64] [i64 123, i64 -1, i64 -14, i64 14, i64 -9223372036854775808, i64 0], align 16
@.str.37 = private unnamed_addr constant [28 x i8] c"double <- int64_t %ld = %f\0A\00", align 1
@.str.38 = private unnamed_addr constant [29 x i8] c"double <- uint64_t %lu = %f\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %C = alloca i8, align 1
  %c1 = alloca i8, align 1
  %uc1 = alloca i8, align 1
  %S = alloca i16, align 2
  %s1 = alloca i16, align 2
  %us1 = alloca i16, align 2
  %i1 = alloca i32, align 4
  %i = alloca i32, align 4
  %ui1 = alloca i32, align 4
  %L = alloca i64, align 8
  %l1 = alloca i64, align 8
  %ul1 = alloca i64, align 8
  %F = alloca float, align 4
  %D = alloca double, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32, i32* %2, align 4
  %5 = icmp sge i32 %4, 2
  %6 = zext i1 %5 to i32
  %7 = trunc i32 %6 to i8
  %8 = sext i8 %7 to i32
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %15

; <label>:10                                      ; preds = %0
  %11 = load i8**, i8*** %3, align 8
  %12 = getelementptr inbounds i8*, i8** %11, i64 1
  %13 = load i8*, i8** %12, align 8
  %14 = call i32 @atoi(i8* %13) #3
  br label %16

; <label>:15                                      ; preds = %0
  br label %16

; <label>:16                                      ; preds = %15, %10
  %17 = phi i32 [ %14, %10 ], [ 100, %15 ]
  %18 = trunc i32 %17 to i8
  store i8 %18, i8* %C, align 1
  %19 = load i32, i32* %2, align 4
  %20 = icmp sge i32 %19, 3
  %21 = zext i1 %20 to i32
  %22 = trunc i32 %21 to i16
  %23 = sext i16 %22 to i32
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %30

; <label>:25                                      ; preds = %16
  %26 = load i8**, i8*** %3, align 8
  %27 = getelementptr inbounds i8*, i8** %26, i64 2
  %28 = load i8*, i8** %27, align 8
  %29 = call i32 @atoi(i8* %28) #3
  br label %31

; <label>:30                                      ; preds = %16
  br label %31

; <label>:31                                      ; preds = %30, %25
  %32 = phi i32 [ %29, %25 ], [ -769, %30 ]
  %33 = trunc i32 %32 to i16
  store i16 %33, i16* %S, align 2
  %34 = load i32, i32* %2, align 4
  %35 = icmp sge i32 %34, 4
  %36 = zext i1 %35 to i32
  %37 = sext i32 %36 to i64
  %38 = icmp ne i64 %37, 0
  br i1 %38, label %39, label %45

; <label>:39                                      ; preds = %31
  %40 = load i8**, i8*** %3, align 8
  %41 = getelementptr inbounds i8*, i8** %40, i64 3
  %42 = load i8*, i8** %41, align 8
  %43 = call i32 @atoi(i8* %42) #3
  %44 = sext i32 %43 to i64
  br label %46

; <label>:45                                      ; preds = %31
  br label %46

; <label>:46                                      ; preds = %45, %39
  %47 = phi i64 [ %44, %39 ], [ 179923220407203, %45 ]
  store i64 %47, i64* %L, align 8
  %48 = load i8, i8* %C, align 1
  store i8 %48, i8* %uc1, align 1
  %49 = load i8, i8* %C, align 1
  %50 = sext i8 %49 to i16
  store i16 %50, i16* %us1, align 2
  %51 = load i8, i8* %C, align 1
  %52 = sext i8 %51 to i32
  store i32 %52, i32* %ui1, align 4
  %53 = load i8, i8* %C, align 1
  %54 = sext i8 %53 to i64
  store i64 %54, i64* %ul1, align 8
  %55 = load i8, i8* %C, align 1
  %56 = sext i8 %55 to i16
  store i16 %56, i16* %s1, align 2
  %57 = load i8, i8* %C, align 1
  %58 = sext i8 %57 to i32
  store i32 %58, i32* %i1, align 4
  %59 = load i8, i8* %C, align 1
  %60 = sext i8 %59 to i64
  store i64 %60, i64* %l1, align 8
  %61 = load i8, i8* %C, align 1
  %62 = sext i8 %61 to i32
  %63 = load i8, i8* %C, align 1
  %64 = sext i8 %63 to i32
  %65 = load i8, i8* %C, align 1
  %66 = sext i8 %65 to i32
  %67 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str, i32 0, i32 0), i32 %62, i32 %64, i32 %66)
  %68 = load i16, i16* %s1, align 2
  %69 = sext i16 %68 to i32
  %70 = load i16, i16* %s1, align 2
  %71 = sext i16 %70 to i32
  %72 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.1, i32 0, i32 0), i32 %69, i32 %71)
  %73 = load i32, i32* %i1, align 4
  %74 = load i32, i32* %i1, align 4
  %75 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i32 0, i32 0), i32 %73, i32 %74)
  %76 = load i64, i64* %l1, align 8
  %77 = load i64, i64* %l1, align 8
  %78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i32 0, i32 0), i64 %76, i64 %77)
  %79 = load i8, i8* %uc1, align 1
  %80 = zext i8 %79 to i32
  %81 = load i8, i8* %uc1, align 1
  %82 = zext i8 %81 to i32
  %83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.4, i32 0, i32 0), i32 %80, i32 %82)
  %84 = load i16, i16* %us1, align 2
  %85 = zext i16 %84 to i32
  %86 = load i16, i16* %us1, align 2
  %87 = zext i16 %86 to i32
  %88 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.5, i32 0, i32 0), i32 %85, i32 %87)
  %89 = load i32, i32* %ui1, align 4
  %90 = load i32, i32* %ui1, align 4
  %91 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.6, i32 0, i32 0), i32 %89, i32 %90)
  %92 = load i64, i64* %ul1, align 8
  %93 = load i64, i64* %ul1, align 8
  %94 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.7, i32 0, i32 0), i64 %92, i64 %93)
  %95 = load i16, i16* %S, align 2
  %96 = trunc i16 %95 to i8
  store i8 %96, i8* %uc1, align 1
  %97 = load i16, i16* %S, align 2
  store i16 %97, i16* %us1, align 2
  %98 = load i16, i16* %S, align 2
  %99 = sext i16 %98 to i32
  store i32 %99, i32* %ui1, align 4
  %100 = load i16, i16* %S, align 2
  %101 = sext i16 %100 to i64
  store i64 %101, i64* %ul1, align 8
  %102 = load i16, i16* %S, align 2
  %103 = trunc i16 %102 to i8
  store i8 %103, i8* %c1, align 1
  %104 = load i16, i16* %S, align 2
  %105 = sext i16 %104 to i32
  store i32 %105, i32* %i1, align 4
  %106 = load i16, i16* %S, align 2
  %107 = sext i16 %106 to i64
  store i64 %107, i64* %l1, align 8
  %108 = load i16, i16* %S, align 2
  %109 = sext i16 %108 to i32
  %110 = load i16, i16* %S, align 2
  %111 = sext i16 %110 to i32
  %112 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.8, i32 0, i32 0), i32 %109, i32 %111)
  %113 = load i8, i8* %c1, align 1
  %114 = sext i8 %113 to i32
  %115 = load i8, i8* %c1, align 1
  %116 = sext i8 %115 to i32
  %117 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.9, i32 0, i32 0), i32 %114, i32 %116)
  %118 = load i32, i32* %i1, align 4
  %119 = load i32, i32* %i1, align 4
  %120 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.10, i32 0, i32 0), i32 %118, i32 %119)
  %121 = load i64, i64* %l1, align 8
  %122 = load i64, i64* %l1, align 8
  %123 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.11, i32 0, i32 0), i64 %121, i64 %122)
  %124 = load i8, i8* %uc1, align 1
  %125 = zext i8 %124 to i32
  %126 = load i8, i8* %uc1, align 1
  %127 = zext i8 %126 to i32
  %128 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.12, i32 0, i32 0), i32 %125, i32 %127)
  %129 = load i16, i16* %us1, align 2
  %130 = zext i16 %129 to i32
  %131 = load i16, i16* %us1, align 2
  %132 = zext i16 %131 to i32
  %133 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.13, i32 0, i32 0), i32 %130, i32 %132)
  %134 = load i32, i32* %ui1, align 4
  %135 = load i32, i32* %ui1, align 4
  %136 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.14, i32 0, i32 0), i32 %134, i32 %135)
  %137 = load i64, i64* %ul1, align 8
  %138 = load i64, i64* %ul1, align 8
  %139 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.15, i32 0, i32 0), i64 %137, i64 %138)
  %140 = load i64, i64* %L, align 8
  %141 = trunc i64 %140 to i8
  store i8 %141, i8* %uc1, align 1
  %142 = load i64, i64* %L, align 8
  %143 = trunc i64 %142 to i8
  store i8 %143, i8* %c1, align 1
  %144 = load i64, i64* %L, align 8
  %145 = trunc i64 %144 to i16
  store i16 %145, i16* %s1, align 2
  %146 = load i64, i64* %L, align 8
  %147 = trunc i64 %146 to i16
  store i16 %147, i16* %us1, align 2
  %148 = load i64, i64* %L, align 8
  %149 = trunc i64 %148 to i32
  store i32 %149, i32* %i1, align 4
  %150 = load i64, i64* %L, align 8
  %151 = trunc i64 %150 to i32
  store i32 %151, i32* %ui1, align 4
  %152 = load i64, i64* %L, align 8
  store i64 %152, i64* %ul1, align 8
  %153 = load i64, i64* %L, align 8
  %154 = load i64, i64* %L, align 8
  %155 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.16, i32 0, i32 0), i64 %153, i64 %154)
  %156 = load i8, i8* %c1, align 1
  %157 = sext i8 %156 to i32
  %158 = load i8, i8* %c1, align 1
  %159 = sext i8 %158 to i32
  %160 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.17, i32 0, i32 0), i32 %157, i32 %159)
  %161 = load i16, i16* %s1, align 2
  %162 = sext i16 %161 to i32
  %163 = load i16, i16* %s1, align 2
  %164 = sext i16 %163 to i32
  %165 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.18, i32 0, i32 0), i32 %162, i32 %164)
  %166 = load i32, i32* %i1, align 4
  %167 = load i32, i32* %i1, align 4
  %168 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.19, i32 0, i32 0), i32 %166, i32 %167)
  %169 = load i8, i8* %uc1, align 1
  %170 = zext i8 %169 to i32
  %171 = load i8, i8* %uc1, align 1
  %172 = zext i8 %171 to i32
  %173 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.20, i32 0, i32 0), i32 %170, i32 %172)
  %174 = load i16, i16* %us1, align 2
  %175 = zext i16 %174 to i32
  %176 = load i16, i16* %us1, align 2
  %177 = zext i16 %176 to i32
  %178 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.21, i32 0, i32 0), i32 %175, i32 %177)
  %179 = load i32, i32* %ui1, align 4
  %180 = load i32, i32* %ui1, align 4
  %181 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.22, i32 0, i32 0), i32 %179, i32 %180)
  %182 = load i64, i64* %ul1, align 8
  %183 = load i64, i64* %ul1, align 8
  %184 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.23, i32 0, i32 0), i64 %182, i64 %183)
  %185 = load i32, i32* %2, align 4
  %186 = icmp sge i32 %185, 4
  %187 = zext i1 %186 to i32
  %188 = sitofp i32 %187 to float
  %189 = fcmp une float %188, 0.000000e+00
  br i1 %189, label %190, label %195

; <label>:190                                     ; preds = %46
  %191 = load i8**, i8*** %3, align 8
  %192 = getelementptr inbounds i8*, i8** %191, i64 3
  %193 = load i8*, i8** %192, align 8
  %194 = call double @atof(i8* %193) #3
  br label %196

; <label>:195                                     ; preds = %46
  br label %196

; <label>:196                                     ; preds = %195, %190
  %197 = phi double [ %194, %190 ], [ 1.000000e+00, %195 ]
  %198 = fptrunc double %197 to float
  store float %198, float* %F, align 4
  %199 = load i32, i32* %2, align 4
  %200 = icmp sge i32 %199, 5
  br i1 %200, label %201, label %206

; <label>:201                                     ; preds = %196
  %202 = load i8**, i8*** %3, align 8
  %203 = getelementptr inbounds i8*, i8** %202, i64 4
  %204 = load i8*, i8** %203, align 8
  %205 = call double @atof(i8* %204) #3
  br label %207

; <label>:206                                     ; preds = %196
  br label %207

; <label>:207                                     ; preds = %206, %201
  %208 = phi double [ %205, %201 ], [ 2.000000e+00, %206 ]
  store double %208, double* %D, align 8
  %209 = load float, float* %F, align 4
  %210 = fptoui float %209 to i16
  store i16 %210, i16* %us1, align 2
  %211 = load float, float* %F, align 4
  %212 = fptoui float %211 to i32
  store i32 %212, i32* %ui1, align 4
  %213 = load float, float* %F, align 4
  %214 = fptoui float %213 to i64
  store i64 %214, i64* %ul1, align 8
  %215 = load float, float* %F, align 4
  %216 = fptosi float %215 to i16
  store i16 %216, i16* %s1, align 2
  %217 = load float, float* %F, align 4
  %218 = fptosi float %217 to i32
  store i32 %218, i32* %i1, align 4
  %219 = load float, float* %F, align 4
  %220 = fptosi float %219 to i64
  store i64 %220, i64* %l1, align 8
  %221 = load float, float* %F, align 4
  %222 = fpext float %221 to double
  %223 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.24, i32 0, i32 0), double %222)
  %224 = load i16, i16* %s1, align 2
  %225 = sext i16 %224 to i32
  %226 = load i16, i16* %s1, align 2
  %227 = sext i16 %226 to i32
  %228 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.25, i32 0, i32 0), i32 %225, i32 %227)
  %229 = load i32, i32* %i1, align 4
  %230 = load i32, i32* %i1, align 4
  %231 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.26, i32 0, i32 0), i32 %229, i32 %230)
  %232 = load i16, i16* %us1, align 2
  %233 = zext i16 %232 to i32
  %234 = load i16, i16* %us1, align 2
  %235 = zext i16 %234 to i32
  %236 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.27, i32 0, i32 0), i32 %233, i32 %235)
  %237 = load i32, i32* %ui1, align 4
  %238 = load i32, i32* %ui1, align 4
  %239 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.28, i32 0, i32 0), i32 %237, i32 %238)
  %240 = load i64, i64* %ul1, align 8
  %241 = load i64, i64* %ul1, align 8
  %242 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.29, i32 0, i32 0), i64 %240, i64 %241)
  %243 = load double, double* %D, align 8
  %244 = fptoui double %243 to i16
  store i16 %244, i16* %us1, align 2
  %245 = load double, double* %D, align 8
  %246 = fptoui double %245 to i32
  store i32 %246, i32* %ui1, align 4
  %247 = load double, double* %D, align 8
  %248 = fptoui double %247 to i64
  store i64 %248, i64* %ul1, align 8
  %249 = load double, double* %D, align 8
  %250 = fptosi double %249 to i16
  store i16 %250, i16* %s1, align 2
  %251 = load double, double* %D, align 8
  %252 = fptosi double %251 to i32
  store i32 %252, i32* %i1, align 4
  %253 = load double, double* %D, align 8
  %254 = fptosi double %253 to i64
  store i64 %254, i64* %l1, align 8
  %255 = load double, double* %D, align 8
  %256 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.30, i32 0, i32 0), double %255)
  %257 = load i16, i16* %s1, align 2
  %258 = sext i16 %257 to i32
  %259 = load i16, i16* %s1, align 2
  %260 = sext i16 %259 to i32
  %261 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.31, i32 0, i32 0), i32 %258, i32 %260)
  %262 = load i32, i32* %i1, align 4
  %263 = load i32, i32* %i1, align 4
  %264 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.32, i32 0, i32 0), i32 %262, i32 %263)
  %265 = load i64, i64* %l1, align 8
  %266 = load i64, i64* %l1, align 8
  %267 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.33, i32 0, i32 0), i64 %265, i64 %266)
  %268 = load i16, i16* %us1, align 2
  %269 = zext i16 %268 to i32
  %270 = load i16, i16* %us1, align 2
  %271 = zext i16 %270 to i32
  %272 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.34, i32 0, i32 0), i32 %269, i32 %271)
  %273 = load i32, i32* %ui1, align 4
  %274 = load i32, i32* %ui1, align 4
  %275 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.35, i32 0, i32 0), i32 %273, i32 %274)
  %276 = load i64, i64* %ul1, align 8
  %277 = load i64, i64* %ul1, align 8
  %278 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.36, i32 0, i32 0), i64 %276, i64 %277)
  store i32 0, i32* %i, align 4
  br label %279

; <label>:279                                     ; preds = %306, %207
  %280 = load i32, i32* %i, align 4
  %281 = sext i32 %280 to i64
  %282 = getelementptr inbounds [6 x i64], [6 x i64]* @lls, i32 0, i64 %281
  %283 = load i64, i64* %282, align 8
  %284 = icmp ne i64 %283, 0
  br i1 %284, label %285, label %309

; <label>:285                                     ; preds = %279
  %286 = load i32, i32* %i, align 4
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds [6 x i64], [6 x i64]* @lls, i32 0, i64 %287
  %289 = load i64, i64* %288, align 8
  %290 = load i32, i32* %i, align 4
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds [6 x i64], [6 x i64]* @lls, i32 0, i64 %291
  %293 = load i64, i64* %292, align 8
  %294 = sitofp i64 %293 to double
  %295 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.37, i32 0, i32 0), i64 %289, double %294)
  %296 = load i32, i32* %i, align 4
  %297 = sext i32 %296 to i64
  %298 = getelementptr inbounds [6 x i64], [6 x i64]* @lls, i32 0, i64 %297
  %299 = load i64, i64* %298, align 8
  %300 = load i32, i32* %i, align 4
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds [6 x i64], [6 x i64]* @lls, i32 0, i64 %301
  %303 = load i64, i64* %302, align 8
  %304 = uitofp i64 %303 to double
  %305 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.38, i32 0, i32 0), i64 %299, double %304)
  br label %306

; <label>:306                                     ; preds = %285
  %307 = load i32, i32* %i, align 4
  %308 = add nsw i32 %307, 1
  store i32 %308, i32* %i, align 4
  br label %279

; <label>:309                                     ; preds = %279
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind readonly
declare double @atof(i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
