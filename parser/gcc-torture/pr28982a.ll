; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr28982a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@incs = common global [20 x i32] zeroinitializer, align 16
@ptrs = common global [20 x float*] zeroinitializer, align 16
@results = common global [20 x float] zeroinitializer, align 16
@input = common global [80 x float] zeroinitializer, align 16

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

define void @foo(i32 %n) nounwind uwtable noinline {
entry:
  %n.addr = alloca i32, align 4
  %inc0 = alloca i32, align 4
  %inc1 = alloca i32, align 4
  %inc2 = alloca i32, align 4
  %inc3 = alloca i32, align 4
  %inc4 = alloca i32, align 4
  %inc5 = alloca i32, align 4
  %inc6 = alloca i32, align 4
  %inc7 = alloca i32, align 4
  %inc8 = alloca i32, align 4
  %inc9 = alloca i32, align 4
  %inc10 = alloca i32, align 4
  %inc11 = alloca i32, align 4
  %inc12 = alloca i32, align 4
  %inc13 = alloca i32, align 4
  %inc14 = alloca i32, align 4
  %inc15 = alloca i32, align 4
  %inc16 = alloca i32, align 4
  %inc17 = alloca i32, align 4
  %inc18 = alloca i32, align 4
  %inc19 = alloca i32, align 4
  %ptr0 = alloca float*, align 8
  %result0 = alloca float, align 4
  %ptr1 = alloca float*, align 8
  %result1 = alloca float, align 4
  %ptr2 = alloca float*, align 8
  %result2 = alloca float, align 4
  %ptr3 = alloca float*, align 8
  %result3 = alloca float, align 4
  %ptr4 = alloca float*, align 8
  %result4 = alloca float, align 4
  %ptr5 = alloca float*, align 8
  %result5 = alloca float, align 4
  %ptr6 = alloca float*, align 8
  %result6 = alloca float, align 4
  %ptr7 = alloca float*, align 8
  %result7 = alloca float, align 4
  %ptr8 = alloca float*, align 8
  %result8 = alloca float, align 4
  %ptr9 = alloca float*, align 8
  %result9 = alloca float, align 4
  %ptr10 = alloca float*, align 8
  %result10 = alloca float, align 4
  %ptr11 = alloca float*, align 8
  %result11 = alloca float, align 4
  %ptr12 = alloca float*, align 8
  %result12 = alloca float, align 4
  %ptr13 = alloca float*, align 8
  %result13 = alloca float, align 4
  %ptr14 = alloca float*, align 8
  %result14 = alloca float, align 4
  %ptr15 = alloca float*, align 8
  %result15 = alloca float, align 4
  %ptr16 = alloca float*, align 8
  %result16 = alloca float, align 4
  %ptr17 = alloca float*, align 8
  %result17 = alloca float, align 4
  %ptr18 = alloca float*, align 8
  %result18 = alloca float, align 4
  %ptr19 = alloca float*, align 8
  %result19 = alloca float, align 4
  store i32 %n, i32* %n.addr, align 4
  %tmp = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 0), align 4
  store i32 %tmp, i32* %inc0, align 4
  %tmp2 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 1), align 4
  store i32 %tmp2, i32* %inc1, align 4
  %tmp4 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 2), align 4
  store i32 %tmp4, i32* %inc2, align 4
  %tmp6 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 3), align 4
  store i32 %tmp6, i32* %inc3, align 4
  %tmp8 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 4), align 4
  store i32 %tmp8, i32* %inc4, align 4
  %tmp10 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 5), align 4
  store i32 %tmp10, i32* %inc5, align 4
  %tmp12 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 6), align 4
  store i32 %tmp12, i32* %inc6, align 4
  %tmp14 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 7), align 4
  store i32 %tmp14, i32* %inc7, align 4
  %tmp16 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 8), align 4
  store i32 %tmp16, i32* %inc8, align 4
  %tmp18 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 9), align 4
  store i32 %tmp18, i32* %inc9, align 4
  %tmp20 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 10), align 4
  store i32 %tmp20, i32* %inc10, align 4
  %tmp22 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 11), align 4
  store i32 %tmp22, i32* %inc11, align 4
  %tmp24 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 12), align 4
  store i32 %tmp24, i32* %inc12, align 4
  %tmp26 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 13), align 4
  store i32 %tmp26, i32* %inc13, align 4
  %tmp28 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 14), align 4
  store i32 %tmp28, i32* %inc14, align 4
  %tmp30 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 15), align 4
  store i32 %tmp30, i32* %inc15, align 4
  %tmp32 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 16), align 4
  store i32 %tmp32, i32* %inc16, align 4
  %tmp34 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 17), align 4
  store i32 %tmp34, i32* %inc17, align 4
  %tmp36 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 18), align 4
  store i32 %tmp36, i32* %inc18, align 4
  %tmp38 = load i32* getelementptr inbounds ([20 x i32]* @incs, i32 0, i64 19), align 4
  store i32 %tmp38, i32* %inc19, align 4
  %tmp40 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 0), align 8
  store float* %tmp40, float** %ptr0, align 8
  store float 0.000000e+00, float* %result0, align 4
  %tmp43 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 1), align 8
  store float* %tmp43, float** %ptr1, align 8
  store float 0.000000e+00, float* %result1, align 4
  %tmp46 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 2), align 8
  store float* %tmp46, float** %ptr2, align 8
  store float 0.000000e+00, float* %result2, align 4
  %tmp49 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 3), align 8
  store float* %tmp49, float** %ptr3, align 8
  store float 0.000000e+00, float* %result3, align 4
  %tmp52 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 4), align 8
  store float* %tmp52, float** %ptr4, align 8
  store float 0.000000e+00, float* %result4, align 4
  %tmp55 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 5), align 8
  store float* %tmp55, float** %ptr5, align 8
  store float 0.000000e+00, float* %result5, align 4
  %tmp58 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 6), align 8
  store float* %tmp58, float** %ptr6, align 8
  store float 0.000000e+00, float* %result6, align 4
  %tmp61 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 7), align 8
  store float* %tmp61, float** %ptr7, align 8
  store float 0.000000e+00, float* %result7, align 4
  %tmp64 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 8), align 8
  store float* %tmp64, float** %ptr8, align 8
  store float 0.000000e+00, float* %result8, align 4
  %tmp67 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 9), align 8
  store float* %tmp67, float** %ptr9, align 8
  store float 0.000000e+00, float* %result9, align 4
  %tmp70 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 10), align 8
  store float* %tmp70, float** %ptr10, align 8
  store float 0.000000e+00, float* %result10, align 4
  %tmp73 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 11), align 8
  store float* %tmp73, float** %ptr11, align 8
  store float 0.000000e+00, float* %result11, align 4
  %tmp76 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 12), align 8
  store float* %tmp76, float** %ptr12, align 8
  store float 0.000000e+00, float* %result12, align 4
  %tmp79 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 13), align 8
  store float* %tmp79, float** %ptr13, align 8
  store float 0.000000e+00, float* %result13, align 4
  %tmp82 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 14), align 8
  store float* %tmp82, float** %ptr14, align 8
  store float 0.000000e+00, float* %result14, align 4
  %tmp85 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 15), align 8
  store float* %tmp85, float** %ptr15, align 8
  store float 0.000000e+00, float* %result15, align 4
  %tmp88 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 16), align 8
  store float* %tmp88, float** %ptr16, align 8
  store float 0.000000e+00, float* %result16, align 4
  %tmp91 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 17), align 8
  store float* %tmp91, float** %ptr17, align 8
  store float 0.000000e+00, float* %result17, align 4
  %tmp94 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 18), align 8
  store float* %tmp94, float** %ptr18, align 8
  store float 0.000000e+00, float* %result18, align 4
  %tmp97 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i32 0, i64 19), align 8
  store float* %tmp97, float** %ptr19, align 8
  store float 0.000000e+00, float* %result19, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %tmp99 = load i32* %n.addr, align 4
  %dec = add nsw i32 %tmp99, -1
  store i32 %dec, i32* %n.addr, align 4
  %tobool = icmp ne i32 %tmp99, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp100 = load float** %ptr0, align 8
  %tmp101 = load float* %tmp100
  %tmp102 = load float* %result0, align 4
  %add = fadd float %tmp102, %tmp101
  store float %add, float* %result0, align 4
  %tmp103 = load i32* %inc0, align 4
  %tmp104 = load float** %ptr0, align 8
  %idx.ext = sext i32 %tmp103 to i64
  %add.ptr = getelementptr inbounds float* %tmp104, i64 %idx.ext
  store float* %add.ptr, float** %ptr0, align 8
  %tmp105 = load float** %ptr1, align 8
  %tmp106 = load float* %tmp105
  %tmp107 = load float* %result1, align 4
  %add108 = fadd float %tmp107, %tmp106
  store float %add108, float* %result1, align 4
  %tmp109 = load i32* %inc1, align 4
  %tmp110 = load float** %ptr1, align 8
  %idx.ext111 = sext i32 %tmp109 to i64
  %add.ptr112 = getelementptr inbounds float* %tmp110, i64 %idx.ext111
  store float* %add.ptr112, float** %ptr1, align 8
  %tmp113 = load float** %ptr2, align 8
  %tmp114 = load float* %tmp113
  %tmp115 = load float* %result2, align 4
  %add116 = fadd float %tmp115, %tmp114
  store float %add116, float* %result2, align 4
  %tmp117 = load i32* %inc2, align 4
  %tmp118 = load float** %ptr2, align 8
  %idx.ext119 = sext i32 %tmp117 to i64
  %add.ptr120 = getelementptr inbounds float* %tmp118, i64 %idx.ext119
  store float* %add.ptr120, float** %ptr2, align 8
  %tmp121 = load float** %ptr3, align 8
  %tmp122 = load float* %tmp121
  %tmp123 = load float* %result3, align 4
  %add124 = fadd float %tmp123, %tmp122
  store float %add124, float* %result3, align 4
  %tmp125 = load i32* %inc3, align 4
  %tmp126 = load float** %ptr3, align 8
  %idx.ext127 = sext i32 %tmp125 to i64
  %add.ptr128 = getelementptr inbounds float* %tmp126, i64 %idx.ext127
  store float* %add.ptr128, float** %ptr3, align 8
  %tmp129 = load float** %ptr4, align 8
  %tmp130 = load float* %tmp129
  %tmp131 = load float* %result4, align 4
  %add132 = fadd float %tmp131, %tmp130
  store float %add132, float* %result4, align 4
  %tmp133 = load i32* %inc4, align 4
  %tmp134 = load float** %ptr4, align 8
  %idx.ext135 = sext i32 %tmp133 to i64
  %add.ptr136 = getelementptr inbounds float* %tmp134, i64 %idx.ext135
  store float* %add.ptr136, float** %ptr4, align 8
  %tmp137 = load float** %ptr5, align 8
  %tmp138 = load float* %tmp137
  %tmp139 = load float* %result5, align 4
  %add140 = fadd float %tmp139, %tmp138
  store float %add140, float* %result5, align 4
  %tmp141 = load i32* %inc5, align 4
  %tmp142 = load float** %ptr5, align 8
  %idx.ext143 = sext i32 %tmp141 to i64
  %add.ptr144 = getelementptr inbounds float* %tmp142, i64 %idx.ext143
  store float* %add.ptr144, float** %ptr5, align 8
  %tmp145 = load float** %ptr6, align 8
  %tmp146 = load float* %tmp145
  %tmp147 = load float* %result6, align 4
  %add148 = fadd float %tmp147, %tmp146
  store float %add148, float* %result6, align 4
  %tmp149 = load i32* %inc6, align 4
  %tmp150 = load float** %ptr6, align 8
  %idx.ext151 = sext i32 %tmp149 to i64
  %add.ptr152 = getelementptr inbounds float* %tmp150, i64 %idx.ext151
  store float* %add.ptr152, float** %ptr6, align 8
  %tmp153 = load float** %ptr7, align 8
  %tmp154 = load float* %tmp153
  %tmp155 = load float* %result7, align 4
  %add156 = fadd float %tmp155, %tmp154
  store float %add156, float* %result7, align 4
  %tmp157 = load i32* %inc7, align 4
  %tmp158 = load float** %ptr7, align 8
  %idx.ext159 = sext i32 %tmp157 to i64
  %add.ptr160 = getelementptr inbounds float* %tmp158, i64 %idx.ext159
  store float* %add.ptr160, float** %ptr7, align 8
  %tmp161 = load float** %ptr8, align 8
  %tmp162 = load float* %tmp161
  %tmp163 = load float* %result8, align 4
  %add164 = fadd float %tmp163, %tmp162
  store float %add164, float* %result8, align 4
  %tmp165 = load i32* %inc8, align 4
  %tmp166 = load float** %ptr8, align 8
  %idx.ext167 = sext i32 %tmp165 to i64
  %add.ptr168 = getelementptr inbounds float* %tmp166, i64 %idx.ext167
  store float* %add.ptr168, float** %ptr8, align 8
  %tmp169 = load float** %ptr9, align 8
  %tmp170 = load float* %tmp169
  %tmp171 = load float* %result9, align 4
  %add172 = fadd float %tmp171, %tmp170
  store float %add172, float* %result9, align 4
  %tmp173 = load i32* %inc9, align 4
  %tmp174 = load float** %ptr9, align 8
  %idx.ext175 = sext i32 %tmp173 to i64
  %add.ptr176 = getelementptr inbounds float* %tmp174, i64 %idx.ext175
  store float* %add.ptr176, float** %ptr9, align 8
  %tmp177 = load float** %ptr10, align 8
  %tmp178 = load float* %tmp177
  %tmp179 = load float* %result10, align 4
  %add180 = fadd float %tmp179, %tmp178
  store float %add180, float* %result10, align 4
  %tmp181 = load i32* %inc10, align 4
  %tmp182 = load float** %ptr10, align 8
  %idx.ext183 = sext i32 %tmp181 to i64
  %add.ptr184 = getelementptr inbounds float* %tmp182, i64 %idx.ext183
  store float* %add.ptr184, float** %ptr10, align 8
  %tmp185 = load float** %ptr11, align 8
  %tmp186 = load float* %tmp185
  %tmp187 = load float* %result11, align 4
  %add188 = fadd float %tmp187, %tmp186
  store float %add188, float* %result11, align 4
  %tmp189 = load i32* %inc11, align 4
  %tmp190 = load float** %ptr11, align 8
  %idx.ext191 = sext i32 %tmp189 to i64
  %add.ptr192 = getelementptr inbounds float* %tmp190, i64 %idx.ext191
  store float* %add.ptr192, float** %ptr11, align 8
  %tmp193 = load float** %ptr12, align 8
  %tmp194 = load float* %tmp193
  %tmp195 = load float* %result12, align 4
  %add196 = fadd float %tmp195, %tmp194
  store float %add196, float* %result12, align 4
  %tmp197 = load i32* %inc12, align 4
  %tmp198 = load float** %ptr12, align 8
  %idx.ext199 = sext i32 %tmp197 to i64
  %add.ptr200 = getelementptr inbounds float* %tmp198, i64 %idx.ext199
  store float* %add.ptr200, float** %ptr12, align 8
  %tmp201 = load float** %ptr13, align 8
  %tmp202 = load float* %tmp201
  %tmp203 = load float* %result13, align 4
  %add204 = fadd float %tmp203, %tmp202
  store float %add204, float* %result13, align 4
  %tmp205 = load i32* %inc13, align 4
  %tmp206 = load float** %ptr13, align 8
  %idx.ext207 = sext i32 %tmp205 to i64
  %add.ptr208 = getelementptr inbounds float* %tmp206, i64 %idx.ext207
  store float* %add.ptr208, float** %ptr13, align 8
  %tmp209 = load float** %ptr14, align 8
  %tmp210 = load float* %tmp209
  %tmp211 = load float* %result14, align 4
  %add212 = fadd float %tmp211, %tmp210
  store float %add212, float* %result14, align 4
  %tmp213 = load i32* %inc14, align 4
  %tmp214 = load float** %ptr14, align 8
  %idx.ext215 = sext i32 %tmp213 to i64
  %add.ptr216 = getelementptr inbounds float* %tmp214, i64 %idx.ext215
  store float* %add.ptr216, float** %ptr14, align 8
  %tmp217 = load float** %ptr15, align 8
  %tmp218 = load float* %tmp217
  %tmp219 = load float* %result15, align 4
  %add220 = fadd float %tmp219, %tmp218
  store float %add220, float* %result15, align 4
  %tmp221 = load i32* %inc15, align 4
  %tmp222 = load float** %ptr15, align 8
  %idx.ext223 = sext i32 %tmp221 to i64
  %add.ptr224 = getelementptr inbounds float* %tmp222, i64 %idx.ext223
  store float* %add.ptr224, float** %ptr15, align 8
  %tmp225 = load float** %ptr16, align 8
  %tmp226 = load float* %tmp225
  %tmp227 = load float* %result16, align 4
  %add228 = fadd float %tmp227, %tmp226
  store float %add228, float* %result16, align 4
  %tmp229 = load i32* %inc16, align 4
  %tmp230 = load float** %ptr16, align 8
  %idx.ext231 = sext i32 %tmp229 to i64
  %add.ptr232 = getelementptr inbounds float* %tmp230, i64 %idx.ext231
  store float* %add.ptr232, float** %ptr16, align 8
  %tmp233 = load float** %ptr17, align 8
  %tmp234 = load float* %tmp233
  %tmp235 = load float* %result17, align 4
  %add236 = fadd float %tmp235, %tmp234
  store float %add236, float* %result17, align 4
  %tmp237 = load i32* %inc17, align 4
  %tmp238 = load float** %ptr17, align 8
  %idx.ext239 = sext i32 %tmp237 to i64
  %add.ptr240 = getelementptr inbounds float* %tmp238, i64 %idx.ext239
  store float* %add.ptr240, float** %ptr17, align 8
  %tmp241 = load float** %ptr18, align 8
  %tmp242 = load float* %tmp241
  %tmp243 = load float* %result18, align 4
  %add244 = fadd float %tmp243, %tmp242
  store float %add244, float* %result18, align 4
  %tmp245 = load i32* %inc18, align 4
  %tmp246 = load float** %ptr18, align 8
  %idx.ext247 = sext i32 %tmp245 to i64
  %add.ptr248 = getelementptr inbounds float* %tmp246, i64 %idx.ext247
  store float* %add.ptr248, float** %ptr18, align 8
  %tmp249 = load float** %ptr19, align 8
  %tmp250 = load float* %tmp249
  %tmp251 = load float* %result19, align 4
  %add252 = fadd float %tmp251, %tmp250
  store float %add252, float* %result19, align 4
  %tmp253 = load i32* %inc19, align 4
  %tmp254 = load float** %ptr19, align 8
  %idx.ext255 = sext i32 %tmp253 to i64
  %add.ptr256 = getelementptr inbounds float* %tmp254, i64 %idx.ext255
  store float* %add.ptr256, float** %ptr19, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %tmp257 = load float* %result0, align 4
  store float %tmp257, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 0), align 4
  %tmp258 = load float* %result1, align 4
  store float %tmp258, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 1), align 4
  %tmp259 = load float* %result2, align 4
  store float %tmp259, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 2), align 4
  %tmp260 = load float* %result3, align 4
  store float %tmp260, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 3), align 4
  %tmp261 = load float* %result4, align 4
  store float %tmp261, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 4), align 4
  %tmp262 = load float* %result5, align 4
  store float %tmp262, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 5), align 4
  %tmp263 = load float* %result6, align 4
  store float %tmp263, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 6), align 4
  %tmp264 = load float* %result7, align 4
  store float %tmp264, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 7), align 4
  %tmp265 = load float* %result8, align 4
  store float %tmp265, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 8), align 4
  %tmp266 = load float* %result9, align 4
  store float %tmp266, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 9), align 4
  %tmp267 = load float* %result10, align 4
  store float %tmp267, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 10), align 4
  %tmp268 = load float* %result11, align 4
  store float %tmp268, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 11), align 4
  %tmp269 = load float* %result12, align 4
  store float %tmp269, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 12), align 4
  %tmp270 = load float* %result13, align 4
  store float %tmp270, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 13), align 4
  %tmp271 = load float* %result14, align 4
  store float %tmp271, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 14), align 4
  %tmp272 = load float* %result15, align 4
  store float %tmp272, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 15), align 4
  %tmp273 = load float* %result16, align 4
  store float %tmp273, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 16), align 4
  %tmp274 = load float* %result17, align 4
  store float %tmp274, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 17), align 4
  %tmp275 = load float* %result18, align 4
  store float %tmp275, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 18), align 4
  %tmp276 = load float* %result19, align 4
  store float %tmp276, float* getelementptr inbounds ([20 x float]* @results, i32 0, i64 19), align 4
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
  %cmp = icmp slt i32 %tmp, 20
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %i, align 4
  %idx.ext = sext i32 %tmp1 to i64
  %add.ptr = getelementptr inbounds float* getelementptr inbounds ([80 x float]* @input, i32 0, i32 0), i64 %idx.ext
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %arrayidx = getelementptr inbounds [20 x float*]* @ptrs, i32 0, i64 %idxprom
  store float* %add.ptr, float** %arrayidx, align 8
  %tmp3 = load i32* %i, align 4
  %tmp4 = load i32* %i, align 4
  %idxprom5 = sext i32 %tmp4 to i64
  %arrayidx6 = getelementptr inbounds [20 x i32]* @incs, i32 0, i64 %idxprom5
  store i32 %tmp3, i32* %arrayidx6, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp7 = load i32* %i, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond8

for.cond8:                                        ; preds = %for.inc16, %for.end
  %tmp9 = load i32* %i, align 4
  %cmp10 = icmp slt i32 %tmp9, 80
  br i1 %cmp10, label %for.body11, label %for.end19

for.body11:                                       ; preds = %for.cond8
  %tmp12 = load i32* %i, align 4
  %conv = sitofp i32 %tmp12 to float
  %tmp13 = load i32* %i, align 4
  %idxprom14 = sext i32 %tmp13 to i64
  %arrayidx15 = getelementptr inbounds [80 x float]* @input, i32 0, i64 %idxprom14
  store float %conv, float* %arrayidx15, align 4
  br label %for.inc16

for.inc16:                                        ; preds = %for.body11
  %tmp17 = load i32* %i, align 4
  %inc18 = add nsw i32 %tmp17, 1
  store i32 %inc18, i32* %i, align 4
  br label %for.cond8

for.end19:                                        ; preds = %for.cond8
  call void @foo(i32 4)
  store i32 0, i32* %i, align 4
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc34, %for.end19
  %tmp21 = load i32* %i, align 4
  %cmp22 = icmp slt i32 %tmp21, 20
  br i1 %cmp22, label %for.body24, label %for.end37

for.body24:                                       ; preds = %for.cond20
  %tmp25 = load i32* %i, align 4
  %idxprom26 = sext i32 %tmp25 to i64
  %arrayidx27 = getelementptr inbounds [20 x float]* @results, i32 0, i64 %idxprom26
  %tmp28 = load float* %arrayidx27, align 4
  %tmp29 = load i32* %i, align 4
  %mul = mul nsw i32 %tmp29, 4
  %mul30 = mul nsw i32 %mul, 5
  %div = sdiv i32 %mul30, 2
  %conv31 = sitofp i32 %div to float
  %cmp32 = fcmp une float %tmp28, %conv31
  br i1 %cmp32, label %if.then, label %if.end

if.then:                                          ; preds = %for.body24
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %for.body24
  br label %for.inc34

for.inc34:                                        ; preds = %if.end
  %tmp35 = load i32* %i, align 4
  %inc36 = add nsw i32 %tmp35, 1
  store i32 %inc36, i32* %i, align 4
  br label %for.cond20

for.end37:                                        ; preds = %for.cond20
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %for.end37, %if.then
  %0 = load i32* %retval
  ret i32 %0
}
