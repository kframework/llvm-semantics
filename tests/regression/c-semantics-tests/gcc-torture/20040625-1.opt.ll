; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040625-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type <{ %struct.s* }>

define %struct.s* @maybe_next(%struct.s* %s, i32 %t) nounwind uwtable readonly noinline {
entry:
  %tobool = icmp eq i32 %t, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %next = getelementptr inbounds %struct.s* %s, i64 0, i32 0
  %0 = load %struct.s** %next, align 1, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %s.addr.0 = phi %struct.s* [ %0, %if.then ], [ %s, %entry ]
  ret %struct.s* %s.addr.0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %s1 = alloca %struct.s, align 8
  %s2 = alloca %struct.s, align 1
  %next = getelementptr inbounds %struct.s* %s1, i64 0, i32 0
  store %struct.s* %s2, %struct.s** %next, align 8, !tbaa !0
  %call = call %struct.s* @maybe_next(%struct.s* %s1, i32 1)
  %cmp = icmp eq %struct.s* %call, %s2
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

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
