; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000801-4.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@t = common global i8* null, align 8

define i32 @foo() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %s = alloca i16, align 2
  store i16 120, i16* %s, align 2
  %arraydecay = bitcast i16* %s to i8*
  store i8* %arraydecay, i8** @t, align 8, !tbaa !0
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
