; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/pendulum.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@q = constant double 5.000000e-01, align 8
@b = constant double 9.000000e-01, align 8
@w = constant double 0x3FE5555555555555, align 8
@.str = private unnamed_addr constant [7 x i8] c"%d %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %l = alloca i32, align 4
  %np = alloca i32, align 4
  %pi = alloca double, align 8
  %h = alloca double, align 8
  %t = alloca double, align 8
  %dk11 = alloca double, align 8
  %dk21 = alloca double, align 8
  %dk12 = alloca double, align 8
  %dk22 = alloca double, align 8
  %dk13 = alloca double, align 8
  %dk23 = alloca double, align 8
  %dk14 = alloca double, align 8
  %dk24 = alloca double, align 8
  %y1 = alloca double, align 8
  %y2 = alloca double, align 8
  %y = alloca [2 x [60 x double]], align 16
  store i32 0, i32* %retval
  store i32 60, i32* %n, align 4
  store i32 14, i32* %m, align 4
  store i32 10, i32* %l, align 4
  %call = call double @atan(double 1.000000e+00) nounwind
  %mul = fmul double 4.000000e+00, %call
  store double %mul, double* %pi, align 8
  %tmp = load double* %pi, align 8
  %mul1 = fmul double 3.000000e+00, %tmp
  %tmp2 = load i32* %m, align 4
  %conv = sitofp i32 %tmp2 to double
  %div = fdiv double %mul1, %conv
  store double %div, double* %h, align 8
  %arrayidx = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx3 = getelementptr inbounds [60 x double]* %arrayidx, i32 0, i64 0
  store double 0.000000e+00, double* %arrayidx3, align 8
  %arrayidx4 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %arrayidx5 = getelementptr inbounds [60 x double]* %arrayidx4, i32 0, i64 0
  store double 2.000000e+00, double* %arrayidx5, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp6 = load i32* %i, align 4
  %tmp7 = load i32* %n, align 4
  %sub = sub nsw i32 %tmp7, 1
  %cmp = icmp slt i32 %tmp6, %sub
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp9 = load double* %h, align 8
  %tmp10 = load i32* %i, align 4
  %add = add nsw i32 %tmp10, 1
  %conv11 = sitofp i32 %add to double
  %mul12 = fmul double %tmp9, %conv11
  store double %mul12, double* %t, align 8
  %tmp13 = load i32* %i, align 4
  %idxprom = sext i32 %tmp13 to i64
  %arrayidx14 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx15 = getelementptr inbounds [60 x double]* %arrayidx14, i32 0, i64 %idxprom
  %tmp16 = load double* %arrayidx15, align 8
  store double %tmp16, double* %y1, align 8
  %tmp17 = load i32* %i, align 4
  %idxprom18 = sext i32 %tmp17 to i64
  %arrayidx19 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %arrayidx20 = getelementptr inbounds [60 x double]* %arrayidx19, i32 0, i64 %idxprom18
  %tmp21 = load double* %arrayidx20, align 8
  store double %tmp21, double* %y2, align 8
  %tmp22 = load double* %h, align 8
  %tmp23 = load double* %y2, align 8
  %mul24 = fmul double %tmp22, %tmp23
  store double %mul24, double* %dk11, align 8
  %tmp25 = load double* %h, align 8
  %tmp26 = load double* %y2, align 8
  %mul27 = fmul double -5.000000e-01, %tmp26
  %tmp28 = load double* %y1, align 8
  %call29 = call double @sin(double %tmp28) nounwind readnone
  %sub30 = fsub double %mul27, %call29
  %tmp31 = load double* %t, align 8
  %mul32 = fmul double 0x3FE5555555555555, %tmp31
  %call33 = call double @cos(double %mul32) nounwind readnone
  %mul34 = fmul double 9.000000e-01, %call33
  %add35 = fadd double %sub30, %mul34
  %mul36 = fmul double %tmp25, %add35
  store double %mul36, double* %dk21, align 8
  %tmp37 = load double* %h, align 8
  %tmp38 = load double* %y2, align 8
  %tmp39 = load double* %dk21, align 8
  %div40 = fdiv double %tmp39, 2.000000e+00
  %add41 = fadd double %tmp38, %div40
  %mul42 = fmul double %tmp37, %add41
  store double %mul42, double* %dk12, align 8
  %tmp43 = load double* %h, align 8
  %tmp44 = load double* %y2, align 8
  %tmp45 = load double* %dk21, align 8
  %div46 = fdiv double %tmp45, 2.000000e+00
  %add47 = fadd double %tmp44, %div46
  %mul48 = fmul double -5.000000e-01, %add47
  %tmp49 = load double* %y1, align 8
  %tmp50 = load double* %dk11, align 8
  %div51 = fdiv double %tmp50, 2.000000e+00
  %add52 = fadd double %tmp49, %div51
  %call53 = call double @sin(double %add52) nounwind readnone
  %sub54 = fsub double %mul48, %call53
  %tmp55 = load double* %t, align 8
  %tmp56 = load double* %h, align 8
  %div57 = fdiv double %tmp56, 2.000000e+00
  %add58 = fadd double %tmp55, %div57
  %mul59 = fmul double 0x3FE5555555555555, %add58
  %call60 = call double @cos(double %mul59) nounwind readnone
  %mul61 = fmul double 9.000000e-01, %call60
  %add62 = fadd double %sub54, %mul61
  %mul63 = fmul double %tmp43, %add62
  store double %mul63, double* %dk22, align 8
  %tmp64 = load double* %h, align 8
  %tmp65 = load double* %y2, align 8
  %tmp66 = load double* %dk22, align 8
  %div67 = fdiv double %tmp66, 2.000000e+00
  %add68 = fadd double %tmp65, %div67
  %mul69 = fmul double %tmp64, %add68
  store double %mul69, double* %dk13, align 8
  %tmp70 = load double* %h, align 8
  %tmp71 = load double* %y2, align 8
  %tmp72 = load double* %dk22, align 8
  %div73 = fdiv double %tmp72, 2.000000e+00
  %add74 = fadd double %tmp71, %div73
  %mul75 = fmul double -5.000000e-01, %add74
  %tmp76 = load double* %y1, align 8
  %tmp77 = load double* %dk12, align 8
  %div78 = fdiv double %tmp77, 2.000000e+00
  %add79 = fadd double %tmp76, %div78
  %call80 = call double @sin(double %add79) nounwind readnone
  %sub81 = fsub double %mul75, %call80
  %tmp82 = load double* %t, align 8
  %tmp83 = load double* %h, align 8
  %div84 = fdiv double %tmp83, 2.000000e+00
  %add85 = fadd double %tmp82, %div84
  %mul86 = fmul double 0x3FE5555555555555, %add85
  %call87 = call double @cos(double %mul86) nounwind readnone
  %mul88 = fmul double 9.000000e-01, %call87
  %add89 = fadd double %sub81, %mul88
  %mul90 = fmul double %tmp70, %add89
  store double %mul90, double* %dk23, align 8
  %tmp91 = load double* %h, align 8
  %tmp92 = load double* %y2, align 8
  %tmp93 = load double* %dk23, align 8
  %add94 = fadd double %tmp92, %tmp93
  %mul95 = fmul double %tmp91, %add94
  store double %mul95, double* %dk14, align 8
  %tmp96 = load double* %h, align 8
  %tmp97 = load double* %y2, align 8
  %tmp98 = load double* %dk23, align 8
  %add99 = fadd double %tmp97, %tmp98
  %mul100 = fmul double -5.000000e-01, %add99
  %tmp101 = load double* %y1, align 8
  %tmp102 = load double* %dk13, align 8
  %add103 = fadd double %tmp101, %tmp102
  %call104 = call double @sin(double %add103) nounwind readnone
  %sub105 = fsub double %mul100, %call104
  %tmp106 = load double* %t, align 8
  %tmp107 = load double* %h, align 8
  %add108 = fadd double %tmp106, %tmp107
  %mul109 = fmul double 0x3FE5555555555555, %add108
  %call110 = call double @cos(double %mul109) nounwind readnone
  %mul111 = fmul double 9.000000e-01, %call110
  %add112 = fadd double %sub105, %mul111
  %mul113 = fmul double %tmp96, %add112
  store double %mul113, double* %dk24, align 8
  %tmp114 = load i32* %i, align 4
  %idxprom115 = sext i32 %tmp114 to i64
  %arrayidx116 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx117 = getelementptr inbounds [60 x double]* %arrayidx116, i32 0, i64 %idxprom115
  %tmp118 = load double* %arrayidx117, align 8
  %tmp119 = load double* %dk11, align 8
  %tmp120 = load double* %dk12, align 8
  %tmp121 = load double* %dk13, align 8
  %add122 = fadd double %tmp120, %tmp121
  %mul123 = fmul double 2.000000e+00, %add122
  %add124 = fadd double %tmp119, %mul123
  %tmp125 = load double* %dk14, align 8
  %add126 = fadd double %add124, %tmp125
  %div127 = fdiv double %add126, 6.000000e+00
  %add128 = fadd double %tmp118, %div127
  %tmp129 = load i32* %i, align 4
  %add130 = add nsw i32 %tmp129, 1
  %idxprom131 = sext i32 %add130 to i64
  %arrayidx132 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx133 = getelementptr inbounds [60 x double]* %arrayidx132, i32 0, i64 %idxprom131
  store double %add128, double* %arrayidx133, align 8
  %tmp134 = load i32* %i, align 4
  %idxprom135 = sext i32 %tmp134 to i64
  %arrayidx136 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %arrayidx137 = getelementptr inbounds [60 x double]* %arrayidx136, i32 0, i64 %idxprom135
  %tmp138 = load double* %arrayidx137, align 8
  %tmp139 = load double* %dk21, align 8
  %tmp140 = load double* %dk22, align 8
  %tmp141 = load double* %dk23, align 8
  %add142 = fadd double %tmp140, %tmp141
  %mul143 = fmul double 2.000000e+00, %add142
  %add144 = fadd double %tmp139, %mul143
  %tmp145 = load double* %dk24, align 8
  %add146 = fadd double %add144, %tmp145
  %div147 = fdiv double %add146, 6.000000e+00
  %add148 = fadd double %tmp138, %div147
  %tmp149 = load i32* %i, align 4
  %add150 = add nsw i32 %tmp149, 1
  %idxprom151 = sext i32 %add150 to i64
  %arrayidx152 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %arrayidx153 = getelementptr inbounds [60 x double]* %arrayidx152, i32 0, i64 %idxprom151
  store double %add148, double* %arrayidx153, align 8
  %tmp154 = load i32* %i, align 4
  %add155 = add nsw i32 %tmp154, 1
  %idxprom156 = sext i32 %add155 to i64
  %arrayidx157 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx158 = getelementptr inbounds [60 x double]* %arrayidx157, i32 0, i64 %idxprom156
  %tmp159 = load double* %arrayidx158, align 8
  %tmp160 = load double* %pi, align 8
  %mul161 = fmul double 2.000000e+00, %tmp160
  %div162 = fdiv double %tmp159, %mul161
  %add163 = fadd double %div162, 5.000000e-01
  %conv164 = fptosi double %add163 to i32
  store i32 %conv164, i32* %np, align 4
  %tmp165 = load i32* %i, align 4
  %add166 = add nsw i32 %tmp165, 1
  %idxprom167 = sext i32 %add166 to i64
  %arrayidx168 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx169 = getelementptr inbounds [60 x double]* %arrayidx168, i32 0, i64 %idxprom167
  %tmp170 = load double* %arrayidx169, align 8
  %tmp171 = load double* %pi, align 8
  %mul172 = fmul double 2.000000e+00, %tmp171
  %tmp173 = load i32* %np, align 4
  %conv174 = sitofp i32 %tmp173 to double
  %mul175 = fmul double %mul172, %conv174
  %sub176 = fsub double %tmp170, %mul175
  %tmp177 = load i32* %i, align 4
  %add178 = add nsw i32 %tmp177, 1
  %idxprom179 = sext i32 %add178 to i64
  %arrayidx180 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx181 = getelementptr inbounds [60 x double]* %arrayidx180, i32 0, i64 %idxprom179
  store double %sub176, double* %arrayidx181, align 8
  %tmp182 = load i32* %i, align 4
  %cmp183 = icmp eq i32 %tmp182, 0
  br i1 %cmp183, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body
  %tmp185 = load i32* %i, align 4
  %add186 = add nsw i32 %tmp185, 1
  %tmp187 = load i32* %l, align 4
  %rem = srem i32 %add186, %tmp187
  %cmp188 = icmp eq i32 %rem, 0
  br i1 %cmp188, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body
  %tmp190 = load i32* %i, align 4
  %idxprom191 = sext i32 %tmp190 to i64
  %arrayidx192 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 0
  %arrayidx193 = getelementptr inbounds [60 x double]* %arrayidx192, i32 0, i64 %idxprom191
  %tmp194 = load double* %arrayidx193, align 8
  %mul195 = fmul double %tmp194, 1.000000e+04
  %conv196 = fptosi double %mul195 to i32
  %tmp197 = load i32* %i, align 4
  %idxprom198 = sext i32 %tmp197 to i64
  %arrayidx199 = getelementptr inbounds [2 x [60 x double]]* %y, i32 0, i64 1
  %arrayidx200 = getelementptr inbounds [60 x double]* %arrayidx199, i32 0, i64 %idxprom198
  %tmp201 = load double* %arrayidx200, align 8
  %mul202 = fmul double %tmp201, 1.000000e+04
  %conv203 = fptosi double %mul202 to i32
  %call204 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([7 x i8]* @.str, i32 0, i32 0), i32 %conv196, i32 %conv203)
  br label %if.end

if.end:                                           ; preds = %if.then, %lor.lhs.false
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp205 = load i32* %i, align 4
  %inc = add nsw i32 %tmp205, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare double @atan(double) nounwind

declare double @sin(double) nounwind readnone

declare double @cos(double) nounwind readnone

declare i32 @printf(i8*, ...)
