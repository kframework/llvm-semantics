; ModuleID = './loop-14.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a3 = common global [3 x i32] zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define void @f(i32* %a) #0 {
  %1 = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32* %a, i32** %1, align 8
  store i32 3, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %i, align 4
  %4 = add nsw i32 %3, -1
  store i32 %4, i32* %i, align 4
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %13

; <label>:6                                       ; preds = %2
  %7 = load i32* %i, align 4
  %8 = sdiv i32 42, %7
  %9 = load i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = load i32** %1, align 8
  %12 = getelementptr inbounds i32* %11, i64 %10
  store i32 %8, i32* %12, align 4
  br label %2

; <label>:13                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @f(i32* getelementptr inbounds ([3 x i32]* @a3, i32 0, i32 0))
  %2 = load i32* getelementptr inbounds ([3 x i32]* @a3, i32 0, i64 1), align 4
  %3 = icmp ne i32 %2, 42
  br i1 %3, label %7, label %4

; <label>:4                                       ; preds = %0
  %5 = load i32* getelementptr inbounds ([3 x i32]* @a3, i32 0, i64 2), align 4
  %6 = icmp ne i32 %5, 21
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
