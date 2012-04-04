; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42142.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @sort(i32 %L) nounwind uwtable readnone noinline {
entry:
  %end = alloca i64, align 8
  %tmpcast = bitcast i64* %end to [2 x i32]*
  store i64 42949672970, i64* %end, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.then, %entry
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.then ], [ 0, %entry ]
  %i.0 = phi i32 [ %add, %if.then ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv to i32
  %cmp = icmp slt i32 %0, 2
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %arrayidx = getelementptr inbounds [2 x i32]* %tmpcast, i64 0, i64 %indvars.iv
  %1 = load i32* %arrayidx, align 4, !tbaa !0
  %cmp1 = icmp sgt i32 %1, %L
  br i1 %cmp1, label %if.then, label %while.end

if.then:                                          ; preds = %while.body
  %indvars.iv.next = add i64 %indvars.iv, 1
  %add = add nsw i32 %i.0, 1
  %arrayidx3 = getelementptr inbounds [2 x i32]* %tmpcast, i64 0, i64 %indvars.iv.next
  store i32 1, i32* %arrayidx3, align 4, !tbaa !0
  store i32 10, i32* %arrayidx, align 4, !tbaa !0
  br label %while.cond

while.end:                                        ; preds = %while.body, %while.cond
  ret i32 %i.0
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @sort(i32 5)
  %cmp = icmp eq i32 %call, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
