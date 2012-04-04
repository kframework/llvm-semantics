; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20070517-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call fastcc i32 @get_kind() nounwind
  %call.off.i = add i32 %call.i, -9
  %0 = icmp ult i32 %call.off.i, 2
  %cmp4.not.i = icmp ne i32 %call.i, 5
  %brmerge.i = or i1 %0, %cmp4.not.i
  br i1 %brmerge.i, label %example.exit, label %if.else.i

if.else.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

example.exit:                                     ; preds = %entry
  ret i32 0
}

define internal fastcc i32 @get_kind() nounwind uwtable noinline {
entry:
  %k = alloca i32, align 4
  store volatile i32 10, i32* %k, align 4, !tbaa !0
  %0 = load volatile i32* %k, align 4, !tbaa !0
  ret i32 %0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
