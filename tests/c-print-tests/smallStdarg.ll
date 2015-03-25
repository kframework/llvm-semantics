; ModuleID = './smallStdarg.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @printargs(i32 %arg1, ...) #0 {
  %1 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  store i32 %arg1, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = load i32* %1, align 4
  store i32 %4, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %25, %0
  %6 = load i32* %i, align 4
  %7 = icmp ne i32 %6, -1
  br i1 %7, label %8, label %28

; <label>:8                                       ; preds = %5
  br label %9

; <label>:9                                       ; preds = %8
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %11 = getelementptr inbounds %struct.__va_list_tag* %10, i32 0, i32 0
  %12 = load i32* %11
  %13 = icmp ule i32 %12, 40
  br i1 %13, label %14, label %20

; <label>:14                                      ; preds = %9
  %15 = getelementptr inbounds %struct.__va_list_tag* %10, i32 0, i32 3
  %16 = load i8** %15
  %17 = getelementptr i8* %16, i32 %12
  %18 = bitcast i8* %17 to i32*
  %19 = add i32 %12, 8
  store i32 %19, i32* %11
  br label %25

; <label>:20                                      ; preds = %9
  %21 = getelementptr inbounds %struct.__va_list_tag* %10, i32 0, i32 2
  %22 = load i8** %21
  %23 = bitcast i8* %22 to i32*
  %24 = getelementptr i8* %22, i32 8
  store i8* %24, i8** %21
  br label %25

; <label>:25                                      ; preds = %20, %14
  %26 = phi i32* [ %18, %14 ], [ %23, %20 ]
  %27 = load i32* %26
  store i32 %27, i32* %i, align 4
  br label %5

; <label>:28                                      ; preds = %5
  %29 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %30 = bitcast %struct.__va_list_tag* %29 to i8*
  call void @llvm.va_end(i8* %30)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i32, ...)* @printargs(i32 5, i32 2, i32 14, i32 84, i32 97, i32 15, i32 24, i32 48, i32 -1)
  call void (i32, ...)* @printargs(i32 84, i32 51, i32 -1)
  call void (i32, ...)* @printargs(i32 -1)
  call void (i32, ...)* @printargs(i32 1, i32 -1)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
