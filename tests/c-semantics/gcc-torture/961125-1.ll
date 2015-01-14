; ModuleID = './961125-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c":ab\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca i8*, align 8
  %lim = alloca i8*, align 8
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8** %s, align 8
  %2 = load i8** %s, align 8
  %3 = getelementptr inbounds i8* %2, i64 3
  store i8* %3, i8** %lim, align 8
  %4 = load i8** %s, align 8
  %5 = load i8** %lim, align 8
  %6 = call i8* @begfield(i32 58, i8* %4, i8* %5, i32 1, i32 1)
  %7 = load i8** %s, align 8
  %8 = getelementptr inbounds i8* %7, i64 2
  %9 = icmp ne i8* %6, %8
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:11                                      ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %13 = load i32* %1
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define internal i8* @begfield(i32 %tab, i8* %ptr, i8* %lim, i32 %sword, i32 %schar) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 %tab, i32* %1, align 4
  store i8* %ptr, i8** %2, align 8
  store i8* %lim, i8** %3, align 8
  store i32 %sword, i32* %4, align 4
  store i32 %schar, i32* %5, align 4
  %6 = load i32* %1, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %44

; <label>:8                                       ; preds = %0
  br label %9

; <label>:9                                       ; preds = %42, %8
  %10 = load i8** %2, align 8
  %11 = load i8** %3, align 8
  %12 = icmp ult i8* %10, %11
  br i1 %12, label %13, label %17

; <label>:13                                      ; preds = %9
  %14 = load i32* %4, align 4
  %15 = add nsw i32 %14, -1
  store i32 %15, i32* %4, align 4
  %16 = icmp ne i32 %14, 0
  br label %17

; <label>:17                                      ; preds = %13, %9
  %18 = phi i1 [ false, %9 ], [ %16, %13 ]
  br i1 %18, label %19, label %43

; <label>:19                                      ; preds = %17
  br label %20

; <label>:20                                      ; preds = %32, %19
  %21 = load i8** %2, align 8
  %22 = load i8** %3, align 8
  %23 = icmp ult i8* %21, %22
  br i1 %23, label %24, label %30

; <label>:24                                      ; preds = %20
  %25 = load i8** %2, align 8
  %26 = load i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = load i32* %1, align 4
  %29 = icmp ne i32 %27, %28
  br label %30

; <label>:30                                      ; preds = %24, %20
  %31 = phi i1 [ false, %20 ], [ %29, %24 ]
  br i1 %31, label %32, label %35

; <label>:32                                      ; preds = %30
  %33 = load i8** %2, align 8
  %34 = getelementptr inbounds i8* %33, i32 1
  store i8* %34, i8** %2, align 8
  br label %20

; <label>:35                                      ; preds = %30
  %36 = load i8** %2, align 8
  %37 = load i8** %3, align 8
  %38 = icmp ult i8* %36, %37
  br i1 %38, label %39, label %42

; <label>:39                                      ; preds = %35
  %40 = load i8** %2, align 8
  %41 = getelementptr inbounds i8* %40, i32 1
  store i8* %41, i8** %2, align 8
  br label %42

; <label>:42                                      ; preds = %39, %35
  br label %9

; <label>:43                                      ; preds = %17
  br label %46

; <label>:44                                      ; preds = %0
  br label %45

; <label>:45                                      ; preds = %44, %45
  br label %45

; <label>:46                                      ; preds = %43
  %47 = load i8** %2, align 8
  %48 = load i32* %5, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i8* %47, i64 %49
  %51 = load i8** %3, align 8
  %52 = icmp ule i8* %50, %51
  br i1 %52, label %53, label %58

; <label>:53                                      ; preds = %46
  %54 = load i32* %5, align 4
  %55 = load i8** %2, align 8
  %56 = sext i32 %54 to i64
  %57 = getelementptr inbounds i8* %55, i64 %56
  store i8* %57, i8** %2, align 8
  br label %58

; <label>:58                                      ; preds = %53, %46
  %59 = load i8** %2, align 8
  ret i8* %59
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
