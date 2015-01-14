; ModuleID = './20030401-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @bar() #0 {
  ret i32 1
}

; Function Attrs: nounwind uwtable
define void @foo(i32 %x) #0 {
  %1 = alloca i32, align 4
  %error = alloca i8, align 1
  store i32 %x, i32* %1, align 4
  store i8 0, i8* %error, align 1
  %2 = load i32* %1, align 4
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %7, label %4

; <label>:4                                       ; preds = %0
  %5 = call i32 @bar()
  %6 = icmp ne i32 %5, 0
  br label %7

; <label>:7                                       ; preds = %4, %0
  %8 = phi i1 [ true, %0 ], [ %6, %4 ]
  %9 = zext i1 %8 to i32
  %10 = trunc i32 %9 to i8
  store i8 %10, i8* %error, align 1
  %11 = icmp ne i8 %10, 0
  br i1 %11, label %14, label %12

; <label>:12                                      ; preds = %7
  %13 = call i32 @bar()
  br label %14

; <label>:14                                      ; preds = %12, %7
  %15 = load i8* %error, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %18, label %17

; <label>:17                                      ; preds = %14
  call void @abort() #2
  unreachable

; <label>:18                                      ; preds = %14
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo(i32 1)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
