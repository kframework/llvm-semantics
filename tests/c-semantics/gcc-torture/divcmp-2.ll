; ModuleID = './divcmp-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @test1(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, 10
  %4 = icmp eq i32 %3, 2
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test2(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, 10
  %4 = icmp eq i32 %3, 0
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test3(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, 10
  %4 = icmp eq i32 %3, -2
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test4(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp eq i32 %3, 2
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test5(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp eq i32 %3, 0
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @test6(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = sdiv i32 %2, -10
  %4 = icmp eq i32 %3, -2
  %5 = zext i1 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @test1(i32 19)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @test1(i32 20)
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @test1(i32 29)
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i32 @test1(i32 30)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  %18 = call i32 @test2(i32 -10)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %17
  %22 = call i32 @test2(i32 -9)
  %23 = icmp ne i32 %22, 1
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %21
  %26 = call i32 @test2(i32 9)
  %27 = icmp ne i32 %26, 1
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %25
  %30 = call i32 @test2(i32 10)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:33                                      ; preds = %29
  %34 = call i32 @test3(i32 -30)
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  call void @abort() #2
  unreachable

; <label>:37                                      ; preds = %33
  %38 = call i32 @test3(i32 -29)
  %39 = icmp ne i32 %38, 1
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37
  call void @abort() #2
  unreachable

; <label>:41                                      ; preds = %37
  %42 = call i32 @test3(i32 -20)
  %43 = icmp ne i32 %42, 1
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  call void @abort() #2
  unreachable

; <label>:45                                      ; preds = %41
  %46 = call i32 @test3(i32 -19)
  %47 = icmp ne i32 %46, 0
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %45
  call void @abort() #2
  unreachable

; <label>:49                                      ; preds = %45
  %50 = call i32 @test4(i32 -30)
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %49
  call void @abort() #2
  unreachable

; <label>:53                                      ; preds = %49
  %54 = call i32 @test4(i32 -29)
  %55 = icmp ne i32 %54, 1
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %53
  call void @abort() #2
  unreachable

; <label>:57                                      ; preds = %53
  %58 = call i32 @test4(i32 -20)
  %59 = icmp ne i32 %58, 1
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %57
  call void @abort() #2
  unreachable

; <label>:61                                      ; preds = %57
  %62 = call i32 @test4(i32 -19)
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %61
  call void @abort() #2
  unreachable

; <label>:65                                      ; preds = %61
  %66 = call i32 @test5(i32 -10)
  %67 = icmp ne i32 %66, 0
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %65
  call void @abort() #2
  unreachable

; <label>:69                                      ; preds = %65
  %70 = call i32 @test5(i32 -9)
  %71 = icmp ne i32 %70, 1
  br i1 %71, label %72, label %73

; <label>:72                                      ; preds = %69
  call void @abort() #2
  unreachable

; <label>:73                                      ; preds = %69
  %74 = call i32 @test5(i32 9)
  %75 = icmp ne i32 %74, 1
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %73
  call void @abort() #2
  unreachable

; <label>:77                                      ; preds = %73
  %78 = call i32 @test5(i32 10)
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %77
  call void @abort() #2
  unreachable

; <label>:81                                      ; preds = %77
  %82 = call i32 @test6(i32 19)
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %81
  call void @abort() #2
  unreachable

; <label>:85                                      ; preds = %81
  %86 = call i32 @test6(i32 20)
  %87 = icmp ne i32 %86, 1
  br i1 %87, label %88, label %89

; <label>:88                                      ; preds = %85
  call void @abort() #2
  unreachable

; <label>:89                                      ; preds = %85
  %90 = call i32 @test6(i32 29)
  %91 = icmp ne i32 %90, 1
  br i1 %91, label %92, label %93

; <label>:92                                      ; preds = %89
  call void @abort() #2
  unreachable

; <label>:93                                      ; preds = %89
  %94 = call i32 @test6(i32 30)
  %95 = icmp ne i32 %94, 0
  br i1 %95, label %96, label %97

; <label>:96                                      ; preds = %93
  call void @abort() #2
  unreachable

; <label>:97                                      ; preds = %93
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
