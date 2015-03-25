; ModuleID = './920501-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@s = common global [2 x i32] zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define i32 @x(i32 %q) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %q, i32* %2, align 4
  %3 = load i32* getelementptr inbounds ([2 x i32]* @s, i32 0, i64 0), align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %11, label %5

; <label>:5                                       ; preds = %0
  %6 = load i32* getelementptr inbounds ([2 x i32]* @s, i32 0, i64 1), align 4
  %7 = load i32* getelementptr inbounds ([2 x i32]* @s, i32 0, i64 1), align 4
  %8 = add nsw i32 1, %7
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [2 x i32]* @s, i32 0, i64 %9
  store i32 %6, i32* %10, align 4
  store i32 1, i32* %1
  br label %11

; <label>:11                                      ; preds = %5, %0
  %12 = load i32* %1
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @s, i32 0, i64 1), align 4
  store i32 0, i32* getelementptr inbounds ([2 x i32]* @s, i32 0, i64 0), align 4
  %2 = call i32 @x(i32 0)
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
