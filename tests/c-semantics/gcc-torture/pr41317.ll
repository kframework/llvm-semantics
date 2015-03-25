; ModuleID = './pr41317.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { i32 }
%struct.B = type { %struct.A, i32 }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca %struct.A, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  store i32 0, i32* %2, align 4
  %3 = bitcast %struct.A* %a to %struct.B*
  call void @foo(%struct.B* %3)
  %4 = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %5 = load i32* %4, align 4
  %6 = icmp ne i32 %5, 1
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @foo(%struct.B* %p) #0 {
  %1 = alloca %struct.B*, align 8
  store %struct.B* %p, %struct.B** %1, align 8
  %2 = load %struct.B** %1, align 8
  %3 = bitcast %struct.B* %2 to %struct.A*
  %4 = getelementptr inbounds %struct.A* %3, i32 0, i32 0
  store i32 1, i32* %4, align 4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
