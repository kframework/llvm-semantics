; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010403-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@e = common global i32 0, align 4

define void @a(i32 %x, i32 %y) nounwind uwtable {
c.exit:
  ret void
}

define void @b(i32* nocapture %y) nounwind uwtable {
entry:
  %0 = load i32* %y, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* %y, align 4, !tbaa !0
  ret void
}

define void @c(i32 %x, i32 %y) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %x, %y
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @d(i32 %x) nounwind uwtable readnone {
entry:
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
