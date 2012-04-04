; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr22630.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@j = common global i32 0, align 4

define void @bla(i32* %r) nounwind uwtable {
entry:
  %tobool = icmp eq i32* %r, null
  %j.r = select i1 %tobool, i32* @j, i32* %r
  %cmp = icmp eq i32* %j.r, %r
  br i1 %cmp, label %if.end2, label %if.then1

if.then1:                                         ; preds = %entry
  store i32 1, i32* @j, align 4, !tbaa !0
  br label %if.end2

if.end2:                                          ; preds = %entry, %if.then1
  ret void
}

define i32 @main() nounwind uwtable {
if.end:
  store i32 1, i32* @j, align 4, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
