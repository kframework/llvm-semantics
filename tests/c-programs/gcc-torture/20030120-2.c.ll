; ModuleID = './20030120-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @foo(i32 %status) #0 {
  %1 = alloca i32, align 4
  %s = alloca i32, align 4
  store i32 %status, i32* %1, align 4
  store i32 0, i32* %s, align 4
  %2 = load i32, i32* %1, align 4
  %3 = icmp eq i32 %2, 1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32 1, i32* %s, align 4
  br label %5

; <label>:5                                       ; preds = %4, %0
  %6 = load i32, i32* %1, align 4
  %7 = icmp eq i32 %6, 3
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  store i32 3, i32* %s, align 4
  br label %9

; <label>:9                                       ; preds = %8, %5
  %10 = load i32, i32* %1, align 4
  %11 = icmp eq i32 %10, 4
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  store i32 4, i32* %s, align 4
  br label %13

; <label>:13                                      ; preds = %12, %9
  %14 = load i32, i32* %s, align 4
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo(i32 3)
  %3 = icmp ne i32 %2, 3
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
