; ModuleID = './initArraysAndStructs.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32, i32 }

@.str = private unnamed_addr constant [40 x i8] c"[4].a=%d, [4].b=%d, [5].a=%d, [5].b=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [29 x i8] c"sizeof(s)/sizeof(s[0]) = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca [6 x %struct.anon], align 16
  store i32 0, i32* %1
  %2 = bitcast [6 x %struct.anon]* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 48, i32 16, i1 false)
  %3 = bitcast i8* %2 to [6 x %struct.anon]*
  %4 = getelementptr [6 x %struct.anon]* %3, i32 0, i32 4
  %5 = getelementptr %struct.anon* %4, i32 0, i32 0
  store i32 5, i32* %5
  %6 = getelementptr %struct.anon* %4, i32 0, i32 1
  store i32 6, i32* %6
  %7 = getelementptr [6 x %struct.anon]* %3, i32 0, i32 5
  %8 = getelementptr %struct.anon* %7, i32 0, i32 1
  store i32 8, i32* %8
  %9 = getelementptr inbounds [6 x %struct.anon]* %s, i32 0, i64 4
  %10 = getelementptr inbounds %struct.anon* %9, i32 0, i32 1
  %11 = load i32* %10, align 4
  %12 = getelementptr inbounds [6 x %struct.anon]* %s, i32 0, i64 5
  %13 = getelementptr inbounds %struct.anon* %12, i32 0, i32 0
  store i32 %11, i32* %13, align 4
  %14 = getelementptr inbounds [6 x %struct.anon]* %s, i32 0, i64 4
  %15 = getelementptr inbounds %struct.anon* %14, i32 0, i32 0
  %16 = load i32* %15, align 4
  %17 = getelementptr inbounds [6 x %struct.anon]* %s, i32 0, i64 4
  %18 = getelementptr inbounds %struct.anon* %17, i32 0, i32 1
  %19 = load i32* %18, align 4
  %20 = getelementptr inbounds [6 x %struct.anon]* %s, i32 0, i64 5
  %21 = getelementptr inbounds %struct.anon* %20, i32 0, i32 0
  %22 = load i32* %21, align 4
  %23 = getelementptr inbounds [6 x %struct.anon]* %s, i32 0, i64 5
  %24 = getelementptr inbounds %struct.anon* %23, i32 0, i32 1
  %25 = load i32* %24, align 4
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([40 x i8]* @.str, i32 0, i32 0), i32 %16, i32 %19, i32 %22, i32 %25)
  %27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i32 0, i32 0), i64 6)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
