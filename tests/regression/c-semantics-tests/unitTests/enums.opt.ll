; ModuleID = '/home/david/src/c-semantics/tests/unitTests/enums.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.globalStruct = type { i32 }

@var = common global i32 0, align 4
@aGlobalStruct = common global %struct.globalStruct zeroinitializer, align 4

define i32 @main() nounwind uwtable {
entry:
  store i32 21, i32* @var, align 4, !tbaa !0
  store i32 0, i32* getelementptr inbounds (%struct.globalStruct* @aGlobalStruct, i64 0, i32 0), align 4, !tbaa !3
  ret i32 0
}

!0 = metadata !{metadata !"_ZTS5e_tag", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
