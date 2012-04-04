; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020615-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.font_hints_s = type { i32, i32, i32 }
%struct.gs_fixed_point_s = type { i64, i64 }

@main.fh = internal global [3 x %struct.font_hints_s] [%struct.font_hints_s { i32 0, i32 1, i32 0 }, %struct.font_hints_s { i32 0, i32 0, i32 1 }, %struct.font_hints_s zeroinitializer], align 16
@main.gsf = internal global [4 x %struct.gs_fixed_point_s] [%struct.gs_fixed_point_s { i64 196608, i64 80216 }, %struct.gs_fixed_point_s { i64 196608, i64 98697 }, %struct.gs_fixed_point_s { i64 80216, i64 196608 }, %struct.gs_fixed_point_s { i64 98697, i64 196608 }], align 16

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
  %0 = load %struct.gs_fixed_point_s** %p1.addr, align 8
  %x = getelementptr inbounds %struct.gs_fixed_point_s* %0, i32 0, i32 0
  %1 = load i64* %x, align 8
  %2 = load %struct.gs_fixed_point_s** %p0.addr, align 8
  %x1 = getelementptr inbounds %struct.gs_fixed_point_s* %2, i32 0, i32 0
  %3 = load i64* %x1, align 8
  %sub = sub nsw i64 %1, %3
  store i64 %sub, i64* %dx, align 8
  %4 = load %struct.gs_fixed_point_s** %p1.addr, align 8
  %y = getelementptr inbounds %struct.gs_fixed_point_s* %4, i32 0, i32 1
  %5 = load i64* %y, align 8
  %6 = load %struct.gs_fixed_point_s** %p0.addr, align 8
  %y2 = getelementptr inbounds %struct.gs_fixed_point_s* %6, i32 0, i32 1
  %7 = load i64* %y2, align 8
  %sub3 = sub nsw i64 %5, %7
  store i64 %sub3, i64* %dy, align 8
  %8 = load %struct.font_hints_s** %fh.addr, align 8
  %x_inverted = getelementptr inbounds %struct.font_hints_s* %8, i32 0, i32 1
  %9 = load i32* %x_inverted, align 4
  store i32 %9, i32* %xi, align 4
  %10 = load %struct.font_hints_s** %fh.addr, align 8
  %y_inverted = getelementptr inbounds %struct.font_hints_s* %10, i32 0, i32 2
  %11 = load i32* %y_inverted, align 4
  store i32 %11, i32* %yi, align 4
  %12 = load i32* %xi, align 4
  %tobool = icmp ne i32 %12, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %13 = load i64* %dx, align 8
  %sub4 = sub nsw i64 0, %13
  store i64 %sub4, i64* %dx, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %14 = load i32* %yi, align 4
  %tobool5 = icmp ne i32 %14, 0
  br i1 %tobool5, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.end
  %15 = load i64* %dy, align 8
  %sub7 = sub nsw i64 0, %15
  store i64 %sub7, i64* %dy, align 8
  br label %if.end8

if.end8:                                          ; preds = %if.then6, %if.end
  %16 = load %struct.font_hints_s** %fh.addr, align 8
  %axes_swapped = getelementptr inbounds %struct.font_hints_s* %16, i32 0, i32 0
  %17 = load i32* %axes_swapped, align 4
  %tobool9 = icmp ne i32 %17, 0
  br i1 %tobool9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end8
  %18 = load i64* %dx, align 8
  store i64 %18, i64* %t, align 8
  %19 = load i32* %xi, align 4
  store i32 %19, i32* %ti, align 4
  %20 = load i64* %dy, align 8
  store i64 %20, i64* %dx, align 8
  %21 = load i32* %yi, align 4
  store i32 %21, i32* %xi, align 4
  %22 = load i64* %t, align 8
  store i64 %22, i64* %dy, align 8
  %23 = load i32* %ti, align 4
  store i32 %23, i32* %yi, align 4
  br label %if.end11

if.end11:                                         ; preds = %if.then10, %if.end8
  %24 = load i64* %dx, align 8
  %cmp = icmp slt i64 %24, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end11
  %25 = load i64* %dx, align 8
  %sub12 = sub nsw i64 0, %25
  br label %cond.end

cond.false:                                       ; preds = %if.end11
  %26 = load i64* %dx, align 8
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %sub12, %cond.true ], [ %26, %cond.false ]
  store i64 %cond, i64* %adx, align 8
  %27 = load i64* %dy, align 8
  %cmp13 = icmp slt i64 %27, 0
  br i1 %cmp13, label %cond.true14, label %cond.false16

cond.true14:                                      ; preds = %cond.end
  %28 = load i64* %dy, align 8
  %sub15 = sub nsw i64 0, %28
  br label %cond.end17

cond.false16:                                     ; preds = %cond.end
  %29 = load i64* %dy, align 8
  br label %cond.end17

cond.end17:                                       ; preds = %cond.false16, %cond.true14
  %cond18 = phi i64 [ %sub15, %cond.true14 ], [ %29, %cond.false16 ]
  store i64 %cond18, i64* %ady, align 8
  %30 = load i64* %dy, align 8
  %cmp19 = icmp ne i64 %30, 0
  br i1 %cmp19, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %cond.end17
  %31 = load i64* %adx, align 8
  %32 = load i64* %ady, align 8
  %shr = ashr i64 %32, 4
  %cmp20 = icmp sle i64 %31, %shr
  br i1 %cmp20, label %if.then21, label %if.else

if.then21:                                        ; preds = %land.lhs.true
  %33 = load i64* %dy, align 8
  %cmp22 = icmp sgt i64 %33, 0
  %cond23 = select i1 %cmp22, i32 2, i32 1
  store i32 %cond23, i32* %hints, align 4
  %34 = load i32* %xi, align 4
  %tobool24 = icmp ne i32 %34, 0
  br i1 %tobool24, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.then21
  %35 = load i32* %hints, align 4
  %xor = xor i32 %35, 3
  store i32 %xor, i32* %hints, align 4
  br label %if.end26

if.end26:                                         ; preds = %if.then25, %if.then21
  br label %if.end40

if.else:                                          ; preds = %land.lhs.true, %cond.end17
  %36 = load i64* %dx, align 8
  %cmp27 = icmp ne i64 %36, 0
  br i1 %cmp27, label %land.lhs.true28, label %if.else38

land.lhs.true28:                                  ; preds = %if.else
  %37 = load i64* %ady, align 8
  %38 = load i64* %adx, align 8
  %shr29 = ashr i64 %38, 4
  %cmp30 = icmp sle i64 %37, %shr29
  br i1 %cmp30, label %if.then31, label %if.else38

if.then31:                                        ; preds = %land.lhs.true28
  %39 = load i64* %dx, align 8
  %cmp32 = icmp slt i64 %39, 0
  %cond33 = select i1 %cmp32, i32 8, i32 4
  store i32 %cond33, i32* %hints, align 4
  %40 = load i32* %yi, align 4
  %tobool34 = icmp ne i32 %40, 0
  br i1 %tobool34, label %if.then35, label %if.end37

if.then35:                                        ; preds = %if.then31
  %41 = load i32* %hints, align 4
  %xor36 = xor i32 %41, 12
  store i32 %xor36, i32* %hints, align 4
  br label %if.end37

if.end37:                                         ; preds = %if.then35, %if.then31
  br label %if.end39

if.else38:                                        ; preds = %land.lhs.true28, %if.else
  store i32 0, i32* %hints, align 4
  br label %if.end39

if.end39:                                         ; preds = %if.else38, %if.end37
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.end26
  %42 = load i32* %hints, align 4
  ret i32 %42
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
