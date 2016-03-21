; ModuleID = './20000412-4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @f(i32 %i, i32 %j, i32 %radius, i32 %width, i32 %N) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %diff = alloca i32, align 4
  %lowk = alloca i32, align 4
  %k = alloca i32, align 4
  %idx = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  store i32 %j, i32* %2, align 4
  store i32 %radius, i32* %3, align 4
  store i32 %width, i32* %4, align 4
  store i32 %N, i32* %5, align 4
  %6 = load i32, i32* %1, align 4
  %7 = load i32, i32* %3, align 4
  %8 = sub nsw i32 %6, %7
  store i32 %8, i32* %diff, align 4
  %9 = load i32, i32* %diff, align 4
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %0
  %12 = load i32, i32* %diff, align 4
  br label %14

; <label>:13                                      ; preds = %0
  br label %14

; <label>:14                                      ; preds = %13, %11
  %15 = phi i32 [ %12, %11 ], [ 0, %13 ]
  store i32 %15, i32* %lowk, align 4
  %16 = load i32, i32* %lowk, align 4
  store i32 %16, i32* %k, align 4
  br label %17

; <label>:17                                      ; preds = %36, %14
  %18 = load i32, i32* %k, align 4
  %19 = icmp sle i32 %18, 2
  br i1 %19, label %20, label %39

; <label>:20                                      ; preds = %17
  %21 = load i32, i32* %k, align 4
  %22 = load i32, i32* %1, align 4
  %23 = sub nsw i32 %21, %22
  %24 = load i32, i32* %3, align 4
  %25 = add nsw i32 %23, %24
  %26 = load i32, i32* %4, align 4
  %27 = mul nsw i32 %25, %26
  %28 = load i32, i32* %2, align 4
  %29 = sub nsw i32 %27, %28
  %30 = load i32, i32* %3, align 4
  %31 = add nsw i32 %29, %30
  store i32 %31, i32* %idx, align 4
  %32 = load i32, i32* %idx, align 4
  %33 = icmp slt i32 %32, 0
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %20
  call void @abort() #2
  unreachable

; <label>:35                                      ; preds = %20
  br label %36

; <label>:36                                      ; preds = %35
  %37 = load i32, i32* %k, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %k, align 4
  br label %17

; <label>:39                                      ; preds = %17
  %40 = load i32, i32* %lowk, align 4
  store i32 %40, i32* %k, align 4
  br label %41

; <label>:41                                      ; preds = %45, %39
  %42 = load i32, i32* %k, align 4
  %43 = icmp sle i32 %42, 2
  br i1 %43, label %44, label %48

; <label>:44                                      ; preds = %41
  br label %45

; <label>:45                                      ; preds = %44
  %46 = load i32, i32* %k, align 4
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %k, align 4
  br label %41

; <label>:48                                      ; preds = %41
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %exc_rad = alloca i32, align 4
  %N = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 2, i32* %exc_rad, align 4
  store i32 8, i32* %N, align 4
  store i32 1, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %14, %0
  %5 = load i32, i32* %i, align 4
  %6 = icmp slt i32 %5, 4
  br i1 %6, label %7, label %17

; <label>:7                                       ; preds = %4
  %8 = load i32, i32* %i, align 4
  %9 = load i32, i32* %exc_rad, align 4
  %10 = load i32, i32* %exc_rad, align 4
  %11 = mul nsw i32 2, %10
  %12 = add nsw i32 %11, 1
  %13 = load i32, i32* %N, align 4
  call void @f(i32 %8, i32 1, i32 %9, i32 %12, i32 %13)
  br label %14

; <label>:14                                      ; preds = %7
  %15 = load i32, i32* %i, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %i, align 4
  br label %4

; <label>:17                                      ; preds = %4
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %19 = load i32, i32* %1
  ret i32 %19
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
