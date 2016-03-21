; ModuleID = './20000603-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s1 = type { double }
%struct.s2 = type { double }
%union.u = type { %struct.s1 }

; Function Attrs: nounwind uwtable
define double @f(%struct.s1* %a, %struct.s2* %b) #0 {
  %1 = alloca %struct.s1*, align 8
  %2 = alloca %struct.s2*, align 8
  store %struct.s1* %a, %struct.s1** %1, align 8
  store %struct.s2* %b, %struct.s2** %2, align 8
  %3 = load %struct.s1*, %struct.s1** %1, align 8
  %4 = getelementptr inbounds %struct.s1, %struct.s1* %3, i32 0, i32 0
  store double 1.000000e+00, double* %4, align 8
  %5 = load %struct.s2*, %struct.s2** %2, align 8
  %6 = getelementptr inbounds %struct.s2, %struct.s2* %5, i32 0, i32 0
  %7 = load double, double* %6, align 8
  %8 = fadd double %7, 1.000000e+00
  ret double %8
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %union.u, align 8
  store i32 0, i32* %1
  %2 = bitcast %union.u* %a to %struct.s1*
  %3 = getelementptr inbounds %struct.s1, %struct.s1* %2, i32 0, i32 0
  store double 0.000000e+00, double* %3, align 8
  %4 = bitcast %union.u* %a to %struct.s1*
  %5 = bitcast %union.u* %a to %struct.s2*
  %6 = call double @f(%struct.s1* %4, %struct.s2* %5)
  %7 = fcmp une double %6, 2.000000e+00
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
