; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr33669.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo_t = type { i32, i32 }

define i64 @foo(%struct.foo_t* nocapture %pxp, i64 %offset, i32 %extent) nounwind uwtable {
entry:
  %blksz = getelementptr inbounds %struct.foo_t* %pxp, i64 0, i32 0
  %0 = load i32* %blksz, align 4, !tbaa !0
  %conv = zext i32 %0 to i64
  %rem = srem i64 %offset, %conv
  %sub = sub nsw i64 %offset, %rem
  %conv2 = trunc i64 %rem to i32
  %add = add i32 %extent, -1
  %add4 = add i32 %add, %0
  %sub5 = add i32 %add4, %conv2
  %div = urem i32 %sub5, %0
  %mul = sub i32 %sub5, %div
  %cmp = icmp ult i32 %0, %mul
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %bf_cnt = getelementptr inbounds %struct.foo_t* %pxp, i64 0, i32 1
  %1 = load i32* %bf_cnt, align 4, !tbaa !0
  %cmp11 = icmp ugt i32 %1, %0
  br i1 %cmp11, label %if.then13, label %return

if.then13:                                        ; preds = %if.end
  store i32 %0, i32* %bf_cnt, align 4, !tbaa !0
  br label %return

return:                                           ; preds = %if.end, %if.then13, %entry
  %retval.0 = phi i64 [ -1, %entry ], [ %sub, %if.then13 ], [ %sub, %if.end ]
  ret i64 %retval.0
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
