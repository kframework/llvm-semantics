; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001722.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 9, align 4
@g_6 = global i32* @g_3, align 8
@g_5 = global i32** @g_6, align 8
@g_17 = global i16 -11857, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_17 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [7 x i64], align 16
  %l_4 = alloca [3 x i32*], align 16
  %arrayidx = getelementptr [7 x i64]* %l_2, i64 0, i64 0
  store i64 1, i64* %arrayidx, align 16
  %arrayidx.1 = getelementptr [7 x i64]* %l_2, i64 0, i64 1
  store i64 1, i64* %arrayidx.1, align 8
  %arrayidx.2 = getelementptr [7 x i64]* %l_2, i64 0, i64 2
  store i64 1, i64* %arrayidx.2, align 16
  %arrayidx.3 = getelementptr [7 x i64]* %l_2, i64 0, i64 3
  store i64 1, i64* %arrayidx.3, align 8
  %arrayidx.4 = getelementptr [7 x i64]* %l_2, i64 0, i64 4
  store i64 1, i64* %arrayidx.4, align 16
  %arrayidx.5 = getelementptr [7 x i64]* %l_2, i64 0, i64 5
  store i64 1, i64* %arrayidx.5, align 8
  %arrayidx.6 = getelementptr [7 x i64]* %l_2, i64 0, i64 6
  store i64 1, i64* %arrayidx.6, align 16
  store i32 6, i32* @g_3, align 4
  %arrayidx22 = getelementptr inbounds [3 x i32*]* %l_4, i64 0, i64 2
  br label %for.cond11.preheader

for.cond11.preheader:                             ; preds = %for.inc174.for.cond11.preheader_crit_edge, %entry
  %tmp29 = phi i1 [ false, %entry ], [ %phitmp, %for.inc174.for.cond11.preheader_crit_edge ]
  %indvar = phi i32 [ 1, %entry ], [ %phitmp28, %for.inc174.for.cond11.preheader_crit_edge ]
  %0 = phi i32 [ 5, %entry ], [ %phitmp27, %for.inc174.for.cond11.preheader_crit_edge ]
  %arrayidx17 = getelementptr [3 x i32*]* %l_4, i64 0, i64 0
  store i32* @g_3, i32** %arrayidx17, align 16
  %arrayidx17.1 = getelementptr [3 x i32*]* %l_4, i64 0, i64 1
  store i32* @g_3, i32** %arrayidx17.1, align 8
  store i32* @g_3, i32** %arrayidx22, align 16
  %tmp24 = volatile load i32*** @g_5, align 8
  store i32* @g_3, i32** %tmp24, align 8
  br i1 %tmp29, label %for.cond111.preheader, label %for.inc174

for.cond111.preheader:                            ; preds = %for.cond11.preheader
  %tmp39 = volatile load i32*** @g_5, align 8
  store i16 0, i16* @g_17, align 2
  br label %for.inc174

for.inc174:                                       ; preds = %for.cond111.preheader, %for.cond11.preheader
  %exitcond = icmp eq i32 %indvar, 7
  br i1 %exitcond, label %for.end176, label %for.inc174.for.cond11.preheader_crit_edge

for.inc174.for.cond11.preheader_crit_edge:        ; preds = %for.inc174
  %idxprom27.phi.trans.insert = zext i32 %0 to i64
  %arrayidx28.phi.trans.insert = getelementptr inbounds [7 x i64]* %l_2, i64 0, i64 %idxprom27.phi.trans.insert
  %tmp29.pre = load i64* %arrayidx28.phi.trans.insert, align 8
  %phitmp = icmp eq i64 %tmp29.pre, 0
  %phitmp27 = add i32 %0, -1
  %phitmp28 = add i32 %indvar, 1
  br label %for.cond11.preheader

for.end176:                                       ; preds = %for.inc174
  store i32 -1, i32* @g_3, align 4
  %tmp177 = load i16* @g_17, align 2
  ret i16 %tmp177
}

define i32 @func_12(i32 %p_13, i16 zeroext %p_14, i64 %p_15, i32** nocapture %p_16) nounwind uwtable readonly {
entry:
  %tmp1 = load i32** @g_6, align 8
  %tmp2 = load i32* %tmp1, align 4
  ret i32 %tmp2
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_2.i = alloca [7 x i64], align 16
  %l_4.i = alloca [3 x i32*], align 16
  %0 = bitcast [7 x i64]* %l_2.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %1 = bitcast [3 x i32*]* %l_4.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1)
  %arrayidx.i = getelementptr [7 x i64]* %l_2.i, i64 0, i64 0
  store i64 1, i64* %arrayidx.i, align 16
  %arrayidx.1.i = getelementptr [7 x i64]* %l_2.i, i64 0, i64 1
  store i64 1, i64* %arrayidx.1.i, align 8
  %arrayidx.2.i = getelementptr [7 x i64]* %l_2.i, i64 0, i64 2
  store i64 1, i64* %arrayidx.2.i, align 16
  %arrayidx.3.i = getelementptr [7 x i64]* %l_2.i, i64 0, i64 3
  store i64 1, i64* %arrayidx.3.i, align 8
  %arrayidx.4.i = getelementptr [7 x i64]* %l_2.i, i64 0, i64 4
  store i64 1, i64* %arrayidx.4.i, align 16
  %arrayidx.5.i = getelementptr [7 x i64]* %l_2.i, i64 0, i64 5
  store i64 1, i64* %arrayidx.5.i, align 8
  %arrayidx.6.i = getelementptr [7 x i64]* %l_2.i, i64 0, i64 6
  store i64 1, i64* %arrayidx.6.i, align 16
  store i32 6, i32* @g_3, align 4
  %arrayidx17.i = getelementptr [3 x i32*]* %l_4.i, i64 0, i64 0
  br label %for.cond11.preheader.i

for.cond11.preheader.i:                           ; preds = %for.inc174.for.cond11.preheader_crit_edge.i, %entry
  %indvar = phi i32 [ %indvar.i, %for.inc174.for.cond11.preheader_crit_edge.i ], [ 0, %entry ]
  %tmp29.i = phi i1 [ %phitmp.i, %for.inc174.for.cond11.preheader_crit_edge.i ], [ false, %entry ]
  %indvar.i = add i32 %indvar, 1
  %tmp4 = sub i32 5, %indvar
  %tmp24.i = volatile load i32*** @g_5, align 8
  store i32* @g_3, i32** %tmp24.i, align 8
  br i1 %tmp29.i, label %for.cond111.preheader.i, label %for.inc174.i

for.cond111.preheader.i:                          ; preds = %for.cond11.preheader.i
  %tmp39.i = volatile load i32*** @g_5, align 8
  store i16 0, i16* @g_17, align 2
  br label %for.inc174.i

for.inc174.i:                                     ; preds = %for.cond111.preheader.i, %for.cond11.preheader.i
  %exitcond.i = icmp eq i32 %indvar.i, 7
  br i1 %exitcond.i, label %func_1.exit, label %for.inc174.for.cond11.preheader_crit_edge.i

for.inc174.for.cond11.preheader_crit_edge.i:      ; preds = %for.inc174.i
  %idxprom27.phi.trans.insert.i = zext i32 %tmp4 to i64
  %arrayidx28.phi.trans.insert.i = getelementptr inbounds [7 x i64]* %l_2.i, i64 0, i64 %idxprom27.phi.trans.insert.i
  %tmp29.pre.i = load i64* %arrayidx28.phi.trans.insert.i, align 8
  %phitmp.i = icmp eq i64 %tmp29.pre.i, 0
  br label %for.cond11.preheader.i

func_1.exit:                                      ; preds = %for.inc174.i
  %arrayidx22.i = getelementptr inbounds [3 x i32*]* %l_4.i, i64 0, i64 2
  %arrayidx17.1.i = getelementptr [3 x i32*]* %l_4.i, i64 0, i64 1
  store i32* @g_3, i32** %arrayidx22.i, align 16
  store i32* @g_3, i32** %arrayidx17.1.i, align 8
  store i32* @g_3, i32** %arrayidx17.i, align 16
  store i32 -1, i32* @g_3, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  call void @llvm.lifetime.end(i64 -1, i8* %1)
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 -1) nounwind
  %tmp2 = load i16* @g_17, align 2
  %conv = zext i16 %tmp2 to i32
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %conv) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
