; ModuleID = './enum-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@tok = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* @tok, align 4
  %2 = call i32 @atom()
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32, i32* %1
  ret i32 %7
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define internal i32 @atom() #0 {
  %1 = alloca i32, align 4
  %2 = load i32, i32* @tok, align 4
  %3 = icmp sge i32 %2, 0
  br i1 %3, label %4, label %7

; <label>:4                                       ; preds = %0
  %5 = load i32, i32* @tok, align 4
  %6 = icmp slt i32 %5, 256
  br i1 %6, label %31, label %7

; <label>:7                                       ; preds = %4, %0
  %8 = load i32, i32* @tok, align 4
  %9 = icmp sge i32 %8, 273
  br i1 %9, label %31, label %10

; <label>:10                                      ; preds = %7
  %11 = load i32, i32* @tok, align 4
  %12 = icmp eq i32 %11, 257
  br i1 %12, label %31, label %13

; <label>:13                                      ; preds = %10
  %14 = load i32, i32* @tok, align 4
  %15 = icmp eq i32 %14, 258
  br i1 %15, label %31, label %16

; <label>:16                                      ; preds = %13
  %17 = load i32, i32* @tok, align 4
  %18 = icmp eq i32 %17, 259
  br i1 %18, label %31, label %19

; <label>:19                                      ; preds = %16
  %20 = load i32, i32* @tok, align 4
  %21 = icmp eq i32 %20, 260
  br i1 %21, label %31, label %22

; <label>:22                                      ; preds = %19
  %23 = load i32, i32* @tok, align 4
  %24 = icmp eq i32 %23, 261
  br i1 %24, label %31, label %25

; <label>:25                                      ; preds = %22
  %26 = load i32, i32* @tok, align 4
  %27 = icmp eq i32 %26, 262
  br i1 %27, label %31, label %28

; <label>:28                                      ; preds = %25
  %29 = load i32, i32* @tok, align 4
  %30 = icmp eq i32 %29, 263
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %28, %25, %22, %19, %16, %13, %10, %7, %4
  store i32 1, i32* %1
  br label %33

; <label>:32                                      ; preds = %28
  store i32 0, i32* %1
  br label %33

; <label>:33                                      ; preds = %32, %31
  %34 = load i32, i32* %1
  ret i32 %34
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
