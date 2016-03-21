; ModuleID = './2003-07-09-SignedArgs.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [31 x i8] c"getShort():\09%d %d %d %d %d %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [36 x i8] c"getUnknown():\09%d %d %d %d %d %d %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @passShort(i8 signext %c, i16 signext %s) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i16, align 2
  %c2 = alloca i8, align 1
  %c3 = alloca i8, align 1
  %s2 = alloca i16, align 2
  %i = alloca i32, align 4
  %s3 = alloca i16, align 2
  store i8 %c, i8* %1, align 1
  store i16 %s, i16* %2, align 2
  %3 = load i16, i16* %2, align 2
  %4 = sext i16 %3 to i32
  %5 = load i8, i8* %1, align 1
  %6 = sext i8 %5 to i32
  %7 = add nsw i32 %4, %6
  %8 = trunc i32 %7 to i8
  store i8 %8, i8* %c2, align 1
  %9 = load i16, i16* %2, align 2
  %10 = sext i16 %9 to i32
  %11 = load i8, i8* %1, align 1
  %12 = sext i8 %11 to i32
  %13 = sub nsw i32 %10, %12
  %14 = trunc i32 %13 to i8
  store i8 %14, i8* %c3, align 1
  %15 = load i16, i16* %2, align 2
  %16 = sext i16 %15 to i32
  %17 = load i8, i8* %1, align 1
  %18 = sext i8 %17 to i32
  %19 = mul nsw i32 %16, %18
  %20 = trunc i32 %19 to i16
  store i16 %20, i16* %s2, align 2
  %21 = load i16, i16* %2, align 2
  %22 = sext i16 %21 to i32
  %23 = load i16, i16* %2, align 2
  %24 = sext i16 %23 to i32
  %25 = mul nsw i32 %22, %24
  %26 = load i8, i8* %1, align 1
  %27 = sext i8 %26 to i32
  %28 = mul nsw i32 %25, %27
  %29 = load i8, i8* %1, align 1
  %30 = sext i8 %29 to i32
  %31 = mul nsw i32 %28, %30
  store i32 %31, i32* %i, align 4
  %32 = load i8, i8* %1, align 1
  %33 = load i8, i8* %c2, align 1
  %34 = load i8, i8* %c3, align 1
  %35 = load i16, i16* %2, align 2
  %36 = load i16, i16* %s2, align 2
  %37 = load i32, i32* %i, align 4
  %38 = call signext i16 @getShort(i8 signext %32, i8 signext %33, i8 signext %34, i16 signext %35, i16 signext %36, i32 %37)
  store i16 %38, i16* %s3, align 2
  %39 = load i8, i8* %1, align 1
  %40 = load i8, i8* %c2, align 1
  %41 = sext i8 %40 to i32
  %42 = load i8, i8* %c3, align 1
  %43 = sext i8 %42 to i32
  %44 = load i16, i16* %2, align 2
  %45 = sext i16 %44 to i32
  %46 = load i16, i16* %s2, align 2
  %47 = sext i16 %46 to i32
  %48 = load i16, i16* %s3, align 2
  %49 = sext i16 %48 to i32
  %50 = load i32, i32* %i, align 4
  %51 = call i32 (i8, ...) @getUnknown(i8 signext %39, i32 %41, i32 %43, i32 %45, i32 %47, i32 %49, i32 %50)
  ret i32 %51
}

; Function Attrs: nounwind uwtable
define signext i16 @getShort(i8 signext %c, i8 signext %c2, i8 signext %c3, i16 signext %s, i16 signext %s2, i32 %i) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %3 = alloca i8, align 1
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca i32, align 4
  %bc = alloca i32, align 4
  %bc2 = alloca i32, align 4
  %bc3 = alloca i32, align 4
  %bs = alloca i32, align 4
  %bs2 = alloca i32, align 4
  %bi = alloca i32, align 4
  store i8 %c, i8* %1, align 1
  store i8 %c2, i8* %2, align 1
  store i8 %c3, i8* %3, align 1
  store i16 %s, i16* %4, align 2
  store i16 %s2, i16* %5, align 2
  store i32 %i, i32* %6, align 4
  %7 = load i8, i8* %1, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 %8, -128
  %10 = zext i1 %9 to i32
  store i32 %10, i32* %bc, align 4
  %11 = load i8, i8* %2, align 1
  %12 = sext i8 %11 to i32
  %13 = icmp eq i32 %12, 116
  %14 = zext i1 %13 to i32
  store i32 %14, i32* %bc2, align 4
  %15 = load i8, i8* %3, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %16, 116
  %18 = zext i1 %17 to i32
  store i32 %18, i32* %bc3, align 4
  %19 = load i16, i16* %4, align 2
  %20 = sext i16 %19 to i32
  %21 = icmp eq i32 %20, -3852
  %22 = zext i1 %21 to i32
  store i32 %22, i32* %bs, align 4
  %23 = load i16, i16* %5, align 2
  %24 = sext i16 %23 to i32
  %25 = icmp eq i32 %24, -31232
  %26 = zext i1 %25 to i32
  store i32 %26, i32* %bs2, align 4
  %27 = load i32, i32* %6, align 4
  %28 = icmp eq i32 %27, -1708916736
  %29 = zext i1 %28 to i32
  store i32 %29, i32* %bi, align 4
  %30 = load i32, i32* %bc, align 4
  %31 = load i32, i32* %bc2, align 4
  %32 = load i32, i32* %bc3, align 4
  %33 = load i32, i32* %bs, align 4
  %34 = load i32, i32* %bs2, align 4
  %35 = load i32, i32* %bi, align 4
  %36 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i32 0, i32 0), i32 %30, i32 %31, i32 %32, i32 %33, i32 %34, i32 %35)
  %37 = load i8, i8* %1, align 1
  %38 = sext i8 %37 to i32
  %39 = load i8, i8* %2, align 1
  %40 = sext i8 %39 to i32
  %41 = load i8, i8* %3, align 1
  %42 = sext i8 %41 to i32
  %43 = load i16, i16* %4, align 2
  %44 = sext i16 %43 to i32
  %45 = load i16, i16* %5, align 2
  %46 = sext i16 %45 to i32
  %47 = load i32, i32* %6, align 4
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.1, i32 0, i32 0), i32 %38, i32 %40, i32 %42, i32 %44, i32 %46, i32 %47)
  %49 = load i8, i8* %1, align 1
  %50 = sext i8 %49 to i32
  %51 = load i8, i8* %2, align 1
  %52 = sext i8 %51 to i32
  %53 = add nsw i32 %50, %52
  %54 = load i8, i8* %3, align 1
  %55 = sext i8 %54 to i32
  %56 = add nsw i32 %53, %55
  %57 = load i16, i16* %4, align 2
  %58 = sext i16 %57 to i32
  %59 = add nsw i32 %56, %58
  %60 = load i16, i16* %5, align 2
  %61 = sext i16 %60 to i32
  %62 = add nsw i32 %59, %61
  %63 = load i32, i32* %6, align 4
  %64 = trunc i32 %63 to i16
  %65 = sext i16 %64 to i32
  %66 = add nsw i32 %62, %65
  %67 = trunc i32 %66 to i16
  ret i16 %67
}

; Function Attrs: nounwind uwtable
define i32 @getUnknown(i8 signext %c, ...) #0 {
  %1 = alloca i8, align 1
  %c2 = alloca i8, align 1
  %c3 = alloca i8, align 1
  %s = alloca i16, align 2
  %s2 = alloca i16, align 2
  %s3 = alloca i16, align 2
  %i = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  store i8 %c, i8* %1, align 1
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 0
  %6 = load i32, i32* %5
  %7 = icmp ule i32 %6, 40
  br i1 %7, label %8, label %14

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 3
  %10 = load i8*, i8** %9
  %11 = getelementptr i8, i8* %10, i32 %6
  %12 = bitcast i8* %11 to i32*
  %13 = add i32 %6, 8
  store i32 %13, i32* %5
  br label %19

; <label>:14                                      ; preds = %0
  %15 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %4, i32 0, i32 2
  %16 = load i8*, i8** %15
  %17 = bitcast i8* %16 to i32*
  %18 = getelementptr i8, i8* %16, i32 8
  store i8* %18, i8** %15
  br label %19

; <label>:19                                      ; preds = %14, %8
  %20 = phi i32* [ %12, %8 ], [ %17, %14 ]
  %21 = load i32, i32* %20
  %22 = trunc i32 %21 to i8
  store i8 %22, i8* %c2, align 1
  %23 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %24 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %23, i32 0, i32 0
  %25 = load i32, i32* %24
  %26 = icmp ule i32 %25, 40
  br i1 %26, label %27, label %33

; <label>:27                                      ; preds = %19
  %28 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %23, i32 0, i32 3
  %29 = load i8*, i8** %28
  %30 = getelementptr i8, i8* %29, i32 %25
  %31 = bitcast i8* %30 to i32*
  %32 = add i32 %25, 8
  store i32 %32, i32* %24
  br label %38

; <label>:33                                      ; preds = %19
  %34 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %23, i32 0, i32 2
  %35 = load i8*, i8** %34
  %36 = bitcast i8* %35 to i32*
  %37 = getelementptr i8, i8* %35, i32 8
  store i8* %37, i8** %34
  br label %38

; <label>:38                                      ; preds = %33, %27
  %39 = phi i32* [ %31, %27 ], [ %36, %33 ]
  %40 = load i32, i32* %39
  %41 = trunc i32 %40 to i8
  store i8 %41, i8* %c3, align 1
  %42 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %43 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %42, i32 0, i32 0
  %44 = load i32, i32* %43
  %45 = icmp ule i32 %44, 40
  br i1 %45, label %46, label %52

; <label>:46                                      ; preds = %38
  %47 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %42, i32 0, i32 3
  %48 = load i8*, i8** %47
  %49 = getelementptr i8, i8* %48, i32 %44
  %50 = bitcast i8* %49 to i32*
  %51 = add i32 %44, 8
  store i32 %51, i32* %43
  br label %57

; <label>:52                                      ; preds = %38
  %53 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %42, i32 0, i32 2
  %54 = load i8*, i8** %53
  %55 = bitcast i8* %54 to i32*
  %56 = getelementptr i8, i8* %54, i32 8
  store i8* %56, i8** %53
  br label %57

; <label>:57                                      ; preds = %52, %46
  %58 = phi i32* [ %50, %46 ], [ %55, %52 ]
  %59 = load i32, i32* %58
  %60 = trunc i32 %59 to i16
  store i16 %60, i16* %s, align 2
  %61 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %62 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %61, i32 0, i32 0
  %63 = load i32, i32* %62
  %64 = icmp ule i32 %63, 40
  br i1 %64, label %65, label %71

; <label>:65                                      ; preds = %57
  %66 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %61, i32 0, i32 3
  %67 = load i8*, i8** %66
  %68 = getelementptr i8, i8* %67, i32 %63
  %69 = bitcast i8* %68 to i32*
  %70 = add i32 %63, 8
  store i32 %70, i32* %62
  br label %76

; <label>:71                                      ; preds = %57
  %72 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %61, i32 0, i32 2
  %73 = load i8*, i8** %72
  %74 = bitcast i8* %73 to i32*
  %75 = getelementptr i8, i8* %73, i32 8
  store i8* %75, i8** %72
  br label %76

; <label>:76                                      ; preds = %71, %65
  %77 = phi i32* [ %69, %65 ], [ %74, %71 ]
  %78 = load i32, i32* %77
  %79 = trunc i32 %78 to i16
  store i16 %79, i16* %s2, align 2
  %80 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %81 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %80, i32 0, i32 0
  %82 = load i32, i32* %81
  %83 = icmp ule i32 %82, 40
  br i1 %83, label %84, label %90

; <label>:84                                      ; preds = %76
  %85 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %80, i32 0, i32 3
  %86 = load i8*, i8** %85
  %87 = getelementptr i8, i8* %86, i32 %82
  %88 = bitcast i8* %87 to i32*
  %89 = add i32 %82, 8
  store i32 %89, i32* %81
  br label %95

; <label>:90                                      ; preds = %76
  %91 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %80, i32 0, i32 2
  %92 = load i8*, i8** %91
  %93 = bitcast i8* %92 to i32*
  %94 = getelementptr i8, i8* %92, i32 8
  store i8* %94, i8** %91
  br label %95

; <label>:95                                      ; preds = %90, %84
  %96 = phi i32* [ %88, %84 ], [ %93, %90 ]
  %97 = load i32, i32* %96
  %98 = trunc i32 %97 to i16
  store i16 %98, i16* %s3, align 2
  %99 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %100 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %99, i32 0, i32 0
  %101 = load i32, i32* %100
  %102 = icmp ule i32 %101, 40
  br i1 %102, label %103, label %109

; <label>:103                                     ; preds = %95
  %104 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %99, i32 0, i32 3
  %105 = load i8*, i8** %104
  %106 = getelementptr i8, i8* %105, i32 %101
  %107 = bitcast i8* %106 to i32*
  %108 = add i32 %101, 8
  store i32 %108, i32* %100
  br label %114

; <label>:109                                     ; preds = %95
  %110 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %99, i32 0, i32 2
  %111 = load i8*, i8** %110
  %112 = bitcast i8* %111 to i32*
  %113 = getelementptr i8, i8* %111, i32 8
  store i8* %113, i8** %110
  br label %114

; <label>:114                                     ; preds = %109, %103
  %115 = phi i32* [ %107, %103 ], [ %112, %109 ]
  %116 = load i32, i32* %115
  store i32 %116, i32* %i, align 4
  %117 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %118 = bitcast %struct.__va_list_tag* %117 to i8*
  call void @llvm.va_end(i8* %118)
  %119 = load i8, i8* %1, align 1
  %120 = sext i8 %119 to i32
  %121 = load i8, i8* %c2, align 1
  %122 = sext i8 %121 to i32
  %123 = load i8, i8* %c3, align 1
  %124 = sext i8 %123 to i32
  %125 = load i16, i16* %s, align 2
  %126 = sext i16 %125 to i32
  %127 = load i16, i16* %s2, align 2
  %128 = sext i16 %127 to i32
  %129 = load i16, i16* %s3, align 2
  %130 = sext i16 %129 to i32
  %131 = load i32, i32* %i, align 4
  %132 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.2, i32 0, i32 0), i32 %120, i32 %122, i32 %124, i32 %126, i32 %128, i32 %130, i32 %131)
  %133 = load i8, i8* %1, align 1
  %134 = sext i8 %133 to i32
  %135 = load i8, i8* %c2, align 1
  %136 = sext i8 %135 to i32
  %137 = add nsw i32 %134, %136
  %138 = load i8, i8* %c3, align 1
  %139 = sext i8 %138 to i32
  %140 = add nsw i32 %137, %139
  %141 = load i16, i16* %s, align 2
  %142 = sext i16 %141 to i32
  %143 = add nsw i32 %140, %142
  %144 = load i16, i16* %s2, align 2
  %145 = sext i16 %144 to i32
  %146 = add nsw i32 %143, %145
  %147 = load i16, i16* %s3, align 2
  %148 = sext i16 %147 to i32
  %149 = add nsw i32 %146, %148
  %150 = load i32, i32* %i, align 4
  %151 = add nsw i32 %149, %150
  ret i32 %151
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @passShort(i8 signext -128, i16 signext -3852)
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %2)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
