; ModuleID = '/home/david/src/c-semantics/tests/unitTests/reg-typeSizeof.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.qsortArgs = type { i32*, i32* }

@a = global [4 x i32] [i32 7, i32 5, i32 9, i32 10], align 16
@a1 = common global %struct.qsortArgs zeroinitializer, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d;\00", align 1

define i32 @main() nounwind uwtable {
entry:
  store i32* getelementptr inbounds ([4 x i32]* @a, i64 0, i64 0), i32** getelementptr inbounds (%struct.qsortArgs* @a1, i64 0, i32 0), align 8
  store i32* getelementptr inbounds ([4 x i32]* @a, i64 1, i64 0), i32** getelementptr inbounds (%struct.qsortArgs* @a1, i64 0, i32 1), align 8
  %0 = load i32* getelementptr inbounds ([4 x i32]* @a, i64 0, i64 0), align 16, !tbaa !0
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %0) nounwind
  %1 = load i32* getelementptr inbounds ([4 x i32]* @a, i64 0, i64 1), align 4, !tbaa !0
  %call.1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %1) nounwind
  %2 = load i32* getelementptr inbounds ([4 x i32]* @a, i64 0, i64 2), align 8, !tbaa !0
  %call.2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %2) nounwind
  %3 = load i32* getelementptr inbounds ([4 x i32]* @a, i64 0, i64 3), align 4, !tbaa !0
  %call.3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %3) nounwind
  %putchar = tail call i32 @putchar(i32 10) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i32 @putchar(i32)

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
