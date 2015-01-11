; ModuleID = './c1x0607060209.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@n = global i32 6, align 4
@m = global i32 7, align 4
@.str = private unnamed_addr constant [21 x i8] c"c[0][2][4][5] == %d\0A\00", align 1
@.str1 = private unnamed_addr constant [21 x i8] c"c[1][3][4][5] == %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*
  %p = alloca i32*, align 8
  %r = alloca i32*, align 8
  %3 = alloca i32
  store i32 0, i32* %1
  %4 = load i32* @n, align 4
  %5 = zext i32 %4 to i64
  %6 = load i32* @m, align 4
  %7 = zext i32 %6 to i64
  %8 = call i8* @llvm.stacksave()
  store i8* %8, i8** %2
  %9 = mul nuw i64 %5, 6
  %10 = mul nuw i64 %9, %7
  %11 = alloca i32, i64 %10, align 16
  %12 = load i32* @n, align 4
  %13 = add nsw i32 %12, 1
  %14 = zext i32 %13 to i64
  %15 = load i32* @n, align 4
  %16 = zext i32 %15 to i64
  %17 = load i32* @n, align 4
  %18 = zext i32 %17 to i64
  %19 = load i32* @m, align 4
  %20 = zext i32 %19 to i64
  %21 = mul nuw i64 %16, %18
  %22 = mul nuw i64 %21, 6
  %23 = mul nuw i64 %22, %20
  %24 = alloca i32, i64 %23, align 16
  %25 = load i32* @n, align 4
  %26 = zext i32 %25 to i64
  %27 = load i32* @n, align 4
  %28 = zext i32 %27 to i64
  %29 = load i32* @n, align 4
  %30 = add nsw i32 %29, 1
  %31 = zext i32 %30 to i64
  %32 = mul nuw i64 %18, 6
  %33 = mul nuw i64 %32, %20
  %34 = mul nsw i64 0, %33
  %35 = getelementptr inbounds i32* %24, i64 %34
  store i32* %35, i32** %r, align 8
  %36 = mul nuw i64 %18, 6
  %37 = mul nuw i64 %36, %20
  %38 = mul nsw i64 0, %37
  %39 = getelementptr inbounds i32* %24, i64 %38
  %40 = mul nuw i64 6, %20
  %41 = mul nsw i64 2, %40
  %42 = getelementptr inbounds i32* %39, i64 %41
  %43 = mul nsw i64 4, %20
  %44 = getelementptr inbounds i32* %42, i64 %43
  %45 = getelementptr inbounds i32* %44, i64 5
  store i32 32, i32* %45, align 4
  %46 = mul nuw i64 %18, 6
  %47 = mul nuw i64 %46, %20
  %48 = mul nsw i64 1, %47
  %49 = getelementptr inbounds i32* %24, i64 %48
  %50 = mul nuw i64 6, %20
  %51 = mul nsw i64 3, %50
  %52 = getelementptr inbounds i32* %49, i64 %51
  %53 = mul nsw i64 4, %20
  %54 = getelementptr inbounds i32* %52, i64 %53
  %55 = getelementptr inbounds i32* %54, i64 5
  store i32 24, i32* %55, align 4
  %56 = mul nuw i64 %18, 6
  %57 = mul nuw i64 %56, %20
  %58 = mul nsw i64 2, %57
  %59 = getelementptr inbounds i32* %24, i64 %58
  %60 = mul nuw i64 6, %20
  %61 = mul nsw i64 2, %60
  %62 = getelementptr inbounds i32* %59, i64 %61
  %63 = mul nsw i64 2, %20
  %64 = getelementptr inbounds i32* %62, i64 %63
  %65 = getelementptr inbounds i32* %64, i64 5
  store i32 17, i32* %65, align 4
  %66 = mul nuw i64 %18, 6
  %67 = mul nuw i64 %66, %20
  %68 = mul nsw i64 3, %67
  %69 = getelementptr inbounds i32* %24, i64 %68
  %70 = mul nuw i64 6, %20
  %71 = mul nsw i64 2, %70
  %72 = getelementptr inbounds i32* %69, i64 %71
  %73 = mul nsw i64 2, %20
  %74 = getelementptr inbounds i32* %72, i64 %73
  %75 = getelementptr inbounds i32* %74, i64 4
  store i32 99, i32* %75, align 4
  %76 = mul nuw i64 %18, 6
  %77 = mul nuw i64 %76, %20
  %78 = mul nsw i64 0, %77
  %79 = getelementptr inbounds i32* %24, i64 %78
  %80 = mul nuw i64 6, %20
  %81 = mul nsw i64 2, %80
  %82 = getelementptr inbounds i32* %79, i64 %81
  %83 = mul nsw i64 4, %20
  %84 = getelementptr inbounds i32* %82, i64 %83
  %85 = getelementptr inbounds i32* %84, i64 5
  %86 = load i32* %85, align 4
  %87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i32 0, i32 0), i32 %86)
  %88 = mul nuw i64 %18, 6
  %89 = mul nuw i64 %88, %20
  %90 = mul nsw i64 1, %89
  %91 = getelementptr inbounds i32* %24, i64 %90
  %92 = mul nuw i64 6, %20
  %93 = mul nsw i64 3, %92
  %94 = getelementptr inbounds i32* %91, i64 %93
  %95 = mul nsw i64 4, %20
  %96 = getelementptr inbounds i32* %94, i64 %95
  %97 = getelementptr inbounds i32* %96, i64 5
  %98 = load i32* %97, align 4
  %99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 %98)
  store i32 0, i32* %1
  store i32 1, i32* %3
  %100 = load i8** %2
  call void @llvm.stackrestore(i8* %100)
  %101 = load i32* %1
  ret i32 %101
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
