; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-02-s241.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@svtest.k = internal unnamed_addr global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.g = internal unnamed_addr global [39 x i64] [i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 6, i64 0, i64 8, i64 0, i64 12, i64 0, i64 16, i64 0, i64 18, i64 0, i64 20, i64 0, i64 24, i64 0, i64 28, i64 0, i64 30, i64 0, i64 32, i64 0, i64 36], align 16
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@.str2 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@str = private unnamed_addr constant [47 x i8] c"Decimal and octal/hex constants sometimes give\00"
@str5 = private unnamed_addr constant [45 x i8] c"   different results when assigned to longs.\00"
@str6 = private unnamed_addr constant [21 x i8] c"\0ANo errors detected.\00"
@str7 = private unnamed_addr constant [9 x i8] c"\0AFailed.\00"

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
  %d = alloca [39 x i64], align 16
  %o = alloca [39 x i64], align 16
  %x = alloca [39 x i64], align 16
  %arraydecay = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 0
  %incdec.ptr1 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 1
  store i8 115, i8* %arraydecay, align 1, !tbaa !0
  %incdec.ptr1.1 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 2
  store i8 50, i8* %incdec.ptr1, align 1, !tbaa !0
  %incdec.ptr1.2 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 3
  store i8 52, i8* %incdec.ptr1.1, align 1, !tbaa !0
  %incdec.ptr1.3 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 4
  store i8 49, i8* %incdec.ptr1.2, align 1, !tbaa !0
  %incdec.ptr1.4 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 5
  store i8 32, i8* %incdec.ptr1.3, align 1, !tbaa !0
  %incdec.ptr1.5 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 6
  store i8 32, i8* %incdec.ptr1.4, align 1, !tbaa !0
  %incdec.ptr1.6 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 7
  store i8 32, i8* %incdec.ptr1.5, align 1, !tbaa !0
  store i8 0, i8* %incdec.ptr1.6, align 1, !tbaa !0
  store i64 0, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 0), align 16, !tbaa !4
  store i64 1, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 1), align 8, !tbaa !4
  store i64 2, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 2), align 16, !tbaa !4
  store i64 3, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 3), align 8, !tbaa !4
  store i64 4, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 4), align 16, !tbaa !4
  store i64 5, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 5), align 8, !tbaa !4
  store i64 6, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 6), align 16, !tbaa !4
  store i64 7, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 7), align 8, !tbaa !4
  store i64 8, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 8), align 16, !tbaa !4
  store i64 9, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 9), align 8, !tbaa !4
  store i64 10, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 10), align 16, !tbaa !4
  store i64 11, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 11), align 8, !tbaa !4
  store i64 12, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 12), align 16, !tbaa !4
  store i64 13, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 13), align 8, !tbaa !4
  store i64 14, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 14), align 16, !tbaa !4
  store i64 15, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 15), align 8, !tbaa !4
  store i64 16, i64* getelementptr inbounds ([39 x i64]* @sec.g, i64 0, i64 16), align 16, !tbaa !4
  br label %for.body5

for.body5:                                        ; preds = %entry, %pow2.exit
  %indvars.iv161 = phi i64 [ 18, %entry ], [ %indvars.iv.next162, %pow2.exit ]
  %arrayidx7 = getelementptr inbounds [39 x i64]* @sec.g, i64 0, i64 %indvars.iv161
  %0 = load i64* %arrayidx7, align 16, !tbaa !4
  %tobool1.i = icmp eq i64 %0, 0
  br i1 %tobool1.i, label %pow2.exit, label %while.body.i

while.body.i:                                     ; preds = %for.body5, %while.body.i
  %n.addr.03.i = phi i64 [ %dec.i, %while.body.i ], [ %0, %for.body5 ]
  %s.02.i = phi i64 [ %mul.i, %while.body.i ], [ 1, %for.body5 ]
  %dec.i = add nsw i64 %n.addr.03.i, -1
  %mul.i = shl nsw i64 %s.02.i, 1
  %tobool.i = icmp eq i64 %dec.i, 0
  br i1 %tobool.i, label %pow2.exit, label %while.body.i

pow2.exit:                                        ; preds = %while.body.i, %for.body5
  %s.0.lcssa.i = phi i64 [ 1, %for.body5 ], [ %mul.i, %while.body.i ]
  store i64 %s.0.lcssa.i, i64* %arrayidx7, align 16, !tbaa !4
  %sub = add nsw i64 %s.0.lcssa.i, -1
  %1 = add nsw i64 %indvars.iv161, -1
  %arrayidx14 = getelementptr inbounds [39 x i64]* @sec.g, i64 0, i64 %1
  store i64 %sub, i64* %arrayidx14, align 8, !tbaa !4
  %indvars.iv.next162 = add i64 %indvars.iv161, 2
  %2 = trunc i64 %indvars.iv.next162 to i32
  %cmp3 = icmp slt i32 %2, 35
  br i1 %cmp3, label %for.body5, label %for.end15

for.end15:                                        ; preds = %pow2.exit
  %arrayidx16 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 0
  store i64 0, i64* %arrayidx16, align 16, !tbaa !4
  %arrayidx17 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 0
  store i64 0, i64* %arrayidx17, align 16, !tbaa !4
  %arrayidx18 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 0
  store i64 0, i64* %arrayidx18, align 16, !tbaa !4
  %arrayidx19 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 1
  store i64 1, i64* %arrayidx19, align 8, !tbaa !4
  %arrayidx20 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 1
  store i64 1, i64* %arrayidx20, align 8, !tbaa !4
  %arrayidx21 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 1
  store i64 1, i64* %arrayidx21, align 8, !tbaa !4
  %arrayidx22 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 2
  store i64 2, i64* %arrayidx22, align 16, !tbaa !4
  %arrayidx23 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 2
  store i64 2, i64* %arrayidx23, align 16, !tbaa !4
  %arrayidx24 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 2
  store i64 2, i64* %arrayidx24, align 16, !tbaa !4
  %arrayidx25 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 3
  store i64 3, i64* %arrayidx25, align 8, !tbaa !4
  %arrayidx26 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 3
  store i64 3, i64* %arrayidx26, align 8, !tbaa !4
  %arrayidx27 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 3
  store i64 3, i64* %arrayidx27, align 8, !tbaa !4
  %arrayidx28 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 4
  store i64 4, i64* %arrayidx28, align 16, !tbaa !4
  %arrayidx29 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 4
  store i64 4, i64* %arrayidx29, align 16, !tbaa !4
  %arrayidx30 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 4
  store i64 4, i64* %arrayidx30, align 16, !tbaa !4
  %arrayidx31 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 5
  store i64 5, i64* %arrayidx31, align 8, !tbaa !4
  %arrayidx32 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 5
  store i64 5, i64* %arrayidx32, align 8, !tbaa !4
  %arrayidx33 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 5
  store i64 5, i64* %arrayidx33, align 8, !tbaa !4
  %arrayidx34 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 6
  store i64 6, i64* %arrayidx34, align 16, !tbaa !4
  %arrayidx35 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 6
  store i64 6, i64* %arrayidx35, align 16, !tbaa !4
  %arrayidx36 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 6
  store i64 6, i64* %arrayidx36, align 16, !tbaa !4
  %arrayidx37 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 7
  store i64 7, i64* %arrayidx37, align 8, !tbaa !4
  %arrayidx38 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 7
  store i64 7, i64* %arrayidx38, align 8, !tbaa !4
  %arrayidx39 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 7
  store i64 7, i64* %arrayidx39, align 8, !tbaa !4
  %arrayidx40 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 8
  store i64 8, i64* %arrayidx40, align 16, !tbaa !4
  %arrayidx41 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 8
  store i64 8, i64* %arrayidx41, align 16, !tbaa !4
  %arrayidx42 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 8
  store i64 8, i64* %arrayidx42, align 16, !tbaa !4
  %arrayidx43 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 9
  store i64 9, i64* %arrayidx43, align 8, !tbaa !4
  %arrayidx44 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 9
  store i64 9, i64* %arrayidx44, align 8, !tbaa !4
  %arrayidx45 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 9
  store i64 9, i64* %arrayidx45, align 8, !tbaa !4
  %arrayidx46 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 10
  store i64 10, i64* %arrayidx46, align 16, !tbaa !4
  %arrayidx47 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 10
  store i64 10, i64* %arrayidx47, align 16, !tbaa !4
  %arrayidx48 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 10
  store i64 10, i64* %arrayidx48, align 16, !tbaa !4
  %arrayidx49 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 11
  store i64 11, i64* %arrayidx49, align 8, !tbaa !4
  %arrayidx50 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 11
  store i64 11, i64* %arrayidx50, align 8, !tbaa !4
  %arrayidx51 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 11
  store i64 11, i64* %arrayidx51, align 8, !tbaa !4
  %arrayidx52 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 12
  store i64 12, i64* %arrayidx52, align 16, !tbaa !4
  %arrayidx53 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 12
  store i64 12, i64* %arrayidx53, align 16, !tbaa !4
  %arrayidx54 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 12
  store i64 12, i64* %arrayidx54, align 16, !tbaa !4
  %arrayidx55 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 13
  store i64 13, i64* %arrayidx55, align 8, !tbaa !4
  %arrayidx56 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 13
  store i64 13, i64* %arrayidx56, align 8, !tbaa !4
  %arrayidx57 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 13
  store i64 13, i64* %arrayidx57, align 8, !tbaa !4
  %arrayidx58 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 14
  store i64 14, i64* %arrayidx58, align 16, !tbaa !4
  %arrayidx59 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 14
  store i64 14, i64* %arrayidx59, align 16, !tbaa !4
  %arrayidx60 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 14
  store i64 14, i64* %arrayidx60, align 16, !tbaa !4
  %arrayidx61 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 15
  store i64 15, i64* %arrayidx61, align 8, !tbaa !4
  %arrayidx62 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 15
  store i64 15, i64* %arrayidx62, align 8, !tbaa !4
  %arrayidx63 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 15
  store i64 15, i64* %arrayidx63, align 8, !tbaa !4
  %arrayidx64 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 16
  store i64 16, i64* %arrayidx64, align 16, !tbaa !4
  %arrayidx65 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 16
  store i64 16, i64* %arrayidx65, align 16, !tbaa !4
  %arrayidx66 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 16
  store i64 16, i64* %arrayidx66, align 16, !tbaa !4
  %arrayidx67 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 17
  store i64 63, i64* %arrayidx67, align 8, !tbaa !4
  %arrayidx68 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 17
  store i64 63, i64* %arrayidx68, align 8, !tbaa !4
  %arrayidx69 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 17
  store i64 63, i64* %arrayidx69, align 8, !tbaa !4
  %arrayidx70 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 18
  store i64 64, i64* %arrayidx70, align 16, !tbaa !4
  %arrayidx71 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 18
  store i64 64, i64* %arrayidx71, align 16, !tbaa !4
  %arrayidx72 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 18
  store i64 64, i64* %arrayidx72, align 16, !tbaa !4
  %arrayidx73 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 19
  store i64 255, i64* %arrayidx73, align 8, !tbaa !4
  %arrayidx74 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 19
  store i64 255, i64* %arrayidx74, align 8, !tbaa !4
  %arrayidx75 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 19
  store i64 255, i64* %arrayidx75, align 8, !tbaa !4
  %arrayidx76 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 20
  store i64 256, i64* %arrayidx76, align 16, !tbaa !4
  %arrayidx77 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 20
  store i64 256, i64* %arrayidx77, align 16, !tbaa !4
  %arrayidx78 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 20
  store i64 256, i64* %arrayidx78, align 16, !tbaa !4
  %arrayidx79 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 21
  store i64 4095, i64* %arrayidx79, align 8, !tbaa !4
  %arrayidx80 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 21
  store i64 4095, i64* %arrayidx80, align 8, !tbaa !4
  %arrayidx81 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 21
  store i64 4095, i64* %arrayidx81, align 8, !tbaa !4
  %arrayidx82 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 22
  store i64 4096, i64* %arrayidx82, align 16, !tbaa !4
  %arrayidx83 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 22
  store i64 4096, i64* %arrayidx83, align 16, !tbaa !4
  %arrayidx84 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 22
  store i64 4096, i64* %arrayidx84, align 16, !tbaa !4
  %arrayidx85 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 23
  store i64 65535, i64* %arrayidx85, align 8, !tbaa !4
  %arrayidx86 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 23
  store i64 65535, i64* %arrayidx86, align 8, !tbaa !4
  %arrayidx87 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 23
  store i64 65535, i64* %arrayidx87, align 8, !tbaa !4
  %arrayidx88 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 24
  store i64 65536, i64* %arrayidx88, align 16, !tbaa !4
  %arrayidx89 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 24
  store i64 65536, i64* %arrayidx89, align 16, !tbaa !4
  %arrayidx90 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 24
  store i64 65536, i64* %arrayidx90, align 16, !tbaa !4
  %arrayidx91 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 25
  store i64 262143, i64* %arrayidx91, align 8, !tbaa !4
  %arrayidx92 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 25
  store i64 262143, i64* %arrayidx92, align 8, !tbaa !4
  %arrayidx93 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 25
  store i64 262143, i64* %arrayidx93, align 8, !tbaa !4
  %arrayidx94 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 26
  store i64 262144, i64* %arrayidx94, align 16, !tbaa !4
  %arrayidx95 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 26
  store i64 262144, i64* %arrayidx95, align 16, !tbaa !4
  %arrayidx96 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 26
  store i64 262144, i64* %arrayidx96, align 16, !tbaa !4
  %arrayidx97 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 27
  store i64 1048575, i64* %arrayidx97, align 8, !tbaa !4
  %arrayidx98 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 27
  store i64 1048575, i64* %arrayidx98, align 8, !tbaa !4
  %arrayidx99 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 27
  store i64 1048575, i64* %arrayidx99, align 8, !tbaa !4
  %arrayidx100 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 28
  store i64 1048576, i64* %arrayidx100, align 16, !tbaa !4
  %arrayidx101 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 28
  store i64 1048576, i64* %arrayidx101, align 16, !tbaa !4
  %arrayidx102 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 28
  store i64 1048576, i64* %arrayidx102, align 16, !tbaa !4
  %arrayidx103 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 29
  store i64 16777215, i64* %arrayidx103, align 8, !tbaa !4
  %arrayidx104 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 29
  store i64 16777215, i64* %arrayidx104, align 8, !tbaa !4
  %arrayidx105 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 29
  store i64 16777215, i64* %arrayidx105, align 8, !tbaa !4
  %arrayidx106 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 30
  store i64 16777216, i64* %arrayidx106, align 16, !tbaa !4
  %arrayidx107 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 30
  store i64 16777216, i64* %arrayidx107, align 16, !tbaa !4
  %arrayidx108 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 30
  store i64 16777216, i64* %arrayidx108, align 16, !tbaa !4
  %arrayidx109 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 31
  store i64 268435455, i64* %arrayidx109, align 8, !tbaa !4
  %arrayidx110 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 31
  store i64 268435455, i64* %arrayidx110, align 8, !tbaa !4
  %arrayidx111 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 31
  store i64 268435455, i64* %arrayidx111, align 8, !tbaa !4
  %arrayidx112 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 32
  store i64 268435456, i64* %arrayidx112, align 16, !tbaa !4
  %arrayidx113 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 32
  store i64 268435456, i64* %arrayidx113, align 16, !tbaa !4
  %arrayidx114 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 32
  store i64 268435456, i64* %arrayidx114, align 16, !tbaa !4
  %arrayidx115 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 33
  store i64 1073741823, i64* %arrayidx115, align 8, !tbaa !4
  %arrayidx116 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 33
  store i64 1073741823, i64* %arrayidx116, align 8, !tbaa !4
  %arrayidx117 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 33
  store i64 1073741823, i64* %arrayidx117, align 8, !tbaa !4
  %arrayidx118 = getelementptr inbounds [39 x i64]* %d, i64 0, i64 34
  store i64 1073741824, i64* %arrayidx118, align 16, !tbaa !4
  %arrayidx119 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 34
  store i64 1073741824, i64* %arrayidx119, align 16, !tbaa !4
  %arrayidx120 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 34
  store i64 1073741824, i64* %arrayidx120, align 16, !tbaa !4
  %flgm = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 10
  br label %for.body124

for.body124:                                      ; preds = %for.inc150.for.body124_crit_edge, %for.end15
  %3 = phi i64 [ 0, %for.end15 ], [ %.pre, %for.inc150.for.body124_crit_edge ]
  %indvars.iv = phi i64 [ 0, %for.end15 ], [ %indvars.iv.next, %for.inc150.for.body124_crit_edge ]
  %arrayidx126 = getelementptr inbounds [39 x i64]* @sec.g, i64 0, i64 %indvars.iv
  %4 = load i64* %arrayidx126, align 8, !tbaa !4
  %cmp129 = icmp eq i64 %4, %3
  br i1 %cmp129, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %for.body124
  %arrayidx134 = getelementptr inbounds [39 x i64]* %o, i64 0, i64 %indvars.iv
  %5 = load i64* %arrayidx134, align 8, !tbaa !4
  %cmp135 = icmp eq i64 %3, %5
  br i1 %cmp135, label %lor.lhs.false137, label %if.then

lor.lhs.false137:                                 ; preds = %lor.lhs.false
  %arrayidx141 = getelementptr inbounds [39 x i64]* %x, i64 0, i64 %indvars.iv
  %6 = load i64* %arrayidx141, align 8, !tbaa !4
  %cmp142 = icmp eq i64 %3, %6
  br i1 %cmp142, label %for.inc150, label %if.then

if.then:                                          ; preds = %lor.lhs.false137, %lor.lhs.false, %for.body124
  %7 = load i32* %flgm, align 4, !tbaa !2
  %cmp144 = icmp eq i32 %7, 0
  br i1 %cmp144, label %for.inc150, label %if.then146

if.then146:                                       ; preds = %if.then
  %puts = call i32 @puts(i8* getelementptr inbounds ([47 x i8]* @str, i64 0, i64 0))
  %puts157 = call i32 @puts(i8* getelementptr inbounds ([45 x i8]* @str5, i64 0, i64 0))
  br label %for.inc150

for.inc150:                                       ; preds = %if.then, %lor.lhs.false137, %if.then146
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 35
  br i1 %exitcond, label %if.end156, label %for.inc150.for.body124_crit_edge

for.inc150.for.body124_crit_edge:                 ; preds = %for.inc150
  %arrayidx128.phi.trans.insert = getelementptr inbounds [39 x i64]* %d, i64 0, i64 %indvars.iv.next
  %.pre = load i64* %arrayidx128.phi.trans.insert, align 8, !tbaa !4
  br label %for.body124

if.end156:                                        ; preds = %for.inc150
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 9), align 4, !tbaa !2
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 10), align 4, !tbaa !2
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 11), align 4, !tbaa !2
  store i32 1, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 12), align 4, !tbaa !2
  %call = tail call i32 @sec(%struct.defs* @main.d0)
  store i32 0, i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 13), align 4, !tbaa !2
  %0 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 9), align 4, !tbaa !2
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str2, i64 0, i64 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 0), i32 0) nounwind
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %1 = load i32* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 14), align 4, !tbaa !2
  %cmp2 = icmp eq i32 %1, 0
  br i1 %cmp2, label %if.then3, label %if.else

if.then3:                                         ; preds = %if.end
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([21 x i8]* @str6, i64 0, i64 0))
  br label %if.end6

if.else:                                          ; preds = %if.end
  %puts7 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str7, i64 0, i64 0))
  br label %if.end6

if.end6:                                          ; preds = %if.else, %if.then3
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
!3 = metadata !{metadata !"float", metadata !0}
!4 = metadata !{metadata !"long", metadata !0}
