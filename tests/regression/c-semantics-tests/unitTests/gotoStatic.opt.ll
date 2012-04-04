; ModuleID = '/home/david/src/c-semantics/tests/unitTests/gotoStatic.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@f.z = internal unnamed_addr global i32 0, align 4
@f.y = internal unnamed_addr global i32 0, align 4

define i32 @f() nounwind uwtable {
entry:
  %0 = load i32* @f.z, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @f.z, align 4, !tbaa !0
  %f.y.promoted = load i32* @f.y, align 4
  %1 = add i32 %f.y.promoted, 2
  store i32 %1, i32* @f.y, align 4
  %add = add nsw i32 %inc, %1
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @f.z, align 4, !tbaa !0
  %f.y.promoted.i = load i32* @f.y, align 4
  %inc.i4 = add nsw i32 %0, 4
  store i32 %inc.i4, i32* @f.z, align 4, !tbaa !0
  %1 = add i32 %f.y.promoted.i, 8
  store i32 %1, i32* @f.y, align 4
  %add.i6 = add nsw i32 %1, %inc.i4
  ret i32 %add.i6
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
