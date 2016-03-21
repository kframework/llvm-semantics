; ModuleID = './gotoStatic.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@f.z = internal global i32 0, align 4
@f.y = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %went = alloca i32, align 4
  store i32 0, i32* %went, align 4
  br label %1

; <label>:1                                       ; preds = %0
  %2 = load i32, i32* @f.z, align 4
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* @f.z, align 4
  br label %4

; <label>:4                                       ; preds = %9, %1
  %5 = load i32, i32* @f.y, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* @f.y, align 4
  %7 = load i32, i32* %went, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %10, label %9

; <label>:9                                       ; preds = %4
  store i32 1, i32* %went, align 4
  br label %4

; <label>:10                                      ; preds = %4
  %11 = load i32, i32* @f.z, align 4
  %12 = load i32, i32* @f.y, align 4
  %13 = add nsw i32 %11, %12
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f()
  %3 = call i32 @f()
  %4 = call i32 @f()
  %5 = call i32 @f()
  ret i32 %5
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
