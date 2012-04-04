; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/vrp-6.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @test01(i32 %a, i32 %b) nounwind uwtable {
entry:
  %cmp = icmp ult i32 %a, 5
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %cmp1 = icmp ult i32 %b, 5
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %if.end
  %sub = sub i32 %a, %b
  %cmp4 = icmp eq i32 %sub, 5
  br i1 %cmp4, label %if.end6, label %if.then5

if.then5:                                         ; preds = %if.end3
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end3
  ret void
}

declare void @abort() noreturn

define void @test02(i32 %a, i32 %b) nounwind uwtable {
entry:
  %cmp = icmp ugt i32 %a, 11
  %cmp1 = icmp ugt i32 %b, 15
  %or.cond = and i1 %cmp, %cmp1
  %sub = sub i32 %a, %b
  %cmp3 = icmp ult i32 %sub, -16
  %or.cond7 = and i1 %or.cond, %cmp3
  br i1 %or.cond7, label %if.then4, label %if.end6

if.then4:                                         ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %entry
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
