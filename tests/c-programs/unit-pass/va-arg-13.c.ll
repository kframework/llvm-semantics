; ModuleID = './va-arg-13.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct.ScanfState = type { i8*, [1 x %struct.__va_list_tag], i32 }

; Function Attrs: nounwind uwtable
define void @dummy(%struct.__va_list_tag* %vap) #0 {
  %1 = alloca %struct.__va_list_tag*, align 8
  store %struct.__va_list_tag* %vap, %struct.__va_list_tag** %1, align 8
  %2 = load %struct.__va_list_tag*, %struct.__va_list_tag** %1, align 8
  %3 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i32 0, i32 0
  %4 = load i32, i32* %3
  %5 = icmp ule i32 %4, 40
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i32 0, i32 3
  %8 = load i8*, i8** %7
  %9 = getelementptr i8, i8* %8, i32 %4
  %10 = bitcast i8* %9 to i32*
  %11 = add i32 %4, 8
  store i32 %11, i32* %3
  br label %17

; <label>:12                                      ; preds = %0
  %13 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i32 0, i32 2
  %14 = load i8*, i8** %13
  %15 = bitcast i8* %14 to i32*
  %16 = getelementptr i8, i8* %14, i32 8
  store i8* %16, i8** %13
  br label %17

; <label>:17                                      ; preds = %12, %6
  %18 = phi i32* [ %10, %6 ], [ %15, %12 ]
  %19 = load i32, i32* %18
  %20 = icmp ne i32 %19, 1234
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %17
  call void @abort() #3
  unreachable

; <label>:22                                      ; preds = %17
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @test(i32 %fmt, ...) #0 {
  %1 = alloca i32, align 4
  %state = alloca %struct.ScanfState, align 8
  %statep = alloca %struct.ScanfState*, align 8
  store i32 %fmt, i32* %1, align 4
  store %struct.ScanfState* %state, %struct.ScanfState** %statep, align 8
  %2 = load %struct.ScanfState*, %struct.ScanfState** %statep, align 8
  %3 = getelementptr inbounds %struct.ScanfState, %struct.ScanfState* %2, i32 0, i32 1
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i32 0, i32 0
  %5 = bitcast %struct.__va_list_tag* %4 to i8*
  call void @llvm.va_start(i8* %5)
  %6 = load %struct.ScanfState*, %struct.ScanfState** %statep, align 8
  %7 = getelementptr inbounds %struct.ScanfState, %struct.ScanfState* %6, i32 0, i32 1
  %8 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %7, i32 0, i32 0
  call void @dummy(%struct.__va_list_tag* %8)
  %9 = load %struct.ScanfState*, %struct.ScanfState** %statep, align 8
  %10 = getelementptr inbounds %struct.ScanfState, %struct.ScanfState* %9, i32 0, i32 1
  %11 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %10, i32 0, i32 0
  %12 = bitcast %struct.__va_list_tag* %11 to i8*
  call void @llvm.va_end(i8* %12)
  %13 = getelementptr inbounds %struct.ScanfState, %struct.ScanfState* %state, i32 0, i32 1
  %14 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %13, i32 0, i32 0
  %15 = bitcast %struct.__va_list_tag* %14 to i8*
  call void @llvm.va_start(i8* %15)
  %16 = getelementptr inbounds %struct.ScanfState, %struct.ScanfState* %state, i32 0, i32 1
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %16, i32 0, i32 0
  call void @dummy(%struct.__va_list_tag* %17)
  %18 = getelementptr inbounds %struct.ScanfState, %struct.ScanfState* %state, i32 0, i32 1
  %19 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %18, i32 0, i32 0
  %20 = bitcast %struct.__va_list_tag* %19 to i8*
  call void @llvm.va_end(i8* %20)
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
  call void (i32, ...) @test(i32 456, i32 1234)
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
