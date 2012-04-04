; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/nonascii.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = global [12 x i8] c"\CE\00\00\00\A9\00\00\00\00\00\00\00", align 4
@y = global i32 -87, align 4
@.str = private unnamed_addr constant [59 x i8] c"size of 2 element string is %d, and size of element is %d\0A\00", align 1
@str = internal constant [22 x i8] c"first element is same\00"
@str1 = internal constant [27 x i8] c"first element is different\00"
@str2 = internal constant [27 x i8] c"terminator element is same\00"
@str3 = internal constant [32 x i8] c"terminator element is different\00"
@str4 = internal constant [15 x i8] c"chars are same\00"
@str5 = internal constant [20 x i8] c"chars are different\00"

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([59 x i8]* @.str, i64 0, i64 0), i32 12, i32 4) nounwind
  %tmp = load i32* bitcast ([12 x i8]* @x to i32*), align 4
  %cmp = icmp eq i32 %tmp, -87
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([22 x i8]* @str, i64 0, i64 0))
  br label %if.end

if.else:                                          ; preds = %entry
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str1, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tmp3 = load i32* bitcast (i8* getelementptr inbounds ([12 x i8]* @x, i64 0, i64 4) to i32*), align 4
  %cmp4 = icmp eq i32 %tmp3, 0
  br i1 %cmp4, label %if.then5, label %if.else7

if.then5:                                         ; preds = %if.end
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([27 x i8]* @str2, i64 0, i64 0))
  br label %if.end9

if.else7:                                         ; preds = %if.end
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([32 x i8]* @str3, i64 0, i64 0))
  br label %if.end9

if.end9:                                          ; preds = %if.else7, %if.then5
  %tmp10 = load i32* @y, align 4
  %cmp11 = icmp eq i32 %tmp10, -87
  br i1 %cmp11, label %if.then12, label %if.else14

if.then12:                                        ; preds = %if.end9
  %puts4 = tail call i32 @puts(i8* getelementptr inbounds ([15 x i8]* @str4, i64 0, i64 0))
  br label %if.end16

if.else14:                                        ; preds = %if.end9
  %puts5 = tail call i32 @puts(i8* getelementptr inbounds ([20 x i8]* @str5, i64 0, i64 0))
  br label %if.end16

if.end16:                                         ; preds = %if.else14, %if.then12
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind
