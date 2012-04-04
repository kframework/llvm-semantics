; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/enum-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@q = common global i32* null, align 8
@p = common global i32* null, align 8

define i32 @main() noreturn nounwind uwtable {
entry:
  %x = alloca i32, align 4
  store i32 -2147483648, i32* %x, align 4, !tbaa !0
  store i32* %x, i32** @q, align 8, !tbaa !3
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"_ZTS1e", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
