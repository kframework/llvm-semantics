; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000427.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_10 = global [7 x i32] zeroinitializer, align 16
@g_28 = global i32 -851710698, align 4
@.str = private unnamed_addr constant [23 x i8] c"checksum g_10[0] = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_10[1] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_10[2] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_10[3] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_10[4] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_10[5] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_10[6] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [20 x i8] c"checksum g_28 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_15.i = alloca [1 x [6 x [3 x i16]]], align 16
  %0 = bitcast [1 x [6 x [3 x i16]]]* %l_15.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  call void @llvm.memset.p0i8.i64(i8* %0, i8 -1, i64 36, i32 16, i1 false) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %tmp23 = load i32* @g_28, align 4
  %or = or i32 %tmp23, 65535
  store i32 %or, i32* @g_28, align 4
  ret i32 %or
}

define i32 @func_2(i32 %p_3, i8 signext %p_4, i16 zeroext %p_5, i32 %p_6) nounwind uwtable {
return:
  %l_15 = alloca [1 x [6 x [3 x i16]]], align 16
  %scevgep16 = bitcast [1 x [6 x [3 x i16]]]* %l_15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep16, i8 -1, i64 36, i32 16, i1 false)
  %arrayidx36 = getelementptr inbounds [1 x [6 x [3 x i16]]]* %l_15, i64 0, i64 0, i64 0, i64 2
  %tmp37 = load i16* %arrayidx36, align 4
  %storemerge1 = zext i16 %tmp37 to i32
  ret i32 %storemerge1
}

define i32 @func_21(i16 zeroext %p_22, i64 %p_23) nounwind uwtable readonly {
entry:
  %tmp = load i32* getelementptr inbounds ([7 x i32]* @g_10, i64 0, i64 5), align 4
  ret i32 %tmp
}

define i32* @func_7(i32* nocapture %p_8) nounwind uwtable readnone {
entry:
  ret i32* getelementptr inbounds ([7 x i32]* @g_10, i64 0, i64 5)
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_15.i.i = alloca [1 x [6 x [3 x i16]]], align 16
  %0 = bitcast [1 x [6 x [3 x i16]]]* %l_15.i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  call void @llvm.memset.p0i8.i64(i8* %0, i8 -1, i64 36, i32 16, i1 false) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %tmp23.i = load i32* @g_28, align 4
  %or.i = or i32 %tmp23.i, 65535
  store i32 %or.i, i32* @g_28, align 4
  %tmp = load i32* getelementptr inbounds ([7 x i32]* @g_10, i64 0, i64 0), align 16
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i64 0, i64 1), align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i64 0, i64 2), align 8
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i64 0, i64 3), align 4
  %call7 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i64 0, i64 4), align 16
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i64 0, i64 5), align 4
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i64 0, i64 6), align 8
  %call13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([7 x i32]* @g_10, i64 0, i64 5), align 4
  %call15 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* @g_28, align 4
  %call17 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str7, i64 0, i64 0), i32 %tmp16) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
