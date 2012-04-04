; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060412-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i64, [82 x %struct.S] }
%struct.S = type { i64 }

@t = common global %struct.T zeroinitializer, align 8

define i32 @main() nounwind uwtable {
while.body.lr.ph:
  br label %while.body

while.body:                                       ; preds = %while.body.lr.ph, %while.body
  %o7 = phi i64* [ getelementptr inbounds (%struct.T* @t, i64 0, i32 1, i64 81, i32 0), %while.body.lr.ph ], [ %incdec.ptr, %while.body ]
  store i64 -1, i64* %o7, align 8, !tbaa !0
  %incdec.ptr = getelementptr inbounds i64* %o7, i64 -1
  %cmp = icmp ugt i64* %incdec.ptr, getelementptr inbounds (%struct.T* @t, i64 0, i32 1, i64 0, i32 0)
  br i1 %cmp, label %while.body, label %if.end5

if.end5:                                          ; preds = %while.body
  store i64 0, i64* getelementptr inbounds (%struct.T* @t, i64 0, i32 1, i64 0, i32 0), align 8, !tbaa !0
  ret i32 0
}

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
