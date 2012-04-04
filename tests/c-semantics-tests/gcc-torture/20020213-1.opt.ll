; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020213-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { float, i32 }

@a = common global %struct.A zeroinitializer, align 4
@b = common global i32 0, align 4

define void @foo() nounwind uwtable {
entry:
  %0 = load i32* @b, align 4, !tbaa !0
  %sub = add nsw i32 %0, -1
  %cmp = icmp sgt i32 %sub, 2241
  %.sub = select i1 %cmp, i32 2241, i32 %sub
  store i32 %.sub, i32* getelementptr inbounds (%struct.A* @a, i64 0, i32 1), align 4, !tbaa !0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define i32 @bar(float %x) nounwind uwtable readnone {
entry:
  ret i32 2241
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
foo.exit:
  store float 1.000000e+00, float* getelementptr inbounds (%struct.A* @a, i64 0, i32 0), align 4, !tbaa !3
  store i32 3384, i32* @b, align 4, !tbaa !0
  store i32 2241, i32* getelementptr inbounds (%struct.A* @a, i64 0, i32 1), align 4, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"float", metadata !1}
