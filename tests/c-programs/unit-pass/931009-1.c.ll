; ModuleID = './931009-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @f()
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define void @f() #0 {
  %a = alloca [2 x i32], align 4
  %1 = getelementptr inbounds [2 x i32], [2 x i32]* %a, i32 0, i32 0
  call void @g(i32* %1, i32 2, i32 0, i32 1)
  %2 = getelementptr inbounds [2 x i32], [2 x i32]* %a, i32 0, i64 0
  %3 = load i32, i32* %2, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %9, label %5

; <label>:5                                       ; preds = %0
  %6 = getelementptr inbounds [2 x i32], [2 x i32]* %a, i32 0, i64 1
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 1
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5, %0
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %5
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @g(i32* %out, i32 %size, i32 %lo, i32 %hi) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %j = alloca i32, align 4
  store i32* %out, i32** %1, align 8
  store i32 %size, i32* %2, align 4
  store i32 %lo, i32* %3, align 4
  store i32 %hi, i32* %4, align 4
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %19, %0
  %6 = load i32, i32* %j, align 4
  %7 = load i32, i32* %2, align 4
  %8 = icmp slt i32 %6, %7
  br i1 %8, label %9, label %22

; <label>:9                                       ; preds = %5
  %10 = load i32, i32* %j, align 4
  %11 = load i32, i32* %4, align 4
  %12 = load i32, i32* %3, align 4
  %13 = sub nsw i32 %11, %12
  %14 = mul nsw i32 %10, %13
  %15 = load i32, i32* %j, align 4
  %16 = sext i32 %15 to i64
  %17 = load i32*, i32** %1, align 8
  %18 = getelementptr inbounds i32, i32* %17, i64 %16
  store i32 %14, i32* %18, align 4
  br label %19

; <label>:19                                      ; preds = %9
  %20 = load i32, i32* %j, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %j, align 4
  br label %5

; <label>:22                                      ; preds = %5
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
