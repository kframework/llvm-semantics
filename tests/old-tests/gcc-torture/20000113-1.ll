; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.x = type { i8, [3 x i8] }

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

define void @foobar(i32 %x, i32 %y, i32 %z) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  %y.addr = alloca i32, align 4
  %z.addr = alloca i32, align 4
  %a = alloca %struct.x, align 4
  %b = alloca %struct.x, align 4
  %c = alloca %struct.x*, align 8
  store i32 %x, i32* %x.addr, align 4
  store i32 %y, i32* %y.addr, align 4
  store i32 %z, i32* %z.addr, align 4
  %tmp = load i32* %x.addr, align 4
  %bf.value = and i32 %tmp, 1
  %0 = bitcast %struct.x* %a to i32*
  %1 = and i32 %bf.value, 1
  %2 = load i32* %0, align 4
  %3 = and i32 %2, -2
  %4 = or i32 %3, %1
  store i32 %4, i32* %0, align 4
  %tmp1 = load i32* %y.addr, align 4
  %bf.value2 = and i32 %tmp1, 3
  %5 = bitcast %struct.x* %a to i32*
  %6 = and i32 %bf.value2, 3
  %7 = shl i32 %6, 1
  %8 = load i32* %5, align 4
  %9 = and i32 %8, -7
  %10 = or i32 %9, %7
  store i32 %10, i32* %5, align 4
  %tmp3 = load i32* %z.addr, align 4
  %bf.value4 = and i32 %tmp3, 7
  %11 = bitcast %struct.x* %a to i32*
  %12 = and i32 %bf.value4, 7
  %13 = shl i32 %12, 3
  %14 = load i32* %11, align 4
  %15 = and i32 %14, -57
  %16 = or i32 %15, %13
  store i32 %16, i32* %11, align 4
  %tmp6 = load i32* %x.addr, align 4
  %bf.value7 = and i32 %tmp6, 1
  %17 = bitcast %struct.x* %b to i32*
  %18 = and i32 %bf.value7, 1
  %19 = load i32* %17, align 4
  %20 = and i32 %19, -2
  %21 = or i32 %20, %18
  store i32 %21, i32* %17, align 4
  %tmp8 = load i32* %y.addr, align 4
  %bf.value9 = and i32 %tmp8, 3
  %22 = bitcast %struct.x* %b to i32*
  %23 = and i32 %bf.value9, 3
  %24 = shl i32 %23, 1
  %25 = load i32* %22, align 4
  %26 = and i32 %25, -7
  %27 = or i32 %26, %24
  store i32 %27, i32* %22, align 4
  %tmp10 = load i32* %z.addr, align 4
  %bf.value11 = and i32 %tmp10, 7
  %28 = bitcast %struct.x* %b to i32*
  %29 = and i32 %bf.value11, 7
  %30 = shl i32 %29, 3
  %31 = load i32* %28, align 4
  %32 = and i32 %31, -57
  %33 = or i32 %32, %30
  store i32 %33, i32* %28, align 4
  store %struct.x* %b, %struct.x** %c, align 8
  %34 = bitcast %struct.x* %a to i32*
  %35 = load i32* %34, align 4
  %36 = lshr i32 %35, 1
  %bf.clear = and i32 %36, 3
  %37 = bitcast %struct.x* %a to i32*
  %38 = load i32* %37, align 4
  %bf.clear13 = and i32 %38, 1
  %sub = sub nsw i32 %bf.clear, %bf.clear13
  %tmp14 = load %struct.x** %c, align 8
  %39 = bitcast %struct.x* %tmp14 to i32*
  %40 = load i32* %39, align 4
  %41 = lshr i32 %40, 1
  %bf.clear15 = and i32 %41, 3
  %mul = mul nsw i32 %sub, %bf.clear15
  %tmp16 = load %struct.x** %c, align 8
  %42 = bitcast %struct.x* %tmp16 to i32*
  %43 = load i32* %42, align 4
  %44 = lshr i32 %43, 3
  %bf.clear17 = and i32 %44, 7
  %add = add nsw i32 %bf.clear17, %mul
  %bf.value18 = and i32 %add, 7
  %45 = bitcast %struct.x* %tmp16 to i32*
  %46 = and i32 %bf.value18, 7
  %47 = shl i32 %46, 3
  %48 = load i32* %45, align 4
  %49 = and i32 %48, -57
  %50 = or i32 %49, %47
  store i32 %50, i32* %45, align 4
  %51 = bitcast %struct.x* %a to i32*
  %52 = load i32* %51, align 4
  %bf.clear19 = and i32 %52, 1
  %cmp = icmp ne i32 %bf.clear19, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp20 = load %struct.x** %c, align 8
  %53 = bitcast %struct.x* %tmp20 to i32*
  %54 = load i32* %53, align 4
  %55 = lshr i32 %54, 3
  %bf.clear21 = and i32 %55, 7
  %cmp22 = icmp ne i32 %bf.clear21, 5
  br i1 %cmp22, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foobar(i32 1, i32 2, i32 3)
  %0 = load i32* %retval
  ret i32 %0
}
