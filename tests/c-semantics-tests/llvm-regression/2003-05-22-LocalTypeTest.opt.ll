; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/2003-05-22-LocalTypeTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.sometimes.1 = type { i16, i16, i16, i16 }

@Y = common global %struct.sometimes.1 zeroinitializer, align 2
@.str = private unnamed_addr constant [14 x i8] c"Result is %d\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %0 = load i16* getelementptr inbounds (%struct.sometimes.1* @Y, i64 0, i32 0), align 2, !tbaa !0
  %conv6 = sext i16 %0 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([14 x i8]* @.str, i64 0, i64 0), i32 %conv6) nounwind
  ret i32 %conv6
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
