; ModuleID = './20020510-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @testc(i8 zeroext %c, i32 %ok) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i32, align 4
  store i8 %c, i8* %1, align 1
  store i32 %ok, i32* %2, align 4
  %3 = load i8* %1, align 1
  %4 = zext i8 %3 to i32
  %5 = icmp sge i32 %4, 1
  br i1 %5, label %6, label %15

; <label>:6                                       ; preds = %0
  %7 = load i8* %1, align 1
  %8 = zext i8 %7 to i32
  %9 = icmp sle i32 %8, 127
  br i1 %9, label %10, label %15

; <label>:10                                      ; preds = %6
  %11 = load i32* %2, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %14, label %13

; <label>:13                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:14                                      ; preds = %10
  br label %20

; <label>:15                                      ; preds = %6, %0
  %16 = load i32* %2, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %15
  br label %20

; <label>:20                                      ; preds = %19, %14
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @tests(i16 zeroext %s, i32 %ok) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i32, align 4
  store i16 %s, i16* %1, align 2
  store i32 %ok, i32* %2, align 4
  %3 = load i16* %1, align 2
  %4 = zext i16 %3 to i32
  %5 = icmp sge i32 %4, 1
  br i1 %5, label %6, label %15

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = zext i16 %7 to i32
  %9 = icmp sle i32 %8, 32767
  br i1 %9, label %10, label %15

; <label>:10                                      ; preds = %6
  %11 = load i32* %2, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %14, label %13

; <label>:13                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:14                                      ; preds = %10
  br label %20

; <label>:15                                      ; preds = %6, %0
  %16 = load i32* %2, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %15
  br label %20

; <label>:20                                      ; preds = %19, %14
  ret void
}

; Function Attrs: nounwind uwtable
define void @testi(i32 %i, i32 %ok) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  store i32 %ok, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = icmp uge i32 %3, 1
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i32* %1, align 4
  %7 = icmp ule i32 %6, 2147483647
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i32* %2, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %8
  call void @abort() #2
  unreachable

; <label>:12                                      ; preds = %8
  br label %18

; <label>:13                                      ; preds = %5, %0
  %14 = load i32* %2, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  br label %18

; <label>:18                                      ; preds = %17, %12
  ret void
}

; Function Attrs: nounwind uwtable
define void @testl(i64 %l, i32 %ok) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  store i64 %l, i64* %1, align 8
  store i32 %ok, i32* %2, align 4
  %3 = load i64* %1, align 8
  %4 = icmp uge i64 %3, 1
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  %7 = icmp ule i64 %6, 9223372036854775807
  br i1 %7, label %8, label %13

; <label>:8                                       ; preds = %5
  %9 = load i32* %2, align 4
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %8
  call void @abort() #2
  unreachable

; <label>:12                                      ; preds = %8
  br label %18

; <label>:13                                      ; preds = %5, %0
  %14 = load i32* %2, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  br label %18

; <label>:18                                      ; preds = %17, %12
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @testc(i8 zeroext 0, i32 0)
  call void @testc(i8 zeroext 1, i32 1)
  call void @testc(i8 zeroext 127, i32 1)
  call void @testc(i8 zeroext -128, i32 0)
  call void @testc(i8 zeroext -1, i32 0)
  call void @tests(i16 zeroext 0, i32 0)
  call void @tests(i16 zeroext 1, i32 1)
  call void @tests(i16 zeroext 32767, i32 1)
  call void @tests(i16 zeroext -32768, i32 0)
  call void @tests(i16 zeroext -1, i32 0)
  call void @testi(i32 0, i32 0)
  call void @testi(i32 1, i32 1)
  call void @testi(i32 2147483647, i32 1)
  call void @testi(i32 -2147483648, i32 0)
  call void @testi(i32 -1, i32 0)
  call void @testl(i64 0, i32 0)
  call void @testl(i64 1, i32 1)
  call void @testl(i64 9223372036854775807, i32 1)
  call void @testl(i64 -9223372036854775808, i32 0)
  call void @testl(i64 -1, i32 0)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
