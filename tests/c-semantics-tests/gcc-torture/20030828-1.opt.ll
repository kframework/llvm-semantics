; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030828-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@p = common global i32* null, align 8

define i32 @bar() nounwind uwtable readonly {
entry:
  %0 = load i32** @p, align 8, !tbaa !0
  %1 = load i32* %0, align 4, !tbaa !3
  %add = add nsw i32 %1, 1
  ret i32 %add
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %i = alloca i32, align 4
  store i32 5, i32* %i, align 4, !tbaa !3
  store i32* %i, i32** @p, align 8, !tbaa !0
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
