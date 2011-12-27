; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/castNonIntegerToBool.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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
  %tmp = load i32** %p, align 8
  %tobool = icmp ne i32* %tmp, null
  %frombool = zext i1 %tobool to i8
  store i8 %frombool, i8* %b1, align 1
  store i8 0, i8* %b2, align 1
  store i8 0, i8* %b3, align 1
  store i8 1, i8* %b4, align 1
  %tmp4 = load i8* %b1, align 1
  %tobool5 = trunc i8 %tmp4 to i1
  %conv = zext i1 %tobool5 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tmp8 = load i8* %b2, align 1
  %tobool9 = trunc i8 %tmp8 to i1
  %conv10 = zext i1 %tobool9 to i32
  %cmp11 = icmp ne i32 %conv10, 0
  br i1 %cmp11, label %if.then13, label %if.else15

if.then13:                                        ; preds = %if.end
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str2, i32 0, i32 0))
  br label %if.end17

if.else15:                                        ; preds = %if.end
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str3, i32 0, i32 0))
  br label %if.end17

if.end17:                                         ; preds = %if.else15, %if.then13
  %tmp18 = load i8* %b3, align 1
  %tobool19 = trunc i8 %tmp18 to i1
  %conv20 = zext i1 %tobool19 to i32
  %cmp21 = icmp ne i32 %conv20, 0
  br i1 %cmp21, label %if.then23, label %if.else25

if.then23:                                        ; preds = %if.end17
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0))
  br label %if.end27

if.else25:                                        ; preds = %if.end17
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str5, i32 0, i32 0))
  br label %if.end27

if.end27:                                         ; preds = %if.else25, %if.then23
  %tmp28 = load i8* %b4, align 1
  %tobool29 = trunc i8 %tmp28 to i1
  %conv30 = zext i1 %tobool29 to i32
  %cmp31 = icmp ne i32 %conv30, 1
  br i1 %cmp31, label %if.then33, label %if.else35

if.then33:                                        ; preds = %if.end27
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str6, i32 0, i32 0))
  br label %if.end37

if.else35:                                        ; preds = %if.end27
  %call36 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str7, i32 0, i32 0))
  br label %if.end37

if.end37:                                         ; preds = %if.else35, %if.then33
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
