; ModuleID = './reg-typeSizeof.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.qsortArgs = type { i32*, i32* }

@a = global [4 x i32] [i32 7, i32 5, i32 9, i32 10], align 16
@a1 = common global %struct.qsortArgs zeroinitializer, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d;\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.qsortArgs, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %3 = getelementptr inbounds %struct.qsortArgs* %2, i32 0, i32 0
  store i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i32 0), i32** %3, align 8
  %4 = getelementptr inbounds %struct.qsortArgs* %2, i32 0, i32 1
  store i32* getelementptr inbounds (i32* getelementptr inbounds ([4 x i32]* @a, i32 0, i32 0), i64 4), i32** %4, align 8
  %5 = bitcast %struct.qsortArgs* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.qsortArgs* @a1 to i8*), i8* %5, i64 16, i32 8, i1 false)
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %16, %0
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = icmp ult i64 %8, 4
  br i1 %9, label %10, label %19

; <label>:10                                      ; preds = %6
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [4 x i32]* @a, i32 0, i64 %12
  %14 = load i32* %13, align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %14)
  br label %16

; <label>:16                                      ; preds = %10
  %17 = load i32* %i, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %i, align 4
  br label %6

; <label>:19                                      ; preds = %6
  %20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0))
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
