; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001910.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 432383572, align 4
@g_5 = global i32 -8, align 4
@g_4 = global i32* @g_5, align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i32*, align 8
  store i32* @g_3, i32** %l_2, align 8
  %tmp = load i32** %l_2, align 8
  %tmp1 = load i32* %tmp
  %conv = sext i32 %tmp1 to i64
  %and = and i64 %conv, 1
  %conv2 = trunc i64 %and to i32
  store i32 %conv2, i32* %tmp
  %tmp3 = load i32* @g_3, align 4
  %xor = xor i32 %tmp3, 1
  %tmp4 = load i32** %l_2, align 8
  store i32 %xor, i32* %tmp4
  %tmp5 = load i32** %l_2, align 8
  %tmp6 = load i32* %tmp5
  %tobool = icmp ne i32 %tmp6, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp7 = load i32** %l_2, align 8
  %tmp8 = load i32* %tmp7
  %tmp9 = load i32* @g_3, align 4
  %cmp = icmp slt i32 %tmp8, %tmp9
  %conv10 = zext i1 %cmp to i32
  %conv11 = sext i32 %conv10 to i64
  %cmp12 = icmp sle i64 763615107, %conv11
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %cmp12, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %tmp14 = volatile load i32** @g_4, align 8
  %tmp15 = load i32* %tmp14
  %and16 = and i32 %tmp15, %land.ext
  store i32 %and16, i32* %tmp14
  %tmp17 = load i32* @g_3, align 4
  %conv18 = trunc i32 %tmp17 to i16
  ret i16 %conv18
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = load i32* @g_3, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_5, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
