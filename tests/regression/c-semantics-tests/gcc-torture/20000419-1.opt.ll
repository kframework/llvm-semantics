; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000419-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @brother(i32 %a, i32 %b, i32 %c) nounwind uwtable {
entry:
  %tobool = icmp eq i32 %a, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @sister(i64 %f.coerce0, i32 %f.coerce1, i32 %b, i32 %c) nounwind uwtable {
entry:
  %0 = lshr i64 %f.coerce0, 32
  %1 = trunc i64 %0 to i32
  %cmp = icmp eq i32 %1, %b
  br i1 %cmp, label %if.then.i, label %brother.exit

if.then.i:                                        ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

brother.exit:                                     ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
