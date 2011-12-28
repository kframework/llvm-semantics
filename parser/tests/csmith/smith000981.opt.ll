; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000981.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global [6 x [8 x i32]] [[8 x i32] [i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881], [8 x i32] [i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881], [8 x i32] [i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881], [8 x i32] [i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881], [8 x i32] [i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881], [8 x i32] [i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881, i32 -2084080881]], align 16
@g_5 = global [10 x [1 x i32]] zeroinitializer, align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_3[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_3[0][7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][1] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][2] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][3] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][4] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][5] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][6] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [25 x i8] c"checksum g_3[1][7] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][1] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][2] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][3] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][4] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][5] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][6] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [25 x i8] c"checksum g_3[2][7] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][0] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][1] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][2] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][3] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][4] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][5] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][6] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [25 x i8] c"checksum g_3[3][7] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][0] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][1] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][2] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][3] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][4] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][5] = %d\0A\00", align 1
@.str38 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][6] = %d\0A\00", align 1
@.str39 = private unnamed_addr constant [25 x i8] c"checksum g_3[4][7] = %d\0A\00", align 1
@.str40 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][0] = %d\0A\00", align 1
@.str41 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][1] = %d\0A\00", align 1
@.str42 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][2] = %d\0A\00", align 1
@.str43 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][3] = %d\0A\00", align 1
@.str44 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][4] = %d\0A\00", align 1
@.str45 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][5] = %d\0A\00", align 1
@.str46 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][6] = %d\0A\00", align 1
@.str47 = private unnamed_addr constant [25 x i8] c"checksum g_3[5][7] = %d\0A\00", align 1
@.str48 = private unnamed_addr constant [25 x i8] c"checksum g_5[0][0] = %d\0A\00", align 1
@.str49 = private unnamed_addr constant [25 x i8] c"checksum g_5[1][0] = %d\0A\00", align 1
@.str50 = private unnamed_addr constant [25 x i8] c"checksum g_5[2][0] = %d\0A\00", align 1
@.str51 = private unnamed_addr constant [25 x i8] c"checksum g_5[3][0] = %d\0A\00", align 1
@.str52 = private unnamed_addr constant [25 x i8] c"checksum g_5[4][0] = %d\0A\00", align 1
@.str53 = private unnamed_addr constant [25 x i8] c"checksum g_5[5][0] = %d\0A\00", align 1
@.str54 = private unnamed_addr constant [25 x i8] c"checksum g_5[6][0] = %d\0A\00", align 1
@.str55 = private unnamed_addr constant [25 x i8] c"checksum g_5[7][0] = %d\0A\00", align 1
@.str56 = private unnamed_addr constant [25 x i8] c"checksum g_5[8][0] = %d\0A\00", align 1
@.str57 = private unnamed_addr constant [25 x i8] c"checksum g_5[9][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  volatile store i32 3, i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 0), align 16
  %tmp15 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 0), align 16
  %cmp16 = icmp sgt i32 %tmp15, -1
  br i1 %cmp16, label %for.body17, label %for.end21

for.body17:                                       ; preds = %entry
  %tmp18 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 0), align 16
  br label %return

for.end21:                                        ; preds = %entry
  store i32 -1156469557, i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 8, i64 0), align 16
  %tmp22 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 5, i64 0), align 4
  br label %return

return:                                           ; preds = %for.end21, %for.body17
  %storemerge2 = phi i32 [ %tmp18, %for.body17 ], [ %tmp22, %for.end21 ]
  ret i32 %storemerge2
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 3, i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 0), align 16
  %tmp15.i = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 0), align 16
  %cmp16.i = icmp sgt i32 %tmp15.i, -1
  br i1 %cmp16.i, label %for.body17.i, label %for.end21.i

for.body17.i:                                     ; preds = %entry
  %tmp18.i = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 0), align 16
  br label %func_1.exit

for.end21.i:                                      ; preds = %entry
  store i32 -1156469557, i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 8, i64 0), align 16
  br label %func_1.exit

func_1.exit:                                      ; preds = %for.body17.i, %for.end21.i
  %tmp = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 0, i64 0), align 16
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 0, i64 1), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 0, i64 2), align 8
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 0, i64 3), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 0, i64 4), align 16
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 0, i64 5), align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 0, i64 6), align 8
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 0, i64 7), align 4
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 1, i64 0), align 16
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 1, i64 1), align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 1, i64 2), align 8
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 1, i64 3), align 4
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str11, i64 0, i64 0), i32 %tmp22) nounwind
  %tmp24 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 1, i64 4), align 16
  %call25 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str12, i64 0, i64 0), i32 %tmp24) nounwind
  %tmp26 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 1, i64 5), align 4
  %call27 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str13, i64 0, i64 0), i32 %tmp26) nounwind
  %tmp28 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 1, i64 6), align 8
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str14, i64 0, i64 0), i32 %tmp28) nounwind
  %tmp30 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 1, i64 7), align 4
  %call31 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str15, i64 0, i64 0), i32 %tmp30) nounwind
  %tmp32 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 2, i64 0), align 16
  %call33 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str16, i64 0, i64 0), i32 %tmp32) nounwind
  %tmp34 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 2, i64 1), align 4
  %call35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str17, i64 0, i64 0), i32 %tmp34) nounwind
  %tmp36 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 2, i64 2), align 8
  %call37 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str18, i64 0, i64 0), i32 %tmp36) nounwind
  %tmp38 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 2, i64 3), align 4
  %call39 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str19, i64 0, i64 0), i32 %tmp38) nounwind
  %tmp40 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 2, i64 4), align 16
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str20, i64 0, i64 0), i32 %tmp40) nounwind
  %tmp42 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 2, i64 5), align 4
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str21, i64 0, i64 0), i32 %tmp42) nounwind
  %tmp44 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 2, i64 6), align 8
  %call45 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str22, i64 0, i64 0), i32 %tmp44) nounwind
  %tmp46 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 2, i64 7), align 4
  %call47 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str23, i64 0, i64 0), i32 %tmp46) nounwind
  %tmp48 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 0), align 16
  %call49 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i64 0, i64 0), i32 %tmp48) nounwind
  %tmp50 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 1), align 4
  %call51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str25, i64 0, i64 0), i32 %tmp50) nounwind
  %tmp52 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 2), align 8
  %call53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str26, i64 0, i64 0), i32 %tmp52) nounwind
  %tmp54 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 3), align 4
  %call55 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str27, i64 0, i64 0), i32 %tmp54) nounwind
  %tmp56 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 4), align 16
  %call57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str28, i64 0, i64 0), i32 %tmp56) nounwind
  %tmp58 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 5), align 4
  %call59 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str29, i64 0, i64 0), i32 %tmp58) nounwind
  %tmp60 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 6), align 8
  %call61 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str30, i64 0, i64 0), i32 %tmp60) nounwind
  %tmp62 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 7), align 4
  %call63 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str31, i64 0, i64 0), i32 %tmp62) nounwind
  %tmp64 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 4, i64 0), align 16
  %call65 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str32, i64 0, i64 0), i32 %tmp64) nounwind
  %tmp66 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 4, i64 1), align 4
  %call67 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str33, i64 0, i64 0), i32 %tmp66) nounwind
  %tmp68 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 4, i64 2), align 8
  %call69 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str34, i64 0, i64 0), i32 %tmp68) nounwind
  %tmp70 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 4, i64 3), align 4
  %call71 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str35, i64 0, i64 0), i32 %tmp70) nounwind
  %tmp72 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 4, i64 4), align 16
  %call73 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str36, i64 0, i64 0), i32 %tmp72) nounwind
  %tmp74 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 4, i64 5), align 4
  %call75 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str37, i64 0, i64 0), i32 %tmp74) nounwind
  %tmp76 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 4, i64 6), align 8
  %call77 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str38, i64 0, i64 0), i32 %tmp76) nounwind
  %tmp78 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 4, i64 7), align 4
  %call79 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str39, i64 0, i64 0), i32 %tmp78) nounwind
  %tmp80 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 5, i64 0), align 16
  %call81 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str40, i64 0, i64 0), i32 %tmp80) nounwind
  %tmp82 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 5, i64 1), align 4
  %call83 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str41, i64 0, i64 0), i32 %tmp82) nounwind
  %tmp84 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 5, i64 2), align 8
  %call85 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str42, i64 0, i64 0), i32 %tmp84) nounwind
  %tmp86 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 5, i64 3), align 4
  %call87 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str43, i64 0, i64 0), i32 %tmp86) nounwind
  %tmp88 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 5, i64 4), align 16
  %call89 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str44, i64 0, i64 0), i32 %tmp88) nounwind
  %tmp90 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 5, i64 5), align 4
  %call91 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str45, i64 0, i64 0), i32 %tmp90) nounwind
  %tmp92 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 5, i64 6), align 8
  %call93 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str46, i64 0, i64 0), i32 %tmp92) nounwind
  %tmp94 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 5, i64 7), align 4
  %call95 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str47, i64 0, i64 0), i32 %tmp94) nounwind
  %tmp96 = volatile load i32* getelementptr inbounds ([6 x [8 x i32]]* @g_3, i64 0, i64 3, i64 0), align 16
  %call97 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str24, i64 0, i64 0), i32 %tmp96) nounwind
  %tmp98 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 0, i64 0), align 16
  %call99 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str48, i64 0, i64 0), i32 %tmp98) nounwind
  %tmp100 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 1, i64 0), align 4
  %call101 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str49, i64 0, i64 0), i32 %tmp100) nounwind
  %tmp102 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 2, i64 0), align 8
  %call103 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str50, i64 0, i64 0), i32 %tmp102) nounwind
  %tmp104 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 3, i64 0), align 4
  %call105 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str51, i64 0, i64 0), i32 %tmp104) nounwind
  %tmp106 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 4, i64 0), align 16
  %call107 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str52, i64 0, i64 0), i32 %tmp106) nounwind
  %tmp108 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 5, i64 0), align 4
  %call109 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str53, i64 0, i64 0), i32 %tmp108) nounwind
  %tmp110 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 6, i64 0), align 8
  %call111 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str54, i64 0, i64 0), i32 %tmp110) nounwind
  %tmp112 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 7, i64 0), align 4
  %call113 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str55, i64 0, i64 0), i32 %tmp112) nounwind
  %tmp114 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 8, i64 0), align 16
  %call115 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str56, i64 0, i64 0), i32 %tmp114) nounwind
  %tmp116 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 9, i64 0), align 4
  %call117 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str57, i64 0, i64 0), i32 %tmp116) nounwind
  %tmp118 = load i32* getelementptr inbounds ([10 x [1 x i32]]* @g_5, i64 0, i64 8, i64 0), align 16
  %call119 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str56, i64 0, i64 0), i32 %tmp118) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
