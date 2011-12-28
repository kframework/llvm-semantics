; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/md5.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i32, i1 }
%struct.MD5_CTX = type { [2 x i32], [4 x i32], [64 x i8], [16 x i8] }

@PADDING = internal global [64 x i8] c"\80\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str2 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str3 = private unnamed_addr constant [4 x i8] c"abc\00", align 1
@.str4 = private unnamed_addr constant [15 x i8] c"message digest\00", align 1
@.str5 = private unnamed_addr constant [27 x i8] c"abcdefghijklmnopqrstuvwxyz\00", align 1
@.str6 = private unnamed_addr constant [63 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\00", align 1
@.str7 = private unnamed_addr constant [81 x i8] c"12345678901234567890123456789012345678901234567890123456789012345678901234567890\00", align 1
@.str8 = private unnamed_addr constant [8 x i8] c" \22%s\22\0A\0A\00", align 1
@.str9 = private unnamed_addr constant [3 x i8] c"%x\00", align 1
@str = internal constant [25 x i8] c"MD5 test suite results:\0A\00"

define void @MD5Init(%struct.MD5_CTX* %mdContext) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx, align 4
  %arrayidx3 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx3, align 4
  %arrayidx5 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx5, align 4
  %arrayidx8 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx8, align 4
  %arrayidx11 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx11, align 4
  %arrayidx14 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx14, align 4
  ret void
}

define void @MD5Update(%struct.MD5_CTX* %mdContext, i8* %inBuf, i32 %inLen) nounwind uwtable {
entry:
  %in = alloca [16 x i32], align 16
  %arrayidx = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 0
  %tmp2 = load i32* %arrayidx, align 4
  %shr = lshr i32 %tmp2, 3
  %and = and i32 %shr, 63
  %shl = shl i32 %inLen, 3
  %uadd = call %0 @llvm.uadd.with.overflow.i32(i32 %tmp2, i32 %shl)
  %cmp = extractvalue %0 %uadd, 1
  %arrayidx14 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 1
  %tmp15 = load i32* %arrayidx14, align 4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %inc = add i32 %tmp15, 1
  store i32 %inc, i32* %arrayidx14, align 4
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %tmp28 = phi i32 [ %inc, %if.then ], [ %tmp15, %entry ]
  %add22 = add i32 %tmp2, %shl
  store i32 %add22, i32* %arrayidx, align 4
  %shr24 = lshr i32 %inLen, 29
  %arrayidx27 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 1
  %add29 = add i32 %tmp28, %shr24
  store i32 %add29, i32* %arrayidx27, align 4
  %tobool10 = icmp eq i32 %inLen, 0
  br i1 %tobool10, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %if.end
  %arraydecay = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 0
  %arraydecay86 = getelementptr inbounds [16 x i32]* %in, i64 0, i64 0
  %tmp22 = zext i32 %inLen to i64
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.cond.backedge
  %indvar19 = phi i64 [ 0, %while.body.lr.ph ], [ %indvar.next20, %while.cond.backedge ]
  %0 = phi i32 [ %and, %while.body.lr.ph ], [ %.be, %while.cond.backedge ]
  %incdec.ptr111 = getelementptr i8* %inBuf, i64 %indvar19
  %tmp32 = load i8* %incdec.ptr111, align 1
  %inc34 = add nsw i32 %0, 1
  %idxprom = sext i32 %0 to i64
  %arrayidx37 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %idxprom
  store i8 %tmp32, i8* %arrayidx37, align 1
  %cmp39 = icmp eq i32 %inc34, 64
  br i1 %cmp39, label %for.body, label %while.cond.backedge

for.body:                                         ; preds = %while.body, %for.body
  %indvar = phi i64 [ %indvar.next, %for.body ], [ 0, %while.body ]
  %tmp = shl i64 %indvar, 2
  %arrayidx74 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %tmp
  %tmp1331 = or i64 %tmp, 3
  %arrayidx48 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %tmp1331
  %tmp1432 = or i64 %tmp, 2
  %arrayidx56 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %tmp1432
  %tmp1633 = or i64 %tmp, 1
  %arrayidx65 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %tmp1633
  %arrayidx80 = getelementptr [16 x i32]* %in, i64 0, i64 %indvar
  %tmp49 = load i8* %arrayidx48, align 1
  %conv = zext i8 %tmp49 to i32
  %shl50 = shl nuw i32 %conv, 24
  %tmp57 = load i8* %arrayidx56, align 1
  %conv58 = zext i8 %tmp57 to i32
  %shl59 = shl nuw nsw i32 %conv58, 16
  %tmp66 = load i8* %arrayidx65, align 1
  %conv67 = zext i8 %tmp66 to i32
  %shl68 = shl nuw nsw i32 %conv67, 8
  %tmp75 = load i8* %arrayidx74, align 1
  %conv76 = zext i8 %tmp75 to i32
  %or = or i32 %shl59, %shl50
  %or69 = or i32 %or, %conv76
  %or77 = or i32 %or69, %shl68
  store i32 %or77, i32* %arrayidx80, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 16
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  call void @Transform(i32* %arraydecay, i32* %arraydecay86) nounwind
  br label %while.cond.backedge

while.cond.backedge:                              ; preds = %for.end, %while.body
  %.be = phi i32 [ %inc34, %while.body ], [ 0, %for.end ]
  %indvar.next20 = add i64 %indvar19, 1
  %exitcond23 = icmp eq i64 %indvar.next20, %tmp22
  br i1 %exitcond23, label %while.end, label %while.body

while.end:                                        ; preds = %while.cond.backedge, %if.end
  ret void
}

define void @MD5Final(%struct.MD5_CTX* %mdContext) nounwind uwtable {
entry:
  %in = alloca [16 x i32], align 16
  %arrayidx = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 0
  %tmp2 = load i32* %arrayidx, align 4
  %arrayidx3 = getelementptr inbounds [16 x i32]* %in, i64 0, i64 14
  store i32 %tmp2, i32* %arrayidx3, align 8
  %arrayidx6 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 1
  %tmp7 = load i32* %arrayidx6, align 4
  %arrayidx8 = getelementptr inbounds [16 x i32]* %in, i64 0, i64 15
  store i32 %tmp7, i32* %arrayidx8, align 4
  %shr = lshr i32 %tmp2, 3
  %and = and i32 %shr, 63
  %cmp = icmp ult i32 %and, 56
  %cond.v = select i1 %cmp, i32 56, i32 120
  %cond = sub i32 %cond.v, %and
  call void @MD5Update(%struct.MD5_CTX* %mdContext, i8* getelementptr inbounds ([64 x i8]* @PADDING, i64 0, i64 0), i32 %cond) nounwind
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %for.body ]
  %tmp = shl i64 %indvar, 2
  %arrayidx49 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %tmp
  %tmp1924 = or i64 %tmp, 3
  %arrayidx24 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %tmp1924
  %tmp2025 = or i64 %tmp, 2
  %arrayidx31 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %tmp2025
  %tmp2126 = or i64 %tmp, 1
  %arrayidx40 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %tmp2126
  %arrayidx55 = getelementptr [16 x i32]* %in, i64 0, i64 %indvar
  %tmp25 = load i8* %arrayidx24, align 1
  %conv = zext i8 %tmp25 to i32
  %shl = shl nuw i32 %conv, 24
  %tmp32 = load i8* %arrayidx31, align 1
  %conv33 = zext i8 %tmp32 to i32
  %shl34 = shl nuw nsw i32 %conv33, 16
  %tmp41 = load i8* %arrayidx40, align 1
  %conv42 = zext i8 %tmp41 to i32
  %shl43 = shl nuw nsw i32 %conv42, 8
  %tmp50 = load i8* %arrayidx49, align 1
  %conv51 = zext i8 %tmp50 to i32
  %or = or i32 %shl34, %shl
  %or44 = or i32 %or, %conv51
  %or52 = or i32 %or44, %shl43
  store i32 %or52, i32* %arrayidx55, align 4
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 14
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %arraydecay = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 0
  %arraydecay60 = getelementptr inbounds [16 x i32]* %in, i64 0, i64 0
  call void @Transform(i32* %arraydecay, i32* %arraydecay60) nounwind
  %arrayidx77 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 0
  %arrayidx92 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 1
  %arrayidx107 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 2
  %arrayidx122 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 3
  %tmp71 = load i32* %arraydecay, align 4
  %conv73 = trunc i32 %tmp71 to i8
  store i8 %conv73, i8* %arrayidx77, align 1
  %shr84 = lshr i32 %tmp71, 8
  %conv86 = trunc i32 %shr84 to i8
  store i8 %conv86, i8* %arrayidx92, align 1
  %shr99 = lshr i32 %tmp71, 16
  %conv101 = trunc i32 %shr99 to i8
  store i8 %conv101, i8* %arrayidx107, align 1
  %shr114 = lshr i32 %tmp71, 24
  %conv116 = trunc i32 %shr114 to i8
  store i8 %conv116, i8* %arrayidx122, align 1
  %arrayidx77.1 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 4
  %arrayidx92.1 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 5
  %arrayidx107.1 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 6
  %arrayidx122.1 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 7
  %arrayidx70.1 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 1
  %tmp71.1 = load i32* %arrayidx70.1, align 4
  %conv73.1 = trunc i32 %tmp71.1 to i8
  store i8 %conv73.1, i8* %arrayidx77.1, align 1
  %shr84.1 = lshr i32 %tmp71.1, 8
  %conv86.1 = trunc i32 %shr84.1 to i8
  store i8 %conv86.1, i8* %arrayidx92.1, align 1
  %shr99.1 = lshr i32 %tmp71.1, 16
  %conv101.1 = trunc i32 %shr99.1 to i8
  store i8 %conv101.1, i8* %arrayidx107.1, align 1
  %shr114.1 = lshr i32 %tmp71.1, 24
  %conv116.1 = trunc i32 %shr114.1 to i8
  store i8 %conv116.1, i8* %arrayidx122.1, align 1
  %arrayidx77.2 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 8
  %arrayidx92.2 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 9
  %arrayidx107.2 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 10
  %arrayidx122.2 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 11
  %arrayidx70.2 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 2
  %tmp71.2 = load i32* %arrayidx70.2, align 4
  %conv73.2 = trunc i32 %tmp71.2 to i8
  store i8 %conv73.2, i8* %arrayidx77.2, align 1
  %shr84.2 = lshr i32 %tmp71.2, 8
  %conv86.2 = trunc i32 %shr84.2 to i8
  store i8 %conv86.2, i8* %arrayidx92.2, align 1
  %shr99.2 = lshr i32 %tmp71.2, 16
  %conv101.2 = trunc i32 %shr99.2 to i8
  store i8 %conv101.2, i8* %arrayidx107.2, align 1
  %shr114.2 = lshr i32 %tmp71.2, 24
  %conv116.2 = trunc i32 %shr114.2 to i8
  store i8 %conv116.2, i8* %arrayidx122.2, align 1
  %arrayidx77.3 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 12
  %arrayidx92.3 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 13
  %arrayidx107.3 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 14
  %arrayidx122.3 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 15
  %arrayidx70.3 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 3
  %tmp71.3 = load i32* %arrayidx70.3, align 4
  %conv73.3 = trunc i32 %tmp71.3 to i8
  store i8 %conv73.3, i8* %arrayidx77.3, align 1
  %shr84.3 = lshr i32 %tmp71.3, 8
  %conv86.3 = trunc i32 %shr84.3 to i8
  store i8 %conv86.3, i8* %arrayidx92.3, align 1
  %shr99.3 = lshr i32 %tmp71.3, 16
  %conv101.3 = trunc i32 %shr99.3 to i8
  store i8 %conv101.3, i8* %arrayidx107.3, align 1
  %shr114.3 = lshr i32 %tmp71.3, 24
  %conv116.3 = trunc i32 %shr114.3 to i8
  store i8 %conv116.3, i8* %arrayidx122.3, align 1
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %mdContext.i51.i = alloca %struct.MD5_CTX, align 4
  %mdContext.i41.i = alloca %struct.MD5_CTX, align 4
  %mdContext.i31.i = alloca %struct.MD5_CTX, align 4
  %mdContext.i21.i = alloca %struct.MD5_CTX, align 4
  %mdContext.i11.i = alloca %struct.MD5_CTX, align 4
  %mdContext.i1.i = alloca %struct.MD5_CTX, align 4
  %mdContext.i.i = alloca %struct.MD5_CTX, align 4
  %puts.i = call i32 @puts(i8* getelementptr inbounds ([25 x i8]* @str, i64 0, i64 0)) nounwind
  %0 = bitcast %struct.MD5_CTX* %mdContext.i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %arrayidx.i.i.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i.i, align 4
  %arrayidx3.i.i.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx3.i.i.i, align 4
  %arrayidx5.i.i.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx5.i.i.i, align 4
  %arrayidx8.i.i.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx8.i.i.i, align 4
  %arrayidx11.i.i.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx11.i.i.i, align 4
  %arrayidx14.i.i.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx14.i.i.i, align 4
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i.i, i8* getelementptr inbounds ([1 x i8]* @.str1, i64 0, i64 0), i32 0) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i.i) nounwind
  %call4.i.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %1 = bitcast %struct.MD5_CTX* %mdContext.i1.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  %arrayidx.i.i4.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i1.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i4.i, align 4
  %arrayidx3.i.i5.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i1.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx3.i.i5.i, align 4
  %arrayidx5.i.i6.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i1.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx5.i.i6.i, align 4
  %arrayidx8.i.i7.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i1.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx8.i.i7.i, align 4
  %arrayidx11.i.i8.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i1.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx11.i.i8.i, align 4
  %arrayidx14.i.i9.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i1.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx14.i.i9.i, align 4
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i1.i, i8* getelementptr inbounds ([2 x i8]* @.str2, i64 0, i64 0), i32 1) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i1.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i1.i) nounwind
  %call4.i10.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str2, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  %2 = bitcast %struct.MD5_CTX* %mdContext.i11.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %2) nounwind
  %arrayidx.i.i14.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i11.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i14.i, align 4
  %arrayidx3.i.i15.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i11.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx3.i.i15.i, align 4
  %arrayidx5.i.i16.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i11.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx5.i.i16.i, align 4
  %arrayidx8.i.i17.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i11.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx8.i.i17.i, align 4
  %arrayidx11.i.i18.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i11.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx11.i.i18.i, align 4
  %arrayidx14.i.i19.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i11.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx14.i.i19.i, align 4
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i11.i, i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 3) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i11.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i11.i) nounwind
  %call4.i20.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %2) nounwind
  %3 = bitcast %struct.MD5_CTX* %mdContext.i21.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %3) nounwind
  %arrayidx.i.i24.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i21.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i24.i, align 4
  %arrayidx3.i.i25.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i21.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx3.i.i25.i, align 4
  %arrayidx5.i.i26.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i21.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx5.i.i26.i, align 4
  %arrayidx8.i.i27.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i21.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx8.i.i27.i, align 4
  %arrayidx11.i.i28.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i21.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx11.i.i28.i, align 4
  %arrayidx14.i.i29.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i21.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx14.i.i29.i, align 4
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i21.i, i8* getelementptr inbounds ([15 x i8]* @.str4, i64 0, i64 0), i32 14) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i21.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i21.i) nounwind
  %call4.i30.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8]* @.str4, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %3) nounwind
  %4 = bitcast %struct.MD5_CTX* %mdContext.i31.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %4) nounwind
  %arrayidx.i.i34.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i31.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i34.i, align 4
  %arrayidx3.i.i35.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i31.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx3.i.i35.i, align 4
  %arrayidx5.i.i36.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i31.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx5.i.i36.i, align 4
  %arrayidx8.i.i37.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i31.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx8.i.i37.i, align 4
  %arrayidx11.i.i38.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i31.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx11.i.i38.i, align 4
  %arrayidx14.i.i39.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i31.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx14.i.i39.i, align 4
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i31.i, i8* getelementptr inbounds ([27 x i8]* @.str5, i64 0, i64 0), i32 26) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i31.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i31.i) nounwind
  %call4.i40.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([27 x i8]* @.str5, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %4) nounwind
  %5 = bitcast %struct.MD5_CTX* %mdContext.i41.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %5) nounwind
  %arrayidx.i.i44.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i41.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i44.i, align 4
  %arrayidx3.i.i45.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i41.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx3.i.i45.i, align 4
  %arrayidx5.i.i46.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i41.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx5.i.i46.i, align 4
  %arrayidx8.i.i47.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i41.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx8.i.i47.i, align 4
  %arrayidx11.i.i48.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i41.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx11.i.i48.i, align 4
  %arrayidx14.i.i49.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i41.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx14.i.i49.i, align 4
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i41.i, i8* getelementptr inbounds ([63 x i8]* @.str6, i64 0, i64 0), i32 62) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i41.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i41.i) nounwind
  %call4.i50.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([63 x i8]* @.str6, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %5) nounwind
  %6 = bitcast %struct.MD5_CTX* %mdContext.i51.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %6) nounwind
  %arrayidx.i.i54.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i51.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i54.i, align 4
  %arrayidx3.i.i55.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i51.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx3.i.i55.i, align 4
  %arrayidx5.i.i56.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i51.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx5.i.i56.i, align 4
  %arrayidx8.i.i57.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i51.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx8.i.i57.i, align 4
  %arrayidx11.i.i58.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i51.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx11.i.i58.i, align 4
  %arrayidx14.i.i59.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i51.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx14.i.i59.i, align 4
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i51.i, i8* getelementptr inbounds ([81 x i8]* @.str7, i64 0, i64 0), i32 80) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i51.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i51.i) nounwind
  %call4.i60.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([81 x i8]* @.str7, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %6) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define internal void @MDPrint(%struct.MD5_CTX* %mdContext) nounwind uwtable {
entry:
  %arrayidx = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 0
  %tmp3 = load i8* %arrayidx, align 1
  %conv = zext i8 %tmp3 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv) nounwind
  %arrayidx.1 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 1
  %tmp3.1 = load i8* %arrayidx.1, align 1
  %conv.1 = zext i8 %tmp3.1 to i32
  %call.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.1) nounwind
  %arrayidx.2 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 2
  %tmp3.2 = load i8* %arrayidx.2, align 1
  %conv.2 = zext i8 %tmp3.2 to i32
  %call.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.2) nounwind
  %arrayidx.3 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 3
  %tmp3.3 = load i8* %arrayidx.3, align 1
  %conv.3 = zext i8 %tmp3.3 to i32
  %call.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.3) nounwind
  %arrayidx.4 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 4
  %tmp3.4 = load i8* %arrayidx.4, align 1
  %conv.4 = zext i8 %tmp3.4 to i32
  %call.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.4) nounwind
  %arrayidx.5 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 5
  %tmp3.5 = load i8* %arrayidx.5, align 1
  %conv.5 = zext i8 %tmp3.5 to i32
  %call.5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.5) nounwind
  %arrayidx.6 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 6
  %tmp3.6 = load i8* %arrayidx.6, align 1
  %conv.6 = zext i8 %tmp3.6 to i32
  %call.6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.6) nounwind
  %arrayidx.7 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 7
  %tmp3.7 = load i8* %arrayidx.7, align 1
  %conv.7 = zext i8 %tmp3.7 to i32
  %call.7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.7) nounwind
  %arrayidx.8 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 8
  %tmp3.8 = load i8* %arrayidx.8, align 1
  %conv.8 = zext i8 %tmp3.8 to i32
  %call.8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.8) nounwind
  %arrayidx.9 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 9
  %tmp3.9 = load i8* %arrayidx.9, align 1
  %conv.9 = zext i8 %tmp3.9 to i32
  %call.9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.9) nounwind
  %arrayidx.10 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 10
  %tmp3.10 = load i8* %arrayidx.10, align 1
  %conv.10 = zext i8 %tmp3.10 to i32
  %call.10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.10) nounwind
  %arrayidx.11 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 11
  %tmp3.11 = load i8* %arrayidx.11, align 1
  %conv.11 = zext i8 %tmp3.11 to i32
  %call.11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.11) nounwind
  %arrayidx.12 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 12
  %tmp3.12 = load i8* %arrayidx.12, align 1
  %conv.12 = zext i8 %tmp3.12 to i32
  %call.12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.12) nounwind
  %arrayidx.13 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 13
  %tmp3.13 = load i8* %arrayidx.13, align 1
  %conv.13 = zext i8 %tmp3.13 to i32
  %call.13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.13) nounwind
  %arrayidx.14 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 14
  %tmp3.14 = load i8* %arrayidx.14, align 1
  %conv.14 = zext i8 %tmp3.14 to i32
  %call.14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.14) nounwind
  %arrayidx.15 = getelementptr %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 15
  %tmp3.15 = load i8* %arrayidx.15, align 1
  %conv.15 = zext i8 %tmp3.15 to i32
  %call.15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.15) nounwind
  ret void
}

define internal void @Transform(i32* %buf, i32* %in) nounwind uwtable {
entry:
  %tmp1 = load i32* %buf, align 4
  %arrayidx4 = getelementptr inbounds i32* %buf, i64 1
  %tmp5 = load i32* %arrayidx4, align 4
  %arrayidx8 = getelementptr inbounds i32* %buf, i64 2
  %tmp9 = load i32* %arrayidx8, align 4
  %arrayidx12 = getelementptr inbounds i32* %buf, i64 3
  %tmp13 = load i32* %arrayidx12, align 4
  %and = and i32 %tmp9, %tmp5
  %neg = xor i32 %tmp5, -1
  %and18 = and i32 %tmp13, %neg
  %or = or i32 %and18, %and
  %tmp21 = load i32* %in, align 4
  %add = add i32 %tmp1, -680876936
  %add22 = add i32 %add, %tmp21
  %add24 = add i32 %add22, %or
  %shl = shl i32 %add24, 7
  %shr = lshr i32 %add24, 25
  %or27 = or i32 %shl, %shr
  %add30 = add i32 %or27, %tmp5
  %and33 = and i32 %add30, %tmp5
  %neg35 = xor i32 %add30, -1
  %and37 = and i32 %tmp9, %neg35
  %or38 = or i32 %and33, %and37
  %arrayidx40 = getelementptr inbounds i32* %in, i64 1
  %tmp41 = load i32* %arrayidx40, align 4
  %add42 = add i32 %tmp13, -389564586
  %add43 = add i32 %add42, %tmp41
  %add45 = add i32 %add43, %or38
  %shl47 = shl i32 %add45, 12
  %shr49 = lshr i32 %add45, 20
  %or50 = or i32 %shl47, %shr49
  %add53 = add i32 %or50, %add30
  %and56 = and i32 %add53, %add30
  %neg58 = xor i32 %add53, -1
  %and60 = and i32 %tmp5, %neg58
  %or61 = or i32 %and56, %and60
  %arrayidx63 = getelementptr inbounds i32* %in, i64 2
  %tmp64 = load i32* %arrayidx63, align 4
  %add65 = add i32 %tmp9, 606105819
  %add66 = add i32 %add65, %tmp64
  %add68 = add i32 %add66, %or61
  %shl70 = shl i32 %add68, 17
  %shr72 = lshr i32 %add68, 15
  %or73 = or i32 %shl70, %shr72
  %add76 = add i32 %or73, %add53
  %and79 = and i32 %add76, %add53
  %neg81 = xor i32 %add76, -1
  %and83 = and i32 %add30, %neg81
  %or84 = or i32 %and79, %and83
  %arrayidx86 = getelementptr inbounds i32* %in, i64 3
  %tmp87 = load i32* %arrayidx86, align 4
  %add88 = add i32 %tmp5, -1044525330
  %add89 = add i32 %add88, %tmp87
  %add91 = add i32 %add89, %or84
  %shl93 = shl i32 %add91, 22
  %shr95 = lshr i32 %add91, 10
  %or96 = or i32 %shl93, %shr95
  %add99 = add i32 %or96, %add76
  %and102 = and i32 %add99, %add76
  %neg104 = xor i32 %add99, -1
  %and106 = and i32 %add53, %neg104
  %or107 = or i32 %and102, %and106
  %arrayidx109 = getelementptr inbounds i32* %in, i64 4
  %tmp110 = load i32* %arrayidx109, align 4
  %add111 = add i32 %tmp110, -176418897
  %add112 = add i32 %add111, %add30
  %add114 = add i32 %add112, %or107
  %shl116 = shl i32 %add114, 7
  %shr118 = lshr i32 %add114, 25
  %or119 = or i32 %shl116, %shr118
  %add122 = add i32 %or119, %add99
  %and125 = and i32 %add122, %add99
  %neg127 = xor i32 %add122, -1
  %and129 = and i32 %add76, %neg127
  %or130 = or i32 %and125, %and129
  %arrayidx132 = getelementptr inbounds i32* %in, i64 5
  %tmp133 = load i32* %arrayidx132, align 4
  %add134 = add i32 %tmp133, 1200080426
  %add135 = add i32 %add134, %add53
  %add137 = add i32 %add135, %or130
  %shl139 = shl i32 %add137, 12
  %shr141 = lshr i32 %add137, 20
  %or142 = or i32 %shl139, %shr141
  %add145 = add i32 %or142, %add122
  %and148 = and i32 %add145, %add122
  %neg150 = xor i32 %add145, -1
  %and152 = and i32 %add99, %neg150
  %or153 = or i32 %and148, %and152
  %arrayidx155 = getelementptr inbounds i32* %in, i64 6
  %tmp156 = load i32* %arrayidx155, align 4
  %add157 = add i32 %tmp156, -1473231341
  %add158 = add i32 %add157, %add76
  %add160 = add i32 %add158, %or153
  %shl162 = shl i32 %add160, 17
  %shr164 = lshr i32 %add160, 15
  %or165 = or i32 %shl162, %shr164
  %add168 = add i32 %or165, %add145
  %and171 = and i32 %add168, %add145
  %neg173 = xor i32 %add168, -1
  %and175 = and i32 %add122, %neg173
  %or176 = or i32 %and171, %and175
  %arrayidx178 = getelementptr inbounds i32* %in, i64 7
  %tmp179 = load i32* %arrayidx178, align 4
  %add180 = add i32 %tmp179, -45705983
  %add181 = add i32 %add180, %add99
  %add183 = add i32 %add181, %or176
  %shl185 = shl i32 %add183, 22
  %shr187 = lshr i32 %add183, 10
  %or188 = or i32 %shl185, %shr187
  %add191 = add i32 %or188, %add168
  %and194 = and i32 %add191, %add168
  %neg196 = xor i32 %add191, -1
  %and198 = and i32 %add145, %neg196
  %or199 = or i32 %and194, %and198
  %arrayidx201 = getelementptr inbounds i32* %in, i64 8
  %tmp202 = load i32* %arrayidx201, align 4
  %add203 = add i32 %tmp202, 1770035416
  %add204 = add i32 %add203, %add122
  %add206 = add i32 %add204, %or199
  %shl208 = shl i32 %add206, 7
  %shr210 = lshr i32 %add206, 25
  %or211 = or i32 %shl208, %shr210
  %add214 = add i32 %or211, %add191
  %and217 = and i32 %add214, %add191
  %neg219 = xor i32 %add214, -1
  %and221 = and i32 %add168, %neg219
  %or222 = or i32 %and217, %and221
  %arrayidx224 = getelementptr inbounds i32* %in, i64 9
  %tmp225 = load i32* %arrayidx224, align 4
  %add226 = add i32 %tmp225, -1958414417
  %add227 = add i32 %add226, %add145
  %add229 = add i32 %add227, %or222
  %shl231 = shl i32 %add229, 12
  %shr233 = lshr i32 %add229, 20
  %or234 = or i32 %shl231, %shr233
  %add237 = add i32 %or234, %add214
  %and240 = and i32 %add237, %add214
  %neg242 = xor i32 %add237, -1
  %and244 = and i32 %add191, %neg242
  %or245 = or i32 %and240, %and244
  %arrayidx247 = getelementptr inbounds i32* %in, i64 10
  %tmp248 = load i32* %arrayidx247, align 4
  %add249 = add i32 %tmp248, -42063
  %add250 = add i32 %add249, %add168
  %add252 = add i32 %add250, %or245
  %shl254 = shl i32 %add252, 17
  %shr256 = lshr i32 %add252, 15
  %or257 = or i32 %shl254, %shr256
  %add260 = add i32 %or257, %add237
  %and263 = and i32 %add260, %add237
  %neg265 = xor i32 %add260, -1
  %and267 = and i32 %add214, %neg265
  %or268 = or i32 %and263, %and267
  %arrayidx270 = getelementptr inbounds i32* %in, i64 11
  %tmp271 = load i32* %arrayidx270, align 4
  %add272 = add i32 %tmp271, -1990404162
  %add273 = add i32 %add272, %add191
  %add275 = add i32 %add273, %or268
  %shl277 = shl i32 %add275, 22
  %shr279 = lshr i32 %add275, 10
  %or280 = or i32 %shl277, %shr279
  %add283 = add i32 %or280, %add260
  %and286 = and i32 %add283, %add260
  %neg288 = xor i32 %add283, -1
  %and290 = and i32 %add237, %neg288
  %or291 = or i32 %and286, %and290
  %arrayidx293 = getelementptr inbounds i32* %in, i64 12
  %tmp294 = load i32* %arrayidx293, align 4
  %add295 = add i32 %tmp294, 1804603682
  %add296 = add i32 %add295, %add214
  %add298 = add i32 %add296, %or291
  %shl300 = shl i32 %add298, 7
  %shr302 = lshr i32 %add298, 25
  %or303 = or i32 %shl300, %shr302
  %add306 = add i32 %or303, %add283
  %and309 = and i32 %add306, %add283
  %neg311 = xor i32 %add306, -1
  %and313 = and i32 %add260, %neg311
  %or314 = or i32 %and309, %and313
  %arrayidx316 = getelementptr inbounds i32* %in, i64 13
  %tmp317 = load i32* %arrayidx316, align 4
  %add318 = add i32 %tmp317, -40341101
  %add319 = add i32 %add318, %add237
  %add321 = add i32 %add319, %or314
  %shl323 = shl i32 %add321, 12
  %shr325 = lshr i32 %add321, 20
  %or326 = or i32 %shl323, %shr325
  %add329 = add i32 %or326, %add306
  %and332 = and i32 %add329, %add306
  %neg334 = xor i32 %add329, -1
  %and336 = and i32 %add283, %neg334
  %or337 = or i32 %and332, %and336
  %arrayidx339 = getelementptr inbounds i32* %in, i64 14
  %tmp340 = load i32* %arrayidx339, align 4
  %add341 = add i32 %tmp340, -1502002290
  %add342 = add i32 %add341, %add260
  %add344 = add i32 %add342, %or337
  %shl346 = shl i32 %add344, 17
  %shr348 = lshr i32 %add344, 15
  %or349 = or i32 %shl346, %shr348
  %add352 = add i32 %or349, %add329
  %and355 = and i32 %add352, %add329
  %neg357 = xor i32 %add352, -1
  %and359 = and i32 %add306, %neg357
  %or360 = or i32 %and355, %and359
  %arrayidx362 = getelementptr inbounds i32* %in, i64 15
  %tmp363 = load i32* %arrayidx362, align 4
  %add364 = add i32 %tmp363, 1236535329
  %add365 = add i32 %add364, %add283
  %add367 = add i32 %add365, %or360
  %shl369 = shl i32 %add367, 22
  %shr371 = lshr i32 %add367, 10
  %or372 = or i32 %shl369, %shr371
  %add375 = add i32 %or372, %add352
  %and378 = and i32 %add375, %add329
  %and382 = and i32 %add352, %neg334
  %or383 = or i32 %and378, %and382
  %add387 = add i32 %tmp41, -165796510
  %add388 = add i32 %add387, %add306
  %add390 = add i32 %add388, %or383
  %shl392 = shl i32 %add390, 5
  %shr394 = lshr i32 %add390, 27
  %or395 = or i32 %shl392, %shr394
  %add398 = add i32 %or395, %add375
  %and401 = and i32 %add398, %add352
  %and405 = and i32 %add375, %neg357
  %or406 = or i32 %and401, %and405
  %add410 = add i32 %tmp156, -1069501632
  %add411 = add i32 %add410, %add329
  %add413 = add i32 %add411, %or406
  %shl415 = shl i32 %add413, 9
  %shr417 = lshr i32 %add413, 23
  %or418 = or i32 %shl415, %shr417
  %add421 = add i32 %or418, %add398
  %and424 = and i32 %add421, %add375
  %neg427 = xor i32 %add375, -1
  %and428 = and i32 %add398, %neg427
  %or429 = or i32 %and424, %and428
  %add433 = add i32 %tmp271, 643717713
  %add434 = add i32 %add433, %add352
  %add436 = add i32 %add434, %or429
  %shl438 = shl i32 %add436, 14
  %shr440 = lshr i32 %add436, 18
  %or441 = or i32 %shl438, %shr440
  %add444 = add i32 %or441, %add421
  %and447 = and i32 %add444, %add398
  %neg450 = xor i32 %add398, -1
  %and451 = and i32 %add421, %neg450
  %or452 = or i32 %and447, %and451
  %add456 = add i32 %tmp21, -373897302
  %add457 = add i32 %add456, %add375
  %add459 = add i32 %add457, %or452
  %shl461 = shl i32 %add459, 20
  %shr463 = lshr i32 %add459, 12
  %or464 = or i32 %shl461, %shr463
  %add467 = add i32 %or464, %add444
  %and470 = and i32 %add467, %add421
  %neg473 = xor i32 %add421, -1
  %and474 = and i32 %add444, %neg473
  %or475 = or i32 %and470, %and474
  %add479 = add i32 %tmp133, -701558691
  %add480 = add i32 %add479, %add398
  %add482 = add i32 %add480, %or475
  %shl484 = shl i32 %add482, 5
  %shr486 = lshr i32 %add482, 27
  %or487 = or i32 %shl484, %shr486
  %add490 = add i32 %or487, %add467
  %and493 = and i32 %add490, %add444
  %neg496 = xor i32 %add444, -1
  %and497 = and i32 %add467, %neg496
  %or498 = or i32 %and493, %and497
  %add502 = add i32 %tmp248, 38016083
  %add503 = add i32 %add502, %add421
  %add505 = add i32 %add503, %or498
  %shl507 = shl i32 %add505, 9
  %shr509 = lshr i32 %add505, 23
  %or510 = or i32 %shl507, %shr509
  %add513 = add i32 %or510, %add490
  %and516 = and i32 %add513, %add467
  %neg519 = xor i32 %add467, -1
  %and520 = and i32 %add490, %neg519
  %or521 = or i32 %and516, %and520
  %add525 = add i32 %tmp363, -660478335
  %add526 = add i32 %add525, %add444
  %add528 = add i32 %add526, %or521
  %shl530 = shl i32 %add528, 14
  %shr532 = lshr i32 %add528, 18
  %or533 = or i32 %shl530, %shr532
  %add536 = add i32 %or533, %add513
  %and539 = and i32 %add536, %add490
  %neg542 = xor i32 %add490, -1
  %and543 = and i32 %add513, %neg542
  %or544 = or i32 %and539, %and543
  %add548 = add i32 %tmp110, -405537848
  %add549 = add i32 %add548, %add467
  %add551 = add i32 %add549, %or544
  %shl553 = shl i32 %add551, 20
  %shr555 = lshr i32 %add551, 12
  %or556 = or i32 %shl553, %shr555
  %add559 = add i32 %or556, %add536
  %and562 = and i32 %add559, %add513
  %neg565 = xor i32 %add513, -1
  %and566 = and i32 %add536, %neg565
  %or567 = or i32 %and562, %and566
  %add571 = add i32 %tmp225, 568446438
  %add572 = add i32 %add571, %add490
  %add574 = add i32 %add572, %or567
  %shl576 = shl i32 %add574, 5
  %shr578 = lshr i32 %add574, 27
  %or579 = or i32 %shl576, %shr578
  %add582 = add i32 %or579, %add559
  %and585 = and i32 %add582, %add536
  %neg588 = xor i32 %add536, -1
  %and589 = and i32 %add559, %neg588
  %or590 = or i32 %and585, %and589
  %add594 = add i32 %tmp340, -1019803690
  %add595 = add i32 %add594, %add513
  %add597 = add i32 %add595, %or590
  %shl599 = shl i32 %add597, 9
  %shr601 = lshr i32 %add597, 23
  %or602 = or i32 %shl599, %shr601
  %add605 = add i32 %or602, %add582
  %and608 = and i32 %add605, %add559
  %neg611 = xor i32 %add559, -1
  %and612 = and i32 %add582, %neg611
  %or613 = or i32 %and608, %and612
  %add617 = add i32 %tmp87, -187363961
  %add618 = add i32 %add617, %add536
  %add620 = add i32 %add618, %or613
  %shl622 = shl i32 %add620, 14
  %shr624 = lshr i32 %add620, 18
  %or625 = or i32 %shl622, %shr624
  %add628 = add i32 %or625, %add605
  %and631 = and i32 %add628, %add582
  %neg634 = xor i32 %add582, -1
  %and635 = and i32 %add605, %neg634
  %or636 = or i32 %and631, %and635
  %add640 = add i32 %tmp202, 1163531501
  %add641 = add i32 %add640, %add559
  %add643 = add i32 %add641, %or636
  %shl645 = shl i32 %add643, 20
  %shr647 = lshr i32 %add643, 12
  %or648 = or i32 %shl645, %shr647
  %add651 = add i32 %or648, %add628
  %and654 = and i32 %add651, %add605
  %neg657 = xor i32 %add605, -1
  %and658 = and i32 %add628, %neg657
  %or659 = or i32 %and654, %and658
  %add663 = add i32 %tmp317, -1444681467
  %add664 = add i32 %add663, %add582
  %add666 = add i32 %add664, %or659
  %shl668 = shl i32 %add666, 5
  %shr670 = lshr i32 %add666, 27
  %or671 = or i32 %shl668, %shr670
  %add674 = add i32 %or671, %add651
  %and677 = and i32 %add674, %add628
  %neg680 = xor i32 %add628, -1
  %and681 = and i32 %add651, %neg680
  %or682 = or i32 %and677, %and681
  %add686 = add i32 %tmp64, -51403784
  %add687 = add i32 %add686, %add605
  %add689 = add i32 %add687, %or682
  %shl691 = shl i32 %add689, 9
  %shr693 = lshr i32 %add689, 23
  %or694 = or i32 %shl691, %shr693
  %add697 = add i32 %or694, %add674
  %and700 = and i32 %add697, %add651
  %neg703 = xor i32 %add651, -1
  %and704 = and i32 %add674, %neg703
  %or705 = or i32 %and700, %and704
  %add709 = add i32 %tmp179, 1735328473
  %add710 = add i32 %add709, %add628
  %add712 = add i32 %add710, %or705
  %shl714 = shl i32 %add712, 14
  %shr716 = lshr i32 %add712, 18
  %or717 = or i32 %shl714, %shr716
  %add720 = add i32 %or717, %add697
  %and723 = and i32 %add720, %add674
  %neg726 = xor i32 %add674, -1
  %and727 = and i32 %add697, %neg726
  %or728 = or i32 %and723, %and727
  %add732 = add i32 %tmp294, -1926607734
  %add733 = add i32 %add732, %add651
  %add735 = add i32 %add733, %or728
  %shl737 = shl i32 %add735, 20
  %shr739 = lshr i32 %add735, 12
  %or740 = or i32 %shl737, %shr739
  %add743 = add i32 %or740, %add720
  %xor = xor i32 %add720, %add697
  %xor747 = xor i32 %xor, %add743
  %add751 = add i32 %tmp133, -378558
  %add752 = add i32 %add751, %add674
  %add754 = add i32 %add752, %xor747
  %shl756 = shl i32 %add754, 4
  %shr758 = lshr i32 %add754, 28
  %or759 = or i32 %shl756, %shr758
  %add762 = add i32 %or759, %add743
  %xor765 = xor i32 %add743, %add720
  %xor767 = xor i32 %xor765, %add762
  %add771 = add i32 %tmp202, -2022574463
  %add772 = add i32 %add771, %add697
  %add774 = add i32 %add772, %xor767
  %shl776 = shl i32 %add774, 11
  %shr778 = lshr i32 %add774, 21
  %or779 = or i32 %shl776, %shr778
  %add782 = add i32 %or779, %add762
  %xor785 = xor i32 %add762, %add743
  %xor787 = xor i32 %xor785, %add782
  %add791 = add i32 %tmp271, 1839030562
  %add792 = add i32 %add791, %add720
  %add794 = add i32 %add792, %xor787
  %shl796 = shl i32 %add794, 16
  %shr798 = lshr i32 %add794, 16
  %or799 = or i32 %shl796, %shr798
  %add802 = add i32 %or799, %add782
  %xor805 = xor i32 %add782, %add762
  %xor807 = xor i32 %xor805, %add802
  %add811 = add i32 %tmp340, -35309556
  %add812 = add i32 %add811, %add743
  %add814 = add i32 %add812, %xor807
  %shl816 = shl i32 %add814, 23
  %shr818 = lshr i32 %add814, 9
  %or819 = or i32 %shl816, %shr818
  %add822 = add i32 %or819, %add802
  %xor825 = xor i32 %add802, %add782
  %xor827 = xor i32 %xor825, %add822
  %add831 = add i32 %tmp41, -1530992060
  %add832 = add i32 %add831, %add762
  %add834 = add i32 %add832, %xor827
  %shl836 = shl i32 %add834, 4
  %shr838 = lshr i32 %add834, 28
  %or839 = or i32 %shl836, %shr838
  %add842 = add i32 %or839, %add822
  %xor845 = xor i32 %add822, %add802
  %xor847 = xor i32 %xor845, %add842
  %add851 = add i32 %tmp110, 1272893353
  %add852 = add i32 %add851, %add782
  %add854 = add i32 %add852, %xor847
  %shl856 = shl i32 %add854, 11
  %shr858 = lshr i32 %add854, 21
  %or859 = or i32 %shl856, %shr858
  %add862 = add i32 %or859, %add842
  %xor865 = xor i32 %add842, %add822
  %xor867 = xor i32 %xor865, %add862
  %add871 = add i32 %tmp179, -155497632
  %add872 = add i32 %add871, %add802
  %add874 = add i32 %add872, %xor867
  %shl876 = shl i32 %add874, 16
  %shr878 = lshr i32 %add874, 16
  %or879 = or i32 %shl876, %shr878
  %add882 = add i32 %or879, %add862
  %xor885 = xor i32 %add862, %add842
  %xor887 = xor i32 %xor885, %add882
  %add891 = add i32 %tmp248, -1094730640
  %add892 = add i32 %add891, %add822
  %add894 = add i32 %add892, %xor887
  %shl896 = shl i32 %add894, 23
  %shr898 = lshr i32 %add894, 9
  %or899 = or i32 %shl896, %shr898
  %add902 = add i32 %or899, %add882
  %xor905 = xor i32 %add882, %add862
  %xor907 = xor i32 %xor905, %add902
  %add911 = add i32 %tmp317, 681279174
  %add912 = add i32 %add911, %add842
  %add914 = add i32 %add912, %xor907
  %shl916 = shl i32 %add914, 4
  %shr918 = lshr i32 %add914, 28
  %or919 = or i32 %shl916, %shr918
  %add922 = add i32 %or919, %add902
  %xor925 = xor i32 %add902, %add882
  %xor927 = xor i32 %xor925, %add922
  %add931 = add i32 %tmp21, -358537222
  %add932 = add i32 %add931, %add862
  %add934 = add i32 %add932, %xor927
  %shl936 = shl i32 %add934, 11
  %shr938 = lshr i32 %add934, 21
  %or939 = or i32 %shl936, %shr938
  %add942 = add i32 %or939, %add922
  %xor945 = xor i32 %add922, %add902
  %xor947 = xor i32 %xor945, %add942
  %add951 = add i32 %tmp87, -722521979
  %add952 = add i32 %add951, %add882
  %add954 = add i32 %add952, %xor947
  %shl956 = shl i32 %add954, 16
  %shr958 = lshr i32 %add954, 16
  %or959 = or i32 %shl956, %shr958
  %add962 = add i32 %or959, %add942
  %xor965 = xor i32 %add942, %add922
  %xor967 = xor i32 %xor965, %add962
  %add971 = add i32 %tmp156, 76029189
  %add972 = add i32 %add971, %add902
  %add974 = add i32 %add972, %xor967
  %shl976 = shl i32 %add974, 23
  %shr978 = lshr i32 %add974, 9
  %or979 = or i32 %shl976, %shr978
  %add982 = add i32 %or979, %add962
  %xor985 = xor i32 %add962, %add942
  %xor987 = xor i32 %xor985, %add982
  %add991 = add i32 %tmp225, -640364487
  %add992 = add i32 %add991, %add922
  %add994 = add i32 %add992, %xor987
  %shl996 = shl i32 %add994, 4
  %shr998 = lshr i32 %add994, 28
  %or999 = or i32 %shl996, %shr998
  %add1002 = add i32 %or999, %add982
  %xor1005 = xor i32 %add982, %add962
  %xor1007 = xor i32 %xor1005, %add1002
  %add1011 = add i32 %tmp294, -421815835
  %add1012 = add i32 %add1011, %add942
  %add1014 = add i32 %add1012, %xor1007
  %shl1016 = shl i32 %add1014, 11
  %shr1018 = lshr i32 %add1014, 21
  %or1019 = or i32 %shl1016, %shr1018
  %add1022 = add i32 %or1019, %add1002
  %xor1025 = xor i32 %add1002, %add982
  %xor1027 = xor i32 %xor1025, %add1022
  %add1031 = add i32 %tmp363, 530742520
  %add1032 = add i32 %add1031, %add962
  %add1034 = add i32 %add1032, %xor1027
  %shl1036 = shl i32 %add1034, 16
  %shr1038 = lshr i32 %add1034, 16
  %or1039 = or i32 %shl1036, %shr1038
  %add1042 = add i32 %or1039, %add1022
  %xor1045 = xor i32 %add1022, %add1002
  %xor1047 = xor i32 %xor1045, %add1042
  %add1051 = add i32 %tmp64, -995338651
  %add1052 = add i32 %add1051, %add982
  %add1054 = add i32 %add1052, %xor1047
  %shl1056 = shl i32 %add1054, 23
  %shr1058 = lshr i32 %add1054, 9
  %or1059 = or i32 %shl1056, %shr1058
  %add1062 = add i32 %or1059, %add1042
  %neg1066 = xor i32 %add1022, -1
  %or1067 = or i32 %add1062, %neg1066
  %xor1068 = xor i32 %or1067, %add1042
  %add1072 = add i32 %tmp21, -198630844
  %add1073 = add i32 %add1072, %add1002
  %add1075 = add i32 %add1073, %xor1068
  %shl1077 = shl i32 %add1075, 6
  %shr1079 = lshr i32 %add1075, 26
  %or1080 = or i32 %shl1077, %shr1079
  %add1083 = add i32 %or1080, %add1062
  %neg1087 = xor i32 %add1042, -1
  %or1088 = or i32 %add1083, %neg1087
  %xor1089 = xor i32 %or1088, %add1062
  %add1093 = add i32 %tmp179, 1126891415
  %add1094 = add i32 %add1093, %add1022
  %add1096 = add i32 %add1094, %xor1089
  %shl1098 = shl i32 %add1096, 10
  %shr1100 = lshr i32 %add1096, 22
  %or1101 = or i32 %shl1098, %shr1100
  %add1104 = add i32 %or1101, %add1083
  %neg1108 = xor i32 %add1062, -1
  %or1109 = or i32 %add1104, %neg1108
  %xor1110 = xor i32 %or1109, %add1083
  %add1114 = add i32 %tmp340, -1416354905
  %add1115 = add i32 %add1114, %add1042
  %add1117 = add i32 %add1115, %xor1110
  %shl1119 = shl i32 %add1117, 15
  %shr1121 = lshr i32 %add1117, 17
  %or1122 = or i32 %shl1119, %shr1121
  %add1125 = add i32 %or1122, %add1104
  %neg1129 = xor i32 %add1083, -1
  %or1130 = or i32 %add1125, %neg1129
  %xor1131 = xor i32 %or1130, %add1104
  %add1135 = add i32 %tmp133, -57434055
  %add1136 = add i32 %add1135, %add1062
  %add1138 = add i32 %add1136, %xor1131
  %shl1140 = shl i32 %add1138, 21
  %shr1142 = lshr i32 %add1138, 11
  %or1143 = or i32 %shl1140, %shr1142
  %add1146 = add i32 %or1143, %add1125
  %neg1150 = xor i32 %add1104, -1
  %or1151 = or i32 %add1146, %neg1150
  %xor1152 = xor i32 %or1151, %add1125
  %add1156 = add i32 %tmp294, 1700485571
  %add1157 = add i32 %add1156, %add1083
  %add1159 = add i32 %add1157, %xor1152
  %shl1161 = shl i32 %add1159, 6
  %shr1163 = lshr i32 %add1159, 26
  %or1164 = or i32 %shl1161, %shr1163
  %add1167 = add i32 %or1164, %add1146
  %neg1171 = xor i32 %add1125, -1
  %or1172 = or i32 %add1167, %neg1171
  %xor1173 = xor i32 %or1172, %add1146
  %add1177 = add i32 %tmp87, -1894986606
  %add1178 = add i32 %add1177, %add1104
  %add1180 = add i32 %add1178, %xor1173
  %shl1182 = shl i32 %add1180, 10
  %shr1184 = lshr i32 %add1180, 22
  %or1185 = or i32 %shl1182, %shr1184
  %add1188 = add i32 %or1185, %add1167
  %neg1192 = xor i32 %add1146, -1
  %or1193 = or i32 %add1188, %neg1192
  %xor1194 = xor i32 %or1193, %add1167
  %add1198 = add i32 %tmp248, -1051523
  %add1199 = add i32 %add1198, %add1125
  %add1201 = add i32 %add1199, %xor1194
  %shl1203 = shl i32 %add1201, 15
  %shr1205 = lshr i32 %add1201, 17
  %or1206 = or i32 %shl1203, %shr1205
  %add1209 = add i32 %or1206, %add1188
  %neg1213 = xor i32 %add1167, -1
  %or1214 = or i32 %add1209, %neg1213
  %xor1215 = xor i32 %or1214, %add1188
  %add1219 = add i32 %tmp41, -2054922799
  %add1220 = add i32 %add1219, %add1146
  %add1222 = add i32 %add1220, %xor1215
  %shl1224 = shl i32 %add1222, 21
  %shr1226 = lshr i32 %add1222, 11
  %or1227 = or i32 %shl1224, %shr1226
  %add1230 = add i32 %or1227, %add1209
  %neg1234 = xor i32 %add1188, -1
  %or1235 = or i32 %add1230, %neg1234
  %xor1236 = xor i32 %or1235, %add1209
  %add1240 = add i32 %tmp202, 1873313359
  %add1241 = add i32 %add1240, %add1167
  %add1243 = add i32 %add1241, %xor1236
  %shl1245 = shl i32 %add1243, 6
  %shr1247 = lshr i32 %add1243, 26
  %or1248 = or i32 %shl1245, %shr1247
  %add1251 = add i32 %or1248, %add1230
  %neg1255 = xor i32 %add1209, -1
  %or1256 = or i32 %add1251, %neg1255
  %xor1257 = xor i32 %or1256, %add1230
  %add1261 = add i32 %tmp363, -30611744
  %add1262 = add i32 %add1261, %add1188
  %add1264 = add i32 %add1262, %xor1257
  %shl1266 = shl i32 %add1264, 10
  %shr1268 = lshr i32 %add1264, 22
  %or1269 = or i32 %shl1266, %shr1268
  %add1272 = add i32 %or1269, %add1251
  %neg1276 = xor i32 %add1230, -1
  %or1277 = or i32 %add1272, %neg1276
  %xor1278 = xor i32 %or1277, %add1251
  %add1282 = add i32 %tmp156, -1560198380
  %add1283 = add i32 %add1282, %add1209
  %add1285 = add i32 %add1283, %xor1278
  %shl1287 = shl i32 %add1285, 15
  %shr1289 = lshr i32 %add1285, 17
  %or1290 = or i32 %shl1287, %shr1289
  %add1293 = add i32 %or1290, %add1272
  %neg1297 = xor i32 %add1251, -1
  %or1298 = or i32 %add1293, %neg1297
  %xor1299 = xor i32 %or1298, %add1272
  %add1303 = add i32 %tmp317, 1309151649
  %add1304 = add i32 %add1303, %add1230
  %add1306 = add i32 %add1304, %xor1299
  %shl1308 = shl i32 %add1306, 21
  %shr1310 = lshr i32 %add1306, 11
  %or1311 = or i32 %shl1308, %shr1310
  %add1314 = add i32 %or1311, %add1293
  %neg1318 = xor i32 %add1272, -1
  %or1319 = or i32 %add1314, %neg1318
  %xor1320 = xor i32 %or1319, %add1293
  %add1324 = add i32 %tmp110, -145523070
  %add1325 = add i32 %add1324, %add1251
  %add1327 = add i32 %add1325, %xor1320
  %shl1329 = shl i32 %add1327, 6
  %shr1331 = lshr i32 %add1327, 26
  %or1332 = or i32 %shl1329, %shr1331
  %add1335 = add i32 %or1332, %add1314
  %neg1339 = xor i32 %add1293, -1
  %or1340 = or i32 %add1335, %neg1339
  %xor1341 = xor i32 %or1340, %add1314
  %add1345 = add i32 %tmp271, -1120210379
  %add1346 = add i32 %add1345, %add1272
  %add1348 = add i32 %add1346, %xor1341
  %shl1350 = shl i32 %add1348, 10
  %shr1352 = lshr i32 %add1348, 22
  %or1353 = or i32 %shl1350, %shr1352
  %add1356 = add i32 %or1353, %add1335
  %neg1360 = xor i32 %add1314, -1
  %or1361 = or i32 %add1356, %neg1360
  %xor1362 = xor i32 %or1361, %add1335
  %add1366 = add i32 %tmp64, 718787259
  %add1367 = add i32 %add1366, %add1293
  %add1369 = add i32 %add1367, %xor1362
  %shl1371 = shl i32 %add1369, 15
  %shr1373 = lshr i32 %add1369, 17
  %or1374 = or i32 %shl1371, %shr1373
  %add1377 = add i32 %or1374, %add1356
  %neg1381 = xor i32 %add1335, -1
  %or1382 = or i32 %add1377, %neg1381
  %xor1383 = xor i32 %or1382, %add1356
  %add1387 = add i32 %tmp225, -343485551
  %add1388 = add i32 %add1387, %add1314
  %add1390 = add i32 %add1388, %xor1383
  %shl1392 = shl i32 %add1390, 21
  %shr1394 = lshr i32 %add1390, 11
  %or1395 = or i32 %shl1392, %shr1394
  %add1403 = add i32 %add1335, %tmp1
  store i32 %add1403, i32* %buf, align 4
  %add1398 = add i32 %add1377, %tmp5
  %add1408 = add i32 %add1398, %or1395
  store i32 %add1408, i32* %arrayidx4, align 4
  %add1413 = add i32 %add1377, %tmp9
  store i32 %add1413, i32* %arrayidx8, align 4
  %add1418 = add i32 %add1356, %tmp13
  store i32 %add1418, i32* %arrayidx12, align 4
  ret void
}

declare %0 @llvm.uadd.with.overflow.i32(i32, i32) nounwind readnone

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

declare i32 @puts(i8* nocapture) nounwind
