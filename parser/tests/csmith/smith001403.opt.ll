; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001403.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -1965365047, align 4
@g_18 = global i32 0, align 4
@g_19 = global i32* null, align 8
@g_21 = global i32 -1137368052, align 4
@g_23 = global i32 0, align 4
@g_22 = global i32* @g_23, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_21 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_23 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %tmp = load i32* @g_4, align 4
  %conv = trunc i32 %tmp to i8
  %mul.i = mul i8 %conv, %conv
  %cmp = icmp slt i8 %mul.i, 1
  br i1 %cmp, label %lor.end15, label %lor.rhs8

lor.rhs8:                                         ; preds = %entry
  %tmp10 = load i32* @g_21, align 4
  %conv11 = trunc i32 %tmp10 to i16
  %tmp.i.i = load i32* @g_18, align 4
  %0 = or i32 %tmp.i.i, %tmp
  %1 = icmp eq i32 %0, 0
  %cond.i.i = select i1 %1, i16 %conv11, i16 0
  %shl.i.i = shl i16 %cond.i.i, 8
  %cmp3.i.i = icmp ugt i16 %cond.i.i, 255
  %conv.shl.i.i = select i1 %cmp3.i.i, i16 %cond.i.i, i16 %shl.i.i
  %conv9.i = zext i16 %conv.shl.i.i to i32
  %or.i = or i32 %conv9.i, %tmp10
  store i32 %or.i, i32* @g_21, align 4
  br label %lor.end15

lor.end15:                                        ; preds = %lor.rhs8, %entry
  %tmp21 = volatile load i32** @g_22, align 8
  %tmp22 = load i32* %tmp21, align 4
  %or = or i32 %tmp22, 1
  store i32 %or, i32* %tmp21, align 4
  %tmp23 = load i32* @g_21, align 4
  %conv24 = trunc i32 %tmp23 to i8
  ret i8 %conv24
}

define i32 @func_8(i16 signext %p_9) nounwind uwtable {
entry:
  %tmp1 = load i32* @g_4, align 4
  %tobool = icmp eq i32 %tmp1, 0
  br i1 %tobool, label %lor.end, label %lor.end.thread

lor.end.thread:                                   ; preds = %entry
  br label %cond.false.i

lor.end:                                          ; preds = %entry
  %tmp.i = load i32* @g_18, align 4
  %tobool3 = icmp eq i32 %tmp.i, 0
  br i1 %tobool3, label %safe_mod_func_int16_t_s_s.exit, label %cond.false.i

cond.false.i:                                     ; preds = %lor.end, %lor.end.thread
  br label %safe_mod_func_int16_t_s_s.exit

safe_mod_func_int16_t_s_s.exit:                   ; preds = %lor.end, %cond.false.i
  %cond.i = phi i16 [ 0, %cond.false.i ], [ %p_9, %lor.end ]
  %shl.i = shl i16 %cond.i, 8
  %cmp3.i = icmp ugt i16 %cond.i, 255
  %conv.shl.i = select i1 %cmp3.i, i16 %cond.i, i16 %shl.i
  %conv9 = zext i16 %conv.shl.i to i32
  %tmp11 = load i32* @g_21, align 4
  %or = or i32 %conv9, %tmp11
  store i32 %or, i32* @g_21, align 4
  ret i32 %or
}

define i32 @func_16(i8 zeroext %p_17) nounwind uwtable readonly {
entry:
  %tmp = load i32* @g_18, align 4
  ret i32 %tmp
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = load i32* @g_4, align 4
  %conv.i = trunc i32 %tmp.i to i8
  %mul.i.i = mul i8 %conv.i, %conv.i
  %cmp.i = icmp slt i8 %mul.i.i, 1
  br i1 %cmp.i, label %func_1.exit, label %lor.rhs8.i

lor.rhs8.i:                                       ; preds = %entry
  %tmp10.i = load i32* @g_21, align 4
  %conv11.i = trunc i32 %tmp10.i to i16
  %tmp.i.i.i = load i32* @g_18, align 4
  %0 = or i32 %tmp.i.i.i, %tmp.i
  %1 = icmp eq i32 %0, 0
  %cond.i.i.i = select i1 %1, i16 %conv11.i, i16 0
  %shl.i.i.i = shl i16 %cond.i.i.i, 8
  %cmp3.i.i.i = icmp ugt i16 %cond.i.i.i, 255
  %conv.shl.i.i.i = select i1 %cmp3.i.i.i, i16 %cond.i.i.i, i16 %shl.i.i.i
  %conv9.i.i = zext i16 %conv.shl.i.i.i to i32
  %or.i.i = or i32 %conv9.i.i, %tmp10.i
  store i32 %or.i.i, i32* @g_21, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %lor.rhs8.i
  %tmp21.i = volatile load i32** @g_22, align 8
  %tmp22.i = load i32* %tmp21.i, align 4
  %or.i = or i32 %tmp22.i, 1
  store i32 %or.i, i32* %tmp21.i, align 4
  %tmp = load i32* @g_4, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_18, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_21, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* @g_23, align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
