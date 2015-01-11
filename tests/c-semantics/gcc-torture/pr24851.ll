; ModuleID = './pr24851.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [10 x i32], align 16
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds [10 x i32]* %a, i32 0, i64 1
  store i32* %2, i32** %q, align 8
  %3 = load i32** %q, align 8
  %4 = getelementptr inbounds i32* %3, i64 -1
  store i32* %4, i32** %p, align 8
  %5 = load i32** %p, align 8
  %6 = getelementptr inbounds [10 x i32]* %a, i32 0, i64 9
  %7 = icmp uge i32* %5, %6
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
