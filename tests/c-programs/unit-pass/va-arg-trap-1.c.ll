; ModuleID = './va-arg-trap-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

@ap = common global [1 x %struct.__va_list_tag] zeroinitializer, align 16
@f = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define [1 x %struct.__va_list_tag]* @foo() #0 {
  %1 = alloca [1 x %struct.__va_list_tag]*, align 8
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %3 = load [1 x %struct.__va_list_tag]*, [1 x %struct.__va_list_tag]** %1
  ret [1 x %struct.__va_list_tag]* %3
}

; Function Attrs: noreturn
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define void @bar(i32 %i, ...) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  call void @llvm.va_start(i8* bitcast ([1 x %struct.__va_list_tag]* @ap to i8*))
  %2 = call [1 x %struct.__va_list_tag]* @foo()
  %3 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %2, i32 0, i32 0
  %4 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %3, i32 0, i32 1
  %5 = load i32, i32* %4
  %6 = icmp ule i32 %5, 160
  br i1 %6, label %7, label %13

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %3, i32 0, i32 3
  %9 = load i8*, i8** %8
  %10 = getelementptr i8, i8* %9, i32 %5
  %11 = bitcast i8* %10 to float*
  %12 = add i32 %5, 16
  store i32 %12, i32* %4
  br label %18

; <label>:13                                      ; preds = %0
  %14 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %3, i32 0, i32 2
  %15 = load i8*, i8** %14
  %16 = bitcast i8* %15 to float*
  %17 = getelementptr i8, i8* %15, i32 8
  store i8* %17, i8** %14
  br label %18

; <label>:18                                      ; preds = %13, %7
  %19 = phi float* [ %11, %7 ], [ %16, %13 ]
  %20 = load float, float* %19
  store float %20, float* @f, align 4
  call void @llvm.va_end(i8* bitcast ([1 x %struct.__va_list_tag]* @ap to i8*))
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
  call void (i32, ...) @bar(i32 1, i32 0)
  call void @abort() #3
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
