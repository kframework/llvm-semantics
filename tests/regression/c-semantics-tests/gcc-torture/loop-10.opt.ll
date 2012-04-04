; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-10.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = internal unnamed_addr global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %.pre = load i32* @count, align 4, !tbaa !0
  br label %while.cond

while.cond:                                       ; preds = %if.else, %entry
  %0 = phi i32 [ %.pre, %entry ], [ %inc.i5, %if.else ]
  %iNbr.0 = phi i32 [ 1, %entry ], [ %dec, %if.else ]
  %test.0 = phi i1 [ true, %entry ], [ false, %if.else ]
  br i1 %test.0, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %inc.i = add nsw i32 %0, 1
  store i32 %inc.i, i32* @count, align 4, !tbaa !0
  %cmp1 = icmp eq i32 %iNbr.0, 0
  br i1 %cmp1, label %while.end, label %if.else

if.else:                                          ; preds = %while.body
  %inc.i5 = add nsw i32 %0, 2
  store i32 %inc.i5, i32* @count, align 4, !tbaa !0
  %dec = add nsw i32 %iNbr.0, -1
  br label %while.cond

while.end:                                        ; preds = %while.cond, %while.body
  %1 = phi i32 [ %inc.i, %while.body ], [ %0, %while.cond ]
  %cmp2 = icmp eq i32 %1, 2
  br i1 %cmp2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %while.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %while.end
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
