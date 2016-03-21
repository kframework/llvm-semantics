; ModuleID = './951003-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i32 %i) #0 {
  %1 = alloca i32, align 4
  store i32 %i, i32* %1, align 4
  ret i32 12
}

; Function Attrs: nounwind uwtable
define i32 @g() #0 {
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %s = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %21, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 32
  br i1 %4, label %5, label %24

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = call i32 @f(i32 %6)
  store i32 %7, i32* %s, align 4
  %8 = load i32, i32* %i, align 4
  %9 = call i32 @g()
  %10 = icmp eq i32 %8, %9
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %5
  store i32 42, i32* %s, align 4
  br label %12

; <label>:12                                      ; preds = %11, %5
  %13 = load i32, i32* %i, align 4
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %18, label %15

; <label>:15                                      ; preds = %12
  %16 = load i32, i32* %s, align 4
  %17 = icmp eq i32 %16, 12
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %15, %12
  br label %20

; <label>:19                                      ; preds = %15
  call void @abort() #2
  unreachable

; <label>:20                                      ; preds = %18
  br label %21

; <label>:21                                      ; preds = %20
  %22 = load i32, i32* %i, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %i, align 4
  br label %2

; <label>:24                                      ; preds = %2
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %26 = load i32, i32* %1
  ret i32 %26
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
