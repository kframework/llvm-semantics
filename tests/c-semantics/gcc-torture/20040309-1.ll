; ModuleID = './20040309-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @foo(i16 zeroext %x) #0 {
  %1 = alloca i16, align 2
  %y = alloca i16, align 2
  store i16 %x, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = icmp sgt i32 %3, 32767
  br i1 %4, label %5, label %9

; <label>:5                                       ; preds = %0
  %6 = load i16* %1, align 2
  %7 = zext i16 %6 to i32
  %8 = sub nsw i32 %7, 32768
  br label %10

; <label>:9                                       ; preds = %0
  br label %10

; <label>:10                                      ; preds = %9, %5
  %11 = phi i32 [ %8, %5 ], [ 0, %9 ]
  %12 = trunc i32 %11 to i16
  store i16 %12, i16* %y, align 2
  %13 = load i16* %y, align 2
  %14 = zext i16 %13 to i32
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo(i16 zeroext 0)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @foo(i16 zeroext 32767)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @foo(i16 zeroext -32768)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i32 @foo(i16 zeroext -32767)
  %15 = icmp ne i32 %14, 1
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  %18 = call i32 @foo(i16 zeroext -1)
  %19 = icmp ne i32 %18, 32767
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %17
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
