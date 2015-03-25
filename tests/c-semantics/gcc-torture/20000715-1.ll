; ModuleID = './20000715-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = common global i32 0, align 4
@y = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @test1() #0 {
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 3, i32* %x, align 4
  store i32 2, i32* %y, align 4
  %1 = load i32* %x, align 4
  %2 = load i32* %y, align 4
  %3 = icmp slt i32 %1, %2
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load i32* %x, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* %x, align 4
  br label %10

; <label>:7                                       ; preds = %0
  %8 = load i32* %y, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %y, align 4
  br label %10

; <label>:10                                      ; preds = %7, %4
  %11 = phi i32 [ %5, %4 ], [ %8, %7 ]
  %12 = icmp ne i32 %11, 2
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:14                                      ; preds = %10
  %15 = load i32* %x, align 4
  %16 = icmp ne i32 %15, 3
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %14
  call void @abort() #2
  unreachable

; <label>:18                                      ; preds = %14
  %19 = load i32* %y, align 4
  %20 = icmp ne i32 %19, 3
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  call void @abort() #2
  unreachable

; <label>:22                                      ; preds = %18
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @test2() #0 {
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 3, i32* %x, align 4
  store i32 2, i32* %y, align 4
  %1 = load i32* %x, align 4
  %2 = load i32* %y, align 4
  %3 = icmp slt i32 %1, %2
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load i32* %x, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* %x, align 4
  br label %10

; <label>:7                                       ; preds = %0
  %8 = load i32* %y, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %y, align 4
  br label %10

; <label>:10                                      ; preds = %7, %4
  %11 = phi i32 [ %5, %4 ], [ %8, %7 ]
  store i32 %11, i32* %z, align 4
  %12 = load i32* %z, align 4
  %13 = icmp ne i32 %12, 2
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %10
  %16 = load i32* %x, align 4
  %17 = icmp ne i32 %16, 3
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %15
  %20 = load i32* %y, align 4
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %19
  call void @abort() #2
  unreachable

; <label>:23                                      ; preds = %19
  ret void
}

; Function Attrs: nounwind uwtable
define void @test3() #0 {
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %xx = alloca i32, align 4
  %yy = alloca i32, align 4
  store i32 3, i32* %x, align 4
  store i32 2, i32* %y, align 4
  store i32 3, i32* %xx, align 4
  store i32 2, i32* %yy, align 4
  %1 = load i32* %xx, align 4
  %2 = load i32* %yy, align 4
  %3 = icmp slt i32 %1, %2
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load i32* %x, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* %x, align 4
  br label %10

; <label>:7                                       ; preds = %0
  %8 = load i32* %y, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* %y, align 4
  br label %10

; <label>:10                                      ; preds = %7, %4
  %11 = phi i32 [ %5, %4 ], [ %8, %7 ]
  %12 = icmp ne i32 %11, 2
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:14                                      ; preds = %10
  %15 = load i32* %x, align 4
  %16 = icmp ne i32 %15, 3
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %14
  call void @abort() #2
  unreachable

; <label>:18                                      ; preds = %14
  %19 = load i32* %y, align 4
  %20 = icmp ne i32 %19, 3
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  call void @abort() #2
  unreachable

; <label>:22                                      ; preds = %18
  ret void
}

; Function Attrs: nounwind uwtable
define void @test4() #0 {
  call void @init_xy()
  %1 = load i32* @x, align 4
  %2 = load i32* @y, align 4
  %3 = icmp slt i32 %1, %2
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load i32* @x, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* @x, align 4
  br label %10

; <label>:7                                       ; preds = %0
  %8 = load i32* @y, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* @y, align 4
  br label %10

; <label>:10                                      ; preds = %7, %4
  %11 = phi i32 [ %5, %4 ], [ %8, %7 ]
  %12 = icmp ne i32 %11, 2
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:14                                      ; preds = %10
  %15 = load i32* @x, align 4
  %16 = icmp ne i32 %15, 3
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %14
  call void @abort() #2
  unreachable

; <label>:18                                      ; preds = %14
  %19 = load i32* @y, align 4
  %20 = icmp ne i32 %19, 3
  br i1 %20, label %21, label %22

; <label>:21                                      ; preds = %18
  call void @abort() #2
  unreachable

; <label>:22                                      ; preds = %18
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @init_xy() #0 {
  store i32 3, i32* @x, align 4
  store i32 2, i32* @y, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @test5() #0 {
  %z = alloca i32, align 4
  call void @init_xy()
  %1 = load i32* @x, align 4
  %2 = load i32* @y, align 4
  %3 = icmp slt i32 %1, %2
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load i32* @x, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* @x, align 4
  br label %10

; <label>:7                                       ; preds = %0
  %8 = load i32* @y, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* @y, align 4
  br label %10

; <label>:10                                      ; preds = %7, %4
  %11 = phi i32 [ %5, %4 ], [ %8, %7 ]
  store i32 %11, i32* %z, align 4
  %12 = load i32* %z, align 4
  %13 = icmp ne i32 %12, 2
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %10
  %16 = load i32* @x, align 4
  %17 = icmp ne i32 %16, 3
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %15
  %20 = load i32* @y, align 4
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %19
  call void @abort() #2
  unreachable

; <label>:23                                      ; preds = %19
  ret void
}

; Function Attrs: nounwind uwtable
define void @test6() #0 {
  %xx = alloca i32, align 4
  %yy = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 3, i32* %xx, align 4
  store i32 2, i32* %yy, align 4
  call void @init_xy()
  %1 = load i32* %xx, align 4
  %2 = load i32* @y, align 4
  %3 = icmp slt i32 %1, %2
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load i32* @x, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* @x, align 4
  br label %10

; <label>:7                                       ; preds = %0
  %8 = load i32* @y, align 4
  %9 = add nsw i32 %8, 1
  store i32 %9, i32* @y, align 4
  br label %10

; <label>:10                                      ; preds = %7, %4
  %11 = phi i32 [ %5, %4 ], [ %8, %7 ]
  store i32 %11, i32* %z, align 4
  %12 = load i32* %z, align 4
  %13 = icmp ne i32 %12, 2
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %10
  %16 = load i32* @x, align 4
  %17 = icmp ne i32 %16, 3
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:19                                      ; preds = %15
  %20 = load i32* @y, align 4
  %21 = icmp ne i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %19
  call void @abort() #2
  unreachable

; <label>:23                                      ; preds = %19
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @test1()
  call void @test2()
  call void @test3()
  call void @test4()
  call void @test5()
  call void @test6()
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
