; ModuleID = './990525-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Test1 = type { [4 x i32] }

; Function Attrs: nounwind uwtable
define i32 @func1() #0 {
  %test = alloca %struct.Test1, align 4
  %1 = alloca %struct.Test1, align 4
  %2 = call { i64, i64 } @func2()
  %3 = getelementptr %struct.Test1* %1, i32 0, i32 0
  %4 = bitcast [4 x i32]* %3 to { i64, i64 }*
  %5 = getelementptr { i64, i64 }* %4, i32 0, i32 0
  %6 = extractvalue { i64, i64 } %2, 0
  store i64 %6, i64* %5, align 1
  %7 = getelementptr { i64, i64 }* %4, i32 0, i32 1
  %8 = extractvalue { i64, i64 } %2, 1
  store i64 %8, i64* %7, align 1
  %9 = bitcast %struct.Test1* %test to i8*
  %10 = bitcast %struct.Test1* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %10, i64 16, i32 4, i1 false)
  %11 = getelementptr inbounds %struct.Test1* %test, i32 0, i32 0
  %12 = getelementptr inbounds [4 x i32]* %11, i32 0, i64 0
  %13 = load i32* %12, align 4
  %14 = icmp ne i32 %13, 10
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %0
  call void @abort() #3
  unreachable

; <label>:16                                      ; preds = %0
  %17 = getelementptr inbounds %struct.Test1* %test, i32 0, i32 0
  %18 = getelementptr inbounds [4 x i32]* %17, i32 0, i64 1
  %19 = load i32* %18, align 4
  %20 = icmp ne i32 %19, 20
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %16
  call void @abort() #3
  unreachable

; <label>:22                                      ; preds = %16
  %23 = getelementptr inbounds %struct.Test1* %test, i32 0, i32 0
  %24 = getelementptr inbounds [4 x i32]* %23, i32 0, i64 2
  %25 = load i32* %24, align 4
  %26 = icmp ne i32 %25, 30
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %22
  call void @abort() #3
  unreachable

; <label>:28                                      ; preds = %22
  %29 = getelementptr inbounds %struct.Test1* %test, i32 0, i32 0
  %30 = getelementptr inbounds [4 x i32]* %29, i32 0, i64 3
  %31 = load i32* %30, align 4
  %32 = icmp ne i32 %31, 40
  br i1 %32, label %33, label %34

; <label>:33                                      ; preds = %28
  call void @abort() #3
  unreachable

; <label>:34                                      ; preds = %28
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define { i64, i64 } @func2() #0 {
  %1 = alloca %struct.Test1, align 4
  %tmp = alloca %struct.Test1, align 4
  %2 = getelementptr inbounds %struct.Test1* %tmp, i32 0, i32 0
  %3 = getelementptr inbounds [4 x i32]* %2, i32 0, i64 0
  store i32 10, i32* %3, align 4
  %4 = getelementptr inbounds %struct.Test1* %tmp, i32 0, i32 0
  %5 = getelementptr inbounds [4 x i32]* %4, i32 0, i64 1
  store i32 20, i32* %5, align 4
  %6 = getelementptr inbounds %struct.Test1* %tmp, i32 0, i32 0
  %7 = getelementptr inbounds [4 x i32]* %6, i32 0, i64 2
  store i32 30, i32* %7, align 4
  %8 = getelementptr inbounds %struct.Test1* %tmp, i32 0, i32 0
  %9 = getelementptr inbounds [4 x i32]* %8, i32 0, i64 3
  store i32 40, i32* %9, align 4
  %10 = bitcast %struct.Test1* %1 to i8*
  %11 = bitcast %struct.Test1* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %10, i8* %11, i64 16, i32 4, i1 false)
  %12 = getelementptr %struct.Test1* %1, i32 0, i32 0
  %13 = bitcast [4 x i32]* %12 to { i64, i64 }*
  %14 = load { i64, i64 }* %13, align 1
  ret { i64, i64 } %14
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @func1()
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %4 = load i32* %1
  ret i32 %4
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
