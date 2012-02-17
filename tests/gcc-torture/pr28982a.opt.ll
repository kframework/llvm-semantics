; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr28982a.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@incs = common global [20 x i32] zeroinitializer, align 16
@ptrs = common global [20 x float*] zeroinitializer, align 16
@results = common global [20 x float] zeroinitializer, align 16
@input = common global [80 x float] zeroinitializer, align 16

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

define void @foo(i32 %n) nounwind uwtable noinline {
entry:
  %tobool42 = icmp eq i32 %n, 0
  br i1 %tobool42, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %tmp97 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 19), align 8
  %tmp94 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 18), align 16
  %tmp91 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 17), align 8
  %tmp88 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 16), align 16
  %tmp85 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 15), align 8
  %tmp82 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 14), align 16
  %tmp79 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 13), align 8
  %tmp76 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 12), align 16
  %tmp73 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 11), align 8
  %tmp70 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 10), align 16
  %tmp67 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 9), align 8
  %tmp64 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 8), align 16
  %tmp61 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 7), align 8
  %tmp58 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 6), align 16
  %tmp55 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 5), align 8
  %tmp52 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 4), align 16
  %tmp49 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 3), align 8
  %tmp46 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 2), align 16
  %tmp43 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 1), align 8
  %tmp40 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 0), align 16
  %tmp38 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 19), align 4
  %tmp36 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 18), align 8
  %tmp34 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 17), align 4
  %tmp32 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 16), align 16
  %tmp30 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 15), align 4
  %tmp28 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 14), align 8
  %tmp26 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 13), align 4
  %tmp24 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 12), align 16
  %tmp22 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 11), align 4
  %tmp20 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 10), align 8
  %tmp18 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 9), align 4
  %tmp16 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 8), align 16
  %tmp14 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 7), align 4
  %tmp12 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 6), align 8
  %tmp10 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 5), align 4
  %tmp8 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 4), align 16
  %tmp6 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 3), align 4
  %tmp4 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 2), align 8
  %tmp2 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 1), align 4
  %tmp = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 0), align 16
  %tmp103 = zext i32 %n to i64
  %tmp110 = sext i32 %tmp to i64
  %tmp112 = sext i32 %tmp2 to i64
  %tmp115 = sext i32 %tmp4 to i64
  %tmp117 = sext i32 %tmp6 to i64
  %tmp119 = sext i32 %tmp8 to i64
  %tmp121 = sext i32 %tmp10 to i64
  %tmp124 = sext i32 %tmp12 to i64
  %tmp126 = sext i32 %tmp14 to i64
  %tmp128 = sext i32 %tmp16 to i64
  %tmp131 = sext i32 %tmp18 to i64
  %tmp133 = sext i32 %tmp20 to i64
  %tmp135 = sext i32 %tmp22 to i64
  %tmp137 = sext i32 %tmp24 to i64
  %tmp140 = sext i32 %tmp26 to i64
  %tmp142 = sext i32 %tmp28 to i64
  %tmp144 = sext i32 %tmp30 to i64
  %tmp147 = sext i32 %tmp32 to i64
  %tmp149 = sext i32 %tmp34 to i64
  %tmp151 = sext i32 %tmp36 to i64
  %tmp153 = sext i32 %tmp38 to i64
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %indvar = phi i64 [ 0, %while.body.lr.ph ], [ %indvar.next, %while.body ]
  %tmp257381 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add, %while.body ]
  %tmp258579 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add108, %while.body ]
  %tmp259777 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add116, %while.body ]
  %tmp260975 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add124, %while.body ]
  %tmp2611173 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add132, %while.body ]
  %tmp2621371 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add140, %while.body ]
  %tmp2631569 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add148, %while.body ]
  %tmp2641767 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add156, %while.body ]
  %tmp2651965 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add164, %while.body ]
  %tmp2662163 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add172, %while.body ]
  %tmp2672361 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add180, %while.body ]
  %tmp2682559 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add188, %while.body ]
  %tmp2692757 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add196, %while.body ]
  %tmp2702955 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add204, %while.body ]
  %tmp2713153 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add212, %while.body ]
  %tmp2723351 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add220, %while.body ]
  %tmp2733549 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add228, %while.body ]
  %tmp2743747 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add236, %while.body ]
  %tmp2753945 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add244, %while.body ]
  %tmp2764143 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add252, %while.body ]
  %tmp111 = mul i64 %tmp110, %indvar
  %add.ptr282 = getelementptr float* %tmp40, i64 %tmp111
  %tmp113 = mul i64 %tmp112, %indvar
  %add.ptr112480 = getelementptr float* %tmp43, i64 %tmp113
  %tmp116 = mul i64 %tmp115, %indvar
  %add.ptr120678 = getelementptr float* %tmp46, i64 %tmp116
  %tmp118 = mul i64 %tmp117, %indvar
  %add.ptr128876 = getelementptr float* %tmp49, i64 %tmp118
  %tmp120 = mul i64 %tmp119, %indvar
  %add.ptr1361074 = getelementptr float* %tmp52, i64 %tmp120
  %tmp123 = mul i64 %tmp121, %indvar
  %add.ptr1441272 = getelementptr float* %tmp55, i64 %tmp123
  %tmp125 = mul i64 %tmp124, %indvar
  %add.ptr1521470 = getelementptr float* %tmp58, i64 %tmp125
  %tmp127 = mul i64 %tmp126, %indvar
  %add.ptr1601668 = getelementptr float* %tmp61, i64 %tmp127
  %tmp129 = mul i64 %tmp128, %indvar
  %add.ptr1681866 = getelementptr float* %tmp64, i64 %tmp129
  %tmp132 = mul i64 %tmp131, %indvar
  %add.ptr1762064 = getelementptr float* %tmp67, i64 %tmp132
  %tmp134 = mul i64 %tmp133, %indvar
  %add.ptr1842262 = getelementptr float* %tmp70, i64 %tmp134
  %tmp136 = mul i64 %tmp135, %indvar
  %add.ptr1922460 = getelementptr float* %tmp73, i64 %tmp136
  %tmp139 = mul i64 %tmp137, %indvar
  %add.ptr2002658 = getelementptr float* %tmp76, i64 %tmp139
  %tmp141 = mul i64 %tmp140, %indvar
  %add.ptr2082856 = getelementptr float* %tmp79, i64 %tmp141
  %tmp143 = mul i64 %tmp142, %indvar
  %add.ptr2163054 = getelementptr float* %tmp82, i64 %tmp143
  %tmp145 = mul i64 %tmp144, %indvar
  %add.ptr2243252 = getelementptr float* %tmp85, i64 %tmp145
  %tmp148 = mul i64 %tmp147, %indvar
  %add.ptr2323450 = getelementptr float* %tmp88, i64 %tmp148
  %tmp150 = mul i64 %tmp149, %indvar
  %add.ptr2403648 = getelementptr float* %tmp91, i64 %tmp150
  %tmp152 = mul i64 %tmp151, %indvar
  %add.ptr2483846 = getelementptr float* %tmp94, i64 %tmp152
  %tmp155 = mul i64 %tmp153, %indvar
  %add.ptr2564044 = getelementptr float* %tmp97, i64 %tmp155
  %tmp101 = load float* %add.ptr282, align 4
  %add = fadd float %tmp257381, %tmp101
  %tmp106 = load float* %add.ptr112480, align 4
  %add108 = fadd float %tmp258579, %tmp106
  %tmp114 = load float* %add.ptr120678, align 4
  %add116 = fadd float %tmp259777, %tmp114
  %tmp122 = load float* %add.ptr128876, align 4
  %add124 = fadd float %tmp260975, %tmp122
  %tmp130 = load float* %add.ptr1361074, align 4
  %add132 = fadd float %tmp2611173, %tmp130
  %tmp138 = load float* %add.ptr1441272, align 4
  %add140 = fadd float %tmp2621371, %tmp138
  %tmp146 = load float* %add.ptr1521470, align 4
  %add148 = fadd float %tmp2631569, %tmp146
  %tmp154 = load float* %add.ptr1601668, align 4
  %add156 = fadd float %tmp2641767, %tmp154
  %tmp162 = load float* %add.ptr1681866, align 4
  %add164 = fadd float %tmp2651965, %tmp162
  %tmp170 = load float* %add.ptr1762064, align 4
  %add172 = fadd float %tmp2662163, %tmp170
  %tmp178 = load float* %add.ptr1842262, align 4
  %add180 = fadd float %tmp2672361, %tmp178
  %tmp186 = load float* %add.ptr1922460, align 4
  %add188 = fadd float %tmp2682559, %tmp186
  %tmp194 = load float* %add.ptr2002658, align 4
  %add196 = fadd float %tmp2692757, %tmp194
  %tmp202 = load float* %add.ptr2082856, align 4
  %add204 = fadd float %tmp2702955, %tmp202
  %tmp210 = load float* %add.ptr2163054, align 4
  %add212 = fadd float %tmp2713153, %tmp210
  %tmp218 = load float* %add.ptr2243252, align 4
  %add220 = fadd float %tmp2723351, %tmp218
  %tmp226 = load float* %add.ptr2323450, align 4
  %add228 = fadd float %tmp2733549, %tmp226
  %tmp234 = load float* %add.ptr2403648, align 4
  %add236 = fadd float %tmp2743747, %tmp234
  %tmp242 = load float* %add.ptr2483846, align 4
  %add244 = fadd float %tmp2753945, %tmp242
  %tmp250 = load float* %add.ptr2564044, align 4
  %add252 = fadd float %tmp2764143, %tmp250
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp103
  br i1 %exitcond, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  %tmp2573.lcssa = phi float [ 0.000000e+00, %entry ], [ %add, %while.body ]
  %tmp2585.lcssa = phi float [ 0.000000e+00, %entry ], [ %add108, %while.body ]
  %tmp2597.lcssa = phi float [ 0.000000e+00, %entry ], [ %add116, %while.body ]
  %tmp2609.lcssa = phi float [ 0.000000e+00, %entry ], [ %add124, %while.body ]
  %tmp26111.lcssa = phi float [ 0.000000e+00, %entry ], [ %add132, %while.body ]
  %tmp26213.lcssa = phi float [ 0.000000e+00, %entry ], [ %add140, %while.body ]
  %tmp26315.lcssa = phi float [ 0.000000e+00, %entry ], [ %add148, %while.body ]
  %tmp26417.lcssa = phi float [ 0.000000e+00, %entry ], [ %add156, %while.body ]
  %tmp26519.lcssa = phi float [ 0.000000e+00, %entry ], [ %add164, %while.body ]
  %tmp26621.lcssa = phi float [ 0.000000e+00, %entry ], [ %add172, %while.body ]
  %tmp26723.lcssa = phi float [ 0.000000e+00, %entry ], [ %add180, %while.body ]
  %tmp26825.lcssa = phi float [ 0.000000e+00, %entry ], [ %add188, %while.body ]
  %tmp26927.lcssa = phi float [ 0.000000e+00, %entry ], [ %add196, %while.body ]
  %tmp27029.lcssa = phi float [ 0.000000e+00, %entry ], [ %add204, %while.body ]
  %tmp27131.lcssa = phi float [ 0.000000e+00, %entry ], [ %add212, %while.body ]
  %tmp27233.lcssa = phi float [ 0.000000e+00, %entry ], [ %add220, %while.body ]
  %tmp27335.lcssa = phi float [ 0.000000e+00, %entry ], [ %add228, %while.body ]
  %tmp27437.lcssa = phi float [ 0.000000e+00, %entry ], [ %add236, %while.body ]
  %tmp27539.lcssa = phi float [ 0.000000e+00, %entry ], [ %add244, %while.body ]
  %tmp27641.lcssa = phi float [ 0.000000e+00, %entry ], [ %add252, %while.body ]
  store float %tmp2573.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 0), align 16
  store float %tmp2585.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 1), align 4
  store float %tmp2597.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 2), align 8
  store float %tmp2609.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 3), align 4
  store float %tmp26111.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 4), align 16
  store float %tmp26213.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 5), align 4
  store float %tmp26315.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 6), align 8
  store float %tmp26417.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 7), align 4
  store float %tmp26519.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 8), align 16
  store float %tmp26621.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 9), align 4
  store float %tmp26723.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 10), align 8
  store float %tmp26825.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 11), align 4
  store float %tmp26927.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 12), align 16
  store float %tmp27029.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 13), align 4
  store float %tmp27131.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 14), align 8
  store float %tmp27233.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 15), align 4
  store float %tmp27335.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 16), align 16
  store float %tmp27437.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 17), align 4
  store float %tmp27539.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 18), align 8
  store float %tmp27641.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 19), align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvar13 = phi i64 [ 0, %entry ], [ %indvar.next14, %for.body ]
  %storemerge5 = trunc i64 %indvar13 to i32
  %arrayidx6 = getelementptr [20 x i32]* @incs, i64 0, i64 %indvar13
  %arrayidx = getelementptr [20 x float*]* @ptrs, i64 0, i64 %indvar13
  %add.ptr = getelementptr [80 x float]* @input, i64 0, i64 %indvar13
  store float* %add.ptr, float** %arrayidx, align 8
  store i32 %storemerge5, i32* %arrayidx6, align 4
  %indvar.next14 = add i64 %indvar13, 1
  %exitcond15 = icmp eq i64 %indvar.next14, 20
  br i1 %exitcond15, label %for.body11, label %for.body

for.body11:                                       ; preds = %for.body, %for.body11
  %indvar8 = phi i64 [ %indvar.next9, %for.body11 ], [ 0, %for.body ]
  %arrayidx15 = getelementptr [80 x float]* @input, i64 0, i64 %indvar8
  %storemerge14 = trunc i64 %indvar8 to i32
  %conv = sitofp i32 %storemerge14 to float
  store float %conv, float* %arrayidx15, align 4
  %indvar.next9 = add i64 %indvar8, 1
  %exitcond = icmp eq i64 %indvar.next9, 80
  br i1 %exitcond, label %for.end19, label %for.body11

for.end19:                                        ; preds = %for.body11
  tail call void @foo(i32 4)
  br label %for.cond20

for.cond20:                                       ; preds = %for.inc34, %for.end19
  %indvar = phi i64 [ %indvar.next, %for.inc34 ], [ 0, %for.end19 ]
  %storemerge2 = trunc i64 %indvar to i32
  %cmp22 = icmp slt i32 %storemerge2, 20
  br i1 %cmp22, label %for.body24, label %return

for.body24:                                       ; preds = %for.cond20
  %tmp = mul i64 %indvar, 20
  %arrayidx27 = getelementptr [20 x float]* @results, i64 0, i64 %indvar
  %mul30 = trunc i64 %tmp to i32
  %tmp28 = load float* %arrayidx27, align 4
  %div = sdiv i32 %mul30, 2
  %conv31 = sitofp i32 %div to float
  %cmp32 = fcmp une float %tmp28, %conv31
  br i1 %cmp32, label %return, label %for.inc34

for.inc34:                                        ; preds = %for.body24
  %indvar.next = add i64 %indvar, 1
  br label %for.cond20

return:                                           ; preds = %for.cond20, %for.body24
  %storemerge3 = phi i32 [ 1, %for.body24 ], [ 0, %for.cond20 ]
  ret i32 %storemerge3
}
