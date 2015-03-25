; ModuleID = './20041114-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@v = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @foo(i32 %var) #0 {
  %1 = alloca i32, align 4
  store i32 %var, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp sle i32 %2, 0
  br i1 %3, label %10, label %4

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4
  %6 = sub nsw i32 %5, 1
  %7 = zext i32 %6 to i64
  %8 = icmp ult i64 %7, 4294967295
  br i1 %8, label %10, label %9

; <label>:9                                       ; preds = %4
  call void @link_failure()
  br label %10

; <label>:10                                      ; preds = %9, %4, %0
  ret void
}

; Function Attrs: nounwind uwtable
define void @link_failure() #0 {
  call void @abort() #2
  unreachable
                                                  ; No predecessors!
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load volatile i32* @v, align 4
  call void @foo(i32 %4)
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
