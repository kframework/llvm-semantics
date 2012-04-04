; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930725-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@v = common global i32 0, align 4
@.str1 = private unnamed_addr constant [4 x i8] c"abc\00", align 1

define i8* @g() nounwind uwtable readnone {
entry:
  ret i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0)
}

define i8* @f() nounwind uwtable readonly {
entry:
  %0 = load i32* @v, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, 0
  %. = select i1 %cmp, i8* getelementptr inbounds ([1 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0)
  ret i8* %.
}

define i32 @main() noreturn nounwind uwtable {
if.then35:
  store i32 1, i32* @v, align 4, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
