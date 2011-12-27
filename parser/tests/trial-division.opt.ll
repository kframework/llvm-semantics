; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/trial-division.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@primes = common global i16* null, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@str = internal constant [7 x i8] c"------\00"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @trial_division_sqrt(i32 %n) nounwind uwtable readnone {
entry:
  %conv = uitofp i32 %n to double
  %call = tail call double @sqrt(double %conv) nounwind readnone
  %conv1 = fptoui double %call to i32
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i32 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = add i32 %indvar, 2
  %cmp = icmp ugt i32 %storemerge, %conv1
  br i1 %cmp, label %return, label %for.body

for.body:                                         ; preds = %for.cond
  %rem = urem i32 %n, %storemerge
  %cmp8 = icmp eq i32 %rem, 0
  br i1 %cmp8, label %return, label %for.inc

for.inc:                                          ; preds = %for.body
  %indvar.next = add i32 %indvar, 1
  br label %for.cond

return:                                           ; preds = %for.body, %for.cond
  %storemerge1 = phi i32 [ 0, %for.cond ], [ %storemerge, %for.body ]
  ret i32 %storemerge1
}

declare double @sqrt(double) nounwind readnone

define i32 @trial_division_squaring(i32 %n) nounwind uwtable readnone {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i32 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = phi i32 [ %add, %for.inc ], [ 4, %entry ]
  %tmp = shl i32 %indvar, 1
  %sub = add i32 %tmp, 3
  %inc2 = add i32 %indvar, 2
  %cmp = icmp ugt i32 %storemerge, %sub
  %cmp4 = icmp ule i32 %storemerge, %n
  %or.cond = and i1 %cmp, %cmp4
  br i1 %or.cond, label %for.body, label %return

for.body:                                         ; preds = %for.cond
  %rem = urem i32 %n, %inc2
  %cmp7 = icmp eq i32 %rem, 0
  br i1 %cmp7, label %return, label %for.inc

for.inc:                                          ; preds = %for.body
  %mul11 = add i32 %storemerge, %tmp
  %add = add i32 %mul11, 5
  %indvar.next = add i32 %indvar, 1
  br label %for.cond

return:                                           ; preds = %for.body, %for.cond
  %storemerge1 = phi i32 [ 0, %for.cond ], [ %inc2, %for.body ]
  ret i32 %storemerge1
}

define i32 @trial_division_odd(i32 %n) nounwind uwtable readnone {
entry:
  %conv = uitofp i32 %n to double
  %call = tail call double @sqrt(double %conv) nounwind readnone
  %conv1 = fptoui double %call to i32
  %rem = and i32 %n, 1
  %cmp = icmp eq i32 %rem, 0
  br i1 %cmp, label %return, label %for.cond

for.cond:                                         ; preds = %entry, %for.inc
  %indvar = phi i32 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %tmp = shl i32 %indvar, 1
  %storemerge = add i32 %tmp, 3
  %cmp7 = icmp ugt i32 %storemerge, %conv1
  br i1 %cmp7, label %return, label %for.body

for.body:                                         ; preds = %for.cond
  %rem11 = urem i32 %n, %storemerge
  %cmp12 = icmp eq i32 %rem11, 0
  br i1 %cmp12, label %return, label %for.inc

for.inc:                                          ; preds = %for.body
  %indvar.next = add i32 %indvar, 1
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body, %entry
  %0 = phi i32 [ 2, %entry ], [ 0, %for.cond ], [ %storemerge, %for.body ]
  ret i32 %0
}

define void @generate_prime_list(i32 %max) nounwind uwtable {
entry:
  %add = add nsw i32 %max, 1
  %conv = sext i32 %add to i64
  %call = tail call noalias i8* @calloc(i64 %conv, i64 1) nounwind
  %cmp12 = icmp slt i32 %max, 2
  br i1 %cmp12, label %for.end30, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %tmp37 = add i32 %max, -2
  %tmp38 = zext i32 %tmp37 to i64
  %tmp39 = add i64 %tmp38, 1
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc27
  %indvar24 = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next25, %for.inc27 ]
  %tmp31613 = phi i32 [ 1, %for.body.lr.ph ], [ %tmp315, %for.inc27 ]
  %tmp41 = mul i64 %indvar24, 3
  %tmp34 = add i64 %tmp41, 6
  %tmp43 = shl i64 %indvar24, 1
  %tmp44 = add i64 %tmp43, 4
  %add13 = trunc i64 %tmp44 to i32
  %tmp26 = add i64 %indvar24, 2
  %arrayidx = getelementptr i8* %call, i64 %tmp26
  %tmp31 = sext i32 %add13 to i64
  %tmp9 = load i8* %arrayidx, align 1
  %tobool = icmp eq i8 %tmp9, 0
  br i1 %tobool, label %if.then, label %for.inc27

if.then:                                          ; preds = %for.body
  %inc = add nsw i32 %tmp31613, 1
  %cmp1710 = icmp sgt i32 %add13, %max
  br i1 %cmp1710, label %for.inc27, label %for.body19

for.body19:                                       ; preds = %if.then, %for.body19
  %indvar22 = phi i64 [ %indvar.next23, %for.body19 ], [ 0, %if.then ]
  %tmp27 = mul i64 %tmp26, %indvar22
  %tmp32 = add i64 %tmp31, %tmp27
  %arrayidx23 = getelementptr i8* %call, i64 %tmp32
  %tmp35 = add i64 %tmp34, %tmp27
  %add26 = trunc i64 %tmp35 to i32
  store i8 1, i8* %arrayidx23, align 1
  %cmp17 = icmp sgt i32 %add26, %max
  %indvar.next23 = add i64 %indvar22, 1
  br i1 %cmp17, label %for.inc27, label %for.body19

for.inc27:                                        ; preds = %if.then, %for.body19, %for.body
  %tmp315 = phi i32 [ %tmp31613, %for.body ], [ %inc, %for.body19 ], [ %inc, %if.then ]
  %indvar.next25 = add i64 %indvar24, 1
  %exitcond40 = icmp eq i64 %indvar.next25, %tmp39
  br i1 %exitcond40, label %for.end30, label %for.body

for.end30:                                        ; preds = %for.inc27, %entry
  %tmp316.lcssa = phi i32 [ 1, %entry ], [ %tmp315, %for.inc27 ]
  %add32 = add nsw i32 %tmp316.lcssa, 1
  %conv33 = sext i32 %add32 to i64
  %mul = shl nsw i64 %conv33, 1
  %call34 = tail call noalias i8* @malloc(i64 %mul) nounwind
  %0 = bitcast i8* %call34 to i16*
  store i16* %0, i16** @primes, align 8
  br i1 %cmp12, label %for.end60, label %for.body40.lr.ph

for.body40.lr.ph:                                 ; preds = %for.end30
  %tmp = add i32 %max, -2
  %tmp16 = zext i32 %tmp to i64
  %tmp17 = add i64 %tmp16, 1
  br label %for.body40

for.body40:                                       ; preds = %for.body40.lr.ph, %for.inc57
  %indvar = phi i64 [ 0, %for.body40.lr.ph ], [ %indvar.next, %for.inc57 ]
  %storemerge248 = phi i32 [ 0, %for.body40.lr.ph ], [ %storemerge23, %for.inc57 ]
  %tmp18 = add i64 %indvar, 2
  %arrayidx44 = getelementptr i8* %call, i64 %tmp18
  %tmp45 = load i8* %arrayidx44, align 1
  %tobool46 = icmp eq i8 %tmp45, 0
  br i1 %tobool46, label %if.then47, label %for.inc57

if.then47:                                        ; preds = %for.body40
  %conv49 = trunc i64 %tmp18 to i16
  %idxprom51 = sext i32 %storemerge248 to i64
  %tmp52 = load i16** @primes, align 8
  %arrayidx53 = getelementptr inbounds i16* %tmp52, i64 %idxprom51
  store i16 %conv49, i16* %arrayidx53, align 2
  %inc55 = add nsw i32 %storemerge248, 1
  br label %for.inc57

for.inc57:                                        ; preds = %if.then47, %for.body40
  %storemerge23 = phi i32 [ %inc55, %if.then47 ], [ %storemerge248, %for.body40 ]
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp17
  br i1 %exitcond, label %for.cond35.for.end60_crit_edge, label %for.body40

for.cond35.for.end60_crit_edge:                   ; preds = %for.inc57
  %tmp63.pre = load i16** @primes, align 8
  br label %for.end60

for.end60:                                        ; preds = %for.cond35.for.end60_crit_edge, %for.end30
  %tmp63 = phi i16* [ %tmp63.pre, %for.cond35.for.end60_crit_edge ], [ %0, %for.end30 ]
  %storemerge24.lcssa = phi i32 [ %storemerge23, %for.cond35.for.end60_crit_edge ], [ 0, %for.end30 ]
  %idxprom62 = sext i32 %storemerge24.lcssa to i64
  %arrayidx64 = getelementptr inbounds i16* %tmp63, i64 %idxprom62
  store i16 0, i16* %arrayidx64, align 2
  tail call void @free(i8* %call) nounwind
  ret void
}

declare noalias i8* @calloc(i64, i64) nounwind

declare noalias i8* @malloc(i64) nounwind

declare void @free(i8* nocapture) nounwind

define i32 @trial_division_primes(i32 %n) nounwind uwtable readonly {
entry:
  %conv = uitofp i32 %n to double
  %call = tail call double @sqrt(double %conv) nounwind readnone
  %conv1 = fptoui double %call to i32
  %tmp3 = load i16** @primes, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %indvar = phi i64 [ %indvar.next, %if.end ], [ 0, %entry ]
  %storemerge = getelementptr i16* %tmp3, i64 %indvar
  %tmp5 = load i16* %storemerge, align 2
  %cmp = icmp eq i16 %tmp5, 0
  br i1 %cmp, label %return, label %land.rhs

land.rhs:                                         ; preds = %while.cond
  %conv10 = zext i16 %tmp5 to i32
  %cmp12 = icmp ugt i32 %conv10, %conv1
  br i1 %cmp12, label %return, label %while.body

while.body:                                       ; preds = %land.rhs
  %rem = urem i32 %n, %conv10
  %cmp18 = icmp eq i32 %rem, 0
  br i1 %cmp18, label %return, label %if.end

if.end:                                           ; preds = %while.body
  %indvar.next = add i64 %indvar, 1
  br label %while.cond

return:                                           ; preds = %land.rhs, %while.body, %while.cond
  %storemerge1 = phi i32 [ 0, %while.cond ], [ 0, %land.rhs ], [ %conv10, %while.body ]
  ret i32 %storemerge1
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @generate_prime_list(i32 128)
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %indvar.i = phi i32 [ %indvar.next.i, %for.inc.i ], [ 0, %entry ]
  %storemerge.i = add i32 %indvar.i, 2
  %cmp.i = icmp ugt i32 %storemerge.i, 491
  br i1 %cmp.i, label %trial_division_sqrt.exit, label %for.body.i

for.body.i:                                       ; preds = %for.cond.i
  %rem.i = urem i32 241333, %storemerge.i
  %cmp8.i = icmp eq i32 %rem.i, 0
  br i1 %cmp8.i, label %trial_division_sqrt.exit, label %for.inc.i

for.inc.i:                                        ; preds = %for.body.i
  %indvar.next.i = add i32 %indvar.i, 1
  br label %for.cond.i

trial_division_sqrt.exit:                         ; preds = %for.cond.i, %for.body.i
  %storemerge1.i = phi i32 [ 0, %for.cond.i ], [ %storemerge.i, %for.body.i ]
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %storemerge1.i) nounwind
  br label %for.cond.i10

for.cond.i10:                                     ; preds = %for.inc.i14, %trial_division_sqrt.exit
  %indvar.i7 = phi i32 [ %indvar.next.i13, %for.inc.i14 ], [ 0, %trial_division_sqrt.exit ]
  %storemerge.i8 = phi i32 [ %add.i, %for.inc.i14 ], [ 4, %trial_division_sqrt.exit ]
  %inc2.i = add i32 %indvar.i7, 2
  %tmp103 = shl i32 %indvar.i7, 1
  %mul11.i = add i32 %tmp103, 5
  %sub.i = add i32 %tmp103, 3
  %cmp.i9 = icmp ugt i32 %storemerge.i8, %sub.i
  %cmp4.i = icmp ult i32 %storemerge.i8, 241334
  %or.cond.i = and i1 %cmp.i9, %cmp4.i
  br i1 %or.cond.i, label %for.body.i12, label %trial_division_squaring.exit

for.body.i12:                                     ; preds = %for.cond.i10
  %rem.i11 = urem i32 241333, %inc2.i
  %cmp7.i = icmp eq i32 %rem.i11, 0
  br i1 %cmp7.i, label %trial_division_squaring.exit, label %for.inc.i14

for.inc.i14:                                      ; preds = %for.body.i12
  %add.i = add i32 %mul11.i, %storemerge.i8
  %indvar.next.i13 = add i32 %indvar.i7, 1
  br label %for.cond.i10

trial_division_squaring.exit:                     ; preds = %for.cond.i10, %for.body.i12
  %storemerge1.i15 = phi i32 [ 0, %for.cond.i10 ], [ %inc2.i, %for.body.i12 ]
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %storemerge1.i15) nounwind
  br label %for.cond.i39

for.cond.i39:                                     ; preds = %trial_division_squaring.exit, %for.inc.i44
  %indvar.i35 = phi i32 [ %indvar.next.i43, %for.inc.i44 ], [ 0, %trial_division_squaring.exit ]
  %tmp100 = shl i32 %indvar.i35, 1
  %storemerge.i37 = add i32 %tmp100, 3
  %cmp7.i38 = icmp ugt i32 %storemerge.i37, 491
  br i1 %cmp7.i38, label %trial_division_odd.exit45, label %for.body.i42

for.body.i42:                                     ; preds = %for.cond.i39
  %rem11.i40 = urem i32 241333, %storemerge.i37
  %cmp12.i41 = icmp eq i32 %rem11.i40, 0
  br i1 %cmp12.i41, label %trial_division_odd.exit45, label %for.inc.i44

for.inc.i44:                                      ; preds = %for.body.i42
  %indvar.next.i43 = add i32 %indvar.i35, 1
  br label %for.cond.i39

trial_division_odd.exit45:                        ; preds = %for.cond.i39, %for.body.i42
  %0 = phi i32 [ 0, %for.cond.i39 ], [ %storemerge.i37, %for.body.i42 ]
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %0) nounwind
  %tmp3.i49 = load i16** @primes, align 8
  br label %while.cond.i54

while.cond.i54:                                   ; preds = %if.end.i62, %trial_division_odd.exit45
  %indvar.i50 = phi i64 [ %indvar.next.i61, %if.end.i62 ], [ 0, %trial_division_odd.exit45 ]
  %storemerge.i51 = getelementptr i16* %tmp3.i49, i64 %indvar.i50
  %tmp5.i52 = load i16* %storemerge.i51, align 2
  %cmp.i53 = icmp eq i16 %tmp5.i52, 0
  br i1 %cmp.i53, label %trial_division_primes.exit64, label %land.rhs.i57

land.rhs.i57:                                     ; preds = %while.cond.i54
  %conv10.i55 = zext i16 %tmp5.i52 to i32
  %cmp12.i56 = icmp ugt i16 %tmp5.i52, 491
  br i1 %cmp12.i56, label %trial_division_primes.exit64, label %while.body.i60

while.body.i60:                                   ; preds = %land.rhs.i57
  %rem.i58 = urem i32 241333, %conv10.i55
  %cmp18.i59 = icmp eq i32 %rem.i58, 0
  br i1 %cmp18.i59, label %trial_division_primes.exit64, label %if.end.i62

if.end.i62:                                       ; preds = %while.body.i60
  %indvar.next.i61 = add i64 %indvar.i50, 1
  br label %while.cond.i54

trial_division_primes.exit64:                     ; preds = %while.cond.i54, %land.rhs.i57, %while.body.i60
  %storemerge1.i63 = phi i32 [ 0, %while.cond.i54 ], [ 0, %land.rhs.i57 ], [ %conv10.i55, %while.body.i60 ]
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %storemerge1.i63) nounwind
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str, i64 0, i64 0))
  br label %for.body.i71

for.body.i71:                                     ; preds = %trial_division_primes.exit64, %for.inc.i73
  %indvar.i65 = phi i32 [ %indvar.next.i72, %for.inc.i73 ], [ 0, %trial_division_primes.exit64 ]
  %storemerge.i66 = add i32 %indvar.i65, 2
  %rem.i69 = urem i32 2144892013, %storemerge.i66
  %cmp8.i70 = icmp eq i32 %rem.i69, 0
  br i1 %cmp8.i70, label %trial_division_sqrt.exit75, label %for.inc.i73

for.inc.i73:                                      ; preds = %for.body.i71
  %indvar.next.i72 = add i32 %indvar.i65, 1
  br label %for.body.i71

trial_division_sqrt.exit75:                       ; preds = %for.body.i71
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 11) nounwind
  br label %for.cond.i84

for.cond.i84:                                     ; preds = %for.inc.i91, %trial_division_sqrt.exit75
  %indvar.i76 = phi i32 [ %indvar.next.i90, %for.inc.i91 ], [ 0, %trial_division_sqrt.exit75 ]
  %storemerge.i77 = phi i32 [ %add.i89, %for.inc.i91 ], [ 4, %trial_division_sqrt.exit75 ]
  %inc2.i80 = add i32 %indvar.i76, 2
  %tmp96 = shl i32 %indvar.i76, 1
  %mul11.i88 = add i32 %tmp96, 5
  %sub.i79 = add i32 %tmp96, 3
  %cmp.i81 = icmp ugt i32 %storemerge.i77, %sub.i79
  %cmp4.i82 = icmp ult i32 %storemerge.i77, 2144892014
  %or.cond.i83 = and i1 %cmp.i81, %cmp4.i82
  br i1 %or.cond.i83, label %for.body.i87, label %trial_division_squaring.exit93

for.body.i87:                                     ; preds = %for.cond.i84
  %rem.i85 = urem i32 2144892013, %inc2.i80
  %cmp7.i86 = icmp eq i32 %rem.i85, 0
  br i1 %cmp7.i86, label %trial_division_squaring.exit93, label %for.inc.i91

for.inc.i91:                                      ; preds = %for.body.i87
  %add.i89 = add i32 %mul11.i88, %storemerge.i77
  %indvar.next.i90 = add i32 %indvar.i76, 1
  br label %for.cond.i84

trial_division_squaring.exit93:                   ; preds = %for.cond.i84, %for.body.i87
  %storemerge1.i92 = phi i32 [ 0, %for.cond.i84 ], [ %inc2.i80, %for.body.i87 ]
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %storemerge1.i92) nounwind
  br label %for.body.i27

for.body.i27:                                     ; preds = %for.inc.i29, %trial_division_squaring.exit93
  %indvar.i21 = phi i32 [ %indvar.next.i28, %for.inc.i29 ], [ 0, %trial_division_squaring.exit93 ]
  %tmp = shl i32 %indvar.i21, 1
  %storemerge.i23 = add i32 %tmp, 3
  %rem11.i = urem i32 2144892013, %storemerge.i23
  %cmp12.i26 = icmp eq i32 %rem11.i, 0
  br i1 %cmp12.i26, label %trial_division_odd.exit, label %for.inc.i29

for.inc.i29:                                      ; preds = %for.body.i27
  %indvar.next.i28 = add i32 %indvar.i21, 1
  br label %for.body.i27

trial_division_odd.exit:                          ; preds = %for.body.i27
  %call20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 11) nounwind
  %tmp3.i = load i16** @primes, align 8
  br label %while.cond.i

while.cond.i:                                     ; preds = %if.end.i, %trial_division_odd.exit
  %indvar.i1 = phi i64 [ %indvar.next.i5, %if.end.i ], [ 0, %trial_division_odd.exit ]
  %storemerge.i2 = getelementptr i16* %tmp3.i, i64 %indvar.i1
  %tmp5.i = load i16* %storemerge.i2, align 2
  %cmp.i3 = icmp eq i16 %tmp5.i, 0
  br i1 %cmp.i3, label %trial_division_primes.exit, label %land.rhs.i

land.rhs.i:                                       ; preds = %while.cond.i
  %conv10.i = zext i16 %tmp5.i to i32
  %cmp12.i = icmp ugt i16 %tmp5.i, -19224
  br i1 %cmp12.i, label %trial_division_primes.exit, label %while.body.i

while.body.i:                                     ; preds = %land.rhs.i
  %rem.i4 = urem i32 2144892013, %conv10.i
  %cmp18.i = icmp eq i32 %rem.i4, 0
  br i1 %cmp18.i, label %trial_division_primes.exit, label %if.end.i

if.end.i:                                         ; preds = %while.body.i
  %indvar.next.i5 = add i64 %indvar.i1, 1
  br label %while.cond.i

trial_division_primes.exit:                       ; preds = %while.cond.i, %land.rhs.i, %while.body.i
  %storemerge1.i6 = phi i32 [ 0, %while.cond.i ], [ 0, %land.rhs.i ], [ %conv10.i, %while.body.i ]
  %call23 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %storemerge1.i6) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind
