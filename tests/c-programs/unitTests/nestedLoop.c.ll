; ModuleID = './nestedLoop.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@sec26.y1 = private unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@.str = private unnamed_addr constant [16 x i8] c"(i, j)=(%d, %d)\00", align 1

; Function Attrs: nounwind uwtable
define i32 @sec26() #0 {
  %1 = alloca i32, align 4
  %y1 = alloca [4 x [3 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %2 = bitcast [4 x [3 x i32]]* %y1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([4 x [3 x i32]]* @sec26.y1 to i8*), i64 48, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %35, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 4
  br i1 %5, label %6, label %38

; <label>:6                                       ; preds = %3
  store i32 0, i32* %j, align 4
  br label %7

; <label>:7                                       ; preds = %31, %6
  %8 = load i32, i32* %j, align 4
  %9 = icmp slt i32 %8, 3
  br i1 %9, label %10, label %34

; <label>:10                                      ; preds = %7
  %11 = load i32, i32* %i, align 4
  %12 = load i32, i32* %j, align 4
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i32 0, i32 0), i32 %11, i32 %12)
  %14 = load i32, i32* %j, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32, i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %y1, i32 0, i64 %17
  %19 = getelementptr inbounds [3 x i32], [3 x i32]* %18, i32 0, i64 %15
  %20 = load i32, i32* %19, align 4
  %21 = load i32, i32* %j, align 4
  %22 = sext i32 %21 to i64
  %23 = load i32, i32* %i, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %y1, i32 0, i64 %24
  %26 = getelementptr inbounds [3 x i32], [3 x i32]* %25, i32 0, i64 %22
  %27 = load i32, i32* %26, align 4
  %28 = icmp ne i32 %20, %27
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %10
  store i32 1, i32* %1
  br label %39

; <label>:30                                      ; preds = %10
  br label %31

; <label>:31                                      ; preds = %30
  %32 = load i32, i32* %j, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %j, align 4
  br label %7

; <label>:34                                      ; preds = %7
  br label %35

; <label>:35                                      ; preds = %34
  %36 = load i32, i32* %i, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %i, align 4
  br label %3

; <label>:38                                      ; preds = %3
  store i32 0, i32* %1
  br label %39

; <label>:39                                      ; preds = %38, %29
  %40 = load i32, i32* %1
  ret i32 %40
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @sec26()
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  store i32 26, i32* %1
  br label %6

; <label>:5                                       ; preds = %0
  store i32 0, i32* %1
  br label %6

; <label>:6                                       ; preds = %5, %4
  %7 = load i32, i32* %1
  ret i32 %7
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
