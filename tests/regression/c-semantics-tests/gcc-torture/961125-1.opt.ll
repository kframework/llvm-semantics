; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/961125-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c":ab\00", align 1

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %while.cond.i

while.cond.i:                                     ; preds = %land.rhs4.i, %while.cond2.i, %entry
  %ptr.addr.0.i = phi i8* [ getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), %entry ], [ %incdec.ptr.i, %land.rhs4.i ], [ %ptr.addr.1.i, %while.cond2.i ]
  %sword.addr.0.i = phi i32 [ 1, %entry ], [ %dec.i, %land.rhs4.i ], [ %dec.i, %while.cond2.i ]
  %cmp.i = icmp ult i8* %ptr.addr.0.i, getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 3)
  br i1 %cmp.i, label %land.rhs.i, label %begfield.exit

land.rhs.i:                                       ; preds = %while.cond.i
  %dec.i = add nsw i32 %sword.addr.0.i, -1
  %tobool1.i = icmp eq i32 %sword.addr.0.i, 0
  br i1 %tobool1.i, label %begfield.exit, label %while.cond2.i

while.cond2.i:                                    ; preds = %land.rhs.i, %land.rhs4.i
  %ptr.addr.1.i = phi i8* [ %incdec.ptr.i, %land.rhs4.i ], [ %ptr.addr.0.i, %land.rhs.i ]
  %cmp3.i = icmp ult i8* %ptr.addr.1.i, getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 3)
  br i1 %cmp3.i, label %land.rhs4.i, label %while.cond.i

land.rhs4.i:                                      ; preds = %while.cond2.i
  %0 = load i8* %ptr.addr.1.i, align 1, !tbaa !0
  %cmp5.i = icmp eq i8 %0, 58
  %incdec.ptr.i = getelementptr inbounds i8* %ptr.addr.1.i, i64 1
  br i1 %cmp5.i, label %while.cond.i, label %while.cond2.i

begfield.exit:                                    ; preds = %while.cond.i, %land.rhs.i
  %add.ptr.i = getelementptr inbounds i8* %ptr.addr.0.i, i64 1
  %cmp17.i = icmp ugt i8* %add.ptr.i, getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 3)
  %ptr.addr.0.add.ptr.i = select i1 %cmp17.i, i8* %ptr.addr.0.i, i8* %add.ptr.i
  %cmp = icmp eq i8* %ptr.addr.0.add.ptr.i, getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 2)
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %begfield.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %begfield.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
