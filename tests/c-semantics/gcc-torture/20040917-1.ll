; ModuleID = './20040917-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@test_var = internal global i32 0, align 4

; Function Attrs: noinline nounwind uwtable
define void @not_inlinable() #0 {
  call void @inlinable()
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 10, i32* @test_var, align 4
  call void @not_inlinable()
  %2 = load i32* @test_var, align 4
  %3 = icmp eq i32 %2, 10
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind uwtable
define internal void @inlinable() #1 {
  store i32 -10, i32* @test_var, align 4
  ret void
}

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
