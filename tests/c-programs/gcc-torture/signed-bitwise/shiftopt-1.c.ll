; ModuleID = './shiftopt-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @utest(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = lshr i32 %2, 0
  %4 = load i32, i32* %1, align 4
  %5 = icmp ne i32 %3, %4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @link_error()
  br label %7

; <label>:7                                       ; preds = %6, %0
  %8 = load i32, i32* %1, align 4
  %9 = shl i32 %8, 0
  %10 = load i32, i32* %1, align 4
  %11 = icmp ne i32 %9, %10
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %7
  call void @link_error()
  br label %13

; <label>:13                                      ; preds = %12, %7
  %14 = load i32, i32* %1, align 4
  %15 = shl i32 0, %14
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %13
  call void @link_error()
  br label %18

; <label>:18                                      ; preds = %17, %13
  %19 = load i32, i32* %1, align 4
  %20 = ashr i32 0, %19
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %18
  call void @link_error()
  br label %23

; <label>:23                                      ; preds = %22, %18
  %24 = load i32, i32* %1, align 4
  %25 = ashr i32 -1, %24
  %26 = icmp ne i32 %25, -1
  br i1 %26, label %27, label %28

; <label>:27                                      ; preds = %23
  call void @link_error()
  br label %28

; <label>:28                                      ; preds = %27, %23
  %29 = load i32, i32* %1, align 4
  %30 = ashr i32 -1, %29
  %31 = icmp ne i32 %30, -1
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %28
  call void @link_error()
  br label %33

; <label>:33                                      ; preds = %32, %28
  ret void
}

; Function Attrs: nounwind uwtable
define void @link_error() #0 {
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define void @stest(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = ashr i32 %2, 0
  %4 = load i32, i32* %1, align 4
  %5 = icmp ne i32 %3, %4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @link_error()
  br label %7

; <label>:7                                       ; preds = %6, %0
  %8 = load i32, i32* %1, align 4
  %9 = shl i32 %8, 0
  %10 = load i32, i32* %1, align 4
  %11 = icmp ne i32 %9, %10
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %7
  call void @link_error()
  br label %13

; <label>:13                                      ; preds = %12, %7
  %14 = load i32, i32* %1, align 4
  %15 = shl i32 0, %14
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %18

; <label>:17                                      ; preds = %13
  call void @link_error()
  br label %18

; <label>:18                                      ; preds = %17, %13
  %19 = load i32, i32* %1, align 4
  %20 = ashr i32 0, %19
  %21 = icmp ne i32 %20, 0
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %18
  call void @link_error()
  br label %23

; <label>:23                                      ; preds = %22, %18
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @utest(i32 9)
  call void @utest(i32 0)
  call void @stest(i32 9)
  call void @stest(i32 0)
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
