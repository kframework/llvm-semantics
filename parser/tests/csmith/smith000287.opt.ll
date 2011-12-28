; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith000287.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = global i32 0, align 4
@g_5 = global i32 -1092827760, align 4
@g_13 = global i16 -5329, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_3 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [19 x i8] c"checksum g_5 = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [20 x i8] c"checksum g_13 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i16 @func_1() nounwind uwtable {
entry:
  %l_95 = alloca [6 x i8], align 1
  %tmp1 = load i32* @g_3, align 4
  %cmp = icmp ult i32 %tmp1, 1464303941
  br i1 %cmp, label %if.then, label %if.end50.loopexit

if.then:                                          ; preds = %entry
  br label %if.end50

if.end50.loopexit:                                ; preds = %entry
  %l_95.sub = getelementptr inbounds [6 x i8]* %l_95, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %l_95.sub, i8 -66, i64 6, i32 1, i1 false)
  br label %if.end50

if.end50:                                         ; preds = %if.end50.loopexit, %if.then
  %storemerge = phi i32 [ -1, %if.end50.loopexit ], [ 1, %if.then ]
  store i32 %storemerge, i32* @g_5, align 4
  %tmp51 = load i16* @g_13, align 2
  ret i16 %tmp51
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_95.i = alloca [6 x i8], align 1
  %0 = getelementptr inbounds [6 x i8]* %l_95.i, i64 0, i64 0
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %tmp1.i = load i32* @g_3, align 4
  %cmp.i = icmp ult i32 %tmp1.i, 1464303941
  br i1 %cmp.i, label %func_1.exit, label %if.end50.loopexit.i

if.end50.loopexit.i:                              ; preds = %entry
  call void @llvm.memset.p0i8.i64(i8* %0, i8 -66, i64 6, i32 1, i1 false) nounwind
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %if.end50.loopexit.i
  %storemerge.i = phi i32 [ -1, %if.end50.loopexit.i ], [ 1, %entry ]
  store i32 %storemerge.i, i32* @g_5, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp1.i) nounwind
  %tmp2 = load i32* @g_5, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i16* @g_13, align 2
  %conv = zext i16 %tmp4 to i32
  %call5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str2, i64 0, i64 0), i32 %conv) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
