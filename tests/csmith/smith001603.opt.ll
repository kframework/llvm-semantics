; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001603.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -512397033, align 4
@g_5 = global [6 x [2 x [2 x i32]]] [[2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]], [2 x [2 x i32]] [[2 x i32] [i32 -2, i32 -2], [2 x i32] [i32 -2, i32 -2]]], align 16
@g_6 = global i32 -836883443, align 4
@g_7 = global i32 891083955, align 4
@g_15 = global i32 1749084996, align 4
@g_27 = global i32* @g_7, align 8
@g_26 = constant i32** @g_27, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [28 x i8] c"checksum g_5[0][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [28 x i8] c"checksum g_5[0][0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [28 x i8] c"checksum g_5[0][1][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [28 x i8] c"checksum g_5[0][1][1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"checksum g_5[1][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [28 x i8] c"checksum g_5[1][0][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [28 x i8] c"checksum g_5[1][1][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [28 x i8] c"checksum g_5[1][1][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [28 x i8] c"checksum g_5[2][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [28 x i8] c"checksum g_5[2][0][1] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [28 x i8] c"checksum g_5[2][1][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [28 x i8] c"checksum g_5[2][1][1] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [28 x i8] c"checksum g_5[3][0][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [28 x i8] c"checksum g_5[3][0][1] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [28 x i8] c"checksum g_5[3][1][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [28 x i8] c"checksum g_5[3][1][1] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [28 x i8] c"checksum g_5[4][0][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [28 x i8] c"checksum g_5[4][0][1] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [28 x i8] c"checksum g_5[4][1][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [28 x i8] c"checksum g_5[4][1][1] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [28 x i8] c"checksum g_5[5][0][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [28 x i8] c"checksum g_5[5][0][1] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [28 x i8] c"checksum g_5[5][1][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [28 x i8] c"checksum g_5[5][1][1] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [20 x i8] c"checksum g_15 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_16 = alloca [8 x i32], align 16
  %arrayidx = getelementptr [8 x i32]* %l_16, i64 0, i64 0
  store i32 -2053899842, i32* %arrayidx, align 16
  %arrayidx.1 = getelementptr [8 x i32]* %l_16, i64 0, i64 1
  store i32 -2053899842, i32* %arrayidx.1, align 4
  %arrayidx.2 = getelementptr [8 x i32]* %l_16, i64 0, i64 2
  store i32 -2053899842, i32* %arrayidx.2, align 8
  %arrayidx.3 = getelementptr [8 x i32]* %l_16, i64 0, i64 3
  store i32 -2053899842, i32* %arrayidx.3, align 4
  %arrayidx.4 = getelementptr [8 x i32]* %l_16, i64 0, i64 4
  store i32 -2053899842, i32* %arrayidx.4, align 16
  %arrayidx.5 = getelementptr [8 x i32]* %l_16, i64 0, i64 5
  store i32 -2053899842, i32* %arrayidx.5, align 4
  %arrayidx.6 = getelementptr [8 x i32]* %l_16, i64 0, i64 6
  store i32 -2053899842, i32* %arrayidx.6, align 8
  %arrayidx.7 = getelementptr [8 x i32]* %l_16, i64 0, i64 7
  store i32 -2053899842, i32* %arrayidx.7, align 4
  volatile store i32 -10, i32* @g_2, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc133, %entry
  %tmp4 = volatile load i32* @g_2, align 4
  %cmp5 = icmp slt i32 %tmp4, 1
  br i1 %cmp5, label %for.cond11, label %return

for.cond11:                                       ; preds = %for.cond3
  volatile store i32 3, i32* @g_2, align 4
  %tmp12 = volatile load i32* @g_2, align 4
  %cmp13 = icmp slt i32 %tmp12, 6
  %tmp43 = volatile load i32* @g_2, align 4
  br i1 %cmp13, label %for.body88, label %for.inc133

for.body88:                                       ; preds = %for.cond11
  store i32 0, i32* %arrayidx.5, align 4
  store i32 1, i32* @g_6, align 4
  store i32 1, i32* @g_7, align 4
  %tmp89 = load i32* @g_15, align 4
  %conv90 = trunc i32 %tmp89 to i16
  br label %return

for.inc133:                                       ; preds = %for.cond11
  %sub.i = add i32 %tmp43, -1
  volatile store i32 %sub.i, i32* @g_2, align 4
  br label %for.cond3

return:                                           ; preds = %for.cond3, %for.body88
  %0 = phi i16 [ %conv90, %for.body88 ], [ 31155, %for.cond3 ]
  ret i16 %0
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_16.i = alloca [8 x i32], align 16
  %0 = bitcast [8 x i32]* %l_16.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx.i = getelementptr [8 x i32]* %l_16.i, i64 0, i64 0
  store i32 -2053899842, i32* %arrayidx.i, align 16
  %arrayidx.1.i = getelementptr [8 x i32]* %l_16.i, i64 0, i64 1
  store i32 -2053899842, i32* %arrayidx.1.i, align 4
  %arrayidx.2.i = getelementptr [8 x i32]* %l_16.i, i64 0, i64 2
  store i32 -2053899842, i32* %arrayidx.2.i, align 8
  %arrayidx.3.i = getelementptr [8 x i32]* %l_16.i, i64 0, i64 3
  store i32 -2053899842, i32* %arrayidx.3.i, align 4
  %arrayidx.4.i = getelementptr [8 x i32]* %l_16.i, i64 0, i64 4
  store i32 -2053899842, i32* %arrayidx.4.i, align 16
  %arrayidx.5.i = getelementptr [8 x i32]* %l_16.i, i64 0, i64 5
  store i32 -2053899842, i32* %arrayidx.5.i, align 4
  %arrayidx.6.i = getelementptr [8 x i32]* %l_16.i, i64 0, i64 6
  store i32 -2053899842, i32* %arrayidx.6.i, align 8
  %arrayidx.7.i = getelementptr [8 x i32]* %l_16.i, i64 0, i64 7
  store i32 -2053899842, i32* %arrayidx.7.i, align 4
  volatile store i32 -10, i32* @g_2, align 4
  br label %for.cond3.i

for.cond3.i:                                      ; preds = %for.inc133.i, %entry
  %tmp4.i = volatile load i32* @g_2, align 4
  %cmp5.i = icmp slt i32 %tmp4.i, 1
  br i1 %cmp5.i, label %for.cond11.i, label %func_1.exit

for.cond11.i:                                     ; preds = %for.cond3.i
  volatile store i32 3, i32* @g_2, align 4
  %tmp12.i = volatile load i32* @g_2, align 4
  %cmp13.i = icmp slt i32 %tmp12.i, 6
  %tmp43.i = volatile load i32* @g_2, align 4
  br i1 %cmp13.i, label %for.body88.i, label %for.inc133.i

for.body88.i:                                     ; preds = %for.cond11.i
  store i32 0, i32* %arrayidx.5.i, align 4
  store i32 1, i32* @g_6, align 4
  store i32 1, i32* @g_7, align 4
  br label %func_1.exit

for.inc133.i:                                     ; preds = %for.cond11.i
  %sub.i.i = add i32 %tmp43.i, -1
  volatile store i32 %sub.i.i, i32* @g_2, align 4
  br label %for.cond3.i

func_1.exit:                                      ; preds = %for.cond3.i, %for.body88.i
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %tmp = volatile load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 0, i64 0, i64 0), align 16
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 0, i64 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 0, i64 1, i64 0), align 8
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 0, i64 1, i64 1), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 1, i64 0, i64 0), align 16
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 1, i64 0, i64 1), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 1, i64 1, i64 0), align 8
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 1, i64 1, i64 1), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 2, i64 0, i64 0), align 16
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 2, i64 0, i64 1), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 2, i64 1, i64 0), align 8
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str11, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 2, i64 1, i64 1), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str12, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 3, i64 0, i64 0), align 16
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str13, i64 0, i64 0), i32 %tmp26) nounwind
  %tmp28 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 3, i64 0, i64 1), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str14, i64 0, i64 0), i32 %tmp28) nounwind
  %tmp30 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 3, i64 1, i64 0), align 8
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str15, i64 0, i64 0), i32 %tmp30) nounwind
  %tmp32 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 3, i64 1, i64 1), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str16, i64 0, i64 0), i32 %tmp32) nounwind
  %tmp34 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 4, i64 0, i64 0), align 16
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str17, i64 0, i64 0), i32 %tmp34) nounwind
  %tmp36 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 4, i64 0, i64 1), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str18, i64 0, i64 0), i32 %tmp36) nounwind
  %tmp38 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 4, i64 1, i64 0), align 8
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str19, i64 0, i64 0), i32 %tmp38) nounwind
  %tmp40 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 4, i64 1, i64 1), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str20, i64 0, i64 0), i32 %tmp40) nounwind
  %tmp42 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 5, i64 0, i64 0), align 16
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str21, i64 0, i64 0), i32 %tmp42) nounwind
  %tmp44 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 5, i64 0, i64 1), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str22, i64 0, i64 0), i32 %tmp44) nounwind
  %tmp46 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 5, i64 1, i64 0), align 8
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str23, i64 0, i64 0), i32 %tmp46) nounwind
  %tmp48 = load i32* getelementptr inbounds ([6 x [2 x [2 x i32]]]* @g_5, i64 0, i64 5, i64 1, i64 1), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str24, i64 0, i64 0), i32 %tmp48) nounwind
  %tmp50 = load i32* @g_6, align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str25, i64 0, i64 0), i32 %tmp50) nounwind
  %tmp52 = load i32* @g_7, align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str26, i64 0, i64 0), i32 %tmp52) nounwind
  %tmp54 = load i32* @g_15, align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str27, i64 0, i64 0), i32 %tmp54) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
