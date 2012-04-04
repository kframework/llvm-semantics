; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr33142.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @lisp_atan2(i64 %dy, i64 %dx) nounwind uwtable readnone noinline {
entry:
  %cmp = icmp slt i64 %dx, 1
  %cmp1 = icmp sgt i64 %dy, 0
  %or.cond = and i1 %cmp, %cmp1
  br i1 %or.cond, label %if.then2, label %return

if.then2:                                         ; preds = %entry
  %conv = trunc i64 %dx to i32
  %ispos = icmp sgt i32 %conv, -1
  %neg = sub i32 0, %conv
  %call = select i1 %ispos, i32 %conv, i32 %neg
  %conv3 = trunc i64 %dy to i32
  %ispos8 = icmp sgt i32 %conv3, -1
  %neg9 = sub i32 0, %conv3
  %call4 = select i1 %ispos8, i32 %conv3, i32 %neg9
  %cmp5 = icmp sle i32 %call, %call4
  %conv6 = zext i1 %cmp5 to i32
  br label %return

return:                                           ; preds = %entry, %if.then2
  %retval.0 = phi i32 [ %conv6, %if.then2 ], [ 0, %entry ]
  ret i32 %retval.0
}

define i32 @main() nounwind uwtable {
entry:
  %dy = alloca i64, align 8
  %dx = alloca i64, align 8
  store volatile i64 63, i64* %dy, align 8, !tbaa !0
  store volatile i64 -77, i64* %dx, align 8, !tbaa !0
  %0 = load volatile i64* %dy, align 8, !tbaa !0
  %1 = load volatile i64* %dx, align 8, !tbaa !0
  %call = call i32 @lisp_atan2(i64 %0, i64 %1)
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
