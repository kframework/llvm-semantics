; ModuleID = './960802-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@val = global i64 1577058304, align 8

; Function Attrs: nounwind uwtable
define i64 @f1() #0 {
  ret i64 306
}

; Function Attrs: nounwind uwtable
define i64 @f2() #0 {
  ret i64 1577058304
}

; Function Attrs: nounwind uwtable
define void @f3(i64 %b) #0 {
  %1 = alloca i64, align 8
  store i64 %b, i64* %1, align 8
  %2 = load i64* %1, align 8
  store i64 %2, i64* @val, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @f4() #0 {
  %v = alloca i64, align 8
  %o = alloca i64, align 8
  %1 = call i64 @f1()
  store i64 %1, i64* %v, align 8
  %2 = call i64 @f2()
  store i64 %2, i64* %o, align 8
  %3 = load i64* %v, align 8
  %4 = and i64 %3, 16777215
  %5 = load i64* %o, align 8
  %6 = and i64 %5, 4278190080
  %7 = or i64 %4, %6
  store i64 %7, i64* %v, align 8
  %8 = load i64* %v, align 8
  call void @f3(i64 %8)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @f4()
  %2 = load i64* @val, align 8
  %3 = icmp ne i64 %2, 1577058610
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
