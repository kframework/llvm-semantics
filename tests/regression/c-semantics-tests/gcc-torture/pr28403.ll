; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr28403.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@global = common global i32 0, align 4

define i32 @foo(i32 %x1, i32 %x2, i32 %x3, i32 %x4, i32 %x5, i32 %x6, i32 %x7, i32 %x8) nounwind uwtable noinline {
entry:
  %x1.addr = alloca i32, align 4
  %x2.addr = alloca i32, align 4
  %x3.addr = alloca i32, align 4
  %x4.addr = alloca i32, align 4
  %x5.addr = alloca i32, align 4
  %x6.addr = alloca i32, align 4
  %x7.addr = alloca i32, align 4
  %x8.addr = alloca i32, align 4
  store i32 %x1, i32* %x1.addr, align 4
  store i32 %x2, i32* %x2.addr, align 4
  store i32 %x3, i32* %x3.addr, align 4
  store i32 %x4, i32* %x4.addr, align 4
  store i32 %x5, i32* %x5.addr, align 4
  store i32 %x6, i32* %x6.addr, align 4
  store i32 %x7, i32* %x7.addr, align 4
  store i32 %x8, i32* %x8.addr, align 4
  %0 = load i32* %x1.addr, align 4
  %1 = load i32* %x2.addr, align 4
  %add = add nsw i32 %0, %1
  %2 = load i32* %x3.addr, align 4
  %add1 = add nsw i32 %add, %2
  %3 = load i32* %x4.addr, align 4
  %add2 = add nsw i32 %add1, %3
  %4 = load i32* %x5.addr, align 4
  %add3 = add nsw i32 %add2, %4
  %5 = load i32* %x6.addr, align 4
  %add4 = add nsw i32 %add3, %5
  %6 = load i32* %x7.addr, align 4
  %add5 = add nsw i32 %add4, %6
  %7 = load i32* %x8.addr, align 4
  %add6 = add nsw i32 %add5, %7
  store i32 %add6, i32* @global, align 4
  ret i32 0
}

define i64 @bar(i64 %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i64, align 8
  store i64 %x, i64* %x.addr, align 8
  %call = call i32 @foo(i32 1, i32 2, i32 1, i32 3, i32 1, i32 4, i32 1, i32 5)
  %0 = load i64* %x.addr, align 8
  %1 = load i32* @global, align 4
  %sh_prom = zext i32 %1 to i64
  %shr = lshr i64 %0, %sh_prom
  ret i64 %shr
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i64 @bar(i64 81985529216486895)
  %cmp = icmp ne i64 %call, 312749974122
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
