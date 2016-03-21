; ModuleID = './20090207-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @foo(i32 %i) #0 {
  %1 = alloca i32, align 4
  %a = alloca [32 x i32], align 16
  store i32 %i, i32* %1, align 4
  %2 = getelementptr inbounds [32 x i32], [32 x i32]* %a, i32 0, i64 1
  store i32 3, i32* %2, align 4
  %3 = getelementptr inbounds [32 x i32], [32 x i32]* %a, i32 0, i64 0
  store i32 1, i32* %3, align 4
  %4 = load i32, i32* %1, align 4
  %5 = sext i32 %4 to i64
  %6 = getelementptr inbounds [32 x i32], [32 x i32]* %a, i32 0, i64 %5
  store i32 2, i32* %6, align 4
  %7 = getelementptr inbounds [32 x i32], [32 x i32]* %a, i32 0, i64 0
  %8 = load i32, i32* %7, align 4
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo(i32 0)
  %3 = icmp ne i32 %2, 2
  br i1 %3, label %7, label %4

; <label>:4                                       ; preds = %0
  %5 = call i32 @foo(i32 1)
  %6 = icmp ne i32 %5, 1
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4, %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %4
  ret i32 0
}

; Function Attrs: noreturn
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
