; ModuleID = '/home/david/src/c-semantics/tests/cil/test55.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fun = type { i32 }

@a = global %struct.fun { i32 32 }, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define void @pfun2(%struct.fun** nocapture %z) nounwind uwtable readnone {
entry:
  ret void
}

define void @pfun(%struct.fun* %z) nounwind uwtable {
entry:
  %x = getelementptr inbounds %struct.fun* %z, i64 0, i32 0
  %0 = load i32* %x, align 4, !tbaa !0
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %0) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %0 = load i32* getelementptr inbounds (%struct.fun* @a, i64 0, i32 0), align 4, !tbaa !0
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %0) nounwind
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
