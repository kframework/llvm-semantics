; ModuleID = './pr43783.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.UINT192 = type { [3 x i64] }

@bid_Kx192 = common global [32 x %struct.UINT192] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca i64, align 8
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  store i64 0, i64* %x, align 8
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %15, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 32
  br i1 %4, label %5, label %18

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = icmp eq i32 %6, 1
  %8 = zext i1 %7 to i32
  %9 = sext i32 %8 to i64
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [32 x %struct.UINT192], [32 x %struct.UINT192]* @bid_Kx192, i32 0, i64 %11
  %13 = getelementptr inbounds %struct.UINT192, %struct.UINT192* %12, i32 0, i32 0
  %14 = getelementptr inbounds [3 x i64], [3 x i64]* %13, i32 0, i64 1
  store i64 %9, i64* %14, align 8
  br label %15

; <label>:15                                      ; preds = %5
  %16 = load i32, i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %2

; <label>:18                                      ; preds = %2
  store i32 0, i32* %i, align 4
  br label %19

; <label>:19                                      ; preds = %26, %18
  %20 = load i32, i32* %i, align 4
  %21 = icmp slt i32 %20, 32
  br i1 %21, label %22, label %29

; <label>:22                                      ; preds = %19
  %23 = load i64, i64* getelementptr inbounds ([32 x %struct.UINT192], [32 x %struct.UINT192]* @bid_Kx192, i32 0, i64 1, i32 0, i64 1), align 8
  %24 = load i64, i64* %x, align 8
  %25 = add i64 %24, %23
  store i64 %25, i64* %x, align 8
  br label %26

; <label>:26                                      ; preds = %22
  %27 = load i32, i32* %i, align 4
  %28 = add nsw i32 %27, 1
  store i32 %28, i32* %i, align 4
  br label %19

; <label>:29                                      ; preds = %19
  %30 = load i64, i64* %x, align 8
  %31 = icmp ne i64 %30, 32
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:33                                      ; preds = %29
  ret i32 0
}

; Function Attrs: noreturn
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
