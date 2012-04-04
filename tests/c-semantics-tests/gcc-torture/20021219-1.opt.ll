; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20021219-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@main.str = private unnamed_addr constant [11 x i8] c"foo { xx }\00", align 1

define void @foo(i8* nocapture %p1, i8** nocapture %p2) nounwind uwtable readnone {
entry:
  ret void
}

define i32 @main() nounwind uwtable readonly {
entry:
  %str = alloca [11 x i8], align 1
  %0 = getelementptr inbounds [11 x i8]* %str, i64 0, i64 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* getelementptr inbounds ([11 x i8]* @main.str, i64 0, i64 0), i64 11, i32 1, i1 false)
  %add.ptr = getelementptr inbounds [11 x i8]* %str, i64 0, i64 5
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %1 = phi i8 [ %.pre, %while.body ], [ 32, %entry ]
  %incdec.ptr6 = phi i8* [ %incdec.ptr, %while.body ], [ %add.ptr, %entry ]
  switch i8 %1, label %while.end [
    i8 32, label %while.body
    i8 13, label %while.body
  ]

while.body:                                       ; preds = %while.cond, %while.cond
  %incdec.ptr = getelementptr inbounds i8* %incdec.ptr6, i64 1
  %.pre = load i8* %incdec.ptr, align 1, !tbaa !0
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
