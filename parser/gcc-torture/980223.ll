; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/980223.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.object = type { i8*, i64 }

@nil = common global i32 0, align 4
@cons1 = global [2 x %struct.object] [%struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }, %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }], align 16
@cons2 = global [2 x %struct.object] [%struct.object { i8* bitcast ([2 x %struct.object]* @cons1 to i8*), i64 64 }, %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }], align 16
@main.x = internal unnamed_addr constant %struct.object { i8* bitcast ([2 x %struct.object]* @cons2 to i8*), i64 64 }, align 8
@main.y = internal unnamed_addr constant %struct.object { i8* bitcast (i32* @nil to i8*), i64 0 }, align 8

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

define %struct.object @bar(i8* %blah.coerce0, i64 %blah.coerce1) nounwind uwtable {
entry:
  %retval = alloca %struct.object, align 8
  %blah = alloca %struct.object, align 8
  %0 = getelementptr %struct.object* %blah, i32 0, i32 0
  store i8* %blah.coerce0, i8** %0
  %1 = getelementptr %struct.object* %blah, i32 0, i32 1
  store i64 %blah.coerce1, i64* %1
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load %struct.object* %retval
  ret %struct.object %2
}

declare void @abort() noreturn nounwind

define %struct.object @foo(i8* %x.coerce0, i64 %x.coerce1, i8* %y.coerce0, i64 %y.coerce1) nounwind uwtable {
entry:
  %retval = alloca %struct.object, align 8
  %x = alloca %struct.object, align 8
  %y = alloca %struct.object, align 8
  %z = alloca %struct.object, align 8
  %0 = getelementptr %struct.object* %x, i32 0, i32 0
  store i8* %x.coerce0, i8** %0
  %1 = getelementptr %struct.object* %x, i32 0, i32 1
  store i64 %x.coerce1, i64* %1
  %2 = getelementptr %struct.object* %y, i32 0, i32 0
  store i8* %y.coerce0, i8** %2
  %3 = getelementptr %struct.object* %y, i32 0, i32 1
  store i64 %y.coerce1, i64* %3
  %addr = getelementptr inbounds %struct.object* %x, i32 0, i32 0
  %tmp = load i8** %addr, align 8
  %4 = bitcast i8* %tmp to %struct.object*
  %tmp1 = bitcast %struct.object* %z to i8*
  %tmp2 = bitcast %struct.object* %4 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp1, i8* %tmp2, i64 16, i32 8, i1 false)
  %type = getelementptr inbounds %struct.object* %z, i32 0, i32 1
  %tmp3 = load i64* %type, align 8
  %and = and i64 %tmp3, 64
  %tobool = icmp ne i64 %and, 0
  br i1 %tobool, label %if.then, label %if.end17

if.then:                                          ; preds = %entry
  %addr4 = getelementptr inbounds %struct.object* %z, i32 0, i32 0
  %tmp5 = load i8** %addr4, align 8
  %add.ptr = getelementptr inbounds i8* %tmp5, i64 16
  %5 = bitcast i8* %add.ptr to %struct.object*
  %tmp6 = bitcast %struct.object* %y to i8*
  %tmp7 = bitcast %struct.object* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp6, i8* %tmp7, i64 16, i32 8, i1 false)
  %addr8 = getelementptr inbounds %struct.object* %z, i32 0, i32 0
  %tmp9 = load i8** %addr8, align 8
  %6 = bitcast i8* %tmp9 to %struct.object*
  %tmp10 = bitcast %struct.object* %z to i8*
  %tmp11 = bitcast %struct.object* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp10, i8* %tmp11, i64 16, i32 8, i1 false)
  %type12 = getelementptr inbounds %struct.object* %z, i32 0, i32 1
  %tmp13 = load i64* %type12, align 8
  %and14 = and i64 %tmp13, 64
  %tobool15 = icmp ne i64 %and14, 0
  br i1 %tobool15, label %if.then16, label %if.end

if.then16:                                        ; preds = %if.then
  %7 = getelementptr %struct.object* %y, i32 0, i32 0
  %8 = load i8** %7, align 1
  %9 = getelementptr %struct.object* %y, i32 0, i32 1
  %10 = load i64* %9, align 1
  %call = call %struct.object @bar(i8* %8, i64 %10)
  %11 = getelementptr %struct.object* %y, i32 0, i32 0
  %12 = extractvalue %struct.object %call, 0
  store i8* %12, i8** %11
  %13 = getelementptr %struct.object* %y, i32 0, i32 1
  %14 = extractvalue %struct.object %call, 1
  store i64 %14, i64* %13
  br label %if.end

if.end:                                           ; preds = %if.then16, %if.then
  br label %if.end17

if.end17:                                         ; preds = %if.end, %entry
  %tmp18 = bitcast %struct.object* %retval to i8*
  %tmp19 = bitcast %struct.object* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp18, i8* %tmp19, i64 16, i32 8, i1 false)
  %15 = load %struct.object* %retval
  ret %struct.object %15
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.object, align 8
  %y = alloca %struct.object, align 8
  %three = alloca %struct.object, align 8
  store i32 0, i32* %retval
  %tmp = bitcast %struct.object* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.object* @main.x to i8*), i64 16, i32 8, i1 false)
  %tmp2 = bitcast %struct.object* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast (%struct.object* @main.y to i8*), i64 16, i32 8, i1 false)
  %0 = getelementptr %struct.object* %x, i32 0, i32 0
  %1 = load i8** %0, align 1
  %2 = getelementptr %struct.object* %x, i32 0, i32 1
  %3 = load i64* %2, align 1
  %4 = getelementptr %struct.object* %y, i32 0, i32 0
  %5 = load i8** %4, align 1
  %6 = getelementptr %struct.object* %y, i32 0, i32 1
  %7 = load i64* %6, align 1
  %call = call %struct.object @foo(i8* %1, i64 %3, i8* %5, i64 %7)
  %8 = getelementptr %struct.object* %three, i32 0, i32 0
  %9 = extractvalue %struct.object %call, 0
  store i8* %9, i8** %8
  %10 = getelementptr %struct.object* %three, i32 0, i32 1
  %11 = extractvalue %struct.object %call, 1
  store i64 %11, i64* %10
  ret i32 0
}
