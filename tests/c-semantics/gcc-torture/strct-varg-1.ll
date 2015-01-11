; ModuleID = './strct-varg-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @f(i32 %attr, ...) #0 {
  %1 = alloca i32, align 4
  %va_values = alloca %struct.s, align 4
  %va = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  store i32 %attr, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  %4 = load i32* %1, align 4
  %5 = icmp ne i32 %4, 2
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %9 = getelementptr inbounds %struct.__va_list_tag* %8, i32 0, i32 0
  %10 = load i32* %9
  %11 = icmp ule i32 %10, 40
  br i1 %11, label %12, label %18

; <label>:12                                      ; preds = %7
  %13 = getelementptr inbounds %struct.__va_list_tag* %8, i32 0, i32 3
  %14 = load i8** %13
  %15 = getelementptr i8* %14, i32 %10
  %16 = bitcast i8* %15 to %struct.s*
  %17 = add i32 %10, 8
  store i32 %17, i32* %9
  br label %23

; <label>:18                                      ; preds = %7
  %19 = getelementptr inbounds %struct.__va_list_tag* %8, i32 0, i32 2
  %20 = load i8** %19
  %21 = bitcast i8* %20 to %struct.s*
  %22 = getelementptr i8* %20, i32 8
  store i8* %22, i8** %19
  br label %23

; <label>:23                                      ; preds = %18, %12
  %24 = phi %struct.s* [ %16, %12 ], [ %21, %18 ]
  %25 = bitcast %struct.s* %va_values to i8*
  %26 = bitcast %struct.s* %24 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %25, i8* %26, i64 8, i32 4, i1 false)
  %27 = getelementptr inbounds %struct.s* %va_values, i32 0, i32 0
  %28 = load i32* %27, align 4
  %29 = icmp ne i32 %28, 43690
  br i1 %29, label %34, label %30

; <label>:30                                      ; preds = %23
  %31 = getelementptr inbounds %struct.s* %va_values, i32 0, i32 1
  %32 = load i32* %31, align 4
  %33 = icmp ne i32 %32, 21845
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %30, %23
  call void @abort() #3
  unreachable

; <label>:35                                      ; preds = %30
  %36 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %37 = getelementptr inbounds %struct.__va_list_tag* %36, i32 0, i32 0
  %38 = load i32* %37
  %39 = icmp ule i32 %38, 40
  br i1 %39, label %40, label %46

; <label>:40                                      ; preds = %35
  %41 = getelementptr inbounds %struct.__va_list_tag* %36, i32 0, i32 3
  %42 = load i8** %41
  %43 = getelementptr i8* %42, i32 %38
  %44 = bitcast i8* %43 to i32*
  %45 = add i32 %38, 8
  store i32 %45, i32* %37
  br label %51

; <label>:46                                      ; preds = %35
  %47 = getelementptr inbounds %struct.__va_list_tag* %36, i32 0, i32 2
  %48 = load i8** %47
  %49 = bitcast i8* %48 to i32*
  %50 = getelementptr i8* %48, i32 8
  store i8* %50, i8** %47
  br label %51

; <label>:51                                      ; preds = %46, %40
  %52 = phi i32* [ %44, %40 ], [ %49, %46 ]
  %53 = load i32* %52
  store i32 %53, i32* %1, align 4
  %54 = load i32* %1, align 4
  %55 = icmp ne i32 %54, 3
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %51
  call void @abort() #3
  unreachable

; <label>:57                                      ; preds = %51
  %58 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %59 = getelementptr inbounds %struct.__va_list_tag* %58, i32 0, i32 0
  %60 = load i32* %59
  %61 = icmp ule i32 %60, 40
  br i1 %61, label %62, label %68

; <label>:62                                      ; preds = %57
  %63 = getelementptr inbounds %struct.__va_list_tag* %58, i32 0, i32 3
  %64 = load i8** %63
  %65 = getelementptr i8* %64, i32 %60
  %66 = bitcast i8* %65 to %struct.s*
  %67 = add i32 %60, 8
  store i32 %67, i32* %59
  br label %73

; <label>:68                                      ; preds = %57
  %69 = getelementptr inbounds %struct.__va_list_tag* %58, i32 0, i32 2
  %70 = load i8** %69
  %71 = bitcast i8* %70 to %struct.s*
  %72 = getelementptr i8* %70, i32 8
  store i8* %72, i8** %69
  br label %73

; <label>:73                                      ; preds = %68, %62
  %74 = phi %struct.s* [ %66, %62 ], [ %71, %68 ]
  %75 = bitcast %struct.s* %va_values to i8*
  %76 = bitcast %struct.s* %74 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %75, i8* %76, i64 8, i32 4, i1 false)
  %77 = getelementptr inbounds %struct.s* %va_values, i32 0, i32 0
  %78 = load i32* %77, align 4
  %79 = icmp ne i32 %78, 65535
  br i1 %79, label %84, label %80

; <label>:80                                      ; preds = %73
  %81 = getelementptr inbounds %struct.s* %va_values, i32 0, i32 1
  %82 = load i32* %81, align 4
  %83 = icmp ne i32 %82, 4369
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %80, %73
  call void @abort() #3
  unreachable

; <label>:85                                      ; preds = %80
  %86 = getelementptr inbounds [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %87 = bitcast %struct.__va_list_tag* %86 to i8*
  call void @llvm.va_end(i8* %87)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.s, align 4
  %b = alloca %struct.s, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.s* %a, i32 0, i32 0
  store i32 43690, i32* %2, align 4
  %3 = getelementptr inbounds %struct.s* %a, i32 0, i32 1
  store i32 21845, i32* %3, align 4
  %4 = getelementptr inbounds %struct.s* %b, i32 0, i32 0
  store i32 65535, i32* %4, align 4
  %5 = getelementptr inbounds %struct.s* %b, i32 0, i32 1
  store i32 4369, i32* %5, align 4
  %6 = bitcast %struct.s* %a to i64*
  %7 = load i64* %6, align 1
  %8 = bitcast %struct.s* %b to i64*
  %9 = load i64* %8, align 1
  call void (i32, ...)* @f(i32 2, i64 %7, i32 3, i64 %9)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %11 = load i32* %1
  ret i32 %11
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
