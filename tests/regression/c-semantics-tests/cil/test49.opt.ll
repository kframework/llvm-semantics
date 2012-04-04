; ModuleID = '/home/david/src/c-semantics/tests/cil/test49.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.fun = type { i32, i32 }

@d = common global %struct.fun zeroinitializer, align 4
@c = global %struct.fun* @d, align 8
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

define i32 @f() nounwind uwtable {
entry:
  %0 = load %struct.fun** @c, align 8, !tbaa !0
  %x = getelementptr inbounds %struct.fun* %0, i64 0, i32 0
  store i32 11, i32* %x, align 4, !tbaa !3
  store i32 12, i32* getelementptr inbounds (%struct.fun* @d, i64 0, i32 0), align 4, !tbaa !3
  %1 = load i32* %x, align 4, !tbaa !3
  %add = add nsw i32 %1, 12
  ret i32 %add
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %0 = load %struct.fun** @c, align 8, !tbaa !0
  %x.i = getelementptr inbounds %struct.fun* %0, i64 0, i32 0
  store i32 11, i32* %x.i, align 4, !tbaa !3
  store i32 12, i32* getelementptr inbounds (%struct.fun* @d, i64 0, i32 0), align 4, !tbaa !3
  %1 = load i32* %x.i, align 4, !tbaa !3
  %add.i = add nsw i32 %1, 12
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), i32 %add.i) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
