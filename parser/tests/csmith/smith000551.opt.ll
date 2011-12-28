; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000551.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i16, i16, i32, i32, %1, %1, i8, i32 }
%1 = type { i16, i32, i8, [3 x i8] }
%struct.S0 = type { i16, i32, i8 }
%struct.S1 = type { i16, i16, i32, i32, %struct.S0, %struct.S0, i8, i32 }

@g_2 = global %0 { i16 6846, i16 -3568, i32 0, i32 -2, %1 { i16 30940, i32 -1473638230, i8 -7, [3 x i8] undef }, %1 { i16 1, i32 -1014273266, i8 0, [3 x i8] undef }, i8 -1, i32 -3 }, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2.f0 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2.f1 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2.f2 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2.f3 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2.f4.f0 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2.f4.f1 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2.f4.f2 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2.f5.f0 = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2.f5.f1 = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2.f5.f2 = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [22 x i8] c"checksum g_2.f6 = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [22 x i8] c"checksum g_2.f7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S1* nocapture sret %agg.result) nounwind uwtable {
entry:
  %tmp = bitcast %struct.S1* %agg.result to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%0* @g_2 to i8*), i64 44, i32 4, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp1 = load i16* getelementptr inbounds (%0* @g_2, i64 0, i32 0), align 4
  %conv = sext i16 %tmp1 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = volatile load i16* getelementptr inbounds (%0* @g_2, i64 0, i32 1), align 2
  %conv3 = sext i16 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = load i32* getelementptr inbounds (%0* @g_2, i64 0, i32 2), align 4
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp5) nounwind
  %tmp7 = load i32* getelementptr inbounds (%0* @g_2, i64 0, i32 3), align 4
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp7) nounwind
  %tmp9 = load i16* getelementptr inbounds (%0* @g_2, i64 0, i32 4, i32 0), align 4
  %conv10 = sext i16 %tmp9 to i32
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %conv10) nounwind
  %tmp12 = load i32* getelementptr inbounds (%0* @g_2, i64 0, i32 4, i32 1), align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = volatile load i8* getelementptr inbounds (%0* @g_2, i64 0, i32 4, i32 2), align 4
  %conv15 = sext i8 %tmp14 to i32
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %conv15) nounwind
  %tmp17 = load i16* getelementptr inbounds (%0* @g_2, i64 0, i32 5, i32 0), align 4
  %conv18 = sext i16 %tmp17 to i32
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %conv18) nounwind
  %tmp20 = load i32* getelementptr inbounds (%0* @g_2, i64 0, i32 5, i32 1), align 4
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = volatile load i8* getelementptr inbounds (%0* @g_2, i64 0, i32 5, i32 2), align 4
  %conv23 = sext i8 %tmp22 to i32
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i64 0, i64 0), i32 %conv23) nounwind
  %tmp25 = load i8* getelementptr inbounds (%0* @g_2, i64 0, i32 6), align 4
  %conv26 = sext i8 %tmp25 to i32
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str10, i64 0, i64 0), i32 %conv26) nounwind
  %tmp28 = volatile load i32* getelementptr inbounds (%0* @g_2, i64 0, i32 7), align 4
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str11, i64 0, i64 0), i32 %tmp28) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
