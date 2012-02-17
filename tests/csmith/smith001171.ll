; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001171.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 -3, align 4
@g_11 = global [10 x i32] [i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5, i32 5], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_11[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_11[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_11[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_11[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_11[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_11[5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_11[6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_11[7] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"checksum g_11[8] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [23 x i8] c"checksum g_11[9] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %l_9 = alloca i32*, align 8
  %l_5 = alloca i16, align 2
  %l_6 = alloca i32*, align 8
  %l_10 = alloca i32*, align 8
  store i32* @g_2, i32** %l_9, align 8
  store i32 0, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp sle i32 %tmp, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i16 25668, i16* %l_5, align 2
  store i32* @g_2, i32** %l_6, align 8
  store i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 2), i32** %l_10, align 8
  %tmp4 = load i16* %l_5, align 2
  %conv = zext i16 %tmp4 to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.body
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.body
  %0 = phi i1 [ true, %for.body ], [ true, %lor.rhs ]
  %lor.ext = zext i1 %0 to i32
  %tmp5 = load i32** %l_6, align 8
  %tmp6 = load i32* %tmp5
  %xor = xor i32 %tmp6, %lor.ext
  store i32 %xor, i32* %tmp5
  %tmp7 = load i32* @g_2, align 4
  %tmp8 = load i32** %l_9, align 8
  %cmp9 = icmp eq i32* @g_2, %tmp8
  %conv10 = zext i1 %cmp9 to i32
  %or = or i32 %tmp7, %conv10
  %tmp11 = load i32* @g_2, align 4
  %tmp12 = load i32** %l_6, align 8
  %tmp13 = load i32* %tmp12
  %or14 = or i32 %tmp11, %tmp13
  %tmp15 = load i32** %l_9, align 8
  %tmp16 = load i32* %tmp15
  %cmp17 = icmp sle i32 %or14, %tmp16
  %conv18 = zext i1 %cmp17 to i32
  %cmp19 = icmp sgt i32 %or, %conv18
  %conv20 = zext i1 %cmp19 to i32
  %tmp21 = load i32** %l_6, align 8
  %tmp22 = load i32* %tmp21
  %xor23 = xor i32 %conv20, %tmp22
  %conv24 = trunc i32 %xor23 to i16
  %tmp25 = load i32** %l_9, align 8
  %tmp26 = load i32* %tmp25
  %conv27 = trunc i32 %tmp26 to i16
  %call = call zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %conv24, i16 zeroext %conv27)
  %conv28 = zext i16 %call to i32
  %tobool29 = icmp ne i32 %conv28, 0
  %land.ext = zext i1 %tobool29 to i32
  %tmp30 = load i32** %l_10, align 8
  %tmp31 = load i32* %tmp30
  %and = and i32 %tmp31, %land.ext
  store i32 %and, i32* %tmp30
  %tmp32 = load i32** %l_6, align 8
  %tmp33 = load i32* %tmp32
  store i32 %tmp33, i32* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp34 = load i32* @g_2, align 4
  %call35 = call i32 @safe_add_func_uint32_t_u_u(i32 %tmp34, i32 1)
  store i32 %call35, i32* @g_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp36 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 2), align 4
  store i32 %tmp36, i32* %retval
  br label %return

return:                                           ; preds = %for.end, %lor.end
  %1 = load i32* %retval
  ret i32 %1
}

define internal zeroext i16 @safe_div_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui2.addr, align 2
  %conv = zext i16 %tmp to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i16* %ui1.addr, align 2
  %conv3 = zext i16 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i16* %ui1.addr, align 2
  %conv5 = zext i16 %tmp4 to i32
  %tmp6 = load i16* %ui2.addr, align 2
  %conv7 = zext i16 %tmp6 to i32
  %div = sdiv i32 %conv5, %conv7
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %div, %cond.false ]
  %conv8 = trunc i32 %cond to i16
  ret i16 %conv8
}

define internal i32 @safe_add_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %add = add i32 %tmp, %tmp1
  ret i32 %add
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 2), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 3), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 4), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 5), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 6), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 7), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 8), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 9), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([10 x i32]* @g_11, i32 0, i64 2), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %tmp22)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
