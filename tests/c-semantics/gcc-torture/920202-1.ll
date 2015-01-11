; ModuleID = './920202-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@rule_text_needs_stack_pop = internal global i32 0, align 4
@input_stack_pos = internal global i32 1, align 4

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %1 = alloca i32, align 4
  store i32 1, i32* @rule_text_needs_stack_pop, align 4
  %2 = load i32* @input_stack_pos, align 4
  %3 = icmp sle i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32 1, i32* %1
  br label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %6

; <label>:6                                       ; preds = %5, %4
  %7 = load i32* %1
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f()
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %4 = load i32* %1
  ret i32 %4
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
