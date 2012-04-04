; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr31448.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._st = type { [3 x i8], i8, [3 x i8], i8 }

@next = common global %struct._st* null, align 8

define void @g() noreturn nounwind uwtable {
entry:
  tail call void @llvm.trap()
  unreachable
}

define void @f() nounwind uwtable {
entry:
  %0 = load %struct._st** @next, align 8, !tbaa !0
  %1 = bitcast %struct._st* %0 to i32*
  %2 = load i32* %1, align 4
  %3 = and i32 %2, -16777216
  %4 = or i32 %3, 16711422
  store i32 %4, i32* %1, align 4
  %5 = load %struct._st** @next, align 8, !tbaa !0
  %bf.field.offs = getelementptr %struct._st* %5, i64 0, i32 0, i64 4
  %6 = bitcast i8* %bf.field.offs to i32*
  %7 = load i32* %6, align 4
  %8 = and i32 %7, -16777216
  %9 = or i32 %8, 16711422
  store i32 %9, i32* %6, align 4
  ret void
}

define i32 @main() nounwind uwtable {
if.end5:
  %a7 = alloca [2 x i32], align 4
  %tmpcast = bitcast [2 x i32]* %a7 to %struct._st*
  store %struct._st* %tmpcast, %struct._st** @next, align 8, !tbaa !0
  ret i32 0
}

declare void @llvm.trap() nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
