; ModuleID = './20000313-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @buggy(i32* %param) #0 {
  %1 = alloca i32*, align 8
  %accu = alloca i32, align 4
  %zero = alloca i32, align 4
  %borrow = alloca i32, align 4
  store i32* %param, i32** %1, align 8
  store i32 0, i32* %zero, align 4
  %2 = load i32*, i32** %1, align 8
  %3 = load i32, i32* %2, align 4
  %4 = sub i32 0, %3
  store i32 %4, i32* %accu, align 4
  %5 = load i32, i32* %accu, align 4
  %6 = load i32, i32* %zero, align 4
  %7 = icmp ugt i32 %5, %6
  %8 = zext i1 %7 to i32
  %9 = sub nsw i32 0, %8
  store i32 %9, i32* %borrow, align 4
  %10 = load i32, i32* %accu, align 4
  %11 = load i32*, i32** %1, align 8
  %12 = load i32, i32* %11, align 4
  %13 = add i32 %12, %10
  store i32 %13, i32* %11, align 4
  %14 = load i32, i32* %borrow, align 4
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %param = alloca i32, align 4
  %borrow = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* %param, align 4
  %2 = call i32 @buggy(i32* %param)
  store i32 %2, i32* %borrow, align 4
  %3 = load i32, i32* %param, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %borrow, align 4
  %8 = add i32 %7, 1
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %6
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
