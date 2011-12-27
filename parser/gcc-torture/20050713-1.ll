; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20050713-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i32 }
%struct.S = type { i32, i32, i32 }

@main.a = internal unnamed_addr constant %struct.S { i32 3, i32 4, i32 5 }, align 4
@main.b = internal unnamed_addr constant %struct.S { i32 6, i32 7, i32 8 }, align 4
@main.c = internal unnamed_addr constant %struct.S { i32 9, i32 10, i32 11 }, align 4

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

define i32 @foo2(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1) nounwind uwtable {
entry:
  %x = alloca %struct.S, align 8
  %y = alloca %struct.S, align 8
  %0 = bitcast %struct.S* %x to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %x.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i32 %x.coerce1, i32* %2
  %3 = bitcast %struct.S* %y to %0*
  %4 = getelementptr %0* %3, i32 0, i32 0
  store i64 %y.coerce0, i64* %4
  %5 = getelementptr %0* %3, i32 0, i32 1
  store i32 %y.coerce1, i32* %5
  %a = getelementptr inbounds %struct.S* %x, i32 0, i32 0
  %tmp = load i32* %a, align 4
  %cmp = icmp ne i32 %tmp, 3
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.S* %x, i32 0, i32 1
  %tmp1 = load i32* %b, align 4
  %cmp2 = icmp ne i32 %tmp1, 4
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.S* %x, i32 0, i32 2
  %tmp4 = load i32* %c, align 4
  %cmp5 = icmp ne i32 %tmp4, 5
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  %a6 = getelementptr inbounds %struct.S* %y, i32 0, i32 0
  %tmp7 = load i32* %a6, align 4
  %cmp8 = icmp ne i32 %tmp7, 6
  br i1 %cmp8, label %if.then17, label %lor.lhs.false9

lor.lhs.false9:                                   ; preds = %if.end
  %b10 = getelementptr inbounds %struct.S* %y, i32 0, i32 1
  %tmp11 = load i32* %b10, align 4
  %cmp12 = icmp ne i32 %tmp11, 7
  br i1 %cmp12, label %if.then17, label %lor.lhs.false13

lor.lhs.false13:                                  ; preds = %lor.lhs.false9
  %c14 = getelementptr inbounds %struct.S* %y, i32 0, i32 2
  %tmp15 = load i32* %c14, align 4
  %cmp16 = icmp ne i32 %tmp15, 8
  br i1 %cmp16, label %if.then17, label %if.end18

if.then17:                                        ; preds = %lor.lhs.false13, %lor.lhs.false9, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %lor.lhs.false13
  ret i32 0
}

declare void @abort() noreturn nounwind

define i32 @foo3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) nounwind uwtable {
entry:
  %x = alloca %struct.S, align 8
  %y = alloca %struct.S, align 8
  %z = alloca %struct.S, align 8
  %0 = bitcast %struct.S* %x to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %x.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i32 %x.coerce1, i32* %2
  %3 = bitcast %struct.S* %y to %0*
  %4 = getelementptr %0* %3, i32 0, i32 0
  store i64 %y.coerce0, i64* %4
  %5 = getelementptr %0* %3, i32 0, i32 1
  store i32 %y.coerce1, i32* %5
  %6 = bitcast %struct.S* %z to %0*
  %7 = getelementptr %0* %6, i32 0, i32 0
  store i64 %z.coerce0, i64* %7
  %8 = getelementptr %0* %6, i32 0, i32 1
  store i32 %z.coerce1, i32* %8
  %9 = bitcast %struct.S* %x to %0*
  %10 = getelementptr %0* %9, i32 0, i32 0
  %11 = load i64* %10, align 1
  %12 = getelementptr %0* %9, i32 0, i32 1
  %13 = load i32* %12, align 1
  %14 = bitcast %struct.S* %y to %0*
  %15 = getelementptr %0* %14, i32 0, i32 0
  %16 = load i64* %15, align 1
  %17 = getelementptr %0* %14, i32 0, i32 1
  %18 = load i32* %17, align 1
  %call = call i32 @foo2(i64 %11, i32 %13, i64 %16, i32 %18)
  %a = getelementptr inbounds %struct.S* %z, i32 0, i32 0
  %tmp = load i32* %a, align 4
  %cmp = icmp ne i32 %tmp, 9
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.S* %z, i32 0, i32 1
  %tmp1 = load i32* %b, align 4
  %cmp2 = icmp ne i32 %tmp1, 10
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.S* %z, i32 0, i32 2
  %tmp4 = load i32* %c, align 4
  %cmp5 = icmp ne i32 %tmp4, 11
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  ret i32 0
}

define i32 @bar2(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1) nounwind uwtable {
entry:
  %x = alloca %struct.S, align 8
  %y = alloca %struct.S, align 8
  %0 = bitcast %struct.S* %x to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %x.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i32 %x.coerce1, i32* %2
  %3 = bitcast %struct.S* %y to %0*
  %4 = getelementptr %0* %3, i32 0, i32 0
  store i64 %y.coerce0, i64* %4
  %5 = getelementptr %0* %3, i32 0, i32 1
  store i32 %y.coerce1, i32* %5
  %6 = bitcast %struct.S* %y to %0*
  %7 = getelementptr %0* %6, i32 0, i32 0
  %8 = load i64* %7, align 1
  %9 = getelementptr %0* %6, i32 0, i32 1
  %10 = load i32* %9, align 1
  %11 = bitcast %struct.S* %x to %0*
  %12 = getelementptr %0* %11, i32 0, i32 0
  %13 = load i64* %12, align 1
  %14 = getelementptr %0* %11, i32 0, i32 1
  %15 = load i32* %14, align 1
  %call = call i32 @foo2(i64 %8, i32 %10, i64 %13, i32 %15)
  ret i32 %call
}

define i32 @bar3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) nounwind uwtable {
entry:
  %x = alloca %struct.S, align 8
  %y = alloca %struct.S, align 8
  %z = alloca %struct.S, align 8
  %0 = bitcast %struct.S* %x to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %x.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i32 %x.coerce1, i32* %2
  %3 = bitcast %struct.S* %y to %0*
  %4 = getelementptr %0* %3, i32 0, i32 0
  store i64 %y.coerce0, i64* %4
  %5 = getelementptr %0* %3, i32 0, i32 1
  store i32 %y.coerce1, i32* %5
  %6 = bitcast %struct.S* %z to %0*
  %7 = getelementptr %0* %6, i32 0, i32 0
  store i64 %z.coerce0, i64* %7
  %8 = getelementptr %0* %6, i32 0, i32 1
  store i32 %z.coerce1, i32* %8
  %9 = bitcast %struct.S* %y to %0*
  %10 = getelementptr %0* %9, i32 0, i32 0
  %11 = load i64* %10, align 1
  %12 = getelementptr %0* %9, i32 0, i32 1
  %13 = load i32* %12, align 1
  %14 = bitcast %struct.S* %x to %0*
  %15 = getelementptr %0* %14, i32 0, i32 0
  %16 = load i64* %15, align 1
  %17 = getelementptr %0* %14, i32 0, i32 1
  %18 = load i32* %17, align 1
  %19 = bitcast %struct.S* %z to %0*
  %20 = getelementptr %0* %19, i32 0, i32 0
  %21 = load i64* %20, align 1
  %22 = getelementptr %0* %19, i32 0, i32 1
  %23 = load i32* %22, align 1
  %call = call i32 @foo3(i64 %11, i32 %13, i64 %16, i32 %18, i64 %21, i32 %23)
  ret i32 %call
}

define i32 @baz3(i64 %x.coerce0, i32 %x.coerce1, i64 %y.coerce0, i32 %y.coerce1, i64 %z.coerce0, i32 %z.coerce1) nounwind uwtable {
entry:
  %x = alloca %struct.S, align 8
  %y = alloca %struct.S, align 8
  %z = alloca %struct.S, align 8
  %0 = bitcast %struct.S* %x to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %x.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i32 %x.coerce1, i32* %2
  %3 = bitcast %struct.S* %y to %0*
  %4 = getelementptr %0* %3, i32 0, i32 0
  store i64 %y.coerce0, i64* %4
  %5 = getelementptr %0* %3, i32 0, i32 1
  store i32 %y.coerce1, i32* %5
  %6 = bitcast %struct.S* %z to %0*
  %7 = getelementptr %0* %6, i32 0, i32 0
  store i64 %z.coerce0, i64* %7
  %8 = getelementptr %0* %6, i32 0, i32 1
  store i32 %z.coerce1, i32* %8
  %9 = bitcast %struct.S* %y to %0*
  %10 = getelementptr %0* %9, i32 0, i32 0
  %11 = load i64* %10, align 1
  %12 = getelementptr %0* %9, i32 0, i32 1
  %13 = load i32* %12, align 1
  %14 = bitcast %struct.S* %z to %0*
  %15 = getelementptr %0* %14, i32 0, i32 0
  %16 = load i64* %15, align 1
  %17 = getelementptr %0* %14, i32 0, i32 1
  %18 = load i32* %17, align 1
  %19 = bitcast %struct.S* %x to %0*
  %20 = getelementptr %0* %19, i32 0, i32 0
  %21 = load i64* %20, align 1
  %22 = getelementptr %0* %19, i32 0, i32 1
  %23 = load i32* %22, align 1
  %call = call i32 @foo3(i64 %11, i32 %13, i64 %16, i32 %18, i64 %21, i32 %23)
  ret i32 %call
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.S, align 4
  %b = alloca %struct.S, align 4
  %c = alloca %struct.S, align 4
  store i32 0, i32* %retval
  %tmp = bitcast %struct.S* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.S* @main.a to i8*), i64 12, i32 4, i1 false)
  %tmp2 = bitcast %struct.S* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast (%struct.S* @main.b to i8*), i64 12, i32 4, i1 false)
  %tmp4 = bitcast %struct.S* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp4, i8* bitcast (%struct.S* @main.c to i8*), i64 12, i32 4, i1 false)
  %0 = bitcast %struct.S* %b to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  %2 = load i64* %1, align 1
  %3 = getelementptr %0* %0, i32 0, i32 1
  %4 = load i32* %3, align 1
  %5 = bitcast %struct.S* %a to %0*
  %6 = getelementptr %0* %5, i32 0, i32 0
  %7 = load i64* %6, align 1
  %8 = getelementptr %0* %5, i32 0, i32 1
  %9 = load i32* %8, align 1
  %call = call i32 @bar2(i64 %2, i32 %4, i64 %7, i32 %9)
  %10 = bitcast %struct.S* %b to %0*
  %11 = getelementptr %0* %10, i32 0, i32 0
  %12 = load i64* %11, align 1
  %13 = getelementptr %0* %10, i32 0, i32 1
  %14 = load i32* %13, align 1
  %15 = bitcast %struct.S* %a to %0*
  %16 = getelementptr %0* %15, i32 0, i32 0
  %17 = load i64* %16, align 1
  %18 = getelementptr %0* %15, i32 0, i32 1
  %19 = load i32* %18, align 1
  %20 = bitcast %struct.S* %c to %0*
  %21 = getelementptr %0* %20, i32 0, i32 0
  %22 = load i64* %21, align 1
  %23 = getelementptr %0* %20, i32 0, i32 1
  %24 = load i32* %23, align 1
  %call5 = call i32 @bar3(i64 %12, i32 %14, i64 %17, i32 %19, i64 %22, i32 %24)
  %25 = bitcast %struct.S* %c to %0*
  %26 = getelementptr %0* %25, i32 0, i32 0
  %27 = load i64* %26, align 1
  %28 = getelementptr %0* %25, i32 0, i32 1
  %29 = load i32* %28, align 1
  %30 = bitcast %struct.S* %a to %0*
  %31 = getelementptr %0* %30, i32 0, i32 0
  %32 = load i64* %31, align 1
  %33 = getelementptr %0* %30, i32 0, i32 1
  %34 = load i32* %33, align 1
  %35 = bitcast %struct.S* %b to %0*
  %36 = getelementptr %0* %35, i32 0, i32 0
  %37 = load i64* %36, align 1
  %38 = getelementptr %0* %35, i32 0, i32 1
  %39 = load i32* %38, align 1
  %call6 = call i32 @baz3(i64 %27, i32 %29, i64 %32, i32 %34, i64 %37, i32 %39)
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
