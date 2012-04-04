; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-12.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@p = common global i8* null, align 8
@.str = private unnamed_addr constant [5 x i8] c"abc\0A\00", align 1

define void @foo() nounwind uwtable {
entry:
  %.pre = load i8** @p, align 8, !tbaa !0
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = phi i8* [ %incdec.ptr, %while.body ], [ %.pre, %entry ]
  %1 = load i8* %0, align 1, !tbaa !1
  switch i8 %1, label %while.body [
    i8 10, label %while.end
    i8 59, label %while.end
    i8 33, label %while.end
  ]

while.body:                                       ; preds = %while.cond
  %incdec.ptr = getelementptr inbounds i8* %0, i64 1
  store i8* %incdec.ptr, i8** @p, align 8, !tbaa !0
  br label %while.cond

while.end:                                        ; preds = %while.cond, %while.cond, %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  br label %while.cond.i

while.cond.i:                                     ; preds = %while.body.i, %entry
  %storemerge = phi i8* [ getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0), %entry ], [ %incdec.ptr.i, %while.body.i ]
  store i8* %storemerge, i8** @p, align 8
  %0 = load i8* %storemerge, align 1, !tbaa !1
  switch i8 %0, label %while.body.i [
    i8 10, label %foo.exit
    i8 59, label %foo.exit
    i8 33, label %foo.exit
  ]

while.body.i:                                     ; preds = %while.cond.i
  %incdec.ptr.i = getelementptr inbounds i8* %storemerge, i64 1
  br label %while.cond.i

foo.exit:                                         ; preds = %while.cond.i, %while.cond.i, %while.cond.i
  ret i32 0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
