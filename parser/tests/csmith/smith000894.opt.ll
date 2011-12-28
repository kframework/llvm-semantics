; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000894.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i32, i16, i8, i32, i8, i8, i16, i32 }

@g_9 = global i16 -27904, align 2
@g_11 = global i32 -4, align 4
@g_10 = global i32* @g_11, align 8
@g_12 = global [8 x [1 x i32**]] [[1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10], [1 x i32**] [i32** @g_10]], align 16
@g_18 = global i32 1, align 4
@g_19 = global [9 x i32] [i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082, i32 -471375082], align 16
@g_49 = global i32* @g_18, align 8
@g_51 = global i32** @g_10, align 8
@g_58 = global i32** @g_10, align 8
@g_57 = global i32*** @g_58, align 8
@g_59 = global %struct.S0 { i32 -1, i16 26275, i8 -113, i32 -1, i8 -41, i8 74, i16 0, i32 1 }, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_19[0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_19[1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_19[2] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_19[3] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_19[4] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_19[5] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"checksum g_19[6] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [23 x i8] c"checksum g_19[7] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [23 x i8] c"checksum g_19[8] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [23 x i8] c"checksum g_59.f0 = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [23 x i8] c"checksum g_59.f1 = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [23 x i8] c"checksum g_59.f2 = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [23 x i8] c"checksum g_59.f3 = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [23 x i8] c"checksum g_59.f4 = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [23 x i8] c"checksum g_59.f5 = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [23 x i8] c"checksum g_59.f6 = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [23 x i8] c"checksum g_59.f7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S0* nocapture sret %agg.result) nounwind uwtable {
entry:
  %tmp3 = load i16* @g_9, align 2
  %tmp4 = load i32** @g_10, align 8
  %conv.i = sext i16 %tmp3 to i32
  %tmp19.i = load i32* %tmp4, align 4
  %xor.i = xor i32 %tmp19.i, %conv.i
  store i32 %xor.i, i32* %tmp4, align 4
  %tmp19.i3 = load i32* @g_18, align 4
  %xor.i4 = xor i32 %tmp19.i3, %conv.i
  store i32 %xor.i4, i32* @g_18, align 4
  %tmp9 = volatile load i32*** @g_51, align 8
  store i32* @g_18, i32** %tmp9, align 8
  %tmp.i = load i32** @g_10, align 8
  %tmp1.i = load i32* %tmp.i, align 4
  %tobool.i = icmp eq i32 %tmp1.i, 0
  %0 = select i1 %tobool.i, i32 15157, i32 -1263399019
  %tmp13 = load i32* %tmp4, align 4
  %or = or i32 %0, %tmp13
  store i32 %or, i32* %tmp4, align 4
  %tmp14 = bitcast %struct.S0* %agg.result to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp14, i8* bitcast (%struct.S0* @g_59 to i8*), i64 20, i32 4, i1 false)
  ret void
}

define i32* @func_2(i32 %p_3, i32* %p_4) nounwind uwtable {
entry:
  %tmp17 = load i16* @g_9, align 2
  %conv = sext i16 %tmp17 to i32
  %tmp19 = load i32* %p_4, align 4
  %xor = xor i32 %tmp19, %conv
  store i32 %xor, i32* %p_4, align 4
  ret i32* %p_4
}

define i32 @func_52(i32*** nocapture %p_53, i32 %p_54) nounwind uwtable {
entry:
  %tmp = load i32** @g_10, align 8
  %tmp1 = load i32* %tmp, align 4
  %tobool = icmp eq i32 %tmp1, 0
  br i1 %tobool, label %if.then, label %return

if.then:                                          ; preds = %entry
  %tobool3 = icmp eq i32 %p_54, 0
  br i1 %tobool3, label %if.else, label %return

if.else:                                          ; preds = %if.then
  %tmp6 = volatile load i32*** @g_51, align 8
  %tmp7 = load i32** %tmp6, align 8
  %tmp8 = load i32* %tmp7, align 4
  br label %return

return:                                           ; preds = %entry, %if.then, %if.else
  %0 = phi i32 [ %tmp8, %if.else ], [ 15157, %if.then ], [ -1263399019, %entry ]
  ret i32 %0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32* @func_14(i32* %p_15, i32* %p_16, i32 %p_17) nounwind uwtable {
for.inc21.7:
  store i16 0, i16* @g_9, align 2
  volatile store i32** @g_10, i32*** getelementptr inbounds ([8 x [1 x i32**]]* @g_12, i64 0, i64 0, i64 0), align 16
  volatile store i32** @g_10, i32*** getelementptr inbounds ([8 x [1 x i32**]]* @g_12, i64 0, i64 1, i64 0), align 8
  volatile store i32** @g_10, i32*** getelementptr inbounds ([8 x [1 x i32**]]* @g_12, i64 0, i64 2, i64 0), align 16
  volatile store i32** @g_10, i32*** getelementptr inbounds ([8 x [1 x i32**]]* @g_12, i64 0, i64 3, i64 0), align 8
  volatile store i32** @g_10, i32*** getelementptr inbounds ([8 x [1 x i32**]]* @g_12, i64 0, i64 4, i64 0), align 16
  volatile store i32** @g_10, i32*** getelementptr inbounds ([8 x [1 x i32**]]* @g_12, i64 0, i64 5, i64 0), align 8
  volatile store i32** @g_10, i32*** getelementptr inbounds ([8 x [1 x i32**]]* @g_12, i64 0, i64 6, i64 0), align 16
  volatile store i32** @g_10, i32*** getelementptr inbounds ([8 x [1 x i32**]]* @g_12, i64 0, i64 7, i64 0), align 8
  store i32 1, i32* getelementptr inbounds ([9 x i32]* @g_19, i64 0, i64 5), align 4
  store i32 8, i32* @g_18, align 4
  %tmp25 = load i32** @g_10, align 8
  %tmp26 = load i32* %tmp25, align 4
  %tmp28 = load i32* %p_16, align 4
  %or = or i32 %tmp28, %tmp26
  store i32 %or, i32* %p_16, align 4
  ret i32* %p_15
}

define i32 @func_35(i16 zeroext %p_36) nounwind uwtable {
safe_mod_func_uint16_t_u_u.exit:
  %conv = zext i16 %p_36 to i32
  %sext = shl i32 %conv, 24
  %cmp18 = icmp slt i32 %sext, 16777216
  %conv19 = zext i1 %cmp18 to i32
  %tmp20 = volatile load i32** @g_49, align 8
  %tmp21 = load i32* %tmp20, align 4
  %xor = xor i32 %tmp21, %conv19
  store i32 %xor, i32* %tmp20, align 4
  ret i32 %conv
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp3.i = load i16* @g_9, align 2
  %tmp4.i = load i32** @g_10, align 8
  %conv.i.i = sext i16 %tmp3.i to i32
  %tmp19.i.i = load i32* %tmp4.i, align 4
  %xor.i.i = xor i32 %tmp19.i.i, %conv.i.i
  store i32 %xor.i.i, i32* %tmp4.i, align 4
  %tmp19.i3.i = load i32* @g_18, align 4
  %xor.i4.i = xor i32 %tmp19.i3.i, %conv.i.i
  store i32 %xor.i4.i, i32* @g_18, align 4
  %tmp9.i = volatile load i32*** @g_51, align 8
  store i32* @g_18, i32** %tmp9.i, align 8
  %tmp.i.i = load i32** @g_10, align 8
  %tmp1.i.i = load i32* %tmp.i.i, align 4
  %tobool.i.i = icmp eq i32 %tmp1.i.i, 0
  %0 = select i1 %tobool.i.i, i32 15157, i32 -1263399019
  %tmp13.i = load i32* %tmp4.i, align 4
  %or.i = or i32 %0, %tmp13.i
  store i32 %or.i, i32* %tmp4.i, align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv.i.i) nounwind
  %tmp2 = load i32* @g_11, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_18, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i64 0, i64 0), align 16
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i64 0, i64 1), align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i64 0, i64 2), align 8
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i64 0, i64 3), align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i64 0, i64 4), align 16
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i64 0, i64 5), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i64 0, i64 6), align 8
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i64 0, i64 7), align 4
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i64 0, i64 8), align 16
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str11, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* getelementptr inbounds ([9 x i32]* @g_19, i64 0, i64 5), align 4
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = volatile load i32* getelementptr inbounds (%struct.S0* @g_59, i64 0, i32 0), align 4
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str12, i64 0, i64 0), i32 %tmp26) nounwind
  %tmp28 = load i16* getelementptr inbounds (%struct.S0* @g_59, i64 0, i32 1), align 4
  %conv29 = zext i16 %tmp28 to i32
  %call30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str13, i64 0, i64 0), i32 %conv29) nounwind
  %tmp31 = load i8* getelementptr inbounds (%struct.S0* @g_59, i64 0, i32 2), align 2
  %conv32 = zext i8 %tmp31 to i32
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str14, i64 0, i64 0), i32 %conv32) nounwind
  %tmp34 = load i32* getelementptr inbounds (%struct.S0* @g_59, i64 0, i32 3), align 4
  %call35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str15, i64 0, i64 0), i32 %tmp34) nounwind
  %tmp36 = volatile load i8* getelementptr inbounds (%struct.S0* @g_59, i64 0, i32 4), align 4
  %conv37 = zext i8 %tmp36 to i32
  %call38 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str16, i64 0, i64 0), i32 %conv37) nounwind
  %tmp39 = load i8* getelementptr inbounds (%struct.S0* @g_59, i64 0, i32 5), align 1
  %conv40 = sext i8 %tmp39 to i32
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str17, i64 0, i64 0), i32 %conv40) nounwind
  %tmp42 = load i16* getelementptr inbounds (%struct.S0* @g_59, i64 0, i32 6), align 2
  %conv43 = zext i16 %tmp42 to i32
  %call44 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str18, i64 0, i64 0), i32 %conv43) nounwind
  %tmp45 = load i32* getelementptr inbounds (%struct.S0* @g_59, i64 0, i32 7), align 4
  %call46 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str19, i64 0, i64 0), i32 %tmp45) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
