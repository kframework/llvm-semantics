; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000968.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_5 = global [5 x i32*] zeroinitializer, align 16
@g_7 = global [8 x [3 x [1 x [1 x i32]]]] [[3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]], [3 x [1 x [1 x i32]]] [[1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]], [1 x [1 x i32]] [[1 x i32] [i32 33308398]]]], align 16
@.str = private unnamed_addr constant [31 x i8] c"checksum g_7[0][0][0][0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [31 x i8] c"checksum g_7[0][1][0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [31 x i8] c"checksum g_7[0][2][0][0] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [31 x i8] c"checksum g_7[1][0][0][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [31 x i8] c"checksum g_7[1][1][0][0] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [31 x i8] c"checksum g_7[1][2][0][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [31 x i8] c"checksum g_7[2][0][0][0] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [31 x i8] c"checksum g_7[2][1][0][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [31 x i8] c"checksum g_7[2][2][0][0] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [31 x i8] c"checksum g_7[3][0][0][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [31 x i8] c"checksum g_7[3][1][0][0] = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [31 x i8] c"checksum g_7[3][2][0][0] = %d\0A\00", align 1
@.str12 = private unnamed_addr constant [31 x i8] c"checksum g_7[4][0][0][0] = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [31 x i8] c"checksum g_7[4][1][0][0] = %d\0A\00", align 1
@.str14 = private unnamed_addr constant [31 x i8] c"checksum g_7[4][2][0][0] = %d\0A\00", align 1
@.str15 = private unnamed_addr constant [31 x i8] c"checksum g_7[5][0][0][0] = %d\0A\00", align 1
@.str16 = private unnamed_addr constant [31 x i8] c"checksum g_7[5][1][0][0] = %d\0A\00", align 1
@.str17 = private unnamed_addr constant [31 x i8] c"checksum g_7[5][2][0][0] = %d\0A\00", align 1
@.str18 = private unnamed_addr constant [31 x i8] c"checksum g_7[6][0][0][0] = %d\0A\00", align 1
@.str19 = private unnamed_addr constant [31 x i8] c"checksum g_7[6][1][0][0] = %d\0A\00", align 1
@.str20 = private unnamed_addr constant [31 x i8] c"checksum g_7[6][2][0][0] = %d\0A\00", align 1
@.str21 = private unnamed_addr constant [31 x i8] c"checksum g_7[7][0][0][0] = %d\0A\00", align 1
@.str22 = private unnamed_addr constant [31 x i8] c"checksum g_7[7][1][0][0] = %d\0A\00", align 1
@.str23 = private unnamed_addr constant [31 x i8] c"checksum g_7[7][2][0][0] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_6 = alloca [2 x i32*], align 16
  %l_8 = alloca i32**, align 8
  %i = alloca i32, align 4
  store i32** null, i32*** %l_8, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idxprom = sext i32 %tmp1 to i64
  %arrayidx = getelementptr inbounds [2 x i32*]* %l_6, i32 0, i64 %idxprom
  store i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 3, i64 0, i64 0, i64 0), i32** %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp2 = load i32* %i, align 4
  %inc = add nsw i32 %tmp2, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx3 = getelementptr inbounds [2 x i32*]* %l_6, i32 0, i64 1
  %tmp4 = load i32** %arrayidx3, align 8
  %cmp5 = icmp eq i32* %tmp4, null
  %conv = zext i1 %cmp5 to i32
  %conv6 = trunc i32 %conv to i8
  %tmp7 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 4, i64 2, i64 0, i64 0), align 4
  %conv8 = trunc i32 %tmp7 to i16
  %call = call i32* @func_2(i8 signext %conv6, i16 signext %conv8)
  store i32* %call, i32** getelementptr inbounds ([5 x i32*]* @g_5, i32 0, i64 0), align 8
  %tmp9 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 3, i64 0, i64 0, i64 0), align 4
  ret i32 %tmp9
}

define i32* @func_2(i8 signext %p_3, i16 signext %p_4) nounwind uwtable {
entry:
  %p_3.addr = alloca i8, align 1
  %p_4.addr = alloca i16, align 2
  store i8 %p_3, i8* %p_3.addr, align 1
  store i16 %p_4, i16* %p_4.addr, align 2
  %tmp = load i32** getelementptr inbounds ([5 x i32*]* @g_5, i32 0, i64 1), align 8
  ret i32* %tmp
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
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 0, i64 0, i64 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 0, i64 1, i64 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 0, i64 2, i64 0, i64 0), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 1, i64 0, i64 0, i64 0), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 1, i64 1, i64 0, i64 0), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 1, i64 2, i64 0, i64 0), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 2, i64 0, i64 0, i64 0), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 2, i64 1, i64 0, i64 0), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 2, i64 2, i64 0, i64 0), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 3, i64 0, i64 0, i64 0), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str9, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 3, i64 1, i64 0, i64 0), align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str10, i32 0, i32 0), i32 %tmp20)
  %tmp22 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 3, i64 2, i64 0, i64 0), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str11, i32 0, i32 0), i32 %tmp22)
  %tmp24 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 4, i64 0, i64 0, i64 0), align 4
  %call25 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str12, i32 0, i32 0), i32 %tmp24)
  %tmp26 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 4, i64 1, i64 0, i64 0), align 4
  %call27 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str13, i32 0, i32 0), i32 %tmp26)
  %tmp28 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 4, i64 2, i64 0, i64 0), align 4
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str14, i32 0, i32 0), i32 %tmp28)
  %tmp30 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 5, i64 0, i64 0, i64 0), align 4
  %call31 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str15, i32 0, i32 0), i32 %tmp30)
  %tmp32 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 5, i64 1, i64 0, i64 0), align 4
  %call33 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str16, i32 0, i32 0), i32 %tmp32)
  %tmp34 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 5, i64 2, i64 0, i64 0), align 4
  %call35 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str17, i32 0, i32 0), i32 %tmp34)
  %tmp36 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 6, i64 0, i64 0, i64 0), align 4
  %call37 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str18, i32 0, i32 0), i32 %tmp36)
  %tmp38 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 6, i64 1, i64 0, i64 0), align 4
  %call39 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str19, i32 0, i32 0), i32 %tmp38)
  %tmp40 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 6, i64 2, i64 0, i64 0), align 4
  %call41 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str20, i32 0, i32 0), i32 %tmp40)
  %tmp42 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 7, i64 0, i64 0, i64 0), align 4
  %call43 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str21, i32 0, i32 0), i32 %tmp42)
  %tmp44 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 7, i64 1, i64 0, i64 0), align 4
  %call45 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str22, i32 0, i32 0), i32 %tmp44)
  %tmp46 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 7, i64 2, i64 0, i64 0), align 4
  %call47 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str23, i32 0, i32 0), i32 %tmp46)
  %tmp48 = load i32* getelementptr inbounds ([8 x [3 x [1 x [1 x i32]]]]* @g_7, i32 0, i64 3, i64 0, i64 0, i64 0), align 4
  %call49 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([31 x i8]* @.str9, i32 0, i32 0), i32 %tmp48)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
