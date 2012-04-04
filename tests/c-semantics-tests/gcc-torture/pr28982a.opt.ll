; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr28982a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@incs = common global [20 x i32] zeroinitializer, align 16
@ptrs = common global [20 x float*] zeroinitializer, align 16
@results = common global [20 x float] zeroinitializer, align 16
@input = common global [80 x float] zeroinitializer, align 16

define void @foo(i32 %n) nounwind uwtable noinline {
entry:
  %tobool58 = icmp eq i32 %n, 0
  br i1 %tobool58, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %0 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 19), align 8, !tbaa !0
  %1 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 18), align 16, !tbaa !0
  %2 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 17), align 8, !tbaa !0
  %3 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 16), align 16, !tbaa !0
  %4 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 15), align 8, !tbaa !0
  %5 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 14), align 16, !tbaa !0
  %6 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 13), align 8, !tbaa !0
  %7 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 12), align 16, !tbaa !0
  %8 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 11), align 8, !tbaa !0
  %9 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 10), align 16, !tbaa !0
  %10 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 9), align 8, !tbaa !0
  %11 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 8), align 16, !tbaa !0
  %12 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 7), align 8, !tbaa !0
  %13 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 6), align 16, !tbaa !0
  %14 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 5), align 8, !tbaa !0
  %15 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 4), align 16, !tbaa !0
  %16 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 3), align 8, !tbaa !0
  %17 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 2), align 16, !tbaa !0
  %18 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 1), align 8, !tbaa !0
  %19 = load float** getelementptr inbounds ([20 x float*]* @ptrs, i64 0, i64 0), align 16, !tbaa !0
  %20 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 19), align 4, !tbaa !3
  %21 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 18), align 8, !tbaa !3
  %22 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 17), align 4, !tbaa !3
  %23 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 16), align 16, !tbaa !3
  %24 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 15), align 4, !tbaa !3
  %25 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 14), align 8, !tbaa !3
  %26 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 13), align 4, !tbaa !3
  %27 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 12), align 16, !tbaa !3
  %28 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 11), align 4, !tbaa !3
  %29 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 10), align 8, !tbaa !3
  %30 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 9), align 4, !tbaa !3
  %31 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 8), align 16, !tbaa !3
  %32 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 7), align 4, !tbaa !3
  %33 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 6), align 8, !tbaa !3
  %34 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 5), align 4, !tbaa !3
  %35 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 4), align 16, !tbaa !3
  %36 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 3), align 4, !tbaa !3
  %37 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 2), align 8, !tbaa !3
  %38 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 1), align 4, !tbaa !3
  %39 = load i32* getelementptr inbounds ([20 x i32]* @incs, i64 0, i64 0), align 16, !tbaa !3
  %idx.ext = sext i32 %39 to i64
  %idx.ext2 = sext i32 %38 to i64
  %idx.ext5 = sext i32 %37 to i64
  %idx.ext8 = sext i32 %36 to i64
  %idx.ext11 = sext i32 %35 to i64
  %idx.ext14 = sext i32 %34 to i64
  %idx.ext17 = sext i32 %33 to i64
  %idx.ext20 = sext i32 %32 to i64
  %idx.ext23 = sext i32 %31 to i64
  %idx.ext26 = sext i32 %30 to i64
  %idx.ext29 = sext i32 %29 to i64
  %idx.ext32 = sext i32 %28 to i64
  %idx.ext35 = sext i32 %27 to i64
  %idx.ext38 = sext i32 %26 to i64
  %idx.ext41 = sext i32 %25 to i64
  %idx.ext44 = sext i32 %24 to i64
  %idx.ext47 = sext i32 %23 to i64
  %idx.ext50 = sext i32 %22 to i64
  %idx.ext53 = sext i32 %21 to i64
  %idx.ext56 = sext i32 %20 to i64
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %n.addr.099 = phi i32 [ %n, %while.body.lr.ph ], [ %dec, %while.body ]
  %result19.098 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add55, %while.body ]
  %ptr19.097 = phi float* [ %0, %while.body.lr.ph ], [ %add.ptr57, %while.body ]
  %result18.096 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add52, %while.body ]
  %ptr18.095 = phi float* [ %1, %while.body.lr.ph ], [ %add.ptr54, %while.body ]
  %result17.094 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add49, %while.body ]
  %ptr17.093 = phi float* [ %2, %while.body.lr.ph ], [ %add.ptr51, %while.body ]
  %result16.092 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add46, %while.body ]
  %ptr16.091 = phi float* [ %3, %while.body.lr.ph ], [ %add.ptr48, %while.body ]
  %result15.090 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add43, %while.body ]
  %ptr15.089 = phi float* [ %4, %while.body.lr.ph ], [ %add.ptr45, %while.body ]
  %result14.088 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add40, %while.body ]
  %ptr14.087 = phi float* [ %5, %while.body.lr.ph ], [ %add.ptr42, %while.body ]
  %result13.086 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add37, %while.body ]
  %ptr13.085 = phi float* [ %6, %while.body.lr.ph ], [ %add.ptr39, %while.body ]
  %result12.084 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add34, %while.body ]
  %ptr12.083 = phi float* [ %7, %while.body.lr.ph ], [ %add.ptr36, %while.body ]
  %result11.082 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add31, %while.body ]
  %ptr11.081 = phi float* [ %8, %while.body.lr.ph ], [ %add.ptr33, %while.body ]
  %result10.080 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add28, %while.body ]
  %ptr10.079 = phi float* [ %9, %while.body.lr.ph ], [ %add.ptr30, %while.body ]
  %ptr0.078 = phi float* [ %19, %while.body.lr.ph ], [ %add.ptr, %while.body ]
  %result0.077 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add, %while.body ]
  %ptr1.076 = phi float* [ %18, %while.body.lr.ph ], [ %add.ptr3, %while.body ]
  %result1.075 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add1, %while.body ]
  %ptr2.074 = phi float* [ %17, %while.body.lr.ph ], [ %add.ptr6, %while.body ]
  %result2.073 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add4, %while.body ]
  %ptr3.072 = phi float* [ %16, %while.body.lr.ph ], [ %add.ptr9, %while.body ]
  %result3.071 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add7, %while.body ]
  %ptr4.070 = phi float* [ %15, %while.body.lr.ph ], [ %add.ptr12, %while.body ]
  %result4.069 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add10, %while.body ]
  %ptr5.068 = phi float* [ %14, %while.body.lr.ph ], [ %add.ptr15, %while.body ]
  %result5.067 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add13, %while.body ]
  %ptr6.066 = phi float* [ %13, %while.body.lr.ph ], [ %add.ptr18, %while.body ]
  %result6.065 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add16, %while.body ]
  %ptr7.064 = phi float* [ %12, %while.body.lr.ph ], [ %add.ptr21, %while.body ]
  %result7.063 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add19, %while.body ]
  %ptr8.062 = phi float* [ %11, %while.body.lr.ph ], [ %add.ptr24, %while.body ]
  %result8.061 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add22, %while.body ]
  %ptr9.060 = phi float* [ %10, %while.body.lr.ph ], [ %add.ptr27, %while.body ]
  %result9.059 = phi float [ 0.000000e+00, %while.body.lr.ph ], [ %add25, %while.body ]
  %dec = add nsw i32 %n.addr.099, -1
  %40 = load float* %ptr0.078, align 4, !tbaa !4
  %add = fadd float %result0.077, %40
  %add.ptr = getelementptr inbounds float* %ptr0.078, i64 %idx.ext
  %41 = load float* %ptr1.076, align 4, !tbaa !4
  %add1 = fadd float %result1.075, %41
  %add.ptr3 = getelementptr inbounds float* %ptr1.076, i64 %idx.ext2
  %42 = load float* %ptr2.074, align 4, !tbaa !4
  %add4 = fadd float %result2.073, %42
  %add.ptr6 = getelementptr inbounds float* %ptr2.074, i64 %idx.ext5
  %43 = load float* %ptr3.072, align 4, !tbaa !4
  %add7 = fadd float %result3.071, %43
  %add.ptr9 = getelementptr inbounds float* %ptr3.072, i64 %idx.ext8
  %44 = load float* %ptr4.070, align 4, !tbaa !4
  %add10 = fadd float %result4.069, %44
  %add.ptr12 = getelementptr inbounds float* %ptr4.070, i64 %idx.ext11
  %45 = load float* %ptr5.068, align 4, !tbaa !4
  %add13 = fadd float %result5.067, %45
  %add.ptr15 = getelementptr inbounds float* %ptr5.068, i64 %idx.ext14
  %46 = load float* %ptr6.066, align 4, !tbaa !4
  %add16 = fadd float %result6.065, %46
  %add.ptr18 = getelementptr inbounds float* %ptr6.066, i64 %idx.ext17
  %47 = load float* %ptr7.064, align 4, !tbaa !4
  %add19 = fadd float %result7.063, %47
  %add.ptr21 = getelementptr inbounds float* %ptr7.064, i64 %idx.ext20
  %48 = load float* %ptr8.062, align 4, !tbaa !4
  %add22 = fadd float %result8.061, %48
  %add.ptr24 = getelementptr inbounds float* %ptr8.062, i64 %idx.ext23
  %49 = load float* %ptr9.060, align 4, !tbaa !4
  %add25 = fadd float %result9.059, %49
  %add.ptr27 = getelementptr inbounds float* %ptr9.060, i64 %idx.ext26
  %50 = load float* %ptr10.079, align 4, !tbaa !4
  %add28 = fadd float %result10.080, %50
  %add.ptr30 = getelementptr inbounds float* %ptr10.079, i64 %idx.ext29
  %51 = load float* %ptr11.081, align 4, !tbaa !4
  %add31 = fadd float %result11.082, %51
  %add.ptr33 = getelementptr inbounds float* %ptr11.081, i64 %idx.ext32
  %52 = load float* %ptr12.083, align 4, !tbaa !4
  %add34 = fadd float %result12.084, %52
  %add.ptr36 = getelementptr inbounds float* %ptr12.083, i64 %idx.ext35
  %53 = load float* %ptr13.085, align 4, !tbaa !4
  %add37 = fadd float %result13.086, %53
  %add.ptr39 = getelementptr inbounds float* %ptr13.085, i64 %idx.ext38
  %54 = load float* %ptr14.087, align 4, !tbaa !4
  %add40 = fadd float %result14.088, %54
  %add.ptr42 = getelementptr inbounds float* %ptr14.087, i64 %idx.ext41
  %55 = load float* %ptr15.089, align 4, !tbaa !4
  %add43 = fadd float %result15.090, %55
  %add.ptr45 = getelementptr inbounds float* %ptr15.089, i64 %idx.ext44
  %56 = load float* %ptr16.091, align 4, !tbaa !4
  %add46 = fadd float %result16.092, %56
  %add.ptr48 = getelementptr inbounds float* %ptr16.091, i64 %idx.ext47
  %57 = load float* %ptr17.093, align 4, !tbaa !4
  %add49 = fadd float %result17.094, %57
  %add.ptr51 = getelementptr inbounds float* %ptr17.093, i64 %idx.ext50
  %58 = load float* %ptr18.095, align 4, !tbaa !4
  %add52 = fadd float %result18.096, %58
  %add.ptr54 = getelementptr inbounds float* %ptr18.095, i64 %idx.ext53
  %59 = load float* %ptr19.097, align 4, !tbaa !4
  %add55 = fadd float %result19.098, %59
  %add.ptr57 = getelementptr inbounds float* %ptr19.097, i64 %idx.ext56
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  %result19.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add55, %while.body ]
  %result18.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add52, %while.body ]
  %result17.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add49, %while.body ]
  %result16.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add46, %while.body ]
  %result15.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add43, %while.body ]
  %result14.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add40, %while.body ]
  %result13.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add37, %while.body ]
  %result12.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add34, %while.body ]
  %result11.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add31, %while.body ]
  %result10.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add28, %while.body ]
  %result0.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add, %while.body ]
  %result1.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add1, %while.body ]
  %result2.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add4, %while.body ]
  %result3.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add7, %while.body ]
  %result4.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add10, %while.body ]
  %result5.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add13, %while.body ]
  %result6.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add16, %while.body ]
  %result7.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add19, %while.body ]
  %result8.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add22, %while.body ]
  %result9.0.lcssa = phi float [ 0.000000e+00, %entry ], [ %add25, %while.body ]
  store float %result0.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 0), align 16, !tbaa !4
  store float %result1.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 1), align 4, !tbaa !4
  store float %result2.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 2), align 8, !tbaa !4
  store float %result3.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 3), align 4, !tbaa !4
  store float %result4.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 4), align 16, !tbaa !4
  store float %result5.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 5), align 4, !tbaa !4
  store float %result6.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 6), align 8, !tbaa !4
  store float %result7.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 7), align 4, !tbaa !4
  store float %result8.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 8), align 16, !tbaa !4
  store float %result9.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 9), align 4, !tbaa !4
  store float %result10.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 10), align 8, !tbaa !4
  store float %result11.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 11), align 4, !tbaa !4
  store float %result12.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 12), align 16, !tbaa !4
  store float %result13.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 13), align 4, !tbaa !4
  store float %result14.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 14), align 8, !tbaa !4
  store float %result15.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 15), align 4, !tbaa !4
  store float %result16.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 16), align 16, !tbaa !4
  store float %result17.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 17), align 4, !tbaa !4
  store float %result18.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 18), align 8, !tbaa !4
  store float %result19.0.lcssa, float* getelementptr inbounds ([20 x float]* @results, i64 0, i64 19), align 4, !tbaa !4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv29 = phi i64 [ 0, %entry ], [ %indvars.iv.next30, %for.body ]
  %add.ptr = getelementptr inbounds [80 x float]* @input, i64 0, i64 %indvars.iv29
  %arrayidx = getelementptr inbounds [20 x float*]* @ptrs, i64 0, i64 %indvars.iv29
  store float* %add.ptr, float** %arrayidx, align 8, !tbaa !0
  %arrayidx2 = getelementptr inbounds [20 x i32]* @incs, i64 0, i64 %indvars.iv29
  %0 = trunc i64 %indvars.iv29 to i32
  store i32 %0, i32* %arrayidx2, align 4, !tbaa !3
  %indvars.iv.next30 = add i64 %indvars.iv29, 1
  %lftr.wideiv31 = trunc i64 %indvars.iv.next30 to i32
  %exitcond32 = icmp eq i32 %lftr.wideiv31, 20
  br i1 %exitcond32, label %for.body5, label %for.body

for.body5:                                        ; preds = %for.body, %for.body5
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.body5 ], [ 0, %for.body ]
  %1 = trunc i64 %indvars.iv27 to i32
  %conv = sitofp i32 %1 to float
  %arrayidx7 = getelementptr inbounds [80 x float]* @input, i64 0, i64 %indvars.iv27
  store float %conv, float* %arrayidx7, align 4, !tbaa !4
  %indvars.iv.next28 = add i64 %indvars.iv27, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next28 to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 80
  br i1 %exitcond, label %for.end10, label %for.body5

for.end10:                                        ; preds = %for.body5
  tail call void @foo(i32 4)
  br label %for.cond11

for.cond11:                                       ; preds = %for.body14, %for.end10
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body14 ], [ 0, %for.end10 ]
  %2 = trunc i64 %indvars.iv to i32
  %cmp12 = icmp slt i32 %2, 20
  br i1 %cmp12, label %for.body14, label %return

for.body14:                                       ; preds = %for.cond11
  %arrayidx16 = getelementptr inbounds [20 x float]* @results, i64 0, i64 %indvars.iv
  %3 = load float* %arrayidx16, align 4, !tbaa !4
  %4 = mul i64 %indvars.iv, 20
  %5 = trunc i64 %4 to i32
  %div = sdiv i32 %5, 2
  %conv18 = sitofp i32 %div to float
  %cmp19 = fcmp une float %3, %conv18
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp19, label %return, label %for.cond11

return:                                           ; preds = %for.cond11, %for.body14
  %retval.0 = phi i32 [ 1, %for.body14 ], [ 0, %for.cond11 ]
  ret i32 %retval.0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
!4 = metadata !{metadata !"float", metadata !1}
