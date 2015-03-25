; ModuleID = './pr36093.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Foo = type { [4 x %struct.Bar], [124 x i8] }
%struct.Bar = type { [129 x i8] }

@foo = common global [4 x %struct.Foo] zeroinitializer, align 128

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %foop = alloca %struct.Foo*, align 8
  %bar = alloca %struct.Bar*, align 8
  store i32 0, i32* %1
  store %struct.Foo* getelementptr inbounds ([4 x %struct.Foo]* @foo, i32 0, i64 0), %struct.Foo** %foop, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %27, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 4
  br i1 %4, label %5, label %30

; <label>:5                                       ; preds = %2
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = load %struct.Foo** %foop, align 8
  %9 = getelementptr inbounds %struct.Foo* %8, i32 0, i32 0
  %10 = getelementptr inbounds [4 x %struct.Bar]* %9, i32 0, i64 %7
  store %struct.Bar* %10, %struct.Bar** %bar, align 8
  store i32 0, i32* %j, align 4
  br label %11

; <label>:11                                      ; preds = %23, %5
  %12 = load i32* %j, align 4
  %13 = icmp slt i32 %12, 129
  br i1 %13, label %14, label %26

; <label>:14                                      ; preds = %11
  %15 = load i32* %i, align 4
  %16 = add nsw i32 97, %15
  %17 = trunc i32 %16 to i8
  %18 = load i32* %j, align 4
  %19 = sext i32 %18 to i64
  %20 = load %struct.Bar** %bar, align 8
  %21 = getelementptr inbounds %struct.Bar* %20, i32 0, i32 0
  %22 = getelementptr inbounds [129 x i8]* %21, i32 0, i64 %19
  store i8 %17, i8* %22, align 1
  br label %23

; <label>:23                                      ; preds = %14
  %24 = load i32* %j, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %j, align 4
  br label %11

; <label>:26                                      ; preds = %11
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i32* %i, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %i, align 4
  br label %2

; <label>:30                                      ; preds = %2
  %31 = load i8* getelementptr inbounds ([4 x %struct.Foo]* @foo, i32 0, i64 0, i32 0, i64 3, i32 0, i64 128), align 1
  %32 = sext i8 %31 to i32
  %33 = icmp ne i32 %32, 100
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %30
  call void @abort() #2
  unreachable

; <label>:35                                      ; preds = %30
  ret i32 0
}

; Function Attrs: noreturn
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
