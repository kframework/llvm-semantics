; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [2 x i32] zeroinitializer, align 4

define void @f(i32 %b) nounwind uwtable {
entry:
  %cmp1 = icmp eq i32 %b, 0
  br i1 %cmp1, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %sub = add i32 %0, -2
  %arrayidx = getelementptr inbounds [2 x i32]* @a, i64 0, i64 %indvars.iv
  store i32 %sub, i32* %arrayidx, align 4, !tbaa !0
  %indvars.iv.next = add i64 %indvars.iv, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i32 %lftr.wideiv, %b
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  store i32 -2, i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 0), align 4, !tbaa !0
  store i32 -1, i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 1), align 4, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
