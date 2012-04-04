; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/packed-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type <{ i16 }>

@x1 = global i16 17, align 2
@t = common global %struct.anon zeroinitializer, align 1

define void @f() nounwind uwtable {
entry:
  %0 = load i16* @x1, align 2, !tbaa !0
  store i16 %0, i16* getelementptr inbounds (%struct.anon* @t, i64 0, i32 0), align 1, !tbaa !0
  %cmp = icmp eq i16 %0, 17
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i16* @x1, align 2, !tbaa !0
  store i16 %0, i16* getelementptr inbounds (%struct.anon* @t, i64 0, i32 0), align 1, !tbaa !0
  %cmp.i = icmp eq i16 %0, 17
  br i1 %cmp.i, label %f.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

f.exit:                                           ; preds = %entry
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"short", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
