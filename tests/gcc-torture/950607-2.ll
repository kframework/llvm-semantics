; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/950607-2.c'
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

define i32 @f(i64 %basePt.coerce0, i64 %basePt.coerce1, i64 %pt1.coerce0, i64 %pt1.coerce1, i64 %pt2.coerce0, i64 %pt2.coerce1) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %basePt = alloca %struct.Point, align 8
  %pt1 = alloca %struct.Point, align 8
  %pt2 = alloca %struct.Point, align 8
  %vector = alloca i64, align 8
  %0 = getelementptr %struct.Point* %basePt, i32 0, i32 0
  store i64 %basePt.coerce0, i64* %0
  %1 = getelementptr %struct.Point* %basePt, i32 0, i32 1
  store i64 %basePt.coerce1, i64* %1
  %2 = getelementptr %struct.Point* %pt1, i32 0, i32 0
  store i64 %pt1.coerce0, i64* %2
  %3 = getelementptr %struct.Point* %pt1, i32 0, i32 1
  store i64 %pt1.coerce1, i64* %3
  %4 = getelementptr %struct.Point* %pt2, i32 0, i32 0
  store i64 %pt2.coerce0, i64* %4
  %5 = getelementptr %struct.Point* %pt2, i32 0, i32 1
  store i64 %pt2.coerce1, i64* %5
  %p_x = getelementptr inbounds %struct.Point* %pt1, i32 0, i32 0
  %tmp = load i64* %p_x, align 8
  %p_x1 = getelementptr inbounds %struct.Point* %basePt, i32 0, i32 0
  %tmp2 = load i64* %p_x1, align 8
  %sub = sub nsw i64 %tmp, %tmp2
  %p_y = getelementptr inbounds %struct.Point* %pt2, i32 0, i32 1
  %tmp3 = load i64* %p_y, align 8
  %p_y4 = getelementptr inbounds %struct.Point* %basePt, i32 0, i32 1
  %tmp5 = load i64* %p_y4, align 8
  %sub6 = sub nsw i64 %tmp3, %tmp5
  %mul = mul nsw i64 %sub, %sub6
  %p_y7 = getelementptr inbounds %struct.Point* %pt1, i32 0, i32 1
  %tmp8 = load i64* %p_y7, align 8
  %p_y9 = getelementptr inbounds %struct.Point* %basePt, i32 0, i32 1
  %tmp10 = load i64* %p_y9, align 8
  %sub11 = sub nsw i64 %tmp8, %tmp10
  %p_x12 = getelementptr inbounds %struct.Point* %pt2, i32 0, i32 0
  %tmp13 = load i64* %p_x12, align 8
  %p_x14 = getelementptr inbounds %struct.Point* %basePt, i32 0, i32 0
  %tmp15 = load i64* %p_x14, align 8
  %sub16 = sub nsw i64 %tmp13, %tmp15
  %mul17 = mul nsw i64 %sub11, %sub16
  %sub18 = sub nsw i64 %mul, %mul17
  store i64 %sub18, i64* %vector, align 8
  %tmp19 = load i64* %vector, align 8
  %cmp = icmp sgt i64 %tmp19, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval
  br label %return

if.else:                                          ; preds = %entry
  %tmp20 = load i64* %vector, align 8
  %cmp21 = icmp slt i64 %tmp20, 0
  br i1 %cmp21, label %if.then22, label %if.else23

if.then22:                                        ; preds = %if.else
  store i32 1, i32* %retval
  br label %return

if.else23:                                        ; preds = %if.else
  store i32 2, i32* %retval
  br label %return

return:                                           ; preds = %if.else23, %if.then22, %if.then
  %6 = load i32* %retval
  ret i32 %6
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %b = alloca %struct.Point, align 8
  %p1 = alloca %struct.Point, align 8
  %p2 = alloca %struct.Point, align 8
  %answer = alloca i32, align 4
  store i32 0, i32* %retval
  %p_x = getelementptr inbounds %struct.Point* %b, i32 0, i32 0
  store i64 -23250, i64* %p_x, align 8
  %p_y = getelementptr inbounds %struct.Point* %b, i32 0, i32 1
  store i64 23250, i64* %p_y, align 8
  %p_x1 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 0
  store i64 23250, i64* %p_x1, align 8
  %p_y2 = getelementptr inbounds %struct.Point* %p1, i32 0, i32 1
  store i64 -23250, i64* %p_y2, align 8
  %p_x3 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 0
  store i64 -23250, i64* %p_x3, align 8
  %p_y4 = getelementptr inbounds %struct.Point* %p2, i32 0, i32 1
  store i64 -23250, i64* %p_y4, align 8
  %0 = getelementptr %struct.Point* %b, i32 0, i32 0
  %1 = load i64* %0, align 1
  %2 = getelementptr %struct.Point* %b, i32 0, i32 1
  %3 = load i64* %2, align 1
  %4 = getelementptr %struct.Point* %p1, i32 0, i32 0
  %5 = load i64* %4, align 1
  %6 = getelementptr %struct.Point* %p1, i32 0, i32 1
  %7 = load i64* %6, align 1
  %8 = getelementptr %struct.Point* %p2, i32 0, i32 0
  %9 = load i64* %8, align 1
  %10 = getelementptr %struct.Point* %p2, i32 0, i32 1
  %11 = load i64* %10, align 1
  %call = call i32 @f(i64 %1, i64 %3, i64 %5, i64 %7, i64 %9, i64 %11)
  store i32 %call, i32* %answer, align 4
  %tmp = load i32* %answer, align 4
  %cmp = icmp ne i32 %tmp, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %12 = load i32* %retval
  ret i32 %12
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
