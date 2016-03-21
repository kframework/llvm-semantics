; ModuleID = './loop-11.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = internal global [199 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo()
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %14, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 199
  br i1 %4, label %5, label %17

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [199 x i32], [199 x i32]* @a, i32 0, i64 %7
  %9 = load i32, i32* %8, align 4
  %10 = load i32, i32* %i, align 4
  %11 = icmp ne i32 %9, %10
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %5
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %5
  br label %14

; <label>:14                                      ; preds = %13
  %15 = load i32, i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %2

; <label>:17                                      ; preds = %2
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define internal void @foo() #0 {
  %i = alloca i32, align 4
  store i32 198, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %9, %0
  %2 = load i32, i32* %i, align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %12

; <label>:4                                       ; preds = %1
  %5 = load i32, i32* %i, align 4
  %6 = load i32, i32* %i, align 4
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [199 x i32], [199 x i32]* @a, i32 0, i64 %7
  store i32 %5, i32* %8, align 4
  br label %9

; <label>:9                                       ; preds = %4
  %10 = load i32, i32* %i, align 4
  %11 = add nsw i32 %10, -1
  store i32 %11, i32* %i, align 4
  br label %1

; <label>:12                                      ; preds = %1
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
