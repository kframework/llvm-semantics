; ModuleID = './arith-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @sat_add(i32 %i) #0 {
  %1 = alloca i32, align 4
  %ret = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = add i32 %2, 1
  store i32 %3, i32* %ret, align 4
  %4 = load i32* %ret, align 4
  %5 = load i32* %1, align 4
  %6 = icmp ult i32 %4, %5
  br i1 %6, label %7, label %9

; <label>:7                                       ; preds = %0
  %8 = load i32* %1, align 4
  store i32 %8, i32* %ret, align 4
  br label %9

; <label>:9                                       ; preds = %7, %0
  %10 = load i32* %ret, align 4
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @sat_add(i32 -1)
  %3 = icmp ne i32 %2, -1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
