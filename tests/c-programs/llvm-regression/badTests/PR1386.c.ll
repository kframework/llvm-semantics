; ModuleID = './PR1386.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.X = type { i128 }

@.str = private unnamed_addr constant [16 x i8] c"bad bits: %llx\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca %struct.X, align 1
  %bad_bits = alloca i64, align 8
  store i32 0, i32* %1
  %2 = bitcast %struct.X* %x to i128*
  %3 = load i128, i128* %2, align 1
  %4 = and i128 %3, -16
  %5 = or i128 %4, 15
  store i128 %5, i128* %2, align 1
  %6 = bitcast %struct.X* %x to i128*
  %7 = load i128, i128* %6, align 1
  %8 = and i128 %7, -295147905179352825841
  %9 = or i128 %8, 295147905179352825840
  store i128 %9, i128* %6, align 1
  %10 = bitcast %struct.X* %x to i128*
  %11 = load i128, i128* %10, align 1
  %12 = and i128 %11, 295147905179352825855
  %13 = or i128 %12, -295147905179352825856
  store i128 %13, i128* %10, align 1
  %14 = bitcast %struct.X* %x to i64*
  %15 = getelementptr inbounds i64, i64* %14, i64 1
  %16 = load i64, i64* %15, align 8
  %17 = xor i64 -1, %16
  store i64 %17, i64* %bad_bits, align 8
  %18 = load i64, i64* %bad_bits, align 8
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i64 %18)
  %20 = load i64, i64* %bad_bits, align 8
  %21 = icmp ne i64 %20, 0
  %22 = zext i1 %21 to i32
  ret i32 %22
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
