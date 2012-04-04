; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-11.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = internal unnamed_addr global [199 x i32] zeroinitializer, align 16

define i32 @main() nounwind uwtable {
entry:
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %entry
  %indvars.iv.i = phi i64 [ 198, %entry ], [ %indvars.iv.next.i, %for.body.i ]
  %arrayidx.i = getelementptr inbounds [199 x i32]* @a, i64 0, i64 %indvars.iv.i
  %0 = trunc i64 %indvars.iv.i to i32
  store i32 %0, i32* %arrayidx.i, align 4, !tbaa !0
  %indvars.iv.next.i = add i64 %indvars.iv.i, -1
  %cmp.i = icmp sgt i32 %0, 0
  br i1 %cmp.i, label %for.body.i, label %for.cond

for.cond:                                         ; preds = %for.body.i, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %for.body.i ]
  %1 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %1, 199
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [199 x i32]* @a, i64 0, i64 %indvars.iv
  %2 = load i32* %arrayidx, align 4, !tbaa !0
  %cmp1 = icmp eq i32 %2, %1
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp1, label %for.cond, label %if.then

if.then:                                          ; preds = %for.body
  tail call void @abort() noreturn nounwind
  unreachable

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
