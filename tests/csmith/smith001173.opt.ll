; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001173.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i8 6, align 1
@g_11 = global [2 x [4 x i16]] [[4 x i16] [i16 -32556, i16 -32556, i16 -32556, i16 -32556], [4 x i16] [i16 -32556, i16 -32556, i16 -32556, i16 -32556]], align 16
@g_19 = global i32 -10, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_11[1][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_11[1][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_11[1][2] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_11[1][3] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
safe_add_func_int32_t_s_s.exit:
  %tmp = volatile load i8* @g_6, align 1
  %conv = sext i8 %tmp to i32
  %tmp26 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i64 0, i64 0, i64 3), align 2
  %conv27 = zext i16 %tmp26 to i64
  %xor = xor i64 %conv27, 2128968691002523555
  %rem.i = urem i64 1, %xor
  %conv30 = trunc i64 %rem.i to i32
  %add.i1 = add i32 %conv30, 1
  %0 = icmp ugt i32 %add.i1, 31
  %conv9.pre.i = and i32 %conv, 65535
  br i1 %0, label %safe_lshift_func_uint16_t_u_s.exit, label %lor.lhs.false3.i

lor.lhs.false3.i:                                 ; preds = %safe_add_func_int32_t_s_s.exit
  %shr.i = lshr i32 65535, %add.i1
  %cmp6.i = icmp sgt i32 %conv9.pre.i, %shr.i
  %shl.i = select i1 %cmp6.i, i32 0, i32 %add.i1
  %conv9.pre.shl.i = shl i32 %conv9.pre.i, %shl.i
  br label %safe_lshift_func_uint16_t_u_s.exit

safe_lshift_func_uint16_t_u_s.exit:               ; preds = %safe_add_func_int32_t_s_s.exit, %lor.lhs.false3.i
  %cond.i = phi i32 [ %conv9.pre.i, %safe_add_func_int32_t_s_s.exit ], [ %conv9.pre.shl.i, %lor.lhs.false3.i ]
  %conv36 = and i32 %cond.i, 65534
  %cmp39 = icmp ult i32 %conv36, 2
  %conv40 = zext i1 %cmp39 to i32
  %tmp42 = load i32* @g_19, align 4
  %or = or i32 %conv40, %tmp42
  store i32 %or, i32* @g_19, align 4
  %tmp43 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i64 0, i64 0, i64 1), align 2
  ret i16 %tmp43
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i8* @g_6, align 1
  %conv.i = sext i8 %tmp.i to i32
  %tmp26.i = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i64 0, i64 0, i64 3), align 2
  %conv27.i = zext i16 %tmp26.i to i64
  %xor.i = xor i64 %conv27.i, 2128968691002523555
  %rem.i.i = urem i64 1, %xor.i
  %conv30.i = trunc i64 %rem.i.i to i32
  %add.i1.i = add i32 %conv30.i, 1
  %0 = icmp ugt i32 %add.i1.i, 31
  %conv9.pre.i.i = and i32 %conv.i, 65535
  br i1 %0, label %func_1.exit, label %lor.lhs.false3.i.i

lor.lhs.false3.i.i:                               ; preds = %entry
  %shr.i.i = lshr i32 65535, %add.i1.i
  %cmp6.i.i = icmp sgt i32 %conv9.pre.i.i, %shr.i.i
  %shl.i.i = select i1 %cmp6.i.i, i32 0, i32 %add.i1.i
  %conv9.pre.shl.i.i = shl i32 %conv9.pre.i.i, %shl.i.i
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %lor.lhs.false3.i.i
  %cond.i.i = phi i32 [ %conv9.pre.i.i, %entry ], [ %conv9.pre.shl.i.i, %lor.lhs.false3.i.i ]
  %conv36.i = and i32 %cond.i.i, 65534
  %cmp39.i = icmp ult i32 %conv36.i, 2
  %conv40.i = zext i1 %cmp39.i to i32
  %tmp42.i = load i32* @g_19, align 4
  %or.i = or i32 %conv40.i, %tmp42.i
  store i32 %or.i, i32* @g_19, align 4
  %tmp = volatile load i8* @g_6, align 1
  %conv = sext i8 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i64 0, i64 0, i64 0), align 16
  %conv3 = zext i16 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i64 0, i64 0, i64 1), align 2
  %conv6 = zext i16 %tmp5 to i32
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i64 0, i64 0), i32 %conv6) nounwind
  %tmp8 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i64 0, i64 0, i64 2), align 4
  %conv9 = zext i16 %tmp8 to i32
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i64 0, i64 0), i32 %conv9) nounwind
  %tmp11 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i64 0, i64 0, i64 3), align 2
  %conv12 = zext i16 %tmp11 to i32
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i64 0, i64 0), i32 %conv12) nounwind
  %tmp14 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i64 0, i64 1, i64 0), align 8
  %conv15 = zext i16 %tmp14 to i32
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i64 0, i64 0), i32 %conv15) nounwind
  %tmp17 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i64 0, i64 1, i64 1), align 2
  %conv18 = zext i16 %tmp17 to i32
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i64 0, i64 0), i32 %conv18) nounwind
  %tmp20 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i64 0, i64 1, i64 2), align 4
  %conv21 = zext i16 %tmp20 to i32
  %call22 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i64 0, i64 0), i32 %conv21) nounwind
  %tmp23 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i64 0, i64 1, i64 3), align 2
  %conv24 = zext i16 %tmp23 to i32
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i32 %conv24) nounwind
  %tmp26 = load i16* getelementptr inbounds ([2 x [4 x i16]]* @g_11, i64 0, i64 0, i64 1), align 2
  %conv27 = zext i16 %tmp26 to i32
  %call28 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i64 0, i64 0), i32 %conv27) nounwind
  %tmp29 = load i32* @g_19, align 4
  %call30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str9, i64 0, i64 0), i32 %tmp29) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
