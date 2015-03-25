; ModuleID = './20010717-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %u = alloca i64, align 8
  %r1 = alloca i64, align 8
  %r2 = alloca i64, align 8
  store i32 0, i32* %1
  store i32 -16, i32* %i, align 4
  store i32 1, i32* %j, align 4
  %2 = load i32* %i, align 4
  %3 = load i32* %j, align 4
  %4 = add nsw i32 %2, %3
  %5 = sext i32 %4 to i64
  store i64 %5, i64* %u, align 8
  %6 = load i64* %u, align 8
  %7 = lshr i64 %6, 1
  store i64 %7, i64* %r1, align 8
  %8 = load i32* %i, align 4
  %9 = load i32* %j, align 4
  %10 = add nsw i32 %8, %9
  %11 = sext i32 %10 to i64
  %12 = lshr i64 %11, 1
  store i64 %12, i64* %r2, align 8
  %13 = load i64* %r1, align 8
  %14 = load i64* %r2, align 8
  %15 = icmp ne i64 %13, %14
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
