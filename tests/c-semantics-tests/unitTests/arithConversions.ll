; ModuleID = '/home/david/src/c-semantics/tests/unitTests/arithConversions.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"BUG in 1\00", align 1
@.str2 = private unnamed_addr constant [10 x i8] c"Good in 1\00", align 1
@.str3 = private unnamed_addr constant [18 x i8] c"Good answer in 2\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"BUG: No promotions in 2\0A\00", align 1
@.str5 = private unnamed_addr constant [43 x i8] c"BUG: Something really weird happened in 2\0A\00", align 1
@.str6 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@.str7 = private unnamed_addr constant [13 x i8] c"Good in 3_a\0A\00", align 1
@.str8 = private unnamed_addr constant [12 x i8] c"BUG in 3_a\0A\00", align 1
@.str9 = private unnamed_addr constant [12 x i8] c"BUG in 3_b\0A\00", align 1
@.str10 = private unnamed_addr constant [13 x i8] c"Good in 3_b\0A\00", align 1

define i32 @test1() nounwind uwtable {
entry:
  %a = alloca i16, align 2
  %b = alloca i16, align 2
  store i16 -12, i16* %a, align 2
  store i16 -12, i16* %b, align 2
  %0 = load i16* %a, align 2
  %conv = zext i16 %0 to i32
  %1 = load i16* %b, align 2
  %conv1 = sext i16 %1 to i32
  %cmp = icmp eq i32 %conv, %conv1
  %cond = select i1 %cmp, i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([10 x i8]* @.str2, i32 0, i32 0)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i32 0, i32 0), i8* %cond)
  ret i32 0
}

declare i32 @printf(i8*, ...)

define i32 @test2() nounwind uwtable {
entry:
  %a = alloca i8, align 1
  %b = alloca i8, align 1
  %c = alloca i32, align 4
  store i8 5, i8* %a, align 1
  store i8 -56, i8* %b, align 1
  %0 = load i8* %a, align 1
  %conv = zext i8 %0 to i32
  %1 = load i8* %b, align 1
  %conv1 = zext i8 %1 to i32
  %mul = mul nsw i32 %conv, %conv1
  store i32 %mul, i32* %c, align 4
  %2 = load i32* %c, align 4
  %cmp = icmp eq i32 %2, 1000
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str3, i32 0, i32 0))
  br label %if.end9

if.else:                                          ; preds = %entry
  %3 = load i32* %c, align 4
  %cmp3 = icmp eq i32 %3, 232
  br i1 %cmp3, label %if.then5, label %if.else7

if.then5:                                         ; preds = %if.else
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0))
  br label %if.end

if.else7:                                         ; preds = %if.else
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([43 x i8]* @.str5, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else7, %if.then5
  br label %if.end9

if.end9:                                          ; preds = %if.end, %if.then
  ret i32 0
}

define i32 @test3() nounwind uwtable {
entry:
  %foo = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i8, align 1
  store i32 -1, i32* %foo, align 4
  store i32 -1, i32* %a, align 4
  %0 = load i32* %a, align 4
  %1 = load i32* %foo, align 4
  %cmp = icmp eq i32 %0, %1
  %cond = select i1 %cmp, i8* getelementptr inbounds ([13 x i8]* @.str7, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8]* @.str8, i32 0, i32 0)
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0), i8* %cond)
  store i8 -1, i8* %b, align 1
  %2 = load i8* %b, align 1
  %conv = zext i8 %2 to i32
  %3 = load i32* %foo, align 4
  %cmp1 = icmp eq i32 %conv, %3
  %cond3 = select i1 %cmp1, i8* getelementptr inbounds ([12 x i8]* @.str9, i32 0, i32 0), i8* getelementptr inbounds ([13 x i8]* @.str10, i32 0, i32 0)
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str6, i32 0, i32 0), i8* %cond3)
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @test1()
  %call1 = call i32 @test2()
  %call2 = call i32 @test3()
  ret i32 0
}
