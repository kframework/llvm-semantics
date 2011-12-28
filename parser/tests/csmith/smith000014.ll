; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000014.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i32 280599035, align 4
@g_5 = global i32* @g_6, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i32, align 4
  %l_8 = alloca i32*, align 8
  %l_7 = alloca i32**, align 8
  store i32 7, i32* %l_4, align 4
  store i32* @g_6, i32** %l_8, align 8
  store i32** %l_8, i32*** %l_7, align 8
  %tmp = load i32* %l_4, align 4
  %conv = trunc i32 %tmp to i8
  %call = call signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %conv, i32 754672408)
  %conv1 = sext i8 %call to i32
  %tmp2 = volatile load i32** @g_5, align 8
  store i32 %conv1, i32* %tmp2
  %tmp3 = load i32*** %l_7, align 8
  store i32* null, i32** %tmp3
  %tmp4 = load i32* %l_4, align 4
  %conv5 = trunc i32 %tmp4 to i16
  ret i16 %conv5
}

define internal signext i8 @safe_lshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i8* %left.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp slt i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load i32* %right.addr, align 4
  %cmp3 = icmp uge i32 %tmp2, 32
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i8* %left.addr, align 1
  %conv7 = sext i8 %tmp6 to i32
  %tmp8 = load i32* %right.addr, align 4
  %shr = ashr i32 127, %tmp8
  %cmp9 = icmp sgt i32 %conv7, %shr
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp11 = load i8* %left.addr, align 1
  %conv12 = sext i8 %tmp11 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp13 = load i8* %left.addr, align 1
  %conv14 = sext i8 %tmp13 to i32
  %tmp15 = load i32* %right.addr, align 4
  %shl = shl i32 %conv14, %tmp15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv12, %cond.true ], [ %shl, %cond.false ]
  %conv16 = trunc i32 %cond to i8
  ret i8 %conv16
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i16 @func_1()
  %tmp = load i32* @g_6, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
