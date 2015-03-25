; ModuleID = './moreStructInits2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S = type { i32, i32, [6 x i32], %struct.T }
%struct.T = type { i32, [8 x i32] }

@main.s = private unnamed_addr constant %struct.S { i32 6, i32 12, [6 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5, i32 6], %struct.T { i32 7, [8 x i32] [i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15] } }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca %struct.S, align 4
  %i = alloca i32, align 4
  %i1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.S* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.S* @main.s to i8*), i64 68, i32 4, i1 false)
  %3 = getelementptr inbounds %struct.S* %s, i32 0, i32 0
  %4 = load i32* %3, align 4
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %4)
  %6 = getelementptr inbounds %struct.S* %s, i32 0, i32 1
  %7 = load i32* %6, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %7)
  store i32 0, i32* %i, align 4
  br label %9

; <label>:9                                       ; preds = %19, %0
  %10 = load i32* %i, align 4
  %11 = icmp slt i32 %10, 6
  br i1 %11, label %12, label %22

; <label>:12                                      ; preds = %9
  %13 = load i32* %i, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  %16 = getelementptr inbounds [6 x i32]* %15, i32 0, i64 %14
  %17 = load i32* %16, align 4
  %18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %17)
  br label %19

; <label>:19                                      ; preds = %12
  %20 = load i32* %i, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %i, align 4
  br label %9

; <label>:22                                      ; preds = %9
  %23 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %24 = getelementptr inbounds %struct.T* %23, i32 0, i32 0
  %25 = load i32* %24, align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %25)
  store i32 0, i32* %i1, align 4
  br label %27

; <label>:27                                      ; preds = %38, %22
  %28 = load i32* %i1, align 4
  %29 = icmp slt i32 %28, 8
  br i1 %29, label %30, label %41

; <label>:30                                      ; preds = %27
  %31 = load i32* %i1, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %34 = getelementptr inbounds %struct.T* %33, i32 0, i32 1
  %35 = getelementptr inbounds [8 x i32]* %34, i32 0, i64 %32
  %36 = load i32* %35, align 4
  %37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %36)
  br label %38

; <label>:38                                      ; preds = %30
  %39 = load i32* %i1, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %i1, align 4
  br label %27

; <label>:41                                      ; preds = %27
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
