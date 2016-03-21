; ModuleID = './inits.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.x = private unnamed_addr constant [3 x i32] [i32 1, i32 3, i32 5], align 4
@main.y0 = private unnamed_addr constant [12 x i32] [i32 1, i32 3, i32 5, i32 2, i32 4, i32 6, i32 3, i32 5, i32 7, i32 0, i32 0, i32 0], align 16
@main.y1 = private unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@main.y2 = private unnamed_addr constant [4 x [3 x i32]] [[3 x i32] [i32 1, i32 3, i32 5], [3 x i32] [i32 2, i32 4, i32 6], [3 x i32] [i32 3, i32 5, i32 7], [3 x i32] zeroinitializer], align 16
@.str = private unnamed_addr constant [54 x i8] c"i=%d, j=%d, k=%d; y0[k]=%d, y1[i][j]=%d, y2[i][j]=%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [3 x i32], align 4
  %y0 = alloca [12 x i32], align 16
  %y1 = alloca [4 x [3 x i32]], align 16
  %y2 = alloca [4 x [3 x i32]], align 16
  %y3 = alloca [4 x [3 x i32]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast [3 x i32]* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([3 x i32]* @main.x to i8*), i64 12, i32 4, i1 false)
  %3 = bitcast [12 x i32]* %y0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* bitcast ([12 x i32]* @main.y0 to i8*), i64 48, i32 16, i1 false)
  %4 = bitcast [4 x [3 x i32]]* %y1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* bitcast ([4 x [3 x i32]]* @main.y1 to i8*), i64 48, i32 16, i1 false)
  %5 = bitcast [4 x [3 x i32]]* %y2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* bitcast ([4 x [3 x i32]]* @main.y2 to i8*), i64 48, i32 16, i1 false)
  %6 = bitcast [4 x [3 x i32]]* %y3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 48, i32 16, i1 false)
  %7 = bitcast i8* %6 to [4 x [3 x i32]]*
  %8 = getelementptr [4 x [3 x i32]], [4 x [3 x i32]]* %7, i32 0, i32 0
  %9 = getelementptr [3 x i32], [3 x i32]* %8, i32 0, i32 0
  store i32 1, i32* %9
  %10 = getelementptr [4 x [3 x i32]], [4 x [3 x i32]]* %7, i32 0, i32 1
  %11 = getelementptr [3 x i32], [3 x i32]* %10, i32 0, i32 0
  store i32 2, i32* %11
  %12 = getelementptr [4 x [3 x i32]], [4 x [3 x i32]]* %7, i32 0, i32 2
  %13 = getelementptr [3 x i32], [3 x i32]* %12, i32 0, i32 0
  store i32 3, i32* %13
  %14 = getelementptr [4 x [3 x i32]], [4 x [3 x i32]]* %7, i32 0, i32 3
  %15 = getelementptr [3 x i32], [3 x i32]* %14, i32 0, i32 0
  store i32 4, i32* %15
  store i32 0, i32* %i, align 4
  br label %16

; <label>:16                                      ; preds = %84, %0
  %17 = load i32, i32* %i, align 4
  %18 = icmp slt i32 %17, 4
  br i1 %18, label %19, label %87

; <label>:19                                      ; preds = %16
  store i32 0, i32* %j, align 4
  br label %20

; <label>:20                                      ; preds = %80, %19
  %21 = load i32, i32* %j, align 4
  %22 = icmp slt i32 %21, 3
  br i1 %22, label %23, label %83

; <label>:23                                      ; preds = %20
  %24 = load i32, i32* %i, align 4
  %25 = mul nsw i32 3, %24
  %26 = load i32, i32* %j, align 4
  %27 = add nsw i32 %25, %26
  store i32 %27, i32* %k, align 4
  %28 = load i32, i32* %j, align 4
  %29 = sext i32 %28 to i64
  %30 = load i32, i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %y1, i32 0, i64 %31
  %33 = getelementptr inbounds [3 x i32], [3 x i32]* %32, i32 0, i64 %29
  %34 = load i32, i32* %33, align 4
  %35 = load i32, i32* %j, align 4
  %36 = sext i32 %35 to i64
  %37 = load i32, i32* %i, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %y2, i32 0, i64 %38
  %40 = getelementptr inbounds [3 x i32], [3 x i32]* %39, i32 0, i64 %36
  %41 = load i32, i32* %40, align 4
  %42 = icmp ne i32 %34, %41
  br i1 %42, label %56, label %43

; <label>:43                                      ; preds = %23
  %44 = load i32, i32* %j, align 4
  %45 = sext i32 %44 to i64
  %46 = load i32, i32* %i, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %y1, i32 0, i64 %47
  %49 = getelementptr inbounds [3 x i32], [3 x i32]* %48, i32 0, i64 %45
  %50 = load i32, i32* %49, align 4
  %51 = load i32, i32* %k, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [12 x i32], [12 x i32]* %y0, i32 0, i64 %52
  %54 = load i32, i32* %53, align 4
  %55 = icmp ne i32 %50, %54
  br i1 %55, label %56, label %79

; <label>:56                                      ; preds = %43, %23
  %57 = load i32, i32* %i, align 4
  %58 = load i32, i32* %j, align 4
  %59 = load i32, i32* %k, align 4
  %60 = load i32, i32* %k, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [12 x i32], [12 x i32]* %y0, i32 0, i64 %61
  %63 = load i32, i32* %62, align 4
  %64 = load i32, i32* %j, align 4
  %65 = sext i32 %64 to i64
  %66 = load i32, i32* %i, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %y1, i32 0, i64 %67
  %69 = getelementptr inbounds [3 x i32], [3 x i32]* %68, i32 0, i64 %65
  %70 = load i32, i32* %69, align 4
  %71 = load i32, i32* %j, align 4
  %72 = sext i32 %71 to i64
  %73 = load i32, i32* %i, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [4 x [3 x i32]], [4 x [3 x i32]]* %y2, i32 0, i64 %74
  %76 = getelementptr inbounds [3 x i32], [3 x i32]* %75, i32 0, i64 %72
  %77 = load i32, i32* %76, align 4
  %78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str, i32 0, i32 0), i32 %57, i32 %58, i32 %59, i32 %63, i32 %70, i32 %77)
  br label %79

; <label>:79                                      ; preds = %56, %43
  br label %80

; <label>:80                                      ; preds = %79
  %81 = load i32, i32* %j, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %j, align 4
  br label %20

; <label>:83                                      ; preds = %20
  br label %84

; <label>:84                                      ; preds = %83
  %85 = load i32, i32* %i, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %i, align 4
  br label %16

; <label>:87                                      ; preds = %16
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
