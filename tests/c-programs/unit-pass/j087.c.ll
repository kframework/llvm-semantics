; ModuleID = './j087.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define i32 @f(i32 %x, i32 %y, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %z = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %5, i32 0, i32 0
  %7 = load i32, i32* %6
  %8 = icmp ule i32 %7, 40
  br i1 %8, label %9, label %15

; <label>:9                                       ; preds = %0
  %10 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %5, i32 0, i32 3
  %11 = load i8*, i8** %10
  %12 = getelementptr i8, i8* %11, i32 %7
  %13 = bitcast i8* %12 to i32*
  %14 = add i32 %7, 8
  store i32 %14, i32* %6
  br label %20

; <label>:15                                      ; preds = %0
  %16 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %5, i32 0, i32 2
  %17 = load i8*, i8** %16
  %18 = bitcast i8* %17 to i32*
  %19 = getelementptr i8, i8* %17, i32 8
  store i8* %19, i8** %16
  br label %20

; <label>:20                                      ; preds = %15, %9
  %21 = phi i32* [ %13, %9 ], [ %18, %15 ]
  %22 = load i32, i32* %21
  store i32 %22, i32* %z, align 4
  %23 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %24 = bitcast %struct.__va_list_tag* %23 to i8*
  call void @llvm.va_end(i8* %24)
  %25 = load i32, i32* %z, align 4
  ret i32 %25
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 (i32, i32, ...) @f(i32 5, i32 6, i32 0)
  ret i32 %2
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
