; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001160.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_6 = global i16 0, align 2
@g_11 = global i32 -1, align 4
@g_12 = global [7 x i32*] zeroinitializer, align 16
@g_13 = global [3 x [4 x [5 x i32*]]] zeroinitializer, align 16
@.str = private unnamed_addr constant [19 x i8] c"checksum g_6 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"checksum g_11 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_14.i = alloca i32*, align 8
  %0 = bitcast i32** %l_14.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  store i32 0, i32* @g_11, align 4
  ret i32 0
}

define i32 @func_7(i64 %p_8) nounwind uwtable {
entry:
  %l_14 = alloca i32*, align 8
  %cmp5 = icmp eq i64 %p_8, 0
  %conv7 = zext i1 %cmp5 to i32
  %or = or i32 %conv7, 1423687254
  %tmp9 = load i32* @g_11, align 4
  %and = and i32 %tmp9, %or
  %conv13 = trunc i64 %p_8 to i32
  %cmp14 = icmp eq i32** %l_14, getelementptr inbounds ([3 x [4 x [5 x i32*]]]* @g_13, i64 0, i64 2, i64 3, i64 1)
  %conv16 = zext i1 %cmp14 to i32
  %add.i = add i32 %conv16, %conv13
  %conv17 = and i32 %add.i, 65535
  %or20 = or i32 %conv17, %and
  store i32 %or20, i32* @g_11, align 4
  ret i32 %conv13
}

define i32 @func_17(i16 zeroext %p_18, i8 zeroext %p_19) nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %l_14.i.i = alloca i32*, align 8
  %0 = bitcast i32** %l_14.i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  store i32 0, i32* @g_11, align 4
  %tmp = load i16* @g_6, align 2
  %conv = sext i16 %tmp to i32
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i32* @g_11, align 4
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
