; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/cmpsi-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f1(i32 %x, i32 %y) nounwind uwtable {
entry:
  %sub = sub i32 %x, %y
  %cmp1 = icmp sgt i32 %sub, -1
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %entry
  ret i32 %sub
}

declare void @abort() noreturn nounwind

define i32 @f2(i64 %x, i64 %y) nounwind uwtable {
entry:
  %sub = sub i64 %x, %y
  %cmp1 = icmp sgt i64 %sub, -1
  br i1 %cmp1, label %if.then2, label %if.end3

if.then2:                                         ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end3:                                          ; preds = %entry
  %conv = trunc i64 %sub to i32
  ret i32 %conv
}

define void @dummy() nounwind uwtable readnone {
entry:
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
