; ModuleID = './c1x0607060209.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@n = global i32 6, align 4
@m = global i32 7, align 4
@.str = private unnamed_addr constant [21 x i8] c"c[0][2][4][5] == %d\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"c[1][3][4][5] == %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*
  %p = alloca i32*, align 8
  %r = alloca i32*, align 8
  store i32 0, i32* %1
  %3 = load i32, i32* @n, align 4
  %4 = zext i32 %3 to i64
  %5 = load i32, i32* @m, align 4
  %6 = zext i32 %5 to i64
  %7 = call i8* @llvm.stacksave()
  store i8* %7, i8** %2
  %8 = mul nuw i64 %4, 6
  %9 = mul nuw i64 %8, %6
  %10 = alloca i32, i64 %9, align 16
  %11 = load i32, i32* @n, align 4
  %12 = add nsw i32 %11, 1
  %13 = zext i32 %12 to i64
  %14 = load i32, i32* @n, align 4
  %15 = zext i32 %14 to i64
  %16 = load i32, i32* @n, align 4
  %17 = zext i32 %16 to i64
  %18 = load i32, i32* @m, align 4
  %19 = zext i32 %18 to i64
  %20 = mul nuw i64 %15, %17
  %21 = mul nuw i64 %20, 6
  %22 = mul nuw i64 %21, %19
  %23 = alloca i32, i64 %22, align 16
  %24 = load i32, i32* @n, align 4
  %25 = zext i32 %24 to i64
  %26 = load i32, i32* @n, align 4
  %27 = zext i32 %26 to i64
  %28 = load i32, i32* @n, align 4
  %29 = add nsw i32 %28, 1
  %30 = zext i32 %29 to i64
  %31 = mul nuw i64 %17, 6
  %32 = mul nuw i64 %31, %19
  %33 = mul nsw i64 0, %32
  %34 = getelementptr inbounds i32, i32* %23, i64 %33
  store i32* %34, i32** %r, align 8
  %35 = mul nuw i64 %17, 6
  %36 = mul nuw i64 %35, %19
  %37 = mul nsw i64 0, %36
  %38 = getelementptr inbounds i32, i32* %23, i64 %37
  %39 = mul nuw i64 6, %19
  %40 = mul nsw i64 2, %39
  %41 = getelementptr inbounds i32, i32* %38, i64 %40
  %42 = mul nsw i64 4, %19
  %43 = getelementptr inbounds i32, i32* %41, i64 %42
  %44 = getelementptr inbounds i32, i32* %43, i64 5
  store i32 32, i32* %44, align 4
  %45 = mul nuw i64 %17, 6
  %46 = mul nuw i64 %45, %19
  %47 = mul nsw i64 1, %46
  %48 = getelementptr inbounds i32, i32* %23, i64 %47
  %49 = mul nuw i64 6, %19
  %50 = mul nsw i64 3, %49
  %51 = getelementptr inbounds i32, i32* %48, i64 %50
  %52 = mul nsw i64 4, %19
  %53 = getelementptr inbounds i32, i32* %51, i64 %52
  %54 = getelementptr inbounds i32, i32* %53, i64 5
  store i32 24, i32* %54, align 4
  %55 = mul nuw i64 %17, 6
  %56 = mul nuw i64 %55, %19
  %57 = mul nsw i64 2, %56
  %58 = getelementptr inbounds i32, i32* %23, i64 %57
  %59 = mul nuw i64 6, %19
  %60 = mul nsw i64 2, %59
  %61 = getelementptr inbounds i32, i32* %58, i64 %60
  %62 = mul nsw i64 2, %19
  %63 = getelementptr inbounds i32, i32* %61, i64 %62
  %64 = getelementptr inbounds i32, i32* %63, i64 5
  store i32 17, i32* %64, align 4
  %65 = mul nuw i64 %17, 6
  %66 = mul nuw i64 %65, %19
  %67 = mul nsw i64 3, %66
  %68 = getelementptr inbounds i32, i32* %23, i64 %67
  %69 = mul nuw i64 6, %19
  %70 = mul nsw i64 2, %69
  %71 = getelementptr inbounds i32, i32* %68, i64 %70
  %72 = mul nsw i64 2, %19
  %73 = getelementptr inbounds i32, i32* %71, i64 %72
  %74 = getelementptr inbounds i32, i32* %73, i64 4
  store i32 99, i32* %74, align 4
  %75 = mul nuw i64 %17, 6
  %76 = mul nuw i64 %75, %19
  %77 = mul nsw i64 0, %76
  %78 = getelementptr inbounds i32, i32* %23, i64 %77
  %79 = mul nuw i64 6, %19
  %80 = mul nsw i64 2, %79
  %81 = getelementptr inbounds i32, i32* %78, i64 %80
  %82 = mul nsw i64 4, %19
  %83 = getelementptr inbounds i32, i32* %81, i64 %82
  %84 = getelementptr inbounds i32, i32* %83, i64 5
  %85 = load i32, i32* %84, align 4
  %86 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i32 0, i32 0), i32 %85)
  %87 = mul nuw i64 %17, 6
  %88 = mul nuw i64 %87, %19
  %89 = mul nsw i64 1, %88
  %90 = getelementptr inbounds i32, i32* %23, i64 %89
  %91 = mul nuw i64 6, %19
  %92 = mul nsw i64 3, %91
  %93 = getelementptr inbounds i32, i32* %90, i64 %92
  %94 = mul nsw i64 4, %19
  %95 = getelementptr inbounds i32, i32* %93, i64 %94
  %96 = getelementptr inbounds i32, i32* %95, i64 5
  %97 = load i32, i32* %96, align 4
  %98 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0), i32 %97)
  store i32 0, i32* %1
  %99 = load i8*, i8** %2
  call void @llvm.stackrestore(i8* %99)
  %100 = load i32, i32* %1
  ret i32 %100
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
