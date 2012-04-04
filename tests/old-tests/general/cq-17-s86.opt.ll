; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-17-s86.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@svtest.k = internal unnamed_addr global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s86er = internal global [10 x i8] c"s86,er%d\0A\00", align 1
@sec.qs86 = internal global [8 x i8] c"s86    \00", align 1
@sec.x = internal global [3 x i32] [i32 1, i32 3, i32 5], align 4
@sec.y0 = internal unnamed_addr constant [12 x float] [float 1.000000e+00, float 3.000000e+00, float 5.000000e+00, float 2.000000e+00, float 4.000000e+00, float 6.000000e+00, float 3.000000e+00, float 5.000000e+00, float 7.000000e+00, float 0.000000e+00, float 0.000000e+00, float 0.000000e+00], align 16
@sec.y2 = internal unnamed_addr constant [4 x [3 x float]] [[3 x float] [float 1.000000e+00, float 3.000000e+00, float 5.000000e+00], [3 x float] [float 2.000000e+00, float 4.000000e+00, float 6.000000e+00], [3 x float] [float 3.000000e+00, float 5.000000e+00, float 7.000000e+00], [3 x float] zeroinitializer], align 16
@sec.y3 = internal unnamed_addr constant [4 x [3 x float]] [[3 x float] [float 1.000000e+00, float 0.000000e+00, float 0.000000e+00], [3 x float] [float 2.000000e+00, float 0.000000e+00, float 0.000000e+00], [3 x float] [float 3.000000e+00, float 0.000000e+00, float 0.000000e+00], [3 x float] [float 4.000000e+00, float 0.000000e+00, float 0.000000e+00]], align 16
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
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %entry
  %indvar53 = phi i64 [ %indvar.next54, %while.cond ], [ 0, %entry ]
  %incdec.ptr718 = getelementptr %struct.defs* %pd0, i64 0, i32 15, i64 %indvar53
  %incdec.ptr17 = getelementptr [8 x i8]* @sec.qs86, i64 0, i64 %indvar53
  %tmp5 = load i8* %incdec.ptr17, align 1
  store i8 %tmp5, i8* %incdec.ptr718, align 1
  %tobool = icmp eq i8 %tmp5, 0
  %indvar.next54 = add i64 %indvar53, 1
  br i1 %tobool, label %while.end, label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp9 = load i32* getelementptr inbounds ([3 x i32]* @sec.x, i64 0, i64 2), align 4
  %cmp = icmp eq i32 %tmp9, 5
  br i1 %cmp, label %if.end16, label %if.then

if.then:                                          ; preds = %while.end
  %flgd = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %tmp11 = load i32* %flgd, align 4
  %cmp12 = icmp eq i32 %tmp11, 0
  br i1 %cmp12, label %if.end16, label %if.then13

if.then13:                                        ; preds = %if.then
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s86er, i64 0, i64 0), i32 1) nounwind
  br label %if.end16

if.end16:                                         ; preds = %if.then13, %if.then, %while.end
  %tmp16116 = phi i32 [ 0, %while.end ], [ 1, %if.then ], [ 1, %if.then13 ]
  %tmp18 = load i32* getelementptr inbounds ([3 x i32]* @sec.x, i64 0, i64 1), align 4
  %cmp19 = icmp eq i32 %tmp18, 3
  br i1 %cmp19, label %if.end30, label %if.then20

if.then20:                                        ; preds = %if.end16
  %flgd22 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %tmp23 = load i32* %flgd22, align 4
  %cmp24 = icmp eq i32 %tmp23, 0
  br i1 %cmp24, label %if.end27, label %if.then25

if.then25:                                        ; preds = %if.then20
  %call26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s86er, i64 0, i64 0), i32 2) nounwind
  br label %if.end27

if.end27:                                         ; preds = %if.then20, %if.then25
  %add2919 = or i32 %tmp16116, 2
  br label %if.end30

if.end30:                                         ; preds = %if.end16, %if.end27
  %tmp16115 = phi i32 [ %add2919, %if.end27 ], [ %tmp16116, %if.end16 ]
  %tmp32 = load i32* getelementptr inbounds ([3 x i32]* @sec.x, i64 0, i64 2), align 4
  %cmp33 = icmp eq i32 %tmp32, 5
  br i1 %cmp33, label %if.end65, label %if.then34

if.then34:                                        ; preds = %if.end30
  %flgd36 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %tmp37 = load i32* %flgd36, align 4
  %cmp38 = icmp eq i32 %tmp37, 0
  br i1 %cmp38, label %if.end41, label %if.then39

if.then39:                                        ; preds = %if.then34
  %call40 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s86er, i64 0, i64 0), i32 4) nounwind
  br label %if.end41

if.end41:                                         ; preds = %if.then34, %if.then39
  %add43 = add nsw i32 %tmp16115, 4
  br label %if.end65

if.end65:                                         ; preds = %if.end41, %if.end30
  %tmp16113 = phi i32 [ %tmp16115, %if.end30 ], [ %add43, %if.end41 ]
  br label %for.cond70.preheader

for.cond70.preheader:                             ; preds = %for.inc106.2, %if.end65
  %indvar37 = phi i64 [ 0, %if.end65 ], [ %indvar.next38, %for.inc106.2 ]
  %tmp146822 = phi i32 [ 0, %if.end65 ], [ %tmp1466.2, %for.inc106.2 ]
  %arrayidx82.2 = getelementptr [4 x [3 x float]]* @sec.y2, i64 0, i64 %indvar37, i64 2
  %arrayidx89.2 = getelementptr [4 x [3 x float]]* @sec.y2, i64 0, i64 %indvar37, i64 2
  %arrayidx82.1 = getelementptr [4 x [3 x float]]* @sec.y2, i64 0, i64 %indvar37, i64 1
  %arrayidx89.1 = getelementptr [4 x [3 x float]]* @sec.y2, i64 0, i64 %indvar37, i64 1
  %tmp43 = mul i64 %indvar37, 3
  %tmp44 = add i64 %tmp43, 2
  %arrayidx101.2 = getelementptr [12 x float]* @sec.y0, i64 0, i64 %tmp44
  %tmp45 = add i64 %tmp43, 1
  %arrayidx101.1 = getelementptr [12 x float]* @sec.y0, i64 0, i64 %tmp45
  %arrayidx82 = getelementptr [4 x [3 x float]]* @sec.y2, i64 0, i64 %indvar37, i64 0
  %arrayidx89 = getelementptr [4 x [3 x float]]* @sec.y2, i64 0, i64 %indvar37, i64 0
  %tmp83 = load float* %arrayidx82, align 4
  %tmp90 = load float* %arrayidx89, align 4
  %cmp91 = fcmp une float %tmp83, %tmp90
  br i1 %cmp91, label %if.then104, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.cond70.preheader
  %arrayidx101 = getelementptr [12 x float]* @sec.y0, i64 0, i64 %tmp43
  %tmp102 = load float* %arrayidx101, align 4
  %cmp103 = fcmp une float %tmp83, %tmp102
  br i1 %cmp103, label %if.then104, label %for.inc106

if.then104:                                       ; preds = %lor.lhs.false, %for.cond70.preheader
  br label %for.inc106

for.inc106:                                       ; preds = %lor.lhs.false, %if.then104
  %tmp1466 = phi i32 [ %tmp146822, %lor.lhs.false ], [ 1, %if.then104 ]
  %tmp83.1 = load float* %arrayidx82.1, align 4
  %tmp90.1 = load float* %arrayidx89.1, align 4
  %cmp91.1 = fcmp une float %tmp83.1, %tmp90.1
  br i1 %cmp91.1, label %if.then104.1, label %lor.lhs.false.1

for.end113:                                       ; preds = %for.inc106.2
  %cmp115 = icmp eq i32 %tmp1466.2, 0
  br i1 %cmp115, label %if.end126, label %if.then116

if.then116:                                       ; preds = %for.end113
  %flgd118 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %tmp119 = load i32* %flgd118, align 4
  %cmp120 = icmp eq i32 %tmp119, 0
  br i1 %cmp120, label %if.end123, label %if.then121

if.then121:                                       ; preds = %if.then116
  %call122 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s86er, i64 0, i64 0), i32 16) nounwind
  br label %if.end123

if.end123:                                        ; preds = %if.then116, %if.then121
  %add125 = add nsw i32 %tmp16113, 16
  br label %if.end126

if.end126:                                        ; preds = %for.end113, %if.end123
  %tmp16112 = phi i32 [ %tmp16113, %for.end113 ], [ %add125, %if.end123 ]
  br label %for.cond127.outer

for.cond127.outer:                                ; preds = %for.body130, %if.end126
  %tmp1465.ph = phi i32 [ 0, %if.end126 ], [ 1, %for.body130 ]
  %storemerge2.ph = phi i32 [ 0, %if.end126 ], [ %add137, %for.body130 ]
  %tmp = add i32 %storemerge2.ph, 1
  %tmp26 = zext i32 %tmp to i64
  %tmp29 = sext i32 %storemerge2.ph to i64
  %tmp31 = zext i32 %storemerge2.ph to i64
  br label %for.cond127

for.cond127:                                      ; preds = %for.cond127.outer, %for.body130
  %indvar = phi i64 [ 0, %for.cond127.outer ], [ %indvar.next, %for.body130 ]
  %tmp27 = add i64 %tmp26, %indvar
  %add137 = trunc i64 %tmp27 to i32
  %tmp33 = add i64 %tmp31, %indvar
  %storemerge2 = trunc i64 %tmp33 to i32
  %cmp129 = icmp slt i32 %storemerge2, 4
  br i1 %cmp129, label %for.body130, label %for.end145

for.body130:                                      ; preds = %for.cond127
  %tmp30 = add i64 %tmp29, %indvar
  %arrayidx134 = getelementptr [4 x [3 x float]]* @sec.y3, i64 0, i64 %tmp30, i64 0
  %tmp135 = load float* %arrayidx134, align 4
  %conv = sitofp i32 %add137 to float
  %cmp138 = fcmp une float %tmp135, %conv
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp138, label %for.cond127.outer, label %for.cond127

for.end145:                                       ; preds = %for.cond127
  %cmp147 = icmp eq i32 %tmp1465.ph, 0
  br i1 %cmp147, label %if.end160, label %if.then149

if.then149:                                       ; preds = %for.end145
  %flgd151 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %tmp152 = load i32* %flgd151, align 4
  %cmp153 = icmp eq i32 %tmp152, 0
  br i1 %cmp153, label %if.end157, label %if.then155

if.then155:                                       ; preds = %if.then149
  %call156 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s86er, i64 0, i64 0), i32 32) nounwind
  br label %if.end157

if.end157:                                        ; preds = %if.then149, %if.then155
  %add159 = add nsw i32 %tmp16112, 32
  br label %if.end160

if.end160:                                        ; preds = %for.end145, %if.end157
  %tmp16111 = phi i32 [ %tmp16112, %for.end145 ], [ %add159, %if.end157 ]
  ret i32 %tmp16111

for.inc106.1:                                     ; preds = %lor.lhs.false.1, %if.then104.1
  %tmp1466.1 = phi i32 [ %tmp1466, %lor.lhs.false.1 ], [ 1, %if.then104.1 ]
  %tmp83.2 = load float* %arrayidx82.2, align 4
  %tmp90.2 = load float* %arrayidx89.2, align 4
  %cmp91.2 = fcmp une float %tmp83.2, %tmp90.2
  br i1 %cmp91.2, label %if.then104.2, label %lor.lhs.false.2

if.then104.1:                                     ; preds = %lor.lhs.false.1, %for.inc106
  br label %for.inc106.1

lor.lhs.false.1:                                  ; preds = %for.inc106
  %tmp102.1 = load float* %arrayidx101.1, align 4
  %cmp103.1 = fcmp une float %tmp83.1, %tmp102.1
  br i1 %cmp103.1, label %if.then104.1, label %for.inc106.1

for.inc106.2:                                     ; preds = %lor.lhs.false.2, %if.then104.2
  %tmp1466.2 = phi i32 [ %tmp1466.1, %lor.lhs.false.2 ], [ 1, %if.then104.2 ]
  %indvar.next38 = add i64 %indvar37, 1
  %exitcond = icmp eq i64 %indvar.next38, 4
  br i1 %exitcond, label %for.end113, label %for.cond70.preheader

if.then104.2:                                     ; preds = %lor.lhs.false.2, %for.inc106.1
  br label %for.inc106.2

lor.lhs.false.2:                                  ; preds = %for.inc106.1
  %tmp102.2 = load float* %arrayidx101.2, align 4
  %cmp103.2 = fcmp une float %tmp83.2, %tmp102.2
  br i1 %cmp103.2, label %if.then104.2, label %for.inc106.2
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @one() nounwind uwtable readnone {
entry:
  ret i32 1
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
