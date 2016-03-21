; ModuleID = './20010106-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i32 %i) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %i, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  switch i32 %3, label %11 [
    i32 -2, label %4
    i32 -1, label %5
    i32 0, label %6
    i32 1, label %7
    i32 2, label %8
    i32 3, label %9
    i32 4, label %10
  ]

; <label>:4                                       ; preds = %0
  store i32 33, i32* %1
  br label %12

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %12

; <label>:6                                       ; preds = %0
  store i32 7, i32* %1
  br label %12

; <label>:7                                       ; preds = %0
  store i32 4, i32* %1
  br label %12

; <label>:8                                       ; preds = %0
  store i32 3, i32* %1
  br label %12

; <label>:9                                       ; preds = %0
  store i32 15, i32* %1
  br label %12

; <label>:10                                      ; preds = %0
  store i32 9, i32* %1
  br label %12

; <label>:11                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:12                                      ; preds = %10, %9, %8, %7, %6, %5, %4
  %13 = load i32, i32* %1
  ret i32 %13
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f(i32 -1)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32, i32* %1
  ret i32 %7
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
