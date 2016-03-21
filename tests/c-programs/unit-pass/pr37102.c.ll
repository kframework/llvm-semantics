; ModuleID = './pr37102.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@b = global i32 1, align 4
@c = common global i32 0, align 4
@a = common global i32 0, align 4

; Function Attrs: noinline nounwind uwtable
define void @foo(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = icmp ne i32 %2, 5
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  store i32 0, i32* %1
  store i32 1, i32* %d, align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i32, i32* %d, align 4
  %4 = icmp ult i32 %3, 5
  br i1 %4, label %5, label %14

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* @c, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %5
  %9 = load i32, i32* @b, align 4
  store i32 %9, i32* @a, align 4
  br label %10

; <label>:10                                      ; preds = %8, %5
  br label %11

; <label>:11                                      ; preds = %10
  %12 = load i32, i32* %d, align 4
  %13 = add i32 %12, 1
  store i32 %13, i32* %d, align 4
  br label %2

; <label>:14                                      ; preds = %2
  %15 = load i32, i32* @b, align 4
  store i32 %15, i32* @a, align 4
  %16 = load i32, i32* @a, align 4
  %17 = shl i32 %16, 1
  store i32 %17, i32* %e, align 4
  %18 = load i32, i32* %e, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %24

; <label>:20                                      ; preds = %14
  %21 = load i32, i32* %e, align 4
  %22 = shl i32 %21, 1
  %23 = xor i32 %22, 1
  store i32 %23, i32* %e, align 4
  br label %24

; <label>:24                                      ; preds = %20, %14
  %25 = load i32, i32* %e, align 4
  call void @foo(i32 %25)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
