; ModuleID = './pr31136.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { [2 x i8], [2 x i8] }

@s = common global %struct.S zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i16* bitcast (%struct.S* @s to i16*), align 4
  %3 = and i16 %2, -1009
  %4 = or i16 %3, 496
  store i16 %4, i16* bitcast (%struct.S* @s to i16*), align 4
  %5 = load i16* bitcast (%struct.S* @s to i16*), align 4
  %6 = lshr i16 %5, 4
  %7 = and i16 %6, 63
  %8 = zext i16 %7 to i32
  %9 = trunc i32 %8 to i16
  %10 = load i16* bitcast (%struct.S* @s to i16*), align 4
  %11 = and i16 %9, 15
  %12 = and i16 %10, -16
  %13 = or i16 %12, %11
  store i16 %13, i16* bitcast (%struct.S* @s to i16*), align 4
  %14 = zext i16 %11 to i32
  %15 = load i16* bitcast (%struct.S* @s to i16*), align 4
  %16 = and i16 %15, 15
  %17 = zext i16 %16 to i32
  %18 = trunc i32 %17 to i16
  %19 = load i16* bitcast (%struct.S* @s to i16*), align 4
  %20 = and i16 %18, 63
  %21 = shl i16 %20, 4
  %22 = and i16 %19, -1009
  %23 = or i16 %22, %21
  store i16 %23, i16* bitcast (%struct.S* @s to i16*), align 4
  %24 = zext i16 %20 to i32
  %25 = load i16* bitcast (%struct.S* @s to i16*), align 4
  %26 = lshr i16 %25, 4
  %27 = and i16 %26, 63
  %28 = zext i16 %27 to i32
  %29 = icmp ne i32 %28, 15
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:31                                      ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
