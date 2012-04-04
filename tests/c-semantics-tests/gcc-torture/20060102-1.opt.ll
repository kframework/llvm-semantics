; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060102-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@one = global i32 1, align 4

define i32 @f(i32 %x) nounwind uwtable readnone {
entry:
  %0 = ashr i32 %x, 31
  %1 = or i32 %0, 1
  ret i32 %1
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load volatile i32* @one, align 4, !tbaa !0
  %1 = ashr i32 %0, 31
  %2 = or i32 %1, 1
  %3 = load volatile i32* @one, align 4, !tbaa !0
  %sub = sub nsw i32 0, %3
  %4 = ashr i32 %sub, 31
  %5 = or i32 %4, 1
  %cmp = icmp eq i32 %2, %5
  br i1 %cmp, label %if.then, label %if.end

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
