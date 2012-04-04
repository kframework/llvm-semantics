; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020201-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@cx = global i8 7, align 1
@sx = global i16 14, align 2
@ix = global i32 21, align 4
@lx = global i64 28, align 8
@Lx = global i64 35, align 8

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i8* @cx, align 1, !tbaa !0
  %.off = add i8 %0, -6
  %1 = icmp ugt i8 %.off, 5
  br i1 %1, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %2 = urem i8 %0, 6
  %cmp7 = icmp eq i8 %2, 1
  br i1 %cmp7, label %if.end10, label %if.then9

if.then9:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end
  %3 = load i16* @sx, align 2, !tbaa !2
  %.off58 = add i16 %3, -12
  %4 = icmp ugt i16 %.off58, 5
  br i1 %4, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end10
  tail call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end10
  %5 = urem i16 %3, 6
  %cmp23 = icmp eq i16 %5, 2
  br i1 %cmp23, label %if.end26, label %if.then25

if.then25:                                        ; preds = %if.end18
  tail call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end18
  %6 = load i32* @ix, align 4, !tbaa !3
  %.off59 = add i32 %6, -18
  %7 = icmp ugt i32 %.off59, 5
  br i1 %7, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end26
  tail call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %if.end26
  %rem32 = urem i32 %6, 6
  %cmp33 = icmp eq i32 %rem32, 3
  br i1 %cmp33, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.end31
  tail call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end31
  %8 = load i64* @lx, align 8, !tbaa !4
  %.off60 = add i64 %8, -24
  %9 = icmp ugt i64 %.off60, 5
  br i1 %9, label %if.then40, label %if.end41

if.then40:                                        ; preds = %if.end36
  tail call void @abort() noreturn nounwind
  unreachable

if.end41:                                         ; preds = %if.end36
  %rem42 = urem i64 %8, 6
  %cmp43 = icmp eq i64 %rem42, 4
  br i1 %cmp43, label %if.end46, label %if.then45

if.then45:                                        ; preds = %if.end41
  tail call void @abort() noreturn nounwind
  unreachable

if.end46:                                         ; preds = %if.end41
  %10 = load i64* @Lx, align 8, !tbaa !5
  %.off61 = add i64 %10, -30
  %11 = icmp ugt i64 %.off61, 5
  br i1 %11, label %if.then50, label %if.end51

if.then50:                                        ; preds = %if.end46
  tail call void @abort() noreturn nounwind
  unreachable

if.end51:                                         ; preds = %if.end46
  %rem52 = urem i64 %10, 6
  %cmp53 = icmp eq i64 %rem52, 5
  br i1 %cmp53, label %if.end56, label %if.then55

if.then55:                                        ; preds = %if.end51
  tail call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end51
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
!2 = metadata !{metadata !"short", metadata !0}
!3 = metadata !{metadata !"int", metadata !0}
!4 = metadata !{metadata !"long", metadata !0}
!5 = metadata !{metadata !"long long", metadata !0}
