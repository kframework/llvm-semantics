; ModuleID = './extzvsi.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.ieee = type { i64 }

@x = common global %struct.ieee zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define i32 @foo() #0 {
  %1 = alloca i32, align 4
  %exponent = alloca i32, align 4
  %2 = load i64, i64* getelementptr inbounds (%struct.ieee, %struct.ieee* @x, i32 0, i32 0), align 4
  %3 = lshr i64 %2, 1
  %4 = and i64 %3, 2047
  %5 = trunc i64 %4 to i32
  store i32 %5, i32* %exponent, align 4
  %6 = load i32, i32* %exponent, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  store i32 1, i32* %1
  br label %15

; <label>:9                                       ; preds = %0
  %10 = load i32, i32* %exponent, align 4
  %11 = icmp ugt i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  store i32 2, i32* %1
  br label %15

; <label>:13                                      ; preds = %9
  br label %14

; <label>:14                                      ; preds = %13
  store i32 0, i32* %1
  br label %15

; <label>:15                                      ; preds = %14, %12, %8
  %16 = load i32, i32* %1
  ret i32 %16
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i64, i64* getelementptr inbounds (%struct.ieee, %struct.ieee* @x, i32 0, i32 0), align 4
  %3 = and i64 %2, -4095
  %4 = or i64 %3, 2
  store i64 %4, i64* getelementptr inbounds (%struct.ieee, %struct.ieee* @x, i32 0, i32 0), align 4
  %5 = call i32 @foo()
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
