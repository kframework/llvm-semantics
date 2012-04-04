; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/longlong.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b = common global [32 x i64] zeroinitializer, align 16
@r = global i64* getelementptr inbounds ([32 x i64]* @b, i64 0, i64 0), align 8
@pars = common global i64 0, align 8

define void @alpha_ep_extbl_i_eq_0() nounwind uwtable {
entry:
  %0 = load i64* @pars, align 8, !tbaa !0
  %.tr = trunc i64 %0 to i32
  %conv10 = and i32 %.tr, 31
  %1 = load i64** @r, align 8, !tbaa !3
  %cmp = icmp eq i32 %conv10, 31
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %shr = lshr i64 %0, 27
  %conv = and i64 %shr, 31
  %arrayidx12 = getelementptr inbounds i64* %1, i64 %conv
  %shr2 = lshr i64 %0, 5
  %2 = load i64* %arrayidx12, align 8, !tbaa !4
  %and4 = and i64 %shr2, 31
  %and13 = shl i64 %2, 3
  %arrayidx = getelementptr inbounds i64* %1, i64 %and4
  %shl = and i64 %and13, 56
  %3 = load i64* %arrayidx, align 8, !tbaa !4
  %shr14 = lshr i64 %3, %shl
  %and15 = and i64 %shr14, 255
  %idxprom17 = zext i32 %conv10 to i64
  %arrayidx18 = getelementptr inbounds i64* %1, i64 %idxprom17
  store i64 %and15, i64* %arrayidx18, align 8, !tbaa !4
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  ret void
}

define i32 @main() noreturn nounwind uwtable {
alpha_ep_extbl_i_eq_0.exit:
  store i64 3160194, i64* getelementptr inbounds ([32 x i64]* @b, i64 0, i64 17), align 8, !tbaa !4
  store i64 6003104017374052362, i64* getelementptr inbounds ([32 x i64]* @b, i64 0, i64 2), align 16, !tbaa !4
  store i64 2281701442, i64* @pars, align 8, !tbaa !0
  %0 = load i64** @r, align 8, !tbaa !3
  %arrayidx12.i = getelementptr inbounds i64* %0, i64 17
  %1 = load i64* %arrayidx12.i, align 8, !tbaa !4
  %and13.i = shl i64 %1, 3
  %arrayidx.i = getelementptr inbounds i64* %0, i64 2
  %shl.i = and i64 %and13.i, 56
  %2 = load i64* %arrayidx.i, align 8, !tbaa !4
  %shr14.i = lshr i64 %2, %shl.i
  %and15.i = and i64 %shr14.i, 255
  store i64 %and15.i, i64* %arrayidx.i, align 8, !tbaa !4
  %3 = load i64* getelementptr inbounds ([32 x i64]* @b, i64 0, i64 2), align 16, !tbaa !4
  %cmp = icmp eq i64 %3, 77
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %alpha_ep_extbl_i_eq_0.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %alpha_ep_extbl_i_eq_0.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
!4 = metadata !{metadata !"long long", metadata !1}
