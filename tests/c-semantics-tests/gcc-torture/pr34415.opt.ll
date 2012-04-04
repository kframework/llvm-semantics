; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr34415.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"Bbb:\00", align 1

define i8* @foo(i8* %p) nounwind uwtable readonly noinline {
entry:
  br label %for.cond

for.cond:                                         ; preds = %if.end13, %entry
  %len.0 = phi i32 [ 1, %entry ], [ %inc, %if.end13 ]
  %end.0 = phi i8* [ undef, %entry ], [ %p.addr.0, %if.end13 ]
  %p.addr.0 = phi i8* [ %p, %entry ], [ %incdec.ptr14, %if.end13 ]
  %0 = load i8* %p.addr.0, align 1, !tbaa !0
  %conv = sext i8 %0 to i32
  %.off = add i8 %0, -97
  %1 = icmp ult i8 %.off, 26
  %add = add nsw i32 %conv, -32
  %cond = select i1 %1, i32 %add, i32 %conv
  switch i32 %cond, label %for.end [
    i32 66, label %if.end13
    i32 65, label %do.body
  ]

do.body:                                          ; preds = %for.cond, %do.body
  %p.addr.1 = phi i8* [ %incdec.ptr, %do.body ], [ %p.addr.0, %for.cond ]
  %incdec.ptr = getelementptr inbounds i8* %p.addr.1, i64 1
  %2 = load i8* %incdec.ptr, align 1, !tbaa !0
  %cmp10 = icmp eq i8 %2, 43
  br i1 %cmp10, label %do.body, label %if.end13

if.end13:                                         ; preds = %do.body, %for.cond
  %p.addr.2 = phi i8* [ %p.addr.0, %for.cond ], [ %incdec.ptr, %do.body ]
  %incdec.ptr14 = getelementptr inbounds i8* %p.addr.2, i64 1
  %inc = add nsw i32 %len.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %cmp15 = icmp sgt i32 %len.0, 2
  br i1 %cmp15, label %land.lhs.true17, label %if.end22

land.lhs.true17:                                  ; preds = %for.end
  %cmp19 = icmp eq i8 %0, 58
  %end.0.p.addr.0 = select i1 %cmp19, i8* %end.0, i8* %p.addr.0
  ret i8* %end.0.p.addr.0

if.end22:                                         ; preds = %for.end
  ret i8* %p.addr.0
}

define i32 @main() nounwind uwtable readonly {
entry:
  %call = tail call i8* @foo(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0))
  %cmp = icmp ne i8* %call, getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 2)
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
