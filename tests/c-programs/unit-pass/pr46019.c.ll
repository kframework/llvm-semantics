; ModuleID = './pr46019.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %l = alloca i64, align 8
  %n = alloca i32, align 4
  store i32 0, i32* %1
  store i64 4398046511104, i64* %l, align 8
  store i32 0, i32* %n, align 4
  br label %2

; <label>:2                                       ; preds = %17, %0
  %3 = load i32, i32* %n, align 4
  %4 = icmp slt i32 %3, 8
  br i1 %4, label %5, label %20

; <label>:5                                       ; preds = %2
  %6 = load i64, i64* %l, align 8
  %7 = load i32, i32* %n, align 4
  %8 = zext i32 %7 to i64
  %9 = shl i64 8589934592, %8
  %10 = udiv i64 %6, %9
  %11 = load i32, i32* %n, align 4
  %12 = ashr i32 512, %11
  %13 = sext i32 %12 to i64
  %14 = icmp ne i64 %10, %13
  br i1 %14, label %15, label %16

; <label>:15                                      ; preds = %5
  call void @abort() #2
  unreachable

; <label>:16                                      ; preds = %5
  br label %17

; <label>:17                                      ; preds = %16
  %18 = load i32, i32* %n, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %n, align 4
  br label %2

; <label>:20                                      ; preds = %2
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
