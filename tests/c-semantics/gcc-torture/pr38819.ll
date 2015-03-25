; ModuleID = './pr38819.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global i32 1, align 4
@b = global i32 0, align 4
@x = global i32 2, align 4
@r = global i32 8, align 4

; Function Attrs: noinline nounwind uwtable
define void @foo() #0 {
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i32 @main() #2 {
  %1 = alloca i32, align 4
  %si1 = alloca i32, align 4
  %si2 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load volatile i32* @a, align 4
  store i32 %2, i32* %si1, align 4
  %3 = load volatile i32* @b, align 4
  store i32 %3, i32* %si2, align 4
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %21, %0
  %5 = load i32* %i, align 4
  %6 = icmp slt i32 %5, 100
  br i1 %6, label %7, label %24

; <label>:7                                       ; preds = %4
  call void @foo()
  %8 = load volatile i32* @x, align 4
  %9 = icmp eq i32 %8, 8
  br i1 %9, label %10, label %13

; <label>:10                                      ; preds = %7
  %11 = load i32* %i, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %i, align 4
  br label %13

; <label>:13                                      ; preds = %10, %7
  %14 = load i32* %i, align 4
  %15 = load i32* %si1, align 4
  %16 = load i32* %si2, align 4
  %17 = srem i32 %15, %16
  %18 = add nsw i32 %14, %17
  %19 = load volatile i32* @r, align 4
  %20 = add nsw i32 %19, %18
  store volatile i32 %20, i32* @r, align 4
  br label %21

; <label>:21                                      ; preds = %13
  %22 = load i32* %i, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %i, align 4
  br label %4

; <label>:24                                      ; preds = %4
  call void @abort() #3
  unreachable
                                                  ; No predecessors!
  %26 = load i32* %1
  ret i32 %26
}

; Function Attrs: noreturn
declare void @abort() #1

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
