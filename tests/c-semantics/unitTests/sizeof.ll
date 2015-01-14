; ModuleID = './sizeof.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s0 = type { i8*, i8, i16, i32, i64, i64 }
%struct.s1 = type { [5 x i8], %struct.s0, [5 x %struct.s0], %struct.s0* }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %tchar = alloca i8, align 1
  %tuchar = alloca i8, align 1
  %tschar = alloca i8, align 1
  %tsint = alloca i16, align 2
  %tusint = alloca i16, align 2
  %tint = alloca i32, align 4
  %tuint = alloca i32, align 4
  %tlint = alloca i64, align 8
  %tulint = alloca i64, align 8
  %tllint = alloca i64, align 8
  %tullint = alloca i64, align 8
  %tpint = alloca i32*, align 8
  %x = alloca [15 x i8], align 1
  %y = alloca [15 x i32], align 16
  %w = alloca [5 x [4 x [3 x i32]]], align 16
  %mys0 = alloca %struct.s0, align 8
  %mys1 = alloca %struct.s1, align 8
  %mys1b = alloca [7 x %struct.s1], align 16
  store i32 0, i32* %1
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
