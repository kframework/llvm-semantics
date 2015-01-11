; ModuleID = './staticArrayArg.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.a = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 4, i32 5], align 16

; Function Attrs: nounwind uwtable
define i32 @f(i32* %a) #0 {
  %1 = alloca i32*, align 8
  store i32* %a, i32** %1, align 8
  %2 = load i32** %1, align 8
  %3 = getelementptr inbounds i32* %2, i64 0
  %4 = load i32* %3, align 4
  %5 = load i32** %1, align 8
  %6 = getelementptr inbounds i32* %5, i64 1
  %7 = load i32* %6, align 4
  %8 = add nsw i32 %4, %7
  %9 = load i32** %1, align 8
  %10 = getelementptr inbounds i32* %9, i64 2
  %11 = load i32* %10, align 4
  %12 = add nsw i32 %8, %11
  ret i32 %12
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [5 x i32], align 16
  store i32 0, i32* %1
  %2 = bitcast [5 x i32]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([5 x i32]* @main.a to i8*), i64 20, i32 16, i1 false)
  %3 = getelementptr inbounds [5 x i32]* %a, i32 0, i32 0
  %4 = call i32 @f(i32* %3)
  ret i32 %4
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
