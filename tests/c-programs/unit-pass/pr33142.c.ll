; ModuleID = './pr33142.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @lisp_atan2(i64 %dy, i64 %dx) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  store i64 %dy, i64* %2, align 8
  store i64 %dx, i64* %3, align 8
  %4 = load i64, i64* %3, align 8
  %5 = icmp sle i64 %4, 0
  br i1 %5, label %6, label %19

; <label>:6                                       ; preds = %0
  %7 = load i64, i64* %2, align 8
  %8 = icmp sgt i64 %7, 0
  br i1 %8, label %9, label %18

; <label>:9                                       ; preds = %6
  %10 = load i64, i64* %3, align 8
  %11 = trunc i64 %10 to i32
  %12 = call i32 @abs(i32 %11) #4
  %13 = load i64, i64* %2, align 8
  %14 = trunc i64 %13 to i32
  %15 = call i32 @abs(i32 %14) #4
  %16 = icmp sle i32 %12, %15
  %17 = zext i1 %16 to i32
  store i32 %17, i32* %1
  br label %20

; <label>:18                                      ; preds = %6
  br label %19

; <label>:19                                      ; preds = %18, %0
  store i32 0, i32* %1
  br label %20

; <label>:20                                      ; preds = %19, %9
  %21 = load i32, i32* %1
  ret i32 %21
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #1

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  %dy = alloca i64, align 8
  %dx = alloca i64, align 8
  store i32 0, i32* %1
  store volatile i64 63, i64* %dy, align 8
  store volatile i64 -77, i64* %dx, align 8
  %2 = load volatile i64, i64* %dy, align 8
  %3 = load volatile i64, i64* %dx, align 8
  %4 = call i32 @lisp_atan2(i64 %2, i64 %3)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #5
  unreachable

; <label>:7                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #3

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
