; ModuleID = './961122-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@acc = common global i64 0, align 8

; Function Attrs: nounwind uwtable
define void @addhi(i16 signext %a) #0 {
  %1 = alloca i16, align 2
  store i16 %a, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = sext i16 %2 to i64
  %4 = shl i64 %3, 32
  %5 = load i64* @acc, align 8
  %6 = add nsw i64 %5, %4
  store i64 %6, i64* @acc, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @subhi(i16 signext %a) #0 {
  %1 = alloca i16, align 2
  store i16 %a, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = sext i16 %2 to i64
  %4 = shl i64 %3, 32
  %5 = load i64* @acc, align 8
  %6 = sub nsw i64 %5, %4
  store i64 %6, i64* @acc, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i64 281470681743360, i64* @acc, align 8
  call void @addhi(i16 signext 1)
  %2 = load i64* @acc, align 8
  %3 = icmp ne i64 %2, 281474976710656
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @subhi(i16 signext 1)
  %6 = load i64* @acc, align 8
  %7 = icmp ne i64 %6, 281470681743360
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %11 = load i32* %1
  ret i32 %11
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
