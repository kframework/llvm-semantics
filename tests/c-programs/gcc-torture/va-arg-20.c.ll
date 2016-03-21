; ModuleID = './va-arg-20.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

; Function Attrs: nounwind uwtable
define void @foo(%struct.__va_list_tag* %v) #0 {
  %1 = alloca %struct.__va_list_tag*, align 8
  %x = alloca i64, align 8
  store %struct.__va_list_tag* %v, %struct.__va_list_tag** %1, align 8
  %2 = load %struct.__va_list_tag*, %struct.__va_list_tag** %1, align 8
  %3 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i32 0, i32 0
  %4 = load i32, i32* %3
  %5 = icmp ule i32 %4, 40
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i32 0, i32 3
  %8 = load i8*, i8** %7
  %9 = getelementptr i8, i8* %8, i32 %4
  %10 = bitcast i8* %9 to i64*
  %11 = add i32 %4, 8
  store i32 %11, i32* %3
  br label %17

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i32 0, i32 2
  %14 = load i8*, i8** %13
  %15 = bitcast i8* %14 to i64*
  %16 = getelementptr i8, i8* %14, i32 8
  store i8* %16, i8** %13
  br label %17

; <label>:17                                      ; preds = %12, %6
  %18 = phi i64* [ %10, %6 ], [ %15, %12 ]
  %19 = load i64, i64* %18
  store i64 %19, i64* %x, align 8
  %20 = load i64, i64* %x, align 8
  %21 = icmp ne i64 %20, 16
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %17
  call void @abort() #3
  unreachable

; <label>:23                                      ; preds = %17
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @bar(i8 signext %c, i8 signext %d, ...) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  %v = alloca [1 x %struct.__va_list_tag], align 16
  store i8 %c, i8* %1, align 1
  store i8 %d, i8* %2, align 1
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %v, i32 0, i32 0
  %4 = bitcast %struct.__va_list_tag* %3 to i8*
  call void @llvm.va_start(i8* %4)
  %5 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %v, i32 0, i32 0
  call void @foo(%struct.__va_list_tag* %5)
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %v, i32 0, i32 0
  %7 = bitcast %struct.__va_list_tag* %6 to i8*
  call void @llvm.va_end(i8* %7)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #2

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void (i8, i8, ...) @bar(i8 signext 0, i8 signext 0, i64 16)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
