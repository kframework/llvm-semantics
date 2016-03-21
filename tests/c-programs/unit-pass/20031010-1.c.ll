; ModuleID = './20031010-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i64 @foo(i64 %ct, i64 %cf, i1 zeroext %p1, i1 zeroext %p2, i1 zeroext %p3) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %5 = alloca i8, align 1
  %diff = alloca i64, align 8
  %tmp = alloca i64, align 8
  store i64 %ct, i64* %1, align 8
  store i64 %cf, i64* %2, align 8
  %6 = zext i1 %p1 to i8
  store i8 %6, i8* %3, align 1
  %7 = zext i1 %p2 to i8
  store i8 %7, i8* %4, align 1
  %8 = zext i1 %p3 to i8
  store i8 %8, i8* %5, align 1
  %9 = load i64, i64* %1, align 8
  %10 = load i64, i64* %2, align 8
  %11 = sub nsw i64 %9, %10
  store i64 %11, i64* %diff, align 8
  %12 = load i8, i8* %3, align 1
  %13 = trunc i8 %12 to i1
  br i1 %13, label %14, label %30

; <label>:14                                      ; preds = %0
  %15 = load i8, i8* %4, align 1
  %16 = trunc i8 %15 to i1
  br i1 %16, label %17, label %28

; <label>:17                                      ; preds = %14
  %18 = load i8, i8* %5, align 1
  %19 = trunc i8 %18 to i1
  br i1 %19, label %20, label %24

; <label>:20                                      ; preds = %17
  %21 = load i64, i64* %1, align 8
  store i64 %21, i64* %tmp, align 8
  %22 = load i64, i64* %2, align 8
  store i64 %22, i64* %1, align 8
  %23 = load i64, i64* %tmp, align 8
  store i64 %23, i64* %2, align 8
  br label %24

; <label>:24                                      ; preds = %20, %17
  %25 = load i64, i64* %1, align 8
  %26 = load i64, i64* %2, align 8
  %27 = sub nsw i64 %25, %26
  store i64 %27, i64* %diff, align 8
  br label %28

; <label>:28                                      ; preds = %24, %14
  %29 = load i64, i64* %diff, align 8
  ret i64 %29

; <label>:30                                      ; preds = %0
  call void @abort() #3
  unreachable
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i64 @foo(i64 2, i64 3, i1 zeroext true, i1 zeroext true, i1 zeroext true)
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
