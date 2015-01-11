; ModuleID = './pr22630.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@j = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @bla(i32* %r) #0 {
  %1 = alloca i32*, align 8
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  store i32* %r, i32** %1, align 8
  %2 = load i32** %1, align 8
  store i32* %2, i32** %q, align 8
  store i32* %2, i32** %p, align 8
  %3 = load i32** %p, align 8
  %4 = icmp ne i32* %3, null
  br i1 %4, label %6, label %5

; <label>:5                                       ; preds = %0
  store i32* @j, i32** %p, align 8
  br label %6

; <label>:6                                       ; preds = %5, %0
  %7 = load i32** %p, align 8
  %8 = load i32** %q, align 8
  %9 = icmp ne i32* %7, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6
  store i32 1, i32* @j, align 4
  br label %11

; <label>:11                                      ; preds = %10, %6
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @bla(i32* null)
  %2 = load i32* @j, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %5, label %4

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
