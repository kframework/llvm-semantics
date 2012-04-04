; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42721.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = internal global i32 0, align 4
@b = internal global i32 0, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 1, i64* %c, align 8
  %0 = load i64* %c, align 8
  %tobool = icmp ne i64 %0, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %entry
  %1 = load i32* @a, align 4
  %conv = sext i32 %1 to i64
  %call = call i64 @foo(i64 %conv, i64 -1)
  %cmp = icmp ne i64 %call, 1
  br label %land.end

land.end:                                         ; preds = %land.rhs, %entry
  %2 = phi i1 [ false, %entry ], [ %cmp, %land.rhs ]
  %land.ext = zext i1 %2 to i32
  %3 = load i32* @b, align 4
  %xor = xor i32 %3, %land.ext
  store i32 %xor, i32* @b, align 4
  %4 = load i32* @b, align 4
  %cmp2 = icmp ne i32 %4, 1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %land.end
  ret i32 0
}

define internal i64 @foo(i64 %x, i64 %y) nounwind uwtable {
entry:
  %x.addr = alloca i64, align 8
  %y.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  store i64 %y, i64* %y.addr, align 8
  %0 = load i64* %x.addr, align 8
  %1 = load i64* %y.addr, align 8
  %div = udiv i64 %0, %1
  ret i64 %div
}

declare void @abort() noreturn nounwind
