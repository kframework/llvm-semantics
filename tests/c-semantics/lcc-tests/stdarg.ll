; ModuleID = './stdarg.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.node = type { [4 x i32] }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@x = global %struct.node { [4 x i32] [i32 1, i32 2, i32 3, i32 4] }, align 8
@.str = private unnamed_addr constant [8 x i8] c"test 1\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"test %s\0A\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"2\00", align 1
@.str3 = private unnamed_addr constant [10 x i8] c"test %d%c\00", align 1
@.str4 = private unnamed_addr constant [10 x i8] c"%s%s %d%c\00", align 1
@.str5 = private unnamed_addr constant [3 x i8] c"te\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"st\00", align 1
@.str7 = private unnamed_addr constant [10 x i8] c"%s%s %f%c\00", align 1
@.str8 = private unnamed_addr constant [19 x i8] c"%b %b %b %b %b %b\0A\00", align 1
@.str9 = private unnamed_addr constant [14 x i8] c"{%d %d %d %d}\00", align 1
@.str10 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str11 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str12 = private unnamed_addr constant [5 x i8] c"%02x\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"%s\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i8*, ...)* @print(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0))
  call void (i8*, ...)* @print(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0))
  call void (i8*, ...)* @print(i8* getelementptr inbounds ([10 x i8]* @.str3, i32 0, i32 0), i32 3, i32 10)
  call void (i8*, ...)* @print(i8* getelementptr inbounds ([10 x i8]* @.str4, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0), i32 4, i32 10)
  call void (i8*, ...)* @print(i8* getelementptr inbounds ([10 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0), double 5.000000e+00, i32 10)
  %2 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.node* @x to { i64, i64 }*), i32 0, i32 0), align 1
  %3 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.node* @x to { i64, i64 }*), i32 0, i32 1), align 1
  %4 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.node* @x to { i64, i64 }*), i32 0, i32 0), align 1
  %5 = load i64* getelementptr ({ i64, i64 }* bitcast (%struct.node* @x to { i64, i64 }*), i32 0, i32 1), align 1
  call void (i8*, ...)* @print(i8* getelementptr inbounds ([19 x i8]* @.str8, i32 0, i32 0), i64 %2, i64 %3, i64 %4, i64 %5, %struct.node* byval align 8 @x, %struct.node* byval align 8 @x, %struct.node* byval align 8 @x, %struct.node* byval align 8 @x)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define void @print(i8* %fmt, ...) #0 {
  %1 = alloca i8*, align 8
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %x = alloca %struct.node, align 4
  store i8* %fmt, i8** %1, align 8
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  br label %4

; <label>:4                                       ; preds = %164, %0
  %5 = load i8** %1, align 8
  %6 = load i8* %5, align 1
  %7 = icmp ne i8 %6, 0
  br i1 %7, label %8, label %167

; <label>:8                                       ; preds = %4
  %9 = load i8** %1, align 8
  %10 = load i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp eq i32 %11, 37
  br i1 %12, label %13, label %158

; <label>:13                                      ; preds = %8
  %14 = load i8** %1, align 8
  %15 = getelementptr inbounds i8* %14, i32 1
  store i8* %15, i8** %1, align 8
  %16 = load i8* %15, align 1
  %17 = sext i8 %16 to i32
  switch i32 %17, label %152 [
    i32 98, label %18
    i32 99, label %51
    i32 100, label %71
    i32 119, label %91
    i32 115, label %111
    i32 102, label %131
  ]

; <label>:18                                      ; preds = %13
  %19 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %20 = getelementptr inbounds %struct.__va_list_tag* %19, i32 0, i32 0
  %21 = load i32* %20
  %22 = icmp ule i32 %21, 32
  br i1 %22, label %23, label %29

; <label>:23                                      ; preds = %18
  %24 = getelementptr inbounds %struct.__va_list_tag* %19, i32 0, i32 3
  %25 = load i8** %24
  %26 = getelementptr i8* %25, i32 %21
  %27 = bitcast i8* %26 to %struct.node*
  %28 = add i32 %21, 16
  store i32 %28, i32* %20
  br label %34

; <label>:29                                      ; preds = %18
  %30 = getelementptr inbounds %struct.__va_list_tag* %19, i32 0, i32 2
  %31 = load i8** %30
  %32 = bitcast i8* %31 to %struct.node*
  %33 = getelementptr i8* %31, i32 16
  store i8* %33, i8** %30
  br label %34

; <label>:34                                      ; preds = %29, %23
  %35 = phi %struct.node* [ %27, %23 ], [ %32, %29 ]
  %36 = bitcast %struct.node* %x to i8*
  %37 = bitcast %struct.node* %35 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %36, i8* %37, i64 16, i32 4, i1 false)
  %38 = getelementptr inbounds %struct.node* %x, i32 0, i32 0
  %39 = getelementptr inbounds [4 x i32]* %38, i32 0, i64 0
  %40 = load i32* %39, align 4
  %41 = getelementptr inbounds %struct.node* %x, i32 0, i32 0
  %42 = getelementptr inbounds [4 x i32]* %41, i32 0, i64 1
  %43 = load i32* %42, align 4
  %44 = getelementptr inbounds %struct.node* %x, i32 0, i32 0
  %45 = getelementptr inbounds [4 x i32]* %44, i32 0, i64 2
  %46 = load i32* %45, align 4
  %47 = getelementptr inbounds %struct.node* %x, i32 0, i32 0
  %48 = getelementptr inbounds [4 x i32]* %47, i32 0, i64 3
  %49 = load i32* %48, align 4
  %50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str9, i32 0, i32 0), i32 %40, i32 %43, i32 %46, i32 %49)
  br label %157

; <label>:51                                      ; preds = %13
  %52 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %53 = getelementptr inbounds %struct.__va_list_tag* %52, i32 0, i32 0
  %54 = load i32* %53
  %55 = icmp ule i32 %54, 40
  br i1 %55, label %56, label %62

; <label>:56                                      ; preds = %51
  %57 = getelementptr inbounds %struct.__va_list_tag* %52, i32 0, i32 3
  %58 = load i8** %57
  %59 = getelementptr i8* %58, i32 %54
  %60 = bitcast i8* %59 to i32*
  %61 = add i32 %54, 8
  store i32 %61, i32* %53
  br label %67

; <label>:62                                      ; preds = %51
  %63 = getelementptr inbounds %struct.__va_list_tag* %52, i32 0, i32 2
  %64 = load i8** %63
  %65 = bitcast i8* %64 to i32*
  %66 = getelementptr i8* %64, i32 8
  store i8* %66, i8** %63
  br label %67

; <label>:67                                      ; preds = %62, %56
  %68 = phi i32* [ %60, %56 ], [ %65, %62 ]
  %69 = load i32* %68
  %70 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0), i32 %69)
  br label %157

; <label>:71                                      ; preds = %13
  %72 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %73 = getelementptr inbounds %struct.__va_list_tag* %72, i32 0, i32 0
  %74 = load i32* %73
  %75 = icmp ule i32 %74, 40
  br i1 %75, label %76, label %82

; <label>:76                                      ; preds = %71
  %77 = getelementptr inbounds %struct.__va_list_tag* %72, i32 0, i32 3
  %78 = load i8** %77
  %79 = getelementptr i8* %78, i32 %74
  %80 = bitcast i8* %79 to i32*
  %81 = add i32 %74, 8
  store i32 %81, i32* %73
  br label %87

; <label>:82                                      ; preds = %71
  %83 = getelementptr inbounds %struct.__va_list_tag* %72, i32 0, i32 2
  %84 = load i8** %83
  %85 = bitcast i8* %84 to i32*
  %86 = getelementptr i8* %84, i32 8
  store i8* %86, i8** %83
  br label %87

; <label>:87                                      ; preds = %82, %76
  %88 = phi i32* [ %80, %76 ], [ %85, %82 ]
  %89 = load i32* %88
  %90 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0), i32 %89)
  br label %157

; <label>:91                                      ; preds = %13
  %92 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %93 = getelementptr inbounds %struct.__va_list_tag* %92, i32 0, i32 0
  %94 = load i32* %93
  %95 = icmp ule i32 %94, 40
  br i1 %95, label %96, label %102

; <label>:96                                      ; preds = %91
  %97 = getelementptr inbounds %struct.__va_list_tag* %92, i32 0, i32 3
  %98 = load i8** %97
  %99 = getelementptr i8* %98, i32 %94
  %100 = bitcast i8* %99 to i32*
  %101 = add i32 %94, 8
  store i32 %101, i32* %93
  br label %107

; <label>:102                                     ; preds = %91
  %103 = getelementptr inbounds %struct.__va_list_tag* %92, i32 0, i32 2
  %104 = load i8** %103
  %105 = bitcast i8* %104 to i32*
  %106 = getelementptr i8* %104, i32 8
  store i8* %106, i8** %103
  br label %107

; <label>:107                                     ; preds = %102, %96
  %108 = phi i32* [ %100, %96 ], [ %105, %102 ]
  %109 = load i32* %108
  %110 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str12, i32 0, i32 0), i32 %109)
  br label %157

; <label>:111                                     ; preds = %13
  %112 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %113 = getelementptr inbounds %struct.__va_list_tag* %112, i32 0, i32 0
  %114 = load i32* %113
  %115 = icmp ule i32 %114, 40
  br i1 %115, label %116, label %122

; <label>:116                                     ; preds = %111
  %117 = getelementptr inbounds %struct.__va_list_tag* %112, i32 0, i32 3
  %118 = load i8** %117
  %119 = getelementptr i8* %118, i32 %114
  %120 = bitcast i8* %119 to i8**
  %121 = add i32 %114, 8
  store i32 %121, i32* %113
  br label %127

; <label>:122                                     ; preds = %111
  %123 = getelementptr inbounds %struct.__va_list_tag* %112, i32 0, i32 2
  %124 = load i8** %123
  %125 = bitcast i8* %124 to i8**
  %126 = getelementptr i8* %124, i32 8
  store i8* %126, i8** %123
  br label %127

; <label>:127                                     ; preds = %122, %116
  %128 = phi i8** [ %120, %116 ], [ %125, %122 ]
  %129 = load i8** %128
  %130 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str13, i32 0, i32 0), i8* %129)
  br label %157

; <label>:131                                     ; preds = %13
  %132 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %133 = getelementptr inbounds %struct.__va_list_tag* %132, i32 0, i32 1
  %134 = load i32* %133
  %135 = icmp ule i32 %134, 160
  br i1 %135, label %136, label %142

; <label>:136                                     ; preds = %131
  %137 = getelementptr inbounds %struct.__va_list_tag* %132, i32 0, i32 3
  %138 = load i8** %137
  %139 = getelementptr i8* %138, i32 %134
  %140 = bitcast i8* %139 to double*
  %141 = add i32 %134, 16
  store i32 %141, i32* %133
  br label %147

; <label>:142                                     ; preds = %131
  %143 = getelementptr inbounds %struct.__va_list_tag* %132, i32 0, i32 2
  %144 = load i8** %143
  %145 = bitcast i8* %144 to double*
  %146 = getelementptr i8* %144, i32 8
  store i8* %146, i8** %143
  br label %147

; <label>:147                                     ; preds = %142, %136
  %148 = phi double* [ %140, %136 ], [ %145, %142 ]
  %149 = load double* %148
  %150 = fptosi double %149 to i32
  %151 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str11, i32 0, i32 0), i32 %150)
  br label %157

; <label>:152                                     ; preds = %13
  %153 = load i8** %1, align 8
  %154 = load i8* %153, align 1
  %155 = sext i8 %154 to i32
  %156 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0), i32 %155)
  br label %157

; <label>:157                                     ; preds = %152, %147, %127, %107, %87, %67, %34
  br label %163

; <label>:158                                     ; preds = %8
  %159 = load i8** %1, align 8
  %160 = load i8* %159, align 1
  %161 = sext i8 %160 to i32
  %162 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str10, i32 0, i32 0), i32 %161)
  br label %163

; <label>:163                                     ; preds = %158, %157
  br label %164

; <label>:164                                     ; preds = %163
  %165 = load i8** %1, align 8
  %166 = getelementptr inbounds i8* %165, i32 1
  store i8* %166, i8** %1, align 8
  br label %4

; <label>:167                                     ; preds = %4
  %168 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %169 = bitcast %struct.__va_list_tag* %168 to i8*
  call void @llvm.va_end(i8* %169)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
