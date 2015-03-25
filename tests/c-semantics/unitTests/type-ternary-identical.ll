; ModuleID = './type-ternary-identical.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32, i32 }

@main.s0 = private unnamed_addr constant %struct.s { i32 1, i32 2 }, align 4
@main.s1 = private unnamed_addr constant %struct.s { i32 2, i32 3 }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@main.a2 = private unnamed_addr constant [5 x i32] [i32 2, i32 3, i32 0, i32 0, i32 0], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %s0 = alloca %struct.s, align 4
  %s1 = alloca %struct.s, align 4
  %x = alloca i32, align 4
  %a1 = alloca [5 x i32], align 16
  %a2 = alloca [5 x i32], align 16
  %1 = bitcast %struct.s* %s0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* bitcast (%struct.s* @main.s0 to i8*), i64 8, i32 4, i1 false)
  %2 = bitcast %struct.s* %s1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast (%struct.s* @main.s1 to i8*), i64 8, i32 4, i1 false)
  store i32 8, i32* %x, align 4
  %3 = load i32* %x, align 4
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %3)
  %5 = bitcast [5 x i32]* %a1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 20, i32 16, i1 false)
  %6 = bitcast [5 x i32]* %a2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %6, i8* bitcast ([5 x i32]* @main.a2 to i8*), i64 20, i32 16, i1 false)
  store i32 8, i32* %x, align 4
  %7 = load i32* %x, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i32 %7)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
