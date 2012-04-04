; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/divcmp-4.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

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

define i32 @test1(i32 %x) nounwind uwtable readnone {
entry:
  %x.off = add i32 %x, 29
  %0 = icmp ult i32 %x.off, 10
  %conv = zext i1 %0 to i32
  ret i32 %conv
}

define i32 @test2(i32 %x) nounwind uwtable readnone {
entry:
  %x.off = add i32 %x, 9
  %0 = icmp ult i32 %x.off, 19
  %conv = zext i1 %0 to i32
  ret i32 %conv
}

define i32 @test3(i32 %x) nounwind uwtable readnone {
entry:
  %x.off = add i32 %x, 29
  %0 = icmp ugt i32 %x.off, 9
  %conv = zext i1 %0 to i32
  ret i32 %conv
}

define i32 @test4(i32 %x) nounwind uwtable readnone {
entry:
  %x.off = add i32 %x, 9
  %0 = icmp ugt i32 %x.off, 18
  %conv = zext i1 %0 to i32
  ret i32 %conv
}

define i32 @test5(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i32 %x, -20
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test6(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i32 %x, 9
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test7(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i32 %x, -30
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test8(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i32 %x, -10
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test9(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %x, -29
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test10(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %x, -9
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test11(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %x, -19
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test12(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %x, 10
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @main() nounwind uwtable {
if.end236:
  ret i32 0
}
