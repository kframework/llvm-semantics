; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020810-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.R = type { %struct.A, %struct.A }
%struct.A = type { i64 }

@R = global %struct.R { %struct.A { i64 100 }, %struct.A { i64 200 } }, align 8

define void @f(i64 %r.coerce0, i64 %r.coerce1) nounwind uwtable {
entry:
  %0 = load i64* getelementptr inbounds (%struct.R* @R, i64 0, i32 0, i32 0), align 8, !tbaa !0
  %cmp = icmp eq i64 %0, %r.coerce0
  %1 = load i64* getelementptr inbounds (%struct.R* @R, i64 0, i32 1, i32 0), align 8, !tbaa !0
  %cmp2 = icmp eq i64 %1, %r.coerce1
  %or.cond = and i1 %cmp, %cmp2
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define { i64, i64 } @g() nounwind uwtable readonly {
entry:
  %srcval = load i128* bitcast (%struct.R* @R to i128*), align 8
  %0 = trunc i128 %srcval to i64
  %1 = insertvalue { i64, i64 } undef, i64 %0, 0
  %2 = lshr i128 %srcval, 64
  %3 = trunc i128 %2 to i64
  %4 = insertvalue { i64, i64 } %1, i64 %3, 1
  ret { i64, i64 } %4
}

define i32 @main() nounwind uwtable {
f.exit:
  %0 = load i64* getelementptr inbounds (%struct.R* @R, i64 0, i32 0, i32 0), align 8
  %1 = load i64* getelementptr inbounds (%struct.R* @R, i64 0, i32 1, i32 0), align 8
  %srcval.i = load i128* bitcast (%struct.R* @R to i128*), align 8
  %2 = trunc i128 %srcval.i to i64
  %3 = lshr i128 %srcval.i, 64
  %4 = trunc i128 %3 to i64
  %cmp = icmp eq i64 %2, %0
  %cmp2 = icmp eq i64 %4, %1
  %or.cond = and i1 %cmp, %cmp2
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %f.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %f.exit
  ret i32 0
}

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
