; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000035.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i32 -4, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i32, align 4
  %l_7 = alloca i32*, align 8
  %l_8 = alloca i32*, align 8
  %l_5 = alloca i32*, align 8
  store i32 221752643, i32* %l_2, align 4
  store i32* null, i32** %l_7, align 8
  store i32* %l_2, i32** %l_8, align 8
  store i32 1595784908, i32* %l_2, align 4
  store i32 -5, i32* %l_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %l_2, align 4
  %cmp = icmp sge i32 %tmp, -27
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32* %l_2, i32** %l_5, align 8
  %tmp2 = load i32** %l_5, align 8
  %tmp3 = load i32* %tmp2
  %conv = sext i32 %tmp3 to i64
  %xor = xor i64 %conv, 2426108200
  %conv4 = trunc i64 %xor to i32
  store i32 %conv4, i32* %tmp2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp5 = load i32* %l_2, align 4
  %call = call i32 @safe_sub_func_uint32_t_u_u(i32 %tmp5, i32 1)
  store i32 %call, i32* %l_2, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp6 = volatile load i32* @g_6, align 4
  %tmp7 = load i32** %l_8, align 8
  %tmp8 = load i32* %tmp7
  %xor9 = xor i32 %tmp8, %tmp6
  store i32 %xor9, i32* %tmp7
  %tmp10 = volatile load i32* @g_6, align 4
  ret i32 %tmp10
}

define internal i32 @safe_sub_func_uint32_t_u_u(i32 %ui1, i32 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, i32* %ui1.addr, align 4
  store i32 %ui2, i32* %ui2.addr, align 4
  %tmp = load i32* %ui1.addr, align 4
  %tmp1 = load i32* %ui2.addr, align 4
  %sub = sub i32 %tmp, %tmp1
  ret i32 %sub
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
  %tmp = volatile load i32* @g_6, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
