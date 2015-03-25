; ModuleID = './20000314-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %winds = alloca i64, align 8
  store i32 0, i32* %1
  store i64 0, i64* %winds, align 8
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i64* %winds, align 8
  %4 = icmp ne i64 %3, 0
  br i1 %4, label %5, label %12

; <label>:5                                       ; preds = %2
  %6 = load i64* %winds, align 8
  %7 = inttoptr i64 %6 to i8*
  %8 = load i8* %7, align 1
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %5
  br label %12

; <label>:11                                      ; preds = %5
  br label %2

; <label>:12                                      ; preds = %10, %2
  %13 = load i64* %winds, align 8
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %24, label %15

; <label>:15                                      ; preds = %12
  %16 = load i64* %winds, align 8
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %24, label %18

; <label>:18                                      ; preds = %15
  %19 = load i64* %winds, align 8
  %20 = inttoptr i64 %19 to i8*
  %21 = load i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %18, %15, %12
  call void @exit(i32 0) #2
  unreachable

; <label>:25                                      ; preds = %18
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  %27 = load i32* %1
  ret i32 %27
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
