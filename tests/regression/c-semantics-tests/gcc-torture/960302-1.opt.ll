; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960302-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i64 1, align 8

define i32 @foo() nounwind uwtable readonly {
entry:
  %0 = load i64* @a, align 8, !tbaa !0
  %rem = srem i64 %0, 2
  %rem1 = srem i64 %rem, 2
  %rem2 = srem i64 %rem1, 2
  %rem3 = srem i64 %rem2, 2
  %rem4 = srem i64 %rem3, 2
  %rem5 = srem i64 %rem4, 2
  %rem6 = srem i64 %rem5, 2
  %rem7 = srem i64 %rem6, 2
  switch i64 %rem7, label %sw.default [
    i64 0, label %return
    i64 1, label %sw.bb8
  ]

sw.bb8:                                           ; preds = %entry
  br label %return

sw.default:                                       ; preds = %entry
  br label %return

return:                                           ; preds = %entry, %sw.default, %sw.bb8
  %retval.0 = phi i32 [ -1, %sw.default ], [ 1, %sw.bb8 ], [ 0, %entry ]
  ret i32 %retval.0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i64* @a, align 8, !tbaa !0
  %rem.i = srem i64 %0, 2
  %rem1.i = srem i64 %rem.i, 2
  %rem2.i = srem i64 %rem1.i, 2
  %rem3.i = srem i64 %rem2.i, 2
  %rem4.i = srem i64 %rem3.i, 2
  %rem5.i = srem i64 %rem4.i, 2
  %rem6.i = srem i64 %rem5.i, 2
  %rem7.i = srem i64 %rem6.i, 2
  %cond = icmp eq i64 %rem7.i, 1
  br i1 %cond, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
