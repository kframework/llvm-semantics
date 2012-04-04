; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001228-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon.0 = type { i32 }

define i32 @foo1() nounwind uwtable readnone {
entry:
  ret i32 1
}

define i32 @foo2() nounwind uwtable {
entry:
  %u = alloca %union.anon.0, align 4
  %b = getelementptr inbounds %union.anon.0* %u, i64 0, i32 0
  store volatile i32 1, i32* %b, align 4, !tbaa !0
  %arrayidx = bitcast %union.anon.0* %u to i8*
  %0 = load volatile i8* %arrayidx, align 4, !tbaa !1
  %conv = sext i8 %0 to i32
  ret i32 %conv
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %u.i = alloca %union.anon.0, align 4
  %0 = bitcast %union.anon.0* %u.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0)
  %b.i = getelementptr inbounds %union.anon.0* %u.i, i64 0, i32 0
  store volatile i32 1, i32* %b.i, align 4, !tbaa !0
  %1 = load volatile i8* %0, align 4, !tbaa !1
  call void @llvm.lifetime.end(i64 -1, i8* %0)
  %cmp = icmp eq i8 %1, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
