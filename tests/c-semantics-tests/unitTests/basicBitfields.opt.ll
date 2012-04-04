; ModuleID = '/home/david/src/c-semantics/tests/unitTests/basicBitfields.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i8, i32 }

@s = common global %struct.anon zeroinitializer, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  store i32 7, i32* getelementptr inbounds (%struct.anon* @s, i64 0, i32 1), align 4, !tbaa !0
  %0 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %1 = and i32 %0, -64
  %2 = or i32 %1, 29
  store i32 %2, i32* bitcast (%struct.anon* @s to i32*), align 4
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 2) nounwind
  %3 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %bf.clear1 = and i32 %3, 1
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %bf.clear1) nounwind
  %4 = load i32* bitcast (%struct.anon* @s to i32*), align 4
  %5 = lshr i32 %4, 3
  %bf.clear3 = and i32 %5, 7
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %bf.clear3) nounwind
  %6 = load i32* getelementptr inbounds (%struct.anon* @s, i64 0, i32 1), align 4, !tbaa !0
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %6) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
