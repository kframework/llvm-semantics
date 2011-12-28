; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000160.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -1884639559, align 4
@g_7 = global i32 1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca i64, align 8
  %l_6 = alloca i32*, align 8
  store i64 -4, i64* %l_5, align 8
  store i32* @g_7, i32** %l_6, align 8
  %tmp = volatile load i32* @g_4, align 4
  %conv = zext i32 %tmp to i64
  %cmp = icmp sle i64 %conv, 4
  %conv1 = zext i1 %cmp to i32
  %tmp2 = load i64* %l_5, align 8
  %tobool = icmp ne i64 %tmp2, 0
  %land.ext = zext i1 %tobool to i32
  %conv3 = sext i32 %land.ext to i64
  %cmp4 = icmp eq i64 3, %conv3
  %conv5 = zext i1 %cmp4 to i32
  %cmp6 = icmp ne i32 %conv1, %conv5
  %conv7 = zext i1 %cmp6 to i32
  %conv8 = trunc i32 %conv7 to i16
  %call = call signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %conv8, i32 1)
  %conv9 = sext i16 %call to i32
  %tmp10 = load i32** %l_6, align 8
  %tmp11 = load i32* %tmp10
  %or = or i32 %tmp11, %conv9
  store i32 %or, i32* %tmp10
  %tmp12 = load i32** %l_6, align 8
  %tmp13 = load i32* %tmp12
  ret i32 %tmp13
}

define internal signext i16 @safe_rshift_func_int16_t_s_s(i16 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i16, align 2
  %right.addr = alloca i32, align 4
  store i16 %left, i16* %left.addr, align 2
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i16* %left.addr, align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %right.addr, align 4
  %cmp3 = icmp slt i32 %tmp2, 0
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i32* %right.addr, align 4
  %cmp7 = icmp sge i32 %tmp6, 32
  br i1 %cmp7, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp9 = load i16* %left.addr, align 2
  %conv10 = sext i16 %tmp9 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp11 = load i16* %left.addr, align 2
  %conv12 = sext i16 %tmp11 to i32
  %tmp13 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv12, %tmp13
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv10, %cond.true ], [ %shr, %cond.false ]
  %conv14 = trunc i32 %cond to i16
  ret i16 %conv14
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = volatile load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_7, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
