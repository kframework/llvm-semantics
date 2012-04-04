; ModuleID = '/home/david/src/c-semantics/tests/lcc-tests/spill.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = common global i32 0, align 4
@a = common global [10 x double] zeroinitializer, align 16
@b = common global [10 x double] zeroinitializer, align 16
@k = common global i32 0, align 4
@m = common global i32 0, align 4
@A = common global double* null, align 8
@j = common global i32 0, align 4
@n = common global i32 0, align 4
@B = common global double* null, align 8
@x = common global double 0.000000e+00, align 8

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @f() nounwind uwtable readnone {
entry:
  ret i32 undef
}

define void @f2(i32 %i) nounwind uwtable readnone {
entry:
  ret void
}

define void @f3(i32 %i, i32* nocapture %p) nounwind uwtable {
entry:
  store i32 0, i32* %p, align 4, !tbaa !0
  ret void
}

define void @f4() nounwind uwtable {
entry:
  %0 = load i32* @i, align 4, !tbaa !0
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [10 x double]* @a, i64 0, i64 %idxprom
  %1 = load double* %arrayidx, align 8, !tbaa !3
  %arrayidx2 = getelementptr inbounds [10 x double]* @b, i64 0, i64 %idxprom
  %2 = load double* %arrayidx2, align 8, !tbaa !3
  %add = fadd double %1, %2
  %tobool = fcmp une double %add, 0.000000e+00
  %tobool3 = icmp ne i32 %0, 0
  %or.cond = and i1 %tobool, %tobool3
  br i1 %or.cond, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %sub = fsub double %1, %2
  %tobool8 = fcmp une double %sub, 0.000000e+00
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %3 = phi i1 [ false, %entry ], [ %tobool8, %land.rhs ]
  %land.ext = zext i1 %3 to i32
  store i32 %land.ext, i32* @i, align 4, !tbaa !0
  ret void
}

define void @f5() nounwind uwtable {
entry:
  %0 = load i32* @k, align 4, !tbaa !0
  %1 = load i32* @m, align 4, !tbaa !0
  %mul = mul nsw i32 %1, %0
  %idxprom = sext i32 %mul to i64
  %2 = load double** @A, align 8, !tbaa !4
  %arrayidx = getelementptr inbounds double* %2, i64 %idxprom
  %3 = load double* %arrayidx, align 8, !tbaa !3
  %4 = load i32* @j, align 4, !tbaa !0
  %mul1 = mul nsw i32 %4, %1
  %idxprom2 = sext i32 %mul1 to i64
  %arrayidx3 = getelementptr inbounds double* %2, i64 %idxprom2
  %5 = load double* %arrayidx3, align 8, !tbaa !3
  %mul4 = fmul double %3, %5
  %6 = load i32* @n, align 4, !tbaa !0
  %mul5 = mul nsw i32 %6, %0
  %idxprom6 = sext i32 %mul5 to i64
  %7 = load double** @B, align 8, !tbaa !4
  %arrayidx7 = getelementptr inbounds double* %7, i64 %idxprom6
  %8 = load double* %arrayidx7, align 8, !tbaa !3
  %mul8 = mul nsw i32 %6, %4
  %idxprom9 = sext i32 %mul8 to i64
  %arrayidx10 = getelementptr inbounds double* %7, i64 %idxprom9
  %9 = load double* %arrayidx10, align 8, !tbaa !3
  %mul11 = fmul double %8, %9
  %add = fadd double %mul4, %mul11
  store double %add, double* @x, align 8, !tbaa !3
  %10 = load double* %arrayidx, align 8, !tbaa !3
  %11 = load double* %arrayidx10, align 8, !tbaa !3
  %mul18 = fmul double %10, %11
  %12 = load double* %arrayidx7, align 8, !tbaa !3
  %13 = load double* %arrayidx3, align 8, !tbaa !3
  %mul25 = fmul double %12, %13
  %sub = fsub double %mul18, %mul25
  store double %sub, double* @x, align 8, !tbaa !3
  ret void
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"double", metadata !1}
!4 = metadata !{metadata !"any pointer", metadata !1}
