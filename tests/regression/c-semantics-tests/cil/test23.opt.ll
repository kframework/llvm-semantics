; ModuleID = '/home/david/src/c-semantics/tests/cil/test23.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [4 x i32] [i32 0, i32 4, i32 7, i32 -1], align 16
@.str = private unnamed_addr constant [22 x i8] c"hello world %d %d %d\0A\00", align 1

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %0 = load i32* getelementptr inbounds ([4 x i32]* @a, i64 0, i64 1), align 4, !tbaa !0
  %1 = load i64* bitcast (i32* getelementptr inbounds ([4 x i32]* @a, i64 0, i64 2) to i64*), align 8
  %2 = trunc i64 %1 to i32
  %3 = lshr i64 %1, 32
  %4 = trunc i64 %3 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str, i64 0, i64 0), i32 %0, i32 %2, i32 %4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
