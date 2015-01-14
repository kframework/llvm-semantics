; ModuleID = './20051113-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Struct3 = type <{ i32, [0 x %union.Union] }>
%union.Union = type { %struct.Struct2 }
%struct.Struct2 = type <{ i16, i16, i16, i64, i64, i64 }>
%struct.Struct1 = type <{ i16, i16, i16, i64, i64 }>

; Function Attrs: noinline nounwind uwtable
define i64 @Sum(%struct.Struct3* %instrs) #0 {
  %1 = alloca %struct.Struct3*, align 8
  %count = alloca i64, align 8
  %i = alloca i32, align 4
  store %struct.Struct3* %instrs, %struct.Struct3** %1, align 8
  store i64 0, i64* %count, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %19, %0
  %3 = load i32* %i, align 4
  %4 = load %struct.Struct3** %1, align 8
  %5 = getelementptr inbounds %struct.Struct3* %4, i32 0, i32 0
  %6 = load i32* %5, align 1
  %7 = icmp slt i32 %3, %6
  br i1 %7, label %8, label %22

; <label>:8                                       ; preds = %2
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load %struct.Struct3** %1, align 8
  %12 = getelementptr inbounds %struct.Struct3* %11, i32 0, i32 1
  %13 = getelementptr inbounds [0 x %union.Union]* %12, i32 0, i64 %10
  %14 = bitcast %union.Union* %13 to %struct.Struct1*
  %15 = getelementptr inbounds %struct.Struct1* %14, i32 0, i32 3
  %16 = load i64* %15, align 1
  %17 = load i64* %count, align 8
  %18 = add i64 %17, %16
  store i64 %18, i64* %count, align 8
  br label %19

; <label>:19                                      ; preds = %8
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %2

; <label>:22                                      ; preds = %2
  %23 = load i64* %count, align 8
  ret i64 %23
}

; Function Attrs: noinline nounwind uwtable
define i64 @Sum2(%struct.Struct3* %instrs) #0 {
  %1 = alloca %struct.Struct3*, align 8
  %count = alloca i64, align 8
  %i = alloca i32, align 4
  store %struct.Struct3* %instrs, %struct.Struct3** %1, align 8
  store i64 0, i64* %count, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %19, %0
  %3 = load i32* %i, align 4
  %4 = load %struct.Struct3** %1, align 8
  %5 = getelementptr inbounds %struct.Struct3* %4, i32 0, i32 0
  %6 = load i32* %5, align 1
  %7 = icmp slt i32 %3, %6
  br i1 %7, label %8, label %22

; <label>:8                                       ; preds = %2
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load %struct.Struct3** %1, align 8
  %12 = getelementptr inbounds %struct.Struct3* %11, i32 0, i32 1
  %13 = getelementptr inbounds [0 x %union.Union]* %12, i32 0, i64 %10
  %14 = bitcast %union.Union* %13 to %struct.Struct1*
  %15 = getelementptr inbounds %struct.Struct1* %14, i32 0, i32 4
  %16 = load i64* %15, align 1
  %17 = load i64* %count, align 8
  %18 = add nsw i64 %17, %16
  store i64 %18, i64* %count, align 8
  br label %19

; <label>:19                                      ; preds = %8
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %2

; <label>:22                                      ; preds = %2
  %23 = load i64* %count, align 8
  ret i64 %23
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %p = alloca %struct.Struct3*, align 8
  store i32 0, i32* %1
  %2 = call noalias i8* @malloc(i64 94) #3
  %3 = bitcast i8* %2 to %struct.Struct3*
  store %struct.Struct3* %3, %struct.Struct3** %p, align 8
  %4 = load %struct.Struct3** %p, align 8
  %5 = bitcast %struct.Struct3* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 94, i32 1, i1 false)
  %6 = load %struct.Struct3** %p, align 8
  %7 = getelementptr inbounds %struct.Struct3* %6, i32 0, i32 0
  store i32 3, i32* %7, align 1
  %8 = load %struct.Struct3** %p, align 8
  %9 = getelementptr inbounds %struct.Struct3* %8, i32 0, i32 1
  %10 = getelementptr inbounds [0 x %union.Union]* %9, i32 0, i64 0
  %11 = bitcast %union.Union* %10 to %struct.Struct1*
  %12 = getelementptr inbounds %struct.Struct1* %11, i32 0, i32 3
  store i64 555, i64* %12, align 1
  %13 = load %struct.Struct3** %p, align 8
  %14 = getelementptr inbounds %struct.Struct3* %13, i32 0, i32 1
  %15 = getelementptr inbounds [0 x %union.Union]* %14, i32 0, i64 1
  %16 = bitcast %union.Union* %15 to %struct.Struct1*
  %17 = getelementptr inbounds %struct.Struct1* %16, i32 0, i32 3
  store i64 999, i64* %17, align 1
  %18 = load %struct.Struct3** %p, align 8
  %19 = getelementptr inbounds %struct.Struct3* %18, i32 0, i32 1
  %20 = getelementptr inbounds [0 x %union.Union]* %19, i32 0, i64 2
  %21 = bitcast %union.Union* %20 to %struct.Struct1*
  %22 = getelementptr inbounds %struct.Struct1* %21, i32 0, i32 3
  store i64 4311810305, i64* %22, align 1
  %23 = load %struct.Struct3** %p, align 8
  %24 = getelementptr inbounds %struct.Struct3* %23, i32 0, i32 1
  %25 = getelementptr inbounds [0 x %union.Union]* %24, i32 0, i64 0
  %26 = bitcast %union.Union* %25 to %struct.Struct1*
  %27 = getelementptr inbounds %struct.Struct1* %26, i32 0, i32 4
  store i64 555, i64* %27, align 1
  %28 = load %struct.Struct3** %p, align 8
  %29 = getelementptr inbounds %struct.Struct3* %28, i32 0, i32 1
  %30 = getelementptr inbounds [0 x %union.Union]* %29, i32 0, i64 1
  %31 = bitcast %union.Union* %30 to %struct.Struct1*
  %32 = getelementptr inbounds %struct.Struct1* %31, i32 0, i32 4
  store i64 999, i64* %32, align 1
  %33 = load %struct.Struct3** %p, align 8
  %34 = getelementptr inbounds %struct.Struct3* %33, i32 0, i32 1
  %35 = getelementptr inbounds [0 x %union.Union]* %34, i32 0, i64 2
  %36 = bitcast %union.Union* %35 to %struct.Struct1*
  %37 = getelementptr inbounds %struct.Struct1* %36, i32 0, i32 4
  store i64 4311810305, i64* %37, align 1
  %38 = load %struct.Struct3** %p, align 8
  %39 = call i64 @Sum(%struct.Struct3* %38)
  %40 = icmp ne i64 %39, 4311811859
  br i1 %40, label %41, label %42

; <label>:41                                      ; preds = %0
  call void @abort() #5
  unreachable

; <label>:42                                      ; preds = %0
  %43 = load %struct.Struct3** %p, align 8
  %44 = call i64 @Sum2(%struct.Struct3* %43)
  %45 = icmp ne i64 %44, 4311811859
  br i1 %45, label %46, label %47

; <label>:46                                      ; preds = %42
  call void @abort() #5
  unreachable

; <label>:47                                      ; preds = %42
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #3

; Function Attrs: noreturn nounwind
declare void @abort() #4

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
