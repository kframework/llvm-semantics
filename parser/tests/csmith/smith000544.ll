; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000544.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i32 -599044590, align 4
@g_10 = global [8 x i32] [i32 1146444112, i32 1146444112, i32 1146444112, i32 1146444112, i32 1146444112, i32 1146444112, i32 1146444112, i32 1146444112], align 16
@g_9 = global [1 x [4 x [8 x i32*]]] [[4 x [8 x i32*]] [[8 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*)], [8 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*)], [8 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*)], [8 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_10 to i8*), i64 20) to i32*)]]], align 16
@g_13 = global i32 -1974308043, align 4
@g_14 = global i32** bitcast (i8* getelementptr (i8* bitcast ([1 x [4 x [8 x i32*]]]* @g_9 to i8*), i64 88) to i32**), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_10[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_10[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_10[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_10[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_10[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_10[5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_10[6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_10[7] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
entry:
  %l_2 = alloca i16, align 2
  store i16 -13725, i16* %l_2, align 2
  %tmp = load i32* getelementptr inbounds ([8 x i32]* @g_10, i32 0, i64 2), align 4
  %conv = trunc i32 %tmp to i8
  ret i8 %conv
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call signext i8 @func_1()
  %tmp = load i32* @g_4, align 4
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 %tmp)
  %tmp2 = load i32* getelementptr inbounds ([8 x i32]* @g_10, i32 0, i64 0), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds ([8 x i32]* @g_10, i32 0, i64 1), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i32* getelementptr inbounds ([8 x i32]* @g_10, i32 0, i64 2), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i32 0, i32 0), i32 %tmp6)
  %tmp8 = load i32* getelementptr inbounds ([8 x i32]* @g_10, i32 0, i64 3), align 4
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i32 0, i32 0), i32 %tmp8)
  %tmp10 = load i32* getelementptr inbounds ([8 x i32]* @g_10, i32 0, i64 4), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i32 0, i32 0), i32 %tmp10)
  %tmp12 = load i32* getelementptr inbounds ([8 x i32]* @g_10, i32 0, i64 5), align 4
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %tmp12)
  %tmp14 = load i32* getelementptr inbounds ([8 x i32]* @g_10, i32 0, i64 6), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i32 0, i32 0), i32 %tmp14)
  %tmp16 = load i32* getelementptr inbounds ([8 x i32]* @g_10, i32 0, i64 7), align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i32 0, i32 0), i32 %tmp16)
  %tmp18 = load i32* getelementptr inbounds ([8 x i32]* @g_10, i32 0, i64 5), align 4
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i32 0, i32 0), i32 %tmp18)
  %tmp20 = load i32* @g_13, align 4
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str9, i32 0, i32 0), i32 %tmp20)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
