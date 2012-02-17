; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001816.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = global i32 0, align 4
@g_11 = global [1 x [8 x i32]] [[8 x i32] [i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10, i32 -10]], align 16
@g_10 = global i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i64 0, i64 0, i64 3), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_11[0][7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %tmp5 = load i32* @g_9, align 4
  %conv6 = trunc i32 %tmp5 to i8
  %and = and i8 %conv6, 1
  %cmp.i = icmp eq i8 %and, 0
  br i1 %cmp.i, label %lbl_12, label %safe_div_func_uint8_t_u_u.exit

safe_div_func_uint8_t_u_u.exit:                   ; preds = %entry
  %div1.i = udiv i8 1, %and
  %phitmp1 = icmp eq i8 %div1.i, 0
  %tobool14 = icmp eq i32 %tmp5, 0
  %or.cond = and i1 %phitmp1, %tobool14
  br i1 %or.cond, label %if.end16, label %lbl_12

lbl_12:                                           ; preds = %entry, %safe_div_func_uint8_t_u_u.exit
  %tmp12 = volatile load i32** @g_10, align 8
  store i32 %tmp5, i32* %tmp12, align 4
  br label %if.end16

if.end16:                                         ; preds = %safe_div_func_uint8_t_u_u.exit, %lbl_12
  %tmp17 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i64 0, i64 0, i64 0), align 16
  %conv18 = trunc i32 %tmp17 to i16
  ret i16 %conv18
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp5.i = load i32* @g_9, align 4
  %conv6.i = trunc i32 %tmp5.i to i8
  %and.i = and i8 %conv6.i, 1
  %cmp.i.i = icmp eq i8 %and.i, 0
  br i1 %cmp.i.i, label %lbl_12.i, label %safe_div_func_uint8_t_u_u.exit.i

safe_div_func_uint8_t_u_u.exit.i:                 ; preds = %entry
  %div1.i.i = udiv i8 1, %and.i
  %phitmp1.i = icmp eq i8 %div1.i.i, 0
  %tobool14.i = icmp eq i32 %tmp5.i, 0
  %or.cond.i = and i1 %phitmp1.i, %tobool14.i
  br i1 %or.cond.i, label %func_1.exit, label %lbl_12.i

lbl_12.i:                                         ; preds = %safe_div_func_uint8_t_u_u.exit.i, %entry
  %tmp12.i = volatile load i32** @g_10, align 8
  store i32 %tmp5.i, i32* %tmp12.i, align 4
  %tmp.pre = load i32* @g_9, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %safe_div_func_uint8_t_u_u.exit.i, %lbl_12.i
  %tmp = phi i32 [ %tmp5.i, %safe_div_func_uint8_t_u_u.exit.i ], [ %tmp.pre, %lbl_12.i ]
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i64 0, i64 0, i64 0), align 16
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i64 0, i64 0, i64 1), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i64 0, i64 0, i64 2), align 8
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i64 0, i64 0, i64 3), align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i64 0, i64 0, i64 4), align 16
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i64 0, i64 0, i64 5), align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i64 0, i64 0, i64 6), align 8
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i64 0, i64 0, i64 7), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([1 x [8 x i32]]* @g_11, i64 0, i64 0, i64 3), align 4
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i64 0, i64 0), i32 %tmp18) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
