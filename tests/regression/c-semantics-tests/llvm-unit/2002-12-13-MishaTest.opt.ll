; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-12-13-MishaTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"Sum is %d\0A\00", align 1

define void @sum(i16* nocapture %to, i16* nocapture %from, i32) nounwind uwtable {
entry:
  %sext = shl i32 %0, 16
  %conv = ashr exact i32 %sext, 16
  %cmp7 = icmp eq i32 %conv, 0
  br i1 %cmp7, label %for.end, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %.pre = load i16* %to, align 2, !tbaa !0
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.body
  %1 = phi i16 [ %.pre, %for.body.lr.ph ], [ %add, %for.body ]
  %i.09 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.body ]
  %from.addr.08 = phi i16* [ %from, %for.body.lr.ph ], [ %incdec.ptr, %for.body ]
  %incdec.ptr = getelementptr inbounds i16* %from.addr.08, i64 1
  %2 = load i16* %from.addr.08, align 2, !tbaa !0
  %add = add i16 %1, %2
  store i16 %add, i16* %to, align 2, !tbaa !0
  %inc = add nsw i32 %i.09, 1
  %cmp = icmp eq i32 %inc, %conv
  br i1 %cmp, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 1) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
