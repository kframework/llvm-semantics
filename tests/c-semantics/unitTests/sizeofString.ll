; ModuleID = './sizeofString.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.a = internal constant [4 x i8] c"abc\00", align 1
@main.b = internal constant [3 x i8] c"def", align 1
@main.c = internal constant [3 x i8] c"55\00", align 1
@main.d = internal constant [2 x i8] c"\FF\00", align 1
@.str = private unnamed_addr constant [16 x i8] c"sizeof(a) = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [16 x i8] c"sizeof(b) = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [16 x i8] c"sizeof(c) = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [16 x i8] c"sizeof(d) = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str, i32 0, i32 0), i64 4)
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str1, i32 0, i32 0), i64 3)
  %4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str2, i32 0, i32 0), i64 3)
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str3, i32 0, i32 0), i64 2)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
