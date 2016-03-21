; ModuleID = './c1x-6-5-2-3-9.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.anon = type { %struct.anon.1 }
%struct.anon.1 = type { i32, double }
%struct.anon = type { i32 }

@u = common global %union.anon zeroinitializer, align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* getelementptr inbounds (%union.anon, %union.anon* @u, i32 0, i32 0, i32 0), align 4
  store double 3.140000e+00, double* getelementptr inbounds (%union.anon, %union.anon* @u, i32 0, i32 0, i32 1), align 8
  %2 = load i32, i32* getelementptr inbounds (%struct.anon, %struct.anon* bitcast (%union.anon* @u to %struct.anon*), i32 0, i32 0), align 4
  %3 = icmp eq i32 %2, 1
  br i1 %3, label %4, label %9

; <label>:4                                       ; preds = %0
  %5 = load double, double* getelementptr inbounds (%union.anon, %union.anon* @u, i32 0, i32 0, i32 1), align 8
  %6 = fcmp ogt double %5, 3.000000e+00
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4
  store i32 1, i32* %1
  br label %10

; <label>:8                                       ; preds = %4
  br label %9

; <label>:9                                       ; preds = %8, %0
  store i32 0, i32* %1
  br label %10

; <label>:10                                      ; preds = %9, %7
  %11 = load i32, i32* %1
  ret i32 %11
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
