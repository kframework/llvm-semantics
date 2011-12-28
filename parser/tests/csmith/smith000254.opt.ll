; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000254.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S2 = type { i8, i8, i32, i32 }

@g_4 = global [2 x %struct.S2] [%struct.S2 { i8 -9, i8 -12, i32 -1, i32 1052116627 }, %struct.S2 { i8 -9, i8 -12, i32 -1, i32 1052116627 }], align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_4[0].f0 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_4[0].f1 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_4[0].f2 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_4[0].f3 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_4[1].f0 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_4[1].f1 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_4[1].f2 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_4[1].f3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable readonly {
entry:
  %tmp1 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 1, i32 0), align 4
  %conv = sext i8 %tmp1 to i32
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 0, i32 0), align 16
  %conv = sext i8 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 0, i32 1), align 1
  %conv3 = zext i8 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = volatile load i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 0, i32 2), align 4
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 %tmp5) nounwind
  %tmp7 = volatile load i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 0, i32 3), align 8
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 %tmp7) nounwind
  %tmp9 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 1, i32 0), align 4
  %conv10 = sext i8 %tmp9 to i32
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %conv10) nounwind
  %tmp12 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 1, i32 1), align 1
  %conv13 = zext i8 %tmp12 to i32
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %conv13) nounwind
  %tmp15 = volatile load i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 1, i32 2), align 4
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %tmp15) nounwind
  %tmp17 = volatile load i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 1, i32 3), align 4
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %tmp17) nounwind
  %tmp19 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 1, i32 0), align 4
  %conv20 = sext i8 %tmp19 to i32
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %conv20) nounwind
  %tmp22 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 1, i32 1), align 1
  %conv23 = zext i8 %tmp22 to i32
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %conv23) nounwind
  %tmp25 = volatile load i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 1, i32 2), align 4
  %call26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %tmp25) nounwind
  %tmp27 = volatile load i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i64 0, i64 1, i32 3), align 4
  %call28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %tmp27) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
