; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-09-s626.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@svtest.k = internal unnamed_addr global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s626er = internal global [11 x i8] c"s626,er%d\0A\00", align 1
@.str = private unnamed_addr constant [8 x i8] c"   key=\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@.str3 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@str = private unnamed_addr constant [21 x i8] c"\0ANo errors detected.\00"
@str6 = private unnamed_addr constant [9 x i8] c"\0AFailed.\00"

define i64 @pow2(i64 %n) nounwind uwtable readnone {
entry:
  %tobool1 = icmp eq i64 %n, 0
  br i1 %tobool1, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %n.addr.03 = phi i64 [ %dec, %while.body ], [ %n, %entry ]
  %s.02 = phi i64 [ %mul, %while.body ], [ 1, %entry ]
  %dec = add nsw i64 %n.addr.03, -1
  %mul = shl nsw i64 %s.02, 1
  %tobool = icmp eq i64 %dec, 0
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  %s.0.lcssa = phi i64 [ 1, %entry ], [ %mul, %while.body ]
  ret i64 %s.0.lcssa
}

define void @zerofill(i8* nocapture %x) nounwind uwtable {
entry:
  call void @llvm.memset.p0i8.i64(i8* %x, i8 0, i64 256, i32 1, i1 false)
  ret void
}

define i32 @sumof(i8* nocapture %x) nounwind uwtable readonly {
entry:
  %lftr.limit = getelementptr i8* %x, i64 256
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %p.02 = phi i8* [ %x, %entry ], [ %incdec.ptr, %for.body ]
  %total.01 = phi i32 [ 0, %entry ], [ %add, %for.body ]
  %incdec.ptr = getelementptr inbounds i8* %p.02, i64 1
  %0 = load i8* %p.02, align 1, !tbaa !0
  %conv = sext i8 %0 to i32
  %add = add nsw i32 %conv, %total.01
  %exitcond = icmp eq i8* %incdec.ptr, %lftr.limit
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  ret i32 %add
}

define i32 @setupTable(%struct.defs* nocapture %pd0) nounwind uwtable {
entry:
  %arraydecay = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 0
  %incdec.ptr1 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 1
  store i8 115, i8* %arraydecay, align 1, !tbaa !0
  %incdec.ptr1.1 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 2
  store i8 50, i8* %incdec.ptr1, align 1, !tbaa !0
  %incdec.ptr1.2 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 3
  store i8 54, i8* %incdec.ptr1.1, align 1, !tbaa !0
  %incdec.ptr1.3 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 4
  store i8 32, i8* %incdec.ptr1.2, align 1, !tbaa !0
  %incdec.ptr1.4 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 5
  store i8 32, i8* %incdec.ptr1.3, align 1, !tbaa !0
  %incdec.ptr1.5 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 6
  store i8 32, i8* %incdec.ptr1.4, align 1, !tbaa !0
  %incdec.ptr1.6 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 7
  store i8 32, i8* %incdec.ptr1.5, align 1, !tbaa !0
  store i8 0, i8* %incdec.ptr1.6, align 1, !tbaa !0
  %cbits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 0
  store i32 8, i32* %cbits, align 4
  %ibits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 1
  store i32 32, i32* %ibits, align 4, !tbaa !2
  %sbits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 2
  store i32 16, i32* %sbits, align 4, !tbaa !2
  %lbits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 3
  store i32 64, i32* %lbits, align 4, !tbaa !2
  %ubits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 4
  store i32 32, i32* %ubits, align 4, !tbaa !2
  %fbits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 5
  store i32 32, i32* %fbits, align 4, !tbaa !2
  %dbits = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 6
  store i32 64, i32* %dbits, align 4, !tbaa !2
  %fprec = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 7
  store float 0x3E80000000000000, float* %fprec, align 4, !tbaa !3
  br label %while.body48

while.body48:                                     ; preds = %entry, %while.body48
  %delta.161 = phi double [ 1.000000e+00, %entry ], [ %phitmp60, %while.body48 ]
  %add50 = fadd double %delta.161, 1.000000e+00
  %div52 = fmul double %delta.161, 5.000000e-01
  %conv53 = fptrunc double %div52 to float
  %phitmp59 = fcmp une double %add50, 1.000000e+00
  %phitmp60 = fpext float %conv53 to double
  br i1 %phitmp59, label %while.body48, label %while.end54

while.end54:                                      ; preds = %while.body48
  %conv57 = fmul float %conv53, 4.000000e+00
  %dprec = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 8
  store float %conv57, float* %dprec, align 4, !tbaa !3
  ret i32 0
}

define i32 @svtest(i32 %n) nounwind uwtable {
entry:
  switch i32 %n, label %sw.epilog [
    i32 0, label %sw.bb
    i32 1, label %sw.bb1
    i32 2, label %sw.bb2
  ]

sw.bb:                                            ; preds = %entry
  store i32 1978, i32* @svtest.k, align 4, !tbaa !2
  br label %sw.epilog

sw.bb1:                                           ; preds = %entry
  %0 = load i32* @svtest.k, align 4, !tbaa !2
  %cmp = icmp eq i32 %0, 1978
  br i1 %cmp, label %if.else, label %sw.epilog

if.else:                                          ; preds = %sw.bb1
  store i32 1929, i32* @svtest.k, align 4, !tbaa !2
  br label %sw.epilog

sw.bb2:                                           ; preds = %entry
  %1 = load i32* @svtest.k, align 4, !tbaa !2
  %not.cmp3 = icmp ne i32 %1, 1929
  %. = zext i1 %not.cmp3 to i32
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb2, %sw.bb1, %if.else, %entry, %sw.bb
  %rc.0 = phi i32 [ undef, %entry ], [ 0, %if.else ], [ 0, %sw.bb ], [ 1, %sw.bb1 ], [ %., %sw.bb2 ]
  ret i32 %rc.0
}

define i32 @zero() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @testev() nounwind uwtable readonly {
entry:
  %0 = load i32* @extvar, align 4, !tbaa !2
  %not.cmp = icmp ne i32 %0, 1066
  %. = zext i1 %not.cmp to i32
  ret i32 %.
}

define void @setev() nounwind uwtable {
entry:
  store i32 1066, i32* @extvar, align 4, !tbaa !2
  ret void
}

define i32 @McCarthy(i32 %x) nounwind uwtable readnone {
entry:
  %cmp2 = icmp sgt i32 %x, 100
  br i1 %cmp2, label %if.then, label %if.else

if.then:                                          ; preds = %if.else, %entry
  %x.tr.lcssa = phi i32 [ %x, %entry ], [ %call, %if.else ]
  %sub = add nsw i32 %x.tr.lcssa, -10
  ret i32 %sub

if.else:                                          ; preds = %entry, %if.else
  %x.tr3 = phi i32 [ %call, %if.else ], [ %x, %entry ]
  %add = add nsw i32 %x.tr3, 11
  %call = tail call i32 @McCarthy(i32 %add) nounwind
  %cmp = icmp sgt i32 %call, 100
  br i1 %cmp, label %if.then, label %if.else
}

define i32 @clobber(i32 %x, i32* nocapture %y) nounwind uwtable {
entry:
  store i32 2, i32* %y, align 4, !tbaa !2
  ret i32 0
}

define i32 @sec(%struct.defs* %pd0) nounwind uwtable {
entry:
  %t = alloca [28 x i8], align 16
  %arraydecay.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 0
  %incdec.ptr1.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 1
  store i8 115, i8* %arraydecay.i, align 1, !tbaa !0
  %incdec.ptr1.1.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 2
  store i8 50, i8* %incdec.ptr1.i, align 1, !tbaa !0
  %incdec.ptr1.2.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 3
  store i8 54, i8* %incdec.ptr1.1.i, align 1, !tbaa !0
  %incdec.ptr1.6.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 7
  %0 = bitcast i8* %incdec.ptr1.2.i to i32*
  store i32 538976288, i32* %0, align 1
  store i8 0, i8* %incdec.ptr1.6.i, align 1, !tbaa !0
  %cbits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 0
  store i32 8, i32* %cbits.i, align 4
  %ibits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 1
  store i32 32, i32* %ibits.i, align 4, !tbaa !2
  %sbits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 2
  store i32 16, i32* %sbits.i, align 4, !tbaa !2
  %lbits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 3
  store i32 64, i32* %lbits.i, align 4, !tbaa !2
  %ubits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 4
  store i32 32, i32* %ubits.i, align 4, !tbaa !2
  %fbits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 5
  store i32 32, i32* %fbits.i, align 4, !tbaa !2
  %dbits.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 6
  store i32 64, i32* %dbits.i, align 4, !tbaa !2
  %fprec.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 7
  store float 0x3E80000000000000, float* %fprec.i, align 4, !tbaa !3
  br label %while.body48.i

while.body48.i:                                   ; preds = %while.body48.i, %entry
  %delta.161.i = phi double [ 1.000000e+00, %entry ], [ %phitmp60.i, %while.body48.i ]
  %add50.i = fadd double %delta.161.i, 1.000000e+00
  %div52.i = fmul double %delta.161.i, 5.000000e-01
  %conv53.i = fptrunc double %div52.i to float
  %phitmp59.i = fcmp une double %add50.i, 1.000000e+00
  %phitmp60.i = fpext float %conv53.i to double
  br i1 %phitmp59.i, label %while.body48.i, label %setupTable.exit

setupTable.exit:                                  ; preds = %while.body48.i
  %t294 = getelementptr inbounds [28 x i8]* %t, i64 0, i64 0
  %conv57.i = fmul float %conv53.i, 4.000000e+00
  %dprec.i = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 8
  store float %conv57.i, float* %dprec.i, align 4, !tbaa !3
  %incdec.ptr1 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 1
  store i8 115, i8* %arraydecay.i, align 1, !tbaa !0
  %incdec.ptr1.1 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 2
  store i8 54, i8* %incdec.ptr1, align 1, !tbaa !0
  %incdec.ptr1.2 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 3
  store i8 50, i8* %incdec.ptr1.1, align 1, !tbaa !0
  %incdec.ptr1.3 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 4
  store i8 54, i8* %incdec.ptr1.2, align 1, !tbaa !0
  %incdec.ptr1.4 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 5
  store i8 32, i8* %incdec.ptr1.3, align 1, !tbaa !0
  %incdec.ptr1.5 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 6
  store i8 32, i8* %incdec.ptr1.4, align 1, !tbaa !0
  %incdec.ptr1.6 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 7
  store i8 32, i8* %incdec.ptr1.5, align 1, !tbaa !0
  store i8 0, i8* %incdec.ptr1.6, align 1, !tbaa !0
  %1 = load i32* %lbits.i, align 4, !tbaa !2
  %sub279 = add nsw i32 %1, -2
  %cmp280 = icmp sgt i32 %sub279, 0
  br i1 %cmp280, label %for.body, label %for.end

for.body:                                         ; preds = %setupTable.exit, %for.body
  %j.0283 = phi i32 [ %inc, %for.body ], [ 0, %setupTable.exit ]
  %f1.0282 = phi float [ %mul, %for.body ], [ 1.000000e+00, %setupTable.exit ]
  %lint2.0281 = phi i64 [ %or, %for.body ], [ 1, %setupTable.exit ]
  %mul = fmul float %f1.0282, 2.000000e+00
  %shl = shl i64 %lint2.0281, 1
  %or = or i64 %shl, 1
  %inc = add nsw i32 %j.0283, 1
  %cmp = icmp slt i32 %inc, %sub279
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.body
  %phitmp285 = sitofp i64 %or to float
  br label %for.end

for.end:                                          ; preds = %for.cond.for.end_crit_edge, %setupTable.exit
  %f1.0.lcssa = phi float [ %mul, %for.cond.for.end_crit_edge ], [ 1.000000e+00, %setupTable.exit ]
  %lint2.0.lcssa = phi float [ %phitmp285, %for.cond.for.end_crit_edge ], [ 1.000000e+00, %setupTable.exit ]
  %sub2 = fsub float %f1.0.lcssa, %lint2.0.lcssa
  %div = fdiv float %sub2, %f1.0.lcssa
  %conv3 = fpext float %div to double
  %2 = load float* %fprec.i, align 4, !tbaa !3
  %conv4 = fpext float %2 to double
  %mul5 = fmul double %conv4, 2.000000e+00
  %cmp6 = fcmp ogt double %conv3, %mul5
  br i1 %cmp6, label %if.then, label %if.end12

if.then:                                          ; preds = %for.end
  %flgd = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %3 = load i32* %flgd, align 4, !tbaa !2
  %cmp8 = icmp eq i32 %3, 0
  br i1 %cmp8, label %if.end12, label %if.then10

if.then10:                                        ; preds = %if.then
  %call11 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s626er, i64 0, i64 0), i32 2) nounwind
  br label %if.end12

if.end12:                                         ; preds = %if.then, %if.then10, %for.end
  %rc.0 = phi i32 [ 2, %if.then10 ], [ 2, %if.then ], [ 0, %for.end ]
  call void @llvm.memset.p0i8.i64(i8* %t294, i8 0, i64 28, i32 16, i1 false)
  br label %for.body227

for.body227:                                      ; preds = %for.body227, %if.end12
  %indvars.iv286 = phi i64 [ 0, %if.end12 ], [ %indvars.iv.next287, %for.body227 ]
  %t0.0276 = phi i32 [ 0, %if.end12 ], [ %phitmp, %for.body227 ]
  %arrayidx230 = getelementptr inbounds [28 x i8]* %t, i64 0, i64 %indvars.iv286
  %4 = load i8* %arrayidx230, align 1, !tbaa !0
  %conv231273 = zext i8 %4 to i32
  %add232 = add nsw i32 %conv231273, %t0.0276
  %indvars.iv.next287 = add i64 %indvars.iv286, 1
  %sext = shl i32 %add232, 24
  %phitmp = ashr exact i32 %sext, 24
  %lftr.wideiv288 = trunc i64 %indvars.iv.next287 to i32
  %exitcond289 = icmp eq i32 %lftr.wideiv288, 28
  br i1 %exitcond289, label %for.end236, label %for.body227

for.end236:                                       ; preds = %for.body227
  %cmp238 = icmp eq i32 %phitmp, 0
  br i1 %cmp238, label %if.end272, label %if.then240

if.then240:                                       ; preds = %for.end236
  %add241274 = or i32 %rc.0, 4
  %flgd242 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %5 = load i32* %flgd242, align 4, !tbaa !2
  %cmp243 = icmp eq i32 %5, 0
  br i1 %cmp243, label %if.end272, label %if.then245

if.then245:                                       ; preds = %if.then240
  %call246 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s626er, i64 0, i64 0), i32 4) nounwind
  %call247 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0)) nounwind
  br label %for.body251

for.body251:                                      ; preds = %for.body251, %if.then245
  %indvars.iv = phi i64 [ 0, %if.then245 ], [ %indvars.iv.next, %for.body251 ]
  %arrayidx253 = getelementptr inbounds [28 x i8]* %t, i64 0, i64 %indvars.iv
  %6 = load i8* %arrayidx253, align 1, !tbaa !0
  %conv254 = sext i8 %6 to i32
  %call255 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([3 x i8]* @.str1, i64 0, i64 0), i32 %conv254) nounwind
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 28
  br i1 %exitcond, label %for.end258, label %for.body251

for.end258:                                       ; preds = %for.body251
  %putchar = call i32 @putchar(i32 10) nounwind
  br label %if.end272

if.end272:                                        ; preds = %for.end258, %for.end236, %if.then240
  %rc.1 = phi i32 [ %add241274, %for.end258 ], [ %add241274, %if.then240 ], [ %rc.0, %for.end236 ]
  ret i32 %rc.1
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 9), align 4, !tbaa !2
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 10), align 4, !tbaa !2
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 11), align 4, !tbaa !2
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 12), align 4, !tbaa !2
  %call = tail call i32 @sec(%struct.defs* @main.d0) nounwind
  store i32 %call, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 13), align 4, !tbaa !2
  %0 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4, !tbaa !2
  %add = add nsw i32 %0, %call
  store i32 %add, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4, !tbaa !2
  %1 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 9), align 4, !tbaa !2
  %cmp = icmp eq i32 %1, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str3, i64 0, i64 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 0), i32 %call) nounwind
  %.pr = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4, !tbaa !2
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %2 = phi i32 [ %add, %entry ], [ %.pr, %if.then ]
  %cmp2 = icmp eq i32 %2, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str, i64 0, i64 0))
  br label %if.end6

if.else:                                          ; preds = %if.end
  %puts7 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str6, i64 0, i64 0))
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @putchar(i32)

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
!3 = metadata !{metadata !"float", metadata !0}
