; ModuleID = './2003-08-11-VaListArg.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.DWordS_struct = type { i32, i8 }
%struct.QuadWordS_struct = type { i32, double }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.LargeS_struct = type { i32, double, %struct.DWordS_struct*, i32 }

@.str = private unnamed_addr constant [11 x i8] c"string %s\0A\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"int %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [11 x i8] c"double %f\0A\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"long long %lld\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"char %c\0A\00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c"DWord { %d, %c }\0A\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"QuadWord { %d, %f }\0A\00", align 1
@.str.7 = private unnamed_addr constant [29 x i8] c"LargeS { %d, %f, 0x%d, %d }\0A\00", align 1
@main.dw = private unnamed_addr constant %struct.DWordS_struct { i32 18, i8 97 }, align 4
@main.qw = private unnamed_addr constant %struct.QuadWordS_struct { i32 19, double 2.000000e+01 }, align 8
@.str.8 = private unnamed_addr constant [11 x i8] c"ssiciiiiis\00", align 1
@.str.9 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"def\00", align 1
@.str.11 = private unnamed_addr constant [14 x i8] c"10 args done!\00", align 1
@.str.12 = private unnamed_addr constant [5 x i8] c"ddil\00", align 1
@.str.13 = private unnamed_addr constant [4 x i8] c"DQL\00", align 1

; Function Attrs: nounwind uwtable
define void @test(i8* %fmt, %struct.__va_list_tag* %ap) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca %struct.__va_list_tag*, align 8
  %d = alloca i32, align 4
  %c = alloca i8, align 1
  %s = alloca i8*, align 8
  %dw = alloca %struct.DWordS_struct, align 4
  %qw = alloca %struct.QuadWordS_struct, align 8
  %ls = alloca %struct.LargeS_struct, align 8
  %3 = alloca %struct.QuadWordS_struct, align 8
  store i8* %fmt, i8** %1, align 8
  store %struct.__va_list_tag* %ap, %struct.__va_list_tag** %2, align 8
  br label %4

; <label>:4                                       ; preds = %201, %0
  %5 = load i8*, i8** %1, align 8
  %6 = load i8, i8* %5, align 1
  %7 = icmp ne i8 %6, 0
  br i1 %7, label %8, label %202

; <label>:8                                       ; preds = %4
  %9 = load i8*, i8** %1, align 8
  %10 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %10, i8** %1, align 8
  %11 = load i8, i8* %9, align 1
  %12 = sext i8 %11 to i32
  switch i32 %12, label %201 [
    i32 115, label %13
    i32 105, label %34
    i32 100, label %55
    i32 108, label %75
    i32 99, label %95
    i32 68, label %118
    i32 81, label %144
    i32 76, label %182
  ]

; <label>:13                                      ; preds = %8
  %14 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %14, i32 0, i32 0
  %16 = load i32, i32* %15
  %17 = icmp ule i32 %16, 40
  br i1 %17, label %18, label %24

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %14, i32 0, i32 3
  %20 = load i8*, i8** %19
  %21 = getelementptr i8, i8* %20, i32 %16
  %22 = bitcast i8* %21 to i8**
  %23 = add i32 %16, 8
  store i32 %23, i32* %15
  br label %29

; <label>:24                                      ; preds = %13
  %25 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %14, i32 0, i32 2
  %26 = load i8*, i8** %25
  %27 = bitcast i8* %26 to i8**
  %28 = getelementptr i8, i8* %26, i32 8
  store i8* %28, i8** %25
  br label %29

; <label>:29                                      ; preds = %24, %18
  %30 = phi i8** [ %22, %18 ], [ %27, %24 ]
  %31 = load i8*, i8** %30
  store i8* %31, i8** %s, align 8
  %32 = load i8*, i8** %s, align 8
  %33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i8* %32)
  br label %201

; <label>:34                                      ; preds = %8
  %35 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %36 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %35, i32 0, i32 0
  %37 = load i32, i32* %36
  %38 = icmp ule i32 %37, 40
  br i1 %38, label %39, label %45

; <label>:39                                      ; preds = %34
  %40 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %35, i32 0, i32 3
  %41 = load i8*, i8** %40
  %42 = getelementptr i8, i8* %41, i32 %37
  %43 = bitcast i8* %42 to i32*
  %44 = add i32 %37, 8
  store i32 %44, i32* %36
  br label %50

; <label>:45                                      ; preds = %34
  %46 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %35, i32 0, i32 2
  %47 = load i8*, i8** %46
  %48 = bitcast i8* %47 to i32*
  %49 = getelementptr i8, i8* %47, i32 8
  store i8* %49, i8** %46
  br label %50

; <label>:50                                      ; preds = %45, %39
  %51 = phi i32* [ %43, %39 ], [ %48, %45 ]
  %52 = load i32, i32* %51
  store i32 %52, i32* %d, align 4
  %53 = load i32, i32* %d, align 4
  %54 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 %53)
  br label %201

; <label>:55                                      ; preds = %8
  %56 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %57 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %56, i32 0, i32 1
  %58 = load i32, i32* %57
  %59 = icmp ule i32 %58, 160
  br i1 %59, label %60, label %66

; <label>:60                                      ; preds = %55
  %61 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %56, i32 0, i32 3
  %62 = load i8*, i8** %61
  %63 = getelementptr i8, i8* %62, i32 %58
  %64 = bitcast i8* %63 to double*
  %65 = add i32 %58, 16
  store i32 %65, i32* %57
  br label %71

; <label>:66                                      ; preds = %55
  %67 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %56, i32 0, i32 2
  %68 = load i8*, i8** %67
  %69 = bitcast i8* %68 to double*
  %70 = getelementptr i8, i8* %68, i32 8
  store i8* %70, i8** %67
  br label %71

; <label>:71                                      ; preds = %66, %60
  %72 = phi double* [ %64, %60 ], [ %69, %66 ]
  %73 = load double, double* %72
  %74 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.2, i32 0, i32 0), double %73)
  br label %201

; <label>:75                                      ; preds = %8
  %76 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %77 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %76, i32 0, i32 0
  %78 = load i32, i32* %77
  %79 = icmp ule i32 %78, 40
  br i1 %79, label %80, label %86

; <label>:80                                      ; preds = %75
  %81 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %76, i32 0, i32 3
  %82 = load i8*, i8** %81
  %83 = getelementptr i8, i8* %82, i32 %78
  %84 = bitcast i8* %83 to i64*
  %85 = add i32 %78, 8
  store i32 %85, i32* %77
  br label %91

; <label>:86                                      ; preds = %75
  %87 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %76, i32 0, i32 2
  %88 = load i8*, i8** %87
  %89 = bitcast i8* %88 to i64*
  %90 = getelementptr i8, i8* %88, i32 8
  store i8* %90, i8** %87
  br label %91

; <label>:91                                      ; preds = %86, %80
  %92 = phi i64* [ %84, %80 ], [ %89, %86 ]
  %93 = load i64, i64* %92
  %94 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i32 0, i32 0), i64 %93)
  br label %201

; <label>:95                                      ; preds = %8
  %96 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %97 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %96, i32 0, i32 0
  %98 = load i32, i32* %97
  %99 = icmp ule i32 %98, 40
  br i1 %99, label %100, label %106

; <label>:100                                     ; preds = %95
  %101 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %96, i32 0, i32 3
  %102 = load i8*, i8** %101
  %103 = getelementptr i8, i8* %102, i32 %98
  %104 = bitcast i8* %103 to i32*
  %105 = add i32 %98, 8
  store i32 %105, i32* %97
  br label %111

; <label>:106                                     ; preds = %95
  %107 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %96, i32 0, i32 2
  %108 = load i8*, i8** %107
  %109 = bitcast i8* %108 to i32*
  %110 = getelementptr i8, i8* %108, i32 8
  store i8* %110, i8** %107
  br label %111

; <label>:111                                     ; preds = %106, %100
  %112 = phi i32* [ %104, %100 ], [ %109, %106 ]
  %113 = load i32, i32* %112
  %114 = trunc i32 %113 to i8
  store i8 %114, i8* %c, align 1
  %115 = load i8, i8* %c, align 1
  %116 = sext i8 %115 to i32
  %117 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0), i32 %116)
  br label %201

; <label>:118                                     ; preds = %8
  %119 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %120 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %119, i32 0, i32 0
  %121 = load i32, i32* %120
  %122 = icmp ule i32 %121, 40
  br i1 %122, label %123, label %129

; <label>:123                                     ; preds = %118
  %124 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %119, i32 0, i32 3
  %125 = load i8*, i8** %124
  %126 = getelementptr i8, i8* %125, i32 %121
  %127 = bitcast i8* %126 to %struct.DWordS_struct*
  %128 = add i32 %121, 8
  store i32 %128, i32* %120
  br label %134

; <label>:129                                     ; preds = %118
  %130 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %119, i32 0, i32 2
  %131 = load i8*, i8** %130
  %132 = bitcast i8* %131 to %struct.DWordS_struct*
  %133 = getelementptr i8, i8* %131, i32 8
  store i8* %133, i8** %130
  br label %134

; <label>:134                                     ; preds = %129, %123
  %135 = phi %struct.DWordS_struct* [ %127, %123 ], [ %132, %129 ]
  %136 = bitcast %struct.DWordS_struct* %dw to i8*
  %137 = bitcast %struct.DWordS_struct* %135 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %136, i8* %137, i64 8, i32 4, i1 false)
  %138 = getelementptr inbounds %struct.DWordS_struct, %struct.DWordS_struct* %dw, i32 0, i32 0
  %139 = load i32, i32* %138, align 4
  %140 = getelementptr inbounds %struct.DWordS_struct, %struct.DWordS_struct* %dw, i32 0, i32 1
  %141 = load i8, i8* %140, align 1
  %142 = sext i8 %141 to i32
  %143 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.5, i32 0, i32 0), i32 %139, i32 %142)
  br label %201

; <label>:144                                     ; preds = %8
  %145 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %146 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %145, i32 0, i32 0
  %147 = load i32, i32* %146
  %148 = icmp ule i32 %147, 40
  %149 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %145, i32 0, i32 1
  %150 = load i32, i32* %149
  %151 = icmp ule i32 %150, 160
  %152 = and i1 %148, %151
  br i1 %152, label %153, label %168

; <label>:153                                     ; preds = %144
  %154 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %145, i32 0, i32 3
  %155 = load i8*, i8** %154
  %156 = bitcast %struct.QuadWordS_struct* %3 to { i32, double }*
  %157 = getelementptr i8, i8* %155, i32 %147
  %158 = getelementptr i8, i8* %155, i32 %150
  %159 = bitcast i8* %157 to i32*
  %160 = load i32, i32* %159
  %161 = getelementptr inbounds { i32, double }, { i32, double }* %156, i32 0, i32 0
  store i32 %160, i32* %161
  %162 = bitcast i8* %158 to double*
  %163 = load double, double* %162
  %164 = getelementptr inbounds { i32, double }, { i32, double }* %156, i32 0, i32 1
  store double %163, double* %164
  %165 = bitcast { i32, double }* %156 to %struct.QuadWordS_struct*
  %166 = add i32 %147, 8
  store i32 %166, i32* %146
  %167 = add i32 %150, 16
  store i32 %167, i32* %149
  br label %173

; <label>:168                                     ; preds = %144
  %169 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %145, i32 0, i32 2
  %170 = load i8*, i8** %169
  %171 = bitcast i8* %170 to %struct.QuadWordS_struct*
  %172 = getelementptr i8, i8* %170, i32 16
  store i8* %172, i8** %169
  br label %173

; <label>:173                                     ; preds = %168, %153
  %174 = phi %struct.QuadWordS_struct* [ %165, %153 ], [ %171, %168 ]
  %175 = bitcast %struct.QuadWordS_struct* %qw to i8*
  %176 = bitcast %struct.QuadWordS_struct* %174 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %175, i8* %176, i64 16, i32 8, i1 false)
  %177 = getelementptr inbounds %struct.QuadWordS_struct, %struct.QuadWordS_struct* %qw, i32 0, i32 0
  %178 = load i32, i32* %177, align 4
  %179 = getelementptr inbounds %struct.QuadWordS_struct, %struct.QuadWordS_struct* %qw, i32 0, i32 1
  %180 = load double, double* %179, align 8
  %181 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i32 0, i32 0), i32 %178, double %180)
  br label %201

; <label>:182                                     ; preds = %8
  %183 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %184 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %183, i32 0, i32 2
  %185 = load i8*, i8** %184
  %186 = bitcast i8* %185 to %struct.LargeS_struct*
  %187 = getelementptr i8, i8* %185, i32 32
  store i8* %187, i8** %184
  %188 = bitcast %struct.LargeS_struct* %ls to i8*
  %189 = bitcast %struct.LargeS_struct* %186 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %188, i8* %189, i64 32, i32 8, i1 false)
  %190 = getelementptr inbounds %struct.LargeS_struct, %struct.LargeS_struct* %ls, i32 0, i32 0
  %191 = load i32, i32* %190, align 4
  %192 = getelementptr inbounds %struct.LargeS_struct, %struct.LargeS_struct* %ls, i32 0, i32 1
  %193 = load double, double* %192, align 8
  %194 = getelementptr inbounds %struct.LargeS_struct, %struct.LargeS_struct* %ls, i32 0, i32 2
  %195 = load %struct.DWordS_struct*, %struct.DWordS_struct** %194, align 8
  %196 = icmp ne %struct.DWordS_struct* %195, null
  %197 = zext i1 %196 to i32
  %198 = getelementptr inbounds %struct.LargeS_struct, %struct.LargeS_struct* %ls, i32 0, i32 3
  %199 = load i32, i32* %198, align 4
  %200 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i32 0, i32 0), i32 %191, double %193, i32 %197, i32 %199)
  br label %201

; <label>:201                                     ; preds = %8, %182, %173, %134, %111, %91, %71, %50, %29
  br label %4

; <label>:202                                     ; preds = %4
  %203 = load %struct.__va_list_tag*, %struct.__va_list_tag** %2, align 8
  %204 = bitcast %struct.__va_list_tag* %203 to i8*
  call void @llvm.va_end(i8* %204)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: nounwind uwtable
define void @testVaListArg(i8* %fmt, ...) #0 {
  %1 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %fmt, i8** %1, align 8
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = load i8*, i8** %1, align 8
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  call void @test(i8* %4, %struct.__va_list_tag* %5)
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %7 = bitcast %struct.__va_list_tag* %6 to i8*
  call void @llvm.va_end(i8* %7)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind uwtable
define void @testVaCopyArg(i8* %fmt, ...) #0 {
  %1 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %aq = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %fmt, i8** %1, align 8
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %aq, i32 0, i32 0
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = bitcast %struct.__va_list_tag* %4 to i8*
  %7 = bitcast %struct.__va_list_tag* %5 to i8*
  call void @llvm.va_copy(i8* %6, i8* %7)
  %8 = load i8*, i8** %1, align 8
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %aq, i32 0, i32 0
  call void @test(i8* %8, %struct.__va_list_tag* %9)
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %aq, i32 0, i32 0
  %11 = bitcast %struct.__va_list_tag* %10 to i8*
  call void @llvm.va_end(i8* %11)
  %12 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %13 = bitcast %struct.__va_list_tag* %12 to i8*
  call void @llvm.va_end(i8* %13)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_copy(i8*, i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %dw = alloca %struct.DWordS_struct, align 4
  %qw = alloca %struct.QuadWordS_struct, align 8
  %ls = alloca %struct.LargeS_struct, align 8
  store i32 0, i32* %1
  %2 = bitcast %struct.DWordS_struct* %dw to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.DWordS_struct* @main.dw to i8*), i64 8, i32 4, i1 false)
  %3 = bitcast %struct.QuadWordS_struct* %qw to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.QuadWordS_struct* @main.qw to i8*), i64 16, i32 8, i1 false)
  %4 = getelementptr inbounds %struct.LargeS_struct, %struct.LargeS_struct* %ls, i32 0, i32 0
  store i32 21, i32* %4, align 4
  %5 = getelementptr inbounds %struct.LargeS_struct, %struct.LargeS_struct* %ls, i32 0, i32 1
  store double 2.200000e+01, double* %5, align 8
  %6 = getelementptr inbounds %struct.LargeS_struct, %struct.LargeS_struct* %ls, i32 0, i32 2
  store %struct.DWordS_struct* %dw, %struct.DWordS_struct** %6, align 8
  %7 = getelementptr inbounds %struct.LargeS_struct, %struct.LargeS_struct* %ls, i32 0, i32 3
  store i32 23, i32* %7, align 4
  call void (i8*, ...) @testVaListArg(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i32 -123, i32 97, i32 123, i32 6, i32 7, i32 8, i32 9, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.11, i32 0, i32 0))
  call void (i8*, ...) @testVaCopyArg(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i32 -123, i32 97, i32 123, i32 6, i32 7, i32 8, i32 9, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.11, i32 0, i32 0))
  call void (i8*, ...) @testVaListArg(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), double 1.000000e+00, double 2.000000e+00, i32 32764, i64 12345677823423)
  call void (i8*, ...) @testVaCopyArg(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.12, i32 0, i32 0), double 1.000000e+00, double 2.000000e+00, i32 32764, i64 12345677823423)
  %8 = bitcast %struct.DWordS_struct* %dw to i64*
  %9 = load i64, i64* %8, align 4
  %10 = bitcast %struct.QuadWordS_struct* %qw to { i32, double }*
  %11 = getelementptr { i32, double }, { i32, double }* %10, i32 0, i32 0
  %12 = load i32, i32* %11, align 1
  %13 = getelementptr { i32, double }, { i32, double }* %10, i32 0, i32 1
  %14 = load double, double* %13, align 1
  call void (i8*, ...) @testVaListArg(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i64 %9, i32 %12, double %14, %struct.LargeS_struct* byval align 8 %ls)
  %15 = bitcast %struct.DWordS_struct* %dw to i64*
  %16 = load i64, i64* %15, align 4
  %17 = bitcast %struct.QuadWordS_struct* %qw to { i32, double }*
  %18 = getelementptr { i32, double }, { i32, double }* %17, i32 0, i32 0
  %19 = load i32, i32* %18, align 1
  %20 = getelementptr { i32, double }, { i32, double }* %17, i32 0, i32 1
  %21 = load double, double* %20, align 1
  call void (i8*, ...) @testVaCopyArg(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.13, i32 0, i32 0), i64 %16, i32 %19, double %21, %struct.LargeS_struct* byval align 8 %ls)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
