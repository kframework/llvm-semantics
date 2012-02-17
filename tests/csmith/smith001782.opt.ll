; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001782.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_4 = global i8 20, align 1
@g_12 = global [2 x i32] [i32 1335413498, i32 1335413498], align 4
@g_14 = global i32 -1942426574, align 4
@g_19 = global i32 -1932179853, align 4
@g_18 = global i32* @g_19, align 8
@g_17 = constant i32** @g_18, align 8
@g_20 = global i32** @g_18, align 8
@g_28 = global i16 4766, align 2
@.str = private unnamed_addr constant [19 x i8] c"checksum g_4 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_12[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_12[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [20 x i8] c"checksum g_14 = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [20 x i8] c"checksum g_19 = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [20 x i8] c"checksum g_28 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define i32 @func_1() nounwind uwtable {
entry:
  %l_29 = alloca [2 x i32], align 4
  %arrayidx = getelementptr [2 x i32]* %l_29, i64 0, i64 0
  store i32 2133371286, i32* %arrayidx, align 4
  %arrayidx.1 = getelementptr [2 x i32]* %l_29, i64 0, i64 1
  store i32 2133371286, i32* %arrayidx.1, align 4
  %tmp3 = load i8* @g_4, align 1
  %conv = zext i8 %tmp3 to i32
  %not.tobool = icmp ne i8 %tmp3, 0
  %lor.ext = zext i1 %not.tobool to i32
  %shr.i = lshr i32 127, %lor.ext
  %cmp13.i = icmp slt i32 %shr.i, 1
  %lor.ext.op = shl i32 1, %lor.ext
  %0 = trunc i32 %lor.ext.op to i8
  %conv20.i = select i1 %cmp13.i, i8 1, i8 %0
  %or = or i8 %tmp3, 1
  %sub.i12 = sub i8 %conv20.i, %or
  %conv16 = sext i8 %sub.i12 to i32
  %cmp17 = icmp eq i32 %conv, %conv16
  %conv19 = zext i1 %cmp17 to i64
  %cmp.i8 = icmp slt i8 %tmp3, 0
  %cmp3.i = icmp ugt i8 %tmp3, 31
  %or.cond.i9 = or i1 %cmp.i8, %cmp3.i
  %conv6.i = sext i8 %tmp3 to i32
  %shr.i10 = select i1 %or.cond.i9, i32 0, i32 %conv
  %cond.i11 = ashr i32 %conv6.i, %shr.i10
  %conv10.i = zext i32 %cond.i11 to i64
  %sext = shl i64 %conv10.i, 56
  %conv24 = ashr exact i64 %sext, 56
  %sub.i7 = sub i64 %conv19, %conv24
  %cmp26 = icmp eq i64 %sub.i7, 4
  br i1 %cmp26, label %if.else, label %for.body37

for.body37:                                       ; preds = %entry
  %tmp30 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i64 0, i64 1), align 4
  %xor = xor i32 %tmp30, -2093992077
  store i32 %xor, i32* getelementptr inbounds ([2 x i32]* @g_12, i64 0, i64 1), align 4
  %tmp40 = load i32* @g_14, align 4
  %and = and i32 %tmp40, 1772236215
  store i32 %and, i32* @g_14, align 4
  %tmp45 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i64 0, i64 0), align 4
  br label %return

if.else:                                          ; preds = %entry
  %tmp65 = load i32*** @g_20, align 8
  %tmp66 = volatile load i32** %tmp65, align 8
  %tmp67 = volatile load i32* %tmp66, align 4
  %tobool68 = icmp eq i32 %tmp67, 0
  br i1 %tobool68, label %lor.rhs69, label %lor.end107

lor.rhs69:                                        ; preds = %if.else
  %tmp74 = volatile load i32** @g_18, align 8
  %tmp75 = volatile load i32* %tmp74, align 4
  %conv76 = trunc i32 %tmp75 to i16
  %tmp77 = load i32* @g_14, align 4
  %conv78 = trunc i32 %tmp77 to i16
  %mul.i = mul i16 %conv78, %conv76
  %tobool81 = icmp eq i16 %mul.i, 0
  br i1 %tobool81, label %lor.rhs82, label %land.end

lor.rhs82:                                        ; preds = %lor.rhs69
  %tmp84 = volatile load i32* %tmp74, align 4
  br label %land.end

land.end:                                         ; preds = %lor.rhs69, %lor.rhs82
  %tmp93 = volatile load i32* %tmp74, align 4
  %not.cmp98 = icmp eq i32 %tmp93, 1
  br label %lor.end107

lor.end107:                                       ; preds = %if.else, %land.end
  %1 = phi i1 [ true, %if.else ], [ %not.cmp98, %land.end ]
  %lor.ext108 = zext i1 %1 to i16
  %tmp109 = load i16* @g_28, align 2
  %xor111 = xor i16 %tmp109, %lor.ext108
  store i16 %xor111, i16* @g_28, align 2
  volatile store i32* null, i32** %tmp65, align 8
  br label %return

return:                                           ; preds = %lor.end107, %for.body37
  %storemerge5 = phi i32 [ %tmp45, %for.body37 ], [ 2133371286, %lor.end107 ]
  ret i32 %storemerge5
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call i32 @func_1()
  %tmp = load i8* @g_4, align 1
  %conv = zext i8 %tmp to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %tmp2 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i64 0, i64 0), align 4
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %tmp4 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i64 0, i64 1), align 4
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %tmp4) nounwind
  %tmp6 = load i32* getelementptr inbounds ([2 x i32]* @g_12, i64 0, i64 1), align 4
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %tmp6) nounwind
  %tmp8 = load i32* @g_14, align 4
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str3, i64 0, i64 0), i32 %tmp8) nounwind
  %tmp10 = volatile load i32* @g_19, align 4
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str4, i64 0, i64 0), i32 %tmp10) nounwind
  %tmp12 = load i16* @g_28, align 2
  %conv13 = sext i16 %tmp12 to i32
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str5, i64 0, i64 0), i32 %conv13) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
