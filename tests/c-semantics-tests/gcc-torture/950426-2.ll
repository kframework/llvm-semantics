; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950426-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i64, align 8
  %ca = alloca i8, align 1
  store i32 0, i32* %retval
  store i64 -2147483648, i64* %i, align 8
  store i8 1, i8* %ca, align 1
  %0 = load i64* %i, align 8
  %1 = load i8* %ca, align 1
  %conv = sext i8 %1 to i32
  %sh_prom = zext i32 %conv to i64
  %shr = ashr i64 %0, %sh_prom
  %cmp = icmp ne i64 %shr, -1073741824
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %2 = load i64* %i, align 8
  %3 = load i64* %i, align 8
  %div = sdiv i64 %3, -2000000000
  %shr2 = ashr i64 %2, %div
  %cmp3 = icmp ne i64 %shr2, -1073741824
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
