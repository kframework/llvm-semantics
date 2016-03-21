; ModuleID = './loop-10.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@count = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %iNbr = alloca i32, align 4
  %test = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* %iNbr, align 4
  store i32 0, i32* %test, align 4
  br label %2

; <label>:2                                       ; preds = %12, %0
  %3 = load i32, i32* %test, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %13

; <label>:5                                       ; preds = %2
  call void @inc()
  %6 = load i32, i32* %iNbr, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  br label %13

; <label>:9                                       ; preds = %5
  call void @inc()
  %10 = load i32, i32* %iNbr, align 4
  %11 = add nsw i32 %10, -1
  store i32 %11, i32* %iNbr, align 4
  br label %12

; <label>:12                                      ; preds = %9
  store i32 1, i32* %test, align 4
  br label %2

; <label>:13                                      ; preds = %8, %2
  %14 = load i32, i32* @count, align 4
  %15 = icmp ne i32 %14, 2
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @inc() #0 {
  %1 = load i32, i32* @count, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, i32* @count, align 4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
