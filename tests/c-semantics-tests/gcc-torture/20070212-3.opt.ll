; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20070212-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { i32, i32 }

define i32 @bar(%struct.foo* nocapture %k, i32 %k2, i32 %f, i32 %f2) nounwind uwtable {
entry:
  %tobool = icmp eq i32 %f, 0
  %i = getelementptr inbounds %struct.foo* %k, i64 0, i32 0
  %j = getelementptr inbounds %struct.foo* %k, i64 0, i32 1
  %p.0 = select i1 %tobool, i32* %j, i32* %i
  %0 = load i32* %p.0, align 4, !tbaa !0
  store i32 1, i32* %i, align 4, !tbaa !0
  %tobool2 = icmp eq i32 %f2, 0
  br i1 %tobool2, label %if.end5, label %if.then3

if.then3:                                         ; preds = %entry
  %q.0.if.then3 = load i32* %p.0, align 4, !tbaa !0
  br label %if.end5

if.end5:                                          ; preds = %entry, %if.then3
  %q.0.ld = phi i32 [ %q.0.if.then3, %if.then3 ], [ %k2, %entry ]
  %add = add nsw i32 %q.0.ld, %0
  ret i32 %add
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
