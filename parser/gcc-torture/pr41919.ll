; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr41919.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S1 = type { i8 }

@g_23 = global i32 0, align 4
@foo.l_128 = internal unnamed_addr constant %struct.S1 { i8 1 }, align 1

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

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.S1, align 1
  store i32 0, i32* %retval
  %call = call i8 @foo()
  %coerce.dive = getelementptr %struct.S1* %s, i32 0, i32 0
  store i8 %call, i8* %coerce.dive
  %f0 = getelementptr inbounds %struct.S1* %s, i32 0, i32 0
  %tmp = load i8* %f0, align 1
  %conv = sext i8 %tmp to i32
  %tobool = icmp ne i32 %conv, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %0 = phi i1 [ false, %entry ], [ true, %land.rhs ]
  %land.ext = zext i1 %0 to i32
  %xor = xor i32 153, %land.ext
  %conv1 = trunc i32 %xor to i8
  %call2 = call signext i8 @bar(i8 signext %conv1, i8 signext 1)
  %conv3 = sext i8 %call2 to i32
  %cmp = icmp ne i32 %conv3, -104
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.end
  ret i32 0
}

define internal i8 @foo() nounwind uwtable {
entry:
  %retval = alloca %struct.S1, align 1
  %l_100 = alloca i32*, align 8
  %l_110 = alloca i32**, align 8
  %l_128 = alloca %struct.S1, align 1
  store i32* @g_23, i32** %l_100, align 8
  store i32** %l_100, i32*** %l_110, align 8
  %tmp = bitcast %struct.S1* %l_128 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* getelementptr inbounds (%struct.S1* @foo.l_128, i32 0, i32 0), i64 1, i32 1, i1 false)
  %tmp1 = load i32** %l_100, align 8
  %cmp = icmp eq i32* %tmp1, @g_23
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp2 = load i32** %l_100, align 8
  %cmp3 = icmp eq i32* %tmp2, @g_23
  br i1 %cmp3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  %tmp6 = load i32** %l_100, align 8
  %cmp7 = icmp eq i32* %tmp6, @g_23
  br i1 %cmp7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end5
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end5
  %tmp10 = load i32** %l_100, align 8
  %cmp11 = icmp eq i32* %tmp10, @g_23
  br i1 %cmp11, label %if.end13, label %if.then12

if.then12:                                        ; preds = %if.end9
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end9
  %tmp14 = load i32** %l_100, align 8
  %cmp15 = icmp eq i32* %tmp14, @g_23
  br i1 %cmp15, label %if.end17, label %if.then16

if.then16:                                        ; preds = %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.end13
  %tmp18 = load i32** %l_100, align 8
  %cmp19 = icmp eq i32* %tmp18, @g_23
  br i1 %cmp19, label %if.end21, label %if.then20

if.then20:                                        ; preds = %if.end17
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %if.end17
  %tmp22 = load i32** %l_100, align 8
  %cmp23 = icmp eq i32* %tmp22, @g_23
  br i1 %cmp23, label %if.end25, label %if.then24

if.then24:                                        ; preds = %if.end21
  call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end21
  %tmp26 = bitcast %struct.S1* %retval to i8*
  %tmp27 = bitcast %struct.S1* %l_128 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp26, i8* %tmp27, i64 1, i32 1, i1 false)
  %coerce.dive = getelementptr %struct.S1* %retval, i32 0, i32 0
  %0 = load i8* %coerce.dive
  ret i8 %0
}

define internal signext i8 @bar(i8 signext %si1, i8 signext %si2) nounwind uwtable {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, i8* %si1.addr, align 1
  store i8 %si2, i8* %si2.addr, align 1
  %tmp = load i8* %si1.addr, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp sle i32 %conv, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %tmp2 = load i8* %si1.addr, align 1
  %conv3 = sext i8 %tmp2 to i32
  br label %cond.end

cond.false:                                       ; preds = %entry
  %tmp4 = load i8* %si2.addr, align 1
  %conv5 = sext i8 %tmp4 to i32
  %mul = mul nsw i32 %conv5, 2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv3, %cond.true ], [ %mul, %cond.false ]
  %conv6 = trunc i32 %cond to i8
  ret i8 %conv6
}

declare void @abort() noreturn nounwind

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind
