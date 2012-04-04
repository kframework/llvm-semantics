; ModuleID = '/home/david/src/c-semantics/tests/clight-tests-unit/expr1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.list = type { i32, %struct.list* }

@.str = private unnamed_addr constant [21 x i8] c"VOLATILE Result: %p\0A\00", align 1

define noalias %struct.list* @f(%struct.list** nocapture %p) nounwind uwtable {
entry:
  %0 = load %struct.list** %p, align 8, !tbaa !0
  %tl = getelementptr inbounds %struct.list* %0, i64 0, i32 1
  store %struct.list* null, %struct.list** %tl, align 8, !tbaa !0
  ret %struct.list* null
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
if.end:
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), %struct.list* null) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
