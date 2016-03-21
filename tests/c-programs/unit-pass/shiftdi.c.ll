; ModuleID = './shiftdi.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @g(i64 %x, i32 %y, i32 %z, i64* %p) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i64*, align 8
  %w = alloca i32, align 4
  store i64 %x, i64* %1, align 8
  store i32 %y, i32* %2, align 4
  store i32 %z, i32* %3, align 4
  store i64* %p, i64** %4, align 8
  %5 = load i64, i64* %1, align 8
  %6 = load i32, i32* %2, align 4
  %7 = zext i32 %6 to i64
  %8 = lshr i64 %5, %7
  %9 = and i64 %8, 4294967295
  %10 = load i32, i32* %3, align 4
  %11 = and i32 %10, 31
  %12 = zext i32 %11 to i64
  %13 = shl i64 %9, %12
  %14 = trunc i64 %13 to i32
  store i32 %14, i32* %w, align 4
  %15 = load i32, i32* %w, align 4
  %16 = zext i32 %15 to i64
  %17 = and i64 %16, 4294967295
  %18 = load i32, i32* %3, align 4
  %19 = zext i32 %18 to i64
  %20 = shl i64 %17, %19
  %21 = load i64*, i64** %4, align 8
  %22 = load i64, i64* %21, align 8
  %23 = or i64 %22, %20
  store i64 %23, i64* %21, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i64, align 8
  store i32 0, i32* %1
  store i64 0, i64* %a, align 8
  call void @g(i64 -2401053092593056409, i32 0, i32 0, i64* %a)
  %2 = load i64, i64* %a, align 8
  %3 = icmp eq i64 %2, 19088743
  %4 = select i1 %3, i32 0, i32 1
  ret i32 %4
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
