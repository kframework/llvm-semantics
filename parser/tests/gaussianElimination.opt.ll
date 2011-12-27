; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/gaussianElimination.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.b = internal unnamed_addr constant [3 x double] [double 2.000000e+02, double 0.000000e+00, double 0.000000e+00], align 16
@main.a = internal unnamed_addr constant [3 x [3 x double]] [[3 x double] [double 1.000000e+02, double 1.000000e+02, double 1.000000e+02], [3 x double] [double -1.000000e+02, double 3.000000e+02, double -1.000000e+02], [3 x double] [double -1.000000e+02, double -1.000000e+02, double 3.000000e+02]], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@str = internal constant [35 x i8] c"The matrix dimension is too large.\00"

define i32 @main() nounwind uwtable {
entry:
  %x = alloca [3 x double], align 16
  %b = alloca [3 x double], align 16
  %a = alloca [3 x [3 x double]], align 16
  %indx = alloca [3 x i32], align 4
  %tmp = bitcast [3 x double]* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([3 x double]* @main.b to i8*), i64 24, i32 16, i1 false)
  %tmp2 = bitcast [3 x [3 x double]]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([3 x [3 x double]]* @main.a to i8*), i64 72, i32 16, i1 false)
  %arraydecay = getelementptr inbounds [3 x [3 x double]]* %a, i64 0, i64 0
  %arraydecay7 = getelementptr inbounds [3 x double]* %b, i64 0, i64 0
  %arraydecay8 = getelementptr inbounds [3 x double]* %x, i64 0, i64 0
  %arraydecay9 = getelementptr inbounds [3 x i32]* %indx, i64 0, i64 0
  call void @legs([3 x double]* %arraydecay, i32 3, double* %arraydecay7, double* %arraydecay8, i32* %arraydecay9) nounwind
  %tmp13 = load double* %arraydecay8, align 16
  %mul = fmul double %tmp13, 1.000000e+04
  %conv = fptosi double %mul to i32
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %conv) nounwind
  %arrayidx.1 = getelementptr [3 x double]* %x, i64 0, i64 1
  %tmp13.1 = load double* %arrayidx.1, align 8
  %mul.1 = fmul double %tmp13.1, 1.000000e+04
  %conv.1 = fptosi double %mul.1 to i32
  %call.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %conv.1) nounwind
  %arrayidx.2 = getelementptr [3 x double]* %x, i64 0, i64 2
  %tmp13.2 = load double* %arrayidx.2, align 16
  %mul.2 = fmul double %tmp13.2, 1.000000e+04
  %conv.2 = fptosi double %mul.2 to i32
  %call.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %conv.2) nounwind
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

define void @legs([3 x double]* %a, i32 %n, double* %b, double* %x, i32* %indx) nounwind uwtable {
entry:
  tail call void @elgs([3 x double]* %a, i32 %n, i32* %indx) nounwind
  %sub = add nsw i32 %n, -1
  %cmp14 = icmp sgt i32 %sub, 0
  %tmp64 = add i32 %n, -2
  br i1 %cmp14, label %for.cond6.preheader.lr.ph, label %for.end52

for.cond6.preheader.lr.ph:                        ; preds = %entry
  %tmp78 = zext i32 %sub to i64
  %tmp84 = zext i32 %tmp64 to i64
  br label %for.cond6.preheader

for.cond6.preheader:                              ; preds = %for.inc49, %for.cond6.preheader.lr.ph
  %indvar69 = phi i64 [ 0, %for.cond6.preheader.lr.ph ], [ %tmp80, %for.inc49 ]
  %tmp80 = add i64 %indvar69, 1
  %tmp85 = sub i64 %tmp84, %indvar69
  %arrayidx33 = getelementptr i32* %indx, i64 %indvar69
  %storemerge311 = trunc i64 %tmp80 to i32
  %tmp66 = and i64 %tmp85, 4294967295
  %tmp67 = add i64 %tmp66, 1
  %cmp912 = icmp slt i32 %storemerge311, %n
  br i1 %cmp912, label %for.body10, label %for.inc49

for.body10:                                       ; preds = %for.cond6.preheader, %for.body10
  %indvar61 = phi i64 [ %indvar.next62, %for.body10 ], [ 0, %for.cond6.preheader ]
  %tmp81 = add i64 %tmp80, %indvar61
  %arrayidx = getelementptr i32* %indx, i64 %tmp81
  %tmp13 = load i32* %arrayidx, align 4
  %idxprom14 = sext i32 %tmp13 to i64
  %arrayidx16 = getelementptr inbounds double* %b, i64 %idxprom14
  %tmp17 = load double* %arrayidx16, align 8
  %tmp90 = mul i64 %idxprom14, 3
  %scevgep88.sum = add i64 %indvar69, %tmp90
  %arrayidx28 = getelementptr [3 x double]* %a, i64 0, i64 %scevgep88.sum
  %tmp29 = load double* %arrayidx28, align 8
  %tmp34 = load i32* %arrayidx33, align 4
  %idxprom35 = sext i32 %tmp34 to i64
  %arrayidx37 = getelementptr inbounds double* %b, i64 %idxprom35
  %tmp38 = load double* %arrayidx37, align 8
  %mul = fmul double %tmp29, %tmp38
  %sub39 = fsub double %tmp17, %mul
  store double %sub39, double* %arrayidx16, align 8
  %indvar.next62 = add i64 %indvar61, 1
  %exitcond68 = icmp eq i64 %indvar.next62, %tmp67
  br i1 %exitcond68, label %for.inc49, label %for.body10

for.inc49:                                        ; preds = %for.body10, %for.cond6.preheader
  %exitcond79 = icmp eq i64 %tmp80, %tmp78
  br i1 %exitcond79, label %for.end52, label %for.cond6.preheader

for.end52:                                        ; preds = %entry, %for.inc49
  %idxprom55 = sext i32 %sub to i64
  %arrayidx57 = getelementptr inbounds i32* %indx, i64 %idxprom55
  %tmp58 = load i32* %arrayidx57, align 4
  %idxprom59 = sext i32 %tmp58 to i64
  %arrayidx61 = getelementptr inbounds double* %b, i64 %idxprom59
  %tmp62 = load double* %arrayidx61, align 8
  %arrayidx75 = getelementptr inbounds [3 x double]* %a, i64 %idxprom59, i64 %idxprom55
  %tmp76 = load double* %arrayidx75, align 8
  %div = fdiv double %tmp62, %tmp76
  %arrayidx81 = getelementptr inbounds double* %x, i64 %idxprom55
  store double %div, double* %arrayidx81, align 8
  %cmp869 = icmp sgt i32 %tmp64, -1
  br i1 %cmp869, label %for.body87.lr.ph, label %for.end164

for.body87.lr.ph:                                 ; preds = %for.end52
  %tmp35 = sub i32 1, %n
  %tmp36 = icmp sgt i32 %tmp35, -1
  %smax = select i1 %tmp36, i32 %tmp35, i32 -1
  %tmp37 = add i32 %smax, %n
  %tmp39 = add i32 %tmp37, -1
  %tmp40 = zext i32 %tmp39 to i64
  %tmp41 = add i64 %tmp40, 1
  %tmp45 = zext i32 %sub to i64
  %tmp53 = sext i32 %tmp64 to i64
  br label %for.body87

for.body87:                                       ; preds = %for.end139, %for.body87.lr.ph
  %indvar17 = phi i64 [ 0, %for.body87.lr.ph ], [ %tmp, %for.end139 ]
  %tmp46 = sub i64 %tmp45, %indvar17
  %storemerge25 = trunc i64 %tmp46 to i32
  %tmp = add i64 %indvar17, 1
  %tmp54 = sub i64 %tmp53, %indvar17
  %arrayidx100 = getelementptr double* %x, i64 %tmp54
  %arrayidx91 = getelementptr i32* %indx, i64 %tmp54
  %tmp28 = sext i32 %storemerge25 to i64
  %tmp92 = load i32* %arrayidx91, align 4
  %idxprom93 = sext i32 %tmp92 to i64
  %arrayidx95 = getelementptr inbounds double* %b, i64 %idxprom93
  %tmp96 = load double* %arrayidx95, align 8
  store double %tmp96, double* %arrayidx100, align 8
  %cmp1066 = icmp slt i32 %storemerge25, %n
  br i1 %cmp1066, label %for.body107, label %for.end139

for.body107:                                      ; preds = %for.body87, %for.body107
  %indvar = phi i64 [ %indvar.next, %for.body107 ], [ 0, %for.body87 ]
  %storemerge47 = phi double [ %sub131, %for.body107 ], [ %tmp96, %for.body87 ]
  %tmp30 = add i64 %tmp28, %indvar
  %arrayidx128 = getelementptr double* %x, i64 %tmp30
  %tmp119 = load i32* %arrayidx91, align 4
  %tmp31 = sext i32 %tmp119 to i64
  %tmp32 = mul i64 %tmp31, 3
  %scevgep.sum = add i64 %tmp30, %tmp32
  %arrayidx123 = getelementptr [3 x double]* %a, i64 0, i64 %scevgep.sum
  %tmp124 = load double* %arrayidx123, align 8
  %tmp129 = load double* %arrayidx128, align 8
  %mul130 = fmul double %tmp124, %tmp129
  %sub131 = fsub double %storemerge47, %mul130
  store double %sub131, double* %arrayidx100, align 8
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp
  br i1 %exitcond, label %for.end139, label %for.body107

for.end139:                                       ; preds = %for.body107, %for.body87
  %storemerge4.lcssa = phi double [ %tmp96, %for.body87 ], [ %sub131, %for.body107 ]
  %tmp151 = load i32* %arrayidx91, align 4
  %tmp56 = sext i32 %tmp151 to i64
  %tmp57 = mul i64 %tmp56, 3
  %scevgep55.sum = add i64 %tmp54, %tmp57
  %arrayidx155 = getelementptr [3 x double]* %a, i64 0, i64 %scevgep55.sum
  %tmp156 = load double* %arrayidx155, align 8
  %div157 = fdiv double %storemerge4.lcssa, %tmp156
  store double %div157, double* %arrayidx100, align 8
  %exitcond42 = icmp eq i64 %tmp, %tmp41
  br i1 %exitcond42, label %for.end164, label %for.body87

for.end164:                                       ; preds = %for.end139, %for.end52
  ret void
}

define void @elgs([3 x double]* %a, i32 %n, i32* %indx) nounwind uwtable {
entry:
  %c = alloca [3 x double], align 16
  %cmp = icmp sgt i32 %n, 3
  br i1 %cmp, label %if.then, label %for.cond.preheader

for.cond.preheader:                               ; preds = %entry
  %cmp337 = icmp sgt i32 %n, 0
  br i1 %cmp337, label %for.body.lr.ph, label %for.cond52.preheader

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %tmp192 = zext i32 %n to i64
  br label %for.body

if.then:                                          ; preds = %entry
  %puts = call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str, i64 0, i64 0))
  call void @exit(i32 1) noreturn nounwind
  unreachable

for.cond8.preheader:                              ; preds = %for.body
  br i1 %cmp337, label %for.cond13.preheader.lr.ph.split.us, label %for.cond52.preheader

for.cond13.preheader.lr.ph.split.us:              ; preds = %for.cond8.preheader
  %tmp = zext i32 %n to i64
  br label %for.body17.lr.ph.us

for.end43.us:                                     ; preds = %for.body17.us
  store double %tmp4411.us, double* %arrayidx47.us, align 8
  %indvar.next42 = add i64 %indvar41, 1
  %exitcond44 = icmp eq i64 %indvar.next42, %tmp
  br i1 %exitcond44, label %for.cond52.preheader, label %for.body17.lr.ph.us

for.body17.us:                                    ; preds = %for.body17.us, %for.body17.lr.ph.us
  %indvar = phi i64 [ 0, %for.body17.lr.ph.us ], [ %indvar.next, %for.body17.us ]
  %tmp441232.us = phi double [ 0.000000e+00, %for.body17.lr.ph.us ], [ %tmp4411.us, %for.body17.us ]
  %arrayidx24.us = getelementptr [3 x double]* %a, i64 %indvar41, i64 %indvar
  %tmp25.us = load double* %arrayidx24.us, align 8
  %call26.us = call double @fabs(double %tmp25.us) nounwind readnone
  %cmp28.us = fcmp ogt double %call26.us, %tmp441232.us
  %tmp4411.us = select i1 %cmp28.us, double %call26.us, double %tmp441232.us
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp
  br i1 %exitcond, label %for.end43.us, label %for.body17.us

for.body17.lr.ph.us:                              ; preds = %for.cond13.preheader.lr.ph.split.us, %for.end43.us
  %indvar41 = phi i64 [ %indvar.next42, %for.end43.us ], [ 0, %for.cond13.preheader.lr.ph.split.us ]
  %arrayidx47.us = getelementptr [3 x double]* %c, i64 0, i64 %indvar41
  br label %for.body17.us

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvar190 = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next191, %for.body ]
  %arrayidx = getelementptr i32* %indx, i64 %indvar190
  %storemerge38 = trunc i64 %indvar190 to i32
  store i32 %storemerge38, i32* %arrayidx, align 4
  %indvar.next191 = add i64 %indvar190, 1
  %exitcond193 = icmp eq i64 %indvar.next191, %tmp192
  br i1 %exitcond193, label %for.cond8.preheader, label %for.body

for.cond52.preheader:                             ; preds = %for.cond.preheader, %for.end43.us, %for.cond8.preheader
  %sub = add nsw i32 %n, -1
  %cmp5528 = icmp sgt i32 %sub, 0
  br i1 %cmp5528, label %for.cond58.preheader.lr.ph, label %for.end212

for.cond58.preheader.lr.ph:                       ; preds = %for.cond52.preheader
  %tmp50 = add i32 %n, -2
  %tmp123 = zext i32 %sub to i64
  %tmp127 = zext i32 %tmp50 to i64
  br label %for.cond58.preheader

for.cond58.preheader:                             ; preds = %for.inc209, %for.cond58.preheader.lr.ph
  %indvar55 = phi i64 [ 0, %for.cond58.preheader.lr.ph ], [ %tmp130, %for.inc209 ]
  %storemerge5729 = phi i32 [ undef, %for.cond58.preheader.lr.ph ], [ %storemerge58.lcssa, %for.inc209 ]
  %tmp128 = sub i64 %tmp127, %indvar55
  %tmp130 = add i64 %indvar55, 1
  %storemerge424 = trunc i64 %tmp130 to i32
  %tmp139 = sub i64 %tmp123, %indvar55
  %arrayidx98 = getelementptr i32* %indx, i64 %indvar55
  %storemerge230 = trunc i64 %indvar55 to i32
  %tmp115 = and i64 %tmp128, 4294967295
  %tmp116 = add i64 %tmp115, 1
  %tmp96 = and i64 %tmp139, 4294967295
  %tmp97 = add i64 %tmp96, 1
  %cmp6115 = icmp slt i32 %storemerge230, %n
  br i1 %cmp6115, label %for.body62, label %for.end94

for.body62:                                       ; preds = %for.cond58.preheader, %for.body62
  %indvar89 = phi i64 [ %indvar.next90, %for.body62 ], [ 0, %for.cond58.preheader ]
  %storemerge5917 = phi i32 [ %storemerge510, %for.body62 ], [ %storemerge5729, %for.cond58.preheader ]
  %div1416 = phi double [ %div13, %for.body62 ], [ 0.000000e+00, %for.cond58.preheader ]
  %tmp135 = add i64 %indvar55, %indvar89
  %storemerge318 = trunc i64 %tmp135 to i32
  %arrayidx68 = getelementptr i32* %indx, i64 %tmp135
  %tmp69 = load i32* %arrayidx68, align 4
  %idxprom70 = sext i32 %tmp69 to i64
  %tmp176 = mul i64 %idxprom70, 3
  %scevgep155.sum199 = add i64 %indvar55, %tmp176
  %arrayidx73 = getelementptr [3 x double]* %a, i64 0, i64 %scevgep155.sum199
  %tmp74 = load double* %arrayidx73, align 8
  %call75 = call double @fabs(double %tmp74) nounwind readnone
  %arrayidx82 = getelementptr inbounds [3 x double]* %c, i64 0, i64 %idxprom70
  %tmp83 = load double* %arrayidx82, align 8
  %div = fdiv double %call75, %tmp83
  %cmp86 = fcmp ogt double %div, %div1416
  %div13 = select i1 %cmp86, double %div, double %div1416
  %storemerge510 = select i1 %cmp86, i32 %storemerge318, i32 %storemerge5917
  %indvar.next90 = add i64 %indvar89, 1
  %exitcond98 = icmp eq i64 %indvar.next90, %tmp97
  br i1 %exitcond98, label %for.end94, label %for.body62

for.end94:                                        ; preds = %for.body62, %for.cond58.preheader
  %storemerge59.lcssa = phi i32 [ %storemerge5729, %for.cond58.preheader ], [ %storemerge510, %for.body62 ]
  %tmp99 = load i32* %arrayidx98, align 4
  %idxprom101 = sext i32 %storemerge59.lcssa to i64
  %arrayidx103 = getelementptr inbounds i32* %indx, i64 %idxprom101
  %tmp104 = load i32* %arrayidx103, align 4
  store i32 %tmp104, i32* %arrayidx98, align 4
  store i32 %tmp99, i32* %arrayidx103, align 4
  %cmp11825 = icmp slt i32 %storemerge424, %n
  br i1 %cmp11825, label %for.body163.lr.ph.us, label %for.inc209

for.body163.us:                                   ; preds = %for.body163.us, %for.body163.lr.ph.us
  %indvar47 = phi i64 [ 0, %for.body163.lr.ph.us ], [ %indvar.next48, %for.body163.us ]
  %tmp144 = add i64 %tmp130, %indvar47
  %tmp170.us = load i32* %arrayidx125.us, align 4
  %tmp146 = sext i32 %tmp170.us to i64
  %tmp147 = mul i64 %tmp146, 3
  %scevgep145.sum = add i64 %tmp144, %tmp147
  %scevgep71 = getelementptr [3 x double]* %a, i64 0, i64 %scevgep145.sum
  %tmp175.us = load double* %scevgep71, align 8
  %tmp183.us = load i32* %arrayidx98, align 4
  %tmp152 = sext i32 %tmp183.us to i64
  %tmp153 = mul i64 %tmp152, 3
  %scevgep145.sum198 = add i64 %tmp144, %tmp153
  %arrayidx187.us = getelementptr [3 x double]* %a, i64 0, i64 %scevgep145.sum198
  %tmp188.us = load double* %arrayidx187.us, align 8
  %mul.us = fmul double %div144.us, %tmp188.us
  %sub189.us = fsub double %tmp175.us, %mul.us
  store double %sub189.us, double* %scevgep71, align 8
  %indvar.next48 = add i64 %indvar47, 1
  %exitcond54 = icmp eq i64 %indvar.next48, %tmp116
  br i1 %exitcond54, label %for.cond115.loopexit.us, label %for.body163.us

for.cond115.loopexit.us:                          ; preds = %for.body163.us
  %indvar.next73 = add i64 %indvar72, 1
  %exitcond81 = icmp eq i64 %indvar.next73, %tmp116
  br i1 %exitcond81, label %for.inc209, label %for.body163.lr.ph.us

for.body163.lr.ph.us:                             ; preds = %for.cond115.loopexit.us, %for.end94
  %indvar72 = phi i64 [ %indvar.next73, %for.cond115.loopexit.us ], [ 0, %for.end94 ]
  %tmp141 = add i64 %tmp130, %indvar72
  %arrayidx125.us = getelementptr i32* %indx, i64 %tmp141
  %tmp126.us = load i32* %arrayidx125.us, align 4
  %tmp169 = sext i32 %tmp126.us to i64
  %tmp170 = mul i64 %tmp169, 3
  %scevgep155.sum = add i64 %indvar55, %tmp170
  %scevgep171 = getelementptr [3 x double]* %a, i64 0, i64 %scevgep155.sum
  %tmp131.us = load double* %scevgep171, align 8
  %tmp138.us = load i32* %arrayidx98, align 4
  %tmp172 = sext i32 %tmp138.us to i64
  %tmp173 = mul i64 %tmp172, 3
  %scevgep155.sum197 = add i64 %indvar55, %tmp173
  %arrayidx142.us = getelementptr [3 x double]* %a, i64 0, i64 %scevgep155.sum197
  %tmp143.us = load double* %arrayidx142.us, align 8
  %div144.us = fdiv double %tmp131.us, %tmp143.us
  store double %div144.us, double* %scevgep171, align 8
  br label %for.body163.us

for.inc209:                                       ; preds = %for.cond115.loopexit.us, %for.end94
  %storemerge58.lcssa = phi i32 [ %storemerge59.lcssa, %for.end94 ], [ %n, %for.cond115.loopexit.us ]
  %exitcond124 = icmp eq i64 %tmp130, %tmp123
  br i1 %exitcond124, label %for.end212, label %for.cond58.preheader

for.end212:                                       ; preds = %for.inc209, %for.cond52.preheader
  ret void
}

declare void @exit(i32) noreturn

declare double @fabs(double) nounwind readnone

declare i32 @puts(i8* nocapture) nounwind
