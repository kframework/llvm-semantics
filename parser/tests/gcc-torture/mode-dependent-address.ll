; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/mode-dependent-address.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.correct = internal unnamed_addr constant [96 x i32] [i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3, i32 8, i32 9, i32 10, i32 11, i32 8, i32 9, i32 10, i32 11, i32 16, i32 17, i32 18, i32 19, i32 16, i32 17, i32 18, i32 19, i32 24, i32 25, i32 26, i32 27, i32 24, i32 25, i32 26, i32 27, i32 32, i32 33, i32 34, i32 35, i32 32, i32 33, i32 34, i32 35, i32 40, i32 41, i32 42, i32 43, i32 40, i32 41, i32 42, i32 43, i32 48, i32 49, i32 50, i32 51, i32 48, i32 49, i32 50, i32 51, i32 56, i32 57, i32 58, i32 59, i32 56, i32 57, i32 58, i32 59, i32 64, i32 65, i32 66, i32 67, i32 64, i32 65, i32 66, i32 67, i32 72, i32 73, i32 74, i32 75, i32 72, i32 73, i32 74, i32 75, i32 80, i32 81, i32 82, i32 83, i32 80, i32 81, i32 82, i32 83, i32 88, i32 89, i32 90, i32 91, i32 88, i32 89, i32 90, i32 91], align 16
@arg4 = common global [96 x i8] zeroinitializer, align 16
@arg1 = common global [96 x i16] zeroinitializer, align 16
@arg2 = common global [96 x i32] zeroinitializer, align 16
@arg3 = common global [96 x i64] zeroinitializer, align 16
@result = common global [96 x i8] zeroinitializer, align 16

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

define void @f883b(i8* %result, i16* noalias %arg1, i32* noalias %arg2, i64* noalias %arg3, i8* noalias %arg4) nounwind uwtable {
entry:
  %result.addr = alloca i8*, align 8
  %arg1.addr = alloca i16*, align 8
  %arg2.addr = alloca i32*, align 8
  %arg3.addr = alloca i64*, align 8
  %arg4.addr = alloca i8*, align 8
  %idx = alloca i32, align 4
  store i8* %result, i8** %result.addr, align 8
  store i16* %arg1, i16** %arg1.addr, align 8
  store i32* %arg2, i32** %arg2.addr, align 8
  store i64* %arg3, i64** %arg3.addr, align 8
  store i8* %arg4, i8** %arg4.addr, align 8
  store i32 0, i32* %idx, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %idx, align 4
  %cmp = icmp slt i32 %tmp, 96
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp1 = load i32* %idx, align 4
  %idxprom = sext i32 %tmp1 to i64
  %tmp2 = load i16** %arg1.addr, align 8
  %arrayidx = getelementptr inbounds i16* %tmp2, i64 %idxprom
  %tmp3 = load i16* %arrayidx
  %conv = sext i16 %tmp3 to i32
  %cmp4 = icmp slt i32 1, %conv
  br i1 %cmp4, label %cond.true, label %cond.false

cond.true:                                        ; preds = %for.body
  br label %cond.end

cond.false:                                       ; preds = %for.body
  %tmp6 = load i32* %idx, align 4
  %idxprom7 = sext i32 %tmp6 to i64
  %tmp8 = load i16** %arg1.addr, align 8
  %arrayidx9 = getelementptr inbounds i16* %tmp8, i64 %idxprom7
  %tmp10 = load i16* %arrayidx9
  %conv11 = sext i16 %tmp10 to i32
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ 1, %cond.true ], [ %conv11, %cond.false ]
  %tmp12 = load i32* %idx, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %tmp14 = load i32** %arg2.addr, align 8
  %arrayidx15 = getelementptr inbounds i32* %tmp14, i64 %idxprom13
  %tmp16 = load i32* %arrayidx15
  %and = and i32 %tmp16, 31
  %shr = ashr i32 %cond, %and
  %xor = xor i32 %shr, 1
  %sub = sub nsw i32 %xor, -32
  %shr17 = ashr i32 %sub, 7
  %or = or i32 %shr17, -5
  %conv18 = sext i32 %or to i64
  %tmp19 = load i32* %idx, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %tmp21 = load i64** %arg3.addr, align 8
  %arrayidx22 = getelementptr inbounds i64* %tmp21, i64 %idxprom20
  %tmp23 = load i64* %arrayidx22
  %and24 = and i64 %conv18, %tmp23
  %conv25 = trunc i64 %and24 to i8
  %tmp26 = load i32* %idx, align 4
  %idxprom27 = sext i32 %tmp26 to i64
  %tmp28 = load i8** %result.addr, align 8
  %arrayidx29 = getelementptr inbounds i8* %tmp28, i64 %idxprom27
  store i8 %conv25, i8* %arrayidx29
  br label %for.inc

for.inc:                                          ; preds = %cond.end
  %tmp30 = load i32* %idx, align 4
  %add = add nsw i32 %tmp30, 1
  store i32 %add, i32* %idx, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %correct = alloca [96 x i32], align 16
  store i32 0, i32* %retval
  %tmp = bitcast [96 x i32]* %correct to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([96 x i32]* @main.correct to i8*), i64 384, i32 16, i1 false)
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp1 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp1, 96
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %conv = trunc i32 %tmp2 to i8
  %tmp3 = load i32* %i, align 4
  %idxprom = sext i32 %tmp3 to i64
  %arrayidx = getelementptr inbounds [96 x i8]* @arg4, i32 0, i64 %idxprom
  store i8 %conv, i8* %arrayidx, align 1
  %conv4 = zext i8 %conv to i16
  %tmp5 = load i32* %i, align 4
  %idxprom6 = sext i32 %tmp5 to i64
  %arrayidx7 = getelementptr inbounds [96 x i16]* @arg1, i32 0, i64 %idxprom6
  store i16 %conv4, i16* %arrayidx7, align 2
  %conv8 = sext i16 %conv4 to i32
  %tmp9 = load i32* %i, align 4
  %idxprom10 = sext i32 %tmp9 to i64
  %arrayidx11 = getelementptr inbounds [96 x i32]* @arg2, i32 0, i64 %idxprom10
  store i32 %conv8, i32* %arrayidx11, align 4
  %conv12 = zext i32 %conv8 to i64
  %tmp13 = load i32* %i, align 4
  %idxprom14 = sext i32 %tmp13 to i64
  %arrayidx15 = getelementptr inbounds [96 x i64]* @arg3, i32 0, i64 %idxprom14
  store i64 %conv12, i64* %arrayidx15, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp16 = load i32* %i, align 4
  %inc = add nsw i32 %tmp16, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @f883b(i8* getelementptr inbounds ([96 x i8]* @result, i32 0, i32 0), i16* getelementptr inbounds ([96 x i16]* @arg1, i32 0, i32 0), i32* getelementptr inbounds ([96 x i32]* @arg2, i32 0, i32 0), i64* getelementptr inbounds ([96 x i64]* @arg3, i32 0, i32 0), i8* getelementptr inbounds ([96 x i8]* @arg4, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond17

for.cond17:                                       ; preds = %for.inc33, %for.end
  %tmp18 = load i32* %i, align 4
  %cmp19 = icmp slt i32 %tmp18, 96
  br i1 %cmp19, label %for.body21, label %for.end36

for.body21:                                       ; preds = %for.cond17
  %tmp22 = load i32* %i, align 4
  %idxprom23 = sext i32 %tmp22 to i64
  %arrayidx24 = getelementptr inbounds [96 x i8]* @result, i32 0, i64 %idxprom23
  %tmp25 = load i8* %arrayidx24, align 1
  %conv26 = sext i8 %tmp25 to i32
  %tmp27 = load i32* %i, align 4
  %idxprom28 = sext i32 %tmp27 to i64
  %arrayidx29 = getelementptr inbounds [96 x i32]* %correct, i32 0, i64 %idxprom28
  %tmp30 = load i32* %arrayidx29, align 4
  %cmp31 = icmp ne i32 %conv26, %tmp30
  br i1 %cmp31, label %if.then, label %if.end

if.then:                                          ; preds = %for.body21
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body21
  br label %for.inc33

for.inc33:                                        ; preds = %if.end
  %tmp34 = load i32* %i, align 4
  %inc35 = add nsw i32 %tmp34, 1
  store i32 %inc35, i32* %i, align 4
  br label %for.cond17

for.end36:                                        ; preds = %for.cond17
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
