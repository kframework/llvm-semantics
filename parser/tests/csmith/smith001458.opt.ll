; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001458.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [2 x [6 x i32]] [[6 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1], [6 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 -1, i32 -1]], align 16
@g_3 = global i32 635938415, align 4
@g_4 = global i32 0, align 4
@g_12 = global i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 1, i64 5), align 8
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][1] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][2] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][3] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][4] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_2[1][5] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i32* @g_4, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %entry, %for.inc25
  %indvar = phi i32 [ 0, %entry ], [ %indvar.next, %for.inc25 ]
  %tmp8 = shl i32 %indvar, 1
  %storemerge111 = or i32 %tmp8, 1
  %cmp15 = icmp slt i32 %storemerge111, 2
  br i1 %cmp15, label %for.body16, label %for.end28

for.body16:                                       ; preds = %for.cond13
  volatile store i32 1, i32* @g_4, align 4
  %tmp18 = volatile load i32* @g_4, align 4
  %cmp19 = icmp slt i32 %tmp18, 6
  br i1 %cmp19, label %for.body20, label %for.inc25

for.body20:                                       ; preds = %for.body16
  store i32 %storemerge111, i32* @g_3, align 4
  %tmp21 = volatile load i32* @g_4, align 4
  br label %return

for.inc25:                                        ; preds = %for.body16
  %indvar.next = add i32 %indvar, 1
  br label %for.cond13

for.end28:                                        ; preds = %for.cond13
  store i32 %storemerge111, i32* @g_3, align 4
  %tmp29 = volatile load i32* @g_4, align 4
  %rem30 = urem i32 %tmp29, 6
  %idxprom31 = zext i32 %rem30 to i64
  %arrayidx36 = getelementptr inbounds [2 x [6 x i32]]* @g_2, i64 0, i64 1, i64 %idxprom31
  store i32* %arrayidx36, i32** @g_12, align 8
  br label %return

return:                                           ; preds = %for.end28, %for.body20
  %storemerge2.in = phi i32 [ %tmp21, %for.body20 ], [ %storemerge111, %for.end28 ]
  %storemerge2 = trunc i32 %storemerge2.in to i8
  ret i8 %storemerge2
}

define i32* @func_5(i32* nocapture %p_6, i32* nocapture %p_7, i32* %p_8, i16 signext %p_9) nounwind uwtable readnone {
entry:
  ret i32* %p_8
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i32* @g_4, align 4
  br label %for.cond13.i

for.cond13.i:                                     ; preds = %for.inc25.i, %entry
  %indvar.i = phi i32 [ 0, %entry ], [ %indvar.next.i, %for.inc25.i ]
  %tmp3 = shl i32 %indvar.i, 1
  %storemerge111.i6 = or i32 %tmp3, 1
  %cmp15.i = icmp slt i32 %storemerge111.i6, 2
  br i1 %cmp15.i, label %for.body16.i, label %for.end28.i

for.body16.i:                                     ; preds = %for.cond13.i
  volatile store i32 1, i32* @g_4, align 4
  %tmp18.i = volatile load i32* @g_4, align 4
  %cmp19.i = icmp slt i32 %tmp18.i, 6
  br i1 %cmp19.i, label %for.body20.i, label %for.inc25.i

for.body20.i:                                     ; preds = %for.body16.i
  store i32 %storemerge111.i6, i32* @g_3, align 4
  %tmp21.i = volatile load i32* @g_4, align 4
  br label %func_1.exit

for.inc25.i:                                      ; preds = %for.body16.i
  %indvar.next.i = add i32 %indvar.i, 1
  br label %for.cond13.i

for.end28.i:                                      ; preds = %for.cond13.i
  store i32 %storemerge111.i6, i32* @g_3, align 4
  %tmp29.i = volatile load i32* @g_4, align 4
  %rem30.i = urem i32 %tmp29.i, 6
  %idxprom31.i = zext i32 %rem30.i to i64
  %arrayidx36.i = getelementptr inbounds [2 x [6 x i32]]* @g_2, i64 0, i64 1, i64 %idxprom31.i
  store i32* %arrayidx36.i, i32** @g_12, align 8
  br label %func_1.exit

func_1.exit:                                      ; preds = %for.body20.i, %for.end28.i
  %tmp = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 0, i64 5), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 1, i64 0), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 1, i64 1), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 1, i64 2), align 8
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 1, i64 3), align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 1, i64 4), align 8
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([2 x [6 x i32]]* @g_2, i64 0, i64 1, i64 5), align 4
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* @g_3, align 4
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str12, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = volatile load i32* @g_4, align 4
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str13, i64 0, i64 0), i32 %tmp26) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
