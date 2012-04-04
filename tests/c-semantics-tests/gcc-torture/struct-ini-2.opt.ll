; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/struct-ini-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global { i8, i8, [2 x i8] } { i8 2, i8 67, [2 x i8] undef }, align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  %0 = load i32* bitcast ({ i8, i8, [2 x i8] }* @x to i32*), align 4
  %.mask = and i32 %0, 15
  %cmp = icmp eq i32 %.mask, 2
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %bf.val.sext2.mask = and i32 %0, 3840
  %cmp3 = icmp eq i32 %bf.val.sext2.mask, 768
  br i1 %cmp3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  %bf.val.sext7.mask = and i32 %0, 61440
  %cmp8 = icmp eq i32 %bf.val.sext7.mask, 16384
  br i1 %cmp8, label %if.end10, label %if.then9

if.then9:                                         ; preds = %if.end5
  tail call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end5
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
