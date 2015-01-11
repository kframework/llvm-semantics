; ModuleID = './20000217-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define zeroext i16 @showbug(i16* %a, i16* %b) #0 {
  %1 = alloca i16*, align 8
  %2 = alloca i16*, align 8
  store i16* %a, i16** %1, align 8
  store i16* %b, i16** %2, align 8
  %3 = load i16** %2, align 8
  %4 = load i16* %3, align 2
  %5 = zext i16 %4 to i32
  %6 = sub nsw i32 %5, 8
  %7 = load i16** %1, align 8
  %8 = load i16* %7, align 2
  %9 = zext i16 %8 to i32
  %10 = add nsw i32 %9, %6
  %11 = trunc i32 %10 to i16
  store i16 %11, i16* %7, align 2
  %12 = load i16** %1, align 8
  %13 = load i16* %12, align 2
  %14 = zext i16 %13 to i32
  %15 = icmp sge i32 %14, 8
  %16 = zext i1 %15 to i32
  %17 = trunc i32 %16 to i16
  ret i16 %17
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i16, align 2
  %y = alloca i16, align 2
  store i32 0, i32* %1
  store i16 0, i16* %x, align 2
  store i16 10, i16* %y, align 2
  %2 = call zeroext i16 @showbug(i16* %x, i16* %y)
  %3 = zext i16 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i32* %1
  ret i32 %8
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
