; ModuleID = './20070623-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define i32 @nge(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp sge i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = sub nsw i32 0, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define i32 @ngt(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp sgt i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = sub nsw i32 0, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define i32 @nle(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp sle i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = sub nsw i32 0, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define i32 @nlt(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp slt i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = sub nsw i32 0, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define i32 @neq(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp eq i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = sub nsw i32 0, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define i32 @nne(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp ne i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = sub nsw i32 0, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define i32 @ngeu(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp uge i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = sub nsw i32 0, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define i32 @ngtu(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp ugt i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = sub nsw i32 0, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define i32 @nleu(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp ule i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = sub nsw i32 0, %6
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define i32 @nltu(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = icmp ult i32 %3, %4
  %6 = zext i1 %5 to i32
  %7 = sub nsw i32 0, %6
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @nge(i32 -2147483648, i32 2147483647)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @nge(i32 2147483647, i32 -2147483648)
  %7 = icmp ne i32 %6, -1
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #3
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @ngt(i32 -2147483648, i32 2147483647)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #3
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i32 @ngt(i32 2147483647, i32 -2147483648)
  %15 = icmp ne i32 %14, -1
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %13
  %18 = call i32 @nle(i32 -2147483648, i32 2147483647)
  %19 = icmp ne i32 %18, -1
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #3
  unreachable

; <label>:21                                      ; preds = %17
  %22 = call i32 @nle(i32 2147483647, i32 -2147483648)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #3
  unreachable

; <label>:25                                      ; preds = %21
  %26 = call i32 @nlt(i32 -2147483648, i32 2147483647)
  %27 = icmp ne i32 %26, -1
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #3
  unreachable

; <label>:29                                      ; preds = %25
  %30 = call i32 @nlt(i32 2147483647, i32 -2147483648)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #3
  unreachable

; <label>:33                                      ; preds = %29
  %34 = call i32 @neq(i32 -2147483648, i32 2147483647)
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  call void @abort() #3
  unreachable

; <label>:37                                      ; preds = %33
  %38 = call i32 @neq(i32 2147483647, i32 -2147483648)
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37
  call void @abort() #3
  unreachable

; <label>:41                                      ; preds = %37
  %42 = call i32 @nne(i32 -2147483648, i32 2147483647)
  %43 = icmp ne i32 %42, -1
  br i1 %43, label %44, label %45

; <label>:44                                      ; preds = %41
  call void @abort() #3
  unreachable

; <label>:45                                      ; preds = %41
  %46 = call i32 @nne(i32 2147483647, i32 -2147483648)
  %47 = icmp ne i32 %46, -1
  br i1 %47, label %48, label %49

; <label>:48                                      ; preds = %45
  call void @abort() #3
  unreachable

; <label>:49                                      ; preds = %45
  %50 = call i32 @ngeu(i32 0, i32 -1)
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %53

; <label>:52                                      ; preds = %49
  call void @abort() #3
  unreachable

; <label>:53                                      ; preds = %49
  %54 = call i32 @ngeu(i32 -1, i32 0)
  %55 = icmp ne i32 %54, -1
  br i1 %55, label %56, label %57

; <label>:56                                      ; preds = %53
  call void @abort() #3
  unreachable

; <label>:57                                      ; preds = %53
  %58 = call i32 @ngtu(i32 0, i32 -1)
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %61

; <label>:60                                      ; preds = %57
  call void @abort() #3
  unreachable

; <label>:61                                      ; preds = %57
  %62 = call i32 @ngtu(i32 -1, i32 0)
  %63 = icmp ne i32 %62, -1
  br i1 %63, label %64, label %65

; <label>:64                                      ; preds = %61
  call void @abort() #3
  unreachable

; <label>:65                                      ; preds = %61
  %66 = call i32 @nleu(i32 0, i32 -1)
  %67 = icmp ne i32 %66, -1
  br i1 %67, label %68, label %69

; <label>:68                                      ; preds = %65
  call void @abort() #3
  unreachable

; <label>:69                                      ; preds = %65
  %70 = call i32 @nleu(i32 -1, i32 0)
  %71 = icmp ne i32 %70, 0
  br i1 %71, label %72, label %73

; <label>:72                                      ; preds = %69
  call void @abort() #3
  unreachable

; <label>:73                                      ; preds = %69
  %74 = call i32 @nltu(i32 0, i32 -1)
  %75 = icmp ne i32 %74, -1
  br i1 %75, label %76, label %77

; <label>:76                                      ; preds = %73
  call void @abort() #3
  unreachable

; <label>:77                                      ; preds = %73
  %78 = call i32 @nltu(i32 -1, i32 0)
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %81

; <label>:80                                      ; preds = %77
  call void @abort() #3
  unreachable

; <label>:81                                      ; preds = %77
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %83 = load i32, i32* %1
  ret i32 %83
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
