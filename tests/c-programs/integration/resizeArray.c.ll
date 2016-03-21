; ModuleID = './resizeArray.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"Error: failed malloc\0A\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"-- array after malloc\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c" a[%d] = %d\0A\00", align 1
@.str.3 = private unnamed_addr constant [23 x i8] c"Error: failed realloc\0A\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"\0A-- array after realloc\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca i32*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 5, i32* %i, align 4
  %2 = load i32, i32* %i, align 4
  %3 = sext i32 %2 to i64
  %4 = mul i64 %3, 4
  %5 = call noalias i8* @malloc(i64 %4) #3
  %6 = bitcast i8* %5 to i32*
  store i32* %6, i32** %a, align 8
  %7 = icmp eq i32* %6, null
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %0
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str, i32 0, i32 0))
  store i32 1, i32* %1
  br label %79

; <label>:10                                      ; preds = %0
  store i32 0, i32* %i, align 4
  br label %11

; <label>:11                                      ; preds = %20, %10
  %12 = load i32, i32* %i, align 4
  %13 = icmp slt i32 %12, 5
  br i1 %13, label %14, label %23

; <label>:14                                      ; preds = %11
  %15 = load i32, i32* %i, align 4
  %16 = load i32, i32* %i, align 4
  %17 = sext i32 %16 to i64
  %18 = load i32*, i32** %a, align 8
  %19 = getelementptr inbounds i32, i32* %18, i64 %17
  store i32 %15, i32* %19, align 4
  br label %20

; <label>:20                                      ; preds = %14
  %21 = load i32, i32* %i, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %i, align 4
  br label %11

; <label>:23                                      ; preds = %11
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %25

; <label>:25                                      ; preds = %36, %23
  %26 = load i32, i32* %i, align 4
  %27 = icmp slt i32 %26, 5
  br i1 %27, label %28, label %39

; <label>:28                                      ; preds = %25
  %29 = load i32, i32* %i, align 4
  %30 = load i32, i32* %i, align 4
  %31 = sext i32 %30 to i64
  %32 = load i32*, i32** %a, align 8
  %33 = getelementptr inbounds i32, i32* %32, i64 %31
  %34 = load i32, i32* %33, align 4
  %35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0), i32 %29, i32 %34)
  br label %36

; <label>:36                                      ; preds = %28
  %37 = load i32, i32* %i, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %i, align 4
  br label %25

; <label>:39                                      ; preds = %25
  %40 = load i32*, i32** %a, align 8
  %41 = bitcast i32* %40 to i8*
  %42 = call i8* @realloc(i8* %41, i64 40) #3
  %43 = bitcast i8* %42 to i32*
  store i32* %43, i32** %a, align 8
  %44 = icmp eq i32* %43, null
  br i1 %44, label %45, label %47

; <label>:45                                      ; preds = %39
  %46 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.3, i32 0, i32 0))
  store i32 1, i32* %1
  br label %79

; <label>:47                                      ; preds = %39
  store i32 0, i32* %i, align 4
  br label %48

; <label>:48                                      ; preds = %57, %47
  %49 = load i32, i32* %i, align 4
  %50 = icmp slt i32 %49, 10
  br i1 %50, label %51, label %60

; <label>:51                                      ; preds = %48
  %52 = load i32, i32* %i, align 4
  %53 = load i32, i32* %i, align 4
  %54 = sext i32 %53 to i64
  %55 = load i32*, i32** %a, align 8
  %56 = getelementptr inbounds i32, i32* %55, i64 %54
  store i32 %52, i32* %56, align 4
  br label %57

; <label>:57                                      ; preds = %51
  %58 = load i32, i32* %i, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %i, align 4
  br label %48

; <label>:60                                      ; preds = %48
  %61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %62

; <label>:62                                      ; preds = %73, %60
  %63 = load i32, i32* %i, align 4
  %64 = icmp slt i32 %63, 10
  br i1 %64, label %65, label %76

; <label>:65                                      ; preds = %62
  %66 = load i32, i32* %i, align 4
  %67 = load i32, i32* %i, align 4
  %68 = sext i32 %67 to i64
  %69 = load i32*, i32** %a, align 8
  %70 = getelementptr inbounds i32, i32* %69, i64 %68
  %71 = load i32, i32* %70, align 4
  %72 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i32 0, i32 0), i32 %66, i32 %71)
  br label %73

; <label>:73                                      ; preds = %65
  %74 = load i32, i32* %i, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %i, align 4
  br label %62

; <label>:76                                      ; preds = %62
  %77 = load i32*, i32** %a, align 8
  %78 = bitcast i32* %77 to i8*
  call void @free(i8* %78) #3
  store i32 0, i32* %1
  br label %79

; <label>:79                                      ; preds = %76, %45, %8
  %80 = load i32, i32* %1
  ret i32 %80
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
