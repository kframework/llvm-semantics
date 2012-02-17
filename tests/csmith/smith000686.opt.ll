; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000686.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i16 0, align 2
@g_3 = global i16 -1, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i16* @g_2, align 2
  %tmp1 = load i16* @g_3, align 2
  %tobool = icmp eq i16 %tmp, %tmp1
  br i1 %tobool, label %land.end, label %land.rhs

land.rhs:                                         ; preds = %entry
  %and = and i16 %tmp1, 7
  %tobool5 = icmp ne i16 %and, 0
  br label %land.end

land.end:                                         ; preds = %entry, %land.rhs
  %0 = phi i1 [ false, %entry ], [ %tobool5, %land.rhs ]
  %conv7 = zext i1 %0 to i16
  ret i16 %conv7
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i16* @g_2, align 2
  %tmp = volatile load i16* @g_2, align 2
  %conv = zext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i16* @g_3, align 2
  %conv3 = zext i16 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
