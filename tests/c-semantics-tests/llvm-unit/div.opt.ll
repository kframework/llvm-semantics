; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/div.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [22 x i8] c"uDivTest1(42,3) = %u\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"uDivTest2(42,3) = %u\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"uDivTest3(42,3) = %u\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"uDivTest4(42,3) = %u\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"uDivTest5(42,3) = %u\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"uDivTest6(42,3) = %u\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"uDivTest7(42,3) = %u\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"uDivTest8(42,3) = %u\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"uDivTest9(42,3) = %u\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"uDivTest10(42,3) = %u\0A\00", align 1
@.str10 = private unnamed_addr constant [23 x i8] c"uDivTest11(42,3) = %u\0A\00", align 1
@.str11 = private unnamed_addr constant [23 x i8] c"uDivTest12(42,3) = %u\0A\00", align 1
@.str12 = private unnamed_addr constant [23 x i8] c"uDivTest13(42,3) = %u\0A\00", align 1
@.str13 = private unnamed_addr constant [23 x i8] c"uDivTest14(42,3) = %u\0A\00", align 1
@.str14 = private unnamed_addr constant [23 x i8] c"uDivTest15(42,3) = %u\0A\00", align 1
@.str15 = private unnamed_addr constant [23 x i8] c"uDivTest16(42,3) = %u\0A\00", align 1
@.str16 = private unnamed_addr constant [23 x i8] c"uDivTest17(42,3) = %u\0A\00", align 1

define i32 @uDivTest1(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @uDivTest2(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  ret i32 %X
}

define i32 @uDivTest3(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %not. = icmp eq i32 %X, -1
  %div = zext i1 %not. to i32
  ret i32 %div
}

define i32 @uDivTest4(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i32 %X, %Y
  %cond = select i1 %cmp, i32 0, i32 %Y
  ret i32 %cond
}

define i32 @uDivTest5(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i32 %X, %Y
  %cond = select i1 %cmp, i32 0, i32 %Y
  ret i32 %cond
}

define i32 @uDivTest6(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %cmp = icmp ne i32 %X, %Y
  %cond = select i1 %cmp, i32 %Y, i32 0
  ret i32 %cond
}

define i32 @uDivTest7(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %cmp = icmp ne i32 %X, %Y
  %cond = select i1 %cmp, i32 %Y, i32 0
  ret i32 %cond
}

define i32 @uDivTest8(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %div = lshr i32 %X, 3
  ret i32 %div
}

define i32 @uDivTest9(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %div = lshr i32 %X, 3
  ret i32 %div
}

define i32 @uDivTest10(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %div = lshr i32 %X, 2
  ret i32 %div
}

define i32 @uDivTest11(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %div = lshr i32 %X, 2
  ret i32 %div
}

define i32 @uDivTest12(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %0 = add i32 %Y, 2
  %div = lshr i32 %X, %0
  ret i32 %div
}

define i32 @uDivTest13(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %0 = add i32 %Y, 2
  %div = lshr i32 %X, %0
  ret i32 %div
}

define i32 @uDivTest14(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %div = lshr i32 %X, 2
  ret i32 %div
}

define i32 @uDivTest15(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %div = lshr i32 %X, 2
  ret i32 %div
}

define i32 @uDivTest16(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %sub = sub i32 0, %X
  %div = lshr i32 %sub, 1
  ret i32 %div
}

define i32 @uDivTest17(i32 %X, i32 %Y) nounwind uwtable readnone {
entry:
  %sub = sub i32 0, %X
  %div = lshr i32 %sub, 1
  ret i32 %div
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 42) nounwind
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 0) nounwind
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 3) nounwind
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 3) nounwind
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 3) nounwind
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 3) nounwind
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 5) nounwind
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i64 0, i64 0), i32 5) nounwind
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i64 0, i64 0), i32 10) nounwind
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str10, i64 0, i64 0), i32 10) nounwind
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str11, i64 0, i64 0), i32 1) nounwind
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str12, i64 0, i64 0), i32 1) nounwind
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str13, i64 0, i64 0), i32 10) nounwind
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str14, i64 0, i64 0), i32 10) nounwind
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str15, i64 0, i64 0), i32 2147483627) nounwind
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str16, i64 0, i64 0), i32 2147483627) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
