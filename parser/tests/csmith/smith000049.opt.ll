; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000049.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = constant i8 9, align 1
@g_16 = global [9 x [1 x i32]] [[1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1], [1 x i32] [i32 1]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_16[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_16[1][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_16[2][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_16[3][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_16[4][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_16[5][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_16[6][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_16[7][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"checksum g_16[8][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %tmp64 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 6, i64 0), align 8
  %and65 = and i32 %tmp64, 1
  store i32 %and65, i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 6, i64 0), align 8
  ret i32 %and65
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp64.i = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 6, i64 0), align 8
  %and65.i = and i32 %tmp64.i, 1
  store i32 %and65.i, i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 6, i64 0), align 8
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 9) nounwind
  %tmp = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 0, i64 0), align 16
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i32 %tmp) nounwind
  %tmp3 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 1, i64 0), align 4
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i64 0, i64 0), i32 %tmp3) nounwind
  %tmp5 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 2, i64 0), align 8
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i64 0, i64 0), i32 %tmp5) nounwind
  %tmp7 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 3, i64 0), align 4
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i64 0, i64 0), i32 %tmp7) nounwind
  %tmp9 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 4, i64 0), align 16
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i64 0, i64 0), i32 %tmp9) nounwind
  %tmp11 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 5, i64 0), align 4
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i64 0, i64 0), i32 %tmp11) nounwind
  %tmp13 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 6, i64 0), align 8
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i64 0, i64 0), i32 %tmp13) nounwind
  %tmp15 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 7, i64 0), align 4
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i32 %tmp15) nounwind
  %tmp17 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 8, i64 0), align 16
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i64 0, i64 0), i32 %tmp17) nounwind
  %tmp19 = load i32* getelementptr inbounds ([9 x [1 x i32]]* @g_16, i64 0, i64 6, i64 0), align 8
  %call20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i64 0, i64 0), i32 %tmp19) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
