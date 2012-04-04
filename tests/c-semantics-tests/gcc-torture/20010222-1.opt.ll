; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010222-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [2 x i32] [i32 18, i32 6], align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 0), align 4, !tbaa !0
  %1 = load i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 1), align 4, !tbaa !0
  %mul2 = add i32 %1, %0
  %sub = mul i32 %mul2, -3
  %sub.off = add i32 %sub, 83
  %2 = icmp ugt i32 %sub.off, 11
  br i1 %2, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
