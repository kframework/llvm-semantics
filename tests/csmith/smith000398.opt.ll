; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000398.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [2 x [10 x i32]] [[10 x i32] [i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566], [10 x i32] [i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566, i32 1171111566]], align 16
@g_11 = global i32 -230779952, align 4
@g_22 = global i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 1), align 8
@g_23 = global [3 x i32] [i32 845166746, i32 845166746, i32 845166746], align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_3[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][8] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][9] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][1] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][2] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][3] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][4] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][5] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][6] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][7] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][8] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][9] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [23 x i8] c"checksum g_23[0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [23 x i8] c"checksum g_23[1] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [23 x i8] c"checksum g_23[2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
lbl_35:
  %tmp1 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 6), align 8
  %xor = xor i32 %tmp1, 992394718
  store i32 %xor, i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 6), align 8
  %sub.i = sub i32 0, %xor
  %cmp = icmp eq i32 %xor, %sub.i
  br i1 %cmp, label %land.rhs, label %if.end

land.rhs:                                         ; preds = %lbl_35
  %tobool = icmp eq i32 %tmp1, 992394718
  br i1 %tobool, label %lor.rhs, label %if.end

lor.rhs:                                          ; preds = %land.rhs
  br label %if.end

if.end:                                           ; preds = %lbl_35, %land.rhs, %lor.rhs
  %0 = phi i32 [ 0, %lbl_35 ], [ 1, %land.rhs ], [ 0, %lor.rhs ]
  %tmp12 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 0, i64 7), align 4
  %conv13 = trunc i32 %tmp12 to i16
  %1 = urem i16 %conv13, 24290
  %conv17 = zext i16 %1 to i32
  %cmp18 = icmp ne i32 %0, %conv17
  %conv19 = zext i1 %cmp18 to i32
  store i32 %conv19, i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 6), align 8
  store i32 0, i32* @g_11, align 4
  store i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 6), i32** @g_22, align 8
  ret i32 %conv19
}

define i32* @func_9(i32* %p_10) nounwind uwtable {
return:
  store i32 0, i32* @g_11, align 4
  ret i32* %p_10
}

define noalias i32* @func_16(i32 %p_17, i32 %p_18, i32* nocapture %p_19) nounwind uwtable readnone {
entry:
  %p_18.addr = alloca i32, align 4
  ret i32* %p_18.addr
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp1.i = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 6), align 8
  %xor.i = xor i32 %tmp1.i, 992394718
  store i32 %xor.i, i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 6), align 8
  %sub.i.i = sub i32 0, %xor.i
  %cmp.i = icmp eq i32 %xor.i, %sub.i.i
  br i1 %cmp.i, label %land.rhs.i, label %func_1.exit

land.rhs.i:                                       ; preds = %entry
  %tobool.i = icmp eq i32 %tmp1.i, 992394718
  br i1 %tobool.i, label %lor.rhs.i, label %func_1.exit

lor.rhs.i:                                        ; preds = %land.rhs.i
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %land.rhs.i, %lor.rhs.i
  %0 = phi i32 [ 0, %entry ], [ 1, %land.rhs.i ], [ 0, %lor.rhs.i ]
  %tmp12.i = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 0, i64 7), align 4
  %conv13.i = trunc i32 %tmp12.i to i16
  %1 = urem i16 %conv13.i, 24290
  %conv17.i = zext i16 %1 to i32
  %cmp18.i = icmp ne i32 %0, %conv17.i
  %conv19.i = zext i1 %cmp18.i to i32
  store i32 %conv19.i, i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 6), align 8
  store i32 0, i32* @g_11, align 4
  store i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 6), i32** @g_22, align 8
  %tmp = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 0, i64 5), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 0, i64 6), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 0, i64 7), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 0, i64 8), align 16
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 0, i64 9), align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 0), align 8
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 1), align 4
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 2), align 8
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 3), align 4
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i64 0, i64 0), i32 %tmp26) nounwind
  %tmp28 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 4), align 8
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i64 0, i64 0), i32 %tmp28) nounwind
  %tmp30 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 5), align 4
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i64 0, i64 0), i32 %tmp30) nounwind
  %tmp32 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 6), align 8
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i64 0, i64 0), i32 %tmp32) nounwind
  %tmp34 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 7), align 4
  %call35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i64 0, i64 0), i32 %tmp34) nounwind
  %tmp36 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 8), align 8
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i64 0, i64 0), i32 %tmp36) nounwind
  %tmp38 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 9), align 4
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i64 0, i64 0), i32 %tmp38) nounwind
  %tmp40 = load i32* getelementptr inbounds ([2 x [10 x i32]]* @g_3, i64 0, i64 1, i64 6), align 8
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i64 0, i64 0), i32 %tmp40) nounwind
  %tmp42 = load i32* @g_11, align 4
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str20, i64 0, i64 0), i32 %tmp42) nounwind
  %tmp44 = volatile load i32* getelementptr inbounds ([3 x i32]* @g_23, i64 0, i64 0), align 4
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str21, i64 0, i64 0), i32 %tmp44) nounwind
  %tmp46 = volatile load i32* getelementptr inbounds ([3 x i32]* @g_23, i64 0, i64 1), align 4
  %call47 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str22, i64 0, i64 0), i32 %tmp46) nounwind
  %tmp48 = volatile load i32* getelementptr inbounds ([3 x i32]* @g_23, i64 0, i64 2), align 4
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str23, i64 0, i64 0), i32 %tmp48) nounwind
  %tmp50 = volatile load i32* getelementptr inbounds ([3 x i32]* @g_23, i64 0, i64 2), align 4
  %call51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str23, i64 0, i64 0), i32 %tmp50) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
