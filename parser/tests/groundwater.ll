; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/groundwater.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"%d %d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %nx = alloca i32, align 4
  %ny = alloca i32, align 4
  %istep = alloca i32, align 4
  %pi = alloca double, align 8
  %a0 = alloca double, align 8
  %b0 = alloca double, align 8
  %h0 = alloca double, align 8
  %ch = alloca double, align 8
  %sx = alloca double, align 8
  %sy = alloca double, align 8
  %hx = alloca double, align 8
  %hy = alloca double, align 8
  %p = alloca double, align 8
  %x = alloca double, align 8
  %y = alloca double, align 8
  %phi = alloca [6 x [3 x double]], align 16
  %ck = alloca [6 x [3 x double]], align 16
  %sn = alloca [6 x [3 x double]], align 16
  store i32 0, i32* %retval
  store i32 6, i32* %nx, align 4
  store i32 3, i32* %ny, align 4
  %call = call double @atan(double 1.000000e+00) nounwind
  %mul = fmul double 4.000000e+00, %call
  store double %mul, double* %pi, align 8
  store double 1.000000e+00, double* %a0, align 8
  store double -4.000000e-02, double* %b0, align 8
  store double 2.000000e+02, double* %h0, align 8
  store double -2.000000e+01, double* %ch, align 8
  store double 1.000000e+03, double* %sx, align 8
  store double 5.000000e+02, double* %sy, align 8
  %tmp = load double* %sx, align 8
  %tmp1 = load i32* %nx, align 4
  %sub = sub nsw i32 %tmp1, 1
  %conv = sitofp i32 %sub to double
  %div = fdiv double %tmp, %conv
  store double %div, double* %hx, align 8
  %tmp2 = load double* %sy, align 8
  %tmp3 = load i32* %ny, align 4
  %sub4 = sub nsw i32 %tmp3, 1
  %conv5 = sitofp i32 %sub4 to double
  %div6 = fdiv double %tmp2, %conv5
  store double %div6, double* %hy, align 8
  store double 5.000000e-01, double* %p, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc59, %entry
  %tmp7 = load i32* %i, align 4
  %tmp8 = load i32* %nx, align 4
  %cmp = icmp slt i32 %tmp7, %tmp8
  br i1 %cmp, label %for.body, label %for.end62

for.body:                                         ; preds = %for.cond
  %tmp10 = load i32* %i, align 4
  %conv11 = sitofp i32 %tmp10 to double
  %tmp12 = load double* %hx, align 8
  %mul13 = fmul double %conv11, %tmp12
  store double %mul13, double* %x, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc, %for.body
  %tmp15 = load i32* %j, align 4
  %tmp16 = load i32* %ny, align 4
  %cmp17 = icmp slt i32 %tmp15, %tmp16
  br i1 %cmp17, label %for.body19, label %for.end

for.body19:                                       ; preds = %for.cond14
  %tmp20 = load i32* %j, align 4
  %conv21 = sitofp i32 %tmp20 to double
  %tmp22 = load double* %hy, align 8
  %mul23 = fmul double %conv21, %tmp22
  store double %mul23, double* %y, align 8
  %tmp24 = load double* %a0, align 8
  %tmp25 = load double* %b0, align 8
  %tmp26 = load double* %y, align 8
  %mul27 = fmul double %tmp25, %tmp26
  %add = fadd double %tmp24, %mul27
  %tmp28 = load i32* %j, align 4
  %idxprom = sext i32 %tmp28 to i64
  %tmp29 = load i32* %i, align 4
  %idxprom30 = sext i32 %tmp29 to i64
  %arrayidx = getelementptr inbounds [6 x [3 x double]]* %ck, i32 0, i64 %idxprom30
  %arrayidx31 = getelementptr inbounds [3 x double]* %arrayidx, i32 0, i64 %idxprom
  store double %add, double* %arrayidx31, align 8
  %tmp32 = load double* %h0, align 8
  %tmp33 = load double* %ch, align 8
  %tmp34 = load double* %pi, align 8
  %tmp35 = load double* %x, align 8
  %mul36 = fmul double %tmp34, %tmp35
  %tmp37 = load double* %sx, align 8
  %div38 = fdiv double %mul36, %tmp37
  %call39 = call double @cos(double %div38) nounwind readnone
  %mul40 = fmul double %tmp33, %call39
  %tmp41 = load double* %y, align 8
  %mul42 = fmul double %mul40, %tmp41
  %tmp43 = load double* %sy, align 8
  %div44 = fdiv double %mul42, %tmp43
  %add45 = fadd double %tmp32, %div44
  %tmp46 = load i32* %j, align 4
  %idxprom47 = sext i32 %tmp46 to i64
  %tmp48 = load i32* %i, align 4
  %idxprom49 = sext i32 %tmp48 to i64
  %arrayidx50 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 %idxprom49
  %arrayidx51 = getelementptr inbounds [3 x double]* %arrayidx50, i32 0, i64 %idxprom47
  store double %add45, double* %arrayidx51, align 8
  %tmp52 = load i32* %j, align 4
  %idxprom53 = sext i32 %tmp52 to i64
  %tmp54 = load i32* %i, align 4
  %idxprom55 = sext i32 %tmp54 to i64
  %arrayidx56 = getelementptr inbounds [6 x [3 x double]]* %sn, i32 0, i64 %idxprom55
  %arrayidx57 = getelementptr inbounds [3 x double]* %arrayidx56, i32 0, i64 %idxprom53
  store double 0.000000e+00, double* %arrayidx57, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body19
  %tmp58 = load i32* %j, align 4
  %inc = add nsw i32 %tmp58, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond14

for.end:                                          ; preds = %for.cond14
  br label %for.inc59

for.inc59:                                        ; preds = %for.end
  %tmp60 = load i32* %i, align 4
  %inc61 = add nsw i32 %tmp60, 1
  store i32 %inc61, i32* %i, align 4
  br label %for.cond

for.end62:                                        ; preds = %for.cond
  store i32 0, i32* %istep, align 4
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc128, %for.end62
  %tmp64 = load i32* %istep, align 4
  %cmp65 = icmp slt i32 %tmp64, 2
  br i1 %cmp65, label %for.body67, label %for.end131

for.body67:                                       ; preds = %for.cond63
  store i32 0, i32* %j, align 4
  br label %for.cond68

for.cond68:                                       ; preds = %for.inc117, %for.body67
  %tmp69 = load i32* %j, align 4
  %tmp70 = load i32* %ny, align 4
  %cmp71 = icmp slt i32 %tmp69, %tmp70
  br i1 %cmp71, label %for.body73, label %for.end120

for.body73:                                       ; preds = %for.cond68
  %tmp74 = load i32* %j, align 4
  %idxprom75 = sext i32 %tmp74 to i64
  %arrayidx76 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 1
  %arrayidx77 = getelementptr inbounds [3 x double]* %arrayidx76, i32 0, i64 %idxprom75
  %tmp78 = load double* %arrayidx77, align 8
  %mul79 = fmul double 4.000000e+00, %tmp78
  %tmp80 = load i32* %j, align 4
  %idxprom81 = sext i32 %tmp80 to i64
  %arrayidx82 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 2
  %arrayidx83 = getelementptr inbounds [3 x double]* %arrayidx82, i32 0, i64 %idxprom81
  %tmp84 = load double* %arrayidx83, align 8
  %sub85 = fsub double %mul79, %tmp84
  %div86 = fdiv double %sub85, 3.000000e+00
  %tmp87 = load i32* %j, align 4
  %idxprom88 = sext i32 %tmp87 to i64
  %arrayidx89 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 0
  %arrayidx90 = getelementptr inbounds [3 x double]* %arrayidx89, i32 0, i64 %idxprom88
  store double %div86, double* %arrayidx90, align 8
  %tmp91 = load i32* %j, align 4
  %idxprom92 = sext i32 %tmp91 to i64
  %tmp93 = load i32* %nx, align 4
  %sub94 = sub nsw i32 %tmp93, 2
  %idxprom95 = sext i32 %sub94 to i64
  %arrayidx96 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 %idxprom95
  %arrayidx97 = getelementptr inbounds [3 x double]* %arrayidx96, i32 0, i64 %idxprom92
  %tmp98 = load double* %arrayidx97, align 8
  %mul99 = fmul double 4.000000e+00, %tmp98
  %tmp100 = load i32* %j, align 4
  %idxprom101 = sext i32 %tmp100 to i64
  %tmp102 = load i32* %nx, align 4
  %sub103 = sub nsw i32 %tmp102, 3
  %idxprom104 = sext i32 %sub103 to i64
  %arrayidx105 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 %idxprom104
  %arrayidx106 = getelementptr inbounds [3 x double]* %arrayidx105, i32 0, i64 %idxprom101
  %tmp107 = load double* %arrayidx106, align 8
  %sub108 = fsub double %mul99, %tmp107
  %div109 = fdiv double %sub108, 3.000000e+00
  %tmp110 = load i32* %j, align 4
  %idxprom111 = sext i32 %tmp110 to i64
  %tmp112 = load i32* %nx, align 4
  %sub113 = sub nsw i32 %tmp112, 1
  %idxprom114 = sext i32 %sub113 to i64
  %arrayidx115 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 %idxprom114
  %arrayidx116 = getelementptr inbounds [3 x double]* %arrayidx115, i32 0, i64 %idxprom111
  store double %div109, double* %arrayidx116, align 8
  br label %for.inc117

for.inc117:                                       ; preds = %for.body73
  %tmp118 = load i32* %j, align 4
  %inc119 = add nsw i32 %tmp118, 1
  store i32 %inc119, i32* %j, align 4
  br label %for.cond68

for.end120:                                       ; preds = %for.cond68
  %arraydecay = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i32 0
  %arraydecay121 = getelementptr inbounds [6 x [3 x double]]* %ck, i32 0, i32 0
  %arraydecay122 = getelementptr inbounds [6 x [3 x double]]* %sn, i32 0, i32 0
  %tmp123 = load i32* %nx, align 4
  %tmp124 = load i32* %ny, align 4
  %tmp125 = load double* %p, align 8
  %tmp126 = load double* %hx, align 8
  %tmp127 = load double* %hy, align 8
  call void (...)* bitcast (void ([3 x double]*, [3 x double]*, [3 x double]*, i32, i32, double, double, double)* @rx2d to void (...)*)([3 x double]* %arraydecay, [3 x double]* %arraydecay121, [3 x double]* %arraydecay122, i32 %tmp123, i32 %tmp124, double %tmp125, double %tmp126, double %tmp127)
  br label %for.inc128

for.inc128:                                       ; preds = %for.end120
  %tmp129 = load i32* %istep, align 4
  %inc130 = add nsw i32 %tmp129, 1
  store i32 %inc130, i32* %istep, align 4
  br label %for.cond63

for.end131:                                       ; preds = %for.cond63
  store i32 0, i32* %i, align 4
  br label %for.cond132

for.cond132:                                      ; preds = %for.inc172, %for.end131
  %tmp133 = load i32* %i, align 4
  %tmp134 = load i32* %nx, align 4
  %cmp135 = icmp slt i32 %tmp133, %tmp134
  br i1 %cmp135, label %for.body137, label %for.end175

for.body137:                                      ; preds = %for.cond132
  %tmp138 = load i32* %i, align 4
  %conv139 = sitofp i32 %tmp138 to double
  %tmp140 = load double* %hx, align 8
  %mul141 = fmul double %conv139, %tmp140
  store double %mul141, double* %x, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond142

for.cond142:                                      ; preds = %for.inc168, %for.body137
  %tmp143 = load i32* %j, align 4
  %tmp144 = load i32* %ny, align 4
  %cmp145 = icmp slt i32 %tmp143, %tmp144
  br i1 %cmp145, label %for.body147, label %for.end171

for.body147:                                      ; preds = %for.cond142
  %tmp148 = load i32* %j, align 4
  %conv149 = sitofp i32 %tmp148 to double
  %tmp150 = load double* %hy, align 8
  %mul151 = fmul double %conv149, %tmp150
  store double %mul151, double* %y, align 8
  %tmp152 = load double* %x, align 8
  %mul153 = fmul double %tmp152, 1.000000e+01
  %conv154 = fptosi double %mul153 to i32
  %tmp155 = load double* %y, align 8
  %mul156 = fmul double %tmp155, 1.000000e+01
  %conv157 = fptosi double %mul156 to i32
  %tmp158 = load i32* %j, align 4
  %idxprom159 = sext i32 %tmp158 to i64
  %tmp160 = load i32* %i, align 4
  %idxprom161 = sext i32 %tmp160 to i64
  %arrayidx162 = getelementptr inbounds [6 x [3 x double]]* %phi, i32 0, i64 %idxprom161
  %arrayidx163 = getelementptr inbounds [3 x double]* %arrayidx162, i32 0, i64 %idxprom159
  %tmp164 = load double* %arrayidx163, align 8
  %conv165 = fptosi double %tmp164 to i32
  %mul166 = mul nsw i32 %conv165, 10
  %call167 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i32 %conv154, i32 %conv157, i32 %mul166)
  br label %for.inc168

for.inc168:                                       ; preds = %for.body147
  %tmp169 = load i32* %j, align 4
  %inc170 = add nsw i32 %tmp169, 1
  store i32 %inc170, i32* %j, align 4
  br label %for.cond142

for.end171:                                       ; preds = %for.cond142
  br label %for.inc172

for.inc172:                                       ; preds = %for.end171
  %tmp173 = load i32* %i, align 4
  %inc174 = add nsw i32 %tmp173, 1
  store i32 %inc174, i32* %i, align 4
  br label %for.cond132

for.end175:                                       ; preds = %for.cond132
  ret i32 0
}

declare double @atan(double) nounwind

declare double @cos(double) nounwind readnone

declare i32 @printf(i8*, ...)

define void @rx2d([3 x double]* %fn, [3 x double]* %dn, [3 x double]* %s, i32 %nx, i32 %ny, double %p, double %hx, double %hy) nounwind uwtable {
entry:
  %fn.addr = alloca [3 x double]*, align 8
  %dn.addr = alloca [3 x double]*, align 8
  %s.addr = alloca [3 x double]*, align 8
  %nx.addr = alloca i32, align 4
  %ny.addr = alloca i32, align 4
  %p.addr = alloca double, align 8
  %hx.addr = alloca double, align 8
  %hy.addr = alloca double, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %hx2 = alloca double, align 8
  %a = alloca double, align 8
  %b = alloca double, align 8
  %q = alloca double, align 8
  %cip = alloca double, align 8
  %cim = alloca double, align 8
  %cjp = alloca double, align 8
  %cjm = alloca double, align 8
  store [3 x double]* %fn, [3 x double]** %fn.addr, align 8
  store [3 x double]* %dn, [3 x double]** %dn.addr, align 8
  store [3 x double]* %s, [3 x double]** %s.addr, align 8
  store i32 %nx, i32* %nx.addr, align 4
  store i32 %ny, i32* %ny.addr, align 4
  store double %p, double* %p.addr, align 8
  store double %hx, double* %hx.addr, align 8
  store double %hy, double* %hy.addr, align 8
  %tmp = load double* %hx.addr, align 8
  %tmp1 = load double* %hx.addr, align 8
  %mul = fmul double %tmp, %tmp1
  store double %mul, double* %hx2, align 8
  %tmp2 = load double* %hx2, align 8
  %tmp3 = load double* %hy.addr, align 8
  %tmp4 = load double* %hy.addr, align 8
  %mul5 = fmul double %tmp3, %tmp4
  %div = fdiv double %tmp2, %mul5
  store double %div, double* %a, align 8
  %tmp6 = load double* %a, align 8
  %add = fadd double 1.000000e+00, %tmp6
  %mul7 = fmul double 4.000000e+00, %add
  %div8 = fdiv double 1.000000e+00, %mul7
  store double %div8, double* %b, align 8
  %tmp9 = load double* %p.addr, align 8
  %sub = fsub double 1.000000e+00, %tmp9
  store double %sub, double* %q, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc184, %entry
  %tmp10 = load i32* %i, align 4
  %tmp11 = load i32* %nx.addr, align 4
  %sub12 = sub nsw i32 %tmp11, 1
  %cmp = icmp slt i32 %tmp10, %sub12
  br i1 %cmp, label %for.body, label %for.end187

for.body:                                         ; preds = %for.cond
  store i32 1, i32* %j, align 4
  br label %for.cond13

for.cond13:                                       ; preds = %for.inc, %for.body
  %tmp14 = load i32* %j, align 4
  %tmp15 = load i32* %ny.addr, align 4
  %sub16 = sub nsw i32 %tmp15, 1
  %cmp17 = icmp slt i32 %tmp14, %sub16
  br i1 %cmp17, label %for.body18, label %for.end

for.body18:                                       ; preds = %for.cond13
  %tmp19 = load double* %b, align 8
  %tmp20 = load i32* %j, align 4
  %idxprom = sext i32 %tmp20 to i64
  %tmp21 = load i32* %i, align 4
  %add22 = add nsw i32 %tmp21, 1
  %idxprom23 = sext i32 %add22 to i64
  %tmp24 = load [3 x double]** %dn.addr, align 8
  %arrayidx = getelementptr inbounds [3 x double]* %tmp24, i64 %idxprom23
  %arrayidx25 = getelementptr inbounds [3 x double]* %arrayidx, i32 0, i64 %idxprom
  %tmp26 = load double* %arrayidx25
  %tmp27 = load i32* %j, align 4
  %idxprom28 = sext i32 %tmp27 to i64
  %tmp29 = load i32* %i, align 4
  %idxprom30 = sext i32 %tmp29 to i64
  %tmp31 = load [3 x double]** %dn.addr, align 8
  %arrayidx32 = getelementptr inbounds [3 x double]* %tmp31, i64 %idxprom30
  %arrayidx33 = getelementptr inbounds [3 x double]* %arrayidx32, i32 0, i64 %idxprom28
  %tmp34 = load double* %arrayidx33
  %div35 = fdiv double %tmp26, %tmp34
  %add36 = fadd double %div35, 1.000000e+00
  %mul37 = fmul double %tmp19, %add36
  store double %mul37, double* %cip, align 8
  %tmp38 = load double* %b, align 8
  %tmp39 = load i32* %j, align 4
  %idxprom40 = sext i32 %tmp39 to i64
  %tmp41 = load i32* %i, align 4
  %sub42 = sub nsw i32 %tmp41, 1
  %idxprom43 = sext i32 %sub42 to i64
  %tmp44 = load [3 x double]** %dn.addr, align 8
  %arrayidx45 = getelementptr inbounds [3 x double]* %tmp44, i64 %idxprom43
  %arrayidx46 = getelementptr inbounds [3 x double]* %arrayidx45, i32 0, i64 %idxprom40
  %tmp47 = load double* %arrayidx46
  %tmp48 = load i32* %j, align 4
  %idxprom49 = sext i32 %tmp48 to i64
  %tmp50 = load i32* %i, align 4
  %idxprom51 = sext i32 %tmp50 to i64
  %tmp52 = load [3 x double]** %dn.addr, align 8
  %arrayidx53 = getelementptr inbounds [3 x double]* %tmp52, i64 %idxprom51
  %arrayidx54 = getelementptr inbounds [3 x double]* %arrayidx53, i32 0, i64 %idxprom49
  %tmp55 = load double* %arrayidx54
  %div56 = fdiv double %tmp47, %tmp55
  %add57 = fadd double %div56, 1.000000e+00
  %mul58 = fmul double %tmp38, %add57
  store double %mul58, double* %cim, align 8
  %tmp59 = load double* %a, align 8
  %tmp60 = load double* %b, align 8
  %mul61 = fmul double %tmp59, %tmp60
  %tmp62 = load i32* %j, align 4
  %add63 = add nsw i32 %tmp62, 1
  %idxprom64 = sext i32 %add63 to i64
  %tmp65 = load i32* %i, align 4
  %idxprom66 = sext i32 %tmp65 to i64
  %tmp67 = load [3 x double]** %dn.addr, align 8
  %arrayidx68 = getelementptr inbounds [3 x double]* %tmp67, i64 %idxprom66
  %arrayidx69 = getelementptr inbounds [3 x double]* %arrayidx68, i32 0, i64 %idxprom64
  %tmp70 = load double* %arrayidx69
  %tmp71 = load i32* %j, align 4
  %idxprom72 = sext i32 %tmp71 to i64
  %tmp73 = load i32* %i, align 4
  %idxprom74 = sext i32 %tmp73 to i64
  %tmp75 = load [3 x double]** %dn.addr, align 8
  %arrayidx76 = getelementptr inbounds [3 x double]* %tmp75, i64 %idxprom74
  %arrayidx77 = getelementptr inbounds [3 x double]* %arrayidx76, i32 0, i64 %idxprom72
  %tmp78 = load double* %arrayidx77
  %div79 = fdiv double %tmp70, %tmp78
  %add80 = fadd double %div79, 1.000000e+00
  %mul81 = fmul double %mul61, %add80
  store double %mul81, double* %cjp, align 8
  %tmp82 = load double* %a, align 8
  %tmp83 = load double* %b, align 8
  %mul84 = fmul double %tmp82, %tmp83
  %tmp85 = load i32* %j, align 4
  %sub86 = sub nsw i32 %tmp85, 1
  %idxprom87 = sext i32 %sub86 to i64
  %tmp88 = load i32* %i, align 4
  %idxprom89 = sext i32 %tmp88 to i64
  %tmp90 = load [3 x double]** %dn.addr, align 8
  %arrayidx91 = getelementptr inbounds [3 x double]* %tmp90, i64 %idxprom89
  %arrayidx92 = getelementptr inbounds [3 x double]* %arrayidx91, i32 0, i64 %idxprom87
  %tmp93 = load double* %arrayidx92
  %tmp94 = load i32* %j, align 4
  %idxprom95 = sext i32 %tmp94 to i64
  %tmp96 = load i32* %i, align 4
  %idxprom97 = sext i32 %tmp96 to i64
  %tmp98 = load [3 x double]** %dn.addr, align 8
  %arrayidx99 = getelementptr inbounds [3 x double]* %tmp98, i64 %idxprom97
  %arrayidx100 = getelementptr inbounds [3 x double]* %arrayidx99, i32 0, i64 %idxprom95
  %tmp101 = load double* %arrayidx100
  %div102 = fdiv double %tmp93, %tmp101
  %add103 = fadd double %div102, 1.000000e+00
  %mul104 = fmul double %mul84, %add103
  store double %mul104, double* %cjm, align 8
  %tmp105 = load double* %q, align 8
  %tmp106 = load i32* %j, align 4
  %idxprom107 = sext i32 %tmp106 to i64
  %tmp108 = load i32* %i, align 4
  %idxprom109 = sext i32 %tmp108 to i64
  %tmp110 = load [3 x double]** %fn.addr, align 8
  %arrayidx111 = getelementptr inbounds [3 x double]* %tmp110, i64 %idxprom109
  %arrayidx112 = getelementptr inbounds [3 x double]* %arrayidx111, i32 0, i64 %idxprom107
  %tmp113 = load double* %arrayidx112
  %mul114 = fmul double %tmp105, %tmp113
  %tmp115 = load double* %p.addr, align 8
  %tmp116 = load double* %cip, align 8
  %tmp117 = load i32* %j, align 4
  %idxprom118 = sext i32 %tmp117 to i64
  %tmp119 = load i32* %i, align 4
  %add120 = add nsw i32 %tmp119, 1
  %idxprom121 = sext i32 %add120 to i64
  %tmp122 = load [3 x double]** %fn.addr, align 8
  %arrayidx123 = getelementptr inbounds [3 x double]* %tmp122, i64 %idxprom121
  %arrayidx124 = getelementptr inbounds [3 x double]* %arrayidx123, i32 0, i64 %idxprom118
  %tmp125 = load double* %arrayidx124
  %mul126 = fmul double %tmp116, %tmp125
  %tmp127 = load double* %cim, align 8
  %tmp128 = load i32* %j, align 4
  %idxprom129 = sext i32 %tmp128 to i64
  %tmp130 = load i32* %i, align 4
  %sub131 = sub nsw i32 %tmp130, 1
  %idxprom132 = sext i32 %sub131 to i64
  %tmp133 = load [3 x double]** %fn.addr, align 8
  %arrayidx134 = getelementptr inbounds [3 x double]* %tmp133, i64 %idxprom132
  %arrayidx135 = getelementptr inbounds [3 x double]* %arrayidx134, i32 0, i64 %idxprom129
  %tmp136 = load double* %arrayidx135
  %mul137 = fmul double %tmp127, %tmp136
  %add138 = fadd double %mul126, %mul137
  %tmp139 = load double* %cjp, align 8
  %tmp140 = load i32* %j, align 4
  %add141 = add nsw i32 %tmp140, 1
  %idxprom142 = sext i32 %add141 to i64
  %tmp143 = load i32* %i, align 4
  %idxprom144 = sext i32 %tmp143 to i64
  %tmp145 = load [3 x double]** %fn.addr, align 8
  %arrayidx146 = getelementptr inbounds [3 x double]* %tmp145, i64 %idxprom144
  %arrayidx147 = getelementptr inbounds [3 x double]* %arrayidx146, i32 0, i64 %idxprom142
  %tmp148 = load double* %arrayidx147
  %mul149 = fmul double %tmp139, %tmp148
  %add150 = fadd double %add138, %mul149
  %tmp151 = load double* %cjm, align 8
  %tmp152 = load i32* %j, align 4
  %sub153 = sub nsw i32 %tmp152, 1
  %idxprom154 = sext i32 %sub153 to i64
  %tmp155 = load i32* %i, align 4
  %idxprom156 = sext i32 %tmp155 to i64
  %tmp157 = load [3 x double]** %fn.addr, align 8
  %arrayidx158 = getelementptr inbounds [3 x double]* %tmp157, i64 %idxprom156
  %arrayidx159 = getelementptr inbounds [3 x double]* %arrayidx158, i32 0, i64 %idxprom154
  %tmp160 = load double* %arrayidx159
  %mul161 = fmul double %tmp151, %tmp160
  %add162 = fadd double %add150, %mul161
  %tmp163 = load double* %hx2, align 8
  %tmp164 = load i32* %j, align 4
  %idxprom165 = sext i32 %tmp164 to i64
  %tmp166 = load i32* %i, align 4
  %idxprom167 = sext i32 %tmp166 to i64
  %tmp168 = load [3 x double]** %s.addr, align 8
  %arrayidx169 = getelementptr inbounds [3 x double]* %tmp168, i64 %idxprom167
  %arrayidx170 = getelementptr inbounds [3 x double]* %arrayidx169, i32 0, i64 %idxprom165
  %tmp171 = load double* %arrayidx170
  %mul172 = fmul double %tmp163, %tmp171
  %add173 = fadd double %add162, %mul172
  %mul174 = fmul double %tmp115, %add173
  %add175 = fadd double %mul114, %mul174
  %tmp176 = load i32* %j, align 4
  %idxprom177 = sext i32 %tmp176 to i64
  %tmp178 = load i32* %i, align 4
  %idxprom179 = sext i32 %tmp178 to i64
  %tmp180 = load [3 x double]** %fn.addr, align 8
  %arrayidx181 = getelementptr inbounds [3 x double]* %tmp180, i64 %idxprom179
  %arrayidx182 = getelementptr inbounds [3 x double]* %arrayidx181, i32 0, i64 %idxprom177
  store double %add175, double* %arrayidx182
  br label %for.inc

for.inc:                                          ; preds = %for.body18
  %tmp183 = load i32* %j, align 4
  %inc = add nsw i32 %tmp183, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond13

for.end:                                          ; preds = %for.cond13
  br label %for.inc184

for.inc184:                                       ; preds = %for.end
  %tmp185 = load i32* %i, align 4
  %inc186 = add nsw i32 %tmp185, 1
  store i32 %inc186, i32* %i, align 4
  br label %for.cond

for.end187:                                       ; preds = %for.cond
  ret void
}
