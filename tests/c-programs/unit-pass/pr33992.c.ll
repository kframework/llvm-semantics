; ModuleID = './pr33992.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define void @bar(i64 %i) #0 {
  %1 = alloca i64, align 8
  store i64 %i, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = icmp ne i64 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #4
  unreachable

; <label>:5                                       ; preds = %0
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: alwaysinline nounwind uwtable
define void @foo(i64* %r) #2 {
  %1 = alloca i64*, align 8
  %i = alloca i32, align 4
  store i64* %r, i64** %1, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %13, %0
  %3 = load i64*, i64** %1, align 8
  %4 = load i64, i64* %3, align 8
  %5 = load i32, i32* %i, align 4
  %6 = sub nsw i32 63, %5
  %7 = zext i32 %6 to i64
  %8 = shl i64 1, %7
  %9 = and i64 %4, %8
  %10 = icmp ne i64 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %2
  br label %16

; <label>:12                                      ; preds = %2
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load i32, i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %2

; <label>:16                                      ; preds = %11
  %17 = load i32, i32* %i, align 4
  %18 = sext i32 %17 to i64
  call void @bar(i64 %18)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @do_test(i64* %r) #0 {
  %1 = alloca i64*, align 8
  %i.i = alloca i32, align 4
  %2 = alloca i64*, align 8
  %i = alloca i32, align 4
  store i64* %r, i64** %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %22, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %25

; <label>:6                                       ; preds = %3
  %7 = load i64*, i64** %2, align 8
  store i64* %7, i64** %1, align 8
  store i32 0, i32* %i.i, align 4
  br label %8

; <label>:8                                       ; preds = %17, %6
  %9 = load i64*, i64** %1, align 8
  %10 = load i64, i64* %9, align 8
  %11 = load i32, i32* %i.i, align 4
  %12 = sub nsw i32 63, %11
  %13 = zext i32 %12 to i64
  %14 = shl i64 1, %13
  %15 = and i64 %10, %14
  %16 = icmp ne i64 %15, 0
  br i1 %16, label %foo.exit, label %17

; <label>:17                                      ; preds = %8
  %18 = load i32, i32* %i.i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i.i, align 4
  br label %8

foo.exit:                                         ; preds = %8
  %20 = load i32, i32* %i.i, align 4
  %21 = sext i32 %20 to i64
  call void @bar(i64 %21) #5
  br label %22

; <label>:22                                      ; preds = %foo.exit
  %23 = load i32, i32* %i, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %i, align 4
  br label %3

; <label>:25                                      ; preds = %3
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #3 {
  %1 = alloca i32, align 4
  %r = alloca i64, align 8
  store i32 0, i32* %1
  store i64 -9223372036854775807, i64* %r, align 8
  call void @do_test(i64* %r)
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { alwaysinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
