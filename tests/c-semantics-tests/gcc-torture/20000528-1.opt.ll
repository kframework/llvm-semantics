; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000528-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@l = global i64 -2, align 8
@s = common global i16 0, align 2

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i64* @l, align 8, !tbaa !0
  %conv = trunc i64 %0 to i16
  store i16 %conv, i16* @s, align 2, !tbaa !3
  %conv1 = and i64 %0, 65535
  %cmp = icmp eq i64 %conv1, 65534
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"short", metadata !1}
