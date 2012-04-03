; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020615-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.font_hints_s = type { i32, i32, i32 }
%struct.gs_fixed_point_s = type { i64, i64 }

@main.fh = internal global [3 x %struct.font_hints_s] [%struct.font_hints_s { i32 0, i32 1, i32 0 }, %struct.font_hints_s { i32 0, i32 0, i32 1 }, %struct.font_hints_s zeroinitializer], align 16
@main.gsf = internal global [4 x %struct.gs_fixed_point_s] [%struct.gs_fixed_point_s { i64 196608, i64 80216 }, %struct.gs_fixed_point_s { i64 196608, i64 98697 }, %struct.gs_fixed_point_s { i64 80216, i64 196608 }, %struct.gs_fixed_point_s { i64 98697, i64 196608 }], align 16

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i32 @line_hints(%struct.font_hints_s* %fh, %struct.gs_fixed_point_s* %p0, %struct.gs_fixed_point_s* %p1) nounwind uwtable readonly {
entry:
  %x = getelementptr inbounds %struct.gs_fixed_point_s* %p1, i64 0, i32 0
  %tmp1 = load i64* %x, align 8
  %x3 = getelementptr inbounds %struct.gs_fixed_point_s* %p0, i64 0, i32 0
  %tmp4 = load i64* %x3, align 8
  %sub = sub nsw i64 %tmp1, %tmp4
  %y = getelementptr inbounds %struct.gs_fixed_point_s* %p1, i64 0, i32 1
  %tmp7 = load i64* %y, align 8
  %y9 = getelementptr inbounds %struct.gs_fixed_point_s* %p0, i64 0, i32 1
  %tmp10 = load i64* %y9, align 8
  %sub11 = sub nsw i64 %tmp7, %tmp10
  %x_inverted = getelementptr inbounds %struct.font_hints_s* %fh, i64 0, i32 1
  %tmp16 = load i32* %x_inverted, align 4
  %y_inverted = getelementptr inbounds %struct.font_hints_s* %fh, i64 0, i32 2
  %tmp19 = load i32* %y_inverted, align 4
  %tobool = icmp eq i32 %tmp16, 0
  %sub23 = sub nsw i64 0, %sub
  %tmp782 = select i1 %tobool, i64 %sub, i64 %sub23
  %sub28 = sub nsw i64 0, %sub11
  %tobool25 = icmp eq i32 %tmp19, 0
  %sub11.sub28 = select i1 %tobool25, i64 %sub11, i64 %sub28
  %axes_swapped = getelementptr inbounds %struct.font_hints_s* %fh, i64 0, i32 0
  %tmp31 = load i32* %axes_swapped, align 4
  %tobool32 = icmp eq i32 %tmp31, 0
  br i1 %tobool32, label %if.end42, label %if.then33

if.then33:                                        ; preds = %entry
  br label %if.end42

if.end42:                                         ; preds = %entry, %if.then33
  %tmp816 = phi i32 [ %tmp19, %entry ], [ %tmp16, %if.then33 ]
  %tmp655 = phi i32 [ %tmp16, %entry ], [ %tmp19, %if.then33 ]
  %tmp623 = phi i64 [ %sub11.sub28, %entry ], [ %tmp782, %if.then33 ]
  %tmp781 = phi i64 [ %tmp782, %entry ], [ %sub11.sub28, %if.then33 ]
  %cmp = icmp slt i64 %tmp781, 0
  %sub45 = sub nsw i64 0, %tmp781
  %cond = select i1 %cmp, i64 %sub45, i64 %tmp781
  %cmp48 = icmp slt i64 %tmp623, 0
  %sub51 = sub nsw i64 0, %tmp623
  %cond55 = select i1 %cmp48, i64 %sub51, i64 %tmp623
  %cmp57 = icmp eq i64 %tmp623, 0
  br i1 %cmp57, label %if.else, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end42
  %shr = ashr i64 %cond55, 4
  %cmp60 = icmp sgt i64 %cond, %shr
  br i1 %cmp60, label %if.else, label %if.then61

if.then61:                                        ; preds = %land.lhs.true
  %cmp63 = icmp sgt i64 %tmp623, 0
  %cond64 = select i1 %cmp63, i32 2, i32 1
  %tobool66 = icmp eq i32 %tmp655, 0
  br i1 %tobool66, label %if.end89, label %if.then67

if.then67:                                        ; preds = %if.then61
  %xor = xor i32 %cond64, 3
  br label %if.end89

if.else:                                          ; preds = %land.lhs.true, %if.end42
  %cmp71 = icmp eq i64 %tmp781, 0
  br i1 %cmp71, label %if.end89, label %land.lhs.true72

land.lhs.true72:                                  ; preds = %if.else
  %shr75 = ashr i64 %cond, 4
  %cmp76 = icmp sgt i64 %cond55, %shr75
  br i1 %cmp76, label %if.end89, label %if.then77

if.then77:                                        ; preds = %land.lhs.true72
  %cond80 = select i1 %cmp, i32 8, i32 4
  %tobool82 = icmp eq i32 %tmp816, 0
  br i1 %tobool82, label %if.end89, label %if.then83

if.then83:                                        ; preds = %if.then77
  %xor85 = xor i32 %cond80, 12
  br label %if.end89

if.end89:                                         ; preds = %if.else, %land.lhs.true72, %if.then77, %if.then83, %if.then67, %if.then61
  %tmp907 = phi i32 [ %cond80, %if.then77 ], [ %xor85, %if.then83 ], [ %xor, %if.then67 ], [ %cond64, %if.then61 ], [ 0, %land.lhs.true72 ], [ 0, %if.else ]
  ret i32 %tmp907
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp1.i = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 1, i32 0), align 16
  %tmp4.i = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 0, i32 0), align 16
  %sub.i = sub nsw i64 %tmp1.i, %tmp4.i
  %tmp7.i = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 1, i32 1), align 8
  %tmp10.i = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 0, i32 1), align 8
  %sub11.i = sub nsw i64 %tmp7.i, %tmp10.i
  %tmp16.i = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 0, i32 1), align 4
  %tmp19.i = load i64* bitcast (i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 0, i32 2) to i64*), align 8
  %0 = trunc i64 %tmp19.i to i32
  %tobool.i = icmp eq i32 %tmp16.i, 0
  %sub23.i = sub nsw i64 0, %sub.i
  %tmp782.i = select i1 %tobool.i, i64 %sub.i, i64 %sub23.i
  %sub28.i = sub nsw i64 0, %sub11.i
  %tobool25.i = icmp eq i32 %0, 0
  %sub11.sub28.i = select i1 %tobool25.i, i64 %sub11.i, i64 %sub28.i
  %tmp31.i = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 0, i32 0), align 16
  %tobool32.i = icmp eq i32 %tmp31.i, 0
  %tmp655.i = select i1 %tobool32.i, i32 %tmp16.i, i32 %0
  %tmp623.i = select i1 %tobool32.i, i64 %sub11.sub28.i, i64 %tmp782.i
  %tmp781.i = select i1 %tobool32.i, i64 %tmp782.i, i64 %sub11.sub28.i
  %cmp57.i = icmp eq i64 %tmp623.i, 0
  br i1 %cmp57.i, label %if.then, label %land.lhs.true.i

land.lhs.true.i:                                  ; preds = %entry
  %sub51.i = sub nsw i64 0, %tmp623.i
  %cmp48.i = icmp slt i64 %tmp623.i, 0
  %sub45.i = sub nsw i64 0, %tmp781.i
  %cmp.i = icmp slt i64 %tmp781.i, 0
  %cond55.i = select i1 %cmp48.i, i64 %sub51.i, i64 %tmp623.i
  %cond.i = select i1 %cmp.i, i64 %sub45.i, i64 %tmp781.i
  %shr.i = ashr i64 %cond55.i, 4
  %cmp60.i = icmp sgt i64 %cond.i, %shr.i
  br i1 %cmp60.i, label %if.then, label %if.then61.i

if.then61.i:                                      ; preds = %land.lhs.true.i
  %cmp63.i = icmp sgt i64 %tmp623.i, 0
  %cond64.i = select i1 %cmp63.i, i32 2, i32 1
  %tobool66.i = icmp eq i32 %tmp655.i, 0
  %xor.i = xor i32 %cond64.i, 3
  %tmp907.i = select i1 %tobool66.i, i32 %cond64.i, i32 %xor.i
  %cmp = icmp eq i32 %tmp907.i, 1
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %if.then61.i
  %tmp1.i51 = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 3, i32 0), align 16
  %tmp4.i52 = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 2, i32 0), align 16
  %sub.i53 = sub nsw i64 %tmp1.i51, %tmp4.i52
  %tmp7.i54 = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 3, i32 1), align 8
  %tmp10.i55 = load i64* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i64 0, i64 2, i32 1), align 8
  %sub11.i56 = sub nsw i64 %tmp7.i54, %tmp10.i55
  %tmp16.i57 = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 1, i32 1), align 4
  %tmp19.i58 = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 1, i32 2), align 4
  %tobool.i59 = icmp eq i32 %tmp16.i57, 0
  %sub23.i60 = sub nsw i64 0, %sub.i53
  %tmp782.i61 = select i1 %tobool.i59, i64 %sub.i53, i64 %sub23.i60
  %sub28.i62 = sub nsw i64 0, %sub11.i56
  %tobool25.i63 = icmp eq i32 %tmp19.i58, 0
  %sub11.sub28.i64 = select i1 %tobool25.i63, i64 %sub11.i56, i64 %sub28.i62
  %tobool32.i66 = icmp ult i64 %tmp19.i, 4294967296
  %tmp816.i68 = select i1 %tobool32.i66, i32 %tmp19.i58, i32 %tmp16.i57
  %tmp623.i70 = select i1 %tobool32.i66, i64 %sub11.sub28.i64, i64 %tmp782.i61
  %tmp781.i71 = select i1 %tobool32.i66, i64 %tmp782.i61, i64 %sub11.sub28.i64
  %cmp.i72 = icmp slt i64 %tmp781.i71, 0
  %sub45.i73 = sub nsw i64 0, %tmp781.i71
  %cond.i74 = select i1 %cmp.i72, i64 %sub45.i73, i64 %tmp781.i71
  %cmp48.i75 = icmp slt i64 %tmp623.i70, 0
  %sub51.i76 = sub nsw i64 0, %tmp623.i70
  %cond55.i77 = select i1 %cmp48.i75, i64 %sub51.i76, i64 %tmp623.i70
  %cmp57.i78 = icmp eq i64 %tmp623.i70, 0
  br i1 %cmp57.i78, label %if.else.i90, label %land.lhs.true.i82

land.lhs.true.i82:                                ; preds = %lor.lhs.false
  %shr.i80 = ashr i64 %cond55.i77, 4
  %cmp60.i81 = icmp sle i64 %cond.i74, %shr.i80
  %cmp71.i89 = icmp eq i64 %tmp781.i71, 0
  %or.cond = or i1 %cmp60.i81, %cmp71.i89
  %shr75.i91 = ashr i64 %cond.i74, 4
  %cmp76.i92 = icmp sgt i64 %cond55.i77, %shr75.i91
  %or.cond108 = or i1 %or.cond, %cmp76.i92
  br i1 %or.cond108, label %if.then, label %if.then77.i96

if.else.i90:                                      ; preds = %lor.lhs.false
  %cmp71.i89.old = icmp eq i64 %tmp781.i71, 0
  br i1 %cmp71.i89.old, label %if.then, label %land.lhs.true72.i93

land.lhs.true72.i93:                              ; preds = %if.else.i90
  %.old = ashr i64 %cond.i74, 4
  %cmp76.i92.old = icmp sgt i64 %cond55.i77, %.old
  br i1 %cmp76.i92.old, label %if.then, label %if.then77.i96

if.then77.i96:                                    ; preds = %land.lhs.true.i82, %land.lhs.true72.i93
  %cond80.i94 = select i1 %cmp.i72, i32 8, i32 4
  %tobool82.i95 = icmp eq i32 %tmp816.i68, 0
  %xor85.i97 = xor i32 %cond80.i94, 12
  %tmp907.i99 = select i1 %tobool82.i95, i32 %cond80.i94, i32 %xor85.i97
  %cmp2 = icmp eq i32 %tmp907.i99, 8
  br i1 %cmp2, label %lor.lhs.false3, label %if.then

lor.lhs.false3:                                   ; preds = %if.then77.i96
  %tmp16.i7 = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 2, i32 1), align 4
  %tmp19.i8 = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 2, i32 2), align 8
  %tobool.i9 = icmp eq i32 %tmp16.i7, 0
  %tmp782.i11 = select i1 %tobool.i9, i64 %sub.i53, i64 %sub23.i60
  %tobool25.i13 = icmp eq i32 %tmp19.i8, 0
  %sub11.sub28.i14 = select i1 %tobool25.i13, i64 %sub11.i56, i64 %sub28.i62
  %tmp31.i15 = load i32* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i64 0, i64 2, i32 0), align 8
  %tobool32.i16 = icmp eq i32 %tmp31.i15, 0
  %tmp816.i18 = select i1 %tobool32.i16, i32 %tmp19.i8, i32 %tmp16.i7
  %tmp623.i20 = select i1 %tobool32.i16, i64 %sub11.sub28.i14, i64 %tmp782.i11
  %tmp781.i21 = select i1 %tobool32.i16, i64 %tmp782.i11, i64 %sub11.sub28.i14
  %cmp.i22 = icmp slt i64 %tmp781.i21, 0
  %sub45.i23 = sub nsw i64 0, %tmp781.i21
  %cond.i24 = select i1 %cmp.i22, i64 %sub45.i23, i64 %tmp781.i21
  %cmp48.i25 = icmp slt i64 %tmp623.i20, 0
  %sub51.i26 = sub nsw i64 0, %tmp623.i20
  %cond55.i27 = select i1 %cmp48.i25, i64 %sub51.i26, i64 %tmp623.i20
  %cmp57.i28 = icmp eq i64 %tmp623.i20, 0
  br i1 %cmp57.i28, label %if.else.i40, label %land.lhs.true.i32

land.lhs.true.i32:                                ; preds = %lor.lhs.false3
  %shr.i30 = ashr i64 %cond55.i27, 4
  %cmp60.i31 = icmp sle i64 %cond.i24, %shr.i30
  %cmp71.i39 = icmp eq i64 %tmp781.i21, 0
  %or.cond109 = or i1 %cmp60.i31, %cmp71.i39
  %shr75.i41 = ashr i64 %cond.i24, 4
  %cmp76.i42 = icmp sgt i64 %cond55.i27, %shr75.i41
  %or.cond111 = or i1 %or.cond109, %cmp76.i42
  br i1 %or.cond111, label %if.then, label %if.then77.i46

if.else.i40:                                      ; preds = %lor.lhs.false3
  %cmp71.i39.old = icmp eq i64 %tmp781.i21, 0
  br i1 %cmp71.i39.old, label %if.then, label %land.lhs.true72.i43

land.lhs.true72.i43:                              ; preds = %if.else.i40
  %.old110 = ashr i64 %cond.i24, 4
  %cmp76.i42.old = icmp sgt i64 %cond55.i27, %.old110
  br i1 %cmp76.i42.old, label %if.then, label %if.then77.i46

if.then77.i46:                                    ; preds = %land.lhs.true.i32, %land.lhs.true72.i43
  %cond80.i44 = select i1 %cmp.i22, i32 8, i32 4
  %tobool82.i45 = icmp eq i32 %tmp816.i18, 0
  %xor85.i47 = xor i32 %cond80.i44, 12
  %tmp907.i49 = select i1 %tobool82.i45, i32 %cond80.i44, i32 %xor85.i47
  %cmp5 = icmp eq i32 %tmp907.i49, 4
  br i1 %cmp5, label %if.end, label %if.then

if.then:                                          ; preds = %entry, %land.lhs.true.i, %land.lhs.true.i32, %land.lhs.true.i82, %if.else.i40, %land.lhs.true72.i43, %if.else.i90, %land.lhs.true72.i93, %if.then77.i46, %if.then77.i96, %if.then61.i
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then77.i46
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
