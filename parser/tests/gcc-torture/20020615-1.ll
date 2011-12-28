; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020615-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.font_hints_s = type { i32, i32, i32 }
%struct.gs_fixed_point_s = type { i64, i64 }

@main.fh = internal global [3 x %struct.font_hints_s] [%struct.font_hints_s { i32 0, i32 1, i32 0 }, %struct.font_hints_s { i32 0, i32 0, i32 1 }, %struct.font_hints_s zeroinitializer], align 16
@main.gsf = internal global [4 x %struct.gs_fixed_point_s] [%struct.gs_fixed_point_s { i64 196608, i64 80216 }, %struct.gs_fixed_point_s { i64 196608, i64 98697 }, %struct.gs_fixed_point_s { i64 80216, i64 196608 }, %struct.gs_fixed_point_s { i64 98697, i64 196608 }], align 16

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @line_hints(%struct.font_hints_s* %fh, %struct.gs_fixed_point_s* %p0, %struct.gs_fixed_point_s* %p1) nounwind uwtable {
entry:
  %fh.addr = alloca %struct.font_hints_s*, align 8
  %p0.addr = alloca %struct.gs_fixed_point_s*, align 8
  %p1.addr = alloca %struct.gs_fixed_point_s*, align 8
  %dx = alloca i64, align 8
  %dy = alloca i64, align 8
  %adx = alloca i64, align 8
  %ady = alloca i64, align 8
  %xi = alloca i32, align 4
  %yi = alloca i32, align 4
  %hints = alloca i32, align 4
  %t = alloca i64, align 8
  %ti = alloca i32, align 4
  store %struct.font_hints_s* %fh, %struct.font_hints_s** %fh.addr, align 8
  store %struct.gs_fixed_point_s* %p0, %struct.gs_fixed_point_s** %p0.addr, align 8
  store %struct.gs_fixed_point_s* %p1, %struct.gs_fixed_point_s** %p1.addr, align 8
  %tmp = load %struct.gs_fixed_point_s** %p1.addr, align 8
  %x = getelementptr inbounds %struct.gs_fixed_point_s* %tmp, i32 0, i32 0
  %tmp1 = load i64* %x, align 8
  %tmp2 = load %struct.gs_fixed_point_s** %p0.addr, align 8
  %x3 = getelementptr inbounds %struct.gs_fixed_point_s* %tmp2, i32 0, i32 0
  %tmp4 = load i64* %x3, align 8
  %sub = sub nsw i64 %tmp1, %tmp4
  store i64 %sub, i64* %dx, align 8
  %tmp6 = load %struct.gs_fixed_point_s** %p1.addr, align 8
  %y = getelementptr inbounds %struct.gs_fixed_point_s* %tmp6, i32 0, i32 1
  %tmp7 = load i64* %y, align 8
  %tmp8 = load %struct.gs_fixed_point_s** %p0.addr, align 8
  %y9 = getelementptr inbounds %struct.gs_fixed_point_s* %tmp8, i32 0, i32 1
  %tmp10 = load i64* %y9, align 8
  %sub11 = sub nsw i64 %tmp7, %tmp10
  store i64 %sub11, i64* %dy, align 8
  %tmp15 = load %struct.font_hints_s** %fh.addr, align 8
  %x_inverted = getelementptr inbounds %struct.font_hints_s* %tmp15, i32 0, i32 1
  %tmp16 = load i32* %x_inverted, align 4
  store i32 %tmp16, i32* %xi, align 4
  %tmp18 = load %struct.font_hints_s** %fh.addr, align 8
  %y_inverted = getelementptr inbounds %struct.font_hints_s* %tmp18, i32 0, i32 2
  %tmp19 = load i32* %y_inverted, align 4
  store i32 %tmp19, i32* %yi, align 4
  %tmp21 = load i32* %xi, align 4
  %tobool = icmp ne i32 %tmp21, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %tmp22 = load i64* %dx, align 8
  %sub23 = sub nsw i64 0, %tmp22
  store i64 %sub23, i64* %dx, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %tmp24 = load i32* %yi, align 4
  %tobool25 = icmp ne i32 %tmp24, 0
  br i1 %tobool25, label %if.then26, label %if.end29

if.then26:                                        ; preds = %if.end
  %tmp27 = load i64* %dy, align 8
  %sub28 = sub nsw i64 0, %tmp27
  store i64 %sub28, i64* %dy, align 8
  br label %if.end29

if.end29:                                         ; preds = %if.then26, %if.end
  %tmp30 = load %struct.font_hints_s** %fh.addr, align 8
  %axes_swapped = getelementptr inbounds %struct.font_hints_s* %tmp30, i32 0, i32 0
  %tmp31 = load i32* %axes_swapped, align 4
  %tobool32 = icmp ne i32 %tmp31, 0
  br i1 %tobool32, label %if.then33, label %if.end42

if.then33:                                        ; preds = %if.end29
  %tmp35 = load i64* %dx, align 8
  store i64 %tmp35, i64* %t, align 8
  %tmp37 = load i32* %xi, align 4
  store i32 %tmp37, i32* %ti, align 4
  %tmp38 = load i64* %dy, align 8
  store i64 %tmp38, i64* %dx, align 8
  %tmp39 = load i32* %yi, align 4
  store i32 %tmp39, i32* %xi, align 4
  %tmp40 = load i64* %t, align 8
  store i64 %tmp40, i64* %dy, align 8
  %tmp41 = load i32* %ti, align 4
  store i32 %tmp41, i32* %yi, align 4
  br label %if.end42

if.end42:                                         ; preds = %if.then33, %if.end29
  %tmp43 = load i64* %dx, align 8
  %cmp = icmp slt i64 %tmp43, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end42
  %tmp44 = load i64* %dx, align 8
  %sub45 = sub nsw i64 0, %tmp44
  br label %cond.end

cond.false:                                       ; preds = %if.end42
  %tmp46 = load i64* %dx, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub45, %cond.true ], [ %tmp46, %cond.false ]
  store i64 %cond, i64* %adx, align 8
  %tmp47 = load i64* %dy, align 8
  %cmp48 = icmp slt i64 %tmp47, 0
  br i1 %cmp48, label %cond.true49, label %cond.false52

cond.true49:                                      ; preds = %cond.end
  %tmp50 = load i64* %dy, align 8
  %sub51 = sub nsw i64 0, %tmp50
  br label %cond.end54

cond.false52:                                     ; preds = %cond.end
  %tmp53 = load i64* %dy, align 8
  br label %cond.end54

cond.end54:                                       ; preds = %cond.false52, %cond.true49
  %cond55 = phi i64 [ %sub51, %cond.true49 ], [ %tmp53, %cond.false52 ]
  store i64 %cond55, i64* %ady, align 8
  %tmp56 = load i64* %dy, align 8
  %cmp57 = icmp ne i64 %tmp56, 0
  br i1 %cmp57, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %cond.end54
  %tmp58 = load i64* %adx, align 8
  %tmp59 = load i64* %ady, align 8
  %shr = ashr i64 %tmp59, 4
  %cmp60 = icmp sle i64 %tmp58, %shr
  br i1 %cmp60, label %if.then61, label %if.else

if.then61:                                        ; preds = %land.lhs.true
  %tmp62 = load i64* %dy, align 8
  %cmp63 = icmp sgt i64 %tmp62, 0
  %cond64 = select i1 %cmp63, i32 2, i32 1
  store i32 %cond64, i32* %hints, align 4
  %tmp65 = load i32* %xi, align 4
  %tobool66 = icmp ne i32 %tmp65, 0
  br i1 %tobool66, label %if.then67, label %if.end69

if.then67:                                        ; preds = %if.then61
  %tmp68 = load i32* %hints, align 4
  %xor = xor i32 %tmp68, 3
  store i32 %xor, i32* %hints, align 4
  br label %if.end69

if.end69:                                         ; preds = %if.then67, %if.then61
  br label %if.end89

if.else:                                          ; preds = %land.lhs.true, %cond.end54
  %tmp70 = load i64* %dx, align 8
  %cmp71 = icmp ne i64 %tmp70, 0
  br i1 %cmp71, label %land.lhs.true72, label %if.else87

land.lhs.true72:                                  ; preds = %if.else
  %tmp73 = load i64* %ady, align 8
  %tmp74 = load i64* %adx, align 8
  %shr75 = ashr i64 %tmp74, 4
  %cmp76 = icmp sle i64 %tmp73, %shr75
  br i1 %cmp76, label %if.then77, label %if.else87

if.then77:                                        ; preds = %land.lhs.true72
  %tmp78 = load i64* %dx, align 8
  %cmp79 = icmp slt i64 %tmp78, 0
  %cond80 = select i1 %cmp79, i32 8, i32 4
  store i32 %cond80, i32* %hints, align 4
  %tmp81 = load i32* %yi, align 4
  %tobool82 = icmp ne i32 %tmp81, 0
  br i1 %tobool82, label %if.then83, label %if.end86

if.then83:                                        ; preds = %if.then77
  %tmp84 = load i32* %hints, align 4
  %xor85 = xor i32 %tmp84, 12
  store i32 %xor85, i32* %hints, align 4
  br label %if.end86

if.end86:                                         ; preds = %if.then83, %if.then77
  br label %if.end88

if.else87:                                        ; preds = %land.lhs.true72, %if.else
  store i32 0, i32* %hints, align 4
  br label %if.end88

if.end88:                                         ; preds = %if.else87, %if.end86
  br label %if.end89

if.end89:                                         ; preds = %if.end88, %if.end69
  %tmp90 = load i32* %hints, align 4
  ret i32 %tmp90
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @line_hints(%struct.font_hints_s* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i32 0, i32 0), %struct.gs_fixed_point_s* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i32 0, i32 0), %struct.gs_fixed_point_s* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i32 0, i64 1))
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %call1 = call i32 @line_hints(%struct.font_hints_s* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i32 0, i64 1), %struct.gs_fixed_point_s* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i32 0, i64 2), %struct.gs_fixed_point_s* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i32 0, i64 3))
  %cmp2 = icmp ne i32 %call1, 8
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %call4 = call i32 @line_hints(%struct.font_hints_s* getelementptr inbounds ([3 x %struct.font_hints_s]* @main.fh, i32 0, i64 2), %struct.gs_fixed_point_s* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i32 0, i64 2), %struct.gs_fixed_point_s* getelementptr inbounds ([4 x %struct.gs_fixed_point_s]* @main.gsf, i32 0, i64 3))
  %cmp5 = icmp ne i32 %call4, 4
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
