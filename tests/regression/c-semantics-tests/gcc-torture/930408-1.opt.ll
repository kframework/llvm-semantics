; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930408-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32 }

@s = common global %struct.anon zeroinitializer, align 4

define void @p() noreturn nounwind uwtable {
entry:
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn

define void @f() nounwind uwtable {
entry:
  %0 = load i32* getelementptr inbounds (%struct.anon* @s, i64 0, i32 0), align 4, !tbaa !0
  %cond = icmp eq i32 %0, 0
  br i1 %cond, label %sw.bb, label %sw.epilog

sw.bb:                                            ; preds = %entry
  tail call void @p()
  unreachable

sw.epilog:                                        ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
f.exit:
  store i32 1, i32* getelementptr inbounds (%struct.anon* @s, i64 0, i32 0), align 4, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"_ZTS3foo", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
