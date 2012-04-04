; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040917-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@test_var = internal unnamed_addr global i32 0, align 4

define void @not_inlinable() nounwind uwtable noinline {
entry:
  store i32 -10, i32* @test_var, align 4, !tbaa !0
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  store i32 10, i32* @test_var, align 4, !tbaa !0
  tail call void @not_inlinable()
  %0 = load i32* @test_var, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, 10
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
