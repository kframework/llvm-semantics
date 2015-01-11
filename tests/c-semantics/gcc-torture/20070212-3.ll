; ModuleID = './20070212-3.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.foo = type { i32, i32 }

; Function Attrs: nounwind uwtable
define i32 @bar(%struct.foo* %k, i32 %k2, i32 %f, i32 %f2) #0 {
  %1 = alloca %struct.foo*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  %res = alloca i32, align 4
  store %struct.foo* %k, %struct.foo** %1, align 8
  store i32 %k2, i32* %2, align 4
  store i32 %f, i32* %3, align 4
  store i32 %f2, i32* %4, align 4
  %5 = load i32* %3, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %10

; <label>:7                                       ; preds = %0
  %8 = load %struct.foo** %1, align 8
  %9 = getelementptr inbounds %struct.foo* %8, i32 0, i32 0
  store i32* %9, i32** %p, align 8
  br label %13

; <label>:10                                      ; preds = %0
  %11 = load %struct.foo** %1, align 8
  %12 = getelementptr inbounds %struct.foo* %11, i32 0, i32 1
  store i32* %12, i32** %p, align 8
  br label %13

; <label>:13                                      ; preds = %10, %7
  %14 = load i32** %p, align 8
  %15 = load i32* %14, align 4
  store i32 %15, i32* %res, align 4
  %16 = load %struct.foo** %1, align 8
  %17 = getelementptr inbounds %struct.foo* %16, i32 0, i32 0
  store i32 1, i32* %17, align 4
  %18 = load i32* %4, align 4
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20                                      ; preds = %13
  %21 = load i32** %p, align 8
  store i32* %21, i32** %q, align 8
  br label %23

; <label>:22                                      ; preds = %13
  store i32* %2, i32** %q, align 8
  br label %23

; <label>:23                                      ; preds = %22, %20
  %24 = load i32* %res, align 4
  %25 = load i32** %q, align 8
  %26 = load i32* %25, align 4
  %27 = add nsw i32 %24, %26
  ret i32 %27
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %k = alloca %struct.foo, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.foo* %k, i32 0, i32 0
  store i32 0, i32* %2, align 4
  %3 = getelementptr inbounds %struct.foo* %k, i32 0, i32 1
  store i32 1, i32* %3, align 4
  %4 = call i32 @bar(%struct.foo* %k, i32 1, i32 1, i32 1)
  %5 = icmp ne i32 %4, 1
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:7                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
