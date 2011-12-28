; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000735.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_9 = constant i32 -681110032, align 4
@g_10 = global i32 -1, align 4
@g_12 = global i32 0, align 4
@.str = private unnamed_addr constant [19 x i8] c"checksum g_9 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %retval = alloca i64, align 8
  %l_6 = alloca i32, align 4
  %l_11 = alloca i32*, align 8
  %l_15 = alloca i8, align 1
  store i32 -1554040502, i32* %l_6, align 4
  store i32* @g_12, i32** %l_11, align 8
  br label %lbl_16

lbl_16:                                           ; preds = %if.then, %entry
  %tmp = load i32* %l_6, align 4
  %conv = trunc i32 %tmp to i8
  %call = call signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %conv, i32 -201137379)
  %conv1 = sext i8 %call to i64
  %tmp2 = load i32* %l_6, align 4
  %conv3 = zext i32 %tmp2 to i64
  %call4 = call i64 @safe_add_func_uint64_t_u_u(i64 %conv1, i64 %conv3)
  %tmp5 = volatile load i32* @g_9, align 4
  %conv6 = trunc i32 %tmp5 to i16
  %tmp7 = load i32* %l_6, align 4
  %tmp8 = load i32* %l_6, align 4
  %cmp = icmp ule i32 %tmp7, %tmp8
  %conv9 = zext i1 %cmp to i32
  %tmp10 = load i32* @g_10, align 4
  %cmp11 = icmp ne i32 %conv9, %tmp10
  %conv12 = zext i1 %cmp11 to i32
  %tmp13 = load i32* %l_6, align 4
  %tmp14 = load i32* %l_6, align 4
  %cmp15 = icmp eq i32 %tmp13, %tmp14
  %conv16 = zext i1 %cmp15 to i32
  %tmp17 = load i32* @g_10, align 4
  %cmp18 = icmp ne i32 %conv16, %tmp17
  %conv19 = zext i1 %cmp18 to i32
  %cmp20 = icmp slt i32 %conv12, %conv19
  %conv21 = zext i1 %cmp20 to i32
  %conv22 = trunc i32 %conv21 to i16
  %call23 = call zeroext i16 @safe_mul_func_uint16_t_u_u(i16 zeroext %conv6, i16 zeroext %conv22)
  %conv24 = zext i16 %call23 to i32
  %tmp25 = load i32* @g_10, align 4
  %conv26 = zext i32 %tmp25 to i64
  %cmp27 = icmp slt i64 %conv26, 9
  %conv28 = zext i1 %cmp27 to i32
  %cmp29 = icmp eq i32 %conv24, %conv28
  %conv30 = zext i1 %cmp29 to i32
  %conv31 = sext i32 %conv30 to i64
  %cmp32 = icmp ugt i64 %call4, %conv31
  %conv33 = zext i1 %cmp32 to i32
  %tmp34 = load i32** %l_11, align 8
  %tmp35 = load i32* %tmp34
  %or = or i32 %tmp35, %conv33
  store i32 %or, i32* %tmp34
  store i32 0, i32* @g_12, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %lbl_16
  %tmp36 = load i32* @g_12, align 4
  %cmp37 = icmp sge i32 %tmp36, 0
  br i1 %cmp37, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store i8 -58, i8* %l_15, align 1
  %tmp40 = load i8* %l_15, align 1
  %conv41 = sext i8 %tmp40 to i64
  store i64 %conv41, i64* %retval
  br label %return

for.inc:                                          ; No predecessors!
  %tmp42 = load i32* @g_12, align 4
  %call43 = call i32 @safe_add_func_uint32_t_u_u(i32 %tmp42, i32 1)
  store i32 %call43, i32* @g_12, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp44 = load i32* %l_6, align 4
  %tobool = icmp ne i32 %tmp44, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  br label %lbl_16

if.end:                                           ; preds = %for.end
  %tmp45 = volatile load i32* @g_9, align 4
  %conv46 = zext i32 %tmp45 to i64
  store i64 %conv46, i64* %retval
  br label %return

return:                                           ; preds = %if.end, %for.body
  %0 = load i64* %retval
  ret i64 %0
}

define internal i64 @safe_add_func_uint64_t_u_u(i64 %ui1, i64 %ui2) nounwind uwtable {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, i64* %ui1.addr, align 8
  store i64 %ui2, i64* %ui2.addr, align 8
  %tmp = load i64* %ui1.addr, align 8
  %tmp1 = load i64* %ui2.addr, align 8
  %add = add i64 %tmp, %tmp1
  ret i64 %add
}

define internal signext i8 @safe_rshift_func_int8_t_s_u(i8 signext %left, i32 %right) nounwind uwtable {
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
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %entry
  %tmp5 = load i8* %left.addr, align 1
  %conv6 = sext i8 %tmp5 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %tmp7 = load i8* %left.addr, align 1
  %conv8 = sext i8 %tmp7 to i32
  %tmp9 = load i32* %right.addr, align 4
  %shr = ashr i32 %conv8, %tmp9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv6, %cond.true ], [ %shr, %cond.false ]
  %conv10 = trunc i32 %cond to i8
  ret i8 %conv10
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
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %tmp = volatile load i32* @g_9, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* @g_10, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* @g_12, align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
