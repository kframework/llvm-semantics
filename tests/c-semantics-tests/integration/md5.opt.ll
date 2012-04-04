; ModuleID = '/home/david/src/c-semantics/tests/integration/md5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

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
@str = private unnamed_addr constant [25 x i8] c"MD5 test suite results:\0A\00"

define void @MD5Init(%struct.MD5_CTX* nocapture %mdContext) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx, align 4, !tbaa !0
  %arrayidx2 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx2, align 4, !tbaa !0
  %arrayidx3 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx3, align 4, !tbaa !0
  %arrayidx5 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx5, align 4, !tbaa !0
  %arrayidx7 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx7, align 4, !tbaa !0
  %arrayidx9 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx9, align 4, !tbaa !0
  ret void
}

define void @MD5Update(%struct.MD5_CTX* nocapture %mdContext, i8* nocapture %inBuf, i32 %inLen) nounwind uwtable {
entry:
  %in = alloca [16 x i32], align 16
  %arrayidx = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 0
  %0 = load i32* %arrayidx, align 4, !tbaa !0
  %shr = lshr i32 %0, 3
  %and = and i32 %shr, 63
  %shl = shl i32 %inLen, 3
  %uadd = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %0, i32 %shl)
  %cmp = extractvalue { i32, i1 } %uadd, 1
  %arrayidx7 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 1
  %1 = load i32* %arrayidx7, align 4, !tbaa !0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %inc = add i32 %1, 1
  store i32 %inc, i32* %arrayidx7, align 4, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %2 = phi i32 [ %inc, %if.then ], [ %1, %entry ]
  %add11 = add i32 %0, %shl
  store i32 %add11, i32* %arrayidx, align 4, !tbaa !0
  %shr12 = lshr i32 %inLen, 29
  %arrayidx14 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 1
  %add15 = add i32 %2, %shr12
  store i32 %add15, i32* %arrayidx14, align 4, !tbaa !0
  %tobool57 = icmp eq i32 %inLen, 0
  br i1 %tobool57, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %if.end
  %arraydecay = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 0
  %arraydecay49 = getelementptr inbounds [16 x i32]* %in, i64 0, i64 0
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.cond.backedge
  %dec60.in = phi i32 [ %inLen, %while.body.lr.ph ], [ %dec60, %while.cond.backedge ]
  %inBuf.addr.059 = phi i8* [ %inBuf, %while.body.lr.ph ], [ %incdec.ptr, %while.cond.backedge ]
  %mdi.058 = phi i32 [ %and, %while.body.lr.ph ], [ %mdi.0.be, %while.cond.backedge ]
  %dec60 = add i32 %dec60.in, -1
  %incdec.ptr = getelementptr inbounds i8* %inBuf.addr.059, i64 1
  %3 = load i8* %inBuf.addr.059, align 1, !tbaa !1
  %inc16 = add nsw i32 %mdi.058, 1
  %idxprom = sext i32 %mdi.058 to i64
  %arrayidx18 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %idxprom
  store i8 %3, i8* %arrayidx18, align 1, !tbaa !1
  %cmp19 = icmp eq i32 %inc16, 64
  br i1 %cmp19, label %for.body, label %while.cond.backedge

for.body:                                         ; preds = %while.body, %for.body
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.body ], [ 0, %while.body ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %while.body ]
  %4 = or i64 %indvars.iv, 3
  %arrayidx25 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %4
  %5 = load i8* %arrayidx25, align 1, !tbaa !1
  %conv = zext i8 %5 to i32
  %shl26 = shl nuw i32 %conv, 24
  %6 = or i64 %indvars.iv, 2
  %arrayidx30 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %6
  %7 = load i8* %arrayidx30, align 1, !tbaa !1
  %conv31 = zext i8 %7 to i32
  %shl32 = shl nuw nsw i32 %conv31, 16
  %8 = or i64 %indvars.iv, 1
  %arrayidx36 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %8
  %9 = load i8* %arrayidx36, align 1, !tbaa !1
  %conv37 = zext i8 %9 to i32
  %shl38 = shl nuw nsw i32 %conv37, 8
  %arrayidx42 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %indvars.iv
  %10 = load i8* %arrayidx42, align 1, !tbaa !1
  %conv43 = zext i8 %10 to i32
  %or = or i32 %shl32, %shl26
  %or39 = or i32 %or, %conv43
  %or44 = or i32 %or39, %shl38
  %arrayidx46 = getelementptr inbounds [16 x i32]* %in, i64 0, i64 %indvars.iv64
  store i32 %or44, i32* %arrayidx46, align 4, !tbaa !0
  %indvars.iv.next65 = add i64 %indvars.iv64, 1
  %indvars.iv.next = add i64 %indvars.iv, 4
  %lftr.wideiv = trunc i64 %indvars.iv.next65 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 16
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  call void @Transform(i32* %arraydecay, i32* %arraydecay49) nounwind
  br label %while.cond.backedge

while.cond.backedge:                              ; preds = %for.end, %while.body
  %mdi.0.be = phi i32 [ 0, %for.end ], [ %inc16, %while.body ]
  %tobool = icmp eq i32 %dec60, 0
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %while.cond.backedge, %if.end
  ret void
}

define void @MD5Final(%struct.MD5_CTX* nocapture %mdContext) nounwind uwtable {
entry:
  %in = alloca [16 x i32], align 16
  %arrayidx = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 0
  %0 = load i32* %arrayidx, align 4, !tbaa !0
  %arrayidx2 = getelementptr inbounds [16 x i32]* %in, i64 0, i64 14
  store i32 %0, i32* %arrayidx2, align 8, !tbaa !0
  %arrayidx4 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 0, i64 1
  %1 = load i32* %arrayidx4, align 4, !tbaa !0
  %arrayidx5 = getelementptr inbounds [16 x i32]* %in, i64 0, i64 15
  store i32 %1, i32* %arrayidx5, align 4, !tbaa !0
  %shr = lshr i32 %0, 3
  %and = and i32 %shr, 63
  %cmp = icmp ult i32 %and, 56
  %cond.v = select i1 %cmp, i32 56, i32 120
  %cond = sub i32 %cond.v, %and
  call void @MD5Update(%struct.MD5_CTX* %mdContext, i8* getelementptr inbounds ([64 x i8]* @PADDING, i64 0, i64 0), i32 %cond) nounwind
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv97 = phi i64 [ 0, %entry ], [ %indvars.iv.next98, %for.body ]
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %2 = or i64 %indvars.iv, 3
  %arrayidx11 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %2
  %3 = load i8* %arrayidx11, align 1, !tbaa !1
  %conv = zext i8 %3 to i32
  %shl = shl nuw i32 %conv, 24
  %4 = or i64 %indvars.iv, 2
  %arrayidx15 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %4
  %5 = load i8* %arrayidx15, align 1, !tbaa !1
  %conv16 = zext i8 %5 to i32
  %shl17 = shl nuw nsw i32 %conv16, 16
  %6 = or i64 %indvars.iv, 1
  %arrayidx21 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %6
  %7 = load i8* %arrayidx21, align 1, !tbaa !1
  %conv22 = zext i8 %7 to i32
  %shl23 = shl nuw nsw i32 %conv22, 8
  %arrayidx27 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 2, i64 %indvars.iv
  %8 = load i8* %arrayidx27, align 1, !tbaa !1
  %conv28 = zext i8 %8 to i32
  %or = or i32 %shl17, %shl
  %or24 = or i32 %or, %conv28
  %or29 = or i32 %or24, %shl23
  %arrayidx31 = getelementptr inbounds [16 x i32]* %in, i64 0, i64 %indvars.iv97
  store i32 %or29, i32* %arrayidx31, align 4, !tbaa !0
  %indvars.iv.next98 = add i64 %indvars.iv97, 1
  %indvars.iv.next = add i64 %indvars.iv, 4
  %lftr.wideiv = trunc i64 %indvars.iv.next98 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 14
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %arraydecay = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 0
  %arraydecay33 = getelementptr inbounds [16 x i32]* %in, i64 0, i64 0
  call void @Transform(i32* %arraydecay, i32* %arraydecay33) nounwind
  %9 = load i32* %arraydecay, align 4, !tbaa !0
  %conv42 = trunc i32 %9 to i8
  %arrayidx44 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 0
  store i8 %conv42, i8* %arrayidx44, align 1, !tbaa !1
  %shr48 = lshr i32 %9, 8
  %conv50 = trunc i32 %shr48 to i8
  %arrayidx54 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 1
  store i8 %conv50, i8* %arrayidx54, align 1, !tbaa !1
  %shr58 = lshr i32 %9, 16
  %conv60 = trunc i32 %shr58 to i8
  %arrayidx64 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 2
  store i8 %conv60, i8* %arrayidx64, align 1, !tbaa !1
  %shr68 = lshr i32 %9, 24
  %conv70 = trunc i32 %shr68 to i8
  %arrayidx74 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 3
  store i8 %conv70, i8* %arrayidx74, align 1, !tbaa !1
  %arrayidx40.1 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 1
  %10 = load i32* %arrayidx40.1, align 4, !tbaa !0
  %conv42.1 = trunc i32 %10 to i8
  %arrayidx44.1 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 4
  store i8 %conv42.1, i8* %arrayidx44.1, align 1, !tbaa !1
  %shr48.1 = lshr i32 %10, 8
  %conv50.1 = trunc i32 %shr48.1 to i8
  %arrayidx54.1 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 5
  store i8 %conv50.1, i8* %arrayidx54.1, align 1, !tbaa !1
  %shr58.1 = lshr i32 %10, 16
  %conv60.1 = trunc i32 %shr58.1 to i8
  %arrayidx64.1 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 6
  store i8 %conv60.1, i8* %arrayidx64.1, align 1, !tbaa !1
  %shr68.1 = lshr i32 %10, 24
  %conv70.1 = trunc i32 %shr68.1 to i8
  %arrayidx74.1 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 7
  store i8 %conv70.1, i8* %arrayidx74.1, align 1, !tbaa !1
  %arrayidx40.2 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 2
  %11 = load i32* %arrayidx40.2, align 4, !tbaa !0
  %conv42.2 = trunc i32 %11 to i8
  %arrayidx44.2 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 8
  store i8 %conv42.2, i8* %arrayidx44.2, align 1, !tbaa !1
  %shr48.2 = lshr i32 %11, 8
  %conv50.2 = trunc i32 %shr48.2 to i8
  %arrayidx54.2 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 9
  store i8 %conv50.2, i8* %arrayidx54.2, align 1, !tbaa !1
  %shr58.2 = lshr i32 %11, 16
  %conv60.2 = trunc i32 %shr58.2 to i8
  %arrayidx64.2 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 10
  store i8 %conv60.2, i8* %arrayidx64.2, align 1, !tbaa !1
  %shr68.2 = lshr i32 %11, 24
  %conv70.2 = trunc i32 %shr68.2 to i8
  %arrayidx74.2 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 11
  store i8 %conv70.2, i8* %arrayidx74.2, align 1, !tbaa !1
  %arrayidx40.3 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 1, i64 3
  %12 = load i32* %arrayidx40.3, align 4, !tbaa !0
  %conv42.3 = trunc i32 %12 to i8
  %arrayidx44.3 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 12
  store i8 %conv42.3, i8* %arrayidx44.3, align 1, !tbaa !1
  %shr48.3 = lshr i32 %12, 8
  %conv50.3 = trunc i32 %shr48.3 to i8
  %arrayidx54.3 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 13
  store i8 %conv50.3, i8* %arrayidx54.3, align 1, !tbaa !1
  %shr58.3 = lshr i32 %12, 16
  %conv60.3 = trunc i32 %shr58.3 to i8
  %arrayidx64.3 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 14
  store i8 %conv60.3, i8* %arrayidx64.3, align 1, !tbaa !1
  %shr68.3 = lshr i32 %12, 24
  %conv70.3 = trunc i32 %shr68.3 to i8
  %arrayidx74.3 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 15
  store i8 %conv70.3, i8* %arrayidx74.3, align 1, !tbaa !1
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
  %arrayidx2.i.i.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i.i, i64 0, i32 0, i64 0
  %arrayidx3.i.i.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx3.i.i.i, align 4, !tbaa !0
  %arrayidx5.i.i.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx5.i.i.i, align 4, !tbaa !0
  %arrayidx7.i.i.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx7.i.i.i, align 4, !tbaa !0
  %arrayidx9.i.i.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx9.i.i.i, align 4, !tbaa !0
  store i32 0, i32* %arrayidx2.i.i.i, align 4, !tbaa !0
  store i32 0, i32* %arrayidx.i.i.i, align 4, !tbaa !0
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i.i) nounwind
  %call1.i.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str1, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %1 = bitcast %struct.MD5_CTX* %mdContext.i1.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  %arrayidx.i.i4.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i1.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i4.i, align 4, !tbaa !0
  %arrayidx2.i.i5.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i1.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx2.i.i5.i, align 4, !tbaa !0
  %arrayidx3.i.i6.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i1.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx3.i.i6.i, align 4, !tbaa !0
  %arrayidx5.i.i7.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i1.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx5.i.i7.i, align 4, !tbaa !0
  %arrayidx7.i.i8.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i1.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx7.i.i8.i, align 4, !tbaa !0
  %arrayidx9.i.i9.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i1.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx9.i.i9.i, align 4, !tbaa !0
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i1.i, i8* getelementptr inbounds ([2 x i8]* @.str2, i64 0, i64 0), i32 1) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i1.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i1.i) nounwind
  %call1.i10.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8]* @.str2, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  %2 = bitcast %struct.MD5_CTX* %mdContext.i11.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %2) nounwind
  %arrayidx.i.i14.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i11.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i14.i, align 4, !tbaa !0
  %arrayidx2.i.i15.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i11.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx2.i.i15.i, align 4, !tbaa !0
  %arrayidx3.i.i16.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i11.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx3.i.i16.i, align 4, !tbaa !0
  %arrayidx5.i.i17.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i11.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx5.i.i17.i, align 4, !tbaa !0
  %arrayidx7.i.i18.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i11.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx7.i.i18.i, align 4, !tbaa !0
  %arrayidx9.i.i19.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i11.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx9.i.i19.i, align 4, !tbaa !0
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i11.i, i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0), i32 3) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i11.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i11.i) nounwind
  %call1.i20.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str3, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %2) nounwind
  %3 = bitcast %struct.MD5_CTX* %mdContext.i21.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %3) nounwind
  %arrayidx.i.i24.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i21.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i24.i, align 4, !tbaa !0
  %arrayidx2.i.i25.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i21.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx2.i.i25.i, align 4, !tbaa !0
  %arrayidx3.i.i26.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i21.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx3.i.i26.i, align 4, !tbaa !0
  %arrayidx5.i.i27.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i21.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx5.i.i27.i, align 4, !tbaa !0
  %arrayidx7.i.i28.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i21.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx7.i.i28.i, align 4, !tbaa !0
  %arrayidx9.i.i29.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i21.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx9.i.i29.i, align 4, !tbaa !0
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i21.i, i8* getelementptr inbounds ([15 x i8]* @.str4, i64 0, i64 0), i32 14) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i21.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i21.i) nounwind
  %call1.i30.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([15 x i8]* @.str4, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %3) nounwind
  %4 = bitcast %struct.MD5_CTX* %mdContext.i31.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %4) nounwind
  %arrayidx.i.i34.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i31.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i34.i, align 4, !tbaa !0
  %arrayidx2.i.i35.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i31.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx2.i.i35.i, align 4, !tbaa !0
  %arrayidx3.i.i36.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i31.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx3.i.i36.i, align 4, !tbaa !0
  %arrayidx5.i.i37.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i31.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx5.i.i37.i, align 4, !tbaa !0
  %arrayidx7.i.i38.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i31.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx7.i.i38.i, align 4, !tbaa !0
  %arrayidx9.i.i39.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i31.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx9.i.i39.i, align 4, !tbaa !0
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i31.i, i8* getelementptr inbounds ([27 x i8]* @.str5, i64 0, i64 0), i32 26) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i31.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i31.i) nounwind
  %call1.i40.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([27 x i8]* @.str5, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %4) nounwind
  %5 = bitcast %struct.MD5_CTX* %mdContext.i41.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %5) nounwind
  %arrayidx.i.i44.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i41.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i44.i, align 4, !tbaa !0
  %arrayidx2.i.i45.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i41.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx2.i.i45.i, align 4, !tbaa !0
  %arrayidx3.i.i46.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i41.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx3.i.i46.i, align 4, !tbaa !0
  %arrayidx5.i.i47.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i41.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx5.i.i47.i, align 4, !tbaa !0
  %arrayidx7.i.i48.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i41.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx7.i.i48.i, align 4, !tbaa !0
  %arrayidx9.i.i49.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i41.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx9.i.i49.i, align 4, !tbaa !0
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i41.i, i8* getelementptr inbounds ([63 x i8]* @.str6, i64 0, i64 0), i32 62) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i41.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i41.i) nounwind
  %call1.i50.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([63 x i8]* @.str6, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %5) nounwind
  %6 = bitcast %struct.MD5_CTX* %mdContext.i51.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %6) nounwind
  %arrayidx.i.i54.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i51.i, i64 0, i32 0, i64 1
  store i32 0, i32* %arrayidx.i.i54.i, align 4, !tbaa !0
  %arrayidx2.i.i55.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i51.i, i64 0, i32 0, i64 0
  store i32 0, i32* %arrayidx2.i.i55.i, align 4, !tbaa !0
  %arrayidx3.i.i56.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i51.i, i64 0, i32 1, i64 0
  store i32 1732584193, i32* %arrayidx3.i.i56.i, align 4, !tbaa !0
  %arrayidx5.i.i57.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i51.i, i64 0, i32 1, i64 1
  store i32 -271733879, i32* %arrayidx5.i.i57.i, align 4, !tbaa !0
  %arrayidx7.i.i58.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i51.i, i64 0, i32 1, i64 2
  store i32 -1732584194, i32* %arrayidx7.i.i58.i, align 4, !tbaa !0
  %arrayidx9.i.i59.i = getelementptr inbounds %struct.MD5_CTX* %mdContext.i51.i, i64 0, i32 1, i64 3
  store i32 271733878, i32* %arrayidx9.i.i59.i, align 4, !tbaa !0
  call void @MD5Update(%struct.MD5_CTX* %mdContext.i51.i, i8* getelementptr inbounds ([81 x i8]* @.str7, i64 0, i64 0), i32 80) nounwind
  call void @MD5Final(%struct.MD5_CTX* %mdContext.i51.i) nounwind
  call void @MDPrint(%struct.MD5_CTX* %mdContext.i51.i) nounwind
  %call1.i60.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str8, i64 0, i64 0), i8* getelementptr inbounds ([81 x i8]* @.str7, i64 0, i64 0)) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %6) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define internal void @MDPrint(%struct.MD5_CTX* nocapture %mdContext) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 0
  %0 = load i8* %arrayidx, align 1, !tbaa !1
  %conv = zext i8 %0 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv) nounwind
  %arrayidx.1 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 1
  %1 = load i8* %arrayidx.1, align 1, !tbaa !1
  %conv.1 = zext i8 %1 to i32
  %call.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.1) nounwind
  %arrayidx.2 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 2
  %2 = load i8* %arrayidx.2, align 1, !tbaa !1
  %conv.2 = zext i8 %2 to i32
  %call.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.2) nounwind
  %arrayidx.3 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 3
  %3 = load i8* %arrayidx.3, align 1, !tbaa !1
  %conv.3 = zext i8 %3 to i32
  %call.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.3) nounwind
  %arrayidx.4 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 4
  %4 = load i8* %arrayidx.4, align 1, !tbaa !1
  %conv.4 = zext i8 %4 to i32
  %call.4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.4) nounwind
  %arrayidx.5 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 5
  %5 = load i8* %arrayidx.5, align 1, !tbaa !1
  %conv.5 = zext i8 %5 to i32
  %call.5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.5) nounwind
  %arrayidx.6 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 6
  %6 = load i8* %arrayidx.6, align 1, !tbaa !1
  %conv.6 = zext i8 %6 to i32
  %call.6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.6) nounwind
  %arrayidx.7 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 7
  %7 = load i8* %arrayidx.7, align 1, !tbaa !1
  %conv.7 = zext i8 %7 to i32
  %call.7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.7) nounwind
  %arrayidx.8 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 8
  %8 = load i8* %arrayidx.8, align 1, !tbaa !1
  %conv.8 = zext i8 %8 to i32
  %call.8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.8) nounwind
  %arrayidx.9 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 9
  %9 = load i8* %arrayidx.9, align 1, !tbaa !1
  %conv.9 = zext i8 %9 to i32
  %call.9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.9) nounwind
  %arrayidx.10 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 10
  %10 = load i8* %arrayidx.10, align 1, !tbaa !1
  %conv.10 = zext i8 %10 to i32
  %call.10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.10) nounwind
  %arrayidx.11 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 11
  %11 = load i8* %arrayidx.11, align 1, !tbaa !1
  %conv.11 = zext i8 %11 to i32
  %call.11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.11) nounwind
  %arrayidx.12 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 12
  %12 = load i8* %arrayidx.12, align 1, !tbaa !1
  %conv.12 = zext i8 %12 to i32
  %call.12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.12) nounwind
  %arrayidx.13 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 13
  %13 = load i8* %arrayidx.13, align 1, !tbaa !1
  %conv.13 = zext i8 %13 to i32
  %call.13 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.13) nounwind
  %arrayidx.14 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 14
  %14 = load i8* %arrayidx.14, align 1, !tbaa !1
  %conv.14 = zext i8 %14 to i32
  %call.14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.14) nounwind
  %arrayidx.15 = getelementptr inbounds %struct.MD5_CTX* %mdContext, i64 0, i32 3, i64 15
  %15 = load i8* %arrayidx.15, align 1, !tbaa !1
  %conv.15 = zext i8 %15 to i32
  %call.15 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str9, i64 0, i64 0), i32 %conv.15) nounwind
  ret void
}

define internal void @Transform(i32* nocapture %buf, i32* nocapture %in) nounwind uwtable {
entry:
  %0 = load i32* %buf, align 4, !tbaa !0
  %arrayidx1 = getelementptr inbounds i32* %buf, i64 1
  %1 = load i32* %arrayidx1, align 4, !tbaa !0
  %arrayidx2 = getelementptr inbounds i32* %buf, i64 2
  %2 = load i32* %arrayidx2, align 4, !tbaa !0
  %arrayidx3 = getelementptr inbounds i32* %buf, i64 3
  %3 = load i32* %arrayidx3, align 4, !tbaa !0
  %and = and i32 %2, %1
  %neg = xor i32 %1, -1
  %and4 = and i32 %3, %neg
  %or = or i32 %and4, %and
  %4 = load i32* %in, align 4, !tbaa !0
  %add = add i32 %0, -680876936
  %add6 = add i32 %add, %4
  %add7 = add i32 %add6, %or
  %shl = shl i32 %add7, 7
  %shr = lshr i32 %add7, 25
  %or8 = or i32 %shl, %shr
  %add9 = add i32 %or8, %1
  %and10 = and i32 %add9, %1
  %neg11 = xor i32 %add9, -1
  %and12 = and i32 %2, %neg11
  %or13 = or i32 %and10, %and12
  %arrayidx14 = getelementptr inbounds i32* %in, i64 1
  %5 = load i32* %arrayidx14, align 4, !tbaa !0
  %add15 = add i32 %3, -389564586
  %add16 = add i32 %add15, %5
  %add17 = add i32 %add16, %or13
  %shl18 = shl i32 %add17, 12
  %shr19 = lshr i32 %add17, 20
  %or20 = or i32 %shl18, %shr19
  %add21 = add i32 %or20, %add9
  %and22 = and i32 %add21, %add9
  %neg23 = xor i32 %add21, -1
  %and24 = and i32 %1, %neg23
  %or25 = or i32 %and22, %and24
  %arrayidx26 = getelementptr inbounds i32* %in, i64 2
  %6 = load i32* %arrayidx26, align 4, !tbaa !0
  %add27 = add i32 %2, 606105819
  %add28 = add i32 %add27, %6
  %add29 = add i32 %add28, %or25
  %shl30 = shl i32 %add29, 17
  %shr31 = lshr i32 %add29, 15
  %or32 = or i32 %shl30, %shr31
  %add33 = add i32 %or32, %add21
  %and34 = and i32 %add33, %add21
  %neg35 = xor i32 %add33, -1
  %and36 = and i32 %add9, %neg35
  %or37 = or i32 %and34, %and36
  %arrayidx38 = getelementptr inbounds i32* %in, i64 3
  %7 = load i32* %arrayidx38, align 4, !tbaa !0
  %add39 = add i32 %1, -1044525330
  %add40 = add i32 %add39, %7
  %add41 = add i32 %add40, %or37
  %shl42 = shl i32 %add41, 22
  %shr43 = lshr i32 %add41, 10
  %or44 = or i32 %shl42, %shr43
  %add45 = add i32 %or44, %add33
  %and46 = and i32 %add45, %add33
  %neg47 = xor i32 %add45, -1
  %and48 = and i32 %add21, %neg47
  %or49 = or i32 %and46, %and48
  %arrayidx50 = getelementptr inbounds i32* %in, i64 4
  %8 = load i32* %arrayidx50, align 4, !tbaa !0
  %add51 = add i32 %8, -176418897
  %add52 = add i32 %add51, %add9
  %add53 = add i32 %add52, %or49
  %shl54 = shl i32 %add53, 7
  %shr55 = lshr i32 %add53, 25
  %or56 = or i32 %shl54, %shr55
  %add57 = add i32 %or56, %add45
  %and58 = and i32 %add57, %add45
  %neg59 = xor i32 %add57, -1
  %and60 = and i32 %add33, %neg59
  %or61 = or i32 %and58, %and60
  %arrayidx62 = getelementptr inbounds i32* %in, i64 5
  %9 = load i32* %arrayidx62, align 4, !tbaa !0
  %add63 = add i32 %9, 1200080426
  %add64 = add i32 %add63, %add21
  %add65 = add i32 %add64, %or61
  %shl66 = shl i32 %add65, 12
  %shr67 = lshr i32 %add65, 20
  %or68 = or i32 %shl66, %shr67
  %add69 = add i32 %or68, %add57
  %and70 = and i32 %add69, %add57
  %neg71 = xor i32 %add69, -1
  %and72 = and i32 %add45, %neg71
  %or73 = or i32 %and70, %and72
  %arrayidx74 = getelementptr inbounds i32* %in, i64 6
  %10 = load i32* %arrayidx74, align 4, !tbaa !0
  %add75 = add i32 %10, -1473231341
  %add76 = add i32 %add75, %add33
  %add77 = add i32 %add76, %or73
  %shl78 = shl i32 %add77, 17
  %shr79 = lshr i32 %add77, 15
  %or80 = or i32 %shl78, %shr79
  %add81 = add i32 %or80, %add69
  %and82 = and i32 %add81, %add69
  %neg83 = xor i32 %add81, -1
  %and84 = and i32 %add57, %neg83
  %or85 = or i32 %and82, %and84
  %arrayidx86 = getelementptr inbounds i32* %in, i64 7
  %11 = load i32* %arrayidx86, align 4, !tbaa !0
  %add87 = add i32 %11, -45705983
  %add88 = add i32 %add87, %add45
  %add89 = add i32 %add88, %or85
  %shl90 = shl i32 %add89, 22
  %shr91 = lshr i32 %add89, 10
  %or92 = or i32 %shl90, %shr91
  %add93 = add i32 %or92, %add81
  %and94 = and i32 %add93, %add81
  %neg95 = xor i32 %add93, -1
  %and96 = and i32 %add69, %neg95
  %or97 = or i32 %and94, %and96
  %arrayidx98 = getelementptr inbounds i32* %in, i64 8
  %12 = load i32* %arrayidx98, align 4, !tbaa !0
  %add99 = add i32 %12, 1770035416
  %add100 = add i32 %add99, %add57
  %add101 = add i32 %add100, %or97
  %shl102 = shl i32 %add101, 7
  %shr103 = lshr i32 %add101, 25
  %or104 = or i32 %shl102, %shr103
  %add105 = add i32 %or104, %add93
  %and106 = and i32 %add105, %add93
  %neg107 = xor i32 %add105, -1
  %and108 = and i32 %add81, %neg107
  %or109 = or i32 %and106, %and108
  %arrayidx110 = getelementptr inbounds i32* %in, i64 9
  %13 = load i32* %arrayidx110, align 4, !tbaa !0
  %add111 = add i32 %13, -1958414417
  %add112 = add i32 %add111, %add69
  %add113 = add i32 %add112, %or109
  %shl114 = shl i32 %add113, 12
  %shr115 = lshr i32 %add113, 20
  %or116 = or i32 %shl114, %shr115
  %add117 = add i32 %or116, %add105
  %and118 = and i32 %add117, %add105
  %neg119 = xor i32 %add117, -1
  %and120 = and i32 %add93, %neg119
  %or121 = or i32 %and118, %and120
  %arrayidx122 = getelementptr inbounds i32* %in, i64 10
  %14 = load i32* %arrayidx122, align 4, !tbaa !0
  %add123 = add i32 %14, -42063
  %add124 = add i32 %add123, %add81
  %add125 = add i32 %add124, %or121
  %shl126 = shl i32 %add125, 17
  %shr127 = lshr i32 %add125, 15
  %or128 = or i32 %shl126, %shr127
  %add129 = add i32 %or128, %add117
  %and130 = and i32 %add129, %add117
  %neg131 = xor i32 %add129, -1
  %and132 = and i32 %add105, %neg131
  %or133 = or i32 %and130, %and132
  %arrayidx134 = getelementptr inbounds i32* %in, i64 11
  %15 = load i32* %arrayidx134, align 4, !tbaa !0
  %add135 = add i32 %15, -1990404162
  %add136 = add i32 %add135, %add93
  %add137 = add i32 %add136, %or133
  %shl138 = shl i32 %add137, 22
  %shr139 = lshr i32 %add137, 10
  %or140 = or i32 %shl138, %shr139
  %add141 = add i32 %or140, %add129
  %and142 = and i32 %add141, %add129
  %neg143 = xor i32 %add141, -1
  %and144 = and i32 %add117, %neg143
  %or145 = or i32 %and142, %and144
  %arrayidx146 = getelementptr inbounds i32* %in, i64 12
  %16 = load i32* %arrayidx146, align 4, !tbaa !0
  %add147 = add i32 %16, 1804603682
  %add148 = add i32 %add147, %add105
  %add149 = add i32 %add148, %or145
  %shl150 = shl i32 %add149, 7
  %shr151 = lshr i32 %add149, 25
  %or152 = or i32 %shl150, %shr151
  %add153 = add i32 %or152, %add141
  %and154 = and i32 %add153, %add141
  %neg155 = xor i32 %add153, -1
  %and156 = and i32 %add129, %neg155
  %or157 = or i32 %and154, %and156
  %arrayidx158 = getelementptr inbounds i32* %in, i64 13
  %17 = load i32* %arrayidx158, align 4, !tbaa !0
  %add159 = add i32 %17, -40341101
  %add160 = add i32 %add159, %add117
  %add161 = add i32 %add160, %or157
  %shl162 = shl i32 %add161, 12
  %shr163 = lshr i32 %add161, 20
  %or164 = or i32 %shl162, %shr163
  %add165 = add i32 %or164, %add153
  %and166 = and i32 %add165, %add153
  %neg167 = xor i32 %add165, -1
  %and168 = and i32 %add141, %neg167
  %or169 = or i32 %and166, %and168
  %arrayidx170 = getelementptr inbounds i32* %in, i64 14
  %18 = load i32* %arrayidx170, align 4, !tbaa !0
  %add171 = add i32 %18, -1502002290
  %add172 = add i32 %add171, %add129
  %add173 = add i32 %add172, %or169
  %shl174 = shl i32 %add173, 17
  %shr175 = lshr i32 %add173, 15
  %or176 = or i32 %shl174, %shr175
  %add177 = add i32 %or176, %add165
  %and178 = and i32 %add177, %add165
  %neg179 = xor i32 %add177, -1
  %and180 = and i32 %add153, %neg179
  %or181 = or i32 %and178, %and180
  %arrayidx182 = getelementptr inbounds i32* %in, i64 15
  %19 = load i32* %arrayidx182, align 4, !tbaa !0
  %add183 = add i32 %19, 1236535329
  %add184 = add i32 %add183, %add141
  %add185 = add i32 %add184, %or181
  %shl186 = shl i32 %add185, 22
  %shr187 = lshr i32 %add185, 10
  %or188 = or i32 %shl186, %shr187
  %add189 = add i32 %or188, %add177
  %and190 = and i32 %add189, %add165
  %and192 = and i32 %add177, %neg167
  %or193 = or i32 %and190, %and192
  %add195 = add i32 %5, -165796510
  %add196 = add i32 %add195, %add153
  %add197 = add i32 %add196, %or193
  %shl198 = shl i32 %add197, 5
  %shr199 = lshr i32 %add197, 27
  %or200 = or i32 %shl198, %shr199
  %add201 = add i32 %or200, %add189
  %and202 = and i32 %add201, %add177
  %and204 = and i32 %add189, %neg179
  %or205 = or i32 %and202, %and204
  %add207 = add i32 %10, -1069501632
  %add208 = add i32 %add207, %add165
  %add209 = add i32 %add208, %or205
  %shl210 = shl i32 %add209, 9
  %shr211 = lshr i32 %add209, 23
  %or212 = or i32 %shl210, %shr211
  %add213 = add i32 %or212, %add201
  %and214 = and i32 %add213, %add189
  %neg215 = xor i32 %add189, -1
  %and216 = and i32 %add201, %neg215
  %or217 = or i32 %and214, %and216
  %add219 = add i32 %15, 643717713
  %add220 = add i32 %add219, %add177
  %add221 = add i32 %add220, %or217
  %shl222 = shl i32 %add221, 14
  %shr223 = lshr i32 %add221, 18
  %or224 = or i32 %shl222, %shr223
  %add225 = add i32 %or224, %add213
  %and226 = and i32 %add225, %add201
  %neg227 = xor i32 %add201, -1
  %and228 = and i32 %add213, %neg227
  %or229 = or i32 %and226, %and228
  %add231 = add i32 %4, -373897302
  %add232 = add i32 %add231, %add189
  %add233 = add i32 %add232, %or229
  %shl234 = shl i32 %add233, 20
  %shr235 = lshr i32 %add233, 12
  %or236 = or i32 %shl234, %shr235
  %add237 = add i32 %or236, %add225
  %and238 = and i32 %add237, %add213
  %neg239 = xor i32 %add213, -1
  %and240 = and i32 %add225, %neg239
  %or241 = or i32 %and238, %and240
  %add243 = add i32 %9, -701558691
  %add244 = add i32 %add243, %add201
  %add245 = add i32 %add244, %or241
  %shl246 = shl i32 %add245, 5
  %shr247 = lshr i32 %add245, 27
  %or248 = or i32 %shl246, %shr247
  %add249 = add i32 %or248, %add237
  %and250 = and i32 %add249, %add225
  %neg251 = xor i32 %add225, -1
  %and252 = and i32 %add237, %neg251
  %or253 = or i32 %and250, %and252
  %add255 = add i32 %14, 38016083
  %add256 = add i32 %add255, %add213
  %add257 = add i32 %add256, %or253
  %shl258 = shl i32 %add257, 9
  %shr259 = lshr i32 %add257, 23
  %or260 = or i32 %shl258, %shr259
  %add261 = add i32 %or260, %add249
  %and262 = and i32 %add261, %add237
  %neg263 = xor i32 %add237, -1
  %and264 = and i32 %add249, %neg263
  %or265 = or i32 %and262, %and264
  %add267 = add i32 %19, -660478335
  %add268 = add i32 %add267, %add225
  %add269 = add i32 %add268, %or265
  %shl270 = shl i32 %add269, 14
  %shr271 = lshr i32 %add269, 18
  %or272 = or i32 %shl270, %shr271
  %add273 = add i32 %or272, %add261
  %and274 = and i32 %add273, %add249
  %neg275 = xor i32 %add249, -1
  %and276 = and i32 %add261, %neg275
  %or277 = or i32 %and274, %and276
  %add279 = add i32 %8, -405537848
  %add280 = add i32 %add279, %add237
  %add281 = add i32 %add280, %or277
  %shl282 = shl i32 %add281, 20
  %shr283 = lshr i32 %add281, 12
  %or284 = or i32 %shl282, %shr283
  %add285 = add i32 %or284, %add273
  %and286 = and i32 %add285, %add261
  %neg287 = xor i32 %add261, -1
  %and288 = and i32 %add273, %neg287
  %or289 = or i32 %and286, %and288
  %add291 = add i32 %13, 568446438
  %add292 = add i32 %add291, %add249
  %add293 = add i32 %add292, %or289
  %shl294 = shl i32 %add293, 5
  %shr295 = lshr i32 %add293, 27
  %or296 = or i32 %shl294, %shr295
  %add297 = add i32 %or296, %add285
  %and298 = and i32 %add297, %add273
  %neg299 = xor i32 %add273, -1
  %and300 = and i32 %add285, %neg299
  %or301 = or i32 %and298, %and300
  %add303 = add i32 %18, -1019803690
  %add304 = add i32 %add303, %add261
  %add305 = add i32 %add304, %or301
  %shl306 = shl i32 %add305, 9
  %shr307 = lshr i32 %add305, 23
  %or308 = or i32 %shl306, %shr307
  %add309 = add i32 %or308, %add297
  %and310 = and i32 %add309, %add285
  %neg311 = xor i32 %add285, -1
  %and312 = and i32 %add297, %neg311
  %or313 = or i32 %and310, %and312
  %add315 = add i32 %7, -187363961
  %add316 = add i32 %add315, %add273
  %add317 = add i32 %add316, %or313
  %shl318 = shl i32 %add317, 14
  %shr319 = lshr i32 %add317, 18
  %or320 = or i32 %shl318, %shr319
  %add321 = add i32 %or320, %add309
  %and322 = and i32 %add321, %add297
  %neg323 = xor i32 %add297, -1
  %and324 = and i32 %add309, %neg323
  %or325 = or i32 %and322, %and324
  %add327 = add i32 %12, 1163531501
  %add328 = add i32 %add327, %add285
  %add329 = add i32 %add328, %or325
  %shl330 = shl i32 %add329, 20
  %shr331 = lshr i32 %add329, 12
  %or332 = or i32 %shl330, %shr331
  %add333 = add i32 %or332, %add321
  %and334 = and i32 %add333, %add309
  %neg335 = xor i32 %add309, -1
  %and336 = and i32 %add321, %neg335
  %or337 = or i32 %and334, %and336
  %add339 = add i32 %17, -1444681467
  %add340 = add i32 %add339, %add297
  %add341 = add i32 %add340, %or337
  %shl342 = shl i32 %add341, 5
  %shr343 = lshr i32 %add341, 27
  %or344 = or i32 %shl342, %shr343
  %add345 = add i32 %or344, %add333
  %and346 = and i32 %add345, %add321
  %neg347 = xor i32 %add321, -1
  %and348 = and i32 %add333, %neg347
  %or349 = or i32 %and346, %and348
  %add351 = add i32 %6, -51403784
  %add352 = add i32 %add351, %add309
  %add353 = add i32 %add352, %or349
  %shl354 = shl i32 %add353, 9
  %shr355 = lshr i32 %add353, 23
  %or356 = or i32 %shl354, %shr355
  %add357 = add i32 %or356, %add345
  %and358 = and i32 %add357, %add333
  %neg359 = xor i32 %add333, -1
  %and360 = and i32 %add345, %neg359
  %or361 = or i32 %and358, %and360
  %add363 = add i32 %11, 1735328473
  %add364 = add i32 %add363, %add321
  %add365 = add i32 %add364, %or361
  %shl366 = shl i32 %add365, 14
  %shr367 = lshr i32 %add365, 18
  %or368 = or i32 %shl366, %shr367
  %add369 = add i32 %or368, %add357
  %and370 = and i32 %add369, %add345
  %neg371 = xor i32 %add345, -1
  %and372 = and i32 %add357, %neg371
  %or373 = or i32 %and370, %and372
  %add375 = add i32 %16, -1926607734
  %add376 = add i32 %add375, %add333
  %add377 = add i32 %add376, %or373
  %shl378 = shl i32 %add377, 20
  %shr379 = lshr i32 %add377, 12
  %or380 = or i32 %shl378, %shr379
  %add381 = add i32 %or380, %add369
  %xor = xor i32 %add369, %add357
  %xor382 = xor i32 %xor, %add381
  %add384 = add i32 %9, -378558
  %add385 = add i32 %add384, %add345
  %add386 = add i32 %add385, %xor382
  %shl387 = shl i32 %add386, 4
  %shr388 = lshr i32 %add386, 28
  %or389 = or i32 %shl387, %shr388
  %add390 = add i32 %or389, %add381
  %xor391 = xor i32 %add381, %add369
  %xor392 = xor i32 %xor391, %add390
  %add394 = add i32 %12, -2022574463
  %add395 = add i32 %add394, %add357
  %add396 = add i32 %add395, %xor392
  %shl397 = shl i32 %add396, 11
  %shr398 = lshr i32 %add396, 21
  %or399 = or i32 %shl397, %shr398
  %add400 = add i32 %or399, %add390
  %xor401 = xor i32 %add390, %add381
  %xor402 = xor i32 %xor401, %add400
  %add404 = add i32 %15, 1839030562
  %add405 = add i32 %add404, %add369
  %add406 = add i32 %add405, %xor402
  %shl407 = shl i32 %add406, 16
  %shr408 = lshr i32 %add406, 16
  %or409 = or i32 %shl407, %shr408
  %add410 = add i32 %or409, %add400
  %xor411 = xor i32 %add400, %add390
  %xor412 = xor i32 %xor411, %add410
  %add414 = add i32 %18, -35309556
  %add415 = add i32 %add414, %add381
  %add416 = add i32 %add415, %xor412
  %shl417 = shl i32 %add416, 23
  %shr418 = lshr i32 %add416, 9
  %or419 = or i32 %shl417, %shr418
  %add420 = add i32 %or419, %add410
  %xor421 = xor i32 %add410, %add400
  %xor422 = xor i32 %xor421, %add420
  %add424 = add i32 %5, -1530992060
  %add425 = add i32 %add424, %add390
  %add426 = add i32 %add425, %xor422
  %shl427 = shl i32 %add426, 4
  %shr428 = lshr i32 %add426, 28
  %or429 = or i32 %shl427, %shr428
  %add430 = add i32 %or429, %add420
  %xor431 = xor i32 %add420, %add410
  %xor432 = xor i32 %xor431, %add430
  %add434 = add i32 %8, 1272893353
  %add435 = add i32 %add434, %add400
  %add436 = add i32 %add435, %xor432
  %shl437 = shl i32 %add436, 11
  %shr438 = lshr i32 %add436, 21
  %or439 = or i32 %shl437, %shr438
  %add440 = add i32 %or439, %add430
  %xor441 = xor i32 %add430, %add420
  %xor442 = xor i32 %xor441, %add440
  %add444 = add i32 %11, -155497632
  %add445 = add i32 %add444, %add410
  %add446 = add i32 %add445, %xor442
  %shl447 = shl i32 %add446, 16
  %shr448 = lshr i32 %add446, 16
  %or449 = or i32 %shl447, %shr448
  %add450 = add i32 %or449, %add440
  %xor451 = xor i32 %add440, %add430
  %xor452 = xor i32 %xor451, %add450
  %add454 = add i32 %14, -1094730640
  %add455 = add i32 %add454, %add420
  %add456 = add i32 %add455, %xor452
  %shl457 = shl i32 %add456, 23
  %shr458 = lshr i32 %add456, 9
  %or459 = or i32 %shl457, %shr458
  %add460 = add i32 %or459, %add450
  %xor461 = xor i32 %add450, %add440
  %xor462 = xor i32 %xor461, %add460
  %add464 = add i32 %17, 681279174
  %add465 = add i32 %add464, %add430
  %add466 = add i32 %add465, %xor462
  %shl467 = shl i32 %add466, 4
  %shr468 = lshr i32 %add466, 28
  %or469 = or i32 %shl467, %shr468
  %add470 = add i32 %or469, %add460
  %xor471 = xor i32 %add460, %add450
  %xor472 = xor i32 %xor471, %add470
  %add474 = add i32 %4, -358537222
  %add475 = add i32 %add474, %add440
  %add476 = add i32 %add475, %xor472
  %shl477 = shl i32 %add476, 11
  %shr478 = lshr i32 %add476, 21
  %or479 = or i32 %shl477, %shr478
  %add480 = add i32 %or479, %add470
  %xor481 = xor i32 %add470, %add460
  %xor482 = xor i32 %xor481, %add480
  %add484 = add i32 %7, -722521979
  %add485 = add i32 %add484, %add450
  %add486 = add i32 %add485, %xor482
  %shl487 = shl i32 %add486, 16
  %shr488 = lshr i32 %add486, 16
  %or489 = or i32 %shl487, %shr488
  %add490 = add i32 %or489, %add480
  %xor491 = xor i32 %add480, %add470
  %xor492 = xor i32 %xor491, %add490
  %add494 = add i32 %10, 76029189
  %add495 = add i32 %add494, %add460
  %add496 = add i32 %add495, %xor492
  %shl497 = shl i32 %add496, 23
  %shr498 = lshr i32 %add496, 9
  %or499 = or i32 %shl497, %shr498
  %add500 = add i32 %or499, %add490
  %xor501 = xor i32 %add490, %add480
  %xor502 = xor i32 %xor501, %add500
  %add504 = add i32 %13, -640364487
  %add505 = add i32 %add504, %add470
  %add506 = add i32 %add505, %xor502
  %shl507 = shl i32 %add506, 4
  %shr508 = lshr i32 %add506, 28
  %or509 = or i32 %shl507, %shr508
  %add510 = add i32 %or509, %add500
  %xor511 = xor i32 %add500, %add490
  %xor512 = xor i32 %xor511, %add510
  %add514 = add i32 %16, -421815835
  %add515 = add i32 %add514, %add480
  %add516 = add i32 %add515, %xor512
  %shl517 = shl i32 %add516, 11
  %shr518 = lshr i32 %add516, 21
  %or519 = or i32 %shl517, %shr518
  %add520 = add i32 %or519, %add510
  %xor521 = xor i32 %add510, %add500
  %xor522 = xor i32 %xor521, %add520
  %add524 = add i32 %19, 530742520
  %add525 = add i32 %add524, %add490
  %add526 = add i32 %add525, %xor522
  %shl527 = shl i32 %add526, 16
  %shr528 = lshr i32 %add526, 16
  %or529 = or i32 %shl527, %shr528
  %add530 = add i32 %or529, %add520
  %xor531 = xor i32 %add520, %add510
  %xor532 = xor i32 %xor531, %add530
  %add534 = add i32 %6, -995338651
  %add535 = add i32 %add534, %add500
  %add536 = add i32 %add535, %xor532
  %shl537 = shl i32 %add536, 23
  %shr538 = lshr i32 %add536, 9
  %or539 = or i32 %shl537, %shr538
  %add540 = add i32 %or539, %add530
  %neg541 = xor i32 %add520, -1
  %or542 = or i32 %add540, %neg541
  %xor543 = xor i32 %or542, %add530
  %add545 = add i32 %4, -198630844
  %add546 = add i32 %add545, %add510
  %add547 = add i32 %add546, %xor543
  %shl548 = shl i32 %add547, 6
  %shr549 = lshr i32 %add547, 26
  %or550 = or i32 %shl548, %shr549
  %add551 = add i32 %or550, %add540
  %neg552 = xor i32 %add530, -1
  %or553 = or i32 %add551, %neg552
  %xor554 = xor i32 %or553, %add540
  %add556 = add i32 %11, 1126891415
  %add557 = add i32 %add556, %add520
  %add558 = add i32 %add557, %xor554
  %shl559 = shl i32 %add558, 10
  %shr560 = lshr i32 %add558, 22
  %or561 = or i32 %shl559, %shr560
  %add562 = add i32 %or561, %add551
  %neg563 = xor i32 %add540, -1
  %or564 = or i32 %add562, %neg563
  %xor565 = xor i32 %or564, %add551
  %add567 = add i32 %18, -1416354905
  %add568 = add i32 %add567, %add530
  %add569 = add i32 %add568, %xor565
  %shl570 = shl i32 %add569, 15
  %shr571 = lshr i32 %add569, 17
  %or572 = or i32 %shl570, %shr571
  %add573 = add i32 %or572, %add562
  %neg574 = xor i32 %add551, -1
  %or575 = or i32 %add573, %neg574
  %xor576 = xor i32 %or575, %add562
  %add578 = add i32 %9, -57434055
  %add579 = add i32 %add578, %add540
  %add580 = add i32 %add579, %xor576
  %shl581 = shl i32 %add580, 21
  %shr582 = lshr i32 %add580, 11
  %or583 = or i32 %shl581, %shr582
  %add584 = add i32 %or583, %add573
  %neg585 = xor i32 %add562, -1
  %or586 = or i32 %add584, %neg585
  %xor587 = xor i32 %or586, %add573
  %add589 = add i32 %16, 1700485571
  %add590 = add i32 %add589, %add551
  %add591 = add i32 %add590, %xor587
  %shl592 = shl i32 %add591, 6
  %shr593 = lshr i32 %add591, 26
  %or594 = or i32 %shl592, %shr593
  %add595 = add i32 %or594, %add584
  %neg596 = xor i32 %add573, -1
  %or597 = or i32 %add595, %neg596
  %xor598 = xor i32 %or597, %add584
  %add600 = add i32 %7, -1894986606
  %add601 = add i32 %add600, %add562
  %add602 = add i32 %add601, %xor598
  %shl603 = shl i32 %add602, 10
  %shr604 = lshr i32 %add602, 22
  %or605 = or i32 %shl603, %shr604
  %add606 = add i32 %or605, %add595
  %neg607 = xor i32 %add584, -1
  %or608 = or i32 %add606, %neg607
  %xor609 = xor i32 %or608, %add595
  %add611 = add i32 %14, -1051523
  %add612 = add i32 %add611, %add573
  %add613 = add i32 %add612, %xor609
  %shl614 = shl i32 %add613, 15
  %shr615 = lshr i32 %add613, 17
  %or616 = or i32 %shl614, %shr615
  %add617 = add i32 %or616, %add606
  %neg618 = xor i32 %add595, -1
  %or619 = or i32 %add617, %neg618
  %xor620 = xor i32 %or619, %add606
  %add622 = add i32 %5, -2054922799
  %add623 = add i32 %add622, %add584
  %add624 = add i32 %add623, %xor620
  %shl625 = shl i32 %add624, 21
  %shr626 = lshr i32 %add624, 11
  %or627 = or i32 %shl625, %shr626
  %add628 = add i32 %or627, %add617
  %neg629 = xor i32 %add606, -1
  %or630 = or i32 %add628, %neg629
  %xor631 = xor i32 %or630, %add617
  %add633 = add i32 %12, 1873313359
  %add634 = add i32 %add633, %add595
  %add635 = add i32 %add634, %xor631
  %shl636 = shl i32 %add635, 6
  %shr637 = lshr i32 %add635, 26
  %or638 = or i32 %shl636, %shr637
  %add639 = add i32 %or638, %add628
  %neg640 = xor i32 %add617, -1
  %or641 = or i32 %add639, %neg640
  %xor642 = xor i32 %or641, %add628
  %add644 = add i32 %19, -30611744
  %add645 = add i32 %add644, %add606
  %add646 = add i32 %add645, %xor642
  %shl647 = shl i32 %add646, 10
  %shr648 = lshr i32 %add646, 22
  %or649 = or i32 %shl647, %shr648
  %add650 = add i32 %or649, %add639
  %neg651 = xor i32 %add628, -1
  %or652 = or i32 %add650, %neg651
  %xor653 = xor i32 %or652, %add639
  %add655 = add i32 %10, -1560198380
  %add656 = add i32 %add655, %add617
  %add657 = add i32 %add656, %xor653
  %shl658 = shl i32 %add657, 15
  %shr659 = lshr i32 %add657, 17
  %or660 = or i32 %shl658, %shr659
  %add661 = add i32 %or660, %add650
  %neg662 = xor i32 %add639, -1
  %or663 = or i32 %add661, %neg662
  %xor664 = xor i32 %or663, %add650
  %add666 = add i32 %17, 1309151649
  %add667 = add i32 %add666, %add628
  %add668 = add i32 %add667, %xor664
  %shl669 = shl i32 %add668, 21
  %shr670 = lshr i32 %add668, 11
  %or671 = or i32 %shl669, %shr670
  %add672 = add i32 %or671, %add661
  %neg673 = xor i32 %add650, -1
  %or674 = or i32 %add672, %neg673
  %xor675 = xor i32 %or674, %add661
  %add677 = add i32 %8, -145523070
  %add678 = add i32 %add677, %add639
  %add679 = add i32 %add678, %xor675
  %shl680 = shl i32 %add679, 6
  %shr681 = lshr i32 %add679, 26
  %or682 = or i32 %shl680, %shr681
  %add683 = add i32 %or682, %add672
  %neg684 = xor i32 %add661, -1
  %or685 = or i32 %add683, %neg684
  %xor686 = xor i32 %or685, %add672
  %add688 = add i32 %15, -1120210379
  %add689 = add i32 %add688, %add650
  %add690 = add i32 %add689, %xor686
  %shl691 = shl i32 %add690, 10
  %shr692 = lshr i32 %add690, 22
  %or693 = or i32 %shl691, %shr692
  %add694 = add i32 %or693, %add683
  %neg695 = xor i32 %add672, -1
  %or696 = or i32 %add694, %neg695
  %xor697 = xor i32 %or696, %add683
  %add699 = add i32 %6, 718787259
  %add700 = add i32 %add699, %add661
  %add701 = add i32 %add700, %xor697
  %shl702 = shl i32 %add701, 15
  %shr703 = lshr i32 %add701, 17
  %or704 = or i32 %shl702, %shr703
  %add705 = add i32 %or704, %add694
  %neg706 = xor i32 %add683, -1
  %or707 = or i32 %add705, %neg706
  %xor708 = xor i32 %or707, %add694
  %add710 = add i32 %13, -343485551
  %add711 = add i32 %add710, %add672
  %add712 = add i32 %add711, %xor708
  %shl713 = shl i32 %add712, 21
  %shr714 = lshr i32 %add712, 11
  %or715 = or i32 %shl713, %shr714
  %add718 = add i32 %add683, %0
  store i32 %add718, i32* %buf, align 4, !tbaa !0
  %20 = load i32* %arrayidx1, align 4, !tbaa !0
  %add716 = add i32 %add705, %20
  %add720 = add i32 %add716, %or715
  store i32 %add720, i32* %arrayidx1, align 4, !tbaa !0
  %21 = load i32* %arrayidx2, align 4, !tbaa !0
  %add722 = add i32 %add705, %21
  store i32 %add722, i32* %arrayidx2, align 4, !tbaa !0
  %22 = load i32* %arrayidx3, align 4, !tbaa !0
  %add724 = add i32 %add694, %22
  store i32 %add724, i32* %arrayidx3, align 4, !tbaa !0
  ret void
}

declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) nounwind readnone

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
