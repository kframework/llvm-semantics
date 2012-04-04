; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000819-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [2 x i32] [i32 2, i32 0], align 4

define void @foo(i32* %sp, i32 %cnt) nounwind uwtable {
entry:
  %idx.ext = sext i32 %cnt to i64
  %idx.neg = sub i64 0, %idx.ext
  %add.ptr = getelementptr inbounds i32* %sp, i64 %idx.neg
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %p.0 = phi i32* [ %add.ptr, %entry ], [ %incdec.ptr, %for.body ]
  %cmp = icmp ugt i32* %p.0, %sp
  br i1 %cmp, label %for.end, label %for.body

for.body:                                         ; preds = %for.cond
  %0 = load i32* %p.0, align 4, !tbaa !0
  %cmp1 = icmp slt i32 %0, 2
  %incdec.ptr = getelementptr inbounds i32* %p.0, i64 1
  br i1 %cmp1, label %if.then, label %for.cond

if.then:                                          ; preds = %for.body
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @exit(i32) noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.body.i, %entry
  %p.0.i = phi i32* [ getelementptr inbounds ([2 x i32]* @a, i64 0, i64 0), %entry ], [ %incdec.ptr.i, %for.body.i ]
  %cmp.i = icmp ugt i32* %p.0.i, getelementptr inbounds ([2 x i32]* @a, i64 0, i64 1)
  br i1 %cmp.i, label %foo.exit, label %for.body.i

for.body.i:                                       ; preds = %for.cond.i
  %0 = load i32* %p.0.i, align 4, !tbaa !0
  %cmp1.i = icmp slt i32 %0, 2
  %incdec.ptr.i = getelementptr inbounds i32* %p.0.i, i64 1
  br i1 %cmp1.i, label %if.then.i, label %for.cond.i

if.then.i:                                        ; preds = %for.body.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

foo.exit:                                         ; preds = %for.cond.i
  tail call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
