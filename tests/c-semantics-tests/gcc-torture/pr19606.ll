; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr19606.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i8 -4, align 1

define i32 @foo() nounwind uwtable {
entry:
  %0 = load i8* @a, align 1
  %conv = sext i8 %0 to i32
  %conv1 = zext i32 %conv to i64
  %div = sdiv i64 %conv1, 2
  %conv2 = trunc i64 %div to i32
  ret i32 %conv2
}

define i32 @bar() nounwind uwtable {
entry:
  %0 = load i8* @a, align 1
  %conv = sext i8 %0 to i32
  %conv1 = zext i32 %conv to i64
  %rem = srem i64 %conv1, 5
  %conv2 = trunc i64 %rem to i32
  ret i32 %conv2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %r = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo()
  store i32 %call, i32* %r, align 4
  %0 = load i32* %r, align 4
  %conv = sext i32 %0 to i64
  %cmp = icmp ne i64 %conv, 2147483646
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call2 = call i32 @bar()
  store i32 %call2, i32* %r, align 4
  %1 = load i32* %r, align 4
  %conv3 = sext i32 %1 to i64
  %cmp4 = icmp ne i64 %conv3, 2
  br i1 %cmp4, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
