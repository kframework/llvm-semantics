; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000519-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@x = global i64 -1, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %b = alloca i64, align 8
  store i32 0, i32* %retval
  %0 = load i64* @x, align 8
  %cmp = icmp ne i64 %0, -1
  %conv = zext i1 %cmp to i32
  %conv1 = sext i32 %conv to i64
  store i64 %conv1, i64* %b, align 8
  %1 = load i64* %b, align 8
  %tobool = icmp ne i64 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
