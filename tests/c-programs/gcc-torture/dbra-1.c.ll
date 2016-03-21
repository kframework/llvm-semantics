; ModuleID = './dbra-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f1(i64 %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %a, i64* %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %16

; <label>:6                                       ; preds = %3
  %7 = load i64, i64* %2, align 8
  %8 = add nsw i64 %7, -1
  store i64 %8, i64* %2, align 8
  %9 = icmp eq i64 %8, -1
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = load i32, i32* %i, align 4
  store i32 %11, i32* %1
  br label %17

; <label>:12                                      ; preds = %6
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load i32, i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %3

; <label>:16                                      ; preds = %3
  store i32 -1, i32* %1
  br label %17

; <label>:17                                      ; preds = %16, %10
  %18 = load i32, i32* %1
  ret i32 %18
}

; Function Attrs: nounwind uwtable
define i32 @f2(i64 %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %a, i64* %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %16

; <label>:6                                       ; preds = %3
  %7 = load i64, i64* %2, align 8
  %8 = add nsw i64 %7, -1
  store i64 %8, i64* %2, align 8
  %9 = icmp ne i64 %8, -1
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = load i32, i32* %i, align 4
  store i32 %11, i32* %1
  br label %17

; <label>:12                                      ; preds = %6
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load i32, i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %3

; <label>:16                                      ; preds = %3
  store i32 -1, i32* %1
  br label %17

; <label>:17                                      ; preds = %16, %10
  %18 = load i32, i32* %1
  ret i32 %18
}

; Function Attrs: nounwind uwtable
define i32 @f3(i64 %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %a, i64* %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %16

; <label>:6                                       ; preds = %3
  %7 = load i64, i64* %2, align 8
  %8 = add nsw i64 %7, -1
  store i64 %8, i64* %2, align 8
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = load i32, i32* %i, align 4
  store i32 %11, i32* %1
  br label %17

; <label>:12                                      ; preds = %6
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load i32, i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %3

; <label>:16                                      ; preds = %3
  store i32 -1, i32* %1
  br label %17

; <label>:17                                      ; preds = %16, %10
  %18 = load i32, i32* %1
  ret i32 %18
}

; Function Attrs: nounwind uwtable
define i32 @f4(i64 %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %a, i64* %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %16

; <label>:6                                       ; preds = %3
  %7 = load i64, i64* %2, align 8
  %8 = add nsw i64 %7, -1
  store i64 %8, i64* %2, align 8
  %9 = icmp ne i64 %8, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = load i32, i32* %i, align 4
  store i32 %11, i32* %1
  br label %17

; <label>:12                                      ; preds = %6
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load i32, i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %3

; <label>:16                                      ; preds = %3
  store i32 -1, i32* %1
  br label %17

; <label>:17                                      ; preds = %16, %10
  %18 = load i32, i32* %1
  ret i32 %18
}

; Function Attrs: nounwind uwtable
define i32 @f5(i64 %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %a, i64* %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %16

; <label>:6                                       ; preds = %3
  %7 = load i64, i64* %2, align 8
  %8 = add nsw i64 %7, 1
  store i64 %8, i64* %2, align 8
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = load i32, i32* %i, align 4
  store i32 %11, i32* %1
  br label %17

; <label>:12                                      ; preds = %6
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load i32, i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %3

; <label>:16                                      ; preds = %3
  store i32 -1, i32* %1
  br label %17

; <label>:17                                      ; preds = %16, %10
  %18 = load i32, i32* %1
  ret i32 %18
}

; Function Attrs: nounwind uwtable
define i32 @f6(i64 %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %i = alloca i32, align 4
  store i64 %a, i64* %2, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %13, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %16

; <label>:6                                       ; preds = %3
  %7 = load i64, i64* %2, align 8
  %8 = add nsw i64 %7, 1
  store i64 %8, i64* %2, align 8
  %9 = icmp ne i64 %8, 0
  br i1 %9, label %10, label %12

; <label>:10                                      ; preds = %6
  %11 = load i32, i32* %i, align 4
  store i32 %11, i32* %1
  br label %17

; <label>:12                                      ; preds = %6
  br label %13

; <label>:13                                      ; preds = %12
  %14 = load i32, i32* %i, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %i, align 4
  br label %3

; <label>:16                                      ; preds = %3
  store i32 -1, i32* %1
  br label %17

; <label>:17                                      ; preds = %16, %10
  %18 = load i32, i32* %1
  ret i32 %18
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f1(i64 5)
  %3 = icmp ne i32 %2, 5
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @f2(i64 1)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @f2(i64 0)
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i32 @f3(i64 5)
  %15 = icmp ne i32 %14, 4
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  %18 = call i32 @f4(i64 1)
  %19 = icmp ne i32 %18, 1
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %17
  %22 = call i32 @f4(i64 0)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %21
  %26 = call i32 @f5(i64 -5)
  %27 = icmp ne i32 %26, 4
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %25
  %30 = call i32 @f6(i64 -1)
  %31 = icmp ne i32 %30, 1
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:33                                      ; preds = %29
  %34 = call i32 @f6(i64 0)
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  call void @abort() #2
  unreachable

; <label>:37                                      ; preds = %33
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %39 = load i32, i32* %1
  ret i32 %39
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
