; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr40057.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i64 %x) nounwind uwtable readnone noinline {
entry:
  %0 = shl i64 %x, 32
  %sext = ashr i64 %0, 63
  %. = trunc i64 %sext to i32
  ret i32 %.
}

define i32 @bar(i64 %x) nounwind uwtable readnone noinline {
entry:
  %0 = shl i64 %x, 32
  %sext = ashr i64 %0, 63
  %. = trunc i64 %sext to i32
  ret i32 %.
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call i32 @foo(i64 6042589866)
  %tobool = icmp eq i32 %call, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = tail call i32 @foo(i64 6579460778)
  %tobool2 = icmp eq i32 %call1, 0
  br i1 %tobool2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = tail call i32 @bar(i64 6042589866)
  %tobool6 = icmp eq i32 %call5, 0
  br i1 %tobool6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = tail call i32 @bar(i64 6579460778)
  %tobool10 = icmp eq i32 %call9, 0
  br i1 %tobool10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  ret i32 0
}

declare void @abort() noreturn nounwind
