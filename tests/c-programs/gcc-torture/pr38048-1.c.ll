; ModuleID = './pr38048-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @foo() #0 {
  %mat = alloca [2 x [1 x i32]], align 4
  %a = alloca [1 x i32]*, align 8
  %det = alloca i32, align 4
  %i = alloca i32, align 4
  %1 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %mat, i32 0, i32 0
  store [1 x i32]* %1, [1 x i32]** %a, align 8
  store i32 0, i32* %det, align 4
  %2 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %mat, i32 0, i64 0
  %3 = getelementptr inbounds [1 x i32], [1 x i32]* %2, i32 0, i64 0
  store i32 1, i32* %3, align 4
  %4 = getelementptr inbounds [2 x [1 x i32]], [2 x [1 x i32]]* %mat, i32 0, i64 1
  %5 = getelementptr inbounds [1 x i32], [1 x i32]* %4, i32 0, i64 0
  store i32 2, i32* %5, align 4
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %18, %0
  %7 = load i32, i32* %i, align 4
  %8 = icmp slt i32 %7, 2
  br i1 %8, label %9, label %21

; <label>:9                                       ; preds = %6
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = load [1 x i32]*, [1 x i32]** %a, align 8
  %13 = getelementptr inbounds [1 x i32], [1 x i32]* %12, i64 %11
  %14 = getelementptr inbounds [1 x i32], [1 x i32]* %13, i32 0, i64 0
  %15 = load i32, i32* %14, align 4
  %16 = load i32, i32* %det, align 4
  %17 = add nsw i32 %16, %15
  store i32 %17, i32* %det, align 4
  br label %18

; <label>:18                                      ; preds = %9
  %19 = load i32, i32* %i, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %6

; <label>:21                                      ; preds = %6
  %22 = load i32, i32* %det, align 4
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo()
  %3 = icmp ne i32 %2, 3
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
