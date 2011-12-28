; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000477.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i16, i32 }

@g_2 = global %struct.S0 { i16 1, i32 0 }, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2.f0 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2.f1 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable readonly {
entry:
  %0 = load i64* bitcast (%struct.S0* @g_2 to i64*), align 8
  ret i64 %0
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp = load i16* getelementptr inbounds (%struct.S0* @g_2, i64 0, i32 0), align 8
  %conv = zext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i32* getelementptr inbounds (%struct.S0* @g_2, i64 0, i32 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
