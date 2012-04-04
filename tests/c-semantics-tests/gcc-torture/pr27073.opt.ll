; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr27073.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32* nocapture %p, i32 %d1, i32 %d2, i32 %d3, i16 signext %count, i32 %s1, i32 %s2, i32 %s3, i32 %s4, i32 %s5) nounwind uwtable noinline {
entry:
  %tobool5 = icmp eq i16 %count, 0
  br i1 %tobool5, label %while.end, label %while.body.lr.ph

while.body.lr.ph:                                 ; preds = %entry
  %conv = sext i16 %count to i32
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %p.addr.07 = phi i32* [ %p, %while.body.lr.ph ], [ %incdec.ptr4, %while.body ]
  %n.06 = phi i32 [ %conv, %while.body.lr.ph ], [ %dec, %while.body ]
  %dec = add nsw i32 %n.06, -1
  %incdec.ptr = getelementptr inbounds i32* %p.addr.07, i64 1
  store i32 %s1, i32* %p.addr.07, align 4, !tbaa !0
  %incdec.ptr1 = getelementptr inbounds i32* %p.addr.07, i64 2
  store i32 %s2, i32* %incdec.ptr, align 4, !tbaa !0
  %incdec.ptr2 = getelementptr inbounds i32* %p.addr.07, i64 3
  store i32 %s3, i32* %incdec.ptr1, align 4, !tbaa !0
  %incdec.ptr3 = getelementptr inbounds i32* %p.addr.07, i64 4
  store i32 %s4, i32* %incdec.ptr2, align 4, !tbaa !0
  %incdec.ptr4 = getelementptr inbounds i32* %p.addr.07, i64 5
  store i32 %s5, i32* %incdec.ptr3, align 4, !tbaa !0
  %tobool = icmp eq i32 %dec, 0
  br i1 %tobool, label %while.end, label %while.body

while.end:                                        ; preds = %while.body, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %x = alloca [10 x i32], align 16
  %arraydecay = getelementptr inbounds [10 x i32]* %x, i64 0, i64 0
  call void @foo(i32* %arraydecay, i32 undef, i32 undef, i32 undef, i16 signext 2, i32 100, i32 200, i32 300, i32 400, i32 500)
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr inbounds [10 x i32]* %x, i64 0, i64 %indvars.iv
  %1 = load i32* %arrayidx, align 4, !tbaa !0
  %rem = srem i32 %0, 5
  %2 = mul i32 %rem, 100
  %mul = add i32 %2, 100
  %cmp1 = icmp eq i32 %1, %mul
  %indvars.iv.next = add i64 %indvars.iv, 1
  br i1 %cmp1, label %for.cond, label %if.then

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

for.end:                                          ; preds = %for.cond
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
