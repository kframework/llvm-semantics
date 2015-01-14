; ModuleID = './enums.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.globalStruct = type { i32 }

@.str = private unnamed_addr constant [9 x i8] c"*cp==%d\0A\00", align 1
@var = common global i32 0, align 4
@.str1 = private unnamed_addr constant [9 x i8] c"var==%d\0A\00", align 1
@aGlobalStruct = common global %struct.globalStruct zeroinitializer, align 4
@.str2 = private unnamed_addr constant [21 x i8] c"aGlobalStruct.a==%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %col = alloca i32, align 4
  %cp = alloca i32*, align 8
  %eint = alloca i32, align 4
  %echar = alloca i8, align 1
  %elli = alloca i64, align 8
  %foo = alloca i32, align 4
  %bar = alloca i32, align 4
  store i32 0, i32* %1
  store i32 20, i32* %col, align 4
  store i32* %col, i32** %cp, align 8
  %2 = load i32** %cp, align 8
  %3 = load i32* %2, align 4
  %4 = icmp ne i32 %3, 20
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %0
  %6 = load i32** %cp, align 8
  %7 = load i32* %6, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0), i32 %7)
  br label %9

; <label>:9                                       ; preds = %5, %0
  %10 = load i32* %col, align 4
  store i32 %10, i32* %eint, align 4
  %11 = load i32* %col, align 4
  %12 = trunc i32 %11 to i8
  store i8 %12, i8* %echar, align 1
  %13 = load i32* %col, align 4
  %14 = zext i32 %13 to i64
  store i64 %14, i64* %elli, align 8
  store i32 20, i32* %col, align 4
  store i32 20, i32* %col, align 4
  store i32 20, i32* %col, align 4
  store i32 20, i32* %foo, align 4
  store i32 20, i32* %bar, align 4
  store i32 21, i32* @var, align 4
  %15 = load i32* @var, align 4
  %16 = icmp ne i32 %15, 21
  br i1 %16, label %17, label %20

; <label>:17                                      ; preds = %9
  %18 = load i32* @var, align 4
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 %18)
  br label %20

; <label>:20                                      ; preds = %17, %9
  store i32 0, i32* getelementptr inbounds (%struct.globalStruct* @aGlobalStruct, i32 0, i32 0), align 4
  %21 = load i32* getelementptr inbounds (%struct.globalStruct* @aGlobalStruct, i32 0, i32 0), align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %20
  %24 = load i32* getelementptr inbounds (%struct.globalStruct* @aGlobalStruct, i32 0, i32 0), align 4
  %25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0), i32 %24)
  br label %26

; <label>:26                                      ; preds = %23, %20
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
