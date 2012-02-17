; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001815.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_14 = global [6 x i16] [i16 8, i16 8, i16 8, i16 8, i16 8, i16 8], align 2
@g_22 = global i32 910736786, align 4
@g_21 = global i32* @g_22, align 8
@g_51 = global i8 -50, align 1
@.str = private unnamed_addr constant [23 x i8] c"checksum g_14[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_14[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_14[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_14[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_14[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_14[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [20 x i8] c"checksum g_22 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_51 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_38 = alloca [8 x [1 x i64]], align 16
  %l_56 = alloca [7 x i64], align 16
  %tmp20 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i64 0, i64 0), align 2
  %tmp22 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i64 0, i64 2), align 2
  store i32* null, i32** @g_21, align 8
  %tmp52 = load i32* @g_22, align 4
  %xor54 = xor i32 %tmp52, 1
  store i32 %xor54, i32* @g_22, align 4
  %arrayidx125 = getelementptr inbounds [8 x [1 x i64]]* %l_38, i64 0, i64 3, i64 0
  %cmp.i35 = icmp eq i16 %tmp20, 0
  %tmp133 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i64 0, i64 4), align 2
  %conv134 = zext i16 %tmp133 to i32
  %cmp2.i = icmp ne i16 %tmp133, 0
  %sub.i23 = sub nsw i32 2147483647, %conv134
  %tobool152 = icmp eq i16 %tmp22, 0
  %tmp153 = load i8* @g_51, align 1
  %phitmp = icmp eq i8 %tmp153, 0
  %tmp161 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i64 0, i64 5), align 2
  %cmp.i15 = icmp eq i16 %tmp161, 0
  %arrayidx192 = getelementptr inbounds [7 x i64]* %l_56, i64 0, i64 6
  %conv15.i = sext i16 %tmp20 to i32
  br label %for.cond56

for.cond56:                                       ; preds = %for.cond168.preheader, %entry
  %0 = phi i32 [ %xor54, %entry ], [ -1189488978, %for.cond168.preheader ]
  %storemerge3 = phi i64 [ -17, %entry ], [ %conv204, %for.cond168.preheader ]
  %cmp58 = icmp sgt i64 %storemerge3, -24
  br i1 %cmp58, label %for.inc87.7, label %for.end205

if.else:                                          ; preds = %for.inc87.7
  %tmp126 = load i64* %arrayidx125, align 8
  %conv127 = trunc i64 %tmp126 to i32
  br i1 %cmp.i35, label %safe_div_func_int16_t_s_s.exit, label %cond.false.i38

cond.false.i38:                                   ; preds = %if.else
  %div.i = sdiv i32 -1, %conv15.i
  br label %safe_div_func_int16_t_s_s.exit

safe_div_func_int16_t_s_s.exit:                   ; preds = %if.else, %cond.false.i38
  %cond.i39 = phi i32 [ %div.i, %cond.false.i38 ], [ -1, %if.else ]
  %mul.i34 = shl i32 %conv127, 16
  %sext = mul i32 %mul.i34, %cond.i39
  %conv132 = ashr exact i32 %sext, 16
  %cmp.i21 = icmp sgt i32 %sext, 0
  %or.cond.i22 = and i1 %cmp.i21, %cmp2.i
  %cmp6.i24 = icmp slt i32 %sub.i23, %conv132
  %or.cond2.i25 = and i1 %or.cond.i22, %cmp6.i24
  %si1.add.i29 = select i1 %or.cond2.i25, i32 0, i32 %conv134
  %conv132.si1.add.i29 = add nsw i32 %conv132, %si1.add.i29
  %1 = and i1 %tobool152, %phitmp
  %conv157 = zext i1 %1 to i32
  %xor158 = xor i32 %conv157, %conv132.si1.add.i29
  %conv159 = trunc i32 %xor158 to i16
  %cmp.i17 = icmp eq i16 %conv159, 0
  br i1 %cmp.i17, label %safe_div_func_uint16_t_u_u.exit, label %cond.false.i18

cond.false.i18:                                   ; preds = %safe_div_func_int16_t_s_s.exit
  %div1.i = udiv i16 -1, %conv159
  br label %safe_div_func_uint16_t_u_u.exit

safe_div_func_uint16_t_u_u.exit:                  ; preds = %safe_div_func_int16_t_s_s.exit, %cond.false.i18
  %cond.in.i19 = phi i16 [ %div1.i, %cond.false.i18 ], [ -1, %safe_div_func_int16_t_s_s.exit ]
  br i1 %cmp.i15, label %safe_mod_func_uint16_t_u_u.exit, label %cond.false.i

cond.false.i:                                     ; preds = %safe_div_func_uint16_t_u_u.exit
  %2 = urem i16 %cond.in.i19, %tmp161
  br label %safe_mod_func_uint16_t_u_u.exit

safe_mod_func_uint16_t_u_u.exit:                  ; preds = %safe_div_func_uint16_t_u_u.exit, %cond.false.i
  %cond.in.i = phi i16 [ %2, %cond.false.i ], [ %cond.in.i19, %safe_div_func_uint16_t_u_u.exit ]
  %tobool163 = icmp eq i16 %cond.in.i, 0
  br i1 %tobool163, label %if.else196, label %for.cond168.preheader

for.cond168.preheader:                            ; preds = %safe_mod_func_uint16_t_u_u.exit
  %arrayidx175 = getelementptr [7 x i64]* %l_56, i64 0, i64 0
  store i64 1282768208840480440, i64* %arrayidx175, align 16
  %arrayidx175.1 = getelementptr [7 x i64]* %l_56, i64 0, i64 1
  store i64 1282768208840480440, i64* %arrayidx175.1, align 8
  %arrayidx175.2 = getelementptr [7 x i64]* %l_56, i64 0, i64 2
  store i64 1282768208840480440, i64* %arrayidx175.2, align 16
  %arrayidx175.3 = getelementptr [7 x i64]* %l_56, i64 0, i64 3
  store i64 1282768208840480440, i64* %arrayidx175.3, align 8
  %arrayidx175.4 = getelementptr [7 x i64]* %l_56, i64 0, i64 4
  store i64 1282768208840480440, i64* %arrayidx175.4, align 16
  %arrayidx175.5 = getelementptr [7 x i64]* %l_56, i64 0, i64 5
  store i64 1282768208840480440, i64* %arrayidx175.5, align 8
  store i64 1282768208840480440, i64* %arrayidx192, align 16
  %conv202 = trunc i64 %storemerge3 to i32
  %xor6.i = and i32 %conv202, 2147483647
  %sub.i = add nsw i32 %xor6.i, -7
  %and10.i = and i32 %sub.i, %conv202
  %sub14.i = add nsw i32 %conv202, -7
  %cmp.i10 = icmp slt i32 %and10.i, 0
  %si1.sub14.i = select i1 %cmp.i10, i32 %conv202, i32 %sub14.i
  %conv204 = sext i32 %si1.sub14.i to i64
  br label %for.cond56

if.else196:                                       ; preds = %safe_mod_func_uint16_t_u_u.exit
  store i32 -4, i32* @g_22, align 4
  %conv198 = sext i8 %tmp153 to i32
  br label %return

for.end205:                                       ; preds = %for.cond56
  store i32 %0, i32* @g_22, align 4
  %conv207 = sext i8 %tmp153 to i32
  br label %return

return.loopexit:                                  ; preds = %for.inc87.7
  store i32 %0, i32* @g_22, align 4
  br label %return

return:                                           ; preds = %return.loopexit, %for.end205, %if.else196
  %3 = phi i32 [ %conv207, %for.end205 ], [ %conv198, %if.else196 ], [ 5092, %return.loopexit ]
  ret i32 %3

for.inc87.7:                                      ; preds = %for.cond56
  %arrayidx82 = getelementptr [8 x [1 x i64]]* %l_38, i64 0, i64 0, i64 0
  store i64 -3887472543215578885, i64* %arrayidx82, align 16
  %arrayidx82.1 = getelementptr [8 x [1 x i64]]* %l_38, i64 0, i64 1, i64 0
  store i64 -3887472543215578885, i64* %arrayidx82.1, align 8
  %arrayidx82.2 = getelementptr [8 x [1 x i64]]* %l_38, i64 0, i64 2, i64 0
  store i64 -3887472543215578885, i64* %arrayidx82.2, align 16
  %arrayidx82.3 = getelementptr [8 x [1 x i64]]* %l_38, i64 0, i64 3, i64 0
  store i64 -3887472543215578885, i64* %arrayidx82.3, align 8
  %arrayidx82.4 = getelementptr [8 x [1 x i64]]* %l_38, i64 0, i64 4, i64 0
  store i64 -3887472543215578885, i64* %arrayidx82.4, align 16
  %arrayidx82.5 = getelementptr [8 x [1 x i64]]* %l_38, i64 0, i64 5, i64 0
  store i64 -3887472543215578885, i64* %arrayidx82.5, align 8
  %arrayidx82.6 = getelementptr [8 x [1 x i64]]* %l_38, i64 0, i64 6, i64 0
  store i64 -3887472543215578885, i64* %arrayidx82.6, align 16
  %arrayidx82.7 = getelementptr [8 x [1 x i64]]* %l_38, i64 0, i64 7, i64 0
  store i64 -3887472543215578885, i64* %arrayidx82.7, align 8
  %conv116 = trunc i32 %0 to i16
  %mul.i41 = mul i16 %conv116, 23087
  %tobool118 = icmp eq i16 %mul.i41, 0
  br i1 %tobool118, label %if.else, label %return.loopexit
}

define i32* @func_2(i32 %p_3, i32* nocapture %p_4, i32* %p_5, i16 signext %p_6) nounwind uwtable readnone {
entry:
  ret i32* %p_5
}

define i32 @func_43(i32* nocapture %p_44, i64 %p_45, i32** nocapture %p_46, i32* %p_47) nounwind uwtable {
entry:
  store i32 -4, i32* %p_47, align 4
  ret i32 -3963
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call i32 @func_1()
  %tmp = load i16* getelementptr inbounds ([6 x i16]* @g_14, i64 0, i64 0), align 2
  %conv = zext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i64 0, i64 1), align 2
  %conv3 = zext i16 %tmp2 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i64 0, i64 2), align 2
  %conv6 = zext i16 %tmp5 to i32
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %conv6) nounwind
  %tmp8 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i64 0, i64 3), align 2
  %conv9 = zext i16 %tmp8 to i32
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %conv9) nounwind
  %tmp11 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i64 0, i64 4), align 2
  %conv12 = zext i16 %tmp11 to i32
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i64 0, i64 0), i32 %conv12) nounwind
  %tmp14 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i64 0, i64 5), align 2
  %conv15 = zext i16 %tmp14 to i32
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i32 %conv15) nounwind
  %tmp17 = load i16* getelementptr inbounds ([6 x i16]* @g_14, i64 0, i64 0), align 2
  %conv18 = zext i16 %tmp17 to i32
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0), i32 %conv18) nounwind
  %tmp20 = load i32* @g_22, align 4
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str6, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i8* @g_51, align 1
  %conv23 = sext i8 %tmp22 to i32
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i64 0, i64 0), i32 %conv23) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
