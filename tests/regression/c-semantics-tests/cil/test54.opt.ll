; ModuleID = '/home/david/src/c-semantics/tests/cil/test54.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.precisionType = type { i32* }

define void @pnorm(%struct.precisionType* nocapture %u) nounwind uwtable readonly {
entry:
  %value = getelementptr inbounds %struct.precisionType* %u, i64 0, i32 0
  %0 = load i32** %value, align 8, !tbaa !0
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %uPtr.0 = phi i32* [ %0, %entry ], [ %incdec.ptr, %do.body ]
  %incdec.ptr = getelementptr inbounds i32* %uPtr.0, i64 -1
  %1 = load i32* %incdec.ptr, align 4, !tbaa !3
  %cmp = icmp eq i32 %1, 0
  %cmp2 = icmp ugt i32* %incdec.ptr, %0
  %or.cond = and i1 %cmp, %cmp2
  br i1 %or.cond, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable readnone {
entry:
  ret i32 0
}

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
