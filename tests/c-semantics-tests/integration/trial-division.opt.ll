; ModuleID = '/home/david/src/c-semantics/tests/integration/trial-division.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@primes = common global i16* null, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@str = private unnamed_addr constant [7 x i8] c"------\00"

define i32 @trial_division_sqrt(i32 %n) nounwind uwtable readnone {
entry:
  %conv = uitofp i32 %n to double
  %call = tail call double @sqrt(double %conv) nounwind readnone
  %conv1 = fptoui double %call to i32
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %x.0 = phi i32 [ 2, %entry ], [ %inc, %for.body ]
  %cmp = icmp ugt i32 %x.0, %conv1
  br i1 %cmp, label %return, label %for.body

for.body:                                         ; preds = %for.cond
  %rem = urem i32 %n, %x.0
  %cmp3 = icmp eq i32 %rem, 0
  %inc = add i32 %x.0, 1
  br i1 %cmp3, label %return, label %for.cond

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ %x.0, %for.body ], [ 0, %for.cond ]
  ret i32 %retval.0
}

declare double @sqrt(double) nounwind readnone

define i32 @trial_division_squaring(i32 %n) nounwind uwtable readnone {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %x.0 = phi i32 [ 2, %entry ], [ %inc, %for.inc ]
  %x_squared.0 = phi i32 [ 4, %entry ], [ %add, %for.inc ]
  %mul = shl i32 %x.0, 1
  %sub = add i32 %mul, -1
  %cmp = icmp ule i32 %x_squared.0, %sub
  %cmp1 = icmp ugt i32 %x_squared.0, %n
  %or.cond = or i1 %cmp, %cmp1
  br i1 %or.cond, label %return, label %for.body

for.body:                                         ; preds = %for.cond
  %rem = urem i32 %n, %x.0
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %return, label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add i32 %x.0, 1
  %mul3 = shl i32 %inc, 1
  %sub4 = add i32 %x_squared.0, -1
  %add = add i32 %sub4, %mul3
  br label %for.cond

return:                                           ; preds = %for.cond, %for.body
  %retval.0 = phi i32 [ %x.0, %for.body ], [ 0, %for.cond ]
  ret i32 %retval.0
}

define i32 @trial_division_odd(i32 %n) nounwind uwtable readnone {
entry:
  %conv = uitofp i32 %n to double
  %call = tail call double @sqrt(double %conv) nounwind readnone
  %conv1 = fptoui double %call to i32
  %rem = and i32 %n, 1
  %cmp = icmp eq i32 %rem, 0
  br i1 %cmp, label %return, label %for.cond

for.cond:                                         ; preds = %entry, %for.body
  %x.0 = phi i32 [ %add, %for.body ], [ 3, %entry ]
  %cmp3 = icmp ugt i32 %x.0, %conv1
  br i1 %cmp3, label %return, label %for.body

for.body:                                         ; preds = %for.cond
  %rem5 = urem i32 %n, %x.0
  %cmp6 = icmp eq i32 %rem5, 0
  %add = add i32 %x.0, 2
  br i1 %cmp6, label %return, label %for.cond

return:                                           ; preds = %for.cond, %for.body, %entry
  %retval.0 = phi i32 [ 2, %entry ], [ 0, %for.cond ], [ %x.0, %for.body ]
  ret i32 %retval.0
}

define void @generate_prime_list(i32 %max) nounwind uwtable {
entry:
  %add = add nsw i32 %max, 1
  %conv = sext i32 %add to i64
  %call = tail call noalias i8* @calloc(i64 %conv, i64 1) nounwind
  %cmp39 = icmp slt i32 %max, 2
  br i1 %cmp39, label %for.end12, label %for.body

for.body:                                         ; preds = %entry, %for.inc10
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.inc10 ], [ 2, %entry ]
  %indvars.iv43 = phi i32 [ %indvars.iv.next44, %for.inc10 ], [ 4, %entry ]
  %num_primes.041 = phi i32 [ %num_primes.1, %for.inc10 ], [ 1, %entry ]
  %arrayidx = getelementptr inbounds i8* %call, i64 %indvars.iv50
  %0 = load i8* %arrayidx, align 1, !tbaa !0
  %tobool = icmp eq i8 %0, 0
  br i1 %tobool, label %if.then, label %for.inc10

if.then:                                          ; preds = %for.body
  %1 = sext i32 %indvars.iv43 to i64
  %inc = add nsw i32 %num_primes.041, 1
  %2 = trunc i64 %indvars.iv50 to i32
  %add2 = shl nsw i32 %2, 1
  %cmp437 = icmp sgt i32 %add2, %max
  br i1 %cmp437, label %for.inc10, label %for.body6

for.body6:                                        ; preds = %if.then, %for.body6
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.body6 ], [ %1, %if.then ]
  %j.038 = phi i32 [ %add9, %for.body6 ], [ %add2, %if.then ]
  %arrayidx8 = getelementptr inbounds i8* %call, i64 %indvars.iv47
  store i8 1, i8* %arrayidx8, align 1, !tbaa !0
  %add9 = add nsw i32 %j.038, %2
  %cmp4 = icmp sgt i32 %add9, %max
  %indvars.iv.next48 = add i64 %indvars.iv47, %indvars.iv50
  br i1 %cmp4, label %for.inc10, label %for.body6

for.inc10:                                        ; preds = %if.then, %for.body6, %for.body
  %num_primes.1 = phi i32 [ %num_primes.041, %for.body ], [ %inc, %for.body6 ], [ %inc, %if.then ]
  %indvars.iv.next51 = add i64 %indvars.iv50, 1
  %indvars.iv.next44 = add i32 %indvars.iv43, 2
  %lftr.wideiv52 = trunc i64 %indvars.iv.next51 to i32
  %exitcond53 = icmp eq i32 %lftr.wideiv52, %add
  br i1 %exitcond53, label %for.end12, label %for.body

for.end12:                                        ; preds = %for.inc10, %entry
  %num_primes.0.lcssa = phi i32 [ 1, %entry ], [ %num_primes.1, %for.inc10 ]
  %add13 = add nsw i32 %num_primes.0.lcssa, 1
  %conv14 = sext i32 %add13 to i64
  %mul = shl nsw i64 %conv14, 1
  %call15 = tail call noalias i8* @malloc(i64 %mul) nounwind
  %3 = bitcast i8* %call15 to i16*
  store i16* %3, i16** @primes, align 8, !tbaa !2
  br i1 %cmp39, label %for.end31, label %for.body19

for.body19:                                       ; preds = %for.end12, %for.inc29
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc29 ], [ 2, %for.end12 ]
  %j.136 = phi i32 [ %j.2, %for.inc29 ], [ 0, %for.end12 ]
  %arrayidx21 = getelementptr inbounds i8* %call, i64 %indvars.iv
  %4 = load i8* %arrayidx21, align 1, !tbaa !0
  %tobool22 = icmp eq i8 %4, 0
  br i1 %tobool22, label %if.then23, label %for.inc29

if.then23:                                        ; preds = %for.body19
  %conv24 = trunc i64 %indvars.iv to i16
  %idxprom25 = sext i32 %j.136 to i64
  %arrayidx26 = getelementptr inbounds i16* %3, i64 %idxprom25
  store i16 %conv24, i16* %arrayidx26, align 2, !tbaa !3
  %inc27 = add nsw i32 %j.136, 1
  br label %for.inc29

for.inc29:                                        ; preds = %for.body19, %if.then23
  %j.2 = phi i32 [ %j.136, %for.body19 ], [ %inc27, %if.then23 ]
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %add
  br i1 %exitcond, label %for.end31, label %for.body19

for.end31:                                        ; preds = %for.inc29, %for.end12
  %j.1.lcssa = phi i32 [ 0, %for.end12 ], [ %j.2, %for.inc29 ]
  %idxprom32 = sext i32 %j.1.lcssa to i64
  %arrayidx33 = getelementptr inbounds i16* %3, i64 %idxprom32
  store i16 0, i16* %arrayidx33, align 2, !tbaa !3
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
  %0 = load i16** @primes, align 8, !tbaa !2
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %prime.0 = phi i16* [ %0, %entry ], [ %incdec.ptr, %while.body ]
  %1 = load i16* %prime.0, align 2, !tbaa !3
  %conv2 = zext i16 %1 to i32
  %cmp = icmp eq i16 %1, 0
  %cmp5 = icmp ugt i32 %conv2, %conv1
  %or.cond = or i1 %cmp, %cmp5
  br i1 %or.cond, label %return, label %while.body

while.body:                                       ; preds = %while.cond
  %rem = urem i32 %n, %conv2
  %cmp8 = icmp eq i32 %rem, 0
  %incdec.ptr = getelementptr inbounds i16* %prime.0, i64 1
  br i1 %cmp8, label %return, label %while.cond

return:                                           ; preds = %while.cond, %while.body
  %retval.0 = phi i32 [ %conv2, %while.body ], [ 0, %while.cond ]
  ret i32 %retval.0
}

define i32 @main() nounwind uwtable {
entry:
  tail call void @generate_prime_list(i32 128)
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.body.i, %entry
  %x.0.i = phi i32 [ 2, %entry ], [ %inc.i, %for.body.i ]
  %cmp.i = icmp ugt i32 %x.0.i, 491
  br i1 %cmp.i, label %trial_division_sqrt.exit, label %for.body.i

for.body.i:                                       ; preds = %for.cond.i
  %rem.i = urem i32 241333, %x.0.i
  %cmp3.i = icmp eq i32 %rem.i, 0
  %inc.i = add i32 %x.0.i, 1
  br i1 %cmp3.i, label %trial_division_sqrt.exit, label %for.cond.i

trial_division_sqrt.exit:                         ; preds = %for.cond.i, %for.body.i
  %retval.0.i = phi i32 [ %x.0.i, %for.body.i ], [ 0, %for.cond.i ]
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i) nounwind
  br label %for.cond.i19

for.cond.i19:                                     ; preds = %for.inc.i, %trial_division_sqrt.exit
  %x.0.i17 = phi i32 [ 2, %trial_division_sqrt.exit ], [ %inc.i22, %for.inc.i ]
  %x_squared.0.i = phi i32 [ 4, %trial_division_sqrt.exit ], [ %add.i, %for.inc.i ]
  %mul.i = shl i32 %x.0.i17, 1
  %sub.i = add i32 %mul.i, -1
  %cmp.i18 = icmp ule i32 %x_squared.0.i, %sub.i
  %cmp1.i = icmp ugt i32 %x_squared.0.i, 241333
  %or.cond.i = or i1 %cmp.i18, %cmp1.i
  br i1 %or.cond.i, label %trial_division_squaring.exit, label %for.body.i21

for.body.i21:                                     ; preds = %for.cond.i19
  %rem.i20 = urem i32 241333, %x.0.i17
  %cmp2.i = icmp eq i32 %rem.i20, 0
  br i1 %cmp2.i, label %trial_division_squaring.exit, label %for.inc.i

for.inc.i:                                        ; preds = %for.body.i21
  %inc.i22 = add i32 %x.0.i17, 1
  %mul3.i = shl i32 %inc.i22, 1
  %sub4.i = add i32 %x_squared.0.i, -1
  %add.i = add i32 %sub4.i, %mul3.i
  br label %for.cond.i19

trial_division_squaring.exit:                     ; preds = %for.cond.i19, %for.body.i21
  %retval.0.i23 = phi i32 [ %x.0.i17, %for.body.i21 ], [ 0, %for.cond.i19 ]
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i23) nounwind
  br label %for.cond.i34

for.cond.i34:                                     ; preds = %for.body.i36, %trial_division_squaring.exit
  %x.0.i32 = phi i32 [ %add.i35, %for.body.i36 ], [ 3, %trial_division_squaring.exit ]
  %cmp3.i33 = icmp ugt i32 %x.0.i32, 491
  br i1 %cmp3.i33, label %trial_division_odd.exit, label %for.body.i36

for.body.i36:                                     ; preds = %for.cond.i34
  %rem5.i = urem i32 241333, %x.0.i32
  %cmp6.i = icmp eq i32 %rem5.i, 0
  %add.i35 = add i32 %x.0.i32, 2
  br i1 %cmp6.i, label %trial_division_odd.exit, label %for.cond.i34

trial_division_odd.exit:                          ; preds = %for.cond.i34, %for.body.i36
  %retval.0.i37 = phi i32 [ 0, %for.cond.i34 ], [ %x.0.i32, %for.body.i36 ]
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i37) nounwind
  %0 = load i16** @primes, align 8, !tbaa !2
  br label %while.cond.i45

while.cond.i45:                                   ; preds = %while.body.i49, %trial_division_odd.exit
  %prime.0.i40 = phi i16* [ %0, %trial_division_odd.exit ], [ %incdec.ptr.i48, %while.body.i49 ]
  %1 = load i16* %prime.0.i40, align 2, !tbaa !3
  %conv2.i41 = zext i16 %1 to i32
  %cmp.i42 = icmp eq i16 %1, 0
  %cmp5.i43 = icmp ugt i16 %1, 491
  %or.cond.i44 = or i1 %cmp.i42, %cmp5.i43
  br i1 %or.cond.i44, label %trial_division_sqrt.exit62, label %while.body.i49

while.body.i49:                                   ; preds = %while.cond.i45
  %rem.i46 = urem i32 241333, %conv2.i41
  %cmp8.i47 = icmp eq i32 %rem.i46, 0
  %incdec.ptr.i48 = getelementptr inbounds i16* %prime.0.i40, i64 1
  br i1 %cmp8.i47, label %trial_division_sqrt.exit62, label %while.cond.i45

trial_division_sqrt.exit62:                       ; preds = %while.body.i49, %while.cond.i45
  %retval.0.i50 = phi i32 [ %conv2.i41, %while.body.i49 ], [ 0, %while.cond.i45 ]
  %call7 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i50) nounwind
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([7 x i8]* @str, i64 0, i64 0))
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 11) nounwind
  br label %for.cond.i70

for.cond.i70:                                     ; preds = %for.inc.i78, %trial_division_sqrt.exit62
  %x.0.i63 = phi i32 [ 2, %trial_division_sqrt.exit62 ], [ %inc.i74, %for.inc.i78 ]
  %x_squared.0.i64 = phi i32 [ 4, %trial_division_sqrt.exit62 ], [ %add.i77, %for.inc.i78 ]
  %mul.i65 = shl i32 %x.0.i63, 1
  %sub.i66 = add i32 %mul.i65, -1
  %cmp.i67 = icmp ule i32 %x_squared.0.i64, %sub.i66
  %cmp1.i68 = icmp ugt i32 %x_squared.0.i64, 2144892013
  %or.cond.i69 = or i1 %cmp.i67, %cmp1.i68
  br i1 %or.cond.i69, label %trial_division_odd.exit91, label %for.body.i73

for.body.i73:                                     ; preds = %for.cond.i70
  %rem.i71 = urem i32 2144892013, %x.0.i63
  %cmp2.i72 = icmp eq i32 %rem.i71, 0
  br i1 %cmp2.i72, label %trial_division_odd.exit91, label %for.inc.i78

for.inc.i78:                                      ; preds = %for.body.i73
  %inc.i74 = add i32 %x.0.i63, 1
  %mul3.i75 = shl i32 %inc.i74, 1
  %sub4.i76 = add i32 %x_squared.0.i64, -1
  %add.i77 = add i32 %sub4.i76, %mul3.i75
  br label %for.cond.i70

trial_division_odd.exit91:                        ; preds = %for.cond.i70, %for.body.i73
  %retval.0.i79 = phi i32 [ %x.0.i63, %for.body.i73 ], [ 0, %for.cond.i70 ]
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i79) nounwind
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 11) nounwind
  %2 = load i16** @primes, align 8, !tbaa !2
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.body.i, %trial_division_odd.exit91
  %prime.0.i = phi i16* [ %2, %trial_division_odd.exit91 ], [ %incdec.ptr.i, %while.body.i ]
  %3 = load i16* %prime.0.i, align 2, !tbaa !3
  %conv2.i = zext i16 %3 to i32
  %cmp.i26 = icmp eq i16 %3, 0
  %cmp5.i = icmp ugt i16 %3, -19224
  %or.cond.i27 = or i1 %cmp.i26, %cmp5.i
  br i1 %or.cond.i27, label %trial_division_primes.exit, label %while.body.i

while.body.i:                                     ; preds = %while.cond.i
  %rem.i28 = urem i32 2144892013, %conv2.i
  %cmp8.i = icmp eq i32 %rem.i28, 0
  %incdec.ptr.i = getelementptr inbounds i16* %prime.0.i, i64 1
  br i1 %cmp8.i, label %trial_division_primes.exit, label %while.cond.i

trial_division_primes.exit:                       ; preds = %while.cond.i, %while.body.i
  %retval.0.i29 = phi i32 [ %conv2.i, %while.body.i ], [ 0, %while.cond.i ]
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %retval.0.i29) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"any pointer", metadata !0}
!3 = metadata !{metadata !"short", metadata !0}
