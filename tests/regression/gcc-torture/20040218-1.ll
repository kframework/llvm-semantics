; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20040218-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.y = internal unnamed_addr constant [2 x i64] [i64 -1, i64 16000], align 16
@main.yw = internal unnamed_addr constant [2 x i16] [i16 -1, i16 16000], align 2

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

define i64 @xb(i64* %y) nounwind uwtable noinline {
entry:
  %y.addr = alloca i64*, align 8
  %xx = alloca i64, align 8
  store i64* %y, i64** %y.addr, align 8
  %tmp = load i64** %y.addr, align 8
  %tmp1 = load i64* %tmp
  %and = and i64 %tmp1, 255
  store i64 %and, i64* %xx, align 8
  %tmp2 = load i64* %xx, align 8
  %tmp3 = load i64** %y.addr, align 8
  %arrayidx = getelementptr inbounds i64* %tmp3, i64 1
  %tmp4 = load i64* %arrayidx
  %add = add nsw i64 %tmp2, %tmp4
  ret i64 %add
}

define i64 @xw(i64* %y) nounwind uwtable noinline {
entry:
  %y.addr = alloca i64*, align 8
  %xx = alloca i64, align 8
  store i64* %y, i64** %y.addr, align 8
  %tmp = load i64** %y.addr, align 8
  %tmp1 = load i64* %tmp
  %and = and i64 %tmp1, 65535
  store i64 %and, i64* %xx, align 8
  %tmp2 = load i64* %xx, align 8
  %tmp3 = load i64** %y.addr, align 8
  %arrayidx = getelementptr inbounds i64* %tmp3, i64 1
  %tmp4 = load i64* %arrayidx
  %add = add nsw i64 %tmp2, %tmp4
  ret i64 %add
}

define signext i16 @yb(i16* %y) nounwind uwtable noinline {
entry:
  %y.addr = alloca i16*, align 8
  %xx = alloca i16, align 2
  store i16* %y, i16** %y.addr, align 8
  %tmp = load i16** %y.addr, align 8
  %tmp1 = load i16* %tmp
  %conv = sext i16 %tmp1 to i32
  %and = and i32 %conv, 255
  %conv2 = trunc i32 %and to i16
  store i16 %conv2, i16* %xx, align 2
  %tmp3 = load i16* %xx, align 2
  %conv4 = sext i16 %tmp3 to i32
  %tmp5 = load i16** %y.addr, align 8
  %arrayidx = getelementptr inbounds i16* %tmp5, i64 1
  %tmp6 = load i16* %arrayidx
  %conv7 = sext i16 %tmp6 to i32
  %add = add nsw i32 %conv4, %conv7
  %conv8 = trunc i32 %add to i16
  ret i16 %conv8
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %y = alloca [2 x i64], align 16
  %yw = alloca [2 x i16], align 2
  store i32 0, i32* %retval
  %tmp = bitcast [2 x i64]* %y to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([2 x i64]* @main.y to i8*), i64 16, i32 16, i1 false)
  %tmp2 = bitcast [2 x i16]* %yw to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* bitcast ([2 x i16]* @main.yw to i8*), i64 4, i32 2, i1 false)
  %arraydecay = getelementptr inbounds [2 x i64]* %y, i32 0, i32 0
  %call = call i64 @xb(i64* %arraydecay)
  %cmp = icmp ne i64 %call, 16255
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %arraydecay3 = getelementptr inbounds [2 x i64]* %y, i32 0, i32 0
  %call4 = call i64 @xw(i64* %arraydecay3)
  %cmp5 = icmp ne i64 %call4, 81535
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %arraydecay7 = getelementptr inbounds [2 x i16]* %yw, i32 0, i32 0
  %call8 = call signext i16 @yb(i16* %arraydecay7)
  %conv = sext i16 %call8 to i32
  %cmp9 = icmp ne i32 %conv, 16255
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false6
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
