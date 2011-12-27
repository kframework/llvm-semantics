; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020118-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@q = common global i8* null, align 8
@n = common global i32 0, align 4

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

define void @foo() nounwind uwtable {
entry:
  %p = alloca i8*, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.cond, %entry
  %tmp = load i8** @q, align 8
  store i8* %tmp, i8** %p, align 8
  %tmp1 = load i8** %p, align 8
  %arrayidx = getelementptr inbounds i8* %tmp1, i64 2
  %tmp2 = load i8* %arrayidx
  %conv = sext i8 %tmp2 to i32
  volatile store i32 %conv, i32* @n, align 4
  %tmp3 = load i8** @q, align 8
  store i8* %tmp3, i8** %p, align 8
  %tmp4 = load i8** %p, align 8
  %arrayidx5 = getelementptr inbounds i8* %tmp4, i64 2
  %tmp6 = load i8* %arrayidx5
  %conv7 = sext i8 %tmp6 to i32
  volatile store i32 %conv7, i32* @n, align 4
  %tmp8 = load i8** @q, align 8
  store i8* %tmp8, i8** %p, align 8
  %tmp9 = load i8** %p, align 8
  %arrayidx10 = getelementptr inbounds i8* %tmp9, i64 2
  %tmp11 = load i8* %arrayidx10
  %conv12 = sext i8 %tmp11 to i32
  volatile store i32 %conv12, i32* @n, align 4
  %tmp13 = load i8** @q, align 8
  store i8* %tmp13, i8** %p, align 8
  %tmp14 = load i8** %p, align 8
  %arrayidx15 = getelementptr inbounds i8* %tmp14, i64 2
  %tmp16 = load i8* %arrayidx15
  %conv17 = sext i8 %tmp16 to i32
  volatile store i32 %conv17, i32* @n, align 4
  %tmp18 = load i8** @q, align 8
  store i8* %tmp18, i8** %p, align 8
  %tmp19 = load i8** %p, align 8
  %arrayidx20 = getelementptr inbounds i8* %tmp19, i64 2
  %tmp21 = load i8* %arrayidx20
  %conv22 = sext i8 %tmp21 to i32
  volatile store i32 %conv22, i32* @n, align 4
  %tmp23 = load i8** @q, align 8
  store i8* %tmp23, i8** %p, align 8
  %tmp24 = load i8** %p, align 8
  %arrayidx25 = getelementptr inbounds i8* %tmp24, i64 2
  %tmp26 = load i8* %arrayidx25
  %conv27 = sext i8 %tmp26 to i32
  volatile store i32 %conv27, i32* @n, align 4
  %tmp28 = load i8** @q, align 8
  store i8* %tmp28, i8** %p, align 8
  %tmp29 = load i8** %p, align 8
  %arrayidx30 = getelementptr inbounds i8* %tmp29, i64 2
  %tmp31 = load i8* %arrayidx30
  %conv32 = sext i8 %tmp31 to i32
  volatile store i32 %conv32, i32* @n, align 4
  %tmp33 = load i8** @q, align 8
  store i8* %tmp33, i8** %p, align 8
  %tmp34 = load i8** %p, align 8
  %arrayidx35 = getelementptr inbounds i8* %tmp34, i64 2
  %tmp36 = load i8* %arrayidx35
  %conv37 = sext i8 %tmp36 to i32
  volatile store i32 %conv37, i32* @n, align 4
  %tmp38 = load i8** @q, align 8
  store i8* %tmp38, i8** %p, align 8
  %tmp39 = load i8** %p, align 8
  %arrayidx40 = getelementptr inbounds i8* %tmp39, i64 2
  %tmp41 = load i8* %arrayidx40
  %conv42 = sext i8 %tmp41 to i32
  volatile store i32 %conv42, i32* @n, align 4
  %tmp43 = load i8** @q, align 8
  store i8* %tmp43, i8** %p, align 8
  %tmp44 = load i8** %p, align 8
  %arrayidx45 = getelementptr inbounds i8* %tmp44, i64 2
  %tmp46 = load i8* %arrayidx45
  %conv47 = sext i8 %tmp46 to i32
  volatile store i32 %conv47, i32* @n, align 4
  %tmp48 = load i8** @q, align 8
  store i8* %tmp48, i8** %p, align 8
  %tmp49 = load i8** %p, align 8
  %arrayidx50 = getelementptr inbounds i8* %tmp49, i64 2
  %tmp51 = load i8* %arrayidx50
  %conv52 = sext i8 %tmp51 to i32
  volatile store i32 %conv52, i32* @n, align 4
  br label %for.cond

return:                                           ; No predecessors!
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
