; ModuleID = './loop-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca [3 x i32], align 4
  store i32 0, i32* %1
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 3
  br i1 %4, label %5, label %14

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %j, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* %j, align 4
  %8 = load i32, i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [3 x i32], [3 x i32]* %k, i32 0, i64 %9
  store i32 %6, i32* %10, align 4
  br label %11

; <label>:11                                      ; preds = %5
  %12 = load i32, i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %2

; <label>:14                                      ; preds = %2
  store i32 2, i32* %i, align 4
  br label %15

; <label>:15                                      ; preds = %27, %14
  %16 = load i32, i32* %i, align 4
  %17 = icmp sge i32 %16, 0
  br i1 %17, label %18, label %30

; <label>:18                                      ; preds = %15
  %19 = load i32, i32* %i, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [3 x i32], [3 x i32]* %k, i32 0, i64 %20
  %22 = load i32, i32* %21, align 4
  %23 = load i32, i32* %i, align 4
  %24 = icmp ne i32 %22, %23
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %18
  call void @abort() #2
  unreachable

; <label>:26                                      ; preds = %18
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i32, i32* %i, align 4
  %29 = add nsw i32 %28, -1
  store i32 %29, i32* %i, align 4
  br label %15

; <label>:30                                      ; preds = %15
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %32 = load i32, i32* %1
  ret i32 %32
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
