; ModuleID = '/home/david/src/c-semantics/tests/cil/test36.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.a = type { i32, i32 }

@z = common global %struct.a zeroinitializer, align 4
@.str = private unnamed_addr constant [19 x i8] c"hello world %d %d\0A\00", align 1

define i64 @g(i64 %b.coerce) nounwind uwtable readnone {
entry:
  %sroa.store.elt = and i64 %b.coerce, -4294967296
  %inc = add i64 %b.coerce, 1
  %0 = and i64 %inc, 4294967295
  %1 = or i64 %0, %sroa.store.elt
  ret i64 %1
}

define void @f() nounwind uwtable {
entry:
  %0 = load i64* bitcast (%struct.a* @z to i64*), align 4
  %sroa.store.elt.i = and i64 %0, -4294967296
  %inc.i = add i64 %0, 1
  %1 = and i64 %inc.i, 4294967295
  %2 = or i64 %1, %sroa.store.elt.i
  store i64 %2, i64* bitcast (%struct.a* @z to i64*), align 4
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  store i32 22, i32* getelementptr inbounds (%struct.a* @z, i64 0, i32 0), align 4, !tbaa !0
  %0 = load i64* bitcast (%struct.a* @z to i64*), align 4
  %sroa.store.elt.i.i = and i64 %0, -4294967296
  %inc.i.i = add i64 %0, 1
  %1 = and i64 %inc.i.i, 4294967295
  %2 = or i64 %1, %sroa.store.elt.i.i
  store i64 %2, i64* bitcast (%struct.a* @z to i64*), align 4
  %trunc = trunc i64 %inc.i.i to i32
  %3 = lshr i64 %0, 32
  %4 = trunc i64 %3 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str, i64 0, i64 0), i32 %trunc, i32 %4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
