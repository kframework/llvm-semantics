; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr43783.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.UINT192 = type { [3 x i64] }

@bid_Kx192 = common global [32 x %struct.UINT192] zeroinitializer, align 16

define i32 @main() nounwind uwtable {
entry:
  br label %for.body

for.cond4.preheader:                              ; preds = %for.body
  %0 = load i64* getelementptr inbounds ([32 x %struct.UINT192]* @bid_Kx192, i64 0, i64 1, i32 0, i64 1), align 8, !tbaa !0
  %.mask = and i64 %0, 576460752303423487
  %cmp11 = icmp eq i64 %.mask, 1
  br i1 %cmp11, label %if.end, label %if.then

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %1 = trunc i64 %indvars.iv to i32
  %cmp1 = icmp eq i32 %1, 1
  %conv2 = zext i1 %cmp1 to i64
  %arrayidx3 = getelementptr inbounds [32 x %struct.UINT192]* @bid_Kx192, i64 0, i64 %indvars.iv, i32 0, i64 1
  store i64 %conv2, i64* %arrayidx3, align 8, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, 32
  br i1 %exitcond, label %for.cond4.preheader, label %for.body

if.then:                                          ; preds = %for.cond4.preheader
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.cond4.preheader
  ret i32 0
}

declare void @abort() noreturn

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
