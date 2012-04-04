; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001031-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @t1(i32 %x) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %x, 4100
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define i32 @t2() nounwind uwtable readnone {
entry:
  ret i32 4096
}

define void @t3(i64 %x) nounwind uwtable {
entry:
  %cmp = icmp eq i64 %x, 2147487743
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define i64 @t4() nounwind uwtable readnone {
entry:
  ret i64 4096
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
