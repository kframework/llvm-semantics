; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000246.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_7 = global [8 x i32] [i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435, i32 -167511435], align 16
@g_10 = global i32 7, align 4
@g_9 = global [10 x [8 x i32*]] [[8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], [8 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10]], align 16
@g_11 = global [7 x [3 x i32*]] [[3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10], [3 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10]], align 16
@g_12 = global [4 x i32*] [i32* @g_10, i32* @g_10, i32* @g_10, i32* @g_10], align 16
@g_13 = global i32* null, align 8
@g_14 = global i32* @g_10, align 8
@.str = private unnamed_addr constant [22 x i8] c"checksum g_7[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_7[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_7[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_7[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_7[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_7[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_7[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_7[7] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [20 x i8] c"checksum g_10 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_8 = alloca i16, align 2
  %l_15 = alloca i32*, align 8
  store i16 -547, i16* %l_8, align 2
  store i32* @g_10, i32** %l_15, align 8
  %tmp = load i16* %l_8, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 7), align 4
  %conv2 = trunc i32 %tmp1 to i16
  %tmp3 = load i16* %l_8, align 2
  %conv4 = trunc i16 %tmp3 to i8
  %call = call i32 @func_2(i32 %conv, i16 signext %conv2, i8 signext %conv4, i32 613540510)
  %tmp5 = volatile load i32** @g_14, align 8
  store i32 %call, i32* %tmp5
  %tmp6 = load i32** %l_15, align 8
  %tmp7 = load i32* %tmp6
  %conv8 = sext i32 %tmp7 to i64
  %xor = xor i64 %conv8, 1
  %conv9 = trunc i64 %xor to i32
  store i32 %conv9, i32* %tmp6
  %tmp10 = load i32** %l_15, align 8
  %tmp11 = load i32* %tmp10
  ret i32 %tmp11
}

define i32 @func_2(i32 %p_3, i16 signext %p_4, i8 signext %p_5, i32 %p_6) nounwind uwtable {
entry:
  %p_3.addr = alloca i32, align 4
  %p_4.addr = alloca i16, align 2
  %p_5.addr = alloca i8, align 1
  %p_6.addr = alloca i32, align 4
  store i32 %p_3, i32* %p_3.addr, align 4
  store i16 %p_4, i16* %p_4.addr, align 2
  store i8 %p_5, i8* %p_5.addr, align 1
  store i32 %p_6, i32* %p_6.addr, align 4
  %tmp = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 4), align 4
  ret i32 %tmp
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @func_1()
  %tmp = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 0), align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 4), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 6), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 7), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([8 x i32]* @g_7, i32 0, i64 4), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* @g_10, align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str8, i32 0, i32 0), i32 %tmp18)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
