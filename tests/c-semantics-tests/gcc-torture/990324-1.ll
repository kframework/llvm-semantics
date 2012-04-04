; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990324-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @f(i64 %i) nounwind uwtable {
entry:
  %i.addr = alloca i64, align 8
  store i64 %i, i64* %i.addr, align 8
  %0 = load i64* %i.addr, align 8
  %conv = trunc i64 %0 to i8
  %conv1 = sext i8 %conv to i32
  %cmp = icmp slt i32 %conv1, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i64* %i.addr, align 8
  %conv3 = trunc i64 %1 to i8
  %conv4 = sext i8 %conv3 to i32
  %cmp5 = icmp eq i32 %conv4, 0
  br i1 %cmp5, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  call void @f(i64 4294967041)
  ret i32 0
}
