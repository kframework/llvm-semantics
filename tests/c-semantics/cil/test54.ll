; ModuleID = './test54.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.precisionType = type { i32* }

; Function Attrs: nounwind uwtable
define void @pnorm(%struct.precisionType* %u) #0 {
  %1 = alloca %struct.precisionType*, align 8
  %uPtr = alloca i32*, align 8
  store %struct.precisionType* %u, %struct.precisionType** %1, align 8
  %2 = load %struct.precisionType** %1, align 8
  %3 = getelementptr inbounds %struct.precisionType* %2, i32 0, i32 0
  %4 = load i32** %3, align 8
  store i32* %4, i32** %uPtr, align 8
  br label %5

; <label>:5                                       ; preds = %12, %0
  %6 = load i32** %uPtr, align 8
  %7 = getelementptr inbounds i32* %6, i32 -1
  store i32* %7, i32** %uPtr, align 8
  %8 = load i32* %7, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %5
  br label %18

; <label>:11                                      ; preds = %5
  br label %12

; <label>:12                                      ; preds = %11
  %13 = load i32** %uPtr, align 8
  %14 = load %struct.precisionType** %1, align 8
  %15 = getelementptr inbounds %struct.precisionType* %14, i32 0, i32 0
  %16 = load i32** %15, align 8
  %17 = icmp ugt i32* %13, %16
  br i1 %17, label %5, label %18

; <label>:18                                      ; preds = %12, %10
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
