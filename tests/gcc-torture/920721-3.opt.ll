; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/920721-3.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define void @ru(i32 %i) nounwind uwtable {
entry:
  %conv.i = and i32 %i, 65535
  %cmp = icmp eq i32 %conv.i, 5
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %inc3 = add i32 %i, 2
  %conv.i1 = and i32 %inc3, 65535
  %cmp6 = icmp eq i32 %conv.i1, 7
  br i1 %cmp6, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end
  ret void
}

declare void @abort() noreturn

define void @rs(i32 %i) nounwind uwtable {
entry:
  %sext.mask = and i32 %i, 65535
  %cmp = icmp eq i32 %sext.mask, 5
  br i1 %cmp, label %if.end9, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %entry
  ret void
}

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
