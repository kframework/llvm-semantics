; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000601.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S2 = type { i32, i32 }

@g_3 = global i32 -9, align 4
@g_6 = global i32 1, align 4
@g_5 = global i32* @g_6, align 8
@g_10 = global i32 767093092, align 4
@g_16 = global %struct.S2 { i32 1688278528, i32 1418978851 }, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_16.f0 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_16.f1 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca [6 x i16], align 2
  volatile store i32 1, i32* @g_3, align 4
  %tmp43 = volatile load i32* @g_3, align 4
  %cmp54 = icmp slt i32 %tmp43, 4
  br i1 %cmp54, label %for.cond10.preheader.lr.ph, label %for.end27

for.cond10.preheader.lr.ph:                       ; preds = %entry
  %arrayidx21 = getelementptr inbounds [6 x i16]* %l_4, i64 0, i64 1
  %arrayidx16 = getelementptr [6 x i16]* %l_4, i64 0, i64 0
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond10.preheader.lr.ph, %for.cond10.preheader
  store i16 -10033, i16* %arrayidx16, align 2
  store i16 -10033, i16* %arrayidx21, align 2
  %arrayidx16.2 = getelementptr [6 x i16]* %l_4, i64 0, i64 2
  store i16 -10033, i16* %arrayidx16.2, align 2
  %arrayidx16.3 = getelementptr [6 x i16]* %l_4, i64 0, i64 3
  store i16 -10033, i16* %arrayidx16.3, align 2
  %arrayidx16.4 = getelementptr [6 x i16]* %l_4, i64 0, i64 4
  store i16 -10033, i16* %arrayidx16.4, align 2
  %arrayidx16.5 = getelementptr [6 x i16]* %l_4, i64 0, i64 5
  store i16 -10033, i16* %arrayidx16.5, align 2
  %tmp23 = volatile load i32** @g_5, align 8
  %tmp24 = load i32* %tmp23, align 4
  %xor = xor i32 %tmp24, 55503
  store i32 %xor, i32* %tmp23, align 4
  %tmp26 = volatile load i32* @g_3, align 4
  %add = add nsw i32 %tmp26, 4
  volatile store i32 %add, i32* @g_3, align 4
  %tmp4 = volatile load i32* @g_3, align 4
  %cmp5 = icmp slt i32 %tmp4, 4
  br i1 %cmp5, label %for.cond10.preheader, label %for.end27

for.end27:                                        ; preds = %for.cond10.preheader, %entry
  %tmp28 = volatile load i32** @g_5, align 8
  %tmp29 = load i32* %tmp28, align 4
  %conv30 = trunc i32 %tmp29 to i16
  %tmp31 = load i32* @g_6, align 4
  %conv32 = trunc i32 %tmp31 to i16
  %cmp.i = icmp eq i16 %conv32, 0
  br i1 %cmp.i, label %cond.true.i, label %lor.lhs.false.i

lor.lhs.false.i:                                  ; preds = %for.end27
  %cmp4.i = icmp eq i16 %conv30, -32768
  %cmp8.i = icmp eq i16 %conv32, -1
  %or.cond.i = and i1 %cmp4.i, %cmp8.i
  br i1 %or.cond.i, label %cond.true.i, label %cond.false.i

cond.true.i:                                      ; preds = %lor.lhs.false.i, %for.end27
  %conv11.i = sext i16 %conv30 to i32
  br label %safe_mod_func_int16_t_s_s.exit

cond.false.i:                                     ; preds = %lor.lhs.false.i
  %conv13.i = sext i16 %conv30 to i32
  %conv15.i = sext i16 %conv32 to i32
  %rem.i = srem i32 %conv13.i, %conv15.i
  br label %safe_mod_func_int16_t_s_s.exit

safe_mod_func_int16_t_s_s.exit:                   ; preds = %cond.true.i, %cond.false.i
  %cond.i = phi i32 [ %conv11.i, %cond.true.i ], [ %rem.i, %cond.false.i ]
  %sext = shl i32 %cond.i, 16
  %conv33 = ashr exact i32 %sext, 16
  %tmp35 = load i32* @g_10, align 4
  %and = and i32 %conv33, %tmp35
  store i32 %and, i32* @g_10, align 4
  ret i32 %tmp31
}

define i32* @func_11(i32* nocapture %p_12, i64 %p_13.coerce, i32* nocapture %p_14) nounwind uwtable readnone {
entry:
  ret i32* @g_6
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_4.i = alloca [6 x i16], align 2
  %0 = bitcast [6 x i16]* %l_4.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  volatile store i32 1, i32* @g_3, align 4
  %tmp43.i = volatile load i32* @g_3, align 4
  %cmp54.i = icmp slt i32 %tmp43.i, 4
  br i1 %cmp54.i, label %for.cond10.preheader.lr.ph.i, label %for.end27.i

for.cond10.preheader.lr.ph.i:                     ; preds = %entry
  %arrayidx21.i = getelementptr inbounds [6 x i16]* %l_4.i, i64 0, i64 1
  %arrayidx16.2.i = getelementptr [6 x i16]* %l_4.i, i64 0, i64 2
  %arrayidx16.4.i = getelementptr [6 x i16]* %l_4.i, i64 0, i64 4
  br label %for.cond10.preheader.i

for.cond10.preheader.i:                           ; preds = %for.cond10.preheader.i, %for.cond10.preheader.lr.ph.i
  %tmp23.i = volatile load i32** @g_5, align 8
  %tmp24.i = load i32* %tmp23.i, align 4
  %xor.i = xor i32 %tmp24.i, 55503
  store i32 %xor.i, i32* %tmp23.i, align 4
  %tmp26.i = volatile load i32* @g_3, align 4
  %add.i = add nsw i32 %tmp26.i, 4
  volatile store i32 %add.i, i32* @g_3, align 4
  %tmp4.i = volatile load i32* @g_3, align 4
  %cmp5.i = icmp slt i32 %tmp4.i, 4
  br i1 %cmp5.i, label %for.cond10.preheader.i, label %for.end27.i.loopexit

for.end27.i.loopexit:                             ; preds = %for.cond10.preheader.i
  %arrayidx16.i = getelementptr [6 x i16]* %l_4.i, i64 0, i64 0
  %arrayidx16.3.i = getelementptr [6 x i16]* %l_4.i, i64 0, i64 3
  %arrayidx16.5.i = getelementptr [6 x i16]* %l_4.i, i64 0, i64 5
  store i16 -10033, i16* %arrayidx16.5.i, align 2
  store i16 -10033, i16* %arrayidx16.4.i, align 2
  store i16 -10033, i16* %arrayidx16.3.i, align 2
  store i16 -10033, i16* %arrayidx16.2.i, align 2
  store i16 -10033, i16* %arrayidx21.i, align 2
  store i16 -10033, i16* %arrayidx16.i, align 2
  br label %for.end27.i

for.end27.i:                                      ; preds = %for.end27.i.loopexit, %entry
  %tmp28.i = volatile load i32** @g_5, align 8
  %tmp29.i = load i32* %tmp28.i, align 4
  %conv30.i = trunc i32 %tmp29.i to i16
  %tmp31.i = load i32* @g_6, align 4
  %conv32.i = trunc i32 %tmp31.i to i16
  %cmp.i.i = icmp eq i16 %conv32.i, 0
  br i1 %cmp.i.i, label %cond.true.i.i, label %lor.lhs.false.i.i

lor.lhs.false.i.i:                                ; preds = %for.end27.i
  %cmp4.i.i = icmp eq i16 %conv30.i, -32768
  %cmp8.i.i = icmp eq i16 %conv32.i, -1
  %or.cond.i.i = and i1 %cmp4.i.i, %cmp8.i.i
  br i1 %or.cond.i.i, label %cond.true.i.i, label %cond.false.i.i

cond.true.i.i:                                    ; preds = %lor.lhs.false.i.i, %for.end27.i
  %conv11.i.i = sext i16 %conv30.i to i32
  br label %func_1.exit

cond.false.i.i:                                   ; preds = %lor.lhs.false.i.i
  %conv13.i.i = sext i16 %conv30.i to i32
  %conv15.i.i = sext i16 %conv32.i to i32
  %rem.i.i = srem i32 %conv13.i.i, %conv15.i.i
  br label %func_1.exit

func_1.exit:                                      ; preds = %cond.true.i.i, %cond.false.i.i
  %cond.i.i = phi i32 [ %conv11.i.i, %cond.true.i.i ], [ %rem.i.i, %cond.false.i.i ]
  %sext.i = shl i32 %cond.i.i, 16
  %conv33.i = ashr exact i32 %sext.i, 16
  %tmp35.i = load i32* @g_10, align 4
  %and.i = and i32 %conv33.i, %tmp35.i
  store i32 %and.i, i32* @g_10, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = volatile load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_6, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_10, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds (%struct.S2* @g_16, i64 0, i32 0), align 8
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds (%struct.S2* @g_16, i64 0, i32 1), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
