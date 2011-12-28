; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-13-s757.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@svtest.k = internal unnamed_addr global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s757er = internal global [11 x i8] c"s757,er%d\0A\00", align 1
@sec.qs757 = internal global [8 x i8] c"s757   \00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@.str1 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@str = internal constant [21 x i8] c"\0ANo errors detected.\00"
@str1 = internal constant [9 x i8] c"\0AFailed.\00"

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
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %entry
  %indvar = phi i64 [ %indvar.next, %while.cond ], [ 0, %entry ]
  %incdec.ptr411 = getelementptr %struct.defs* %pd0, i64 0, i32 15, i64 %indvar
  %incdec.ptr10 = getelementptr [8 x i8]* @sec.qs757, i64 0, i64 %indvar
  %tmp2 = load i8* %incdec.ptr10, align 1
  store i8 %tmp2, i8* %incdec.ptr411, align 1
  %tobool = icmp eq i8 %tmp2, 0
  %indvar.next = add i64 %indvar, 1
  br i1 %tobool, label %for.cond.preheader, label %while.cond

for.cond.preheader:                               ; preds = %while.cond
  %ubits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 4
  %tmp1838 = load i32* %ubits, align 4
  %cmp1939 = icmp sgt i32 %tmp1838, 0
  br i1 %cmp1939, label %for.body38.lr.ph.us, label %if.end243

for.inc67.us:                                     ; preds = %if.end61.us
  %0 = add nsw i32 %3, 1
  %exitcond45 = icmp eq i32 %0, %tmp1838
  br i1 %exitcond45, label %for.end70, label %for.body38.lr.ph.us

if.end61.us:                                      ; preds = %if.then60.us, %lor.lhs.false48.us
  %tmp21417.us = phi i32 [ 1, %if.then60.us ], [ %tmp2141836.us, %lor.lhs.false48.us ]
  %shl63.us = shl i32 %shl632035.us, 1
  %shr65.us = lshr i32 %shr652134.us, 1
  %1 = add nsw i32 %2, 1
  %exitcond = icmp eq i32 %1, %smax
  br i1 %exitcond, label %for.inc67.us, label %for.body38.us

lor.lhs.false48.us:                               ; preds = %for.body38.us
  %and55.us = and i32 %shr652134.us, %shr27.us
  %cmp56.us = icmp eq i32 %and55.us, 0
  %cmp58.us = xor i1 %cmp41.us, %cmp56.us
  br i1 %cmp58.us, label %if.then60.us, label %if.end61.us

for.body38.us:                                    ; preds = %if.end61.us, %for.body38.lr.ph.us
  %2 = phi i32 [ 0, %for.body38.lr.ph.us ], [ %1, %if.end61.us ]
  %tmp2141836.us = phi i32 [ %tmp2141940.us, %for.body38.lr.ph.us ], [ %tmp21417.us, %if.end61.us ]
  %shl632035.us = phi i32 [ 1, %for.body38.lr.ph.us ], [ %shl63.us, %if.end61.us ]
  %shr652134.us = phi i32 [ %shl24.us, %for.body38.lr.ph.us ], [ %shr65.us, %if.end61.us ]
  %cmp41.us = icmp slt i32 %2, %3
  %and.us = and i32 %shl632035.us, %shl31.us
  %cmp44.us = icmp eq i32 %and.us, 0
  %cmp46.us = xor i1 %cmp41.us, %cmp44.us
  br i1 %cmp46.us, label %if.then60.us, label %lor.lhs.false48.us

if.then60.us:                                     ; preds = %for.body38.us, %lor.lhs.false48.us
  br label %if.end61.us

for.body38.lr.ph.us:                              ; preds = %for.inc67.us, %for.cond.preheader
  %3 = phi i32 [ %0, %for.inc67.us ], [ 0, %for.cond.preheader ]
  %tmp2141940.us = phi i32 [ %tmp21417.us, %for.inc67.us ], [ 0, %for.cond.preheader ]
  %shr27.us = lshr i32 -1, %3
  %shl31.us = shl i32 -1, %3
  %sub.us = add nsw i32 %tmp1838, -1
  %shl24.us = shl i32 1, %sub.us
  %tmp = icmp sgt i32 %tmp1838, 1
  %smax = select i1 %tmp, i32 %tmp1838, i32 1
  br label %for.body38.us

for.end70:                                        ; preds = %for.inc67.us
  %cmp72 = icmp eq i32 %tmp21417.us, 0
  br i1 %cmp72, label %if.end243, label %if.then74

if.then74:                                        ; preds = %for.end70
  %flgd78 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %tmp79 = load i32* %flgd78, align 4
  %cmp80 = icmp eq i32 %tmp79, 0
  br i1 %cmp80, label %if.end243, label %if.then82

if.then82:                                        ; preds = %if.then74
  %call83 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s757er, i64 0, i64 0), i32 2) nounwind
  br label %if.end243

if.end243:                                        ; preds = %for.cond.preheader, %for.end70, %if.then74, %if.then82
  %tmp2448 = phi i32 [ 2, %if.then82 ], [ 2, %if.then74 ], [ 0, %for.end70 ], [ 0, %for.cond.preheader ]
  ret i32 %tmp2448
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 9), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 10), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 11), align 4
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 12), align 4
  %call = tail call i32 @sec(%struct.defs* @main.d0) nounwind
  store i32 %call, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 13), align 4
  %tmp1 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4
  %add = add nsw i32 %tmp1, %call
  store i32 %add, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4
  %tmp3 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 9), align 4
  %cmp = icmp eq i32 %tmp3, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 0), i32 %call) nounwind
  %tmp6.pr = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %tmp6 = phi i32 [ %add, %entry ], [ %tmp6.pr, %if.then ]
  %cmp7 = icmp eq i32 %tmp6, 0
  br i1 %cmp7, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.end
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str, i64 0, i64 0))
  br label %if.end11

if.else:                                          ; preds = %if.end
  %puts1 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str1, i64 0, i64 0))
  br label %if.end11

if.end11:                                         ; preds = %if.else, %if.then8
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @puts(i8* nocapture) nounwind
