; ModuleID = './20051021-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@count = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @foo1() #0 {
  %1 = load i32* @count, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, i32* @count, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @foo2() #0 {
  %1 = load i32* @count, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, i32* @count, align 4
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo1()
  %3 = icmp eq i32 %2, 1
  %4 = zext i1 %3 to i32
  %5 = call i32 @foo2()
  %6 = icmp eq i32 %5, 1
  %7 = zext i1 %6 to i32
  %8 = and i32 %4, %7
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %0
  %12 = load i32* @count, align 4
  %13 = icmp ne i32 %12, 2
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %11
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
