; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000523-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i64, align 8
  %n = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 9, i32* %n, align 4
  %0 = load i32* %n, align 4
  %conv = sext i32 %0 to i64
  %shl = shl i64 %conv, 55
  %div = sdiv i64 %shl, 255
  store i64 %div, i64* %x, align 8
  %1 = load i64* %x, align 8
  %cmp = icmp eq i64 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  store i64 1271604600669316, i64* %x, align 8
  %2 = load i64* %x, align 8
  %cmp2 = icmp eq i64 %2, 0
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
