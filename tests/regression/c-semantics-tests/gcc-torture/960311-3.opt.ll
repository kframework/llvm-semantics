; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960311-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@count = common global i32 0, align 4

define void @a1() nounwind uwtable {
entry:
  %0 = load i32* @count, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @count, align 4, !tbaa !0
  ret void
}

define void @b(i64 %data) nounwind uwtable {
entry:
  %and = and i64 %data, 2147483648
  %tobool = icmp eq i64 %and, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %0 = load i32* @count, align 4, !tbaa !0
  %inc.i = add nsw i32 %0, 1
  store i32 %inc.i, i32* @count, align 4, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %and1 = and i64 %data, 1073741824
  %tobool2 = icmp eq i64 %and1, 0
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  %1 = load i32* @count, align 4, !tbaa !0
  %inc.i11 = add nsw i32 %1, 1
  store i32 %inc.i11, i32* @count, align 4, !tbaa !0
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then3
  %and6 = and i64 %data, 536870912
  %tobool7 = icmp eq i64 %and6, 0
  br i1 %tobool7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end4
  %2 = load i32* @count, align 4, !tbaa !0
  %inc.i10 = add nsw i32 %2, 1
  store i32 %inc.i10, i32* @count, align 4, !tbaa !0
  br label %if.end9

if.end9:                                          ; preds = %if.end4, %if.then8
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end9:
  store i32 3, i32* @count, align 4, !tbaa !0
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
