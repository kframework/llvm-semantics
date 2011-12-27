; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20080424-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@bar.i = internal unnamed_addr global i32 0, align 4
@g = common global [48 x [3 x [3 x i32]]] zeroinitializer, align 16

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @bar([3 x i32]* %x, [3 x i32]* %y) nounwind uwtable noinline {
entry:
  %tmp1 = load i32* @bar.i, align 4
  %add = add nsw i32 %tmp1, 8
  %idxprom = sext i32 %add to i64
  %arraydecay = getelementptr inbounds [48 x [3 x [3 x i32]]]* @g, i64 0, i64 %idxprom, i64 0
  %cmp = icmp eq [3 x i32]* %arraydecay, %x
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* @bar.i, align 4
  %idxprom4 = sext i32 %tmp1 to i64
  %arraydecay6 = getelementptr inbounds [48 x [3 x [3 x i32]]]* @g, i64 0, i64 %idxprom4, i64 0
  %cmp7 = icmp eq [3 x i32]* %arraydecay6, %y
  br i1 %cmp7, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
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
  %0 = bitcast [3 x [3 x i32]]** %x.addr.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  %1 = bitcast i32* %i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %1) nounwind
  %2 = bitcast i32* %k.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %2) nounwind
  store [3 x [3 x i32]]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 0), [3 x [3 x i32]]** %x.addr.i, align 8
  call void @bar([3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 8, i64 0, i64 0) to [3 x i32]*), [3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 0, i64 0)) nounwind
  call void @bar([3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 9, i64 0, i64 0) to [3 x i32]*), [3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 1, i64 0, i64 0) to [3 x i32]*)) nounwind
  call void @bar([3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 10, i64 0, i64 0) to [3 x i32]*), [3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 2, i64 0, i64 0) to [3 x i32]*)) nounwind
  call void @bar([3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 11, i64 0, i64 0) to [3 x i32]*), [3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 3, i64 0, i64 0) to [3 x i32]*)) nounwind
  call void @bar([3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 12, i64 0, i64 0) to [3 x i32]*), [3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 4, i64 0, i64 0) to [3 x i32]*)) nounwind
  call void @bar([3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 13, i64 0, i64 0) to [3 x i32]*), [3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 5, i64 0, i64 0) to [3 x i32]*)) nounwind
  call void @bar([3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 14, i64 0, i64 0) to [3 x i32]*), [3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 6, i64 0, i64 0) to [3 x i32]*)) nounwind
  call void @bar([3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 15, i64 0, i64 0) to [3 x i32]*), [3 x i32]* bitcast (i32* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 7, i64 0, i64 0) to [3 x i32]*)) nounwind
  store i32 8, i32* %i.i, align 4
  store i32 15, i32* %k.i, align 4
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %1) nounwind
  call void @llvm.lifetime.end(i64 -1, i8* %2) nounwind
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
