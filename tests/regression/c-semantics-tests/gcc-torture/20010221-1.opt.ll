; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010221-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@n = global i32 2, align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* @n, align 4, !tbaa !0
  %cmp6 = icmp sgt i32 %0, 0
  br i1 %cmp6, label %for.body, label %if.then4

for.body:                                         ; preds = %entry, %for.body
  %x.08 = phi i32 [ %x.08.i.07, %for.body ], [ 45, %entry ]
  %i.07 = phi i32 [ %inc, %for.body ], [ 0, %entry ]
  %cmp1 = icmp eq i32 %i.07, 0
  %x.08.i.07 = select i1 %cmp1, i32 %x.08, i32 %i.07
  %inc = add nsw i32 %i.07, 1
  %cmp = icmp slt i32 %inc, %0
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  %cmp3 = icmp eq i32 %x.08.i.07, 1
  br i1 %cmp3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %entry, %for.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %for.end
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
