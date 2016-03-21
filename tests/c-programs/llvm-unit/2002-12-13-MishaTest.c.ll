; ModuleID = './2002-12-13-MishaTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Sum is %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @sum(i16* %to, i16* %from, i32) #0 {
  %2 = alloca i16*, align 8
  %3 = alloca i16*, align 8
  %4 = alloca i16, align 2
  %i = alloca i32, align 4
  %count = trunc i32 %0 to i16
  store i16* %to, i16** %2, align 8
  store i16* %from, i16** %3, align 8
  store i16 %count, i16* %4, align 2
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %20, %1
  %6 = load i32, i32* %i, align 4
  %7 = load i16, i16* %4, align 2
  %8 = sext i16 %7 to i32
  %9 = icmp ne i32 %6, %8
  br i1 %9, label %10, label %23

; <label>:10                                      ; preds = %5
  %11 = load i16*, i16** %3, align 8
  %12 = getelementptr inbounds i16, i16* %11, i32 1
  store i16* %12, i16** %3, align 8
  %13 = load i16, i16* %11, align 2
  %14 = sext i16 %13 to i32
  %15 = load i16*, i16** %2, align 8
  %16 = load i16, i16* %15, align 2
  %17 = sext i16 %16 to i32
  %18 = add nsw i32 %17, %14
  %19 = trunc i32 %18 to i16
  store i16 %19, i16* %15, align 2
  br label %20

; <label>:20                                      ; preds = %10
  %21 = load i32, i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %5

; <label>:23                                      ; preds = %5
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %Array = alloca [2 x i16], align 2
  %Sum = alloca i16, align 2
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i16 0, i16* %Sum, align 2
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i32, i32* %i, align 4
  %4 = icmp ne i32 %3, 2
  br i1 %4, label %5, label %14

; <label>:5                                       ; preds = %2
  %6 = load i32, i32* %i, align 4
  %7 = trunc i32 %6 to i16
  %8 = load i32, i32* %i, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [2 x i16], [2 x i16]* %Array, i32 0, i64 %9
  store i16 %7, i16* %10, align 2
  br label %11

; <label>:11                                      ; preds = %5
  %12 = load i32, i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %2

; <label>:14                                      ; preds = %2
  %15 = getelementptr inbounds [2 x i16], [2 x i16]* %Array, i32 0, i32 0
  call void @sum(i16* %Sum, i16* %15, i32 2)
  %16 = load i16, i16* %Sum, align 2
  %17 = sext i16 %16 to i32
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 %17)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
