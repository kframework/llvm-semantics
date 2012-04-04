; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-2b.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [2 x i32] zeroinitializer, align 4

define void @f(i32 %i) nounwind uwtable {
entry:
  %0 = sext i32 %i to i64
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %0, %entry ]
  %1 = trunc i64 %indvars.iv to i32
  %cmp = icmp eq i32 %1, 2147483647
  br i1 %cmp, label %for.end, label %for.body

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [2 x i32]* @a, i64 0, i64 %indvars.iv
  store i32 -2, i32* %arrayidx, align 4, !tbaa !0
  %cmp3 = icmp eq i32 %1, 1
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp3, label %for.end, label %for.cond

for.end:                                          ; preds = %for.cond, %for.body
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  store i32 -2, i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 0), align 4, !tbaa !0
  store i32 -2, i32* getelementptr inbounds ([2 x i32]* @a, i64 0, i64 1), align 4, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
