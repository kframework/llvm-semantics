; ModuleID = './20050124-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @foo(i32 %i, i32 %j) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  store i32 %j, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = add nsw i32 %3, 1
  store i32 %4, i32* %k, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %21

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* %k, align 4
  %9 = icmp sgt i32 %8, 0
  br i1 %9, label %10, label %13

; <label>:10                                      ; preds = %7
  %11 = load i32, i32* %k, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %k, align 4
  br label %20

; <label>:13                                      ; preds = %7
  %14 = load i32, i32* %k, align 4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %16, label %19

; <label>:16                                      ; preds = %13
  %17 = load i32, i32* %k, align 4
  %18 = add nsw i32 %17, -1
  store i32 %18, i32* %k, align 4
  br label %19

; <label>:19                                      ; preds = %16, %13
  br label %20

; <label>:20                                      ; preds = %19, %10
  br label %21

; <label>:21                                      ; preds = %20, %0
  %22 = load i32, i32* %k, align 4
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo(i32 -2, i32 0)
  %3 = icmp ne i32 %2, -1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @foo(i32 -1, i32 0)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @foo(i32 0, i32 0)
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i32 @foo(i32 1, i32 0)
  %15 = icmp ne i32 %14, 2
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  %18 = call i32 @foo(i32 -2, i32 1)
  %19 = icmp ne i32 %18, -2
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %17
  %22 = call i32 @foo(i32 -1, i32 1)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %21
  %26 = call i32 @foo(i32 0, i32 1)
  %27 = icmp ne i32 %26, 2
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %25
  %30 = call i32 @foo(i32 1, i32 1)
  %31 = icmp ne i32 %30, 3
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:33                                      ; preds = %29
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
