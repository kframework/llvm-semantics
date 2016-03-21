; ModuleID = './941031-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i64 %us, i64 %vs) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  %aus = alloca i64, align 8
  %avs = alloca i64, align 8
  %t = alloca i64, align 8
  store i64 %us, i64* %1, align 8
  store i64 %vs, i64* %2, align 8
  %3 = load i64, i64* %1, align 8
  %4 = icmp sge i64 %3, 0
  br i1 %4, label %5, label %7

; <label>:5                                       ; preds = %0
  %6 = load i64, i64* %1, align 8
  br label %10

; <label>:7                                       ; preds = %0
  %8 = load i64, i64* %1, align 8
  %9 = sub nsw i64 0, %8
  br label %10

; <label>:10                                      ; preds = %7, %5
  %11 = phi i64 [ %6, %5 ], [ %9, %7 ]
  store i64 %11, i64* %aus, align 8
  %12 = load i64, i64* %2, align 8
  %13 = icmp sge i64 %12, 0
  br i1 %13, label %14, label %16

; <label>:14                                      ; preds = %10
  %15 = load i64, i64* %2, align 8
  br label %19

; <label>:16                                      ; preds = %10
  %17 = load i64, i64* %2, align 8
  %18 = sub nsw i64 0, %17
  br label %19

; <label>:19                                      ; preds = %16, %14
  %20 = phi i64 [ %15, %14 ], [ %18, %16 ]
  store i64 %20, i64* %avs, align 8
  %21 = load i64, i64* %aus, align 8
  %22 = load i64, i64* %avs, align 8
  %23 = icmp slt i64 %21, %22
  br i1 %23, label %24, label %28

; <label>:24                                      ; preds = %19
  %25 = load i64, i64* %aus, align 8
  store i64 %25, i64* %t, align 8
  %26 = load i64, i64* %avs, align 8
  store i64 %26, i64* %aus, align 8
  %27 = load i64, i64* %aus, align 8
  store i64 %27, i64* %avs, align 8
  br label %28

; <label>:28                                      ; preds = %24, %19
  %29 = load i64, i64* %avs, align 8
  %30 = trunc i64 %29 to i32
  ret i32 %30
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f(i64 3, i64 17)
  %3 = icmp ne i32 %2, 17
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32, i32* %1
  ret i32 %7
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
