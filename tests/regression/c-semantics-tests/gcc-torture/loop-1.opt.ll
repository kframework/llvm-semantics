; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() noreturn nounwind uwtable {
entry:
  %k = alloca [3 x i32], align 4
  %arrayidx = getelementptr inbounds [3 x i32]* %k, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 4, !tbaa !0
  %arrayidx.1 = getelementptr inbounds [3 x i32]* %k, i64 0, i64 1
  store i32 1, i32* %arrayidx.1, align 4, !tbaa !0
  %arrayidx.2 = getelementptr inbounds [3 x i32]* %k, i64 0, i64 2
  store i32 2, i32* %arrayidx.2, align 4, !tbaa !0
  br label %for.cond2

for.cond2:                                        ; preds = %for.body4, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body4 ], [ 2, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp3 = icmp sgt i32 %0, -1
  br i1 %cmp3, label %for.body4, label %for.end9

for.body4:                                        ; preds = %for.cond2
  %arrayidx6 = getelementptr inbounds [3 x i32]* %k, i64 0, i64 %indvars.iv
  %1 = load i32* %arrayidx6, align 4, !tbaa !0
  %cmp7 = icmp eq i32 %1, %0
  %indvars.iv.next = add i64 %indvars.iv, -1
  br i1 %cmp7, label %for.cond2, label %if.then

if.then:                                          ; preds = %for.body4
  call void @abort() noreturn nounwind
  unreachable

for.end9:                                         ; preds = %for.cond2
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
