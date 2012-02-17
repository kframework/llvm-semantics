; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000508.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 48830980, align 4
@g_22 = global i32 -481370261, align 4
@g_25 = global [3 x i32] [i32 -714509075, i32 -714509075, i32 -714509075], align 4
@g_24 = global i32* getelementptr inbounds ([3 x i32]* @g_25, i64 0, i64 1), align 8
@g_26 = global [1 x [3 x i32**]] [[3 x i32**] [i32** @g_24, i32** @g_24, i32** @g_24]], align 16
@g_27 = global i32** null, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_22 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_25[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_25[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_25[2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
for.end13:
  %l_11 = alloca [1 x [8 x i64]], align 16
  %arrayidx8.7 = getelementptr [1 x [8 x i64]]* %l_11, i64 0, i64 0, i64 7
  %arrayidx8.6 = getelementptr [1 x [8 x i64]]* %l_11, i64 0, i64 0, i64 6
  %arrayidx8.5 = getelementptr [1 x [8 x i64]]* %l_11, i64 0, i64 0, i64 5
  %arrayidx8.4 = getelementptr [1 x [8 x i64]]* %l_11, i64 0, i64 0, i64 4
  %arrayidx8.3 = getelementptr [1 x [8 x i64]]* %l_11, i64 0, i64 0, i64 3
  %arrayidx8.2 = getelementptr [1 x [8 x i64]]* %l_11, i64 0, i64 0, i64 2
  %arrayidx8.1 = getelementptr [1 x [8 x i64]]* %l_11, i64 0, i64 0, i64 1
  %arrayidx8 = getelementptr [1 x [8 x i64]]* %l_11, i64 0, i64 0, i64 0
  store i64 9, i64* %arrayidx8, align 16
  store i64 9, i64* %arrayidx8.1, align 8
  store i64 9, i64* %arrayidx8.2, align 16
  store i64 9, i64* %arrayidx8.3, align 8
  store i64 9, i64* %arrayidx8.4, align 16
  store i64 9, i64* %arrayidx8.5, align 8
  store i64 9, i64* %arrayidx8.6, align 16
  store i64 9, i64* %arrayidx8.7, align 8
  volatile store i32 0, i32* @g_2, align 4
  %tmp15 = volatile load i32* @g_2, align 4
  %cmp16 = icmp sgt i32 %tmp15, -1
  br i1 %cmp16, label %for.body17, label %for.end43

for.body17:                                       ; preds = %for.end13
  %arrayidx20 = getelementptr inbounds [1 x [8 x i64]]* %l_11, i64 0, i64 0, i64 5
  %tmp21 = load i64* %arrayidx20, align 8
  %tmp22 = volatile load i32* @g_2, align 4
  %conv = sext i32 %tmp22 to i64
  %cmp23 = icmp sgt i64 %tmp21, %conv
  br i1 %cmp23, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %for.body17
  %tmp27 = volatile load i32* @g_2, align 4
  br label %land.end

land.end:                                         ; preds = %for.body17, %land.rhs
  %tmp.i = volatile load i32* @g_2, align 4
  %conv31 = trunc i32 %tmp.i to i16
  %tobool33 = icmp eq i16 %conv31, 0
  br i1 %tobool33, label %if.else, label %return

if.else:                                          ; preds = %land.end
  br label %return

for.end43:                                        ; preds = %for.end13
  volatile store i32 0, i32* @g_2, align 4
  %tmp455 = volatile load i32* @g_2, align 4
  %cmp466 = icmp eq i32 %tmp455, -29
  br i1 %cmp466, label %for.end90, label %for.cond53.preheader

for.cond53.preheader:                             ; preds = %for.end43, %for.cond53.preheader
  %tmp65 = volatile load i32* @g_2, align 4
  %tmp86 = volatile load i32* @g_2, align 4
  %add.i = add i32 %tmp86, 1
  volatile store i32 %add.i, i32* @g_2, align 4
  %tmp45 = volatile load i32* @g_2, align 4
  %cmp46 = icmp eq i32 %tmp45, -29
  br i1 %cmp46, label %for.end90, label %for.cond53.preheader

for.end90:                                        ; preds = %for.cond53.preheader, %for.end43
  %tmp91 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i64 0, i64 1), align 4
  %conv92 = trunc i32 %tmp91 to i8
  br label %return

return:                                           ; preds = %land.end, %for.end90, %if.else
  %0 = phi i8 [ %conv92, %for.end90 ], [ 0, %if.else ], [ 1, %land.end ]
  ret i8 %0
}

define i32 @func_7(i64 %p_8) nounwind uwtable {
entry:
  %tmp = volatile load i32* @g_2, align 4
  ret i32 %tmp
}

define i32* @func_16(i8 signext %p_17, i8 zeroext %p_18, i32* nocapture %p_19, i16 signext %p_20, i32* %p_21) nounwind uwtable readnone {
entry:
  ret i32* %p_21
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_11.i = alloca [1 x [8 x i64]], align 16
  %0 = bitcast [1 x [8 x i64]]* %l_11.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx8.7.i = getelementptr [1 x [8 x i64]]* %l_11.i, i64 0, i64 0, i64 7
  %arrayidx8.6.i = getelementptr [1 x [8 x i64]]* %l_11.i, i64 0, i64 0, i64 6
  %arrayidx8.5.i = getelementptr [1 x [8 x i64]]* %l_11.i, i64 0, i64 0, i64 5
  %arrayidx8.4.i = getelementptr [1 x [8 x i64]]* %l_11.i, i64 0, i64 0, i64 4
  %arrayidx8.3.i = getelementptr [1 x [8 x i64]]* %l_11.i, i64 0, i64 0, i64 3
  %arrayidx8.2.i = getelementptr [1 x [8 x i64]]* %l_11.i, i64 0, i64 0, i64 2
  %arrayidx8.1.i = getelementptr [1 x [8 x i64]]* %l_11.i, i64 0, i64 0, i64 1
  %arrayidx8.i = getelementptr [1 x [8 x i64]]* %l_11.i, i64 0, i64 0, i64 0
  store i64 9, i64* %arrayidx8.i, align 16
  store i64 9, i64* %arrayidx8.1.i, align 8
  store i64 9, i64* %arrayidx8.2.i, align 16
  store i64 9, i64* %arrayidx8.3.i, align 8
  store i64 9, i64* %arrayidx8.4.i, align 16
  store i64 9, i64* %arrayidx8.5.i, align 8
  store i64 9, i64* %arrayidx8.6.i, align 16
  store i64 9, i64* %arrayidx8.7.i, align 8
  volatile store i32 0, i32* @g_2, align 4
  %tmp15.i = volatile load i32* @g_2, align 4
  %cmp16.i = icmp sgt i32 %tmp15.i, -1
  br i1 %cmp16.i, label %for.body17.i, label %for.end43.i

for.body17.i:                                     ; preds = %entry
  %tmp22.i = volatile load i32* @g_2, align 4
  %cmp23.i = icmp slt i32 %tmp22.i, 9
  br i1 %cmp23.i, label %land.rhs.i, label %land.end.i

land.rhs.i:                                       ; preds = %for.body17.i
  %tmp27.i = volatile load i32* @g_2, align 4
  br label %land.end.i

land.end.i:                                       ; preds = %land.rhs.i, %for.body17.i
  %tmp.i.i = volatile load i32* @g_2, align 4
  br label %func_1.exit

for.end43.i:                                      ; preds = %entry
  volatile store i32 0, i32* @g_2, align 4
  %tmp455.i = volatile load i32* @g_2, align 4
  %cmp466.i = icmp eq i32 %tmp455.i, -29
  br i1 %cmp466.i, label %func_1.exit, label %for.cond53.preheader.i

for.cond53.preheader.i:                           ; preds = %for.end43.i, %for.cond53.preheader.i
  %tmp65.i = volatile load i32* @g_2, align 4
  %tmp86.i = volatile load i32* @g_2, align 4
  %add.i.i = add i32 %tmp86.i, 1
  volatile store i32 %add.i.i, i32* @g_2, align 4
  %tmp45.i = volatile load i32* @g_2, align 4
  %cmp46.i = icmp eq i32 %tmp45.i, -29
  br i1 %cmp46.i, label %func_1.exit, label %for.cond53.preheader.i

func_1.exit:                                      ; preds = %for.cond53.preheader.i, %for.end43.i, %land.end.i
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_22, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i64 0, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i64 0, i64 1), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i64 0, i64 2), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([3 x i32]* @g_25, i64 0, i64 1), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %tmp10) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
