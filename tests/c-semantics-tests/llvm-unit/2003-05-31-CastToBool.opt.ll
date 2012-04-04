; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2003-05-31-CastToBool.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"y = %d, (y == 2 || y == 0) == %d\0A\00", align 1
@.str1 = private unnamed_addr constant [32 x i8] c"y = %d, (y > 2 || y < 5) == %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"y = %d, (y ^ 2 ^ ~y) == %d\0A\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str4 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"%lld \00", align 1

define void @testCastOps(i32 %y) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %y, 2
  %cmp1 = icmp eq i32 %y, 0
  %.cmp1 = or i1 %cmp, %cmp1
  %lor.ext = zext i1 %.cmp1 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str, i64 0, i64 0), i32 %y, i32 %lor.ext) nounwind
  %y.off = add i32 %y, 9
  %0 = icmp ult i32 %y.off, 11
  %land.ext = zext i1 %0 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 %y, i32 %land.ext) nounwind
  %tobool = icmp ne i32 %y, -8
  %conv = zext i1 %tobool to i32
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i64 0, i64 0), i32 %y, i32 %conv) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define void @testBool(i1 zeroext %X) nounwind uwtable {
entry:
  %conv = zext i1 %X to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %conv) nounwind
  ret void
}

define void @testByte(i8 signext %X) nounwind uwtable {
entry:
  %conv = sext i8 %X to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 %conv) nounwind
  %cmp = icmp ne i8 %X, 0
  %conv.i = zext i1 %cmp to i32
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %conv.i) nounwind
  ret void
}

define void @testShort(i16 signext %X) nounwind uwtable {
entry:
  %conv = sext i16 %X to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 %conv) nounwind
  %cmp = icmp ne i16 %X, 0
  %conv.i = zext i1 %cmp to i32
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %conv.i) nounwind
  ret void
}

define void @testInt(i32 %X) nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 %X) nounwind
  %cmp = icmp ne i32 %X, 0
  %conv.i = zext i1 %cmp to i32
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %conv.i) nounwind
  ret void
}

define void @testLong(i64 %X) nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str5, i64 0, i64 0), i64 %X) nounwind
  %cmp = icmp ne i64 %X, 0
  %conv.i = zext i1 %cmp to i32
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 %conv.i) nounwind
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 0) nounwind
  %call.i.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 0) nounwind
  %call.i1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 123) nounwind
  %call.i.i2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 1) nounwind
  %call.i3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 0) nounwind
  %call.i.i4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 0) nounwind
  %call.i5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 1234) nounwind
  %call.i.i6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 1) nounwind
  %call.i7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 0) nounwind
  %call.i.i8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 0) nounwind
  %call.i9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str4, i64 0, i64 0), i32 1234) nounwind
  %call.i.i10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 1) nounwind
  %call.i11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str5, i64 0, i64 0), i64 0) nounwind
  %call.i.i12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 0) nounwind
  %call.i13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str5, i64 0, i64 0), i64 123121231231231) nounwind
  %call.i.i14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 1) nounwind
  %call.i15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str5, i64 0, i64 0), i64 1230098424783699968) nounwind
  %call.i.i16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 1) nounwind
  %call.i17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([6 x i8]* @.str5, i64 0, i64 0), i64 69920) nounwind
  %call.i.i18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 1) nounwind
  %call.i19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([34 x i8]* @.str, i64 0, i64 0), i32 2, i32 1) nounwind
  %call4.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str1, i64 0, i64 0), i32 2, i32 0) nounwind
  %call6.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i64 0, i64 0), i32 2, i32 1) nounwind
  ret i32 0
}
