; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060127-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i64 1311768464867721216, align 8

define void @f(i64 %a) nounwind uwtable {
entry:
  %and = and i64 %a, 4294967295
  %cmp = icmp eq i64 %and, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %0 = load i64* @a, align 8, !tbaa !0
  %and.i = and i64 %0, 4294967295
  %cmp.i = icmp eq i64 %and.i, 0
  br i1 %cmp.i, label %f.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

f.exit:                                           ; preds = %entry
  ret i32 0
}

!0 = metadata !{metadata !"long long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
