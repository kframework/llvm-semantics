; ModuleID = './test31.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.zz = private unnamed_addr constant [2 x i32] [i32 3, i32 5], align 4
@.str = private unnamed_addr constant [18 x i8] c"hello world - %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @silly(i32* %w) #0 {
  %1 = alloca i32*, align 8
  store i32* %w, i32** %1, align 8
  %2 = load i32** %1, align 8
  %3 = getelementptr inbounds i32* %2, i64 1
  %4 = load i32* %3, align 4
  %5 = add nsw i32 %4, 1
  store i32 %5, i32* %3, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %zz = alloca [2 x i32], align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = bitcast [2 x i32]* %zz to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* bitcast ([2 x i32]* @main.zz to i8*), i64 8, i32 4, i1 false)
  %5 = getelementptr inbounds [2 x i32]* %zz, i32 0, i32 0
  call void @silly(i32* %5)
  %6 = getelementptr inbounds [2 x i32]* %zz, i32 0, i64 1
  %7 = load i32* %6, align 4
  %8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str, i32 0, i32 0), i32 %7)
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
