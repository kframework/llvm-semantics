; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-10-13-BadLoad.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@window_size = global i64 65536, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @test() nounwind uwtable readonly {
entry:
  %0 = load i64* @window_size, align 8, !tbaa !0
  %conv = trunc i64 %0 to i32
  ret i32 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i64* @window_size, align 8, !tbaa !0
  %conv.i = trunc i64 %0 to i32
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %conv.i) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
