; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030128-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global i8 50, align 1
@y = global i16 -5, align 2

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %0 = load volatile i16* @y, align 2
  %conv = sext i16 %0 to i32
  %1 = load i8* @x, align 1
  %conv1 = zext i8 %1 to i32
  %div = sdiv i32 %conv1, %conv
  %conv2 = trunc i32 %div to i8
  store i8 %conv2, i8* @x, align 1
  %2 = load i8* @x, align 1
  %conv3 = zext i8 %2 to i32
  %cmp = icmp ne i32 %conv3, 246
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
