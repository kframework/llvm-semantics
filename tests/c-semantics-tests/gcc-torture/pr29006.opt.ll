; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr29006.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type <{ i8, i64 }>

@main.s = private unnamed_addr constant %struct.s <{ i8 1, i64 -1 }>, align 1

define void @foo(%struct.s* nocapture %s) nounwind uwtable noinline {
entry:
  %x = getelementptr inbounds %struct.s* %s, i64 0, i32 1
  store i64 0, i64* %x, align 1, !tbaa !0
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %s = alloca %struct.s, align 1
  %0 = getelementptr inbounds %struct.s* %s, i64 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds (%struct.s* @main.s, i64 0, i32 0), i64 9, i32 1, i1 false)
  call void @foo(%struct.s* %s)
  %x = getelementptr inbounds %struct.s* %s, i64 0, i32 1
  %1 = load i64* %x, align 1, !tbaa !0
  %cmp = icmp ne i64 %1, 0
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
