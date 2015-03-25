; ModuleID = './va-arg-23.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.two = type { i64, i64 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @foo(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, %struct.two* byval align 8 %f, i32 %g, ...) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %h = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  store i32 %e, i32* %5, align 4
  store i32 %g, i32* %6, align 4
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %8 = bitcast %struct.__va_list_tag* %7 to i8*
  call void @llvm.va_start(i8* %8)
  %9 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %10 = getelementptr inbounds %struct.__va_list_tag* %9, i32 0, i32 0
  %11 = load i32* %10
  %12 = icmp ule i32 %11, 40
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %0
  %14 = getelementptr inbounds %struct.__va_list_tag* %9, i32 0, i32 3
  %15 = load i8** %14
  %16 = getelementptr i8* %15, i32 %11
  %17 = bitcast i8* %16 to i32*
  %18 = add i32 %11, 8
  store i32 %18, i32* %10
  br label %24

; <label>:19                                      ; preds = %0
  %20 = getelementptr inbounds %struct.__va_list_tag* %9, i32 0, i32 2
  %21 = load i8** %20
  %22 = bitcast i8* %21 to i32*
  %23 = getelementptr i8* %21, i32 8
  store i8* %23, i8** %20
  br label %24

; <label>:24                                      ; preds = %19, %13
  %25 = phi i32* [ %17, %13 ], [ %22, %19 ]
  %26 = load i32* %25
  store i32 %26, i32* %h, align 4
  %27 = load i32* %6, align 4
  %28 = icmp ne i32 %27, 1
  br i1 %28, label %32, label %29

; <label>:29                                      ; preds = %24
  %30 = load i32* %h, align 4
  %31 = icmp ne i32 %30, 2
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29, %24
  call void @abort() #3
  unreachable

; <label>:33                                      ; preds = %29
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %t = alloca %struct.two, align 8
  store i32 0, i32* %1
  %2 = bitcast %struct.two* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 16, i32 8, i1 false)
  call void (i32, i32, i32, i32, i32, %struct.two*, i32, ...)* @foo(i32 0, i32 0, i32 0, i32 0, i32 0, %struct.two* byval align 8 %t, i32 1, i32 2)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
