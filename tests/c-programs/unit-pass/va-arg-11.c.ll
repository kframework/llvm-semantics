; ModuleID = './va-arg-11.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 (i32, ...) @foo(i32 5, i32 4, i32 3, i32 2, i32 1, i32 0)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %7 = load i32, i32* %1
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define internal i32 @foo(i32 %a, ...) #0 {
  %1 = alloca i32, align 4
  %va = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  %2 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %3 = bitcast %struct.__va_list_tag* %2 to i8*
  call void @llvm.va_start(i8* %3)
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %26, %0
  %5 = load i32, i32* %i, align 4
  %6 = icmp slt i32 %5, 4
  br i1 %6, label %7, label %29

; <label>:7                                       ; preds = %4
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %9 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %8, i32 0, i32 0
  %10 = load i32, i32* %9
  %11 = icmp ule i32 %10, 40
  br i1 %11, label %12, label %18

; <label>:12                                      ; preds = %7
  %13 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %8, i32 0, i32 3
  %14 = load i8*, i8** %13
  %15 = getelementptr i8, i8* %14, i32 %10
  %16 = bitcast i8* %15 to i32*
  %17 = add i32 %10, 8
  store i32 %17, i32* %9
  br label %23

; <label>:18                                      ; preds = %7
  %19 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %8, i32 0, i32 2
  %20 = load i8*, i8** %19
  %21 = bitcast i8* %20 to i32*
  %22 = getelementptr i8, i8* %20, i32 8
  store i8* %22, i8** %19
  br label %23

; <label>:23                                      ; preds = %18, %12
  %24 = phi i32* [ %16, %12 ], [ %21, %18 ]
  %25 = load i32, i32* %24
  br label %26

; <label>:26                                      ; preds = %23
  %27 = load i32, i32* %i, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %i, align 4
  br label %4

; <label>:29                                      ; preds = %4
  %30 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %31 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %30, i32 0, i32 0
  %32 = load i32, i32* %31
  %33 = icmp ule i32 %32, 40
  br i1 %33, label %34, label %40

; <label>:34                                      ; preds = %29
  %35 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %30, i32 0, i32 3
  %36 = load i8*, i8** %35
  %37 = getelementptr i8, i8* %36, i32 %32
  %38 = bitcast i8* %37 to i32*
  %39 = add i32 %32, 8
  store i32 %39, i32* %31
  br label %45

; <label>:40                                      ; preds = %29
  %41 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %30, i32 0, i32 2
  %42 = load i8*, i8** %41
  %43 = bitcast i8* %42 to i32*
  %44 = getelementptr i8, i8* %42, i32 8
  store i8* %44, i8** %41
  br label %45

; <label>:45                                      ; preds = %40, %34
  %46 = phi i32* [ %38, %34 ], [ %43, %40 ]
  %47 = load i32, i32* %46
  store i32 %47, i32* %res, align 4
  %48 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %va, i32 0, i32 0
  %49 = bitcast %struct.__va_list_tag* %48 to i8*
  call void @llvm.va_end(i8* %49)
  %50 = load i32, i32* %res, align 4
  ret i32 %50
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
