; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920429-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = common global i32 0, align 4
@j = common global i32 0, align 4

define i8* @f(i8* %p) nounwind uwtable {
entry:
  %incdec.ptr = getelementptr inbounds i8* %p, i64 1
  %0 = load i8* %p, align 1, !tbaa !0
  %conv = zext i8 %0 to i32
  %and = lshr i32 %conv, 1
  %and.lobit = and i32 %and, 1
  store i32 %and.lobit, i32* @i, align 4, !tbaa !2
  %and2 = and i32 %conv, 7
  %add = add nsw i32 %and2, 1
  store i32 %add, i32* @j, align 4, !tbaa !2
  ret i8* %incdec.ptr
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  store i32 0, i32* @i, align 4, !tbaa !2
  store i32 2, i32* @j, align 4, !tbaa !2
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"int", metadata !0}
