; ModuleID = './loop-2b.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = common global [2 x i32] zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define void @f(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  br label %2

; <label>:2                                       ; preds = %15, %0
  %3 = load i32* %1, align 4
  %4 = icmp slt i32 %3, 2147483647
  br i1 %4, label %5, label %18

; <label>:5                                       ; preds = %2
  %6 = load i32* %1, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [2 x i32]* @a, i32 0, i64 %7
  store i32 -2, i32* %8, align 4
  %9 = load i32* %1, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [2 x i32]* @a, i32 0, i64 %10
  %12 = icmp eq i32* %11, getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1)
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %5
  br label %18

; <label>:14                                      ; preds = %5
  br label %15

; <label>:15                                      ; preds = %14
  %16 = load i32* %1, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %1, align 4
  br label %2

; <label>:18                                      ; preds = %13, %2
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1), align 4
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  call void @f(i32 0)
  %2 = load i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  %3 = icmp ne i32 %2, -2
  br i1 %3, label %7, label %4

; <label>:4                                       ; preds = %0
  %5 = load i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1), align 4
  %6 = icmp ne i32 %5, -2
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4, %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %4
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %10 = load i32* %1
  ret i32 %10
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
