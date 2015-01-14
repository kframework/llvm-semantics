; ModuleID = './930518-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@bar = global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @f(i32* %p) #0 {
  %1 = alloca i32*, align 8
  %foo = alloca i32, align 4
  store i32* %p, i32** %1, align 8
  store i32 2, i32* %foo, align 4
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i32* %foo, align 4
  %4 = load i32* @bar, align 4
  %5 = icmp sgt i32 %3, %4
  br i1 %5, label %6, label %13

; <label>:6                                       ; preds = %2
  %7 = load i32* @bar, align 4
  %8 = load i32* %foo, align 4
  %9 = sub nsw i32 %8, %7
  store i32 %9, i32* %foo, align 4
  %10 = load i32* %foo, align 4
  %11 = load i32** %1, align 8
  %12 = getelementptr inbounds i32* %11, i32 1
  store i32* %12, i32** %1, align 8
  store i32 %10, i32* %11, align 4
  store i32 1, i32* @bar, align 4
  br label %2

; <label>:13                                      ; preds = %2
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %tab = alloca [2 x i32], align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds [2 x i32]* %tab, i32 0, i64 1
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds [2 x i32]* %tab, i32 0, i64 0
  store i32 0, i32* %3, align 4
  %4 = getelementptr inbounds [2 x i32]* %tab, i32 0, i32 0
  call void @f(i32* %4)
  %5 = getelementptr inbounds [2 x i32]* %tab, i32 0, i64 0
  %6 = load i32* %5, align 4
  %7 = icmp ne i32 %6, 2
  br i1 %7, label %12, label %8

; <label>:8                                       ; preds = %0
  %9 = getelementptr inbounds [2 x i32]* %tab, i32 0, i64 1
  %10 = load i32* %9, align 4
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %8, %0
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %8
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %15 = load i32* %1
  ret i32 %15
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
