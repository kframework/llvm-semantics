; ModuleID = '/home/david/src/c-semantics/tests/unitTests/castNonIntegerToBool.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [8 x i8] c"Bad b1\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"Good b1\0A\00", align 1
@.str2 = private unnamed_addr constant [8 x i8] c"Bad b2\0A\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"Good b2\0A\00", align 1
@.str4 = private unnamed_addr constant [8 x i8] c"Bad b3\0A\00", align 1
@.str5 = private unnamed_addr constant [9 x i8] c"Good b3\0A\00", align 1
@.str6 = private unnamed_addr constant [8 x i8] c"Bad b4\0A\00", align 1
@.str7 = private unnamed_addr constant [9 x i8] c"Good b4\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  %p = alloca i32*, align 8
  %b1 = alloca i8, align 1
  %b2 = alloca i8, align 1
  %b3 = alloca i8, align 1
  %b4 = alloca i8, align 1
  store i32 0, i32* %retval
  store i32 5, i32* %x, align 4
  store i32* %x, i32** %p, align 8
  %0 = load i32** %p, align 8
  %tobool = icmp ne i32* %0, null
  %frombool = zext i1 %tobool to i8
  store i8 %frombool, i8* %b1, align 1
  store i8 0, i8* %b2, align 1
  store i8 0, i8* %b3, align 1
  store i8 1, i8* %b4, align 1
  %1 = load i8* %b1, align 1
  %tobool1 = trunc i8 %1 to i1
  %conv = zext i1 %tobool1 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i8* %b2, align 1
  %tobool4 = trunc i8 %2 to i1
  %conv5 = zext i1 %tobool4 to i32
  %cmp6 = icmp ne i32 %conv5, 0
  br i1 %cmp6, label %if.then8, label %if.else10

if.then8:                                         ; preds = %if.end
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0))
  br label %if.end12

if.else10:                                        ; preds = %if.end
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %if.end12

if.end12:                                         ; preds = %if.else10, %if.then8
  %3 = load i8* %b3, align 1
  %tobool13 = trunc i8 %3 to i1
  %conv14 = zext i1 %tobool13 to i32
  %cmp15 = icmp ne i32 %conv14, 0
  br i1 %cmp15, label %if.then17, label %if.else19

if.then17:                                        ; preds = %if.end12
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0))
  br label %if.end21

if.else19:                                        ; preds = %if.end12
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0))
  br label %if.end21

if.end21:                                         ; preds = %if.else19, %if.then17
  %4 = load i8* %b4, align 1
  %tobool22 = trunc i8 %4 to i1
  %conv23 = zext i1 %tobool22 to i32
  %cmp24 = icmp ne i32 %conv23, 1
  br i1 %cmp24, label %if.then26, label %if.else28

if.then26:                                        ; preds = %if.end21
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str6, i32 0, i32 0))
  br label %if.end30

if.else28:                                        ; preds = %if.end21
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0))
  br label %if.end30

if.end30:                                         ; preds = %if.else28, %if.then26
  %5 = load i32* %retval
  ret i32 %5
}

declare i32 @printf(i8*, ...)
