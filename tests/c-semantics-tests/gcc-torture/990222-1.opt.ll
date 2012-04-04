; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990222-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@line = global [4 x i8] c"199\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %0 = load i8* getelementptr inbounds ([4 x i8]* @line, i64 0, i64 2), align 1, !tbaa !0
  %add16 = add i8 %0, 1
  store i8 %add16, i8* getelementptr inbounds ([4 x i8]* @line, i64 0, i64 2), align 1, !tbaa !0
  %cmp17 = icmp sgt i8 %add16, 57
  br i1 %cmp17, label %while.body, label %while.end

while.body:                                       ; preds = %entry, %while.body
  %incdec.ptr18 = phi i8* [ %incdec.ptr, %while.body ], [ getelementptr inbounds ([4 x i8]* @line, i64 0, i64 2), %entry ]
  store i8 48, i8* %incdec.ptr18, align 1, !tbaa !0
  %incdec.ptr = getelementptr inbounds i8* %incdec.ptr18, i64 -1
  %1 = load i8* %incdec.ptr, align 1, !tbaa !0
  %add = add i8 %1, 1
  store i8 %add, i8* %incdec.ptr, align 1, !tbaa !0
  %cmp = icmp sgt i8 %add, 57
  br i1 %cmp, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %.pre = load i8* getelementptr inbounds ([4 x i8]* @line, i64 0, i64 2), align 1, !tbaa !0
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %2 = phi i8 [ %.pre, %while.cond.while.end_crit_edge ], [ %add16, %entry ]
  %3 = load i8* getelementptr inbounds ([4 x i8]* @line, i64 0, i64 0), align 1, !tbaa !0
  %cmp5 = icmp eq i8 %3, 50
  %4 = load i8* getelementptr inbounds ([4 x i8]* @line, i64 0, i64 1), align 1, !tbaa !0
  %cmp8 = icmp eq i8 %4, 48
  %or.cond = and i1 %cmp5, %cmp8
  %cmp12 = icmp eq i8 %2, 48
  %or.cond15 = and i1 %or.cond, %cmp12
  br i1 %or.cond15, label %if.end, label %if.then

if.then:                                          ; preds = %while.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %while.end
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
