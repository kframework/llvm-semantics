; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001917.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i32 1384573041, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i32, align 4
  %l_5 = alloca i32*, align 8
  store i32 -1, i32* %l_4, align 4
  store i32* @g_6, i32** %l_5, align 8
  %tmp = load i32* %l_4, align 4
  %conv = trunc i32 %tmp to i8
  %call = call zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %conv, i32 -10)
  %conv1 = zext i8 %call to i32
  %tmp2 = load i32** %l_5, align 8
  %tmp3 = load i32* %tmp2
  %or = or i32 %tmp3, %conv1
  store i32 %or, i32* %tmp2
  %tmp4 = load i32* @g_6, align 4
  %tmp5 = load i32** %l_5, align 8
  store i32 %tmp4, i32* %tmp5
  %tmp6 = load i32** %l_5, align 8
  %tmp7 = load i32* %tmp6
  ret i32 %tmp7
}

define internal zeroext i8 @safe_rshift_func_uint8_t_u_u(i8 zeroext %left, i32 %right) nounwind uwtable {
entry:
  %left.addr = alloca i8, align 1
  %right.addr = alloca i32, align 4
  store i8 %left, i8* %left.addr, align 1
  store i32 %right, i32* %right.addr, align 4
  %tmp = load i32* %right.addr, align 4
  %cmp = icmp uge i32 %tmp, 32
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i8* %left.addr, align 1
  %conv = zext i8 %tmp1 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i8* %left.addr, align 1
  %conv3 = zext i8 %tmp2 to i32
  %tmp4 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv3, %tmp4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv, %cond.true ], [ %shr, %cond.false ]
  %conv5 = trunc i32 %cond to i8
  ret i8 %conv5
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
  %tmp = load i32* @g_6, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
