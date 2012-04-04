; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr24141.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = common global i32 0, align 4

define void @g() nounwind uwtable {
entry:
  store i32 1, i32* @i, align 4, !tbaa !0
  ret void
}

define void @f(i32 %a, i32 %b) nounwind uwtable {
entry:
  %cmp = icmp ne i32 %a, 0
  %not.cmp6 = icmp eq i32 %b, 0
  %or.cond = and i1 %cmp, %not.cmp6
  br i1 %or.cond, label %if.then10, label %if.end11

if.then10:                                        ; preds = %entry
  store i32 1, i32* @i, align 4, !tbaa !0
  br label %if.end11

if.end11:                                         ; preds = %entry, %if.then10
  ret void
}

define i32 @main() nounwind uwtable {
if.end:
  store i32 1, i32* @i, align 4, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
