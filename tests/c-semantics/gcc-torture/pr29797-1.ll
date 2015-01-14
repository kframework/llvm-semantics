; ModuleID = './pr29797-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @bar() #0 {
  ret i32 32768
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %nStyle = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @bar()
  store i32 %2, i32* %nStyle, align 4
  %3 = load i32* %nStyle, align 4
  %4 = and i32 %3, 32768
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i32* %nStyle, align 4
  %8 = or i32 %7, 65536
  store i32 %8, i32* %nStyle, align 4
  br label %9

; <label>:9                                       ; preds = %6, %0
  %10 = load i32* %nStyle, align 4
  %11 = icmp ne i32 %10, 98304
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
