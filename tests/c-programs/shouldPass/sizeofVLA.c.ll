; ModuleID = './sizeofVLA.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [17 x i8] c"%d should be %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"n is %d\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"n is now %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"sizeof(int[n]) = %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %x = alloca i32, align 4
  %1 = alloca i8*
  %n = alloca i32, align 4
  %size = alloca i32, align 4
  store i32 5, i32* %x, align 4
  %2 = load i32, i32* %x, align 4
  %3 = zext i32 %2 to i64
  %4 = call i8* @llvm.stacksave()
  store i8* %4, i8** %1
  %5 = alloca i32, i64 %3, align 16
  %6 = load i32, i32* %x, align 4
  %7 = zext i32 %6 to i64
  %8 = load i32, i32* %x, align 4
  %9 = zext i32 %8 to i64
  %10 = mul nuw i64 %7, %9
  %11 = alloca i32, i64 %10, align 16
  store i32 2, i32* %n, align 4
  %12 = mul nuw i64 4, %3
  %13 = udiv i64 %12, 4
  %14 = trunc i64 %13 to i32
  %15 = load i32, i32* %x, align 4
  %16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0), i32 %14, i32 %15)
  %17 = load i32, i32* %n, align 4
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 %17)
  %19 = load i32, i32* %n, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %n, align 4
  %21 = sext i32 %19 to i64
  %22 = mul nsw i64 %21, %9
  %23 = getelementptr inbounds i32, i32* %11, i64 %22
  %24 = mul nuw i64 4, %9
  %25 = trunc i64 %24 to i32
  store i32 %25, i32* %size, align 4
  %26 = load i32, i32* %n, align 4
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0), i32 %26)
  %28 = mul nuw i64 %7, %9
  %29 = mul nuw i64 4, %28
  %30 = load i32, i32* %n, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, i32* %n, align 4
  %32 = sext i32 %30 to i64
  %33 = mul nsw i64 %32, %9
  %34 = getelementptr inbounds i32, i32* %11, i64 %33
  %35 = mul nuw i64 4, %9
  %36 = udiv i64 %29, %35
  %37 = trunc i64 %36 to i32
  %38 = load i32, i32* %x, align 4
  %39 = add nsw i32 %38, 1
  %40 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str, i32 0, i32 0), i32 %37, i32 %39)
  %41 = load i32, i32* %n, align 4
  %42 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0), i32 %41)
  %43 = load i32, i32* %n, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %n, align 4
  %45 = zext i32 %43 to i64
  %46 = mul nuw i64 4, %45
  %47 = trunc i64 %46 to i32
  %48 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i32 %47)
  %49 = load i32, i32* %n, align 4
  %50 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0), i32 %49)
  %51 = load i8*, i8** %1
  call void @llvm.stackrestore(i8* %51)
  ret i32 0
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
