; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42512.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@g_3 = common global i16 0, align 2

define i32 @main() nounwind uwtable {
entry:
  %.pr = load i16* @g_3, align 2, !tbaa !0
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %l_2.08 = phi i32 [ -1, %entry ], [ %conv3, %for.body ]
  %0 = phi i16 [ %.pr, %entry ], [ %conv1, %for.body ]
  %conv7 = zext i16 %0 to i32
  %or = or i32 %conv7, %l_2.08
  %conv1 = trunc i32 %or to i16
  %sub = add nsw i32 %l_2.08, 255
  %conv3 = and i32 %sub, 255
  %cmp = icmp eq i32 %conv3, 0
  br i1 %cmp, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  store i16 %conv1, i16* @g_3, align 2
  %cmp5 = icmp eq i16 %conv1, -1
  br i1 %cmp5, label %if.end, label %if.then

if.then:                                          ; preds = %for.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
