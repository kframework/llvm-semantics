; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990326-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8, i8, i8, i8, [12 x i8] }
%struct.a = type { i8, i8, i16 }
%struct.b = type { i32, i16, i16 }
%struct.c = type { i8, [2 x i8], i8, [12 x i8] }
%struct.d = type { [2 x i8], [2 x i8], [12 x i8] }
%struct.e = type { i8, [2 x i8], i8, [12 x i8] }
%struct.f = type { [2 x i8], [2 x i8], [12 x i8] }
%struct.gx = type { i8, [2 x i8], i8, [12 x i8] }
%struct.gy = type { [2 x i8], [2 x i8], [12 x i8] }
%struct.hx = type { [2 x i8], [2 x i8], [12 x i8] }
%struct.hy = type { i8, [2 x i8], i8, [12 x i8] }

@a1.x = internal global %struct.a { i8 1, i8 2, i16 -2 }, align 2
@a1.y = internal global %struct.a { i8 65, i8 2, i16 -3 }, align 2
@a2.x = internal global %struct.a { i8 1, i8 66, i16 -2 }, align 2
@a2.y = internal global %struct.a { i8 1, i8 2, i16 -3 }, align 2
@a3.x = internal global %struct.a { i8 9, i8 66, i16 -2 }, align 2
@a3.y = internal global %struct.a { i8 33, i8 18, i16 -3 }, align 2
@b1.x = internal global %struct.b { i32 -2, i16 2, i16 1 }, align 4
@b1.y = internal global %struct.b { i32 -3, i16 2, i16 65 }, align 4
@b2.x = internal global %struct.b { i32 -2, i16 66, i16 1 }, align 4
@b2.y = internal global %struct.b { i32 -3, i16 2, i16 1 }, align 4
@b3.x = internal global %struct.b { i32 -2, i16 66, i16 9 }, align 4
@b3.y = internal global %struct.b { i32 -3, i16 18, i16 33 }, align 4
@c1.x = internal global %0 { i8 46, i8 0, i8 4, i8 0, [12 x i8] undef }, align 16
@c1.y = internal global %0 { i8 45, i8 0, i8 4, i8 1, [12 x i8] undef }, align 16
@c2.x = internal global %0 { i8 46, i8 4, i8 4, i8 0, [12 x i8] undef }, align 16
@c2.y = internal global %0 { i8 45, i8 0, i8 4, i8 0, [12 x i8] undef }, align 16
@c3.x = internal global %0 { i8 46, i8 4, i8 36, i8 0, [12 x i8] undef }, align 16
@c3.y = internal global %0 { i8 45, i8 1, i8 -124, i8 0, [12 x i8] undef }, align 16
@d1.x = internal global %0 { i8 1, i8 -128, i8 0, i8 -32, [12 x i8] undef }, align 16
@d1.y = internal global %0 { i8 65, i8 -128, i8 0, i8 -48, [12 x i8] undef }, align 16
@d2.x = internal global %0 { i8 1, i8 -128, i8 16, i8 -32, [12 x i8] undef }, align 16
@d2.y = internal global %0 { i8 1, i8 -128, i8 0, i8 -48, [12 x i8] undef }, align 16
@d3.x = internal global %0 { i8 9, i8 -128, i8 16, i8 -32, [12 x i8] undef }, align 16
@d3.y = internal global %0 { i8 33, i8 -128, i8 4, i8 -48, [12 x i8] undef }, align 16
@e1.x = internal global %0 { i8 -18, i8 -1, i8 -1, i8 -2, [12 x i8] undef }, align 16
@e1.y = internal global %0 { i8 -19, i8 -1, i8 -1, i8 -1, [12 x i8] undef }, align 16
@e2.x = internal global %0 { i8 -18, i8 -1, i8 -1, i8 -1, [12 x i8] undef }, align 16
@e2.y = internal global %0 { i8 -19, i8 -5, i8 -1, i8 -1, [12 x i8] undef }, align 16
@e3.x = internal global %0 { i8 -18, i8 -2, i8 127, i8 -1, [12 x i8] undef }, align 16
@e3.y = internal global %0 { i8 -19, i8 -5, i8 -33, i8 -1, [12 x i8] undef }, align 16
@e4.x = internal global %0 { i8 -1, i8 -1, i8 3, i8 0, [12 x i8] undef }, align 16
@f1.x = internal global %0 { i8 -65, i8 -65, i8 -1, i8 -17, [12 x i8] undef }, align 16
@f1.y = internal global %0 { i8 -1, i8 -65, i8 -1, i8 -33, [12 x i8] undef }, align 16
@f2.x = internal global %0 { i8 -1, i8 -65, i8 -1, i8 -17, [12 x i8] undef }, align 16
@f2.y = internal global %0 { i8 -1, i8 -65, i8 -17, i8 -33, [12 x i8] undef }, align 16
@f3.x = internal global %0 { i8 -33, i8 -65, i8 -5, i8 -17, [12 x i8] undef }, align 16
@f3.y = internal global %0 { i8 -9, i8 -65, i8 -17, i8 -33, [12 x i8] undef }, align 16
@f4.x = internal global %0 { i8 0, i8 -64, i8 -1, i8 -1, [12 x i8] undef }, align 16
@g1.x = internal global %0 { i8 -18, i8 -1, i8 -1, i8 -2, [12 x i8] undef }, align 16
@g1.y = internal global %0 { i8 -2, i8 -1, i8 -1, i8 -33, [12 x i8] undef }, align 16
@g2.x = internal global %0 { i8 -18, i8 -1, i8 -1, i8 -1, [12 x i8] undef }, align 16
@g2.y = internal global %0 { i8 -66, i8 -1, i8 -1, i8 -33, [12 x i8] undef }, align 16
@g3.x = internal global %0 { i8 -18, i8 -2, i8 127, i8 -1, [12 x i8] undef }, align 16
@g3.y = internal global %0 { i8 -66, i8 -1, i8 -3, i8 -33, [12 x i8] undef }, align 16
@g4.x = internal global %0 { i8 14, i8 2, i8 64, i8 0, [12 x i8] undef }, align 16
@g4.y = internal global %0 { i8 0, i8 2, i8 64, i8 -48, [12 x i8] undef }, align 16
@g5.x = internal global %0 { i8 14, i8 32, i8 0, i8 4, [12 x i8] undef }, align 16
@g5.y = internal global %0 { i8 32, i8 0, i8 4, i8 -48, [12 x i8] undef }, align 16
@g6.x = internal global %0 { i8 14, i8 -30, i8 67, i8 -12, [12 x i8] undef }, align 16
@g6.y = internal global %0 { i8 47, i8 -62, i8 71, i8 -48, [12 x i8] undef }, align 16
@g7.x = internal global %0 { i8 -2, i8 34, i8 124, i8 4, [12 x i8] undef }, align 16
@g7.y = internal global %0 { i8 32, i8 62, i8 68, i8 -33, [12 x i8] undef }, align 16
@h1.x = internal global %0 { i8 -65, i8 -65, i8 -1, i8 -17, [12 x i8] undef }, align 16
@h1.y = internal global %0 { i8 -3, i8 -1, i8 -5, i8 -1, [12 x i8] undef }, align 16
@h2.x = internal global %0 { i8 -1, i8 -65, i8 -1, i8 -17, [12 x i8] undef }, align 16
@h2.y = internal global %0 { i8 -3, i8 -1, i8 -5, i8 -2, [12 x i8] undef }, align 16
@h3.x = internal global %0 { i8 -33, i8 -65, i8 -5, i8 -17, [12 x i8] undef }, align 16
@h3.y = internal global %0 { i8 125, i8 -1, i8 -5, i8 -2, [12 x i8] undef }, align 16
@h4.x = internal global %0 { i8 16, i8 0, i8 8, i8 -32, [12 x i8] undef }, align 16
@h4.y = internal global %0 { i8 13, i8 16, i8 0, i8 8, [12 x i8] undef }, align 16
@h5.x = internal global %0 { i8 0, i8 1, i8 -128, i8 -32, [12 x i8] undef }, align 16
@h5.y = internal global %0 { i8 13, i8 1, i8 -128, i8 0, [12 x i8] undef }, align 16
@h6.x = internal global %0 { i8 16, i8 61, i8 -120, i8 -17, [12 x i8] undef }, align 16
@h6.y = internal global %0 { i8 -3, i8 17, i8 -68, i8 8, [12 x i8] undef }, align 16
@h7.x = internal global %0 { i8 31, i8 -63, i8 -117, i8 -32, [12 x i8] undef }, align 16
@h7.y = internal global %0 { i8 13, i8 -47, i8 -125, i8 -8, [12 x i8] undef }, align 16

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

define i32 @a1() nounwind uwtable {
entry:
  %tmp = load i8* getelementptr inbounds (%struct.a* @a1.x, i32 0, i32 0), align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* getelementptr inbounds (%struct.a* @a1.y, i32 0, i32 0), align 1
  %conv2 = sext i8 %tmp1 to i32
  %and = and i32 %conv2, -65
  %cmp = icmp eq i32 %conv, %and
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp4 = load i8* getelementptr inbounds (%struct.a* @a1.x, i32 0, i32 1), align 1
  %conv5 = sext i8 %tmp4 to i32
  %tmp6 = load i8* getelementptr inbounds (%struct.a* @a1.y, i32 0, i32 1), align 1
  %conv7 = sext i8 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv5, %conv7
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %cmp8, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}

define i32 @a2() nounwind uwtable {
entry:
  %tmp = load i8* getelementptr inbounds (%struct.a* @a2.x, i32 0, i32 0), align 1
  %conv = sext i8 %tmp to i32
  %tmp1 = load i8* getelementptr inbounds (%struct.a* @a2.y, i32 0, i32 0), align 1
  %conv2 = sext i8 %tmp1 to i32
  %cmp = icmp eq i32 %conv, %conv2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp4 = load i8* getelementptr inbounds (%struct.a* @a2.x, i32 0, i32 1), align 1
  %conv5 = sext i8 %tmp4 to i32
  %and = and i32 %conv5, -65
  %tmp6 = load i8* getelementptr inbounds (%struct.a* @a2.y, i32 0, i32 1), align 1
  %conv7 = sext i8 %tmp6 to i32
  %cmp8 = icmp eq i32 %and, %conv7
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %cmp8, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}

define i32 @a3() nounwind uwtable {
entry:
  %tmp = load i8* getelementptr inbounds (%struct.a* @a3.x, i32 0, i32 0), align 1
  %conv = sext i8 %tmp to i32
  %and = and i32 %conv, -9
  %tmp1 = load i8* getelementptr inbounds (%struct.a* @a3.y, i32 0, i32 0), align 1
  %conv2 = sext i8 %tmp1 to i32
  %and3 = and i32 %conv2, -33
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp5 = load i8* getelementptr inbounds (%struct.a* @a3.x, i32 0, i32 1), align 1
  %conv6 = sext i8 %tmp5 to i32
  %and7 = and i32 %conv6, -65
  %tmp8 = load i8* getelementptr inbounds (%struct.a* @a3.y, i32 0, i32 1), align 1
  %conv9 = sext i8 %tmp8 to i32
  %and10 = and i32 %conv9, -17
  %cmp11 = icmp eq i32 %and7, %and10
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %cmp11, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}

define i32 @b1() nounwind uwtable {
entry:
  %tmp = load i16* getelementptr inbounds (%struct.b* @b1.x, i32 0, i32 2), align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* getelementptr inbounds (%struct.b* @b1.y, i32 0, i32 2), align 2
  %conv2 = sext i16 %tmp1 to i32
  %and = and i32 %conv2, -65
  %cmp = icmp eq i32 %conv, %and
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp4 = load i16* getelementptr inbounds (%struct.b* @b1.x, i32 0, i32 1), align 2
  %conv5 = sext i16 %tmp4 to i32
  %tmp6 = load i16* getelementptr inbounds (%struct.b* @b1.y, i32 0, i32 1), align 2
  %conv7 = sext i16 %tmp6 to i32
  %cmp8 = icmp eq i32 %conv5, %conv7
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %cmp8, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}

define i32 @b2() nounwind uwtable {
entry:
  %tmp = load i16* getelementptr inbounds (%struct.b* @b2.x, i32 0, i32 2), align 2
  %conv = sext i16 %tmp to i32
  %tmp1 = load i16* getelementptr inbounds (%struct.b* @b2.y, i32 0, i32 2), align 2
  %conv2 = sext i16 %tmp1 to i32
  %cmp = icmp eq i32 %conv, %conv2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp4 = load i16* getelementptr inbounds (%struct.b* @b2.x, i32 0, i32 1), align 2
  %conv5 = sext i16 %tmp4 to i32
  %and = and i32 %conv5, -65
  %tmp6 = load i16* getelementptr inbounds (%struct.b* @b2.y, i32 0, i32 1), align 2
  %conv7 = sext i16 %tmp6 to i32
  %cmp8 = icmp eq i32 %and, %conv7
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %cmp8, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}

define i32 @b3() nounwind uwtable {
entry:
  %tmp = load i16* getelementptr inbounds (%struct.b* @b3.x, i32 0, i32 2), align 2
  %conv = sext i16 %tmp to i32
  %and = and i32 %conv, -9
  %tmp1 = load i16* getelementptr inbounds (%struct.b* @b3.y, i32 0, i32 2), align 2
  %conv2 = sext i16 %tmp1 to i32
  %and3 = and i32 %conv2, -33
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %tmp5 = load i16* getelementptr inbounds (%struct.b* @b3.x, i32 0, i32 1), align 2
  %conv6 = sext i16 %tmp5 to i32
  %and7 = and i32 %conv6, -65
  %tmp8 = load i16* getelementptr inbounds (%struct.b* @b3.y, i32 0, i32 1), align 2
  %conv9 = sext i16 %tmp8 to i32
  %and10 = and i32 %conv9, -17
  %cmp11 = icmp eq i32 %and7, %and10
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ %cmp11, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  ret i32 %land.ext
}

define i32 @c1() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c1.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = load i32* bitcast (%0* @c1.y to i32*), align 16
  %3 = lshr i32 %2, 18
  %bf.clear1 = and i32 %3, 16383
  %and = and i32 %bf.clear1, -65
  %cmp = icmp eq i32 %bf.clear, %and
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %4 = load i32* bitcast (%0* @c1.x to i32*), align 16
  %5 = lshr i32 %4, 4
  %bf.clear2 = and i32 %5, 16383
  %6 = load i32* bitcast (%0* @c1.y to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear3 = and i32 %7, 16383
  %cmp4 = icmp eq i32 %bf.clear2, %bf.clear3
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %8 = phi i1 [ false, %entry ], [ %cmp4, %land.rhs ]
  %land.ext = zext i1 %8 to i32
  ret i32 %land.ext
}

define i32 @c2() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c2.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = load i32* bitcast (%0* @c2.y to i32*), align 16
  %3 = lshr i32 %2, 18
  %bf.clear1 = and i32 %3, 16383
  %cmp = icmp eq i32 %bf.clear, %bf.clear1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %4 = load i32* bitcast (%0* @c2.x to i32*), align 16
  %5 = lshr i32 %4, 4
  %bf.clear2 = and i32 %5, 16383
  %and = and i32 %bf.clear2, -65
  %6 = load i32* bitcast (%0* @c2.y to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear3 = and i32 %7, 16383
  %cmp4 = icmp eq i32 %and, %bf.clear3
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %8 = phi i1 [ false, %entry ], [ %cmp4, %land.rhs ]
  %land.ext = zext i1 %8 to i32
  ret i32 %land.ext
}

define i32 @c3() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @c3.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %and = and i32 %bf.clear, -9
  %2 = load i32* bitcast (%0* @c3.y to i32*), align 16
  %3 = lshr i32 %2, 18
  %bf.clear1 = and i32 %3, 16383
  %and2 = and i32 %bf.clear1, -33
  %cmp = icmp eq i32 %and, %and2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %4 = load i32* bitcast (%0* @c3.x to i32*), align 16
  %5 = lshr i32 %4, 4
  %bf.clear3 = and i32 %5, 16383
  %and4 = and i32 %bf.clear3, -65
  %6 = load i32* bitcast (%0* @c3.y to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear5 = and i32 %7, 16383
  %and6 = and i32 %bf.clear5, -17
  %cmp7 = icmp eq i32 %and4, %and6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %8 = phi i1 [ false, %entry ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %8 to i32
  ret i32 %land.ext
}

define i32 @d1() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @d1.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = load i32* bitcast (%0* @d1.y to i32*), align 16
  %bf.clear1 = and i32 %1, 16383
  %and = and i32 %bf.clear1, -65
  %cmp = icmp eq i32 %bf.clear, %and
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load i32* bitcast (%0* @d1.x to i32*), align 16
  %3 = lshr i32 %2, 14
  %bf.clear2 = and i32 %3, 16383
  %4 = load i32* bitcast (%0* @d1.y to i32*), align 16
  %5 = lshr i32 %4, 14
  %bf.clear3 = and i32 %5, 16383
  %cmp4 = icmp eq i32 %bf.clear2, %bf.clear3
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %6 = phi i1 [ false, %entry ], [ %cmp4, %land.rhs ]
  %land.ext = zext i1 %6 to i32
  ret i32 %land.ext
}

define i32 @d2() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @d2.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = load i32* bitcast (%0* @d2.y to i32*), align 16
  %bf.clear1 = and i32 %1, 16383
  %cmp = icmp eq i32 %bf.clear, %bf.clear1
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load i32* bitcast (%0* @d2.x to i32*), align 16
  %3 = lshr i32 %2, 14
  %bf.clear2 = and i32 %3, 16383
  %and = and i32 %bf.clear2, -65
  %4 = load i32* bitcast (%0* @d2.y to i32*), align 16
  %5 = lshr i32 %4, 14
  %bf.clear3 = and i32 %5, 16383
  %cmp4 = icmp eq i32 %and, %bf.clear3
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %6 = phi i1 [ false, %entry ], [ %cmp4, %land.rhs ]
  %land.ext = zext i1 %6 to i32
  ret i32 %land.ext
}

define i32 @d3() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @d3.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %and = and i32 %bf.clear, -9
  %1 = load i32* bitcast (%0* @d3.y to i32*), align 16
  %bf.clear1 = and i32 %1, 16383
  %and2 = and i32 %bf.clear1, -33
  %cmp = icmp eq i32 %and, %and2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load i32* bitcast (%0* @d3.x to i32*), align 16
  %3 = lshr i32 %2, 14
  %bf.clear3 = and i32 %3, 16383
  %and4 = and i32 %bf.clear3, -65
  %4 = load i32* bitcast (%0* @d3.y to i32*), align 16
  %5 = lshr i32 %4, 14
  %bf.clear5 = and i32 %5, 16383
  %and6 = and i32 %bf.clear5, -17
  %cmp7 = icmp eq i32 %and4, %and6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %6 = phi i1 [ false, %entry ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %6 to i32
  ret i32 %land.ext
}

define i32 @e1() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @e1.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %2, 18
  %3 = load i32* bitcast (%0* @e1.y to i32*), align 16
  %4 = lshr i32 %3, 18
  %bf.clear1 = and i32 %4, 16383
  %5 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %5, 18
  %and = and i32 %bf.val.sext2, -65
  %cmp = icmp eq i32 %bf.val.sext, %and
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %6 = load i32* bitcast (%0* @e1.x to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear3 = and i32 %7, 16383
  %8 = shl i32 %bf.clear3, 18
  %bf.val.sext4 = ashr i32 %8, 18
  %9 = load i32* bitcast (%0* @e1.y to i32*), align 16
  %10 = lshr i32 %9, 4
  %bf.clear5 = and i32 %10, 16383
  %11 = shl i32 %bf.clear5, 18
  %bf.val.sext6 = ashr i32 %11, 18
  %cmp7 = icmp eq i32 %bf.val.sext4, %bf.val.sext6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %12 = phi i1 [ false, %entry ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %12 to i32
  ret i32 %land.ext
}

define i32 @e2() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @e2.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %2, 18
  %3 = load i32* bitcast (%0* @e2.y to i32*), align 16
  %4 = lshr i32 %3, 18
  %bf.clear1 = and i32 %4, 16383
  %5 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %5, 18
  %cmp = icmp eq i32 %bf.val.sext, %bf.val.sext2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %6 = load i32* bitcast (%0* @e2.x to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear3 = and i32 %7, 16383
  %8 = shl i32 %bf.clear3, 18
  %bf.val.sext4 = ashr i32 %8, 18
  %and = and i32 %bf.val.sext4, -65
  %9 = load i32* bitcast (%0* @e2.y to i32*), align 16
  %10 = lshr i32 %9, 4
  %bf.clear5 = and i32 %10, 16383
  %11 = shl i32 %bf.clear5, 18
  %bf.val.sext6 = ashr i32 %11, 18
  %cmp7 = icmp eq i32 %and, %bf.val.sext6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %12 = phi i1 [ false, %entry ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %12 to i32
  ret i32 %land.ext
}

define i32 @e3() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @e3.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %2, 18
  %and = and i32 %bf.val.sext, -9
  %3 = load i32* bitcast (%0* @e3.y to i32*), align 16
  %4 = lshr i32 %3, 18
  %bf.clear1 = and i32 %4, 16383
  %5 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %5, 18
  %and3 = and i32 %bf.val.sext2, -33
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %6 = load i32* bitcast (%0* @e3.x to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear4 = and i32 %7, 16383
  %8 = shl i32 %bf.clear4, 18
  %bf.val.sext5 = ashr i32 %8, 18
  %and6 = and i32 %bf.val.sext5, -65
  %9 = load i32* bitcast (%0* @e3.y to i32*), align 16
  %10 = lshr i32 %9, 4
  %bf.clear7 = and i32 %10, 16383
  %11 = shl i32 %bf.clear7, 18
  %bf.val.sext8 = ashr i32 %11, 18
  %and9 = and i32 %bf.val.sext8, -17
  %cmp10 = icmp eq i32 %and6, %and9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %12 = phi i1 [ false, %entry ], [ %cmp10, %land.rhs ]
  %land.ext = zext i1 %12 to i32
  ret i32 %land.ext
}

define i32 @e4() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @e4.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %2, 18
  %cmp = icmp eq i32 %bf.val.sext, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %3 = load i32* bitcast (%0* @e4.x to i32*), align 16
  %4 = lshr i32 %3, 4
  %bf.clear1 = and i32 %4, 16383
  %5 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %5, 18
  %and = and i32 %bf.val.sext2, 8192
  %tobool = icmp ne i32 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %6 = phi i1 [ false, %entry ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %6 to i32
  ret i32 %land.ext
}

define i32 @f1() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @f1.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %1, 18
  %2 = load i32* bitcast (%0* @f1.y to i32*), align 16
  %bf.clear1 = and i32 %2, 16383
  %3 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %3, 18
  %and = and i32 %bf.val.sext2, -65
  %cmp = icmp eq i32 %bf.val.sext, %and
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %4 = load i32* bitcast (%0* @f1.x to i32*), align 16
  %5 = lshr i32 %4, 14
  %bf.clear3 = and i32 %5, 16383
  %6 = shl i32 %bf.clear3, 18
  %bf.val.sext4 = ashr i32 %6, 18
  %7 = load i32* bitcast (%0* @f1.y to i32*), align 16
  %8 = lshr i32 %7, 14
  %bf.clear5 = and i32 %8, 16383
  %9 = shl i32 %bf.clear5, 18
  %bf.val.sext6 = ashr i32 %9, 18
  %cmp7 = icmp eq i32 %bf.val.sext4, %bf.val.sext6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %10 = phi i1 [ false, %entry ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %10 to i32
  ret i32 %land.ext
}

define i32 @f2() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @f2.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %1, 18
  %2 = load i32* bitcast (%0* @f2.y to i32*), align 16
  %bf.clear1 = and i32 %2, 16383
  %3 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %3, 18
  %cmp = icmp eq i32 %bf.val.sext, %bf.val.sext2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %4 = load i32* bitcast (%0* @f2.x to i32*), align 16
  %5 = lshr i32 %4, 14
  %bf.clear3 = and i32 %5, 16383
  %6 = shl i32 %bf.clear3, 18
  %bf.val.sext4 = ashr i32 %6, 18
  %and = and i32 %bf.val.sext4, -65
  %7 = load i32* bitcast (%0* @f2.y to i32*), align 16
  %8 = lshr i32 %7, 14
  %bf.clear5 = and i32 %8, 16383
  %9 = shl i32 %bf.clear5, 18
  %bf.val.sext6 = ashr i32 %9, 18
  %cmp7 = icmp eq i32 %and, %bf.val.sext6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %10 = phi i1 [ false, %entry ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %10 to i32
  ret i32 %land.ext
}

define i32 @f3() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @f3.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %1, 18
  %and = and i32 %bf.val.sext, -9
  %2 = load i32* bitcast (%0* @f3.y to i32*), align 16
  %bf.clear1 = and i32 %2, 16383
  %3 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %3, 18
  %and3 = and i32 %bf.val.sext2, -33
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %4 = load i32* bitcast (%0* @f3.x to i32*), align 16
  %5 = lshr i32 %4, 14
  %bf.clear4 = and i32 %5, 16383
  %6 = shl i32 %bf.clear4, 18
  %bf.val.sext5 = ashr i32 %6, 18
  %and6 = and i32 %bf.val.sext5, -65
  %7 = load i32* bitcast (%0* @f3.y to i32*), align 16
  %8 = lshr i32 %7, 14
  %bf.clear7 = and i32 %8, 16383
  %9 = shl i32 %bf.clear7, 18
  %bf.val.sext8 = ashr i32 %9, 18
  %and9 = and i32 %bf.val.sext8, -17
  %cmp10 = icmp eq i32 %and6, %and9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %10 = phi i1 [ false, %entry ], [ %cmp10, %land.rhs ]
  %land.ext = zext i1 %10 to i32
  ret i32 %land.ext
}

define i32 @f4() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @f4.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %1, 18
  %cmp = icmp eq i32 %bf.val.sext, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %2 = load i32* bitcast (%0* @f4.x to i32*), align 16
  %3 = lshr i32 %2, 14
  %bf.clear1 = and i32 %3, 16383
  %4 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %4, 18
  %and = and i32 %bf.val.sext2, 8192
  %tobool = icmp ne i32 %and, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %5 = phi i1 [ false, %entry ], [ %tobool, %land.rhs ]
  %land.ext = zext i1 %5 to i32
  ret i32 %land.ext
}

define i32 @g1() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @g1.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %2, 18
  %3 = load i32* bitcast (%0* @g1.y to i32*), align 16
  %4 = lshr i32 %3, 14
  %bf.clear1 = and i32 %4, 16383
  %5 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %5, 18
  %and = and i32 %bf.val.sext2, -65
  %cmp = icmp eq i32 %bf.val.sext, %and
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %6 = load i32* bitcast (%0* @g1.x to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear3 = and i32 %7, 16383
  %8 = shl i32 %bf.clear3, 18
  %bf.val.sext4 = ashr i32 %8, 18
  %9 = load i32* bitcast (%0* @g1.y to i32*), align 16
  %bf.clear5 = and i32 %9, 16383
  %10 = shl i32 %bf.clear5, 18
  %bf.val.sext6 = ashr i32 %10, 18
  %cmp7 = icmp eq i32 %bf.val.sext4, %bf.val.sext6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @g2() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @g2.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %2, 18
  %3 = load i32* bitcast (%0* @g2.y to i32*), align 16
  %4 = lshr i32 %3, 14
  %bf.clear1 = and i32 %4, 16383
  %5 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %5, 18
  %cmp = icmp eq i32 %bf.val.sext, %bf.val.sext2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %6 = load i32* bitcast (%0* @g2.x to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear3 = and i32 %7, 16383
  %8 = shl i32 %bf.clear3, 18
  %bf.val.sext4 = ashr i32 %8, 18
  %and = and i32 %bf.val.sext4, -65
  %9 = load i32* bitcast (%0* @g2.y to i32*), align 16
  %bf.clear5 = and i32 %9, 16383
  %10 = shl i32 %bf.clear5, 18
  %bf.val.sext6 = ashr i32 %10, 18
  %cmp7 = icmp eq i32 %and, %bf.val.sext6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @g3() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @g3.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %2, 18
  %and = and i32 %bf.val.sext, -9
  %3 = load i32* bitcast (%0* @g3.y to i32*), align 16
  %4 = lshr i32 %3, 14
  %bf.clear1 = and i32 %4, 16383
  %5 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %5, 18
  %and3 = and i32 %bf.val.sext2, -33
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %6 = load i32* bitcast (%0* @g3.x to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear4 = and i32 %7, 16383
  %8 = shl i32 %bf.clear4, 18
  %bf.val.sext5 = ashr i32 %8, 18
  %and6 = and i32 %bf.val.sext5, -65
  %9 = load i32* bitcast (%0* @g3.y to i32*), align 16
  %bf.clear7 = and i32 %9, 16383
  %10 = shl i32 %bf.clear7, 18
  %bf.val.sext8 = ashr i32 %10, 18
  %and9 = and i32 %bf.val.sext8, -17
  %cmp10 = icmp eq i32 %and6, %and9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp10, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @g4() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @g4.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %2, 18
  %and = and i32 %bf.val.sext, 240
  %3 = load i32* bitcast (%0* @g4.y to i32*), align 16
  %4 = lshr i32 %3, 14
  %bf.clear1 = and i32 %4, 16383
  %5 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %5, 18
  %and3 = and i32 %bf.val.sext2, 3840
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %6 = load i32* bitcast (%0* @g4.x to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear4 = and i32 %7, 16383
  %8 = shl i32 %bf.clear4, 18
  %bf.val.sext5 = ashr i32 %8, 18
  %and6 = and i32 %bf.val.sext5, 240
  %9 = load i32* bitcast (%0* @g4.y to i32*), align 16
  %bf.clear7 = and i32 %9, 16383
  %10 = shl i32 %bf.clear7, 18
  %bf.val.sext8 = ashr i32 %10, 18
  %and9 = and i32 %bf.val.sext8, 3840
  %cmp10 = icmp eq i32 %and6, %and9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp10, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @g5() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @g5.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %2, 18
  %and = and i32 %bf.val.sext, 3840
  %3 = load i32* bitcast (%0* @g5.y to i32*), align 16
  %4 = lshr i32 %3, 14
  %bf.clear1 = and i32 %4, 16383
  %5 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %5, 18
  %and3 = and i32 %bf.val.sext2, 240
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %6 = load i32* bitcast (%0* @g5.x to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear4 = and i32 %7, 16383
  %8 = shl i32 %bf.clear4, 18
  %bf.val.sext5 = ashr i32 %8, 18
  %and6 = and i32 %bf.val.sext5, 3840
  %9 = load i32* bitcast (%0* @g5.y to i32*), align 16
  %bf.clear7 = and i32 %9, 16383
  %10 = shl i32 %bf.clear7, 18
  %bf.val.sext8 = ashr i32 %10, 18
  %and9 = and i32 %bf.val.sext8, 240
  %cmp10 = icmp eq i32 %and6, %and9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp10, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @g6() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @g6.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %2, 18
  %and = and i32 %bf.val.sext, 1023
  %3 = load i32* bitcast (%0* @g6.y to i32*), align 16
  %4 = lshr i32 %3, 14
  %bf.clear1 = and i32 %4, 16383
  %5 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %5, 18
  %and3 = and i32 %bf.val.sext2, 16368
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %6 = load i32* bitcast (%0* @g6.x to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear4 = and i32 %7, 16383
  %8 = shl i32 %bf.clear4, 18
  %bf.val.sext5 = ashr i32 %8, 18
  %and6 = and i32 %bf.val.sext5, 1023
  %9 = load i32* bitcast (%0* @g6.y to i32*), align 16
  %bf.clear7 = and i32 %9, 16383
  %10 = shl i32 %bf.clear7, 18
  %bf.val.sext8 = ashr i32 %10, 18
  %and9 = and i32 %bf.val.sext8, 16368
  %cmp10 = icmp eq i32 %and6, %and9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp10, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @g7() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @g7.x to i32*), align 16
  %1 = lshr i32 %0, 18
  %bf.clear = and i32 %1, 16383
  %2 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %2, 18
  %and = and i32 %bf.val.sext, 16368
  %3 = load i32* bitcast (%0* @g7.y to i32*), align 16
  %4 = lshr i32 %3, 14
  %bf.clear1 = and i32 %4, 16383
  %5 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %5, 18
  %and3 = and i32 %bf.val.sext2, 1023
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %6 = load i32* bitcast (%0* @g7.x to i32*), align 16
  %7 = lshr i32 %6, 4
  %bf.clear4 = and i32 %7, 16383
  %8 = shl i32 %bf.clear4, 18
  %bf.val.sext5 = ashr i32 %8, 18
  %and6 = and i32 %bf.val.sext5, 16368
  %9 = load i32* bitcast (%0* @g7.y to i32*), align 16
  %bf.clear7 = and i32 %9, 16383
  %10 = shl i32 %bf.clear7, 18
  %bf.val.sext8 = ashr i32 %10, 18
  %and9 = and i32 %bf.val.sext8, 1023
  %cmp10 = icmp eq i32 %and6, %and9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp10, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @h1() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @h1.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %1, 18
  %2 = load i32* bitcast (%0* @h1.y to i32*), align 16
  %3 = lshr i32 %2, 4
  %bf.clear1 = and i32 %3, 16383
  %4 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %4, 18
  %and = and i32 %bf.val.sext2, -65
  %cmp = icmp eq i32 %bf.val.sext, %and
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %5 = load i32* bitcast (%0* @h1.x to i32*), align 16
  %6 = lshr i32 %5, 14
  %bf.clear3 = and i32 %6, 16383
  %7 = shl i32 %bf.clear3, 18
  %bf.val.sext4 = ashr i32 %7, 18
  %8 = load i32* bitcast (%0* @h1.y to i32*), align 16
  %9 = lshr i32 %8, 18
  %bf.clear5 = and i32 %9, 16383
  %10 = shl i32 %bf.clear5, 18
  %bf.val.sext6 = ashr i32 %10, 18
  %cmp7 = icmp eq i32 %bf.val.sext4, %bf.val.sext6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @h2() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @h2.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %1, 18
  %2 = load i32* bitcast (%0* @h2.y to i32*), align 16
  %3 = lshr i32 %2, 4
  %bf.clear1 = and i32 %3, 16383
  %4 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %4, 18
  %cmp = icmp eq i32 %bf.val.sext, %bf.val.sext2
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %5 = load i32* bitcast (%0* @h2.x to i32*), align 16
  %6 = lshr i32 %5, 14
  %bf.clear3 = and i32 %6, 16383
  %7 = shl i32 %bf.clear3, 18
  %bf.val.sext4 = ashr i32 %7, 18
  %and = and i32 %bf.val.sext4, -65
  %8 = load i32* bitcast (%0* @h2.y to i32*), align 16
  %9 = lshr i32 %8, 18
  %bf.clear5 = and i32 %9, 16383
  %10 = shl i32 %bf.clear5, 18
  %bf.val.sext6 = ashr i32 %10, 18
  %cmp7 = icmp eq i32 %and, %bf.val.sext6
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp7, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @h3() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @h3.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %1, 18
  %and = and i32 %bf.val.sext, -9
  %2 = load i32* bitcast (%0* @h3.y to i32*), align 16
  %3 = lshr i32 %2, 4
  %bf.clear1 = and i32 %3, 16383
  %4 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %4, 18
  %and3 = and i32 %bf.val.sext2, -33
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %5 = load i32* bitcast (%0* @h3.x to i32*), align 16
  %6 = lshr i32 %5, 14
  %bf.clear4 = and i32 %6, 16383
  %7 = shl i32 %bf.clear4, 18
  %bf.val.sext5 = ashr i32 %7, 18
  %and6 = and i32 %bf.val.sext5, -65
  %8 = load i32* bitcast (%0* @h3.y to i32*), align 16
  %9 = lshr i32 %8, 18
  %bf.clear7 = and i32 %9, 16383
  %10 = shl i32 %bf.clear7, 18
  %bf.val.sext8 = ashr i32 %10, 18
  %and9 = and i32 %bf.val.sext8, -17
  %cmp10 = icmp eq i32 %and6, %and9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp10, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @h4() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @h4.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %1, 18
  %and = and i32 %bf.val.sext, 240
  %2 = load i32* bitcast (%0* @h4.y to i32*), align 16
  %3 = lshr i32 %2, 4
  %bf.clear1 = and i32 %3, 16383
  %4 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %4, 18
  %and3 = and i32 %bf.val.sext2, 3840
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %5 = load i32* bitcast (%0* @h4.x to i32*), align 16
  %6 = lshr i32 %5, 14
  %bf.clear4 = and i32 %6, 16383
  %7 = shl i32 %bf.clear4, 18
  %bf.val.sext5 = ashr i32 %7, 18
  %and6 = and i32 %bf.val.sext5, 240
  %8 = load i32* bitcast (%0* @h4.y to i32*), align 16
  %9 = lshr i32 %8, 18
  %bf.clear7 = and i32 %9, 16383
  %10 = shl i32 %bf.clear7, 18
  %bf.val.sext8 = ashr i32 %10, 18
  %and9 = and i32 %bf.val.sext8, 3840
  %cmp10 = icmp eq i32 %and6, %and9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp10, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @h5() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @h5.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %1, 18
  %and = and i32 %bf.val.sext, 3840
  %2 = load i32* bitcast (%0* @h5.y to i32*), align 16
  %3 = lshr i32 %2, 4
  %bf.clear1 = and i32 %3, 16383
  %4 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %4, 18
  %and3 = and i32 %bf.val.sext2, 240
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %5 = load i32* bitcast (%0* @h5.x to i32*), align 16
  %6 = lshr i32 %5, 14
  %bf.clear4 = and i32 %6, 16383
  %7 = shl i32 %bf.clear4, 18
  %bf.val.sext5 = ashr i32 %7, 18
  %and6 = and i32 %bf.val.sext5, 3840
  %8 = load i32* bitcast (%0* @h5.y to i32*), align 16
  %9 = lshr i32 %8, 18
  %bf.clear7 = and i32 %9, 16383
  %10 = shl i32 %bf.clear7, 18
  %bf.val.sext8 = ashr i32 %10, 18
  %and9 = and i32 %bf.val.sext8, 240
  %cmp10 = icmp eq i32 %and6, %and9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp10, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @h6() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @h6.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %1, 18
  %and = and i32 %bf.val.sext, 1023
  %2 = load i32* bitcast (%0* @h6.y to i32*), align 16
  %3 = lshr i32 %2, 4
  %bf.clear1 = and i32 %3, 16383
  %4 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %4, 18
  %and3 = and i32 %bf.val.sext2, 16368
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %5 = load i32* bitcast (%0* @h6.x to i32*), align 16
  %6 = lshr i32 %5, 14
  %bf.clear4 = and i32 %6, 16383
  %7 = shl i32 %bf.clear4, 18
  %bf.val.sext5 = ashr i32 %7, 18
  %and6 = and i32 %bf.val.sext5, 1023
  %8 = load i32* bitcast (%0* @h6.y to i32*), align 16
  %9 = lshr i32 %8, 18
  %bf.clear7 = and i32 %9, 16383
  %10 = shl i32 %bf.clear7, 18
  %bf.val.sext8 = ashr i32 %10, 18
  %and9 = and i32 %bf.val.sext8, 16368
  %cmp10 = icmp eq i32 %and6, %and9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp10, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @h7() nounwind uwtable {
entry:
  %0 = load i32* bitcast (%0* @h7.x to i32*), align 16
  %bf.clear = and i32 %0, 16383
  %1 = shl i32 %bf.clear, 18
  %bf.val.sext = ashr i32 %1, 18
  %and = and i32 %bf.val.sext, 16368
  %2 = load i32* bitcast (%0* @h7.y to i32*), align 16
  %3 = lshr i32 %2, 4
  %bf.clear1 = and i32 %3, 16383
  %4 = shl i32 %bf.clear1, 18
  %bf.val.sext2 = ashr i32 %4, 18
  %and3 = and i32 %bf.val.sext2, 1023
  %cmp = icmp eq i32 %and, %and3
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %5 = load i32* bitcast (%0* @h7.x to i32*), align 16
  %6 = lshr i32 %5, 14
  %bf.clear4 = and i32 %6, 16383
  %7 = shl i32 %bf.clear4, 18
  %bf.val.sext5 = ashr i32 %7, 18
  %and6 = and i32 %bf.val.sext5, 16368
  %8 = load i32* bitcast (%0* @h7.y to i32*), align 16
  %9 = lshr i32 %8, 18
  %bf.clear7 = and i32 %9, 16383
  %10 = shl i32 %bf.clear7, 18
  %bf.val.sext8 = ashr i32 %10, 18
  %and9 = and i32 %bf.val.sext8, 1023
  %cmp10 = icmp eq i32 %and6, %and9
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %11 = phi i1 [ false, %entry ], [ %cmp10, %land.rhs ]
  %land.ext = zext i1 %11 to i32
  ret i32 %land.ext
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @a1()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @a2()
  %tobool2 = icmp ne i32 %call1, 0
  br i1 %tobool2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @a3()
  %tobool6 = icmp ne i32 %call5, 0
  br i1 %tobool6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 @b1()
  %tobool10 = icmp ne i32 %call9, 0
  br i1 %tobool10, label %if.end12, label %if.then11

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i32 @b2()
  %tobool14 = icmp ne i32 %call13, 0
  br i1 %tobool14, label %if.end16, label %if.then15

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  %call17 = call i32 @b3()
  %tobool18 = icmp ne i32 %call17, 0
  br i1 %tobool18, label %if.end20, label %if.then19

if.then19:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end16
  %call21 = call i32 @c1()
  %tobool22 = icmp ne i32 %call21, 0
  br i1 %tobool22, label %if.end24, label %if.then23

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  %call25 = call i32 @c2()
  %tobool26 = icmp ne i32 %call25, 0
  br i1 %tobool26, label %if.end28, label %if.then27

if.then27:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end24
  %call29 = call i32 @c3()
  %tobool30 = icmp ne i32 %call29, 0
  br i1 %tobool30, label %if.end32, label %if.then31

if.then31:                                        ; preds = %if.end28
  call void @abort() noreturn nounwind
  unreachable

if.end32:                                         ; preds = %if.end28
  %call33 = call i32 @d1()
  %tobool34 = icmp ne i32 %call33, 0
  br i1 %tobool34, label %if.end36, label %if.then35

if.then35:                                        ; preds = %if.end32
  call void @abort() noreturn nounwind
  unreachable

if.end36:                                         ; preds = %if.end32
  %call37 = call i32 @d2()
  %tobool38 = icmp ne i32 %call37, 0
  br i1 %tobool38, label %if.end40, label %if.then39

if.then39:                                        ; preds = %if.end36
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end36
  %call41 = call i32 @d3()
  %tobool42 = icmp ne i32 %call41, 0
  br i1 %tobool42, label %if.end44, label %if.then43

if.then43:                                        ; preds = %if.end40
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end40
  %call45 = call i32 @e1()
  %tobool46 = icmp ne i32 %call45, 0
  br i1 %tobool46, label %if.end48, label %if.then47

if.then47:                                        ; preds = %if.end44
  call void @abort() noreturn nounwind
  unreachable

if.end48:                                         ; preds = %if.end44
  %call49 = call i32 @e2()
  %tobool50 = icmp ne i32 %call49, 0
  br i1 %tobool50, label %if.end52, label %if.then51

if.then51:                                        ; preds = %if.end48
  call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %if.end48
  %call53 = call i32 @e3()
  %tobool54 = icmp ne i32 %call53, 0
  br i1 %tobool54, label %if.end56, label %if.then55

if.then55:                                        ; preds = %if.end52
  call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end52
  %call57 = call i32 @e4()
  %tobool58 = icmp ne i32 %call57, 0
  br i1 %tobool58, label %if.end60, label %if.then59

if.then59:                                        ; preds = %if.end56
  call void @abort() noreturn nounwind
  unreachable

if.end60:                                         ; preds = %if.end56
  %call61 = call i32 @f1()
  %tobool62 = icmp ne i32 %call61, 0
  br i1 %tobool62, label %if.end64, label %if.then63

if.then63:                                        ; preds = %if.end60
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end60
  %call65 = call i32 @f2()
  %tobool66 = icmp ne i32 %call65, 0
  br i1 %tobool66, label %if.end68, label %if.then67

if.then67:                                        ; preds = %if.end64
  call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  %call69 = call i32 @f3()
  %tobool70 = icmp ne i32 %call69, 0
  br i1 %tobool70, label %if.end72, label %if.then71

if.then71:                                        ; preds = %if.end68
  call void @abort() noreturn nounwind
  unreachable

if.end72:                                         ; preds = %if.end68
  %call73 = call i32 @f4()
  %tobool74 = icmp ne i32 %call73, 0
  br i1 %tobool74, label %if.end76, label %if.then75

if.then75:                                        ; preds = %if.end72
  call void @abort() noreturn nounwind
  unreachable

if.end76:                                         ; preds = %if.end72
  %call77 = call i32 @g1()
  %tobool78 = icmp ne i32 %call77, 0
  br i1 %tobool78, label %if.end80, label %if.then79

if.then79:                                        ; preds = %if.end76
  call void @abort() noreturn nounwind
  unreachable

if.end80:                                         ; preds = %if.end76
  %call81 = call i32 @g2()
  %tobool82 = icmp ne i32 %call81, 0
  br i1 %tobool82, label %if.end84, label %if.then83

if.then83:                                        ; preds = %if.end80
  call void @abort() noreturn nounwind
  unreachable

if.end84:                                         ; preds = %if.end80
  %call85 = call i32 @g3()
  %tobool86 = icmp ne i32 %call85, 0
  br i1 %tobool86, label %if.end88, label %if.then87

if.then87:                                        ; preds = %if.end84
  call void @abort() noreturn nounwind
  unreachable

if.end88:                                         ; preds = %if.end84
  %call89 = call i32 @g4()
  %tobool90 = icmp ne i32 %call89, 0
  br i1 %tobool90, label %if.then91, label %if.end92

if.then91:                                        ; preds = %if.end88
  call void @abort() noreturn nounwind
  unreachable

if.end92:                                         ; preds = %if.end88
  %call93 = call i32 @g5()
  %tobool94 = icmp ne i32 %call93, 0
  br i1 %tobool94, label %if.then95, label %if.end96

if.then95:                                        ; preds = %if.end92
  call void @abort() noreturn nounwind
  unreachable

if.end96:                                         ; preds = %if.end92
  %call97 = call i32 @g6()
  %tobool98 = icmp ne i32 %call97, 0
  br i1 %tobool98, label %if.end100, label %if.then99

if.then99:                                        ; preds = %if.end96
  call void @abort() noreturn nounwind
  unreachable

if.end100:                                        ; preds = %if.end96
  %call101 = call i32 @g7()
  %tobool102 = icmp ne i32 %call101, 0
  br i1 %tobool102, label %if.end104, label %if.then103

if.then103:                                       ; preds = %if.end100
  call void @abort() noreturn nounwind
  unreachable

if.end104:                                        ; preds = %if.end100
  %call105 = call i32 @h1()
  %tobool106 = icmp ne i32 %call105, 0
  br i1 %tobool106, label %if.end108, label %if.then107

if.then107:                                       ; preds = %if.end104
  call void @abort() noreturn nounwind
  unreachable

if.end108:                                        ; preds = %if.end104
  %call109 = call i32 @h2()
  %tobool110 = icmp ne i32 %call109, 0
  br i1 %tobool110, label %if.end112, label %if.then111

if.then111:                                       ; preds = %if.end108
  call void @abort() noreturn nounwind
  unreachable

if.end112:                                        ; preds = %if.end108
  %call113 = call i32 @h3()
  %tobool114 = icmp ne i32 %call113, 0
  br i1 %tobool114, label %if.end116, label %if.then115

if.then115:                                       ; preds = %if.end112
  call void @abort() noreturn nounwind
  unreachable

if.end116:                                        ; preds = %if.end112
  %call117 = call i32 @h4()
  %tobool118 = icmp ne i32 %call117, 0
  br i1 %tobool118, label %if.then119, label %if.end120

if.then119:                                       ; preds = %if.end116
  call void @abort() noreturn nounwind
  unreachable

if.end120:                                        ; preds = %if.end116
  %call121 = call i32 @h5()
  %tobool122 = icmp ne i32 %call121, 0
  br i1 %tobool122, label %if.then123, label %if.end124

if.then123:                                       ; preds = %if.end120
  call void @abort() noreturn nounwind
  unreachable

if.end124:                                        ; preds = %if.end120
  %call125 = call i32 @h6()
  %tobool126 = icmp ne i32 %call125, 0
  br i1 %tobool126, label %if.end128, label %if.then127

if.then127:                                       ; preds = %if.end124
  call void @abort() noreturn nounwind
  unreachable

if.end128:                                        ; preds = %if.end124
  %call129 = call i32 @h7()
  %tobool130 = icmp ne i32 %call129, 0
  br i1 %tobool130, label %if.end132, label %if.then131

if.then131:                                       ; preds = %if.end128
  call void @abort() noreturn nounwind
  unreachable

if.end132:                                        ; preds = %if.end128
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
