; ModuleID = './20031011-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %ll_bitsize = alloca i32, align 4
  %ll_bitpos = alloca i32, align 4
  %rl_bitsize = alloca i32, align 4
  %rl_bitpos = alloca i32, align 4
  %end_bit = alloca i32, align 4
  store i32 0, i32* %1
  store i32 32, i32* %ll_bitpos, align 4
  store i32 32, i32* %ll_bitsize, align 4
  store i32 0, i32* %rl_bitpos, align 4
  store i32 32, i32* %rl_bitsize, align 4
  %2 = load i32* %ll_bitpos, align 4
  %3 = load i32* %ll_bitsize, align 4
  %4 = add nsw i32 %2, %3
  %5 = load i32* %rl_bitpos, align 4
  %6 = load i32* %rl_bitsize, align 4
  %7 = add nsw i32 %5, %6
  %8 = icmp sgt i32 %4, %7
  br i1 %8, label %9, label %13

; <label>:9                                       ; preds = %0
  %10 = load i32* %ll_bitpos, align 4
  %11 = load i32* %ll_bitsize, align 4
  %12 = add nsw i32 %10, %11
  br label %17

; <label>:13                                      ; preds = %0
  %14 = load i32* %rl_bitpos, align 4
  %15 = load i32* %rl_bitsize, align 4
  %16 = add nsw i32 %14, %15
  br label %17

; <label>:17                                      ; preds = %13, %9
  %18 = phi i32 [ %12, %9 ], [ %16, %13 ]
  store i32 %18, i32* %end_bit, align 4
  %19 = load i32* %end_bit, align 4
  %20 = icmp ne i32 %19, 64
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:22                                      ; preds = %17
  %23 = load i32* %rl_bitpos, align 4
  %24 = load i32* %rl_bitsize, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32* %ll_bitpos, align 4
  %27 = load i32* %ll_bitsize, align 4
  %28 = add nsw i32 %26, %27
  %29 = icmp sgt i32 %25, %28
  br i1 %29, label %30, label %34

; <label>:30                                      ; preds = %22
  %31 = load i32* %rl_bitpos, align 4
  %32 = load i32* %rl_bitsize, align 4
  %33 = add nsw i32 %31, %32
  br label %38

; <label>:34                                      ; preds = %22
  %35 = load i32* %ll_bitpos, align 4
  %36 = load i32* %ll_bitsize, align 4
  %37 = add nsw i32 %35, %36
  br label %38

; <label>:38                                      ; preds = %34, %30
  %39 = phi i32 [ %33, %30 ], [ %37, %34 ]
  store i32 %39, i32* %end_bit, align 4
  %40 = load i32* %end_bit, align 4
  %41 = icmp ne i32 %40, 64
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %38
  call void @abort() #2
  unreachable

; <label>:43                                      ; preds = %38
  %44 = load i32* %ll_bitpos, align 4
  %45 = load i32* %ll_bitsize, align 4
  %46 = add nsw i32 %44, %45
  %47 = load i32* %rl_bitpos, align 4
  %48 = load i32* %rl_bitsize, align 4
  %49 = add nsw i32 %47, %48
  %50 = icmp slt i32 %46, %49
  br i1 %50, label %51, label %55

; <label>:51                                      ; preds = %43
  %52 = load i32* %ll_bitpos, align 4
  %53 = load i32* %ll_bitsize, align 4
  %54 = add nsw i32 %52, %53
  br label %59

; <label>:55                                      ; preds = %43
  %56 = load i32* %rl_bitpos, align 4
  %57 = load i32* %rl_bitsize, align 4
  %58 = add nsw i32 %56, %57
  br label %59

; <label>:59                                      ; preds = %55, %51
  %60 = phi i32 [ %54, %51 ], [ %58, %55 ]
  store i32 %60, i32* %end_bit, align 4
  %61 = load i32* %end_bit, align 4
  %62 = icmp ne i32 %61, 32
  br i1 %62, label %63, label %64

; <label>:63                                      ; preds = %59
  call void @abort() #2
  unreachable

; <label>:64                                      ; preds = %59
  %65 = load i32* %rl_bitpos, align 4
  %66 = load i32* %rl_bitsize, align 4
  %67 = add nsw i32 %65, %66
  %68 = load i32* %ll_bitpos, align 4
  %69 = load i32* %ll_bitsize, align 4
  %70 = add nsw i32 %68, %69
  %71 = icmp slt i32 %67, %70
  br i1 %71, label %72, label %76

; <label>:72                                      ; preds = %64
  %73 = load i32* %rl_bitpos, align 4
  %74 = load i32* %rl_bitsize, align 4
  %75 = add nsw i32 %73, %74
  br label %80

; <label>:76                                      ; preds = %64
  %77 = load i32* %ll_bitpos, align 4
  %78 = load i32* %ll_bitsize, align 4
  %79 = add nsw i32 %77, %78
  br label %80

; <label>:80                                      ; preds = %76, %72
  %81 = phi i32 [ %75, %72 ], [ %79, %76 ]
  store i32 %81, i32* %end_bit, align 4
  %82 = load i32* %end_bit, align 4
  %83 = icmp ne i32 %82, 32
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %80
  call void @abort() #2
  unreachable

; <label>:85                                      ; preds = %80
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
