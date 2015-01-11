; ModuleID = './20030120-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define zeroext i16 @test1(i16 zeroext %w) #0 {
  %1 = alloca i16, align 2
  store i16 %w, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = and i32 %3, 65280
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %12

; <label>:6                                       ; preds = %0
  %7 = load i16* %1, align 2
  %8 = zext i16 %7 to i32
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  store i16 2, i16* %1, align 2
  br label %11

; <label>:11                                      ; preds = %10, %6
  br label %12

; <label>:12                                      ; preds = %11, %0
  %13 = load i16* %1, align 2
  ret i16 %13
}

; Function Attrs: nounwind uwtable
define i64 @test2(i64 %w) #0 {
  %1 = alloca i64, align 8
  store i64 %w, i64* %1, align 8
  %2 = load i64* %1, align 8
  %3 = and i64 %2, 4294901760
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %5, label %10

; <label>:5                                       ; preds = %0
  %6 = load i64* %1, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  store i64 2, i64* %1, align 8
  br label %9

; <label>:9                                       ; preds = %8, %5
  br label %10

; <label>:10                                      ; preds = %9, %0
  %11 = load i64* %1, align 8
  ret i64 %11
}

; Function Attrs: nounwind uwtable
define i32 @test3(i16 zeroext %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i16, align 2
  store i16 %a, i16* %2, align 2
  %3 = load i16* %2, align 2
  %4 = zext i16 %3 to i32
  %5 = and i32 %4, 1
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32 1, i32* %1
  br label %13

; <label>:8                                       ; preds = %0
  %9 = load i16* %2, align 2
  %10 = icmp ne i16 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8
  store i32 1, i32* %1
  br label %13

; <label>:12                                      ; preds = %8
  store i32 0, i32* %1
  br label %13

; <label>:13                                      ; preds = %12, %11, %7
  %14 = load i32* %1
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call zeroext i16 @test1(i16 zeroext 1)
  %3 = zext i16 %2 to i32
  %4 = icmp ne i32 %3, 1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  %7 = call i64 @test2(i64 1)
  %8 = icmp ne i64 %7, 1
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %6
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %6
  %11 = call i32 @test3(i16 zeroext 2)
  %12 = icmp ne i32 %11, 1
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:14                                      ; preds = %10
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %16 = load i32* %1
  ret i32 %16
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
