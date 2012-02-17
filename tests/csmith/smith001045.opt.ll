; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001045.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global [8 x i32] [i32 -7, i32 -7, i32 -7, i32 -7, i32 -7, i32 -7, i32 -7, i32 -7], align 16
@.str = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_4[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_4[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_4[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_4[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_4[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_4[7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  store i32 0, i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 3), align 4
  %tmp3 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 4), align 16
  %conv = trunc i32 %tmp3 to i16
  %cmp.i = icmp slt i16 %conv, 0
  %conv16.pre.i = sext i16 %conv to i32
  br i1 %cmp.i, label %safe_lshift_func_int16_t_s_s.exit, label %lor.lhs.false9.i

lor.lhs.false9.i:                                 ; preds = %entry
  %not.cmp13.i = icmp slt i16 %conv, 16384
  %shl.i = zext i1 %not.cmp13.i to i32
  %conv16.pre.shl.i = shl i32 %conv16.pre.i, %shl.i
  br label %safe_lshift_func_int16_t_s_s.exit

safe_lshift_func_int16_t_s_s.exit:                ; preds = %entry, %lor.lhs.false9.i
  %cond.i = phi i32 [ %conv16.pre.i, %entry ], [ %conv16.pre.shl.i, %lor.lhs.false9.i ]
  %sext = shl i32 %cond.i, 24
  %conv9 = ashr exact i32 %sext, 24
  store i32 %conv9, i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 3), align 4
  %conv13 = trunc i32 %conv9 to i16
  ret i16 %conv13
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 0, i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 3), align 4
  %tmp3.i = load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 4), align 16
  %conv.i = trunc i32 %tmp3.i to i16
  %cmp.i.i = icmp slt i16 %conv.i, 0
  %conv16.pre.i.i = sext i16 %conv.i to i32
  br i1 %cmp.i.i, label %func_1.exit, label %lor.lhs.false9.i.i

lor.lhs.false9.i.i:                               ; preds = %entry
  %not.cmp13.i.i = icmp slt i16 %conv.i, 16384
  %shl.i.i = zext i1 %not.cmp13.i.i to i32
  %conv16.pre.shl.i.i = shl i32 %conv16.pre.i.i, %shl.i.i
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %lor.lhs.false9.i.i
  %cond.i.i = phi i32 [ %conv16.pre.i.i, %entry ], [ %conv16.pre.shl.i.i, %lor.lhs.false9.i.i ]
  %sext.i = shl i32 %cond.i.i, 24
  %conv9.i = ashr exact i32 %sext.i, 24
  store i32 %conv9.i, i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 3), align 4
  %tmp = load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 5), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 6), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 7), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([8 x i32]* @g_4, i64 0, i64 3), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp16) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
