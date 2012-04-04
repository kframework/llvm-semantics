; ModuleID = '/home/david/src/c-semantics/tests/unitTests/cq-15-s84.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@svtest.k = internal unnamed_addr global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.x3d = internal global [3 x [5 x [7 x i32]]] zeroinitializer, align 16
@sec.s84er = internal global [10 x i8] c"s84,er%d\0A\00", align 1
@fip.y = internal global i32 0, align 4
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
if.end41:
  %fa = alloca [17 x float], align 16
  %afp = alloca [17 x float*], align 16
  %arraydecay = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 0
  %incdec.ptr1 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 1
  store i8 115, i8* %arraydecay, align 1, !tbaa !0
  %incdec.ptr1.1 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 2
  store i8 56, i8* %incdec.ptr1, align 1, !tbaa !0
  %incdec.ptr1.2 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 3
  store i8 52, i8* %incdec.ptr1.1, align 1, !tbaa !0
  %incdec.ptr1.3 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 4
  store i8 32, i8* %incdec.ptr1.2, align 1, !tbaa !0
  %incdec.ptr1.4 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 5
  store i8 32, i8* %incdec.ptr1.3, align 1, !tbaa !0
  %incdec.ptr1.5 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 6
  store i8 32, i8* %incdec.ptr1.4, align 1, !tbaa !0
  %incdec.ptr1.6 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 15, i64 7
  store i8 32, i8* %incdec.ptr1.5, align 1, !tbaa !0
  store i8 0, i8* %incdec.ptr1.6, align 1, !tbaa !0
  store i32 3, i32* @fip.y, align 4, !tbaa !2
  %arrayidx = getelementptr inbounds [17 x float]* %fa, i64 0, i64 0
  store float 0.000000e+00, float* %arrayidx, align 16, !tbaa !3
  %arrayidx20 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 0
  store float* %arrayidx, float** %arrayidx20, align 16, !tbaa !4
  %arrayidx.1 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 1
  store float 1.000000e+00, float* %arrayidx.1, align 4, !tbaa !3
  %arrayidx20.1 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 1
  store float* %arrayidx.1, float** %arrayidx20.1, align 8, !tbaa !4
  %arrayidx.2 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 2
  store float 2.000000e+00, float* %arrayidx.2, align 8, !tbaa !3
  %arrayidx20.2 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 2
  store float* %arrayidx.2, float** %arrayidx20.2, align 16, !tbaa !4
  %arrayidx.3 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 3
  store float 3.000000e+00, float* %arrayidx.3, align 4, !tbaa !3
  %arrayidx20.3 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 3
  store float* %arrayidx.3, float** %arrayidx20.3, align 8, !tbaa !4
  %arrayidx.4 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 4
  store float 4.000000e+00, float* %arrayidx.4, align 16, !tbaa !3
  %arrayidx20.4 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 4
  store float* %arrayidx.4, float** %arrayidx20.4, align 16, !tbaa !4
  %arrayidx.5 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 5
  store float 5.000000e+00, float* %arrayidx.5, align 4, !tbaa !3
  %arrayidx20.5 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 5
  store float* %arrayidx.5, float** %arrayidx20.5, align 8, !tbaa !4
  %arrayidx.6 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 6
  store float 6.000000e+00, float* %arrayidx.6, align 8, !tbaa !3
  %arrayidx20.6 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 6
  store float* %arrayidx.6, float** %arrayidx20.6, align 16, !tbaa !4
  %arrayidx.7 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 7
  store float 7.000000e+00, float* %arrayidx.7, align 4, !tbaa !3
  %arrayidx20.7 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 7
  store float* %arrayidx.7, float** %arrayidx20.7, align 8, !tbaa !4
  %arrayidx.8 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 8
  store float 8.000000e+00, float* %arrayidx.8, align 16, !tbaa !3
  %arrayidx20.8 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 8
  store float* %arrayidx.8, float** %arrayidx20.8, align 16, !tbaa !4
  %arrayidx.9 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 9
  store float 9.000000e+00, float* %arrayidx.9, align 4, !tbaa !3
  %arrayidx20.9 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 9
  store float* %arrayidx.9, float** %arrayidx20.9, align 8, !tbaa !4
  %arrayidx.10 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 10
  store float 1.000000e+01, float* %arrayidx.10, align 8, !tbaa !3
  %arrayidx20.10 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 10
  store float* %arrayidx.10, float** %arrayidx20.10, align 16, !tbaa !4
  %arrayidx.11 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 11
  store float 1.100000e+01, float* %arrayidx.11, align 4, !tbaa !3
  %arrayidx20.11 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 11
  store float* %arrayidx.11, float** %arrayidx20.11, align 8, !tbaa !4
  %arrayidx.12 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 12
  store float 1.200000e+01, float* %arrayidx.12, align 16, !tbaa !3
  %arrayidx20.12 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 12
  store float* %arrayidx.12, float** %arrayidx20.12, align 16, !tbaa !4
  %arrayidx.13 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 13
  store float 1.300000e+01, float* %arrayidx.13, align 4, !tbaa !3
  %arrayidx20.13 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 13
  store float* %arrayidx.13, float** %arrayidx20.13, align 8, !tbaa !4
  %arrayidx.14 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 14
  store float 1.400000e+01, float* %arrayidx.14, align 8, !tbaa !3
  %arrayidx20.14 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 14
  store float* %arrayidx.14, float** %arrayidx20.14, align 16, !tbaa !4
  %arrayidx.15 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 15
  store float 1.500000e+01, float* %arrayidx.15, align 4, !tbaa !3
  %arrayidx20.15 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 15
  store float* %arrayidx.15, float** %arrayidx20.15, align 8, !tbaa !4
  %arrayidx.16 = getelementptr inbounds [17 x float]* %fa, i64 0, i64 16
  store float 1.600000e+01, float* %arrayidx.16, align 16, !tbaa !3
  %arrayidx20.16 = getelementptr inbounds [17 x float*]* %afp, i64 0, i64 16
  store float* %arrayidx.16, float** %arrayidx20.16, align 16, !tbaa !4
  br label %for.cond46.preheader

for.cond46.preheader:                             ; preds = %for.cond46.preheader, %if.end41
  %indvars.iv = phi i64 [ 0, %if.end41 ], [ %indvars.iv.next, %for.cond46.preheader ]
  %0 = mul nsw i64 %indvars.iv, 35
  %arrayidx62 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 0, i64 0
  %1 = trunc i64 %0 to i32
  store i32 %1, i32* %arrayidx62, align 4, !tbaa !2
  %2 = add i64 %0, 1
  %arrayidx62.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 0, i64 1
  %3 = trunc i64 %2 to i32
  store i32 %3, i32* %arrayidx62.1, align 4, !tbaa !2
  %4 = add i64 %0, 2
  %arrayidx62.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 0, i64 2
  %5 = trunc i64 %4 to i32
  store i32 %5, i32* %arrayidx62.2, align 4, !tbaa !2
  %6 = add i64 %0, 3
  %arrayidx62.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 0, i64 3
  %7 = trunc i64 %6 to i32
  store i32 %7, i32* %arrayidx62.3, align 4, !tbaa !2
  %8 = add i64 %0, 4
  %arrayidx62.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 0, i64 4
  %9 = trunc i64 %8 to i32
  store i32 %9, i32* %arrayidx62.4, align 4, !tbaa !2
  %10 = add i64 %0, 5
  %arrayidx62.5 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 0, i64 5
  %11 = trunc i64 %10 to i32
  store i32 %11, i32* %arrayidx62.5, align 4, !tbaa !2
  %12 = add i64 %0, 6
  %arrayidx62.6 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 0, i64 6
  %13 = trunc i64 %12 to i32
  store i32 %13, i32* %arrayidx62.6, align 4, !tbaa !2
  %14 = add i64 %0, 7
  %arrayidx62.1131 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 1, i64 0
  %15 = trunc i64 %14 to i32
  store i32 %15, i32* %arrayidx62.1131, align 4, !tbaa !2
  %16 = add i64 %0, 8
  %arrayidx62.1.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 1, i64 1
  %17 = trunc i64 %16 to i32
  store i32 %17, i32* %arrayidx62.1.1, align 4, !tbaa !2
  %18 = add i64 %0, 9
  %arrayidx62.2.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 1, i64 2
  %19 = trunc i64 %18 to i32
  store i32 %19, i32* %arrayidx62.2.1, align 4, !tbaa !2
  %20 = add i64 %0, 10
  %arrayidx62.3.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 1, i64 3
  %21 = trunc i64 %20 to i32
  store i32 %21, i32* %arrayidx62.3.1, align 4, !tbaa !2
  %22 = add i64 %0, 11
  %arrayidx62.4.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 1, i64 4
  %23 = trunc i64 %22 to i32
  store i32 %23, i32* %arrayidx62.4.1, align 4, !tbaa !2
  %24 = add i64 %0, 12
  %arrayidx62.5.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 1, i64 5
  %25 = trunc i64 %24 to i32
  store i32 %25, i32* %arrayidx62.5.1, align 4, !tbaa !2
  %26 = add i64 %0, 13
  %arrayidx62.6.1 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 1, i64 6
  %27 = trunc i64 %26 to i32
  store i32 %27, i32* %arrayidx62.6.1, align 4, !tbaa !2
  %28 = add i64 %0, 14
  %arrayidx62.2132 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 2, i64 0
  %29 = trunc i64 %28 to i32
  store i32 %29, i32* %arrayidx62.2132, align 4, !tbaa !2
  %30 = add i64 %0, 15
  %arrayidx62.1.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 2, i64 1
  %31 = trunc i64 %30 to i32
  store i32 %31, i32* %arrayidx62.1.2, align 4, !tbaa !2
  %32 = add i64 %0, 16
  %arrayidx62.2.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 2, i64 2
  %33 = trunc i64 %32 to i32
  store i32 %33, i32* %arrayidx62.2.2, align 4, !tbaa !2
  %34 = add i64 %0, 17
  %arrayidx62.3.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 2, i64 3
  %35 = trunc i64 %34 to i32
  store i32 %35, i32* %arrayidx62.3.2, align 4, !tbaa !2
  %36 = add i64 %0, 18
  %arrayidx62.4.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 2, i64 4
  %37 = trunc i64 %36 to i32
  store i32 %37, i32* %arrayidx62.4.2, align 4, !tbaa !2
  %38 = add i64 %0, 19
  %arrayidx62.5.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 2, i64 5
  %39 = trunc i64 %38 to i32
  store i32 %39, i32* %arrayidx62.5.2, align 4, !tbaa !2
  %40 = add i64 %0, 20
  %arrayidx62.6.2 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 2, i64 6
  %41 = trunc i64 %40 to i32
  store i32 %41, i32* %arrayidx62.6.2, align 4, !tbaa !2
  %42 = add i64 %0, 21
  %arrayidx62.3133 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 3, i64 0
  %43 = trunc i64 %42 to i32
  store i32 %43, i32* %arrayidx62.3133, align 4, !tbaa !2
  %44 = add i64 %0, 22
  %arrayidx62.1.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 3, i64 1
  %45 = trunc i64 %44 to i32
  store i32 %45, i32* %arrayidx62.1.3, align 4, !tbaa !2
  %46 = add i64 %0, 23
  %arrayidx62.2.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 3, i64 2
  %47 = trunc i64 %46 to i32
  store i32 %47, i32* %arrayidx62.2.3, align 4, !tbaa !2
  %48 = add i64 %0, 24
  %arrayidx62.3.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 3, i64 3
  %49 = trunc i64 %48 to i32
  store i32 %49, i32* %arrayidx62.3.3, align 4, !tbaa !2
  %50 = add i64 %0, 25
  %arrayidx62.4.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 3, i64 4
  %51 = trunc i64 %50 to i32
  store i32 %51, i32* %arrayidx62.4.3, align 4, !tbaa !2
  %52 = add i64 %0, 26
  %arrayidx62.5.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 3, i64 5
  %53 = trunc i64 %52 to i32
  store i32 %53, i32* %arrayidx62.5.3, align 4, !tbaa !2
  %54 = add i64 %0, 27
  %arrayidx62.6.3 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 3, i64 6
  %55 = trunc i64 %54 to i32
  store i32 %55, i32* %arrayidx62.6.3, align 4, !tbaa !2
  %56 = add i64 %0, 28
  %arrayidx62.4134 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 4, i64 0
  %57 = trunc i64 %56 to i32
  store i32 %57, i32* %arrayidx62.4134, align 4, !tbaa !2
  %58 = add i64 %0, 29
  %arrayidx62.1.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 4, i64 1
  %59 = trunc i64 %58 to i32
  store i32 %59, i32* %arrayidx62.1.4, align 4, !tbaa !2
  %60 = add i64 %0, 30
  %arrayidx62.2.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 4, i64 2
  %61 = trunc i64 %60 to i32
  store i32 %61, i32* %arrayidx62.2.4, align 4, !tbaa !2
  %62 = add i64 %0, 31
  %arrayidx62.3.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 4, i64 3
  %63 = trunc i64 %62 to i32
  store i32 %63, i32* %arrayidx62.3.4, align 4, !tbaa !2
  %64 = add i64 %0, 32
  %arrayidx62.4.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 4, i64 4
  %65 = trunc i64 %64 to i32
  store i32 %65, i32* %arrayidx62.4.4, align 4, !tbaa !2
  %66 = add i64 %0, 33
  %arrayidx62.5.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 4, i64 5
  %67 = trunc i64 %66 to i32
  store i32 %67, i32* %arrayidx62.5.4, align 4, !tbaa !2
  %68 = add i64 %0, 34
  %arrayidx62.6.4 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 %indvars.iv, i64 4, i64 6
  %69 = trunc i64 %68 to i32
  store i32 %69, i32* %arrayidx62.6.4, align 4, !tbaa !2
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 3
  br i1 %exitcond, label %for.cond.i114, label %for.cond46.preheader

for.cond.i114:                                    ; preds = %for.cond46.preheader, %for.body.i118
  %indvars.iv.i112 = phi i64 [ %indvars.iv.next.i117, %for.body.i118 ], [ 0, %for.cond46.preheader ]
  %70 = trunc i64 %indvars.iv.i112 to i32
  %cmp.i113 = icmp slt i32 %70, 105
  br i1 %cmp.i113, label %for.body.i118, label %array.exit120

for.body.i118:                                    ; preds = %for.cond.i114
  %arrayidx.i115 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 0, i64 0, i64 %indvars.iv.i112
  %71 = load i32* %arrayidx.i115, align 4, !tbaa !2
  %cmp1.i116 = icmp eq i32 %71, %70
  %indvars.iv.next.i117 = add i64 %indvars.iv.i112, 1
  br i1 %cmp1.i116, label %for.cond.i114, label %array.exit120

array.exit120:                                    ; preds = %for.cond.i114, %for.body.i118
  %retval.0.i119 = phi i32 [ 1, %for.body.i118 ], [ 0, %for.cond.i114 ]
  br label %for.cond.i105

for.cond.i105:                                    ; preds = %for.body.i109, %array.exit120
  %indvars.iv.i103 = phi i64 [ %indvars.iv.next.i108, %for.body.i109 ], [ 0, %array.exit120 ]
  %72 = trunc i64 %indvars.iv.i103 to i32
  %cmp.i104 = icmp slt i32 %72, 35
  br i1 %cmp.i104, label %for.body.i109, label %array.exit111

for.body.i109:                                    ; preds = %for.cond.i105
  %arrayidx.i106 = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 0, i64 %indvars.iv.i103
  %73 = load i32* %arrayidx.i106, align 4, !tbaa !2
  %74 = add nsw i64 %indvars.iv.i103, 35
  %75 = trunc i64 %74 to i32
  %cmp1.i107 = icmp eq i32 %73, %75
  %indvars.iv.next.i108 = add i64 %indvars.iv.i103, 1
  br i1 %cmp1.i107, label %for.cond.i105, label %array.exit111

array.exit111:                                    ; preds = %for.cond.i105, %for.body.i109
  %retval.0.i110 = phi i32 [ 1, %for.body.i109 ], [ 0, %for.cond.i105 ]
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.body.i, %array.exit111
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.body.i ], [ 0, %array.exit111 ]
  %76 = trunc i64 %indvars.iv.i to i32
  %cmp.i = icmp slt i32 %76, 7
  br i1 %cmp.i, label %for.body.i, label %array.exit

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr inbounds [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 2, i64 %indvars.iv.i
  %77 = load i32* %arrayidx.i, align 4, !tbaa !2
  %78 = add nsw i64 %indvars.iv.i, 49
  %79 = trunc i64 %78 to i32
  %cmp1.i = icmp eq i32 %77, %79
  %indvars.iv.next.i = add i64 %indvars.iv.i, 1
  br i1 %cmp1.i, label %for.cond.i, label %array.exit

array.exit:                                       ; preds = %for.cond.i, %for.body.i
  %retval.0.i = phi i32 [ 1, %for.body.i ], [ 0, %for.cond.i ]
  %80 = load i32* getelementptr inbounds ([3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 2, i64 3), align 4, !tbaa !2
  %add77 = add i32 %retval.0.i110, %retval.0.i119
  %add84 = add i32 %add77, %retval.0.i
  %add91 = add i32 %add84, %80
  %tobool92 = icmp eq i32 %add91, 52
  br i1 %tobool92, label %if.end101, label %if.then93

if.then93:                                        ; preds = %array.exit
  %flgd94 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %81 = load i32* %flgd94, align 4, !tbaa !2
  %cmp95 = icmp eq i32 %81, 0
  br i1 %cmp95, label %if.end101, label %if.then97

if.then97:                                        ; preds = %if.then93
  %call98 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s84er, i64 0, i64 0), i32 8) nounwind
  br label %if.end101

if.end101:                                        ; preds = %if.then97, %if.then93, %array.exit
  %rc.3 = phi i32 [ 0, %array.exit ], [ 8, %if.then93 ], [ 8, %if.then97 ]
  ret i32 %rc.3
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @glork(i32 %x) nounwind uwtable readnone {
entry:
  ret i32 %x
}

define i32 @array(i32* nocapture %a, i32 %size, i32 %start) nounwind uwtable readonly {
entry:
  %0 = zext i32 %start to i64
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %1 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %1, %size
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds i32* %a, i64 %indvars.iv
  %2 = load i32* %arrayidx, align 4, !tbaa !2
  %3 = add nsw i64 %indvars.iv, %0
  %4 = trunc i64 %3 to i32
  %cmp1 = icmp eq i32 %2, %4
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp1, label %for.cond, label %return

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ 1, %for.body ], [ 0, %for.cond ]
  ret i32 %retval.0
}

define i32* @fip(i32 %x) nounwind uwtable {
entry:
  store i32 %x, i32* @fip.y, align 4, !tbaa !2
  ret i32* @fip.y
}

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
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 0), i32 %call) nounwind
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
  %puts7 = tail call i32 @puts(i8* getelementptr inbounds ([9 x i8]* @str3, i64 0, i64 0))
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
!4 = metadata !{metadata !"any pointer", metadata !0}
