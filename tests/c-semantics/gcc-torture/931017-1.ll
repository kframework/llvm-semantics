; ModuleID = './931017-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@v = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @f()
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i32 @h1() #0 {
  ret i32 0
}

; Function Attrs: nounwind uwtable
define i32 @h2(i32* %e) #0 {
  %1 = alloca i32*, align 8
  store i32* %e, i32** %1, align 8
  %2 = load i32** %1, align 8
  %3 = icmp ne i32* %2, @v
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @g(i8* %c) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %i = alloca i32, align 4
  %b = alloca i32, align 4
  store i8* %c, i8** %2, align 8
  br label %3

; <label>:3                                       ; preds = %15, %0
  %4 = call i32 @h1()
  store i32 %4, i32* %i, align 4
  %5 = load i32* %i, align 4
  %6 = icmp eq i32 %5, -1
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %3
  store i32 0, i32* %1
  br label %31

; <label>:8                                       ; preds = %3
  %9 = load i32* %i, align 4
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %11, label %13

; <label>:11                                      ; preds = %8
  %12 = call i32 @h1()
  br label %13

; <label>:13                                      ; preds = %11, %8
  br label %14

; <label>:14                                      ; preds = %13
  br label %15

; <label>:15                                      ; preds = %14
  %16 = load i32* %i, align 4
  %17 = icmp eq i32 %16, 1
  br i1 %17, label %3, label %18

; <label>:18                                      ; preds = %15
  br label %19

; <label>:19                                      ; preds = %21, %18
  %20 = call i32 @h2(i32* @v)
  store i32 %20, i32* %b, align 4
  br label %21

; <label>:21                                      ; preds = %19
  %22 = load i32* %i, align 4
  %23 = icmp eq i32 %22, 5
  br i1 %23, label %19, label %24

; <label>:24                                      ; preds = %21
  %25 = load i32* %i, align 4
  %26 = icmp ne i32 %25, 2
  br i1 %26, label %27, label %29

; <label>:27                                      ; preds = %24
  %28 = load i32* %b, align 4
  store i32 %28, i32* %1
  br label %31

; <label>:29                                      ; preds = %24
  %30 = load i8** %2, align 8
  store i8 97, i8* %30, align 1
  store i32 0, i32* %1
  br label %31

; <label>:31                                      ; preds = %29, %27, %7
  %32 = load i32* %1
  ret i32 %32
}

; Function Attrs: nounwind uwtable
define void @f() #0 {
  %c = alloca i8, align 1
  %1 = call i32 @g(i8* %c)
  ret void
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
