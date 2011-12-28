; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001755.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 29202344, align 4
@g_7 = global i32 886614347, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_7 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define zeroext i16 @func_1() nounwind uwtable {
entry:
  %l_8 = alloca i64, align 8
  %l_13 = alloca i32*, align 8
  %l_17 = alloca i64, align 8
  %l_5 = alloca [10 x i16], align 16
  %i = alloca i32, align 4
  %l_6 = alloca [6 x i32*], align 16
  %i15 = alloca i32, align 4
  store i64 -6, i64* %l_8, align 8
  store i32* @g_7, i32** %l_13, align 8
  store i64 3277427911883911173, i64* %l_17, align 8
  store i32 -4, i32* @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc33, %entry
  %tmp = load i32* @g_2, align 4
  %cmp = icmp eq i32 %tmp, -8
  br i1 %cmp, label %for.body, label %for.end37

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc, %for.body
  %tmp4 = load i32* %i, align 4
  %cmp5 = icmp slt i32 %tmp4, 10
  br i1 %cmp5, label %for.body6, label %for.end

for.body6:                                        ; preds = %for.cond3
  %tmp7 = load i32* %i, align 4
  %idxprom = sext i32 %tmp7 to i64
  %arrayidx = getelementptr inbounds [10 x i16]* %l_5, i32 0, i64 %idxprom
  store i16 -19035, i16* %arrayidx, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body6
  %tmp8 = load i32* %i, align 4
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond3

for.end:                                          ; preds = %for.cond3
  store i32 6, i32* @g_2, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc29, %for.end
  %tmp10 = load i32* @g_2, align 4
  %cmp11 = icmp sge i32 %tmp10, 0
  br i1 %cmp11, label %for.body12, label %for.end31

for.body12:                                       ; preds = %for.cond9
  store i32 0, i32* %i15, align 4
  br label %for.cond16

for.cond16:                                       ; preds = %for.inc23, %for.body12
  %tmp17 = load i32* %i15, align 4
  %cmp18 = icmp slt i32 %tmp17, 6
  br i1 %cmp18, label %for.body19, label %for.end26

for.body19:                                       ; preds = %for.cond16
  %tmp20 = load i32* %i15, align 4
  %idxprom21 = sext i32 %tmp20 to i64
  %arrayidx22 = getelementptr inbounds [6 x i32*]* %l_6, i32 0, i64 %idxprom21
  store i32* @g_7, i32** %arrayidx22, align 8
  br label %for.inc23

for.inc23:                                        ; preds = %for.body19
  %tmp24 = load i32* %i15, align 4
  %inc25 = add nsw i32 %tmp24, 1
  store i32 %inc25, i32* %i15, align 4
  br label %for.cond16

for.end26:                                        ; preds = %for.cond16
  %tmp27 = load i32* @g_2, align 4
  %conv = sext i32 %tmp27 to i64
  %tmp28 = load i64* %l_8, align 8
  %and = and i64 %tmp28, %conv
  store i64 %and, i64* %l_8, align 8
  br label %for.inc29

for.inc29:                                        ; preds = %for.end26
  %tmp30 = load i32* @g_2, align 4
  %add = add nsw i32 %tmp30, -7
  store i32 %add, i32* @g_2, align 4
  br label %for.cond9

for.end31:                                        ; preds = %for.cond9
  %tmp32 = load i32* @g_2, align 4
  %tobool = icmp ne i32 %tmp32, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end31
  br label %lbl_14

if.end:                                           ; preds = %for.end31
  br label %for.inc33

for.inc33:                                        ; preds = %if.end
  %tmp34 = load i32* @g_2, align 4
  %conv35 = trunc i32 %tmp34 to i16
  %call = call zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %conv35, i16 zeroext 3)
  %conv36 = zext i16 %call to i32
  store i32 %conv36, i32* @g_2, align 4
  br label %for.cond

for.end37:                                        ; preds = %for.cond
  br label %lbl_14

lbl_14:                                           ; preds = %for.end37, %if.then
  %tmp38 = load i64* %l_8, align 8
  %conv39 = trunc i64 %tmp38 to i8
  %tmp40 = load i32** %l_13, align 8
  %call41 = call i32* @func_9(i8 zeroext %conv39, i32* @g_7, i32* %tmp40)
  store i32* %call41, i32** %l_13, align 8
  %call42 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext 30461, i16 zeroext 28677)
  %conv43 = zext i16 %call42 to i32
  %tmp44 = load i32** %l_13, align 8
  store i32 %conv43, i32* %tmp44
  %tmp45 = load i32** %l_13, align 8
  %tmp46 = load i32* %tmp45
  %conv47 = trunc i32 %tmp46 to i16
  ret i16 %conv47
}

define internal zeroext i16 @safe_add_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %add = add nsw i32 %conv, %conv2
  %conv3 = trunc i32 %add to i16
  ret i16 %conv3
}

define i32* @func_9(i8 zeroext %p_10, i32* %p_11, i32* %p_12) nounwind uwtable {
entry:
  %p_10.addr = alloca i8, align 1
  %p_11.addr = alloca i32*, align 8
  %p_12.addr = alloca i32*, align 8
  store i8 %p_10, i8* %p_10.addr, align 1
  store i32* %p_11, i32** %p_11.addr, align 8
  store i32* %p_12, i32** %p_12.addr, align 8
  ret i32* @g_2
}

define internal zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %ui1, i16 zeroext %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, i16* %ui1.addr, align 2
  store i16 %ui2, i16* %ui2.addr, align 2
  %tmp = load i16* %ui1.addr, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i16* %ui2.addr, align 2
  %conv2 = zext i16 %tmp1 to i32
  %mul = mul i32 %conv, %conv2
  %conv3 = trunc i32 %mul to i16
  ret i16 %conv3
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
  %tmp = load i32* @g_2, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_7, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
