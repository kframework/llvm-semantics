; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001535.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i16 0, align 2
@g_6 = global i32 1, align 4
@g_11 = global [6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]] [[1 x [6 x [1 x [1 x [1 x i32]]]]] [[6 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]]]], [1 x [6 x [1 x [1 x [1 x i32]]]]] [[6 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]]]], [1 x [6 x [1 x [1 x [1 x i32]]]]] [[6 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]]]], [1 x [6 x [1 x [1 x [1 x i32]]]]] [[6 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]]]], [1 x [6 x [1 x [1 x [1 x i32]]]]] [[6 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]]]], [1 x [6 x [1 x [1 x [1 x i32]]]]] [[6 x [1 x [1 x [1 x i32]]]] [[1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]], [1 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 -927718947]]]]]], align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [38 x i8] c"checksum g_11[0][0][0][0][0][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [38 x i8] c"checksum g_11[0][0][1][0][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [38 x i8] c"checksum g_11[0][0][2][0][0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [38 x i8] c"checksum g_11[0][0][3][0][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [38 x i8] c"checksum g_11[0][0][4][0][0][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [38 x i8] c"checksum g_11[0][0][5][0][0][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [38 x i8] c"checksum g_11[1][0][0][0][0][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [38 x i8] c"checksum g_11[1][0][1][0][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [38 x i8] c"checksum g_11[1][0][2][0][0][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [38 x i8] c"checksum g_11[1][0][3][0][0][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [38 x i8] c"checksum g_11[1][0][4][0][0][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [38 x i8] c"checksum g_11[1][0][5][0][0][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [38 x i8] c"checksum g_11[2][0][0][0][0][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [38 x i8] c"checksum g_11[2][0][1][0][0][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [38 x i8] c"checksum g_11[2][0][2][0][0][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [38 x i8] c"checksum g_11[2][0][3][0][0][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [38 x i8] c"checksum g_11[2][0][4][0][0][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [38 x i8] c"checksum g_11[2][0][5][0][0][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [38 x i8] c"checksum g_11[3][0][0][0][0][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [38 x i8] c"checksum g_11[3][0][1][0][0][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [38 x i8] c"checksum g_11[3][0][2][0][0][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [38 x i8] c"checksum g_11[3][0][3][0][0][0] = %d\0A\00", align 1
@.str24 = private unnamed_addr constant [38 x i8] c"checksum g_11[3][0][4][0][0][0] = %d\0A\00", align 1
@.str25 = private unnamed_addr constant [38 x i8] c"checksum g_11[3][0][5][0][0][0] = %d\0A\00", align 1
@.str26 = private unnamed_addr constant [38 x i8] c"checksum g_11[4][0][0][0][0][0] = %d\0A\00", align 1
@.str27 = private unnamed_addr constant [38 x i8] c"checksum g_11[4][0][1][0][0][0] = %d\0A\00", align 1
@.str28 = private unnamed_addr constant [38 x i8] c"checksum g_11[4][0][2][0][0][0] = %d\0A\00", align 1
@.str29 = private unnamed_addr constant [38 x i8] c"checksum g_11[4][0][3][0][0][0] = %d\0A\00", align 1
@.str30 = private unnamed_addr constant [38 x i8] c"checksum g_11[4][0][4][0][0][0] = %d\0A\00", align 1
@.str31 = private unnamed_addr constant [38 x i8] c"checksum g_11[4][0][5][0][0][0] = %d\0A\00", align 1
@.str32 = private unnamed_addr constant [38 x i8] c"checksum g_11[5][0][0][0][0][0] = %d\0A\00", align 1
@.str33 = private unnamed_addr constant [38 x i8] c"checksum g_11[5][0][1][0][0][0] = %d\0A\00", align 1
@.str34 = private unnamed_addr constant [38 x i8] c"checksum g_11[5][0][2][0][0][0] = %d\0A\00", align 1
@.str35 = private unnamed_addr constant [38 x i8] c"checksum g_11[5][0][3][0][0][0] = %d\0A\00", align 1
@.str36 = private unnamed_addr constant [38 x i8] c"checksum g_11[5][0][4][0][0][0] = %d\0A\00", align 1
@.str37 = private unnamed_addr constant [38 x i8] c"checksum g_11[5][0][5][0][0][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %retval = alloca i16, align 2
  %l_2 = alloca [8 x i32*], align 16
  %l_7 = alloca i16, align 2
  %i = alloca i32, align 4
  store i16 1, i16* %l_7, align 2
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [8 x i32*]* %l_2, i32 0, i64 %idxprom
  store i32* null, i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  volatile store i16 30172, i16* @g_3, align 2
  br label %lbl_10

lbl_10:                                           ; preds = %if.then34, %for.end
  %tmp3 = volatile load i16* @g_3, align 2
  %conv = sext i16 %tmp3 to i32
  %tmp4 = load i32* @g_6, align 4
  %tmp5 = load i32* @g_6, align 4
  %or = or i32 %tmp4, %tmp5
  %tmp6 = load i32* @g_6, align 4
  %tmp7 = load i16* %l_7, align 2
  %conv8 = zext i16 %tmp7 to i32
  %cmp9 = icmp ne i32 %tmp6, %conv8
  %conv10 = zext i1 %cmp9 to i32
  %cmp11 = icmp ult i32 %or, %conv10
  %conv12 = zext i1 %cmp11 to i32
  %cmp13 = icmp sge i32 %conv, %conv12
  %conv14 = zext i1 %cmp13 to i32
  %conv15 = trunc i32 %conv14 to i16
  %call = call signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %conv15, i32 -10)
  %conv16 = sext i16 %call to i32
  %tmp17 = load i32* @g_6, align 4
  %xor = xor i32 %conv16, %tmp17
  %conv18 = zext i32 %xor to i64
  %cmp19 = icmp eq i64 %conv18, 8
  br i1 %cmp19, label %if.then, label %if.else

if.then:                                          ; preds = %lbl_10
  store i32 -9, i32* @g_6, align 4
  br label %for.cond21

for.cond21:                                       ; preds = %for.inc28, %if.then
  %tmp22 = load i32* @g_6, align 4
  %cmp23 = icmp eq i32 %tmp22, 0
  br i1 %cmp23, label %for.body25, label %for.end31

for.body25:                                       ; preds = %for.cond21
  %tmp26 = load i32* @g_6, align 4
  %tobool = icmp ne i32 %tmp26, 0
  br i1 %tobool, label %if.then27, label %if.end

if.then27:                                        ; preds = %for.body25
  br label %for.end31

if.end:                                           ; preds = %for.body25
  br label %for.inc28

for.inc28:                                        ; preds = %if.end
  %tmp29 = load i32* @g_6, align 4
  %call30 = call i32 @safe_sub_func_uint32_t_u_u(i32 %tmp29, i32 4)
  store i32 %call30, i32* @g_6, align 4
  br label %for.cond21

for.end31:                                        ; preds = %if.then27, %for.cond21
  %tmp32 = load i32* @g_6, align 4
  %tobool33 = icmp ne i32 %tmp32, 0
  br i1 %tobool33, label %if.then34, label %if.end35

if.then34:                                        ; preds = %for.end31
  br label %lbl_10

if.end35:                                         ; preds = %for.end31
  br label %if.end37

if.else:                                          ; preds = %lbl_10
  %tmp36 = volatile load i16* @g_3, align 2
  store i16 %tmp36, i16* %retval
  br label %return

if.end37:                                         ; preds = %if.end35
  %tmp38 = load i32* @g_6, align 4
  %tmp39 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %and = and i32 %tmp39, %tmp38
  store i32 %and, i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %tmp40 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %conv41 = trunc i32 %tmp40 to i16
  store i16 %conv41, i16* %retval
  br label %return

return:                                           ; preds = %if.end37, %if.else
  %0 = load i16* %retval
  ret i16 %0
}

define internal signext i16 @safe_lshift_func_int16_t_s_u(i16 signext %left, i32 %right) nounwind uwtable {
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
  %cmp3 = icmp uge i32 %tmp2, 32
  br i1 %cmp3, label %cond.true, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %tmp6 = load i16* %left.addr, align 2
  %conv7 = sext i16 %tmp6 to i32
  %tmp8 = load i32* %right.addr, align 4
  %shr = ashr i32 32767, %tmp8
  %cmp9 = icmp sgt i32 %conv7, %shr
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  %tmp11 = load i16* %left.addr, align 2
  %conv12 = sext i16 %tmp11 to i32
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false5
  %tmp13 = load i16* %left.addr, align 2
  %conv14 = sext i16 %tmp13 to i32
  %tmp15 = load i32* %right.addr, align 4
  %shl = shl i32 %conv14, %tmp15
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv12, %cond.true ], [ %shl, %cond.false ]
  %conv16 = trunc i32 %cond to i16
  ret i16 %conv16
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
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l = alloca i32, align 4
  %m = alloca i32, align 4
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i16 @func_1()
  %tmp = volatile load i16* @g_3, align 2
  %conv = sext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i32* @g_6, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 0, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 0, i64 0, i64 2, i64 0, i64 0, i64 0), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 0, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 0, i64 0, i64 4, i64 0, i64 0, i64 0), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 0, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 1, i64 0, i64 0, i64 0, i64 0, i64 0), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 1, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 1, i64 0, i64 2, i64 0, i64 0, i64 0), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 1, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 1, i64 0, i64 4, i64 0, i64 0, i64 0), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 1, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 2, i64 0, i64 0, i64 0, i64 0, i64 0), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str14, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 2, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str15, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 2, i64 0, i64 2, i64 0, i64 0, i64 0), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str16, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 2, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str17, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 2, i64 0, i64 4, i64 0, i64 0, i64 0), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str18, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 2, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str19, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 0, i64 0, i64 0, i64 0), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str20, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str21, i32 0, i32 0), i32 %tmp42)
  %tmp44 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 2, i64 0, i64 0, i64 0), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str22, i32 0, i32 0), i32 %tmp44)
  %tmp46 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str23, i32 0, i32 0), i32 %tmp46)
  %tmp48 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 4, i64 0, i64 0, i64 0), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str24, i32 0, i32 0), i32 %tmp48)
  %tmp50 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %call51 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str25, i32 0, i32 0), i32 %tmp50)
  %tmp52 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 4, i64 0, i64 0, i64 0, i64 0, i64 0), align 4
  %call53 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str26, i32 0, i32 0), i32 %tmp52)
  %tmp54 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 4, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str27, i32 0, i32 0), i32 %tmp54)
  %tmp56 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 4, i64 0, i64 2, i64 0, i64 0, i64 0), align 4
  %call57 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str28, i32 0, i32 0), i32 %tmp56)
  %tmp58 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 4, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %call59 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str29, i32 0, i32 0), i32 %tmp58)
  %tmp60 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 4, i64 0, i64 4, i64 0, i64 0, i64 0), align 4
  %call61 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str30, i32 0, i32 0), i32 %tmp60)
  %tmp62 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 4, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %call63 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str31, i32 0, i32 0), i32 %tmp62)
  %tmp64 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 5, i64 0, i64 0, i64 0, i64 0, i64 0), align 4
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str32, i32 0, i32 0), i32 %tmp64)
  %tmp66 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 5, i64 0, i64 1, i64 0, i64 0, i64 0), align 4
  %call67 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str33, i32 0, i32 0), i32 %tmp66)
  %tmp68 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 5, i64 0, i64 2, i64 0, i64 0, i64 0), align 4
  %call69 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str34, i32 0, i32 0), i32 %tmp68)
  %tmp70 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 5, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %call71 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str35, i32 0, i32 0), i32 %tmp70)
  %tmp72 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 5, i64 0, i64 4, i64 0, i64 0, i64 0), align 4
  %call73 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str36, i32 0, i32 0), i32 %tmp72)
  %tmp74 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 5, i64 0, i64 5, i64 0, i64 0, i64 0), align 4
  %call75 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str37, i32 0, i32 0), i32 %tmp74)
  %tmp76 = load i32* getelementptr inbounds ([6 x [1 x [6 x [1 x [1 x [1 x i32]]]]]]* @g_11, i32 0, i64 3, i64 0, i64 3, i64 0, i64 0, i64 0), align 4
  %call77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str23, i32 0, i32 0), i32 %tmp76)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
