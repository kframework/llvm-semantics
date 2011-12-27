; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/991216-1.ll'
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

define void @test1(i32 %a, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp2 = icmp eq i64 %value, 81985529216486895
  %or.cond = and i1 %cmp, %cmp2
  %cmp5 = icmp eq i32 %after, 85
  %or.cond1 = and i1 %or.cond, %cmp5
  br i1 %or.cond1, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @test2(i32 %a, i32 %b, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp2 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp2
  %cmp5 = icmp eq i64 %value, 81985529216486895
  %or.cond1 = and i1 %or.cond, %cmp5
  %cmp8 = icmp eq i32 %after, 85
  %or.cond2 = and i1 %or.cond1, %cmp8
  br i1 %or.cond2, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @test3(i32 %a, i32 %b, i32 %c, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp2 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp2
  %cmp5 = icmp eq i32 %c, 3
  %or.cond1 = and i1 %or.cond, %cmp5
  %cmp8 = icmp eq i64 %value, 81985529216486895
  %or.cond2 = and i1 %or.cond1, %cmp8
  %cmp11 = icmp eq i32 %after, 85
  %or.cond3 = and i1 %or.cond2, %cmp11
  br i1 %or.cond3, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @test4(i32 %a, i32 %b, i32 %c, i32 %d, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp2 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp2
  %cmp5 = icmp eq i32 %c, 3
  %or.cond1 = and i1 %or.cond, %cmp5
  %cmp8 = icmp eq i32 %d, 4
  %or.cond2 = and i1 %or.cond1, %cmp8
  %cmp11 = icmp eq i64 %value, 81985529216486895
  %or.cond3 = and i1 %or.cond2, %cmp11
  %cmp14 = icmp eq i32 %after, 85
  %or.cond4 = and i1 %or.cond3, %cmp14
  br i1 %or.cond4, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @test5(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp2 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp2
  %cmp5 = icmp eq i32 %c, 3
  %or.cond1 = and i1 %or.cond, %cmp5
  %cmp8 = icmp eq i32 %d, 4
  %or.cond2 = and i1 %or.cond1, %cmp8
  %cmp11 = icmp eq i32 %e, 5
  %or.cond3 = and i1 %or.cond2, %cmp11
  %cmp14 = icmp eq i64 %value, 81985529216486895
  %or.cond4 = and i1 %or.cond3, %cmp14
  %cmp17 = icmp eq i32 %after, 85
  %or.cond5 = and i1 %or.cond4, %cmp17
  br i1 %or.cond5, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @test6(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp2 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp2
  %cmp5 = icmp eq i32 %c, 3
  %or.cond1 = and i1 %or.cond, %cmp5
  %cmp8 = icmp eq i32 %d, 4
  %or.cond2 = and i1 %or.cond1, %cmp8
  %cmp11 = icmp eq i32 %e, 5
  %or.cond3 = and i1 %or.cond2, %cmp11
  %cmp14 = icmp eq i32 %f, 6
  %or.cond4 = and i1 %or.cond3, %cmp14
  %cmp17 = icmp eq i64 %value, 81985529216486895
  %or.cond5 = and i1 %or.cond4, %cmp17
  %cmp20 = icmp eq i32 %after, 85
  %or.cond6 = and i1 %or.cond5, %cmp20
  br i1 %or.cond6, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @test7(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp2 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp2
  %cmp5 = icmp eq i32 %c, 3
  %or.cond1 = and i1 %or.cond, %cmp5
  %cmp8 = icmp eq i32 %d, 4
  %or.cond2 = and i1 %or.cond1, %cmp8
  %cmp11 = icmp eq i32 %e, 5
  %or.cond3 = and i1 %or.cond2, %cmp11
  %cmp14 = icmp eq i32 %f, 6
  %or.cond4 = and i1 %or.cond3, %cmp14
  %cmp17 = icmp eq i32 %g, 7
  %or.cond5 = and i1 %or.cond4, %cmp17
  %cmp20 = icmp eq i64 %value, 81985529216486895
  %or.cond6 = and i1 %or.cond5, %cmp20
  %cmp23 = icmp eq i32 %after, 85
  %or.cond7 = and i1 %or.cond6, %cmp23
  br i1 %or.cond7, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @test8(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp2 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp2
  %cmp5 = icmp eq i32 %c, 3
  %or.cond1 = and i1 %or.cond, %cmp5
  %cmp8 = icmp eq i32 %d, 4
  %or.cond2 = and i1 %or.cond1, %cmp8
  %cmp11 = icmp eq i32 %e, 5
  %or.cond3 = and i1 %or.cond2, %cmp11
  %cmp14 = icmp eq i32 %f, 6
  %or.cond4 = and i1 %or.cond3, %cmp14
  %cmp17 = icmp eq i32 %g, 7
  %or.cond5 = and i1 %or.cond4, %cmp17
  %cmp20 = icmp eq i32 %h, 8
  %or.cond6 = and i1 %or.cond5, %cmp20
  %cmp23 = icmp eq i64 %value, 81985529216486895
  %or.cond7 = and i1 %or.cond6, %cmp23
  %cmp26 = icmp eq i32 %after, 85
  %or.cond8 = and i1 %or.cond7, %cmp26
  br i1 %or.cond8, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
