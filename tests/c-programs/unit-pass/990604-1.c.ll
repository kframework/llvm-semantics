; ModuleID = './990604-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@b = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @f() #0 {
  %i = alloca i32, align 4
  store i32 0, i32* %i, align 4
  %1 = load i32, i32* @b, align 4
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %3, label %12

; <label>:3                                       ; preds = %0
  br label %4

; <label>:4                                       ; preds = %8, %3
  %5 = load i32, i32* %i, align 4
  store i32 %5, i32* @b, align 4
  %6 = load i32, i32* %i, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* %i, align 4
  br label %8

; <label>:8                                       ; preds = %4
  %9 = load i32, i32* %i, align 4
  %10 = icmp slt i32 %9, 10
  br i1 %10, label %4, label %11

; <label>:11                                      ; preds = %8
  br label %12

; <label>:12                                      ; preds = %11, %0
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @f()
  %2 = load i32, i32* @b, align 4
  %3 = icmp ne i32 %2, 9
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
