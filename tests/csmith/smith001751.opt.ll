; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001751.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_2 = global i32 7, align 4
@g_13 = global [5 x [2 x i32]] [[2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1], [2 x i32] [i32 1, i32 1]], align 16
@g_40 = global [2 x [3 x i32*]] [[3 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*)], [3 x i32*] [i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*), i32* bitcast (i8* getelementptr (i8* bitcast ([5 x [2 x i32]]* @g_13 to i8*), i64 24) to i32*)]], align 16
@g_41 = global i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 4, i64 0), align 8
@.str = private unnamed_addr constant [19 x i8] c"checksum g_2 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [26 x i8] c"checksum g_13[0][0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [26 x i8] c"checksum g_13[0][1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [26 x i8] c"checksum g_13[1][0] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [26 x i8] c"checksum g_13[1][1] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [26 x i8] c"checksum g_13[2][0] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [26 x i8] c"checksum g_13[2][1] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [26 x i8] c"checksum g_13[3][0] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [26 x i8] c"checksum g_13[3][1] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [26 x i8] c"checksum g_13[4][0] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [26 x i8] c"checksum g_13[4][1] = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i64 @func_1() nounwind uwtable {
entry:
  volatile store i32 7, i32* @g_2, align 4
  %tmp = volatile load i32* @g_2, align 4
  %cmp = icmp sgt i32 %tmp, 0
  br i1 %cmp, label %return, label %for.end

for.end:                                          ; preds = %entry
  %tmp7 = volatile load i32* @g_2, align 4
  %call13 = tail call i32 @func_6(i32 1, i64 -1, i32 -1, i8 signext -1)
  %or = or i32 %call13, %tmp7
  %not.tobool = icmp ne i32 %or, 0
  %land.ext = zext i1 %not.tobool to i32
  %tmp16 = volatile load i32** @g_41, align 8
  store i32 %land.ext, i32* %tmp16, align 4
  br label %return

return:                                           ; preds = %entry, %for.end
  %storemerge = phi i64 [ -1, %for.end ], [ -2050559553, %entry ]
  ret i64 %storemerge
}

define i32 @func_6(i32 %p_7, i64 %p_8, i32 %p_9, i8 signext %p_10) nounwind uwtable {
entry:
  %l_21.i.i = alloca [4 x [4 x [2 x [1 x i32*]]]], align 16
  %l_12 = alloca i32*, align 8
  %l_28 = alloca i32**, align 8
  %l_27 = alloca [8 x i32***], align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 3, i64 0), i32** %l_12, align 8
  store i32** %l_12, i32*** %l_28, align 8
  %arrayidx = getelementptr [8 x i32***]* %l_27, i64 0, i64 0
  store i32*** %l_28, i32**** %arrayidx, align 16
  %arrayidx.1 = getelementptr [8 x i32***]* %l_27, i64 0, i64 1
  store i32*** %l_28, i32**** %arrayidx.1, align 8
  %arrayidx.2 = getelementptr [8 x i32***]* %l_27, i64 0, i64 2
  store i32*** %l_28, i32**** %arrayidx.2, align 16
  %arrayidx.3 = getelementptr [8 x i32***]* %l_27, i64 0, i64 3
  store i32*** %l_28, i32**** %arrayidx.3, align 8
  %arrayidx.4 = getelementptr [8 x i32***]* %l_27, i64 0, i64 4
  store i32*** %l_28, i32**** %arrayidx.4, align 16
  %arrayidx.5 = getelementptr [8 x i32***]* %l_27, i64 0, i64 5
  store i32*** %l_28, i32**** %arrayidx.5, align 8
  %arrayidx.6 = getelementptr [8 x i32***]* %l_27, i64 0, i64 6
  store i32*** %l_28, i32**** %arrayidx.6, align 16
  %arrayidx.7 = getelementptr [8 x i32***]* %l_27, i64 0, i64 7
  store i32*** %l_28, i32**** %arrayidx.7, align 8
  store i32 -1, i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 3, i64 0), align 8
  %tmp28 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 0, i64 1), align 4
  %conv29 = trunc i32 %tmp28 to i8
  %add.i = sub i8 0, %conv29
  %not.tobool = icmp ne i8 %add.i, 1
  %0 = zext i1 %not.tobool to i32
  %1 = bitcast [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  %arrayidx26.i.i8 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 0, i64 0, i64 0, i64 0
  %scevgep38.i.i9 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 0, i64 0, i64 1, i64 0
  %scevgep35.i.i10 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 0, i64 1, i64 1, i64 0
  %scevgep33.i.i11 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 0, i64 1, i64 0, i64 0
  %scevgep31.i.i12 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 0, i64 2, i64 1, i64 0
  %scevgep29.i.i13 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 0, i64 2, i64 0, i64 0
  %scevgep27.i.i14 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 0, i64 3, i64 1, i64 0
  %scevgep25.i.i15 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 0, i64 3, i64 0, i64 0
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26.i.i8, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38.i.i9, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33.i.i11, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35.i.i10, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29.i.i13, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31.i.i12, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25.i.i15, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27.i.i14, align 8
  %arrayidx26.i.1.i16 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 1, i64 0, i64 0, i64 0
  %scevgep38.i.1.i17 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 1, i64 0, i64 1, i64 0
  %scevgep35.i.1.i18 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 1, i64 1, i64 1, i64 0
  %scevgep33.i.1.i19 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 1, i64 1, i64 0, i64 0
  %scevgep31.i.1.i20 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 1, i64 2, i64 1, i64 0
  %scevgep29.i.1.i21 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 1, i64 2, i64 0, i64 0
  %scevgep27.i.1.i22 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 1, i64 3, i64 1, i64 0
  %scevgep25.i.1.i23 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 1, i64 3, i64 0, i64 0
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26.i.1.i16, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38.i.1.i17, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33.i.1.i19, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35.i.1.i18, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29.i.1.i21, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31.i.1.i20, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25.i.1.i23, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27.i.1.i22, align 8
  %arrayidx26.i.2.i24 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 2, i64 0, i64 0, i64 0
  %scevgep38.i.2.i25 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 2, i64 0, i64 1, i64 0
  %scevgep35.i.2.i26 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 2, i64 1, i64 1, i64 0
  %scevgep33.i.2.i27 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 2, i64 1, i64 0, i64 0
  %scevgep31.i.2.i28 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 2, i64 2, i64 1, i64 0
  %scevgep29.i.2.i29 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 2, i64 2, i64 0, i64 0
  %scevgep27.i.2.i30 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 2, i64 3, i64 1, i64 0
  %scevgep25.i.2.i31 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 2, i64 3, i64 0, i64 0
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26.i.2.i24, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38.i.2.i25, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33.i.2.i27, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35.i.2.i26, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29.i.2.i29, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31.i.2.i28, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25.i.2.i31, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27.i.2.i30, align 8
  %arrayidx26.i.3.i32 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 3, i64 0, i64 0, i64 0
  %scevgep38.i.3.i33 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 3, i64 0, i64 1, i64 0
  %scevgep35.i.3.i34 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 3, i64 1, i64 1, i64 0
  %scevgep33.i.3.i35 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 3, i64 1, i64 0, i64 0
  %scevgep31.i.3.i36 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 3, i64 2, i64 1, i64 0
  %scevgep29.i.3.i37 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 3, i64 2, i64 0, i64 0
  %scevgep27.i.3.i38 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 3, i64 3, i64 1, i64 0
  %scevgep25.i.3.i39 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i.i, i64 0, i64 3, i64 3, i64 0, i64 0
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26.i.3.i32, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38.i.3.i33, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33.i.3.i35, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35.i.3.i34, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29.i.3.i37, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31.i.3.i36, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25.i.3.i39, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27.i.3.i38, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26.i.i8, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38.i.i9, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33.i.i11, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35.i.i10, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29.i.i13, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31.i.i12, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25.i.i15, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27.i.i14, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26.i.1.i16, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38.i.1.i17, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33.i.1.i19, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35.i.1.i18, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29.i.1.i21, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31.i.1.i20, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25.i.1.i23, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27.i.1.i22, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26.i.2.i24, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38.i.2.i25, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33.i.2.i27, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35.i.2.i26, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29.i.2.i29, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31.i.2.i28, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25.i.2.i31, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27.i.2.i30, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26.i.3.i32, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38.i.3.i33, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33.i.3.i35, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35.i.3.i34, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29.i.3.i37, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31.i.3.i36, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25.i.3.i39, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27.i.3.i38, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  %tmp92 = load i32** %l_12, align 8
  store i32 %0, i32* %tmp92, align 4
  %tmp99 = load i32** %l_12, align 8
  %tmp100 = load i32* %tmp99, align 4
  %or101 = or i32 %tmp100, 1
  store i32 %or101, i32* %tmp99, align 4
  %storemerge3 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 2, i64 0), align 16
  ret i32 %storemerge3
}

define i32 @func_14(i32 %p_15, i8 signext %p_16, i64 %p_17) nounwind uwtable {
entry:
  %l_21.i = alloca [4 x [4 x [2 x [1 x i32*]]]], align 16
  %0 = bitcast [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %arrayidx26.i = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 0, i64 0, i64 0, i64 0
  %scevgep38.i = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 0, i64 0, i64 1, i64 0
  %scevgep35.i = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 0, i64 1, i64 1, i64 0
  %scevgep33.i = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 0, i64 1, i64 0, i64 0
  %scevgep31.i = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 0, i64 2, i64 1, i64 0
  %scevgep29.i = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 0, i64 2, i64 0, i64 0
  %scevgep27.i = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 0, i64 3, i64 1, i64 0
  %scevgep25.i = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 0, i64 3, i64 0, i64 0
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26.i, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38.i, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33.i, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35.i, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29.i, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31.i, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25.i, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27.i, align 8
  %arrayidx26.i.1 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 1, i64 0, i64 0, i64 0
  %scevgep38.i.1 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 1, i64 0, i64 1, i64 0
  %scevgep35.i.1 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 1, i64 1, i64 1, i64 0
  %scevgep33.i.1 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 1, i64 1, i64 0, i64 0
  %scevgep31.i.1 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 1, i64 2, i64 1, i64 0
  %scevgep29.i.1 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 1, i64 2, i64 0, i64 0
  %scevgep27.i.1 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 1, i64 3, i64 1, i64 0
  %scevgep25.i.1 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 1, i64 3, i64 0, i64 0
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26.i.1, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38.i.1, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33.i.1, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35.i.1, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29.i.1, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31.i.1, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25.i.1, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27.i.1, align 8
  %arrayidx26.i.2 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 2, i64 0, i64 0, i64 0
  %scevgep38.i.2 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 2, i64 0, i64 1, i64 0
  %scevgep35.i.2 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 2, i64 1, i64 1, i64 0
  %scevgep33.i.2 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 2, i64 1, i64 0, i64 0
  %scevgep31.i.2 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 2, i64 2, i64 1, i64 0
  %scevgep29.i.2 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 2, i64 2, i64 0, i64 0
  %scevgep27.i.2 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 2, i64 3, i64 1, i64 0
  %scevgep25.i.2 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 2, i64 3, i64 0, i64 0
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26.i.2, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38.i.2, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33.i.2, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35.i.2, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29.i.2, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31.i.2, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25.i.2, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27.i.2, align 8
  %arrayidx26.i.3 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 3, i64 0, i64 0, i64 0
  %scevgep38.i.3 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 3, i64 0, i64 1, i64 0
  %scevgep35.i.3 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 3, i64 1, i64 1, i64 0
  %scevgep33.i.3 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 3, i64 1, i64 0, i64 0
  %scevgep31.i.3 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 3, i64 2, i64 1, i64 0
  %scevgep29.i.3 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 3, i64 2, i64 0, i64 0
  %scevgep27.i.3 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 3, i64 3, i64 1, i64 0
  %scevgep25.i.3 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21.i, i64 0, i64 3, i64 3, i64 0, i64 0
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26.i.3, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38.i.3, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33.i.3, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35.i.3, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29.i.3, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31.i.3, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25.i.3, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27.i.3, align 8
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  ret i32 %p_15
}

define i32** @func_18(i64 %p_19) nounwind uwtable readnone {
entry:
  %l_21 = alloca [4 x [4 x [2 x [1 x i32*]]]], align 16
  br label %for.inc28.1.3

for.end39:                                        ; preds = %for.inc28.1.3
  %arrayidx3 = getelementptr inbounds [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i64 0, i64 0, i64 2, i64 1, i64 0
  ret i32** %arrayidx3

for.inc28.1.3:                                    ; preds = %for.inc28.1.3, %entry
  %indvar8 = phi i64 [ 0, %entry ], [ %indvar.next9, %for.inc28.1.3 ]
  %scevgep25 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i64 0, i64 %indvar8, i64 3, i64 0, i64 0
  %scevgep27 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i64 0, i64 %indvar8, i64 3, i64 1, i64 0
  %scevgep29 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i64 0, i64 %indvar8, i64 2, i64 0, i64 0
  %scevgep31 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i64 0, i64 %indvar8, i64 2, i64 1, i64 0
  %scevgep33 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i64 0, i64 %indvar8, i64 1, i64 0, i64 0
  %scevgep35 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i64 0, i64 %indvar8, i64 1, i64 1, i64 0
  %scevgep38 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i64 0, i64 %indvar8, i64 0, i64 1, i64 0
  %arrayidx26 = getelementptr [4 x [4 x [2 x [1 x i32*]]]]* %l_21, i64 0, i64 %indvar8, i64 0, i64 0, i64 0
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %arrayidx26, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep38, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep33, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep35, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep29, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep31, align 8
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep25, align 16
  store i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), i32** %scevgep27, align 8
  %indvar.next9 = add i64 %indvar8, 1
  %exitcond = icmp eq i64 %indvar.next9, 4
  br i1 %exitcond, label %for.end39, label %for.inc28.1.3
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  volatile store i32 7, i32* @g_2, align 4
  %tmp.i = volatile load i32* @g_2, align 4
  %cmp.i = icmp sgt i32 %tmp.i, 0
  br i1 %cmp.i, label %func_1.exit, label %for.end.i

for.end.i:                                        ; preds = %entry
  %tmp7.i = volatile load i32* @g_2, align 4
  %call13.i = tail call i32 @func_6(i32 1, i64 -1, i32 -1, i8 signext -1) nounwind
  %or.i = or i32 %call13.i, %tmp7.i
  %not.tobool.i = icmp ne i32 %or.i, 0
  %land.ext.i = zext i1 %not.tobool.i to i32
  %tmp16.i = volatile load i32** @g_41, align 8
  store i32 %land.ext.i, i32* %tmp16.i, align 4
  br label %func_1.exit

func_1.exit:                                      ; preds = %entry, %for.end.i
  %tmp = volatile load i32* @g_2, align 4
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %tmp) nounwind
  %tmp2 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 0, i64 0), align 16
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 0, i64 1), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 0), align 8
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str3, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 1, i64 1), align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str4, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 2, i64 0), align 16
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str5, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 2, i64 1), align 4
  %call13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str6, i64 0, i64 0), i32 %tmp12) nounwind
  %tmp14 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 3, i64 0), align 8
  %call15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i64 0, i64 0), i32 %tmp14) nounwind
  %tmp16 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 3, i64 1), align 4
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str8, i64 0, i64 0), i32 %tmp16) nounwind
  %tmp18 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 4, i64 0), align 16
  %call19 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str9, i64 0, i64 0), i32 %tmp18) nounwind
  %tmp20 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 4, i64 1), align 4
  %call21 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str10, i64 0, i64 0), i32 %tmp20) nounwind
  %tmp22 = load i32* getelementptr inbounds ([5 x [2 x i32]]* @g_13, i64 0, i64 3, i64 0), align 8
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str7, i64 0, i64 0), i32 %tmp22) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
