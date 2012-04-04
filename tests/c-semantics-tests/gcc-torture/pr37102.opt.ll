; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr37102.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b = global i32 1, align 4
@c = common global i32 0, align 4
@a = common global i32 0, align 4

define void @foo(i32 %x) nounwind uwtable noinline {
entry:
  %cmp = icmp eq i32 %x, 5
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @c, align 4, !tbaa !0
  %tobool = icmp eq i32 %0, 0
  %1 = load i32* @b, align 4, !tbaa !0
  br i1 %tobool, label %for.end, label %for.inc.3

for.end:                                          ; preds = %entry, %for.inc.3
  store i32 %1, i32* @a, align 4, !tbaa !0
  %shl.mask = and i32 %1, 2147483647
  %tobool1 = icmp eq i32 %shl.mask, 0
  br i1 %tobool1, label %if.end4, label %if.then2

if.then2:                                         ; preds = %for.end
  %shl3 = shl i32 %1, 2
  %xor5 = or i32 %shl3, 1
  br label %if.end4

if.end4:                                          ; preds = %for.end, %if.then2
  %e.0 = phi i32 [ %xor5, %if.then2 ], [ 0, %for.end ]
  tail call void @foo(i32 %e.0)
  ret i32 0

for.inc.3:                                        ; preds = %entry
  store i32 %1, i32* @a, align 4, !tbaa !0
  br label %for.end
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
