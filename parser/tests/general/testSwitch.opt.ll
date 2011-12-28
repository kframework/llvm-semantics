; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/testSwitch.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"%d: You typed zero.\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"%d: is a perfect square.\0A\00", align 1
@.str2 = private unnamed_addr constant [24 x i8] c"%d: is an even number.\0A\00", align 1
@.str3 = private unnamed_addr constant [24 x i8] c"%d: is a prime number.\0A\00", align 1
@.str4 = private unnamed_addr constant [44 x i8] c"%d: Only single-digit numbers are allowed.\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"The count is %d.  \0AThis is \00", align 1
@str = internal constant [6 x i8] c"none.\00"
@str1 = internal constant [10 x i8] c"only one.\00"
@str2 = internal constant [8 x i8] c"a pair.\00"
@str3 = internal constant [7 x i8] c"three.\00"
@str4 = internal constant [6 x i8] c"four.\00"
@str5 = internal constant [30 x i8] c"inside switch, going to break\00"
@str6 = internal constant [6 x i8] c"many.\00"
@str7 = internal constant [6 x i8] c"Broke\00"

define void @doSwitch(i32 %n) nounwind uwtable {
entry:
  switch i32 %n, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb2
    i32 9, label %sw.bb2
    i32 2, label %sw.bb5
    i32 3, label %sw.bb8
    i32 5, label %sw.bb8
    i32 7, label %sw.bb8
    i32 4, label %sw.bb11
    i32 6, label %sw.bb14
    i32 8, label %sw.bb14
  ]

sw.bb:                                            ; preds = %entry
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %n) nounwind
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry, %entry
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i32 %n) nounwind
  br label %sw.epilog

sw.bb5:                                           ; preds = %entry
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str2, i64 0, i64 0), i32 %n) nounwind
  br label %sw.bb8

sw.bb8:                                           ; preds = %sw.bb5, %entry, %entry, %entry
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str3, i64 0, i64 0), i32 %n) nounwind
  br label %sw.epilog

sw.bb11:                                          ; preds = %entry
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i32 %n) nounwind
  br label %sw.bb14

sw.bb14:                                          ; preds = %sw.bb11, %entry, %entry
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([24 x i8]* @.str2, i64 0, i64 0), i32 %n) nounwind
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([44 x i8]* @.str4, i64 0, i64 0), i32 %n) nounwind
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb14, %sw.bb8, %sw.bb2, %sw.bb
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @myswitch(i32 %count) nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i64 0, i64 0), i32 %count) nounwind
  switch i32 %count, label %sw.default [
    i32 0, label %sw.bb
    i32 1, label %sw.bb3
    i32 2, label %insideTwo
    i32 3, label %sw.bb7
    i32 4, label %insideFour
  ]

sw.bb:                                            ; preds = %entry
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @str, i64 0, i64 0))
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([10 x i8]* @str1, i64 0, i64 0))
  br label %sw.epilog

insideTwo:                                        ; preds = %entry
  %puts2 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @str2, i64 0, i64 0))
  br label %sw.epilog

sw.bb7:                                           ; preds = %entry
  %puts3 = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str3, i64 0, i64 0))
  br label %sw.epilog

insideFour:                                       ; preds = %entry
  %puts4 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @str4, i64 0, i64 0))
  %puts5 = tail call i32 @puts(i8* getelementptr inbounds ([30 x i8]* @str5, i64 0, i64 0))
  br label %sw.epilog

sw.default:                                       ; preds = %entry
  %puts6 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @str6, i64 0, i64 0))
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %insideFour, %sw.bb7, %insideTwo, %sw.bb3, %sw.bb
  %puts7 = tail call i32 @puts(i8* getelementptr inbounds ([6 x i8]* @str7, i64 0, i64 0))
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @doSwitch(i32 0)
  tail call void @doSwitch(i32 1)
  tail call void @doSwitch(i32 2)
  tail call void @doSwitch(i32 3)
  tail call void @doSwitch(i32 4)
  tail call void @doSwitch(i32 5)
  tail call void @doSwitch(i32 6)
  tail call void @doSwitch(i32 7)
  tail call void @doSwitch(i32 8)
  tail call void @doSwitch(i32 9)
  tail call void @doSwitch(i32 10)
  %call = tail call i32 @myswitch(i32 0)
  %call.1 = tail call i32 @myswitch(i32 1)
  %call.2 = tail call i32 @myswitch(i32 2)
  %call.3 = tail call i32 @myswitch(i32 3)
  %call.4 = tail call i32 @myswitch(i32 4)
  %call.5 = tail call i32 @myswitch(i32 5)
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind
