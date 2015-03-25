; ModuleID = './981206-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = internal global i16 0, align 2
@y = internal global i16 0, align 2

; Function Attrs: nounwind uwtable
define void @foo() #0 {
  store i16 837, i16* @x, align 2
  store i16 1383, i16* @y, align 2
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @foo()
  %2 = load i16* @x, align 2
  %3 = zext i16 %2 to i32
  %4 = icmp ne i32 %3, 837
  br i1 %4, label %9, label %5

; <label>:5                                       ; preds = %0
  %6 = load i16* @y, align 2
  %7 = zext i16 %6 to i32
  %8 = icmp ne i32 %7, 1383
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5, %0
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %5
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %12 = load i32* %1
  ret i32 %12
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
