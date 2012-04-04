; ModuleID = '/home/david/src/c-semantics/tests/unitTests/arithmetic.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"Error 1\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"Error 2\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"Error 3\0A\00", align 1
@.str3 = private unnamed_addr constant [9 x i8] c"Error 4\0A\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"Error 5\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %scl = alloca i8, align 1
  %sch = alloca i8, align 1
  %ucl = alloca i8, align 1
  %uch = alloca i8, align 1
  %sil = alloca i16, align 2
  %sih = alloca i16, align 2
  %usil = alloca i16, align 2
  %usih = alloca i16, align 2
  %il = alloca i32, align 4
  %ih = alloca i32, align 4
  %uil = alloca i32, align 4
  %uih = alloca i32, align 4
  %lil = alloca i64, align 8
  %lih = alloca i64, align 8
  %ulil = alloca i64, align 8
  %ulilh = alloca i64, align 8
  %llil = alloca i64, align 8
  %llih = alloca i64, align 8
  store i32 0, i32* %retval
  store i8 -127, i8* %scl, align 1
  store i8 127, i8* %sch, align 1
  store i8 0, i8* %ucl, align 1
  store i8 -1, i8* %uch, align 1
  store i16 -32767, i16* %sil, align 2
  store i16 32767, i16* %sih, align 2
  store i16 0, i16* %usil, align 2
  store i16 -1, i16* %usih, align 2
  store i32 -32767, i32* %il, align 4
  store i32 32767, i32* %ih, align 4
  store i32 0, i32* %uil, align 4
  store i32 65535, i32* %uih, align 4
  store i64 -2147483647, i64* %lil, align 8
  store i64 2147483647, i64* %lih, align 8
  store i64 0, i64* %ulil, align 8
  store i64 4294967295, i64* %ulilh, align 8
  store i64 -9223372036854775807, i64* %llil, align 8
  store i64 9223372036854775807, i64* %llih, align 8
  %0 = load i8* %scl, align 1
  %conv = sext i8 %0 to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %1 = load i16* %sil, align 2
  %conv2 = sext i16 %1 to i32
  %cmp3 = icmp slt i32 %conv2, 0
  br i1 %cmp3, label %if.end7, label %if.then5

if.then5:                                         ; preds = %if.end
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end7

if.end7:                                          ; preds = %if.then5, %if.end
  %2 = load i32* %il, align 4
  %cmp8 = icmp slt i32 %2, 0
  br i1 %cmp8, label %if.end12, label %if.then10

if.then10:                                        ; preds = %if.end7
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %if.end12

if.end12:                                         ; preds = %if.then10, %if.end7
  %3 = load i64* %lil, align 8
  %cmp13 = icmp slt i64 %3, 0
  br i1 %cmp13, label %if.end17, label %if.then15

if.then15:                                        ; preds = %if.end12
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %if.end12
  %4 = load i64* %llil, align 8
  %cmp18 = icmp slt i64 %4, 0
  br i1 %cmp18, label %if.end22, label %if.then20

if.then20:                                        ; preds = %if.end17
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0))
  br label %if.end22

if.end22:                                         ; preds = %if.then20, %if.end17
  ret i32 0
}

declare i32 @printf(i8*, ...)
