; ModuleID = './2003-05-07-VarArgs.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.QuadWordS_struct = type { i32, double }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.DWordS_struct = type { i32, i8 }
%struct.LargeS_struct = type { i32, double, %struct.DWordS_struct*, i32 }

@.str = private unnamed_addr constant [11 x i8] c"string %s\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"int %d\0A\00", align 1
@.str2 = private unnamed_addr constant [11 x i8] c"double %d\0A\00", align 1
@.str3 = private unnamed_addr constant [16 x i8] c"long long %lld\0A\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"char %c\0A\00", align 1
@.str5 = private unnamed_addr constant [18 x i8] c"DWord { %d, %c }\0A\00", align 1
@.str6 = private unnamed_addr constant [21 x i8] c"QuadWord { %d, %d }\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"LargeS { %d, %d, 0x%d, %d }\0A\00", align 1
@main.dw = private unnamed_addr constant { i32, i8, [3 x i8] } { i32 18, i8 97, [3 x i8] undef }, align 4
@main.qw = private unnamed_addr constant %struct.QuadWordS_struct { i32 19, double 2.000000e+01 }, align 8
@.str8 = private unnamed_addr constant [11 x i8] c"ssiciiiiis\00", align 1
@.str9 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str10 = private unnamed_addr constant [4 x i8] c"def\00", align 1
@.str11 = private unnamed_addr constant [14 x i8] c"10 args done!\00", align 1
@.str12 = private unnamed_addr constant [5 x i8] c"ddil\00", align 1
@.str13 = private unnamed_addr constant [4 x i8] c"DQL\00", align 1

; Function Attrs: nounwind uwtable
define void @test(i8* %fmt, ...) #0 {
  %1 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %aq = alloca [1 x %struct.__va_list_tag], align 16
  %d = alloca i32, align 4
  %c = alloca i8, align 1
  %s = alloca i8*, align 8
  %dw = alloca %struct.DWordS_struct, align 4
  %qw = alloca %struct.QuadWordS_struct, align 8
  %ls = alloca %struct.LargeS_struct, align 8
  %2 = alloca %struct.QuadWordS_struct, align 8
  store i8* %fmt, i8** %1, align 8
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag]* %aq, i32 0, i32 0
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %7 = bitcast %struct.__va_list_tag* %5 to i8*
  %8 = bitcast %struct.__va_list_tag* %6 to i8*
  call void @llvm.va_copy(i8* %7, i8* %8)
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %aq, i32 0, i32 0
  %10 = bitcast %struct.__va_list_tag* %9 to i8*
  call void @llvm.va_end(i8* %10)
  br label %11

; <label>:11                                      ; preds = %214, %0
  %12 = load i8** %1, align 8
  %13 = load i8* %12, align 1
  %14 = icmp ne i8 %13, 0
  br i1 %14, label %15, label %215

; <label>:15                                      ; preds = %11
  %16 = load i8** %1, align 8
  %17 = getelementptr inbounds i8* %16, i32 1
  store i8* %17, i8** %1, align 8
  %18 = load i8* %16, align 1
  %19 = sext i8 %18 to i32
  switch i32 %19, label %214 [
    i32 115, label %20
    i32 105, label %41
    i32 100, label %62
    i32 108, label %84
    i32 99, label %104
    i32 68, label %127
    i32 81, label %153
    i32 76, label %193
  ]

; <label>:20                                      ; preds = %15
  %21 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %22 = getelementptr inbounds %struct.__va_list_tag* %21, i32 0, i32 0
  %23 = load i32* %22
  %24 = icmp ule i32 %23, 40
  br i1 %24, label %25, label %31

; <label>:25                                      ; preds = %20
  %26 = getelementptr inbounds %struct.__va_list_tag* %21, i32 0, i32 3
  %27 = load i8** %26
  %28 = getelementptr i8* %27, i32 %23
  %29 = bitcast i8* %28 to i8**
  %30 = add i32 %23, 8
  store i32 %30, i32* %22
  br label %36

; <label>:31                                      ; preds = %20
  %32 = getelementptr inbounds %struct.__va_list_tag* %21, i32 0, i32 2
  %33 = load i8** %32
  %34 = bitcast i8* %33 to i8**
  %35 = getelementptr i8* %33, i32 8
  store i8* %35, i8** %32
  br label %36

; <label>:36                                      ; preds = %31, %25
  %37 = phi i8** [ %29, %25 ], [ %34, %31 ]
  %38 = load i8** %37
  store i8* %38, i8** %s, align 8
  %39 = load i8** %s, align 8
  %40 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i8* %39)
  br label %214

; <label>:41                                      ; preds = %15
  %42 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %43 = getelementptr inbounds %struct.__va_list_tag* %42, i32 0, i32 0
  %44 = load i32* %43
  %45 = icmp ule i32 %44, 40
  br i1 %45, label %46, label %52

; <label>:46                                      ; preds = %41
  %47 = getelementptr inbounds %struct.__va_list_tag* %42, i32 0, i32 3
  %48 = load i8** %47
  %49 = getelementptr i8* %48, i32 %44
  %50 = bitcast i8* %49 to i32*
  %51 = add i32 %44, 8
  store i32 %51, i32* %43
  br label %57

; <label>:52                                      ; preds = %41
  %53 = getelementptr inbounds %struct.__va_list_tag* %42, i32 0, i32 2
  %54 = load i8** %53
  %55 = bitcast i8* %54 to i32*
  %56 = getelementptr i8* %54, i32 8
  store i8* %56, i8** %53
  br label %57

; <label>:57                                      ; preds = %52, %46
  %58 = phi i32* [ %50, %46 ], [ %55, %52 ]
  %59 = load i32* %58
  store i32 %59, i32* %d, align 4
  %60 = load i32* %d, align 4
  %61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %60)
  br label %214

; <label>:62                                      ; preds = %15
  %63 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %64 = getelementptr inbounds %struct.__va_list_tag* %63, i32 0, i32 1
  %65 = load i32* %64
  %66 = icmp ule i32 %65, 160
  br i1 %66, label %67, label %73

; <label>:67                                      ; preds = %62
  %68 = getelementptr inbounds %struct.__va_list_tag* %63, i32 0, i32 3
  %69 = load i8** %68
  %70 = getelementptr i8* %69, i32 %65
  %71 = bitcast i8* %70 to double*
  %72 = add i32 %65, 16
  store i32 %72, i32* %64
  br label %78

; <label>:73                                      ; preds = %62
  %74 = getelementptr inbounds %struct.__va_list_tag* %63, i32 0, i32 2
  %75 = load i8** %74
  %76 = bitcast i8* %75 to double*
  %77 = getelementptr i8* %75, i32 8
  store i8* %77, i8** %74
  br label %78

; <label>:78                                      ; preds = %73, %67
  %79 = phi double* [ %71, %67 ], [ %76, %73 ]
  %80 = load double* %79
  %81 = fmul double 1.000000e+04, %80
  %82 = fptosi double %81 to i32
  %83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str2, i32 0, i32 0), i32 %82)
  br label %214

; <label>:84                                      ; preds = %15
  %85 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %86 = getelementptr inbounds %struct.__va_list_tag* %85, i32 0, i32 0
  %87 = load i32* %86
  %88 = icmp ule i32 %87, 40
  br i1 %88, label %89, label %95

; <label>:89                                      ; preds = %84
  %90 = getelementptr inbounds %struct.__va_list_tag* %85, i32 0, i32 3
  %91 = load i8** %90
  %92 = getelementptr i8* %91, i32 %87
  %93 = bitcast i8* %92 to i64*
  %94 = add i32 %87, 8
  store i32 %94, i32* %86
  br label %100

; <label>:95                                      ; preds = %84
  %96 = getelementptr inbounds %struct.__va_list_tag* %85, i32 0, i32 2
  %97 = load i8** %96
  %98 = bitcast i8* %97 to i64*
  %99 = getelementptr i8* %97, i32 8
  store i8* %99, i8** %96
  br label %100

; <label>:100                                     ; preds = %95, %89
  %101 = phi i64* [ %93, %89 ], [ %98, %95 ]
  %102 = load i64* %101
  %103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str3, i32 0, i32 0), i64 %102)
  br label %214

; <label>:104                                     ; preds = %15
  %105 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %106 = getelementptr inbounds %struct.__va_list_tag* %105, i32 0, i32 0
  %107 = load i32* %106
  %108 = icmp ule i32 %107, 40
  br i1 %108, label %109, label %115

; <label>:109                                     ; preds = %104
  %110 = getelementptr inbounds %struct.__va_list_tag* %105, i32 0, i32 3
  %111 = load i8** %110
  %112 = getelementptr i8* %111, i32 %107
  %113 = bitcast i8* %112 to i32*
  %114 = add i32 %107, 8
  store i32 %114, i32* %106
  br label %120

; <label>:115                                     ; preds = %104
  %116 = getelementptr inbounds %struct.__va_list_tag* %105, i32 0, i32 2
  %117 = load i8** %116
  %118 = bitcast i8* %117 to i32*
  %119 = getelementptr i8* %117, i32 8
  store i8* %119, i8** %116
  br label %120

; <label>:120                                     ; preds = %115, %109
  %121 = phi i32* [ %113, %109 ], [ %118, %115 ]
  %122 = load i32* %121
  %123 = trunc i32 %122 to i8
  store i8 %123, i8* %c, align 1
  %124 = load i8* %c, align 1
  %125 = sext i8 %124 to i32
  %126 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32 %125)
  br label %214

; <label>:127                                     ; preds = %15
  %128 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %129 = getelementptr inbounds %struct.__va_list_tag* %128, i32 0, i32 0
  %130 = load i32* %129
  %131 = icmp ule i32 %130, 40
  br i1 %131, label %132, label %138

; <label>:132                                     ; preds = %127
  %133 = getelementptr inbounds %struct.__va_list_tag* %128, i32 0, i32 3
  %134 = load i8** %133
  %135 = getelementptr i8* %134, i32 %130
  %136 = bitcast i8* %135 to %struct.DWordS_struct*
  %137 = add i32 %130, 8
  store i32 %137, i32* %129
  br label %143

; <label>:138                                     ; preds = %127
  %139 = getelementptr inbounds %struct.__va_list_tag* %128, i32 0, i32 2
  %140 = load i8** %139
  %141 = bitcast i8* %140 to %struct.DWordS_struct*
  %142 = getelementptr i8* %140, i32 8
  store i8* %142, i8** %139
  br label %143

; <label>:143                                     ; preds = %138, %132
  %144 = phi %struct.DWordS_struct* [ %136, %132 ], [ %141, %138 ]
  %145 = bitcast %struct.DWordS_struct* %dw to i8*
  %146 = bitcast %struct.DWordS_struct* %144 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %145, i8* %146, i64 8, i32 4, i1 false)
  %147 = getelementptr inbounds %struct.DWordS_struct* %dw, i32 0, i32 0
  %148 = load i32* %147, align 4
  %149 = getelementptr inbounds %struct.DWordS_struct* %dw, i32 0, i32 1
  %150 = load i8* %149, align 1
  %151 = sext i8 %150 to i32
  %152 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str5, i32 0, i32 0), i32 %148, i32 %151)
  br label %214

; <label>:153                                     ; preds = %15
  %154 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %155 = getelementptr inbounds %struct.__va_list_tag* %154, i32 0, i32 0
  %156 = load i32* %155
  %157 = icmp ule i32 %156, 40
  %158 = getelementptr inbounds %struct.__va_list_tag* %154, i32 0, i32 1
  %159 = load i32* %158
  %160 = icmp ule i32 %159, 160
  %161 = and i1 %157, %160
  br i1 %161, label %162, label %177

; <label>:162                                     ; preds = %153
  %163 = getelementptr inbounds %struct.__va_list_tag* %154, i32 0, i32 3
  %164 = load i8** %163
  %165 = bitcast %struct.QuadWordS_struct* %2 to { i32, double }*
  %166 = getelementptr i8* %164, i32 %156
  %167 = getelementptr i8* %164, i32 %159
  %168 = bitcast i8* %166 to i32*
  %169 = load i32* %168
  %170 = getelementptr inbounds { i32, double }* %165, i32 0, i32 0
  store i32 %169, i32* %170
  %171 = bitcast i8* %167 to double*
  %172 = load double* %171
  %173 = getelementptr inbounds { i32, double }* %165, i32 0, i32 1
  store double %172, double* %173
  %174 = bitcast { i32, double }* %165 to %struct.QuadWordS_struct*
  %175 = add i32 %156, 8
  store i32 %175, i32* %155
  %176 = add i32 %159, 16
  store i32 %176, i32* %158
  br label %182

; <label>:177                                     ; preds = %153
  %178 = getelementptr inbounds %struct.__va_list_tag* %154, i32 0, i32 2
  %179 = load i8** %178
  %180 = bitcast i8* %179 to %struct.QuadWordS_struct*
  %181 = getelementptr i8* %179, i32 16
  store i8* %181, i8** %178
  br label %182

; <label>:182                                     ; preds = %177, %162
  %183 = phi %struct.QuadWordS_struct* [ %174, %162 ], [ %180, %177 ]
  %184 = bitcast %struct.QuadWordS_struct* %qw to i8*
  %185 = bitcast %struct.QuadWordS_struct* %183 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %184, i8* %185, i64 16, i32 8, i1 false)
  %186 = getelementptr inbounds %struct.QuadWordS_struct* %qw, i32 0, i32 0
  %187 = load i32* %186, align 4
  %188 = getelementptr inbounds %struct.QuadWordS_struct* %qw, i32 0, i32 1
  %189 = load double* %188, align 8
  %190 = fmul double 1.000000e+04, %189
  %191 = fptosi double %190 to i32
  %192 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str6, i32 0, i32 0), i32 %187, i32 %191)
  br label %214

; <label>:193                                     ; preds = %15
  %194 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %195 = getelementptr inbounds %struct.__va_list_tag* %194, i32 0, i32 2
  %196 = load i8** %195
  %197 = bitcast i8* %196 to %struct.LargeS_struct*
  %198 = getelementptr i8* %196, i32 32
  store i8* %198, i8** %195
  %199 = bitcast %struct.LargeS_struct* %ls to i8*
  %200 = bitcast %struct.LargeS_struct* %197 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %199, i8* %200, i64 32, i32 8, i1 false)
  %201 = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 0
  %202 = load i32* %201, align 4
  %203 = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 1
  %204 = load double* %203, align 8
  %205 = fmul double 1.000000e+04, %204
  %206 = fptosi double %205 to i32
  %207 = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 2
  %208 = load %struct.DWordS_struct** %207, align 8
  %209 = icmp ne %struct.DWordS_struct* %208, null
  %210 = zext i1 %209 to i32
  %211 = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 3
  %212 = load i32* %211, align 4
  %213 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i32 0, i32 0), i32 %202, i32 %206, i32 %210, i32 %212)
  br label %214

; <label>:214                                     ; preds = %15, %193, %182, %143, %120, %100, %78, %57, %36
  br label %11

; <label>:215                                     ; preds = %11
  %216 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %217 = bitcast %struct.__va_list_tag* %216 to i8*
  call void @llvm.va_end(i8* %217)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_copy(i8*, i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %dw = alloca %struct.DWordS_struct, align 4
  %qw = alloca %struct.QuadWordS_struct, align 8
  %ls = alloca %struct.LargeS_struct, align 8
  store i32 0, i32* %1
  %2 = bitcast %struct.DWordS_struct* %dw to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ({ i32, i8, [3 x i8] }* @main.dw to i8*), i64 8, i32 4, i1 false)
  %3 = bitcast %struct.QuadWordS_struct* %qw to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast (%struct.QuadWordS_struct* @main.qw to i8*), i64 16, i32 8, i1 false)
  %4 = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 0
  store i32 21, i32* %4, align 4
  %5 = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 1
  store double 2.200000e+01, double* %5, align 8
  %6 = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 2
  store %struct.DWordS_struct* %dw, %struct.DWordS_struct** %6, align 8
  %7 = getelementptr inbounds %struct.LargeS_struct* %ls, i32 0, i32 3
  store i32 23, i32* %7, align 4
  call void (i8*, ...)* @test(i8* getelementptr inbounds ([11 x i8]* @.str8, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8]* @.str10, i32 0, i32 0), i32 -123, i32 97, i32 123, i32 6, i32 7, i32 8, i32 9, i8* getelementptr inbounds ([14 x i8]* @.str11, i32 0, i32 0))
  call void (i8*, ...)* @test(i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0), double 1.000000e+00, double 2.000000e+00, i32 32764, i64 12345677823423)
  %8 = bitcast %struct.DWordS_struct* %dw to i64*
  %9 = load i64* %8, align 1
  %10 = bitcast %struct.QuadWordS_struct* %qw to { i32, double }*
  %11 = getelementptr { i32, double }* %10, i32 0, i32 0
  %12 = load i32* %11, align 1
  %13 = getelementptr { i32, double }* %10, i32 0, i32 1
  %14 = load double* %13, align 1
  call void (i8*, ...)* @test(i8* getelementptr inbounds ([4 x i8]* @.str13, i32 0, i32 0), i64 %9, i32 %12, double %14, %struct.LargeS_struct* byval align 8 %ls)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
