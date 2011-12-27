; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/931004-11.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiny = type { i8, i8, i8 }

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

define void @f(i32 %n, i24 %x.coerce, i24 %y.coerce, i24 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca %struct.tiny, align 4
  %tmp = alloca i24
  %y = alloca %struct.tiny, align 4
  %tmp1 = alloca i24
  %z = alloca %struct.tiny, align 4
  %tmp2 = alloca i24
  %l.addr = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  store i24 %x.coerce, i24* %tmp
  %0 = bitcast i24* %tmp to %struct.tiny*
  %1 = load %struct.tiny* %0, align 1
  store %struct.tiny %1, %struct.tiny* %x
  store i24 %y.coerce, i24* %tmp1
  %2 = bitcast i24* %tmp1 to %struct.tiny*
  %3 = load %struct.tiny* %2, align 1
  store %struct.tiny %3, %struct.tiny* %y
  store i24 %z.coerce, i24* %tmp2
  %4 = bitcast i24* %tmp2 to %struct.tiny*
  %5 = load %struct.tiny* %4, align 1
  store %struct.tiny %5, %struct.tiny* %z
  store i64 %l, i64* %l.addr, align 8
  %c = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %tmp3 = load i8* %c, align 1
  %conv = sext i8 %tmp3 to i32
  %cmp = icmp ne i32 %conv, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %d = getelementptr inbounds %struct.tiny* %x, i32 0, i32 1
  %tmp5 = load i8* %d, align 1
  %conv6 = sext i8 %tmp5 to i32
  %cmp7 = icmp ne i32 %conv6, 20
  br i1 %cmp7, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end
  %e = getelementptr inbounds %struct.tiny* %x, i32 0, i32 2
  %tmp11 = load i8* %e, align 1
  %conv12 = sext i8 %tmp11 to i32
  %cmp13 = icmp ne i32 %conv12, 30
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end10
  %c17 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 0
  %tmp18 = load i8* %c17, align 1
  %conv19 = sext i8 %tmp18 to i32
  %cmp20 = icmp ne i32 %conv19, 11
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.end16
  %d24 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 1
  %tmp25 = load i8* %d24, align 1
  %conv26 = sext i8 %tmp25 to i32
  %cmp27 = icmp ne i32 %conv26, 21
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end23
  call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end23
  %e31 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 2
  %tmp32 = load i8* %e31, align 1
  %conv33 = sext i8 %tmp32 to i32
  %cmp34 = icmp ne i32 %conv33, 31
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end30
  call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.end30
  %c38 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 0
  %tmp39 = load i8* %c38, align 1
  %conv40 = sext i8 %tmp39 to i32
  %cmp41 = icmp ne i32 %conv40, 12
  br i1 %cmp41, label %if.then43, label %if.end44

if.then43:                                        ; preds = %if.end37
  call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end37
  %d45 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 1
  %tmp46 = load i8* %d45, align 1
  %conv47 = sext i8 %tmp46 to i32
  %cmp48 = icmp ne i32 %conv47, 22
  br i1 %cmp48, label %if.then50, label %if.end51

if.then50:                                        ; preds = %if.end44
  call void @abort() noreturn nounwind
  unreachable

if.end51:                                         ; preds = %if.end44
  %e52 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 2
  %tmp53 = load i8* %e52, align 1
  %conv54 = sext i8 %tmp53 to i32
  %cmp55 = icmp ne i32 %conv54, 32
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end51
  call void @abort() noreturn nounwind
  unreachable

if.end58:                                         ; preds = %if.end51
  %tmp59 = load i64* %l.addr, align 8
  %cmp60 = icmp ne i64 %tmp59, 123
  br i1 %cmp60, label %if.then62, label %if.end63

if.then62:                                        ; preds = %if.end58
  call void @abort() noreturn nounwind
  unreachable

if.end63:                                         ; preds = %if.end58
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 1
  %tmp = alloca i24
  %tmp18 = alloca i24
  %tmp19 = alloca i24
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %c = getelementptr inbounds %struct.tiny* %arrayidx, i32 0, i32 0
  store i8 10, i8* %c, align 1
  %arrayidx1 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %c2 = getelementptr inbounds %struct.tiny* %arrayidx1, i32 0, i32 0
  store i8 11, i8* %c2, align 1
  %arrayidx3 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %c4 = getelementptr inbounds %struct.tiny* %arrayidx3, i32 0, i32 0
  store i8 12, i8* %c4, align 1
  %arrayidx5 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %d = getelementptr inbounds %struct.tiny* %arrayidx5, i32 0, i32 1
  store i8 20, i8* %d, align 1
  %arrayidx6 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %d7 = getelementptr inbounds %struct.tiny* %arrayidx6, i32 0, i32 1
  store i8 21, i8* %d7, align 1
  %arrayidx8 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %d9 = getelementptr inbounds %struct.tiny* %arrayidx8, i32 0, i32 1
  store i8 22, i8* %d9, align 1
  %arrayidx10 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %e = getelementptr inbounds %struct.tiny* %arrayidx10, i32 0, i32 2
  store i8 30, i8* %e, align 1
  %arrayidx11 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %e12 = getelementptr inbounds %struct.tiny* %arrayidx11, i32 0, i32 2
  store i8 31, i8* %e12, align 1
  %arrayidx13 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %e14 = getelementptr inbounds %struct.tiny* %arrayidx13, i32 0, i32 2
  store i8 32, i8* %e14, align 1
  %arrayidx15 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %arrayidx16 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx17 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %0 = bitcast i24* %tmp to %struct.tiny*
  %1 = load %struct.tiny* %arrayidx15
  store %struct.tiny %1, %struct.tiny* %0, align 1
  %2 = load i24* %tmp
  %3 = bitcast i24* %tmp18 to %struct.tiny*
  %4 = load %struct.tiny* %arrayidx16
  store %struct.tiny %4, %struct.tiny* %3, align 1
  %5 = load i24* %tmp18
  %6 = bitcast i24* %tmp19 to %struct.tiny*
  %7 = load %struct.tiny* %arrayidx17
  store %struct.tiny %7, %struct.tiny* %6, align 1
  %8 = load i24* %tmp19
  call void @f(i32 3, i24 %2, i24 %5, i24 %8, i64 123)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %9 = load i32* %retval
  ret i32 %9
}

declare void @exit(i32) noreturn nounwind
