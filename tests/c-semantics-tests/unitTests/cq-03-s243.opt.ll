; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-03-s243.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@svtest.k = internal unnamed_addr global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s243er = internal global [11 x i8] c"s243,er%d\0A\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@.str = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@str = private unnamed_addr constant [21 x i8] c"\0ANo errors detected.\00"
@str3 = private unnamed_addr constant [9 x i8] c"\0AFailed.\00"

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

define i32 @sec(%struct.defs* nocapture %pd0) nounwind uwtable {
entry:
  %chars = alloca [256 x i8], align 16
  %arraydecay = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 0
  %incdec.ptr1 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 1
  store i8 115, i8* %arraydecay, align 1, !tbaa !0
  %incdec.ptr1.1 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 2
  store i8 50, i8* %incdec.ptr1, align 1, !tbaa !0
  %incdec.ptr1.2 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 3
  store i8 52, i8* %incdec.ptr1.1, align 1, !tbaa !0
  %incdec.ptr1.3 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 4
  store i8 51, i8* %incdec.ptr1.2, align 1, !tbaa !0
  %incdec.ptr1.4 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 5
  store i8 32, i8* %incdec.ptr1.3, align 1, !tbaa !0
  %incdec.ptr1.5 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 6
  store i8 32, i8* %incdec.ptr1.4, align 1, !tbaa !0
  %incdec.ptr1.6 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 7
  store i8 32, i8* %incdec.ptr1.5, align 1, !tbaa !0
  store i8 0, i8* %incdec.ptr1.6, align 1, !tbaa !0
  %arraydecay2 = getelementptr inbounds [256 x i8]* %chars, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %arraydecay2, i8 0, i64 256, i32 16, i1 false) nounwind
  %arrayidx = getelementptr inbounds [256 x i8]* %chars, i64 0, i64 97
  %arrayidx3 = getelementptr inbounds [256 x i8]* %chars, i64 0, i64 65
  %arrayidx20 = getelementptr inbounds [256 x i8]* %chars, i64 0, i64 37
  %arrayidx51 = getelementptr inbounds [256 x i8]* %chars, i64 0, i64 10
  store i8 1, i8* %arrayidx51, align 2, !tbaa !0
  %arrayidx54 = getelementptr inbounds [256 x i8]* %chars, i64 0, i64 9
  store i8 1, i8* %arrayidx54, align 1, !tbaa !0
  %arrayidx58 = getelementptr inbounds [256 x i8]* %chars, i64 0, i64 8
  store i8 1, i8* %arrayidx58, align 8, !tbaa !0
  %arrayidx62 = getelementptr inbounds [256 x i8]* %chars, i64 0, i64 13
  store i8 1, i8* %arrayidx62, align 1, !tbaa !0
  %arrayidx66 = getelementptr inbounds [256 x i8]* %chars, i64 0, i64 12
  store i8 1, i8* %arrayidx66, align 4, !tbaa !0
  store i8 1, i8* %arraydecay2, align 16, !tbaa !0
  %arrayidx88 = getelementptr inbounds [256 x i8]* %chars, i64 0, i64 32
  %lftr.limit.i = getelementptr [256 x i8]* %chars, i64 0, i64 256
  %0 = bitcast i8* %arrayidx88 to i32*
  store i32 16843009, i32* %0, align 16
  call void @llvm.memset.p0i8.i64(i8* %arrayidx20, i8 1, i64 27, i32 1, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %arrayidx3, i8 1, i64 31, i32 1, i1 false)
  call void @llvm.memset.p0i8.i64(i8* %arrayidx, i8 1, i64 30, i32 1, i1 false)
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.for.body.i_crit_edge, %entry
  %1 = phi i32 [ 1, %entry ], [ %phitmp, %for.body.i.for.body.i_crit_edge ]
  %p.02.i = phi i8* [ %arraydecay2, %entry ], [ %incdec.ptr.i, %for.body.i.for.body.i_crit_edge ]
  %total.01.i = phi i32 [ 0, %entry ], [ %add.i, %for.body.i.for.body.i_crit_edge ]
  %incdec.ptr.i = getelementptr inbounds i8* %p.02.i, i64 1
  %add.i = add nsw i32 %1, %total.01.i
  %exitcond.i = icmp eq i8* %incdec.ptr.i, %lftr.limit.i
  br i1 %exitcond.i, label %sumof.exit, label %for.body.i.for.body.i_crit_edge

for.body.i.for.body.i_crit_edge:                  ; preds = %for.body.i
  %.pre = load i8* %incdec.ptr.i, align 1, !tbaa !0
  %phitmp = sext i8 %.pre to i32
  br label %for.body.i

sumof.exit:                                       ; preds = %for.body.i
  %cmp = icmp eq i32 %add.i, 98
  br i1 %cmp, label %if.end104, label %if.then

if.then:                                          ; preds = %sumof.exit
  %flgd = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %2 = load i32* %flgd, align 4, !tbaa !2
  %cmp101 = icmp eq i32 %2, 0
  br i1 %cmp101, label %if.end104, label %if.then102

if.then102:                                       ; preds = %if.then
  %call103 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s243er, i64 0, i64 0), i32 1) nounwind
  br label %if.end104

if.end104:                                        ; preds = %if.then, %sumof.exit, %if.then102
  %rc.0 = phi i32 [ 1, %if.then102 ], [ 1, %if.then ], [ 0, %sumof.exit ]
  ret i32 %rc.0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
for.body.i.for.body.i_crit_edge.i.lr.ph:
  %chars.i = alloca [256 x i8], align 16
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 9), align 4, !tbaa !2
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 10), align 4, !tbaa !2
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 11), align 4, !tbaa !2
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 12), align 4, !tbaa !2
  %0 = getelementptr inbounds [256 x i8]* %chars.i, i64 0, i64 0
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  store i8 115, i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 0), align 4, !tbaa !0
  store i8 50, i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 1), align 1, !tbaa !0
  store i8 52, i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 2), align 2, !tbaa !0
  store i8 51, i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 3), align 1, !tbaa !0
  store i8 32, i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 4), align 4, !tbaa !0
  store i8 32, i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 5), align 1, !tbaa !0
  store i8 32, i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 6), align 2, !tbaa !0
  store i8 0, i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 7), align 1, !tbaa !0
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 256, i32 16, i1 false) nounwind
  %arrayidx.i = getelementptr inbounds [256 x i8]* %chars.i, i64 0, i64 97
  %arrayidx3.i = getelementptr inbounds [256 x i8]* %chars.i, i64 0, i64 65
  %arrayidx20.i = getelementptr inbounds [256 x i8]* %chars.i, i64 0, i64 37
  %arrayidx51.i = getelementptr inbounds [256 x i8]* %chars.i, i64 0, i64 10
  store i8 1, i8* %arrayidx51.i, align 2, !tbaa !0
  %arrayidx54.i = getelementptr inbounds [256 x i8]* %chars.i, i64 0, i64 9
  store i8 1, i8* %arrayidx54.i, align 1, !tbaa !0
  %arrayidx58.i = getelementptr inbounds [256 x i8]* %chars.i, i64 0, i64 8
  store i8 1, i8* %arrayidx58.i, align 8, !tbaa !0
  %arrayidx62.i = getelementptr inbounds [256 x i8]* %chars.i, i64 0, i64 13
  store i8 1, i8* %arrayidx62.i, align 1, !tbaa !0
  %arrayidx66.i = getelementptr inbounds [256 x i8]* %chars.i, i64 0, i64 12
  store i8 1, i8* %arrayidx66.i, align 4, !tbaa !0
  store i8 1, i8* %0, align 16, !tbaa !0
  %arrayidx88.i = getelementptr inbounds [256 x i8]* %chars.i, i64 0, i64 32
  %lftr.limit.i.i = getelementptr [256 x i8]* %chars.i, i64 0, i64 256
  %1 = bitcast i8* %arrayidx88.i to i32*
  store i32 16843009, i32* %1, align 16
  call void @llvm.memset.p0i8.i64(i8* %arrayidx20.i, i8 1, i64 27, i32 1, i1 false) nounwind
  call void @llvm.memset.p0i8.i64(i8* %arrayidx3.i, i8 1, i64 31, i32 1, i1 false) nounwind
  call void @llvm.memset.p0i8.i64(i8* %arrayidx.i, i8 1, i64 30, i32 1, i1 false) nounwind
  %incdec.ptr.i.i8 = getelementptr inbounds [256 x i8]* %chars.i, i64 0, i64 1
  br label %for.body.i.for.body.i_crit_edge.i

for.body.i.for.body.i_crit_edge.i:                ; preds = %for.body.i.for.body.i_crit_edge.i.for.body.i.for.body.i_crit_edge.i_crit_edge, %for.body.i.for.body.i_crit_edge.i.lr.ph
  %.pre.i = phi i32 [ 0, %for.body.i.for.body.i_crit_edge.i.lr.ph ], [ %phitmp14, %for.body.i.for.body.i_crit_edge.i.for.body.i.for.body.i_crit_edge.i_crit_edge ]
  %add.i.i11 = phi i32 [ 1, %for.body.i.for.body.i_crit_edge.i.lr.ph ], [ %add.i.i, %for.body.i.for.body.i_crit_edge.i.for.body.i.for.body.i_crit_edge.i_crit_edge ]
  %incdec.ptr.i.i10 = phi i8* [ %incdec.ptr.i.i8, %for.body.i.for.body.i_crit_edge.i.lr.ph ], [ %incdec.ptr.i.i, %for.body.i.for.body.i_crit_edge.i.for.body.i.for.body.i_crit_edge.i_crit_edge ]
  %incdec.ptr.i.i = getelementptr inbounds i8* %incdec.ptr.i.i10, i64 1
  %add.i.i = add nsw i32 %add.i.i11, %.pre.i
  %exitcond.i.i = icmp eq i8* %incdec.ptr.i.i, %lftr.limit.i.i
  br i1 %exitcond.i.i, label %sumof.exit.i, label %for.body.i.for.body.i_crit_edge.i.for.body.i.for.body.i_crit_edge.i_crit_edge

for.body.i.for.body.i_crit_edge.i.for.body.i.for.body.i_crit_edge.i_crit_edge: ; preds = %for.body.i.for.body.i_crit_edge.i
  %.pre.i.pre = load i8* %incdec.ptr.i.i, align 1, !tbaa !0
  %phitmp14 = sext i8 %.pre.i.pre to i32
  br label %for.body.i.for.body.i_crit_edge.i

sumof.exit.i:                                     ; preds = %for.body.i.for.body.i_crit_edge.i
  %phitmp = icmp eq i32 %add.i.i, 98
  br i1 %phitmp, label %sec.exit.thread, label %sec.exit

sec.exit.thread:                                  ; preds = %sumof.exit.i
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  store i32 0, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 13), align 4, !tbaa !2
  br label %if.then

sec.exit:                                         ; preds = %sumof.exit.i
  %call103.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @sec.s243er, i64 0, i64 0), i32 1) nounwind
  %.pre = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 9), align 4, !tbaa !2
  %phitmp15 = icmp eq i32 %.pre, 0
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 13), align 4, !tbaa !2
  %2 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4, !tbaa !2
  %add = add nsw i32 %2, 1
  store i32 %add, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4, !tbaa !2
  br i1 %phitmp15, label %if.end, label %if.then

if.then:                                          ; preds = %sec.exit.thread, %sec.exit
  %3 = phi i32 [ 0, %sec.exit.thread ], [ 1, %sec.exit ]
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 0), i32 %3) nounwind
  %.pr = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4, !tbaa !2
  br label %if.end

if.end:                                           ; preds = %sec.exit, %if.then
  %4 = phi i32 [ %add, %sec.exit ], [ %.pr, %if.then ]
  %cmp2 = icmp eq i32 %4, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %puts = call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str, i64 0, i64 0))
  br label %if.end6

if.else:                                          ; preds = %if.end
  %puts7 = call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str3, i64 0, i64 0))
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
!3 = metadata !{metadata !"float", metadata !0}
