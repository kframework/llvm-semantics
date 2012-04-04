; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030218-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@q = common global i16* null, align 8

define i64 @foo(i16* %p) nounwind uwtable {
entry:
  %0 = load i16* %p, align 2, !tbaa !0
  %conv = sext i16 %0 to i64
  %add.ptr = getelementptr inbounds i16* %p, i64 1
  store i16* %add.ptr, i16** @q, align 8, !tbaa !3
  ret i64 %conv
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  %a = alloca i16, align 2
  store i16 -256, i16* %a, align 2, !tbaa !0
  %add.ptr.i = getelementptr inbounds i16* %a, i64 1
  store i16* %add.ptr.i, i16** @q, align 8, !tbaa !3
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"any pointer", metadata !1}
