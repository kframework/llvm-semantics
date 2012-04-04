; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991216-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @test1(i32 %a, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp1 = icmp eq i64 %value, 81985529216486895
  %or.cond = and i1 %cmp, %cmp1
  %cmp3 = icmp eq i32 %after, 85
  %or.cond4 = and i1 %or.cond, %cmp3
  br i1 %or.cond4, label %if.end, label %if.then

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
  %cmp1 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp1
  %cmp3 = icmp eq i64 %value, 81985529216486895
  %or.cond6 = and i1 %or.cond, %cmp3
  %cmp5 = icmp eq i32 %after, 85
  %or.cond7 = and i1 %or.cond6, %cmp5
  br i1 %or.cond7, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @test3(i32 %a, i32 %b, i32 %c, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp1 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp1
  %cmp3 = icmp eq i32 %c, 3
  %or.cond8 = and i1 %or.cond, %cmp3
  %cmp5 = icmp eq i64 %value, 81985529216486895
  %or.cond9 = and i1 %or.cond8, %cmp5
  %cmp7 = icmp eq i32 %after, 85
  %or.cond10 = and i1 %or.cond9, %cmp7
  br i1 %or.cond10, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @test4(i32 %a, i32 %b, i32 %c, i32 %d, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp1 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp1
  %cmp3 = icmp eq i32 %c, 3
  %or.cond10 = and i1 %or.cond, %cmp3
  %cmp5 = icmp eq i32 %d, 4
  %or.cond11 = and i1 %or.cond10, %cmp5
  %cmp7 = icmp eq i64 %value, 81985529216486895
  %or.cond12 = and i1 %or.cond11, %cmp7
  %cmp9 = icmp eq i32 %after, 85
  %or.cond13 = and i1 %or.cond12, %cmp9
  br i1 %or.cond13, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @test5(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp1 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp1
  %cmp3 = icmp eq i32 %c, 3
  %or.cond12 = and i1 %or.cond, %cmp3
  %cmp5 = icmp eq i32 %d, 4
  %or.cond13 = and i1 %or.cond12, %cmp5
  %cmp7 = icmp eq i32 %e, 5
  %or.cond14 = and i1 %or.cond13, %cmp7
  %cmp9 = icmp eq i64 %value, 81985529216486895
  %or.cond15 = and i1 %or.cond14, %cmp9
  %cmp11 = icmp eq i32 %after, 85
  %or.cond16 = and i1 %or.cond15, %cmp11
  br i1 %or.cond16, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @test6(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp1 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp1
  %cmp3 = icmp eq i32 %c, 3
  %or.cond14 = and i1 %or.cond, %cmp3
  %cmp5 = icmp eq i32 %d, 4
  %or.cond15 = and i1 %or.cond14, %cmp5
  %cmp7 = icmp eq i32 %e, 5
  %or.cond16 = and i1 %or.cond15, %cmp7
  %cmp9 = icmp eq i32 %f, 6
  %or.cond17 = and i1 %or.cond16, %cmp9
  %cmp11 = icmp eq i64 %value, 81985529216486895
  %or.cond18 = and i1 %or.cond17, %cmp11
  %cmp13 = icmp eq i32 %after, 85
  %or.cond19 = and i1 %or.cond18, %cmp13
  br i1 %or.cond19, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @test7(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp1 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp1
  %cmp3 = icmp eq i32 %c, 3
  %or.cond16 = and i1 %or.cond, %cmp3
  %cmp5 = icmp eq i32 %d, 4
  %or.cond17 = and i1 %or.cond16, %cmp5
  %cmp7 = icmp eq i32 %e, 5
  %or.cond18 = and i1 %or.cond17, %cmp7
  %cmp9 = icmp eq i32 %f, 6
  %or.cond19 = and i1 %or.cond18, %cmp9
  %cmp11 = icmp eq i32 %g, 7
  %or.cond20 = and i1 %or.cond19, %cmp11
  %cmp13 = icmp eq i64 %value, 81985529216486895
  %or.cond21 = and i1 %or.cond20, %cmp13
  %cmp15 = icmp eq i32 %after, 85
  %or.cond22 = and i1 %or.cond21, %cmp15
  br i1 %or.cond22, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @test8(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, i32 %f, i32 %g, i32 %h, i64 %value, i32 %after) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  %cmp1 = icmp eq i32 %b, 2
  %or.cond = and i1 %cmp, %cmp1
  %cmp3 = icmp eq i32 %c, 3
  %or.cond18 = and i1 %or.cond, %cmp3
  %cmp5 = icmp eq i32 %d, 4
  %or.cond19 = and i1 %or.cond18, %cmp5
  %cmp7 = icmp eq i32 %e, 5
  %or.cond20 = and i1 %or.cond19, %cmp7
  %cmp9 = icmp eq i32 %f, 6
  %or.cond21 = and i1 %or.cond20, %cmp9
  %cmp11 = icmp eq i32 %g, 7
  %or.cond22 = and i1 %or.cond21, %cmp11
  %cmp13 = icmp eq i32 %h, 8
  %or.cond23 = and i1 %or.cond22, %cmp13
  %cmp15 = icmp eq i64 %value, 81985529216486895
  %or.cond24 = and i1 %or.cond23, %cmp15
  %cmp17 = icmp eq i32 %after, 85
  %or.cond25 = and i1 %or.cond24, %cmp17
  br i1 %or.cond25, label %if.end, label %if.then

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
