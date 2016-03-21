; ModuleID = './20061101-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @tar(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = icmp ne i32 %2, 36863
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 -1
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @bug(i32 %q, i32 %bcount) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %j = alloca i32, align 4
  %outgo = alloca i32, align 4
  store i32 %q, i32* %1, align 4
  store i32 %bcount, i32* %2, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %outgo, align 4
  br label %3

; <label>:3                                       ; preds = %16, %0
  %4 = load i32, i32* %j, align 4
  %5 = icmp ne i32 %4, -1
  br i1 %5, label %6, label %21

; <label>:6                                       ; preds = %3
  %7 = load i32, i32* %outgo, align 4
  %8 = add nsw i32 %7, 1
  store i32 %8, i32* %outgo, align 4
  %9 = load i32, i32* %outgo, align 4
  %10 = load i32, i32* %1, align 4
  %11 = sub nsw i32 %10, 1
  %12 = icmp sgt i32 %9, %11
  br i1 %12, label %13, label %16

; <label>:13                                      ; preds = %6
  %14 = load i32, i32* %1, align 4
  %15 = sub nsw i32 %14, 1
  store i32 %15, i32* %outgo, align 4
  br label %16

; <label>:16                                      ; preds = %13, %6
  %17 = load i32, i32* %outgo, align 4
  %18 = load i32, i32* %2, align 4
  %19 = mul nsw i32 %17, %18
  %20 = call i32 @tar(i32 %19)
  store i32 %20, i32* %j, align 4
  br label %3

; <label>:21                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @bug(i32 5, i32 36863)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
