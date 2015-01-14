; ModuleID = './20000605-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.F = type { i32, i32 }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %timeout = alloca i32, align 4
  %x = alloca i32, align 4
  %i = alloca %struct.F, align 4
  store i32 0, i32* %1
  store i32 0, i32* %timeout, align 4
  store i32 0, i32* %x, align 4
  br label %2

; <label>:2                                       ; preds = %0, %16
  %3 = getelementptr inbounds %struct.F* %i, i32 0, i32 0
  %4 = load i32* %x, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %x, align 4
  store i32 %4, i32* %3, align 4
  %6 = getelementptr inbounds %struct.F* %i, i32 0, i32 1
  store i32 0, i32* %6, align 4
  %7 = getelementptr inbounds %struct.F* %i, i32 0, i32 0
  %8 = load i32* %7, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %2
  br label %17

; <label>:11                                      ; preds = %2
  %12 = load i32* %timeout, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %timeout, align 4
  %14 = icmp sgt i32 %13, 5
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %11
  br label %18

; <label>:16                                      ; preds = %11
  br label %2

; <label>:17                                      ; preds = %10
  ret i32 0

; <label>:18                                      ; preds = %15
  call void @abort() #2
  unreachable
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
