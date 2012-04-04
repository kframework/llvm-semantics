; ModuleID = '/home/david/src/c-semantics/tests/integration/quine1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"    \22\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"\5C\5C\00", align 1
@.str2 = private unnamed_addr constant [3 x i8] c"\5C\22\00", align 1
@.str3 = private unnamed_addr constant [3 x i8] c"\5Cn\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str5 = private unnamed_addr constant [8 x i8] c"\22\0A    \22\00", align 1
@.str6 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@progdata = constant [1932 x i8] c"/* A simple quine (self-printing program), in standard C. */\0A\0A/* Note: in designing this quine, we have tried to make the code clear\0A * and readable, not concise and obscure as many quines are, so that\0A * the general principle can be made clear at the expense of length.\0A * In a nutshell: use the same data structure (called \22progdata\22\0A * below) to output the program code (which it represents) and its own\0A * textual representation. */\0A\0A#include <stdio.h>\0A\0Avoid quote(const char *s)\0A     /* This function takes a character string s and prints the\0A      * textual representation of s as it might appear formatted\0A      * in C code. */\0A{\0A    int i;\0A\0A    printf(\22    \5C\22\22);\0A    for (i=0; s[i]; ++i) {\0A        /* Certain characters are quoted. */\0A        if (s[i] == '\5C\5C')\0A            printf(\22\5C\5C\5C\5C\22);\0A        else if (s[i] == '\22')\0A            printf(\22\5C\5C\5C\22\22);\0A        else if (s[i] == '\5Cn')\0A            printf(\22\5C\5Cn\22);\0A        /* Others are just printed as such. */\0A        else\0A            printf(\22%c\22, s[i]);\0A        /* Also insert occasional line breaks. */\0A        if (i % 48 == 47)\0A            printf(\22\5C\22\5Cn    \5C\22\22);\0A    }\0A    printf(\22\5C\22\22);\0A}\0A\0A/* What follows is a string representation of the program code,\0A * from beginning to end (formatted as per the quote() function\0A * above), except that the string _itself_ is coded as two\0A * consecutive '@' characters. */\0Aconst char progdata[] =\0A@@;\0A\0Aint main(void)\0A     /* The program itself... */\0A{\0A    int i;\0A\0A    /* Print the program code, character by character. */\0A    for (i=0; progdata[i]; ++i) {\0A        if (progdata[i] == '@' && progdata[i+1] == '@')\0A            /* We encounter two '@' signs, so we must print the quoted\0A             * form of the program code. */\0A        {\0A            quote(progdata);    /* Quote all. */\0A            i++;                /* Skip second '@'. */\0A        } else\0A            printf(\22%c\22, progdata[i]);  /* Print character. */\0A    }\0A    return 0;\0A}\0A\00", align 16

define void @quote(i8* %s) nounwind uwtable {
entry:
  %s.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %s, i8** %s.addr, align 8
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %idxprom = sext i32 %0 to i64
  %1 = load i8** %s.addr, align 8
  %arrayidx = getelementptr inbounds i8* %1, i64 %idxprom
  %2 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %2, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %3 = load i32* %i, align 4
  %idxprom1 = sext i32 %3 to i64
  %4 = load i8** %s.addr, align 8
  %arrayidx2 = getelementptr inbounds i8* %4, i64 %idxprom1
  %5 = load i8* %arrayidx2, align 1
  %conv = sext i8 %5 to i32
  %cmp = icmp eq i32 %conv, 92
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  br label %if.end26

if.else:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %idxprom5 = sext i32 %6 to i64
  %7 = load i8** %s.addr, align 8
  %arrayidx6 = getelementptr inbounds i8* %7, i64 %idxprom5
  %8 = load i8* %arrayidx6, align 1
  %conv7 = sext i8 %8 to i32
  %cmp8 = icmp eq i32 %conv7, 34
  br i1 %cmp8, label %if.then10, label %if.else12

if.then10:                                        ; preds = %if.else
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0))
  br label %if.end25

if.else12:                                        ; preds = %if.else
  %9 = load i32* %i, align 4
  %idxprom13 = sext i32 %9 to i64
  %10 = load i8** %s.addr, align 8
  %arrayidx14 = getelementptr inbounds i8* %10, i64 %idxprom13
  %11 = load i8* %arrayidx14, align 1
  %conv15 = sext i8 %11 to i32
  %cmp16 = icmp eq i32 %conv15, 10
  br i1 %cmp16, label %if.then18, label %if.else20

if.then18:                                        ; preds = %if.else12
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0))
  br label %if.end

if.else20:                                        ; preds = %if.else12
  %12 = load i32* %i, align 4
  %idxprom21 = sext i32 %12 to i64
  %13 = load i8** %s.addr, align 8
  %arrayidx22 = getelementptr inbounds i8* %13, i64 %idxprom21
  %14 = load i8* %arrayidx22, align 1
  %conv23 = sext i8 %14 to i32
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 %conv23)
  br label %if.end

if.end:                                           ; preds = %if.else20, %if.then18
  br label %if.end25

if.end25:                                         ; preds = %if.end, %if.then10
  br label %if.end26

if.end26:                                         ; preds = %if.end25, %if.then
  %15 = load i32* %i, align 4
  %rem = srem i32 %15, 48
  %cmp27 = icmp eq i32 %rem, 47
  br i1 %cmp27, label %if.then29, label %if.end31

if.then29:                                        ; preds = %if.end26
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str5, i32 0, i32 0))
  br label %if.end31

if.end31:                                         ; preds = %if.then29, %if.end26
  br label %for.inc

for.inc:                                          ; preds = %if.end31
  %16 = load i32* %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0))
  ret void
}

declare i32 @printf(i8*, ...)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [1932 x i8]* @progdata, i32 0, i64 %idxprom
  %1 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %1, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom1 = sext i32 %2 to i64
  %arrayidx2 = getelementptr inbounds [1932 x i8]* @progdata, i32 0, i64 %idxprom1
  %3 = load i8* %arrayidx2, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp eq i32 %conv, 64
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body
  %4 = load i32* %i, align 4
  %add = add nsw i32 %4, 1
  %idxprom4 = sext i32 %add to i64
  %arrayidx5 = getelementptr inbounds [1932 x i8]* @progdata, i32 0, i64 %idxprom4
  %5 = load i8* %arrayidx5, align 1
  %conv6 = sext i8 %5 to i32
  %cmp7 = icmp eq i32 %conv6, 64
  br i1 %cmp7, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  call void @quote(i8* getelementptr inbounds ([1932 x i8]* @progdata, i32 0, i32 0))
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %for.body
  %7 = load i32* %i, align 4
  %idxprom9 = sext i32 %7 to i64
  %arrayidx10 = getelementptr inbounds [1932 x i8]* @progdata, i32 0, i64 %idxprom9
  %8 = load i8* %arrayidx10, align 1
  %conv11 = sext i8 %8 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 %conv11)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %9 = load i32* %i, align 4
  %inc12 = add nsw i32 %9, 1
  store i32 %inc12, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}
