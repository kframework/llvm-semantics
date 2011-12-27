; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/931004-13.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiny = type { i8, i8, i8, i8 }

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

define void @f(i32 %n, i32 %x.coerce, i32 %y.coerce, i32 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca %struct.tiny, align 4
  %y = alloca %struct.tiny, align 4
  %z = alloca %struct.tiny, align 4
  %l.addr = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  %0 = bitcast %struct.tiny* %x to i32*
  store i32 %x.coerce, i32* %0
  %1 = bitcast %struct.tiny* %y to i32*
  store i32 %y.coerce, i32* %1
  %2 = bitcast %struct.tiny* %z to i32*
  store i32 %z.coerce, i32* %2
  store i64 %l, i64* %l.addr, align 8
  %c = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %tmp = load i8* %c, align 1
  %conv = sext i8 %tmp to i32
  %cmp = icmp ne i32 %conv, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %d = getelementptr inbounds %struct.tiny* %x, i32 0, i32 1
  %tmp2 = load i8* %d, align 1
  %conv3 = sext i8 %tmp2 to i32
  %cmp4 = icmp ne i32 %conv3, 20
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  %e = getelementptr inbounds %struct.tiny* %x, i32 0, i32 2
  %tmp8 = load i8* %e, align 1
  %conv9 = sext i8 %tmp8 to i32
  %cmp10 = icmp ne i32 %conv9, 30
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end7
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end7
  %f = getelementptr inbounds %struct.tiny* %x, i32 0, i32 3
  %tmp14 = load i8* %f, align 1
  %conv15 = sext i8 %tmp14 to i32
  %cmp16 = icmp ne i32 %conv15, 40
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end13
  %c20 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 0
  %tmp21 = load i8* %c20, align 1
  %conv22 = sext i8 %tmp21 to i32
  %cmp23 = icmp ne i32 %conv22, 11
  br i1 %cmp23, label %if.then25, label %if.end26

if.then25:                                        ; preds = %if.end19
  call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end19
  %d27 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 1
  %tmp28 = load i8* %d27, align 1
  %conv29 = sext i8 %tmp28 to i32
  %cmp30 = icmp ne i32 %conv29, 21
  br i1 %cmp30, label %if.then32, label %if.end33

if.then32:                                        ; preds = %if.end26
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %if.end26
  %e34 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 2
  %tmp35 = load i8* %e34, align 1
  %conv36 = sext i8 %tmp35 to i32
  %cmp37 = icmp ne i32 %conv36, 31
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end33
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end33
  %f41 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 3
  %tmp42 = load i8* %f41, align 1
  %conv43 = sext i8 %tmp42 to i32
  %cmp44 = icmp ne i32 %conv43, 41
  br i1 %cmp44, label %if.then46, label %if.end47

if.then46:                                        ; preds = %if.end40
  call void @abort() noreturn nounwind
  unreachable

if.end47:                                         ; preds = %if.end40
  %c48 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 0
  %tmp49 = load i8* %c48, align 1
  %conv50 = sext i8 %tmp49 to i32
  %cmp51 = icmp ne i32 %conv50, 12
  br i1 %cmp51, label %if.then53, label %if.end54

if.then53:                                        ; preds = %if.end47
  call void @abort() noreturn nounwind
  unreachable

if.end54:                                         ; preds = %if.end47
  %d55 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 1
  %tmp56 = load i8* %d55, align 1
  %conv57 = sext i8 %tmp56 to i32
  %cmp58 = icmp ne i32 %conv57, 22
  br i1 %cmp58, label %if.then60, label %if.end61

if.then60:                                        ; preds = %if.end54
  call void @abort() noreturn nounwind
  unreachable

if.end61:                                         ; preds = %if.end54
  %e62 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 2
  %tmp63 = load i8* %e62, align 1
  %conv64 = sext i8 %tmp63 to i32
  %cmp65 = icmp ne i32 %conv64, 32
  br i1 %cmp65, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end61
  call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end61
  %f69 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 3
  %tmp70 = load i8* %f69, align 1
  %conv71 = sext i8 %tmp70 to i32
  %cmp72 = icmp ne i32 %conv71, 42
  br i1 %cmp72, label %if.then74, label %if.end75

if.then74:                                        ; preds = %if.end68
  call void @abort() noreturn nounwind
  unreachable

if.end75:                                         ; preds = %if.end68
  %tmp76 = load i64* %l.addr, align 8
  %cmp77 = icmp ne i64 %tmp76, 123
  br i1 %cmp77, label %if.then79, label %if.end80

if.then79:                                        ; preds = %if.end75
  call void @abort() noreturn nounwind
  unreachable

if.end80:                                         ; preds = %if.end75
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 1
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
  %f = getelementptr inbounds %struct.tiny* %arrayidx15, i32 0, i32 3
  store i8 40, i8* %f, align 1
  %arrayidx16 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %f17 = getelementptr inbounds %struct.tiny* %arrayidx16, i32 0, i32 3
  store i8 41, i8* %f17, align 1
  %arrayidx18 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %f19 = getelementptr inbounds %struct.tiny* %arrayidx18, i32 0, i32 3
  store i8 42, i8* %f19, align 1
  %arrayidx20 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %arrayidx21 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx22 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %0 = bitcast %struct.tiny* %arrayidx20 to i32*
  %1 = load i32* %0, align 1
  %2 = bitcast %struct.tiny* %arrayidx21 to i32*
  %3 = load i32* %2, align 1
  %4 = bitcast %struct.tiny* %arrayidx22 to i32*
  %5 = load i32* %4, align 1
  call void @f(i32 3, i32 %1, i32 %3, i32 %5, i64 123)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @exit(i32) noreturn nounwind
