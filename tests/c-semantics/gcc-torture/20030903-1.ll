; ModuleID = './20030903-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@test = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load volatile i32* @test, align 4
  switch i32 %2, label %7 [
    i32 1, label %3
    i32 2, label %4
    i32 3, label %5
    i32 4, label %6
  ]

; <label>:3                                       ; preds = %0
  call void @y(i32 1)
  br label %7

; <label>:4                                       ; preds = %0
  call void @y(i32 2)
  br label %7

; <label>:5                                       ; preds = %0
  call void @y(i32 3)
  br label %7

; <label>:6                                       ; preds = %0
  call void @y(i32 4)
  br label %7

; <label>:7                                       ; preds = %0, %6, %5, %4, %3
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal void @y(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
