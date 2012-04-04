; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j058b.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, i32 }

@a = global %struct.anon { i32 0, i32 1 }, align 4
@p = global i32* getelementptr inbounds (%struct.anon* @a, i64 0, i32 0), align 8
@x = common global i32 0, align 4
@y = common global i32 0, align 4

define i32 @main() nounwind uwtable readonly {
entry:
  %0 = load i32** @p, align 8, !tbaa !0
  %1 = load i32* %0, align 4, !tbaa !3
  ret i32 %1
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
