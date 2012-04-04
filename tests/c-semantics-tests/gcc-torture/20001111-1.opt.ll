; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001111-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@next_buffer.b = internal unnamed_addr global i1 false

define i64 @foo(i32 %offset) nounwind uwtable readonly {
entry:
  %.b = load i1* @next_buffer.b, align 1
  %0 = select i1 %.b, i32 52783, i32 0
  %add = add i32 %0, %offset
  %conv5 = zext i32 %add to i64
  ret i64 %conv5
}

define void @bar() nounwind uwtable readnone {
entry:
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %.b.i = load i1* @next_buffer.b, align 1
  br i1 %.b.i, label %if.then, label %if.end4

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %entry
  store i1 true, i1* @next_buffer.b, align 1
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
