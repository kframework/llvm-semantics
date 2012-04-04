; ModuleID = '/home/david/src/c-semantics/tests/shouldPass/funkyInit.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@words = global <{ { [1 x i32], [6 x i8], [2 x i8] } }> <{ { [1 x i32], [6 x i8], [2 x i8] } { [1 x i32] [i32 1], [6 x i8] c"foo\00\00\00", [2 x i8] undef } }>, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* getelementptr inbounds (<{ { [1 x i32], [6 x i8], [2 x i8] } }>* @words, i64 0, i32 0, i32 0, i64 0), align 4, !tbaa !0
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %0) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
