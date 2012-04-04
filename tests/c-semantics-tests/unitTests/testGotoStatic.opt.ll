; ModuleID = '/home/david/src/c-semantics/tests/unitTests/testGotoStatic.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@f.staticInt = internal unnamed_addr global i32 0, align 4

define i32 @f(i32 %x) nounwind uwtable {
entry:
  %0 = load i32* @f.staticInt, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @f.staticInt, align 4, !tbaa !0
  ret i32 %inc
}

define i32 @main() nounwind uwtable {
entry:
  %f.staticInt.promoted = load i32* @f.staticInt, align 4
  %0 = add i32 %f.staticInt.promoted, 10
  store i32 %0, i32* @f.staticInt, align 4
  ret i32 %0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
