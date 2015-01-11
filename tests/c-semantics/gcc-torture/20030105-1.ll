; ModuleID = './20030105-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@foo.a = internal constant [8 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7], align 16

; Function Attrs: noinline nounwind uwtable
define i32 @foo() #0 {
  %i = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %12, %0
  %2 = load i32* %i, align 4
  %3 = sext i32 %2 to i64
  %4 = icmp ult i64 %3, 8
  br i1 %4, label %5, label %15

; <label>:5                                       ; preds = %1
  %6 = load i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [8 x i32]* @foo.a, i32 0, i64 %7
  %9 = load i32* %8, align 4
  %10 = load i32* %sum, align 4
  %11 = add nsw i32 %10, %9
  store i32 %11, i32* %sum, align 4
  br label %12

; <label>:12                                      ; preds = %5
  %13 = load i32* %i, align 4
  %14 = add nsw i32 %13, 1
  store i32 %14, i32* %i, align 4
  br label %1

; <label>:15                                      ; preds = %1
  %16 = load i32* %sum, align 4
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo()
  %3 = icmp ne i32 %2, 28
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
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
