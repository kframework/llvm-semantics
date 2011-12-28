; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000379.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = constant i8 9, align 1
@g_5 = global [8 x i32] zeroinitializer, align 16
@g_4 = global i32* bitcast (i8* getelementptr (i8* bitcast ([8 x i32]* @g_5 to i8*), i64 8) to i32*), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_5[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5[5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_5[6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_5[7] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  %l_3 = alloca i32*, align 8
  store i32* null, i32** %l_3, align 8
  %tmp = volatile load i32** @g_4, align 8
  store i32 9, i32* %tmp
  %tmp1 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i32 0, i64 6), align 4
  %conv = sext i32 %tmp1 to i64
  ret i64 %conv
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i64 @func_1()
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i32 0, i32 0), i32 9)
  %tmp = load i32* getelementptr inbounds ([8 x i32]* @g_5, i32 0, i64 0), align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp)
  %tmp3 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i32 0, i64 1), align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp3)
  %tmp5 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i32 0, i64 2), align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp5)
  %tmp7 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i32 0, i64 3), align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp7)
  %tmp9 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i32 0, i64 4), align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp9)
  %tmp11 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i32 0, i64 5), align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %tmp11)
  %tmp13 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i32 0, i64 6), align 4
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %tmp13)
  %tmp15 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i32 0, i64 7), align 4
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %tmp15)
  %tmp17 = load i32* getelementptr inbounds ([8 x i32]* @g_5, i32 0, i64 2), align 4
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %tmp17)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
