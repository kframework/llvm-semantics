; ModuleID = './20030128-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@x = global i8 50, align 1
@y = global i16 -5, align 2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load volatile i16* @y, align 2
  %3 = sext i16 %2 to i32
  %4 = load i8* @x, align 1
  %5 = zext i8 %4 to i32
  %6 = sdiv i32 %5, %3
  %7 = trunc i32 %6 to i8
  store i8 %7, i8* @x, align 1
  %8 = load i8* @x, align 1
  %9 = zext i8 %8 to i32
  %10 = icmp ne i32 %9, 246
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:12                                      ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %14 = load i32* %1
  ret i32 %14
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
