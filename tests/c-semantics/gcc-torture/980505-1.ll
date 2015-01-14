; ModuleID = './980505-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %f1 = alloca i32, align 4
  %f2 = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* %x, align 4
  %2 = load i32* %x, align 4
  %3 = call i32 @f(i32 %2) #3
  store i32 %3, i32* %f1, align 4
  store i32 2, i32* %x, align 4
  %4 = load i32* %x, align 4
  %5 = call i32 @f(i32 %4) #3
  store i32 %5, i32* %f2, align 4
  %6 = load i32* %f1, align 4
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %11, label %8

; <label>:8                                       ; preds = %0
  %9 = load i32* %f2, align 4
  %10 = icmp ne i32 %9, 2
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8, %0
  call void @abort() #4
  unreachable

; <label>:12                                      ; preds = %8
  call void @exit(i32 0) #4
  unreachable
                                                  ; No predecessors!
  %14 = load i32* %1
  ret i32 %14
}

; Function Attrs: nounwind readnone uwtable
define internal i32 @f(i32 %x) #1 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  ret i32 %2
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
