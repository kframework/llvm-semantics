; ModuleID = './2003-07-06-IntOverflow.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"compare after overflow is TRUE\0A\00", align 1
@.str.1 = private unnamed_addr constant [33 x i8] c"compare after overflow is FALSE\0A\00", align 1
@.str.2 = private unnamed_addr constant [35 x i8] c"divide after overflow = %d (0x%x)\0A\00", align 1
@.str.3 = private unnamed_addr constant [49 x i8] c"divide negative value by power-of-2 = %d (0x%x)\0A\00", align 1
@.str.4 = private unnamed_addr constant [37 x i8] c"subtract after overflow = %d (0x%x)\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @compareOvf(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %sum = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %1, align 4
  %5 = mul nsw i32 %3, %4
  %6 = load i32, i32* %2, align 4
  %7 = load i32, i32* %2, align 4
  %8 = mul nsw i32 %6, %7
  %9 = add nsw i32 %5, %8
  store i32 %9, i32* %sum, align 4
  %10 = load i32, i32* %sum, align 4
  %11 = icmp slt i32 %10, 4194304
  br i1 %11, label %12, label %14

; <label>:12                                      ; preds = %0
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0))
  br label %16

; <label>:14                                      ; preds = %0
  %15 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.1, i32 0, i32 0))
  br label %16

; <label>:16                                      ; preds = %14, %12
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @divideOvf(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %sum = alloca i32, align 4
  %rem = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %1, align 4
  %5 = mul nsw i32 %3, %4
  %6 = load i32, i32* %2, align 4
  %7 = load i32, i32* %2, align 4
  %8 = mul nsw i32 %6, %7
  %9 = add nsw i32 %5, %8
  store i32 %9, i32* %sum, align 4
  %10 = load i32, i32* %sum, align 4
  %11 = sdiv i32 -2147483648, %10
  store i32 %11, i32* %rem, align 4
  %12 = load i32, i32* %rem, align 4
  %13 = load i32, i32* %rem, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i32 0, i32 0), i32 %12, i32 %13)
  ret void
}

; Function Attrs: nounwind uwtable
define void @divideNeg(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %sum = alloca i32, align 4
  %rem = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %1, align 4
  %5 = mul nsw i32 %3, %4
  %6 = load i32, i32* %2, align 4
  %7 = load i32, i32* %2, align 4
  %8 = mul nsw i32 %6, %7
  %9 = sub nsw i32 %5, %8
  store i32 %9, i32* %sum, align 4
  %10 = load i32, i32* %sum, align 4
  %11 = sdiv i32 %10, 262144
  store i32 %11, i32* %rem, align 4
  %12 = load i32, i32* %rem, align 4
  %13 = load i32, i32* %rem, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.3, i32 0, i32 0), i32 %12, i32 %13)
  ret void
}

; Function Attrs: nounwind uwtable
define void @subtractOvf(i32 %x, i32 %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %sum = alloca i32, align 4
  %rem = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  store i32 %y, i32* %2, align 4
  %3 = load i32, i32* %1, align 4
  %4 = load i32, i32* %1, align 4
  %5 = mul nsw i32 %3, %4
  %6 = load i32, i32* %2, align 4
  %7 = load i32, i32* %2, align 4
  %8 = mul nsw i32 %6, %7
  %9 = add nsw i32 %5, %8
  store i32 %9, i32* %sum, align 4
  %10 = load i32, i32* %sum, align 4
  %11 = sub i32 -2147483648, %10
  store i32 %11, i32* %rem, align 4
  %12 = load i32, i32* %rem, align 4
  %13 = load i32, i32* %rem, align 4
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([37 x i8], [37 x i8]* @.str.4, i32 0, i32 0), i32 %12, i32 %13)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %b21 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 2097152, i32* %b21, align 4
  %2 = load i32, i32* %b21, align 4
  %3 = load i32, i32* %b21, align 4
  call void @compareOvf(i32 %2, i32 %3)
  %4 = load i32, i32* %b21, align 4
  %5 = add nsw i32 %4, 1
  %6 = load i32, i32* %b21, align 4
  %7 = add nsw i32 %6, 2
  call void @divideOvf(i32 %5, i32 %7)
  %8 = load i32, i32* %b21, align 4
  %9 = add nsw i32 %8, 1
  %10 = load i32, i32* %b21, align 4
  %11 = add nsw i32 %10, 2
  call void @divideNeg(i32 %9, i32 %11)
  %12 = load i32, i32* %b21, align 4
  %13 = add nsw i32 %12, 1
  %14 = load i32, i32* %b21, align 4
  %15 = add nsw i32 %14, 2
  call void @subtractOvf(i32 %13, i32 %15)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
