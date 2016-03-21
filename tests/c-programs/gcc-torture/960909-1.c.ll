; ModuleID = './960909-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @ffs(i32 %x) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %bit = alloca i32, align 4
  %mask = alloca i32, align 4
  store i32 %x, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %21

; <label>:6                                       ; preds = %0
  store i32 1, i32* %bit, align 4
  store i32 1, i32* %mask, align 4
  br label %7

; <label>:7                                       ; preds = %14, %6
  %8 = load i32, i32* %2, align 4
  %9 = load i32, i32* %mask, align 4
  %10 = and i32 %8, %9
  %11 = icmp ne i32 %10, 0
  %12 = xor i1 %11, true
  br i1 %12, label %13, label %19

; <label>:13                                      ; preds = %7
  br label %14

; <label>:14                                      ; preds = %13
  %15 = load i32, i32* %bit, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %bit, align 4
  %17 = load i32, i32* %mask, align 4
  %18 = shl i32 %17, 1
  store i32 %18, i32* %mask, align 4
  br label %7

; <label>:19                                      ; preds = %7
  %20 = load i32, i32* %bit, align 4
  store i32 %20, i32* %1
  br label %21

; <label>:21                                      ; preds = %19, %5
  %22 = load i32, i32* %1
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define void @f(i32 %x) #0 {
  %1 = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = call i32 @ffs(i32 %2)
  %4 = sub nsw i32 %3, 1
  store i32 %4, i32* %y, align 4
  %5 = load i32, i32* %y, align 4
  %6 = icmp slt i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @f(i32 1)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
