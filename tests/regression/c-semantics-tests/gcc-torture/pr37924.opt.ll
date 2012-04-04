; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr37924.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global i8 0, align 1
@b = common global i8 0, align 1

define i32 @test1() nounwind uwtable readonly {
entry:
  %0 = load i8* @a, align 1, !tbaa !0
  %conv = sext i8 %0 to i32
  %xor = lshr i32 %conv, 9
  %shr = xor i32 %xor, 8388607
  ret i32 %shr
}

define i32 @test2() nounwind uwtable readnone {
entry:
  ret i32 8388607
}

define i32 @main() nounwind uwtable {
if.end41:
  store i8 -1, i8* @a, align 1, !tbaa !0
  store i8 -1, i8* @b, align 1, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
