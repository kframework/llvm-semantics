; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001082.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 511789939, align 4
@g_7 = global i32 -1, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_5 = alloca i64, align 8
  %l_6 = alloca i32*, align 8
  store i64 -1, i64* %l_5, align 8
  store i32* @g_7, i32** %l_6, align 8
  %tmp = load i32* @g_2, align 4
  %tmp1 = load i32* @g_2, align 4
  %conv = zext i32 %tmp1 to i64
  %cmp = icmp ne i64 %conv, 1
  %conv2 = zext i1 %cmp to i32
  %cmp3 = icmp ugt i32 %tmp, %conv2
  %conv4 = zext i1 %cmp3 to i32
  %tmp5 = load i64* %l_5, align 8
  %conv6 = trunc i64 %tmp5 to i32
  %tmp7 = load i64* %l_5, align 8
  %conv8 = trunc i64 %tmp7 to i32
  %call = call i32 @safe_div_func_uint32_t_u_u(i32 %conv6, i32 %conv8)
  %cmp9 = icmp ugt i32 %conv4, %call
  %conv10 = zext i1 %cmp9 to i32
  %tmp11 = load i32** %l_6, align 8
  store i32 %conv10, i32* %tmp11
  %tmp12 = load i32** %l_6, align 8
  %tmp13 = load i32* %tmp12
  %conv14 = sext i32 %tmp13 to i64
  ret i64 %conv14
}

define internal i32 @safe_div_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui2.addr, align 4
  %cmp = icmp eq i32 %tmp, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp1 = load i32* %ui1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp2 = load i32* %ui1.addr, align 4
  %tmp3 = load i32* %ui2.addr, align 4
  %div = udiv i32 %tmp2, %tmp3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %tmp1, %cond.true ], [ %div, %cond.false ]
  ret i32 %cond
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_7, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
