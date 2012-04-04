; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020404-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.asection_struct = type { i8, i64, i64, i32, i32 }

@bfd_make_section_anyway.foo_section = internal global %struct.asection_struct zeroinitializer, align 8

define i32 @main() noreturn nounwind uwtable {
entry:
  store i64 3735928559, i64* getelementptr inbounds (%struct.asection_struct* @bfd_make_section_anyway.foo_section, i64 0, i32 2), align 8, !tbaa !0
  store i64 3735928559, i64* getelementptr inbounds (%struct.asection_struct* @bfd_make_section_anyway.foo_section, i64 0, i32 1), align 8, !tbaa !0
  %0 = load i32* bitcast (%struct.asection_struct* @bfd_make_section_anyway.foo_section to i32*), align 8
  %1 = or i32 %0, 1
  store i32 %1, i32* bitcast (%struct.asection_struct* @bfd_make_section_anyway.foo_section to i32*), align 8
  store i32 0, i32* getelementptr inbounds (%struct.asection_struct* @bfd_make_section_anyway.foo_section, i64 0, i32 3), align 8, !tbaa !3
  store i32 0, i32* getelementptr inbounds (%struct.asection_struct* @bfd_make_section_anyway.foo_section, i64 0, i32 4), align 4, !tbaa !3
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
