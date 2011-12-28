; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000213.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 0, align 4
@g_3 = global i32 4, align 4
@g_24 = global i32 1213840250, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_24 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %tmp = volatile load i32* @g_2, align 4
  %tmp1 = load i32* @g_3, align 4
  %xor = xor i32 %tmp1, %tmp
  %cmp = icmp ult i32 %xor, 32980
  %not.tobool = icmp ne i32 %tmp1, 0
  %xor81 = xor i1 %cmp, %not.tobool
  %xor8 = zext i1 %xor81 to i32
  %conv17 = trunc i32 %tmp1 to i16
  %cmp22 = icmp ne i16 %conv17, 11964
  br i1 %cmp22, label %cond.false.i16, label %safe_mod_func_int64_t_s_s.exit

cond.false.i16:                                   ; preds = %entry
  %conv23 = zext i1 %cmp22 to i32
  %div.i15 = udiv i32 238387412, %conv23
  br label %safe_mod_func_int64_t_s_s.exit

safe_mod_func_int64_t_s_s.exit:                   ; preds = %entry, %cond.false.i16
  %cond.i17 = phi i32 [ %div.i15, %cond.false.i16 ], [ 238387412, %entry ]
  %cmp25 = icmp uge i32 %xor8, %cond.i17
  %conv26 = zext i1 %cmp25 to i32
  %or = or i32 %conv26, %tmp1
  %sext21 = shl i32 %tmp1, 16
  %phitmp20 = ashr exact i32 %sext21, 16
  %cmp49 = icmp ule i32 %or, %phitmp20
  %conv50 = zext i1 %cmp49 to i32
  %tmp52 = load i32* @g_24, align 4
  %or53 = or i32 %conv50, %tmp52
  store i32 %or53, i32* @g_24, align 4
  store i32 0, i32* @g_3, align 4
  %tmp73 = volatile load i32* @g_2, align 4
  %conv74 = trunc i32 %tmp73 to i16
  ret i16 %conv74
}

define i32 @func_15(i32 %p_16, i64 %p_17, i32 %p_18, i32 %p_19) nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %tmp.i = volatile load i32* @g_2, align 4
  %tmp1.i = load i32* @g_3, align 4
  %xor.i = xor i32 %tmp1.i, %tmp.i
  %cmp.i = icmp ult i32 %xor.i, 32980
  %not.tobool.i = icmp ne i32 %tmp1.i, 0
  %xor81.i = xor i1 %cmp.i, %not.tobool.i
  %xor8.i = zext i1 %xor81.i to i32
  %conv17.i = trunc i32 %tmp1.i to i16
  %cmp22.i = icmp ne i16 %conv17.i, 11964
  br i1 %cmp22.i, label %cond.false.i16.i, label %func_1.exit

cond.false.i16.i:                                 ; preds = %entry
  %conv23.i = zext i1 %cmp22.i to i32
  %div.i15.i = udiv i32 238387412, %conv23.i
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %cond.false.i16.i
  %cond.i17.i = phi i32 [ %div.i15.i, %cond.false.i16.i ], [ 238387412, %entry ]
  %cmp25.i = icmp uge i32 %xor8.i, %cond.i17.i
  %conv26.i = zext i1 %cmp25.i to i32
  %or.i = or i32 %conv26.i, %tmp1.i
  %sext21.i = shl i32 %tmp1.i, 16
  %phitmp20.i = ashr exact i32 %sext21.i, 16
  %cmp49.i = icmp ule i32 %or.i, %phitmp20.i
  %conv50.i = zext i1 %cmp49.i to i32
  %tmp52.i = load i32* @g_24, align 4
  %or53.i = or i32 %conv50.i, %tmp52.i
  store i32 %or53.i, i32* @g_24, align 4
  store i32 0, i32* @g_3, align 4
  %tmp73.i = volatile load i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_3, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* @g_24, align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
