; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000403.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = constant i16 -1, align 2
@g_3 = global i16 8, align 2
@g_5 = global [6 x i32] [i32 1213985372, i32 1213985372, i32 1213985372, i32 1213985372, i32 1213985372, i32 1213985372], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5[4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_5[5] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca [5 x i32], align 16
  %arrayidx = getelementptr [5 x i32]* %l_4, i64 0, i64 0
  store i32 1806489493, i32* %arrayidx, align 16
  %arrayidx.1 = getelementptr [5 x i32]* %l_4, i64 0, i64 1
  store i32 1806489493, i32* %arrayidx.1, align 4
  %arrayidx.2 = getelementptr [5 x i32]* %l_4, i64 0, i64 2
  store i32 1806489493, i32* %arrayidx.2, align 8
  %arrayidx.3 = getelementptr [5 x i32]* %l_4, i64 0, i64 3
  store i32 1806489493, i32* %arrayidx.3, align 4
  %arrayidx.4 = getelementptr [5 x i32]* %l_4, i64 0, i64 4
  store i32 1806489493, i32* %arrayidx.4, align 16
  %tmp3 = volatile load i16* @g_2, align 2
  volatile store i16 %tmp3, i16* @g_3, align 2
  volatile store i16 2, i16* @g_3, align 2
  %tmp52 = volatile load i16* @g_3, align 2
  %cmp63 = icmp slt i16 %tmp52, 5
  %tmp124 = volatile load i16* @g_3, align 2
  br i1 %cmp63, label %for.inc11, label %for.end15

for.inc11:                                        ; preds = %entry, %for.inc11
  %tmp125 = phi i16 [ %tmp12, %for.inc11 ], [ %tmp124, %entry ]
  %add = add i16 %tmp125, 3
  volatile store i16 %add, i16* @g_3, align 2
  %tmp5 = volatile load i16* @g_3, align 2
  %cmp6 = icmp slt i16 %tmp5, 5
  %tmp12 = volatile load i16* @g_3, align 2
  br i1 %cmp6, label %for.inc11, label %for.end15

for.end15:                                        ; preds = %for.inc11, %entry
  %tmp12.lcssa = phi i16 [ %tmp124, %entry ], [ %tmp12, %for.inc11 ]
  %0 = urem i16 %tmp12.lcssa, 5
  %idxprom18 = zext i16 %0 to i64
  %arrayidx19 = getelementptr inbounds [5 x i32]* %l_4, i64 0, i64 %idxprom18
  %tmp20 = load i32* %arrayidx19, align 4
  %conv21 = trunc i32 %tmp20 to i16
  ret i16 %conv21
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_4.i = alloca [5 x i32], align 16
  %0 = bitcast [5 x i32]* %l_4.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx.i = getelementptr [5 x i32]* %l_4.i, i64 0, i64 0
  store i32 1806489493, i32* %arrayidx.i, align 16
  %arrayidx.1.i = getelementptr [5 x i32]* %l_4.i, i64 0, i64 1
  store i32 1806489493, i32* %arrayidx.1.i, align 4
  %arrayidx.2.i = getelementptr [5 x i32]* %l_4.i, i64 0, i64 2
  store i32 1806489493, i32* %arrayidx.2.i, align 8
  %arrayidx.3.i = getelementptr [5 x i32]* %l_4.i, i64 0, i64 3
  store i32 1806489493, i32* %arrayidx.3.i, align 4
  %arrayidx.4.i = getelementptr [5 x i32]* %l_4.i, i64 0, i64 4
  store i32 1806489493, i32* %arrayidx.4.i, align 16
  %tmp3.i = volatile load i16* @g_2, align 2
  volatile store i16 %tmp3.i, i16* @g_3, align 2
  volatile store i16 2, i16* @g_3, align 2
  %tmp52.i = volatile load i16* @g_3, align 2
  %cmp63.i = icmp slt i16 %tmp52.i, 5
  %tmp124.i = volatile load i16* @g_3, align 2
  br i1 %cmp63.i, label %for.inc11.i, label %func_1.exit

for.inc11.i:                                      ; preds = %entry, %for.inc11.i
  %tmp125.i = phi i16 [ %tmp12.i, %for.inc11.i ], [ %tmp124.i, %entry ]
  %add.i = add i16 %tmp125.i, 3
  volatile store i16 %add.i, i16* @g_3, align 2
  %tmp5.i = volatile load i16* @g_3, align 2
  %cmp6.i = icmp slt i16 %tmp5.i, 5
  %tmp12.i = volatile load i16* @g_3, align 2
  br i1 %cmp6.i, label %for.inc11.i, label %func_1.exit

func_1.exit:                                      ; preds = %for.inc11.i, %entry
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = volatile load i16* @g_2, align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = volatile load i16* @g_3, align 2
  %conv3 = sext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %conv3) nounwind
  %tmp5 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i64 0, i64 0), align 16
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp5) nounwind
  %tmp7 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i64 0, i64 1), align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp7) nounwind
  %tmp9 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i64 0, i64 2), align 8
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp9) nounwind
  %tmp11 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i64 0, i64 3), align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp11) nounwind
  %tmp13 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i64 0, i64 4), align 16
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %tmp13) nounwind
  %tmp15 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i64 0, i64 5), align 4
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 %tmp15) nounwind
  %tmp17 = volatile load i32* getelementptr inbounds ([6 x i32]* @g_5, i64 0, i64 0), align 16
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp17) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
