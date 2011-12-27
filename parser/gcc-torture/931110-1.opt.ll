; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/931110-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, [10 x %struct.small] }
%struct.small = type { i8, i8 }

@x = common global %struct.anon zeroinitializer, align 4

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

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 0) to i16*), align 4
  %1 = and i16 %0, -8
  store i16 %1, i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 0) to i16*), align 4
  %2 = load i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 1) to i16*), align 2
  %3 = and i16 %2, -8
  store i16 %3, i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 1) to i16*), align 2
  %4 = load i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 2) to i16*), align 4
  %5 = and i16 %4, -8
  store i16 %5, i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 2) to i16*), align 4
  %6 = load i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 3) to i16*), align 2
  %7 = and i16 %6, -8
  store i16 %7, i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 3) to i16*), align 2
  %8 = load i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 4) to i16*), align 4
  %9 = and i16 %8, -8
  store i16 %9, i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 4) to i16*), align 4
  %10 = load i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 5) to i16*), align 2
  %11 = and i16 %10, -8
  store i16 %11, i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 5) to i16*), align 2
  %12 = load i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 6) to i16*), align 4
  %13 = and i16 %12, -8
  store i16 %13, i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 6) to i16*), align 4
  %14 = load i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 7) to i16*), align 2
  %15 = and i16 %14, -8
  store i16 %15, i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 7) to i16*), align 2
  %16 = load i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 8) to i16*), align 4
  %17 = and i16 %16, -8
  store i16 %17, i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 8) to i16*), align 4
  %18 = load i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 9) to i16*), align 2
  %19 = and i16 %18, -8
  store i16 %19, i16* bitcast (%struct.small* getelementptr inbounds (%struct.anon* @x, i64 0, i32 1, i64 9) to i16*), align 2
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
