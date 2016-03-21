; ModuleID = './20070517-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @example(i32 10)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @example(i32 %arg) #0 {
  %1 = alloca i32, align 4
  %tmp = alloca i32, align 4
  %kind = alloca i32, align 4
  store i32 %arg, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = call i32 @get_kind(i32 %2)
  store i32 %3, i32* %kind, align 4
  %4 = load i32, i32* %kind, align 4
  %5 = icmp eq i32 %4, 9
  br i1 %5, label %12, label %6

; <label>:6                                       ; preds = %0
  %7 = load i32, i32* %kind, align 4
  %8 = icmp eq i32 %7, 10
  br i1 %8, label %12, label %9

; <label>:9                                       ; preds = %6
  %10 = load i32, i32* %kind, align 4
  %11 = icmp eq i32 %10, 5
  br i1 %11, label %12, label %26

; <label>:12                                      ; preds = %9, %6, %0
  %13 = call i32 @some_call()
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %25

; <label>:15                                      ; preds = %12
  %16 = load i32, i32* %kind, align 4
  %17 = icmp eq i32 %16, 9
  br i1 %17, label %21, label %18

; <label>:18                                      ; preds = %15
  %19 = load i32, i32* %kind, align 4
  %20 = icmp eq i32 %19, 10
  br i1 %20, label %21, label %23

; <label>:21                                      ; preds = %18, %15
  %22 = load i32, i32* %1, align 4
  store i32 %22, i32* %tmp, align 4
  br label %24

; <label>:23                                      ; preds = %18
  call void @abort() #3
  unreachable

; <label>:24                                      ; preds = %21
  br label %25

; <label>:25                                      ; preds = %24, %12
  br label %26

; <label>:26                                      ; preds = %25, %9
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @get_kind(i32 %v) #1 {
  %1 = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %v, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  store volatile i32 %2, i32* %k, align 4
  %3 = load volatile i32, i32* %k, align 4
  ret i32 %3
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @some_call() #1 {
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
