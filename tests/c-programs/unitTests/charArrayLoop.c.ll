; ModuleID = './charArrayLoop.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [2 x [5 x i8]], align 1
  %count = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %p = alloca i8*, align 8
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast [2 x [5 x i8]]* %a to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 10, i32 1, i1 false)
  store i32 0, i32* %count, align 4
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %24, %0
  %4 = load i32, i32* %i, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %27

; <label>:6                                       ; preds = %3
  store i32 0, i32* %j, align 4
  br label %7

; <label>:7                                       ; preds = %20, %6
  %8 = load i32, i32* %j, align 4
  %9 = icmp slt i32 %8, 5
  br i1 %9, label %10, label %23

; <label>:10                                      ; preds = %7
  %11 = load i32, i32* %count, align 4
  %12 = add nsw i32 %11, 1
  store i32 %12, i32* %count, align 4
  %13 = trunc i32 %11 to i8
  %14 = load i32, i32* %j, align 4
  %15 = sext i32 %14 to i64
  %16 = load i32, i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [2 x [5 x i8]], [2 x [5 x i8]]* %a, i32 0, i64 %17
  %19 = getelementptr inbounds [5 x i8], [5 x i8]* %18, i32 0, i64 %15
  store i8 %13, i8* %19, align 1
  br label %20

; <label>:20                                      ; preds = %10
  %21 = load i32, i32* %j, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %j, align 4
  br label %7

; <label>:23                                      ; preds = %7
  br label %24

; <label>:24                                      ; preds = %23
  %25 = load i32, i32* %i, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %i, align 4
  br label %3

; <label>:27                                      ; preds = %3
  %28 = getelementptr inbounds [2 x [5 x i8]], [2 x [5 x i8]]* %a, i32 0, i64 0
  %29 = getelementptr inbounds [5 x i8], [5 x i8]* %28, i32 0, i64 0
  store i8* %29, i8** %p, align 8
  store i32 0, i32* %i1, align 4
  br label %30

; <label>:30                                      ; preds = %41, %27
  %31 = load i32, i32* %i1, align 4
  %32 = icmp slt i32 %31, 10
  br i1 %32, label %33, label %44

; <label>:33                                      ; preds = %30
  %34 = load i8*, i8** %p, align 8
  %35 = load i32, i32* %i1, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8* %34, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = sext i8 %38 to i32
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %39)
  br label %41

; <label>:41                                      ; preds = %33
  %42 = load i32, i32* %i1, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %i1, align 4
  br label %30

; <label>:44                                      ; preds = %30
  %45 = load i32, i32* %1
  ret i32 %45
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
