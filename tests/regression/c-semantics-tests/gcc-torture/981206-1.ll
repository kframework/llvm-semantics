; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/981206-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = internal global i16 0, align 2
@y = internal global i16 0, align 2

define void @foo() nounwind uwtable {
entry:
  store i16 837, i16* @x, align 2
  store i16 1383, i16* @y, align 2
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo()
  %0 = load i16* @x, align 2
  %conv = zext i16 %0 to i32
  %cmp = icmp ne i32 %conv, 837
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i16* @y, align 2
  %conv2 = zext i16 %1 to i32
  %cmp3 = icmp ne i32 %conv2, 1383
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
