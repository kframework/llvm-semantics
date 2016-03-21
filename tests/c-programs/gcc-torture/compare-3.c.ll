; ModuleID = './compare-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @test1(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp eq i32 %3, %4
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %1, align 4
  %8 = load i32, i32* %2, align 4
  %9 = icmp ne i32 %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  call void @link_error0()
  br label %11

; <label>:11                                      ; preds = %10, %6, %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @test2(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %1, align 4
  %8 = load i32, i32* %2, align 4
  %9 = icmp sgt i32 %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  call void @link_error0()
  br label %11

; <label>:11                                      ; preds = %10, %6, %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @test3(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %2, align 4
  %8 = load i32, i32* %1, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  call void @link_error0()
  br label %11

; <label>:11                                      ; preds = %10, %6, %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @test4(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp eq i32 %3, %4
  br i1 %5, label %10, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %1, align 4
  %8 = load i32, i32* %2, align 4
  %9 = icmp ne i32 %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6, %0
  br label %12

; <label>:11                                      ; preds = %6
  call void @link_error1()
  br label %12

; <label>:12                                      ; preds = %11, %10
  ret void
}

; Function Attrs: nounwind uwtable
define void @test5(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp sge i32 %3, %4
  br i1 %5, label %10, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %1, align 4
  %8 = load i32, i32* %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6, %0
  br label %12

; <label>:11                                      ; preds = %6
  call void @link_error1()
  br label %12

; <label>:12                                      ; preds = %11, %10
  ret void
}

; Function Attrs: nounwind uwtable
define void @test6(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp sle i32 %3, %4
  br i1 %5, label %10, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %2, align 4
  %8 = load i32, i32* %1, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6, %0
  br label %12

; <label>:11                                      ; preds = %6
  call void @link_error1()
  br label %12

; <label>:12                                      ; preds = %11, %10
  ret void
}

; Function Attrs: nounwind uwtable
define void @all_tests(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  call void @test1(i32 %3, i32 %4)
  %5 = load i32, i32* %1, align 4
  %6 = load i32, i32* %2, align 4
  call void @test2(i32 %5, i32 %6)
  %7 = load i32, i32* %1, align 4
  %8 = load i32, i32* %2, align 4
  call void @test3(i32 %7, i32 %8)
  %9 = load i32, i32* %1, align 4
  %10 = load i32, i32* %2, align 4
  call void @test4(i32 %9, i32 %10)
  %11 = load i32, i32* %1, align 4
  %12 = load i32, i32* %2, align 4
  call void @test5(i32 %11, i32 %12)
  %13 = load i32, i32* %1, align 4
  %14 = load i32, i32* %2, align 4
  call void @test6(i32 %13, i32 %14)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @all_tests(i32 0, i32 0)
  call void @all_tests(i32 1, i32 2)
  call void @all_tests(i32 4, i32 3)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define void @link_error0() #0 {
  ret void
}

; Function Attrs: nounwind uwtable
define void @link_error1() #0 {
  ret void
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
