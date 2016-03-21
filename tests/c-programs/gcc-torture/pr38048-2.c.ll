; ModuleID = './pr38048-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @foo() #0 {
  %mat = alloca [2 x [2 x i32]], align 16
  %1 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %mat, i32 0, i64 0
  %2 = getelementptr inbounds [2 x i32], [2 x i32]* %1, i32 0, i64 0
  store i32 1, i32* %2, align 4
  %3 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %mat, i32 0, i64 0
  %4 = getelementptr inbounds [2 x i32], [2 x i32]* %3, i32 0, i64 1
  store i32 2, i32* %4, align 4
  %5 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %mat, i32 0, i64 1
  %6 = getelementptr inbounds [2 x i32], [2 x i32]* %5, i32 0, i64 0
  store i32 4, i32* %6, align 4
  %7 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %mat, i32 0, i64 1
  %8 = getelementptr inbounds [2 x i32], [2 x i32]* %7, i32 0, i64 1
  store i32 8, i32* %8, align 4
  %9 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %mat, i32 0, i32 0
  %10 = call i32 @inv_J([2 x i32]* %9)
  ret i32 %10
}

; Function Attrs: nounwind uwtable
define internal i32 @inv_J([2 x i32]* %a) #0 {
  %1 = alloca [2 x i32]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %det = alloca i32, align 4
  store [2 x i32]* %a, [2 x i32]** %1, align 8
  store i32 0, i32* %det, align 4
  store i32 0, i32* %j, align 4
  br label %2

; <label>:2                                       ; preds = %21, %0
  %3 = load i32, i32* %j, align 4
  %4 = icmp slt i32 %3, 2
  br i1 %4, label %5, label %24

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %j, align 4
  %7 = sext i32 %6 to i64
  %8 = load [2 x i32]*, [2 x i32]** %1, align 8
  %9 = getelementptr inbounds [2 x i32], [2 x i32]* %8, i64 %7
  %10 = getelementptr inbounds [2 x i32], [2 x i32]* %9, i32 0, i64 0
  %11 = load i32, i32* %10, align 4
  %12 = load i32, i32* %j, align 4
  %13 = sext i32 %12 to i64
  %14 = load [2 x i32]*, [2 x i32]** %1, align 8
  %15 = getelementptr inbounds [2 x i32], [2 x i32]* %14, i64 %13
  %16 = getelementptr inbounds [2 x i32], [2 x i32]* %15, i32 0, i64 1
  %17 = load i32, i32* %16, align 4
  %18 = add nsw i32 %11, %17
  %19 = load i32, i32* %det, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, i32* %det, align 4
  br label %21

; <label>:21                                      ; preds = %5
  %22 = load i32, i32* %j, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %j, align 4
  br label %2

; <label>:24                                      ; preds = %2
  %25 = load i32, i32* %det, align 4
  ret i32 %25
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo()
  %3 = icmp ne i32 %2, 15
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
