; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001679.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 7, align 4
@g_9 = global i32 -94376035, align 4
@g_8 = global i32* @g_9, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_27 = alloca [6 x [3 x [3 x i32]]], align 16
  volatile store i32 0, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp eq i32 %tmp, 0
  %tmp4 = volatile load i32* @g_2, align 4
  br i1 %cmp, label %for.end, label %return

for.end:                                          ; preds = %entry
  %cmp6 = icmp slt i32 %tmp4, 468890265
  %conv12 = select i1 %cmp6, i32 19816, i32 19815
  %tmp13 = volatile load i32** @g_8, align 8
  store i32 %conv12, i32* %tmp13, align 4
  %tmp14 = volatile load i32** @g_8, align 8
  %tmp15 = load i32* %tmp14, align 4
  %tobool = icmp eq i32 %tmp15, 468890265
  br i1 %tobool, label %if.else, label %safe_mod_func_int32_t_s_s.exit

safe_mod_func_int32_t_s_s.exit:                   ; preds = %for.end
  %tmp24 = volatile load i32** @g_8, align 8
  store i32 10, i32* @g_9, align 4
  %arrayidx80.221 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 0, i64 2, i64 0
  %arrayidx80.1.2 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 0, i64 2, i64 1
  %arrayidx80.2.2 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 0, i64 2, i64 2
  %arrayidx80.120 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 0, i64 1, i64 0
  %arrayidx80.1.1 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 0, i64 1, i64 1
  %arrayidx80.2.1 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 0, i64 1, i64 2
  %arrayidx80 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 0, i64 0, i64 0
  %arrayidx80.1 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 0, i64 0, i64 1
  %arrayidx80.2 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 0, i64 0, i64 2
  store i32 1624657053, i32* %arrayidx80, align 16
  store i32 1624657053, i32* %arrayidx80.1, align 4
  store i32 1624657053, i32* %arrayidx80.2, align 8
  store i32 1624657053, i32* %arrayidx80.120, align 4
  store i32 1624657053, i32* %arrayidx80.1.1, align 4
  store i32 1624657053, i32* %arrayidx80.2.1, align 4
  store i32 1624657053, i32* %arrayidx80.221, align 8
  store i32 1624657053, i32* %arrayidx80.1.2, align 4
  store i32 1624657053, i32* %arrayidx80.2.2, align 8
  %arrayidx80.221.1 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 1, i64 2, i64 0
  %arrayidx80.1.2.1 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 1, i64 2, i64 1
  %arrayidx80.2.2.1 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 1, i64 2, i64 2
  %arrayidx80.120.1 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 1, i64 1, i64 0
  %arrayidx80.1.1.1 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 1, i64 1, i64 1
  %arrayidx80.2.1.1 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 1, i64 1, i64 2
  %arrayidx80.124 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 1, i64 0, i64 0
  %arrayidx80.1.125 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 1, i64 0, i64 1
  %arrayidx80.2.126 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 1, i64 0, i64 2
  store i32 1624657053, i32* %arrayidx80.124, align 4
  store i32 1624657053, i32* %arrayidx80.1.125, align 4
  store i32 1624657053, i32* %arrayidx80.2.126, align 4
  store i32 1624657053, i32* %arrayidx80.120.1, align 4
  store i32 1624657053, i32* %arrayidx80.1.1.1, align 4
  store i32 1624657053, i32* %arrayidx80.2.1.1, align 4
  store i32 1624657053, i32* %arrayidx80.221.1, align 4
  store i32 1624657053, i32* %arrayidx80.1.2.1, align 4
  store i32 1624657053, i32* %arrayidx80.2.2.1, align 4
  %arrayidx80.221.2 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 2, i64 2, i64 0
  %arrayidx80.1.2.2 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 2, i64 2, i64 1
  %arrayidx80.2.2.2 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 2, i64 2, i64 2
  %arrayidx80.120.2 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 2, i64 1, i64 0
  %arrayidx80.1.1.2 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 2, i64 1, i64 1
  %arrayidx80.2.1.2 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 2, i64 1, i64 2
  %arrayidx80.228 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 2, i64 0, i64 0
  %arrayidx80.1.229 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 2, i64 0, i64 1
  %arrayidx80.2.230 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 2, i64 0, i64 2
  store i32 1624657053, i32* %arrayidx80.228, align 8
  store i32 1624657053, i32* %arrayidx80.1.229, align 4
  store i32 1624657053, i32* %arrayidx80.2.230, align 8
  store i32 1624657053, i32* %arrayidx80.120.2, align 4
  store i32 1624657053, i32* %arrayidx80.1.1.2, align 4
  store i32 1624657053, i32* %arrayidx80.2.1.2, align 4
  store i32 1624657053, i32* %arrayidx80.221.2, align 8
  store i32 1624657053, i32* %arrayidx80.1.2.2, align 4
  store i32 1624657053, i32* %arrayidx80.2.2.2, align 8
  %arrayidx80.221.3 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 3, i64 2, i64 0
  %arrayidx80.1.2.3 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 3, i64 2, i64 1
  %arrayidx80.2.2.3 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 3, i64 2, i64 2
  %arrayidx80.120.3 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 3, i64 1, i64 0
  %arrayidx80.1.1.3 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 3, i64 1, i64 1
  %arrayidx80.2.1.3 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 3, i64 1, i64 2
  %arrayidx80.3 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 3, i64 0, i64 0
  %arrayidx80.1.3 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 3, i64 0, i64 1
  %arrayidx80.2.3 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 3, i64 0, i64 2
  store i32 1624657053, i32* %arrayidx80.3, align 4
  store i32 1624657053, i32* %arrayidx80.1.3, align 4
  store i32 1624657053, i32* %arrayidx80.2.3, align 4
  store i32 1624657053, i32* %arrayidx80.120.3, align 4
  store i32 1624657053, i32* %arrayidx80.1.1.3, align 4
  store i32 1624657053, i32* %arrayidx80.2.1.3, align 4
  store i32 1624657053, i32* %arrayidx80.221.3, align 4
  store i32 1624657053, i32* %arrayidx80.1.2.3, align 4
  store i32 1624657053, i32* %arrayidx80.2.2.3, align 4
  %arrayidx80.221.4 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 4, i64 2, i64 0
  %arrayidx80.1.2.4 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 4, i64 2, i64 1
  %arrayidx80.2.2.4 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 4, i64 2, i64 2
  %arrayidx80.120.4 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 4, i64 1, i64 0
  %arrayidx80.1.1.4 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 4, i64 1, i64 1
  %arrayidx80.2.1.4 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 4, i64 1, i64 2
  %arrayidx80.4 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 4, i64 0, i64 0
  %arrayidx80.1.4 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 4, i64 0, i64 1
  %arrayidx80.2.4 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 4, i64 0, i64 2
  store i32 1624657053, i32* %arrayidx80.4, align 16
  store i32 1624657053, i32* %arrayidx80.1.4, align 4
  store i32 1624657053, i32* %arrayidx80.2.4, align 8
  store i32 1624657053, i32* %arrayidx80.120.4, align 4
  store i32 1624657053, i32* %arrayidx80.1.1.4, align 4
  store i32 1624657053, i32* %arrayidx80.2.1.4, align 4
  store i32 1624657053, i32* %arrayidx80.221.4, align 8
  store i32 1624657053, i32* %arrayidx80.1.2.4, align 4
  store i32 1624657053, i32* %arrayidx80.2.2.4, align 8
  %arrayidx80.221.5 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 5, i64 2, i64 0
  %arrayidx80.1.2.5 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 5, i64 2, i64 1
  %arrayidx80.2.2.5 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 5, i64 2, i64 2
  %arrayidx80.120.5 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 5, i64 1, i64 0
  %arrayidx80.1.1.5 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 5, i64 1, i64 1
  %arrayidx80.2.1.5 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 5, i64 1, i64 2
  %arrayidx80.5 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 5, i64 0, i64 0
  %arrayidx80.1.5 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 5, i64 0, i64 1
  %arrayidx80.2.5 = getelementptr [6 x [3 x [3 x i32]]]* %l_27, i64 0, i64 5, i64 0, i64 2
  store i32 1624657053, i32* %arrayidx80.5, align 4
  store i32 1624657053, i32* %arrayidx80.1.5, align 4
  store i32 1624657053, i32* %arrayidx80.2.5, align 4
  store i32 1624657053, i32* %arrayidx80.120.5, align 4
  store i32 1624657053, i32* %arrayidx80.1.1.5, align 4
  store i32 1624657053, i32* %arrayidx80.2.1.5, align 4
  store i32 1624657053, i32* %arrayidx80.221.5, align 4
  store i32 1624657053, i32* %arrayidx80.1.2.5, align 4
  store i32 1624657053, i32* %arrayidx80.2.2.5, align 4
  br label %return

if.else:                                          ; preds = %for.end
  %tmp108 = load i32* @g_9, align 4
  %and = and i32 %tmp108, 96
  store i32 %and, i32* @g_9, align 4
  %tmp109 = volatile load i32* @g_2, align 4
  br label %return

return:                                           ; preds = %entry, %if.else, %safe_mod_func_int32_t_s_s.exit
  %0 = phi i32 [ %tmp109, %if.else ], [ 1624657053, %safe_mod_func_int32_t_s_s.exit ], [ %tmp4, %entry ]
  ret i32 %0
}

define i32 @func_12(i32* nocapture %p_13) nounwind uwtable readnone {
entry:
  ret i32 -1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call i32 @func_1()
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* @g_9, align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
