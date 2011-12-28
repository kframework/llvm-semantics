; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001850.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_9 = global [8 x [6 x i32]] [[6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220], [6 x i32] [i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220, i32 716962220]], align 16
@g_12 = global i32* @g_2, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_9[0][5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][2] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][3] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][4] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_9[1][5] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][1] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][2] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][3] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][4] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_9[2][5] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][1] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][2] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][3] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][4] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [25 x i8] c"checksum g_9[3][5] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][0] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][1] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][2] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][3] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][4] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [25 x i8] c"checksum g_9[4][5] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][0] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][1] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][2] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][3] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][4] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"checksum g_9[5][5] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][0] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][1] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][2] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][3] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][4] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [25 x i8] c"checksum g_9[6][5] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][0] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][1] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][2] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][3] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][4] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [25 x i8] c"checksum g_9[7][5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca [4 x i32], align 16
  %l_511 = bitcast [4 x i32]* %l_5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %l_511, i8 -1, i64 16, i32 16, i1 false)
  store i32 -21, i32* @g_2, align 4
  %tmp21 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 5, i64 1), align 4
  %tobool = icmp eq i32 %tmp21, 0
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %entry, %for.inc32
  br i1 %tobool, label %for.cond9.us, label %for.inc32.thread

for.cond9.us:                                     ; preds = %for.cond9.preheader, %if.end.us
  %indvar = phi i32 [ %indvar.next, %if.end.us ], [ 0, %for.cond9.preheader ]
  %tmp = shl i32 %indvar, 1
  %conv.i.us18 = or i32 %tmp, 1
  %cmp11.us = icmp slt i32 %conv.i.us18, 4
  br i1 %cmp11.us, label %if.end.us, label %for.inc32

if.end.us:                                        ; preds = %for.cond9.us
  store i32 1, i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 1, i64 4), align 8
  %indvar.next = add i32 %indvar, 1
  br label %for.cond9.us

for.inc32.thread:                                 ; preds = %for.cond9.preheader
  store i32 1, i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 1, i64 4), align 8
  br label %for.end37

for.inc32:                                        ; preds = %for.cond9.us
  %phitmp.mask = and i32 %conv.i.us18, 255
  %cmp5 = icmp eq i32 %phitmp.mask, 1
  br i1 %cmp5, label %for.end37, label %for.cond9.preheader

for.end37:                                        ; preds = %for.inc32.thread, %for.inc32
  store i32 0, i32* @g_2, align 4
  %tmp38 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 1, i64 4), align 8
  %tmp39 = volatile load i32** @g_12, align 8
  %tmp40 = load i32* %tmp39, align 4
  %or = or i32 %tmp40, %tmp38
  store i32 %or, i32* %tmp39, align 4
  %tmp41 = load i32* @g_2, align 4
  %conv42 = trunc i32 %tmp41 to i16
  ret i16 %conv42
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_5.i = alloca [4 x i32], align 16
  %0 = bitcast [4 x i32]* %l_5.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  call void @llvm.memset.p0i8.i64(i8* %0, i8 -1, i64 16, i32 16, i1 false) nounwind
  store i32 -21, i32* @g_2, align 4
  %tmp21.i = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 5, i64 1), align 4
  %tobool.i = icmp eq i32 %tmp21.i, 0
  br i1 %tobool.i, label %for.cond9.us.i.preheader, label %func_1.exit

for.cond9.us.i.preheader:                         ; preds = %for.cond9.us.i.preheader, %entry
  store i32 1, i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 1, i64 4), align 8
  br label %for.cond9.us.i.preheader

func_1.exit:                                      ; preds = %entry
  store i32 1, i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 1, i64 4), align 8
  store i32 0, i32* @g_2, align 4
  %tmp39.i = volatile load i32** @g_12, align 8
  %tmp40.i = load i32* %tmp39.i, align 4
  %or.i = or i32 %tmp40.i, 1
  store i32 %or.i, i32* %tmp39.i, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 0, i64 0), align 16
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 0, i64 2), align 8
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 0, i64 3), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 0, i64 4), align 16
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 0, i64 5), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 1, i64 0), align 8
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 1, i64 1), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 1, i64 2), align 8
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 1, i64 3), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 1, i64 4), align 8
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 1, i64 5), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 2, i64 0), align 16
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i64 0, i64 0), i32 %tmp26) nounwind
  %tmp28 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 2, i64 1), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i64 0, i64 0), i32 %tmp28) nounwind
  %tmp30 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 2, i64 2), align 8
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i64 0, i64 0), i32 %tmp30) nounwind
  %tmp32 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 2, i64 3), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i64 0, i64 0), i32 %tmp32) nounwind
  %tmp34 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 2, i64 4), align 16
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i64 0, i64 0), i32 %tmp34) nounwind
  %tmp36 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 2, i64 5), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i64 0, i64 0), i32 %tmp36) nounwind
  %tmp38 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 3, i64 0), align 8
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i64 0, i64 0), i32 %tmp38) nounwind
  %tmp40 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 3, i64 1), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i64 0, i64 0), i32 %tmp40) nounwind
  %tmp42 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 3, i64 2), align 8
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i64 0, i64 0), i32 %tmp42) nounwind
  %tmp44 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 3, i64 3), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i64 0, i64 0), i32 %tmp44) nounwind
  %tmp46 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 3, i64 4), align 8
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i64 0, i64 0), i32 %tmp46) nounwind
  %tmp48 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 3, i64 5), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i64 0, i64 0), i32 %tmp48) nounwind
  %tmp50 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 4, i64 0), align 16
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str25, i64 0, i64 0), i32 %tmp50) nounwind
  %tmp52 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 4, i64 1), align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i64 0, i64 0), i32 %tmp52) nounwind
  %tmp54 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 4, i64 2), align 8
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str27, i64 0, i64 0), i32 %tmp54) nounwind
  %tmp56 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 4, i64 3), align 4
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str28, i64 0, i64 0), i32 %tmp56) nounwind
  %tmp58 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 4, i64 4), align 16
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str29, i64 0, i64 0), i32 %tmp58) nounwind
  %tmp60 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 4, i64 5), align 4
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str30, i64 0, i64 0), i32 %tmp60) nounwind
  %tmp62 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 5, i64 0), align 8
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i64 0, i64 0), i32 %tmp62) nounwind
  %tmp64 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 5, i64 1), align 4
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str32, i64 0, i64 0), i32 %tmp64) nounwind
  %tmp66 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 5, i64 2), align 8
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str33, i64 0, i64 0), i32 %tmp66) nounwind
  %tmp68 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 5, i64 3), align 4
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str34, i64 0, i64 0), i32 %tmp68) nounwind
  %tmp70 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 5, i64 4), align 8
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str35, i64 0, i64 0), i32 %tmp70) nounwind
  %tmp72 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 5, i64 5), align 4
  %call73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i64 0, i64 0), i32 %tmp72) nounwind
  %tmp74 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 6, i64 0), align 16
  %call75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str37, i64 0, i64 0), i32 %tmp74) nounwind
  %tmp76 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 6, i64 1), align 4
  %call77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str38, i64 0, i64 0), i32 %tmp76) nounwind
  %tmp78 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 6, i64 2), align 8
  %call79 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str39, i64 0, i64 0), i32 %tmp78) nounwind
  %tmp80 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 6, i64 3), align 4
  %call81 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i64 0, i64 0), i32 %tmp80) nounwind
  %tmp82 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 6, i64 4), align 16
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str41, i64 0, i64 0), i32 %tmp82) nounwind
  %tmp84 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 6, i64 5), align 4
  %call85 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str42, i64 0, i64 0), i32 %tmp84) nounwind
  %tmp86 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 7, i64 0), align 8
  %call87 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str43, i64 0, i64 0), i32 %tmp86) nounwind
  %tmp88 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 7, i64 1), align 4
  %call89 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str44, i64 0, i64 0), i32 %tmp88) nounwind
  %tmp90 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 7, i64 2), align 8
  %call91 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str45, i64 0, i64 0), i32 %tmp90) nounwind
  %tmp92 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 7, i64 3), align 4
  %call93 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str46, i64 0, i64 0), i32 %tmp92) nounwind
  %tmp94 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 7, i64 4), align 8
  %call95 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str47, i64 0, i64 0), i32 %tmp94) nounwind
  %tmp96 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 7, i64 5), align 4
  %call97 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str48, i64 0, i64 0), i32 %tmp96) nounwind
  %tmp98 = load i32* getelementptr inbounds ([8 x [6 x i32]]* @g_9, i64 0, i64 1, i64 4), align 8
  %call99 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i64 0, i64 0), i32 %tmp98) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
