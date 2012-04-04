; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20090623-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = common global i32* null, align 8

define i32 @foo(i32 %y) nounwind uwtable {
entry:
  %0 = load i32** @x, align 8, !tbaa !0
  store i32 %y, i32* %0, align 4, !tbaa !3
  ret i32 %y
}

define i32 @main() nounwind uwtable {
if.end:
  %i = alloca i32, align 4
  store i32* %i, i32** @x, align 8, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
