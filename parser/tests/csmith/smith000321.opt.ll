; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000321.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_8 = global i16 10378, align 2
@g_10 = global i32 1, align 4
@g_9 = global i32* @g_10, align 8
@g_32 = global i32* @g_10, align 8
@g_39 = global i32* @g_10, align 8
@g_38 = global i32** @g_39, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_8 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_18.i = alloca i32, align 4
  %l_31.i = alloca [7 x [5 x [1 x [1 x i32]]]], align 16
  %tmp = load i16* @g_8, align 2
  %conv3 = trunc i16 %tmp to i8
  %cmp.i6 = icmp eq i8 %conv3, 0
  br i1 %cmp.i6, label %lbl_11, label %safe_div_func_uint8_t_u_u.exit

safe_div_func_uint8_t_u_u.exit:                   ; preds = %entry
  br i1 false, label %if.end, label %lbl_11

lbl_11:                                           ; preds = %entry, %safe_div_func_uint8_t_u_u.exit
  %conv7 = sext i16 %tmp to i32
  %tmp8 = volatile load i32** @g_9, align 8
  %tmp9 = load i32* %tmp8, align 4
  %xor = xor i32 %tmp9, %conv7
  store i32 %xor, i32* %tmp8, align 4
  br label %lbl_40

if.end:                                           ; preds = %safe_div_func_uint8_t_u_u.exit
  br label %lbl_40

lbl_40:                                           ; preds = %lbl_11, %if.end
  %tmp7910 = phi i32* [ %l_18.i, %if.end ], [ @g_10, %lbl_11 ]
  volatile store i32* %tmp7910, i32** @g_9, align 8
  %tmp82 = volatile load i32** @g_32, align 8
  %0 = bitcast [7 x [5 x [1 x [1 x i32]]]]* %l_31.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx22.i = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 0, i64 0, i64 0, i64 0
  %scevgep28.i = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 0, i64 1, i64 0, i64 0
  %scevgep25.i = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 0, i64 2, i64 0, i64 0
  %scevgep22.i = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 0, i64 3, i64 0, i64 0
  %scevgep.i = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 0, i64 4, i64 0, i64 0
  store i32 -296295653, i32* %arrayidx22.i, align 16
  store i32 -296295653, i32* %scevgep28.i, align 4
  store i32 -296295653, i32* %scevgep25.i, align 8
  store i32 -296295653, i32* %scevgep22.i, align 4
  store i32 -296295653, i32* %scevgep.i, align 16
  %arrayidx22.i.1 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 1, i64 0, i64 0, i64 0
  %scevgep28.i.1 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 1, i64 1, i64 0, i64 0
  %scevgep25.i.1 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 1, i64 2, i64 0, i64 0
  %scevgep22.i.1 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 1, i64 3, i64 0, i64 0
  %scevgep.i.1 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 1, i64 4, i64 0, i64 0
  store i32 -296295653, i32* %arrayidx22.i.1, align 4
  store i32 -296295653, i32* %scevgep28.i.1, align 4
  store i32 -296295653, i32* %scevgep25.i.1, align 4
  store i32 -296295653, i32* %scevgep22.i.1, align 4
  store i32 -296295653, i32* %scevgep.i.1, align 4
  %arrayidx22.i.2 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 2, i64 0, i64 0, i64 0
  %scevgep28.i.2 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 2, i64 1, i64 0, i64 0
  %scevgep25.i.2 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 2, i64 2, i64 0, i64 0
  %scevgep22.i.2 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 2, i64 3, i64 0, i64 0
  %scevgep.i.2 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 2, i64 4, i64 0, i64 0
  store i32 -296295653, i32* %arrayidx22.i.2, align 8
  store i32 -296295653, i32* %scevgep28.i.2, align 4
  store i32 -296295653, i32* %scevgep25.i.2, align 8
  store i32 -296295653, i32* %scevgep22.i.2, align 4
  store i32 -296295653, i32* %scevgep.i.2, align 8
  %arrayidx22.i.3 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 3, i64 0, i64 0, i64 0
  %scevgep28.i.3 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 3, i64 1, i64 0, i64 0
  %scevgep25.i.3 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 3, i64 2, i64 0, i64 0
  %scevgep22.i.3 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 3, i64 3, i64 0, i64 0
  %scevgep.i.3 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 3, i64 4, i64 0, i64 0
  store i32 -296295653, i32* %arrayidx22.i.3, align 4
  store i32 -296295653, i32* %scevgep28.i.3, align 4
  store i32 -296295653, i32* %scevgep25.i.3, align 4
  store i32 -296295653, i32* %scevgep22.i.3, align 4
  store i32 -296295653, i32* %scevgep.i.3, align 4
  %arrayidx22.i.4 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 4, i64 0, i64 0, i64 0
  %scevgep28.i.4 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 4, i64 1, i64 0, i64 0
  %scevgep25.i.4 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 4, i64 2, i64 0, i64 0
  %scevgep22.i.4 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 4, i64 3, i64 0, i64 0
  %scevgep.i.4 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 4, i64 4, i64 0, i64 0
  store i32 -296295653, i32* %arrayidx22.i.4, align 16
  store i32 -296295653, i32* %scevgep28.i.4, align 4
  store i32 -296295653, i32* %scevgep25.i.4, align 8
  store i32 -296295653, i32* %scevgep22.i.4, align 4
  store i32 -296295653, i32* %scevgep.i.4, align 16
  %arrayidx22.i.5 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 5, i64 0, i64 0, i64 0
  %scevgep28.i.5 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 5, i64 1, i64 0, i64 0
  %scevgep25.i.5 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 5, i64 2, i64 0, i64 0
  %scevgep22.i.5 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 5, i64 3, i64 0, i64 0
  %scevgep.i.5 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 5, i64 4, i64 0, i64 0
  store i32 -296295653, i32* %arrayidx22.i.5, align 4
  store i32 -296295653, i32* %scevgep28.i.5, align 4
  store i32 -296295653, i32* %scevgep25.i.5, align 4
  store i32 -296295653, i32* %scevgep22.i.5, align 4
  store i32 -296295653, i32* %scevgep.i.5, align 4
  %arrayidx22.i.6 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 6, i64 0, i64 0, i64 0
  %scevgep28.i.6 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 6, i64 1, i64 0, i64 0
  %scevgep25.i.6 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 6, i64 2, i64 0, i64 0
  %scevgep22.i.6 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 6, i64 3, i64 0, i64 0
  %scevgep.i.6 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31.i, i64 0, i64 6, i64 4, i64 0, i64 0
  store i32 -296295653, i32* %arrayidx22.i.6, align 8
  store i32 -296295653, i32* %scevgep28.i.6, align 4
  store i32 -296295653, i32* %scevgep25.i.6, align 8
  store i32 -296295653, i32* %scevgep22.i.6, align 4
  store i32 -296295653, i32* %scevgep.i.6, align 8
  %conv81 = sext i16 %tmp to i32
  %tmp41.i = volatile load i32** @g_32, align 8
  %tmp42.i = load i32* %tmp41.i, align 4
  %xor.i = xor i32 %tmp42.i, -296295653
  store i32 %xor.i, i32* %tmp41.i, align 4
  %tmp43.i = volatile load i32** @g_32, align 8
  %tmp44.i = load i32* %tmp43.i, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %cmp93 = icmp slt i32 %conv81, %tmp44.i
  %conv94 = zext i1 %cmp93 to i32
  %tmp95 = load i32*** @g_38, align 8
  %tmp96 = load i32** %tmp95, align 8
  store i32 %conv94, i32* %tmp96, align 4
  ret i32 %conv81
}

define i32* @func_12(i32 %p_13) nounwind uwtable {
entry:
  %l_18 = alloca i32, align 4
  %tmp = volatile load i32** @g_9, align 8
  ret i32* %l_18
}

define i32 @func_25(i32 %p_26, i8 zeroext %p_27, i8 zeroext %p_28, i32** nocapture %p_29, i16 zeroext %p_30) nounwind uwtable {
entry:
  %l_31 = alloca [7 x [5 x [1 x [1 x i32]]]], align 16
  br label %for.inc28.4

for.end35:                                        ; preds = %for.inc28.4
  %arrayidx39 = getelementptr inbounds [7 x [5 x [1 x [1 x i32]]]]* %l_31, i64 0, i64 0, i64 2, i64 0, i64 0
  %tmp40 = load i32* %arrayidx39, align 8
  %tmp41 = volatile load i32** @g_32, align 8
  %tmp42 = load i32* %tmp41, align 4
  %xor = xor i32 %tmp42, %tmp40
  store i32 %xor, i32* %tmp41, align 4
  %tmp43 = volatile load i32** @g_32, align 8
  %tmp44 = load i32* %tmp43, align 4
  ret i32 %tmp44

for.inc28.4:                                      ; preds = %entry, %for.inc28.4
  %indvar8 = phi i64 [ 0, %entry ], [ %indvar.next9, %for.inc28.4 ]
  %scevgep = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31, i64 0, i64 %indvar8, i64 4, i64 0, i64 0
  %scevgep22 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31, i64 0, i64 %indvar8, i64 3, i64 0, i64 0
  %scevgep25 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31, i64 0, i64 %indvar8, i64 2, i64 0, i64 0
  %scevgep28 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31, i64 0, i64 %indvar8, i64 1, i64 0, i64 0
  %arrayidx22 = getelementptr [7 x [5 x [1 x [1 x i32]]]]* %l_31, i64 0, i64 %indvar8, i64 0, i64 0, i64 0
  store i32 -296295653, i32* %arrayidx22, align 4
  store i32 -296295653, i32* %scevgep28, align 4
  store i32 -296295653, i32* %scevgep25, align 4
  store i32 -296295653, i32* %scevgep22, align 4
  store i32 -296295653, i32* %scevgep, align 4
  %indvar.next9 = add i64 %indvar8, 1
  %exitcond = icmp eq i64 %indvar.next9, 7
  br i1 %exitcond, label %for.end35, label %for.inc28.4
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call i32 @func_1()
  %tmp = load i16* @g_8, align 2
  %conv = sext i16 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i32* @g_10, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
