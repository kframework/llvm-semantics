; ModuleID = './20060930-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @bar(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp ne i32 %3, 1
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:6                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noinline nounwind uwtable
define void @foo(i32 %e, i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %i = alloca i32, align 4
  %bb2 = alloca i32, align 4
  %bb5 = alloca i32, align 4
  store i32 %e, i32* %1, align 4
  store i32 %n, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = icmp sgt i32 %3, 0
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load i32, i32* %1, align 4
  %7 = sub nsw i32 0, %6
  store i32 %7, i32* %1, align 4
  br label %8

; <label>:8                                       ; preds = %5, %0
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %25, %8
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %2, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %28

; <label>:13                                      ; preds = %9
  %14 = load i32, i32* %1, align 4
  %15 = icmp sge i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  store i32 0, i32* %bb2, align 4
  store i32 0, i32* %bb5, align 4
  br label %21

; <label>:17                                      ; preds = %13
  %18 = load i32, i32* %1, align 4
  %19 = sub nsw i32 0, %18
  store i32 %19, i32* %bb5, align 4
  %20 = load i32, i32* %bb5, align 4
  store i32 %20, i32* %bb2, align 4
  br label %21

; <label>:21                                      ; preds = %17, %16
  %22 = load i32, i32* %bb5, align 4
  %23 = load i32, i32* %bb2, align 4
  %24 = call i32 @bar(i32 %22, i32 %23)
  br label %25

; <label>:25                                      ; preds = %21
  %26 = load i32, i32* %i, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %i, align 4
  br label %9

; <label>:28                                      ; preds = %9
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo(i32 1, i32 1)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
