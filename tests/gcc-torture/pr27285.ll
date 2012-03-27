; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr27285.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i8, i8, i8, [16 x i8] }

@main.x = internal unnamed_addr constant %struct.S { i8 0, i8 25, i8 0, [16 x i8] c"\AA\BB\CC\DD\00\00\00\00\00\00\00\00\00\00\00\00" }, align 1

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

define void @foo(%struct.S* %x, %struct.S* %y) nounwind uwtable noinline {
entry:
  %x.addr = alloca %struct.S*, align 8
  %y.addr = alloca %struct.S*, align 8
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i8, align 1
  %d = alloca i8*, align 8
  %e = alloca i8*, align 8
  store %struct.S* %x, %struct.S** %x.addr, align 8
  store %struct.S* %y, %struct.S** %y.addr, align 8
  %tmp = load %struct.S** %x.addr, align 8
  %b1 = getelementptr inbounds %struct.S* %tmp, i32 0, i32 1
  %tmp2 = load i8* %b1, align 1
  %conv = zext i8 %tmp2 to i32
  store i32 %conv, i32* %b, align 4
  %tmp3 = load %struct.S** %x.addr, align 8
  %d4 = getelementptr inbounds %struct.S* %tmp3, i32 0, i32 3
  %arraydecay = getelementptr inbounds [16 x i8]* %d4, i32 0, i32 0
  store i8* %arraydecay, i8** %d, align 8
  %tmp5 = load %struct.S** %y.addr, align 8
  %d6 = getelementptr inbounds %struct.S* %tmp5, i32 0, i32 3
  %arraydecay7 = getelementptr inbounds [16 x i8]* %d6, i32 0, i32 0
  store i8* %arraydecay7, i8** %e, align 8
  store i32 0, i32* %a, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %tmp8 = load i32* %b, align 4
  %tobool = icmp ne i32 %tmp8, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp9 = load i32* %b, align 4
  %cmp = icmp sge i32 %tmp9, 8
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  store i8 -1, i8* %c, align 1
  %tmp11 = load i32* %b, align 4
  %sub = sub nsw i32 %tmp11, 8
  store i32 %sub, i32* %b, align 4
  br label %if.end

if.else:                                          ; preds = %while.body
  %tmp12 = load i32* %b, align 4
  %sub13 = sub nsw i32 8, %tmp12
  %shl = shl i32 255, %sub13
  %conv14 = trunc i32 %shl to i8
  store i8 %conv14, i8* %c, align 1
  store i32 0, i32* %b, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %tmp15 = load i32* %a, align 4
  %idxprom = sext i32 %tmp15 to i64
  %tmp16 = load i8** %d, align 8
  %arrayidx = getelementptr inbounds i8* %tmp16, i64 %idxprom
  %tmp17 = load i8* %arrayidx
  %conv18 = zext i8 %tmp17 to i32
  %tmp19 = load i8* %c, align 1
  %conv20 = zext i8 %tmp19 to i32
  %and = and i32 %conv18, %conv20
  %conv21 = trunc i32 %and to i8
  %tmp22 = load i32* %a, align 4
  %idxprom23 = sext i32 %tmp22 to i64
  %tmp24 = load i8** %e, align 8
  %arrayidx25 = getelementptr inbounds i8* %tmp24, i64 %idxprom23
  store i8 %conv21, i8* %arrayidx25
  %tmp26 = load i32* %a, align 4
  %inc = add nsw i32 %tmp26, 1
  store i32 %inc, i32* %a, align 4
  br label %while.cond

while.end:                                        ; preds = %while.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.S, align 1
  %y = alloca %struct.S, align 1
  store i32 0, i32* %retval
  %tmp = bitcast %struct.S* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* getelementptr inbounds (%struct.S* @main.x, i32 0, i32 0), i64 19, i32 1, i1 false)
  %tmp2 = bitcast %struct.S* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp2, i8 0, i64 19, i32 1, i1 false)
  call void @foo(%struct.S* %x, %struct.S* %y)
  %d = getelementptr inbounds %struct.S* %x, i32 0, i32 3
  %arrayidx = getelementptr inbounds [16 x i8]* %d, i32 0, i64 0
  %tmp3 = load i8* %arrayidx, align 1
  %conv = zext i8 %tmp3 to i32
  %d4 = getelementptr inbounds %struct.S* %y, i32 0, i32 3
  %arrayidx5 = getelementptr inbounds [16 x i8]* %d4, i32 0, i64 0
  %tmp6 = load i8* %arrayidx5, align 1
  %conv7 = zext i8 %tmp6 to i32
  %cmp = icmp ne i32 %conv, %conv7
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %d9 = getelementptr inbounds %struct.S* %x, i32 0, i32 3
  %arrayidx10 = getelementptr inbounds [16 x i8]* %d9, i32 0, i64 1
  %tmp11 = load i8* %arrayidx10, align 1
  %conv12 = zext i8 %tmp11 to i32
  %d13 = getelementptr inbounds %struct.S* %y, i32 0, i32 3
  %arrayidx14 = getelementptr inbounds [16 x i8]* %d13, i32 0, i64 1
  %tmp15 = load i8* %arrayidx14, align 1
  %conv16 = zext i8 %tmp15 to i32
  %cmp17 = icmp ne i32 %conv12, %conv16
  br i1 %cmp17, label %if.then, label %lor.lhs.false19

lor.lhs.false19:                                  ; preds = %lor.lhs.false
  %d20 = getelementptr inbounds %struct.S* %x, i32 0, i32 3
  %arrayidx21 = getelementptr inbounds [16 x i8]* %d20, i32 0, i64 2
  %tmp22 = load i8* %arrayidx21, align 1
  %conv23 = zext i8 %tmp22 to i32
  %d24 = getelementptr inbounds %struct.S* %y, i32 0, i32 3
  %arrayidx25 = getelementptr inbounds [16 x i8]* %d24, i32 0, i64 2
  %tmp26 = load i8* %arrayidx25, align 1
  %conv27 = zext i8 %tmp26 to i32
  %cmp28 = icmp ne i32 %conv23, %conv27
  br i1 %cmp28, label %if.then, label %lor.lhs.false30

lor.lhs.false30:                                  ; preds = %lor.lhs.false19
  %d31 = getelementptr inbounds %struct.S* %x, i32 0, i32 3
  %arrayidx32 = getelementptr inbounds [16 x i8]* %d31, i32 0, i64 3
  %tmp33 = load i8* %arrayidx32, align 1
  %conv34 = zext i8 %tmp33 to i32
  %and = and i32 %conv34, 128
  %d35 = getelementptr inbounds %struct.S* %y, i32 0, i32 3
  %arrayidx36 = getelementptr inbounds [16 x i8]* %d35, i32 0, i64 3
  %tmp37 = load i8* %arrayidx36, align 1
  %conv38 = zext i8 %tmp37 to i32
  %cmp39 = icmp ne i32 %and, %conv38
  br i1 %cmp39, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false30, %lor.lhs.false19, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false30
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
