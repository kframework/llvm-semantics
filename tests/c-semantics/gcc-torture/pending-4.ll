; ModuleID = './pending-4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @dummy(i32* %x, i32 %y) #0 {
  %1 = alloca i32*, align 8
  %2 = alloca i32, align 4
  store i32* %x, i32** %1, align 8
  store i32 %y, i32* %2, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %number_columns = alloca i32, align 4
  %cnt0 = alloca i32, align 4
  %cnt1 = alloca i32, align 4
  %i = alloca i32, align 4
  %A1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 9, i32* %number_columns, align 4
  store i32 0, i32* %cnt0, align 4
  store i32 0, i32* %cnt1, align 4
  %4 = load i32* %number_columns, align 4
  %5 = sub nsw i32 %4, 1
  store i32 %5, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %22, %0
  %7 = load i32* %i, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %25

; <label>:9                                       ; preds = %6
  %10 = load i32* %i, align 4
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %16

; <label>:12                                      ; preds = %9
  %13 = load i32* %i, align 4
  call void @dummy(i32* %A1, i32 %13)
  %14 = load i32* %cnt0, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* %cnt0, align 4
  br label %21

; <label>:16                                      ; preds = %9
  %17 = load i32* %i, align 4
  %18 = sub nsw i32 %17, 1
  call void @dummy(i32* %A1, i32 %18)
  %19 = load i32* %cnt1, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %cnt1, align 4
  br label %21

; <label>:21                                      ; preds = %16, %12
  br label %22

; <label>:22                                      ; preds = %21
  %23 = load i32* %i, align 4
  %24 = add nsw i32 %23, -1
  store i32 %24, i32* %i, align 4
  br label %6

; <label>:25                                      ; preds = %6
  %26 = load i32* %cnt0, align 4
  %27 = icmp ne i32 %26, 1
  br i1 %27, label %31, label %28

; <label>:28                                      ; preds = %25
  %29 = load i32* %cnt1, align 4
  %30 = icmp ne i32 %29, 7
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %28, %25
  call void @abort() #2
  unreachable

; <label>:32                                      ; preds = %28
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %34 = load i32* %1
  ret i32 %34
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
