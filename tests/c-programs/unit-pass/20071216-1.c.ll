; ModuleID = './20071216-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = internal global i32 0, align 4

; Function Attrs: noinline nounwind uwtable
define i32 @bar() #0 {
  %1 = load i32, i32* @x, align 4
  ret i32 %1
}

; Function Attrs: nounwind uwtable
define i32 @foo() #1 {
  %1 = alloca i32, align 4
  %b = alloca i64, align 8
  %2 = call i32 @bar()
  %3 = sext i32 %2 to i64
  store i64 %3, i64* %b, align 8
  %4 = load i64, i64* %b, align 8
  %5 = icmp ult i64 %4, -4095
  br i1 %5, label %6, label %9

; <label>:6                                       ; preds = %0
  %7 = load i64, i64* %b, align 8
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* %1
  br label %18

; <label>:9                                       ; preds = %0
  %10 = load i64, i64* %b, align 8
  %11 = sub nsw i64 0, %10
  %12 = icmp ne i64 %11, 38
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %9
  store i64 -2, i64* %b, align 8
  br label %14

; <label>:14                                      ; preds = %13, %9
  %15 = load i64, i64* %b, align 8
  %16 = add nsw i64 %15, 1
  %17 = trunc i64 %16 to i32
  store i32 %17, i32* %1
  br label %18

; <label>:18                                      ; preds = %14, %6
  %19 = load i32, i32* %1
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 26, i32* @x, align 4
  %2 = call i32 @foo()
  %3 = icmp ne i32 %2, 26
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  store i32 -39, i32* @x, align 4
  %6 = call i32 @foo()
  %7 = icmp ne i32 %6, -1
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %5
  store i32 -38, i32* @x, align 4
  %10 = call i32 @foo()
  %11 = icmp ne i32 %10, -37
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #3
  unreachable

; <label>:13                                      ; preds = %9
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
