; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001014.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -250458367, align 4
@g_4 = global i32 740926431, align 4
@g_3 = global i32* @g_4, align 8
@g_6 = global i32* null, align 8
@g_7 = global i32* null, align 8
@g_26 = global i32 -4, align 4
@g_25 = global i32* @g_26, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_26 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_8 = alloca [7 x [4 x i32]], align 16
  %arrayidx8.3 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 0, i64 3
  %arrayidx8.2 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 0, i64 2
  %arrayidx8.1 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 0, i64 1
  %arrayidx8 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 0, i64 0
  store i32 506063425, i32* %arrayidx8, align 16
  store i32 506063425, i32* %arrayidx8.1, align 4
  store i32 506063425, i32* %arrayidx8.2, align 8
  store i32 506063425, i32* %arrayidx8.3, align 4
  %arrayidx8.3.1 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 1, i64 3
  %arrayidx8.2.1 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 1, i64 2
  %arrayidx8.1.1 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 1, i64 1
  %arrayidx8.138 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 1, i64 0
  store i32 506063425, i32* %arrayidx8.138, align 16
  store i32 506063425, i32* %arrayidx8.1.1, align 4
  store i32 506063425, i32* %arrayidx8.2.1, align 8
  store i32 506063425, i32* %arrayidx8.3.1, align 4
  %arrayidx8.3.2 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 2, i64 3
  %arrayidx8.2.2 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 2, i64 2
  %arrayidx8.1.2 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 2, i64 1
  %arrayidx8.239 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 2, i64 0
  store i32 506063425, i32* %arrayidx8.239, align 16
  store i32 506063425, i32* %arrayidx8.1.2, align 4
  store i32 506063425, i32* %arrayidx8.2.2, align 8
  store i32 506063425, i32* %arrayidx8.3.2, align 4
  %arrayidx8.3.3 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 3, i64 3
  %arrayidx8.2.3 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 3, i64 2
  %arrayidx8.1.3 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 3, i64 1
  %arrayidx8.340 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 3, i64 0
  store i32 506063425, i32* %arrayidx8.340, align 16
  store i32 506063425, i32* %arrayidx8.1.3, align 4
  store i32 506063425, i32* %arrayidx8.2.3, align 8
  store i32 506063425, i32* %arrayidx8.3.3, align 4
  %arrayidx8.3.4 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 4, i64 3
  %arrayidx8.2.4 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 4, i64 2
  %arrayidx8.1.4 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 4, i64 1
  %arrayidx8.4 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 4, i64 0
  store i32 506063425, i32* %arrayidx8.4, align 16
  store i32 506063425, i32* %arrayidx8.1.4, align 4
  store i32 506063425, i32* %arrayidx8.2.4, align 8
  store i32 506063425, i32* %arrayidx8.3.4, align 4
  %arrayidx8.3.5 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 5, i64 3
  %arrayidx8.2.5 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 5, i64 2
  %arrayidx8.1.5 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 5, i64 1
  %arrayidx8.5 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 5, i64 0
  store i32 506063425, i32* %arrayidx8.5, align 16
  store i32 506063425, i32* %arrayidx8.1.5, align 4
  store i32 506063425, i32* %arrayidx8.2.5, align 8
  store i32 506063425, i32* %arrayidx8.3.5, align 4
  %arrayidx8.3.6 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 6, i64 3
  %arrayidx8.2.6 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 6, i64 2
  %arrayidx8.1.6 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 6, i64 1
  %arrayidx8.6 = getelementptr [7 x [4 x i32]]* %l_8, i64 0, i64 6, i64 0
  store i32 506063425, i32* %arrayidx8.6, align 16
  store i32 506063425, i32* %arrayidx8.1.6, align 4
  store i32 506063425, i32* %arrayidx8.2.6, align 8
  store i32 506063425, i32* %arrayidx8.3.6, align 4
  %tmp14 = load i32* @g_2, align 4
  %tmp15 = volatile load i32** @g_3, align 8
  %tmp16 = load i32* %tmp15, align 4
  %and = and i32 %tmp16, %tmp14
  store i32 %and, i32* %tmp15, align 4
  %tmp17 = volatile load i32** @g_3, align 8
  %tmp18 = load i32* %tmp17, align 4
  %and19 = and i32 %tmp18, 166
  store i32 %and19, i32* %tmp17, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc167, %entry
  %tmp191 = phi i32 [ 6, %entry ], [ %add169, %for.inc167 ]
  store i32 %tmp191, i32* @g_2, align 4
  %cmp22 = icmp sgt i32 %tmp191, -1
  br i1 %cmp22, label %for.cond24, label %for.end170

for.cond24:                                       ; preds = %for.cond20, %for.inc163
  %tmp146 = phi i32 [ %add165, %for.inc163 ], [ 3, %for.cond20 ]
  store i32 %tmp146, i32* @g_4, align 4
  %cmp26 = icmp sgt i32 %tmp146, -1
  br i1 %cmp26, label %safe_add_func_int64_t_s_s.exit, label %for.inc167

safe_add_func_int64_t_s_s.exit:                   ; preds = %for.cond24
  %tmp40 = volatile load i32** @g_3, align 8
  %tmp41 = load i32* %tmp40, align 4
  %cmp43 = icmp sgt i32 %tmp41, 0
  %conv44 = zext i1 %cmp43 to i32
  %cmp46 = icmp sgt i32 %conv44, %tmp146
  %conv50 = zext i1 %cmp46 to i32
  %add = add nsw i32 %tmp146, 2
  %rem = and i32 %add, 3
  %idxprom52 = zext i32 %rem to i64
  %tmp53 = load i32* @g_2, align 4
  %rem54 = urem i32 %tmp53, 7
  %idxprom55 = zext i32 %rem54 to i64
  %arrayidx57 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i64 0, i64 %idxprom55, i64 %idxprom52
  %tmp58 = load i32* %arrayidx57, align 4
  %rem61 = and i32 %tmp146, 3
  %idxprom62 = zext i32 %rem61 to i64
  %arrayidx67 = getelementptr inbounds [7 x [4 x i32]]* %l_8, i64 0, i64 %idxprom55, i64 %idxprom62
  %tmp68 = load i32* %arrayidx67, align 4
  %cmp70 = icmp ult i32 %tmp68, %tmp53
  br i1 %cmp70, label %lor.rhs, label %lor.end

lor.rhs:                                          ; preds = %safe_add_func_int64_t_s_s.exit
  %conv73 = trunc i32 %tmp53 to i8
  %conv83 = trunc i32 %tmp68 to i8
  %cmp.i21 = icmp eq i8 %conv83, 0
  br i1 %cmp.i21, label %cond.true.i, label %lor.lhs.false.i24

lor.lhs.false.i24:                                ; preds = %lor.rhs
  %cmp4.i22 = icmp eq i8 %conv73, -128
  %cmp8.i = icmp eq i8 %conv83, -1
  %or.cond.i23 = and i1 %cmp4.i22, %cmp8.i
  br i1 %or.cond.i23, label %cond.true.i, label %cond.false.i26

cond.true.i:                                      ; preds = %lor.lhs.false.i24, %lor.rhs
  %conv11.i = sext i8 %conv73 to i32
  br label %safe_mod_func_int8_t_s_s.exit

cond.false.i26:                                   ; preds = %lor.lhs.false.i24
  %conv13.i = sext i8 %conv73 to i32
  %conv15.i = sext i8 %conv83 to i32
  %rem.i25 = srem i32 %conv13.i, %conv15.i
  br label %safe_mod_func_int8_t_s_s.exit

safe_mod_func_int8_t_s_s.exit:                    ; preds = %cond.true.i, %cond.false.i26
  %cond.i27 = phi i32 [ %conv11.i, %cond.true.i ], [ %rem.i25, %cond.false.i26 ]
  %conv16.i = trunc i32 %cond.i27 to i8
  %phitmp = icmp eq i8 %conv16.i, 0
  br label %lor.end

lor.end:                                          ; preds = %safe_add_func_int64_t_s_s.exit, %safe_mod_func_int8_t_s_s.exit
  %0 = phi i1 [ false, %safe_add_func_int64_t_s_s.exit ], [ %phitmp, %safe_mod_func_int8_t_s_s.exit ]
  %1 = or i32 %tmp68, %tmp146
  %2 = icmp ne i32 %1, 0
  %lor.ext100 = zext i1 %2 to i32
  %and111 = and i32 %tmp68, %tmp53
  %cmp112 = icmp ugt i32 %lor.ext100, %and111
  %cmp114 = or i1 %cmp112, %0
  br i1 %cmp114, label %cond.false.i18, label %safe_div_func_uint64_t_u_u.exit

cond.false.i18:                                   ; preds = %lor.end
  %conv116 = zext i1 %cmp114 to i32
  %div.i = udiv i32 %tmp58, %conv116
  br label %safe_div_func_uint64_t_u_u.exit

safe_div_func_uint64_t_u_u.exit:                  ; preds = %lor.end, %cond.false.i18
  %cond.i19 = phi i32 [ %div.i, %cond.false.i18 ], [ %tmp58, %lor.end ]
  %xor = xor i32 %tmp146, 1
  %sub.i16 = sub i32 %tmp68, %xor
  %mul.i15 = mul i32 %sub.i16, %cond.i19
  %add.i14 = add i32 %mul.i15, %conv50
  %sext31 = shl i32 %add.i14, 24
  %conv152 = ashr exact i32 %sext31, 24
  %tmp153 = volatile load i32** @g_25, align 8
  store i32 %conv152, i32* %tmp153, align 4
  %tmp156 = volatile load i32** @g_3, align 8
  %tmp157 = load i32* %tmp156, align 4
  %tobool158 = icmp eq i32 %tmp157, 0
  br i1 %tobool158, label %return.loopexit, label %for.inc163

for.inc163:                                       ; preds = %safe_div_func_uint64_t_u_u.exit
  %tmp164 = load i32* @g_4, align 4
  %add165 = add nsw i32 %tmp164, -4
  br label %for.cond24

for.inc167:                                       ; preds = %for.cond24
  %tmp168 = load i32* @g_2, align 4
  %add169 = add nsw i32 %tmp168, -2
  br label %for.cond20

for.end170:                                       ; preds = %for.cond20
  %tmp171 = volatile load i32** @g_3, align 8
  %tmp172 = load i32* %tmp171, align 4
  %tmp173 = load i32* @g_4, align 4
  %cmp.i9 = icmp eq i32 %tmp173, 0
  br i1 %cmp.i9, label %safe_mod_func_int32_t_s_s.exit, label %lor.lhs.false.i12

lor.lhs.false.i12:                                ; preds = %for.end170
  %cmp2.i10 = icmp eq i32 %tmp172, -2147483648
  %cmp4.i = icmp eq i32 %tmp173, -1
  %or.cond.i11 = and i1 %cmp2.i10, %cmp4.i
  br i1 %or.cond.i11, label %safe_mod_func_int32_t_s_s.exit, label %cond.false.i

cond.false.i:                                     ; preds = %lor.lhs.false.i12
  %rem.i = srem i32 %tmp172, %tmp173
  br label %safe_mod_func_int32_t_s_s.exit

safe_mod_func_int32_t_s_s.exit:                   ; preds = %for.end170, %lor.lhs.false.i12, %cond.false.i
  %cond.i = phi i32 [ %rem.i, %cond.false.i ], [ %tmp172, %for.end170 ], [ -2147483648, %lor.lhs.false.i12 ]
  %mul.i = shl i32 %cond.i, 24
  %sext = mul i32 %mul.i, %tmp173
  %conv179 = ashr exact i32 %sext, 24
  %tmp182 = load i32* %arrayidx8.1.2, align 4
  %sub.i8 = sub i32 %conv179, %tmp182
  %conv184 = trunc i32 %sub.i8 to i16
  %tmp185 = load i32* @g_26, align 4
  %conv186 = trunc i32 %tmp185 to i16
  %add.i7 = add i16 %conv184, %conv186
  %cmp189 = icmp sgt i16 %add.i7, 4
  %conv190 = zext i1 %cmp189 to i32
  %tmp195 = load i32* %arrayidx8.1.5, align 4
  %sub.i6 = sub i32 %tmp191, %tmp195
  %sext29 = shl i32 %sub.i6, 16
  %conv198 = ashr exact i32 %sext29, 16
  %cmp199 = icmp eq i32 %conv190, %conv198
  %conv200 = zext i1 %cmp199 to i32
  store i32 %conv200, i32* @g_4, align 4
  br label %return

return.loopexit:                                  ; preds = %safe_div_func_uint64_t_u_u.exit
  %storemerge3.in.pre = load i32* @g_2, align 4
  br label %return

return:                                           ; preds = %return.loopexit, %safe_mod_func_int32_t_s_s.exit
  %storemerge3.in = phi i32 [ %conv200, %safe_mod_func_int32_t_s_s.exit ], [ %storemerge3.in.pre, %return.loopexit ]
  %storemerge3 = trunc i32 %storemerge3.in to i16
  ret i16 %storemerge3
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call zeroext i16 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_4, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_26, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
