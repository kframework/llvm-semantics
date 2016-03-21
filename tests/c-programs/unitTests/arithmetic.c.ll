; ModuleID = './arithmetic.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"Error 1\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"Error 2\0A\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"Error 3\0A\00", align 1
@.str.3 = private unnamed_addr constant [9 x i8] c"Error 4\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"Error 5\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %scl = alloca i8, align 1
  %sch = alloca i8, align 1
  %ucl = alloca i8, align 1
  %uch = alloca i8, align 1
  %sil = alloca i16, align 2
  %sih = alloca i16, align 2
  %usil = alloca i16, align 2
  %usih = alloca i16, align 2
  %il = alloca i32, align 4
  %ih = alloca i32, align 4
  %uil = alloca i32, align 4
  %uih = alloca i32, align 4
  %lil = alloca i64, align 8
  %lih = alloca i64, align 8
  %ulil = alloca i64, align 8
  %ulilh = alloca i64, align 8
  %llil = alloca i64, align 8
  %llih = alloca i64, align 8
  store i32 0, i32* %1
  store i8 -127, i8* %scl, align 1
  store i8 127, i8* %sch, align 1
  store i8 0, i8* %ucl, align 1
  store i8 -1, i8* %uch, align 1
  store i16 -32767, i16* %sil, align 2
  store i16 32767, i16* %sih, align 2
  store i16 0, i16* %usil, align 2
  store i16 -1, i16* %usih, align 2
  store i32 -32767, i32* %il, align 4
  store i32 32767, i32* %ih, align 4
  store i32 0, i32* %uil, align 4
  store i32 65535, i32* %uih, align 4
  store i64 -2147483647, i64* %lil, align 8
  store i64 2147483647, i64* %lih, align 8
  store i64 0, i64* %ulil, align 8
  store i64 4294967295, i64* %ulilh, align 8
  store i64 -9223372036854775807, i64* %llil, align 8
  store i64 9223372036854775807, i64* %llih, align 8
  %2 = load i8, i8* %scl, align 1
  %3 = sext i8 %2 to i32
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %7, label %5

; <label>:5                                       ; preds = %0
  %6 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str, i32 0, i32 0))
  br label %7

; <label>:7                                       ; preds = %5, %0
  %8 = load i16, i16* %sil, align 2
  %9 = sext i16 %8 to i32
  %10 = icmp slt i32 %9, 0
  br i1 %10, label %13, label %11

; <label>:11                                      ; preds = %7
  %12 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0))
  br label %13

; <label>:13                                      ; preds = %11, %7
  %14 = load i32, i32* %il, align 4
  %15 = icmp slt i32 %14, 0
  br i1 %15, label %18, label %16

; <label>:16                                      ; preds = %13
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.2, i32 0, i32 0))
  br label %18

; <label>:18                                      ; preds = %16, %13
  %19 = load i64, i64* %lil, align 8
  %20 = icmp slt i64 %19, 0
  br i1 %20, label %23, label %21

; <label>:21                                      ; preds = %18
  %22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.3, i32 0, i32 0))
  br label %23

; <label>:23                                      ; preds = %21, %18
  %24 = load i64, i64* %llil, align 8
  %25 = icmp slt i64 %24, 0
  br i1 %25, label %28, label %26

; <label>:26                                      ; preds = %23
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.4, i32 0, i32 0))
  br label %28

; <label>:28                                      ; preds = %26, %23
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
