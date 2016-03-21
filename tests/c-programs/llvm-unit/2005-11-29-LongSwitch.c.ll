; ModuleID = './2005-11-29-LongSwitch.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"foo = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @foo(i64 %v) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  store i64 %v, i64* %2, align 8
  %3 = load i64, i64* %2, align 8
  switch i64 %3, label %6 [
    i64 0, label %4
    i64 -1, label %5
  ]

; <label>:4                                       ; preds = %0
  store i32 1, i32* %1
  br label %7

; <label>:5                                       ; preds = %0
  store i32 2, i32* %1
  br label %7

; <label>:6                                       ; preds = %0
  store i32 0, i32* %1
  br label %7

; <label>:7                                       ; preds = %6, %5, %4
  %8 = load i32, i32* %1
  ret i32 %8
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo(i64 4294967295)
  store i32 %2, i32* %r, align 4
  %3 = load i32, i32* %r, align 4
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str, i32 0, i32 0), i32 %3)
  %5 = load i32, i32* %r, align 4
  ret i32 %5
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
