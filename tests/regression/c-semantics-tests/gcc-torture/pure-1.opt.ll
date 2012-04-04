; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pure-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = global i32 2, align 4

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @func0(i32 %a) nounwind uwtable readonly {
entry:
  %0 = load i32* @i, align 4, !tbaa !0
  %sub = sub nsw i32 %a, %0
  ret i32 %sub
}

define i32 @func1(i32 %a) nounwind uwtable readnone {
entry:
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
