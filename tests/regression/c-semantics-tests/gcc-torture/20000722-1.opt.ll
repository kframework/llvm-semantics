; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000722-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { i8*, i32 }

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define void @bar() nounwind uwtable {
foo.exit:
  ret void
}

declare void @exit(i32) noreturn nounwind

define void @foo(%struct.s* nocapture %p) nounwind uwtable {
entry:
  %t = getelementptr inbounds %struct.s* %p, i64 0, i32 1
  %0 = load i32* %t, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  store i32 2, i32* %t, align 4, !tbaa !0
  ret void
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
