; ModuleID = './quine1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"    \22\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"\5C\5C\00", align 1
@.str.2 = private unnamed_addr constant [3 x i8] c"\5C\22\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"\5Cn\00", align 1
@.str.4 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"\22\0A    \22\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@progdata = constant [1932 x i8] c"/* A simple quine (self-printing program), in standard C. */\0A\0A/* Note: in designing this quine, we have tried to make the code clear\0A * and readable, not concise and obscure as many quines are, so that\0A * the general principle can be made clear at the expense of length.\0A * In a nutshell: use the same data structure (called \22progdata\22\0A * below) to output the program code (which it represents) and its own\0A * textual representation. */\0A\0A#include <stdio.h>\0A\0Avoid quote(const char *s)\0A     /* This function takes a character string s and prints the\0A      * textual representation of s as it might appear formatted\0A      * in C code. */\0A{\0A    int i;\0A\0A    printf(\22    \5C\22\22);\0A    for (i=0; s[i]; ++i) {\0A        /* Certain characters are quoted. */\0A        if (s[i] == '\5C\5C')\0A            printf(\22\5C\5C\5C\5C\22);\0A        else if (s[i] == '\22')\0A            printf(\22\5C\5C\5C\22\22);\0A        else if (s[i] == '\5Cn')\0A            printf(\22\5C\5Cn\22);\0A        /* Others are just printed as such. */\0A        else\0A            printf(\22%c\22, s[i]);\0A        /* Also insert occasional line breaks. */\0A        if (i % 48 == 47)\0A            printf(\22\5C\22\5Cn    \5C\22\22);\0A    }\0A    printf(\22\5C\22\22);\0A}\0A\0A/* What follows is a string representation of the program code,\0A * from beginning to end (formatted as per the quote() function\0A * above), except that the string _itself_ is coded as two\0A * consecutive '@' characters. */\0Aconst char progdata[] =\0A@@;\0A\0Aint main(void)\0A     /* The program itself... */\0A{\0A    int i;\0A\0A    /* Print the program code, character by character. */\0A    for (i=0; progdata[i]; ++i) {\0A        if (progdata[i] == '@' && progdata[i+1] == '@')\0A            /* We encounter two '@' signs, so we must print the quoted\0A             * form of the program code. */\0A        {\0A            quote(progdata);    /* Quote all. */\0A            i++;                /* Skip second '@'. */\0A        } else\0A            printf(\22%c\22, progdata[i]);  /* Print character. */\0A    }\0A    return 0;\0A}\0A\00", align 16

; Function Attrs: nounwind uwtable
define void @quote(i8* %s) #0 {
  %1 = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %s, i8** %1, align 8
  %2 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %57, %0
  %4 = load i32, i32* %i, align 4
  %5 = sext i32 %4 to i64
  %6 = load i8*, i8** %1, align 8
  %7 = getelementptr inbounds i8, i8* %6, i64 %5
  %8 = load i8, i8* %7, align 1
  %9 = icmp ne i8 %8, 0
  br i1 %9, label %10, label %60

; <label>:10                                      ; preds = %3
  %11 = load i32, i32* %i, align 4
  %12 = sext i32 %11 to i64
  %13 = load i8*, i8** %1, align 8
  %14 = getelementptr inbounds i8, i8* %13, i64 %12
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = icmp eq i32 %16, 92
  br i1 %17, label %18, label %20

; <label>:18                                      ; preds = %10
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  br label %50

; <label>:20                                      ; preds = %10
  %21 = load i32, i32* %i, align 4
  %22 = sext i32 %21 to i64
  %23 = load i8*, i8** %1, align 8
  %24 = getelementptr inbounds i8, i8* %23, i64 %22
  %25 = load i8, i8* %24, align 1
  %26 = sext i8 %25 to i32
  %27 = icmp eq i32 %26, 34
  br i1 %27, label %28, label %30

; <label>:28                                      ; preds = %20
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.2, i32 0, i32 0))
  br label %49

; <label>:30                                      ; preds = %20
  %31 = load i32, i32* %i, align 4
  %32 = sext i32 %31 to i64
  %33 = load i8*, i8** %1, align 8
  %34 = getelementptr inbounds i8, i8* %33, i64 %32
  %35 = load i8, i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = icmp eq i32 %36, 10
  br i1 %37, label %38, label %40

; <label>:38                                      ; preds = %30
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i32 0, i32 0))
  br label %48

; <label>:40                                      ; preds = %30
  %41 = load i32, i32* %i, align 4
  %42 = sext i32 %41 to i64
  %43 = load i8*, i8** %1, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 %42
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 %46)
  br label %48

; <label>:48                                      ; preds = %40, %38
  br label %49

; <label>:49                                      ; preds = %48, %28
  br label %50

; <label>:50                                      ; preds = %49, %18
  %51 = load i32, i32* %i, align 4
  %52 = srem i32 %51, 48
  %53 = icmp eq i32 %52, 47
  br i1 %53, label %54, label %56

; <label>:54                                      ; preds = %50
  %55 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0))
  br label %56

; <label>:56                                      ; preds = %54, %50
  br label %57

; <label>:57                                      ; preds = %56
  %58 = load i32, i32* %i, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %i, align 4
  br label %3

; <label>:60                                      ; preds = %3
  %61 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %34, %0
  %3 = load i32, i32* %i, align 4
  %4 = sext i32 %3 to i64
  %5 = getelementptr inbounds [1932 x i8], [1932 x i8]* @progdata, i32 0, i64 %4
  %6 = load i8, i8* %5, align 1
  %7 = icmp ne i8 %6, 0
  br i1 %7, label %8, label %37

; <label>:8                                       ; preds = %2
  %9 = load i32, i32* %i, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [1932 x i8], [1932 x i8]* @progdata, i32 0, i64 %10
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = icmp eq i32 %13, 64
  br i1 %14, label %15, label %26

; <label>:15                                      ; preds = %8
  %16 = load i32, i32* %i, align 4
  %17 = add nsw i32 %16, 1
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [1932 x i8], [1932 x i8]* @progdata, i32 0, i64 %18
  %20 = load i8, i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = icmp eq i32 %21, 64
  br i1 %22, label %23, label %26

; <label>:23                                      ; preds = %15
  call void @quote(i8* getelementptr inbounds ([1932 x i8], [1932 x i8]* @progdata, i32 0, i32 0))
  %24 = load i32, i32* %i, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %i, align 4
  br label %33

; <label>:26                                      ; preds = %15, %8
  %27 = load i32, i32* %i, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [1932 x i8], [1932 x i8]* @progdata, i32 0, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  %32 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.4, i32 0, i32 0), i32 %31)
  br label %33

; <label>:33                                      ; preds = %26, %23
  br label %34

; <label>:34                                      ; preds = %33
  %35 = load i32, i32* %i, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %i, align 4
  br label %2

; <label>:37                                      ; preds = %2
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
