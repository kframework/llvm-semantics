; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20001108-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @signed_poly(i64 %sum, i64 %x) nounwind uwtable {
entry:
  %sum.addr = alloca i64, align 8
  %x.addr = alloca i64, align 8
  store i64 %sum, i64* %sum.addr, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %sum.addr, align 8
  %1 = load i64* %x.addr, align 8
  %mul = mul nsw i64 %0, %1
  %2 = load i64* %sum.addr, align 8
  %add = add nsw i64 %2, %mul
  store i64 %add, i64* %sum.addr, align 8
  %3 = load i64* %sum.addr, align 8
  ret i64 %3
}

define i64 @unsigned_poly(i64 %sum, i64 %x) nounwind uwtable {
entry:
  %sum.addr = alloca i64, align 8
  %x.addr = alloca i64, align 8
  store i64 %sum, i64* %sum.addr, align 8
  store i64 %x, i64* %x.addr, align 8
  %0 = load i64* %sum.addr, align 8
  %1 = load i64* %x.addr, align 8
  %mul = mul i64 %0, %1
  %2 = load i64* %sum.addr, align 8
  %add = add i64 %2, %mul
  store i64 %add, i64* %sum.addr, align 8
  %3 = load i64* %sum.addr, align 8
  ret i64 %3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @signed_poly(i64 2, i64 -3)
  %cmp = icmp ne i64 %call, -4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i64 @unsigned_poly(i64 2, i64 3)
  %cmp2 = icmp ne i64 %call1, 8
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
