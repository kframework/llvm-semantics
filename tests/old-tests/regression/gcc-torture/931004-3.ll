; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/931004-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiny = type { i16 }

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

define void @f(i32 %n, i16 %x.coerce, i16 %y.coerce, i16 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca %struct.tiny, align 2
  %y = alloca %struct.tiny, align 2
  %z = alloca %struct.tiny, align 2
  %l.addr = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  %coerce.dive = getelementptr %struct.tiny* %x, i32 0, i32 0
  store i16 %x.coerce, i16* %coerce.dive
  %coerce.dive1 = getelementptr %struct.tiny* %y, i32 0, i32 0
  store i16 %y.coerce, i16* %coerce.dive1
  %coerce.dive2 = getelementptr %struct.tiny* %z, i32 0, i32 0
  store i16 %z.coerce, i16* %coerce.dive2
  store i64 %l, i64* %l.addr, align 8
  %c = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %tmp = load i16* %c, align 2
  %conv = sext i16 %tmp to i32
  %cmp = icmp ne i32 %conv, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %c4 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 0
  %tmp5 = load i16* %c4, align 2
  %conv6 = sext i16 %tmp5 to i32
  %cmp7 = icmp ne i32 %conv6, 11
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end
  %c11 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 0
  %tmp12 = load i16* %c11, align 2
  %conv13 = sext i16 %tmp12 to i32
  %cmp14 = icmp ne i32 %conv13, 12
  br i1 %cmp14, label %if.then16, label %if.end17

if.then16:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end17:                                         ; preds = %if.end10
  %tmp18 = load i64* %l.addr, align 8
  %cmp19 = icmp ne i64 %tmp18, 123
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end17
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end17
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 2
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %c = getelementptr inbounds %struct.tiny* %arrayidx, i32 0, i32 0
  store i16 10, i16* %c, align 2
  %arrayidx1 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %c2 = getelementptr inbounds %struct.tiny* %arrayidx1, i32 0, i32 0
  store i16 11, i16* %c2, align 2
  %arrayidx3 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %c4 = getelementptr inbounds %struct.tiny* %arrayidx3, i32 0, i32 0
  store i16 12, i16* %c4, align 2
  %arrayidx5 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %arrayidx6 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx7 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %coerce.dive = getelementptr %struct.tiny* %arrayidx5, i32 0, i32 0
  %0 = load i16* %coerce.dive
  %coerce.dive8 = getelementptr %struct.tiny* %arrayidx6, i32 0, i32 0
  %1 = load i16* %coerce.dive8
  %coerce.dive9 = getelementptr %struct.tiny* %arrayidx7, i32 0, i32 0
  %2 = load i16* %coerce.dive9
  call void @f(i32 3, i16 %0, i16 %1, i16 %2, i64 123)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @exit(i32) noreturn nounwind
