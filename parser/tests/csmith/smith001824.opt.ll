; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001824.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 174214363, align 4
@g_4 = global i32 8, align 4
@g_5 = global [9 x i32] zeroinitializer, align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5[0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5[1] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5[2] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5[3] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5[4] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_5[5] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_5[6] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [22 x i8] c"checksum g_5[7] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [22 x i8] c"checksum g_5[8] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca [7 x [6 x [1 x i16]]], align 16
  br label %for.inc17.5

for.end24:                                        ; preds = %for.inc17.5
  volatile store i32 0, i32* @g_3, align 4
  %tmp267 = volatile load i32* @g_3, align 4
  %cmp278 = icmp slt i32 %tmp267, 7
  br i1 %cmp278, label %for.cond29.preheader, label %for.end56

for.cond29.preheader:                             ; preds = %for.end24, %for.inc49.5
  volatile store i32 0, i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp344 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %cmp355 = icmp slt i32 %tmp344, 1
  br i1 %cmp355, label %for.body36, label %for.inc49

for.body36:                                       ; preds = %for.cond29.preheader, %for.body36
  %tmp37 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp41 = volatile load i32* @g_3, align 4
  %tmp = sext i32 %tmp41 to i64
  %tmp13 = mul i64 %tmp, 6
  %tmp14 = sext i32 %tmp37 to i64
  %tmp15 = add i64 %tmp13, %tmp14
  %arrayidx45 = getelementptr [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 0, i64 0, i64 %tmp15
  store i16 8670, i16* %arrayidx45, align 2
  %tmp47 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %add = add nsw i32 %tmp47, 1
  volatile store i32 %add, i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp34 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %cmp35 = icmp slt i32 %tmp34, 1
  br i1 %cmp35, label %for.body36, label %for.inc49

for.inc49:                                        ; preds = %for.body36, %for.cond29.preheader
  volatile store i32 0, i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp344.1 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %cmp355.1 = icmp slt i32 %tmp344.1, 1
  br i1 %cmp355.1, label %for.body36.1, label %for.inc49.1

for.cond25.for.end56_crit_edge:                   ; preds = %for.inc49.5
  store i32 6, i32* @g_4, align 4
  br label %for.end56

for.end56:                                        ; preds = %for.cond25.for.end56_crit_edge, %for.end24
  %arrayidx59 = getelementptr inbounds [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 1, i64 4, i64 0
  %tmp60 = load i16* %arrayidx59, align 4
  %conv = zext i16 %tmp60 to i32
  ret i32 %conv

for.inc49.1:                                      ; preds = %for.body36.1, %for.inc49
  volatile store i32 0, i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp344.2 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %cmp355.2 = icmp slt i32 %tmp344.2, 1
  br i1 %cmp355.2, label %for.body36.2, label %for.inc49.2

for.body36.1:                                     ; preds = %for.inc49, %for.body36.1
  %tmp37.1 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp41.1 = volatile load i32* @g_3, align 4
  %tmp.1 = sext i32 %tmp41.1 to i64
  %tmp13.1 = mul i64 %tmp.1, 6
  %tmp14.1 = sext i32 %tmp37.1 to i64
  %tmp15.1 = add i64 %tmp13.1, %tmp14.1
  %arrayidx45.1 = getelementptr [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 0, i64 1, i64 %tmp15.1
  store i16 8670, i16* %arrayidx45.1, align 2
  %tmp47.1 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %add.1 = add nsw i32 %tmp47.1, 1
  volatile store i32 %add.1, i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp34.1 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %cmp35.1 = icmp slt i32 %tmp34.1, 1
  br i1 %cmp35.1, label %for.body36.1, label %for.inc49.1

for.inc49.2:                                      ; preds = %for.body36.2, %for.inc49.1
  volatile store i32 0, i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp344.3 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %cmp355.3 = icmp slt i32 %tmp344.3, 1
  br i1 %cmp355.3, label %for.body36.3, label %for.inc49.3

for.body36.2:                                     ; preds = %for.inc49.1, %for.body36.2
  %tmp37.2 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp41.2 = volatile load i32* @g_3, align 4
  %tmp.2 = sext i32 %tmp41.2 to i64
  %tmp13.2 = mul i64 %tmp.2, 6
  %tmp14.2 = sext i32 %tmp37.2 to i64
  %tmp15.2 = add i64 %tmp13.2, %tmp14.2
  %arrayidx45.2 = getelementptr [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 0, i64 2, i64 %tmp15.2
  store i16 8670, i16* %arrayidx45.2, align 2
  %tmp47.2 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %add.2 = add nsw i32 %tmp47.2, 1
  volatile store i32 %add.2, i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp34.2 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %cmp35.2 = icmp slt i32 %tmp34.2, 1
  br i1 %cmp35.2, label %for.body36.2, label %for.inc49.2

for.inc49.3:                                      ; preds = %for.body36.3, %for.inc49.2
  volatile store i32 0, i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp344.4 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %cmp355.4 = icmp slt i32 %tmp344.4, 1
  br i1 %cmp355.4, label %for.body36.4, label %for.inc49.4

for.body36.3:                                     ; preds = %for.inc49.2, %for.body36.3
  %tmp37.3 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp41.3 = volatile load i32* @g_3, align 4
  %tmp.3 = sext i32 %tmp41.3 to i64
  %tmp13.3 = mul i64 %tmp.3, 6
  %tmp14.3 = sext i32 %tmp37.3 to i64
  %tmp15.3 = add i64 %tmp13.3, %tmp14.3
  %arrayidx45.3 = getelementptr [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 0, i64 3, i64 %tmp15.3
  store i16 8670, i16* %arrayidx45.3, align 2
  %tmp47.3 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %add.3 = add nsw i32 %tmp47.3, 1
  volatile store i32 %add.3, i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp34.3 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %cmp35.3 = icmp slt i32 %tmp34.3, 1
  br i1 %cmp35.3, label %for.body36.3, label %for.inc49.3

for.inc49.4:                                      ; preds = %for.body36.4, %for.inc49.3
  volatile store i32 0, i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp344.5 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %cmp355.5 = icmp slt i32 %tmp344.5, 1
  br i1 %cmp355.5, label %for.body36.5, label %for.inc49.5

for.body36.4:                                     ; preds = %for.inc49.3, %for.body36.4
  %tmp37.4 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp41.4 = volatile load i32* @g_3, align 4
  %tmp.4 = sext i32 %tmp41.4 to i64
  %tmp13.4 = mul i64 %tmp.4, 6
  %tmp14.4 = sext i32 %tmp37.4 to i64
  %tmp15.4 = add i64 %tmp13.4, %tmp14.4
  %arrayidx45.4 = getelementptr [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 0, i64 4, i64 %tmp15.4
  store i16 8670, i16* %arrayidx45.4, align 2
  %tmp47.4 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %add.4 = add nsw i32 %tmp47.4, 1
  volatile store i32 %add.4, i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp34.4 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %cmp35.4 = icmp slt i32 %tmp34.4, 1
  br i1 %cmp35.4, label %for.body36.4, label %for.inc49.4

for.inc49.5:                                      ; preds = %for.body36.5, %for.inc49.4
  %tmp54 = volatile load i32* @g_3, align 4
  %add55 = add nsw i32 %tmp54, 1
  volatile store i32 %add55, i32* @g_3, align 4
  %tmp26 = volatile load i32* @g_3, align 4
  %cmp27 = icmp slt i32 %tmp26, 7
  br i1 %cmp27, label %for.cond29.preheader, label %for.cond25.for.end56_crit_edge

for.body36.5:                                     ; preds = %for.inc49.4, %for.body36.5
  %tmp37.5 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp41.5 = volatile load i32* @g_3, align 4
  %tmp.5 = sext i32 %tmp41.5 to i64
  %tmp13.5 = mul i64 %tmp.5, 6
  %tmp14.5 = sext i32 %tmp37.5 to i64
  %tmp15.5 = add i64 %tmp13.5, %tmp14.5
  %arrayidx45.5 = getelementptr [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 0, i64 5, i64 %tmp15.5
  store i16 8670, i16* %arrayidx45.5, align 2
  %tmp47.5 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %add.5 = add nsw i32 %tmp47.5, 1
  volatile store i32 %add.5, i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %tmp34.5 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %cmp35.5 = icmp slt i32 %tmp34.5, 1
  br i1 %cmp35.5, label %for.body36.5, label %for.inc49.5

for.inc17.5:                                      ; preds = %for.inc17.5, %entry
  %indvar20 = phi i64 [ 0, %entry ], [ %indvar.next21, %for.inc17.5 ]
  %scevgep31 = getelementptr [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 %indvar20, i64 5, i64 0
  %scevgep33 = getelementptr [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 %indvar20, i64 4, i64 0
  %scevgep35 = getelementptr [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 %indvar20, i64 3, i64 0
  %scevgep37 = getelementptr [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 %indvar20, i64 2, i64 0
  %scevgep39 = getelementptr [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 %indvar20, i64 1, i64 0
  %arrayidx15 = getelementptr [7 x [6 x [1 x i16]]]* %l_2, i64 0, i64 %indvar20, i64 0, i64 0
  store i16 -7898, i16* %arrayidx15, align 4
  store i16 -7898, i16* %scevgep39, align 2
  store i16 -7898, i16* %scevgep37, align 4
  store i16 -7898, i16* %scevgep35, align 2
  store i16 -7898, i16* %scevgep33, align 4
  store i16 -7898, i16* %scevgep31, align 2
  %indvar.next21 = add i64 %indvar20, 1
  %exitcond = icmp eq i64 %indvar.next21, 7
  br i1 %exitcond, label %for.end24, label %for.inc17.5
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call i32 @func_1()
  %tmp = volatile load i32* @g_3, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_4, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 0), align 16
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 1), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 2), align 8
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 3), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 4), align 16
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 5), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 6), align 8
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 8), align 16
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = volatile load i32* getelementptr inbounds ([9 x i32]* @g_5, i64 0, i64 7), align 4
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str9, i64 0, i64 0), i32 %tmp22) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
