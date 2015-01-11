; ModuleID = './920721-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @ru(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* %1, align 4
  %4 = trunc i32 %2 to i16
  %5 = call i32 @fu(i16 zeroext %4)
  %6 = icmp ne i32 %5, 5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:8                                       ; preds = %0
  %9 = load i32* %1, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %1, align 4
  %11 = trunc i32 %10 to i16
  %12 = call i32 @fu(i16 zeroext %11)
  %13 = icmp ne i32 %12, 7
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %8
  call void @abort() #3
  unreachable

; <label>:15                                      ; preds = %8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @fu(i16 zeroext %data) #1 {
  %1 = alloca i16, align 2
  store i16 %data, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = zext i16 %2 to i32
  ret i32 %3
}

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: nounwind uwtable
define void @rs(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* %1, align 4
  %4 = trunc i32 %2 to i16
  %5 = call i32 @fs(i16 signext %4)
  %6 = icmp ne i32 %5, 5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:8                                       ; preds = %0
  %9 = load i32* %1, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %1, align 4
  %11 = trunc i32 %10 to i16
  %12 = call i32 @fs(i16 signext %11)
  %13 = icmp ne i32 %12, 7
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %8
  call void @abort() #3
  unreachable

; <label>:15                                      ; preds = %8
  ret void
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @fs(i16 signext %data) #1 {
  %1 = alloca i16, align 2
  store i16 %data, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = sext i16 %2 to i32
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @ru(i32 5)
  call void @rs(i32 5)
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
