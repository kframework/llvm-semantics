; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/quine1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i32* %i, align 4
  %idxprom = sext i32 %tmp to i64
  %tmp1 = load i8** %s.addr, align 8
  %arrayidx = getelementptr inbounds i8* %tmp1, i64 %idxprom
  %tmp2 = load i8* %arrayidx
  %tobool = icmp ne i8 %tmp2, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i32* %i, align 4
  %idxprom4 = sext i32 %tmp3 to i64
  %tmp5 = load i8** %s.addr, align 8
  %arrayidx6 = getelementptr inbounds i8* %tmp5, i64 %idxprom4
  %tmp7 = load i8* %arrayidx6
  %conv = sext i8 %tmp7 to i32
  %cmp = icmp eq i32 %conv, 92
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0))
  br label %if.end40

if.else:                                          ; preds = %for.body
  %tmp10 = load i32* %i, align 4
  %idxprom11 = sext i32 %tmp10 to i64
  %tmp12 = load i8** %s.addr, align 8
  %arrayidx13 = getelementptr inbounds i8* %tmp12, i64 %idxprom11
  %tmp14 = load i8* %arrayidx13
  %conv15 = sext i8 %tmp14 to i32
  %cmp16 = icmp eq i32 %conv15, 34
  br i1 %cmp16, label %if.then18, label %if.else20

if.then18:                                        ; preds = %if.else
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str2, i32 0, i32 0))
  br label %if.end39

if.else20:                                        ; preds = %if.else
  %tmp21 = load i32* %i, align 4
  %idxprom22 = sext i32 %tmp21 to i64
  %tmp23 = load i8** %s.addr, align 8
  %arrayidx24 = getelementptr inbounds i8* %tmp23, i64 %idxprom22
  %tmp25 = load i8* %arrayidx24
  %conv26 = sext i8 %tmp25 to i32
  %cmp27 = icmp eq i32 %conv26, 10
  br i1 %cmp27, label %if.then29, label %if.else31

if.then29:                                        ; preds = %if.else20
  %call30 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str3, i32 0, i32 0))
  br label %if.end

if.else31:                                        ; preds = %if.else20
  %tmp32 = load i32* %i, align 4
  %idxprom33 = sext i32 %tmp32 to i64
  %tmp34 = load i8** %s.addr, align 8
  %arrayidx35 = getelementptr inbounds i8* %tmp34, i64 %idxprom33
  %tmp36 = load i8* %arrayidx35
  %conv37 = sext i8 %tmp36 to i32
  %call38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 %conv37)
  br label %if.end

if.end:                                           ; preds = %if.else31, %if.then29
  br label %if.end39

if.end39:                                         ; preds = %if.end, %if.then18
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.then
  %tmp41 = load i32* %i, align 4
  %rem = srem i32 %tmp41, 48
  %cmp42 = icmp eq i32 %rem, 47
  br i1 %cmp42, label %if.then44, label %if.end46

if.then44:                                        ; preds = %if.end40
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str5, i32 0, i32 0))
  br label %if.end46

if.end46:                                         ; preds = %if.then44, %if.end40
  br label %for.inc

for.inc:                                          ; preds = %if.end46
  %tmp47 = load i32* %i, align 4
  %inc = add nsw i32 %tmp47, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call48 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([2 x i8]* @.str6, i32 0, i32 0))
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
  %tmp = load i32* %i, align 4
  %idxprom = sext i32 %tmp to i64
  %arrayidx = getelementptr inbounds [1932 x i8]* @progdata, i32 0, i64 %idxprom
  %tmp1 = load i8* %arrayidx, align 1
  %tobool = icmp ne i8 %tmp1, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %idxprom3 = sext i32 %tmp2 to i64
  %arrayidx4 = getelementptr inbounds [1932 x i8]* @progdata, i32 0, i64 %idxprom3
  %tmp5 = load i8* %arrayidx4, align 1
  %conv = sext i8 %tmp5 to i32
  %cmp = icmp eq i32 %conv, 64
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %for.body
  %tmp7 = load i32* %i, align 4
  %add = add nsw i32 %tmp7, 1
  %idxprom8 = sext i32 %add to i64
  %arrayidx9 = getelementptr inbounds [1932 x i8]* @progdata, i32 0, i64 %idxprom8
  %tmp10 = load i8* %arrayidx9, align 1
  %conv11 = sext i8 %tmp10 to i32
  %cmp12 = icmp eq i32 %conv11, 64
  br i1 %cmp12, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true
  call void @quote(i8* getelementptr inbounds ([1932 x i8]* @progdata, i32 0, i32 0))
  %tmp14 = load i32* %i, align 4
  %inc = add nsw i32 %tmp14, 1
  store i32 %inc, i32* %i, align 4
  br label %if.end

if.else:                                          ; preds = %land.lhs.true, %for.body
  %tmp15 = load i32* %i, align 4
  %idxprom16 = sext i32 %tmp15 to i64
  %arrayidx17 = getelementptr inbounds [1932 x i8]* @progdata, i32 0, i64 %idxprom16
  %tmp18 = load i8* %arrayidx17, align 1
  %conv19 = sext i8 %tmp18 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0), i32 %conv19)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp20 = load i32* %i, align 4
  %inc21 = add nsw i32 %tmp20, 1
  store i32 %inc21, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}
