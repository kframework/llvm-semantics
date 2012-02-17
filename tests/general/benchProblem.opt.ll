; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/benchProblem.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %b = alloca [20 x double], align 16
  %x = alloca [20 x double], align 16
  %y = alloca [20 x double], align 16
  %w = alloca [20 x double], align 16
  %u = alloca [20 x double], align 16
  %tmp4 = call double @llvm.pow.f64(double 3.000000e-02, double 3.000000e+00)
  %mul5 = fmul double %tmp4, 1.000000e+09
  %mul6 = fmul double %mul5, 2.000000e-01
  %arrayidx = getelementptr inbounds [20 x double]* %w, i64 0, i64 0
  store double 2.000000e+00, double* %arrayidx, align 16
  %arrayidx17 = getelementptr inbounds [20 x double]* %u, i64 0, i64 0
  store double -5.000000e-01, double* %arrayidx17, align 16
  br label %for.body

for.cond45.preheader:                             ; preds = %for.body
  %div7 = fdiv double %mul6, 3.000000e+00
  br label %for.body50

for.body:                                         ; preds = %for.body.for.body_crit_edge, %entry
  %tmp25 = phi x86_fp80 [ 0xK3FFE8000000000000000, %entry ], [ %phitmp39, %for.body.for.body_crit_edge ]
  %indvar29 = phi i64 [ 1, %entry ], [ %phitmp, %for.body.for.body_crit_edge ]
  %arrayidx43 = getelementptr [20 x double]* %u, i64 0, i64 %indvar29
  %arrayidx32 = getelementptr [20 x double]* %w, i64 0, i64 %indvar29
  %sub28 = fsub x86_fp80 0xK40008000000000000000, %tmp25
  %conv29 = fptrunc x86_fp80 %sub28 to double
  store double %conv29, double* %arrayidx32, align 8
  %conv40 = fdiv double -1.000000e+00, %conv29
  store double %conv40, double* %arrayidx43, align 8
  %exitcond31 = icmp eq i64 %indvar29, 19
  br i1 %exitcond31, label %for.cond45.preheader, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  %phitmp = add i64 %indvar29, 1
  %phitmp38 = fpext double %conv40 to x86_fp80
  %phitmp39 = fmul x86_fp80 %phitmp38, 0xKBFFF8000000000000000
  br label %for.body

for.body50:                                       ; preds = %if.end, %for.cond45.preheader
  %indvar24 = phi i64 [ 0, %for.cond45.preheader ], [ %tmp27, %if.end ]
  %arrayidx65 = getelementptr [20 x double]* %b, i64 0, i64 %indvar24
  %tmp27 = add i64 %indvar24, 1
  %add53 = trunc i64 %tmp27 to i32
  %conv54 = sitofp i32 %add53 to x86_fp80
  %mul55 = fmul x86_fp80 %conv54, 0xK3FFC9249249249249249
  store double 0xBFE3333333333334, double* %arrayidx65, align 8
  %sub69 = fadd x86_fp80 %mul55, 0xKBFFFC000000000000000
  %conv70 = fptrunc x86_fp80 %sub69 to double
  %call71 = call double @fabs(double %conv70) nounwind readnone
  %cmp74 = fcmp olt double %call71, 2.500000e-01
  br i1 %cmp74, label %if.then, label %if.end

if.then:                                          ; preds = %for.body50
  %div89 = fdiv x86_fp80 %sub69, 0xK3FFD8000000000000000
  %conv90 = fptrunc x86_fp80 %div89 to double
  %pow2 = fmul double %conv90, %conv90
  %sub92 = fsub double -0.000000e+00, %pow2
  %call93 = call double @exp(double %sub92) nounwind
  %conv94 = fpext double %call93 to x86_fp80
  %sub96 = fadd x86_fp80 %conv94, 0xKBFFDBC5AB1B16779C000
  %mul97 = fmul x86_fp80 %sub96, 0xK4001829CBC14E5E0A72F
  %sub98 = fsub x86_fp80 0xKBFFE999999999999A000, %mul97
  %conv99 = fptrunc x86_fp80 %sub98 to double
  store double %conv99, double* %arrayidx65, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body50
  %tmp106 = phi double [ %conv99, %if.then ], [ 0xBFE3333333333334, %for.body50 ]
  %conv110 = fdiv double %tmp106, %div7
  store double %conv110, double* %arrayidx65, align 8
  %exitcond26 = icmp eq i64 %tmp27, 20
  br i1 %exitcond26, label %for.end117, label %for.body50

for.end117:                                       ; preds = %if.end
  %arrayidx118 = getelementptr inbounds [20 x double]* %b, i64 0, i64 0
  %tmp119 = load double* %arrayidx118, align 16
  %tmp121 = load double* %arrayidx, align 16
  %div122 = fdiv double %tmp119, %tmp121
  %arrayidx123 = getelementptr inbounds [20 x double]* %y, i64 0, i64 0
  store double %div122, double* %arrayidx123, align 16
  br label %for.body129

for.body129:                                      ; preds = %for.body129.for.body129_crit_edge, %for.end117
  %tmp138 = phi double [ %div122, %for.end117 ], [ %div144, %for.body129.for.body129_crit_edge ]
  %indvar18 = phi i64 [ 1, %for.end117 ], [ %phitmp40, %for.body129.for.body129_crit_edge ]
  %arrayidx147 = getelementptr [20 x double]* %y, i64 0, i64 %indvar18
  %arrayidx142 = getelementptr [20 x double]* %w, i64 0, i64 %indvar18
  %arrayidx132 = getelementptr [20 x double]* %b, i64 0, i64 %indvar18
  %tmp133 = load double* %arrayidx132, align 8
  %add139 = fadd double %tmp133, %tmp138
  %tmp143 = load double* %arrayidx142, align 8
  %div144 = fdiv double %add139, %tmp143
  store double %div144, double* %arrayidx147, align 8
  %exitcond20 = icmp eq i64 %indvar18, 19
  br i1 %exitcond20, label %for.end151, label %for.body129.for.body129_crit_edge

for.body129.for.body129_crit_edge:                ; preds = %for.body129
  %phitmp40 = add i64 %indvar18, 1
  br label %for.body129

for.end151:                                       ; preds = %for.body129
  %arrayidx155 = getelementptr inbounds [20 x double]* %y, i64 0, i64 19
  %tmp156 = load double* %arrayidx155, align 8
  %arrayidx160 = getelementptr inbounds [20 x double]* %x, i64 0, i64 19
  store double %tmp156, double* %arrayidx160, align 8
  br label %for.body167

for.body167:                                      ; preds = %for.body167, %for.end151
  %indvar11 = phi i64 [ 0, %for.end151 ], [ %indvar.next12, %for.body167 ]
  %tmp15 = sub i64 18, %indvar11
  %arrayidx185 = getelementptr [20 x double]* %x, i64 0, i64 %tmp15
  %arrayidx174 = getelementptr [20 x double]* %u, i64 0, i64 %tmp15
  %arrayidx170 = getelementptr [20 x double]* %y, i64 0, i64 %tmp15
  %tmp17 = sub i64 19, %indvar11
  %arrayidx179 = getelementptr [20 x double]* %x, i64 0, i64 %tmp17
  %tmp171 = load double* %arrayidx170, align 8
  %tmp175 = load double* %arrayidx174, align 8
  %tmp180 = load double* %arrayidx179, align 8
  %mul181 = fmul double %tmp175, %tmp180
  %sub182 = fsub double %tmp171, %mul181
  store double %sub182, double* %arrayidx185, align 8
  %indvar.next12 = add i64 %indvar11, 1
  %exitcond13 = icmp eq i64 %indvar.next12, 19
  br i1 %exitcond13, label %for.body195, label %for.body167

for.body195:                                      ; preds = %for.body167, %for.body195
  %indvar = phi i64 [ %tmp, %for.body195 ], [ 0, %for.body167 ]
  %arrayidx205 = getelementptr [20 x double]* %x, i64 0, i64 %indvar
  %tmp = add i64 %indvar, 1
  %add198 = trunc i64 %tmp to i32
  %conv199 = sitofp i32 %add198 to x86_fp80
  %mul200 = fmul x86_fp80 %conv199, 0xK3FFC9249249249249249
  %mul201 = fmul x86_fp80 %mul200, 0xK4008FA00000000000000
  %conv202 = fptosi x86_fp80 %mul201 to i32
  %tmp206 = load double* %arrayidx205, align 8
  %mul207 = fmul double %tmp206, 1.000000e+02
  %mul208 = fmul double %mul207, 1.000000e+03
  %conv209 = fptosi double %mul208 to i32
  %call210 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i64 0, i64 0), i32 %conv202, i32 %conv209) nounwind
  %exitcond = icmp eq i64 %tmp, 20
  br i1 %exitcond, label %for.end214, label %for.body195

for.end214:                                       ; preds = %for.body195
  ret i32 0
}

declare double @llvm.pow.f64(double, double) nounwind readonly

declare double @exp(double) nounwind

declare double @fabs(double) nounwind readnone

declare i32 @printf(i8* nocapture, ...) nounwind
