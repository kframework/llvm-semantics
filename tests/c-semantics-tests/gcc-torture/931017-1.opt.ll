; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931017-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@v = common global i32 0, align 4

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

define i32 @h1() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @h2(i32* %e) nounwind uwtable {
entry:
  %cmp = icmp eq i32* %e, @v
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind

define i32 @g(i8* nocapture %c) nounwind uwtable readnone {
entry:
  ret i32 0
}

define void @f() nounwind uwtable readnone {
entry:
  ret void
}
