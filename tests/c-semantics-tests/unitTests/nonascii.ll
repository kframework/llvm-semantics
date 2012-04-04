; ModuleID = '/home/david/src/c-semantics/tests/unitTests/nonascii.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global [2 x i32] [i32 937, i32 0], align 4
@y = global i32 937, align 4
@.str = private unnamed_addr constant [59 x i8] c"size of 2 element string is %d, and size of element is %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"first element is same\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"first element is different\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"terminator element is same\0A\00", align 1
@.str4 = private unnamed_addr constant [33 x i8] c"terminator element is different\0A\00", align 1
@.str5 = private unnamed_addr constant [16 x i8] c"chars are same\0A\00", align 1
@.str6 = private unnamed_addr constant [21 x i8] c"chars are different\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str, i32 0, i32 0), i32 8, i32 4)
  %0 = load i32* getelementptr inbounds ([2 x i32]* @x, i32 0, i64 0), align 4
  %cmp = icmp eq i32 %0, 937
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %1 = load i32* getelementptr inbounds ([2 x i32]* @x, i32 0, i64 1), align 4
  %cmp3 = icmp eq i32 %1, 0
  br i1 %cmp3, label %if.then4, label %if.else6

if.then4:                                         ; preds = %if.end
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i32 0, i32 0))
  br label %if.end8

if.else6:                                         ; preds = %if.end
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([33 x i8]* @.str4, i32 0, i32 0))
  br label %if.end8

if.end8:                                          ; preds = %if.else6, %if.then4
  %2 = load i32* @y, align 4
  %cmp9 = icmp eq i32 %2, 937
  br i1 %cmp9, label %if.then10, label %if.else12

if.then10:                                        ; preds = %if.end8
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([16 x i8]* @.str5, i32 0, i32 0))
  br label %if.end14

if.else12:                                        ; preds = %if.end8
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str6, i32 0, i32 0))
  br label %if.end14

if.end14:                                         ; preds = %if.else12, %if.then10
  %3 = load i32* %retval
  ret i32 %3
}

declare i32 @printf(i8*, ...)
