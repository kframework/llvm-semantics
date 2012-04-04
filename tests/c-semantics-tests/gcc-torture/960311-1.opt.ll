; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960311-1.c'
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

define void @b(i8 zeroext %data) nounwind uwtable {
entry:
  %tobool = icmp sgt i8 %data, -1
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %0 = load i32* @count, align 4, !tbaa !0
  %inc.i = add nsw i32 %0, 1
  store i32 %inc.i, i32* @count, align 4, !tbaa !0
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %and4 = and i8 %data, 64
  %tobool5 = icmp eq i8 %and4, 0
  br i1 %tobool5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %if.end
  %1 = load i32* @count, align 4, !tbaa !0
  %inc.i17 = add nsw i32 %1, 1
  store i32 %inc.i17, i32* @count, align 4, !tbaa !0
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then6
  %and12 = and i8 %data, 32
  %tobool13 = icmp eq i8 %and12, 0
  br i1 %tobool13, label %if.end15, label %if.then14

if.then14:                                        ; preds = %if.end7
  %2 = load i32* @count, align 4, !tbaa !0
  %inc.i16 = add nsw i32 %2, 1
  store i32 %inc.i16, i32* @count, align 4, !tbaa !0
  br label %if.end15

if.end15:                                         ; preds = %if.end7, %if.then14
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
