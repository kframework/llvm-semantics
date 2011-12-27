; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20040820-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @check(i32 %a) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %a, 1
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define void @test(i32 %a, i32 %b) nounwind uwtable {
entry:
  %tobool = icmp ne i32 %a, 0
  %cond = zext i1 %tobool to i32
  %tobool2 = icmp ne i32 %b, 0
  %cond3 = select i1 %tobool2, i32 2, i32 0
  %or = or i32 %cond3, %cond
  %cmp.i = icmp eq i32 %or, 1
  br i1 %cmp.i, label %check.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

check.exit:                                       ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
