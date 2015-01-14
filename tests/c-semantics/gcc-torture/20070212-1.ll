; ModuleID = './20070212-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.f = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @g(i32 %i, i32 %c, %struct.f* %ff, i32* %p) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca %struct.f*, align 8
  %4 = alloca i32*, align 8
  %t = alloca i32*, align 8
  store i32 %i, i32* %1, align 4
  store i32 %c, i32* %2, align 4
  store %struct.f* %ff, %struct.f** %3, align 8
  store i32* %p, i32** %4, align 8
  %5 = load i32* %2, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i32* %1, i32** %t, align 8
  br label %11

; <label>:8                                       ; preds = %0
  %9 = load %struct.f** %3, align 8
  %10 = getelementptr inbounds %struct.f* %9, i32 0, i32 0
  store i32* %10, i32** %t, align 8
  br label %11

; <label>:11                                      ; preds = %8, %7
  %12 = load i32** %4, align 8
  store i32 0, i32* %12, align 4
  %13 = load i32** %t, align 8
  %14 = load i32* %13, align 4
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %f = alloca %struct.f, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.f* %f, i32 0, i32 0
  store i32 1, i32* %2, align 4
  %3 = getelementptr inbounds %struct.f* %f, i32 0, i32 0
  %4 = call i32 @g(i32 5, i32 0, %struct.f* %f, i32* %3)
  %5 = icmp ne i32 %4, 0
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
