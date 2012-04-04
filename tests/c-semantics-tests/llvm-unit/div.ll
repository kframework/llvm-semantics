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

define i32 @uDivTest1(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %div = udiv i32 0, %0
  ret i32 %div
}

define i32 @uDivTest2(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %div = udiv i32 %0, 1
  ret i32 %div
}

define i32 @uDivTest3(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %div = udiv i32 %0, -1
  ret i32 %div
}

define i32 @uDivTest4(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %1 = load i32* %Y.addr, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32* %Y.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %2, %cond.false ]
  ret i32 %cond
}

define i32 @uDivTest5(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %1 = load i32* %Y.addr, align 4
  %cmp = icmp eq i32 %0, %1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32* %Y.addr, align 4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 0, %cond.true ], [ %2, %cond.false ]
  ret i32 %cond
}

define i32 @uDivTest6(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %1 = load i32* %Y.addr, align 4
  %cmp = icmp ne i32 %0, %1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32* %Y.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ 0, %cond.false ]
  ret i32 %cond
}

define i32 @uDivTest7(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %1 = load i32* %Y.addr, align 4
  %cmp = icmp ne i32 %0, %1
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %2 = load i32* %Y.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ 0, %cond.false ]
  ret i32 %cond
}

define i32 @uDivTest8(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %div = udiv i32 %0, 2
  %div1 = udiv i32 %div, 4
  ret i32 %div1
}

define i32 @uDivTest9(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %div = udiv i32 %0, 2
  %div1 = udiv i32 %div, 4
  ret i32 %div1
}

define i32 @uDivTest10(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %div = udiv i32 %0, 4
  ret i32 %div
}

define i32 @uDivTest11(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %div = udiv i32 %0, 4
  ret i32 %div
}

define i32 @uDivTest12(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %1 = load i32* %Y.addr, align 4
  %shl = shl i32 4, %1
  %div = udiv i32 %0, %shl
  ret i32 %div
}

define i32 @uDivTest13(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %1 = load i32* %Y.addr, align 4
  %shl = shl i32 4, %1
  %div = udiv i32 %0, %shl
  ret i32 %div
}

define i32 @uDivTest14(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %1 = load i32* %X.addr, align 4
  %2 = load i32* %Y.addr, align 4
  %cmp = icmp eq i32 %1, %2
  %conv = zext i1 %cmp to i32
  %div = udiv i32 %0, 4
  ret i32 %div
}

define i32 @uDivTest15(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %1 = load i32* %X.addr, align 4
  %2 = load i32* %Y.addr, align 4
  %cmp = icmp eq i32 %1, %2
  %conv = zext i1 %cmp to i32
  %div = udiv i32 %0, 4
  ret i32 %div
}

define i32 @uDivTest16(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %sub = sub i32 0, %0
  %div = udiv i32 %sub, 2
  ret i32 %div
}

define i32 @uDivTest17(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %X.addr = alloca i32, align 4
  %Y.addr = alloca i32, align 4
  store i32 %X, i32* %X.addr, align 4
  store i32 %Y, i32* %Y.addr, align 4
  %0 = load i32* %X.addr, align 4
  %sub = sub i32 0, %0
  %div = udiv i32 %sub, 2
  ret i32 %div
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @uDivTest1(i32 42, i32 3)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %call)
  %call2 = call i32 @uDivTest2(i32 42, i32 3)
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %call2)
  %call4 = call i32 @uDivTest3(i32 42, i32 3)
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %call4)
  %call6 = call i32 @uDivTest4(i32 42, i32 3)
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %call6)
  %call8 = call i32 @uDivTest5(i32 42, i32 3)
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %call8)
  %call10 = call i32 @uDivTest6(i32 42, i32 3)
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %call10)
  %call12 = call i32 @uDivTest7(i32 42, i32 3)
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %call12)
  %call14 = call i32 @uDivTest8(i32 42, i32 3)
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %call14)
  %call16 = call i32 @uDivTest9(i32 42, i32 3)
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %call16)
  %call18 = call i32 @uDivTest10(i32 42, i32 3)
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i32 0, i32 0), i32 %call18)
  %call20 = call i32 @uDivTest11(i32 42, i32 3)
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str10, i32 0, i32 0), i32 %call20)
  %call22 = call i32 @uDivTest12(i32 42, i32 3)
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str11, i32 0, i32 0), i32 %call22)
  %call24 = call i32 @uDivTest13(i32 42, i32 3)
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str12, i32 0, i32 0), i32 %call24)
  %call26 = call i32 @uDivTest14(i32 42, i32 3)
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str13, i32 0, i32 0), i32 %call26)
  %call28 = call i32 @uDivTest15(i32 42, i32 3)
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str14, i32 0, i32 0), i32 %call28)
  %call30 = call i32 @uDivTest16(i32 42, i32 3)
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str15, i32 0, i32 0), i32 %call30)
  %call32 = call i32 @uDivTest17(i32 42, i32 3)
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str16, i32 0, i32 0), i32 %call32)
  ret i32 0
}

declare i32 @printf(i8*, ...)
