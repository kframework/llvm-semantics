; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080522-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@i = internal global i32 0, align 4

define i32 @foo(i32* nocapture %q) nounwind uwtable noinline {
entry:
  store i32 1, i32* @i, align 4, !tbaa !0
  store i32 2, i32* %q, align 4, !tbaa !0
  %0 = load i32* @i, align 4, !tbaa !0
  ret i32 %0
}

define i32 @bar(i32* nocapture %q) nounwind uwtable noinline {
entry:
  store i32 2, i32* %q, align 4, !tbaa !0
  store i32 1, i32* @i, align 4, !tbaa !0
  %0 = load i32* %q, align 4, !tbaa !0
  ret i32 %0
}

define i32 @main() nounwind uwtable {
entry:
  %j = alloca i32, align 4
  store i32 0, i32* %j, align 4, !tbaa !0
  %call = call i32 @foo(i32* @i)
  %cmp = icmp eq i32 %call, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @bar(i32* @i)
  %cmp2 = icmp eq i32 %call1, 1
  br i1 %cmp2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @foo(i32* %j)
  %cmp6 = icmp eq i32 %call5, 1
  br i1 %cmp6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %0 = load i32* %j, align 4, !tbaa !0
  %cmp9 = icmp eq i32 %0, 2
  br i1 %cmp9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end8
  %call12 = call i32 @bar(i32* %j)
  %cmp13 = icmp eq i32 %call12, 2
  br i1 %cmp13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end11
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end11
  %1 = load i32* %j, align 4, !tbaa !0
  %cmp16 = icmp eq i32 %1, 2
  br i1 %cmp16, label %if.end18, label %if.then17

if.then17:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end15
  ret i32 0
}

declare void @abort() noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
