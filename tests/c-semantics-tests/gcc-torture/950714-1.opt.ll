; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950714-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@array = global [10 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1], align 16

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc5, %entry
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc5 ]
  %cmp = icmp slt i32 %i.0, 10
  br i1 %cmp, label %for.cond1, label %if.then8

for.cond1:                                        ; preds = %for.cond, %for.body3
  %p.0 = phi i32* [ %incdec.ptr, %for.body3 ], [ getelementptr inbounds ([10 x i32]* @array, i64 0, i64 0), %for.cond ]
  %cmp2 = icmp eq i32* %p.0, getelementptr inbounds ([10 x i32]* @array, i64 0, i64 9)
  br i1 %cmp2, label %for.inc5, label %for.body3

for.body3:                                        ; preds = %for.cond1
  %0 = load i32* %p.0, align 4, !tbaa !0
  %cmp4 = icmp eq i32 %0, %i.0
  %incdec.ptr = getelementptr inbounds i32* %p.0, i64 1
  br i1 %cmp4, label %label, label %for.cond1

for.inc5:                                         ; preds = %for.cond1
  %inc = add nsw i32 %i.0, 1
  br label %for.cond

label:                                            ; preds = %for.body3
  %cmp7 = icmp eq i32 %i.0, 1
  br i1 %cmp7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %for.cond, %label
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %label
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
