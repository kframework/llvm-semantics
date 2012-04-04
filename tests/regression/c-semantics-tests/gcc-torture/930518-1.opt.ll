; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/930518-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bar = global i32 0, align 4

define void @f(i32* nocapture %p) nounwind uwtable {
entry:
  %0 = load i32* @bar, align 4, !tbaa !0
  %cmp1 = icmp slt i32 %0, 2
  br i1 %cmp1, label %while.body, label %while.end

while.body:                                       ; preds = %entry, %while.body
  %1 = phi i32 [ 1, %while.body ], [ %0, %entry ]
  %p.addr.03 = phi i32* [ %incdec.ptr, %while.body ], [ %p, %entry ]
  %foo.02 = phi i32 [ %sub, %while.body ], [ 2, %entry ]
  %sub = sub nsw i32 %foo.02, %1
  %incdec.ptr = getelementptr inbounds i32* %p.addr.03, i64 1
  store i32 %sub, i32* %p.addr.03, align 4, !tbaa !0
  store i32 1, i32* @bar, align 4, !tbaa !0
  %cmp = icmp sgt i32 %sub, 1
  br i1 %cmp, label %while.body, label %while.end

while.end:                                        ; preds = %while.body, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %tab = alloca [2 x i32], align 4
  %arrayidx = getelementptr inbounds [2 x i32]* %tab, i64 0, i64 1
  store i32 0, i32* %arrayidx, align 4, !tbaa !0
  %arrayidx1 = getelementptr inbounds [2 x i32]* %tab, i64 0, i64 0
  store i32 0, i32* %arrayidx1, align 4, !tbaa !0
  %0 = load i32* @bar, align 4, !tbaa !0
  %cmp1.i = icmp slt i32 %0, 2
  br i1 %cmp1.i, label %while.body.i, label %if.then

while.body.i:                                     ; preds = %entry, %while.body.i
  %1 = phi i32 [ 1, %while.body.i ], [ %0, %entry ]
  %p.addr.03.i = phi i32* [ %incdec.ptr.i, %while.body.i ], [ %arrayidx1, %entry ]
  %foo.02.i = phi i32 [ %sub.i, %while.body.i ], [ 2, %entry ]
  %sub.i = sub nsw i32 %foo.02.i, %1
  %incdec.ptr.i = getelementptr inbounds i32* %p.addr.03.i, i64 1
  store i32 %sub.i, i32* %p.addr.03.i, align 4, !tbaa !0
  store i32 1, i32* @bar, align 4, !tbaa !0
  %cmp.i = icmp sgt i32 %sub.i, 1
  br i1 %cmp.i, label %while.body.i, label %f.exit

f.exit:                                           ; preds = %while.body.i
  %.pr = load i32* %arrayidx1, align 4, !tbaa !0
  %cmp = icmp eq i32 %.pr, 2
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %f.exit
  %2 = load i32* %arrayidx, align 4, !tbaa !0
  %cmp4 = icmp eq i32 %2, 1
  br i1 %cmp4, label %if.end, label %if.then

if.then:                                          ; preds = %entry, %lor.lhs.false, %f.exit
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
