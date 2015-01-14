; ModuleID = './pointerToArray.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.arr = private unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4
@.str = private unnamed_addr constant [5 x i8] c"Bug\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @f([0 x i32]* %x, i32 %num) #0 {
  %1 = alloca [0 x i32]*, align 8
  %2 = alloca i32, align 4
  %sum = alloca i32, align 4
  %i = alloca i32, align 4
  store [0 x i32]* %x, [0 x i32]** %1, align 8
  store i32 %num, i32* %2, align 4
  store i32 0, i32* %sum, align 4
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %15, %0
  %4 = load i32* %i, align 4
  %5 = load i32* %2, align 4
  %6 = icmp slt i32 %4, %5
  br i1 %6, label %7, label %18

; <label>:7                                       ; preds = %3
  %8 = load i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = load [0 x i32]** %1, align 8
  %11 = getelementptr inbounds [0 x i32]* %10, i32 0, i64 %9
  %12 = load i32* %11, align 4
  %13 = load i32* %sum, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, i32* %sum, align 4
  br label %15

; <label>:15                                      ; preds = %7
  %16 = load i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %3

; <label>:18                                      ; preds = %3
  %19 = load i32* %sum, align 4
  ret i32 %19
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %arr = alloca [3 x i32], align 4
  %z = alloca [0 x i32]*, align 8
  store i32 0, i32* %1
  %2 = bitcast [3 x i32]* %arr to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([3 x i32]* @main.arr to i8*), i64 12, i32 4, i1 false)
  %3 = bitcast [3 x i32]* %arr to [0 x i32]*
  store [0 x i32]* %3, [0 x i32]** %z, align 8
  %4 = load [0 x i32]** %z, align 8
  %5 = call i32 @f([0 x i32]* %4, i32 3)
  %6 = icmp ne i32 %5, 6
  br i1 %6, label %7, label %9

; <label>:7                                       ; preds = %0
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0))
  br label %9

; <label>:9                                       ; preds = %7, %0
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
