; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/cq-16-s85.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.defs = type { i32, i32, i32, i32, i32, i32, i32, float, float, i32, i32, i32, i32, i32, i32, [8 x i8] }
%struct.tnode = type { [20 x i8], i32, %struct.tnode*, %struct.tnode* }

@setupTable.qs26 = internal global [8 x i8] c"s26    \00", align 1
@svtest.k = internal unnamed_addr global i32 0, align 4
@extvar = common global i32 0, align 4
@sec.s85er = internal global [10 x i8] c"s85,er%d\0A\00", align 1
@sec.qs85 = internal global [8 x i8] c"s85    \00", align 1
@.str = private unnamed_addr constant [5 x i8] c"char\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"short\00", align 1
@.str2 = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str3 = private unnamed_addr constant [5 x i8] c"long\00", align 1
@.str4 = private unnamed_addr constant [9 x i8] c"unsigned\00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"float\00", align 1
@.str6 = private unnamed_addr constant [7 x i8] c"double\00", align 1
@sec.aln = internal global [13 x i8] c" alignment: \00", align 1
@.str7 = private unnamed_addr constant [18 x i8] c"VOLATILE: %s%s%d\0A\00", align 1
@main.d0 = internal global %struct.defs zeroinitializer, align 4
@.str10 = private unnamed_addr constant [25 x i8] c"Section %s returned %d.\0A\00", align 1
@str = internal constant [35 x i8] c"VOLATILE: Sign extension in fields\00"
@str1 = internal constant [51 x i8] c"VOLATILE: Be especially careful with 1-bit fields!\00"
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
  %s1 = alloca %struct.tnode, align 8
  %diff = alloca [7 x i32], align 16
  br label %while.cond

while.cond:                                       ; preds = %while.cond, %entry
  %indvar = phi i64 [ %indvar.next, %while.cond ], [ 0, %entry ]
  %incdec.ptr46 = getelementptr %struct.defs* %pd0, i64 0, i32 15, i64 %indvar
  %incdec.ptr5 = getelementptr [8 x i8]* @sec.qs85, i64 0, i64 %indvar
  %tmp2 = load i8* %incdec.ptr5, align 1
  store i8 %tmp2, i8* %incdec.ptr46, align 1
  %tobool = icmp eq i8 %tmp2, 0
  %indvar.next = add i64 %indvar, 1
  br i1 %tobool, label %lor.lhs.false, label %while.cond

lor.lhs.false:                                    ; preds = %while.cond
  %left = getelementptr inbounds %struct.tnode* %s1, i64 0, i32 2
  %count5 = getelementptr inbounds %struct.tnode* %s1, i64 0, i32 1
  %sub.ptr.lhs.cast6 = ptrtoint %struct.tnode** %left to i64
  %sub.ptr.rhs.cast7 = ptrtoint i32* %count5 to i64
  %sub.ptr.sub8 = sub i64 %sub.ptr.lhs.cast6, %sub.ptr.rhs.cast7
  %cmp9 = icmp slt i64 %sub.ptr.sub8, 1
  br i1 %cmp9, label %if.then, label %lor.lhs.false10

lor.lhs.false10:                                  ; preds = %lor.lhs.false
  %right = getelementptr inbounds %struct.tnode* %s1, i64 0, i32 3
  %sub.ptr.lhs.cast12 = ptrtoint %struct.tnode** %right to i64
  %sub.ptr.sub14 = sub i64 %sub.ptr.lhs.cast12, %sub.ptr.lhs.cast6
  %cmp15 = icmp slt i64 %sub.ptr.sub14, 1
  br i1 %cmp15, label %if.then, label %if.end21

if.then:                                          ; preds = %lor.lhs.false10, %lor.lhs.false
  %flgd = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 11
  %tmp17 = load i32* %flgd, align 4
  %cmp18 = icmp eq i32 %tmp17, 0
  br i1 %cmp18, label %if.end21, label %if.then19

if.then19:                                        ; preds = %if.then
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @sec.s85er, i64 0, i64 0), i32 1) nounwind
  br label %if.end21

if.end21:                                         ; preds = %if.then19, %if.then, %lor.lhs.false10
  %tmp2174 = phi i32 [ 0, %lor.lhs.false10 ], [ 1, %if.then ], [ 1, %if.then19 ]
  %arrayidx25 = getelementptr inbounds [7 x i32]* %diff, i64 0, i64 0
  store i32 1, i32* %arrayidx25, align 16
  %arrayidx31 = getelementptr inbounds [7 x i32]* %diff, i64 0, i64 1
  store i32 2, i32* %arrayidx31, align 4
  %arrayidx37 = getelementptr inbounds [7 x i32]* %diff, i64 0, i64 2
  store i32 4, i32* %arrayidx37, align 8
  %arrayidx43 = getelementptr inbounds [7 x i32]* %diff, i64 0, i64 3
  store i32 8, i32* %arrayidx43, align 4
  %arrayidx49 = getelementptr inbounds [7 x i32]* %diff, i64 0, i64 4
  store i32 4, i32* %arrayidx49, align 16
  %arrayidx55 = getelementptr inbounds [7 x i32]* %diff, i64 0, i64 5
  store i32 4, i32* %arrayidx55, align 4
  %arrayidx61 = getelementptr inbounds [7 x i32]* %diff, i64 0, i64 6
  store i32 8, i32* %arrayidx61, align 8
  %flgm = getelementptr inbounds %struct.defs* %pd0, i64 0, i32 10
  %tmp63 = load i32* %flgm, align 4
  %cmp64 = icmp eq i32 %tmp63, 0
  br i1 %cmp64, label %if.end216, label %for.cond.preheader

for.cond.preheader:                               ; preds = %if.end21
  %call77 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @sec.aln, i64 0, i64 0), i32 1) nounwind
  %call77.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str1, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @sec.aln, i64 0, i64 0), i32 2) nounwind
  %call77.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str2, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @sec.aln, i64 0, i64 0), i32 4) nounwind
  %call77.3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8]* @.str3, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @sec.aln, i64 0, i64 0), i32 8) nounwind
  %call77.4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([9 x i8]* @.str4, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @sec.aln, i64 0, i64 0), i32 4) nounwind
  %call77.5 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8]* @.str5, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @sec.aln, i64 0, i64 0), i32 4) nounwind
  %call77.6 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str7, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8]* @.str6, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8]* @sec.aln, i64 0, i64 0), i32 8) nounwind
  %tmp96.pr = load i32* %flgm, align 4
  %cmp97 = icmp eq i32 %tmp96.pr, 0
  br i1 %cmp97, label %if.end216, label %if.end113

if.end113:                                        ; preds = %for.cond.preheader
  %puts = call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str, i64 0, i64 0))
  %tmp121.pr.pr = load i32* %flgm, align 4
  %cmp122 = icmp eq i32 %tmp121.pr.pr, 0
  br i1 %cmp122, label %if.end216, label %if.then124

if.then124:                                       ; preds = %if.end113
  %puts7 = call i32 @puts(i8* getelementptr inbounds ([51 x i8]* @str1, i64 0, i64 0))
  br label %if.end216

if.end216:                                        ; preds = %if.then124, %if.end113, %for.cond.preheader, %if.end21
  ret i32 %tmp2174
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
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([25 x i8]* @.str10, i64 0, i64 0), i8* getelementptr inbounds (%struct.defs* @main.d0, i64 0, i32 15, i64 0), i32 %call) nounwind
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
