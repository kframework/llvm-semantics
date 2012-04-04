; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/980617-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  %0 = load i32** %p.addr, align 8
  %1 = load i32* %0, align 4
  %and = and i32 %1, 255
  %conv = trunc i32 %and to i8
  %conv1 = sext i8 %conv to i32
  %cmp = icmp eq i32 %conv1, 17
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32** %p.addr, align 8
  %3 = load i32* %2, align 4
  %and3 = and i32 %3, 255
  %conv4 = trunc i32 %and3 to i8
  %conv5 = sext i8 %conv4 to i32
  %cmp6 = icmp eq i32 %conv5, 18
  br i1 %cmp6, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  ret void

if.else:                                          ; preds = %lor.lhs.false
  call void @abort() noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 196625, i32* %i, align 4
  call void @foo(i32* %i)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
