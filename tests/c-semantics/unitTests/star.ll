; ModuleID = './star.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.x = private unnamed_addr constant [5 x i32] [i32 1, i32 2, i32 3, i32 0, i32 0], align 16
@.str = private unnamed_addr constant [14 x i8] c"sizeof(a)=%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca [5 x i32], align 16
  store i32 0, i32* %1
  %2 = bitcast [5 x i32]* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([5 x i32]* @main.x to i8*), i64 20, i32 16, i1 false)
  %3 = getelementptr inbounds [5 x i32]* %x, i32 0, i32 0
  %4 = call i32 @f(i32* %3)
  ret i32 %4
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @f(i32* %a) #0 {
  %1 = alloca i32*, align 8
  store i32* %a, i32** %1, align 8
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i32 0, i32 0), i32 8)
  %3 = load i32** %1, align 8
  %4 = getelementptr inbounds i32* %3, i64 1
  %5 = load i32* %4, align 4
  ret i32 %5
}

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
