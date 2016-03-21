; ModuleID = './global.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@array = global [4 x i32] [i32 127, i32 -1, i32 100, i32 -28], align 16
@array2 = common global [4 x [4 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [32 x i8] c"error: i=%d, j=%d, result = %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"a=%d b=%d a*a=%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @test() #0 {
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %i, align 4
  store i32 0, i32* %j, align 4
  store i32 0, i32* %i, align 4
  br label %1

; <label>:1                                       ; preds = %48, %0
  %2 = load i32, i32* %i, align 4
  %3 = icmp slt i32 %2, 4
  br i1 %3, label %4, label %51

; <label>:4                                       ; preds = %1
  store i32 0, i32* %j, align 4
  br label %5

; <label>:5                                       ; preds = %44, %4
  %6 = load i32, i32* %j, align 4
  %7 = icmp slt i32 %6, 4
  br i1 %7, label %8, label %47

; <label>:8                                       ; preds = %5
  %9 = load i32, i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [4 x i32], [4 x i32]* @array, i32 0, i64 %10
  %12 = load i32, i32* %11, align 4
  %13 = load i32, i32* %j, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [4 x i32], [4 x i32]* @array, i32 0, i64 %14
  %16 = load i32, i32* %15, align 4
  %17 = mul nsw i32 %12, %16
  %18 = load i32, i32* %j, align 4
  %19 = sext i32 %18 to i64
  %20 = load i32, i32* %i, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* @array2, i32 0, i64 %21
  %23 = getelementptr inbounds [4 x i32], [4 x i32]* %22, i32 0, i64 %19
  store i32 %17, i32* %23, align 4
  %24 = load i32, i32* %j, align 4
  %25 = sext i32 %24 to i64
  %26 = load i32, i32* %i, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* @array2, i32 0, i64 %27
  %29 = getelementptr inbounds [4 x i32], [4 x i32]* %28, i32 0, i64 %25
  %30 = load i32, i32* %29, align 4
  %31 = icmp sle i32 %30, 0
  br i1 %31, label %32, label %43

; <label>:32                                      ; preds = %8
  %33 = load i32, i32* %i, align 4
  %34 = load i32, i32* %j, align 4
  %35 = load i32, i32* %j, align 4
  %36 = sext i32 %35 to i64
  %37 = load i32, i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [4 x [4 x i32]], [4 x [4 x i32]]* @array2, i32 0, i64 %38
  %40 = getelementptr inbounds [4 x i32], [4 x i32]* %39, i32 0, i64 %36
  %41 = load i32, i32* %40, align 4
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i32 0, i32 0), i32 %33, i32 %34, i32 %41)
  br label %43

; <label>:43                                      ; preds = %32, %8
  br label %44

; <label>:44                                      ; preds = %43
  %45 = load i32, i32* %j, align 4
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %j, align 4
  br label %5

; <label>:47                                      ; preds = %5
  br label %48

; <label>:48                                      ; preds = %47
  %49 = load i32, i32* %i, align 4
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %i, align 4
  br label %1

; <label>:51                                      ; preds = %1
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 0, i32* %1
  store i32 127, i32* %a, align 4
  store i32 100, i32* %b, align 4
  %2 = load i32, i32* %a, align 4
  %3 = load i32, i32* %b, align 4
  %4 = load i32, i32* %a, align 4
  %5 = load i32, i32* %a, align 4
  %6 = mul nsw i32 %4, %5
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i32 0, i32 0), i32 %2, i32 %3, i32 %6)
  call void @test()
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
