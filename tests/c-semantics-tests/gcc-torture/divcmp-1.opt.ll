; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/divcmp-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @test1(i32 %x) nounwind uwtable readnone {
entry:
  %x.off = add i32 %x, -20
  %0 = icmp ult i32 %x.off, 10
  %conv = zext i1 %0 to i32
  ret i32 %conv
}

define i32 @test1u(i32 %x) nounwind uwtable readnone {
entry:
  %x.off = add i32 %x, -20
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

define i32 @test2u(i32 %x) nounwind uwtable readnone {
entry:
  %0 = icmp ult i32 %x, 10
  %conv = zext i1 %0 to i32
  ret i32 %conv
}

define i32 @test3(i32 %x) nounwind uwtable readnone {
entry:
  %x.off = add i32 %x, -20
  %0 = icmp ugt i32 %x.off, 9
  %conv = zext i1 %0 to i32
  ret i32 %conv
}

define i32 @test3u(i32 %x) nounwind uwtable readnone {
entry:
  %x.off = add i32 %x, -20
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

define i32 @test4u(i32 %x) nounwind uwtable readnone {
entry:
  %0 = icmp ugt i32 %x, 9
  %conv = zext i1 %0 to i32
  ret i32 %conv
}

define i32 @test5(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %x, 20
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test5u(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp ult i32 %x, 20
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test6(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %x, -9
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test7(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %x, 30
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test7u(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp ult i32 %x, 30
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test8(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %x, 10
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test8u(i32 %x) nounwind uwtable readnone {
entry:
  %0 = icmp ult i32 %x, 10
  %conv = zext i1 %0 to i32
  ret i32 %conv
}

define i32 @test9(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i32 %x, 29
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test9u(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp ugt i32 %x, 29
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test10(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i32 %x, 9
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test10u(i32 %x) nounwind uwtable readnone {
entry:
  %0 = icmp ugt i32 %x, 9
  %conv = zext i1 %0 to i32
  ret i32 %conv
}

define i32 @test11(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i32 %x, 19
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test11u(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp ugt i32 %x, 19
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @test12(i32 %x) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i32 %x, -10
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @main() nounwind uwtable {
if.end428:
  ret i32 0
}
