; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-08-s61.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@svtest.k = internal unnamed_addr global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s61er = internal global [10 x i8] c"s61,er%d\0A\00", align 1
@sec.qs61 = internal global [8 x i8] c"s61    \00", align 1
@sec.upper_alpha = internal global [27 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZ\00", align 16
@sec.lower_alpha = internal global [27 x i8] c"abcdefghijklmnopqrstuvwxyz\00", align 16
@sec.numbers = internal global [11 x i8] c"0123456789\00", align 1
@sec.special_characters = internal global [28 x i8] c"~!\22#%&()_=-^|{}[]+;*:<>,.?/\00", align 16
@sec.extra_special_characters = internal global [8 x i8] c"\0A\09\08\0D\0C\5C'\00", align 1
@sec.blank_and_NUL = internal global [3 x i8] c" \00\00", align 1
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
  %pc = alloca [6 x i8*], align 16
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %entry
  %indvar19 = phi i64 [ %indvar.next20, %while.cond ], [ 0, %entry ]
  %incdec.ptr46 = getelementptr %struct.defs* %pd0, i64 0, i32 15, i64 %indvar19
  %incdec.ptr5 = getelementptr [8 x i8]* @sec.qs61, i64 0, i64 %indvar19
  %tmp2 = load i8* %incdec.ptr5, align 1
  store i8 %tmp2, i8* %incdec.ptr46, align 1
  %tobool = icmp eq i8 %tmp2, 0
  %indvar.next20 = add i64 %indvar19, 1
  br i1 %tobool, label %if.end14, label %while.cond

if.end14:                                         ; preds = %while.cond
  %arrayidx = getelementptr inbounds [6 x i8*]* %pc, i64 0, i64 0
  store i8* getelementptr inbounds ([27 x i8]* @sec.upper_alpha, i64 0, i64 0), i8** %arrayidx, align 16
  %arrayidx15 = getelementptr inbounds [6 x i8*]* %pc, i64 0, i64 1
  store i8* getelementptr inbounds ([27 x i8]* @sec.lower_alpha, i64 0, i64 0), i8** %arrayidx15, align 8
  %arrayidx16 = getelementptr inbounds [6 x i8*]* %pc, i64 0, i64 2
  store i8* getelementptr inbounds ([11 x i8]* @sec.numbers, i64 0, i64 0), i8** %arrayidx16, align 16
  %arrayidx17 = getelementptr inbounds [6 x i8*]* %pc, i64 0, i64 3
  store i8* getelementptr inbounds ([28 x i8]* @sec.special_characters, i64 0, i64 0), i8** %arrayidx17, align 8
  %arrayidx18 = getelementptr inbounds [6 x i8*]* %pc, i64 0, i64 4
  store i8* getelementptr inbounds ([8 x i8]* @sec.extra_special_characters, i64 0, i64 0), i8** %arrayidx18, align 16
  %arrayidx19 = getelementptr inbounds [6 x i8*]* %pc, i64 0, i64 5
  store i8* getelementptr inbounds ([3 x i8]* @sec.blank_and_NUL, i64 0, i64 0), i8** %arrayidx19, align 8
  br label %while.cond23.outer

while.cond23.outer:                               ; preds = %if.end14, %if.then39
  %arrayidx25.promoted = phi i8* [ %incdec.ptr34, %if.then39 ], [ getelementptr inbounds ([27 x i8]* @sec.upper_alpha, i64 0, i64 0), %if.end14 ]
  %tmp433.ph = phi i32 [ 1, %if.then39 ], [ 0, %if.end14 ]
  br label %while.cond23

while.cond23:                                     ; preds = %while.cond23.outer, %while.body29
  %indvar = phi i64 [ 0, %while.cond23.outer ], [ %tmp, %while.body29 ]
  %incdec.ptr3410 = getelementptr i8* %arrayidx25.promoted, i64 %indvar
  %tmp = add i64 %indvar, 1
  %incdec.ptr34 = getelementptr i8* %arrayidx25.promoted, i64 %tmp
  %tmp27 = load i8* %incdec.ptr3410, align 1
  %tobool28 = icmp eq i8 %tmp27, 0
  br i1 %tobool28, label %for.inc, label %while.body29

while.body29:                                     ; preds = %while.cond23
  %cmp37 = icmp slt i8 %tmp27, 0
  br i1 %cmp37, label %if.then39, label %while.cond23

if.then39:                                        ; preds = %while.body29
  store i8* %incdec.ptr34, i8** %arrayidx, align 16
  br label %while.cond23.outer

for.inc:                                          ; preds = %while.cond23
  store i8* %incdec.ptr3410, i8** %arrayidx, align 16
  br label %while.cond23.outer.1

if.then46:                                        ; preds = %for.inc.5
  %flgd50 = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %tmp51 = load i32* %flgd50, align 4
  %cmp52 = icmp eq i32 %tmp51, 0
  br i1 %cmp52, label %if.end101, label %if.then54

if.then54:                                        ; preds = %if.then46
  %call55 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s61er, i64 0, i64 0), i32 2) nounwind
  br label %if.end101

if.end101:                                        ; preds = %if.then54, %if.then46, %for.inc.5
  %tmp1022.ph = phi i32 [ 2, %if.then54 ], [ 2, %if.then46 ], [ 0, %for.inc.5 ]
  ret i32 %tmp1022.ph

for.inc.1:                                        ; preds = %while.cond23.1
  store i8* %incdec.ptr3410.1, i8** %arrayidx15, align 8
  br label %while.cond23.outer.2

while.cond23.1:                                   ; preds = %while.cond23.outer.1, %while.body29.1
  %indvar.1 = phi i64 [ 0, %while.cond23.outer.1 ], [ %tmp.1, %while.body29.1 ]
  %incdec.ptr3410.1 = getelementptr i8* %arrayidx25.promoted.1, i64 %indvar.1
  %tmp.1 = add i64 %indvar.1, 1
  %incdec.ptr34.1 = getelementptr i8* %arrayidx25.promoted.1, i64 %tmp.1
  %tmp27.1 = load i8* %incdec.ptr3410.1, align 1
  %tobool28.1 = icmp eq i8 %tmp27.1, 0
  br i1 %tobool28.1, label %for.inc.1, label %while.body29.1

if.then39.1:                                      ; preds = %while.body29.1
  store i8* %incdec.ptr34.1, i8** %arrayidx15, align 8
  br label %while.cond23.outer.1

while.body29.1:                                   ; preds = %while.cond23.1
  %cmp37.1 = icmp slt i8 %tmp27.1, 0
  br i1 %cmp37.1, label %if.then39.1, label %while.cond23.1

while.cond23.outer.1:                             ; preds = %if.then39.1, %for.inc
  %arrayidx25.promoted.1 = phi i8* [ %incdec.ptr34.1, %if.then39.1 ], [ getelementptr inbounds ([27 x i8]* @sec.lower_alpha, i64 0, i64 0), %for.inc ]
  %tmp433.ph.1 = phi i32 [ 1, %if.then39.1 ], [ %tmp433.ph, %for.inc ]
  br label %while.cond23.1

for.inc.2:                                        ; preds = %while.cond23.2
  store i8* %incdec.ptr3410.2, i8** %arrayidx16, align 16
  br label %while.cond23.outer.3

while.cond23.2:                                   ; preds = %while.cond23.outer.2, %while.body29.2
  %indvar.2 = phi i64 [ 0, %while.cond23.outer.2 ], [ %tmp.2, %while.body29.2 ]
  %incdec.ptr3410.2 = getelementptr i8* %arrayidx25.promoted.2, i64 %indvar.2
  %tmp.2 = add i64 %indvar.2, 1
  %incdec.ptr34.2 = getelementptr i8* %arrayidx25.promoted.2, i64 %tmp.2
  %tmp27.2 = load i8* %incdec.ptr3410.2, align 1
  %tobool28.2 = icmp eq i8 %tmp27.2, 0
  br i1 %tobool28.2, label %for.inc.2, label %while.body29.2

if.then39.2:                                      ; preds = %while.body29.2
  store i8* %incdec.ptr34.2, i8** %arrayidx16, align 16
  br label %while.cond23.outer.2

while.body29.2:                                   ; preds = %while.cond23.2
  %cmp37.2 = icmp slt i8 %tmp27.2, 0
  br i1 %cmp37.2, label %if.then39.2, label %while.cond23.2

while.cond23.outer.2:                             ; preds = %if.then39.2, %for.inc.1
  %arrayidx25.promoted.2 = phi i8* [ %incdec.ptr34.2, %if.then39.2 ], [ getelementptr inbounds ([11 x i8]* @sec.numbers, i64 0, i64 0), %for.inc.1 ]
  %tmp433.ph.2 = phi i32 [ 1, %if.then39.2 ], [ %tmp433.ph.1, %for.inc.1 ]
  br label %while.cond23.2

for.inc.3:                                        ; preds = %while.cond23.3
  store i8* %incdec.ptr3410.3, i8** %arrayidx17, align 8
  br label %while.cond23.outer.4

while.cond23.3:                                   ; preds = %while.cond23.outer.3, %while.body29.3
  %indvar.3 = phi i64 [ 0, %while.cond23.outer.3 ], [ %tmp.3, %while.body29.3 ]
  %incdec.ptr3410.3 = getelementptr i8* %arrayidx25.promoted.3, i64 %indvar.3
  %tmp.3 = add i64 %indvar.3, 1
  %incdec.ptr34.3 = getelementptr i8* %arrayidx25.promoted.3, i64 %tmp.3
  %tmp27.3 = load i8* %incdec.ptr3410.3, align 1
  %tobool28.3 = icmp eq i8 %tmp27.3, 0
  br i1 %tobool28.3, label %for.inc.3, label %while.body29.3

if.then39.3:                                      ; preds = %while.body29.3
  store i8* %incdec.ptr34.3, i8** %arrayidx17, align 8
  br label %while.cond23.outer.3

while.body29.3:                                   ; preds = %while.cond23.3
  %cmp37.3 = icmp slt i8 %tmp27.3, 0
  br i1 %cmp37.3, label %if.then39.3, label %while.cond23.3

while.cond23.outer.3:                             ; preds = %if.then39.3, %for.inc.2
  %arrayidx25.promoted.3 = phi i8* [ %incdec.ptr34.3, %if.then39.3 ], [ getelementptr inbounds ([28 x i8]* @sec.special_characters, i64 0, i64 0), %for.inc.2 ]
  %tmp433.ph.3 = phi i32 [ 1, %if.then39.3 ], [ %tmp433.ph.2, %for.inc.2 ]
  br label %while.cond23.3

for.inc.4:                                        ; preds = %while.cond23.4
  store i8* %incdec.ptr3410.4, i8** %arrayidx18, align 16
  br label %while.cond23.outer.5

while.cond23.4:                                   ; preds = %while.cond23.outer.4, %while.body29.4
  %indvar.4 = phi i64 [ 0, %while.cond23.outer.4 ], [ %tmp.4, %while.body29.4 ]
  %incdec.ptr3410.4 = getelementptr i8* %arrayidx25.promoted.4, i64 %indvar.4
  %tmp.4 = add i64 %indvar.4, 1
  %incdec.ptr34.4 = getelementptr i8* %arrayidx25.promoted.4, i64 %tmp.4
  %tmp27.4 = load i8* %incdec.ptr3410.4, align 1
  %tobool28.4 = icmp eq i8 %tmp27.4, 0
  br i1 %tobool28.4, label %for.inc.4, label %while.body29.4

if.then39.4:                                      ; preds = %while.body29.4
  store i8* %incdec.ptr34.4, i8** %arrayidx18, align 16
  br label %while.cond23.outer.4

while.body29.4:                                   ; preds = %while.cond23.4
  %cmp37.4 = icmp slt i8 %tmp27.4, 0
  br i1 %cmp37.4, label %if.then39.4, label %while.cond23.4

while.cond23.outer.4:                             ; preds = %if.then39.4, %for.inc.3
  %arrayidx25.promoted.4 = phi i8* [ %incdec.ptr34.4, %if.then39.4 ], [ getelementptr inbounds ([8 x i8]* @sec.extra_special_characters, i64 0, i64 0), %for.inc.3 ]
  %tmp433.ph.4 = phi i32 [ 1, %if.then39.4 ], [ %tmp433.ph.3, %for.inc.3 ]
  br label %while.cond23.4

for.inc.5:                                        ; preds = %while.cond23.5
  store i8* %incdec.ptr3410.5, i8** %arrayidx19, align 8
  %cmp44 = icmp eq i32 %tmp433.ph.5, 0
  br i1 %cmp44, label %if.end101, label %if.then46

while.cond23.5:                                   ; preds = %while.cond23.outer.5, %while.body29.5
  %indvar.5 = phi i64 [ 0, %while.cond23.outer.5 ], [ %tmp.5, %while.body29.5 ]
  %incdec.ptr3410.5 = getelementptr i8* %arrayidx25.promoted.5, i64 %indvar.5
  %tmp.5 = add i64 %indvar.5, 1
  %incdec.ptr34.5 = getelementptr i8* %arrayidx25.promoted.5, i64 %tmp.5
  %tmp27.5 = load i8* %incdec.ptr3410.5, align 1
  %tobool28.5 = icmp eq i8 %tmp27.5, 0
  br i1 %tobool28.5, label %for.inc.5, label %while.body29.5

if.then39.5:                                      ; preds = %while.body29.5
  store i8* %incdec.ptr34.5, i8** %arrayidx19, align 8
  br label %while.cond23.outer.5

while.body29.5:                                   ; preds = %while.cond23.5
  %cmp37.5 = icmp slt i8 %tmp27.5, 0
  br i1 %cmp37.5, label %if.then39.5, label %while.cond23.5

while.cond23.outer.5:                             ; preds = %if.then39.5, %for.inc.4
  %arrayidx25.promoted.5 = phi i8* [ %incdec.ptr34.5, %if.then39.5 ], [ getelementptr inbounds ([3 x i8]* @sec.blank_and_NUL, i64 0, i64 0), %for.inc.4 ]
  %tmp433.ph.5 = phi i32 [ 1, %if.then39.5 ], [ %tmp433.ph.4, %for.inc.4 ]
  br label %while.cond23.5
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
