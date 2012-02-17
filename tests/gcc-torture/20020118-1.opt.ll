; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020118-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@q = common global i8* null, align 8
@n = common global i32 0, align 4

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

define void @foo() noreturn nounwind uwtable {
entry:
  %tmp.pre = load i8** @q, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.cond, %entry
  %arrayidx = getelementptr inbounds i8* %tmp.pre, i64 2
  %tmp2 = load i8* %arrayidx, align 1
  %conv = sext i8 %tmp2 to i32
  volatile store i32 %conv, i32* @n, align 4
  %tmp6 = load i8* %arrayidx, align 1
  %conv7 = sext i8 %tmp6 to i32
  volatile store i32 %conv7, i32* @n, align 4
  %tmp11 = load i8* %arrayidx, align 1
  %conv12 = sext i8 %tmp11 to i32
  volatile store i32 %conv12, i32* @n, align 4
  %tmp16 = load i8* %arrayidx, align 1
  %conv17 = sext i8 %tmp16 to i32
  volatile store i32 %conv17, i32* @n, align 4
  %tmp21 = load i8* %arrayidx, align 1
  %conv22 = sext i8 %tmp21 to i32
  volatile store i32 %conv22, i32* @n, align 4
  %tmp26 = load i8* %arrayidx, align 1
  %conv27 = sext i8 %tmp26 to i32
  volatile store i32 %conv27, i32* @n, align 4
  %tmp31 = load i8* %arrayidx, align 1
  %conv32 = sext i8 %tmp31 to i32
  volatile store i32 %conv32, i32* @n, align 4
  %tmp36 = load i8* %arrayidx, align 1
  %conv37 = sext i8 %tmp36 to i32
  volatile store i32 %conv37, i32* @n, align 4
  %tmp41 = load i8* %arrayidx, align 1
  %conv42 = sext i8 %tmp41 to i32
  volatile store i32 %conv42, i32* @n, align 4
  %tmp46 = load i8* %arrayidx, align 1
  %conv47 = sext i8 %tmp46 to i32
  volatile store i32 %conv47, i32* @n, align 4
  %tmp51 = load i8* %arrayidx, align 1
  %conv52 = sext i8 %tmp51 to i32
  volatile store i32 %conv52, i32* @n, align 4
  br label %for.cond
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
