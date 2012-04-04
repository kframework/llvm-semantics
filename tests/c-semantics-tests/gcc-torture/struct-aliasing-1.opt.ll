; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/struct-aliasing-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { float }

define i32 @foo(i32* nocapture %r, %struct.S* nocapture %p) nounwind uwtable noinline {
entry:
  %0 = bitcast %struct.S* %p to i32*
  %1 = load i32* %0, align 4, !tbaa !0
  store i32 0, i32* %r, align 4, !tbaa !0
  %2 = load i32* %0, align 4, !tbaa !0
  %add = add nsw i32 %2, %1
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  store i32 1, i32* %i, align 4, !tbaa !0
  %0 = bitcast i32* %i to %struct.S*
  %call = call i32 @foo(i32* %i, %struct.S* %0)
  %cmp = icmp eq i32 %call, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
