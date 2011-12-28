; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001134.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i8, i32, i8, i16, i32, i32 }

@g_2 = global i32 -387616869, align 4
@g_5 = global %struct.S0 { i8 -97, i32 37671261, i8 7, i16 1, i32 0, i32 -804944457 }, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_5.f0 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5.f1 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5.f2 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5.f3 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5.f4 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5.f5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S0* nocapture sret %agg.result) nounwind uwtable {
return:
  store i32 0, i32* @g_2, align 4
  %tmp2 = getelementptr inbounds %struct.S0* %agg.result, i64 0, i32 0
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 0), i64 20, i32 4, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 0, i32* @g_2, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  %tmp2 = load i8* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 0), align 4
  %conv = zext i8 %tmp2 to i32
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %conv) nounwind
  %tmp4 = load i32* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 1), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i8* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 2), align 4
  %conv7 = zext i8 %tmp6 to i32
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %conv7) nounwind
  %tmp9 = load i16* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 3), align 2
  %conv10 = sext i16 %tmp9 to i32
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %conv10) nounwind
  %tmp12 = load i32* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 4), align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds (%struct.S0* @g_5, i64 0, i32 5), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %tmp14) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
