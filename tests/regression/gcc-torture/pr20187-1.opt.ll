; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr20187-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 257, align 4
@b = global i32 256, align 4

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

define i32 @test() nounwind uwtable readonly {
entry:
  %tmp = load i32* @a, align 4
  %tobool = icmp eq i32 %tmp, 0
  %cond = select i1 %tobool, i32 1, i32 %tmp
  %tmp3 = load i32* @b, align 4
  %mul = mul nsw i32 %tmp3, %tmp
  %and = and i32 %mul, 255
  %conv5 = and i32 %and, %cond
  %not.tobool6 = icmp eq i32 %conv5, 0
  %cond7 = zext i1 %not.tobool6 to i32
  ret i32 %cond7
}

define i32 @main() nounwind uwtable readonly {
entry:
  %tmp.i = load i32* @a, align 4
  %tobool.i = icmp eq i32 %tmp.i, 0
  %tmp3.i = load i32* @b, align 4
  %mul.i = mul nsw i32 %tmp3.i, %tmp.i
  %tmp.i.op = and i32 %tmp.i, 255
  %and.i = select i1 %tobool.i, i32 1, i32 %tmp.i.op
  %conv5.i = and i32 %and.i, %mul.i
  %not.not.tobool6.i = icmp ne i32 %conv5.i, 0
  %sub = zext i1 %not.not.tobool6.i to i32
  ret i32 %sub
}
