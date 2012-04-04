; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr19606.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i8 -4, align 1

define i32 @foo() nounwind uwtable readonly {
entry:
  %0 = load i8* @a, align 1, !tbaa !0
  %conv = sext i8 %0 to i64
  %conv1 = lshr i64 %conv, 1
  %conv1.tr = trunc i64 %conv1 to i32
  %conv2 = and i32 %conv1.tr, 2147483647
  ret i32 %conv2
}

define i32 @bar() nounwind uwtable readonly {
entry:
  %0 = load i8* @a, align 1, !tbaa !0
  %conv = sext i8 %0 to i32
  %rem = urem i32 %conv, 5
  ret i32 %rem
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i8* @a, align 1, !tbaa !0
  %conv.i = sext i8 %0 to i64
  %conv2.i = and i64 %conv.i, 4294967294
  %cmp = icmp eq i64 %conv2.i, 4294967292
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %conv.i8 = sext i8 %0 to i32
  %rem.i = urem i32 %conv.i8, 5
  %cmp4 = icmp eq i32 %rem.i, 2
  br i1 %cmp4, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
