; ModuleID = './980707-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@buildargv.arglist = internal global [256 x i8*] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c" a b\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"b\00", align 1

; Function Attrs: nounwind uwtable
define i8** @buildargv(i8* %input) #0 {
  %1 = alloca i8*, align 8
  %numargs = alloca i32, align 4
  store i8* %input, i8** %1, align 8
  store i32 0, i32* %numargs, align 4
  br label %2

; <label>:2                                       ; preds = %0, %44
  br label %3

; <label>:3                                       ; preds = %8, %2
  %4 = load i8** %1, align 8
  %5 = load i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 %6, 32
  br i1 %7, label %8, label %11

; <label>:8                                       ; preds = %3
  %9 = load i8** %1, align 8
  %10 = getelementptr inbounds i8* %9, i32 1
  store i8* %10, i8** %1, align 8
  br label %3

; <label>:11                                      ; preds = %3
  %12 = load i8** %1, align 8
  %13 = load i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %11
  br label %47

; <label>:17                                      ; preds = %11
  %18 = load i8** %1, align 8
  %19 = load i32* %numargs, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %numargs, align 4
  %21 = sext i32 %19 to i64
  %22 = getelementptr inbounds [256 x i8*]* @buildargv.arglist, i32 0, i64 %21
  store i8* %18, i8** %22, align 8
  br label %23

; <label>:23                                      ; preds = %35, %17
  %24 = load i8** %1, align 8
  %25 = load i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp ne i32 %26, 32
  br i1 %27, label %28, label %33

; <label>:28                                      ; preds = %23
  %29 = load i8** %1, align 8
  %30 = load i8* %29, align 1
  %31 = sext i8 %30 to i32
  %32 = icmp ne i32 %31, 0
  br label %33

; <label>:33                                      ; preds = %28, %23
  %34 = phi i1 [ false, %23 ], [ %32, %28 ]
  br i1 %34, label %35, label %38

; <label>:35                                      ; preds = %33
  %36 = load i8** %1, align 8
  %37 = getelementptr inbounds i8* %36, i32 1
  store i8* %37, i8** %1, align 8
  br label %23

; <label>:38                                      ; preds = %33
  %39 = load i8** %1, align 8
  %40 = load i8* %39, align 1
  %41 = sext i8 %40 to i32
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %44

; <label>:43                                      ; preds = %38
  br label %47

; <label>:44                                      ; preds = %38
  %45 = load i8** %1, align 8
  %46 = getelementptr inbounds i8* %45, i32 1
  store i8* %46, i8** %1, align 8
  store i8 0, i8* %45, align 1
  br label %2

; <label>:47                                      ; preds = %43, %16
  %48 = load i32* %numargs, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [256 x i8*]* @buildargv.arglist, i32 0, i64 %49
  store i8* null, i8** %50, align 8
  ret i8** getelementptr inbounds ([256 x i8*]* @buildargv.arglist, i32 0, i32 0)
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %args = alloca i8**, align 8
  %input = alloca [256 x i8], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds [256 x i8]* %input, i32 0, i32 0
  %3 = call i8* @strcpy(i8* %2, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0)) #4
  %4 = getelementptr inbounds [256 x i8]* %input, i32 0, i32 0
  %5 = call i8** @buildargv(i8* %4)
  store i8** %5, i8*** %args, align 8
  %6 = load i8*** %args, align 8
  %7 = getelementptr inbounds i8** %6, i64 0
  %8 = load i8** %7, align 8
  %9 = call i32 @strcmp(i8* %8, i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)) #5
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %12

; <label>:11                                      ; preds = %0
  call void @abort() #6
  unreachable

; <label>:12                                      ; preds = %0
  %13 = load i8*** %args, align 8
  %14 = getelementptr inbounds i8** %13, i64 1
  %15 = load i8** %14, align 8
  %16 = call i32 @strcmp(i8* %15, i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0)) #5
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %19

; <label>:18                                      ; preds = %12
  call void @abort() #6
  unreachable

; <label>:19                                      ; preds = %12
  %20 = load i8*** %args, align 8
  %21 = getelementptr inbounds i8** %20, i64 2
  %22 = load i8** %21, align 8
  %23 = icmp ne i8* %22, null
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %19
  call void @abort() #6
  unreachable

; <label>:25                                      ; preds = %19
  call void @exit(i32 0) #6
  unreachable
                                                  ; No predecessors!
  %27 = load i32* %1
  ret i32 %27
}

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
