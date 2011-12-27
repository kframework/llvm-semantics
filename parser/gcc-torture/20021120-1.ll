; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20021120-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@gd = common global [32 x double] zeroinitializer, align 16
@gf = common global [32 x float] zeroinitializer, align 16

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define void @foo(i32 %n) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %d00 = alloca double, align 8
  %d10 = alloca double, align 8
  %d20 = alloca double, align 8
  %d30 = alloca double, align 8
  %d01 = alloca double, align 8
  %d11 = alloca double, align 8
  %d21 = alloca double, align 8
  %d31 = alloca double, align 8
  %d02 = alloca double, align 8
  %d12 = alloca double, align 8
  %d22 = alloca double, align 8
  %d32 = alloca double, align 8
  %d03 = alloca double, align 8
  %d13 = alloca double, align 8
  %d23 = alloca double, align 8
  %d33 = alloca double, align 8
  %d04 = alloca double, align 8
  %d14 = alloca double, align 8
  %d24 = alloca double, align 8
  %d34 = alloca double, align 8
  %d05 = alloca double, align 8
  %d15 = alloca double, align 8
  %d25 = alloca double, align 8
  %d35 = alloca double, align 8
  %d06 = alloca double, align 8
  %d16 = alloca double, align 8
  %d26 = alloca double, align 8
  %d36 = alloca double, align 8
  %d07 = alloca double, align 8
  %d17 = alloca double, align 8
  %d27 = alloca double, align 8
  %d37 = alloca double, align 8
  %f00 = alloca float, align 4
  %f10 = alloca float, align 4
  %f20 = alloca float, align 4
  %f30 = alloca float, align 4
  %f01 = alloca float, align 4
  %f11 = alloca float, align 4
  %f21 = alloca float, align 4
  %f31 = alloca float, align 4
  %f02 = alloca float, align 4
  %f12 = alloca float, align 4
  %f22 = alloca float, align 4
  %f32 = alloca float, align 4
  %f03 = alloca float, align 4
  %f13 = alloca float, align 4
  %f23 = alloca float, align 4
  %f33 = alloca float, align 4
  %f04 = alloca float, align 4
  %f14 = alloca float, align 4
  %f24 = alloca float, align 4
  %f34 = alloca float, align 4
  %f05 = alloca float, align 4
  %f15 = alloca float, align 4
  %f25 = alloca float, align 4
  %f35 = alloca float, align 4
  %f06 = alloca float, align 4
  %f16 = alloca float, align 4
  %f26 = alloca float, align 4
  %f36 = alloca float, align 4
  %f07 = alloca float, align 4
  %f17 = alloca float, align 4
  %f27 = alloca float, align 4
  %f37 = alloca float, align 4
  %pd = alloca double*, align 8
  %pf = alloca float*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* getelementptr inbounds ([32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %tmp = load double** %pd, align 8
  %incdec.ptr = getelementptr inbounds double* %tmp, i32 1
  store double* %incdec.ptr, double** %pd, align 8
  %tmp1 = volatile load double* %tmp
  store double %tmp1, double* %d00, align 8
  %tmp2 = load double** %pd, align 8
  %incdec.ptr3 = getelementptr inbounds double* %tmp2, i32 1
  store double* %incdec.ptr3, double** %pd, align 8
  %tmp4 = volatile load double* %tmp2
  store double %tmp4, double* %d10, align 8
  %tmp5 = load double** %pd, align 8
  %incdec.ptr6 = getelementptr inbounds double* %tmp5, i32 1
  store double* %incdec.ptr6, double** %pd, align 8
  %tmp7 = volatile load double* %tmp5
  store double %tmp7, double* %d20, align 8
  %tmp8 = load double** %pd, align 8
  %incdec.ptr9 = getelementptr inbounds double* %tmp8, i32 1
  store double* %incdec.ptr9, double** %pd, align 8
  %tmp10 = volatile load double* %tmp8
  store double %tmp10, double* %d30, align 8
  %tmp11 = load double** %pd, align 8
  %incdec.ptr12 = getelementptr inbounds double* %tmp11, i32 1
  store double* %incdec.ptr12, double** %pd, align 8
  %tmp13 = volatile load double* %tmp11
  store double %tmp13, double* %d01, align 8
  %tmp14 = load double** %pd, align 8
  %incdec.ptr15 = getelementptr inbounds double* %tmp14, i32 1
  store double* %incdec.ptr15, double** %pd, align 8
  %tmp16 = volatile load double* %tmp14
  store double %tmp16, double* %d11, align 8
  %tmp17 = load double** %pd, align 8
  %incdec.ptr18 = getelementptr inbounds double* %tmp17, i32 1
  store double* %incdec.ptr18, double** %pd, align 8
  %tmp19 = volatile load double* %tmp17
  store double %tmp19, double* %d21, align 8
  %tmp20 = load double** %pd, align 8
  %incdec.ptr21 = getelementptr inbounds double* %tmp20, i32 1
  store double* %incdec.ptr21, double** %pd, align 8
  %tmp22 = volatile load double* %tmp20
  store double %tmp22, double* %d31, align 8
  %tmp23 = load double** %pd, align 8
  %incdec.ptr24 = getelementptr inbounds double* %tmp23, i32 1
  store double* %incdec.ptr24, double** %pd, align 8
  %tmp25 = volatile load double* %tmp23
  store double %tmp25, double* %d02, align 8
  %tmp26 = load double** %pd, align 8
  %incdec.ptr27 = getelementptr inbounds double* %tmp26, i32 1
  store double* %incdec.ptr27, double** %pd, align 8
  %tmp28 = volatile load double* %tmp26
  store double %tmp28, double* %d12, align 8
  %tmp29 = load double** %pd, align 8
  %incdec.ptr30 = getelementptr inbounds double* %tmp29, i32 1
  store double* %incdec.ptr30, double** %pd, align 8
  %tmp31 = volatile load double* %tmp29
  store double %tmp31, double* %d22, align 8
  %tmp32 = load double** %pd, align 8
  %incdec.ptr33 = getelementptr inbounds double* %tmp32, i32 1
  store double* %incdec.ptr33, double** %pd, align 8
  %tmp34 = volatile load double* %tmp32
  store double %tmp34, double* %d32, align 8
  %tmp35 = load double** %pd, align 8
  %incdec.ptr36 = getelementptr inbounds double* %tmp35, i32 1
  store double* %incdec.ptr36, double** %pd, align 8
  %tmp37 = volatile load double* %tmp35
  store double %tmp37, double* %d03, align 8
  %tmp38 = load double** %pd, align 8
  %incdec.ptr39 = getelementptr inbounds double* %tmp38, i32 1
  store double* %incdec.ptr39, double** %pd, align 8
  %tmp40 = volatile load double* %tmp38
  store double %tmp40, double* %d13, align 8
  %tmp41 = load double** %pd, align 8
  %incdec.ptr42 = getelementptr inbounds double* %tmp41, i32 1
  store double* %incdec.ptr42, double** %pd, align 8
  %tmp43 = volatile load double* %tmp41
  store double %tmp43, double* %d23, align 8
  %tmp44 = load double** %pd, align 8
  %incdec.ptr45 = getelementptr inbounds double* %tmp44, i32 1
  store double* %incdec.ptr45, double** %pd, align 8
  %tmp46 = volatile load double* %tmp44
  store double %tmp46, double* %d33, align 8
  %tmp47 = load double** %pd, align 8
  %incdec.ptr48 = getelementptr inbounds double* %tmp47, i32 1
  store double* %incdec.ptr48, double** %pd, align 8
  %tmp49 = volatile load double* %tmp47
  store double %tmp49, double* %d04, align 8
  %tmp50 = load double** %pd, align 8
  %incdec.ptr51 = getelementptr inbounds double* %tmp50, i32 1
  store double* %incdec.ptr51, double** %pd, align 8
  %tmp52 = volatile load double* %tmp50
  store double %tmp52, double* %d14, align 8
  %tmp53 = load double** %pd, align 8
  %incdec.ptr54 = getelementptr inbounds double* %tmp53, i32 1
  store double* %incdec.ptr54, double** %pd, align 8
  %tmp55 = volatile load double* %tmp53
  store double %tmp55, double* %d24, align 8
  %tmp56 = load double** %pd, align 8
  %incdec.ptr57 = getelementptr inbounds double* %tmp56, i32 1
  store double* %incdec.ptr57, double** %pd, align 8
  %tmp58 = volatile load double* %tmp56
  store double %tmp58, double* %d34, align 8
  %tmp59 = load double** %pd, align 8
  %incdec.ptr60 = getelementptr inbounds double* %tmp59, i32 1
  store double* %incdec.ptr60, double** %pd, align 8
  %tmp61 = volatile load double* %tmp59
  store double %tmp61, double* %d05, align 8
  %tmp62 = load double** %pd, align 8
  %incdec.ptr63 = getelementptr inbounds double* %tmp62, i32 1
  store double* %incdec.ptr63, double** %pd, align 8
  %tmp64 = volatile load double* %tmp62
  store double %tmp64, double* %d15, align 8
  %tmp65 = load double** %pd, align 8
  %incdec.ptr66 = getelementptr inbounds double* %tmp65, i32 1
  store double* %incdec.ptr66, double** %pd, align 8
  %tmp67 = volatile load double* %tmp65
  store double %tmp67, double* %d25, align 8
  %tmp68 = load double** %pd, align 8
  %incdec.ptr69 = getelementptr inbounds double* %tmp68, i32 1
  store double* %incdec.ptr69, double** %pd, align 8
  %tmp70 = volatile load double* %tmp68
  store double %tmp70, double* %d35, align 8
  %tmp71 = load double** %pd, align 8
  %incdec.ptr72 = getelementptr inbounds double* %tmp71, i32 1
  store double* %incdec.ptr72, double** %pd, align 8
  %tmp73 = volatile load double* %tmp71
  store double %tmp73, double* %d06, align 8
  %tmp74 = load double** %pd, align 8
  %incdec.ptr75 = getelementptr inbounds double* %tmp74, i32 1
  store double* %incdec.ptr75, double** %pd, align 8
  %tmp76 = volatile load double* %tmp74
  store double %tmp76, double* %d16, align 8
  %tmp77 = load double** %pd, align 8
  %incdec.ptr78 = getelementptr inbounds double* %tmp77, i32 1
  store double* %incdec.ptr78, double** %pd, align 8
  %tmp79 = volatile load double* %tmp77
  store double %tmp79, double* %d26, align 8
  %tmp80 = load double** %pd, align 8
  %incdec.ptr81 = getelementptr inbounds double* %tmp80, i32 1
  store double* %incdec.ptr81, double** %pd, align 8
  %tmp82 = volatile load double* %tmp80
  store double %tmp82, double* %d36, align 8
  %tmp83 = load double** %pd, align 8
  %incdec.ptr84 = getelementptr inbounds double* %tmp83, i32 1
  store double* %incdec.ptr84, double** %pd, align 8
  %tmp85 = volatile load double* %tmp83
  store double %tmp85, double* %d07, align 8
  %tmp86 = load double** %pd, align 8
  %incdec.ptr87 = getelementptr inbounds double* %tmp86, i32 1
  store double* %incdec.ptr87, double** %pd, align 8
  %tmp88 = volatile load double* %tmp86
  store double %tmp88, double* %d17, align 8
  %tmp89 = load double** %pd, align 8
  %incdec.ptr90 = getelementptr inbounds double* %tmp89, i32 1
  store double* %incdec.ptr90, double** %pd, align 8
  %tmp91 = volatile load double* %tmp89
  store double %tmp91, double* %d27, align 8
  %tmp92 = load double** %pd, align 8
  %incdec.ptr93 = getelementptr inbounds double* %tmp92, i32 1
  store double* %incdec.ptr93, double** %pd, align 8
  %tmp94 = volatile load double* %tmp92
  store double %tmp94, double* %d37, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp95 = load i32* %i, align 4
  %tmp96 = load i32* %n.addr, align 4
  %cmp = icmp slt i32 %tmp95, %tmp96
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  store float* getelementptr inbounds ([32 x float]* @gf, i32 0, i32 0), float** %pf, align 8
  %tmp97 = load float** %pf, align 8
  %incdec.ptr98 = getelementptr inbounds float* %tmp97, i32 1
  store float* %incdec.ptr98, float** %pf, align 8
  %tmp99 = volatile load float* %tmp97
  store float %tmp99, float* %f00, align 4
  %tmp100 = load float** %pf, align 8
  %incdec.ptr101 = getelementptr inbounds float* %tmp100, i32 1
  store float* %incdec.ptr101, float** %pf, align 8
  %tmp102 = volatile load float* %tmp100
  store float %tmp102, float* %f10, align 4
  %tmp103 = load float** %pf, align 8
  %incdec.ptr104 = getelementptr inbounds float* %tmp103, i32 1
  store float* %incdec.ptr104, float** %pf, align 8
  %tmp105 = volatile load float* %tmp103
  store float %tmp105, float* %f20, align 4
  %tmp106 = load float** %pf, align 8
  %incdec.ptr107 = getelementptr inbounds float* %tmp106, i32 1
  store float* %incdec.ptr107, float** %pf, align 8
  %tmp108 = volatile load float* %tmp106
  store float %tmp108, float* %f30, align 4
  %tmp109 = load float** %pf, align 8
  %incdec.ptr110 = getelementptr inbounds float* %tmp109, i32 1
  store float* %incdec.ptr110, float** %pf, align 8
  %tmp111 = volatile load float* %tmp109
  store float %tmp111, float* %f01, align 4
  %tmp112 = load float** %pf, align 8
  %incdec.ptr113 = getelementptr inbounds float* %tmp112, i32 1
  store float* %incdec.ptr113, float** %pf, align 8
  %tmp114 = volatile load float* %tmp112
  store float %tmp114, float* %f11, align 4
  %tmp115 = load float** %pf, align 8
  %incdec.ptr116 = getelementptr inbounds float* %tmp115, i32 1
  store float* %incdec.ptr116, float** %pf, align 8
  %tmp117 = volatile load float* %tmp115
  store float %tmp117, float* %f21, align 4
  %tmp118 = load float** %pf, align 8
  %incdec.ptr119 = getelementptr inbounds float* %tmp118, i32 1
  store float* %incdec.ptr119, float** %pf, align 8
  %tmp120 = volatile load float* %tmp118
  store float %tmp120, float* %f31, align 4
  %tmp121 = load float** %pf, align 8
  %incdec.ptr122 = getelementptr inbounds float* %tmp121, i32 1
  store float* %incdec.ptr122, float** %pf, align 8
  %tmp123 = volatile load float* %tmp121
  store float %tmp123, float* %f02, align 4
  %tmp124 = load float** %pf, align 8
  %incdec.ptr125 = getelementptr inbounds float* %tmp124, i32 1
  store float* %incdec.ptr125, float** %pf, align 8
  %tmp126 = volatile load float* %tmp124
  store float %tmp126, float* %f12, align 4
  %tmp127 = load float** %pf, align 8
  %incdec.ptr128 = getelementptr inbounds float* %tmp127, i32 1
  store float* %incdec.ptr128, float** %pf, align 8
  %tmp129 = volatile load float* %tmp127
  store float %tmp129, float* %f22, align 4
  %tmp130 = load float** %pf, align 8
  %incdec.ptr131 = getelementptr inbounds float* %tmp130, i32 1
  store float* %incdec.ptr131, float** %pf, align 8
  %tmp132 = volatile load float* %tmp130
  store float %tmp132, float* %f32, align 4
  %tmp133 = load float** %pf, align 8
  %incdec.ptr134 = getelementptr inbounds float* %tmp133, i32 1
  store float* %incdec.ptr134, float** %pf, align 8
  %tmp135 = volatile load float* %tmp133
  store float %tmp135, float* %f03, align 4
  %tmp136 = load float** %pf, align 8
  %incdec.ptr137 = getelementptr inbounds float* %tmp136, i32 1
  store float* %incdec.ptr137, float** %pf, align 8
  %tmp138 = volatile load float* %tmp136
  store float %tmp138, float* %f13, align 4
  %tmp139 = load float** %pf, align 8
  %incdec.ptr140 = getelementptr inbounds float* %tmp139, i32 1
  store float* %incdec.ptr140, float** %pf, align 8
  %tmp141 = volatile load float* %tmp139
  store float %tmp141, float* %f23, align 4
  %tmp142 = load float** %pf, align 8
  %incdec.ptr143 = getelementptr inbounds float* %tmp142, i32 1
  store float* %incdec.ptr143, float** %pf, align 8
  %tmp144 = volatile load float* %tmp142
  store float %tmp144, float* %f33, align 4
  %tmp145 = load float** %pf, align 8
  %incdec.ptr146 = getelementptr inbounds float* %tmp145, i32 1
  store float* %incdec.ptr146, float** %pf, align 8
  %tmp147 = volatile load float* %tmp145
  store float %tmp147, float* %f04, align 4
  %tmp148 = load float** %pf, align 8
  %incdec.ptr149 = getelementptr inbounds float* %tmp148, i32 1
  store float* %incdec.ptr149, float** %pf, align 8
  %tmp150 = volatile load float* %tmp148
  store float %tmp150, float* %f14, align 4
  %tmp151 = load float** %pf, align 8
  %incdec.ptr152 = getelementptr inbounds float* %tmp151, i32 1
  store float* %incdec.ptr152, float** %pf, align 8
  %tmp153 = volatile load float* %tmp151
  store float %tmp153, float* %f24, align 4
  %tmp154 = load float** %pf, align 8
  %incdec.ptr155 = getelementptr inbounds float* %tmp154, i32 1
  store float* %incdec.ptr155, float** %pf, align 8
  %tmp156 = volatile load float* %tmp154
  store float %tmp156, float* %f34, align 4
  %tmp157 = load float** %pf, align 8
  %incdec.ptr158 = getelementptr inbounds float* %tmp157, i32 1
  store float* %incdec.ptr158, float** %pf, align 8
  %tmp159 = volatile load float* %tmp157
  store float %tmp159, float* %f05, align 4
  %tmp160 = load float** %pf, align 8
  %incdec.ptr161 = getelementptr inbounds float* %tmp160, i32 1
  store float* %incdec.ptr161, float** %pf, align 8
  %tmp162 = volatile load float* %tmp160
  store float %tmp162, float* %f15, align 4
  %tmp163 = load float** %pf, align 8
  %incdec.ptr164 = getelementptr inbounds float* %tmp163, i32 1
  store float* %incdec.ptr164, float** %pf, align 8
  %tmp165 = volatile load float* %tmp163
  store float %tmp165, float* %f25, align 4
  %tmp166 = load float** %pf, align 8
  %incdec.ptr167 = getelementptr inbounds float* %tmp166, i32 1
  store float* %incdec.ptr167, float** %pf, align 8
  %tmp168 = volatile load float* %tmp166
  store float %tmp168, float* %f35, align 4
  %tmp169 = load float** %pf, align 8
  %incdec.ptr170 = getelementptr inbounds float* %tmp169, i32 1
  store float* %incdec.ptr170, float** %pf, align 8
  %tmp171 = volatile load float* %tmp169
  store float %tmp171, float* %f06, align 4
  %tmp172 = load float** %pf, align 8
  %incdec.ptr173 = getelementptr inbounds float* %tmp172, i32 1
  store float* %incdec.ptr173, float** %pf, align 8
  %tmp174 = volatile load float* %tmp172
  store float %tmp174, float* %f16, align 4
  %tmp175 = load float** %pf, align 8
  %incdec.ptr176 = getelementptr inbounds float* %tmp175, i32 1
  store float* %incdec.ptr176, float** %pf, align 8
  %tmp177 = volatile load float* %tmp175
  store float %tmp177, float* %f26, align 4
  %tmp178 = load float** %pf, align 8
  %incdec.ptr179 = getelementptr inbounds float* %tmp178, i32 1
  store float* %incdec.ptr179, float** %pf, align 8
  %tmp180 = volatile load float* %tmp178
  store float %tmp180, float* %f36, align 4
  %tmp181 = load float** %pf, align 8
  %incdec.ptr182 = getelementptr inbounds float* %tmp181, i32 1
  store float* %incdec.ptr182, float** %pf, align 8
  %tmp183 = volatile load float* %tmp181
  store float %tmp183, float* %f07, align 4
  %tmp184 = load float** %pf, align 8
  %incdec.ptr185 = getelementptr inbounds float* %tmp184, i32 1
  store float* %incdec.ptr185, float** %pf, align 8
  %tmp186 = volatile load float* %tmp184
  store float %tmp186, float* %f17, align 4
  %tmp187 = load float** %pf, align 8
  %incdec.ptr188 = getelementptr inbounds float* %tmp187, i32 1
  store float* %incdec.ptr188, float** %pf, align 8
  %tmp189 = volatile load float* %tmp187
  store float %tmp189, float* %f27, align 4
  %tmp190 = load float** %pf, align 8
  %incdec.ptr191 = getelementptr inbounds float* %tmp190, i32 1
  store float* %incdec.ptr191, float** %pf, align 8
  %tmp192 = volatile load float* %tmp190
  store float %tmp192, float* %f37, align 4
  store double* getelementptr inbounds ([32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %tmp193 = load double** %pd, align 8
  %incdec.ptr194 = getelementptr inbounds double* %tmp193, i32 1
  store double* %incdec.ptr194, double** %pd, align 8
  %tmp195 = volatile load double* %tmp193
  %tmp196 = load double* %d00, align 8
  %add = fadd double %tmp196, %tmp195
  store double %add, double* %d00, align 8
  %tmp197 = load double** %pd, align 8
  %incdec.ptr198 = getelementptr inbounds double* %tmp197, i32 1
  store double* %incdec.ptr198, double** %pd, align 8
  %tmp199 = volatile load double* %tmp197
  %tmp200 = load double* %d10, align 8
  %add201 = fadd double %tmp200, %tmp199
  store double %add201, double* %d10, align 8
  %tmp202 = load double** %pd, align 8
  %incdec.ptr203 = getelementptr inbounds double* %tmp202, i32 1
  store double* %incdec.ptr203, double** %pd, align 8
  %tmp204 = volatile load double* %tmp202
  %tmp205 = load double* %d20, align 8
  %add206 = fadd double %tmp205, %tmp204
  store double %add206, double* %d20, align 8
  %tmp207 = load double** %pd, align 8
  %incdec.ptr208 = getelementptr inbounds double* %tmp207, i32 1
  store double* %incdec.ptr208, double** %pd, align 8
  %tmp209 = volatile load double* %tmp207
  %tmp210 = load double* %d30, align 8
  %add211 = fadd double %tmp210, %tmp209
  store double %add211, double* %d30, align 8
  %tmp212 = load double** %pd, align 8
  %incdec.ptr213 = getelementptr inbounds double* %tmp212, i32 1
  store double* %incdec.ptr213, double** %pd, align 8
  %tmp214 = volatile load double* %tmp212
  %tmp215 = load double* %d01, align 8
  %add216 = fadd double %tmp215, %tmp214
  store double %add216, double* %d01, align 8
  %tmp217 = load double** %pd, align 8
  %incdec.ptr218 = getelementptr inbounds double* %tmp217, i32 1
  store double* %incdec.ptr218, double** %pd, align 8
  %tmp219 = volatile load double* %tmp217
  %tmp220 = load double* %d11, align 8
  %add221 = fadd double %tmp220, %tmp219
  store double %add221, double* %d11, align 8
  %tmp222 = load double** %pd, align 8
  %incdec.ptr223 = getelementptr inbounds double* %tmp222, i32 1
  store double* %incdec.ptr223, double** %pd, align 8
  %tmp224 = volatile load double* %tmp222
  %tmp225 = load double* %d21, align 8
  %add226 = fadd double %tmp225, %tmp224
  store double %add226, double* %d21, align 8
  %tmp227 = load double** %pd, align 8
  %incdec.ptr228 = getelementptr inbounds double* %tmp227, i32 1
  store double* %incdec.ptr228, double** %pd, align 8
  %tmp229 = volatile load double* %tmp227
  %tmp230 = load double* %d31, align 8
  %add231 = fadd double %tmp230, %tmp229
  store double %add231, double* %d31, align 8
  %tmp232 = load double** %pd, align 8
  %incdec.ptr233 = getelementptr inbounds double* %tmp232, i32 1
  store double* %incdec.ptr233, double** %pd, align 8
  %tmp234 = volatile load double* %tmp232
  %tmp235 = load double* %d02, align 8
  %add236 = fadd double %tmp235, %tmp234
  store double %add236, double* %d02, align 8
  %tmp237 = load double** %pd, align 8
  %incdec.ptr238 = getelementptr inbounds double* %tmp237, i32 1
  store double* %incdec.ptr238, double** %pd, align 8
  %tmp239 = volatile load double* %tmp237
  %tmp240 = load double* %d12, align 8
  %add241 = fadd double %tmp240, %tmp239
  store double %add241, double* %d12, align 8
  %tmp242 = load double** %pd, align 8
  %incdec.ptr243 = getelementptr inbounds double* %tmp242, i32 1
  store double* %incdec.ptr243, double** %pd, align 8
  %tmp244 = volatile load double* %tmp242
  %tmp245 = load double* %d22, align 8
  %add246 = fadd double %tmp245, %tmp244
  store double %add246, double* %d22, align 8
  %tmp247 = load double** %pd, align 8
  %incdec.ptr248 = getelementptr inbounds double* %tmp247, i32 1
  store double* %incdec.ptr248, double** %pd, align 8
  %tmp249 = volatile load double* %tmp247
  %tmp250 = load double* %d32, align 8
  %add251 = fadd double %tmp250, %tmp249
  store double %add251, double* %d32, align 8
  %tmp252 = load double** %pd, align 8
  %incdec.ptr253 = getelementptr inbounds double* %tmp252, i32 1
  store double* %incdec.ptr253, double** %pd, align 8
  %tmp254 = volatile load double* %tmp252
  %tmp255 = load double* %d03, align 8
  %add256 = fadd double %tmp255, %tmp254
  store double %add256, double* %d03, align 8
  %tmp257 = load double** %pd, align 8
  %incdec.ptr258 = getelementptr inbounds double* %tmp257, i32 1
  store double* %incdec.ptr258, double** %pd, align 8
  %tmp259 = volatile load double* %tmp257
  %tmp260 = load double* %d13, align 8
  %add261 = fadd double %tmp260, %tmp259
  store double %add261, double* %d13, align 8
  %tmp262 = load double** %pd, align 8
  %incdec.ptr263 = getelementptr inbounds double* %tmp262, i32 1
  store double* %incdec.ptr263, double** %pd, align 8
  %tmp264 = volatile load double* %tmp262
  %tmp265 = load double* %d23, align 8
  %add266 = fadd double %tmp265, %tmp264
  store double %add266, double* %d23, align 8
  %tmp267 = load double** %pd, align 8
  %incdec.ptr268 = getelementptr inbounds double* %tmp267, i32 1
  store double* %incdec.ptr268, double** %pd, align 8
  %tmp269 = volatile load double* %tmp267
  %tmp270 = load double* %d33, align 8
  %add271 = fadd double %tmp270, %tmp269
  store double %add271, double* %d33, align 8
  %tmp272 = load double** %pd, align 8
  %incdec.ptr273 = getelementptr inbounds double* %tmp272, i32 1
  store double* %incdec.ptr273, double** %pd, align 8
  %tmp274 = volatile load double* %tmp272
  %tmp275 = load double* %d04, align 8
  %add276 = fadd double %tmp275, %tmp274
  store double %add276, double* %d04, align 8
  %tmp277 = load double** %pd, align 8
  %incdec.ptr278 = getelementptr inbounds double* %tmp277, i32 1
  store double* %incdec.ptr278, double** %pd, align 8
  %tmp279 = volatile load double* %tmp277
  %tmp280 = load double* %d14, align 8
  %add281 = fadd double %tmp280, %tmp279
  store double %add281, double* %d14, align 8
  %tmp282 = load double** %pd, align 8
  %incdec.ptr283 = getelementptr inbounds double* %tmp282, i32 1
  store double* %incdec.ptr283, double** %pd, align 8
  %tmp284 = volatile load double* %tmp282
  %tmp285 = load double* %d24, align 8
  %add286 = fadd double %tmp285, %tmp284
  store double %add286, double* %d24, align 8
  %tmp287 = load double** %pd, align 8
  %incdec.ptr288 = getelementptr inbounds double* %tmp287, i32 1
  store double* %incdec.ptr288, double** %pd, align 8
  %tmp289 = volatile load double* %tmp287
  %tmp290 = load double* %d34, align 8
  %add291 = fadd double %tmp290, %tmp289
  store double %add291, double* %d34, align 8
  %tmp292 = load double** %pd, align 8
  %incdec.ptr293 = getelementptr inbounds double* %tmp292, i32 1
  store double* %incdec.ptr293, double** %pd, align 8
  %tmp294 = volatile load double* %tmp292
  %tmp295 = load double* %d05, align 8
  %add296 = fadd double %tmp295, %tmp294
  store double %add296, double* %d05, align 8
  %tmp297 = load double** %pd, align 8
  %incdec.ptr298 = getelementptr inbounds double* %tmp297, i32 1
  store double* %incdec.ptr298, double** %pd, align 8
  %tmp299 = volatile load double* %tmp297
  %tmp300 = load double* %d15, align 8
  %add301 = fadd double %tmp300, %tmp299
  store double %add301, double* %d15, align 8
  %tmp302 = load double** %pd, align 8
  %incdec.ptr303 = getelementptr inbounds double* %tmp302, i32 1
  store double* %incdec.ptr303, double** %pd, align 8
  %tmp304 = volatile load double* %tmp302
  %tmp305 = load double* %d25, align 8
  %add306 = fadd double %tmp305, %tmp304
  store double %add306, double* %d25, align 8
  %tmp307 = load double** %pd, align 8
  %incdec.ptr308 = getelementptr inbounds double* %tmp307, i32 1
  store double* %incdec.ptr308, double** %pd, align 8
  %tmp309 = volatile load double* %tmp307
  %tmp310 = load double* %d35, align 8
  %add311 = fadd double %tmp310, %tmp309
  store double %add311, double* %d35, align 8
  %tmp312 = load double** %pd, align 8
  %incdec.ptr313 = getelementptr inbounds double* %tmp312, i32 1
  store double* %incdec.ptr313, double** %pd, align 8
  %tmp314 = volatile load double* %tmp312
  %tmp315 = load double* %d06, align 8
  %add316 = fadd double %tmp315, %tmp314
  store double %add316, double* %d06, align 8
  %tmp317 = load double** %pd, align 8
  %incdec.ptr318 = getelementptr inbounds double* %tmp317, i32 1
  store double* %incdec.ptr318, double** %pd, align 8
  %tmp319 = volatile load double* %tmp317
  %tmp320 = load double* %d16, align 8
  %add321 = fadd double %tmp320, %tmp319
  store double %add321, double* %d16, align 8
  %tmp322 = load double** %pd, align 8
  %incdec.ptr323 = getelementptr inbounds double* %tmp322, i32 1
  store double* %incdec.ptr323, double** %pd, align 8
  %tmp324 = volatile load double* %tmp322
  %tmp325 = load double* %d26, align 8
  %add326 = fadd double %tmp325, %tmp324
  store double %add326, double* %d26, align 8
  %tmp327 = load double** %pd, align 8
  %incdec.ptr328 = getelementptr inbounds double* %tmp327, i32 1
  store double* %incdec.ptr328, double** %pd, align 8
  %tmp329 = volatile load double* %tmp327
  %tmp330 = load double* %d36, align 8
  %add331 = fadd double %tmp330, %tmp329
  store double %add331, double* %d36, align 8
  %tmp332 = load double** %pd, align 8
  %incdec.ptr333 = getelementptr inbounds double* %tmp332, i32 1
  store double* %incdec.ptr333, double** %pd, align 8
  %tmp334 = volatile load double* %tmp332
  %tmp335 = load double* %d07, align 8
  %add336 = fadd double %tmp335, %tmp334
  store double %add336, double* %d07, align 8
  %tmp337 = load double** %pd, align 8
  %incdec.ptr338 = getelementptr inbounds double* %tmp337, i32 1
  store double* %incdec.ptr338, double** %pd, align 8
  %tmp339 = volatile load double* %tmp337
  %tmp340 = load double* %d17, align 8
  %add341 = fadd double %tmp340, %tmp339
  store double %add341, double* %d17, align 8
  %tmp342 = load double** %pd, align 8
  %incdec.ptr343 = getelementptr inbounds double* %tmp342, i32 1
  store double* %incdec.ptr343, double** %pd, align 8
  %tmp344 = volatile load double* %tmp342
  %tmp345 = load double* %d27, align 8
  %add346 = fadd double %tmp345, %tmp344
  store double %add346, double* %d27, align 8
  %tmp347 = load double** %pd, align 8
  %incdec.ptr348 = getelementptr inbounds double* %tmp347, i32 1
  store double* %incdec.ptr348, double** %pd, align 8
  %tmp349 = volatile load double* %tmp347
  %tmp350 = load double* %d37, align 8
  %add351 = fadd double %tmp350, %tmp349
  store double %add351, double* %d37, align 8
  store double* getelementptr inbounds ([32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %tmp352 = load double** %pd, align 8
  %incdec.ptr353 = getelementptr inbounds double* %tmp352, i32 1
  store double* %incdec.ptr353, double** %pd, align 8
  %tmp354 = volatile load double* %tmp352
  %tmp355 = load double* %d00, align 8
  %add356 = fadd double %tmp355, %tmp354
  store double %add356, double* %d00, align 8
  %tmp357 = load double** %pd, align 8
  %incdec.ptr358 = getelementptr inbounds double* %tmp357, i32 1
  store double* %incdec.ptr358, double** %pd, align 8
  %tmp359 = volatile load double* %tmp357
  %tmp360 = load double* %d10, align 8
  %add361 = fadd double %tmp360, %tmp359
  store double %add361, double* %d10, align 8
  %tmp362 = load double** %pd, align 8
  %incdec.ptr363 = getelementptr inbounds double* %tmp362, i32 1
  store double* %incdec.ptr363, double** %pd, align 8
  %tmp364 = volatile load double* %tmp362
  %tmp365 = load double* %d20, align 8
  %add366 = fadd double %tmp365, %tmp364
  store double %add366, double* %d20, align 8
  %tmp367 = load double** %pd, align 8
  %incdec.ptr368 = getelementptr inbounds double* %tmp367, i32 1
  store double* %incdec.ptr368, double** %pd, align 8
  %tmp369 = volatile load double* %tmp367
  %tmp370 = load double* %d30, align 8
  %add371 = fadd double %tmp370, %tmp369
  store double %add371, double* %d30, align 8
  %tmp372 = load double** %pd, align 8
  %incdec.ptr373 = getelementptr inbounds double* %tmp372, i32 1
  store double* %incdec.ptr373, double** %pd, align 8
  %tmp374 = volatile load double* %tmp372
  %tmp375 = load double* %d01, align 8
  %add376 = fadd double %tmp375, %tmp374
  store double %add376, double* %d01, align 8
  %tmp377 = load double** %pd, align 8
  %incdec.ptr378 = getelementptr inbounds double* %tmp377, i32 1
  store double* %incdec.ptr378, double** %pd, align 8
  %tmp379 = volatile load double* %tmp377
  %tmp380 = load double* %d11, align 8
  %add381 = fadd double %tmp380, %tmp379
  store double %add381, double* %d11, align 8
  %tmp382 = load double** %pd, align 8
  %incdec.ptr383 = getelementptr inbounds double* %tmp382, i32 1
  store double* %incdec.ptr383, double** %pd, align 8
  %tmp384 = volatile load double* %tmp382
  %tmp385 = load double* %d21, align 8
  %add386 = fadd double %tmp385, %tmp384
  store double %add386, double* %d21, align 8
  %tmp387 = load double** %pd, align 8
  %incdec.ptr388 = getelementptr inbounds double* %tmp387, i32 1
  store double* %incdec.ptr388, double** %pd, align 8
  %tmp389 = volatile load double* %tmp387
  %tmp390 = load double* %d31, align 8
  %add391 = fadd double %tmp390, %tmp389
  store double %add391, double* %d31, align 8
  %tmp392 = load double** %pd, align 8
  %incdec.ptr393 = getelementptr inbounds double* %tmp392, i32 1
  store double* %incdec.ptr393, double** %pd, align 8
  %tmp394 = volatile load double* %tmp392
  %tmp395 = load double* %d02, align 8
  %add396 = fadd double %tmp395, %tmp394
  store double %add396, double* %d02, align 8
  %tmp397 = load double** %pd, align 8
  %incdec.ptr398 = getelementptr inbounds double* %tmp397, i32 1
  store double* %incdec.ptr398, double** %pd, align 8
  %tmp399 = volatile load double* %tmp397
  %tmp400 = load double* %d12, align 8
  %add401 = fadd double %tmp400, %tmp399
  store double %add401, double* %d12, align 8
  %tmp402 = load double** %pd, align 8
  %incdec.ptr403 = getelementptr inbounds double* %tmp402, i32 1
  store double* %incdec.ptr403, double** %pd, align 8
  %tmp404 = volatile load double* %tmp402
  %tmp405 = load double* %d22, align 8
  %add406 = fadd double %tmp405, %tmp404
  store double %add406, double* %d22, align 8
  %tmp407 = load double** %pd, align 8
  %incdec.ptr408 = getelementptr inbounds double* %tmp407, i32 1
  store double* %incdec.ptr408, double** %pd, align 8
  %tmp409 = volatile load double* %tmp407
  %tmp410 = load double* %d32, align 8
  %add411 = fadd double %tmp410, %tmp409
  store double %add411, double* %d32, align 8
  %tmp412 = load double** %pd, align 8
  %incdec.ptr413 = getelementptr inbounds double* %tmp412, i32 1
  store double* %incdec.ptr413, double** %pd, align 8
  %tmp414 = volatile load double* %tmp412
  %tmp415 = load double* %d03, align 8
  %add416 = fadd double %tmp415, %tmp414
  store double %add416, double* %d03, align 8
  %tmp417 = load double** %pd, align 8
  %incdec.ptr418 = getelementptr inbounds double* %tmp417, i32 1
  store double* %incdec.ptr418, double** %pd, align 8
  %tmp419 = volatile load double* %tmp417
  %tmp420 = load double* %d13, align 8
  %add421 = fadd double %tmp420, %tmp419
  store double %add421, double* %d13, align 8
  %tmp422 = load double** %pd, align 8
  %incdec.ptr423 = getelementptr inbounds double* %tmp422, i32 1
  store double* %incdec.ptr423, double** %pd, align 8
  %tmp424 = volatile load double* %tmp422
  %tmp425 = load double* %d23, align 8
  %add426 = fadd double %tmp425, %tmp424
  store double %add426, double* %d23, align 8
  %tmp427 = load double** %pd, align 8
  %incdec.ptr428 = getelementptr inbounds double* %tmp427, i32 1
  store double* %incdec.ptr428, double** %pd, align 8
  %tmp429 = volatile load double* %tmp427
  %tmp430 = load double* %d33, align 8
  %add431 = fadd double %tmp430, %tmp429
  store double %add431, double* %d33, align 8
  %tmp432 = load double** %pd, align 8
  %incdec.ptr433 = getelementptr inbounds double* %tmp432, i32 1
  store double* %incdec.ptr433, double** %pd, align 8
  %tmp434 = volatile load double* %tmp432
  %tmp435 = load double* %d04, align 8
  %add436 = fadd double %tmp435, %tmp434
  store double %add436, double* %d04, align 8
  %tmp437 = load double** %pd, align 8
  %incdec.ptr438 = getelementptr inbounds double* %tmp437, i32 1
  store double* %incdec.ptr438, double** %pd, align 8
  %tmp439 = volatile load double* %tmp437
  %tmp440 = load double* %d14, align 8
  %add441 = fadd double %tmp440, %tmp439
  store double %add441, double* %d14, align 8
  %tmp442 = load double** %pd, align 8
  %incdec.ptr443 = getelementptr inbounds double* %tmp442, i32 1
  store double* %incdec.ptr443, double** %pd, align 8
  %tmp444 = volatile load double* %tmp442
  %tmp445 = load double* %d24, align 8
  %add446 = fadd double %tmp445, %tmp444
  store double %add446, double* %d24, align 8
  %tmp447 = load double** %pd, align 8
  %incdec.ptr448 = getelementptr inbounds double* %tmp447, i32 1
  store double* %incdec.ptr448, double** %pd, align 8
  %tmp449 = volatile load double* %tmp447
  %tmp450 = load double* %d34, align 8
  %add451 = fadd double %tmp450, %tmp449
  store double %add451, double* %d34, align 8
  %tmp452 = load double** %pd, align 8
  %incdec.ptr453 = getelementptr inbounds double* %tmp452, i32 1
  store double* %incdec.ptr453, double** %pd, align 8
  %tmp454 = volatile load double* %tmp452
  %tmp455 = load double* %d05, align 8
  %add456 = fadd double %tmp455, %tmp454
  store double %add456, double* %d05, align 8
  %tmp457 = load double** %pd, align 8
  %incdec.ptr458 = getelementptr inbounds double* %tmp457, i32 1
  store double* %incdec.ptr458, double** %pd, align 8
  %tmp459 = volatile load double* %tmp457
  %tmp460 = load double* %d15, align 8
  %add461 = fadd double %tmp460, %tmp459
  store double %add461, double* %d15, align 8
  %tmp462 = load double** %pd, align 8
  %incdec.ptr463 = getelementptr inbounds double* %tmp462, i32 1
  store double* %incdec.ptr463, double** %pd, align 8
  %tmp464 = volatile load double* %tmp462
  %tmp465 = load double* %d25, align 8
  %add466 = fadd double %tmp465, %tmp464
  store double %add466, double* %d25, align 8
  %tmp467 = load double** %pd, align 8
  %incdec.ptr468 = getelementptr inbounds double* %tmp467, i32 1
  store double* %incdec.ptr468, double** %pd, align 8
  %tmp469 = volatile load double* %tmp467
  %tmp470 = load double* %d35, align 8
  %add471 = fadd double %tmp470, %tmp469
  store double %add471, double* %d35, align 8
  %tmp472 = load double** %pd, align 8
  %incdec.ptr473 = getelementptr inbounds double* %tmp472, i32 1
  store double* %incdec.ptr473, double** %pd, align 8
  %tmp474 = volatile load double* %tmp472
  %tmp475 = load double* %d06, align 8
  %add476 = fadd double %tmp475, %tmp474
  store double %add476, double* %d06, align 8
  %tmp477 = load double** %pd, align 8
  %incdec.ptr478 = getelementptr inbounds double* %tmp477, i32 1
  store double* %incdec.ptr478, double** %pd, align 8
  %tmp479 = volatile load double* %tmp477
  %tmp480 = load double* %d16, align 8
  %add481 = fadd double %tmp480, %tmp479
  store double %add481, double* %d16, align 8
  %tmp482 = load double** %pd, align 8
  %incdec.ptr483 = getelementptr inbounds double* %tmp482, i32 1
  store double* %incdec.ptr483, double** %pd, align 8
  %tmp484 = volatile load double* %tmp482
  %tmp485 = load double* %d26, align 8
  %add486 = fadd double %tmp485, %tmp484
  store double %add486, double* %d26, align 8
  %tmp487 = load double** %pd, align 8
  %incdec.ptr488 = getelementptr inbounds double* %tmp487, i32 1
  store double* %incdec.ptr488, double** %pd, align 8
  %tmp489 = volatile load double* %tmp487
  %tmp490 = load double* %d36, align 8
  %add491 = fadd double %tmp490, %tmp489
  store double %add491, double* %d36, align 8
  %tmp492 = load double** %pd, align 8
  %incdec.ptr493 = getelementptr inbounds double* %tmp492, i32 1
  store double* %incdec.ptr493, double** %pd, align 8
  %tmp494 = volatile load double* %tmp492
  %tmp495 = load double* %d07, align 8
  %add496 = fadd double %tmp495, %tmp494
  store double %add496, double* %d07, align 8
  %tmp497 = load double** %pd, align 8
  %incdec.ptr498 = getelementptr inbounds double* %tmp497, i32 1
  store double* %incdec.ptr498, double** %pd, align 8
  %tmp499 = volatile load double* %tmp497
  %tmp500 = load double* %d17, align 8
  %add501 = fadd double %tmp500, %tmp499
  store double %add501, double* %d17, align 8
  %tmp502 = load double** %pd, align 8
  %incdec.ptr503 = getelementptr inbounds double* %tmp502, i32 1
  store double* %incdec.ptr503, double** %pd, align 8
  %tmp504 = volatile load double* %tmp502
  %tmp505 = load double* %d27, align 8
  %add506 = fadd double %tmp505, %tmp504
  store double %add506, double* %d27, align 8
  %tmp507 = load double** %pd, align 8
  %incdec.ptr508 = getelementptr inbounds double* %tmp507, i32 1
  store double* %incdec.ptr508, double** %pd, align 8
  %tmp509 = volatile load double* %tmp507
  %tmp510 = load double* %d37, align 8
  %add511 = fadd double %tmp510, %tmp509
  store double %add511, double* %d37, align 8
  store double* getelementptr inbounds ([32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %tmp512 = load double** %pd, align 8
  %incdec.ptr513 = getelementptr inbounds double* %tmp512, i32 1
  store double* %incdec.ptr513, double** %pd, align 8
  %tmp514 = volatile load double* %tmp512
  %tmp515 = load double* %d00, align 8
  %add516 = fadd double %tmp515, %tmp514
  store double %add516, double* %d00, align 8
  %tmp517 = load double** %pd, align 8
  %incdec.ptr518 = getelementptr inbounds double* %tmp517, i32 1
  store double* %incdec.ptr518, double** %pd, align 8
  %tmp519 = volatile load double* %tmp517
  %tmp520 = load double* %d10, align 8
  %add521 = fadd double %tmp520, %tmp519
  store double %add521, double* %d10, align 8
  %tmp522 = load double** %pd, align 8
  %incdec.ptr523 = getelementptr inbounds double* %tmp522, i32 1
  store double* %incdec.ptr523, double** %pd, align 8
  %tmp524 = volatile load double* %tmp522
  %tmp525 = load double* %d20, align 8
  %add526 = fadd double %tmp525, %tmp524
  store double %add526, double* %d20, align 8
  %tmp527 = load double** %pd, align 8
  %incdec.ptr528 = getelementptr inbounds double* %tmp527, i32 1
  store double* %incdec.ptr528, double** %pd, align 8
  %tmp529 = volatile load double* %tmp527
  %tmp530 = load double* %d30, align 8
  %add531 = fadd double %tmp530, %tmp529
  store double %add531, double* %d30, align 8
  %tmp532 = load double** %pd, align 8
  %incdec.ptr533 = getelementptr inbounds double* %tmp532, i32 1
  store double* %incdec.ptr533, double** %pd, align 8
  %tmp534 = volatile load double* %tmp532
  %tmp535 = load double* %d01, align 8
  %add536 = fadd double %tmp535, %tmp534
  store double %add536, double* %d01, align 8
  %tmp537 = load double** %pd, align 8
  %incdec.ptr538 = getelementptr inbounds double* %tmp537, i32 1
  store double* %incdec.ptr538, double** %pd, align 8
  %tmp539 = volatile load double* %tmp537
  %tmp540 = load double* %d11, align 8
  %add541 = fadd double %tmp540, %tmp539
  store double %add541, double* %d11, align 8
  %tmp542 = load double** %pd, align 8
  %incdec.ptr543 = getelementptr inbounds double* %tmp542, i32 1
  store double* %incdec.ptr543, double** %pd, align 8
  %tmp544 = volatile load double* %tmp542
  %tmp545 = load double* %d21, align 8
  %add546 = fadd double %tmp545, %tmp544
  store double %add546, double* %d21, align 8
  %tmp547 = load double** %pd, align 8
  %incdec.ptr548 = getelementptr inbounds double* %tmp547, i32 1
  store double* %incdec.ptr548, double** %pd, align 8
  %tmp549 = volatile load double* %tmp547
  %tmp550 = load double* %d31, align 8
  %add551 = fadd double %tmp550, %tmp549
  store double %add551, double* %d31, align 8
  %tmp552 = load double** %pd, align 8
  %incdec.ptr553 = getelementptr inbounds double* %tmp552, i32 1
  store double* %incdec.ptr553, double** %pd, align 8
  %tmp554 = volatile load double* %tmp552
  %tmp555 = load double* %d02, align 8
  %add556 = fadd double %tmp555, %tmp554
  store double %add556, double* %d02, align 8
  %tmp557 = load double** %pd, align 8
  %incdec.ptr558 = getelementptr inbounds double* %tmp557, i32 1
  store double* %incdec.ptr558, double** %pd, align 8
  %tmp559 = volatile load double* %tmp557
  %tmp560 = load double* %d12, align 8
  %add561 = fadd double %tmp560, %tmp559
  store double %add561, double* %d12, align 8
  %tmp562 = load double** %pd, align 8
  %incdec.ptr563 = getelementptr inbounds double* %tmp562, i32 1
  store double* %incdec.ptr563, double** %pd, align 8
  %tmp564 = volatile load double* %tmp562
  %tmp565 = load double* %d22, align 8
  %add566 = fadd double %tmp565, %tmp564
  store double %add566, double* %d22, align 8
  %tmp567 = load double** %pd, align 8
  %incdec.ptr568 = getelementptr inbounds double* %tmp567, i32 1
  store double* %incdec.ptr568, double** %pd, align 8
  %tmp569 = volatile load double* %tmp567
  %tmp570 = load double* %d32, align 8
  %add571 = fadd double %tmp570, %tmp569
  store double %add571, double* %d32, align 8
  %tmp572 = load double** %pd, align 8
  %incdec.ptr573 = getelementptr inbounds double* %tmp572, i32 1
  store double* %incdec.ptr573, double** %pd, align 8
  %tmp574 = volatile load double* %tmp572
  %tmp575 = load double* %d03, align 8
  %add576 = fadd double %tmp575, %tmp574
  store double %add576, double* %d03, align 8
  %tmp577 = load double** %pd, align 8
  %incdec.ptr578 = getelementptr inbounds double* %tmp577, i32 1
  store double* %incdec.ptr578, double** %pd, align 8
  %tmp579 = volatile load double* %tmp577
  %tmp580 = load double* %d13, align 8
  %add581 = fadd double %tmp580, %tmp579
  store double %add581, double* %d13, align 8
  %tmp582 = load double** %pd, align 8
  %incdec.ptr583 = getelementptr inbounds double* %tmp582, i32 1
  store double* %incdec.ptr583, double** %pd, align 8
  %tmp584 = volatile load double* %tmp582
  %tmp585 = load double* %d23, align 8
  %add586 = fadd double %tmp585, %tmp584
  store double %add586, double* %d23, align 8
  %tmp587 = load double** %pd, align 8
  %incdec.ptr588 = getelementptr inbounds double* %tmp587, i32 1
  store double* %incdec.ptr588, double** %pd, align 8
  %tmp589 = volatile load double* %tmp587
  %tmp590 = load double* %d33, align 8
  %add591 = fadd double %tmp590, %tmp589
  store double %add591, double* %d33, align 8
  %tmp592 = load double** %pd, align 8
  %incdec.ptr593 = getelementptr inbounds double* %tmp592, i32 1
  store double* %incdec.ptr593, double** %pd, align 8
  %tmp594 = volatile load double* %tmp592
  %tmp595 = load double* %d04, align 8
  %add596 = fadd double %tmp595, %tmp594
  store double %add596, double* %d04, align 8
  %tmp597 = load double** %pd, align 8
  %incdec.ptr598 = getelementptr inbounds double* %tmp597, i32 1
  store double* %incdec.ptr598, double** %pd, align 8
  %tmp599 = volatile load double* %tmp597
  %tmp600 = load double* %d14, align 8
  %add601 = fadd double %tmp600, %tmp599
  store double %add601, double* %d14, align 8
  %tmp602 = load double** %pd, align 8
  %incdec.ptr603 = getelementptr inbounds double* %tmp602, i32 1
  store double* %incdec.ptr603, double** %pd, align 8
  %tmp604 = volatile load double* %tmp602
  %tmp605 = load double* %d24, align 8
  %add606 = fadd double %tmp605, %tmp604
  store double %add606, double* %d24, align 8
  %tmp607 = load double** %pd, align 8
  %incdec.ptr608 = getelementptr inbounds double* %tmp607, i32 1
  store double* %incdec.ptr608, double** %pd, align 8
  %tmp609 = volatile load double* %tmp607
  %tmp610 = load double* %d34, align 8
  %add611 = fadd double %tmp610, %tmp609
  store double %add611, double* %d34, align 8
  %tmp612 = load double** %pd, align 8
  %incdec.ptr613 = getelementptr inbounds double* %tmp612, i32 1
  store double* %incdec.ptr613, double** %pd, align 8
  %tmp614 = volatile load double* %tmp612
  %tmp615 = load double* %d05, align 8
  %add616 = fadd double %tmp615, %tmp614
  store double %add616, double* %d05, align 8
  %tmp617 = load double** %pd, align 8
  %incdec.ptr618 = getelementptr inbounds double* %tmp617, i32 1
  store double* %incdec.ptr618, double** %pd, align 8
  %tmp619 = volatile load double* %tmp617
  %tmp620 = load double* %d15, align 8
  %add621 = fadd double %tmp620, %tmp619
  store double %add621, double* %d15, align 8
  %tmp622 = load double** %pd, align 8
  %incdec.ptr623 = getelementptr inbounds double* %tmp622, i32 1
  store double* %incdec.ptr623, double** %pd, align 8
  %tmp624 = volatile load double* %tmp622
  %tmp625 = load double* %d25, align 8
  %add626 = fadd double %tmp625, %tmp624
  store double %add626, double* %d25, align 8
  %tmp627 = load double** %pd, align 8
  %incdec.ptr628 = getelementptr inbounds double* %tmp627, i32 1
  store double* %incdec.ptr628, double** %pd, align 8
  %tmp629 = volatile load double* %tmp627
  %tmp630 = load double* %d35, align 8
  %add631 = fadd double %tmp630, %tmp629
  store double %add631, double* %d35, align 8
  %tmp632 = load double** %pd, align 8
  %incdec.ptr633 = getelementptr inbounds double* %tmp632, i32 1
  store double* %incdec.ptr633, double** %pd, align 8
  %tmp634 = volatile load double* %tmp632
  %tmp635 = load double* %d06, align 8
  %add636 = fadd double %tmp635, %tmp634
  store double %add636, double* %d06, align 8
  %tmp637 = load double** %pd, align 8
  %incdec.ptr638 = getelementptr inbounds double* %tmp637, i32 1
  store double* %incdec.ptr638, double** %pd, align 8
  %tmp639 = volatile load double* %tmp637
  %tmp640 = load double* %d16, align 8
  %add641 = fadd double %tmp640, %tmp639
  store double %add641, double* %d16, align 8
  %tmp642 = load double** %pd, align 8
  %incdec.ptr643 = getelementptr inbounds double* %tmp642, i32 1
  store double* %incdec.ptr643, double** %pd, align 8
  %tmp644 = volatile load double* %tmp642
  %tmp645 = load double* %d26, align 8
  %add646 = fadd double %tmp645, %tmp644
  store double %add646, double* %d26, align 8
  %tmp647 = load double** %pd, align 8
  %incdec.ptr648 = getelementptr inbounds double* %tmp647, i32 1
  store double* %incdec.ptr648, double** %pd, align 8
  %tmp649 = volatile load double* %tmp647
  %tmp650 = load double* %d36, align 8
  %add651 = fadd double %tmp650, %tmp649
  store double %add651, double* %d36, align 8
  %tmp652 = load double** %pd, align 8
  %incdec.ptr653 = getelementptr inbounds double* %tmp652, i32 1
  store double* %incdec.ptr653, double** %pd, align 8
  %tmp654 = volatile load double* %tmp652
  %tmp655 = load double* %d07, align 8
  %add656 = fadd double %tmp655, %tmp654
  store double %add656, double* %d07, align 8
  %tmp657 = load double** %pd, align 8
  %incdec.ptr658 = getelementptr inbounds double* %tmp657, i32 1
  store double* %incdec.ptr658, double** %pd, align 8
  %tmp659 = volatile load double* %tmp657
  %tmp660 = load double* %d17, align 8
  %add661 = fadd double %tmp660, %tmp659
  store double %add661, double* %d17, align 8
  %tmp662 = load double** %pd, align 8
  %incdec.ptr663 = getelementptr inbounds double* %tmp662, i32 1
  store double* %incdec.ptr663, double** %pd, align 8
  %tmp664 = volatile load double* %tmp662
  %tmp665 = load double* %d27, align 8
  %add666 = fadd double %tmp665, %tmp664
  store double %add666, double* %d27, align 8
  %tmp667 = load double** %pd, align 8
  %incdec.ptr668 = getelementptr inbounds double* %tmp667, i32 1
  store double* %incdec.ptr668, double** %pd, align 8
  %tmp669 = volatile load double* %tmp667
  %tmp670 = load double* %d37, align 8
  %add671 = fadd double %tmp670, %tmp669
  store double %add671, double* %d37, align 8
  store float* getelementptr inbounds ([32 x float]* @gf, i32 0, i32 0), float** %pf, align 8
  %tmp672 = load float* %f00, align 4
  %tmp673 = load float** %pf, align 8
  %incdec.ptr674 = getelementptr inbounds float* %tmp673, i32 1
  store float* %incdec.ptr674, float** %pf, align 8
  volatile store float %tmp672, float* %tmp673
  %tmp675 = load float* %f10, align 4
  %tmp676 = load float** %pf, align 8
  %incdec.ptr677 = getelementptr inbounds float* %tmp676, i32 1
  store float* %incdec.ptr677, float** %pf, align 8
  volatile store float %tmp675, float* %tmp676
  %tmp678 = load float* %f20, align 4
  %tmp679 = load float** %pf, align 8
  %incdec.ptr680 = getelementptr inbounds float* %tmp679, i32 1
  store float* %incdec.ptr680, float** %pf, align 8
  volatile store float %tmp678, float* %tmp679
  %tmp681 = load float* %f30, align 4
  %tmp682 = load float** %pf, align 8
  %incdec.ptr683 = getelementptr inbounds float* %tmp682, i32 1
  store float* %incdec.ptr683, float** %pf, align 8
  volatile store float %tmp681, float* %tmp682
  %tmp684 = load float* %f01, align 4
  %tmp685 = load float** %pf, align 8
  %incdec.ptr686 = getelementptr inbounds float* %tmp685, i32 1
  store float* %incdec.ptr686, float** %pf, align 8
  volatile store float %tmp684, float* %tmp685
  %tmp687 = load float* %f11, align 4
  %tmp688 = load float** %pf, align 8
  %incdec.ptr689 = getelementptr inbounds float* %tmp688, i32 1
  store float* %incdec.ptr689, float** %pf, align 8
  volatile store float %tmp687, float* %tmp688
  %tmp690 = load float* %f21, align 4
  %tmp691 = load float** %pf, align 8
  %incdec.ptr692 = getelementptr inbounds float* %tmp691, i32 1
  store float* %incdec.ptr692, float** %pf, align 8
  volatile store float %tmp690, float* %tmp691
  %tmp693 = load float* %f31, align 4
  %tmp694 = load float** %pf, align 8
  %incdec.ptr695 = getelementptr inbounds float* %tmp694, i32 1
  store float* %incdec.ptr695, float** %pf, align 8
  volatile store float %tmp693, float* %tmp694
  %tmp696 = load float* %f02, align 4
  %tmp697 = load float** %pf, align 8
  %incdec.ptr698 = getelementptr inbounds float* %tmp697, i32 1
  store float* %incdec.ptr698, float** %pf, align 8
  volatile store float %tmp696, float* %tmp697
  %tmp699 = load float* %f12, align 4
  %tmp700 = load float** %pf, align 8
  %incdec.ptr701 = getelementptr inbounds float* %tmp700, i32 1
  store float* %incdec.ptr701, float** %pf, align 8
  volatile store float %tmp699, float* %tmp700
  %tmp702 = load float* %f22, align 4
  %tmp703 = load float** %pf, align 8
  %incdec.ptr704 = getelementptr inbounds float* %tmp703, i32 1
  store float* %incdec.ptr704, float** %pf, align 8
  volatile store float %tmp702, float* %tmp703
  %tmp705 = load float* %f32, align 4
  %tmp706 = load float** %pf, align 8
  %incdec.ptr707 = getelementptr inbounds float* %tmp706, i32 1
  store float* %incdec.ptr707, float** %pf, align 8
  volatile store float %tmp705, float* %tmp706
  %tmp708 = load float* %f03, align 4
  %tmp709 = load float** %pf, align 8
  %incdec.ptr710 = getelementptr inbounds float* %tmp709, i32 1
  store float* %incdec.ptr710, float** %pf, align 8
  volatile store float %tmp708, float* %tmp709
  %tmp711 = load float* %f13, align 4
  %tmp712 = load float** %pf, align 8
  %incdec.ptr713 = getelementptr inbounds float* %tmp712, i32 1
  store float* %incdec.ptr713, float** %pf, align 8
  volatile store float %tmp711, float* %tmp712
  %tmp714 = load float* %f23, align 4
  %tmp715 = load float** %pf, align 8
  %incdec.ptr716 = getelementptr inbounds float* %tmp715, i32 1
  store float* %incdec.ptr716, float** %pf, align 8
  volatile store float %tmp714, float* %tmp715
  %tmp717 = load float* %f33, align 4
  %tmp718 = load float** %pf, align 8
  %incdec.ptr719 = getelementptr inbounds float* %tmp718, i32 1
  store float* %incdec.ptr719, float** %pf, align 8
  volatile store float %tmp717, float* %tmp718
  %tmp720 = load float* %f04, align 4
  %tmp721 = load float** %pf, align 8
  %incdec.ptr722 = getelementptr inbounds float* %tmp721, i32 1
  store float* %incdec.ptr722, float** %pf, align 8
  volatile store float %tmp720, float* %tmp721
  %tmp723 = load float* %f14, align 4
  %tmp724 = load float** %pf, align 8
  %incdec.ptr725 = getelementptr inbounds float* %tmp724, i32 1
  store float* %incdec.ptr725, float** %pf, align 8
  volatile store float %tmp723, float* %tmp724
  %tmp726 = load float* %f24, align 4
  %tmp727 = load float** %pf, align 8
  %incdec.ptr728 = getelementptr inbounds float* %tmp727, i32 1
  store float* %incdec.ptr728, float** %pf, align 8
  volatile store float %tmp726, float* %tmp727
  %tmp729 = load float* %f34, align 4
  %tmp730 = load float** %pf, align 8
  %incdec.ptr731 = getelementptr inbounds float* %tmp730, i32 1
  store float* %incdec.ptr731, float** %pf, align 8
  volatile store float %tmp729, float* %tmp730
  %tmp732 = load float* %f05, align 4
  %tmp733 = load float** %pf, align 8
  %incdec.ptr734 = getelementptr inbounds float* %tmp733, i32 1
  store float* %incdec.ptr734, float** %pf, align 8
  volatile store float %tmp732, float* %tmp733
  %tmp735 = load float* %f15, align 4
  %tmp736 = load float** %pf, align 8
  %incdec.ptr737 = getelementptr inbounds float* %tmp736, i32 1
  store float* %incdec.ptr737, float** %pf, align 8
  volatile store float %tmp735, float* %tmp736
  %tmp738 = load float* %f25, align 4
  %tmp739 = load float** %pf, align 8
  %incdec.ptr740 = getelementptr inbounds float* %tmp739, i32 1
  store float* %incdec.ptr740, float** %pf, align 8
  volatile store float %tmp738, float* %tmp739
  %tmp741 = load float* %f35, align 4
  %tmp742 = load float** %pf, align 8
  %incdec.ptr743 = getelementptr inbounds float* %tmp742, i32 1
  store float* %incdec.ptr743, float** %pf, align 8
  volatile store float %tmp741, float* %tmp742
  %tmp744 = load float* %f06, align 4
  %tmp745 = load float** %pf, align 8
  %incdec.ptr746 = getelementptr inbounds float* %tmp745, i32 1
  store float* %incdec.ptr746, float** %pf, align 8
  volatile store float %tmp744, float* %tmp745
  %tmp747 = load float* %f16, align 4
  %tmp748 = load float** %pf, align 8
  %incdec.ptr749 = getelementptr inbounds float* %tmp748, i32 1
  store float* %incdec.ptr749, float** %pf, align 8
  volatile store float %tmp747, float* %tmp748
  %tmp750 = load float* %f26, align 4
  %tmp751 = load float** %pf, align 8
  %incdec.ptr752 = getelementptr inbounds float* %tmp751, i32 1
  store float* %incdec.ptr752, float** %pf, align 8
  volatile store float %tmp750, float* %tmp751
  %tmp753 = load float* %f36, align 4
  %tmp754 = load float** %pf, align 8
  %incdec.ptr755 = getelementptr inbounds float* %tmp754, i32 1
  store float* %incdec.ptr755, float** %pf, align 8
  volatile store float %tmp753, float* %tmp754
  %tmp756 = load float* %f07, align 4
  %tmp757 = load float** %pf, align 8
  %incdec.ptr758 = getelementptr inbounds float* %tmp757, i32 1
  store float* %incdec.ptr758, float** %pf, align 8
  volatile store float %tmp756, float* %tmp757
  %tmp759 = load float* %f17, align 4
  %tmp760 = load float** %pf, align 8
  %incdec.ptr761 = getelementptr inbounds float* %tmp760, i32 1
  store float* %incdec.ptr761, float** %pf, align 8
  volatile store float %tmp759, float* %tmp760
  %tmp762 = load float* %f27, align 4
  %tmp763 = load float** %pf, align 8
  %incdec.ptr764 = getelementptr inbounds float* %tmp763, i32 1
  store float* %incdec.ptr764, float** %pf, align 8
  volatile store float %tmp762, float* %tmp763
  %tmp765 = load float* %f37, align 4
  %tmp766 = load float** %pf, align 8
  %incdec.ptr767 = getelementptr inbounds float* %tmp766, i32 1
  store float* %incdec.ptr767, float** %pf, align 8
  volatile store float %tmp765, float* %tmp766
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp768 = load i32* %i, align 4
  %inc = add nsw i32 %tmp768, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store double* getelementptr inbounds ([32 x double]* @gd, i32 0, i32 0), double** %pd, align 8
  %tmp769 = load double* %d00, align 8
  %tmp770 = load double** %pd, align 8
  %incdec.ptr771 = getelementptr inbounds double* %tmp770, i32 1
  store double* %incdec.ptr771, double** %pd, align 8
  volatile store double %tmp769, double* %tmp770
  %tmp772 = load double* %d10, align 8
  %tmp773 = load double** %pd, align 8
  %incdec.ptr774 = getelementptr inbounds double* %tmp773, i32 1
  store double* %incdec.ptr774, double** %pd, align 8
  volatile store double %tmp772, double* %tmp773
  %tmp775 = load double* %d20, align 8
  %tmp776 = load double** %pd, align 8
  %incdec.ptr777 = getelementptr inbounds double* %tmp776, i32 1
  store double* %incdec.ptr777, double** %pd, align 8
  volatile store double %tmp775, double* %tmp776
  %tmp778 = load double* %d30, align 8
  %tmp779 = load double** %pd, align 8
  %incdec.ptr780 = getelementptr inbounds double* %tmp779, i32 1
  store double* %incdec.ptr780, double** %pd, align 8
  volatile store double %tmp778, double* %tmp779
  %tmp781 = load double* %d01, align 8
  %tmp782 = load double** %pd, align 8
  %incdec.ptr783 = getelementptr inbounds double* %tmp782, i32 1
  store double* %incdec.ptr783, double** %pd, align 8
  volatile store double %tmp781, double* %tmp782
  %tmp784 = load double* %d11, align 8
  %tmp785 = load double** %pd, align 8
  %incdec.ptr786 = getelementptr inbounds double* %tmp785, i32 1
  store double* %incdec.ptr786, double** %pd, align 8
  volatile store double %tmp784, double* %tmp785
  %tmp787 = load double* %d21, align 8
  %tmp788 = load double** %pd, align 8
  %incdec.ptr789 = getelementptr inbounds double* %tmp788, i32 1
  store double* %incdec.ptr789, double** %pd, align 8
  volatile store double %tmp787, double* %tmp788
  %tmp790 = load double* %d31, align 8
  %tmp791 = load double** %pd, align 8
  %incdec.ptr792 = getelementptr inbounds double* %tmp791, i32 1
  store double* %incdec.ptr792, double** %pd, align 8
  volatile store double %tmp790, double* %tmp791
  %tmp793 = load double* %d02, align 8
  %tmp794 = load double** %pd, align 8
  %incdec.ptr795 = getelementptr inbounds double* %tmp794, i32 1
  store double* %incdec.ptr795, double** %pd, align 8
  volatile store double %tmp793, double* %tmp794
  %tmp796 = load double* %d12, align 8
  %tmp797 = load double** %pd, align 8
  %incdec.ptr798 = getelementptr inbounds double* %tmp797, i32 1
  store double* %incdec.ptr798, double** %pd, align 8
  volatile store double %tmp796, double* %tmp797
  %tmp799 = load double* %d22, align 8
  %tmp800 = load double** %pd, align 8
  %incdec.ptr801 = getelementptr inbounds double* %tmp800, i32 1
  store double* %incdec.ptr801, double** %pd, align 8
  volatile store double %tmp799, double* %tmp800
  %tmp802 = load double* %d32, align 8
  %tmp803 = load double** %pd, align 8
  %incdec.ptr804 = getelementptr inbounds double* %tmp803, i32 1
  store double* %incdec.ptr804, double** %pd, align 8
  volatile store double %tmp802, double* %tmp803
  %tmp805 = load double* %d03, align 8
  %tmp806 = load double** %pd, align 8
  %incdec.ptr807 = getelementptr inbounds double* %tmp806, i32 1
  store double* %incdec.ptr807, double** %pd, align 8
  volatile store double %tmp805, double* %tmp806
  %tmp808 = load double* %d13, align 8
  %tmp809 = load double** %pd, align 8
  %incdec.ptr810 = getelementptr inbounds double* %tmp809, i32 1
  store double* %incdec.ptr810, double** %pd, align 8
  volatile store double %tmp808, double* %tmp809
  %tmp811 = load double* %d23, align 8
  %tmp812 = load double** %pd, align 8
  %incdec.ptr813 = getelementptr inbounds double* %tmp812, i32 1
  store double* %incdec.ptr813, double** %pd, align 8
  volatile store double %tmp811, double* %tmp812
  %tmp814 = load double* %d33, align 8
  %tmp815 = load double** %pd, align 8
  %incdec.ptr816 = getelementptr inbounds double* %tmp815, i32 1
  store double* %incdec.ptr816, double** %pd, align 8
  volatile store double %tmp814, double* %tmp815
  %tmp817 = load double* %d04, align 8
  %tmp818 = load double** %pd, align 8
  %incdec.ptr819 = getelementptr inbounds double* %tmp818, i32 1
  store double* %incdec.ptr819, double** %pd, align 8
  volatile store double %tmp817, double* %tmp818
  %tmp820 = load double* %d14, align 8
  %tmp821 = load double** %pd, align 8
  %incdec.ptr822 = getelementptr inbounds double* %tmp821, i32 1
  store double* %incdec.ptr822, double** %pd, align 8
  volatile store double %tmp820, double* %tmp821
  %tmp823 = load double* %d24, align 8
  %tmp824 = load double** %pd, align 8
  %incdec.ptr825 = getelementptr inbounds double* %tmp824, i32 1
  store double* %incdec.ptr825, double** %pd, align 8
  volatile store double %tmp823, double* %tmp824
  %tmp826 = load double* %d34, align 8
  %tmp827 = load double** %pd, align 8
  %incdec.ptr828 = getelementptr inbounds double* %tmp827, i32 1
  store double* %incdec.ptr828, double** %pd, align 8
  volatile store double %tmp826, double* %tmp827
  %tmp829 = load double* %d05, align 8
  %tmp830 = load double** %pd, align 8
  %incdec.ptr831 = getelementptr inbounds double* %tmp830, i32 1
  store double* %incdec.ptr831, double** %pd, align 8
  volatile store double %tmp829, double* %tmp830
  %tmp832 = load double* %d15, align 8
  %tmp833 = load double** %pd, align 8
  %incdec.ptr834 = getelementptr inbounds double* %tmp833, i32 1
  store double* %incdec.ptr834, double** %pd, align 8
  volatile store double %tmp832, double* %tmp833
  %tmp835 = load double* %d25, align 8
  %tmp836 = load double** %pd, align 8
  %incdec.ptr837 = getelementptr inbounds double* %tmp836, i32 1
  store double* %incdec.ptr837, double** %pd, align 8
  volatile store double %tmp835, double* %tmp836
  %tmp838 = load double* %d35, align 8
  %tmp839 = load double** %pd, align 8
  %incdec.ptr840 = getelementptr inbounds double* %tmp839, i32 1
  store double* %incdec.ptr840, double** %pd, align 8
  volatile store double %tmp838, double* %tmp839
  %tmp841 = load double* %d06, align 8
  %tmp842 = load double** %pd, align 8
  %incdec.ptr843 = getelementptr inbounds double* %tmp842, i32 1
  store double* %incdec.ptr843, double** %pd, align 8
  volatile store double %tmp841, double* %tmp842
  %tmp844 = load double* %d16, align 8
  %tmp845 = load double** %pd, align 8
  %incdec.ptr846 = getelementptr inbounds double* %tmp845, i32 1
  store double* %incdec.ptr846, double** %pd, align 8
  volatile store double %tmp844, double* %tmp845
  %tmp847 = load double* %d26, align 8
  %tmp848 = load double** %pd, align 8
  %incdec.ptr849 = getelementptr inbounds double* %tmp848, i32 1
  store double* %incdec.ptr849, double** %pd, align 8
  volatile store double %tmp847, double* %tmp848
  %tmp850 = load double* %d36, align 8
  %tmp851 = load double** %pd, align 8
  %incdec.ptr852 = getelementptr inbounds double* %tmp851, i32 1
  store double* %incdec.ptr852, double** %pd, align 8
  volatile store double %tmp850, double* %tmp851
  %tmp853 = load double* %d07, align 8
  %tmp854 = load double** %pd, align 8
  %incdec.ptr855 = getelementptr inbounds double* %tmp854, i32 1
  store double* %incdec.ptr855, double** %pd, align 8
  volatile store double %tmp853, double* %tmp854
  %tmp856 = load double* %d17, align 8
  %tmp857 = load double** %pd, align 8
  %incdec.ptr858 = getelementptr inbounds double* %tmp857, i32 1
  store double* %incdec.ptr858, double** %pd, align 8
  volatile store double %tmp856, double* %tmp857
  %tmp859 = load double* %d27, align 8
  %tmp860 = load double** %pd, align 8
  %incdec.ptr861 = getelementptr inbounds double* %tmp860, i32 1
  store double* %incdec.ptr861, double** %pd, align 8
  volatile store double %tmp859, double* %tmp860
  %tmp862 = load double* %d37, align 8
  %tmp863 = load double** %pd, align 8
  %incdec.ptr864 = getelementptr inbounds double* %tmp863, i32 1
  store double* %incdec.ptr864, double** %pd, align 8
  volatile store double %tmp862, double* %tmp863
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 32
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %conv = sitofp i32 %tmp1 to double
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %arrayidx = getelementptr inbounds [32 x double]* @gd, i32 0, i64 %idxprom
  volatile store double %conv, double* %arrayidx, align 8
  %tmp3 = load i32* %i, align 4
  %conv4 = sitofp i32 %tmp3 to float
  %tmp5 = load i32* %i, align 4
  %idxprom6 = sext i32 %tmp5 to i64
  %arrayidx7 = getelementptr inbounds [32 x float]* @gf, i32 0, i64 %idxprom6
  volatile store float %conv4, float* %arrayidx7, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp8 = load i32* %i, align 4
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @foo(i32 1)
  store i32 0, i32* %i, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc30, %for.end
  %tmp10 = load i32* %i, align 4
  %cmp11 = icmp slt i32 %tmp10, 32
  br i1 %cmp11, label %for.body13, label %for.end33

for.body13:                                       ; preds = %for.cond9
  %tmp14 = load i32* %i, align 4
  %idxprom15 = sext i32 %tmp14 to i64
  %arrayidx16 = getelementptr inbounds [32 x double]* @gd, i32 0, i64 %idxprom15
  %tmp17 = volatile load double* %arrayidx16, align 8
  %tmp18 = load i32* %i, align 4
  %mul = mul nsw i32 %tmp18, 4
  %conv19 = sitofp i32 %mul to double
  %cmp20 = fcmp une double %tmp17, %conv19
  br i1 %cmp20, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.body13
  %tmp22 = load i32* %i, align 4
  %idxprom23 = sext i32 %tmp22 to i64
  %arrayidx24 = getelementptr inbounds [32 x float]* @gf, i32 0, i64 %idxprom23
  %tmp25 = volatile load float* %arrayidx24, align 4
  %tmp26 = load i32* %i, align 4
  %conv27 = sitofp i32 %tmp26 to float
  %cmp28 = fcmp une float %tmp25, %conv27
  br i1 %cmp28, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %for.body13
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  br label %for.inc30

for.inc30:                                        ; preds = %if.end
  %tmp31 = load i32* %i, align 4
  %inc32 = add nsw i32 %tmp31, 1
  store i32 %inc32, i32* %i, align 4
  br label %for.cond9

for.end33:                                        ; preds = %for.cond9
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
