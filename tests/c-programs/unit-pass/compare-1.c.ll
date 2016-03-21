; ModuleID = './compare-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @ieq(i32 %x, i32 %y, i32 %ok) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %ok, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp sle i32 %4, %5
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* %1, align 4
  %9 = load i32, i32* %2, align 4
  %10 = icmp sge i32 %8, %9
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %7
  %12 = load i32, i32* %3, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %15, label %14

; <label>:14                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %11
  br label %21

; <label>:16                                      ; preds = %7, %0
  %17 = load i32, i32* %3, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  call void @abort() #2
  unreachable

; <label>:20                                      ; preds = %16
  br label %21

; <label>:21                                      ; preds = %20, %15
  %22 = load i32, i32* %1, align 4
  %23 = load i32, i32* %2, align 4
  %24 = icmp sle i32 %22, %23
  br i1 %24, label %25, label %34

; <label>:25                                      ; preds = %21
  %26 = load i32, i32* %1, align 4
  %27 = load i32, i32* %2, align 4
  %28 = icmp eq i32 %26, %27
  br i1 %28, label %29, label %34

; <label>:29                                      ; preds = %25
  %30 = load i32, i32* %3, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %33, label %32

; <label>:32                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:33                                      ; preds = %29
  br label %39

; <label>:34                                      ; preds = %25, %21
  %35 = load i32, i32* %3, align 4
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %38

; <label>:37                                      ; preds = %34
  call void @abort() #2
  unreachable

; <label>:38                                      ; preds = %34
  br label %39

; <label>:39                                      ; preds = %38, %33
  %40 = load i32, i32* %1, align 4
  %41 = load i32, i32* %2, align 4
  %42 = icmp sle i32 %40, %41
  br i1 %42, label %43, label %52

; <label>:43                                      ; preds = %39
  %44 = load i32, i32* %2, align 4
  %45 = load i32, i32* %1, align 4
  %46 = icmp sle i32 %44, %45
  br i1 %46, label %47, label %52

; <label>:47                                      ; preds = %43
  %48 = load i32, i32* %3, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %51, label %50

; <label>:50                                      ; preds = %47
  call void @abort() #2
  unreachable

; <label>:51                                      ; preds = %47
  br label %57

; <label>:52                                      ; preds = %43, %39
  %53 = load i32, i32* %3, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %56

; <label>:55                                      ; preds = %52
  call void @abort() #2
  unreachable

; <label>:56                                      ; preds = %52
  br label %57

; <label>:57                                      ; preds = %56, %51
  %58 = load i32, i32* %2, align 4
  %59 = load i32, i32* %1, align 4
  %60 = icmp eq i32 %58, %59
  br i1 %60, label %61, label %70

; <label>:61                                      ; preds = %57
  %62 = load i32, i32* %1, align 4
  %63 = load i32, i32* %2, align 4
  %64 = icmp sle i32 %62, %63
  br i1 %64, label %65, label %70

; <label>:65                                      ; preds = %61
  %66 = load i32, i32* %3, align 4
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %69, label %68

; <label>:68                                      ; preds = %65
  call void @abort() #2
  unreachable

; <label>:69                                      ; preds = %65
  br label %75

; <label>:70                                      ; preds = %61, %57
  %71 = load i32, i32* %3, align 4
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %74

; <label>:73                                      ; preds = %70
  call void @abort() #2
  unreachable

; <label>:74                                      ; preds = %70
  br label %75

; <label>:75                                      ; preds = %74, %69
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @ine(i32 %x, i32 %y, i32 %ok) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %ok, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %11, label %7

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* %1, align 4
  %9 = load i32, i32* %2, align 4
  %10 = icmp sgt i32 %8, %9
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %7, %0
  %12 = load i32, i32* %3, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %15, label %14

; <label>:14                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %11
  br label %21

; <label>:16                                      ; preds = %7
  %17 = load i32, i32* %3, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  call void @abort() #2
  unreachable

; <label>:20                                      ; preds = %16
  br label %21

; <label>:21                                      ; preds = %20, %15
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @ilt(i32 %x, i32 %y, i32 %ok) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %ok, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* %1, align 4
  %9 = load i32, i32* %2, align 4
  %10 = icmp ne i32 %8, %9
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %7
  %12 = load i32, i32* %3, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %15, label %14

; <label>:14                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %11
  br label %21

; <label>:16                                      ; preds = %7, %0
  %17 = load i32, i32* %3, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  call void @abort() #2
  unreachable

; <label>:20                                      ; preds = %16
  br label %21

; <label>:21                                      ; preds = %20, %15
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @ile(i32 %x, i32 %y, i32 %ok) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %ok, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %11, label %7

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* %1, align 4
  %9 = load i32, i32* %2, align 4
  %10 = icmp eq i32 %8, %9
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %7, %0
  %12 = load i32, i32* %3, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %15, label %14

; <label>:14                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %11
  br label %21

; <label>:16                                      ; preds = %7
  %17 = load i32, i32* %3, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  call void @abort() #2
  unreachable

; <label>:20                                      ; preds = %16
  br label %21

; <label>:21                                      ; preds = %20, %15
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @igt(i32 %x, i32 %y, i32 %ok) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %ok, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp sgt i32 %4, %5
  br i1 %6, label %7, label %16

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* %1, align 4
  %9 = load i32, i32* %2, align 4
  %10 = icmp ne i32 %8, %9
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %7
  %12 = load i32, i32* %3, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %15, label %14

; <label>:14                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %11
  br label %21

; <label>:16                                      ; preds = %7, %0
  %17 = load i32, i32* %3, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  call void @abort() #2
  unreachable

; <label>:20                                      ; preds = %16
  br label %21

; <label>:21                                      ; preds = %20, %15
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @ige(i32 %x, i32 %y, i32 %ok) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  store i32 %ok, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = load i32, i32* %2, align 4
  %6 = icmp sgt i32 %4, %5
  br i1 %6, label %11, label %7

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* %1, align 4
  %9 = load i32, i32* %2, align 4
  %10 = icmp eq i32 %8, %9
  br i1 %10, label %11, label %16

; <label>:11                                      ; preds = %7, %0
  %12 = load i32, i32* %3, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %15, label %14

; <label>:14                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %11
  br label %21

; <label>:16                                      ; preds = %7
  %17 = load i32, i32* %3, align 4
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %19, label %20

; <label>:19                                      ; preds = %16
  call void @abort() #2
  unreachable

; <label>:20                                      ; preds = %16
  br label %21

; <label>:21                                      ; preds = %20, %15
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @ieq(i32 1, i32 4, i32 0)
  %3 = call i32 @ieq(i32 3, i32 3, i32 1)
  %4 = call i32 @ieq(i32 5, i32 2, i32 0)
  call void @ine(i32 1, i32 4, i32 1)
  call void @ine(i32 3, i32 3, i32 0)
  call void @ine(i32 5, i32 2, i32 1)
  %5 = call i32 @ilt(i32 1, i32 4, i32 1)
  %6 = call i32 @ilt(i32 3, i32 3, i32 0)
  %7 = call i32 @ilt(i32 5, i32 2, i32 0)
  %8 = call i32 @ile(i32 1, i32 4, i32 1)
  %9 = call i32 @ile(i32 3, i32 3, i32 1)
  %10 = call i32 @ile(i32 5, i32 2, i32 0)
  %11 = call i32 @igt(i32 1, i32 4, i32 0)
  %12 = call i32 @igt(i32 3, i32 3, i32 0)
  %13 = call i32 @igt(i32 5, i32 2, i32 1)
  %14 = call i32 @ige(i32 1, i32 4, i32 0)
  %15 = call i32 @ige(i32 3, i32 3, i32 1)
  %16 = call i32 @ige(i32 5, i32 2, i32 1)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
