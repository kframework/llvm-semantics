; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000376.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 2, align 4
@g_18 = global i16 0, align 2
@g_41 = global i8 -6, align 1
@g_48 = global [2 x i32*] zeroinitializer, align 16
@g_58 = global i8 -126, align 1
@g_85 = global i32* null, align 8
@g_84 = global i32** @g_85, align 8
@g_110 = global i32** @g_85, align 8
@g_112 = global i32 -1638173852, align 4
@g_111 = global i32* @g_112, align 8
@g_166 = global i32 7, align 4
@g_180 = global i32** getelementptr inbounds ([2 x i32*]* @g_48, i64 0, i64 0), align 8
@g_179 = global i32*** @g_180, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_18 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_41 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_58 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [21 x i8] c"checksum g_112 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [21 x i8] c"checksum g_166 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
for.end:
  store i32 -11, i32* @g_2, align 4
  %tmp5 = load i8* @g_41, align 1
  %conv = sext i8 %tmp5 to i32
  ret i32 %conv
}

define i32 @func_7(i64 %p_8, i32 %p_9, i64 %p_10, i32 %p_11, i64 %p_12) nounwind uwtable {
entry:
  %l_82.i = alloca [10 x [10 x [1 x i32]]], align 16
  %p_9.addr = alloca i32, align 4
  store i32 %p_9, i32* %p_9.addr, align 4
  %conv = trunc i64 %p_10 to i16
  %tmp1 = load i32* @g_2, align 4
  %tobool3 = icmp ne i64 %p_12, 0
  %not.tobool = icmp ne i32 %tmp1, 0
  %0 = or i1 %tobool3, %not.tobool
  %lor.ext = zext i1 %0 to i32
  %conv7 = trunc i32 %tmp1 to i16
  %cmp.i = icmp eq i16 %conv7, 0
  br i1 %cmp.i, label %safe_mod_func_uint16_t_u_u.exit, label %cond.false.i

cond.false.i:                                     ; preds = %entry
  %1 = urem i16 -13184, %conv7
  %phitmp = zext i16 %1 to i32
  br label %safe_mod_func_uint16_t_u_u.exit

safe_mod_func_uint16_t_u_u.exit:                  ; preds = %entry, %cond.false.i
  %cond.in.i = phi i32 [ %phitmp, %cond.false.i ], [ 52352, %entry ]
  %cmp = icmp ugt i32 %lor.ext, %cond.in.i
  %conv9 = zext i1 %cmp to i32
  %cmp.i21 = icmp slt i16 %conv, 0
  %conv12.pre.i = sext i16 %conv to i32
  br i1 %cmp.i21, label %safe_lshift_func_int16_t_s_u.exit, label %lor.lhs.false5.i

lor.lhs.false5.i:                                 ; preds = %safe_mod_func_uint16_t_u_u.exit
  %shr.i = lshr i32 32767, %conv9
  %cmp9.i = icmp sgt i32 %conv12.pre.i, %shr.i
  %shl.i = select i1 %cmp9.i, i32 0, i32 %conv9
  %conv12.pre.shl.i = shl i32 %conv12.pre.i, %shl.i
  br label %safe_lshift_func_int16_t_s_u.exit

safe_lshift_func_int16_t_s_u.exit:                ; preds = %safe_mod_func_uint16_t_u_u.exit, %lor.lhs.false5.i
  %cond.i = phi i32 [ %conv12.pre.i, %safe_mod_func_uint16_t_u_u.exit ], [ %conv12.pre.shl.i, %lor.lhs.false5.i ]
  %conv16.i = trunc i32 %cond.i to i16
  %tobool12 = icmp eq i16 %conv16.i, 0
  br i1 %tobool12, label %lor.lhs.false, label %lbl_240.preheader

lbl_240.preheader:                                ; preds = %lor.lhs.false, %safe_lshift_func_int16_t_s_u.exit
  %tobool210 = icmp eq i64 %p_10, 0
  %tmp195.pre = load i32** @g_111, align 8
  br label %lbl_240

lor.lhs.false:                                    ; preds = %safe_lshift_func_int16_t_s_u.exit
  %tmp13 = load i16* @g_18, align 2
  %conv14 = sext i16 %tmp13 to i32
  %cmp16 = icmp eq i32 %conv14, %p_9
  br i1 %cmp16, label %lbl_240.preheader, label %return

lbl_240.loopexit:                                 ; preds = %for.body201
  store i16 %storemerge, i16* @g_18, align 2
  br label %lbl_240

lbl_240:                                          ; preds = %lbl_240.preheader, %lbl_240.loopexit
  %tmp195 = phi i32* [ %tmp195.pre, %lbl_240.preheader ], [ %tmp202, %lbl_240.loopexit ]
  %tmp194 = phi i32 [ %p_9, %lbl_240.preheader ], [ %conv208, %lbl_240.loopexit ]
  store i32 %tmp194, i32* %tmp195, align 4
  br label %for.cond196

for.cond196:                                      ; preds = %for.inc238, %lbl_240
  %indvar = phi i64 [ %indvar.next, %for.inc238 ], [ 0, %lbl_240 ]
  %tmp = shl i64 %indvar, 1
  %conv21344 = or i64 %tmp, 1
  %storemerge = trunc i64 %conv21344 to i16
  %cmp199 = icmp slt i16 %storemerge, 2
  br i1 %cmp199, label %for.body201, label %lbl_245

for.body201:                                      ; preds = %for.cond196
  %tmp202 = load i32** @g_111, align 8
  %tmp203 = load i32* %tmp202, align 4
  %xor = xor i32 %tmp203, 80
  %sub.i20 = add i32 %xor, 255
  %conv208 = and i32 %sub.i20, 255
  store i32 %conv208, i32* %p_9.addr, align 4
  br i1 %tobool210, label %for.end233, label %lbl_240.loopexit

for.end233:                                       ; preds = %for.body201
  %tmp216 = volatile load i32** getelementptr inbounds ([2 x i32*]* @g_48, i64 0, i64 1), align 8
  %tmp217 = load i32*** @g_180, align 8
  volatile store i32* %tmp216, i32** %tmp217, align 8
  store i32 0, i32* @g_2, align 4
  %tmp234 = load i32* @g_112, align 4
  %tobool235 = icmp eq i32 %tmp234, 0
  br i1 %tobool235, label %for.inc238, label %lbl_245

for.inc238:                                       ; preds = %for.end233
  %indvar.next = add i64 %indvar, 1
  br label %for.cond196

lbl_245:                                          ; preds = %for.cond196, %for.end233
  store i16 %storemerge, i16* @g_18, align 2
  %tmp248 = volatile load i32** getelementptr inbounds ([2 x i32*]* @g_48, i64 0, i64 1), align 8
  %2 = bitcast [10 x [10 x [1 x i32]]]* %l_82.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %2)
  br label %for.inc17.9.i

for.inc17.9.i:                                    ; preds = %for.inc17.9.i, %lbl_245
  %indvar6.i = phi i64 [ 0, %lbl_245 ], [ %3, %for.inc17.9.i ]
  %arrayidx15.i = getelementptr [10 x [10 x [1 x i32]]]* %l_82.i, i64 0, i64 %indvar6.i, i64 0, i64 0
  %scevgep28.i = getelementptr [10 x [10 x [1 x i32]]]* %l_82.i, i64 0, i64 %indvar6.i, i64 1, i64 0
  %scevgep26.i = getelementptr [10 x [10 x [1 x i32]]]* %l_82.i, i64 0, i64 %indvar6.i, i64 2, i64 0
  %scevgep24.i = getelementptr [10 x [10 x [1 x i32]]]* %l_82.i, i64 0, i64 %indvar6.i, i64 3, i64 0
  %scevgep22.i = getelementptr [10 x [10 x [1 x i32]]]* %l_82.i, i64 0, i64 %indvar6.i, i64 4, i64 0
  %scevgep20.i = getelementptr [10 x [10 x [1 x i32]]]* %l_82.i, i64 0, i64 %indvar6.i, i64 5, i64 0
  %scevgep18.i = getelementptr [10 x [10 x [1 x i32]]]* %l_82.i, i64 0, i64 %indvar6.i, i64 6, i64 0
  %scevgep16.i = getelementptr [10 x [10 x [1 x i32]]]* %l_82.i, i64 0, i64 %indvar6.i, i64 7, i64 0
  %scevgep14.i = getelementptr [10 x [10 x [1 x i32]]]* %l_82.i, i64 0, i64 %indvar6.i, i64 8, i64 0
  %scevgep.i = getelementptr [10 x [10 x [1 x i32]]]* %l_82.i, i64 0, i64 %indvar6.i, i64 9, i64 0
  store i32 2, i32* %arrayidx15.i, align 8
  store i32 2, i32* %scevgep28.i, align 4
  store i32 2, i32* %scevgep26.i, align 8
  store i32 2, i32* %scevgep24.i, align 4
  store i32 2, i32* %scevgep22.i, align 8
  store i32 2, i32* %scevgep20.i, align 4
  store i32 2, i32* %scevgep18.i, align 8
  store i32 2, i32* %scevgep16.i, align 4
  store i32 2, i32* %scevgep14.i, align 8
  store i32 2, i32* %scevgep.i, align 4
  %3 = add i64 %indvar6.i, 1
  %exitcond = icmp eq i64 %3, 10
  br i1 %exitcond, label %for.body275, label %for.inc17.9.i

for.body275:                                      ; preds = %for.inc17.9.i
  store i32 -6, i32* @g_2, align 4
  %arrayidx28.i = getelementptr inbounds [10 x [10 x [1 x i32]]]* %l_82.i, i64 0, i64 4, i64 7, i64 0
  %tmp29.i = load i32* %arrayidx28.i, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %2)
  %tobool262 = icmp ne i32 %tmp29.i, 0
  %land.ext264 = zext i1 %tobool262 to i32
  %tmp265 = load i32** @g_111, align 8
  %tmp266 = load i32* %tmp265, align 4
  %cmp267 = icmp sle i32 %land.ext264, %tmp266
  %conv268 = zext i1 %cmp267 to i32
  %tmp270 = load i32* @g_166, align 4
  %or = or i32 %conv268, %tmp270
  store i32 %or, i32* @g_166, align 4
  br label %return

return:                                           ; preds = %lor.lhs.false, %for.body275
  %storemerge2 = phi i32 [ -9, %for.body275 ], [ %tmp1, %lor.lhs.false ]
  ret i32 %storemerge2
}

define i32 @func_80(i32* %p_81) nounwind uwtable {
entry:
  %l_82 = alloca [10 x [10 x [1 x i32]]], align 16
  br label %for.inc17.9

for.end24:                                        ; preds = %for.inc17.9
  store i32 -6, i32* %p_81, align 4
  %arrayidx28 = getelementptr inbounds [10 x [10 x [1 x i32]]]* %l_82, i64 0, i64 4, i64 7, i64 0
  %tmp29 = load i32* %arrayidx28, align 4
  ret i32 %tmp29

for.inc17.9:                                      ; preds = %for.inc17.9, %entry
  %indvar6 = phi i64 [ 0, %entry ], [ %indvar.next7, %for.inc17.9 ]
  %scevgep = getelementptr [10 x [10 x [1 x i32]]]* %l_82, i64 0, i64 %indvar6, i64 9, i64 0
  %scevgep14 = getelementptr [10 x [10 x [1 x i32]]]* %l_82, i64 0, i64 %indvar6, i64 8, i64 0
  %scevgep16 = getelementptr [10 x [10 x [1 x i32]]]* %l_82, i64 0, i64 %indvar6, i64 7, i64 0
  %scevgep18 = getelementptr [10 x [10 x [1 x i32]]]* %l_82, i64 0, i64 %indvar6, i64 6, i64 0
  %scevgep20 = getelementptr [10 x [10 x [1 x i32]]]* %l_82, i64 0, i64 %indvar6, i64 5, i64 0
  %scevgep22 = getelementptr [10 x [10 x [1 x i32]]]* %l_82, i64 0, i64 %indvar6, i64 4, i64 0
  %scevgep24 = getelementptr [10 x [10 x [1 x i32]]]* %l_82, i64 0, i64 %indvar6, i64 3, i64 0
  %scevgep26 = getelementptr [10 x [10 x [1 x i32]]]* %l_82, i64 0, i64 %indvar6, i64 2, i64 0
  %scevgep28 = getelementptr [10 x [10 x [1 x i32]]]* %l_82, i64 0, i64 %indvar6, i64 1, i64 0
  %arrayidx15 = getelementptr [10 x [10 x [1 x i32]]]* %l_82, i64 0, i64 %indvar6, i64 0, i64 0
  store i32 2, i32* %arrayidx15, align 8
  store i32 2, i32* %scevgep28, align 4
  store i32 2, i32* %scevgep26, align 8
  store i32 2, i32* %scevgep24, align 4
  store i32 2, i32* %scevgep22, align 8
  store i32 2, i32* %scevgep20, align 4
  store i32 2, i32* %scevgep18, align 8
  store i32 2, i32* %scevgep16, align 4
  store i32 2, i32* %scevgep14, align 8
  store i32 2, i32* %scevgep, align 4
  %indvar.next7 = add i64 %indvar6, 1
  %exitcond = icmp eq i64 %indvar.next7, 10
  br i1 %exitcond, label %for.end24, label %for.inc17.9
}

define i32* @func_87(i32 %p_88, i32* %p_89) nounwind uwtable readonly {
entry:
  %p_91.addr.i = alloca i32, align 4
  %0 = bitcast i32* %p_91.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  ret i32* @g_2
}

define i32* @func_19(i16 signext %p_20, i32* %p_21, i32* %p_22, i16 zeroext %p_23) nounwind uwtable {
entry:
  br label %for.body.i58

for.body.i58:                                     ; preds = %for.body.i58, %entry
  br label %for.body.i58
}

define i32 @func_29(i16 zeroext %p_30) nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  br label %for.body
}

define i32 @func_44(i64 %p_45, i64 %p_46, i32 %p_47) nounwind uwtable {
entry:
  %conv = trunc i64 %p_45 to i32
  store i32 %conv, i32* @g_2, align 4
  %conv3 = trunc i64 %p_46 to i32
  ret i32 %conv3
}

define i32* @func_71(i8 signext %p_72, i32* nocapture %p_73, i32* nocapture %p_74, i8 signext %p_75, i16 zeroext %p_76) nounwind uwtable {
entry:
  store i32 0, i32* %p_73, align 4
  ret i32* @g_2
}

define noalias i32* @func_90(i32 %p_91) nounwind uwtable readnone {
entry:
  %p_91.addr = alloca i32, align 4
  ret i32* %p_91.addr
}

define i32 @func_92(i32 %p_93, i32** %p_94, i64 %p_95, i64 %p_96) nounwind uwtable {
entry:
  %p_91.addr.i = alloca i32, align 4
  %0 = bitcast i32* %p_91.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  store i32* %p_91.addr.i, i32** %p_94, align 8
  %conv9 = trunc i64 %p_96 to i32
  ret i32 %conv9
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 -11, i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 -11) nounwind
  %tmp2 = load i16* @g_18, align 2
  %conv = sext i16 %tmp2 to i32
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %conv) nounwind
  %tmp4 = load i8* @g_41, align 1
  %conv5 = sext i8 %tmp4 to i32
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %conv5) nounwind
  %tmp7 = load i8* @g_58, align 1
  %conv8 = sext i8 %tmp7 to i32
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i64 0, i64 0), i32 %conv8) nounwind
  %tmp10 = load i32* @g_112, align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str4, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* @g_166, align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str5, i64 0, i64 0), i32 %tmp12) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
