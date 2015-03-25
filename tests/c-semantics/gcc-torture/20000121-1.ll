; ModuleID = './20000121-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @big(i64 %u) #0 {
  %1 = alloca i64, align 8
  store i64 %u, i64* %1, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define void @doit(i32 %a, i32 %b, i8* %id) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  store i8* %id, i8** %3, align 8
  %4 = load i8** %3, align 8
  %5 = load i8* %4, align 1
  %6 = sext i8 %5 to i64
  call void @big(i64 %6)
  %7 = load i32* %1, align 4
  %8 = zext i32 %7 to i64
  call void @big(i64 %8)
  %9 = load i32* %2, align 4
  %10 = zext i32 %9 to i64
  call void @big(i64 %10)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @doit(i32 1, i32 1, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0))
  ret i32 0
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
