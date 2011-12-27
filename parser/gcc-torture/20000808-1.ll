; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000808-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.Point = type { i64, i64 }

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

define void @bar() nounwind uwtable {
entry:
  ret void
}

define void @f(i64 %p0.coerce0, i64 %p0.coerce1, i64 %p1.coerce0, i64 %p1.coerce1, i64 %p2.coerce0, i64 %p2.coerce1, %struct.Point* byval align 8 %p3, %struct.Point* byval align 8 %p4, %struct.Point* byval align 8 %p5) nounwind uwtable {
entry:
  %p0 = alloca %struct.Point, align 8
  %p1 = alloca %struct.Point, align 8
  %p2 = alloca %struct.Point, align 8
  %0 = getelementptr %struct.Point* %p0, i32 0, i32 0
  store i64 %p0.coerce0, i64* %0
  %1 = getelementptr %struct.Point* %p0, i32 0, i32 1
  store i64 %p0.coerce1, i64* %1
  %2 = getelementptr %struct.Point* %p1, i32 0, i32 0
  store i64 %p1.coerce0, i64* %2
  %3 = getelementptr %struct.Point* %p1, i32 0, i32 1
  store i64 %p1.coerce1, i64* %3
  %4 = getelementptr %struct.Point* %p2, i32 0, i32 0
  store i64 %p2.coerce0, i64* %4
  %5 = getelementptr %struct.Point* %p2, i32 0, i32 1
  store i64 %p2.coerce1, i64* %5
  %p_x = getelementptr inbounds %struct.Point* %p0, i32 0, i32 0
  %tmp = load i64* %p_x, align 8
  %cmp = icmp ne i64 %tmp, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %p_y = getelementptr inbounds %struct.Point* %p0, i32 0, i32 1
  %tmp1 = load i64* %p_y, align 8
  %cmp2 = icmp ne i64 %tmp1, 1
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %p_x4 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 0
  %tmp5 = load i64* %p_x4, align 8
  %cmp6 = icmp ne i64 %tmp5, -1
  br i1 %cmp6, label %if.then, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false3
  %p_y8 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 1
  %tmp9 = load i64* %p_y8, align 8
  %cmp10 = icmp ne i64 %tmp9, 0
  br i1 %cmp10, label %if.then, label %lor.lhs.false11

lor.lhs.false11:                                  ; preds = %lor.lhs.false7
  %p_x12 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 0
  %tmp13 = load i64* %p_x12, align 8
  %cmp14 = icmp ne i64 %tmp13, 1
  br i1 %cmp14, label %if.then, label %lor.lhs.false15

lor.lhs.false15:                                  ; preds = %lor.lhs.false11
  %p_y16 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 1
  %tmp17 = load i64* %p_y16, align 8
  %cmp18 = icmp ne i64 %tmp17, -1
  br i1 %cmp18, label %if.then, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %lor.lhs.false15
  %p_x20 = getelementptr inbounds %struct.Point* %p3, i32 0, i32 0
  %tmp21 = load i64* %p_x20, align 8
  %cmp22 = icmp ne i64 %tmp21, -1
  br i1 %cmp22, label %if.then, label %lor.lhs.false23

lor.lhs.false23:                                  ; preds = %lor.lhs.false19
  %p_y24 = getelementptr inbounds %struct.Point* %p3, i32 0, i32 1
  %tmp25 = load i64* %p_y24, align 8
  %cmp26 = icmp ne i64 %tmp25, 1
  br i1 %cmp26, label %if.then, label %lor.lhs.false27

lor.lhs.false27:                                  ; preds = %lor.lhs.false23
  %p_x28 = getelementptr inbounds %struct.Point* %p4, i32 0, i32 0
  %tmp29 = load i64* %p_x28, align 8
  %cmp30 = icmp ne i64 %tmp29, 0
  br i1 %cmp30, label %if.then, label %lor.lhs.false31

lor.lhs.false31:                                  ; preds = %lor.lhs.false27
  %p_y32 = getelementptr inbounds %struct.Point* %p4, i32 0, i32 1
  %tmp33 = load i64* %p_y32, align 8
  %cmp34 = icmp ne i64 %tmp33, -1
  br i1 %cmp34, label %if.then, label %lor.lhs.false35

lor.lhs.false35:                                  ; preds = %lor.lhs.false31
  %p_x36 = getelementptr inbounds %struct.Point* %p5, i32 0, i32 0
  %tmp37 = load i64* %p_x36, align 8
  %cmp38 = icmp ne i64 %tmp37, 1
  br i1 %cmp38, label %if.then, label %lor.lhs.false39

lor.lhs.false39:                                  ; preds = %lor.lhs.false35
  %p_y40 = getelementptr inbounds %struct.Point* %p5, i32 0, i32 1
  %tmp41 = load i64* %p_y40, align 8
  %cmp42 = icmp ne i64 %tmp41, 0
  br i1 %cmp42, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false39, %lor.lhs.false35, %lor.lhs.false31, %lor.lhs.false27, %lor.lhs.false23, %lor.lhs.false19, %lor.lhs.false15, %lor.lhs.false11, %lor.lhs.false7, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false39
  ret void
}

declare void @abort() noreturn nounwind

define void @foo() nounwind uwtable {
entry:
  %p0 = alloca %struct.Point, align 8
  %p1 = alloca %struct.Point, align 8
  %p2 = alloca %struct.Point, align 8
  %p3 = alloca %struct.Point, align 8
  %p4 = alloca %struct.Point, align 8
  %p5 = alloca %struct.Point, align 8
  call void @bar()
  %p_x = getelementptr inbounds %struct.Point* %p0, i32 0, i32 0
  store i64 0, i64* %p_x, align 8
  %p_y = getelementptr inbounds %struct.Point* %p0, i32 0, i32 1
  store i64 1, i64* %p_y, align 8
  %p_x1 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 0
  store i64 -1, i64* %p_x1, align 8
  %p_y2 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 1
  store i64 0, i64* %p_y2, align 8
  %p_x3 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 0
  store i64 1, i64* %p_x3, align 8
  %p_y4 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 1
  store i64 -1, i64* %p_y4, align 8
  %p_x5 = getelementptr inbounds %struct.Point* %p3, i32 0, i32 0
  store i64 -1, i64* %p_x5, align 8
  %p_y6 = getelementptr inbounds %struct.Point* %p3, i32 0, i32 1
  store i64 1, i64* %p_y6, align 8
  %p_x7 = getelementptr inbounds %struct.Point* %p4, i32 0, i32 0
  store i64 0, i64* %p_x7, align 8
  %p_y8 = getelementptr inbounds %struct.Point* %p4, i32 0, i32 1
  store i64 -1, i64* %p_y8, align 8
  %p_x9 = getelementptr inbounds %struct.Point* %p5, i32 0, i32 0
  store i64 1, i64* %p_x9, align 8
  %p_y10 = getelementptr inbounds %struct.Point* %p5, i32 0, i32 1
  store i64 0, i64* %p_y10, align 8
  %0 = getelementptr %struct.Point* %p0, i32 0, i32 0
  %1 = load i64* %0, align 1
  %2 = getelementptr %struct.Point* %p0, i32 0, i32 1
  %3 = load i64* %2, align 1
  %4 = getelementptr %struct.Point* %p1, i32 0, i32 0
  %5 = load i64* %4, align 1
  %6 = getelementptr %struct.Point* %p1, i32 0, i32 1
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.Point* %p2, i32 0, i32 0
  %9 = load i64* %8, align 1
  %10 = getelementptr %struct.Point* %p2, i32 0, i32 1
  %11 = load i64* %10, align 1
  call void (...)* bitcast (void (i64, i64, i64, i64, i64, i64, %struct.Point*, %struct.Point*, %struct.Point*)* @f to void (...)*)(i64 %1, i64 %3, i64 %5, i64 %7, i64 %9, i64 %11, %struct.Point* byval align 8 %p3, %struct.Point* byval align 8 %p4, %struct.Point* byval align 8 %p5)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
