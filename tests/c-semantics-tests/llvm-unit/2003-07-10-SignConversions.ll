; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-07-10-SignConversions.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [39 x i8] c"%d %d --> unsigned: us = %d, us2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [39 x i8] c"%d %d -->   signed:  s = %d,  s2 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [39 x i8] c"%d %d --> unsigned: uc = %d, uc2 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [39 x i8] c"%d %d -->   signed:  c = %d,  c2 = %d\0A\00", align 1

define zeroext i8 @getUC() nounwind uwtable {
entry:
  ret i8 -128
}

define signext i8 @getC() nounwind uwtable {
entry:
  ret i8 -128
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %C80 = alloca i8, align 1
  %UC80 = alloca i8, align 1
  %us = alloca i16, align 2
  %us2 = alloca i16, align 2
  %s = alloca i16, align 2
  %s2 = alloca i16, align 2
  %uc = alloca i8, align 1
  %uc2 = alloca i8, align 1
  %c = alloca i8, align 1
  %c2 = alloca i8, align 1
  store i32 0, i32* %retval
  %call = call signext i8 @getC()
  store i8 %call, i8* %C80, align 1
  %call1 = call zeroext i8 @getUC()
  store i8 %call1, i8* %UC80, align 1
  %0 = load i8* %C80, align 1
  %conv = sext i8 %0 to i16
  store i16 %conv, i16* %us, align 2
  %1 = load i8* %UC80, align 1
  %conv2 = zext i8 %1 to i16
  store i16 %conv2, i16* %us2, align 2
  %2 = load i8* %C80, align 1
  %conv3 = sext i8 %2 to i16
  store i16 %conv3, i16* %s, align 2
  %3 = load i8* %UC80, align 1
  %conv4 = zext i8 %3 to i16
  store i16 %conv4, i16* %s2, align 2
  %4 = load i8* %C80, align 1
  %conv5 = sext i8 %4 to i32
  %5 = load i8* %UC80, align 1
  %conv6 = zext i8 %5 to i32
  %6 = load i16* %us, align 2
  %conv7 = zext i16 %6 to i32
  %7 = load i16* %us2, align 2
  %conv8 = zext i16 %7 to i32
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str, i32 0, i32 0), i32 %conv5, i32 %conv6, i32 %conv7, i32 %conv8)
  %8 = load i8* %C80, align 1
  %conv10 = sext i8 %8 to i32
  %9 = load i8* %UC80, align 1
  %conv11 = zext i8 %9 to i32
  %10 = load i16* %s, align 2
  %conv12 = sext i16 %10 to i32
  %11 = load i16* %s2, align 2
  %conv13 = sext i16 %11 to i32
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str1, i32 0, i32 0), i32 %conv10, i32 %conv11, i32 %conv12, i32 %conv13)
  %12 = load i8* %C80, align 1
  store i8 %12, i8* %uc, align 1
  %13 = load i8* %UC80, align 1
  store i8 %13, i8* %uc2, align 1
  %14 = load i8* %C80, align 1
  store i8 %14, i8* %c, align 1
  %15 = load i8* %UC80, align 1
  store i8 %15, i8* %c2, align 1
  %16 = load i8* %C80, align 1
  %conv15 = sext i8 %16 to i32
  %17 = load i8* %UC80, align 1
  %conv16 = zext i8 %17 to i32
  %18 = load i8* %uc, align 1
  %conv17 = zext i8 %18 to i32
  %19 = load i8* %uc2, align 1
  %conv18 = zext i8 %19 to i32
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i32 0, i32 0), i32 %conv15, i32 %conv16, i32 %conv17, i32 %conv18)
  %20 = load i8* %C80, align 1
  %conv20 = sext i8 %20 to i32
  %21 = load i8* %UC80, align 1
  %conv21 = zext i8 %21 to i32
  %22 = load i8* %c, align 1
  %conv22 = sext i8 %22 to i32
  %23 = load i8* %c2, align 1
  %conv23 = sext i8 %23 to i32
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str3, i32 0, i32 0), i32 %conv20, i32 %conv21, i32 %conv22, i32 %conv23)
  ret i32 0
}

declare i32 @printf(i8*, ...)
