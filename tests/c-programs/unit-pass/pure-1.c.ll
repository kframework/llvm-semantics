; ModuleID = './pure-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@i = global i32 2, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca [10 x i32], align 16
  %r = alloca i32, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 0
  store i32 0, i32* %2, align 4
  %3 = call i32 @func0(i32 0) #3
  store i32 %3, i32* %r, align 4
  %4 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 0
  %5 = load i32, i32* %4, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @link_error0()
  br label %8

; <label>:8                                       ; preds = %7, %0
  %9 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 1
  store i32 0, i32* %9, align 4
  %10 = call i32 @func1(i32 0) #4
  store i32 %10, i32* %r, align 4
  %11 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 1
  %12 = load i32, i32* %11, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %8
  call void @link_error1()
  br label %15

; <label>:15                                      ; preds = %14, %8
  %16 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 2
  store i32 0, i32* %16, align 4
  %17 = call i32 @func2(i32 0)
  store i32 %17, i32* %r, align 4
  %18 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 2
  %19 = load i32, i32* %18, align 4
  %20 = icmp ne i32 %19, 0
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %15
  call void @link_error2()
  br label %22

; <label>:22                                      ; preds = %21, %15
  %23 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 3
  store i32 0, i32* %23, align 4
  %24 = call i32 @func3(i32 0)
  store i32 %24, i32* %r, align 4
  %25 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 3
  %26 = load i32, i32* %25, align 4
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %22
  call void @link_error3()
  br label %29

; <label>:29                                      ; preds = %28, %22
  %30 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 4
  store i32 0, i32* %30, align 4
  %31 = call i32 @func4(i32 0)
  store i32 %31, i32* %r, align 4
  %32 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 4
  %33 = load i32, i32* %32, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %36

; <label>:35                                      ; preds = %29
  call void @link_error4()
  br label %36

; <label>:36                                      ; preds = %35, %29
  %37 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 5
  store i32 0, i32* %37, align 4
  %38 = call i32 @func5(i32 0)
  store i32 %38, i32* %r, align 4
  %39 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 5
  %40 = load i32, i32* %39, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %36
  call void @link_error5()
  br label %43

; <label>:43                                      ; preds = %42, %36
  %44 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 6
  store i32 0, i32* %44, align 4
  %45 = call i32 @func6(i32 0)
  store i32 %45, i32* %r, align 4
  %46 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 6
  %47 = load i32, i32* %46, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %50

; <label>:49                                      ; preds = %43
  call void @link_error6()
  br label %50

; <label>:50                                      ; preds = %49, %43
  %51 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 7
  store i32 0, i32* %51, align 4
  %52 = call i32 @func7(i32 0)
  store i32 %52, i32* %r, align 4
  %53 = getelementptr inbounds [10 x i32], [10 x i32]* %i, i32 0, i64 7
  %54 = load i32, i32* %53, align 4
  %55 = icmp ne i32 %54, 0
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %50
  call void @link_error7()
  br label %57

; <label>:57                                      ; preds = %56, %50
  %58 = load i32, i32* %r, align 4
  ret i32 %58
}

; Function Attrs: nounwind readonly uwtable
define i32 @func0(i32 %a) #1 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* @i, align 4
  %4 = sub nsw i32 %2, %3
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define void @link_error0() #0 {
  ret void
}

; Function Attrs: nounwind readnone uwtable
define i32 @func1(i32 %a) #2 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* %1, align 4
  %4 = sub nsw i32 %2, %3
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define void @link_error1() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @func2(i32 %a) #0 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  %2 = load i32, i32* @i, align 4
  %3 = load i32, i32* %1, align 4
  %4 = add nsw i32 %2, %3
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define void @link_error2() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @func3(i32 %a) #0 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = mul nsw i32 %2, 3
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define void @link_error3() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @func4(i32 %a) #0 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = call i32 @func0(i32 %2) #3
  %4 = load i32, i32* %1, align 4
  %5 = add nsw i32 %3, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define void @link_error4() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @func5(i32 %a) #0 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* %1, align 4
  %4 = call i32 @func1(i32 %3) #4
  %5 = add nsw i32 %2, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define void @link_error5() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @func6(i32 %a) #0 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = call i32 @func2(i32 %2)
  %4 = load i32, i32* %1, align 4
  %5 = add nsw i32 %3, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define void @link_error6() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @func7(i32 %a) #0 {
  %1 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* %1, align 4
  %4 = call i32 @func3(i32 %3)
  %5 = add nsw i32 %2, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define void @link_error7() #0 {
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }
attributes #4 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
