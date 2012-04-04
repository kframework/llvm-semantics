; ModuleID = '/home/david/src/c-semantics/tests/mustPass/j041a.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i32 (i32)*, i32 (i32)* }

@x = common global %struct.s zeroinitializer, align 8
@pf = common global i32 (i32)** null, align 8

define i32 @g(i32 %v) nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  store i32 (i32)* @g, i32 (i32)** getelementptr inbounds (%struct.s* @x, i64 0, i32 1), align 8, !tbaa !0
  store i32 (i32)** getelementptr inbounds (%struct.s* @x, i64 0, i32 1), i32 (i32)*** @pf, align 8, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
