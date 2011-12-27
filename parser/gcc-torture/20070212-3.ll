; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20070212-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.foo = type { i32, i32 }

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

define i32 @bar(%struct.foo* %k, i32 %k2, i32 %f, i32 %f2) nounwind uwtable {
entry:
  %k.addr = alloca %struct.foo*, align 8
  %k2.addr = alloca i32, align 4
  %f.addr = alloca i32, align 4
  %f2.addr = alloca i32, align 4
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  %res = alloca i32, align 4
  store %struct.foo* %k, %struct.foo** %k.addr, align 8
  store i32 %k2, i32* %k2.addr, align 4
  store i32 %f, i32* %f.addr, align 4
  store i32 %f2, i32* %f2.addr, align 4
  %tmp = load i32* %f.addr, align 4
  %tobool = icmp ne i32 %tmp, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %tmp1 = load %struct.foo** %k.addr, align 8
  %i = getelementptr inbounds %struct.foo* %tmp1, i32 0, i32 0
  store i32* %i, i32** %p, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  %tmp2 = load %struct.foo** %k.addr, align 8
  %j = getelementptr inbounds %struct.foo* %tmp2, i32 0, i32 1
  store i32* %j, i32** %p, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tmp3 = load i32** %p, align 8
  %tmp4 = load i32* %tmp3
  store i32 %tmp4, i32* %res, align 4
  %tmp5 = load %struct.foo** %k.addr, align 8
  %i6 = getelementptr inbounds %struct.foo* %tmp5, i32 0, i32 0
  store i32 1, i32* %i6, align 4
  %tmp7 = load i32* %f2.addr, align 4
  %tobool8 = icmp ne i32 %tmp7, 0
  br i1 %tobool8, label %if.then9, label %if.else11

if.then9:                                         ; preds = %if.end
  %tmp10 = load i32** %p, align 8
  store i32* %tmp10, i32** %q, align 8
  br label %if.end12

if.else11:                                        ; preds = %if.end
  store i32* %k2.addr, i32** %q, align 8
  br label %if.end12

if.end12:                                         ; preds = %if.else11, %if.then9
  %tmp13 = load i32* %res, align 4
  %tmp14 = load i32** %q, align 8
  %tmp15 = load i32* %tmp14
  %add = add nsw i32 %tmp13, %tmp15
  ret i32 %add
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %k = alloca %struct.foo, align 4
  store i32 0, i32* %retval
  %i = getelementptr inbounds %struct.foo* %k, i32 0, i32 0
  store i32 0, i32* %i, align 4
  %j = getelementptr inbounds %struct.foo* %k, i32 0, i32 1
  store i32 1, i32* %j, align 4
  %call = call i32 @bar(%struct.foo* %k, i32 1, i32 1, i32 1)
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
