; ModuleID = './960513-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define x86_fp80 @f(x86_fp80 %d, i32 %i) #0 {
  %1 = alloca x86_fp80, align 16
  %2 = alloca i32, align 4
  %e = alloca x86_fp80, align 16
  store x86_fp80 %d, x86_fp80* %1, align 16
  store i32 %i, i32* %2, align 4
  %3 = load x86_fp80, x86_fp80* %1, align 16
  %4 = fsub x86_fp80 0xK80000000000000000000, %3
  store x86_fp80 %4, x86_fp80* %1, align 16
  %5 = load x86_fp80, x86_fp80* %1, align 16
  store x86_fp80 %5, x86_fp80* %e, align 16
  %6 = load i32, i32* %2, align 4
  %7 = icmp eq i32 %6, 1
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %0
  %9 = load x86_fp80, x86_fp80* %1, align 16
  %10 = fmul x86_fp80 %9, 0xK40008000000000000000
  store x86_fp80 %10, x86_fp80* %1, align 16
  br label %11

; <label>:11                                      ; preds = %8, %0
  %12 = load x86_fp80, x86_fp80* %e, align 16
  %13 = load x86_fp80, x86_fp80* %1, align 16
  %14 = fmul x86_fp80 %12, %13
  %15 = load x86_fp80, x86_fp80* %1, align 16
  %16 = fsub x86_fp80 %15, %14
  store x86_fp80 %16, x86_fp80* %1, align 16
  %17 = load x86_fp80, x86_fp80* %e, align 16
  %18 = load x86_fp80, x86_fp80* %1, align 16
  %19 = fmul x86_fp80 %17, %18
  %20 = load x86_fp80, x86_fp80* %1, align 16
  %21 = fsub x86_fp80 %20, %19
  store x86_fp80 %21, x86_fp80* %1, align 16
  %22 = load x86_fp80, x86_fp80* %e, align 16
  %23 = load x86_fp80, x86_fp80* %1, align 16
  %24 = fmul x86_fp80 %22, %23
  %25 = load x86_fp80, x86_fp80* %1, align 16
  %26 = fsub x86_fp80 %25, %24
  store x86_fp80 %26, x86_fp80* %1, align 16
  %27 = load x86_fp80, x86_fp80* %e, align 16
  %28 = load x86_fp80, x86_fp80* %1, align 16
  %29 = fmul x86_fp80 %27, %28
  %30 = load x86_fp80, x86_fp80* %1, align 16
  %31 = fsub x86_fp80 %30, %29
  store x86_fp80 %31, x86_fp80* %1, align 16
  %32 = load x86_fp80, x86_fp80* %e, align 16
  %33 = load x86_fp80, x86_fp80* %1, align 16
  %34 = fmul x86_fp80 %32, %33
  %35 = load x86_fp80, x86_fp80* %1, align 16
  %36 = fsub x86_fp80 %35, %34
  store x86_fp80 %36, x86_fp80* %1, align 16
  %37 = load x86_fp80, x86_fp80* %1, align 16
  ret x86_fp80 %37
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call x86_fp80 @f(x86_fp80 0xK40008000000000000000, i32 1)
  %3 = fptosi x86_fp80 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %6, label %5

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i32, i32* %1
  ret i32 %8
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
