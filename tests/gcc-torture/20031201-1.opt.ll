; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20031201-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.io = type { %struct.s1, %struct.s1 }
%struct.s1 = type { [2 x i8], [2 x i8] }

@i = internal unnamed_addr global %struct.io* null, align 8
@f0.washere = internal unnamed_addr global i32 0, align 4

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

define i32 @f1(i8* %port) noreturn nounwind uwtable noinline {
entry:
  %0 = bitcast i8* %port to %struct.io*
  store %struct.io* %0, %struct.io** @i, align 8
  %1 = bitcast i8* %port to i32*
  store i32 32, i32* %1, align 4
  %tmp7 = load %struct.io** @i, align 8
  %tmp8 = getelementptr inbounds %struct.io* %tmp7, i64 0, i32 1, i32 0, i64 0
  %2 = bitcast i8* %tmp8 to i32*
  store i32 32, i32* %2, align 4
  tail call void @f0()
  %tmp11 = load %struct.io** @i, align 8
  %3 = bitcast %struct.io* %tmp11 to i32*
  store i32 8, i32* %3, align 4
  %tmp15 = load %struct.io** @i, align 8
  %tmp17 = getelementptr inbounds %struct.io* %tmp15, i64 0, i32 1, i32 0, i64 0
  %4 = bitcast i8* %tmp17 to i32*
  store i32 8, i32* %4, align 4
  tail call void @test()
  unreachable
}

define void @f0() nounwind uwtable noinline {
entry:
  %tmp = load %struct.io** @i, align 8
  %tmp1 = load i32* @f0.washere, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* @f0.washere, align 4
  %tobool = icmp eq i32 %tmp1, 0
  br i1 %tobool, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %0 = bitcast %struct.io* %tmp to i32*
  %1 = load i32* %0, align 4
  %bf.clear = and i32 %1, 65535
  %cmp = icmp eq i32 %bf.clear, 32
  br i1 %cmp, label %lor.lhs.false3, label %if.then

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %i16 = getelementptr inbounds %struct.io* %tmp, i64 0, i32 1
  %2 = bitcast %struct.s1* %i16 to i32*
  %3 = load i32* %2, align 4
  %bf.clear5 = and i32 %3, 65535
  %cmp6 = icmp eq i32 %bf.clear5, 32
  br i1 %cmp6, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false3, %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false3
  ret void
}

define void @test() noreturn nounwind uwtable noinline {
entry:
  %tmp = load %struct.io** @i, align 8
  %0 = bitcast %struct.io* %tmp to i32*
  %1 = load i32* %0, align 4
  %bf.clear = and i32 %1, 65535
  %cmp = icmp eq i32 %bf.clear, 8
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %i16 = getelementptr inbounds %struct.io* %tmp, i64 0, i32 1
  %2 = bitcast %struct.s1* %i16 to i32*
  %3 = load i32* %2, align 4
  %bf.clear3 = and i32 %3, 65535
  %cmp4 = icmp eq i32 %bf.clear3, 8
  br i1 %cmp4, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %io01 = alloca [8 x i8], align 4
  %io01.sub = getelementptr inbounds [8 x i8]* %io01, i64 0, i64 0
  %call = call i32 @f1(i8* %io01.sub)
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
