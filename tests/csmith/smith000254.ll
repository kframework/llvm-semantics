; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000254.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S2 = type { i8, i8, i32, i32 }

@g_4 = global [2 x %struct.S2] [%struct.S2 { i8 -9, i8 -12, i32 -1, i32 1052116627 }, %struct.S2 { i8 -9, i8 -12, i32 -1, i32 1052116627 }], align 16
@.str = private unnamed_addr constant [25 x i8] c"checksum g_4[0].f0 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [25 x i8] c"checksum g_4[0].f1 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [25 x i8] c"checksum g_4[0].f2 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [25 x i8] c"checksum g_4[0].f3 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [25 x i8] c"checksum g_4[1].f0 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [25 x i8] c"checksum g_4[1].f1 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [25 x i8] c"checksum g_4[1].f2 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [25 x i8] c"checksum g_4[1].f3 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_3 = alloca %struct.S2*, align 8
  %l_2 = alloca %struct.S2**, align 8
  store %struct.S2* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1), %struct.S2** %l_3, align 8
  store %struct.S2** %l_3, %struct.S2*** %l_2, align 8
  %tmp = load %struct.S2*** %l_2, align 8
  store %struct.S2* null, %struct.S2** %tmp
  %tmp1 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 0), align 1
  %conv = sext i8 %tmp1 to i32
  ret i32 %conv
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
  %call = call i32 @func_1()
  %tmp = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 0, i32 0), align 1
  %conv = sext i8 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 0, i32 1), align 1
  %conv3 = zext i8 %tmp2 to i32
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i32 0, i32 0), i32 %conv3)
  %tmp5 = volatile load i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 0, i32 2), align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i32 0, i32 0), i32 %tmp5)
  %tmp7 = volatile load i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 0, i32 3), align 4
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i32 0, i32 0), i32 %tmp7)
  %tmp9 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 0), align 1
  %conv10 = sext i8 %tmp9 to i32
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %conv10)
  %tmp12 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 1), align 1
  %conv13 = zext i8 %tmp12 to i32
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %conv13)
  %tmp15 = volatile load i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 2), align 4
  %call16 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %tmp15)
  %tmp17 = volatile load i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 3), align 4
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %tmp17)
  %tmp19 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 0), align 1
  %conv20 = sext i8 %tmp19 to i32
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str4, i32 0, i32 0), i32 %conv20)
  %tmp22 = load i8* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 1), align 1
  %conv23 = zext i8 %tmp22 to i32
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str5, i32 0, i32 0), i32 %conv23)
  %tmp25 = volatile load i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 2), align 4
  %call26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str6, i32 0, i32 0), i32 %tmp25)
  %tmp27 = volatile load i32* getelementptr inbounds ([2 x %struct.S2]* @g_4, i32 0, i64 1, i32 3), align 4
  %call28 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str7, i32 0, i32 0), i32 %tmp27)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
