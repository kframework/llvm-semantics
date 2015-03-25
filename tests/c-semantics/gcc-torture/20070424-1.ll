; ModuleID = './20070424-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @do_exit() #0 {
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noreturn
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define void @do_abort() #0 {
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define void @foo(i32 %x, i32 %a) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %a, i32* %2, align 4
  %3 = load i32* %1, align 4
  %4 = load i32* %2, align 4
  %5 = icmp slt i32 %3, %4
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  br label %13

; <label>:7                                       ; preds = %0
  call void @do_exit()
  %8 = load i32* %1, align 4
  %9 = load i32* %2, align 4
  %10 = icmp ne i32 %8, %9
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %7
  br label %13

; <label>:12                                      ; preds = %7
  call void @do_abort()
  br label %14

; <label>:13                                      ; preds = %11, %6
  call void @do_abort()
  br label %14

; <label>:14                                      ; preds = %13, %12
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo(i32 1, i32 0)
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
