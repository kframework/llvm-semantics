; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020615-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.font_hints_s = type { i32, i32, i32 }
%struct.gs_fixed_point_s = type { i64, i64 }

@main.fh = internal global [3 x %struct.font_hints_s] [%struct.font_hints_s { i32 0, i32 1, i32 0 }, %struct.font_hints_s { i32 0, i32 0, i32 1 }, %struct.font_hints_s zeroinitializer], align 16
@main.gsf = internal global [4 x %struct.gs_fixed_point_s] [%struct.gs_fixed_point_s { i64 196608, i64 80216 }, %struct.gs_fixed_point_s { i64 196608, i64 98697 }, %struct.gs_fixed_point_s { i64 80216, i64 196608 }, %struct.gs_fixed_point_s { i64 98697, i64 196608 }], align 16

define i32 @line_hints(%struct.font_hints_s* nocapture %fh, %struct.gs_fixed_point_s* nocapture %p0, %struct.gs_fixed_point_s* nocapture %p1) nounwind uwtable readonly {
entry:
  %x = getelementptr inbounds %struct.gs_fixed_point_s* %p1, i64 0, i32 0
  %0 = load i64* %x, align 8, !tbaa !0
  %x1 = getelementptr inbounds %struct.gs_fixed_point_s* %p0, i64 0, i32 0
  %1 = load i64* %x1, align 8, !tbaa !0
  %sub = sub nsw i64 %0, %1
  %y = getelementptr inbounds %struct.gs_fixed_point_s* %p1, i64 0, i32 1
  %2 = load i64* %y, align 8, !tbaa !0
  %y2 = getelementptr inbounds %struct.gs_fixed_point_s* %p0, i64 0, i32 1
  %3 = load i64* %y2, align 8, !tbaa !0
  %sub3 = sub nsw i64 %2, %3
  %x_inverted = getelementptr inbounds %struct.font_hints_s* %fh, i64 0, i32 1
  %4 = load i32* %x_inverted, align 4, !tbaa !3
  %y_inverted = getelementptr inbounds %struct.font_hints_s* %fh, i64 0, i32 2
  %5 = load i32* %y_inverted, align 4, !tbaa !3
  %tobool = icmp eq i32 %4, 0
  %sub4 = sub nsw i64 0, %sub
  %dx.0 = select i1 %tobool, i64 %sub, i64 %sub4
  %tobool5 = icmp eq i32 %5, 0
  %sub7 = sub nsw i64 0, %sub3
  %sub3.sub7 = select i1 %tobool5, i64 %sub3, i64 %sub7
  %axes_swapped = getelementptr inbounds %struct.font_hints_s* %fh, i64 0, i32 0
  %6 = load i32* %axes_swapped, align 4, !tbaa !3
  %tobool9 = icmp eq i32 %6, 0
  %sub3.sub7.dx.0 = select i1 %tobool9, i64 %sub3.sub7, i64 %dx.0
  %dx.0.sub3.sub7 = select i1 %tobool9, i64 %dx.0, i64 %sub3.sub7
  %. = select i1 %tobool9, i32 %4, i32 %5
  %.41 = select i1 %tobool9, i32 %5, i32 %4
  %cmp = icmp slt i64 %dx.0.sub3.sub7, 0
  %sub12 = sub nsw i64 0, %dx.0.sub3.sub7
  %cond = select i1 %cmp, i64 %sub12, i64 %dx.0.sub3.sub7
  %cmp13 = icmp slt i64 %sub3.sub7.dx.0, 0
  %sub15 = sub nsw i64 0, %sub3.sub7.dx.0
  %cond18 = select i1 %cmp13, i64 %sub15, i64 %sub3.sub7.dx.0
  %cmp19 = icmp eq i64 %sub3.sub7.dx.0, 0
  br i1 %cmp19, label %if.else, label %land.lhs.true

land.lhs.true:                                    ; preds = %entry
  %shr = ashr i64 %cond18, 4
  %cmp20 = icmp sgt i64 %cond, %shr
  br i1 %cmp20, label %if.else, label %if.then21

if.then21:                                        ; preds = %land.lhs.true
  %cmp22 = icmp sgt i64 %sub3.sub7.dx.0, 0
  %cond23 = select i1 %cmp22, i32 2, i32 1
  %tobool24 = icmp eq i32 %., 0
  br i1 %tobool24, label %if.end40, label %if.then25

if.then25:                                        ; preds = %if.then21
  %xor = xor i32 %cond23, 3
  br label %if.end40

if.else:                                          ; preds = %land.lhs.true, %entry
  %cmp27 = icmp eq i64 %dx.0.sub3.sub7, 0
  br i1 %cmp27, label %if.end40, label %land.lhs.true28

land.lhs.true28:                                  ; preds = %if.else
  %shr29 = ashr i64 %cond, 4
  %cmp30 = icmp sgt i64 %cond18, %shr29
  br i1 %cmp30, label %if.end40, label %if.then31

if.then31:                                        ; preds = %land.lhs.true28
  %cond33 = select i1 %cmp, i32 8, i32 4
  %tobool34 = icmp eq i32 %.41, 0
  br i1 %tobool34, label %if.end40, label %if.then35

if.then35:                                        ; preds = %if.then31
  %xor36 = xor i32 %cond33, 12
  br label %if.end40

if.end40:                                         ; preds = %if.else, %land.lhs.true28, %if.then21, %if.then31, %if.then35, %if.then25
  %hints.0 = phi i32 [ %xor, %if.then25 ], [ %cond23, %if.then21 ], [ %xor36, %if.then35 ], [ %cond33, %if.then31 ], [ 0, %land.lhs.true28 ], [ 0, %if.else ]
  ret i32 %hints.0
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 1, i32 0), align 16, !tbaa !0
  %1 = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 0, i32 0), align 16, !tbaa !0
  %sub.i = sub nsw i64 %0, %1
  %2 = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 1, i32 1), align 8, !tbaa !0
  %3 = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 0, i32 1), align 8, !tbaa !0
  %sub3.i = sub nsw i64 %2, %3
  %4 = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 0, i32 1), align 4, !tbaa !3
  %5 = load i64* bitcast (i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 0, i32 2) to i64*), align 8
  %6 = trunc i64 %5 to i32
  %tobool.i = icmp eq i32 %4, 0
  %sub4.i = sub nsw i64 0, %sub.i
  %dx.0.i = select i1 %tobool.i, i64 %sub.i, i64 %sub4.i
  %tobool5.i = icmp eq i32 %6, 0
  %sub7.i = sub nsw i64 0, %sub3.i
  %sub3.sub7.i = select i1 %tobool5.i, i64 %sub3.i, i64 %sub7.i
  %7 = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 0, i32 0), align 16, !tbaa !3
  %tobool9.i = icmp eq i32 %7, 0
  %sub3.sub7.dx.0.i = select i1 %tobool9.i, i64 %sub3.sub7.i, i64 %dx.0.i
  %dx.0.sub3.sub7.i = select i1 %tobool9.i, i64 %dx.0.i, i64 %sub3.sub7.i
  %..i = select i1 %tobool9.i, i32 %4, i32 %6
  %cmp19.i = icmp eq i64 %sub3.sub7.dx.0.i, 0
  br i1 %cmp19.i, label %if.then, label %land.lhs.true.i

land.lhs.true.i:                                  ; preds = %entry
  %sub15.i = sub nsw i64 0, %sub3.sub7.dx.0.i
  %cmp13.i = icmp slt i64 %sub3.sub7.dx.0.i, 0
  %sub12.i = sub nsw i64 0, %dx.0.sub3.sub7.i
  %cmp.i = icmp slt i64 %dx.0.sub3.sub7.i, 0
  %cond18.i = select i1 %cmp13.i, i64 %sub15.i, i64 %sub3.sub7.dx.0.i
  %cond.i = select i1 %cmp.i, i64 %sub12.i, i64 %dx.0.sub3.sub7.i
  %shr.i = ashr i64 %cond18.i, 4
  %cmp20.i = icmp sgt i64 %cond.i, %shr.i
  br i1 %cmp20.i, label %if.then, label %if.then21.i

if.then21.i:                                      ; preds = %land.lhs.true.i
  %cmp22.i = icmp sgt i64 %sub3.sub7.dx.0.i, 0
  %cond23.i = select i1 %cmp22.i, i32 2, i32 1
  %tobool24.i = icmp eq i32 %..i, 0
  %xor.i = xor i32 %cond23.i, 3
  %hints.0.i = select i1 %tobool24.i, i32 %cond23.i, i32 %xor.i
  %cmp = icmp eq i32 %hints.0.i, 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %if.then21.i
  %8 = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 3, i32 0), align 16, !tbaa !0
  %9 = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 2, i32 0), align 16, !tbaa !0
  %sub.i47 = sub nsw i64 %8, %9
  %10 = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 3, i32 1), align 8, !tbaa !0
  %11 = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 2, i32 1), align 8, !tbaa !0
  %sub3.i48 = sub nsw i64 %10, %11
  %12 = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 1, i32 1), align 4, !tbaa !3
  %13 = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 1, i32 2), align 4, !tbaa !3
  %tobool.i49 = icmp eq i32 %12, 0
  %sub4.i50 = sub nsw i64 0, %sub.i47
  %dx.0.i51 = select i1 %tobool.i49, i64 %sub.i47, i64 %sub4.i50
  %tobool5.i52 = icmp eq i32 %13, 0
  %sub7.i53 = sub nsw i64 0, %sub3.i48
  %sub3.sub7.i54 = select i1 %tobool5.i52, i64 %sub3.i48, i64 %sub7.i53
  %tobool9.i55 = icmp ult i64 %5, 4294967296
  %sub3.sub7.dx.0.i56 = select i1 %tobool9.i55, i64 %sub3.sub7.i54, i64 %dx.0.i51
  %dx.0.sub3.sub7.i57 = select i1 %tobool9.i55, i64 %dx.0.i51, i64 %sub3.sub7.i54
  %.41.i59 = select i1 %tobool9.i55, i32 %13, i32 %12
  %cmp.i60 = icmp slt i64 %dx.0.sub3.sub7.i57, 0
  %sub12.i61 = sub nsw i64 0, %dx.0.sub3.sub7.i57
  %cond.i62 = select i1 %cmp.i60, i64 %sub12.i61, i64 %dx.0.sub3.sub7.i57
  %cmp13.i63 = icmp slt i64 %sub3.sub7.dx.0.i56, 0
  %sub15.i64 = sub nsw i64 0, %sub3.sub7.dx.0.i56
  %cond18.i65 = select i1 %cmp13.i63, i64 %sub15.i64, i64 %sub3.sub7.dx.0.i56
  %cmp19.i66 = icmp eq i64 %sub3.sub7.dx.0.i56, 0
  br i1 %cmp19.i66, label %if.else.i77, label %land.lhs.true.i69

land.lhs.true.i69:                                ; preds = %lor.lhs.false
  %shr.i67 = ashr i64 %cond18.i65, 4
  %cmp20.i68 = icmp sle i64 %cond.i62, %shr.i67
  %cmp27.i76 = icmp eq i64 %dx.0.sub3.sub7.i57, 0
  %or.cond = or i1 %cmp20.i68, %cmp27.i76
  %shr29.i78 = ashr i64 %cond.i62, 4
  %cmp30.i79 = icmp sgt i64 %cond18.i65, %shr29.i78
  %or.cond94 = or i1 %or.cond, %cmp30.i79
  br i1 %or.cond94, label %if.then, label %if.then31.i83

if.else.i77:                                      ; preds = %lor.lhs.false
  %cmp27.i76.old = icmp eq i64 %dx.0.sub3.sub7.i57, 0
  br i1 %cmp27.i76.old, label %if.then, label %land.lhs.true28.i80

land.lhs.true28.i80:                              ; preds = %if.else.i77
  %.old = ashr i64 %cond.i62, 4
  %cmp30.i79.old = icmp sgt i64 %cond18.i65, %.old
  br i1 %cmp30.i79.old, label %if.then, label %if.then31.i83

if.then31.i83:                                    ; preds = %land.lhs.true.i69, %land.lhs.true28.i80
  %cond33.i81 = select i1 %cmp.i60, i32 8, i32 4
  %tobool34.i82 = icmp eq i32 %.41.i59, 0
  %xor36.i84 = xor i32 %cond33.i81, 12
  %hints.0.i86 = select i1 %tobool34.i82, i32 %cond33.i81, i32 %xor36.i84
  %cmp2 = icmp eq i32 %hints.0.i86, 8
  br i1 %cmp2, label %lor.lhs.false3, label %if.then

lor.lhs.false3:                                   ; preds = %if.then31.i83
  %14 = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 2, i32 1), align 4, !tbaa !3
  %15 = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 2, i32 2), align 8, !tbaa !3
  %tobool.i8 = icmp eq i32 %14, 0
  %dx.0.i10 = select i1 %tobool.i8, i64 %sub.i47, i64 %sub4.i50
  %tobool5.i11 = icmp eq i32 %15, 0
  %sub3.sub7.i13 = select i1 %tobool5.i11, i64 %sub3.i48, i64 %sub7.i53
  %16 = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 2, i32 0), align 8, !tbaa !3
  %tobool9.i14 = icmp eq i32 %16, 0
  %sub3.sub7.dx.0.i15 = select i1 %tobool9.i14, i64 %sub3.sub7.i13, i64 %dx.0.i10
  %dx.0.sub3.sub7.i16 = select i1 %tobool9.i14, i64 %dx.0.i10, i64 %sub3.sub7.i13
  %.41.i18 = select i1 %tobool9.i14, i32 %15, i32 %14
  %cmp.i19 = icmp slt i64 %dx.0.sub3.sub7.i16, 0
  %sub12.i20 = sub nsw i64 0, %dx.0.sub3.sub7.i16
  %cond.i21 = select i1 %cmp.i19, i64 %sub12.i20, i64 %dx.0.sub3.sub7.i16
  %cmp13.i22 = icmp slt i64 %sub3.sub7.dx.0.i15, 0
  %sub15.i23 = sub nsw i64 0, %sub3.sub7.dx.0.i15
  %cond18.i24 = select i1 %cmp13.i22, i64 %sub15.i23, i64 %sub3.sub7.dx.0.i15
  %cmp19.i25 = icmp eq i64 %sub3.sub7.dx.0.i15, 0
  br i1 %cmp19.i25, label %if.else.i36, label %land.lhs.true.i28

land.lhs.true.i28:                                ; preds = %lor.lhs.false3
  %shr.i26 = ashr i64 %cond18.i24, 4
  %cmp20.i27 = icmp sle i64 %cond.i21, %shr.i26
  %cmp27.i35 = icmp eq i64 %dx.0.sub3.sub7.i16, 0
  %or.cond95 = or i1 %cmp20.i27, %cmp27.i35
  %shr29.i37 = ashr i64 %cond.i21, 4
  %cmp30.i38 = icmp sgt i64 %cond18.i24, %shr29.i37
  %or.cond97 = or i1 %or.cond95, %cmp30.i38
  br i1 %or.cond97, label %if.then, label %if.then31.i42

if.else.i36:                                      ; preds = %lor.lhs.false3
  %cmp27.i35.old = icmp eq i64 %dx.0.sub3.sub7.i16, 0
  br i1 %cmp27.i35.old, label %if.then, label %land.lhs.true28.i39

land.lhs.true28.i39:                              ; preds = %if.else.i36
  %.old96 = ashr i64 %cond.i21, 4
  %cmp30.i38.old = icmp sgt i64 %cond18.i24, %.old96
  br i1 %cmp30.i38.old, label %if.then, label %if.then31.i42

if.then31.i42:                                    ; preds = %land.lhs.true.i28, %land.lhs.true28.i39
  %cond33.i40 = select i1 %cmp.i19, i32 8, i32 4
  %tobool34.i41 = icmp eq i32 %.41.i18, 0
  %xor36.i43 = xor i32 %cond33.i40, 12
  %hints.0.i45 = select i1 %tobool34.i41, i32 %cond33.i40, i32 %xor36.i43
  %cmp5 = icmp eq i32 %hints.0.i45, 4
  br i1 %cmp5, label %if.end, label %if.then

if.then:                                          ; preds = %entry, %land.lhs.true.i, %land.lhs.true.i28, %land.lhs.true.i69, %if.else.i36, %land.lhs.true28.i39, %if.else.i77, %land.lhs.true28.i80, %if.then31.i42, %if.then31.i83, %if.then21.i
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then31.i42
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

!0 = metadata !{metadata !"long", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
!3 = metadata !{metadata !"int", metadata !1}
