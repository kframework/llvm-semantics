; ModuleID = './2006-02-04-DivRem.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"%u %u %u %u\0A\00", align 1
@i = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @test(i32 %X, i32 %Y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  store i32 %X, i32* %1, align 4
  store i32 %Y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %2, align 4
  %5 = load i32, i32* %1, align 4
  %6 = load i32, i32* %2, align 4
  %7 = and i32 %6, 15
  %8 = shl i32 8, %7
  %9 = udiv i32 %5, %8
  %10 = load i32, i32* %1, align 4
  %11 = load i32, i32* %2, align 4
  %12 = and i32 %11, 15
  %13 = shl i32 8, %12
  %14 = urem i32 %10, %13
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i32 0, i32 0), i32 %3, i32 %4, i32 %9, i32 %14)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %l = alloca i64, align 8
  store i32 0, i32* %1
  store i32 10, i32* @i, align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i32, i32* @i, align 4
  %4 = icmp slt i32 %3, 139045193
  br i1 %4, label %5, label %14

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* @i, align 4
  %7 = load i32, i32* @i, align 4
  %8 = xor i32 %7, 12345
  call void @test(i32 %6, i32 %8)
  %9 = load i32, i32* @i, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* @i, align 4
  br label %11

; <label>:11                                      ; preds = %5
  %12 = load i32, i32* @i, align 4
  %13 = mul nsw i32 %12, -3
  store i32 %13, i32* @i, align 4
  br label %2

; <label>:14                                      ; preds = %2
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
