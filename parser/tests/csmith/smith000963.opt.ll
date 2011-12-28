; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000963.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i32 }

@g_3 = global [2 x i32] [i32 -1, i32 -1], align 4
@g_2 = global [5 x [10 x i32*]] [[10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)], [10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)], [10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)], [10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)], [10 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([2 x i32]* @g_3 to i8*), i64 4) to i32*)]], align 16
@g_7 = constant %struct.S0 { i32 -1180962629 }, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_3[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_3[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_7.f0 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable readnone {
entry:
  ret i32 -1180962629
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp = volatile load i32* getelementptr inbounds ([2 x i32]* @g_3, i64 0, i64 0), align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* getelementptr inbounds ([2 x i32]* @g_3, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([2 x i32]* @g_3, i64 0, i64 1), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* getelementptr inbounds (%struct.S0* @g_7, i64 0, i32 0), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp6) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
