; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/int-compare.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gt(i32 %a, i32 %b) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i32 %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @ge(i32 %a, i32 %b) nounwind uwtable readnone {
entry:
  %cmp = icmp sge i32 %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @lt(i32 %a, i32 %b) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i32 %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define i32 @le(i32 %a, i32 %b) nounwind uwtable readnone {
entry:
  %cmp = icmp sle i32 %a, %b
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define void @true(i32 %c) nounwind uwtable {
entry:
  %tobool = icmp eq i32 %c, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define void @false(i32 %c) nounwind uwtable {
entry:
  %tobool = icmp eq i32 %c, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define void @f() nounwind uwtable {
true.exit:
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
