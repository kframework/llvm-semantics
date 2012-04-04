; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000801-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { %struct.foo* }

define %struct.foo* @test(%struct.foo* %node) nounwind uwtable readonly {
entry:
  %tobool4 = icmp eq %struct.foo* %node, null
  br i1 %tobool4, label %while.end, label %while.body

while.body:                                       ; preds = %entry, %while.body
  %node.addr.05 = phi %struct.foo* [ %0, %while.body ], [ %node, %entry ]
  %next = getelementptr inbounds %struct.foo* %node.addr.05, i64 0, i32 0
  %0 = load %struct.foo** %next, align 8, !tbaa !0
  %tobool = icmp eq %struct.foo* %0, null
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  ret %struct.foo* null
}

define i32 @bar() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @baz() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %a.0 = alloca %struct.foo*, align 8
  %0 = bitcast %struct.foo** %a.0 to %struct.foo*
  %b = alloca %struct.foo, align 8
  store %struct.foo* %b, %struct.foo** %a.0, align 8, !tbaa !0
  %next1 = getelementptr inbounds %struct.foo* %b, i64 0, i32 0
  store %struct.foo* null, %struct.foo** %next1, align 8, !tbaa !0
  br label %while.body.i

while.body.i:                                     ; preds = %while.body.i, %entry
  %node.addr.05.i = phi %struct.foo* [ %1, %while.body.i ], [ %0, %entry ]
  %next.i = getelementptr inbounds %struct.foo* %node.addr.05.i, i64 0, i32 0
  %1 = load %struct.foo** %next.i, align 8, !tbaa !0
  %tobool.i = icmp eq %struct.foo* %1, null
  br i1 %tobool.i, label %if.end, label %while.body.i

if.end:                                           ; preds = %while.body.i
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
