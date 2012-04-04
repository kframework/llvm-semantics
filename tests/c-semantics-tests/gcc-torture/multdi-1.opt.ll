; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/multdi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@mpy_res = common global i64 0, align 8

define i64 @mpy(i64 %a, i64 %b) nounwind uwtable readnone {
entry:
  %mul = mul i64 %b, %a
  ret i64 %mul
}

define i32 @main() nounwind uwtable {
if.end:
  store i64 -1, i64* @mpy_res, align 8, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
