; ModuleID = './20011126-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global i32 1, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca i64, align 8
  store i32 0, i32* %1
  %2 = load i32, i32* @a, align 4
  %3 = sext i32 %2 to i64
  store i64 %3, i64* %s, align 8
  %4 = load i64, i64* %s, align 8
  %5 = icmp slt i64 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  store i64 -2147483648, i64* %s, align 8
  br label %8

; <label>:7                                       ; preds = %0
  store i64 2147483647, i64* %s, align 8
  br label %8

; <label>:8                                       ; preds = %7, %6
  %9 = load i64, i64* %s, align 8
  %10 = icmp slt i64 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %8
  call void @abort() #2
  unreachable

; <label>:12                                      ; preds = %8
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
