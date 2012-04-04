; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr36343.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @bar(i32** nocapture %p) nounwind uwtable noinline {
entry:
  %0 = bitcast i32** %p to float*
  store float 0.000000e+00, float* %0, align 4, !tbaa !0
  ret void
}

define float @foo(i32 %b) nounwind uwtable noinline {
entry:
  %i = alloca i32*, align 8
  %f = alloca float, align 4
  store i32* null, i32** %i, align 8, !tbaa !3
  store float 1.000000e+00, float* %f, align 4, !tbaa !0
  %tobool = icmp eq i32 %b, 0
  br i1 %tobool, label %if.end3, label %if.then2

if.then2:                                         ; preds = %entry
  call void @bar(i32** %i)
  %0 = load i32** %i, align 8, !tbaa !3
  %1 = load i32* %0, align 4, !tbaa !4
  %conv = sitofp i32 %1 to float
  br label %return

if.end3:                                          ; preds = %entry
  %2 = bitcast float* %f to i32**
  call void @bar(i32** %2)
  %3 = load float* %f, align 4, !tbaa !0
  br label %return

return:                                           ; preds = %if.end3, %if.then2
  %retval.0 = phi float [ %conv, %if.then2 ], [ %3, %if.end3 ]
  ret float %retval.0
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call float @foo(i32 0)
  %cmp = fcmp une float %call, 0.000000e+00
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"float", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
!4 = metadata !{metadata !"int", metadata !1}
