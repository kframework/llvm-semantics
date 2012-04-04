; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/strct-pack-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.TRIAL = type <{ i16, double }>

define i32 @check(%struct.TRIAL* nocapture %t) nounwind uwtable readonly {
entry:
  %s = getelementptr inbounds %struct.TRIAL* %t, i64 0, i32 0
  %0 = load i16* %s, align 2, !tbaa !0
  %cmp = icmp eq i16 %0, 1
  br i1 %cmp, label %lor.lhs.false, label %return

lor.lhs.false:                                    ; preds = %entry
  %d = getelementptr inbounds %struct.TRIAL* %t, i64 0, i32 1
  %1 = load double* %d, align 2, !tbaa !3
  %cmp2 = fcmp une double %1, 1.600000e+01
  br i1 %cmp2, label %return, label %if.end

if.end:                                           ; preds = %lor.lhs.false
  br label %return

return:                                           ; preds = %lor.lhs.false, %entry, %if.end
  %retval.0 = phi i32 [ 0, %if.end ], [ 1, %entry ], [ 1, %lor.lhs.false ]
  ret i32 %retval.0
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"double", metadata !1}
