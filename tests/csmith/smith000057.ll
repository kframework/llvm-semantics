; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000057.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S0 = type { i16, i32, i32, i16, i32, i32, i16, i16, i16, i32 }

@g_2 = global %struct.S0 { i16 2020, i32 0, i32 -2047168541, i16 -2681, i32 -638706537, i32 316620087, i16 23421, i16 5, i16 -5, i32 -842840578 }, align 4
@.str = private unnamed_addr constant [22 x i8] c"checksum g_2.f0 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [22 x i8] c"checksum g_2.f1 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [22 x i8] c"checksum g_2.f2 = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [22 x i8] c"checksum g_2.f3 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [22 x i8] c"checksum g_2.f4 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [22 x i8] c"checksum g_2.f5 = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [22 x i8] c"checksum g_2.f6 = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [22 x i8] c"checksum g_2.f7 = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [22 x i8] c"checksum g_2.f8 = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [22 x i8] c"checksum g_2.f9 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define void @func_1(%struct.S0* sret %agg.result) nounwind uwtable {
entry:
  %tmp = bitcast %struct.S0* %agg.result to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.S0* @g_2 to i8*), i64 36, i32 4, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %tmp = alloca %struct.S0, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  call void @func_1(%struct.S0* sret %tmp)
  %tmp1 = load i16* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 0), align 2
  %conv = zext i16 %tmp1 to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i32 0, i32 0), i32 %conv)
  %tmp2 = volatile load i32* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i32 0, i32 0), i32 %tmp2)
  %tmp4 = load i32* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 2), align 4
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str2, i32 0, i32 0), i32 %tmp4)
  %tmp6 = load i16* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 3), align 2
  %conv7 = sext i16 %tmp6 to i32
  %call8 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str3, i32 0, i32 0), i32 %conv7)
  %tmp9 = load i32* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 4), align 4
  %call10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str4, i32 0, i32 0), i32 %tmp9)
  %tmp11 = load i32* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 5), align 4
  %call12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str5, i32 0, i32 0), i32 %tmp11)
  %tmp13 = volatile load i16* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 6), align 2
  %conv14 = sext i16 %tmp13 to i32
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str6, i32 0, i32 0), i32 %conv14)
  %tmp16 = load i16* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 7), align 2
  %conv17 = sext i16 %tmp16 to i32
  %call18 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str7, i32 0, i32 0), i32 %conv17)
  %tmp19 = volatile load i16* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 8), align 2
  %conv20 = zext i16 %tmp19 to i32
  %call21 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str8, i32 0, i32 0), i32 %conv20)
  %tmp22 = load i32* getelementptr inbounds (%struct.S0* @g_2, i32 0, i32 9), align 4
  %call23 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str9, i32 0, i32 0), i32 %tmp22)
  %0 = load i32* %retval
  ret i32 %0
}

declare i32 @printf(i8*, ...)
