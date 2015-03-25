; ModuleID = './20050502-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"abcde'fgh\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"fgh\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"abcde\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"ABCDEFG\22HI\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"HI\00", align 1
@.str5 = private unnamed_addr constant [8 x i8] c"ABCDEFG\00", align 1
@.str6 = private unnamed_addr constant [11 x i8] c"abcd\22e'fgh\00", align 1
@.str7 = private unnamed_addr constant [6 x i8] c"e'fgh\00", align 1
@.str8 = private unnamed_addr constant [5 x i8] c"abcd\00", align 1
@.str9 = private unnamed_addr constant [12 x i8] c"ABCDEF'G\22HI\00", align 1
@.str10 = private unnamed_addr constant [5 x i8] c"G\22HI\00", align 1
@.str11 = private unnamed_addr constant [7 x i8] c"ABCDEF\00", align 1
@.str12 = private unnamed_addr constant [10 x i8] c"abcdef@gh\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"gh\00", align 1
@.str14 = private unnamed_addr constant [7 x i8] c"abcdef\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @bar(i8** %x) #0 {
  %1 = alloca i8**, align 8
  store i8** %x, i8*** %1, align 8
  %2 = load i8*** %1, align 8
  %3 = load i8** %2, align 8
  %4 = getelementptr inbounds i8* %3, i32 1
  store i8* %4, i8** %2, align 8
  %5 = load i8* %3, align 1
  %6 = sext i8 %5 to i32
  ret i32 %6
}

; Function Attrs: noinline nounwind uwtable
define i32 @baz(i32 %c) #0 {
  %1 = alloca i32, align 4
  store i32 %c, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ne i32 %2, 64
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: noinline nounwind uwtable
define void @foo(i8** %w, i8* %x, i1 zeroext %y, i1 zeroext %z) #0 {
  %1 = alloca i8**, align 8
  %2 = alloca i8*, align 8
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  %c = alloca i8, align 1
  %i = alloca i32, align 4
  store i8** %w, i8*** %1, align 8
  store i8* %x, i8** %2, align 8
  %5 = zext i1 %y to i8
  store i8 %5, i8* %3, align 1
  %6 = zext i1 %z to i8
  store i8 %6, i8* %4, align 1
  %7 = load i8*** %1, align 8
  %8 = call i32 @bar(i8** %7)
  %9 = trunc i32 %8 to i8
  store i8 %9, i8* %c, align 1
  store i32 0, i32* %i, align 4
  br label %10

; <label>:10                                      ; preds = %0, %47
  %11 = load i8* %c, align 1
  %12 = load i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  %14 = sext i32 %12 to i64
  %15 = load i8** %2, align 8
  %16 = getelementptr inbounds i8* %15, i64 %14
  store i8 %11, i8* %16, align 1
  %17 = load i8*** %1, align 8
  %18 = call i32 @bar(i8** %17)
  %19 = trunc i32 %18 to i8
  store i8 %19, i8* %c, align 1
  %20 = load i8* %3, align 1
  %21 = trunc i8 %20 to i1
  br i1 %21, label %22, label %27

; <label>:22                                      ; preds = %10
  %23 = load i8* %c, align 1
  %24 = sext i8 %23 to i32
  %25 = icmp eq i32 %24, 39
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %22
  br label %48

; <label>:27                                      ; preds = %22, %10
  %28 = load i8* %4, align 1
  %29 = trunc i8 %28 to i1
  br i1 %29, label %30, label %35

; <label>:30                                      ; preds = %27
  %31 = load i8* %c, align 1
  %32 = sext i8 %31 to i32
  %33 = icmp eq i32 %32, 34
  br i1 %33, label %34, label %35

; <label>:34                                      ; preds = %30
  br label %48

; <label>:35                                      ; preds = %30, %27
  %36 = load i8* %3, align 1
  %37 = trunc i8 %36 to i1
  br i1 %37, label %47, label %38

; <label>:38                                      ; preds = %35
  %39 = load i8* %4, align 1
  %40 = trunc i8 %39 to i1
  br i1 %40, label %47, label %41

; <label>:41                                      ; preds = %38
  %42 = load i8* %c, align 1
  %43 = sext i8 %42 to i32
  %44 = call i32 @baz(i32 %43)
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %47, label %46

; <label>:46                                      ; preds = %41
  br label %48

; <label>:47                                      ; preds = %41, %38, %35
  br label %10

; <label>:48                                      ; preds = %46, %34, %26
  %49 = load i32* %i, align 4
  %50 = sext i32 %49 to i64
  %51 = load i8** %2, align 8
  %52 = getelementptr inbounds i8* %51, i64 %50
  store i8 0, i8* %52, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #1 {
  %1 = alloca i32, align 4
  %buf = alloca [64 x i8], align 16
  %p = alloca i8*, align 8
  store i32 0, i32* %1
  store i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8** %p, align 8
  %2 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %2, i1 zeroext true, i1 zeroext false)
  %3 = load i8** %p, align 8
  %4 = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %10, label %6

; <label>:6                                       ; preds = %0
  %7 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %8 = call i32 @strcmp(i8* %7, i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0))
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %6, %0
  call void @abort() #4
  unreachable

; <label>:11                                      ; preds = %6
  store i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i8** %p, align 8
  %12 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %12, i1 zeroext false, i1 zeroext true)
  %13 = load i8** %p, align 8
  %14 = call i32 @strcmp(i8* %13, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0))
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %20, label %16

; <label>:16                                      ; preds = %11
  %17 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %18 = call i32 @strcmp(i8* %17, i8* getelementptr inbounds ([8 x i8]* @.str5, i32 0, i32 0))
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %16, %11
  call void @abort() #4
  unreachable

; <label>:21                                      ; preds = %16
  store i8* getelementptr inbounds ([11 x i8]* @.str6, i32 0, i32 0), i8** %p, align 8
  %22 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %22, i1 zeroext true, i1 zeroext true)
  %23 = load i8** %p, align 8
  %24 = call i32 @strcmp(i8* %23, i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0))
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %30, label %26

; <label>:26                                      ; preds = %21
  %27 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %28 = call i32 @strcmp(i8* %27, i8* getelementptr inbounds ([5 x i8]* @.str8, i32 0, i32 0))
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %31

; <label>:30                                      ; preds = %26, %21
  call void @abort() #4
  unreachable

; <label>:31                                      ; preds = %26
  store i8* getelementptr inbounds ([12 x i8]* @.str9, i32 0, i32 0), i8** %p, align 8
  %32 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %32, i1 zeroext true, i1 zeroext true)
  %33 = load i8** %p, align 8
  %34 = call i32 @strcmp(i8* %33, i8* getelementptr inbounds ([5 x i8]* @.str10, i32 0, i32 0))
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %40, label %36

; <label>:36                                      ; preds = %31
  %37 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %38 = call i32 @strcmp(i8* %37, i8* getelementptr inbounds ([7 x i8]* @.str11, i32 0, i32 0))
  %39 = icmp ne i32 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %36, %31
  call void @abort() #4
  unreachable

; <label>:41                                      ; preds = %36
  store i8* getelementptr inbounds ([10 x i8]* @.str12, i32 0, i32 0), i8** %p, align 8
  %42 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %42, i1 zeroext false, i1 zeroext false)
  %43 = load i8** %p, align 8
  %44 = call i32 @strcmp(i8* %43, i8* getelementptr inbounds ([3 x i8]* @.str13, i32 0, i32 0))
  %45 = icmp ne i32 %44, 0
  br i1 %45, label %50, label %46

; <label>:46                                      ; preds = %41
  %47 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %48 = call i32 @strcmp(i8* %47, i8* getelementptr inbounds ([7 x i8]* @.str14, i32 0, i32 0))
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %50, label %51

; <label>:50                                      ; preds = %46, %41
  call void @abort() #4
  unreachable

; <label>:51                                      ; preds = %46
  ret i32 0
}

declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noreturn nounwind
declare void @abort() #3

attributes #0 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
