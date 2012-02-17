; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001925.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_13 = global i32 0, align 4
@g_25 = global i32* null, align 8
@g_24 = global i32** @g_25, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_17 = alloca [10 x i8], align 1
  %l_1711 = getelementptr inbounds [10 x i8]* %l_17, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %l_1711, i8 1, i64 10, i32 1, i1 false)
  volatile store i32 -26, i32* @g_2, align 4
  %tmp46 = volatile load i32* @g_2, align 4
  %cmp57 = icmp eq i32 %tmp46, -12
  br i1 %cmp57, label %for.body6, label %for.end47

for.body6:                                        ; preds = %entry, %for.inc42
  volatile store i32 0, i32* @g_2, align 4
  %tmp133 = volatile load i32* @g_2, align 4
  %cmp144 = icmp slt i32 %tmp133, 10
  br i1 %cmp144, label %for.body16, label %for.inc42

for.body16:                                       ; preds = %for.body6, %for.body16
  %tmp17 = volatile load i32* @g_2, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %arrayidx19 = getelementptr inbounds [10 x i8]* %l_17, i64 0, i64 %idxprom18
  store i8 1, i8* %arrayidx19, align 1
  %tmp21 = volatile load i32* @g_2, align 4
  %add = add nsw i32 %tmp21, 1
  volatile store i32 %add, i32* @g_2, align 4
  %tmp13 = volatile load i32* @g_2, align 4
  %cmp14 = icmp slt i32 %tmp13, 10
  br i1 %cmp14, label %for.body16, label %for.inc42

for.inc42:                                        ; preds = %for.body6, %for.body16
  %tmp43 = volatile load i32* @g_2, align 4
  %sub.i = add i32 %tmp43, 251
  %conv46 = and i32 %sub.i, 255
  volatile store i32 %conv46, i32* @g_2, align 4
  %tmp4 = volatile load i32* @g_2, align 4
  %cmp5 = icmp eq i32 %tmp4, -12
  br i1 %cmp5, label %for.body6, label %for.cond3.for.end47_crit_edge

for.cond3.for.end47_crit_edge:                    ; preds = %for.inc42
  store i32 0, i32* @g_13, align 4
  br label %for.end47

for.end47:                                        ; preds = %for.cond3.for.end47_crit_edge, %entry
  %tmp48 = volatile load i32*** @g_24, align 8
  store i32* @g_2, i32** %tmp48, align 8
  %tmp49 = volatile load i32* @g_2, align 4
  %conv50 = trunc i32 %tmp49 to i16
  ret i16 %conv50
}

define i32* @func_5(i32* nocapture %p_6, i64 %p_7, i16 zeroext %p_8) nounwind uwtable {
entry:
  store i32 0, i32* @g_13, align 4
  ret i32* @g_13
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_17.i = alloca [10 x i8], align 1
  %0 = getelementptr inbounds [10 x i8]* %l_17.i, i64 0, i64 0
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  call void @llvm.memset.p0i8.i64(i8* %0, i8 1, i64 10, i32 1, i1 false) nounwind
  volatile store i32 -26, i32* @g_2, align 4
  %tmp46.i = volatile load i32* @g_2, align 4
  %cmp57.i = icmp eq i32 %tmp46.i, -12
  br i1 %cmp57.i, label %for.body6.i, label %func_1.exit

for.body6.i:                                      ; preds = %entry, %for.inc42.i
  volatile store i32 0, i32* @g_2, align 4
  %tmp133.i = volatile load i32* @g_2, align 4
  %cmp144.i = icmp slt i32 %tmp133.i, 10
  br i1 %cmp144.i, label %for.body16.i, label %for.inc42.i

for.body16.i:                                     ; preds = %for.body6.i, %for.body16.i
  %tmp17.i = volatile load i32* @g_2, align 4
  %idxprom18.i = sext i32 %tmp17.i to i64
  %arrayidx19.i = getelementptr inbounds [10 x i8]* %l_17.i, i64 0, i64 %idxprom18.i
  store i8 1, i8* %arrayidx19.i, align 1
  %tmp21.i = volatile load i32* @g_2, align 4
  %add.i = add nsw i32 %tmp21.i, 1
  volatile store i32 %add.i, i32* @g_2, align 4
  %tmp13.i = volatile load i32* @g_2, align 4
  %cmp14.i = icmp slt i32 %tmp13.i, 10
  br i1 %cmp14.i, label %for.body16.i, label %for.inc42.i

for.inc42.i:                                      ; preds = %for.body16.i, %for.body6.i
  %tmp43.i = volatile load i32* @g_2, align 4
  %sub.i.i = add i32 %tmp43.i, 251
  %conv46.i = and i32 %sub.i.i, 255
  volatile store i32 %conv46.i, i32* @g_2, align 4
  %tmp4.i = volatile load i32* @g_2, align 4
  %cmp5.i = icmp eq i32 %tmp4.i, -12
  br i1 %cmp5.i, label %for.body6.i, label %for.cond3.for.end47_crit_edge.i

for.cond3.for.end47_crit_edge.i:                  ; preds = %for.inc42.i
  store i32 0, i32* @g_13, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.cond3.for.end47_crit_edge.i
  %tmp48.i = volatile load i32*** @g_24, align 8
  store i32* @g_2, i32** %tmp48.i, align 8
  %tmp49.i = volatile load i32* @g_2, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_13, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
