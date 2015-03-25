; ModuleID = './crazyInit.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.S1 = type { [3 x i32] }
%struct.S2 = type { %struct.S1 }

@main.s1 = private unnamed_addr constant %struct.S1 { [3 x i32] [i32 1, i32 2, i32 3] }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s1 = alloca %struct.S1, align 4
  %s2 = alloca %struct.S2, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.S1* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.S1* @main.s1 to i8*), i64 12, i32 4, i1 false)
  %3 = getelementptr inbounds %struct.S2* %s2, i32 0, i32 0
  %4 = bitcast %struct.S1* %3 to i8*
  %5 = bitcast %struct.S1* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 12, i32 4, i1 false)
  store i32 0, i32* %i, align 4
  br label %6

; <label>:6                                       ; preds = %17, %0
  %7 = load i32* %i, align 4
  %8 = icmp slt i32 %7, 3
  br i1 %8, label %9, label %20

; <label>:9                                       ; preds = %6
  %10 = load i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds %struct.S2* %s2, i32 0, i32 0
  %13 = getelementptr inbounds %struct.S1* %12, i32 0, i32 0
  %14 = getelementptr inbounds [3 x i32]* %13, i32 0, i64 %11
  %15 = load i32* %14, align 4
  %16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %15)
  br label %17

; <label>:17                                      ; preds = %9
  %18 = load i32* %i, align 4
  %19 = add nsw i32 %18, 1
  store i32 %19, i32* %i, align 4
  br label %6

; <label>:20                                      ; preds = %6
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
