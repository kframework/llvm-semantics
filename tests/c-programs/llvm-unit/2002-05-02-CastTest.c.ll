; ModuleID = './2002-05-02-CastTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"ubc0 = '%c'\09   [0x%x]\0A\00", align 1
@.str.1 = private unnamed_addr constant [21 x i8] c"ubs0 = %u\09   [0x%x]\0A\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"ubs1 = %u\09   [0x%x]\0A\00", align 1
@.str.3 = private unnamed_addr constant [21 x i8] c"bs0  = %d\09   [0x%x]\0A\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"bs1  = %d\09   [0x%x]\0A\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c"c1   = '%c'\09   [0x%x]\0A\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"s1   = %d\09   [0x%x]\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"uc2  = '%c'\09   [0x%x]\0A\00", align 1
@.str.8 = private unnamed_addr constant [21 x i8] c"us2  = %u\09   [0x%x]\0A\00", align 1
@.str.9 = private unnamed_addr constant [23 x i8] c"ic3  = '%c'\09   [0x%x]\0A\00", align 1
@.str.10 = private unnamed_addr constant [21 x i8] c"is3  = %d\09   [0x%x]\0A\00", align 1
@.str.11 = private unnamed_addr constant [21 x i8] c"is4  = %d\09   [0x%x]\0A\00", align 1
@.str.12 = private unnamed_addr constant [21 x i8] c"is5  = %d\09   [0x%x]\0A\00", align 1
@.str.13 = private unnamed_addr constant [23 x i8] c"uic4 = '%c'\09   [0x%x]\0A\00", align 1
@.str.14 = private unnamed_addr constant [19 x i8] c"uis4 = %u  [0x%x]\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %c1 = alloca i8, align 1
  %s1 = alloca i16, align 2
  %ubc0 = alloca i8, align 1
  %ubs0 = alloca i8, align 1
  %ubs1 = alloca i8, align 1
  %bs0 = alloca i8, align 1
  %bs1 = alloca i8, align 1
  %uc2 = alloca i8, align 1
  %us2 = alloca i16, align 2
  %ic3 = alloca i32, align 4
  %is3 = alloca i32, align 4
  %is4 = alloca i32, align 4
  %is5 = alloca i32, align 4
  %uic4 = alloca i32, align 4
  %uis4 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32, i32* %2, align 4
  %5 = icmp sge i32 %4, 2
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i8**, i8*** %3, align 8
  %8 = getelementptr inbounds i8*, i8** %7, i64 1
  %9 = load i8*, i8** %8, align 8
  %10 = call i32 @atoi(i8* %9) #3
  br label %12

; <label>:11                                      ; preds = %0
  br label %12

; <label>:12                                      ; preds = %11, %6
  %13 = phi i32 [ %10, %6 ], [ 100, %11 ]
  %14 = trunc i32 %13 to i8
  store i8 %14, i8* %c1, align 1
  %15 = load i32, i32* %2, align 4
  %16 = icmp sge i32 %15, 3
  br i1 %16, label %17, label %22

; <label>:17                                      ; preds = %12
  %18 = load i8**, i8*** %3, align 8
  %19 = getelementptr inbounds i8*, i8** %18, i64 2
  %20 = load i8*, i8** %19, align 8
  %21 = call i32 @atoi(i8* %20) #3
  br label %23

; <label>:22                                      ; preds = %12
  br label %23

; <label>:23                                      ; preds = %22, %17
  %24 = phi i32 [ %21, %17 ], [ -769, %22 ]
  %25 = trunc i32 %24 to i16
  store i16 %25, i16* %s1, align 2
  %26 = load i8, i8* %c1, align 1
  store i8 %26, i8* %ubc0, align 1
  %27 = load i16, i16* %s1, align 2
  %28 = trunc i16 %27 to i8
  store i8 %28, i8* %ubs0, align 1
  %29 = load i8, i8* %ubs0, align 1
  %30 = zext i8 %29 to i32
  %31 = add nsw i32 %30, 1
  %32 = trunc i32 %31 to i8
  store i8 %32, i8* %ubs1, align 1
  %33 = load i8, i8* %ubs0, align 1
  store i8 %33, i8* %bs0, align 1
  %34 = load i8, i8* %ubs0, align 1
  %35 = zext i8 %34 to i32
  %36 = add i32 %35, 1
  %37 = trunc i32 %36 to i8
  store i8 %37, i8* %bs1, align 1
  %38 = load i8, i8* %c1, align 1
  store i8 %38, i8* %uc2, align 1
  %39 = load i16, i16* %s1, align 2
  store i16 %39, i16* %us2, align 2
  %40 = load i8, i8* %c1, align 1
  %41 = sext i8 %40 to i32
  store i32 %41, i32* %ic3, align 4
  %42 = load i16, i16* %s1, align 2
  %43 = sext i16 %42 to i32
  store i32 %43, i32* %is3, align 4
  %44 = load i8, i8* %ubs0, align 1
  %45 = zext i8 %44 to i32
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %is4, align 4
  %47 = load i8, i8* %bs0, align 1
  %48 = sext i8 %47 to i32
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %is5, align 4
  %50 = load i8, i8* %c1, align 1
  %51 = sext i8 %50 to i32
  store i32 %51, i32* %uic4, align 4
  %52 = load i16, i16* %s1, align 2
  %53 = sext i16 %52 to i32
  store i32 %53, i32* %uis4, align 4
  %54 = load i8, i8* %ubc0, align 1
  %55 = zext i8 %54 to i32
  %56 = load i8, i8* %ubc0, align 1
  %57 = zext i8 %56 to i32
  %58 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str, i32 0, i32 0), i32 %55, i32 %57)
  %59 = load i8, i8* %ubs0, align 1
  %60 = zext i8 %59 to i32
  %61 = load i8, i8* %ubs0, align 1
  %62 = zext i8 %61 to i32
  %63 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.1, i32 0, i32 0), i32 %60, i32 %62)
  %64 = load i8, i8* %ubs1, align 1
  %65 = zext i8 %64 to i32
  %66 = load i8, i8* %ubs1, align 1
  %67 = zext i8 %66 to i32
  %68 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.2, i32 0, i32 0), i32 %65, i32 %67)
  %69 = load i8, i8* %bs0, align 1
  %70 = sext i8 %69 to i32
  %71 = load i8, i8* %bs0, align 1
  %72 = sext i8 %71 to i32
  %73 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0), i32 %70, i32 %72)
  %74 = load i8, i8* %bs1, align 1
  %75 = sext i8 %74 to i32
  %76 = load i8, i8* %bs1, align 1
  %77 = sext i8 %76 to i32
  %78 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i32 0, i32 0), i32 %75, i32 %77)
  %79 = load i8, i8* %c1, align 1
  %80 = sext i8 %79 to i32
  %81 = load i8, i8* %c1, align 1
  %82 = sext i8 %81 to i32
  %83 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i32 0, i32 0), i32 %80, i32 %82)
  %84 = load i16, i16* %s1, align 2
  %85 = sext i16 %84 to i32
  %86 = load i16, i16* %s1, align 2
  %87 = sext i16 %86 to i32
  %88 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i32 0, i32 0), i32 %85, i32 %87)
  %89 = load i8, i8* %uc2, align 1
  %90 = zext i8 %89 to i32
  %91 = load i8, i8* %uc2, align 1
  %92 = zext i8 %91 to i32
  %93 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0), i32 %90, i32 %92)
  %94 = load i16, i16* %us2, align 2
  %95 = zext i16 %94 to i32
  %96 = load i16, i16* %us2, align 2
  %97 = zext i16 %96 to i32
  %98 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.8, i32 0, i32 0), i32 %95, i32 %97)
  %99 = load i32, i32* %ic3, align 4
  %100 = load i32, i32* %ic3, align 4
  %101 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.9, i32 0, i32 0), i32 %99, i32 %100)
  %102 = load i32, i32* %is3, align 4
  %103 = load i32, i32* %is3, align 4
  %104 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.10, i32 0, i32 0), i32 %102, i32 %103)
  %105 = load i32, i32* %is4, align 4
  %106 = load i32, i32* %is4, align 4
  %107 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.11, i32 0, i32 0), i32 %105, i32 %106)
  %108 = load i32, i32* %is5, align 4
  %109 = load i32, i32* %is5, align 4
  %110 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.12, i32 0, i32 0), i32 %108, i32 %109)
  %111 = load i32, i32* %uic4, align 4
  %112 = load i32, i32* %uic4, align 4
  %113 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.13, i32 0, i32 0), i32 %111, i32 %112)
  %114 = load i32, i32* %uis4, align 4
  %115 = load i32, i32* %uis4, align 4
  %116 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.14, i32 0, i32 0), i32 %114, i32 %115)
  ret i32 0
}

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
