; ModuleID = './20020413-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @test(x86_fp80 %val, i32* %eval) #0 {
  %1 = alloca x86_fp80, align 16
  %2 = alloca i32*, align 8
  %tmp = alloca x86_fp80, align 16
  %i = alloca i32, align 4
  store x86_fp80 %val, x86_fp80* %1, align 16
  store i32* %eval, i32** %2, align 8
  store x86_fp80 0xK3FFF8000000000000000, x86_fp80* %tmp, align 16
  store i32 0, i32* %i, align 4
  %3 = load x86_fp80, x86_fp80* %1, align 16
  %4 = fcmp olt x86_fp80 %3, 0xK00000000000000000000
  br i1 %4, label %5, label %8

; <label>:5                                       ; preds = %0
  %6 = load x86_fp80, x86_fp80* %1, align 16
  %7 = fsub x86_fp80 0xK80000000000000000000, %6
  store x86_fp80 %7, x86_fp80* %1, align 16
  br label %8

; <label>:8                                       ; preds = %5, %0
  %9 = load x86_fp80, x86_fp80* %1, align 16
  %10 = load x86_fp80, x86_fp80* %tmp, align 16
  %11 = fcmp oge x86_fp80 %9, %10
  br i1 %11, label %12, label %26

; <label>:12                                      ; preds = %8
  br label %13

; <label>:13                                      ; preds = %24, %12
  %14 = load x86_fp80, x86_fp80* %tmp, align 16
  %15 = load x86_fp80, x86_fp80* %1, align 16
  %16 = fcmp olt x86_fp80 %14, %15
  br i1 %16, label %17, label %25

; <label>:17                                      ; preds = %13
  %18 = load x86_fp80, x86_fp80* %tmp, align 16
  %19 = fmul x86_fp80 %18, 0xK40008000000000000000
  store x86_fp80 %19, x86_fp80* %tmp, align 16
  %20 = load i32, i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  %22 = icmp sge i32 %20, 10
  br i1 %22, label %23, label %24

; <label>:23                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:24                                      ; preds = %17
  br label %13

; <label>:25                                      ; preds = %13
  br label %44

; <label>:26                                      ; preds = %8
  %27 = load x86_fp80, x86_fp80* %1, align 16
  %28 = fcmp une x86_fp80 %27, 0xK00000000000000000000
  br i1 %28, label %29, label %43

; <label>:29                                      ; preds = %26
  br label %30

; <label>:30                                      ; preds = %41, %29
  %31 = load x86_fp80, x86_fp80* %1, align 16
  %32 = load x86_fp80, x86_fp80* %tmp, align 16
  %33 = fcmp olt x86_fp80 %31, %32
  br i1 %33, label %34, label %42

; <label>:34                                      ; preds = %30
  %35 = load x86_fp80, x86_fp80* %tmp, align 16
  %36 = fdiv x86_fp80 %35, 0xK40008000000000000000
  store x86_fp80 %36, x86_fp80* %tmp, align 16
  %37 = load i32, i32* %i, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %i, align 4
  %39 = icmp sge i32 %37, 10
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %34
  call void @abort() #2
  unreachable

; <label>:41                                      ; preds = %34
  br label %30

; <label>:42                                      ; preds = %30
  br label %43

; <label>:43                                      ; preds = %42, %26
  br label %44

; <label>:44                                      ; preds = %43, %25
  %45 = load i32, i32* %i, align 4
  %46 = load i32*, i32** %2, align 8
  store i32 %45, i32* %46, align 4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %eval = alloca i32, align 4
  store i32 0, i32* %1
  call void @test(x86_fp80 0xK4000C000000000000000, i32* %eval)
  call void @test(x86_fp80 0xK4000E000000000000000, i32* %eval)
  call void @test(x86_fp80 0xK40018000000000000000, i32* %eval)
  call void @test(x86_fp80 0xK4001A000000000000000, i32* %eval)
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
