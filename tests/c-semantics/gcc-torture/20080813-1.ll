; ModuleID = './20080813-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @foo(i16 zeroext %x) #0 {
  %1 = alloca i16, align 2
  %y = alloca i8, align 1
  store i16 %x, i16* %1, align 2
  store i8 -1, i8* %y, align 1
  %2 = load i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = load i8* %y, align 1
  %5 = sext i8 %4 to i32
  %6 = icmp eq i32 %3, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @bar(i16 zeroext %x) #0 {
  %1 = alloca i16, align 2
  %y = alloca i8, align 1
  store i16 %x, i16* %1, align 2
  store i8 -1, i8* %y, align 1
  %2 = load i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = load i8* %y, align 1
  %5 = zext i8 %4 to i32
  %6 = icmp eq i32 %3, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo(i16 zeroext -1)
  call void @bar(i16 zeroext -1)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
