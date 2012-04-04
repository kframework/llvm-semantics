; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr38236.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.X = type { i32 }

define i32 @foo(%struct.X* nocapture %p, i32* nocapture %q, i32 %a, i32 %b) nounwind uwtable readonly noinline {
entry:
  %x.0 = alloca i32, align 4
  %y.0 = alloca i32, align 4
  %tobool = icmp eq i32 %a, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %0 = bitcast i32* %x.0 to %struct.X*
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %p.addr.0 = phi %struct.X* [ %0, %if.then ], [ %p, %entry ]
  %tobool1 = icmp eq i32 %b, 0
  %y.0.x.0 = select i1 %tobool1, i32* %y.0, i32* %x.0
  store i32 1, i32* %y.0.x.0, align 4, !tbaa !0
  %i5 = getelementptr inbounds %struct.X* %p.addr.0, i64 0, i32 0
  %1 = load i32* %i5, align 4, !tbaa !0
  ret i32 %1
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @foo(%struct.X* null, i32* undef, i32 1, i32 1)
  %cmp = icmp eq i32 %call, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
