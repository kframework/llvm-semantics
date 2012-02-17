; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20051113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.Struct1 = type <{ i16, i16, i16, i64, i64 }>
%struct.Struct2 = type <{ i16, i16, i16, i64, i64, i64 }>
%struct.Struct3 = type <{ i32, [0 x %union.Union] }>
%union.Union = type { %struct.Struct2 }

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

define i64 @Sum(%struct.Struct3* %instrs) nounwind uwtable noinline {
entry:
  %instrs.addr = alloca %struct.Struct3*, align 8
  %count = alloca i64, align 8
  %i = alloca i32, align 4
  store %struct.Struct3* %instrs, %struct.Struct3** %instrs.addr, align 8
  store i64 0, i64* %count, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %tmp1 = load %struct.Struct3** %instrs.addr, align 8
  %Count = getelementptr inbounds %struct.Struct3* %tmp1, i32 0, i32 0
  %tmp2 = load i32* %Count, align 1
  %cmp = icmp slt i32 %tmp, %tmp2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i32* %i, align 4
  %idxprom = sext i32 %tmp3 to i64
  %tmp4 = load %struct.Struct3** %instrs.addr, align 8
  %List = getelementptr inbounds %struct.Struct3* %tmp4, i32 0, i32 1
  %arrayidx = getelementptr inbounds [0 x %union.Union]* %List, i32 0, i64 %idxprom
  %a = bitcast %union.Union* %arrayidx to %struct.Struct1*
  %Count5 = getelementptr inbounds %struct.Struct1* %a, i32 0, i32 3
  %tmp6 = load i64* %Count5, align 1
  %tmp7 = load i64* %count, align 8
  %add = add i64 %tmp7, %tmp6
  store i64 %add, i64* %count, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp8 = load i32* %i, align 4
  %inc = add nsw i32 %tmp8, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp9 = load i64* %count, align 8
  ret i64 %tmp9
}

define i64 @Sum2(%struct.Struct3* %instrs) nounwind uwtable noinline {
entry:
  %instrs.addr = alloca %struct.Struct3*, align 8
  %count = alloca i64, align 8
  %i = alloca i32, align 4
  store %struct.Struct3* %instrs, %struct.Struct3** %instrs.addr, align 8
  store i64 0, i64* %count, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %tmp1 = load %struct.Struct3** %instrs.addr, align 8
  %Count = getelementptr inbounds %struct.Struct3* %tmp1, i32 0, i32 0
  %tmp2 = load i32* %Count, align 1
  %cmp = icmp slt i32 %tmp, %tmp2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp3 = load i32* %i, align 4
  %idxprom = sext i32 %tmp3 to i64
  %tmp4 = load %struct.Struct3** %instrs.addr, align 8
  %List = getelementptr inbounds %struct.Struct3* %tmp4, i32 0, i32 1
  %arrayidx = getelementptr inbounds [0 x %union.Union]* %List, i32 0, i64 %idxprom
  %a = bitcast %union.Union* %arrayidx to %struct.Struct1*
  %Count2 = getelementptr inbounds %struct.Struct1* %a, i32 0, i32 4
  %tmp5 = load i64* %Count2, align 1
  %tmp6 = load i64* %count, align 8
  %add = add nsw i64 %tmp6, %tmp5
  store i64 %add, i64* %count, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp7 = load i32* %i, align 4
  %inc = add nsw i32 %tmp7, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp8 = load i64* %count, align 8
  ret i64 %tmp8
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca %struct.Struct3*, align 8
  store i32 0, i32* %retval
  %call = call noalias i8* @malloc(i64 94) nounwind
  %0 = bitcast i8* %call to %struct.Struct3*
  store %struct.Struct3* %0, %struct.Struct3** %p, align 8
  %tmp = load %struct.Struct3** %p, align 8
  %1 = bitcast %struct.Struct3* %tmp to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 94, i32 1, i1 false)
  %tmp1 = load %struct.Struct3** %p, align 8
  %Count = getelementptr inbounds %struct.Struct3* %tmp1, i32 0, i32 0
  store i32 3, i32* %Count, align 1
  %tmp2 = load %struct.Struct3** %p, align 8
  %List = getelementptr inbounds %struct.Struct3* %tmp2, i32 0, i32 1
  %arrayidx = getelementptr inbounds [0 x %union.Union]* %List, i32 0, i64 0
  %a = bitcast %union.Union* %arrayidx to %struct.Struct1*
  %Count3 = getelementptr inbounds %struct.Struct1* %a, i32 0, i32 3
  store i64 555, i64* %Count3, align 1
  %tmp4 = load %struct.Struct3** %p, align 8
  %List5 = getelementptr inbounds %struct.Struct3* %tmp4, i32 0, i32 1
  %arrayidx6 = getelementptr inbounds [0 x %union.Union]* %List5, i32 0, i64 1
  %a7 = bitcast %union.Union* %arrayidx6 to %struct.Struct1*
  %Count8 = getelementptr inbounds %struct.Struct1* %a7, i32 0, i32 3
  store i64 999, i64* %Count8, align 1
  %tmp9 = load %struct.Struct3** %p, align 8
  %List10 = getelementptr inbounds %struct.Struct3* %tmp9, i32 0, i32 1
  %arrayidx11 = getelementptr inbounds [0 x %union.Union]* %List10, i32 0, i64 2
  %a12 = bitcast %union.Union* %arrayidx11 to %struct.Struct1*
  %Count13 = getelementptr inbounds %struct.Struct1* %a12, i32 0, i32 3
  store i64 4311810305, i64* %Count13, align 1
  %tmp14 = load %struct.Struct3** %p, align 8
  %List15 = getelementptr inbounds %struct.Struct3* %tmp14, i32 0, i32 1
  %arrayidx16 = getelementptr inbounds [0 x %union.Union]* %List15, i32 0, i64 0
  %a17 = bitcast %union.Union* %arrayidx16 to %struct.Struct1*
  %Count2 = getelementptr inbounds %struct.Struct1* %a17, i32 0, i32 4
  store i64 555, i64* %Count2, align 1
  %tmp18 = load %struct.Struct3** %p, align 8
  %List19 = getelementptr inbounds %struct.Struct3* %tmp18, i32 0, i32 1
  %arrayidx20 = getelementptr inbounds [0 x %union.Union]* %List19, i32 0, i64 1
  %a21 = bitcast %union.Union* %arrayidx20 to %struct.Struct1*
  %Count222 = getelementptr inbounds %struct.Struct1* %a21, i32 0, i32 4
  store i64 999, i64* %Count222, align 1
  %tmp23 = load %struct.Struct3** %p, align 8
  %List24 = getelementptr inbounds %struct.Struct3* %tmp23, i32 0, i32 1
  %arrayidx25 = getelementptr inbounds [0 x %union.Union]* %List24, i32 0, i64 2
  %a26 = bitcast %union.Union* %arrayidx25 to %struct.Struct1*
  %Count227 = getelementptr inbounds %struct.Struct1* %a26, i32 0, i32 4
  store i64 4311810305, i64* %Count227, align 1
  %tmp28 = load %struct.Struct3** %p, align 8
  %call29 = call i64 @Sum(%struct.Struct3* %tmp28)
  %cmp = icmp ne i64 %call29, 4311811859
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp30 = load %struct.Struct3** %p, align 8
  %call31 = call i64 @Sum2(%struct.Struct3* %tmp30)
  %cmp32 = icmp ne i64 %call31, 4311811859
  br i1 %cmp32, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.end
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
