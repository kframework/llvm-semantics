; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/arithmetic.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i8* %scl, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp2 = load i16* %sil, align 2
  %conv3 = sext i16 %tmp2 to i32
  %cmp4 = icmp slt i32 %conv3, 0
  br i1 %cmp4, label %if.end8, label %if.then6

if.then6:                                         ; preds = %if.end
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end
  %tmp9 = load i32* %il, align 4
  %cmp10 = icmp slt i32 %tmp9, 0
  br i1 %cmp10, label %if.end14, label %if.then12

if.then12:                                        ; preds = %if.end8
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i32 0, i32 0))
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %if.end8
  %tmp15 = load i64* %lil, align 8
  %cmp16 = icmp slt i64 %tmp15, 0
  br i1 %cmp16, label %if.end20, label %if.then18

if.then18:                                        ; preds = %if.end14
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %if.end20

if.end20:                                         ; preds = %if.then18, %if.end14
  %tmp21 = load i64* %llil, align 8
  %cmp22 = icmp slt i64 %tmp21, 0
  br i1 %cmp22, label %if.end26, label %if.then24

if.then24:                                        ; preds = %if.end20
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str4, i32 0, i32 0))
  br label %if.end26

if.end26:                                         ; preds = %if.then24, %if.end20
  ret i32 0
}

declare i32 @printf(i8*, ...)
