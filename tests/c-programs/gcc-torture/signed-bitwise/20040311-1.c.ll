; ModuleID = './20040311-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @test1(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 31
  %4 = sub nsw i32 0, %3
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @test2(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 31
  %4 = sub nsw i32 0, %3
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @test3(i32 %x) #0 {
  %1 = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 31, i32* %y, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* %y, align 4
  %4 = ashr i32 %2, %3
  %5 = sub nsw i32 0, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test4(i32 %x) #0 {
  %1 = alloca i32, align 4
  %y = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 31, i32* %y, align 4
  %2 = load i32, i32* %1, align 4
  %3 = load i32, i32* %y, align 4
  %4 = lshr i32 %2, %3
  %5 = sub nsw i32 0, %4
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @test1(i32 0)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @test1(i32 1)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @test1(i32 -1)
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i32 @test2(i32 0)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  %18 = call i32 @test2(i32 1)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %17
  %22 = call i32 @test2(i32 -1)
  %23 = icmp ne i32 %22, -1
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %21
  %26 = call i32 @test3(i32 0)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %25
  %30 = call i32 @test3(i32 1)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:33                                      ; preds = %29
  %34 = call i32 @test3(i32 -1)
  %35 = icmp ne i32 %34, 1
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  call void @abort() #2
  unreachable

; <label>:37                                      ; preds = %33
  %38 = call i32 @test4(i32 0)
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37
  call void @abort() #2
  unreachable

; <label>:41                                      ; preds = %37
  %42 = call i32 @test4(i32 1)
  %43 = icmp ne i32 %42, 0
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  call void @abort() #2
  unreachable

; <label>:45                                      ; preds = %41
  %46 = call i32 @test4(i32 -1)
  %47 = icmp ne i32 %46, -1
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %45
  call void @abort() #2
  unreachable

; <label>:49                                      ; preds = %45
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
