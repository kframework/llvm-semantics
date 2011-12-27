; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-15-s84.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@svtest.k = internal unnamed_addr global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.x3d = internal global [3 x [5 x [7 x i32]]] zeroinitializer, align 16
@sec.s84er = internal global [10 x i8] c"s84,er%d\0A\00", align 1
@sec.qs84 = internal global [8 x i8] c"s84    \00", align 1
@fip.y = internal global i32 0, align 4
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
  %fa = alloca [17 x float], align 16
  %afp = alloca [17 x float*], align 16
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %entry
  %indvar127 = phi i64 [ %indvar.next128, %while.cond ], [ 0, %entry ]
  %incdec.ptr439 = getelementptr %struct.defs* %pd0, i64 0, i32 15, i64 %indvar127
  %incdec.ptr38 = getelementptr [8 x i8]* @sec.qs84, i64 0, i64 %indvar127
  %tmp2 = load i8* %incdec.ptr38, align 1
  store i8 %tmp2, i8* %incdec.ptr439, align 1
  %tobool = icmp eq i8 %tmp2, 0
  %indvar.next128 = add i64 %indvar127, 1
  br i1 %tobool, label %if.end13, label %while.cond

if.end13:                                         ; preds = %while.cond
  store i32 3, i32* @fip.y, align 4
  br label %for.body

for.cond39.preheader:                             ; preds = %for.body
  %arrayidx46 = getelementptr [17 x float*]* %afp, i64 0, i64 0
  %tmp47 = load float** %arrayidx46, align 16
  %tmp48 = load float* %tmp47, align 4
  %add50 = fadd float %tmp48, 0.000000e+00
  %arrayidx46.1 = getelementptr [17 x float*]* %afp, i64 0, i64 1
  %tmp47.1 = load float** %arrayidx46.1, align 8
  %tmp48.1 = load float* %tmp47.1, align 4
  %add50.1 = fadd float %add50, %tmp48.1
  %arrayidx46.2 = getelementptr [17 x float*]* %afp, i64 0, i64 2
  %tmp47.2 = load float** %arrayidx46.2, align 16
  %tmp48.2 = load float* %tmp47.2, align 4
  %add50.2 = fadd float %add50.1, %tmp48.2
  %arrayidx46.3 = getelementptr [17 x float*]* %afp, i64 0, i64 3
  %tmp47.3 = load float** %arrayidx46.3, align 8
  %tmp48.3 = load float* %tmp47.3, align 4
  %add50.3 = fadd float %add50.2, %tmp48.3
  %arrayidx46.4 = getelementptr [17 x float*]* %afp, i64 0, i64 4
  %tmp47.4 = load float** %arrayidx46.4, align 16
  %tmp48.4 = load float* %tmp47.4, align 4
  %add50.4 = fadd float %add50.3, %tmp48.4
  %arrayidx46.5 = getelementptr [17 x float*]* %afp, i64 0, i64 5
  %tmp47.5 = load float** %arrayidx46.5, align 8
  %tmp48.5 = load float* %tmp47.5, align 4
  %add50.5 = fadd float %add50.4, %tmp48.5
  %arrayidx46.6 = getelementptr [17 x float*]* %afp, i64 0, i64 6
  %tmp47.6 = load float** %arrayidx46.6, align 16
  %tmp48.6 = load float* %tmp47.6, align 4
  %add50.6 = fadd float %add50.5, %tmp48.6
  %arrayidx46.7 = getelementptr [17 x float*]* %afp, i64 0, i64 7
  %tmp47.7 = load float** %arrayidx46.7, align 8
  %tmp48.7 = load float* %tmp47.7, align 4
  %add50.7 = fadd float %add50.6, %tmp48.7
  %arrayidx46.8 = getelementptr [17 x float*]* %afp, i64 0, i64 8
  %tmp47.8 = load float** %arrayidx46.8, align 16
  %tmp48.8 = load float* %tmp47.8, align 4
  %add50.8 = fadd float %add50.7, %tmp48.8
  %arrayidx46.9 = getelementptr [17 x float*]* %afp, i64 0, i64 9
  %tmp47.9 = load float** %arrayidx46.9, align 8
  %tmp48.9 = load float* %tmp47.9, align 4
  %add50.9 = fadd float %add50.8, %tmp48.9
  %arrayidx46.10 = getelementptr [17 x float*]* %afp, i64 0, i64 10
  %tmp47.10 = load float** %arrayidx46.10, align 16
  %tmp48.10 = load float* %tmp47.10, align 4
  %add50.10 = fadd float %add50.9, %tmp48.10
  %arrayidx46.11 = getelementptr [17 x float*]* %afp, i64 0, i64 11
  %tmp47.11 = load float** %arrayidx46.11, align 8
  %tmp48.11 = load float* %tmp47.11, align 4
  %add50.11 = fadd float %add50.10, %tmp48.11
  %arrayidx46.12 = getelementptr [17 x float*]* %afp, i64 0, i64 12
  %tmp47.12 = load float** %arrayidx46.12, align 16
  %tmp48.12 = load float* %tmp47.12, align 4
  %add50.12 = fadd float %add50.11, %tmp48.12
  %arrayidx46.13 = getelementptr [17 x float*]* %afp, i64 0, i64 13
  %tmp47.13 = load float** %arrayidx46.13, align 8
  %tmp48.13 = load float* %tmp47.13, align 4
  %add50.13 = fadd float %add50.12, %tmp48.13
  %arrayidx46.14 = getelementptr [17 x float*]* %afp, i64 0, i64 14
  %tmp47.14 = load float** %arrayidx46.14, align 16
  %tmp48.14 = load float* %tmp47.14, align 4
  %add50.14 = fadd float %add50.13, %tmp48.14
  %arrayidx46.15 = getelementptr [17 x float*]* %afp, i64 0, i64 15
  %tmp47.15 = load float** %arrayidx46.15, align 8
  %tmp48.15 = load float* %tmp47.15, align 4
  %add50.15 = fadd float %add50.14, %tmp48.15
  %arrayidx46.16 = getelementptr [17 x float*]* %afp, i64 0, i64 16
  %tmp47.16 = load float** %arrayidx46.16, align 16
  %tmp48.16 = load float* %tmp47.16, align 4
  %add50.16 = fadd float %add50.15, %tmp48.16
  %cmp56 = fcmp une float %add50.16, 1.360000e+02
  br i1 %cmp56, label %if.then58, label %for.cond70.preheader

for.body:                                         ; preds = %for.body, %if.end13
  %indvar = phi i64 [ 0, %if.end13 ], [ %indvar.next, %for.body ]
  %arrayidx37 = getelementptr [17 x float*]* %afp, i64 0, i64 %indvar
  %arrayidx = getelementptr [17 x float]* %fa, i64 0, i64 %indvar
  %storemerge46 = trunc i64 %indvar to i32
  %conv = sitofp i32 %storemerge46 to float
  store float %conv, float* %arrayidx, align 4
  store float* %arrayidx, float** %arrayidx37, align 8
  %indvar.next = add i64 %indvar, 1
  %exitcond123 = icmp eq i64 %indvar.next, 17
  br i1 %exitcond123, label %for.cond39.preheader, label %for.body

if.then58:                                        ; preds = %for.cond39.preheader
  %flgd60 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %tmp61 = load i32* %flgd60, align 4
  %cmp62 = icmp eq i32 %tmp61, 0
  br i1 %cmp62, label %for.cond70.preheader, label %if.then64

if.then64:                                        ; preds = %if.then58
  %call65 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s84er, i64 0, i64 0), i32 4) nounwind
  br label %for.cond70.preheader

for.cond70.preheader:                             ; preds = %for.cond39.preheader, %if.then58, %if.then64
  %tmp15235.ph = phi i32 [ 4, %if.then64 ], [ 4, %if.then58 ], [ 0, %for.cond39.preheader ]
  br label %for.cond80.preheader

for.cond80.preheader:                             ; preds = %for.cond80.preheader, %for.cond70.preheader
  %indvar57 = phi i64 [ 0, %for.cond70.preheader ], [ %indvar.next58, %for.cond80.preheader ]
  %arrayidx99 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 0, i64 %indvar57, i64 0
  %tmp92 = mul i64 %indvar57, 7
  %tmp95 = add i64 %tmp92, 1
  %add90.1 = trunc i64 %tmp95 to i32
  %tmp98 = add i64 %tmp92, 2
  %add90.2 = trunc i64 %tmp98 to i32
  %tmp101 = add i64 %tmp92, 3
  %add90.3 = trunc i64 %tmp101 to i32
  %tmp104 = add i64 %tmp92, 4
  %add90.4 = trunc i64 %tmp104 to i32
  %tmp107 = add i64 %tmp92, 5
  %add90.5 = trunc i64 %tmp107 to i32
  %tmp110 = add i64 %tmp92, 6
  %add90.6 = trunc i64 %tmp110 to i32
  %add90 = trunc i64 %tmp92 to i32
  %arrayidx99.1 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 0, i64 %indvar57, i64 1
  %arrayidx99.2 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 0, i64 %indvar57, i64 2
  %arrayidx99.3 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 0, i64 %indvar57, i64 3
  %arrayidx99.4 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 0, i64 %indvar57, i64 4
  %arrayidx99.5 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 0, i64 %indvar57, i64 5
  %arrayidx99.6 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 0, i64 %indvar57, i64 6
  store i32 %add90, i32* %arrayidx99, align 4
  store i32 %add90.1, i32* %arrayidx99.1, align 4
  store i32 %add90.2, i32* %arrayidx99.2, align 4
  store i32 %add90.3, i32* %arrayidx99.3, align 4
  store i32 %add90.4, i32* %arrayidx99.4, align 4
  store i32 %add90.5, i32* %arrayidx99.5, align 4
  store i32 %add90.6, i32* %arrayidx99.6, align 4
  %indvar.next58 = add i64 %indvar57, 1
  %exitcond = icmp eq i64 %indvar.next58, 5
  br i1 %exitcond, label %for.cond80.preheader.1, label %for.cond80.preheader

for.cond.i22:                                     ; preds = %for.cond80.preheader.2, %for.inc.i30
  %indvar.i19 = phi i64 [ %indvar.next.i29, %for.inc.i30 ], [ 0, %for.cond80.preheader.2 ]
  %storemerge.i20 = trunc i64 %indvar.i19 to i32
  %cmp.i21 = icmp slt i32 %storemerge.i20, 105
  br i1 %cmp.i21, label %for.body.i28, label %array.exit32

for.body.i28:                                     ; preds = %for.cond.i22
  %arrayidx.i24 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 0, i64 0, i64 %indvar.i19
  %tmp4.i26 = load i32* %arrayidx.i24, align 4
  %cmp7.i27 = icmp eq i32 %tmp4.i26, %storemerge.i20
  br i1 %cmp7.i27, label %for.inc.i30, label %array.exit32

for.inc.i30:                                      ; preds = %for.body.i28
  %indvar.next.i29 = add i64 %indvar.i19, 1
  br label %for.cond.i22

array.exit32:                                     ; preds = %for.cond.i22, %for.body.i28
  %storemerge1.i31 = phi i32 [ 1, %for.body.i28 ], [ 0, %for.cond.i22 ]
  br label %for.cond.i8

for.cond.i8:                                      ; preds = %for.inc.i16, %array.exit32
  %indvar.i5 = phi i64 [ %indvar.next.i15, %for.inc.i16 ], [ 0, %array.exit32 ]
  %storemerge.i6 = trunc i64 %indvar.i5 to i32
  %cmp.i7 = icmp slt i32 %storemerge.i6, 35
  br i1 %cmp.i7, label %for.body.i14, label %array.exit18

for.body.i14:                                     ; preds = %for.cond.i8
  %tmp51 = add i64 %indvar.i5, 35
  %arrayidx.i10 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 0, i64 %indvar.i5
  %add.i11 = trunc i64 %tmp51 to i32
  %tmp4.i12 = load i32* %arrayidx.i10, align 4
  %cmp7.i13 = icmp eq i32 %tmp4.i12, %add.i11
  br i1 %cmp7.i13, label %for.inc.i16, label %array.exit18

for.inc.i16:                                      ; preds = %for.body.i14
  %indvar.next.i15 = add i64 %indvar.i5, 1
  br label %for.cond.i8

array.exit18:                                     ; preds = %for.cond.i8, %for.body.i14
  %storemerge1.i17 = phi i32 [ 1, %for.body.i14 ], [ 0, %for.cond.i8 ]
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %array.exit18
  %indvar.i = phi i64 [ %indvar.next.i, %for.inc.i ], [ 0, %array.exit18 ]
  %storemerge.i = trunc i64 %indvar.i to i32
  %cmp.i = icmp slt i32 %storemerge.i, 7
  br i1 %cmp.i, label %for.body.i, label %array.exit

for.body.i:                                       ; preds = %for.cond.i
  %tmp = add i64 %indvar.i, 49
  %arrayidx.i = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 2, i64 %indvar.i
  %add.i = trunc i64 %tmp to i32
  %tmp4.i = load i32* %arrayidx.i, align 4
  %cmp7.i = icmp eq i32 %tmp4.i, %add.i
  br i1 %cmp7.i, label %for.inc.i, label %array.exit

for.inc.i:                                        ; preds = %for.body.i
  %indvar.next.i = add i64 %indvar.i, 1
  br label %for.cond.i

array.exit:                                       ; preds = %for.cond.i, %for.body.i
  %storemerge1.i = phi i32 [ 1, %for.body.i ], [ 0, %for.cond.i ]
  %tmp137 = load i32* getelementptr inbounds ([3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 2, i64 3), align 4
  %add118 = add i32 %storemerge1.i17, %storemerge1.i31
  %add127 = add i32 %add118, %storemerge1.i
  %add138 = add i32 %add127, %tmp137
  %tobool139 = icmp eq i32 %add138, 52
  br i1 %tobool139, label %if.end151, label %if.then140

if.then140:                                       ; preds = %array.exit
  %flgd142 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %tmp143 = load i32* %flgd142, align 4
  %cmp144 = icmp eq i32 %tmp143, 0
  br i1 %cmp144, label %if.end148, label %if.then146

if.then146:                                       ; preds = %if.then140
  %call147 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s84er, i64 0, i64 0), i32 8) nounwind
  br label %if.end148

if.end148:                                        ; preds = %if.then140, %if.then146
  %add15040 = or i32 %tmp15235.ph, 8
  br label %if.end151

if.end151:                                        ; preds = %array.exit, %if.end148
  %tmp15234 = phi i32 [ %tmp15235.ph, %array.exit ], [ %add15040, %if.end148 ]
  ret i32 %tmp15234

for.cond80.preheader.1:                           ; preds = %for.cond80.preheader, %for.cond80.preheader.1
  %indvar57.1 = phi i64 [ %indvar.next58.1, %for.cond80.preheader.1 ], [ 0, %for.cond80.preheader ]
  %arrayidx99.1116 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 %indvar57.1, i64 0
  %tmp92.1 = mul i64 %indvar57.1, 7
  %tmp95.1 = add i64 %tmp92.1, 36
  %add90.1.1 = trunc i64 %tmp95.1 to i32
  %tmp98.1 = add i64 %tmp92.1, 37
  %add90.2.1 = trunc i64 %tmp98.1 to i32
  %tmp101.1 = add i64 %tmp92.1, 38
  %add90.3.1 = trunc i64 %tmp101.1 to i32
  %tmp104.1 = add i64 %tmp92.1, 39
  %add90.4.1 = trunc i64 %tmp104.1 to i32
  %tmp107.1 = add i64 %tmp92.1, 40
  %add90.5.1 = trunc i64 %tmp107.1 to i32
  %tmp110.1 = add i64 %tmp92.1, 41
  %add90.6.1 = trunc i64 %tmp110.1 to i32
  %tmp112.1 = add i64 %tmp92.1, 35
  %add90.1117 = trunc i64 %tmp112.1 to i32
  %arrayidx99.1.1 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 %indvar57.1, i64 1
  %arrayidx99.2.1 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 %indvar57.1, i64 2
  %arrayidx99.3.1 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 %indvar57.1, i64 3
  %arrayidx99.4.1 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 %indvar57.1, i64 4
  %arrayidx99.5.1 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 %indvar57.1, i64 5
  %arrayidx99.6.1 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 1, i64 %indvar57.1, i64 6
  store i32 %add90.1117, i32* %arrayidx99.1116, align 4
  store i32 %add90.1.1, i32* %arrayidx99.1.1, align 4
  store i32 %add90.2.1, i32* %arrayidx99.2.1, align 4
  store i32 %add90.3.1, i32* %arrayidx99.3.1, align 4
  store i32 %add90.4.1, i32* %arrayidx99.4.1, align 4
  store i32 %add90.5.1, i32* %arrayidx99.5.1, align 4
  store i32 %add90.6.1, i32* %arrayidx99.6.1, align 4
  %indvar.next58.1 = add i64 %indvar57.1, 1
  %exitcond.1 = icmp eq i64 %indvar.next58.1, 5
  br i1 %exitcond.1, label %for.cond80.preheader.2, label %for.cond80.preheader.1

for.cond80.preheader.2:                           ; preds = %for.cond80.preheader.1, %for.cond80.preheader.2
  %indvar57.2 = phi i64 [ %indvar.next58.2, %for.cond80.preheader.2 ], [ 0, %for.cond80.preheader.1 ]
  %arrayidx99.2118 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 2, i64 %indvar57.2, i64 0
  %tmp92.2 = mul i64 %indvar57.2, 7
  %tmp95.2 = add i64 %tmp92.2, 71
  %add90.1.2 = trunc i64 %tmp95.2 to i32
  %tmp98.2 = add i64 %tmp92.2, 72
  %add90.2.2 = trunc i64 %tmp98.2 to i32
  %tmp101.2 = add i64 %tmp92.2, 73
  %add90.3.2 = trunc i64 %tmp101.2 to i32
  %tmp104.2 = add i64 %tmp92.2, 74
  %add90.4.2 = trunc i64 %tmp104.2 to i32
  %tmp107.2 = add i64 %tmp92.2, 75
  %add90.5.2 = trunc i64 %tmp107.2 to i32
  %tmp110.2 = add i64 %tmp92.2, 76
  %add90.6.2 = trunc i64 %tmp110.2 to i32
  %tmp112.2 = add i64 %tmp92.2, 70
  %add90.2119 = trunc i64 %tmp112.2 to i32
  %arrayidx99.1.2 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 2, i64 %indvar57.2, i64 1
  %arrayidx99.2.2 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 2, i64 %indvar57.2, i64 2
  %arrayidx99.3.2 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 2, i64 %indvar57.2, i64 3
  %arrayidx99.4.2 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 2, i64 %indvar57.2, i64 4
  %arrayidx99.5.2 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 2, i64 %indvar57.2, i64 5
  %arrayidx99.6.2 = getelementptr [3 x [5 x [7 x i32]]]* @sec.x3d, i64 0, i64 2, i64 %indvar57.2, i64 6
  store i32 %add90.2119, i32* %arrayidx99.2118, align 4
  store i32 %add90.1.2, i32* %arrayidx99.1.2, align 4
  store i32 %add90.2.2, i32* %arrayidx99.2.2, align 4
  store i32 %add90.3.2, i32* %arrayidx99.3.2, align 4
  store i32 %add90.4.2, i32* %arrayidx99.4.2, align 4
  store i32 %add90.5.2, i32* %arrayidx99.5.2, align 4
  store i32 %add90.6.2, i32* %arrayidx99.6.2, align 4
  %indvar.next58.2 = add i64 %indvar57.2, 1
  %exitcond.2 = icmp eq i64 %indvar.next58.2, 5
  br i1 %exitcond.2, label %for.cond.i22, label %for.cond80.preheader.2
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @glork(i32 %x) nounwind uwtable readnone {
entry:
  ret i32 %x
}

define i32 @array(i32* %a, i32 %size, i32 %start) nounwind uwtable readonly {
entry:
  %tmp = zext i32 %start to i64
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = trunc i64 %indvar to i32
  %cmp = icmp slt i32 %storemerge, %size
  br i1 %cmp, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %tmp2 = add i64 %tmp, %indvar
  %arrayidx = getelementptr i32* %a, i64 %indvar
  %add = trunc i64 %tmp2 to i32
  %tmp4 = load i32* %arrayidx, align 4
  %cmp7 = icmp eq i32 %tmp4, %add
  br i1 %cmp7, label %for.inc, label %return

for.inc:                                          ; preds = %for.body
  %indvar.next = add i64 %indvar, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body
  %storemerge1 = phi i32 [ 1, %for.body ], [ 0, %for.cond ]
  ret i32 %storemerge1
}

define i32* @fip(i32 %x) nounwind uwtable {
entry:
  store i32 %x, i32* @fip.y, align 4
  ret i32* @fip.y
}

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
