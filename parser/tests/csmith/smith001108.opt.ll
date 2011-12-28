; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001108.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global [6 x i8] c"\D7\D7\D7\D7\D7\D7", align 1
@g_12 = global i32 1235938667, align 4
@g_11 = global i32* @g_12, align 8
@g_32 = global i32 -1333370477, align 4
@g_42 = global i32 1258680083, align 4
@g_46 = global i32** @g_11, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_7[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_7[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_7[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_7[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_7[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_7[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_32 = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_42 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
safe_mod_func_int32_t_s_s.exit:
  %tmp5 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i64 0, i64 2), align 1
  %tmp61.i = load i32** @g_11, align 8
  store i32 0, i32* %tmp61.i, align 4
  %tmp62.i = load i32** @g_11, align 8
  store i32 -1, i32* %tmp62.i, align 4
  store i32 0, i32* @g_32, align 4
  store i32 0, i32* @g_12, align 4
  br label %for.body

for.body:                                         ; preds = %safe_mod_func_int32_t_s_s.exit, %for.body
  %tmp47 = phi i32 [ 0, %safe_mod_func_int32_t_s_s.exit ], [ %add, %for.body ]
  %tmp30 = volatile load i32*** @g_46, align 8
  store i32* @g_42, i32** %tmp30, align 8
  %rem = urem i32 %tmp47, 6
  %idxprom = zext i32 %rem to i64
  %arrayidx = getelementptr inbounds [6 x i8]* @g_7, i64 0, i64 %idxprom
  %tmp32 = volatile load i8* %arrayidx, align 1
  store i32 0, i32* @g_32, align 4
  %add = add nsw i32 %tmp47, 2
  store i32 %add, i32* @g_12, align 4
  %cmp26 = icmp slt i32 %add, 6
  br i1 %cmp26, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %tmp48 = load i32* @g_42, align 4
  ret i32 %tmp48
}

define i32 @func_8(i32 %p_9, i32 %p_10) nounwind uwtable {
entry:
  %tmp61 = load i32** @g_11, align 8
  store i32 0, i32* %tmp61, align 4
  %tmp62 = load i32** @g_11, align 8
  store i32 -1, i32* %tmp62, align 4
  %tmp63 = load i32** @g_11, align 8
  %tmp64 = load i32* %tmp63, align 4
  ret i32 %tmp64
}

define i32 @func_22(i32* nocapture %p_23, i32 %p_24, i64 %p_25, i32 %p_26, i32 %p_27) nounwind uwtable {
for.end27:
  %or31 = or i32 %p_26, 1
  ret i32 %or31
}

define i32 @func_38(i16 zeroext %p_39, i32 %p_40) nounwind uwtable readnone {
entry:
  ret i32 1612483923
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp5.i = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i64 0, i64 2), align 1
  %tmp61.i.i = load i32** @g_11, align 8
  store i32 0, i32* %tmp61.i.i, align 4
  %tmp62.i.i = load i32** @g_11, align 8
  store i32 -1, i32* %tmp62.i.i, align 4
  %tmp30.i = volatile load i32*** @g_46, align 8
  store i32* @g_42, i32** %tmp30.i, align 8
  %tmp32.i = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i64 0, i64 0), align 1
  %tmp30.i.1 = volatile load i32*** @g_46, align 8
  store i32* @g_42, i32** %tmp30.i.1, align 8
  %tmp32.i.1 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i64 0, i64 2), align 1
  %tmp30.i.2 = volatile load i32*** @g_46, align 8
  store i32* @g_42, i32** %tmp30.i.2, align 8
  %tmp32.i.2 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i64 0, i64 4), align 1
  store i32 6, i32* @g_12, align 4
  store i32 0, i32* @g_32, align 4
  %tmp = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i64 0, i64 0), align 1
  %conv = sext i8 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i64 0, i64 1), align 1
  %conv3 = sext i8 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i64 0, i64 2), align 1
  %conv6 = sext i8 %tmp5 to i32
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %conv6) nounwind
  %tmp8 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i64 0, i64 3), align 1
  %conv9 = sext i8 %tmp8 to i32
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %conv9) nounwind
  %tmp11 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i64 0, i64 4), align 1
  %conv12 = sext i8 %tmp11 to i32
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %conv12) nounwind
  %tmp14 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i64 0, i64 5), align 1
  %conv15 = sext i8 %tmp14 to i32
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %conv15) nounwind
  %tmp17 = volatile load i8* getelementptr inbounds ([6 x i8]* @g_7, i64 0, i64 2), align 1
  %conv18 = sext i8 %tmp17 to i32
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %conv18) nounwind
  %tmp20 = load i32* @g_12, align 4
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* @g_32, align 4
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* @g_42, align 4
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i64 0, i64 0), i32 %tmp24) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
