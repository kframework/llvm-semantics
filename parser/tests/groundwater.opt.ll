; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/groundwater.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %phi = alloca [6 x [3 x double]], align 16
  %ck = alloca [6 x [3 x double]], align 16
  %sn = alloca [6 x [3 x double]], align 16
  %sn44 = bitcast [6 x [3 x double]]* %sn to i8*
  call void @llvm.memset.p0i8.i64(i8* %sn44, i8 0, i64 144, i32 16, i1 false)
  br label %for.body

for.cond63.preheader:                             ; preds = %for.body
  %arraydecay = getelementptr inbounds [6 x [3 x double]]* %phi, i64 0, i64 0
  %arraydecay121 = getelementptr inbounds [6 x [3 x double]]* %ck, i64 0, i64 0
  %arraydecay122 = getelementptr inbounds [6 x [3 x double]]* %sn, i64 0, i64 0
  %arrayidx116 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 5, i64 0
  %arrayidx106 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 3, i64 0
  %arrayidx97 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 4, i64 0
  %arrayidx90 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 0, i64 0
  %arrayidx83 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 2, i64 0
  %arrayidx77 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 1, i64 0
  %tmp78 = load double* %arrayidx77, align 8
  %mul79 = fmul double %tmp78, 4.000000e+00
  %tmp84 = load double* %arrayidx83, align 16
  %sub85 = fsub double %mul79, %tmp84
  %div86 = fdiv double %sub85, 3.000000e+00
  store double %div86, double* %arrayidx90, align 16
  %tmp98 = load double* %arrayidx97, align 16
  %mul99 = fmul double %tmp98, 4.000000e+00
  %tmp107 = load double* %arrayidx106, align 8
  %sub108 = fsub double %mul99, %tmp107
  %div109 = fdiv double %sub108, 3.000000e+00
  store double %div109, double* %arrayidx116, align 8
  %arrayidx116.1 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 5, i64 1
  %arrayidx106.1 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 3, i64 1
  %arrayidx97.1 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 4, i64 1
  %arrayidx90.1 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 0, i64 1
  %arrayidx83.1 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 2, i64 1
  %arrayidx77.1 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 1, i64 1
  %tmp78.1 = load double* %arrayidx77.1, align 8
  %mul79.1 = fmul double %tmp78.1, 4.000000e+00
  %tmp84.1 = load double* %arrayidx83.1, align 8
  %sub85.1 = fsub double %mul79.1, %tmp84.1
  %div86.1 = fdiv double %sub85.1, 3.000000e+00
  store double %div86.1, double* %arrayidx90.1, align 8
  %tmp98.1 = load double* %arrayidx97.1, align 8
  %mul99.1 = fmul double %tmp98.1, 4.000000e+00
  %tmp107.1 = load double* %arrayidx106.1, align 8
  %sub108.1 = fsub double %mul99.1, %tmp107.1
  %div109.1 = fdiv double %sub108.1, 3.000000e+00
  store double %div109.1, double* %arrayidx116.1, align 8
  %arrayidx116.2 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 5, i64 2
  %arrayidx106.2 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 3, i64 2
  %arrayidx97.2 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 4, i64 2
  %arrayidx90.2 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 0, i64 2
  %arrayidx83.2 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 2, i64 2
  %arrayidx77.2 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 1, i64 2
  %tmp78.2 = load double* %arrayidx77.2, align 8
  %mul79.2 = fmul double %tmp78.2, 4.000000e+00
  %tmp84.2 = load double* %arrayidx83.2, align 16
  %sub85.2 = fsub double %mul79.2, %tmp84.2
  %div86.2 = fdiv double %sub85.2, 3.000000e+00
  store double %div86.2, double* %arrayidx90.2, align 16
  %tmp98.2 = load double* %arrayidx97.2, align 16
  %mul99.2 = fmul double %tmp98.2, 4.000000e+00
  %tmp107.2 = load double* %arrayidx106.2, align 8
  %sub108.2 = fsub double %mul99.2, %tmp107.2
  %div109.2 = fdiv double %sub108.2, 3.000000e+00
  store double %div109.2, double* %arrayidx116.2, align 8
  call void @rx2d([3 x double]* %arraydecay, [3 x double]* %arraydecay121, [3 x double]* %arraydecay122, i32 6, i32 3, double 5.000000e-01, double 2.000000e+02, double 2.500000e+02) nounwind
  %tmp78.119 = load double* %arrayidx77, align 8
  %mul79.120 = fmul double %tmp78.119, 4.000000e+00
  %tmp84.121 = load double* %arrayidx83, align 16
  %sub85.122 = fsub double %mul79.120, %tmp84.121
  %div86.123 = fdiv double %sub85.122, 3.000000e+00
  store double %div86.123, double* %arrayidx90, align 16
  %tmp98.124 = load double* %arrayidx97, align 16
  %mul99.125 = fmul double %tmp98.124, 4.000000e+00
  %tmp107.126 = load double* %arrayidx106, align 8
  %sub108.127 = fsub double %mul99.125, %tmp107.126
  %div109.128 = fdiv double %sub108.127, 3.000000e+00
  store double %div109.128, double* %arrayidx116, align 8
  %tmp78.1.1 = load double* %arrayidx77.1, align 8
  %mul79.1.1 = fmul double %tmp78.1.1, 4.000000e+00
  %tmp84.1.1 = load double* %arrayidx83.1, align 8
  %sub85.1.1 = fsub double %mul79.1.1, %tmp84.1.1
  %div86.1.1 = fdiv double %sub85.1.1, 3.000000e+00
  store double %div86.1.1, double* %arrayidx90.1, align 8
  %tmp98.1.1 = load double* %arrayidx97.1, align 8
  %mul99.1.1 = fmul double %tmp98.1.1, 4.000000e+00
  %tmp107.1.1 = load double* %arrayidx106.1, align 8
  %sub108.1.1 = fsub double %mul99.1.1, %tmp107.1.1
  %div109.1.1 = fdiv double %sub108.1.1, 3.000000e+00
  store double %div109.1.1, double* %arrayidx116.1, align 8
  %tmp78.2.1 = load double* %arrayidx77.2, align 8
  %mul79.2.1 = fmul double %tmp78.2.1, 4.000000e+00
  %tmp84.2.1 = load double* %arrayidx83.2, align 16
  %sub85.2.1 = fsub double %mul79.2.1, %tmp84.2.1
  %div86.2.1 = fdiv double %sub85.2.1, 3.000000e+00
  store double %div86.2.1, double* %arrayidx90.2, align 16
  %tmp98.2.1 = load double* %arrayidx97.2, align 16
  %mul99.2.1 = fmul double %tmp98.2.1, 4.000000e+00
  %tmp107.2.1 = load double* %arrayidx106.2, align 8
  %sub108.2.1 = fsub double %mul99.2.1, %tmp107.2.1
  %div109.2.1 = fdiv double %sub108.2.1, 3.000000e+00
  store double %div109.2.1, double* %arrayidx116.2, align 8
  call void @rx2d([3 x double]* %arraydecay, [3 x double]* %arraydecay121, [3 x double]* %arraydecay122, i32 6, i32 3, double 5.000000e-01, double 2.000000e+02, double 2.500000e+02) nounwind
  br label %for.body137

for.body:                                         ; preds = %for.body, %entry
  %indvar30 = phi i64 [ 0, %entry ], [ %indvar.next31, %for.body ]
  %arrayidx31.2 = getelementptr [6 x [3 x double]]* %ck, i64 0, i64 %indvar30, i64 2
  %arrayidx51.2 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 %indvar30, i64 2
  %arrayidx31.1 = getelementptr [6 x [3 x double]]* %ck, i64 0, i64 %indvar30, i64 1
  %arrayidx51.1 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 %indvar30, i64 1
  %arrayidx31 = getelementptr [6 x [3 x double]]* %ck, i64 0, i64 %indvar30, i64 0
  %arrayidx51 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 %indvar30, i64 0
  %storemerge11 = trunc i64 %indvar30 to i32
  %conv11 = sitofp i32 %storemerge11 to double
  %mul13 = fmul double %conv11, 2.000000e+02
  %mul36 = fmul double %mul13, 0x400921FB54442D18
  %div38 = fdiv double %mul36, 1.000000e+03
  %call39 = call double @cos(double %div38) nounwind readnone
  %mul40 = fmul double %call39, -2.000000e+01
  store double 1.000000e+00, double* %arrayidx31, align 8
  %mul42 = fmul double %mul40, 0.000000e+00
  %div44 = fdiv double %mul42, 5.000000e+02
  %add45 = fadd double %div44, 2.000000e+02
  store double %add45, double* %arrayidx51, align 8
  store double -9.000000e+00, double* %arrayidx31.1, align 8
  %mul42.1 = fmul double %mul40, 2.500000e+02
  %div44.1 = fdiv double %mul42.1, 5.000000e+02
  %add45.1 = fadd double %div44.1, 2.000000e+02
  store double %add45.1, double* %arrayidx51.1, align 8
  store double -1.900000e+01, double* %arrayidx31.2, align 8
  %mul42.2 = fmul double %mul40, 5.000000e+02
  %div44.2 = fdiv double %mul42.2, 5.000000e+02
  %add45.2 = fadd double %div44.2, 2.000000e+02
  store double %add45.2, double* %arrayidx51.2, align 8
  %indvar.next31 = add i64 %indvar30, 1
  %exitcond34 = icmp eq i64 %indvar.next31, 6
  br i1 %exitcond34, label %for.cond63.preheader, label %for.body

for.body137:                                      ; preds = %for.body137, %for.cond63.preheader
  %indvar12 = phi i64 [ 0, %for.cond63.preheader ], [ %indvar.next13, %for.body137 ]
  %arrayidx163.2 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 %indvar12, i64 2
  %arrayidx163.1 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 %indvar12, i64 1
  %arrayidx163 = getelementptr [6 x [3 x double]]* %phi, i64 0, i64 %indvar12, i64 0
  %storemerge27 = trunc i64 %indvar12 to i32
  %conv139 = sitofp i32 %storemerge27 to double
  %mul141 = fmul double %conv139, 2.000000e+02
  %mul153 = fmul double %mul141, 1.000000e+01
  %conv154 = fptosi double %mul153 to i32
  %tmp164 = load double* %arrayidx163, align 8
  %conv165 = fptosi double %tmp164 to i32
  %mul166 = mul nsw i32 %conv165, 10
  %call167 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 0), i32 %conv154, i32 0, i32 %mul166) nounwind
  %tmp164.1 = load double* %arrayidx163.1, align 8
  %conv165.1 = fptosi double %tmp164.1 to i32
  %mul166.1 = mul nsw i32 %conv165.1, 10
  %call167.1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 0), i32 %conv154, i32 2500, i32 %mul166.1) nounwind
  %tmp164.2 = load double* %arrayidx163.2, align 8
  %conv165.2 = fptosi double %tmp164.2 to i32
  %mul166.2 = mul nsw i32 %conv165.2, 10
  %call167.2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 0), i32 %conv154, i32 5000, i32 %mul166.2) nounwind
  %indvar.next13 = add i64 %indvar12, 1
  %exitcond = icmp eq i64 %indvar.next13, 6
  br i1 %exitcond, label %for.end175, label %for.body137

for.end175:                                       ; preds = %for.body137
  ret i32 0
}

declare double @cos(double) nounwind readnone

declare i32 @printf(i8* nocapture, ...) nounwind

define void @rx2d([3 x double]* %fn, [3 x double]* %dn, [3 x double]* %s, i32 %nx, i32 %ny, double %p, double %hx, double %hy) nounwind uwtable {
entry:
  %mul = fmul double %hx, %hx
  %mul5 = fmul double %hy, %hy
  %div = fdiv double %mul, %mul5
  %add = fadd double %div, 1.000000e+00
  %mul7 = fmul double %add, 4.000000e+00
  %div8 = fdiv double 1.000000e+00, %mul7
  %sub = fsub double 1.000000e+00, %p
  %sub12 = add nsw i32 %nx, -1
  %cmp4 = icmp sgt i32 %sub12, 1
  br i1 %cmp4, label %for.cond13.preheader.lr.ph, label %for.end187

for.cond13.preheader.lr.ph:                       ; preds = %entry
  %sub16 = add nsw i32 %ny, -1
  %cmp172 = icmp sgt i32 %sub16, 1
  %mul61 = fmul double %div, %div8
  %tmp = add i32 %ny, -3
  %tmp6 = zext i32 %tmp to i64
  %tmp7 = add i64 %tmp6, 1
  %tmp15 = add i32 %nx, -3
  %tmp16 = zext i32 %tmp15 to i64
  %tmp17 = add i64 %tmp16, 1
  br label %for.cond13.preheader

for.cond13.preheader:                             ; preds = %for.inc184, %for.cond13.preheader.lr.ph
  %indvar8 = phi i64 [ 0, %for.cond13.preheader.lr.ph ], [ %tmp21, %for.inc184 ]
  %tmp20 = add i64 %indvar8, 2
  %tmp21 = add i64 %indvar8, 1
  br i1 %cmp172, label %for.body18.lr.ph, label %for.inc184

for.body18.lr.ph:                                 ; preds = %for.cond13.preheader
  %arrayidx112.phi.trans.insert = getelementptr [3 x double]* %fn, i64 %tmp21, i64 1
  %tmp113.pre = load double* %arrayidx112.phi.trans.insert, align 8
  %arrayidx159.phi.trans.insert = getelementptr [3 x double]* %fn, i64 %tmp21, i64 0
  %tmp160.pre = load double* %arrayidx159.phi.trans.insert, align 8
  br label %for.body18

for.body18:                                       ; preds = %for.body18, %for.body18.lr.ph
  %tmp160 = phi double [ %tmp160.pre, %for.body18.lr.ph ], [ %add175, %for.body18 ]
  %tmp113 = phi double [ %tmp113.pre, %for.body18.lr.ph ], [ %tmp148, %for.body18 ]
  %indvar = phi i64 [ 0, %for.body18.lr.ph ], [ %tmp19, %for.body18 ]
  %tmp19 = add i64 %indvar, 1
  %arrayidx46 = getelementptr [3 x double]* %dn, i64 %indvar8, i64 %tmp19
  %arrayidx25 = getelementptr [3 x double]* %dn, i64 %tmp20, i64 %tmp19
  %arrayidx124 = getelementptr [3 x double]* %fn, i64 %tmp20, i64 %tmp19
  %arrayidx135 = getelementptr [3 x double]* %fn, i64 %indvar8, i64 %tmp19
  %arrayidx92 = getelementptr [3 x double]* %dn, i64 %tmp21, i64 %indvar
  %tmp22 = add i64 %indvar, 2
  %arrayidx69 = getelementptr [3 x double]* %dn, i64 %tmp21, i64 %tmp22
  %arrayidx147 = getelementptr [3 x double]* %fn, i64 %tmp21, i64 %tmp22
  %arrayidx33 = getelementptr [3 x double]* %dn, i64 %tmp21, i64 %tmp19
  %arrayidx112 = getelementptr [3 x double]* %fn, i64 %tmp21, i64 %tmp19
  %arrayidx170 = getelementptr [3 x double]* %s, i64 %tmp21, i64 %tmp19
  %tmp26 = load double* %arrayidx25, align 8
  %tmp34 = load double* %arrayidx33, align 8
  %div35 = fdiv double %tmp26, %tmp34
  %add36 = fadd double %div35, 1.000000e+00
  %mul37 = fmul double %div8, %add36
  %tmp47 = load double* %arrayidx46, align 8
  %div56 = fdiv double %tmp47, %tmp34
  %add57 = fadd double %div56, 1.000000e+00
  %mul58 = fmul double %div8, %add57
  %tmp70 = load double* %arrayidx69, align 8
  %div79 = fdiv double %tmp70, %tmp34
  %add80 = fadd double %div79, 1.000000e+00
  %mul81 = fmul double %mul61, %add80
  %tmp93 = load double* %arrayidx92, align 8
  %div102 = fdiv double %tmp93, %tmp34
  %add103 = fadd double %div102, 1.000000e+00
  %mul104 = fmul double %mul61, %add103
  %mul114 = fmul double %sub, %tmp113
  %tmp125 = load double* %arrayidx124, align 8
  %mul126 = fmul double %mul37, %tmp125
  %tmp136 = load double* %arrayidx135, align 8
  %mul137 = fmul double %mul58, %tmp136
  %add138 = fadd double %mul126, %mul137
  %tmp148 = load double* %arrayidx147, align 8
  %mul149 = fmul double %mul81, %tmp148
  %add150 = fadd double %add138, %mul149
  %mul161 = fmul double %mul104, %tmp160
  %add162 = fadd double %add150, %mul161
  %tmp171 = load double* %arrayidx170, align 8
  %mul172 = fmul double %mul, %tmp171
  %add173 = fadd double %add162, %mul172
  %mul174 = fmul double %add173, %p
  %add175 = fadd double %mul114, %mul174
  store double %add175, double* %arrayidx112, align 8
  %exitcond = icmp eq i64 %tmp19, %tmp7
  br i1 %exitcond, label %for.inc184, label %for.body18

for.inc184:                                       ; preds = %for.body18, %for.cond13.preheader
  %exitcond18 = icmp eq i64 %tmp21, %tmp17
  br i1 %exitcond18, label %for.end187, label %for.cond13.preheader

for.end187:                                       ; preds = %for.inc184, %entry
  ret void
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
