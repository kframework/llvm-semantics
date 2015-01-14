; ModuleID = './20000224-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@loop_1 = global i32 100, align 4
@loop_2 = global i32 7, align 4
@flag = global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @test() #0 {
  %i = alloca i32, align 4
  %counter = alloca i32, align 4
  store i32 0, i32* %counter, align 4
  br label %1

; <label>:1                                       ; preds = %21, %0
  %2 = load i32* @loop_1, align 4
  %3 = load i32* %counter, align 4
  %4 = icmp sgt i32 %2, %3
  br i1 %4, label %5, label %24

; <label>:5                                       ; preds = %1
  %6 = load i32* @flag, align 4
  %7 = and i32 %6, 1
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %21

; <label>:9                                       ; preds = %5
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %17, %9
  %11 = load i32* %i, align 4
  %12 = load i32* @loop_2, align 4
  %13 = icmp slt i32 %11, %12
  br i1 %13, label %14, label %20

; <label>:14                                      ; preds = %10
  %15 = load i32* %counter, align 4
  %16 = add nsw i32 %15, 1
  store i32 %16, i32* %counter, align 4
  br label %17

; <label>:17                                      ; preds = %14
  %18 = load i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %10

; <label>:20                                      ; preds = %10
  br label %21

; <label>:21                                      ; preds = %20, %5
  %22 = load i32* @flag, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* @flag, align 4
  br label %1

; <label>:24                                      ; preds = %1
  ret i32 1
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @test()
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
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
