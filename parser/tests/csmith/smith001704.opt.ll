; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001704.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i16 }
%struct.S0 = type { i16, i16, i8, i16, i16 }

@g_4 = global [2 x i32] zeroinitializer, align 4
@g_5 = global %struct.S0 { i16 -11030, i16 -1, i8 -4, i16 0, i16 12254 }, align 2
@.str = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5.f0 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5.f1 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5.f2 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5.f3 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5.f4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define %0 @func_1() nounwind uwtable {
entry:
  %tmp2 = load i32* getelementptr inbounds ([2 x i32]* @g_4, i64 0, i64 0), align 4
  %xor = xor i32 %tmp2, 65533
  store i32 %xor, i32* getelementptr inbounds ([2 x i32]* @g_4, i64 0, i64 0), align 4
  %tmp39 = load i16* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 0), align 2
  %tmp40 = load i16* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 1), align 2
  %tmp41 = load i8* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 2), align 2
  %tmp42 = load i16* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 3), align 2
  %tmp43 = load i16* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 4), align 2
  %tmp10 = zext i16 %tmp39 to i64
  %tmp12 = zext i16 %tmp40 to i64
  %tmp13 = shl nuw nsw i64 %tmp12, 16
  %tmp17 = zext i8 %tmp41 to i64
  %tmp18 = shl nuw nsw i64 %tmp17, 32
  %tmp22 = zext i16 %tmp42 to i64
  %tmp23 = shl nuw i64 %tmp22, 48
  %ins15 = or i64 %tmp13, %tmp10
  %ins20 = or i64 %ins15, %tmp18
  %ins25 = or i64 %ins20, %tmp23
  %tmp5 = insertvalue %0 undef, i64 %ins25, 0
  %tmp8 = insertvalue %0 %tmp5, i16 %tmp43, 1
  ret %0 %tmp8
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp2.i = load i32* getelementptr inbounds ([2 x i32]* @g_4, i64 0, i64 0), align 4
  %xor.i = xor i32 %tmp2.i, 65533
  store i32 %xor.i, i32* getelementptr inbounds ([2 x i32]* @g_4, i64 0, i64 0), align 4
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %xor.i) nounwind
  %tmp3 = load i32* getelementptr inbounds ([2 x i32]* @g_4, i64 0, i64 1), align 4
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp3) nounwind
  %tmp5 = load i32* getelementptr inbounds ([2 x i32]* @g_4, i64 0, i64 0), align 4
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp5) nounwind
  %tmp7 = volatile load i16* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 0), align 2
  %conv = sext i16 %tmp7 to i32
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %conv) nounwind
  %tmp9 = load i16* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 1), align 2
  %conv10 = sext i16 %tmp9 to i32
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %conv10) nounwind
  %tmp12 = load i8* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 2), align 2
  %conv13 = sext i8 %tmp12 to i32
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %conv13) nounwind
  %tmp15 = load i16* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 3), align 2
  %conv16 = zext i16 %tmp15 to i32
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %conv16) nounwind
  %tmp18 = load i16* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 4), align 2
  %conv19 = sext i16 %tmp18 to i32
  %call20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %conv19) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
