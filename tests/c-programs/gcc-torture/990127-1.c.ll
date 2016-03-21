; ModuleID = './990127-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %pa = alloca i32*, align 8
  %pb = alloca i32*, align 8
  %pc = alloca i32*, align 8
  %ppa = alloca i32**, align 8
  %ppb = alloca i32**, align 8
  %ppc = alloca i32**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  store i32 0, i32* %1
  store i32 10, i32* %a, align 4
  store i32 20, i32* %b, align 4
  store i32 30, i32* %c, align 4
  store i32* %a, i32** %pa, align 8
  store i32* %b, i32** %pb, align 8
  store i32* %c, i32** %pc, align 8
  store i32** %pa, i32*** %ppa, align 8
  store i32** %pb, i32*** %ppb, align 8
  store i32** %pc, i32*** %ppc, align 8
  store i32 0, i32* %x, align 4
  store i32 0, i32* %y, align 4
  store i32 0, i32* %z, align 4
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %28, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp slt i32 %3, 10
  br i1 %4, label %5, label %31

; <label>:5                                       ; preds = %2
  %6 = load i32*, i32** %pa, align 8
  %7 = icmp eq i32* %6, %a
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  store i32* %b, i32** %pa, align 8
  br label %10

; <label>:9                                       ; preds = %5
  store i32* %a, i32** %pa, align 8
  br label %10

; <label>:10                                      ; preds = %9, %8
  br label %11

; <label>:11                                      ; preds = %24, %10
  %12 = load i32*, i32** %pa, align 8
  %13 = load i32, i32* %12, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, i32* %12, align 4
  %15 = icmp ne i32 %13, 0
  br i1 %15, label %16, label %25

; <label>:16                                      ; preds = %11
  %17 = load i32, i32* %x, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %x, align 4
  %19 = load i32*, i32** %pa, align 8
  %20 = load i32, i32* %19, align 4
  %21 = icmp slt i32 %20, 3
  br i1 %21, label %22, label %23

; <label>:22                                      ; preds = %16
  br label %25

; <label>:23                                      ; preds = %16
  store i32* %b, i32** %pa, align 8
  br label %24

; <label>:24                                      ; preds = %23
  br label %11

; <label>:25                                      ; preds = %22, %11
  %26 = load i32, i32* %x, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %x, align 4
  store i32* %b, i32** %pa, align 8
  br label %28

; <label>:28                                      ; preds = %25
  %29 = load i32, i32* %i, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %i, align 4
  br label %2

; <label>:31                                      ; preds = %2
  %32 = load i32*, i32** %pa, align 8
  %33 = load i32, i32* %32, align 4
  %34 = icmp ne i32 %33, -5
  br i1 %34, label %42, label %35

; <label>:35                                      ; preds = %31
  %36 = load i32*, i32** %pb, align 8
  %37 = load i32, i32* %36, align 4
  %38 = icmp ne i32 %37, -5
  br i1 %38, label %42, label %39

; <label>:39                                      ; preds = %35
  %40 = load i32, i32* %x, align 4
  %41 = icmp ne i32 %40, 43
  br i1 %41, label %42, label %43

; <label>:42                                      ; preds = %39, %35, %31
  call void @abort() #2
  unreachable

; <label>:43                                      ; preds = %39
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %45 = load i32, i32* %1
  ret i32 %45
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
