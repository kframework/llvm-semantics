; ModuleID = './struct-ini-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = global { i8, i8, [2 x i8] } { i8 2, i8 67, [2 x i8] undef }, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i16* bitcast ({ i8, i8, [2 x i8] }* @x to i16*), align 4
  %3 = shl i16 %2, 12
  %4 = ashr i16 %3, 12
  %5 = sext i16 %4 to i32
  %6 = icmp ne i32 %5, 2
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  %9 = load i16* bitcast ({ i8, i8, [2 x i8] }* @x to i16*), align 4
  %10 = shl i16 %9, 4
  %11 = ashr i16 %10, 12
  %12 = sext i16 %11 to i32
  %13 = icmp ne i32 %12, 3
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %8
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %8
  %16 = load i16* bitcast ({ i8, i8, [2 x i8] }* @x to i16*), align 4
  %17 = ashr i16 %16, 12
  %18 = sext i16 %17 to i32
  %19 = icmp ne i32 %18, 4
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %15
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %23 = load i32* %1
  ret i32 %23
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
