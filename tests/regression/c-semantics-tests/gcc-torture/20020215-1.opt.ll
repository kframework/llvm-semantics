; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020215-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i16, i64, i16 }

define void @foo(%struct.s* noalias nocapture sret %agg.result, %struct.s* nocapture byval align 8 %s) nounwind uwtable {
entry:
  %i2 = getelementptr inbounds %struct.s* %s, i64 0, i32 1
  %0 = load i64* %i2, align 8, !tbaa !0
  %inc = add nsw i64 %0, 1
  store i64 %inc, i64* %i2, align 8, !tbaa !0
  %1 = bitcast %struct.s* %agg.result to i8*
  %2 = bitcast %struct.s* %s to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 24, i32 8, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
