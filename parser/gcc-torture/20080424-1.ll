; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20080424-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@bar.i = internal global i32 0, align 4
@g = common global [48 x [3 x [3 x i32]]] zeroinitializer, align 16

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

define void @bar([3 x i32]* %x, [3 x i32]* %y) nounwind uwtable noinline {
entry:
  %x.addr = alloca [3 x i32]*, align 8
  %y.addr = alloca [3 x i32]*, align 8
  store [3 x i32]* %x, [3 x i32]** %x.addr, align 8
  store [3 x i32]* %y, [3 x i32]** %y.addr, align 8
  %tmp = load [3 x i32]** %x.addr, align 8
  %tmp1 = load i32* @bar.i, align 4
  %add = add nsw i32 %tmp1, 8
  %idxprom = sext i32 %add to i64
  %arrayidx = getelementptr inbounds [48 x [3 x [3 x i32]]]* @g, i32 0, i64 %idxprom
  %arraydecay = getelementptr inbounds [3 x [3 x i32]]* %arrayidx, i32 0, i32 0
  %cmp = icmp ne [3 x i32]* %tmp, %arraydecay
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %tmp2 = load [3 x i32]** %y.addr, align 8
  %tmp3 = load i32* @bar.i, align 4
  %inc = add nsw i32 %tmp3, 1
  store i32 %inc, i32* @bar.i, align 4
  %idxprom4 = sext i32 %tmp3 to i64
  %arrayidx5 = getelementptr inbounds [48 x [3 x [3 x i32]]]* @g, i32 0, i64 %idxprom4
  %arraydecay6 = getelementptr inbounds [3 x [3 x i32]]* %arrayidx5, i32 0, i32 0
  %cmp7 = icmp ne [3 x i32]* %tmp2, %arraydecay6
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %x.addr.i = alloca [3 x [3 x i32]]*, align 8
  %i.i = alloca i32, align 4
  %k.i = alloca i32, align 4
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = bitcast [3 x [3 x i32]]** %x.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %1 = bitcast i32* %i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  %2 = bitcast i32* %k.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %2) nounwind
  store [3 x [3 x i32]]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i32 0, i32 0), [3 x [3 x i32]]** %x.addr.i, align 8
  store i32 0, i32* %i.i, align 4
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.body.i, %entry
  %tmp.i = load i32* %i.i, align 4
  %cmp.i = icmp slt i32 %tmp.i, 8
  br i1 %cmp.i, label %for.body.i, label %foo.exit

for.body.i:                                       ; preds = %for.cond.i
  %tmp2.i = load i32* %i.i, align 4
  %add.i = add nsw i32 %tmp2.i, 8
  store i32 %add.i, i32* %k.i, align 4
  %tmp3.i = load i32* %k.i, align 4
  %idxprom.i = sext i32 %tmp3.i to i64
  %tmp4.i = load [3 x [3 x i32]]** %x.addr.i, align 8
  %arrayidx.i = getelementptr inbounds [3 x [3 x i32]]* %tmp4.i, i64 %idxprom.i
  %arraydecay.i = getelementptr inbounds [3 x [3 x i32]]* %arrayidx.i, i32 0, i32 0
  %tmp5.i = load i32* %k.i, align 4
  %sub.i = sub nsw i32 %tmp5.i, 8
  %idxprom6.i = sext i32 %sub.i to i64
  %tmp7.i = load [3 x [3 x i32]]** %x.addr.i, align 8
  %arrayidx8.i = getelementptr inbounds [3 x [3 x i32]]* %tmp7.i, i64 %idxprom6.i
  %arraydecay9.i = getelementptr inbounds [3 x [3 x i32]]* %arrayidx8.i, i32 0, i32 0
  call void @bar([3 x i32]* %arraydecay.i, [3 x i32]* %arraydecay9.i) nounwind
  %tmp10.i = load i32* %i.i, align 4
  %inc.i = add nsw i32 %tmp10.i, 1
  store i32 %inc.i, i32* %i.i, align 4
  br label %for.cond.i

foo.exit:                                         ; preds = %for.cond.i
  %3 = bitcast [3 x [3 x i32]]** %x.addr.i to i8*
  call void @llvm.lifetime.end(i64 -1, i8* %3) nounwind
  %4 = bitcast i32* %i.i to i8*
  call void @llvm.lifetime.end(i64 -1, i8* %4) nounwind
  %5 = bitcast i32* %k.i to i8*
  call void @llvm.lifetime.end(i64 -1, i8* %5) nounwind
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
