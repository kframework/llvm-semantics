; ModuleID = './unroll-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %a = alloca i32, align 4
  store i32 0, i32* %a, align 4
  br label %1

; <label>:1                                       ; preds = %0
  %2 = call i32 @f(i32 1)
  %3 = call i32 @f(i32 %2)
  %4 = call i32 @f(i32 %3)
  %5 = call i32 @f(i32 %4)
  %6 = call i32 @f(i32 %5)
  %7 = call i32 @f(i32 %6)
  %8 = call i32 @f(i32 %7)
  %9 = call i32 @f(i32 %8)
  %10 = call i32 @f(i32 %9)
  %11 = call i32 @f(i32 %10)
  %12 = load i32, i32* %a, align 4
  %13 = add nsw i32 %11, %12
  %14 = icmp slt i32 %13, 12
  br i1 %14, label %15, label %18

; <label>:15                                      ; preds = %1
  %16 = load i32, i32* %a, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %a, align 4
  call void @exit(i32 0) #3
  unreachable

; <label>:18                                      ; preds = %1
  %19 = load i32, i32* %a, align 4
  %20 = icmp ne i32 %19, 1
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  call void @abort() #3
  unreachable

; <label>:22                                      ; preds = %18
  ret i32 0
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @f(i32 %x) #1 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = add nsw i32 %2, 1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
