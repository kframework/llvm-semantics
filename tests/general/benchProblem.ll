; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/benchProblem.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %xl = alloca x86_fp80, align 16
  %h = alloca x86_fp80, align 16
  %h2 = alloca x86_fp80, align 16
  %y0 = alloca x86_fp80, align 16
  %x0 = alloca x86_fp80, align 16
  %xd = alloca x86_fp80, align 16
  %rho = alloca x86_fp80, align 16
  %g = alloca x86_fp80, align 16
  %d = alloca x86_fp80, align 16
  %e = alloca x86_fp80, align 16
  %e0 = alloca x86_fp80, align 16
  %f0 = alloca x86_fp80, align 16
  %b = alloca [20 x double], align 16
  %x = alloca [20 x double], align 16
  %y = alloca [20 x double], align 16
  %w = alloca [20 x double], align 16
  %u = alloca [20 x double], align 16
  store i32 0, i32* %retval
  store i32 20, i32* %n, align 4
  store x86_fp80 0xK4000C000000000000000, x86_fp80* %xl, align 16
  %tmp = load x86_fp80* %xl, align 16
  %tmp1 = load i32* %n, align 4
  %add = add nsw i32 %tmp1, 1
  %conv = sitofp i32 %add to x86_fp80
  %div = fdiv x86_fp80 %tmp, %conv
  store x86_fp80 %div, x86_fp80* %h, align 16
  %tmp2 = load x86_fp80* %h, align 16
  %tmp3 = load x86_fp80* %h, align 16
  %mul = fmul x86_fp80 %tmp2, %tmp3
  store x86_fp80 %mul, x86_fp80* %h2, align 16
  %tmp4 = call double @llvm.pow.f64(double 3.000000e-02, double 3.000000e+00)
  %mul5 = fmul double 1.000000e+09, %tmp4
  %mul6 = fmul double %mul5, 2.000000e-01
  %div7 = fdiv double %mul6, 3.000000e+00
  %conv8 = fpext double %div7 to x86_fp80
  store x86_fp80 %conv8, x86_fp80* %y0, align 16
  store x86_fp80 0xK3FFD8000000000000000, x86_fp80* %x0, align 16
  store x86_fp80 0xK4000C000000000000000, x86_fp80* %rho, align 16
  store x86_fp80 0xK40029CCCCCCCCCCCD000, x86_fp80* %g, align 16
  store x86_fp80 0xK4006C800000000000000, x86_fp80* %f0, align 16
  store x86_fp80 0xK40008000000000000000, x86_fp80* %d, align 16
  store x86_fp80 0xKBFFF8000000000000000, x86_fp80* %e, align 16
  %call = call double @exp(double 1.000000e+00) nounwind
  %div9 = fdiv double 1.000000e+00, %call
  %conv10 = fpext double %div9 to x86_fp80
  store x86_fp80 %conv10, x86_fp80* %e0, align 16
  %tmp11 = load x86_fp80* %d, align 16
  %conv12 = fptrunc x86_fp80 %tmp11 to double
  %arrayidx = getelementptr inbounds [20 x double]* %w, i32 0, i64 0
  store double %conv12, double* %arrayidx, align 8
  %tmp13 = load x86_fp80* %e, align 16
  %tmp14 = load x86_fp80* %d, align 16
  %div15 = fdiv x86_fp80 %tmp13, %tmp14
  %conv16 = fptrunc x86_fp80 %div15 to double
  %arrayidx17 = getelementptr inbounds [20 x double]* %u, i32 0, i64 0
  store double %conv16, double* %arrayidx17, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp18 = load i32* %i, align 4
  %tmp19 = load i32* %n, align 4
  %cmp = icmp slt i32 %tmp18, %tmp19
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp21 = load x86_fp80* %d, align 16
  %tmp22 = load x86_fp80* %e, align 16
  %tmp23 = load i32* %i, align 4
  %sub = sub nsw i32 %tmp23, 1
  %idxprom = sext i32 %sub to i64
  %arrayidx24 = getelementptr inbounds [20 x double]* %u, i32 0, i64 %idxprom
  %tmp25 = load double* %arrayidx24, align 8
  %conv26 = fpext double %tmp25 to x86_fp80
  %mul27 = fmul x86_fp80 %tmp22, %conv26
  %sub28 = fsub x86_fp80 %tmp21, %mul27
  %conv29 = fptrunc x86_fp80 %sub28 to double
  %tmp30 = load i32* %i, align 4
  %idxprom31 = sext i32 %tmp30 to i64
  %arrayidx32 = getelementptr inbounds [20 x double]* %w, i32 0, i64 %idxprom31
  store double %conv29, double* %arrayidx32, align 8
  %tmp33 = load x86_fp80* %e, align 16
  %tmp34 = load i32* %i, align 4
  %idxprom35 = sext i32 %tmp34 to i64
  %arrayidx36 = getelementptr inbounds [20 x double]* %w, i32 0, i64 %idxprom35
  %tmp37 = load double* %arrayidx36, align 8
  %conv38 = fpext double %tmp37 to x86_fp80
  %div39 = fdiv x86_fp80 %tmp33, %conv38
  %conv40 = fptrunc x86_fp80 %div39 to double
  %tmp41 = load i32* %i, align 4
  %idxprom42 = sext i32 %tmp41 to i64
  %arrayidx43 = getelementptr inbounds [20 x double]* %u, i32 0, i64 %idxprom42
  store double %conv40, double* %arrayidx43, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp44 = load i32* %i, align 4
  %inc = add nsw i32 %tmp44, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond45

for.cond45:                                       ; preds = %for.inc114, %for.end
  %tmp46 = load i32* %i, align 4
  %tmp47 = load i32* %n, align 4
  %cmp48 = icmp slt i32 %tmp46, %tmp47
  br i1 %cmp48, label %for.body50, label %for.end117

for.body50:                                       ; preds = %for.cond45
  %tmp51 = load x86_fp80* %h, align 16
  %tmp52 = load i32* %i, align 4
  %add53 = add nsw i32 %tmp52, 1
  %conv54 = sitofp i32 %add53 to x86_fp80
  %mul55 = fmul x86_fp80 %tmp51, %conv54
  store x86_fp80 %mul55, x86_fp80* %xd, align 16
  %tmp56 = load x86_fp80* %h2, align 16
  %sub57 = fsub x86_fp80 0xK80000000000000000000, %tmp56
  %tmp58 = load x86_fp80* %rho, align 16
  %mul59 = fmul x86_fp80 %sub57, %tmp58
  %tmp60 = load x86_fp80* %g, align 16
  %mul61 = fmul x86_fp80 %mul59, %tmp60
  %conv62 = fptrunc x86_fp80 %mul61 to double
  %tmp63 = load i32* %i, align 4
  %idxprom64 = sext i32 %tmp63 to i64
  %arrayidx65 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %idxprom64
  store double %conv62, double* %arrayidx65, align 8
  %tmp66 = load x86_fp80* %xd, align 16
  %tmp67 = load x86_fp80* %xl, align 16
  %div68 = fdiv x86_fp80 %tmp67, 0xK40008000000000000000
  %sub69 = fsub x86_fp80 %tmp66, %div68
  %conv70 = fptrunc x86_fp80 %sub69 to double
  %call71 = call double @fabs(double %conv70) nounwind readnone
  %conv72 = fpext double %call71 to x86_fp80
  %tmp73 = load x86_fp80* %x0, align 16
  %cmp74 = fcmp olt x86_fp80 %conv72, %tmp73
  br i1 %cmp74, label %if.then, label %if.end

if.then:                                          ; preds = %for.body50
  %tmp76 = load i32* %i, align 4
  %idxprom77 = sext i32 %tmp76 to i64
  %arrayidx78 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %idxprom77
  %tmp79 = load double* %arrayidx78, align 8
  %conv80 = fpext double %tmp79 to x86_fp80
  %tmp81 = load x86_fp80* %h2, align 16
  %tmp82 = load x86_fp80* %f0, align 16
  %mul83 = fmul x86_fp80 %tmp81, %tmp82
  %tmp84 = load x86_fp80* %xd, align 16
  %tmp85 = load x86_fp80* %xl, align 16
  %div86 = fdiv x86_fp80 %tmp85, 0xK40008000000000000000
  %sub87 = fsub x86_fp80 %tmp84, %div86
  %tmp88 = load x86_fp80* %x0, align 16
  %div89 = fdiv x86_fp80 %sub87, %tmp88
  %conv90 = fptrunc x86_fp80 %div89 to double
  %tmp91 = call double @llvm.pow.f64(double %conv90, double 2.000000e+00)
  %sub92 = fsub double -0.000000e+00, %tmp91
  %call93 = call double @exp(double %sub92) nounwind
  %conv94 = fpext double %call93 to x86_fp80
  %tmp95 = load x86_fp80* %e0, align 16
  %sub96 = fsub x86_fp80 %conv94, %tmp95
  %mul97 = fmul x86_fp80 %mul83, %sub96
  %sub98 = fsub x86_fp80 %conv80, %mul97
  %conv99 = fptrunc x86_fp80 %sub98 to double
  %tmp100 = load i32* %i, align 4
  %idxprom101 = sext i32 %tmp100 to i64
  %arrayidx102 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %idxprom101
  store double %conv99, double* %arrayidx102, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body50
  %tmp103 = load i32* %i, align 4
  %idxprom104 = sext i32 %tmp103 to i64
  %arrayidx105 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %idxprom104
  %tmp106 = load double* %arrayidx105, align 8
  %conv107 = fpext double %tmp106 to x86_fp80
  %tmp108 = load x86_fp80* %y0, align 16
  %div109 = fdiv x86_fp80 %conv107, %tmp108
  %conv110 = fptrunc x86_fp80 %div109 to double
  %tmp111 = load i32* %i, align 4
  %idxprom112 = sext i32 %tmp111 to i64
  %arrayidx113 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %idxprom112
  store double %conv110, double* %arrayidx113, align 8
  br label %for.inc114

for.inc114:                                       ; preds = %if.end
  %tmp115 = load i32* %i, align 4
  %inc116 = add nsw i32 %tmp115, 1
  store i32 %inc116, i32* %i, align 4
  br label %for.cond45

for.end117:                                       ; preds = %for.cond45
  %arrayidx118 = getelementptr inbounds [20 x double]* %b, i32 0, i64 0
  %tmp119 = load double* %arrayidx118, align 8
  %arrayidx120 = getelementptr inbounds [20 x double]* %w, i32 0, i64 0
  %tmp121 = load double* %arrayidx120, align 8
  %div122 = fdiv double %tmp119, %tmp121
  %arrayidx123 = getelementptr inbounds [20 x double]* %y, i32 0, i64 0
  store double %div122, double* %arrayidx123, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond124

for.cond124:                                      ; preds = %for.inc148, %for.end117
  %tmp125 = load i32* %i, align 4
  %tmp126 = load i32* %n, align 4
  %cmp127 = icmp slt i32 %tmp125, %tmp126
  br i1 %cmp127, label %for.body129, label %for.end151

for.body129:                                      ; preds = %for.cond124
  %tmp130 = load i32* %i, align 4
  %idxprom131 = sext i32 %tmp130 to i64
  %arrayidx132 = getelementptr inbounds [20 x double]* %b, i32 0, i64 %idxprom131
  %tmp133 = load double* %arrayidx132, align 8
  %tmp134 = load i32* %i, align 4
  %sub135 = sub nsw i32 %tmp134, 1
  %idxprom136 = sext i32 %sub135 to i64
  %arrayidx137 = getelementptr inbounds [20 x double]* %y, i32 0, i64 %idxprom136
  %tmp138 = load double* %arrayidx137, align 8
  %add139 = fadd double %tmp133, %tmp138
  %tmp140 = load i32* %i, align 4
  %idxprom141 = sext i32 %tmp140 to i64
  %arrayidx142 = getelementptr inbounds [20 x double]* %w, i32 0, i64 %idxprom141
  %tmp143 = load double* %arrayidx142, align 8
  %div144 = fdiv double %add139, %tmp143
  %tmp145 = load i32* %i, align 4
  %idxprom146 = sext i32 %tmp145 to i64
  %arrayidx147 = getelementptr inbounds [20 x double]* %y, i32 0, i64 %idxprom146
  store double %div144, double* %arrayidx147, align 8
  br label %for.inc148

for.inc148:                                       ; preds = %for.body129
  %tmp149 = load i32* %i, align 4
  %inc150 = add nsw i32 %tmp149, 1
  store i32 %inc150, i32* %i, align 4
  br label %for.cond124

for.end151:                                       ; preds = %for.cond124
  %tmp152 = load i32* %n, align 4
  %sub153 = sub nsw i32 %tmp152, 1
  %idxprom154 = sext i32 %sub153 to i64
  %arrayidx155 = getelementptr inbounds [20 x double]* %y, i32 0, i64 %idxprom154
  %tmp156 = load double* %arrayidx155, align 8
  %tmp157 = load i32* %n, align 4
  %sub158 = sub nsw i32 %tmp157, 1
  %idxprom159 = sext i32 %sub158 to i64
  %arrayidx160 = getelementptr inbounds [20 x double]* %x, i32 0, i64 %idxprom159
  store double %tmp156, double* %arrayidx160, align 8
  %tmp161 = load i32* %n, align 4
  %sub162 = sub nsw i32 %tmp161, 2
  store i32 %sub162, i32* %i, align 4
  br label %for.cond163

for.cond163:                                      ; preds = %for.inc186, %for.end151
  %tmp164 = load i32* %i, align 4
  %cmp165 = icmp sge i32 %tmp164, 0
  br i1 %cmp165, label %for.body167, label %for.end189

for.body167:                                      ; preds = %for.cond163
  %tmp168 = load i32* %i, align 4
  %idxprom169 = sext i32 %tmp168 to i64
  %arrayidx170 = getelementptr inbounds [20 x double]* %y, i32 0, i64 %idxprom169
  %tmp171 = load double* %arrayidx170, align 8
  %tmp172 = load i32* %i, align 4
  %idxprom173 = sext i32 %tmp172 to i64
  %arrayidx174 = getelementptr inbounds [20 x double]* %u, i32 0, i64 %idxprom173
  %tmp175 = load double* %arrayidx174, align 8
  %tmp176 = load i32* %i, align 4
  %add177 = add nsw i32 %tmp176, 1
  %idxprom178 = sext i32 %add177 to i64
  %arrayidx179 = getelementptr inbounds [20 x double]* %x, i32 0, i64 %idxprom178
  %tmp180 = load double* %arrayidx179, align 8
  %mul181 = fmul double %tmp175, %tmp180
  %sub182 = fsub double %tmp171, %mul181
  %tmp183 = load i32* %i, align 4
  %idxprom184 = sext i32 %tmp183 to i64
  %arrayidx185 = getelementptr inbounds [20 x double]* %x, i32 0, i64 %idxprom184
  store double %sub182, double* %arrayidx185, align 8
  br label %for.inc186

for.inc186:                                       ; preds = %for.body167
  %tmp187 = load i32* %i, align 4
  %sub188 = sub nsw i32 %tmp187, 1
  store i32 %sub188, i32* %i, align 4
  br label %for.cond163

for.end189:                                       ; preds = %for.cond163
  store i32 0, i32* %i, align 4
  br label %for.cond190

for.cond190:                                      ; preds = %for.inc211, %for.end189
  %tmp191 = load i32* %i, align 4
  %tmp192 = load i32* %n, align 4
  %cmp193 = icmp slt i32 %tmp191, %tmp192
  br i1 %cmp193, label %for.body195, label %for.end214

for.body195:                                      ; preds = %for.cond190
  %tmp196 = load x86_fp80* %h, align 16
  %tmp197 = load i32* %i, align 4
  %add198 = add nsw i32 %tmp197, 1
  %conv199 = sitofp i32 %add198 to x86_fp80
  %mul200 = fmul x86_fp80 %tmp196, %conv199
  %mul201 = fmul x86_fp80 %mul200, 0xK4008FA00000000000000
  %conv202 = fptosi x86_fp80 %mul201 to i32
  %tmp203 = load i32* %i, align 4
  %idxprom204 = sext i32 %tmp203 to i64
  %arrayidx205 = getelementptr inbounds [20 x double]* %x, i32 0, i64 %idxprom204
  %tmp206 = load double* %arrayidx205, align 8
  %mul207 = fmul double 1.000000e+02, %tmp206
  %mul208 = fmul double %mul207, 1.000000e+03
  %conv209 = fptosi double %mul208 to i32
  %call210 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %conv202, i32 %conv209)
  br label %for.inc211

for.inc211:                                       ; preds = %for.body195
  %tmp212 = load i32* %i, align 4
  %inc213 = add nsw i32 %tmp212, 1
  store i32 %inc213, i32* %i, align 4
  br label %for.cond190

for.end214:                                       ; preds = %for.cond190
  ret i32 0
}

declare double @llvm.pow.f64(double, double) nounwind readonly

declare double @exp(double) nounwind

declare double @fabs(double) nounwind readnone

declare i32 @printf(i8*, ...)
