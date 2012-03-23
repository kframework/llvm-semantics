; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/950809-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.S = type { i32*, i32, i32*, [2 x i32] }

@main.sc = internal global [3 x i32] [i32 2, i32 3, i32 4], align 4

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

define void @f(%struct.S* %x) nounwind uwtable {
entry:
  %x.addr = alloca %struct.S*, align 8
  %t = alloca i32*, align 8
  %t1 = alloca i32, align 4
  %t2 = alloca i32, align 4
  %t3 = alloca i32, align 4
  %a0 = alloca i32, align 4
  %a1 = alloca i32, align 4
  store %struct.S* %x, %struct.S** %x.addr, align 8
  %tmp = load %struct.S** %x.addr, align 8
  %sc = getelementptr inbounds %struct.S* %tmp, i32 0, i32 2
  %tmp1 = load i32** %sc, align 8
  store i32* %tmp1, i32** %t, align 8
  %tmp3 = load i32** %t, align 8
  %arrayidx = getelementptr inbounds i32* %tmp3, i64 0
  %tmp4 = load i32* %arrayidx
  store i32 %tmp4, i32* %t1, align 4
  %tmp6 = load i32** %t, align 8
  %arrayidx7 = getelementptr inbounds i32* %tmp6, i64 1
  %tmp8 = load i32* %arrayidx7
  store i32 %tmp8, i32* %t2, align 4
  %tmp10 = load i32** %t, align 8
  %arrayidx11 = getelementptr inbounds i32* %tmp10, i64 2
  %tmp12 = load i32* %arrayidx11
  store i32 %tmp12, i32* %t3, align 4
  %tmp14 = load %struct.S** %x.addr, align 8
  %a = getelementptr inbounds %struct.S* %tmp14, i32 0, i32 3
  %arrayidx15 = getelementptr inbounds [2 x i32]* %a, i32 0, i64 0
  %tmp16 = load i32* %arrayidx15, align 4
  store i32 %tmp16, i32* %a0, align 4
  %tmp18 = load %struct.S** %x.addr, align 8
  %a19 = getelementptr inbounds %struct.S* %tmp18, i32 0, i32 3
  %arrayidx20 = getelementptr inbounds [2 x i32]* %a19, i32 0, i64 1
  %tmp21 = load i32* %arrayidx20, align 4
  store i32 %tmp21, i32* %a1, align 4
  %tmp22 = load i32* %t1, align 4
  %tmp23 = load i32** %t, align 8
  %arrayidx24 = getelementptr inbounds i32* %tmp23, i64 2
  store i32 %tmp22, i32* %arrayidx24
  %tmp25 = load i32* %a1, align 4
  %tmp26 = load i32** %t, align 8
  %arrayidx27 = getelementptr inbounds i32* %tmp26, i64 0
  store i32 %tmp25, i32* %arrayidx27
  %tmp28 = load i32* %a0, align 4
  %tmp29 = load %struct.S** %x.addr, align 8
  %a30 = getelementptr inbounds %struct.S* %tmp29, i32 0, i32 3
  %arrayidx31 = getelementptr inbounds [2 x i32]* %a30, i32 0, i64 1
  store i32 %tmp28, i32* %arrayidx31, align 4
  %tmp32 = load i32* %t3, align 4
  %tmp33 = load %struct.S** %x.addr, align 8
  %a34 = getelementptr inbounds %struct.S* %tmp33, i32 0, i32 3
  %arrayidx35 = getelementptr inbounds [2 x i32]* %a34, i32 0, i64 0
  store i32 %tmp32, i32* %arrayidx35, align 4
  %tmp36 = load i32* %t2, align 4
  %tmp37 = load %struct.S** %x.addr, align 8
  %fc = getelementptr inbounds %struct.S* %tmp37, i32 0, i32 1
  store i32 %tmp36, i32* %fc, align 4
  %tmp38 = load i32** %t, align 8
  %tmp39 = load %struct.S** %x.addr, align 8
  %sp = getelementptr inbounds %struct.S* %tmp39, i32 0, i32 0
  store i32* %tmp38, i32** %sp, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.S, align 8
  store i32 0, i32* %retval
  %sc = getelementptr inbounds %struct.S* %s, i32 0, i32 2
  store i32* getelementptr inbounds ([3 x i32]* @main.sc, i32 0, i32 0), i32** %sc, align 8
  %a = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %arrayidx = getelementptr inbounds [2 x i32]* %a, i32 0, i64 0
  store i32 10, i32* %arrayidx, align 4
  %a1 = getelementptr inbounds %struct.S* %s, i32 0, i32 3
  %arrayidx2 = getelementptr inbounds [2 x i32]* %a1, i32 0, i64 1
  store i32 11, i32* %arrayidx2, align 4
  call void @f(%struct.S* %s)
  %sp = getelementptr inbounds %struct.S* %s, i32 0, i32 0
  %tmp = load i32** %sp, align 8
  %arrayidx3 = getelementptr inbounds i32* %tmp, i64 2
  %tmp4 = load i32* %arrayidx3
  %cmp = icmp ne i32 %tmp4, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
