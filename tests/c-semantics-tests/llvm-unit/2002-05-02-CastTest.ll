; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-05-02-CastTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"ubc0 = '%c'\09   [0x%x]\0A\00", align 1
@.str1 = private unnamed_addr constant [21 x i8] c"ubs0 = %u\09   [0x%x]\0A\00", align 1
@.str2 = private unnamed_addr constant [21 x i8] c"ubs1 = %u\09   [0x%x]\0A\00", align 1
@.str3 = private unnamed_addr constant [21 x i8] c"bs0  = %d\09   [0x%x]\0A\00", align 1
@.str4 = private unnamed_addr constant [21 x i8] c"bs1  = %d\09   [0x%x]\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"c1   = '%c'\09   [0x%x]\0A\00", align 1
@.str6 = private unnamed_addr constant [21 x i8] c"s1   = %d\09   [0x%x]\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"uc2  = '%c'\09   [0x%x]\0A\00", align 1
@.str8 = private unnamed_addr constant [21 x i8] c"us2  = %u\09   [0x%x]\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"ic3  = '%c'\09   [0x%x]\0A\00", align 1
@.str10 = private unnamed_addr constant [21 x i8] c"is3  = %d\09   [0x%x]\0A\00", align 1
@.str11 = private unnamed_addr constant [21 x i8] c"is4  = %d\09   [0x%x]\0A\00", align 1
@.str12 = private unnamed_addr constant [21 x i8] c"is5  = %d\09   [0x%x]\0A\00", align 1
@.str13 = private unnamed_addr constant [23 x i8] c"uic4 = '%c'\09   [0x%x]\0A\00", align 1
@.str14 = private unnamed_addr constant [19 x i8] c"uis4 = %u  [0x%x]\0A\00", align 1

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %c1 = alloca i8, align 1
  %s1 = alloca i16, align 2
  %ubc0 = alloca i8, align 1
  %ubs0 = alloca i8, align 1
  %ubs1 = alloca i8, align 1
  %bs0 = alloca i8, align 1
  %bs1 = alloca i8, align 1
  %uc2 = alloca i8, align 1
  %us2 = alloca i16, align 2
  %ic3 = alloca i32, align 4
  %is3 = alloca i32, align 4
  %is4 = alloca i32, align 4
  %is5 = alloca i32, align 4
  %uic4 = alloca i32, align 4
  %uis4 = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = load i32* %argc.addr, align 4
  %cmp = icmp sge i32 %0, 2
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8** %1, i64 1
  %2 = load i8** %arrayidx, align 8
  %call = call i32 @atoi(i8* %2) nounwind readonly
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call, %cond.true ], [ 100, %cond.false ]
  %conv = trunc i32 %cond to i8
  store i8 %conv, i8* %c1, align 1
  %3 = load i32* %argc.addr, align 4
  %cmp1 = icmp sge i32 %3, 3
  br i1 %cmp1, label %cond.true3, label %cond.false6

cond.true3:                                       ; preds = %cond.end
  %4 = load i8*** %argv.addr, align 8
  %arrayidx4 = getelementptr inbounds i8** %4, i64 2
  %5 = load i8** %arrayidx4, align 8
  %call5 = call i32 @atoi(i8* %5) nounwind readonly
  br label %cond.end7

cond.false6:                                      ; preds = %cond.end
  br label %cond.end7

cond.end7:                                        ; preds = %cond.false6, %cond.true3
  %cond8 = phi i32 [ %call5, %cond.true3 ], [ -769, %cond.false6 ]
  %conv9 = trunc i32 %cond8 to i16
  store i16 %conv9, i16* %s1, align 2
  %6 = load i8* %c1, align 1
  store i8 %6, i8* %ubc0, align 1
  %7 = load i16* %s1, align 2
  %conv10 = trunc i16 %7 to i8
  store i8 %conv10, i8* %ubs0, align 1
  %8 = load i8* %ubs0, align 1
  %conv11 = zext i8 %8 to i32
  %add = add nsw i32 %conv11, 1
  %conv12 = trunc i32 %add to i8
  store i8 %conv12, i8* %ubs1, align 1
  %9 = load i8* %ubs0, align 1
  store i8 %9, i8* %bs0, align 1
  %10 = load i8* %ubs0, align 1
  %conv13 = zext i8 %10 to i32
  %add14 = add i32 %conv13, 1
  %conv15 = trunc i32 %add14 to i8
  store i8 %conv15, i8* %bs1, align 1
  %11 = load i8* %c1, align 1
  store i8 %11, i8* %uc2, align 1
  %12 = load i16* %s1, align 2
  store i16 %12, i16* %us2, align 2
  %13 = load i8* %c1, align 1
  %conv16 = sext i8 %13 to i32
  store i32 %conv16, i32* %ic3, align 4
  %14 = load i16* %s1, align 2
  %conv17 = sext i16 %14 to i32
  store i32 %conv17, i32* %is3, align 4
  %15 = load i8* %ubs0, align 1
  %conv18 = zext i8 %15 to i32
  %add19 = add nsw i32 %conv18, 1
  store i32 %add19, i32* %is4, align 4
  %16 = load i8* %bs0, align 1
  %conv20 = sext i8 %16 to i32
  %add21 = add nsw i32 %conv20, 1
  store i32 %add21, i32* %is5, align 4
  %17 = load i8* %c1, align 1
  %conv22 = sext i8 %17 to i32
  store i32 %conv22, i32* %uic4, align 4
  %18 = load i16* %s1, align 2
  %conv23 = sext i16 %18 to i32
  store i32 %conv23, i32* %uis4, align 4
  %19 = load i8* %ubc0, align 1
  %conv24 = zext i8 %19 to i32
  %20 = load i8* %ubc0, align 1
  %conv25 = zext i8 %20 to i32
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i32 0, i32 0), i32 %conv24, i32 %conv25)
  %21 = load i8* %ubs0, align 1
  %conv27 = zext i8 %21 to i32
  %22 = load i8* %ubs0, align 1
  %conv28 = zext i8 %22 to i32
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str1, i32 0, i32 0), i32 %conv27, i32 %conv28)
  %23 = load i8* %ubs1, align 1
  %conv30 = zext i8 %23 to i32
  %24 = load i8* %ubs1, align 1
  %conv31 = zext i8 %24 to i32
  %call32 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i32 0, i32 0), i32 %conv30, i32 %conv31)
  %25 = load i8* %bs0, align 1
  %conv33 = sext i8 %25 to i32
  %26 = load i8* %bs0, align 1
  %conv34 = sext i8 %26 to i32
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str3, i32 0, i32 0), i32 %conv33, i32 %conv34)
  %27 = load i8* %bs1, align 1
  %conv36 = sext i8 %27 to i32
  %28 = load i8* %bs1, align 1
  %conv37 = sext i8 %28 to i32
  %call38 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str4, i32 0, i32 0), i32 %conv36, i32 %conv37)
  %29 = load i8* %c1, align 1
  %conv39 = sext i8 %29 to i32
  %30 = load i8* %c1, align 1
  %conv40 = sext i8 %30 to i32
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %conv39, i32 %conv40)
  %31 = load i16* %s1, align 2
  %conv42 = sext i16 %31 to i32
  %32 = load i16* %s1, align 2
  %conv43 = sext i16 %32 to i32
  %call44 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str6, i32 0, i32 0), i32 %conv42, i32 %conv43)
  %33 = load i8* %uc2, align 1
  %conv45 = zext i8 %33 to i32
  %34 = load i8* %uc2, align 1
  %conv46 = zext i8 %34 to i32
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %conv45, i32 %conv46)
  %35 = load i16* %us2, align 2
  %conv48 = zext i16 %35 to i32
  %36 = load i16* %us2, align 2
  %conv49 = zext i16 %36 to i32
  %call50 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str8, i32 0, i32 0), i32 %conv48, i32 %conv49)
  %37 = load i32* %ic3, align 4
  %38 = load i32* %ic3, align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i32 0, i32 0), i32 %37, i32 %38)
  %39 = load i32* %is3, align 4
  %40 = load i32* %is3, align 4
  %call52 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str10, i32 0, i32 0), i32 %39, i32 %40)
  %41 = load i32* %is4, align 4
  %42 = load i32* %is4, align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str11, i32 0, i32 0), i32 %41, i32 %42)
  %43 = load i32* %is5, align 4
  %44 = load i32* %is5, align 4
  %call54 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str12, i32 0, i32 0), i32 %43, i32 %44)
  %45 = load i32* %uic4, align 4
  %46 = load i32* %uic4, align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str13, i32 0, i32 0), i32 %45, i32 %46)
  %47 = load i32* %uis4, align 4
  %48 = load i32* %uis4, align 4
  %call56 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str14, i32 0, i32 0), i32 %47, i32 %48)
  ret i32 0
}

declare i32 @atoi(i8*) nounwind readonly

declare i32 @printf(i8*, ...)
