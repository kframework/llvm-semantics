; ModuleID = '/home/david/src/c-semantics/tests/integration/hanoi.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@step = global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  tail call void @hanoi(i8 signext 65, i8 signext 66, i8 signext 67, i32 4)
  ret i32 0
}

define void @hanoi(i8 signext %t1, i8 signext %t2, i8 signext %t3, i32 %n) nounwind uwtable {
entry:
  %0 = load i32* @step, align 4, !tbaa !0
  %inc2 = add nsw i32 %0, 1
  store i32 %inc2, i32* @step, align 4, !tbaa !0
  %cmp3 = icmp eq i32 %n, 1
  br i1 %cmp3, label %return, label %if.end

if.end:                                           ; preds = %entry, %if.end
  %n.tr6 = phi i32 [ %sub, %if.end ], [ %n, %entry ]
  %t3.tr5 = phi i8 [ %t1.tr4, %if.end ], [ %t3, %entry ]
  %t1.tr4 = phi i8 [ %t3.tr5, %if.end ], [ %t1, %entry ]
  %sub = add nsw i32 %n.tr6, -1
  tail call void @hanoi(i8 signext %t1.tr4, i8 signext %t3.tr5, i8 signext %t2, i32 %sub)
  %1 = load i32* @step, align 4, !tbaa !0
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @step, align 4, !tbaa !0
  %cmp = icmp eq i32 %sub, 1
  br i1 %cmp, label %return, label %if.end

return:                                           ; preds = %if.end, %entry
  ret void
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
