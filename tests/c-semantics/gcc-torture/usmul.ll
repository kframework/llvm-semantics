; ModuleID = './usmul.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @foo(i16 signext %x, i16 zeroext %y) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %x, i16* %1, align 2
  store i16 %y, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i32
  %7 = mul nsw i32 %4, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define i32 @bar(i16 zeroext %x, i16 signext %y) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %x, i16* %1, align 2
  store i16 %y, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = mul nsw i32 %4, %6
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo(i16 signext -2, i16 zeroext -1)
  %3 = icmp ne i32 %2, -131070
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @foo(i16 signext 2, i16 zeroext -1)
  %7 = icmp ne i32 %6, 131070
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @foo(i16 signext -32768, i16 zeroext -32768)
  %11 = icmp ne i32 %10, -1073741824
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #3
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i32 @foo(i16 signext 32767, i16 zeroext -32768)
  %15 = icmp ne i32 %14, 1073709056
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %13
  %18 = call i32 @bar(i16 zeroext -1, i16 signext -2)
  %19 = icmp ne i32 %18, -131070
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #3
  unreachable

; <label>:21                                      ; preds = %17
  %22 = call i32 @bar(i16 zeroext -1, i16 signext 2)
  %23 = icmp ne i32 %22, 131070
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #3
  unreachable

; <label>:25                                      ; preds = %21
  %26 = call i32 @bar(i16 zeroext -32768, i16 signext -32768)
  %27 = icmp ne i32 %26, -1073741824
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #3
  unreachable

; <label>:29                                      ; preds = %25
  %30 = call i32 @bar(i16 zeroext -32768, i16 signext 32767)
  %31 = icmp ne i32 %30, 1073709056
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #3
  unreachable

; <label>:33                                      ; preds = %29
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %35 = load i32* %1
  ret i32 %35
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
