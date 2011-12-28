; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001266.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 1, align 4
@g_17 = global i32 -336830778, align 4
@g_25 = global [2 x [5 x [4 x i32]]] [[5 x [4 x i32]] [[4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902]], [5 x [4 x i32]] [[4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902], [4 x i32] [i32 1301409902, i32 1301409902, i32 1301409902, i32 1301409902]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_17 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][0][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][0][1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][0][2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][0][3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][2][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][2][1] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][2][2] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][2][3] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][3][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][3][1] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][3][2] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][3][3] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][4][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][4][1] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][4][2] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [29 x i8] c"checksum g_25[0][4][3] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][0][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][0][1] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][0][2] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][0][3] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][1][0] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][1][1] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][1][2] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][1][3] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][2][0] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][2][1] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][2][2] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][2][3] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][3][0] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][3][1] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][3][2] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][3][3] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][4][0] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][4][1] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][4][2] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [29 x i8] c"checksum g_25[1][4][3] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  volatile store i32 18, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp276 = phi i32 [ %or, %for.inc ], [ 1884241230, %entry ]
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp slt i32 %tmp, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %or = or i32 %tmp276, -1929245742
  %tmp3 = volatile load i32* @g_2, align 4
  %tobool = icmp eq i32 %tmp3, 0
  br i1 %tobool, label %for.inc, label %for.end

for.inc:                                          ; preds = %for.body
  %tmp4 = volatile load i32* @g_2, align 4
  %add.i = add i32 %tmp4, 1
  volatile store i32 %add.i, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.body, %for.cond
  %tmp275 = phi i32 [ %or, %for.body ], [ %tmp276, %for.cond ]
  %sext = mul i32 %tmp275, 446431232
  %conv11 = ashr exact i32 %sext, 16
  %tmp14 = volatile load i32* @g_2, align 4
  %tmp52 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 0, i64 0), align 16
  %or53 = or i32 %tmp52, %conv11
  store i32 %or53, i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 0, i64 0), align 16
  %storemerge.in.in.safe_div_func_uint8_t_u_u.exit = load i32* @g_17, align 4
  %storemerge = trunc i32 %storemerge.in.in.safe_div_func_uint8_t_u_u.exit to i8
  ret i8 %storemerge
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 18, i32* @g_2, align 4
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %tmp276.i = phi i32 [ %or.i, %for.inc.i ], [ 1884241230, %entry ]
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp slt i32 %tmp.i, 1
  br i1 %cmp.i, label %for.body.i, label %func_1.exit

for.body.i:                                       ; preds = %for.cond.i
  %or.i = or i32 %tmp276.i, -1929245742
  %tmp3.i = volatile load i32* @g_2, align 4
  %tobool.i = icmp eq i32 %tmp3.i, 0
  br i1 %tobool.i, label %for.inc.i, label %func_1.exit

for.inc.i:                                        ; preds = %for.body.i
  %tmp4.i = volatile load i32* @g_2, align 4
  %add.i.i = add i32 %tmp4.i, 1
  volatile store i32 %add.i.i, i32* @g_2, align 4
  br label %for.cond.i

func_1.exit:                                      ; preds = %for.cond.i, %for.body.i
  %tmp275.i = phi i32 [ %or.i, %for.body.i ], [ %tmp276.i, %for.cond.i ]
  %sext.i = mul i32 %tmp275.i, 446431232
  %conv11.i = ashr exact i32 %sext.i, 16
  %tmp14.i = volatile load i32* @g_2, align 4
  %tmp52.i = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 0, i64 0), align 16
  %or53.i = or i32 %tmp52.i, %conv11.i
  store i32 %or53.i, i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 0, i64 0), align 16
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_17, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 0, i64 0), align 16
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 0, i64 1), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 0, i64 2), align 8
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 0, i64 3), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 1, i64 0), align 16
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 1, i64 1), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 1, i64 2), align 8
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 1, i64 3), align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 2, i64 0), align 16
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 2, i64 1), align 4
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str11, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 2, i64 2), align 8
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str12, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 2, i64 3), align 4
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str13, i64 0, i64 0), i32 %tmp26) nounwind
  %tmp28 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 3, i64 0), align 16
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str14, i64 0, i64 0), i32 %tmp28) nounwind
  %tmp30 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 3, i64 1), align 4
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str15, i64 0, i64 0), i32 %tmp30) nounwind
  %tmp32 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 3, i64 2), align 8
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str16, i64 0, i64 0), i32 %tmp32) nounwind
  %tmp34 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 3, i64 3), align 4
  %call35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str17, i64 0, i64 0), i32 %tmp34) nounwind
  %tmp36 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 4, i64 0), align 16
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str18, i64 0, i64 0), i32 %tmp36) nounwind
  %tmp38 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 4, i64 1), align 4
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str19, i64 0, i64 0), i32 %tmp38) nounwind
  %tmp40 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 4, i64 2), align 8
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str20, i64 0, i64 0), i32 %tmp40) nounwind
  %tmp42 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 4, i64 3), align 4
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str21, i64 0, i64 0), i32 %tmp42) nounwind
  %tmp44 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 0, i64 0), align 16
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str22, i64 0, i64 0), i32 %tmp44) nounwind
  %tmp46 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 0, i64 1), align 4
  %call47 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str23, i64 0, i64 0), i32 %tmp46) nounwind
  %tmp48 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 0, i64 2), align 8
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str24, i64 0, i64 0), i32 %tmp48) nounwind
  %tmp50 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 0, i64 3), align 4
  %call51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str25, i64 0, i64 0), i32 %tmp50) nounwind
  %tmp52 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 1, i64 0), align 16
  %call53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str26, i64 0, i64 0), i32 %tmp52) nounwind
  %tmp54 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 1, i64 1), align 4
  %call55 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str27, i64 0, i64 0), i32 %tmp54) nounwind
  %tmp56 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 1, i64 2), align 8
  %call57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str28, i64 0, i64 0), i32 %tmp56) nounwind
  %tmp58 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 1, i64 3), align 4
  %call59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str29, i64 0, i64 0), i32 %tmp58) nounwind
  %tmp60 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 2, i64 0), align 16
  %call61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str30, i64 0, i64 0), i32 %tmp60) nounwind
  %tmp62 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 2, i64 1), align 4
  %call63 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str31, i64 0, i64 0), i32 %tmp62) nounwind
  %tmp64 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 2, i64 2), align 8
  %call65 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str32, i64 0, i64 0), i32 %tmp64) nounwind
  %tmp66 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 2, i64 3), align 4
  %call67 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str33, i64 0, i64 0), i32 %tmp66) nounwind
  %tmp68 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 3, i64 0), align 16
  %call69 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str34, i64 0, i64 0), i32 %tmp68) nounwind
  %tmp70 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 3, i64 1), align 4
  %call71 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str35, i64 0, i64 0), i32 %tmp70) nounwind
  %tmp72 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 3, i64 2), align 8
  %call73 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str36, i64 0, i64 0), i32 %tmp72) nounwind
  %tmp74 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 3, i64 3), align 4
  %call75 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str37, i64 0, i64 0), i32 %tmp74) nounwind
  %tmp76 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 4, i64 0), align 16
  %call77 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str38, i64 0, i64 0), i32 %tmp76) nounwind
  %tmp78 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 4, i64 1), align 4
  %call79 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str39, i64 0, i64 0), i32 %tmp78) nounwind
  %tmp80 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 4, i64 2), align 8
  %call81 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str40, i64 0, i64 0), i32 %tmp80) nounwind
  %tmp82 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 1, i64 4, i64 3), align 4
  %call83 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str41, i64 0, i64 0), i32 %tmp82) nounwind
  %tmp84 = load i32* getelementptr inbounds ([2 x [5 x [4 x i32]]]* @g_25, i64 0, i64 0, i64 0, i64 0), align 16
  %call85 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i64 0, i64 0), i32 %tmp84) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
