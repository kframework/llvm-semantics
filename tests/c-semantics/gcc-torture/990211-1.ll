; ModuleID = './990211-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @func(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp slt i32 %2, 0
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4
  %6 = icmp sge i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %4, %0
  %9 = load i32* %1, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %15

; <label>:11                                      ; preds = %8
  %12 = load i32* %1, align 4
  %13 = icmp sle i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %11, %8
  %16 = load i32* %1, align 4
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %22

; <label>:18                                      ; preds = %15
  %19 = load i32* %1, align 4
  %20 = icmp slt i32 %19, 0
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  call void @abort() #2
  unreachable

; <label>:22                                      ; preds = %18, %15
  %23 = load i32* %1, align 4
  %24 = icmp sle i32 %23, 0
  br i1 %24, label %25, label %29

; <label>:25                                      ; preds = %22
  %26 = load i32* %1, align 4
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %25, %22
  %30 = load i32* %1, align 4
  %31 = icmp slt i32 %30, 77
  br i1 %31, label %32, label %36

; <label>:32                                      ; preds = %29
  %33 = load i32* %1, align 4
  %34 = icmp sge i32 %33, 77
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %32
  call void @abort() #2
  unreachable

; <label>:36                                      ; preds = %32, %29
  %37 = load i32* %1, align 4
  %38 = icmp sgt i32 %37, 77
  br i1 %38, label %39, label %43

; <label>:39                                      ; preds = %36
  %40 = load i32* %1, align 4
  %41 = icmp sle i32 %40, 77
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %39
  call void @abort() #2
  unreachable

; <label>:43                                      ; preds = %39, %36
  %44 = load i32* %1, align 4
  %45 = icmp sge i32 %44, 77
  br i1 %45, label %46, label %50

; <label>:46                                      ; preds = %43
  %47 = load i32* %1, align 4
  %48 = icmp slt i32 %47, 77
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %46
  call void @abort() #2
  unreachable

; <label>:50                                      ; preds = %46, %43
  %51 = load i32* %1, align 4
  %52 = icmp sle i32 %51, 77
  br i1 %52, label %53, label %57

; <label>:53                                      ; preds = %50
  %54 = load i32* %1, align 4
  %55 = icmp sgt i32 %54, 77
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %53
  call void @abort() #2
  unreachable

; <label>:57                                      ; preds = %53, %50
  %58 = load i32* %1, align 4
  %59 = icmp slt i32 %58, 0
  br i1 %59, label %64, label %60

; <label>:60                                      ; preds = %57
  %61 = load i32* %1, align 4
  %62 = icmp sge i32 %61, 0
  br i1 %62, label %64, label %63

; <label>:63                                      ; preds = %60
  call void @abort() #2
  unreachable

; <label>:64                                      ; preds = %60, %57
  %65 = load i32* %1, align 4
  %66 = icmp sgt i32 %65, 0
  br i1 %66, label %71, label %67

; <label>:67                                      ; preds = %64
  %68 = load i32* %1, align 4
  %69 = icmp sle i32 %68, 0
  br i1 %69, label %71, label %70

; <label>:70                                      ; preds = %67
  call void @abort() #2
  unreachable

; <label>:71                                      ; preds = %67, %64
  %72 = load i32* %1, align 4
  %73 = icmp sge i32 %72, 0
  br i1 %73, label %78, label %74

; <label>:74                                      ; preds = %71
  %75 = load i32* %1, align 4
  %76 = icmp slt i32 %75, 0
  br i1 %76, label %78, label %77

; <label>:77                                      ; preds = %74
  call void @abort() #2
  unreachable

; <label>:78                                      ; preds = %74, %71
  %79 = load i32* %1, align 4
  %80 = icmp sle i32 %79, 0
  br i1 %80, label %85, label %81

; <label>:81                                      ; preds = %78
  %82 = load i32* %1, align 4
  %83 = icmp sgt i32 %82, 0
  br i1 %83, label %85, label %84

; <label>:84                                      ; preds = %81
  call void @abort() #2
  unreachable

; <label>:85                                      ; preds = %81, %78
  %86 = load i32* %1, align 4
  %87 = icmp slt i32 %86, 77
  br i1 %87, label %92, label %88

; <label>:88                                      ; preds = %85
  %89 = load i32* %1, align 4
  %90 = icmp sge i32 %89, 77
  br i1 %90, label %92, label %91

; <label>:91                                      ; preds = %88
  call void @abort() #2
  unreachable

; <label>:92                                      ; preds = %88, %85
  %93 = load i32* %1, align 4
  %94 = icmp sgt i32 %93, 77
  br i1 %94, label %99, label %95

; <label>:95                                      ; preds = %92
  %96 = load i32* %1, align 4
  %97 = icmp sle i32 %96, 77
  br i1 %97, label %99, label %98

; <label>:98                                      ; preds = %95
  call void @abort() #2
  unreachable

; <label>:99                                      ; preds = %95, %92
  %100 = load i32* %1, align 4
  %101 = icmp sge i32 %100, 77
  br i1 %101, label %106, label %102

; <label>:102                                     ; preds = %99
  %103 = load i32* %1, align 4
  %104 = icmp slt i32 %103, 77
  br i1 %104, label %106, label %105

; <label>:105                                     ; preds = %102
  call void @abort() #2
  unreachable

; <label>:106                                     ; preds = %102, %99
  %107 = load i32* %1, align 4
  %108 = icmp sle i32 %107, 77
  br i1 %108, label %113, label %109

; <label>:109                                     ; preds = %106
  %110 = load i32* %1, align 4
  %111 = icmp sgt i32 %110, 77
  br i1 %111, label %113, label %112

; <label>:112                                     ; preds = %109
  call void @abort() #2
  unreachable

; <label>:113                                     ; preds = %109, %106
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @func(i32 0)
  call void @func(i32 1)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
