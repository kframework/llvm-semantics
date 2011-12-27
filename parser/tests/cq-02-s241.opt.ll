; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-02-s241.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@svtest.k = internal unnamed_addr global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.qs241 = internal global [8 x i8] c"s241   \00", align 1
@sec.g = internal unnamed_addr global [39 x i64] [i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 6, i64 0, i64 8, i64 0, i64 12, i64 0, i64 16, i64 0, i64 18, i64 0, i64 20, i64 0, i64 24, i64 0, i64 28, i64 0, i64 30, i64 0, i64 32, i64 0, i64 36], align 16
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@.str2 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@str = internal constant [47 x i8] c"Decimal and octal/hex constants sometimes give\00"
@str1 = internal constant [45 x i8] c"   different results when assigned to longs.\00"
@str2 = internal constant [21 x i8] c"\0ANo errors detected.\00"
@str3 = internal constant [9 x i8] c"\0AFailed.\00"

define i64 @pow2(i64 %n) nounwind uwtable readnone {
entry:
  %tobool2 = icmp eq i64 %n, 0
  br i1 %tobool2, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %indvar = phi i64 [ %indvar.next, %while.body ], [ 0, %entry ]
  %storemerge4 = phi i64 [ %mul, %while.body ], [ 1, %entry ]
  %mul = shl nsw i64 %storemerge4, 1
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %n
  br i1 %exitcond, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  %storemerge.lcssa = phi i64 [ 1, %entry ], [ %mul, %while.body ]
  ret i64 %storemerge.lcssa
}

define void @zerofill(i8* %x) nounwind uwtable {
entry:
  call void @llvm.memset.p0i8.i64(i8* %x, i8 0, i64 256, i32 1, i1 false)
  ret void
}

define i32 @sumof(i8* %x) nounwind uwtable readonly {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %for.body ]
  %add23 = phi i32 [ 0, %entry ], [ %add, %for.body ]
  %incdec.ptr14 = getelementptr i8* %x, i64 %indvar
  %tmp4 = load i8* %incdec.ptr14, align 1
  %conv = sext i8 %tmp4 to i32
  %add = add nsw i32 %conv, %add23
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 256
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret i32 %add
}

define i32 @setupTable(%struct.defs* %pd0) nounwind uwtable {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %entry
  %indvar17 = phi i64 [ %indvar.next18, %while.cond ], [ 0, %entry ]
  %incdec.ptr42 = getelementptr %struct.defs* %pd0, i64 0, i32 15, i64 %indvar17
  %incdec.ptr1 = getelementptr [8 x i8]* @setupTable.qs26, i64 0, i64 %indvar17
  %tmp2 = load i8* %incdec.ptr1, align 1
  store i8 %tmp2, i8* %incdec.ptr42, align 1
  %tobool = icmp eq i8 %tmp2, 0
  %indvar.next18 = add i64 %indvar17, 1
  br i1 %tobool, label %while.end, label %while.cond

while.end:                                        ; preds = %while.cond
  %cbits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 0
  store i32 8, i32* %cbits, align 4
  %ibits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 1
  store i32 32, i32* %ibits, align 4
  %sbits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 2
  store i32 16, i32* %sbits, align 4
  %lbits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 3
  store i32 64, i32* %lbits, align 4
  %ubits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 4
  store i32 32, i32* %ubits, align 4
  %fbits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 5
  store i32 32, i32* %fbits, align 4
  %dbits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 6
  store i32 64, i32* %dbits, align 4
  %fprec = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 7
  store float 0x3E80000000000000, float* %fprec, align 4
  br label %while.body85

while.body85:                                     ; preds = %while.body85, %while.end
  %indvar = phi i32 [ 0, %while.end ], [ %indvar.next, %while.body85 ]
  %tmp9559 = phi float [ 1.000000e+00, %while.end ], [ %conv93, %while.body85 ]
  %conv93 = fmul float %tmp9559, 5.000000e-01
  %indvar.next = add i32 %indvar, 1
  %exitcond = icmp eq i32 %indvar.next, 54
  br i1 %exitcond, label %while.end94, label %while.body85

while.end94:                                      ; preds = %while.body85
  %conv98 = fmul float %conv93, 4.000000e+00
  %dprec = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 8
  store float %conv98, float* %dprec, align 4
  ret i32 0
}

define i32 @svtest(i32 %n) nounwind uwtable {
entry:
  switch i32 %n, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb3
  ]

sw.bb:                                            ; preds = %entry
  store i32 1978, i32* @svtest.k, align 4
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %tmp2 = load i32* @svtest.k, align 4
  %cmp = icmp eq i32 %tmp2, 1978
  br i1 %cmp, label %if.else, label %sw.epilog

if.else:                                          ; preds = %sw.bb1
  store i32 1929, i32* @svtest.k, align 4
  br label %sw.epilog

sw.bb3:                                           ; preds = %entry
  %tmp4 = load i32* @svtest.k, align 4
  %not.cmp5 = icmp ne i32 %tmp4, 1929
  %. = zext i1 %not.cmp5 to i32
  br label %sw.epilog

sw.epilog:                                        ; preds = %if.else, %sw.bb1, %sw.bb3, %sw.bb, %entry
  %storemerge12 = phi i32 [ %., %sw.bb3 ], [ 0, %sw.bb ], [ undef, %entry ], [ 0, %if.else ], [ 1, %sw.bb1 ]
  ret i32 %storemerge12
}

define i32 @zero() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @testev() nounwind uwtable readonly {
entry:
  %tmp = load i32* @extvar, align 4
  %not.cmp = icmp ne i32 %tmp, 1066
  %. = zext i1 %not.cmp to i32
  ret i32 %.
}

define void @setev() nounwind uwtable {
entry:
  store i32 1066, i32* @extvar, align 4
  ret void
}

define i32 @McCarthy(i32 %x) nounwind uwtable readnone {
entry:
  %cmp1 = icmp sgt i32 %x, 100
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %if.else, %entry
  %x.tr.lcssa = phi i32 [ %x, %entry ], [ %call, %if.else ]
  %sub = add nsw i32 %x.tr.lcssa, -10
  ret i32 %sub

if.else:                                          ; preds = %entry, %if.else
  %x.tr2 = phi i32 [ %call, %if.else ], [ %x, %entry ]
  %add = add nsw i32 %x.tr2, 11
  %call = tail call i32 @McCarthy(i32 %add) nounwind
  %cmp = icmp sgt i32 %call, 100
  br i1 %cmp, label %if.then, label %if.else
}

define i32 @clobber(i32 %x, i32* nocapture %y) nounwind uwtable {
entry:
  store i32 2, i32* %y, align 4
  ret i32 0
}

define i32 @sec(%struct.defs* %pd0) nounwind uwtable {
entry:
  %d = alloca [39 x i64], align 16
  %o = alloca [39 x i64], align 16
  %x = alloca [39 x i64], align 16
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %entry
  %indvar25 = phi i64 [ %indvar.next26, %while.cond ], [ 0, %entry ]
  %incdec.ptr44 = getelementptr %struct.defs* %pd0, i64 0, i32 15, i64 %indvar25
  %incdec.ptr3 = getelementptr [8 x i8]* @sec.qs241, i64 0, i64 %indvar25
  %tmp2 = load i8* %incdec.ptr3, align 1
  store i8 %tmp2, i8* %incdec.ptr44, align 1
  %tobool = icmp eq i8 %tmp2, 0
  %indvar.next26 = add i64 %indvar25, 1
  br i1 %tobool, label %for.cond.preheader, label %while.cond

for.cond.preheader:                               ; preds = %while.cond
  store i64 0, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 0), align 16
  store i64 1, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 1), align 8
  store i64 2, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 2), align 16
  store i64 3, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 3), align 8
  store i64 4, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 4), align 16
  store i64 5, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 5), align 8
  store i64 6, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 6), align 16
  store i64 7, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 7), align 8
  store i64 8, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 8), align 16
  store i64 9, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 9), align 8
  store i64 10, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 10), align 16
  store i64 11, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 11), align 8
  store i64 12, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 12), align 16
  store i64 13, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 13), align 8
  store i64 14, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 14), align 16
  store i64 15, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 15), align 8
  store i64 16, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 16), align 16
  br label %for.body13

for.body13:                                       ; preds = %pow2.exit, %for.cond.preheader
  %indvar12 = phi i64 [ 0, %for.cond.preheader ], [ %indvar.next13, %pow2.exit ]
  %tmp = shl i64 %indvar12, 1
  %tmp15 = add i64 %tmp, 18
  %arrayidx16 = getelementptr [39 x i64]* @sec.g, i64 0, i64 %tmp15
  %tmp16 = add i64 %tmp, 17
  %arrayidx28 = getelementptr [39 x i64]* @sec.g, i64 0, i64 %tmp16
  %tmp17 = load i64* %arrayidx16, align 16
  %tobool2.i = icmp eq i64 %tmp17, 0
  br i1 %tobool2.i, label %pow2.exit, label %while.body.i

while.body.i:                                     ; preds = %for.body13, %while.body.i
  %indvar.i = phi i64 [ %0, %while.body.i ], [ 0, %for.body13 ]
  %storemerge4.i = phi i64 [ %mul.i, %while.body.i ], [ 1, %for.body13 ]
  %mul.i = shl nsw i64 %storemerge4.i, 1
  %0 = add i64 %indvar.i, 1
  %exitcond11 = icmp eq i64 %0, %tmp17
  br i1 %exitcond11, label %pow2.exit, label %while.body.i

pow2.exit:                                        ; preds = %while.body.i, %for.body13
  %storemerge.lcssa.i = phi i64 [ 1, %for.body13 ], [ %mul.i, %while.body.i ]
  store i64 %storemerge.lcssa.i, i64* %arrayidx16, align 16
  %sub = add nsw i64 %storemerge.lcssa.i, -1
  store i64 %sub, i64* %arrayidx28, align 8
  %indvar.next13 = add i64 %indvar12, 1
  %exitcond14 = icmp eq i64 %indvar.next13, 9
  br i1 %exitcond14, label %for.end30, label %for.body13

for.end30:                                        ; preds = %pow2.exit
  %arrayidx31 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 0
  store i64 0, i64* %arrayidx31, align 16
  %arrayidx32 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 0
  store i64 0, i64* %arrayidx32, align 16
  %arrayidx33 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 0
  store i64 0, i64* %arrayidx33, align 16
  %arrayidx34 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 1
  store i64 1, i64* %arrayidx34, align 8
  %arrayidx35 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 1
  store i64 1, i64* %arrayidx35, align 8
  %arrayidx36 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 1
  store i64 1, i64* %arrayidx36, align 8
  %arrayidx37 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 2
  store i64 2, i64* %arrayidx37, align 16
  %arrayidx38 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 2
  store i64 2, i64* %arrayidx38, align 16
  %arrayidx39 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 2
  store i64 2, i64* %arrayidx39, align 16
  %arrayidx40 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 3
  store i64 3, i64* %arrayidx40, align 8
  %arrayidx41 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 3
  store i64 3, i64* %arrayidx41, align 8
  %arrayidx42 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 3
  store i64 3, i64* %arrayidx42, align 8
  %arrayidx43 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 4
  store i64 4, i64* %arrayidx43, align 16
  %arrayidx44 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 4
  store i64 4, i64* %arrayidx44, align 16
  %arrayidx45 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 4
  store i64 4, i64* %arrayidx45, align 16
  %arrayidx46 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 5
  store i64 5, i64* %arrayidx46, align 8
  %arrayidx47 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 5
  store i64 5, i64* %arrayidx47, align 8
  %arrayidx48 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 5
  store i64 5, i64* %arrayidx48, align 8
  %arrayidx49 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 6
  store i64 6, i64* %arrayidx49, align 16
  %arrayidx50 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 6
  store i64 6, i64* %arrayidx50, align 16
  %arrayidx51 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 6
  store i64 6, i64* %arrayidx51, align 16
  %arrayidx52 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 7
  store i64 7, i64* %arrayidx52, align 8
  %arrayidx53 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 7
  store i64 7, i64* %arrayidx53, align 8
  %arrayidx54 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 7
  store i64 7, i64* %arrayidx54, align 8
  %arrayidx55 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 8
  store i64 8, i64* %arrayidx55, align 16
  %arrayidx56 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 8
  store i64 8, i64* %arrayidx56, align 16
  %arrayidx57 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 8
  store i64 8, i64* %arrayidx57, align 16
  %arrayidx58 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 9
  store i64 9, i64* %arrayidx58, align 8
  %arrayidx59 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 9
  store i64 9, i64* %arrayidx59, align 8
  %arrayidx60 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 9
  store i64 9, i64* %arrayidx60, align 8
  %arrayidx61 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 10
  store i64 10, i64* %arrayidx61, align 16
  %arrayidx62 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 10
  store i64 10, i64* %arrayidx62, align 16
  %arrayidx63 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 10
  store i64 10, i64* %arrayidx63, align 16
  %arrayidx64 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 11
  store i64 11, i64* %arrayidx64, align 8
  %arrayidx65 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 11
  store i64 11, i64* %arrayidx65, align 8
  %arrayidx66 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 11
  store i64 11, i64* %arrayidx66, align 8
  %arrayidx67 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 12
  store i64 12, i64* %arrayidx67, align 16
  %arrayidx68 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 12
  store i64 12, i64* %arrayidx68, align 16
  %arrayidx69 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 12
  store i64 12, i64* %arrayidx69, align 16
  %arrayidx70 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 13
  store i64 13, i64* %arrayidx70, align 8
  %arrayidx71 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 13
  store i64 13, i64* %arrayidx71, align 8
  %arrayidx72 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 13
  store i64 13, i64* %arrayidx72, align 8
  %arrayidx73 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 14
  store i64 14, i64* %arrayidx73, align 16
  %arrayidx74 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 14
  store i64 14, i64* %arrayidx74, align 16
  %arrayidx75 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 14
  store i64 14, i64* %arrayidx75, align 16
  %arrayidx76 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 15
  store i64 15, i64* %arrayidx76, align 8
  %arrayidx77 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 15
  store i64 15, i64* %arrayidx77, align 8
  %arrayidx78 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 15
  store i64 15, i64* %arrayidx78, align 8
  %arrayidx79 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 16
  store i64 16, i64* %arrayidx79, align 16
  %arrayidx80 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 16
  store i64 16, i64* %arrayidx80, align 16
  %arrayidx81 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 16
  store i64 16, i64* %arrayidx81, align 16
  %arrayidx82 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 17
  store i64 63, i64* %arrayidx82, align 8
  %arrayidx83 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 17
  store i64 63, i64* %arrayidx83, align 8
  %arrayidx84 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 17
  store i64 63, i64* %arrayidx84, align 8
  %arrayidx85 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 18
  store i64 64, i64* %arrayidx85, align 16
  %arrayidx86 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 18
  store i64 64, i64* %arrayidx86, align 16
  %arrayidx87 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 18
  store i64 64, i64* %arrayidx87, align 16
  %arrayidx88 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 19
  store i64 255, i64* %arrayidx88, align 8
  %arrayidx89 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 19
  store i64 255, i64* %arrayidx89, align 8
  %arrayidx90 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 19
  store i64 255, i64* %arrayidx90, align 8
  %arrayidx91 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 20
  store i64 256, i64* %arrayidx91, align 16
  %arrayidx92 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 20
  store i64 256, i64* %arrayidx92, align 16
  %arrayidx93 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 20
  store i64 256, i64* %arrayidx93, align 16
  %arrayidx94 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 21
  store i64 4095, i64* %arrayidx94, align 8
  %arrayidx95 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 21
  store i64 4095, i64* %arrayidx95, align 8
  %arrayidx96 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 21
  store i64 4095, i64* %arrayidx96, align 8
  %arrayidx97 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 22
  store i64 4096, i64* %arrayidx97, align 16
  %arrayidx98 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 22
  store i64 4096, i64* %arrayidx98, align 16
  %arrayidx99 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 22
  store i64 4096, i64* %arrayidx99, align 16
  %arrayidx100 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 23
  store i64 65535, i64* %arrayidx100, align 8
  %arrayidx101 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 23
  store i64 65535, i64* %arrayidx101, align 8
  %arrayidx102 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 23
  store i64 65535, i64* %arrayidx102, align 8
  %arrayidx103 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 24
  store i64 65536, i64* %arrayidx103, align 16
  %arrayidx104 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 24
  store i64 65536, i64* %arrayidx104, align 16
  %arrayidx105 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 24
  store i64 65536, i64* %arrayidx105, align 16
  %arrayidx106 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 25
  store i64 262143, i64* %arrayidx106, align 8
  %arrayidx107 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 25
  store i64 262143, i64* %arrayidx107, align 8
  %arrayidx108 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 25
  store i64 262143, i64* %arrayidx108, align 8
  %arrayidx109 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 26
  store i64 262144, i64* %arrayidx109, align 16
  %arrayidx110 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 26
  store i64 262144, i64* %arrayidx110, align 16
  %arrayidx111 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 26
  store i64 262144, i64* %arrayidx111, align 16
  %arrayidx112 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 27
  store i64 1048575, i64* %arrayidx112, align 8
  %arrayidx113 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 27
  store i64 1048575, i64* %arrayidx113, align 8
  %arrayidx114 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 27
  store i64 1048575, i64* %arrayidx114, align 8
  %arrayidx115 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 28
  store i64 1048576, i64* %arrayidx115, align 16
  %arrayidx116 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 28
  store i64 1048576, i64* %arrayidx116, align 16
  %arrayidx117 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 28
  store i64 1048576, i64* %arrayidx117, align 16
  %arrayidx118 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 29
  store i64 16777215, i64* %arrayidx118, align 8
  %arrayidx119 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 29
  store i64 16777215, i64* %arrayidx119, align 8
  %arrayidx120 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 29
  store i64 16777215, i64* %arrayidx120, align 8
  %arrayidx121 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 30
  store i64 16777216, i64* %arrayidx121, align 16
  %arrayidx122 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 30
  store i64 16777216, i64* %arrayidx122, align 16
  %arrayidx123 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 30
  store i64 16777216, i64* %arrayidx123, align 16
  %arrayidx124 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 31
  store i64 268435455, i64* %arrayidx124, align 8
  %arrayidx125 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 31
  store i64 268435455, i64* %arrayidx125, align 8
  %arrayidx126 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 31
  store i64 268435455, i64* %arrayidx126, align 8
  %arrayidx127 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 32
  store i64 268435456, i64* %arrayidx127, align 16
  %arrayidx128 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 32
  store i64 268435456, i64* %arrayidx128, align 16
  %arrayidx129 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 32
  store i64 268435456, i64* %arrayidx129, align 16
  %arrayidx130 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 33
  store i64 1073741823, i64* %arrayidx130, align 8
  %arrayidx131 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 33
  store i64 1073741823, i64* %arrayidx131, align 8
  %arrayidx132 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 33
  store i64 1073741823, i64* %arrayidx132, align 8
  %arrayidx133 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 34
  store i64 1073741824, i64* %arrayidx133, align 16
  %arrayidx134 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 34
  store i64 1073741824, i64* %arrayidx134, align 16
  %arrayidx135 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 34
  store i64 1073741824, i64* %arrayidx135, align 16
  %flgm = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 10
  br label %for.body140

for.body140:                                      ; preds = %for.inc180.for.body140_crit_edge, %for.end30
  %tmp148 = phi i64 [ 0, %for.end30 ], [ %tmp148.pre, %for.inc180.for.body140_crit_edge ]
  %indvar = phi i64 [ 0, %for.end30 ], [ %indvar.next, %for.inc180.for.body140_crit_edge ]
  %arrayidx168 = getelementptr [39 x i64]* %x, i64 0, i64 %indvar
  %arrayidx143 = getelementptr [39 x i64]* @sec.g, i64 0, i64 %indvar
  %tmp144 = load i64* %arrayidx143, align 8
  %cmp149 = icmp eq i64 %tmp144, %tmp148
  br i1 %cmp149, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %for.body140
  %arrayidx157 = getelementptr [39 x i64]* %o, i64 0, i64 %indvar
  %tmp158 = load i64* %arrayidx157, align 8
  %cmp159 = icmp eq i64 %tmp148, %tmp158
  br i1 %cmp159, label %lor.lhs.false161, label %if.then

lor.lhs.false161:                                 ; preds = %lor.lhs.false
  %tmp169 = load i64* %arrayidx168, align 8
  %cmp170 = icmp eq i64 %tmp158, %tmp169
  br i1 %cmp170, label %for.inc180, label %if.then

if.then:                                          ; preds = %lor.lhs.false161, %lor.lhs.false, %for.body140
  %tmp173 = load i32* %flgm, align 4
  %cmp174 = icmp eq i32 %tmp173, 0
  br i1 %cmp174, label %for.inc180, label %if.then176

if.then176:                                       ; preds = %if.then
  %puts = call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @str, i64 0, i64 0))
  %puts6 = call i32 @puts(i8* getelementptr inbounds ([45 x i8]* @str1, i64 0, i64 0))
  br label %for.inc180

for.inc180:                                       ; preds = %lor.lhs.false161, %if.then, %if.then176
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 35
  br i1 %exitcond, label %if.end188, label %for.inc180.for.body140_crit_edge

for.inc180.for.body140_crit_edge:                 ; preds = %for.inc180
  %arrayidx147.phi.trans.insert = getelementptr [39 x i64]* %d, i64 0, i64 %indvar.next
  %tmp148.pre = load i64* %arrayidx147.phi.trans.insert, align 8
  br label %for.body140

if.end188:                                        ; preds = %for.inc180
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 9), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 10), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 11), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 12), align 4
  %call = tail call i32 @sec(%struct.defs* @main.d0)
  store i32 %call, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 13), align 4
  %tmp1 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4
  %add = add nsw i32 %tmp1, %call
  store i32 %add, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4
  %tmp3 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 9), align 4
  %cmp = icmp eq i32 %tmp3, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 0), i32 %call) nounwind
  %tmp6.pr = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %tmp6 = phi i32 [ %add, %entry ], [ %tmp6.pr, %if.then ]
  %cmp7 = icmp eq i32 %tmp6, 0
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str2, i64 0, i64 0))
  br label %if.end11

if.else:                                          ; preds = %if.end
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str3, i64 0, i64 0))
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then8
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @puts(i8* nocapture) nounwind
