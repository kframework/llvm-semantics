; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr20527-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b = global [4 x i64] [i64 1, i64 5, i64 11, i64 23], align 16

define void @f(i64* nocapture %limit, i64* nocapture %base, i64 %minLen, i64 %maxLen) nounwind uwtable noinline {
entry:
  %cmp5 = icmp sgt i64 %minLen, %maxLen
  br i1 %cmp5, label %for.end, label %for.body

for.body:                                         ; preds = %entry, %for.body
  %vec.07 = phi i64 [ %add2, %for.body ], [ 0, %entry ]
  %i.06 = phi i64 [ %add, %for.body ], [ %minLen, %entry ]
  %add = add nsw i64 %i.06, 1
  %arrayidx = getelementptr inbounds i64* %base, i64 %add
  %0 = load i64* %arrayidx, align 8, !tbaa !0
  %arrayidx1 = getelementptr inbounds i64* %base, i64 %i.06
  %1 = load i64* %arrayidx1, align 8, !tbaa !0
  %sub = sub nsw i64 %0, %1
  %add2 = add nsw i64 %sub, %vec.07
  %sub3 = add nsw i64 %add2, -1
  %arrayidx4 = getelementptr inbounds i64* %limit, i64 %i.06
  store i64 %sub3, i64* %arrayidx4, align 8, !tbaa !0
  %cmp = icmp sgt i64 %add, %maxLen
  br i1 %cmp, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %l = alloca [3 x i64], align 16
  %arraydecay = getelementptr inbounds [3 x i64]* %l, i64 0, i64 0
  call void @f(i64* %arraydecay, i64* getelementptr inbounds ([4 x i64]* @b, i64 0, i64 0), i64 0, i64 2)
  %0 = load i64* %arraydecay, align 16, !tbaa !0
  %cmp = icmp eq i64 %0, 3
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %arrayidx1 = getelementptr inbounds [3 x i64]* %l, i64 0, i64 1
  %1 = load i64* %arrayidx1, align 8, !tbaa !0
  %cmp2 = icmp eq i64 %1, 9
  br i1 %cmp2, label %lor.lhs.false3, label %if.then

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %arrayidx4 = getelementptr inbounds [3 x i64]* %l, i64 0, i64 2
  %2 = load i64* %arrayidx4, align 16, !tbaa !0
  %cmp5 = icmp eq i64 %2, 21
  br i1 %cmp5, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
