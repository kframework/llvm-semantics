; ModuleID = './twofile-link1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@z = global i32 5, align 4
@q = global i32 3, align 4
@c = global i32 32, align 4
@r = global i32 77, align 4
@.str = private unnamed_addr constant [11 x i8] c"1zza = %d\0A\00", align 1
@zz = internal global i32 0, align 4
@main.zz = internal global i32 5, align 4
@.str1 = private unnamed_addr constant [9 x i8] c"1z = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"1w = %d\0A\00", align 1
@w = internal global i32 7, align 4
@.str3 = private unnamed_addr constant [9 x i8] c"1q = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"1r = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"1v = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [11 x i8] c"1zzb = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [12 x i8] c"1g(5) = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [13 x i8] c"f(2, 3)==%d\0A\00", align 1
@.str9 = private unnamed_addr constant [21 x i8] c"f(2, 3) should be 7\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %q = alloca i32, align 4
  %v = alloca i32, align 4
  store i32 0, i32* %1
  store i32 4, i32* %q, align 4
  store i32 15, i32* %v, align 4
  %2 = load i32* @zz, align 4
  %3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 %2)
  %4 = load i32* @z, align 4
  %5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 %4)
  %6 = load i32* @w, align 4
  %7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0), i32 %6)
  %8 = load i32* %q, align 4
  %9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0), i32 %8)
  %10 = load i32* @r, align 4
  %11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0), i32 %10)
  %12 = load i32* %v, align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0), i32 %12)
  %14 = load i32* @main.zz, align 4
  %15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str6, i32 0, i32 0), i32 %14)
  %16 = call i32 @g(i32 5)
  %17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str7, i32 0, i32 0), i32 %16)
  %18 = call i32 @f(i32 2, i32 3)
  %19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str8, i32 0, i32 0), i32 %18)
  %20 = call i32 @f(i32 2, i32 3)
  %21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str8, i32 0, i32 0), i32 %20)
  %22 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str9, i32 0, i32 0))
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define internal i32 @g(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  ret i32 %2
}

declare i32 @f(i32, i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
