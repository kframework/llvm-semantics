; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001704.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i16 }
%struct.S0 = type { i16, i16, i8, i16, i16 }

@g_4 = global [2 x i32] zeroinitializer, align 4
@g_5 = global %struct.S0 { i16 -11030, i16 -1, i8 -4, i16 0, i16 12254 }, align 2
@.str = private unnamed_addr constant [22 x i8] c"checksum g_4[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_4[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_5.f0 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_5.f1 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_5.f2 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_5.f3 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_5.f4 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define %0 @func_1() nounwind uwtable {
entry:
  %retval = alloca %struct.S0, align 2
  %l_2 = alloca i16, align 2
  %l_3 = alloca i32*, align 8
  %tmp4 = alloca %0
  store i16 -3, i16* %l_2, align 2
  store i32* getelementptr inbounds ([2 x i32]* @g_4, i32 0, i64 0), i32** %l_3, align 8
  %tmp = load i16* %l_2, align 2
  %conv = zext i16 %tmp to i32
  %tmp1 = load i32** %l_3, align 8
  %tmp2 = load i32* %tmp1
  %xor = xor i32 %tmp2, %conv
  store i32 %xor, i32* %tmp1
  %tmp3 = bitcast %struct.S0* %retval to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp3, i8* bitcast (%struct.S0* @g_5 to i8*), i64 10, i32 2, i1 false)
  %0 = bitcast %0* %tmp4 to %struct.S0*
  %1 = load %struct.S0* %retval
  store %struct.S0 %1, %struct.S0* %0, align 1
  %2 = load %0* %tmp4
  ret %0 %2
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %i = alloca i32, align 4
  %coerce = alloca %struct.S0, align 2
  %tmp = alloca %0
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call %0 @func_1()
  store %0 %call, %0* %tmp
  %0 = bitcast %0* %tmp to %struct.S0*
  %1 = load %struct.S0* %0, align 1
  store %struct.S0 %1, %struct.S0* %coerce
  %tmp1 = load i32* getelementptr inbounds ([2 x i32]* @g_4, i32 0, i64 0), align 4
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp1)
  %tmp3 = load i32* getelementptr inbounds ([2 x i32]* @g_4, i32 0, i64 1), align 4
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp3)
  %tmp5 = load i32* getelementptr inbounds ([2 x i32]* @g_4, i32 0, i64 0), align 4
  %call6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %tmp5)
  %tmp7 = volatile load i16* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 0), align 2
  %conv = sext i16 %tmp7 to i32
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %conv)
  %tmp9 = load i16* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 1), align 2
  %conv10 = sext i16 %tmp9 to i32
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %conv10)
  %tmp12 = load i8* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 2), align 1
  %conv13 = sext i8 %tmp12 to i32
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %conv13)
  %tmp15 = load i16* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 3), align 2
  %conv16 = zext i16 %tmp15 to i32
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %conv16)
  %tmp18 = load i16* getelementptr inbounds (%struct.S0* @g_5, i32 0, i32 4), align 2
  %conv19 = sext i16 %tmp18 to i32
  %call20 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %conv19)
  %2 = load i32* %retval
  ret i32 %2
}

declare i32 @printf(i8*, ...)
