; ModuleID = './testtrace.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.DummyStruct = type { %struct.DummyStruct*, i32 }

@.str = private unnamed_addr constant [28 x i8] c"&S1 = %p\09&S2 = %p\09&S3 = %p\0A\00", align 1
@testAllocaOrder.count = internal global i32 0, align 4
@.str1 = private unnamed_addr constant [10 x i8] c"sum = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"-d\00", align 1

; Function Attrs: nounwind uwtable
define i32 @AddCounts(%struct.DummyStruct* %S1, %struct.DummyStruct* %S2, %struct.DummyStruct* %S3, i32 %noPrint) #0 {
  %1 = alloca %struct.DummyStruct*, align 8
  %2 = alloca %struct.DummyStruct*, align 8
  %3 = alloca %struct.DummyStruct*, align 8
  %4 = alloca i32, align 4
  store %struct.DummyStruct* %S1, %struct.DummyStruct** %1, align 8
  store %struct.DummyStruct* %S2, %struct.DummyStruct** %2, align 8
  store %struct.DummyStruct* %S3, %struct.DummyStruct** %3, align 8
  store i32 %noPrint, i32* %4, align 4
  %5 = load i32* %4, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %12, label %7

; <label>:7                                       ; preds = %0
  %8 = load %struct.DummyStruct** %1, align 8
  %9 = load %struct.DummyStruct** %2, align 8
  %10 = load %struct.DummyStruct** %3, align 8
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str, i32 0, i32 0), %struct.DummyStruct* %8, %struct.DummyStruct* %9, %struct.DummyStruct* %10)
  br label %12

; <label>:12                                      ; preds = %7, %0
  %13 = load %struct.DummyStruct** %1, align 8
  %14 = getelementptr inbounds %struct.DummyStruct* %13, i32 0, i32 1
  %15 = load i32* %14, align 4
  %16 = load %struct.DummyStruct** %2, align 8
  %17 = getelementptr inbounds %struct.DummyStruct* %16, i32 0, i32 1
  %18 = load i32* %17, align 4
  %19 = add nsw i32 %15, %18
  %20 = load %struct.DummyStruct** %3, align 8
  %21 = getelementptr inbounds %struct.DummyStruct* %20, i32 0, i32 1
  %22 = load i32* %21, align 4
  %23 = add nsw i32 %19, %22
  ret i32 %23
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @testAllocaOrder(i32 %noPrint) #0 {
  %1 = alloca i32, align 4
  %S1 = alloca %struct.DummyStruct, align 8
  %S2 = alloca %struct.DummyStruct, align 8
  %S3 = alloca %struct.DummyStruct, align 8
  store i32 %noPrint, i32* %1, align 4
  %2 = load i32* @testAllocaOrder.count, align 4
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* @testAllocaOrder.count, align 4
  %4 = getelementptr inbounds %struct.DummyStruct* %S1, i32 0, i32 1
  store i32 %3, i32* %4, align 4
  %5 = load i32* @testAllocaOrder.count, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* @testAllocaOrder.count, align 4
  %7 = getelementptr inbounds %struct.DummyStruct* %S2, i32 0, i32 1
  store i32 %6, i32* %7, align 4
  %8 = load i32* @testAllocaOrder.count, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* @testAllocaOrder.count, align 4
  %10 = getelementptr inbounds %struct.DummyStruct* %S3, i32 0, i32 1
  store i32 %9, i32* %10, align 4
  %11 = load i32* %1, align 4
  %12 = call i32 @AddCounts(%struct.DummyStruct* %S1, %struct.DummyStruct* %S2, %struct.DummyStruct* %S3, i32 %11)
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str1, i32 0, i32 0), i32 %12)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %noPrint = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 1, i32* %noPrint, align 4
  %4 = load i32* %2, align 4
  %5 = icmp sgt i32 %4, 1
  br i1 %5, label %6, label %13

; <label>:6                                       ; preds = %0
  %7 = load i8*** %3, align 8
  %8 = getelementptr inbounds i8** %7, i64 1
  %9 = load i8** %8, align 8
  %10 = call i32 @strcmp(i8* %9, i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0))
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %13, label %12

; <label>:12                                      ; preds = %6
  store i32 0, i32* %noPrint, align 4
  br label %13

; <label>:13                                      ; preds = %12, %6, %0
  store i32 0, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %19, %13
  %15 = load i32* %i, align 4
  %16 = icmp ult i32 %15, 10
  br i1 %16, label %17, label %22

; <label>:17                                      ; preds = %14
  %18 = load i32* %noPrint, align 4
  call void @testAllocaOrder(i32 %18)
  br label %19

; <label>:19                                      ; preds = %17
  %20 = load i32* %i, align 4
  %21 = add i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %14

; <label>:22                                      ; preds = %14
  ret i32 0
}

declare i32 @strcmp(i8*, i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
