; ModuleID = './991216-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @test1(i32 %a, i64 %value, i32 %after) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i64 %value, i64* %2, align 8
  store i32 %after, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = icmp ne i32 %4, 1
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = load i64, i64* %2, align 8
  %8 = icmp ne i64 %7, 81985529216486895
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32, i32* %3, align 4
  %11 = icmp ne i32 %10, 85
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9, %6, %0
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @test2(i32 %a, i32 %b, i64 %value, i32 %after) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i64 %value, i64* %3, align 8
  store i32 %after, i32* %4, align 4
  %5 = load i32, i32* %1, align 4
  %6 = icmp ne i32 %5, 1
  br i1 %6, label %16, label %7

; <label>:7                                       ; preds = %0
  %8 = load i32, i32* %2, align 4
  %9 = icmp ne i32 %8, 2
  br i1 %9, label %16, label %10

; <label>:10                                      ; preds = %7
  %11 = load i64, i64* %3, align 8
  %12 = icmp ne i64 %11, 81985529216486895
  br i1 %12, label %16, label %13

; <label>:13                                      ; preds = %10
  %14 = load i32, i32* %4, align 4
  %15 = icmp ne i32 %14, 85
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13, %10, %7, %0
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  ret void
}

; Function Attrs: nounwind uwtable
define void @test3(i32 %a, i32 %b, i32 %c, i64 %value, i32 %after) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i64 %value, i64* %4, align 8
  store i32 %after, i32* %5, align 4
  %6 = load i32, i32* %1, align 4
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %20, label %8

; <label>:8                                       ; preds = %0
  %9 = load i32, i32* %2, align 4
  %10 = icmp ne i32 %9, 2
  br i1 %10, label %20, label %11

; <label>:11                                      ; preds = %8
  %12 = load i32, i32* %3, align 4
  %13 = icmp ne i32 %12, 3
  br i1 %13, label %20, label %14

; <label>:14                                      ; preds = %11
  %15 = load i64, i64* %4, align 8
  %16 = icmp ne i64 %15, 81985529216486895
  br i1 %16, label %20, label %17

; <label>:17                                      ; preds = %14
  %18 = load i32, i32* %5, align 4
  %19 = icmp ne i32 %18, 85
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17, %14, %11, %8, %0
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %17
  ret void
}

; Function Attrs: nounwind uwtable
define void @test4(i32 %a, i32 %b, i32 %c, i32 %d, i64 %value, i32 %after) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  store i64 %value, i64* %5, align 8
  store i32 %after, i32* %6, align 4
  %7 = load i32, i32* %1, align 4
  %8 = icmp ne i32 %7, 1
  br i1 %8, label %24, label %9

; <label>:9                                       ; preds = %0
  %10 = load i32, i32* %2, align 4
  %11 = icmp ne i32 %10, 2
  br i1 %11, label %24, label %12

; <label>:12                                      ; preds = %9
  %13 = load i32, i32* %3, align 4
  %14 = icmp ne i32 %13, 3
  br i1 %14, label %24, label %15

; <label>:15                                      ; preds = %12
  %16 = load i32, i32* %4, align 4
  %17 = icmp ne i32 %16, 4
  br i1 %17, label %24, label %18

; <label>:18                                      ; preds = %15
  %19 = load i64, i64* %5, align 8
  %20 = icmp ne i64 %19, 81985529216486895
  br i1 %20, label %24, label %21

; <label>:21                                      ; preds = %18
  %22 = load i32, i32* %6, align 4
  %23 = icmp ne i32 %22, 85
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21, %18, %15, %12, %9, %0
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %21
  ret void
}

; Function Attrs: nounwind uwtable
define void @test5(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i64 %value, i32 %after) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  store i32 %e, i32* %5, align 4
  store i64 %value, i64* %6, align 8
  store i32 %after, i32* %7, align 4
  %8 = load i32, i32* %1, align 4
  %9 = icmp ne i32 %8, 1
  br i1 %9, label %28, label %10

; <label>:10                                      ; preds = %0
  %11 = load i32, i32* %2, align 4
  %12 = icmp ne i32 %11, 2
  br i1 %12, label %28, label %13

; <label>:13                                      ; preds = %10
  %14 = load i32, i32* %3, align 4
  %15 = icmp ne i32 %14, 3
  br i1 %15, label %28, label %16

; <label>:16                                      ; preds = %13
  %17 = load i32, i32* %4, align 4
  %18 = icmp ne i32 %17, 4
  br i1 %18, label %28, label %19

; <label>:19                                      ; preds = %16
  %20 = load i32, i32* %5, align 4
  %21 = icmp ne i32 %20, 5
  br i1 %21, label %28, label %22

; <label>:22                                      ; preds = %19
  %23 = load i64, i64* %6, align 8
  %24 = icmp ne i64 %23, 81985529216486895
  br i1 %24, label %28, label %25

; <label>:25                                      ; preds = %22
  %26 = load i32, i32* %7, align 4
  %27 = icmp ne i32 %26, 85
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25, %22, %19, %16, %13, %10, %0
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %25
  ret void
}

; Function Attrs: nounwind uwtable
define void @test6(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i64 %value, i32 %after) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  store i32 %e, i32* %5, align 4
  store i32 %f, i32* %6, align 4
  store i64 %value, i64* %7, align 8
  store i32 %after, i32* %8, align 4
  %9 = load i32, i32* %1, align 4
  %10 = icmp ne i32 %9, 1
  br i1 %10, label %32, label %11

; <label>:11                                      ; preds = %0
  %12 = load i32, i32* %2, align 4
  %13 = icmp ne i32 %12, 2
  br i1 %13, label %32, label %14

; <label>:14                                      ; preds = %11
  %15 = load i32, i32* %3, align 4
  %16 = icmp ne i32 %15, 3
  br i1 %16, label %32, label %17

; <label>:17                                      ; preds = %14
  %18 = load i32, i32* %4, align 4
  %19 = icmp ne i32 %18, 4
  br i1 %19, label %32, label %20

; <label>:20                                      ; preds = %17
  %21 = load i32, i32* %5, align 4
  %22 = icmp ne i32 %21, 5
  br i1 %22, label %32, label %23

; <label>:23                                      ; preds = %20
  %24 = load i32, i32* %6, align 4
  %25 = icmp ne i32 %24, 6
  br i1 %25, label %32, label %26

; <label>:26                                      ; preds = %23
  %27 = load i64, i64* %7, align 8
  %28 = icmp ne i64 %27, 81985529216486895
  br i1 %28, label %32, label %29

; <label>:29                                      ; preds = %26
  %30 = load i32, i32* %8, align 4
  %31 = icmp ne i32 %30, 85
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29, %26, %23, %20, %17, %14, %11, %0
  call void @abort() #2
  unreachable

; <label>:33                                      ; preds = %29
  ret void
}

; Function Attrs: nounwind uwtable
define void @test7(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i64 %value, i32 %after) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  store i32 %e, i32* %5, align 4
  store i32 %f, i32* %6, align 4
  store i32 %g, i32* %7, align 4
  store i64 %value, i64* %8, align 8
  store i32 %after, i32* %9, align 4
  %10 = load i32, i32* %1, align 4
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %36, label %12

; <label>:12                                      ; preds = %0
  %13 = load i32, i32* %2, align 4
  %14 = icmp ne i32 %13, 2
  br i1 %14, label %36, label %15

; <label>:15                                      ; preds = %12
  %16 = load i32, i32* %3, align 4
  %17 = icmp ne i32 %16, 3
  br i1 %17, label %36, label %18

; <label>:18                                      ; preds = %15
  %19 = load i32, i32* %4, align 4
  %20 = icmp ne i32 %19, 4
  br i1 %20, label %36, label %21

; <label>:21                                      ; preds = %18
  %22 = load i32, i32* %5, align 4
  %23 = icmp ne i32 %22, 5
  br i1 %23, label %36, label %24

; <label>:24                                      ; preds = %21
  %25 = load i32, i32* %6, align 4
  %26 = icmp ne i32 %25, 6
  br i1 %26, label %36, label %27

; <label>:27                                      ; preds = %24
  %28 = load i32, i32* %7, align 4
  %29 = icmp ne i32 %28, 7
  br i1 %29, label %36, label %30

; <label>:30                                      ; preds = %27
  %31 = load i64, i64* %8, align 8
  %32 = icmp ne i64 %31, 81985529216486895
  br i1 %32, label %36, label %33

; <label>:33                                      ; preds = %30
  %34 = load i32, i32* %9, align 4
  %35 = icmp ne i32 %34, 85
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33, %30, %27, %24, %21, %18, %15, %12, %0
  call void @abort() #2
  unreachable

; <label>:37                                      ; preds = %33
  ret void
}

; Function Attrs: nounwind uwtable
define void @test8(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i64 %value, i32 %after) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i32 %c, i32* %3, align 4
  store i32 %d, i32* %4, align 4
  store i32 %e, i32* %5, align 4
  store i32 %f, i32* %6, align 4
  store i32 %g, i32* %7, align 4
  store i32 %h, i32* %8, align 4
  store i64 %value, i64* %9, align 8
  store i32 %after, i32* %10, align 4
  %11 = load i32, i32* %1, align 4
  %12 = icmp ne i32 %11, 1
  br i1 %12, label %40, label %13

; <label>:13                                      ; preds = %0
  %14 = load i32, i32* %2, align 4
  %15 = icmp ne i32 %14, 2
  br i1 %15, label %40, label %16

; <label>:16                                      ; preds = %13
  %17 = load i32, i32* %3, align 4
  %18 = icmp ne i32 %17, 3
  br i1 %18, label %40, label %19

; <label>:19                                      ; preds = %16
  %20 = load i32, i32* %4, align 4
  %21 = icmp ne i32 %20, 4
  br i1 %21, label %40, label %22

; <label>:22                                      ; preds = %19
  %23 = load i32, i32* %5, align 4
  %24 = icmp ne i32 %23, 5
  br i1 %24, label %40, label %25

; <label>:25                                      ; preds = %22
  %26 = load i32, i32* %6, align 4
  %27 = icmp ne i32 %26, 6
  br i1 %27, label %40, label %28

; <label>:28                                      ; preds = %25
  %29 = load i32, i32* %7, align 4
  %30 = icmp ne i32 %29, 7
  br i1 %30, label %40, label %31

; <label>:31                                      ; preds = %28
  %32 = load i32, i32* %8, align 4
  %33 = icmp ne i32 %32, 8
  br i1 %33, label %40, label %34

; <label>:34                                      ; preds = %31
  %35 = load i64, i64* %9, align 8
  %36 = icmp ne i64 %35, 81985529216486895
  br i1 %36, label %40, label %37

; <label>:37                                      ; preds = %34
  %38 = load i32, i32* %10, align 4
  %39 = icmp ne i32 %38, 85
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37, %34, %31, %28, %25, %22, %19, %16, %13, %0
  call void @abort() #2
  unreachable

; <label>:41                                      ; preds = %37
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @test1(i32 1, i64 81985529216486895, i32 85)
  call void @test2(i32 1, i32 2, i64 81985529216486895, i32 85)
  call void @test3(i32 1, i32 2, i32 3, i64 81985529216486895, i32 85)
  call void @test4(i32 1, i32 2, i32 3, i32 4, i64 81985529216486895, i32 85)
  call void @test5(i32 1, i32 2, i32 3, i32 4, i32 5, i64 81985529216486895, i32 85)
  call void @test6(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i64 81985529216486895, i32 85)
  call void @test7(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i64 81985529216486895, i32 85)
  call void @test8(i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i64 81985529216486895, i32 85)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
