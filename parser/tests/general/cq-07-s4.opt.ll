; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-07-s4.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@svtest.k = internal unnamed_addr global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s4er = internal global [9 x i8] c"s4,er%d\0A\00", align 1
@sec.qs4 = internal global [8 x i8] c"s4     \00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@.str = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
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
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.cond.i, %entry
  %indvar17.i = phi i64 [ %indvar.next18.i, %while.cond.i ], [ 0, %entry ]
  %incdec.ptr1.i = getelementptr [8 x i8]* @setupTable.qs26, i64 0, i64 %indvar17.i
  %incdec.ptr42.i = getelementptr %struct.defs* %pd0, i64 0, i32 15, i64 %indvar17.i
  %tmp2.i = load i8* %incdec.ptr1.i, align 1
  store i8 %tmp2.i, i8* %incdec.ptr42.i, align 1
  %tobool.i = icmp eq i8 %tmp2.i, 0
  %indvar.next18.i = add i64 %indvar17.i, 1
  br i1 %tobool.i, label %while.end.i, label %while.cond.i

while.end.i:                                      ; preds = %while.cond.i
  %cbits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 0
  store i32 8, i32* %cbits.i, align 4
  %ibits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 1
  store i32 32, i32* %ibits.i, align 4
  %sbits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 2
  store i32 16, i32* %sbits.i, align 4
  %lbits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 3
  store i32 64, i32* %lbits.i, align 4
  %ubits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 4
  store i32 32, i32* %ubits.i, align 4
  %fbits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 5
  store i32 32, i32* %fbits.i, align 4
  %dbits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 6
  store i32 64, i32* %dbits.i, align 4
  %fprec.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 7
  store float 0x3E80000000000000, float* %fprec.i, align 4
  br label %while.body85.i

while.body85.i:                                   ; preds = %while.body85.i, %while.end.i
  %indvar.i = phi i32 [ 0, %while.end.i ], [ %0, %while.body85.i ]
  %tmp9559.i = phi float [ 1.000000e+00, %while.end.i ], [ %conv93.i, %while.body85.i ]
  %conv93.i = fmul float %tmp9559.i, 5.000000e-01
  %0 = add i32 %indvar.i, 1
  %exitcond35 = icmp eq i32 %0, 54
  br i1 %exitcond35, label %setupTable.exit, label %while.body85.i

setupTable.exit:                                  ; preds = %while.body85.i
  %conv98.i = fmul float %conv93.i, 4.000000e+00
  %dprec.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 8
  store float %conv98.i, float* %dprec.i, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %setupTable.exit
  %indvar33 = phi i64 [ %indvar.next34, %while.cond ], [ 0, %setupTable.exit ]
  %incdec.ptr145 = getelementptr %struct.defs* %pd0, i64 0, i32 15, i64 %indvar33
  %incdec.ptr4 = getelementptr [8 x i8]* @sec.qs4, i64 0, i64 %indvar33
  %tmp12 = load i8* %incdec.ptr4, align 1
  store i8 %tmp12, i8* %incdec.ptr145, align 1
  %tobool = icmp eq i8 %tmp12, 0
  %indvar.next34 = add i64 %indvar33, 1
  br i1 %tobool, label %sw.bb1.i.1, label %while.cond

for.body46.lr.ph:                                 ; preds = %for.inc.2
  %tmp28 = shl nsw i64 %conv4318, 2
  %tmp29 = icmp ugt i64 %tmp28, 1
  %umax = select i1 %tmp29, i64 %tmp28, i64 1
  br label %for.body46

for.body46:                                       ; preds = %for.body46, %for.body46.lr.ph
  %indvar = phi i64 [ 0, %for.body46.lr.ph ], [ %indvar.next, %for.body46 ]
  %tmp571022 = phi i32 [ -1, %for.body46.lr.ph ], [ %shr, %for.body46 ]
  %and1121 = phi i32 [ 1, %for.body46.lr.ph ], [ %and, %for.body46 ]
  %and = and i32 %tmp571022, %and1121
  %shr = lshr i32 %tmp571022, 1
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %umax
  br i1 %exitcond, label %for.end53, label %for.body46

for.end53:                                        ; preds = %for.body46
  %phitmp = icmp eq i32 %and, 1
  %phitmp27 = icmp eq i32 %shr, 0
  %or.cond = and i1 %phitmp, %phitmp27
  br i1 %or.cond, label %if.end71, label %if.then60

if.then60:                                        ; preds = %for.inc.2, %for.end53
  %add6239 = or i32 %tmp728.2, 8
  %tmp65 = load i32* %flgd, align 4
  %cmp66 = icmp eq i32 %tmp65, 0
  br i1 %cmp66, label %if.end71, label %if.then68

if.then68:                                        ; preds = %if.then60
  %call69 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @sec.s4er, i64 0, i64 0), i32 8) nounwind
  br label %if.end71

if.end71:                                         ; preds = %for.end53, %if.then68, %if.then60
  %tmp726 = phi i32 [ %add6239, %if.then68 ], [ %add6239, %if.then60 ], [ %tmp728.2, %for.end53 ]
  ret i32 %tmp726

if.then23.1:                                      ; preds = %if.then.1
  br label %svtest.exit.2

if.then.1:                                        ; preds = %sw.bb1.i.1
  br i1 undef, label %svtest.exit.2, label %if.then23.1

sw.bb1.i.1:                                       ; preds = %while.cond
  %flgd = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  store i32 1978, i32* @svtest.k, align 4
  br i1 true, label %svtest.exit.2.thread, label %if.then.1

svtest.exit.2.thread:                             ; preds = %sw.bb1.i.1
  store i32 1929, i32* @svtest.k, align 4
  br label %for.inc.2

for.inc.2:                                        ; preds = %svtest.exit.2.thread, %svtest.exit.2, %if.then.2, %if.then23.2
  %tmp728.2 = phi i32 [ 1, %svtest.exit.2 ], [ 1, %if.then.2 ], [ 1, %if.then23.2 ], [ 0, %svtest.exit.2.thread ]
  store i32 1066, i32* @extvar, align 4
  %tmp4217 = load i32* %cbits.i, align 4
  %conv4318 = sext i32 %tmp4217 to i64
  %mul19.mask = and i64 %conv4318, 4611686018427387903
  %cmp4420 = icmp eq i64 %mul19.mask, 0
  br i1 %cmp4420, label %if.then60, label %for.body46.lr.ph

if.then23.2:                                      ; preds = %if.then.2
  br label %for.inc.2

if.then.2:                                        ; preds = %svtest.exit.2
  br i1 undef, label %for.inc.2, label %if.then23.2

svtest.exit.2:                                    ; preds = %if.then23.1, %if.then.1
  br i1 undef, label %for.inc.2, label %if.then.2
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
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 0), i32 %call) nounwind
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
