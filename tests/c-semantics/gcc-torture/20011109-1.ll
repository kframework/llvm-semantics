; ModuleID = './20011109-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @fail1() #0 {
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @fail2() #0 {
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define void @fail3() #0 {
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define void @fail4() #0 {
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define void @foo(i64 %x) #0 {
  %1 = alloca i64, align 8
  store i64 %x, i64* %1, align 8
  %2 = load i64* %1, align 8
  switch i64 %2, label %7 [
    i64 -6, label %3
    i64 0, label %4
    i64 1, label %5
    i64 2, label %5
    i64 3, label %6
    i64 4, label %6
    i64 5, label %6
  ]

; <label>:3                                       ; preds = %0
  call void @fail1()
  br label %8

; <label>:4                                       ; preds = %0
  call void @fail2()
  br label %8

; <label>:5                                       ; preds = %0, %0
  br label %8

; <label>:6                                       ; preds = %0, %0, %0
  call void @fail3()
  br label %8

; <label>:7                                       ; preds = %0
  call void @fail4()
  br label %8

; <label>:8                                       ; preds = %7, %6, %5, %4, %3
  %9 = load i64* %1, align 8
  switch i64 %9, label %14 [
    i64 -3, label %10
    i64 0, label %11
    i64 4, label %11
    i64 1, label %12
    i64 3, label %12
    i64 2, label %13
    i64 8, label %13
  ]

; <label>:10                                      ; preds = %8
  call void @fail1()
  br label %15

; <label>:11                                      ; preds = %8, %8
  call void @fail2()
  br label %15

; <label>:12                                      ; preds = %8, %8
  br label %15

; <label>:13                                      ; preds = %8, %8
  call void @abort() #2
  unreachable

; <label>:14                                      ; preds = %8
  call void @fail4()
  br label %15

; <label>:15                                      ; preds = %14, %12, %11, %10
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo(i64 1)
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
