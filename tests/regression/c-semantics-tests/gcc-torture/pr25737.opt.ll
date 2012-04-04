; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr25737.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.delay_block = type { %struct.delay_block* }

@Timer_Queue = internal global %struct.delay_block zeroinitializer, align 8

define %struct.delay_block* @time_enqueue(%struct.delay_block* nocapture %d) nounwind uwtable {
entry:
  %succ = getelementptr inbounds %struct.delay_block* %d, i64 0, i32 0
  store %struct.delay_block* null, %struct.delay_block** %succ, align 8, !tbaa !0
  %0 = load %struct.delay_block** getelementptr inbounds (%struct.delay_block* @Timer_Queue, i64 0, i32 0), align 8, !tbaa !0
  ret %struct.delay_block* %0
}

define i32 @main() nounwind uwtable {
if.end:
  store %struct.delay_block* null, %struct.delay_block** getelementptr inbounds (%struct.delay_block* @Timer_Queue, i64 0, i32 0), align 8, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
