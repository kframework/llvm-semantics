; ModuleID = './20020402-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.listElem = private unnamed_addr constant [4 x i32] [i32 30, i32 2, i32 10, i32 5], align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %listElem = alloca [4 x i32], align 16
  %listSmall = alloca [2 x i32], align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %posGreatest = alloca i32, align 4
  %greatest = alloca i32, align 4
  store i32 0, i32* %1
  %2 = bitcast [4 x i32]* %listElem to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([4 x i32]* @main.listElem to i8*), i64 16, i32 16, i1 false)
  store i32 -1, i32* %posGreatest, align 4
  store i32 -1, i32* %greatest, align 4
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %27, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 2
  br i1 %5, label %6, label %30

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %8
  %10 = load i32* %9, align 4
  %11 = load i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 %12
  store i32 %10, i32* %13, align 4
  %14 = load i32* %i, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %15
  %17 = load i32* %16, align 4
  %18 = load i32* %greatest, align 4
  %19 = icmp sgt i32 %17, %18
  br i1 %19, label %20, label %26

; <label>:20                                      ; preds = %6
  %21 = load i32* %i, align 4
  store i32 %21, i32* %posGreatest, align 4
  %22 = load i32* %i, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %23
  %25 = load i32* %24, align 4
  store i32 %25, i32* %greatest, align 4
  br label %26

; <label>:26                                      ; preds = %20, %6
  br label %27

; <label>:27                                      ; preds = %26
  %28 = load i32* %i, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %i, align 4
  br label %3

; <label>:30                                      ; preds = %3
  store i32 2, i32* %i, align 4
  br label %31

; <label>:31                                      ; preds = %73, %30
  %32 = load i32* %i, align 4
  %33 = icmp slt i32 %32, 4
  br i1 %33, label %34, label %76

; <label>:34                                      ; preds = %31
  %35 = load i32* %i, align 4
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %36
  %38 = load i32* %37, align 4
  %39 = load i32* %greatest, align 4
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %41, label %72

; <label>:41                                      ; preds = %34
  %42 = load i32* %i, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %43
  %45 = load i32* %44, align 4
  %46 = load i32* %posGreatest, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 %47
  store i32 %45, i32* %48, align 4
  store i32 0, i32* %posGreatest, align 4
  %49 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 0
  %50 = load i32* %49, align 4
  store i32 %50, i32* %greatest, align 4
  store i32 1, i32* %j, align 4
  br label %51

; <label>:51                                      ; preds = %68, %41
  %52 = load i32* %j, align 4
  %53 = icmp slt i32 %52, 2
  br i1 %53, label %54, label %71

; <label>:54                                      ; preds = %51
  %55 = load i32* %j, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 %56
  %58 = load i32* %57, align 4
  %59 = load i32* %greatest, align 4
  %60 = icmp sgt i32 %58, %59
  br i1 %60, label %61, label %67

; <label>:61                                      ; preds = %54
  %62 = load i32* %j, align 4
  store i32 %62, i32* %posGreatest, align 4
  %63 = load i32* %j, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 %64
  %66 = load i32* %65, align 4
  store i32 %66, i32* %greatest, align 4
  br label %67

; <label>:67                                      ; preds = %61, %54
  br label %68

; <label>:68                                      ; preds = %67
  %69 = load i32* %j, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %j, align 4
  br label %51

; <label>:71                                      ; preds = %51
  br label %72

; <label>:72                                      ; preds = %71, %34
  br label %73

; <label>:73                                      ; preds = %72
  %74 = load i32* %i, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %i, align 4
  br label %31

; <label>:76                                      ; preds = %31
  %77 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 0
  %78 = load i32* %77, align 4
  %79 = icmp ne i32 %78, 5
  br i1 %79, label %84, label %80

; <label>:80                                      ; preds = %76
  %81 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 1
  %82 = load i32* %81, align 4
  %83 = icmp ne i32 %82, 2
  br i1 %83, label %84, label %85

; <label>:84                                      ; preds = %80, %76
  call void @abort() #3
  unreachable

; <label>:85                                      ; preds = %80
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %87 = load i32* %1
  ret i32 %87
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: noreturn
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
