; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20051104-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, i8* }

@s = common global %struct.anon zeroinitializer, align 8
@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define i32 @main() nounwind uwtable {
if.end:
  store i32 0, i32* getelementptr inbounds (%struct.anon* @s, i64 0, i32 0), align 8, !tbaa !0
  store i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8** getelementptr inbounds (%struct.anon* @s, i64 0, i32 1), align 8, !tbaa !3
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
