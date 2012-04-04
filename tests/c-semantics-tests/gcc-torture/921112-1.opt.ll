; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921112-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.u = type { double }
%struct.anon = type { i32, i32 }

@x = common global [2 x %union.u] zeroinitializer, align 16
@v = common global %union.u zeroinitializer, align 8

define void @f(%union.u* nocapture %x, i64 %v.coerce) nounwind uwtable {
entry:
  %0 = bitcast i64 %v.coerce to double
  %incdec.ptr.0 = getelementptr inbounds %union.u* %x, i64 1, i32 0
  store double %0, double* %incdec.ptr.0, align 8
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  store i32 1, i32* bitcast (%union.u* @v to i32*), align 8, !tbaa !0
  store i32 2, i32* getelementptr (%struct.anon* bitcast (%union.u* @v to %struct.anon*), i64 0, i32 1), align 4, !tbaa !0
  %0 = load i64* bitcast (%union.u* @v to i64*), align 8
  %1 = bitcast i64 %0 to double
  store double %1, double* getelementptr inbounds ([2 x %union.u]* @x, i64 0, i64 1, i32 0), align 8
  %2 = icmp eq i64 %0, 8589934593
  br i1 %2, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
