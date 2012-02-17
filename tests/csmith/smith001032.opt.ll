; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001032.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 245849238, align 4
@g_14 = global [4 x [5 x i32]] [[5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4], [5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4], [5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4], [5 x i32] [i32 4, i32 4, i32 4, i32 4, i32 4]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_14[0][4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [26 x i8] c"checksum g_14[1][4] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][1] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][2] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][3] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [26 x i8] c"checksum g_14[2][4] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][1] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][2] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][3] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [26 x i8] c"checksum g_14[3][4] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  volatile store i32 15, i32* @g_2, align 4
  %tmp10 = volatile load i32* @g_2, align 4
  %cmp11 = icmp eq i32 %tmp10, 3
  br i1 %cmp11, label %safe_lshift_func_uint16_t_u_u.exit, label %for.end

safe_lshift_func_uint16_t_u_u.exit:               ; preds = %entry, %safe_lshift_func_uint16_t_u_u.exit
  %tmp44 = volatile load i32* @g_2, align 4
  %sub.i = shl i32 %tmp44, 24
  %sext = add i32 %sub.i, -16777216
  %conv47 = ashr exact i32 %sext, 24
  volatile store i32 %conv47, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp eq i32 %tmp, 3
  br i1 %cmp, label %safe_lshift_func_uint16_t_u_u.exit, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %safe_lshift_func_uint16_t_u_u.exit
  store i32 1, i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 3, i64 4), align 4
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %entry
  %tmp48 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 0, i64 1), align 4
  %conv49 = trunc i32 %tmp48 to i16
  ret i16 %conv49
}

define i32 @func_17(i32 %p_18, i32 %p_19, i8 zeroext %p_20, i8 zeroext %p_21, i8 signext %p_22) nounwind uwtable readonly {
entry:
  %tmp = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 2, i64 2), align 8
  ret i32 %tmp
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 15, i32* @g_2, align 4
  %tmp10.i = volatile load i32* @g_2, align 4
  %cmp11.i = icmp eq i32 %tmp10.i, 3
  br i1 %cmp11.i, label %safe_lshift_func_uint16_t_u_u.exit.i, label %func_1.exit

safe_lshift_func_uint16_t_u_u.exit.i:             ; preds = %entry, %safe_lshift_func_uint16_t_u_u.exit.i
  %tmp44.i = volatile load i32* @g_2, align 4
  %sub.i.i = shl i32 %tmp44.i, 24
  %sext.i = add i32 %sub.i.i, -16777216
  %conv47.i = ashr exact i32 %sext.i, 24
  volatile store i32 %conv47.i, i32* @g_2, align 4
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp eq i32 %tmp.i, 3
  br i1 %cmp.i, label %safe_lshift_func_uint16_t_u_u.exit.i, label %for.cond.for.end_crit_edge.i

for.cond.for.end_crit_edge.i:                     ; preds = %safe_lshift_func_uint16_t_u_u.exit.i
  store i32 1, i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 3, i64 4), align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.cond.for.end_crit_edge.i
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 0, i64 0), align 16
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 0, i64 1), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 0, i64 2), align 8
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 0, i64 3), align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 0, i64 4), align 16
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 1, i64 0), align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 1, i64 1), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 1, i64 2), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 1, i64 3), align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 1, i64 4), align 4
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 2, i64 0), align 8
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str11, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 2, i64 1), align 4
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str12, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 2, i64 2), align 8
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str13, i64 0, i64 0), i32 %tmp26) nounwind
  %tmp28 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 2, i64 3), align 4
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str14, i64 0, i64 0), i32 %tmp28) nounwind
  %tmp30 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 2, i64 4), align 8
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str15, i64 0, i64 0), i32 %tmp30) nounwind
  %tmp32 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 3, i64 0), align 4
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str16, i64 0, i64 0), i32 %tmp32) nounwind
  %tmp34 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 3, i64 1), align 4
  %call35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str17, i64 0, i64 0), i32 %tmp34) nounwind
  %tmp36 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 3, i64 2), align 4
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str18, i64 0, i64 0), i32 %tmp36) nounwind
  %tmp38 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 3, i64 3), align 4
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str19, i64 0, i64 0), i32 %tmp38) nounwind
  %tmp40 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 3, i64 4), align 4
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str20, i64 0, i64 0), i32 %tmp40) nounwind
  %tmp42 = load i32* getelementptr inbounds ([4 x [5 x i32]]* @g_14, i64 0, i64 2, i64 2), align 8
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str13, i64 0, i64 0), i32 %tmp42) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
