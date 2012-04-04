; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/940122-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i8* null, align 8
@b = global i8* null, align 8

define void @g(i32 %x) nounwind uwtable {
entry:
  %0 = load i8** @a, align 8, !tbaa !0
  %tobool = icmp ne i8* %0, null
  %1 = load i8** @b, align 8, !tbaa !0
  %tobool2 = icmp ne i8* %1, null
  %cmp = xor i1 %tobool, %tobool2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @f(i32 %x) nounwind uwtable {
entry:
  %0 = load i8** @a, align 8, !tbaa !0
  %tobool.i = icmp ne i8* %0, null
  %1 = load i8** @b, align 8, !tbaa !0
  %tobool2.i = icmp ne i8* %1, null
  %cmp.i = xor i1 %tobool.i, %tobool2.i
  br i1 %cmp.i, label %if.then.i, label %g.exit

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

g.exit:                                           ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i8** @a, align 8, !tbaa !0
  %tobool.i.i = icmp ne i8* %0, null
  %1 = load i8** @b, align 8, !tbaa !0
  %tobool2.i.i = icmp ne i8* %1, null
  %cmp.i.i = xor i1 %tobool.i.i, %tobool2.i.i
  br i1 %cmp.i.i, label %if.then.i.i, label %f.exit

if.then.i.i:                                      ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

f.exit:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
