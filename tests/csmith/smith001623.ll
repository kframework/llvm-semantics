; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001623.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global [1 x [3 x i32]] [[3 x i32] [i32 -1, i32 -1, i32 -1]], align 4
@.str = private unnamed_addr constant [25 x i8] c"checksum g_2[0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_2[0][2] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %cmp = icmp sle i32 %tmp, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  store i32 %tmp1, i32* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp2 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %conv = trunc i32 %tmp2 to i8
  %call = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv, i8 signext 1)
  %conv3 = sext i8 %call to i32
  store i32 %conv3, i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp4 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  store i32 %tmp4, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %for.body
  %0 = load i32* %retval
  ret i32 %0
}

define internal signext i8 @safe_sub_func_int8_t_s_s(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* %si2.addr, align 1
  %conv2 = sext i8 %tmp1 to i32
  %sub = sub nsw i32 %conv, %conv2
  %conv3 = trunc i32 %sub to i8
  ret i8 %conv3
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([1 x [3 x i32]]* @g_2, i32 0, i64 0, i64 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %tmp6)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
