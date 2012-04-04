; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980617-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32* nocapture %p) nounwind uwtable {
entry:
  %0 = load i32* %p, align 4, !tbaa !0
  %sext = shl i32 %0, 24
  %conv1 = ashr exact i32 %sext, 24
  %conv1.off = add i32 %conv1, -17
  %switch = icmp ult i32 %conv1.off, 2
  br i1 %switch, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  ret void

if.else:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
foo.exit:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
