; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990604-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@b = common global i32 0, align 4

define void @f() nounwind uwtable {
entry:
  %0 = load i32* @b, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %do.body.preheader, label %if.end

do.body.preheader:                                ; preds = %entry
  store i32 9, i32* @b, align 4
  br label %if.end

if.end:                                           ; preds = %do.body.preheader, %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @b, align 4, !tbaa !0
  switch i32 %0, label %if.then [
    i32 0, label %f.exit.thread
    i32 9, label %if.end
  ]

f.exit.thread:                                    ; preds = %entry
  store i32 9, i32* @b, align 4
  br label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry, %f.exit.thread
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
