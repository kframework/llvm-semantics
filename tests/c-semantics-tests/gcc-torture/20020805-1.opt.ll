; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020805-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@n = global i32 1, align 4

define void @check(i32 %m) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %m, -1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* @n, align 4, !tbaa !0
  %sub = sub i32 2, %0
  %sub1 = sub i32 0, %0
  %or = or i32 %sub, %sub1
  %or2 = or i32 %or, 1
  %cmp.i = icmp eq i32 %or2, -1
  br i1 %cmp.i, label %check.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

check.exit:                                       ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
