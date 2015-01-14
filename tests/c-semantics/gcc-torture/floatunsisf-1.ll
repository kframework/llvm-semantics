; ModuleID = './floatunsisf-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@u = global i32 -2147483519, align 4
@f1 = common global float 0.000000e+00, align 4
@f2 = common global float 0.000000e+00, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load volatile i32* @u, align 4
  %3 = uitofp i32 %2 to float
  store volatile float %3, float* @f1, align 4
  store volatile float 0x41E0000020000000, float* @f2, align 4
  %4 = load volatile float* @f1, align 4
  %5 = load volatile float* @f2, align 4
  %6 = fcmp une float %4, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %10 = load i32* %1
  ret i32 %10
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
