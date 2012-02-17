; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000704.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global i16 -1, align 2
@g_6 = global i16 1, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i8 @func_1() nounwind uwtable {
entry:
  %l_4 = alloca i32, align 4
  %l_10 = alloca i32*, align 8
  %l_11 = alloca i32*, align 8
  store i32 1, i32* %l_4, align 4
  br label %lbl_9

lbl_9:                                            ; preds = %if.then, %entry
  %tmp = load i32* %l_4, align 4
  %conv = trunc i32 %tmp to i16
  %tmp1 = load i32* %l_4, align 4
  %tmp2 = volatile load i16* @g_5, align 2
  %conv3 = zext i16 %tmp2 to i32
  %and = and i32 %tmp1, %conv3
  %tmp4 = load i16* @g_6, align 2
  %conv5 = sext i16 %tmp4 to i32
  %xor = xor i32 %and, %conv5
  %conv6 = trunc i32 %xor to i16
  %call = call signext i16 @safe_mul_func_int16_t_s_s(i16 signext %conv, i16 signext %conv6)
  %conv7 = sext i16 %call to i32
  store i32 %conv7, i32* %l_4, align 4
  volatile store i16 5, i16* @g_5, align 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %lbl_9
  %tmp8 = volatile load i16* @g_5, align 2
  %conv9 = zext i16 %tmp8 to i32
  %cmp = icmp ne i32 %conv9, 5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i32* null, i32** %l_10, align 8
  store i32* %l_4, i32** %l_11, align 8
  %tmp13 = load i16* @g_6, align 2
  %tobool = icmp ne i16 %tmp13, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  br label %lbl_9

if.end:                                           ; preds = %for.body
  %tmp14 = load i32** %l_11, align 8
  %tmp15 = load i32* %tmp14
  %conv16 = sext i32 %tmp15 to i64
  %or = or i64 %conv16, 2703514753
  %conv17 = trunc i64 %or to i32
  store i32 %conv17, i32* %tmp14
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp18 = volatile load i16* @g_5, align 2
  %conv19 = trunc i16 %tmp18 to i8
  %call20 = call signext i8 @safe_sub_func_int8_t_s_s(i8 signext %conv19, i8 signext 7)
  %conv21 = sext i8 %call20 to i16
  volatile store i16 %conv21, i16* @g_5, align 2
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp22 = load i16* @g_6, align 2
  %conv23 = trunc i16 %tmp22 to i8
  ret i8 %conv23
}

define internal signext i16 @safe_mul_func_int16_t_s_s(i16 signext %si1, i16 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, i16* %si1.addr, align 2
  store i16 %si2, i16* %si2.addr, align 2
  %tmp = load i16* %si1.addr, align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* %si2.addr, align 2
  %conv2 = sext i16 %tmp1 to i32
  %mul = mul nsw i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i16
  ret i16 %conv3
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
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call zeroext i8 @func_1()
  %tmp = volatile load i16* @g_5, align 2
  %conv = zext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i16* @g_6, align 2
  %conv3 = sext i16 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
