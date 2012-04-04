; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990127-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() noreturn nounwind uwtable {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  store i32 10, i32* %a, align 4, !tbaa !0
  store i32 20, i32* %b, align 4, !tbaa !0
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = phi i32 [ 20, %entry ], [ %dec, %while.body ]
  %x.1 = phi i32 [ 0, %entry ], [ %inc, %while.body ]
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %b, align 4, !tbaa !0
  %tobool = icmp eq i32 %0, 0
  br i1 %tobool, label %while.end, label %while.body

while.body:                                       ; preds = %while.cond
  %inc = add nsw i32 %x.1, 1
  %cmp2 = icmp slt i32 %dec, 3
  br i1 %cmp2, label %while.end, label %while.cond

while.end:                                        ; preds = %while.cond, %while.body
  %x.2 = phi i32 [ %inc, %while.body ], [ %x.1, %while.cond ]
  %inc6 = add nsw i32 %x.2, 1
  br label %while.cond.1

if.then12:                                        ; preds = %while.end.9
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %while.end.9
  call void @exit(i32 0) noreturn nounwind
  unreachable

while.cond.1:                                     ; preds = %while.body.1.while.cond.1_crit_edge, %while.end
  %1 = phi i32 [ 10, %while.end ], [ %.pre, %while.body.1.while.cond.1_crit_edge ]
  %pa.1.1 = phi i32* [ %a, %while.end ], [ %b, %while.body.1.while.cond.1_crit_edge ]
  %x.1.1 = phi i32 [ %inc6, %while.end ], [ %inc.1, %while.body.1.while.cond.1_crit_edge ]
  %dec.1 = add nsw i32 %1, -1
  store i32 %dec.1, i32* %pa.1.1, align 4, !tbaa !0
  %tobool.1 = icmp eq i32 %1, 0
  br i1 %tobool.1, label %while.end.1, label %while.body.1

while.body.1:                                     ; preds = %while.cond.1
  %inc.1 = add nsw i32 %x.1.1, 1
  %cmp2.1 = icmp slt i32 %dec.1, 3
  br i1 %cmp2.1, label %while.end.1, label %while.body.1.while.cond.1_crit_edge

while.body.1.while.cond.1_crit_edge:              ; preds = %while.body.1
  %.pre = load i32* %b, align 4, !tbaa !0
  br label %while.cond.1

while.end.1:                                      ; preds = %while.body.1, %while.cond.1
  %x.2.1 = phi i32 [ %inc.1, %while.body.1 ], [ %x.1.1, %while.cond.1 ]
  %inc6.1 = add nsw i32 %x.2.1, 1
  br label %while.cond.2

while.cond.2:                                     ; preds = %while.body.2, %while.end.1
  %pa.1.2 = phi i32* [ %a, %while.end.1 ], [ %b, %while.body.2 ]
  %x.1.2 = phi i32 [ %inc6.1, %while.end.1 ], [ %inc.2, %while.body.2 ]
  %2 = load i32* %pa.1.2, align 4, !tbaa !0
  %dec.2 = add nsw i32 %2, -1
  store i32 %dec.2, i32* %pa.1.2, align 4, !tbaa !0
  %tobool.2 = icmp eq i32 %2, 0
  br i1 %tobool.2, label %while.end.2, label %while.body.2

while.body.2:                                     ; preds = %while.cond.2
  %inc.2 = add nsw i32 %x.1.2, 1
  %cmp2.2 = icmp slt i32 %dec.2, 3
  br i1 %cmp2.2, label %while.end.2, label %while.cond.2

while.end.2:                                      ; preds = %while.body.2, %while.cond.2
  %x.2.2 = phi i32 [ %inc.2, %while.body.2 ], [ %x.1.2, %while.cond.2 ]
  %inc6.2 = add nsw i32 %x.2.2, 1
  br label %while.cond.3

while.cond.3:                                     ; preds = %while.body.3, %while.end.2
  %pa.1.3 = phi i32* [ %a, %while.end.2 ], [ %b, %while.body.3 ]
  %x.1.3 = phi i32 [ %inc6.2, %while.end.2 ], [ %inc.3, %while.body.3 ]
  %3 = load i32* %pa.1.3, align 4, !tbaa !0
  %dec.3 = add nsw i32 %3, -1
  store i32 %dec.3, i32* %pa.1.3, align 4, !tbaa !0
  %tobool.3 = icmp eq i32 %3, 0
  br i1 %tobool.3, label %while.end.3, label %while.body.3

while.body.3:                                     ; preds = %while.cond.3
  %inc.3 = add nsw i32 %x.1.3, 1
  %cmp2.3 = icmp slt i32 %dec.3, 3
  br i1 %cmp2.3, label %while.end.3, label %while.cond.3

while.end.3:                                      ; preds = %while.body.3, %while.cond.3
  %x.2.3 = phi i32 [ %inc.3, %while.body.3 ], [ %x.1.3, %while.cond.3 ]
  %inc6.3 = add nsw i32 %x.2.3, 1
  br label %while.cond.4

while.cond.4:                                     ; preds = %while.body.4, %while.end.3
  %pa.1.4 = phi i32* [ %a, %while.end.3 ], [ %b, %while.body.4 ]
  %x.1.4 = phi i32 [ %inc6.3, %while.end.3 ], [ %inc.4, %while.body.4 ]
  %4 = load i32* %pa.1.4, align 4, !tbaa !0
  %dec.4 = add nsw i32 %4, -1
  store i32 %dec.4, i32* %pa.1.4, align 4, !tbaa !0
  %tobool.4 = icmp eq i32 %4, 0
  br i1 %tobool.4, label %while.end.4, label %while.body.4

while.body.4:                                     ; preds = %while.cond.4
  %inc.4 = add nsw i32 %x.1.4, 1
  %cmp2.4 = icmp slt i32 %dec.4, 3
  br i1 %cmp2.4, label %while.end.4, label %while.cond.4

while.end.4:                                      ; preds = %while.body.4, %while.cond.4
  %x.2.4 = phi i32 [ %inc.4, %while.body.4 ], [ %x.1.4, %while.cond.4 ]
  %inc6.4 = add nsw i32 %x.2.4, 1
  br label %while.cond.5

while.cond.5:                                     ; preds = %while.body.5, %while.end.4
  %pa.1.5 = phi i32* [ %a, %while.end.4 ], [ %b, %while.body.5 ]
  %x.1.5 = phi i32 [ %inc6.4, %while.end.4 ], [ %inc.5, %while.body.5 ]
  %5 = load i32* %pa.1.5, align 4, !tbaa !0
  %dec.5 = add nsw i32 %5, -1
  store i32 %dec.5, i32* %pa.1.5, align 4, !tbaa !0
  %tobool.5 = icmp eq i32 %5, 0
  br i1 %tobool.5, label %while.end.5, label %while.body.5

while.body.5:                                     ; preds = %while.cond.5
  %inc.5 = add nsw i32 %x.1.5, 1
  %cmp2.5 = icmp slt i32 %dec.5, 3
  br i1 %cmp2.5, label %while.end.5, label %while.cond.5

while.end.5:                                      ; preds = %while.body.5, %while.cond.5
  %x.2.5 = phi i32 [ %inc.5, %while.body.5 ], [ %x.1.5, %while.cond.5 ]
  %inc6.5 = add nsw i32 %x.2.5, 1
  br label %while.cond.6

while.cond.6:                                     ; preds = %while.body.6, %while.end.5
  %pa.1.6 = phi i32* [ %a, %while.end.5 ], [ %b, %while.body.6 ]
  %x.1.6 = phi i32 [ %inc6.5, %while.end.5 ], [ %inc.6, %while.body.6 ]
  %6 = load i32* %pa.1.6, align 4, !tbaa !0
  %dec.6 = add nsw i32 %6, -1
  store i32 %dec.6, i32* %pa.1.6, align 4, !tbaa !0
  %tobool.6 = icmp eq i32 %6, 0
  br i1 %tobool.6, label %while.end.6, label %while.body.6

while.body.6:                                     ; preds = %while.cond.6
  %inc.6 = add nsw i32 %x.1.6, 1
  %cmp2.6 = icmp slt i32 %dec.6, 3
  br i1 %cmp2.6, label %while.end.6, label %while.cond.6

while.end.6:                                      ; preds = %while.body.6, %while.cond.6
  %x.2.6 = phi i32 [ %inc.6, %while.body.6 ], [ %x.1.6, %while.cond.6 ]
  %inc6.6 = add nsw i32 %x.2.6, 1
  br label %while.cond.7

while.cond.7:                                     ; preds = %while.body.7, %while.end.6
  %pa.1.7 = phi i32* [ %a, %while.end.6 ], [ %b, %while.body.7 ]
  %x.1.7 = phi i32 [ %inc6.6, %while.end.6 ], [ %inc.7, %while.body.7 ]
  %7 = load i32* %pa.1.7, align 4, !tbaa !0
  %dec.7 = add nsw i32 %7, -1
  store i32 %dec.7, i32* %pa.1.7, align 4, !tbaa !0
  %tobool.7 = icmp eq i32 %7, 0
  br i1 %tobool.7, label %while.end.7, label %while.body.7

while.body.7:                                     ; preds = %while.cond.7
  %inc.7 = add nsw i32 %x.1.7, 1
  %cmp2.7 = icmp slt i32 %dec.7, 3
  br i1 %cmp2.7, label %while.end.7, label %while.cond.7

while.end.7:                                      ; preds = %while.body.7, %while.cond.7
  %x.2.7 = phi i32 [ %inc.7, %while.body.7 ], [ %x.1.7, %while.cond.7 ]
  %inc6.7 = add nsw i32 %x.2.7, 1
  br label %while.cond.8

while.cond.8:                                     ; preds = %while.body.8, %while.end.7
  %pa.1.8 = phi i32* [ %a, %while.end.7 ], [ %b, %while.body.8 ]
  %x.1.8 = phi i32 [ %inc6.7, %while.end.7 ], [ %inc.8, %while.body.8 ]
  %8 = load i32* %pa.1.8, align 4, !tbaa !0
  %dec.8 = add nsw i32 %8, -1
  store i32 %dec.8, i32* %pa.1.8, align 4, !tbaa !0
  %tobool.8 = icmp eq i32 %8, 0
  br i1 %tobool.8, label %while.end.8, label %while.body.8

while.body.8:                                     ; preds = %while.cond.8
  %inc.8 = add nsw i32 %x.1.8, 1
  %cmp2.8 = icmp slt i32 %dec.8, 3
  br i1 %cmp2.8, label %while.end.8, label %while.cond.8

while.end.8:                                      ; preds = %while.body.8, %while.cond.8
  %x.2.8 = phi i32 [ %inc.8, %while.body.8 ], [ %x.1.8, %while.cond.8 ]
  %inc6.8 = add nsw i32 %x.2.8, 1
  br label %while.cond.9

while.cond.9:                                     ; preds = %while.body.9, %while.end.8
  %pa.1.9 = phi i32* [ %a, %while.end.8 ], [ %b, %while.body.9 ]
  %x.1.9 = phi i32 [ %inc6.8, %while.end.8 ], [ %inc.9, %while.body.9 ]
  %9 = load i32* %pa.1.9, align 4, !tbaa !0
  %dec.9 = add nsw i32 %9, -1
  store i32 %dec.9, i32* %pa.1.9, align 4, !tbaa !0
  %tobool.9 = icmp eq i32 %9, 0
  br i1 %tobool.9, label %while.end.9, label %while.body.9

while.body.9:                                     ; preds = %while.cond.9
  %inc.9 = add nsw i32 %x.1.9, 1
  %cmp2.9 = icmp slt i32 %dec.9, 3
  br i1 %cmp2.9, label %while.end.9, label %while.cond.9

while.end.9:                                      ; preds = %while.body.9, %while.cond.9
  %x.2.9 = phi i32 [ %inc.9, %while.body.9 ], [ %x.1.9, %while.cond.9 ]
  %10 = load i32* %b, align 4, !tbaa !0
  %11 = icmp eq i32 %10, -5
  %cmp11 = icmp eq i32 %x.2.9, 42
  %or.cond14 = and i1 %11, %cmp11
  br i1 %or.cond14, label %if.end13, label %if.then12
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
